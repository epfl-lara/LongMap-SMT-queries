; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120468 () Bool)

(assert start!120468)

(declare-fun res!941199 () Bool)

(declare-fun e!794262 () Bool)

(assert (=> start!120468 (=> (not res!941199) (not e!794262))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120468 (= res!941199 (validMask!0 mask!2840))))

(assert (=> start!120468 e!794262))

(assert (=> start!120468 true))

(declare-datatypes ((array!95877 0))(
  ( (array!95878 (arr!46289 (Array (_ BitVec 32) (_ BitVec 64))) (size!46839 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95877)

(declare-fun array_inv!35317 (array!95877) Bool)

(assert (=> start!120468 (array_inv!35317 a!2901)))

(declare-fun b!1402683 () Bool)

(declare-fun res!941203 () Bool)

(assert (=> b!1402683 (=> (not res!941203) (not e!794262))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402683 (= res!941203 (validKeyInArray!0 (select (arr!46289 a!2901) i!1037)))))

(declare-fun b!1402684 () Bool)

(declare-fun e!794260 () Bool)

(assert (=> b!1402684 (= e!794260 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10606 0))(
  ( (MissingZero!10606 (index!44801 (_ BitVec 32))) (Found!10606 (index!44802 (_ BitVec 32))) (Intermediate!10606 (undefined!11418 Bool) (index!44803 (_ BitVec 32)) (x!126425 (_ BitVec 32))) (Undefined!10606) (MissingVacant!10606 (index!44804 (_ BitVec 32))) )
))
(declare-fun lt!617972 () SeekEntryResult!10606)

(declare-fun lt!617969 () SeekEntryResult!10606)

(assert (=> b!1402684 (= lt!617972 lt!617969)))

(declare-fun lt!617964 () SeekEntryResult!10606)

(declare-fun lt!617970 () (_ BitVec 32))

(declare-datatypes ((Unit!47216 0))(
  ( (Unit!47217) )
))
(declare-fun lt!617971 () Unit!47216)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!617967 () SeekEntryResult!10606)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47216)

(assert (=> b!1402684 (= lt!617971 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617970 (x!126425 lt!617967) (index!44803 lt!617967) (x!126425 lt!617964) (index!44803 lt!617964) mask!2840))))

(declare-fun b!1402685 () Bool)

(declare-fun e!794263 () Bool)

(declare-fun e!794261 () Bool)

(assert (=> b!1402685 (= e!794263 e!794261)))

(declare-fun res!941194 () Bool)

(assert (=> b!1402685 (=> res!941194 e!794261)))

(assert (=> b!1402685 (= res!941194 (or (= lt!617967 lt!617964) (not (is-Intermediate!10606 lt!617964))))))

(declare-fun lt!617965 () (_ BitVec 64))

(declare-fun lt!617966 () array!95877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95877 (_ BitVec 32)) SeekEntryResult!10606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402685 (= lt!617964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617965 mask!2840) lt!617965 lt!617966 mask!2840))))

(assert (=> b!1402685 (= lt!617965 (select (store (arr!46289 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402685 (= lt!617966 (array!95878 (store (arr!46289 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46839 a!2901)))))

(declare-fun b!1402686 () Bool)

(assert (=> b!1402686 (= e!794261 e!794260)))

(declare-fun res!941195 () Bool)

(assert (=> b!1402686 (=> res!941195 e!794260)))

(assert (=> b!1402686 (= res!941195 (or (bvslt (x!126425 lt!617967) #b00000000000000000000000000000000) (bvsgt (x!126425 lt!617967) #b01111111111111111111111111111110) (bvslt (x!126425 lt!617964) #b00000000000000000000000000000000) (bvsgt (x!126425 lt!617964) #b01111111111111111111111111111110) (bvslt lt!617970 #b00000000000000000000000000000000) (bvsge lt!617970 (size!46839 a!2901)) (bvslt (index!44803 lt!617967) #b00000000000000000000000000000000) (bvsge (index!44803 lt!617967) (size!46839 a!2901)) (bvslt (index!44803 lt!617964) #b00000000000000000000000000000000) (bvsge (index!44803 lt!617964) (size!46839 a!2901)) (not (= lt!617967 (Intermediate!10606 false (index!44803 lt!617967) (x!126425 lt!617967)))) (not (= lt!617964 (Intermediate!10606 false (index!44803 lt!617964) (x!126425 lt!617964))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95877 (_ BitVec 32)) SeekEntryResult!10606)

(assert (=> b!1402686 (= lt!617969 (seekKeyOrZeroReturnVacant!0 (x!126425 lt!617964) (index!44803 lt!617964) (index!44803 lt!617964) (select (arr!46289 a!2901) j!112) lt!617966 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95877 (_ BitVec 32)) SeekEntryResult!10606)

(assert (=> b!1402686 (= lt!617969 (seekEntryOrOpen!0 lt!617965 lt!617966 mask!2840))))

(assert (=> b!1402686 (and (not (undefined!11418 lt!617964)) (= (index!44803 lt!617964) i!1037) (bvslt (x!126425 lt!617964) (x!126425 lt!617967)) (= (select (store (arr!46289 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44803 lt!617964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617973 () Unit!47216)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47216)

(assert (=> b!1402686 (= lt!617973 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617970 (x!126425 lt!617967) (index!44803 lt!617967) (x!126425 lt!617964) (index!44803 lt!617964) (undefined!11418 lt!617964) mask!2840))))

(declare-fun b!1402687 () Bool)

(declare-fun res!941202 () Bool)

(assert (=> b!1402687 (=> (not res!941202) (not e!794262))))

(assert (=> b!1402687 (= res!941202 (validKeyInArray!0 (select (arr!46289 a!2901) j!112)))))

(declare-fun b!1402688 () Bool)

(declare-fun res!941200 () Bool)

(assert (=> b!1402688 (=> (not res!941200) (not e!794262))))

(declare-datatypes ((List!32808 0))(
  ( (Nil!32805) (Cons!32804 (h!34052 (_ BitVec 64)) (t!47502 List!32808)) )
))
(declare-fun arrayNoDuplicates!0 (array!95877 (_ BitVec 32) List!32808) Bool)

(assert (=> b!1402688 (= res!941200 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32805))))

(declare-fun b!1402689 () Bool)

(assert (=> b!1402689 (= e!794262 (not e!794263))))

(declare-fun res!941196 () Bool)

(assert (=> b!1402689 (=> res!941196 e!794263)))

(assert (=> b!1402689 (= res!941196 (or (not (is-Intermediate!10606 lt!617967)) (undefined!11418 lt!617967)))))

(assert (=> b!1402689 (= lt!617972 (Found!10606 j!112))))

(assert (=> b!1402689 (= lt!617972 (seekEntryOrOpen!0 (select (arr!46289 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95877 (_ BitVec 32)) Bool)

(assert (=> b!1402689 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617968 () Unit!47216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47216)

(assert (=> b!1402689 (= lt!617968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402689 (= lt!617967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617970 (select (arr!46289 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402689 (= lt!617970 (toIndex!0 (select (arr!46289 a!2901) j!112) mask!2840))))

(declare-fun b!1402690 () Bool)

(declare-fun res!941197 () Bool)

(assert (=> b!1402690 (=> res!941197 e!794260)))

(assert (=> b!1402690 (= res!941197 (not (= lt!617964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617970 lt!617965 lt!617966 mask!2840))))))

(declare-fun b!1402691 () Bool)

(declare-fun res!941198 () Bool)

(assert (=> b!1402691 (=> (not res!941198) (not e!794262))))

(assert (=> b!1402691 (= res!941198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402692 () Bool)

(declare-fun res!941201 () Bool)

(assert (=> b!1402692 (=> (not res!941201) (not e!794262))))

(assert (=> b!1402692 (= res!941201 (and (= (size!46839 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46839 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46839 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120468 res!941199) b!1402692))

(assert (= (and b!1402692 res!941201) b!1402683))

(assert (= (and b!1402683 res!941203) b!1402687))

(assert (= (and b!1402687 res!941202) b!1402691))

(assert (= (and b!1402691 res!941198) b!1402688))

(assert (= (and b!1402688 res!941200) b!1402689))

(assert (= (and b!1402689 (not res!941196)) b!1402685))

(assert (= (and b!1402685 (not res!941194)) b!1402686))

(assert (= (and b!1402686 (not res!941195)) b!1402690))

(assert (= (and b!1402690 (not res!941197)) b!1402684))

(declare-fun m!1290975 () Bool)

(assert (=> b!1402688 m!1290975))

(declare-fun m!1290977 () Bool)

(assert (=> b!1402687 m!1290977))

(assert (=> b!1402687 m!1290977))

(declare-fun m!1290979 () Bool)

(assert (=> b!1402687 m!1290979))

(declare-fun m!1290981 () Bool)

(assert (=> b!1402691 m!1290981))

(assert (=> b!1402689 m!1290977))

(declare-fun m!1290983 () Bool)

(assert (=> b!1402689 m!1290983))

(assert (=> b!1402689 m!1290977))

(assert (=> b!1402689 m!1290977))

(declare-fun m!1290985 () Bool)

(assert (=> b!1402689 m!1290985))

(declare-fun m!1290987 () Bool)

(assert (=> b!1402689 m!1290987))

(assert (=> b!1402689 m!1290977))

(declare-fun m!1290989 () Bool)

(assert (=> b!1402689 m!1290989))

(declare-fun m!1290991 () Bool)

(assert (=> b!1402689 m!1290991))

(declare-fun m!1290993 () Bool)

(assert (=> start!120468 m!1290993))

(declare-fun m!1290995 () Bool)

(assert (=> start!120468 m!1290995))

(declare-fun m!1290997 () Bool)

(assert (=> b!1402685 m!1290997))

(assert (=> b!1402685 m!1290997))

(declare-fun m!1290999 () Bool)

(assert (=> b!1402685 m!1290999))

(declare-fun m!1291001 () Bool)

(assert (=> b!1402685 m!1291001))

(declare-fun m!1291003 () Bool)

(assert (=> b!1402685 m!1291003))

(declare-fun m!1291005 () Bool)

(assert (=> b!1402683 m!1291005))

(assert (=> b!1402683 m!1291005))

(declare-fun m!1291007 () Bool)

(assert (=> b!1402683 m!1291007))

(declare-fun m!1291009 () Bool)

(assert (=> b!1402684 m!1291009))

(declare-fun m!1291011 () Bool)

(assert (=> b!1402690 m!1291011))

(declare-fun m!1291013 () Bool)

(assert (=> b!1402686 m!1291013))

(assert (=> b!1402686 m!1290977))

(assert (=> b!1402686 m!1290977))

(declare-fun m!1291015 () Bool)

(assert (=> b!1402686 m!1291015))

(declare-fun m!1291017 () Bool)

(assert (=> b!1402686 m!1291017))

(declare-fun m!1291019 () Bool)

(assert (=> b!1402686 m!1291019))

(assert (=> b!1402686 m!1291001))

(push 1)

