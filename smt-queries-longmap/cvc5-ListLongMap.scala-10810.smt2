; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126508 () Bool)

(assert start!126508)

(declare-datatypes ((array!99470 0))(
  ( (array!99471 (arr!48011 (Array (_ BitVec 32) (_ BitVec 64))) (size!48561 (_ BitVec 32))) )
))
(declare-fun lt!647550 () array!99470)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!831972 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647544 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1483792 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12251 0))(
  ( (MissingZero!12251 (index!51396 (_ BitVec 32))) (Found!12251 (index!51397 (_ BitVec 32))) (Intermediate!12251 (undefined!13063 Bool) (index!51398 (_ BitVec 32)) (x!132983 (_ BitVec 32))) (Undefined!12251) (MissingVacant!12251 (index!51399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99470 (_ BitVec 32)) SeekEntryResult!12251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99470 (_ BitVec 32)) SeekEntryResult!12251)

(assert (=> b!1483792 (= e!831972 (= (seekEntryOrOpen!0 lt!647544 lt!647550 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647544 lt!647550 mask!2687)))))

(declare-fun b!1483793 () Bool)

(declare-fun res!1008647 () Bool)

(declare-fun e!831975 () Bool)

(assert (=> b!1483793 (=> (not res!1008647) (not e!831975))))

(declare-fun e!831971 () Bool)

(assert (=> b!1483793 (= res!1008647 e!831971)))

(declare-fun c!137103 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483793 (= c!137103 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483794 () Bool)

(declare-fun e!831970 () Bool)

(assert (=> b!1483794 (= e!831970 e!831972)))

(declare-fun res!1008634 () Bool)

(assert (=> b!1483794 (=> (not res!1008634) (not e!831972))))

(declare-fun lt!647547 () (_ BitVec 64))

(assert (=> b!1483794 (= res!1008634 (and (= index!646 intermediateAfterIndex!19) (= lt!647547 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483795 () Bool)

(declare-fun res!1008637 () Bool)

(declare-fun e!831974 () Bool)

(assert (=> b!1483795 (=> (not res!1008637) (not e!831974))))

(declare-fun a!2862 () array!99470)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483795 (= res!1008637 (= (seekEntryOrOpen!0 (select (arr!48011 a!2862) j!93) a!2862 mask!2687) (Found!12251 j!93)))))

(declare-fun b!1483796 () Bool)

(assert (=> b!1483796 (= e!831974 e!831970)))

(declare-fun res!1008632 () Bool)

(assert (=> b!1483796 (=> res!1008632 e!831970)))

(assert (=> b!1483796 (= res!1008632 (or (and (= (select (arr!48011 a!2862) index!646) lt!647547) (= (select (arr!48011 a!2862) index!646) (select (arr!48011 a!2862) j!93))) (= (select (arr!48011 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483796 (= lt!647547 (select (store (arr!48011 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483797 () Bool)

(declare-fun res!1008649 () Bool)

(declare-fun e!831976 () Bool)

(assert (=> b!1483797 (=> (not res!1008649) (not e!831976))))

(assert (=> b!1483797 (= res!1008649 (and (= (size!48561 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48561 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48561 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483798 () Bool)

(declare-fun lt!647549 () SeekEntryResult!12251)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99470 (_ BitVec 32)) SeekEntryResult!12251)

(assert (=> b!1483798 (= e!831971 (= lt!647549 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647544 lt!647550 mask!2687)))))

(declare-fun b!1483799 () Bool)

(declare-fun e!831977 () Bool)

(declare-fun e!831969 () Bool)

(assert (=> b!1483799 (= e!831977 e!831969)))

(declare-fun res!1008636 () Bool)

(assert (=> b!1483799 (=> (not res!1008636) (not e!831969))))

(declare-fun lt!647545 () SeekEntryResult!12251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483799 (= res!1008636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48011 a!2862) j!93) mask!2687) (select (arr!48011 a!2862) j!93) a!2862 mask!2687) lt!647545))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483799 (= lt!647545 (Intermediate!12251 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483800 () Bool)

(declare-fun res!1008631 () Bool)

(assert (=> b!1483800 (=> (not res!1008631) (not e!831976))))

(declare-datatypes ((List!34512 0))(
  ( (Nil!34509) (Cons!34508 (h!35882 (_ BitVec 64)) (t!49206 List!34512)) )
))
(declare-fun arrayNoDuplicates!0 (array!99470 (_ BitVec 32) List!34512) Bool)

(assert (=> b!1483800 (= res!1008631 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34509))))

(declare-fun b!1483801 () Bool)

(declare-fun e!831968 () Bool)

(assert (=> b!1483801 (= e!831975 (not e!831968))))

(declare-fun res!1008635 () Bool)

(assert (=> b!1483801 (=> res!1008635 e!831968)))

(assert (=> b!1483801 (= res!1008635 (or (and (= (select (arr!48011 a!2862) index!646) (select (store (arr!48011 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48011 a!2862) index!646) (select (arr!48011 a!2862) j!93))) (= (select (arr!48011 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483801 e!831974))

(declare-fun res!1008639 () Bool)

(assert (=> b!1483801 (=> (not res!1008639) (not e!831974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99470 (_ BitVec 32)) Bool)

(assert (=> b!1483801 (= res!1008639 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49842 0))(
  ( (Unit!49843) )
))
(declare-fun lt!647548 () Unit!49842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49842)

(assert (=> b!1483801 (= lt!647548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1008638 () Bool)

(assert (=> start!126508 (=> (not res!1008638) (not e!831976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126508 (= res!1008638 (validMask!0 mask!2687))))

(assert (=> start!126508 e!831976))

(assert (=> start!126508 true))

(declare-fun array_inv!37039 (array!99470) Bool)

(assert (=> start!126508 (array_inv!37039 a!2862)))

(declare-fun b!1483802 () Bool)

(assert (=> b!1483802 (= e!831968 true)))

(declare-fun lt!647546 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483802 (= lt!647546 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483803 () Bool)

(declare-fun res!1008645 () Bool)

(assert (=> b!1483803 (=> (not res!1008645) (not e!831976))))

(assert (=> b!1483803 (= res!1008645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483804 () Bool)

(declare-fun res!1008648 () Bool)

(assert (=> b!1483804 (=> (not res!1008648) (not e!831974))))

(assert (=> b!1483804 (= res!1008648 (or (= (select (arr!48011 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48011 a!2862) intermediateBeforeIndex!19) (select (arr!48011 a!2862) j!93))))))

(declare-fun b!1483805 () Bool)

(declare-fun res!1008646 () Bool)

(assert (=> b!1483805 (=> (not res!1008646) (not e!831975))))

(assert (=> b!1483805 (= res!1008646 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483806 () Bool)

(assert (=> b!1483806 (= e!831971 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647544 lt!647550 mask!2687) (seekEntryOrOpen!0 lt!647544 lt!647550 mask!2687)))))

(declare-fun b!1483807 () Bool)

(declare-fun res!1008640 () Bool)

(assert (=> b!1483807 (=> (not res!1008640) (not e!831976))))

(assert (=> b!1483807 (= res!1008640 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48561 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48561 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48561 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483808 () Bool)

(declare-fun res!1008633 () Bool)

(assert (=> b!1483808 (=> (not res!1008633) (not e!831976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483808 (= res!1008633 (validKeyInArray!0 (select (arr!48011 a!2862) j!93)))))

(declare-fun b!1483809 () Bool)

(declare-fun res!1008644 () Bool)

(assert (=> b!1483809 (=> (not res!1008644) (not e!831969))))

(assert (=> b!1483809 (= res!1008644 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48011 a!2862) j!93) a!2862 mask!2687) lt!647545))))

(declare-fun b!1483810 () Bool)

(assert (=> b!1483810 (= e!831969 e!831975)))

(declare-fun res!1008643 () Bool)

(assert (=> b!1483810 (=> (not res!1008643) (not e!831975))))

(assert (=> b!1483810 (= res!1008643 (= lt!647549 (Intermediate!12251 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483810 (= lt!647549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647544 mask!2687) lt!647544 lt!647550 mask!2687))))

(assert (=> b!1483810 (= lt!647544 (select (store (arr!48011 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483811 () Bool)

(declare-fun res!1008642 () Bool)

(assert (=> b!1483811 (=> (not res!1008642) (not e!831976))))

(assert (=> b!1483811 (= res!1008642 (validKeyInArray!0 (select (arr!48011 a!2862) i!1006)))))

(declare-fun b!1483812 () Bool)

(assert (=> b!1483812 (= e!831976 e!831977)))

(declare-fun res!1008641 () Bool)

(assert (=> b!1483812 (=> (not res!1008641) (not e!831977))))

(assert (=> b!1483812 (= res!1008641 (= (select (store (arr!48011 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483812 (= lt!647550 (array!99471 (store (arr!48011 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48561 a!2862)))))

(assert (= (and start!126508 res!1008638) b!1483797))

(assert (= (and b!1483797 res!1008649) b!1483811))

(assert (= (and b!1483811 res!1008642) b!1483808))

(assert (= (and b!1483808 res!1008633) b!1483803))

(assert (= (and b!1483803 res!1008645) b!1483800))

(assert (= (and b!1483800 res!1008631) b!1483807))

(assert (= (and b!1483807 res!1008640) b!1483812))

(assert (= (and b!1483812 res!1008641) b!1483799))

(assert (= (and b!1483799 res!1008636) b!1483809))

(assert (= (and b!1483809 res!1008644) b!1483810))

(assert (= (and b!1483810 res!1008643) b!1483793))

(assert (= (and b!1483793 c!137103) b!1483798))

(assert (= (and b!1483793 (not c!137103)) b!1483806))

(assert (= (and b!1483793 res!1008647) b!1483805))

(assert (= (and b!1483805 res!1008646) b!1483801))

(assert (= (and b!1483801 res!1008639) b!1483795))

(assert (= (and b!1483795 res!1008637) b!1483804))

(assert (= (and b!1483804 res!1008648) b!1483796))

(assert (= (and b!1483796 (not res!1008632)) b!1483794))

(assert (= (and b!1483794 res!1008634) b!1483792))

(assert (= (and b!1483801 (not res!1008635)) b!1483802))

(declare-fun m!1369213 () Bool)

(assert (=> b!1483803 m!1369213))

(declare-fun m!1369215 () Bool)

(assert (=> b!1483806 m!1369215))

(declare-fun m!1369217 () Bool)

(assert (=> b!1483806 m!1369217))

(declare-fun m!1369219 () Bool)

(assert (=> b!1483795 m!1369219))

(assert (=> b!1483795 m!1369219))

(declare-fun m!1369221 () Bool)

(assert (=> b!1483795 m!1369221))

(declare-fun m!1369223 () Bool)

(assert (=> b!1483810 m!1369223))

(assert (=> b!1483810 m!1369223))

(declare-fun m!1369225 () Bool)

(assert (=> b!1483810 m!1369225))

(declare-fun m!1369227 () Bool)

(assert (=> b!1483810 m!1369227))

(declare-fun m!1369229 () Bool)

(assert (=> b!1483810 m!1369229))

(declare-fun m!1369231 () Bool)

(assert (=> b!1483796 m!1369231))

(assert (=> b!1483796 m!1369219))

(assert (=> b!1483796 m!1369227))

(declare-fun m!1369233 () Bool)

(assert (=> b!1483796 m!1369233))

(assert (=> b!1483809 m!1369219))

(assert (=> b!1483809 m!1369219))

(declare-fun m!1369235 () Bool)

(assert (=> b!1483809 m!1369235))

(declare-fun m!1369237 () Bool)

(assert (=> b!1483801 m!1369237))

(assert (=> b!1483801 m!1369227))

(assert (=> b!1483801 m!1369233))

(assert (=> b!1483801 m!1369231))

(declare-fun m!1369239 () Bool)

(assert (=> b!1483801 m!1369239))

(assert (=> b!1483801 m!1369219))

(assert (=> b!1483799 m!1369219))

(assert (=> b!1483799 m!1369219))

(declare-fun m!1369241 () Bool)

(assert (=> b!1483799 m!1369241))

(assert (=> b!1483799 m!1369241))

(assert (=> b!1483799 m!1369219))

(declare-fun m!1369243 () Bool)

(assert (=> b!1483799 m!1369243))

(assert (=> b!1483792 m!1369217))

(assert (=> b!1483792 m!1369215))

(declare-fun m!1369245 () Bool)

(assert (=> b!1483804 m!1369245))

(assert (=> b!1483804 m!1369219))

(declare-fun m!1369247 () Bool)

(assert (=> b!1483798 m!1369247))

(declare-fun m!1369249 () Bool)

(assert (=> b!1483800 m!1369249))

(declare-fun m!1369251 () Bool)

(assert (=> b!1483802 m!1369251))

(declare-fun m!1369253 () Bool)

(assert (=> b!1483811 m!1369253))

(assert (=> b!1483811 m!1369253))

(declare-fun m!1369255 () Bool)

(assert (=> b!1483811 m!1369255))

(assert (=> b!1483812 m!1369227))

(declare-fun m!1369257 () Bool)

(assert (=> b!1483812 m!1369257))

(assert (=> b!1483808 m!1369219))

(assert (=> b!1483808 m!1369219))

(declare-fun m!1369259 () Bool)

(assert (=> b!1483808 m!1369259))

(declare-fun m!1369261 () Bool)

(assert (=> start!126508 m!1369261))

(declare-fun m!1369263 () Bool)

(assert (=> start!126508 m!1369263))

(push 1)

