classdef SL < handle
	%SL Simulink helper functions
	
	methods (Static)
		
		function BlockSwap(oldBlock, newBlock)
			%BLOCKSWAP Simulink block swap
			
			position = get_param(oldBlock,'Position');
			orientation = get_param(oldBlock, 'Orientation');

			delete_block(oldBlock);

			add_block(newBlock, oldBlock, 'Position', position, 'Orientation', orientation);
		end

		function ToggleInport(blockName, state)
			% Argument "state" is 'on' or 'off'
			
			blockPath = [gcb, '/' blockName];
			switch state
				case 'on'
					if strcmp(get_param(blockPath, 'BlockType'), 'Constant')
						SL.BlockSwap(blockPath, 'built-in/Inport');
					end
				case 'off'
					if strcmp(get_param(blockPath, 'BlockType'), 'Inport')
						SL.BlockSwap(blockPath, 'built-in/Constant');
						set_param(blockPath, 'Value', '0');
					end
				otherwise
					fprintf( ...
						'Incorrect state %s during swapping: %s', ...
						blockPath, state ...
						);
			end
		end

		function ToggleOutport(blockName, state)
			% Argument "state" is 'on' or 'off'
			
			blockPath = [gcb, '/' blockName];
			switch state
				case 'on'
					if strcmp(get_param(blockPath, 'BlockType'), 'Terminator')
						SL.BlockSwap(blockPath, 'built-in/Outport');
					end
				case 'off'
					if strcmp(get_param(blockPath, 'BlockType'), 'Outport')
						SL.BlockSwap(blockPath, 'built-in/Terminator');
					end
				otherwise
					fprintf( ...
						'Incorrect state %s during swapping: %s', ...
						blockPath, state ...
						);
			end
		end

		function b = IsInport(blockName)
			blockPath = [gcb, '/' blockName];
			b = strcmp(get_param(blockPath, 'BlockType'), 'Inport');
		end

		function b = IsOutport(blockName)
			blockPath = [gcb, '/' blockName];
			b = strcmp(get_param(blockPath, 'BlockType'), 'Outport');
		end

		function b = IsOn(parameterName)
			b = strcmp(get_param(gcb, parameterName), 'on');
		end
		
	end

end

