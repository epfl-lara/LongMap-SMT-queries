; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119996 () Bool)

(assert start!119996)

(declare-fun res!935850 () Bool)

(declare-fun e!790827 () Bool)

(assert (=> start!119996 (=> (not res!935850) (not e!790827))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119996 (= res!935850 (validMask!0 mask!2840))))

(assert (=> start!119996 e!790827))

(assert (=> start!119996 true))

(declare-datatypes ((array!95478 0))(
  ( (array!95479 (arr!46093 (Array (_ BitVec 32) (_ BitVec 64))) (size!46645 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95478)

(declare-fun array_inv!35326 (array!95478) Bool)

(assert (=> start!119996 (array_inv!35326 a!2901)))

(declare-fun b!1396879 () Bool)

(declare-fun e!790825 () Bool)

(declare-fun e!790826 () Bool)

(assert (=> b!1396879 (= e!790825 e!790826)))

(declare-fun res!935851 () Bool)

(assert (=> b!1396879 (=> res!935851 e!790826)))

(declare-fun lt!613643 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10436 0))(
  ( (MissingZero!10436 (index!44115 (_ BitVec 32))) (Found!10436 (index!44116 (_ BitVec 32))) (Intermediate!10436 (undefined!11248 Bool) (index!44117 (_ BitVec 32)) (x!125775 (_ BitVec 32))) (Undefined!10436) (MissingVacant!10436 (index!44118 (_ BitVec 32))) )
))
(declare-fun lt!613645 () SeekEntryResult!10436)

(declare-fun lt!613640 () SeekEntryResult!10436)

(get-info :version)

(assert (=> b!1396879 (= res!935851 (or (= lt!613640 lt!613645) (not ((_ is Intermediate!10436) lt!613645)) (bvslt (x!125775 lt!613640) #b00000000000000000000000000000000) (bvsgt (x!125775 lt!613640) #b01111111111111111111111111111110) (bvslt lt!613643 #b00000000000000000000000000000000) (bvsge lt!613643 (size!46645 a!2901)) (bvslt (index!44117 lt!613640) #b00000000000000000000000000000000) (bvsge (index!44117 lt!613640) (size!46645 a!2901)) (not (= lt!613640 (Intermediate!10436 false (index!44117 lt!613640) (x!125775 lt!613640)))) (not (= lt!613645 (Intermediate!10436 (undefined!11248 lt!613645) (index!44117 lt!613645) (x!125775 lt!613645))))))))

(declare-fun lt!613644 () (_ BitVec 64))

(declare-fun lt!613641 () array!95478)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396879 (= lt!613645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613644 mask!2840) lt!613644 lt!613641 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396879 (= lt!613644 (select (store (arr!46093 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396879 (= lt!613641 (array!95479 (store (arr!46093 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46645 a!2901)))))

(declare-fun b!1396880 () Bool)

(assert (=> b!1396880 (= e!790826 true)))

(declare-fun lt!613642 () SeekEntryResult!10436)

(assert (=> b!1396880 (= lt!613642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613643 lt!613644 lt!613641 mask!2840))))

(declare-fun b!1396881 () Bool)

(declare-fun res!935843 () Bool)

(assert (=> b!1396881 (=> (not res!935843) (not e!790827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396881 (= res!935843 (validKeyInArray!0 (select (arr!46093 a!2901) j!112)))))

(declare-fun b!1396882 () Bool)

(declare-fun res!935848 () Bool)

(assert (=> b!1396882 (=> (not res!935848) (not e!790827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95478 (_ BitVec 32)) Bool)

(assert (=> b!1396882 (= res!935848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396883 () Bool)

(assert (=> b!1396883 (= e!790827 (not e!790825))))

(declare-fun res!935847 () Bool)

(assert (=> b!1396883 (=> res!935847 e!790825)))

(assert (=> b!1396883 (= res!935847 (or (not ((_ is Intermediate!10436) lt!613640)) (undefined!11248 lt!613640)))))

(declare-fun e!790828 () Bool)

(assert (=> b!1396883 e!790828))

(declare-fun res!935845 () Bool)

(assert (=> b!1396883 (=> (not res!935845) (not e!790828))))

(assert (=> b!1396883 (= res!935845 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46719 0))(
  ( (Unit!46720) )
))
(declare-fun lt!613646 () Unit!46719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46719)

(assert (=> b!1396883 (= lt!613646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396883 (= lt!613640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613643 (select (arr!46093 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396883 (= lt!613643 (toIndex!0 (select (arr!46093 a!2901) j!112) mask!2840))))

(declare-fun b!1396884 () Bool)

(declare-fun res!935844 () Bool)

(assert (=> b!1396884 (=> (not res!935844) (not e!790827))))

(assert (=> b!1396884 (= res!935844 (validKeyInArray!0 (select (arr!46093 a!2901) i!1037)))))

(declare-fun b!1396885 () Bool)

(declare-fun res!935849 () Bool)

(assert (=> b!1396885 (=> (not res!935849) (not e!790827))))

(declare-datatypes ((List!32690 0))(
  ( (Nil!32687) (Cons!32686 (h!33928 (_ BitVec 64)) (t!47376 List!32690)) )
))
(declare-fun arrayNoDuplicates!0 (array!95478 (_ BitVec 32) List!32690) Bool)

(assert (=> b!1396885 (= res!935849 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32687))))

(declare-fun b!1396886 () Bool)

(declare-fun res!935846 () Bool)

(assert (=> b!1396886 (=> (not res!935846) (not e!790827))))

(assert (=> b!1396886 (= res!935846 (and (= (size!46645 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46645 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46645 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396887 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10436)

(assert (=> b!1396887 (= e!790828 (= (seekEntryOrOpen!0 (select (arr!46093 a!2901) j!112) a!2901 mask!2840) (Found!10436 j!112)))))

(assert (= (and start!119996 res!935850) b!1396886))

(assert (= (and b!1396886 res!935846) b!1396884))

(assert (= (and b!1396884 res!935844) b!1396881))

(assert (= (and b!1396881 res!935843) b!1396882))

(assert (= (and b!1396882 res!935848) b!1396885))

(assert (= (and b!1396885 res!935849) b!1396883))

(assert (= (and b!1396883 res!935845) b!1396887))

(assert (= (and b!1396883 (not res!935847)) b!1396879))

(assert (= (and b!1396879 (not res!935851)) b!1396880))

(declare-fun m!1283035 () Bool)

(assert (=> start!119996 m!1283035))

(declare-fun m!1283037 () Bool)

(assert (=> start!119996 m!1283037))

(declare-fun m!1283039 () Bool)

(assert (=> b!1396880 m!1283039))

(declare-fun m!1283041 () Bool)

(assert (=> b!1396879 m!1283041))

(assert (=> b!1396879 m!1283041))

(declare-fun m!1283043 () Bool)

(assert (=> b!1396879 m!1283043))

(declare-fun m!1283045 () Bool)

(assert (=> b!1396879 m!1283045))

(declare-fun m!1283047 () Bool)

(assert (=> b!1396879 m!1283047))

(declare-fun m!1283049 () Bool)

(assert (=> b!1396883 m!1283049))

(declare-fun m!1283051 () Bool)

(assert (=> b!1396883 m!1283051))

(assert (=> b!1396883 m!1283049))

(declare-fun m!1283053 () Bool)

(assert (=> b!1396883 m!1283053))

(declare-fun m!1283055 () Bool)

(assert (=> b!1396883 m!1283055))

(assert (=> b!1396883 m!1283049))

(declare-fun m!1283057 () Bool)

(assert (=> b!1396883 m!1283057))

(declare-fun m!1283059 () Bool)

(assert (=> b!1396885 m!1283059))

(assert (=> b!1396881 m!1283049))

(assert (=> b!1396881 m!1283049))

(declare-fun m!1283061 () Bool)

(assert (=> b!1396881 m!1283061))

(assert (=> b!1396887 m!1283049))

(assert (=> b!1396887 m!1283049))

(declare-fun m!1283063 () Bool)

(assert (=> b!1396887 m!1283063))

(declare-fun m!1283065 () Bool)

(assert (=> b!1396884 m!1283065))

(assert (=> b!1396884 m!1283065))

(declare-fun m!1283067 () Bool)

(assert (=> b!1396884 m!1283067))

(declare-fun m!1283069 () Bool)

(assert (=> b!1396882 m!1283069))

(check-sat (not b!1396884) (not b!1396880) (not b!1396881) (not b!1396883) (not b!1396885) (not b!1396879) (not b!1396887) (not b!1396882) (not start!119996))
(check-sat)
