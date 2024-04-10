; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120462 () Bool)

(assert start!120462)

(declare-fun b!1402593 () Bool)

(declare-fun res!941109 () Bool)

(declare-fun e!794218 () Bool)

(assert (=> b!1402593 (=> (not res!941109) (not e!794218))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95871 0))(
  ( (array!95872 (arr!46286 (Array (_ BitVec 32) (_ BitVec 64))) (size!46836 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95871)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402593 (= res!941109 (and (= (size!46836 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46836 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46836 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402594 () Bool)

(declare-fun e!794217 () Bool)

(assert (=> b!1402594 (= e!794218 (not e!794217))))

(declare-fun res!941110 () Bool)

(assert (=> b!1402594 (=> res!941110 e!794217)))

(declare-datatypes ((SeekEntryResult!10603 0))(
  ( (MissingZero!10603 (index!44789 (_ BitVec 32))) (Found!10603 (index!44790 (_ BitVec 32))) (Intermediate!10603 (undefined!11415 Bool) (index!44791 (_ BitVec 32)) (x!126414 (_ BitVec 32))) (Undefined!10603) (MissingVacant!10603 (index!44792 (_ BitVec 32))) )
))
(declare-fun lt!617875 () SeekEntryResult!10603)

(assert (=> b!1402594 (= res!941110 (or (not (is-Intermediate!10603 lt!617875)) (undefined!11415 lt!617875)))))

(declare-fun lt!617877 () SeekEntryResult!10603)

(assert (=> b!1402594 (= lt!617877 (Found!10603 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95871 (_ BitVec 32)) SeekEntryResult!10603)

(assert (=> b!1402594 (= lt!617877 (seekEntryOrOpen!0 (select (arr!46286 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95871 (_ BitVec 32)) Bool)

(assert (=> b!1402594 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47210 0))(
  ( (Unit!47211) )
))
(declare-fun lt!617876 () Unit!47210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47210)

(assert (=> b!1402594 (= lt!617876 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617880 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95871 (_ BitVec 32)) SeekEntryResult!10603)

(assert (=> b!1402594 (= lt!617875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617880 (select (arr!46286 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402594 (= lt!617880 (toIndex!0 (select (arr!46286 a!2901) j!112) mask!2840))))

(declare-fun b!1402595 () Bool)

(declare-fun e!794216 () Bool)

(assert (=> b!1402595 (= e!794216 true)))

(declare-fun lt!617882 () SeekEntryResult!10603)

(assert (=> b!1402595 (= lt!617877 lt!617882)))

(declare-fun lt!617874 () Unit!47210)

(declare-fun lt!617878 () SeekEntryResult!10603)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47210)

(assert (=> b!1402595 (= lt!617874 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617880 (x!126414 lt!617875) (index!44791 lt!617875) (x!126414 lt!617878) (index!44791 lt!617878) mask!2840))))

(declare-fun b!1402596 () Bool)

(declare-fun res!941104 () Bool)

(assert (=> b!1402596 (=> (not res!941104) (not e!794218))))

(declare-datatypes ((List!32805 0))(
  ( (Nil!32802) (Cons!32801 (h!34049 (_ BitVec 64)) (t!47499 List!32805)) )
))
(declare-fun arrayNoDuplicates!0 (array!95871 (_ BitVec 32) List!32805) Bool)

(assert (=> b!1402596 (= res!941104 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32802))))

(declare-fun res!941107 () Bool)

(assert (=> start!120462 (=> (not res!941107) (not e!794218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120462 (= res!941107 (validMask!0 mask!2840))))

(assert (=> start!120462 e!794218))

(assert (=> start!120462 true))

(declare-fun array_inv!35314 (array!95871) Bool)

(assert (=> start!120462 (array_inv!35314 a!2901)))

(declare-fun b!1402597 () Bool)

(declare-fun e!794215 () Bool)

(assert (=> b!1402597 (= e!794215 e!794216)))

(declare-fun res!941108 () Bool)

(assert (=> b!1402597 (=> res!941108 e!794216)))

(assert (=> b!1402597 (= res!941108 (or (bvslt (x!126414 lt!617875) #b00000000000000000000000000000000) (bvsgt (x!126414 lt!617875) #b01111111111111111111111111111110) (bvslt (x!126414 lt!617878) #b00000000000000000000000000000000) (bvsgt (x!126414 lt!617878) #b01111111111111111111111111111110) (bvslt lt!617880 #b00000000000000000000000000000000) (bvsge lt!617880 (size!46836 a!2901)) (bvslt (index!44791 lt!617875) #b00000000000000000000000000000000) (bvsge (index!44791 lt!617875) (size!46836 a!2901)) (bvslt (index!44791 lt!617878) #b00000000000000000000000000000000) (bvsge (index!44791 lt!617878) (size!46836 a!2901)) (not (= lt!617875 (Intermediate!10603 false (index!44791 lt!617875) (x!126414 lt!617875)))) (not (= lt!617878 (Intermediate!10603 false (index!44791 lt!617878) (x!126414 lt!617878))))))))

(declare-fun lt!617883 () array!95871)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95871 (_ BitVec 32)) SeekEntryResult!10603)

(assert (=> b!1402597 (= lt!617882 (seekKeyOrZeroReturnVacant!0 (x!126414 lt!617878) (index!44791 lt!617878) (index!44791 lt!617878) (select (arr!46286 a!2901) j!112) lt!617883 mask!2840))))

(declare-fun lt!617879 () (_ BitVec 64))

(assert (=> b!1402597 (= lt!617882 (seekEntryOrOpen!0 lt!617879 lt!617883 mask!2840))))

(assert (=> b!1402597 (and (not (undefined!11415 lt!617878)) (= (index!44791 lt!617878) i!1037) (bvslt (x!126414 lt!617878) (x!126414 lt!617875)) (= (select (store (arr!46286 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44791 lt!617878)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617881 () Unit!47210)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47210)

(assert (=> b!1402597 (= lt!617881 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617880 (x!126414 lt!617875) (index!44791 lt!617875) (x!126414 lt!617878) (index!44791 lt!617878) (undefined!11415 lt!617878) mask!2840))))

(declare-fun b!1402598 () Bool)

(assert (=> b!1402598 (= e!794217 e!794215)))

(declare-fun res!941105 () Bool)

(assert (=> b!1402598 (=> res!941105 e!794215)))

(assert (=> b!1402598 (= res!941105 (or (= lt!617875 lt!617878) (not (is-Intermediate!10603 lt!617878))))))

(assert (=> b!1402598 (= lt!617878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617879 mask!2840) lt!617879 lt!617883 mask!2840))))

(assert (=> b!1402598 (= lt!617879 (select (store (arr!46286 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402598 (= lt!617883 (array!95872 (store (arr!46286 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46836 a!2901)))))

(declare-fun b!1402599 () Bool)

(declare-fun res!941111 () Bool)

(assert (=> b!1402599 (=> (not res!941111) (not e!794218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402599 (= res!941111 (validKeyInArray!0 (select (arr!46286 a!2901) i!1037)))))

(declare-fun b!1402600 () Bool)

(declare-fun res!941106 () Bool)

(assert (=> b!1402600 (=> res!941106 e!794216)))

(assert (=> b!1402600 (= res!941106 (not (= lt!617878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617880 lt!617879 lt!617883 mask!2840))))))

(declare-fun b!1402601 () Bool)

(declare-fun res!941112 () Bool)

(assert (=> b!1402601 (=> (not res!941112) (not e!794218))))

(assert (=> b!1402601 (= res!941112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402602 () Bool)

(declare-fun res!941113 () Bool)

(assert (=> b!1402602 (=> (not res!941113) (not e!794218))))

(assert (=> b!1402602 (= res!941113 (validKeyInArray!0 (select (arr!46286 a!2901) j!112)))))

(assert (= (and start!120462 res!941107) b!1402593))

(assert (= (and b!1402593 res!941109) b!1402599))

(assert (= (and b!1402599 res!941111) b!1402602))

(assert (= (and b!1402602 res!941113) b!1402601))

(assert (= (and b!1402601 res!941112) b!1402596))

(assert (= (and b!1402596 res!941104) b!1402594))

(assert (= (and b!1402594 (not res!941110)) b!1402598))

(assert (= (and b!1402598 (not res!941105)) b!1402597))

(assert (= (and b!1402597 (not res!941108)) b!1402600))

(assert (= (and b!1402600 (not res!941106)) b!1402595))

(declare-fun m!1290837 () Bool)

(assert (=> b!1402594 m!1290837))

(declare-fun m!1290839 () Bool)

(assert (=> b!1402594 m!1290839))

(assert (=> b!1402594 m!1290837))

(declare-fun m!1290841 () Bool)

(assert (=> b!1402594 m!1290841))

(assert (=> b!1402594 m!1290837))

(declare-fun m!1290843 () Bool)

(assert (=> b!1402594 m!1290843))

(assert (=> b!1402594 m!1290837))

(declare-fun m!1290845 () Bool)

(assert (=> b!1402594 m!1290845))

(declare-fun m!1290847 () Bool)

(assert (=> b!1402594 m!1290847))

(assert (=> b!1402602 m!1290837))

(assert (=> b!1402602 m!1290837))

(declare-fun m!1290849 () Bool)

(assert (=> b!1402602 m!1290849))

(declare-fun m!1290851 () Bool)

(assert (=> b!1402596 m!1290851))

(declare-fun m!1290853 () Bool)

(assert (=> b!1402601 m!1290853))

(declare-fun m!1290855 () Bool)

(assert (=> start!120462 m!1290855))

(declare-fun m!1290857 () Bool)

(assert (=> start!120462 m!1290857))

(declare-fun m!1290859 () Bool)

(assert (=> b!1402600 m!1290859))

(declare-fun m!1290861 () Bool)

(assert (=> b!1402597 m!1290861))

(assert (=> b!1402597 m!1290837))

(declare-fun m!1290863 () Bool)

(assert (=> b!1402597 m!1290863))

(assert (=> b!1402597 m!1290837))

(declare-fun m!1290865 () Bool)

(assert (=> b!1402597 m!1290865))

(declare-fun m!1290867 () Bool)

(assert (=> b!1402597 m!1290867))

(declare-fun m!1290869 () Bool)

(assert (=> b!1402597 m!1290869))

(declare-fun m!1290871 () Bool)

(assert (=> b!1402599 m!1290871))

(assert (=> b!1402599 m!1290871))

(declare-fun m!1290873 () Bool)

(assert (=> b!1402599 m!1290873))

(declare-fun m!1290875 () Bool)

(assert (=> b!1402598 m!1290875))

(assert (=> b!1402598 m!1290875))

(declare-fun m!1290877 () Bool)

(assert (=> b!1402598 m!1290877))

(assert (=> b!1402598 m!1290869))

(declare-fun m!1290879 () Bool)

(assert (=> b!1402598 m!1290879))

(declare-fun m!1290881 () Bool)

(assert (=> b!1402595 m!1290881))

(push 1)

