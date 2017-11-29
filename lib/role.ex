alias Converge.{All, Util}

defmodule RoleSynaptics do
	require Util
	import Util, only: [conf_file: 1, conf_dir: 1]

	def role(_tags \\ []) do
		%{
			desired_packages:  ["xserver-xorg-input-synaptics"],
			post_install_unit: %All{units: [
				conf_dir("/etc/X11"),
				conf_dir("/etc/X11/xorg.conf.d"),
				conf_file("/etc/X11/xorg.conf.d/70-synaptics.conf"),
			]}
		}
	end
end
