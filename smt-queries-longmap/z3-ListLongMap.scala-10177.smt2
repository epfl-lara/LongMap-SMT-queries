; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119990 () Bool)

(assert start!119990)

(declare-fun b!1396825 () Bool)

(declare-fun e!790789 () Bool)

(declare-fun e!790791 () Bool)

(assert (=> b!1396825 (= e!790789 e!790791)))

(declare-fun res!935741 () Bool)

(assert (=> b!1396825 (=> res!935741 e!790791)))

(declare-fun lt!613725 () (_ BitVec 32))

(declare-datatypes ((array!95519 0))(
  ( (array!95520 (arr!46113 (Array (_ BitVec 32) (_ BitVec 64))) (size!46663 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95519)

(declare-datatypes ((SeekEntryResult!10430 0))(
  ( (MissingZero!10430 (index!44091 (_ BitVec 32))) (Found!10430 (index!44092 (_ BitVec 32))) (Intermediate!10430 (undefined!11242 Bool) (index!44093 (_ BitVec 32)) (x!125756 (_ BitVec 32))) (Undefined!10430) (MissingVacant!10430 (index!44094 (_ BitVec 32))) )
))
(declare-fun lt!613730 () SeekEntryResult!10430)

(declare-fun lt!613726 () SeekEntryResult!10430)

(get-info :version)

(assert (=> b!1396825 (= res!935741 (or (= lt!613730 lt!613726) (not ((_ is Intermediate!10430) lt!613726)) (bvslt (x!125756 lt!613730) #b00000000000000000000000000000000) (bvsgt (x!125756 lt!613730) #b01111111111111111111111111111110) (bvslt lt!613725 #b00000000000000000000000000000000) (bvsge lt!613725 (size!46663 a!2901)) (bvslt (index!44093 lt!613730) #b00000000000000000000000000000000) (bvsge (index!44093 lt!613730) (size!46663 a!2901)) (not (= lt!613730 (Intermediate!10430 false (index!44093 lt!613730) (x!125756 lt!613730)))) (not (= lt!613726 (Intermediate!10430 (undefined!11242 lt!613726) (index!44093 lt!613726) (x!125756 lt!613726))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613729 () (_ BitVec 64))

(declare-fun lt!613727 () array!95519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95519 (_ BitVec 32)) SeekEntryResult!10430)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396825 (= lt!613726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613729 mask!2840) lt!613729 lt!613727 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396825 (= lt!613729 (select (store (arr!46113 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396825 (= lt!613727 (array!95520 (store (arr!46113 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46663 a!2901)))))

(declare-fun b!1396826 () Bool)

(assert (=> b!1396826 (= e!790791 true)))

(declare-fun lt!613731 () SeekEntryResult!10430)

(assert (=> b!1396826 (= lt!613731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613725 lt!613729 lt!613727 mask!2840))))

(declare-fun b!1396827 () Bool)

(declare-fun res!935743 () Bool)

(declare-fun e!790792 () Bool)

(assert (=> b!1396827 (=> (not res!935743) (not e!790792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396827 (= res!935743 (validKeyInArray!0 (select (arr!46113 a!2901) i!1037)))))

(declare-fun b!1396828 () Bool)

(declare-fun res!935746 () Bool)

(assert (=> b!1396828 (=> (not res!935746) (not e!790792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95519 (_ BitVec 32)) Bool)

(assert (=> b!1396828 (= res!935746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396829 () Bool)

(declare-fun e!790793 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95519 (_ BitVec 32)) SeekEntryResult!10430)

(assert (=> b!1396829 (= e!790793 (= (seekEntryOrOpen!0 (select (arr!46113 a!2901) j!112) a!2901 mask!2840) (Found!10430 j!112)))))

(declare-fun b!1396830 () Bool)

(declare-fun res!935742 () Bool)

(assert (=> b!1396830 (=> (not res!935742) (not e!790792))))

(declare-datatypes ((List!32632 0))(
  ( (Nil!32629) (Cons!32628 (h!33870 (_ BitVec 64)) (t!47326 List!32632)) )
))
(declare-fun arrayNoDuplicates!0 (array!95519 (_ BitVec 32) List!32632) Bool)

(assert (=> b!1396830 (= res!935742 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32629))))

(declare-fun b!1396831 () Bool)

(declare-fun res!935738 () Bool)

(assert (=> b!1396831 (=> (not res!935738) (not e!790792))))

(assert (=> b!1396831 (= res!935738 (validKeyInArray!0 (select (arr!46113 a!2901) j!112)))))

(declare-fun res!935744 () Bool)

(assert (=> start!119990 (=> (not res!935744) (not e!790792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119990 (= res!935744 (validMask!0 mask!2840))))

(assert (=> start!119990 e!790792))

(assert (=> start!119990 true))

(declare-fun array_inv!35141 (array!95519) Bool)

(assert (=> start!119990 (array_inv!35141 a!2901)))

(declare-fun b!1396832 () Bool)

(declare-fun res!935739 () Bool)

(assert (=> b!1396832 (=> (not res!935739) (not e!790792))))

(assert (=> b!1396832 (= res!935739 (and (= (size!46663 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46663 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46663 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396833 () Bool)

(assert (=> b!1396833 (= e!790792 (not e!790789))))

(declare-fun res!935740 () Bool)

(assert (=> b!1396833 (=> res!935740 e!790789)))

(assert (=> b!1396833 (= res!935740 (or (not ((_ is Intermediate!10430) lt!613730)) (undefined!11242 lt!613730)))))

(assert (=> b!1396833 e!790793))

(declare-fun res!935745 () Bool)

(assert (=> b!1396833 (=> (not res!935745) (not e!790793))))

(assert (=> b!1396833 (= res!935745 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46864 0))(
  ( (Unit!46865) )
))
(declare-fun lt!613728 () Unit!46864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46864)

(assert (=> b!1396833 (= lt!613728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396833 (= lt!613730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613725 (select (arr!46113 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396833 (= lt!613725 (toIndex!0 (select (arr!46113 a!2901) j!112) mask!2840))))

(assert (= (and start!119990 res!935744) b!1396832))

(assert (= (and b!1396832 res!935739) b!1396827))

(assert (= (and b!1396827 res!935743) b!1396831))

(assert (= (and b!1396831 res!935738) b!1396828))

(assert (= (and b!1396828 res!935746) b!1396830))

(assert (= (and b!1396830 res!935742) b!1396833))

(assert (= (and b!1396833 res!935745) b!1396829))

(assert (= (and b!1396833 (not res!935740)) b!1396825))

(assert (= (and b!1396825 (not res!935741)) b!1396826))

(declare-fun m!1283391 () Bool)

(assert (=> b!1396827 m!1283391))

(assert (=> b!1396827 m!1283391))

(declare-fun m!1283393 () Bool)

(assert (=> b!1396827 m!1283393))

(declare-fun m!1283395 () Bool)

(assert (=> b!1396828 m!1283395))

(declare-fun m!1283397 () Bool)

(assert (=> b!1396826 m!1283397))

(declare-fun m!1283399 () Bool)

(assert (=> b!1396833 m!1283399))

(declare-fun m!1283401 () Bool)

(assert (=> b!1396833 m!1283401))

(assert (=> b!1396833 m!1283399))

(assert (=> b!1396833 m!1283399))

(declare-fun m!1283403 () Bool)

(assert (=> b!1396833 m!1283403))

(declare-fun m!1283405 () Bool)

(assert (=> b!1396833 m!1283405))

(declare-fun m!1283407 () Bool)

(assert (=> b!1396833 m!1283407))

(assert (=> b!1396829 m!1283399))

(assert (=> b!1396829 m!1283399))

(declare-fun m!1283409 () Bool)

(assert (=> b!1396829 m!1283409))

(assert (=> b!1396831 m!1283399))

(assert (=> b!1396831 m!1283399))

(declare-fun m!1283411 () Bool)

(assert (=> b!1396831 m!1283411))

(declare-fun m!1283413 () Bool)

(assert (=> b!1396825 m!1283413))

(assert (=> b!1396825 m!1283413))

(declare-fun m!1283415 () Bool)

(assert (=> b!1396825 m!1283415))

(declare-fun m!1283417 () Bool)

(assert (=> b!1396825 m!1283417))

(declare-fun m!1283419 () Bool)

(assert (=> b!1396825 m!1283419))

(declare-fun m!1283421 () Bool)

(assert (=> start!119990 m!1283421))

(declare-fun m!1283423 () Bool)

(assert (=> start!119990 m!1283423))

(declare-fun m!1283425 () Bool)

(assert (=> b!1396830 m!1283425))

(check-sat (not start!119990) (not b!1396828) (not b!1396831) (not b!1396830) (not b!1396829) (not b!1396825) (not b!1396833) (not b!1396827) (not b!1396826))
(check-sat)
