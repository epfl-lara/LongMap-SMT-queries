; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54588 () Bool)

(assert start!54588)

(declare-fun b!596139 () Bool)

(declare-fun e!340609 () Bool)

(declare-fun e!340613 () Bool)

(assert (=> b!596139 (= e!340609 e!340613)))

(declare-fun res!381871 () Bool)

(assert (=> b!596139 (=> (not res!381871) (not e!340613))))

(declare-datatypes ((SeekEntryResult!6154 0))(
  ( (MissingZero!6154 (index!26864 (_ BitVec 32))) (Found!6154 (index!26865 (_ BitVec 32))) (Intermediate!6154 (undefined!6966 Bool) (index!26866 (_ BitVec 32)) (x!55817 (_ BitVec 32))) (Undefined!6154) (MissingVacant!6154 (index!26867 (_ BitVec 32))) )
))
(declare-fun lt!270735 () SeekEntryResult!6154)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596139 (= res!381871 (or (= lt!270735 (MissingZero!6154 i!1108)) (= lt!270735 (MissingVacant!6154 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36993 0))(
  ( (array!36994 (arr!17758 (Array (_ BitVec 32) (_ BitVec 64))) (size!18122 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36993)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36993 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!596139 (= lt!270735 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596140 () Bool)

(declare-fun res!381878 () Bool)

(declare-fun e!340617 () Bool)

(assert (=> b!596140 (=> res!381878 e!340617)))

(declare-datatypes ((List!11706 0))(
  ( (Nil!11703) (Cons!11702 (h!12750 (_ BitVec 64)) (t!17926 List!11706)) )
))
(declare-fun noDuplicate!262 (List!11706) Bool)

(assert (=> b!596140 (= res!381878 (not (noDuplicate!262 Nil!11703)))))

(declare-fun b!596141 () Bool)

(assert (=> b!596141 (= e!340617 true)))

(declare-fun lt!270733 () Bool)

(declare-fun contains!2915 (List!11706 (_ BitVec 64)) Bool)

(assert (=> b!596141 (= lt!270733 (contains!2915 Nil!11703 k0!1786))))

(declare-fun b!596142 () Bool)

(declare-fun res!381873 () Bool)

(assert (=> b!596142 (=> (not res!381873) (not e!340609))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!596142 (= res!381873 (and (= (size!18122 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18122 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18122 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596143 () Bool)

(declare-fun e!340616 () Bool)

(declare-fun e!340618 () Bool)

(assert (=> b!596143 (= e!340616 e!340618)))

(declare-fun res!381879 () Bool)

(assert (=> b!596143 (=> (not res!381879) (not e!340618))))

(declare-fun lt!270728 () array!36993)

(declare-fun arrayContainsKey!0 (array!36993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596143 (= res!381879 (arrayContainsKey!0 lt!270728 (select (arr!17758 a!2986) j!136) j!136))))

(declare-fun b!596144 () Bool)

(declare-datatypes ((Unit!18709 0))(
  ( (Unit!18710) )
))
(declare-fun e!340615 () Unit!18709)

(declare-fun Unit!18711 () Unit!18709)

(assert (=> b!596144 (= e!340615 Unit!18711)))

(declare-fun b!596145 () Bool)

(declare-fun res!381866 () Bool)

(assert (=> b!596145 (=> (not res!381866) (not e!340609))))

(assert (=> b!596145 (= res!381866 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596146 () Bool)

(declare-fun e!340610 () Bool)

(declare-fun e!340614 () Bool)

(assert (=> b!596146 (= e!340610 e!340614)))

(declare-fun res!381876 () Bool)

(assert (=> b!596146 (=> res!381876 e!340614)))

(declare-fun lt!270737 () (_ BitVec 64))

(declare-fun lt!270736 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596146 (= res!381876 (or (not (= (select (arr!17758 a!2986) j!136) lt!270736)) (not (= (select (arr!17758 a!2986) j!136) lt!270737)) (bvsge j!136 index!984)))))

(declare-fun e!340611 () Bool)

(assert (=> b!596146 e!340611))

(declare-fun res!381886 () Bool)

(assert (=> b!596146 (=> (not res!381886) (not e!340611))))

(assert (=> b!596146 (= res!381886 (= lt!270737 (select (arr!17758 a!2986) j!136)))))

(assert (=> b!596146 (= lt!270737 (select (store (arr!17758 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596147 () Bool)

(declare-fun res!381868 () Bool)

(assert (=> b!596147 (=> res!381868 e!340617)))

(assert (=> b!596147 (= res!381868 (contains!2915 Nil!11703 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596148 () Bool)

(declare-fun res!381867 () Bool)

(assert (=> b!596148 (=> (not res!381867) (not e!340613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36993 (_ BitVec 32)) Bool)

(assert (=> b!596148 (= res!381867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596149 () Bool)

(declare-fun e!340620 () Bool)

(assert (=> b!596149 (= e!340620 (not e!340610))))

(declare-fun res!381869 () Bool)

(assert (=> b!596149 (=> res!381869 e!340610)))

(declare-fun lt!270730 () SeekEntryResult!6154)

(assert (=> b!596149 (= res!381869 (not (= lt!270730 (Found!6154 index!984))))))

(declare-fun lt!270729 () Unit!18709)

(assert (=> b!596149 (= lt!270729 e!340615)))

(declare-fun c!67505 () Bool)

(assert (=> b!596149 (= c!67505 (= lt!270730 Undefined!6154))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36993 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!596149 (= lt!270730 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270736 lt!270728 mask!3053))))

(declare-fun e!340608 () Bool)

(assert (=> b!596149 e!340608))

(declare-fun res!381885 () Bool)

(assert (=> b!596149 (=> (not res!381885) (not e!340608))))

(declare-fun lt!270734 () SeekEntryResult!6154)

(declare-fun lt!270739 () (_ BitVec 32))

(assert (=> b!596149 (= res!381885 (= lt!270734 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270739 vacantSpotIndex!68 lt!270736 lt!270728 mask!3053)))))

(assert (=> b!596149 (= lt!270734 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270739 vacantSpotIndex!68 (select (arr!17758 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596149 (= lt!270736 (select (store (arr!17758 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270731 () Unit!18709)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18709)

(assert (=> b!596149 (= lt!270731 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270739 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596149 (= lt!270739 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!596150 () Bool)

(assert (=> b!596150 (= e!340611 e!340616)))

(declare-fun res!381884 () Bool)

(assert (=> b!596150 (=> res!381884 e!340616)))

(assert (=> b!596150 (= res!381884 (or (not (= (select (arr!17758 a!2986) j!136) lt!270736)) (not (= (select (arr!17758 a!2986) j!136) lt!270737)) (bvsge j!136 index!984)))))

(declare-fun res!381875 () Bool)

(assert (=> start!54588 (=> (not res!381875) (not e!340609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54588 (= res!381875 (validMask!0 mask!3053))))

(assert (=> start!54588 e!340609))

(assert (=> start!54588 true))

(declare-fun array_inv!13617 (array!36993) Bool)

(assert (=> start!54588 (array_inv!13617 a!2986)))

(declare-fun b!596151 () Bool)

(declare-fun res!381882 () Bool)

(assert (=> b!596151 (=> (not res!381882) (not e!340609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596151 (= res!381882 (validKeyInArray!0 k0!1786))))

(declare-fun b!596152 () Bool)

(assert (=> b!596152 (= e!340618 (arrayContainsKey!0 lt!270728 (select (arr!17758 a!2986) j!136) index!984))))

(declare-fun b!596153 () Bool)

(declare-fun lt!270732 () SeekEntryResult!6154)

(assert (=> b!596153 (= e!340608 (= lt!270732 lt!270734))))

(declare-fun b!596154 () Bool)

(declare-fun res!381880 () Bool)

(assert (=> b!596154 (=> (not res!381880) (not e!340613))))

(declare-fun arrayNoDuplicates!0 (array!36993 (_ BitVec 32) List!11706) Bool)

(assert (=> b!596154 (= res!381880 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11703))))

(declare-fun b!596155 () Bool)

(declare-fun Unit!18712 () Unit!18709)

(assert (=> b!596155 (= e!340615 Unit!18712)))

(assert (=> b!596155 false))

(declare-fun b!596156 () Bool)

(declare-fun res!381874 () Bool)

(assert (=> b!596156 (=> res!381874 e!340617)))

(assert (=> b!596156 (= res!381874 (contains!2915 Nil!11703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596157 () Bool)

(declare-fun res!381877 () Bool)

(assert (=> b!596157 (=> (not res!381877) (not e!340613))))

(assert (=> b!596157 (= res!381877 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17758 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596158 () Bool)

(declare-fun e!340619 () Bool)

(assert (=> b!596158 (= e!340613 e!340619)))

(declare-fun res!381883 () Bool)

(assert (=> b!596158 (=> (not res!381883) (not e!340619))))

(assert (=> b!596158 (= res!381883 (= (select (store (arr!17758 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596158 (= lt!270728 (array!36994 (store (arr!17758 a!2986) i!1108 k0!1786) (size!18122 a!2986)))))

(declare-fun b!596159 () Bool)

(assert (=> b!596159 (= e!340619 e!340620)))

(declare-fun res!381870 () Bool)

(assert (=> b!596159 (=> (not res!381870) (not e!340620))))

(assert (=> b!596159 (= res!381870 (and (= lt!270732 (Found!6154 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17758 a!2986) index!984) (select (arr!17758 a!2986) j!136))) (not (= (select (arr!17758 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596159 (= lt!270732 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17758 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596160 () Bool)

(declare-fun res!381881 () Bool)

(assert (=> b!596160 (=> (not res!381881) (not e!340609))))

(assert (=> b!596160 (= res!381881 (validKeyInArray!0 (select (arr!17758 a!2986) j!136)))))

(declare-fun b!596161 () Bool)

(assert (=> b!596161 (= e!340614 e!340617)))

(declare-fun res!381872 () Bool)

(assert (=> b!596161 (=> res!381872 e!340617)))

(assert (=> b!596161 (= res!381872 (or (bvsge (size!18122 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18122 a!2986))))))

(assert (=> b!596161 (arrayContainsKey!0 lt!270728 (select (arr!17758 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270738 () Unit!18709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18709)

(assert (=> b!596161 (= lt!270738 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270728 (select (arr!17758 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54588 res!381875) b!596142))

(assert (= (and b!596142 res!381873) b!596160))

(assert (= (and b!596160 res!381881) b!596151))

(assert (= (and b!596151 res!381882) b!596145))

(assert (= (and b!596145 res!381866) b!596139))

(assert (= (and b!596139 res!381871) b!596148))

(assert (= (and b!596148 res!381867) b!596154))

(assert (= (and b!596154 res!381880) b!596157))

(assert (= (and b!596157 res!381877) b!596158))

(assert (= (and b!596158 res!381883) b!596159))

(assert (= (and b!596159 res!381870) b!596149))

(assert (= (and b!596149 res!381885) b!596153))

(assert (= (and b!596149 c!67505) b!596155))

(assert (= (and b!596149 (not c!67505)) b!596144))

(assert (= (and b!596149 (not res!381869)) b!596146))

(assert (= (and b!596146 res!381886) b!596150))

(assert (= (and b!596150 (not res!381884)) b!596143))

(assert (= (and b!596143 res!381879) b!596152))

(assert (= (and b!596146 (not res!381876)) b!596161))

(assert (= (and b!596161 (not res!381872)) b!596140))

(assert (= (and b!596140 (not res!381878)) b!596156))

(assert (= (and b!596156 (not res!381874)) b!596147))

(assert (= (and b!596147 (not res!381868)) b!596141))

(declare-fun m!573917 () Bool)

(assert (=> b!596145 m!573917))

(declare-fun m!573919 () Bool)

(assert (=> b!596151 m!573919))

(declare-fun m!573921 () Bool)

(assert (=> start!54588 m!573921))

(declare-fun m!573923 () Bool)

(assert (=> start!54588 m!573923))

(declare-fun m!573925 () Bool)

(assert (=> b!596152 m!573925))

(assert (=> b!596152 m!573925))

(declare-fun m!573927 () Bool)

(assert (=> b!596152 m!573927))

(assert (=> b!596160 m!573925))

(assert (=> b!596160 m!573925))

(declare-fun m!573929 () Bool)

(assert (=> b!596160 m!573929))

(declare-fun m!573931 () Bool)

(assert (=> b!596148 m!573931))

(assert (=> b!596150 m!573925))

(declare-fun m!573933 () Bool)

(assert (=> b!596139 m!573933))

(assert (=> b!596143 m!573925))

(assert (=> b!596143 m!573925))

(declare-fun m!573935 () Bool)

(assert (=> b!596143 m!573935))

(declare-fun m!573937 () Bool)

(assert (=> b!596158 m!573937))

(declare-fun m!573939 () Bool)

(assert (=> b!596158 m!573939))

(assert (=> b!596161 m!573925))

(assert (=> b!596161 m!573925))

(declare-fun m!573941 () Bool)

(assert (=> b!596161 m!573941))

(assert (=> b!596161 m!573925))

(declare-fun m!573943 () Bool)

(assert (=> b!596161 m!573943))

(declare-fun m!573945 () Bool)

(assert (=> b!596147 m!573945))

(declare-fun m!573947 () Bool)

(assert (=> b!596154 m!573947))

(declare-fun m!573949 () Bool)

(assert (=> b!596159 m!573949))

(assert (=> b!596159 m!573925))

(assert (=> b!596159 m!573925))

(declare-fun m!573951 () Bool)

(assert (=> b!596159 m!573951))

(assert (=> b!596146 m!573925))

(assert (=> b!596146 m!573937))

(declare-fun m!573953 () Bool)

(assert (=> b!596146 m!573953))

(declare-fun m!573955 () Bool)

(assert (=> b!596157 m!573955))

(declare-fun m!573957 () Bool)

(assert (=> b!596156 m!573957))

(declare-fun m!573959 () Bool)

(assert (=> b!596141 m!573959))

(declare-fun m!573961 () Bool)

(assert (=> b!596140 m!573961))

(declare-fun m!573963 () Bool)

(assert (=> b!596149 m!573963))

(declare-fun m!573965 () Bool)

(assert (=> b!596149 m!573965))

(assert (=> b!596149 m!573925))

(assert (=> b!596149 m!573937))

(assert (=> b!596149 m!573925))

(declare-fun m!573967 () Bool)

(assert (=> b!596149 m!573967))

(declare-fun m!573969 () Bool)

(assert (=> b!596149 m!573969))

(declare-fun m!573971 () Bool)

(assert (=> b!596149 m!573971))

(declare-fun m!573973 () Bool)

(assert (=> b!596149 m!573973))

(check-sat (not b!596156) (not b!596148) (not b!596151) (not b!596154) (not b!596152) (not b!596140) (not b!596160) (not b!596139) (not b!596145) (not b!596147) (not b!596161) (not b!596159) (not b!596149) (not b!596143) (not b!596141) (not start!54588))
(check-sat)
