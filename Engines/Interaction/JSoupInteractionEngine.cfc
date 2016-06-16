component implements="Integrated.Engines.Interaction.Contracts.InteractionEngine" {
    
    // The struct of form input values
    property name='inputs' type='struct' default='{}';

    public InteractionEngine function init(
        DOMAssertionEngine engine = new Integrated.Engines.Assertion.JSoupAssertionEngine()
    ) {
        variables.domEngine = arguments.engine;
        variables.inputs = {};

        return this;
    }

    /**
    * Sets the DOMAssertionEngine as a collaborator.
    * This can also be passed in as a constructor argument.
    *
    * @engine Integrated.Engines.Assertion.Contracts.DOMAssertionEngine
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function setDOMAssertionEngine(required DOMAssertionEngine engine) {
        variables.domEngine = arguments.engine;

        return this;
    }

    /**
    * Types a value in to a form field.
    *
    * @text The value to type in the form field.
    * @element The element selector or name to type the value in to.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function type(required string text, required string element) {
        return storeInput(arguments.element, arguments.text);
    }

    /**
    * Checks a checkbox.
    *
    * @element The selector or name of the checkbox to check.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function check(required string element) {
        return storeInput(arguments.element, true);
    }

    /**
    * Unchecks a checkbox.
    *
    * @element The selector or name of the checkbox to uncheck.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function uncheck(required string element) {
        return storeInput(arguments.element, false);
    }

    /**
    * Selects a given option in a given select field.
    *
    * @option The value or text to select.
    * @element The selector or name to choose the option in.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function select(required string option, required string element) {
        var value = variables.domEngine.findOptionValue(arguments.option, arguments.element);

        return storeInput(arguments.element, value);
    }

    /**
    * Press a submit button.
    *
    * @button The selector or name of the button to press.
    * @overrideEvent Optional. The event to run instead of the form's default. Default: ''.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function press(required string button, string overrideEvent = '') {
        return this.submitForm(
            button = arguments.button,
            overrideEvent = arguments.overrideEvent
        );
    }

    /**
    * Stores a value in an in-memory input struct with the element name as the key.
    *
    * @element The selector or name of an form field.
    * @value The value to store in-memory.
    * @overwrite Optional. Specifies whether to overwrite any existing in-memory input values.  Default: true.
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function storeInput(
        required string element,
        required string value,
        boolean overwrite = true
    ) {
        // First verify that the given element exists
        variables.domEngine.seeElement(arguments.element);

        var key = generateInputKey(arguments.element);

        if (StructKeyExists(variables.inputs, key)) {
            if (arguments.overwrite) {
                variables.inputs[key] = arguments.value;
            }
        }
        else {
            variables.inputs[key] = arguments.value;
        }

        return this;
    }

    /**
    * Returns the currently stored inputs
    *
    * @return struct
    */
    public struct function getInputs() {
        return variables.inputs;
    }

    /**
    * Resets the inputs to empty
    *
    * @return Integrated.Engines.Interaction.Contracts.InteractionEngine
    */
    public InteractionEngine function reset() {
        variables.inputs = {};

        return this;
    }

    /******************* HELPER METHODS *******************/

    /**
    * Returns a normalized key name for a form field selector or name.
    * Removes pound signs (#) from selectors.
    *
    * @element The selector or name of an form field.
    *
    * @return string
    */
    private string function generateInputKey(required string element) {
        return replaceNoCase(arguments.element, '##', '', 'all');
    }

}