; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120602 () Bool)

(assert start!120602)

(declare-fun b!1402979 () Bool)

(declare-fun res!940806 () Bool)

(declare-fun e!794526 () Bool)

(assert (=> b!1402979 (=> (not res!940806) (not e!794526))))

(declare-datatypes ((array!95933 0))(
  ( (array!95934 (arr!46315 (Array (_ BitVec 32) (_ BitVec 64))) (size!46866 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95933)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402979 (= res!940806 (validKeyInArray!0 (select (arr!46315 a!2901) j!112)))))

(declare-fun b!1402980 () Bool)

(declare-fun res!940807 () Bool)

(assert (=> b!1402980 (=> (not res!940807) (not e!794526))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95933 (_ BitVec 32)) Bool)

(assert (=> b!1402980 (= res!940807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!794530 () Bool)

(declare-fun b!1402981 () Bool)

(declare-datatypes ((SeekEntryResult!10535 0))(
  ( (MissingZero!10535 (index!44517 (_ BitVec 32))) (Found!10535 (index!44518 (_ BitVec 32))) (Intermediate!10535 (undefined!11347 Bool) (index!44519 (_ BitVec 32)) (x!126301 (_ BitVec 32))) (Undefined!10535) (MissingVacant!10535 (index!44520 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95933 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1402981 (= e!794530 (= (seekEntryOrOpen!0 (select (arr!46315 a!2901) j!112) a!2901 mask!2840) (Found!10535 j!112)))))

(declare-fun b!1402982 () Bool)

(declare-fun e!794525 () Bool)

(declare-fun e!794528 () Bool)

(assert (=> b!1402982 (= e!794525 e!794528)))

(declare-fun res!940812 () Bool)

(assert (=> b!1402982 (=> res!940812 e!794528)))

(declare-fun lt!617621 () SeekEntryResult!10535)

(declare-fun lt!617622 () SeekEntryResult!10535)

(declare-fun lt!617624 () (_ BitVec 32))

(assert (=> b!1402982 (= res!940812 (or (bvslt (x!126301 lt!617622) #b00000000000000000000000000000000) (bvsgt (x!126301 lt!617622) #b01111111111111111111111111111110) (bvslt (x!126301 lt!617621) #b00000000000000000000000000000000) (bvsgt (x!126301 lt!617621) #b01111111111111111111111111111110) (bvslt lt!617624 #b00000000000000000000000000000000) (bvsge lt!617624 (size!46866 a!2901)) (bvslt (index!44519 lt!617622) #b00000000000000000000000000000000) (bvsge (index!44519 lt!617622) (size!46866 a!2901)) (bvslt (index!44519 lt!617621) #b00000000000000000000000000000000) (bvsge (index!44519 lt!617621) (size!46866 a!2901)) (not (= lt!617622 (Intermediate!10535 false (index!44519 lt!617622) (x!126301 lt!617622)))) (not (= lt!617621 (Intermediate!10535 false (index!44519 lt!617621) (x!126301 lt!617621))))))))

(declare-fun e!794531 () Bool)

(assert (=> b!1402982 e!794531))

(declare-fun res!940814 () Bool)

(assert (=> b!1402982 (=> (not res!940814) (not e!794531))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402982 (= res!940814 (and (not (undefined!11347 lt!617621)) (= (index!44519 lt!617621) i!1037) (bvslt (x!126301 lt!617621) (x!126301 lt!617622)) (= (select (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44519 lt!617621)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47101 0))(
  ( (Unit!47102) )
))
(declare-fun lt!617623 () Unit!47101)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47101)

(assert (=> b!1402982 (= lt!617623 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617624 (x!126301 lt!617622) (index!44519 lt!617622) (x!126301 lt!617621) (index!44519 lt!617621) (undefined!11347 lt!617621) mask!2840))))

(declare-fun b!1402983 () Bool)

(assert (=> b!1402983 (= e!794528 true)))

(declare-fun lt!617620 () (_ BitVec 64))

(declare-fun lt!617625 () SeekEntryResult!10535)

(declare-fun lt!617627 () array!95933)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95933 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1402983 (= lt!617625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617624 lt!617620 lt!617627 mask!2840))))

(declare-fun b!1402984 () Bool)

(declare-fun e!794529 () Bool)

(assert (=> b!1402984 (= e!794529 e!794525)))

(declare-fun res!940816 () Bool)

(assert (=> b!1402984 (=> res!940816 e!794525)))

(get-info :version)

(assert (=> b!1402984 (= res!940816 (or (= lt!617622 lt!617621) (not ((_ is Intermediate!10535) lt!617621))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402984 (= lt!617621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617620 mask!2840) lt!617620 lt!617627 mask!2840))))

(assert (=> b!1402984 (= lt!617620 (select (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402984 (= lt!617627 (array!95934 (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46866 a!2901)))))

(declare-fun res!940808 () Bool)

(assert (=> start!120602 (=> (not res!940808) (not e!794526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120602 (= res!940808 (validMask!0 mask!2840))))

(assert (=> start!120602 e!794526))

(assert (=> start!120602 true))

(declare-fun array_inv!35596 (array!95933) Bool)

(assert (=> start!120602 (array_inv!35596 a!2901)))

(declare-fun b!1402985 () Bool)

(declare-fun res!940815 () Bool)

(assert (=> b!1402985 (=> (not res!940815) (not e!794526))))

(assert (=> b!1402985 (= res!940815 (validKeyInArray!0 (select (arr!46315 a!2901) i!1037)))))

(declare-fun b!1402986 () Bool)

(assert (=> b!1402986 (= e!794526 (not e!794529))))

(declare-fun res!940813 () Bool)

(assert (=> b!1402986 (=> res!940813 e!794529)))

(assert (=> b!1402986 (= res!940813 (or (not ((_ is Intermediate!10535) lt!617622)) (undefined!11347 lt!617622)))))

(assert (=> b!1402986 e!794530))

(declare-fun res!940811 () Bool)

(assert (=> b!1402986 (=> (not res!940811) (not e!794530))))

(assert (=> b!1402986 (= res!940811 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617626 () Unit!47101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47101)

(assert (=> b!1402986 (= lt!617626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402986 (= lt!617622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617624 (select (arr!46315 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402986 (= lt!617624 (toIndex!0 (select (arr!46315 a!2901) j!112) mask!2840))))

(declare-fun b!1402987 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95933 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1402987 (= e!794531 (= (seekEntryOrOpen!0 lt!617620 lt!617627 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126301 lt!617621) (index!44519 lt!617621) (index!44519 lt!617621) (select (arr!46315 a!2901) j!112) lt!617627 mask!2840)))))

(declare-fun b!1402988 () Bool)

(declare-fun res!940809 () Bool)

(assert (=> b!1402988 (=> (not res!940809) (not e!794526))))

(assert (=> b!1402988 (= res!940809 (and (= (size!46866 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46866 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46866 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402989 () Bool)

(declare-fun res!940810 () Bool)

(assert (=> b!1402989 (=> (not res!940810) (not e!794526))))

(declare-datatypes ((List!32821 0))(
  ( (Nil!32818) (Cons!32817 (h!34073 (_ BitVec 64)) (t!47507 List!32821)) )
))
(declare-fun arrayNoDuplicates!0 (array!95933 (_ BitVec 32) List!32821) Bool)

(assert (=> b!1402989 (= res!940810 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32818))))

(assert (= (and start!120602 res!940808) b!1402988))

(assert (= (and b!1402988 res!940809) b!1402985))

(assert (= (and b!1402985 res!940815) b!1402979))

(assert (= (and b!1402979 res!940806) b!1402980))

(assert (= (and b!1402980 res!940807) b!1402989))

(assert (= (and b!1402989 res!940810) b!1402986))

(assert (= (and b!1402986 res!940811) b!1402981))

(assert (= (and b!1402986 (not res!940813)) b!1402984))

(assert (= (and b!1402984 (not res!940816)) b!1402982))

(assert (= (and b!1402982 res!940814) b!1402987))

(assert (= (and b!1402982 (not res!940812)) b!1402983))

(declare-fun m!1291129 () Bool)

(assert (=> b!1402986 m!1291129))

(declare-fun m!1291131 () Bool)

(assert (=> b!1402986 m!1291131))

(assert (=> b!1402986 m!1291129))

(declare-fun m!1291133 () Bool)

(assert (=> b!1402986 m!1291133))

(assert (=> b!1402986 m!1291129))

(declare-fun m!1291135 () Bool)

(assert (=> b!1402986 m!1291135))

(declare-fun m!1291137 () Bool)

(assert (=> b!1402986 m!1291137))

(assert (=> b!1402979 m!1291129))

(assert (=> b!1402979 m!1291129))

(declare-fun m!1291139 () Bool)

(assert (=> b!1402979 m!1291139))

(declare-fun m!1291141 () Bool)

(assert (=> b!1402983 m!1291141))

(declare-fun m!1291143 () Bool)

(assert (=> b!1402987 m!1291143))

(assert (=> b!1402987 m!1291129))

(assert (=> b!1402987 m!1291129))

(declare-fun m!1291145 () Bool)

(assert (=> b!1402987 m!1291145))

(declare-fun m!1291147 () Bool)

(assert (=> b!1402989 m!1291147))

(declare-fun m!1291149 () Bool)

(assert (=> b!1402985 m!1291149))

(assert (=> b!1402985 m!1291149))

(declare-fun m!1291151 () Bool)

(assert (=> b!1402985 m!1291151))

(declare-fun m!1291153 () Bool)

(assert (=> b!1402984 m!1291153))

(assert (=> b!1402984 m!1291153))

(declare-fun m!1291155 () Bool)

(assert (=> b!1402984 m!1291155))

(declare-fun m!1291157 () Bool)

(assert (=> b!1402984 m!1291157))

(declare-fun m!1291159 () Bool)

(assert (=> b!1402984 m!1291159))

(assert (=> b!1402982 m!1291157))

(declare-fun m!1291161 () Bool)

(assert (=> b!1402982 m!1291161))

(declare-fun m!1291163 () Bool)

(assert (=> b!1402982 m!1291163))

(declare-fun m!1291165 () Bool)

(assert (=> start!120602 m!1291165))

(declare-fun m!1291167 () Bool)

(assert (=> start!120602 m!1291167))

(declare-fun m!1291169 () Bool)

(assert (=> b!1402980 m!1291169))

(assert (=> b!1402981 m!1291129))

(assert (=> b!1402981 m!1291129))

(declare-fun m!1291171 () Bool)

(assert (=> b!1402981 m!1291171))

(check-sat (not b!1402982) (not b!1402987) (not b!1402981) (not b!1402989) (not b!1402980) (not b!1402985) (not b!1402979) (not b!1402984) (not b!1402983) (not b!1402986) (not start!120602))
(check-sat)
