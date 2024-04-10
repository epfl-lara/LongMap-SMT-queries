; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120002 () Bool)

(assert start!120002)

(declare-fun b!1396987 () Bool)

(declare-fun e!790882 () Bool)

(declare-fun e!790879 () Bool)

(assert (=> b!1396987 (= e!790882 e!790879)))

(declare-fun res!935908 () Bool)

(assert (=> b!1396987 (=> res!935908 e!790879)))

(declare-fun lt!613851 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10436 0))(
  ( (MissingZero!10436 (index!44115 (_ BitVec 32))) (Found!10436 (index!44116 (_ BitVec 32))) (Intermediate!10436 (undefined!11248 Bool) (index!44117 (_ BitVec 32)) (x!125778 (_ BitVec 32))) (Undefined!10436) (MissingVacant!10436 (index!44118 (_ BitVec 32))) )
))
(declare-fun lt!613857 () SeekEntryResult!10436)

(declare-fun lt!613852 () SeekEntryResult!10436)

(declare-datatypes ((array!95531 0))(
  ( (array!95532 (arr!46119 (Array (_ BitVec 32) (_ BitVec 64))) (size!46669 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95531)

(get-info :version)

(assert (=> b!1396987 (= res!935908 (or (= lt!613857 lt!613852) (not ((_ is Intermediate!10436) lt!613852)) (bvslt (x!125778 lt!613857) #b00000000000000000000000000000000) (bvsgt (x!125778 lt!613857) #b01111111111111111111111111111110) (bvslt lt!613851 #b00000000000000000000000000000000) (bvsge lt!613851 (size!46669 a!2901)) (bvslt (index!44117 lt!613857) #b00000000000000000000000000000000) (bvsge (index!44117 lt!613857) (size!46669 a!2901)) (not (= lt!613857 (Intermediate!10436 false (index!44117 lt!613857) (x!125778 lt!613857)))) (not (= lt!613852 (Intermediate!10436 (undefined!11248 lt!613852) (index!44117 lt!613852) (x!125778 lt!613852))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613856 () array!95531)

(declare-fun lt!613853 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95531 (_ BitVec 32)) SeekEntryResult!10436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396987 (= lt!613852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613853 mask!2840) lt!613853 lt!613856 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396987 (= lt!613853 (select (store (arr!46119 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396987 (= lt!613856 (array!95532 (store (arr!46119 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46669 a!2901)))))

(declare-fun b!1396988 () Bool)

(declare-fun res!935901 () Bool)

(declare-fun e!790880 () Bool)

(assert (=> b!1396988 (=> (not res!935901) (not e!790880))))

(assert (=> b!1396988 (= res!935901 (and (= (size!46669 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46669 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46669 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396989 () Bool)

(declare-fun res!935902 () Bool)

(assert (=> b!1396989 (=> (not res!935902) (not e!790880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396989 (= res!935902 (validKeyInArray!0 (select (arr!46119 a!2901) j!112)))))

(declare-fun b!1396990 () Bool)

(declare-fun res!935900 () Bool)

(assert (=> b!1396990 (=> (not res!935900) (not e!790880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95531 (_ BitVec 32)) Bool)

(assert (=> b!1396990 (= res!935900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396991 () Bool)

(assert (=> b!1396991 (= e!790879 true)))

(declare-fun lt!613855 () SeekEntryResult!10436)

(assert (=> b!1396991 (= lt!613855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613851 lt!613853 lt!613856 mask!2840))))

(declare-fun b!1396992 () Bool)

(declare-fun res!935903 () Bool)

(assert (=> b!1396992 (=> (not res!935903) (not e!790880))))

(assert (=> b!1396992 (= res!935903 (validKeyInArray!0 (select (arr!46119 a!2901) i!1037)))))

(declare-fun res!935906 () Bool)

(assert (=> start!120002 (=> (not res!935906) (not e!790880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120002 (= res!935906 (validMask!0 mask!2840))))

(assert (=> start!120002 e!790880))

(assert (=> start!120002 true))

(declare-fun array_inv!35147 (array!95531) Bool)

(assert (=> start!120002 (array_inv!35147 a!2901)))

(declare-fun e!790883 () Bool)

(declare-fun b!1396993 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95531 (_ BitVec 32)) SeekEntryResult!10436)

(assert (=> b!1396993 (= e!790883 (= (seekEntryOrOpen!0 (select (arr!46119 a!2901) j!112) a!2901 mask!2840) (Found!10436 j!112)))))

(declare-fun b!1396994 () Bool)

(declare-fun res!935905 () Bool)

(assert (=> b!1396994 (=> (not res!935905) (not e!790880))))

(declare-datatypes ((List!32638 0))(
  ( (Nil!32635) (Cons!32634 (h!33876 (_ BitVec 64)) (t!47332 List!32638)) )
))
(declare-fun arrayNoDuplicates!0 (array!95531 (_ BitVec 32) List!32638) Bool)

(assert (=> b!1396994 (= res!935905 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32635))))

(declare-fun b!1396995 () Bool)

(assert (=> b!1396995 (= e!790880 (not e!790882))))

(declare-fun res!935904 () Bool)

(assert (=> b!1396995 (=> res!935904 e!790882)))

(assert (=> b!1396995 (= res!935904 (or (not ((_ is Intermediate!10436) lt!613857)) (undefined!11248 lt!613857)))))

(assert (=> b!1396995 e!790883))

(declare-fun res!935907 () Bool)

(assert (=> b!1396995 (=> (not res!935907) (not e!790883))))

(assert (=> b!1396995 (= res!935907 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46876 0))(
  ( (Unit!46877) )
))
(declare-fun lt!613854 () Unit!46876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46876)

(assert (=> b!1396995 (= lt!613854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396995 (= lt!613857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613851 (select (arr!46119 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396995 (= lt!613851 (toIndex!0 (select (arr!46119 a!2901) j!112) mask!2840))))

(assert (= (and start!120002 res!935906) b!1396988))

(assert (= (and b!1396988 res!935901) b!1396992))

(assert (= (and b!1396992 res!935903) b!1396989))

(assert (= (and b!1396989 res!935902) b!1396990))

(assert (= (and b!1396990 res!935900) b!1396994))

(assert (= (and b!1396994 res!935905) b!1396995))

(assert (= (and b!1396995 res!935907) b!1396993))

(assert (= (and b!1396995 (not res!935904)) b!1396987))

(assert (= (and b!1396987 (not res!935908)) b!1396991))

(declare-fun m!1283607 () Bool)

(assert (=> b!1396989 m!1283607))

(assert (=> b!1396989 m!1283607))

(declare-fun m!1283609 () Bool)

(assert (=> b!1396989 m!1283609))

(declare-fun m!1283611 () Bool)

(assert (=> b!1396990 m!1283611))

(assert (=> b!1396993 m!1283607))

(assert (=> b!1396993 m!1283607))

(declare-fun m!1283613 () Bool)

(assert (=> b!1396993 m!1283613))

(declare-fun m!1283615 () Bool)

(assert (=> start!120002 m!1283615))

(declare-fun m!1283617 () Bool)

(assert (=> start!120002 m!1283617))

(declare-fun m!1283619 () Bool)

(assert (=> b!1396987 m!1283619))

(assert (=> b!1396987 m!1283619))

(declare-fun m!1283621 () Bool)

(assert (=> b!1396987 m!1283621))

(declare-fun m!1283623 () Bool)

(assert (=> b!1396987 m!1283623))

(declare-fun m!1283625 () Bool)

(assert (=> b!1396987 m!1283625))

(declare-fun m!1283627 () Bool)

(assert (=> b!1396991 m!1283627))

(declare-fun m!1283629 () Bool)

(assert (=> b!1396992 m!1283629))

(assert (=> b!1396992 m!1283629))

(declare-fun m!1283631 () Bool)

(assert (=> b!1396992 m!1283631))

(declare-fun m!1283633 () Bool)

(assert (=> b!1396994 m!1283633))

(assert (=> b!1396995 m!1283607))

(declare-fun m!1283635 () Bool)

(assert (=> b!1396995 m!1283635))

(assert (=> b!1396995 m!1283607))

(assert (=> b!1396995 m!1283607))

(declare-fun m!1283637 () Bool)

(assert (=> b!1396995 m!1283637))

(declare-fun m!1283639 () Bool)

(assert (=> b!1396995 m!1283639))

(declare-fun m!1283641 () Bool)

(assert (=> b!1396995 m!1283641))

(check-sat (not start!120002) (not b!1396993) (not b!1396995) (not b!1396992) (not b!1396994) (not b!1396990) (not b!1396991) (not b!1396987) (not b!1396989))
(check-sat)
