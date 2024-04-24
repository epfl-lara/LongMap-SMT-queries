; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126504 () Bool)

(assert start!126504)

(declare-fun b!1480790 () Bool)

(declare-fun e!830729 () Bool)

(declare-fun e!830736 () Bool)

(assert (=> b!1480790 (= e!830729 e!830736)))

(declare-fun res!1005636 () Bool)

(assert (=> b!1480790 (=> (not res!1005636) (not e!830736))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99448 0))(
  ( (array!99449 (arr!47998 (Array (_ BitVec 32) (_ BitVec 64))) (size!48549 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99448)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12135 0))(
  ( (MissingZero!12135 (index!50932 (_ BitVec 32))) (Found!12135 (index!50933 (_ BitVec 32))) (Intermediate!12135 (undefined!12947 Bool) (index!50934 (_ BitVec 32)) (x!132703 (_ BitVec 32))) (Undefined!12135) (MissingVacant!12135 (index!50935 (_ BitVec 32))) )
))
(declare-fun lt!646536 () SeekEntryResult!12135)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12135)

(assert (=> b!1480790 (= res!1005636 (= lt!646536 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47998 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480791 () Bool)

(declare-fun e!830728 () Bool)

(assert (=> b!1480791 (= e!830728 (not true))))

(declare-fun e!830734 () Bool)

(assert (=> b!1480791 e!830734))

(declare-fun res!1005647 () Bool)

(assert (=> b!1480791 (=> (not res!1005647) (not e!830734))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1480791 (= res!1005647 (and (= lt!646536 (Found!12135 j!93)) (or (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) (select (arr!47998 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12135)

(assert (=> b!1480791 (= lt!646536 (seekEntryOrOpen!0 (select (arr!47998 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99448 (_ BitVec 32)) Bool)

(assert (=> b!1480791 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49643 0))(
  ( (Unit!49644) )
))
(declare-fun lt!646534 () Unit!49643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49643)

(assert (=> b!1480791 (= lt!646534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480792 () Bool)

(declare-fun e!830732 () Bool)

(declare-fun e!830733 () Bool)

(assert (=> b!1480792 (= e!830732 e!830733)))

(declare-fun res!1005638 () Bool)

(assert (=> b!1480792 (=> (not res!1005638) (not e!830733))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1480792 (= res!1005638 (= (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646537 () array!99448)

(assert (=> b!1480792 (= lt!646537 (array!99449 (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48549 a!2862)))))

(declare-fun b!1480793 () Bool)

(declare-fun res!1005639 () Bool)

(assert (=> b!1480793 (=> (not res!1005639) (not e!830732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480793 (= res!1005639 (validKeyInArray!0 (select (arr!47998 a!2862) j!93)))))

(declare-fun b!1480794 () Bool)

(declare-fun res!1005646 () Bool)

(assert (=> b!1480794 (=> (not res!1005646) (not e!830728))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1480794 (= res!1005646 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1005648 () Bool)

(assert (=> start!126504 (=> (not res!1005648) (not e!830732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126504 (= res!1005648 (validMask!0 mask!2687))))

(assert (=> start!126504 e!830732))

(assert (=> start!126504 true))

(declare-fun array_inv!37279 (array!99448) Bool)

(assert (=> start!126504 (array_inv!37279 a!2862)))

(declare-fun b!1480795 () Bool)

(declare-fun res!1005649 () Bool)

(assert (=> b!1480795 (=> (not res!1005649) (not e!830732))))

(assert (=> b!1480795 (= res!1005649 (and (= (size!48549 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48549 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48549 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480796 () Bool)

(assert (=> b!1480796 (= e!830736 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480797 () Bool)

(declare-fun res!1005645 () Bool)

(assert (=> b!1480797 (=> (not res!1005645) (not e!830732))))

(assert (=> b!1480797 (= res!1005645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480798 () Bool)

(declare-fun res!1005637 () Bool)

(assert (=> b!1480798 (=> (not res!1005637) (not e!830732))))

(assert (=> b!1480798 (= res!1005637 (validKeyInArray!0 (select (arr!47998 a!2862) i!1006)))))

(declare-fun b!1480799 () Bool)

(declare-fun res!1005640 () Bool)

(declare-fun e!830730 () Bool)

(assert (=> b!1480799 (=> (not res!1005640) (not e!830730))))

(declare-fun lt!646532 () SeekEntryResult!12135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99448 (_ BitVec 32)) SeekEntryResult!12135)

(assert (=> b!1480799 (= res!1005640 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!646532))))

(declare-fun e!830731 () Bool)

(declare-fun b!1480800 () Bool)

(declare-fun lt!646533 () (_ BitVec 64))

(declare-fun lt!646535 () SeekEntryResult!12135)

(assert (=> b!1480800 (= e!830731 (= lt!646535 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646533 lt!646537 mask!2687)))))

(declare-fun b!1480801 () Bool)

(assert (=> b!1480801 (= e!830730 e!830728)))

(declare-fun res!1005644 () Bool)

(assert (=> b!1480801 (=> (not res!1005644) (not e!830728))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480801 (= res!1005644 (= lt!646535 (Intermediate!12135 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480801 (= lt!646535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646533 mask!2687) lt!646533 lt!646537 mask!2687))))

(assert (=> b!1480801 (= lt!646533 (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480802 () Bool)

(assert (=> b!1480802 (= e!830731 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646533 lt!646537 mask!2687) (seekEntryOrOpen!0 lt!646533 lt!646537 mask!2687)))))

(declare-fun b!1480803 () Bool)

(declare-fun res!1005642 () Bool)

(assert (=> b!1480803 (=> (not res!1005642) (not e!830732))))

(declare-datatypes ((List!34486 0))(
  ( (Nil!34483) (Cons!34482 (h!35864 (_ BitVec 64)) (t!49172 List!34486)) )
))
(declare-fun arrayNoDuplicates!0 (array!99448 (_ BitVec 32) List!34486) Bool)

(assert (=> b!1480803 (= res!1005642 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34483))))

(declare-fun b!1480804 () Bool)

(declare-fun res!1005641 () Bool)

(assert (=> b!1480804 (=> (not res!1005641) (not e!830728))))

(assert (=> b!1480804 (= res!1005641 e!830731)))

(declare-fun c!137107 () Bool)

(assert (=> b!1480804 (= c!137107 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480805 () Bool)

(declare-fun res!1005643 () Bool)

(assert (=> b!1480805 (=> (not res!1005643) (not e!830732))))

(assert (=> b!1480805 (= res!1005643 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48549 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48549 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48549 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480806 () Bool)

(assert (=> b!1480806 (= e!830733 e!830730)))

(declare-fun res!1005635 () Bool)

(assert (=> b!1480806 (=> (not res!1005635) (not e!830730))))

(assert (=> b!1480806 (= res!1005635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!646532))))

(assert (=> b!1480806 (= lt!646532 (Intermediate!12135 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480807 () Bool)

(assert (=> b!1480807 (= e!830734 e!830729)))

(declare-fun res!1005650 () Bool)

(assert (=> b!1480807 (=> res!1005650 e!830729)))

(assert (=> b!1480807 (= res!1005650 (or (and (= (select (arr!47998 a!2862) index!646) (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47998 a!2862) index!646) (select (arr!47998 a!2862) j!93))) (not (= (select (arr!47998 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!126504 res!1005648) b!1480795))

(assert (= (and b!1480795 res!1005649) b!1480798))

(assert (= (and b!1480798 res!1005637) b!1480793))

(assert (= (and b!1480793 res!1005639) b!1480797))

(assert (= (and b!1480797 res!1005645) b!1480803))

(assert (= (and b!1480803 res!1005642) b!1480805))

(assert (= (and b!1480805 res!1005643) b!1480792))

(assert (= (and b!1480792 res!1005638) b!1480806))

(assert (= (and b!1480806 res!1005635) b!1480799))

(assert (= (and b!1480799 res!1005640) b!1480801))

(assert (= (and b!1480801 res!1005644) b!1480804))

(assert (= (and b!1480804 c!137107) b!1480800))

(assert (= (and b!1480804 (not c!137107)) b!1480802))

(assert (= (and b!1480804 res!1005641) b!1480794))

(assert (= (and b!1480794 res!1005646) b!1480791))

(assert (= (and b!1480791 res!1005647) b!1480807))

(assert (= (and b!1480807 (not res!1005650)) b!1480790))

(assert (= (and b!1480790 res!1005636) b!1480796))

(declare-fun m!1366657 () Bool)

(assert (=> b!1480803 m!1366657))

(declare-fun m!1366659 () Bool)

(assert (=> b!1480799 m!1366659))

(assert (=> b!1480799 m!1366659))

(declare-fun m!1366661 () Bool)

(assert (=> b!1480799 m!1366661))

(declare-fun m!1366663 () Bool)

(assert (=> b!1480802 m!1366663))

(declare-fun m!1366665 () Bool)

(assert (=> b!1480802 m!1366665))

(declare-fun m!1366667 () Bool)

(assert (=> b!1480798 m!1366667))

(assert (=> b!1480798 m!1366667))

(declare-fun m!1366669 () Bool)

(assert (=> b!1480798 m!1366669))

(declare-fun m!1366671 () Bool)

(assert (=> start!126504 m!1366671))

(declare-fun m!1366673 () Bool)

(assert (=> start!126504 m!1366673))

(declare-fun m!1366675 () Bool)

(assert (=> b!1480792 m!1366675))

(declare-fun m!1366677 () Bool)

(assert (=> b!1480792 m!1366677))

(assert (=> b!1480806 m!1366659))

(assert (=> b!1480806 m!1366659))

(declare-fun m!1366679 () Bool)

(assert (=> b!1480806 m!1366679))

(assert (=> b!1480806 m!1366679))

(assert (=> b!1480806 m!1366659))

(declare-fun m!1366681 () Bool)

(assert (=> b!1480806 m!1366681))

(declare-fun m!1366683 () Bool)

(assert (=> b!1480801 m!1366683))

(assert (=> b!1480801 m!1366683))

(declare-fun m!1366685 () Bool)

(assert (=> b!1480801 m!1366685))

(assert (=> b!1480801 m!1366675))

(declare-fun m!1366687 () Bool)

(assert (=> b!1480801 m!1366687))

(declare-fun m!1366689 () Bool)

(assert (=> b!1480791 m!1366689))

(declare-fun m!1366691 () Bool)

(assert (=> b!1480791 m!1366691))

(assert (=> b!1480791 m!1366659))

(declare-fun m!1366693 () Bool)

(assert (=> b!1480791 m!1366693))

(declare-fun m!1366695 () Bool)

(assert (=> b!1480791 m!1366695))

(assert (=> b!1480791 m!1366659))

(declare-fun m!1366697 () Bool)

(assert (=> b!1480797 m!1366697))

(assert (=> b!1480790 m!1366659))

(assert (=> b!1480790 m!1366659))

(declare-fun m!1366699 () Bool)

(assert (=> b!1480790 m!1366699))

(declare-fun m!1366701 () Bool)

(assert (=> b!1480807 m!1366701))

(assert (=> b!1480807 m!1366675))

(declare-fun m!1366703 () Bool)

(assert (=> b!1480807 m!1366703))

(assert (=> b!1480807 m!1366659))

(assert (=> b!1480793 m!1366659))

(assert (=> b!1480793 m!1366659))

(declare-fun m!1366705 () Bool)

(assert (=> b!1480793 m!1366705))

(declare-fun m!1366707 () Bool)

(assert (=> b!1480800 m!1366707))

(check-sat (not b!1480800) (not b!1480799) (not b!1480791) (not b!1480806) (not start!126504) (not b!1480797) (not b!1480803) (not b!1480802) (not b!1480801) (not b!1480793) (not b!1480798) (not b!1480790))
(check-sat)
