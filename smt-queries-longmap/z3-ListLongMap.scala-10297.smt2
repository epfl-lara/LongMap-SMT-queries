; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121106 () Bool)

(assert start!121106)

(declare-fun res!945811 () Bool)

(declare-fun e!796935 () Bool)

(assert (=> start!121106 (=> (not res!945811) (not e!796935))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121106 (= res!945811 (validMask!0 mask!2840))))

(assert (=> start!121106 e!796935))

(assert (=> start!121106 true))

(declare-datatypes ((array!96260 0))(
  ( (array!96261 (arr!46473 (Array (_ BitVec 32) (_ BitVec 64))) (size!47023 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96260)

(declare-fun array_inv!35501 (array!96260) Bool)

(assert (=> start!121106 (array_inv!35501 a!2901)))

(declare-fun b!1408087 () Bool)

(declare-fun e!796936 () Bool)

(declare-fun e!796937 () Bool)

(assert (=> b!1408087 (= e!796936 e!796937)))

(declare-fun res!945816 () Bool)

(assert (=> b!1408087 (=> res!945816 e!796937)))

(declare-datatypes ((SeekEntryResult!10784 0))(
  ( (MissingZero!10784 (index!45513 (_ BitVec 32))) (Found!10784 (index!45514 (_ BitVec 32))) (Intermediate!10784 (undefined!11596 Bool) (index!45515 (_ BitVec 32)) (x!127121 (_ BitVec 32))) (Undefined!10784) (MissingVacant!10784 (index!45516 (_ BitVec 32))) )
))
(declare-fun lt!620103 () SeekEntryResult!10784)

(declare-fun lt!620104 () array!96260)

(declare-fun lt!620108 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96260 (_ BitVec 32)) SeekEntryResult!10784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408087 (= res!945816 (not (= lt!620103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620108 mask!2840) lt!620108 lt!620104 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408087 (= lt!620108 (select (store (arr!46473 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408087 (= lt!620104 (array!96261 (store (arr!46473 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47023 a!2901)))))

(declare-fun b!1408088 () Bool)

(declare-fun res!945813 () Bool)

(assert (=> b!1408088 (=> res!945813 e!796937)))

(declare-fun lt!620109 () (_ BitVec 32))

(assert (=> b!1408088 (= res!945813 (or (bvslt (x!127121 lt!620103) #b00000000000000000000000000000000) (bvsgt (x!127121 lt!620103) #b01111111111111111111111111111110) (bvslt lt!620109 #b00000000000000000000000000000000) (bvsge lt!620109 (size!47023 a!2901)) (bvslt (index!45515 lt!620103) #b00000000000000000000000000000000) (bvsge (index!45515 lt!620103) (size!47023 a!2901)) (not (= lt!620103 (Intermediate!10784 false (index!45515 lt!620103) (x!127121 lt!620103))))))))

(declare-fun b!1408089 () Bool)

(declare-fun res!945810 () Bool)

(assert (=> b!1408089 (=> (not res!945810) (not e!796935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408089 (= res!945810 (validKeyInArray!0 (select (arr!46473 a!2901) i!1037)))))

(declare-fun b!1408090 () Bool)

(assert (=> b!1408090 (= e!796937 true)))

(declare-fun lt!620106 () SeekEntryResult!10784)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96260 (_ BitVec 32)) SeekEntryResult!10784)

(assert (=> b!1408090 (= lt!620106 (seekEntryOrOpen!0 lt!620108 lt!620104 mask!2840))))

(declare-datatypes ((Unit!47542 0))(
  ( (Unit!47543) )
))
(declare-fun lt!620105 () Unit!47542)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47542)

(assert (=> b!1408090 (= lt!620105 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620109 (x!127121 lt!620103) (index!45515 lt!620103) mask!2840))))

(declare-fun b!1408091 () Bool)

(declare-fun res!945814 () Bool)

(assert (=> b!1408091 (=> (not res!945814) (not e!796935))))

(assert (=> b!1408091 (= res!945814 (and (= (size!47023 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47023 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47023 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408092 () Bool)

(assert (=> b!1408092 (= e!796935 (not e!796936))))

(declare-fun res!945809 () Bool)

(assert (=> b!1408092 (=> res!945809 e!796936)))

(get-info :version)

(assert (=> b!1408092 (= res!945809 (or (not ((_ is Intermediate!10784) lt!620103)) (undefined!11596 lt!620103)))))

(assert (=> b!1408092 (= lt!620106 (Found!10784 j!112))))

(assert (=> b!1408092 (= lt!620106 (seekEntryOrOpen!0 (select (arr!46473 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96260 (_ BitVec 32)) Bool)

(assert (=> b!1408092 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620107 () Unit!47542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47542)

(assert (=> b!1408092 (= lt!620107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408092 (= lt!620103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620109 (select (arr!46473 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408092 (= lt!620109 (toIndex!0 (select (arr!46473 a!2901) j!112) mask!2840))))

(declare-fun b!1408093 () Bool)

(declare-fun res!945812 () Bool)

(assert (=> b!1408093 (=> (not res!945812) (not e!796935))))

(assert (=> b!1408093 (= res!945812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408094 () Bool)

(declare-fun res!945815 () Bool)

(assert (=> b!1408094 (=> (not res!945815) (not e!796935))))

(declare-datatypes ((List!32992 0))(
  ( (Nil!32989) (Cons!32988 (h!34251 (_ BitVec 64)) (t!47686 List!32992)) )
))
(declare-fun arrayNoDuplicates!0 (array!96260 (_ BitVec 32) List!32992) Bool)

(assert (=> b!1408094 (= res!945815 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32989))))

(declare-fun b!1408095 () Bool)

(declare-fun res!945817 () Bool)

(assert (=> b!1408095 (=> (not res!945817) (not e!796935))))

(assert (=> b!1408095 (= res!945817 (validKeyInArray!0 (select (arr!46473 a!2901) j!112)))))

(assert (= (and start!121106 res!945811) b!1408091))

(assert (= (and b!1408091 res!945814) b!1408089))

(assert (= (and b!1408089 res!945810) b!1408095))

(assert (= (and b!1408095 res!945817) b!1408093))

(assert (= (and b!1408093 res!945812) b!1408094))

(assert (= (and b!1408094 res!945815) b!1408092))

(assert (= (and b!1408092 (not res!945809)) b!1408087))

(assert (= (and b!1408087 (not res!945816)) b!1408088))

(assert (= (and b!1408088 (not res!945813)) b!1408090))

(declare-fun m!1297241 () Bool)

(assert (=> b!1408090 m!1297241))

(declare-fun m!1297243 () Bool)

(assert (=> b!1408090 m!1297243))

(declare-fun m!1297245 () Bool)

(assert (=> b!1408092 m!1297245))

(declare-fun m!1297247 () Bool)

(assert (=> b!1408092 m!1297247))

(assert (=> b!1408092 m!1297245))

(declare-fun m!1297249 () Bool)

(assert (=> b!1408092 m!1297249))

(assert (=> b!1408092 m!1297245))

(declare-fun m!1297251 () Bool)

(assert (=> b!1408092 m!1297251))

(declare-fun m!1297253 () Bool)

(assert (=> b!1408092 m!1297253))

(assert (=> b!1408092 m!1297245))

(declare-fun m!1297255 () Bool)

(assert (=> b!1408092 m!1297255))

(declare-fun m!1297257 () Bool)

(assert (=> b!1408093 m!1297257))

(declare-fun m!1297259 () Bool)

(assert (=> b!1408089 m!1297259))

(assert (=> b!1408089 m!1297259))

(declare-fun m!1297261 () Bool)

(assert (=> b!1408089 m!1297261))

(assert (=> b!1408095 m!1297245))

(assert (=> b!1408095 m!1297245))

(declare-fun m!1297263 () Bool)

(assert (=> b!1408095 m!1297263))

(declare-fun m!1297265 () Bool)

(assert (=> start!121106 m!1297265))

(declare-fun m!1297267 () Bool)

(assert (=> start!121106 m!1297267))

(declare-fun m!1297269 () Bool)

(assert (=> b!1408087 m!1297269))

(assert (=> b!1408087 m!1297269))

(declare-fun m!1297271 () Bool)

(assert (=> b!1408087 m!1297271))

(declare-fun m!1297273 () Bool)

(assert (=> b!1408087 m!1297273))

(declare-fun m!1297275 () Bool)

(assert (=> b!1408087 m!1297275))

(declare-fun m!1297277 () Bool)

(assert (=> b!1408094 m!1297277))

(check-sat (not b!1408087) (not b!1408089) (not start!121106) (not b!1408093) (not b!1408094) (not b!1408090) (not b!1408095) (not b!1408092))
(check-sat)
