#
# Cookbook Name:: x-windows 
# Recipe:: default
#
# Copyright 2011, Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when "redhat","centos","scientific","amazon","scientific","oracle"
    default['x11']['packages'] = %w{ 
                                    bitmap-fonts
                                    desktop-backgrounds-basic
                                    xorg-x11-drivers
                                    xorg-x11-fonts-100dpi
                                    xorg-x11-fonts-75dpi
                                    xorg-x11-fonts-ISO8859-1-100dpi
                                    xorg-x11-fonts-ISO8859-1-75dpi
                                    xorg-x11-fonts-Type1
                                    xorg-x11-fonts-misc
                                    xorg-x11-server-Xorg
                                    xorg-x11-xauth
                                    xorg-x11-xinit
                                    xorg-x11-twm
                                    xterm
    }
    if node[:platform_family] == 'redhat' and node[:platform_version].to_f >= 6.0
      default['x11']['packages'] << %w{ 
        http://rpmfind.net/linux/sourceforge/m/ms/mscorefonts2/rpms/msttcore-fonts-2.1-2.noarch.rpm
      }
    else
      default['x11']['packages'] << %w{ 
        xorg-x11-fonts-truetype
        xorg-x11-xfs
      }
    end
else
  default['x11']['packages'] = [
    'xserver-xorg',
    'xterm'
  ]
end
