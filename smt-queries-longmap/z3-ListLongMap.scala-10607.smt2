; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124998 () Bool)

(assert start!124998)

(declare-fun b!1448785 () Bool)

(declare-fun e!816040 () Bool)

(declare-fun e!816036 () Bool)

(assert (=> b!1448785 (= e!816040 e!816036)))

(declare-fun res!979616 () Bool)

(assert (=> b!1448785 (=> (not res!979616) (not e!816036))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98341 0))(
  ( (array!98342 (arr!47455 (Array (_ BitVec 32) (_ BitVec 64))) (size!48006 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98341)

(assert (=> b!1448785 (= res!979616 (= (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635649 () array!98341)

(assert (=> b!1448785 (= lt!635649 (array!98342 (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48006 a!2862)))))

(declare-fun b!1448786 () Bool)

(declare-fun res!979622 () Bool)

(declare-fun e!816038 () Bool)

(assert (=> b!1448786 (=> (not res!979622) (not e!816038))))

(declare-fun e!816042 () Bool)

(assert (=> b!1448786 (= res!979622 e!816042)))

(declare-fun c!134107 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448786 (= c!134107 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448787 () Bool)

(declare-fun e!816041 () Bool)

(declare-fun e!816039 () Bool)

(assert (=> b!1448787 (= e!816041 e!816039)))

(declare-fun res!979619 () Bool)

(assert (=> b!1448787 (=> res!979619 e!816039)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1448787 (= res!979619 (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (not (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448788 () Bool)

(declare-fun res!979615 () Bool)

(assert (=> b!1448788 (=> (not res!979615) (not e!816040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448788 (= res!979615 (validKeyInArray!0 (select (arr!47455 a!2862) j!93)))))

(declare-fun res!979625 () Bool)

(assert (=> start!124998 (=> (not res!979625) (not e!816040))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124998 (= res!979625 (validMask!0 mask!2687))))

(assert (=> start!124998 e!816040))

(assert (=> start!124998 true))

(declare-fun array_inv!36736 (array!98341) Bool)

(assert (=> start!124998 (array_inv!36736 a!2862)))

(declare-fun b!1448789 () Bool)

(declare-fun res!979618 () Bool)

(assert (=> b!1448789 (=> (not res!979618) (not e!816040))))

(declare-datatypes ((List!33943 0))(
  ( (Nil!33940) (Cons!33939 (h!35300 (_ BitVec 64)) (t!48629 List!33943)) )
))
(declare-fun arrayNoDuplicates!0 (array!98341 (_ BitVec 32) List!33943) Bool)

(assert (=> b!1448789 (= res!979618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33940))))

(declare-fun b!1448790 () Bool)

(declare-fun e!816033 () Bool)

(assert (=> b!1448790 (= e!816033 e!816038)))

(declare-fun res!979620 () Bool)

(assert (=> b!1448790 (=> (not res!979620) (not e!816038))))

(declare-datatypes ((SeekEntryResult!11604 0))(
  ( (MissingZero!11604 (index!48808 (_ BitVec 32))) (Found!11604 (index!48809 (_ BitVec 32))) (Intermediate!11604 (undefined!12416 Bool) (index!48810 (_ BitVec 32)) (x!130661 (_ BitVec 32))) (Undefined!11604) (MissingVacant!11604 (index!48811 (_ BitVec 32))) )
))
(declare-fun lt!635647 () SeekEntryResult!11604)

(assert (=> b!1448790 (= res!979620 (= lt!635647 (Intermediate!11604 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635648 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98341 (_ BitVec 32)) SeekEntryResult!11604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448790 (= lt!635647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635648 mask!2687) lt!635648 lt!635649 mask!2687))))

(assert (=> b!1448790 (= lt!635648 (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448791 () Bool)

(declare-fun e!816037 () Bool)

(assert (=> b!1448791 (= e!816038 (not e!816037))))

(declare-fun res!979617 () Bool)

(assert (=> b!1448791 (=> res!979617 e!816037)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448791 (= res!979617 (or (and (= (select (arr!47455 a!2862) index!646) (select (store (arr!47455 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47455 a!2862) index!646) (select (arr!47455 a!2862) j!93))) (not (= (select (arr!47455 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448791 e!816041))

(declare-fun res!979614 () Bool)

(assert (=> b!1448791 (=> (not res!979614) (not e!816041))))

(declare-fun lt!635651 () SeekEntryResult!11604)

(assert (=> b!1448791 (= res!979614 (and (= lt!635651 (Found!11604 j!93)) (or (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47455 a!2862) intermediateBeforeIndex!19) (select (arr!47455 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98341 (_ BitVec 32)) SeekEntryResult!11604)

(assert (=> b!1448791 (= lt!635651 (seekEntryOrOpen!0 (select (arr!47455 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98341 (_ BitVec 32)) Bool)

(assert (=> b!1448791 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48737 0))(
  ( (Unit!48738) )
))
(declare-fun lt!635650 () Unit!48737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48737)

(assert (=> b!1448791 (= lt!635650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448792 () Bool)

(declare-fun res!979613 () Bool)

(assert (=> b!1448792 (=> (not res!979613) (not e!816040))))

(assert (=> b!1448792 (= res!979613 (validKeyInArray!0 (select (arr!47455 a!2862) i!1006)))))

(declare-fun b!1448793 () Bool)

(declare-fun res!979611 () Bool)

(assert (=> b!1448793 (=> (not res!979611) (not e!816040))))

(assert (=> b!1448793 (= res!979611 (and (= (size!48006 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48006 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48006 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448794 () Bool)

(assert (=> b!1448794 (= e!816036 e!816033)))

(declare-fun res!979623 () Bool)

(assert (=> b!1448794 (=> (not res!979623) (not e!816033))))

(declare-fun lt!635652 () SeekEntryResult!11604)

(assert (=> b!1448794 (= res!979623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47455 a!2862) j!93) mask!2687) (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!635652))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448794 (= lt!635652 (Intermediate!11604 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448795 () Bool)

(declare-fun e!816035 () Bool)

(assert (=> b!1448795 (= e!816039 e!816035)))

(declare-fun res!979609 () Bool)

(assert (=> b!1448795 (=> (not res!979609) (not e!816035))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98341 (_ BitVec 32)) SeekEntryResult!11604)

(assert (=> b!1448795 (= res!979609 (= lt!635651 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47455 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448796 () Bool)

(assert (=> b!1448796 (= e!816042 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635648 lt!635649 mask!2687) (seekEntryOrOpen!0 lt!635648 lt!635649 mask!2687)))))

(declare-fun b!1448797 () Bool)

(declare-fun res!979610 () Bool)

(assert (=> b!1448797 (=> (not res!979610) (not e!816038))))

(assert (=> b!1448797 (= res!979610 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448798 () Bool)

(declare-fun res!979624 () Bool)

(assert (=> b!1448798 (=> (not res!979624) (not e!816040))))

(assert (=> b!1448798 (= res!979624 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48006 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48006 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48006 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448799 () Bool)

(assert (=> b!1448799 (= e!816035 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448800 () Bool)

(declare-fun res!979612 () Bool)

(assert (=> b!1448800 (=> (not res!979612) (not e!816033))))

(assert (=> b!1448800 (= res!979612 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47455 a!2862) j!93) a!2862 mask!2687) lt!635652))))

(declare-fun b!1448801 () Bool)

(assert (=> b!1448801 (= e!816037 true)))

(declare-fun lt!635653 () SeekEntryResult!11604)

(assert (=> b!1448801 (= lt!635653 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47455 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448802 () Bool)

(declare-fun res!979621 () Bool)

(assert (=> b!1448802 (=> (not res!979621) (not e!816040))))

(assert (=> b!1448802 (= res!979621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448803 () Bool)

(assert (=> b!1448803 (= e!816042 (= lt!635647 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635648 lt!635649 mask!2687)))))

(assert (= (and start!124998 res!979625) b!1448793))

(assert (= (and b!1448793 res!979611) b!1448792))

(assert (= (and b!1448792 res!979613) b!1448788))

(assert (= (and b!1448788 res!979615) b!1448802))

(assert (= (and b!1448802 res!979621) b!1448789))

(assert (= (and b!1448789 res!979618) b!1448798))

(assert (= (and b!1448798 res!979624) b!1448785))

(assert (= (and b!1448785 res!979616) b!1448794))

(assert (= (and b!1448794 res!979623) b!1448800))

(assert (= (and b!1448800 res!979612) b!1448790))

(assert (= (and b!1448790 res!979620) b!1448786))

(assert (= (and b!1448786 c!134107) b!1448803))

(assert (= (and b!1448786 (not c!134107)) b!1448796))

(assert (= (and b!1448786 res!979622) b!1448797))

(assert (= (and b!1448797 res!979610) b!1448791))

(assert (= (and b!1448791 res!979614) b!1448787))

(assert (= (and b!1448787 (not res!979619)) b!1448795))

(assert (= (and b!1448795 res!979609) b!1448799))

(assert (= (and b!1448791 (not res!979617)) b!1448801))

(declare-fun m!1337713 () Bool)

(assert (=> b!1448790 m!1337713))

(assert (=> b!1448790 m!1337713))

(declare-fun m!1337715 () Bool)

(assert (=> b!1448790 m!1337715))

(declare-fun m!1337717 () Bool)

(assert (=> b!1448790 m!1337717))

(declare-fun m!1337719 () Bool)

(assert (=> b!1448790 m!1337719))

(declare-fun m!1337721 () Bool)

(assert (=> b!1448794 m!1337721))

(assert (=> b!1448794 m!1337721))

(declare-fun m!1337723 () Bool)

(assert (=> b!1448794 m!1337723))

(assert (=> b!1448794 m!1337723))

(assert (=> b!1448794 m!1337721))

(declare-fun m!1337725 () Bool)

(assert (=> b!1448794 m!1337725))

(assert (=> b!1448788 m!1337721))

(assert (=> b!1448788 m!1337721))

(declare-fun m!1337727 () Bool)

(assert (=> b!1448788 m!1337727))

(assert (=> b!1448795 m!1337721))

(assert (=> b!1448795 m!1337721))

(declare-fun m!1337729 () Bool)

(assert (=> b!1448795 m!1337729))

(assert (=> b!1448801 m!1337721))

(assert (=> b!1448801 m!1337721))

(declare-fun m!1337731 () Bool)

(assert (=> b!1448801 m!1337731))

(declare-fun m!1337733 () Bool)

(assert (=> b!1448789 m!1337733))

(declare-fun m!1337735 () Bool)

(assert (=> b!1448787 m!1337735))

(assert (=> b!1448787 m!1337717))

(declare-fun m!1337737 () Bool)

(assert (=> b!1448787 m!1337737))

(assert (=> b!1448787 m!1337721))

(declare-fun m!1337739 () Bool)

(assert (=> b!1448802 m!1337739))

(assert (=> b!1448785 m!1337717))

(declare-fun m!1337741 () Bool)

(assert (=> b!1448785 m!1337741))

(declare-fun m!1337743 () Bool)

(assert (=> start!124998 m!1337743))

(declare-fun m!1337745 () Bool)

(assert (=> start!124998 m!1337745))

(declare-fun m!1337747 () Bool)

(assert (=> b!1448791 m!1337747))

(assert (=> b!1448791 m!1337717))

(declare-fun m!1337749 () Bool)

(assert (=> b!1448791 m!1337749))

(assert (=> b!1448791 m!1337737))

(assert (=> b!1448791 m!1337735))

(assert (=> b!1448791 m!1337721))

(declare-fun m!1337751 () Bool)

(assert (=> b!1448791 m!1337751))

(declare-fun m!1337753 () Bool)

(assert (=> b!1448791 m!1337753))

(assert (=> b!1448791 m!1337721))

(declare-fun m!1337755 () Bool)

(assert (=> b!1448796 m!1337755))

(declare-fun m!1337757 () Bool)

(assert (=> b!1448796 m!1337757))

(declare-fun m!1337759 () Bool)

(assert (=> b!1448803 m!1337759))

(declare-fun m!1337761 () Bool)

(assert (=> b!1448792 m!1337761))

(assert (=> b!1448792 m!1337761))

(declare-fun m!1337763 () Bool)

(assert (=> b!1448792 m!1337763))

(assert (=> b!1448800 m!1337721))

(assert (=> b!1448800 m!1337721))

(declare-fun m!1337765 () Bool)

(assert (=> b!1448800 m!1337765))

(check-sat (not b!1448794) (not b!1448796) (not b!1448800) (not b!1448789) (not b!1448788) (not b!1448795) (not b!1448792) (not b!1448802) (not b!1448791) (not b!1448790) (not b!1448801) (not start!124998) (not b!1448803))
(check-sat)
