; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120464 () Bool)

(assert start!120464)

(declare-fun b!1402624 () Bool)

(declare-fun res!941134 () Bool)

(declare-fun e!794234 () Bool)

(assert (=> b!1402624 (=> (not res!941134) (not e!794234))))

(declare-datatypes ((array!95873 0))(
  ( (array!95874 (arr!46287 (Array (_ BitVec 32) (_ BitVec 64))) (size!46837 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95873)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402624 (= res!941134 (validKeyInArray!0 (select (arr!46287 a!2901) j!112)))))

(declare-fun b!1402625 () Bool)

(declare-fun res!941137 () Bool)

(assert (=> b!1402625 (=> (not res!941137) (not e!794234))))

(declare-datatypes ((List!32806 0))(
  ( (Nil!32803) (Cons!32802 (h!34050 (_ BitVec 64)) (t!47500 List!32806)) )
))
(declare-fun arrayNoDuplicates!0 (array!95873 (_ BitVec 32) List!32806) Bool)

(assert (=> b!1402625 (= res!941137 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32803))))

(declare-fun b!1402626 () Bool)

(declare-fun e!794232 () Bool)

(assert (=> b!1402626 (= e!794232 true)))

(declare-datatypes ((SeekEntryResult!10604 0))(
  ( (MissingZero!10604 (index!44793 (_ BitVec 32))) (Found!10604 (index!44794 (_ BitVec 32))) (Intermediate!10604 (undefined!11416 Bool) (index!44795 (_ BitVec 32)) (x!126415 (_ BitVec 32))) (Undefined!10604) (MissingVacant!10604 (index!44796 (_ BitVec 32))) )
))
(declare-fun lt!617909 () SeekEntryResult!10604)

(declare-fun lt!617908 () SeekEntryResult!10604)

(assert (=> b!1402626 (= lt!617909 lt!617908)))

(declare-fun lt!617906 () SeekEntryResult!10604)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617907 () (_ BitVec 32))

(declare-fun lt!617913 () SeekEntryResult!10604)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((Unit!47212 0))(
  ( (Unit!47213) )
))
(declare-fun lt!617911 () Unit!47212)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47212)

(assert (=> b!1402626 (= lt!617911 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617907 (x!126415 lt!617913) (index!44795 lt!617913) (x!126415 lt!617906) (index!44795 lt!617906) mask!2840))))

(declare-fun b!1402627 () Bool)

(declare-fun res!941135 () Bool)

(assert (=> b!1402627 (=> (not res!941135) (not e!794234))))

(assert (=> b!1402627 (= res!941135 (validKeyInArray!0 (select (arr!46287 a!2901) i!1037)))))

(declare-fun b!1402628 () Bool)

(declare-fun res!941136 () Bool)

(assert (=> b!1402628 (=> (not res!941136) (not e!794234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95873 (_ BitVec 32)) Bool)

(assert (=> b!1402628 (= res!941136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402629 () Bool)

(declare-fun res!941141 () Bool)

(assert (=> b!1402629 (=> res!941141 e!794232)))

(declare-fun lt!617904 () (_ BitVec 64))

(declare-fun lt!617905 () array!95873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402629 (= res!941141 (not (= lt!617906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617907 lt!617904 lt!617905 mask!2840))))))

(declare-fun b!1402630 () Bool)

(declare-fun e!794233 () Bool)

(declare-fun e!794230 () Bool)

(assert (=> b!1402630 (= e!794233 e!794230)))

(declare-fun res!941138 () Bool)

(assert (=> b!1402630 (=> res!941138 e!794230)))

(get-info :version)

(assert (=> b!1402630 (= res!941138 (or (= lt!617913 lt!617906) (not ((_ is Intermediate!10604) lt!617906))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402630 (= lt!617906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617904 mask!2840) lt!617904 lt!617905 mask!2840))))

(assert (=> b!1402630 (= lt!617904 (select (store (arr!46287 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402630 (= lt!617905 (array!95874 (store (arr!46287 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46837 a!2901)))))

(declare-fun b!1402623 () Bool)

(declare-fun res!941142 () Bool)

(assert (=> b!1402623 (=> (not res!941142) (not e!794234))))

(assert (=> b!1402623 (= res!941142 (and (= (size!46837 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46837 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46837 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941140 () Bool)

(assert (=> start!120464 (=> (not res!941140) (not e!794234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120464 (= res!941140 (validMask!0 mask!2840))))

(assert (=> start!120464 e!794234))

(assert (=> start!120464 true))

(declare-fun array_inv!35315 (array!95873) Bool)

(assert (=> start!120464 (array_inv!35315 a!2901)))

(declare-fun b!1402631 () Bool)

(assert (=> b!1402631 (= e!794234 (not e!794233))))

(declare-fun res!941139 () Bool)

(assert (=> b!1402631 (=> res!941139 e!794233)))

(assert (=> b!1402631 (= res!941139 (or (not ((_ is Intermediate!10604) lt!617913)) (undefined!11416 lt!617913)))))

(assert (=> b!1402631 (= lt!617909 (Found!10604 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402631 (= lt!617909 (seekEntryOrOpen!0 (select (arr!46287 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402631 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617912 () Unit!47212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47212)

(assert (=> b!1402631 (= lt!617912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402631 (= lt!617913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617907 (select (arr!46287 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402631 (= lt!617907 (toIndex!0 (select (arr!46287 a!2901) j!112) mask!2840))))

(declare-fun b!1402632 () Bool)

(assert (=> b!1402632 (= e!794230 e!794232)))

(declare-fun res!941143 () Bool)

(assert (=> b!1402632 (=> res!941143 e!794232)))

(assert (=> b!1402632 (= res!941143 (or (bvslt (x!126415 lt!617913) #b00000000000000000000000000000000) (bvsgt (x!126415 lt!617913) #b01111111111111111111111111111110) (bvslt (x!126415 lt!617906) #b00000000000000000000000000000000) (bvsgt (x!126415 lt!617906) #b01111111111111111111111111111110) (bvslt lt!617907 #b00000000000000000000000000000000) (bvsge lt!617907 (size!46837 a!2901)) (bvslt (index!44795 lt!617913) #b00000000000000000000000000000000) (bvsge (index!44795 lt!617913) (size!46837 a!2901)) (bvslt (index!44795 lt!617906) #b00000000000000000000000000000000) (bvsge (index!44795 lt!617906) (size!46837 a!2901)) (not (= lt!617913 (Intermediate!10604 false (index!44795 lt!617913) (x!126415 lt!617913)))) (not (= lt!617906 (Intermediate!10604 false (index!44795 lt!617906) (x!126415 lt!617906))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10604)

(assert (=> b!1402632 (= lt!617908 (seekKeyOrZeroReturnVacant!0 (x!126415 lt!617906) (index!44795 lt!617906) (index!44795 lt!617906) (select (arr!46287 a!2901) j!112) lt!617905 mask!2840))))

(assert (=> b!1402632 (= lt!617908 (seekEntryOrOpen!0 lt!617904 lt!617905 mask!2840))))

(assert (=> b!1402632 (and (not (undefined!11416 lt!617906)) (= (index!44795 lt!617906) i!1037) (bvslt (x!126415 lt!617906) (x!126415 lt!617913)) (= (select (store (arr!46287 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44795 lt!617906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617910 () Unit!47212)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47212)

(assert (=> b!1402632 (= lt!617910 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617907 (x!126415 lt!617913) (index!44795 lt!617913) (x!126415 lt!617906) (index!44795 lt!617906) (undefined!11416 lt!617906) mask!2840))))

(assert (= (and start!120464 res!941140) b!1402623))

(assert (= (and b!1402623 res!941142) b!1402627))

(assert (= (and b!1402627 res!941135) b!1402624))

(assert (= (and b!1402624 res!941134) b!1402628))

(assert (= (and b!1402628 res!941136) b!1402625))

(assert (= (and b!1402625 res!941137) b!1402631))

(assert (= (and b!1402631 (not res!941139)) b!1402630))

(assert (= (and b!1402630 (not res!941138)) b!1402632))

(assert (= (and b!1402632 (not res!941143)) b!1402629))

(assert (= (and b!1402629 (not res!941141)) b!1402626))

(declare-fun m!1290883 () Bool)

(assert (=> b!1402628 m!1290883))

(declare-fun m!1290885 () Bool)

(assert (=> b!1402627 m!1290885))

(assert (=> b!1402627 m!1290885))

(declare-fun m!1290887 () Bool)

(assert (=> b!1402627 m!1290887))

(declare-fun m!1290889 () Bool)

(assert (=> b!1402629 m!1290889))

(declare-fun m!1290891 () Bool)

(assert (=> start!120464 m!1290891))

(declare-fun m!1290893 () Bool)

(assert (=> start!120464 m!1290893))

(declare-fun m!1290895 () Bool)

(assert (=> b!1402630 m!1290895))

(assert (=> b!1402630 m!1290895))

(declare-fun m!1290897 () Bool)

(assert (=> b!1402630 m!1290897))

(declare-fun m!1290899 () Bool)

(assert (=> b!1402630 m!1290899))

(declare-fun m!1290901 () Bool)

(assert (=> b!1402630 m!1290901))

(declare-fun m!1290903 () Bool)

(assert (=> b!1402625 m!1290903))

(declare-fun m!1290905 () Bool)

(assert (=> b!1402624 m!1290905))

(assert (=> b!1402624 m!1290905))

(declare-fun m!1290907 () Bool)

(assert (=> b!1402624 m!1290907))

(assert (=> b!1402632 m!1290905))

(declare-fun m!1290909 () Bool)

(assert (=> b!1402632 m!1290909))

(declare-fun m!1290911 () Bool)

(assert (=> b!1402632 m!1290911))

(assert (=> b!1402632 m!1290905))

(declare-fun m!1290913 () Bool)

(assert (=> b!1402632 m!1290913))

(declare-fun m!1290915 () Bool)

(assert (=> b!1402632 m!1290915))

(assert (=> b!1402632 m!1290899))

(declare-fun m!1290917 () Bool)

(assert (=> b!1402626 m!1290917))

(assert (=> b!1402631 m!1290905))

(declare-fun m!1290919 () Bool)

(assert (=> b!1402631 m!1290919))

(assert (=> b!1402631 m!1290905))

(declare-fun m!1290921 () Bool)

(assert (=> b!1402631 m!1290921))

(assert (=> b!1402631 m!1290905))

(declare-fun m!1290923 () Bool)

(assert (=> b!1402631 m!1290923))

(assert (=> b!1402631 m!1290905))

(declare-fun m!1290925 () Bool)

(assert (=> b!1402631 m!1290925))

(declare-fun m!1290927 () Bool)

(assert (=> b!1402631 m!1290927))

(check-sat (not b!1402625) (not b!1402626) (not b!1402629) (not b!1402631) (not b!1402624) (not b!1402628) (not start!120464) (not b!1402627) (not b!1402630) (not b!1402632))
(check-sat)
