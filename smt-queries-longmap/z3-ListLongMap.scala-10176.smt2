; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119978 () Bool)

(assert start!119978)

(declare-fun b!1396636 () Bool)

(declare-fun res!935607 () Bool)

(declare-fun e!790692 () Bool)

(assert (=> b!1396636 (=> (not res!935607) (not e!790692))))

(declare-datatypes ((array!95460 0))(
  ( (array!95461 (arr!46084 (Array (_ BitVec 32) (_ BitVec 64))) (size!46636 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95460)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396636 (= res!935607 (validKeyInArray!0 (select (arr!46084 a!2901) j!112)))))

(declare-fun b!1396637 () Bool)

(declare-fun e!790694 () Bool)

(assert (=> b!1396637 (= e!790692 (not e!790694))))

(declare-fun res!935608 () Bool)

(assert (=> b!1396637 (=> res!935608 e!790694)))

(declare-datatypes ((SeekEntryResult!10427 0))(
  ( (MissingZero!10427 (index!44079 (_ BitVec 32))) (Found!10427 (index!44080 (_ BitVec 32))) (Intermediate!10427 (undefined!11239 Bool) (index!44081 (_ BitVec 32)) (x!125742 (_ BitVec 32))) (Undefined!10427) (MissingVacant!10427 (index!44082 (_ BitVec 32))) )
))
(declare-fun lt!613455 () SeekEntryResult!10427)

(get-info :version)

(assert (=> b!1396637 (= res!935608 (or (not ((_ is Intermediate!10427) lt!613455)) (undefined!11239 lt!613455)))))

(declare-fun e!790690 () Bool)

(assert (=> b!1396637 e!790690))

(declare-fun res!935605 () Bool)

(assert (=> b!1396637 (=> (not res!935605) (not e!790690))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95460 (_ BitVec 32)) Bool)

(assert (=> b!1396637 (= res!935605 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46701 0))(
  ( (Unit!46702) )
))
(declare-fun lt!613451 () Unit!46701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46701)

(assert (=> b!1396637 (= lt!613451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613453 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10427)

(assert (=> b!1396637 (= lt!613455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613453 (select (arr!46084 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396637 (= lt!613453 (toIndex!0 (select (arr!46084 a!2901) j!112) mask!2840))))

(declare-fun b!1396638 () Bool)

(declare-fun res!935601 () Bool)

(assert (=> b!1396638 (=> (not res!935601) (not e!790692))))

(declare-datatypes ((List!32681 0))(
  ( (Nil!32678) (Cons!32677 (h!33919 (_ BitVec 64)) (t!47367 List!32681)) )
))
(declare-fun arrayNoDuplicates!0 (array!95460 (_ BitVec 32) List!32681) Bool)

(assert (=> b!1396638 (= res!935601 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32678))))

(declare-fun b!1396639 () Bool)

(declare-fun e!790693 () Bool)

(assert (=> b!1396639 (= e!790694 e!790693)))

(declare-fun res!935602 () Bool)

(assert (=> b!1396639 (=> res!935602 e!790693)))

(declare-fun lt!613454 () SeekEntryResult!10427)

(assert (=> b!1396639 (= res!935602 (or (= lt!613455 lt!613454) (not ((_ is Intermediate!10427) lt!613454)) (bvslt (x!125742 lt!613455) #b00000000000000000000000000000000) (bvsgt (x!125742 lt!613455) #b01111111111111111111111111111110) (bvslt lt!613453 #b00000000000000000000000000000000) (bvsge lt!613453 (size!46636 a!2901)) (bvslt (index!44081 lt!613455) #b00000000000000000000000000000000) (bvsge (index!44081 lt!613455) (size!46636 a!2901)) (not (= lt!613455 (Intermediate!10427 false (index!44081 lt!613455) (x!125742 lt!613455)))) (not (= lt!613454 (Intermediate!10427 (undefined!11239 lt!613454) (index!44081 lt!613454) (x!125742 lt!613454))))))))

(declare-fun lt!613457 () (_ BitVec 64))

(declare-fun lt!613452 () array!95460)

(assert (=> b!1396639 (= lt!613454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613457 mask!2840) lt!613457 lt!613452 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396639 (= lt!613457 (select (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396639 (= lt!613452 (array!95461 (store (arr!46084 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46636 a!2901)))))

(declare-fun res!935604 () Bool)

(assert (=> start!119978 (=> (not res!935604) (not e!790692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119978 (= res!935604 (validMask!0 mask!2840))))

(assert (=> start!119978 e!790692))

(assert (=> start!119978 true))

(declare-fun array_inv!35317 (array!95460) Bool)

(assert (=> start!119978 (array_inv!35317 a!2901)))

(declare-fun b!1396640 () Bool)

(assert (=> b!1396640 (= e!790693 true)))

(declare-fun lt!613456 () SeekEntryResult!10427)

(assert (=> b!1396640 (= lt!613456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613453 lt!613457 lt!613452 mask!2840))))

(declare-fun b!1396641 () Bool)

(declare-fun res!935606 () Bool)

(assert (=> b!1396641 (=> (not res!935606) (not e!790692))))

(assert (=> b!1396641 (= res!935606 (validKeyInArray!0 (select (arr!46084 a!2901) i!1037)))))

(declare-fun b!1396642 () Bool)

(declare-fun res!935603 () Bool)

(assert (=> b!1396642 (=> (not res!935603) (not e!790692))))

(assert (=> b!1396642 (= res!935603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396643 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10427)

(assert (=> b!1396643 (= e!790690 (= (seekEntryOrOpen!0 (select (arr!46084 a!2901) j!112) a!2901 mask!2840) (Found!10427 j!112)))))

(declare-fun b!1396644 () Bool)

(declare-fun res!935600 () Bool)

(assert (=> b!1396644 (=> (not res!935600) (not e!790692))))

(assert (=> b!1396644 (= res!935600 (and (= (size!46636 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46636 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46636 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119978 res!935604) b!1396644))

(assert (= (and b!1396644 res!935600) b!1396641))

(assert (= (and b!1396641 res!935606) b!1396636))

(assert (= (and b!1396636 res!935607) b!1396642))

(assert (= (and b!1396642 res!935603) b!1396638))

(assert (= (and b!1396638 res!935601) b!1396637))

(assert (= (and b!1396637 res!935605) b!1396643))

(assert (= (and b!1396637 (not res!935608)) b!1396639))

(assert (= (and b!1396639 (not res!935602)) b!1396640))

(declare-fun m!1282711 () Bool)

(assert (=> b!1396638 m!1282711))

(declare-fun m!1282713 () Bool)

(assert (=> start!119978 m!1282713))

(declare-fun m!1282715 () Bool)

(assert (=> start!119978 m!1282715))

(declare-fun m!1282717 () Bool)

(assert (=> b!1396642 m!1282717))

(declare-fun m!1282719 () Bool)

(assert (=> b!1396640 m!1282719))

(declare-fun m!1282721 () Bool)

(assert (=> b!1396643 m!1282721))

(assert (=> b!1396643 m!1282721))

(declare-fun m!1282723 () Bool)

(assert (=> b!1396643 m!1282723))

(assert (=> b!1396636 m!1282721))

(assert (=> b!1396636 m!1282721))

(declare-fun m!1282725 () Bool)

(assert (=> b!1396636 m!1282725))

(declare-fun m!1282727 () Bool)

(assert (=> b!1396641 m!1282727))

(assert (=> b!1396641 m!1282727))

(declare-fun m!1282729 () Bool)

(assert (=> b!1396641 m!1282729))

(assert (=> b!1396637 m!1282721))

(declare-fun m!1282731 () Bool)

(assert (=> b!1396637 m!1282731))

(assert (=> b!1396637 m!1282721))

(declare-fun m!1282733 () Bool)

(assert (=> b!1396637 m!1282733))

(assert (=> b!1396637 m!1282721))

(declare-fun m!1282735 () Bool)

(assert (=> b!1396637 m!1282735))

(declare-fun m!1282737 () Bool)

(assert (=> b!1396637 m!1282737))

(declare-fun m!1282739 () Bool)

(assert (=> b!1396639 m!1282739))

(assert (=> b!1396639 m!1282739))

(declare-fun m!1282741 () Bool)

(assert (=> b!1396639 m!1282741))

(declare-fun m!1282743 () Bool)

(assert (=> b!1396639 m!1282743))

(declare-fun m!1282745 () Bool)

(assert (=> b!1396639 m!1282745))

(check-sat (not start!119978) (not b!1396642) (not b!1396640) (not b!1396639) (not b!1396641) (not b!1396643) (not b!1396636) (not b!1396638) (not b!1396637))
(check-sat)
