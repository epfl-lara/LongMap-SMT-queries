; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119912 () Bool)

(assert start!119912)

(declare-fun b!1395823 () Bool)

(declare-fun res!934555 () Bool)

(declare-fun e!790350 () Bool)

(assert (=> b!1395823 (=> (not res!934555) (not e!790350))))

(declare-datatypes ((array!95516 0))(
  ( (array!95517 (arr!46114 (Array (_ BitVec 32) (_ BitVec 64))) (size!46665 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95516)

(declare-datatypes ((List!32620 0))(
  ( (Nil!32617) (Cons!32616 (h!33857 (_ BitVec 64)) (t!47306 List!32620)) )
))
(declare-fun arrayNoDuplicates!0 (array!95516 (_ BitVec 32) List!32620) Bool)

(assert (=> b!1395823 (= res!934555 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32617))))

(declare-fun b!1395825 () Bool)

(declare-fun res!934551 () Bool)

(declare-fun e!790349 () Bool)

(assert (=> b!1395825 (=> res!934551 e!790349)))

(declare-fun lt!613062 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10334 0))(
  ( (MissingZero!10334 (index!43707 (_ BitVec 32))) (Found!10334 (index!43708 (_ BitVec 32))) (Intermediate!10334 (undefined!11146 Bool) (index!43709 (_ BitVec 32)) (x!125525 (_ BitVec 32))) (Undefined!10334) (MissingVacant!10334 (index!43710 (_ BitVec 32))) )
))
(declare-fun lt!613058 () SeekEntryResult!10334)

(assert (=> b!1395825 (= res!934551 (or (bvslt (x!125525 lt!613058) #b00000000000000000000000000000000) (bvsgt (x!125525 lt!613058) #b01111111111111111111111111111110) (bvslt lt!613062 #b00000000000000000000000000000000) (bvsge lt!613062 (size!46665 a!2901)) (bvslt (index!43709 lt!613058) #b00000000000000000000000000000000) (bvsge (index!43709 lt!613058) (size!46665 a!2901)) (not (= lt!613058 (Intermediate!10334 false (index!43709 lt!613058) (x!125525 lt!613058))))))))

(declare-fun b!1395826 () Bool)

(declare-fun res!934548 () Bool)

(assert (=> b!1395826 (=> (not res!934548) (not e!790350))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395826 (= res!934548 (and (= (size!46665 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46665 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46665 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395827 () Bool)

(assert (=> b!1395827 (= e!790349 true)))

(declare-fun lt!613060 () array!95516)

(declare-fun lt!613059 () (_ BitVec 64))

(declare-fun lt!613064 () SeekEntryResult!10334)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95516 (_ BitVec 32)) SeekEntryResult!10334)

(assert (=> b!1395827 (= lt!613064 (seekEntryOrOpen!0 lt!613059 lt!613060 mask!2840))))

(declare-datatypes ((Unit!46699 0))(
  ( (Unit!46700) )
))
(declare-fun lt!613061 () Unit!46699)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46699)

(assert (=> b!1395827 (= lt!613061 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!613062 (x!125525 lt!613058) (index!43709 lt!613058) mask!2840))))

(declare-fun res!934552 () Bool)

(assert (=> start!119912 (=> (not res!934552) (not e!790350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119912 (= res!934552 (validMask!0 mask!2840))))

(assert (=> start!119912 e!790350))

(assert (=> start!119912 true))

(declare-fun array_inv!35395 (array!95516) Bool)

(assert (=> start!119912 (array_inv!35395 a!2901)))

(declare-fun b!1395824 () Bool)

(declare-fun res!934553 () Bool)

(assert (=> b!1395824 (=> (not res!934553) (not e!790350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395824 (= res!934553 (validKeyInArray!0 (select (arr!46114 a!2901) i!1037)))))

(declare-fun b!1395828 () Bool)

(declare-fun res!934549 () Bool)

(assert (=> b!1395828 (=> (not res!934549) (not e!790350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95516 (_ BitVec 32)) Bool)

(assert (=> b!1395828 (= res!934549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395829 () Bool)

(declare-fun e!790352 () Bool)

(assert (=> b!1395829 (= e!790350 (not e!790352))))

(declare-fun res!934547 () Bool)

(assert (=> b!1395829 (=> res!934547 e!790352)))

(get-info :version)

(assert (=> b!1395829 (= res!934547 (or (not ((_ is Intermediate!10334) lt!613058)) (undefined!11146 lt!613058)))))

(assert (=> b!1395829 (= lt!613064 (Found!10334 j!112))))

(assert (=> b!1395829 (= lt!613064 (seekEntryOrOpen!0 (select (arr!46114 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395829 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613063 () Unit!46699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46699)

(assert (=> b!1395829 (= lt!613063 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95516 (_ BitVec 32)) SeekEntryResult!10334)

(assert (=> b!1395829 (= lt!613058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613062 (select (arr!46114 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395829 (= lt!613062 (toIndex!0 (select (arr!46114 a!2901) j!112) mask!2840))))

(declare-fun b!1395830 () Bool)

(declare-fun res!934554 () Bool)

(assert (=> b!1395830 (=> (not res!934554) (not e!790350))))

(assert (=> b!1395830 (= res!934554 (validKeyInArray!0 (select (arr!46114 a!2901) j!112)))))

(declare-fun b!1395831 () Bool)

(assert (=> b!1395831 (= e!790352 e!790349)))

(declare-fun res!934550 () Bool)

(assert (=> b!1395831 (=> res!934550 e!790349)))

(assert (=> b!1395831 (= res!934550 (not (= lt!613058 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613059 mask!2840) lt!613059 lt!613060 mask!2840))))))

(assert (=> b!1395831 (= lt!613059 (select (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395831 (= lt!613060 (array!95517 (store (arr!46114 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46665 a!2901)))))

(assert (= (and start!119912 res!934552) b!1395826))

(assert (= (and b!1395826 res!934548) b!1395824))

(assert (= (and b!1395824 res!934553) b!1395830))

(assert (= (and b!1395830 res!934554) b!1395828))

(assert (= (and b!1395828 res!934549) b!1395823))

(assert (= (and b!1395823 res!934555) b!1395829))

(assert (= (and b!1395829 (not res!934547)) b!1395831))

(assert (= (and b!1395831 (not res!934550)) b!1395825))

(assert (= (and b!1395825 (not res!934551)) b!1395827))

(declare-fun m!1282477 () Bool)

(assert (=> b!1395830 m!1282477))

(assert (=> b!1395830 m!1282477))

(declare-fun m!1282479 () Bool)

(assert (=> b!1395830 m!1282479))

(declare-fun m!1282481 () Bool)

(assert (=> b!1395823 m!1282481))

(declare-fun m!1282483 () Bool)

(assert (=> start!119912 m!1282483))

(declare-fun m!1282485 () Bool)

(assert (=> start!119912 m!1282485))

(declare-fun m!1282487 () Bool)

(assert (=> b!1395824 m!1282487))

(assert (=> b!1395824 m!1282487))

(declare-fun m!1282489 () Bool)

(assert (=> b!1395824 m!1282489))

(assert (=> b!1395829 m!1282477))

(declare-fun m!1282491 () Bool)

(assert (=> b!1395829 m!1282491))

(assert (=> b!1395829 m!1282477))

(declare-fun m!1282493 () Bool)

(assert (=> b!1395829 m!1282493))

(assert (=> b!1395829 m!1282477))

(declare-fun m!1282495 () Bool)

(assert (=> b!1395829 m!1282495))

(declare-fun m!1282497 () Bool)

(assert (=> b!1395829 m!1282497))

(assert (=> b!1395829 m!1282477))

(declare-fun m!1282499 () Bool)

(assert (=> b!1395829 m!1282499))

(declare-fun m!1282501 () Bool)

(assert (=> b!1395828 m!1282501))

(declare-fun m!1282503 () Bool)

(assert (=> b!1395827 m!1282503))

(declare-fun m!1282505 () Bool)

(assert (=> b!1395827 m!1282505))

(declare-fun m!1282507 () Bool)

(assert (=> b!1395831 m!1282507))

(assert (=> b!1395831 m!1282507))

(declare-fun m!1282509 () Bool)

(assert (=> b!1395831 m!1282509))

(declare-fun m!1282511 () Bool)

(assert (=> b!1395831 m!1282511))

(declare-fun m!1282513 () Bool)

(assert (=> b!1395831 m!1282513))

(check-sat (not b!1395828) (not start!119912) (not b!1395830) (not b!1395823) (not b!1395824) (not b!1395829) (not b!1395827) (not b!1395831))
(check-sat)
