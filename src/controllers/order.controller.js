import Type from '../models/Interactions/typeModel.js';
import Interaction from '../models/Interactions/interactionTypeModel.js';
import InteractionOption from '../models/Interactions/interactionOptionsModel.js';

export const getType = async (req, res) => {
    try {
        const types = await Type.findAll();

        if (!types) {
            res.status(404).json({ message: 'No types found' })
        }

        res.status(200).json({
            message: 'types list',
            data: types
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong fetching types',
        });
    }
}

export const getInteractions = async (req, res) => {
    try {
        const interactions = await Interaction.findAll();

        if (!interactions) {
            res.status(404).json({ message: 'No interaction found' })
        }

        res.status(200).json({
            message: 'Interactions list',
            data: interactions
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong fetching interactions',
        });
    }
}

export const getInteractionByOption = async (req, res) => {
    try {
        const { id_interaction } = req.params;
        console.log(id_interaction);
        const interactionType = await Interaction.findOne({ id_interaction })
        console.log(interactionType);
        const interactionOptions = await InteractionOption.findAll({
            attributes: ['name_option'],
            where: {
                id_interaction: interactionType.id_interaction,
            }
        })

        res.status(200).json({
            message: "Interaction list",
            data: interactionOptions
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: 'Something went wrong fetching interaction options',
        });
    }
}