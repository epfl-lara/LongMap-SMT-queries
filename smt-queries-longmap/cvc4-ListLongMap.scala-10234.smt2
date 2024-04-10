; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120460 () Bool)

(assert start!120460)

(declare-fun b!1402563 () Bool)

(declare-fun e!794204 () Bool)

(declare-fun e!794203 () Bool)

(assert (=> b!1402563 (= e!794204 e!794203)))

(declare-fun res!941079 () Bool)

(assert (=> b!1402563 (=> res!941079 e!794203)))

(declare-datatypes ((array!95869 0))(
  ( (array!95870 (arr!46285 (Array (_ BitVec 32) (_ BitVec 64))) (size!46835 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95869)

(declare-fun lt!617844 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10602 0))(
  ( (MissingZero!10602 (index!44785 (_ BitVec 32))) (Found!10602 (index!44786 (_ BitVec 32))) (Intermediate!10602 (undefined!11414 Bool) (index!44787 (_ BitVec 32)) (x!126405 (_ BitVec 32))) (Undefined!10602) (MissingVacant!10602 (index!44788 (_ BitVec 32))) )
))
(declare-fun lt!617851 () SeekEntryResult!10602)

(declare-fun lt!617852 () SeekEntryResult!10602)

(assert (=> b!1402563 (= res!941079 (or (bvslt (x!126405 lt!617852) #b00000000000000000000000000000000) (bvsgt (x!126405 lt!617852) #b01111111111111111111111111111110) (bvslt (x!126405 lt!617851) #b00000000000000000000000000000000) (bvsgt (x!126405 lt!617851) #b01111111111111111111111111111110) (bvslt lt!617844 #b00000000000000000000000000000000) (bvsge lt!617844 (size!46835 a!2901)) (bvslt (index!44787 lt!617852) #b00000000000000000000000000000000) (bvsge (index!44787 lt!617852) (size!46835 a!2901)) (bvslt (index!44787 lt!617851) #b00000000000000000000000000000000) (bvsge (index!44787 lt!617851) (size!46835 a!2901)) (not (= lt!617852 (Intermediate!10602 false (index!44787 lt!617852) (x!126405 lt!617852)))) (not (= lt!617851 (Intermediate!10602 false (index!44787 lt!617851) (x!126405 lt!617851))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617845 () SeekEntryResult!10602)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!617849 () array!95869)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95869 (_ BitVec 32)) SeekEntryResult!10602)

(assert (=> b!1402563 (= lt!617845 (seekKeyOrZeroReturnVacant!0 (x!126405 lt!617851) (index!44787 lt!617851) (index!44787 lt!617851) (select (arr!46285 a!2901) j!112) lt!617849 mask!2840))))

(declare-fun lt!617853 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95869 (_ BitVec 32)) SeekEntryResult!10602)

(assert (=> b!1402563 (= lt!617845 (seekEntryOrOpen!0 lt!617853 lt!617849 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402563 (and (not (undefined!11414 lt!617851)) (= (index!44787 lt!617851) i!1037) (bvslt (x!126405 lt!617851) (x!126405 lt!617852)) (= (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44787 lt!617851)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47208 0))(
  ( (Unit!47209) )
))
(declare-fun lt!617847 () Unit!47208)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47208)

(assert (=> b!1402563 (= lt!617847 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617844 (x!126405 lt!617852) (index!44787 lt!617852) (x!126405 lt!617851) (index!44787 lt!617851) (undefined!11414 lt!617851) mask!2840))))

(declare-fun b!1402564 () Bool)

(declare-fun res!941077 () Bool)

(declare-fun e!794200 () Bool)

(assert (=> b!1402564 (=> (not res!941077) (not e!794200))))

(assert (=> b!1402564 (= res!941077 (and (= (size!46835 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46835 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46835 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941082 () Bool)

(assert (=> start!120460 (=> (not res!941082) (not e!794200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120460 (= res!941082 (validMask!0 mask!2840))))

(assert (=> start!120460 e!794200))

(assert (=> start!120460 true))

(declare-fun array_inv!35313 (array!95869) Bool)

(assert (=> start!120460 (array_inv!35313 a!2901)))

(declare-fun b!1402565 () Bool)

(assert (=> b!1402565 (= e!794203 true)))

(declare-fun lt!617848 () SeekEntryResult!10602)

(assert (=> b!1402565 (= lt!617848 lt!617845)))

(declare-fun lt!617846 () Unit!47208)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47208)

(assert (=> b!1402565 (= lt!617846 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617844 (x!126405 lt!617852) (index!44787 lt!617852) (x!126405 lt!617851) (index!44787 lt!617851) mask!2840))))

(declare-fun b!1402566 () Bool)

(declare-fun res!941080 () Bool)

(assert (=> b!1402566 (=> res!941080 e!794203)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95869 (_ BitVec 32)) SeekEntryResult!10602)

(assert (=> b!1402566 (= res!941080 (not (= lt!617851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617844 lt!617853 lt!617849 mask!2840))))))

(declare-fun b!1402567 () Bool)

(declare-fun res!941078 () Bool)

(assert (=> b!1402567 (=> (not res!941078) (not e!794200))))

(declare-datatypes ((List!32804 0))(
  ( (Nil!32801) (Cons!32800 (h!34048 (_ BitVec 64)) (t!47498 List!32804)) )
))
(declare-fun arrayNoDuplicates!0 (array!95869 (_ BitVec 32) List!32804) Bool)

(assert (=> b!1402567 (= res!941078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32801))))

(declare-fun b!1402568 () Bool)

(declare-fun e!794202 () Bool)

(assert (=> b!1402568 (= e!794202 e!794204)))

(declare-fun res!941074 () Bool)

(assert (=> b!1402568 (=> res!941074 e!794204)))

(assert (=> b!1402568 (= res!941074 (or (= lt!617852 lt!617851) (not (is-Intermediate!10602 lt!617851))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402568 (= lt!617851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617853 mask!2840) lt!617853 lt!617849 mask!2840))))

(assert (=> b!1402568 (= lt!617853 (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402568 (= lt!617849 (array!95870 (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46835 a!2901)))))

(declare-fun b!1402569 () Bool)

(assert (=> b!1402569 (= e!794200 (not e!794202))))

(declare-fun res!941075 () Bool)

(assert (=> b!1402569 (=> res!941075 e!794202)))

(assert (=> b!1402569 (= res!941075 (or (not (is-Intermediate!10602 lt!617852)) (undefined!11414 lt!617852)))))

(assert (=> b!1402569 (= lt!617848 (Found!10602 j!112))))

(assert (=> b!1402569 (= lt!617848 (seekEntryOrOpen!0 (select (arr!46285 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95869 (_ BitVec 32)) Bool)

(assert (=> b!1402569 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617850 () Unit!47208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47208)

(assert (=> b!1402569 (= lt!617850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402569 (= lt!617852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617844 (select (arr!46285 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402569 (= lt!617844 (toIndex!0 (select (arr!46285 a!2901) j!112) mask!2840))))

(declare-fun b!1402570 () Bool)

(declare-fun res!941081 () Bool)

(assert (=> b!1402570 (=> (not res!941081) (not e!794200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402570 (= res!941081 (validKeyInArray!0 (select (arr!46285 a!2901) i!1037)))))

(declare-fun b!1402571 () Bool)

(declare-fun res!941076 () Bool)

(assert (=> b!1402571 (=> (not res!941076) (not e!794200))))

(assert (=> b!1402571 (= res!941076 (validKeyInArray!0 (select (arr!46285 a!2901) j!112)))))

(declare-fun b!1402572 () Bool)

(declare-fun res!941083 () Bool)

(assert (=> b!1402572 (=> (not res!941083) (not e!794200))))

(assert (=> b!1402572 (= res!941083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120460 res!941082) b!1402564))

(assert (= (and b!1402564 res!941077) b!1402570))

(assert (= (and b!1402570 res!941081) b!1402571))

(assert (= (and b!1402571 res!941076) b!1402572))

(assert (= (and b!1402572 res!941083) b!1402567))

(assert (= (and b!1402567 res!941078) b!1402569))

(assert (= (and b!1402569 (not res!941075)) b!1402568))

(assert (= (and b!1402568 (not res!941074)) b!1402563))

(assert (= (and b!1402563 (not res!941079)) b!1402566))

(assert (= (and b!1402566 (not res!941080)) b!1402565))

(declare-fun m!1290791 () Bool)

(assert (=> b!1402565 m!1290791))

(declare-fun m!1290793 () Bool)

(assert (=> b!1402571 m!1290793))

(assert (=> b!1402571 m!1290793))

(declare-fun m!1290795 () Bool)

(assert (=> b!1402571 m!1290795))

(declare-fun m!1290797 () Bool)

(assert (=> b!1402568 m!1290797))

(assert (=> b!1402568 m!1290797))

(declare-fun m!1290799 () Bool)

(assert (=> b!1402568 m!1290799))

(declare-fun m!1290801 () Bool)

(assert (=> b!1402568 m!1290801))

(declare-fun m!1290803 () Bool)

(assert (=> b!1402568 m!1290803))

(declare-fun m!1290805 () Bool)

(assert (=> b!1402563 m!1290805))

(declare-fun m!1290807 () Bool)

(assert (=> b!1402563 m!1290807))

(assert (=> b!1402563 m!1290793))

(declare-fun m!1290809 () Bool)

(assert (=> b!1402563 m!1290809))

(assert (=> b!1402563 m!1290801))

(declare-fun m!1290811 () Bool)

(assert (=> b!1402563 m!1290811))

(assert (=> b!1402563 m!1290793))

(assert (=> b!1402569 m!1290793))

(declare-fun m!1290813 () Bool)

(assert (=> b!1402569 m!1290813))

(assert (=> b!1402569 m!1290793))

(declare-fun m!1290815 () Bool)

(assert (=> b!1402569 m!1290815))

(assert (=> b!1402569 m!1290793))

(declare-fun m!1290817 () Bool)

(assert (=> b!1402569 m!1290817))

(assert (=> b!1402569 m!1290793))

(declare-fun m!1290819 () Bool)

(assert (=> b!1402569 m!1290819))

(declare-fun m!1290821 () Bool)

(assert (=> b!1402569 m!1290821))

(declare-fun m!1290823 () Bool)

(assert (=> b!1402572 m!1290823))

(declare-fun m!1290825 () Bool)

(assert (=> b!1402567 m!1290825))

(declare-fun m!1290827 () Bool)

(assert (=> start!120460 m!1290827))

(declare-fun m!1290829 () Bool)

(assert (=> start!120460 m!1290829))

(declare-fun m!1290831 () Bool)

(assert (=> b!1402566 m!1290831))

(declare-fun m!1290833 () Bool)

(assert (=> b!1402570 m!1290833))

(assert (=> b!1402570 m!1290833))

(declare-fun m!1290835 () Bool)

(assert (=> b!1402570 m!1290835))

(push 1)

