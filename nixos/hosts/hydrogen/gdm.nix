{pkgs, ...}: {
  # GDM monitor configuration
  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${pkgs.writeText "gdm-monitors.xml" ''
      <monitors version="2">
        <configuration>
          <logicalmonitor>
            <x>2560</x>
            <y>0</y>
            <scale>1</scale>
            <monitor>
              <monitorspec>
                <connector>DP-1</connector>
                <vendor>AUS</vendor>
                <product>VG27A</product>
                <serial>N3LMQS189347</serial>
              </monitorspec>
              <mode>
                <width>2560</width>
                <height>1440</height>
                <rate>143.972</rate>
              </mode>
            </monitor>
          </logicalmonitor>
          <logicalmonitor>
            <x>0</x>
            <y>0</y>
            <scale>1</scale>
            <primary>yes</primary>
            <monitor>
              <monitorspec>
                <connector>DP-3</connector>
                <vendor>AUS</vendor>
                <product>VG27A</product>
                <serial>N3LMQS189305</serial>
              </monitorspec>
              <mode>
                <width>2560</width>
                <height>1440</height>
                <rate>143.972</rate>
              </mode>
            </monitor>
          </logicalmonitor>
        </configuration>
      </monitors>
    ''}"
  ];
}
