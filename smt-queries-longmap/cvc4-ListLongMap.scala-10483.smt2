; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123280 () Bool)

(assert start!123280)

(declare-fun b!1429722 () Bool)

(declare-fun res!964362 () Bool)

(declare-fun e!807250 () Bool)

(assert (=> b!1429722 (=> (not res!964362) (not e!807250))))

(declare-datatypes ((SeekEntryResult!11311 0))(
  ( (MissingZero!11311 (index!47636 (_ BitVec 32))) (Found!11311 (index!47637 (_ BitVec 32))) (Intermediate!11311 (undefined!12123 Bool) (index!47638 (_ BitVec 32)) (x!129265 (_ BitVec 32))) (Undefined!11311) (MissingVacant!11311 (index!47639 (_ BitVec 32))) )
))
(declare-fun lt!629478 () SeekEntryResult!11311)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97441 0))(
  ( (array!97442 (arr!47032 (Array (_ BitVec 32) (_ BitVec 64))) (size!47582 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97441)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97441 (_ BitVec 32)) SeekEntryResult!11311)

(assert (=> b!1429722 (= res!964362 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!629478))))

(declare-fun b!1429723 () Bool)

(declare-fun res!964355 () Bool)

(declare-fun e!807249 () Bool)

(assert (=> b!1429723 (=> (not res!964355) (not e!807249))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429723 (= res!964355 (and (= (size!47582 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47582 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47582 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429724 () Bool)

(declare-fun res!964361 () Bool)

(assert (=> b!1429724 (=> (not res!964361) (not e!807249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429724 (= res!964361 (validKeyInArray!0 (select (arr!47032 a!2831) i!982)))))

(declare-fun b!1429725 () Bool)

(declare-fun res!964356 () Bool)

(assert (=> b!1429725 (=> (not res!964356) (not e!807250))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429725 (= res!964356 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429726 () Bool)

(declare-fun e!807251 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97441 (_ BitVec 32)) SeekEntryResult!11311)

(assert (=> b!1429726 (= e!807251 (= (seekEntryOrOpen!0 (select (arr!47032 a!2831) j!81) a!2831 mask!2608) (Found!11311 j!81)))))

(declare-fun b!1429727 () Bool)

(assert (=> b!1429727 (= e!807250 (not true))))

(assert (=> b!1429727 e!807251))

(declare-fun res!964360 () Bool)

(assert (=> b!1429727 (=> (not res!964360) (not e!807251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97441 (_ BitVec 32)) Bool)

(assert (=> b!1429727 (= res!964360 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48368 0))(
  ( (Unit!48369) )
))
(declare-fun lt!629474 () Unit!48368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48368)

(assert (=> b!1429727 (= lt!629474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429728 () Bool)

(declare-fun res!964351 () Bool)

(assert (=> b!1429728 (=> (not res!964351) (not e!807250))))

(declare-fun lt!629476 () (_ BitVec 64))

(declare-fun lt!629477 () array!97441)

(declare-fun lt!629475 () SeekEntryResult!11311)

(assert (=> b!1429728 (= res!964351 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629476 lt!629477 mask!2608) lt!629475))))

(declare-fun b!1429729 () Bool)

(declare-fun res!964358 () Bool)

(assert (=> b!1429729 (=> (not res!964358) (not e!807249))))

(assert (=> b!1429729 (= res!964358 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47582 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47582 a!2831))))))

(declare-fun b!1429730 () Bool)

(declare-fun e!807247 () Bool)

(assert (=> b!1429730 (= e!807247 e!807250)))

(declare-fun res!964357 () Bool)

(assert (=> b!1429730 (=> (not res!964357) (not e!807250))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429730 (= res!964357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629476 mask!2608) lt!629476 lt!629477 mask!2608) lt!629475))))

(assert (=> b!1429730 (= lt!629475 (Intermediate!11311 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429730 (= lt!629476 (select (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429730 (= lt!629477 (array!97442 (store (arr!47032 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47582 a!2831)))))

(declare-fun b!1429731 () Bool)

(declare-fun res!964352 () Bool)

(assert (=> b!1429731 (=> (not res!964352) (not e!807249))))

(assert (=> b!1429731 (= res!964352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!964363 () Bool)

(assert (=> start!123280 (=> (not res!964363) (not e!807249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123280 (= res!964363 (validMask!0 mask!2608))))

(assert (=> start!123280 e!807249))

(assert (=> start!123280 true))

(declare-fun array_inv!36060 (array!97441) Bool)

(assert (=> start!123280 (array_inv!36060 a!2831)))

(declare-fun b!1429732 () Bool)

(declare-fun res!964354 () Bool)

(assert (=> b!1429732 (=> (not res!964354) (not e!807249))))

(declare-datatypes ((List!33542 0))(
  ( (Nil!33539) (Cons!33538 (h!34852 (_ BitVec 64)) (t!48236 List!33542)) )
))
(declare-fun arrayNoDuplicates!0 (array!97441 (_ BitVec 32) List!33542) Bool)

(assert (=> b!1429732 (= res!964354 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33539))))

(declare-fun b!1429733 () Bool)

(declare-fun res!964359 () Bool)

(assert (=> b!1429733 (=> (not res!964359) (not e!807249))))

(assert (=> b!1429733 (= res!964359 (validKeyInArray!0 (select (arr!47032 a!2831) j!81)))))

(declare-fun b!1429734 () Bool)

(assert (=> b!1429734 (= e!807249 e!807247)))

(declare-fun res!964353 () Bool)

(assert (=> b!1429734 (=> (not res!964353) (not e!807247))))

(assert (=> b!1429734 (= res!964353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47032 a!2831) j!81) mask!2608) (select (arr!47032 a!2831) j!81) a!2831 mask!2608) lt!629478))))

(assert (=> b!1429734 (= lt!629478 (Intermediate!11311 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123280 res!964363) b!1429723))

(assert (= (and b!1429723 res!964355) b!1429724))

(assert (= (and b!1429724 res!964361) b!1429733))

(assert (= (and b!1429733 res!964359) b!1429731))

(assert (= (and b!1429731 res!964352) b!1429732))

(assert (= (and b!1429732 res!964354) b!1429729))

(assert (= (and b!1429729 res!964358) b!1429734))

(assert (= (and b!1429734 res!964353) b!1429730))

(assert (= (and b!1429730 res!964357) b!1429722))

(assert (= (and b!1429722 res!964362) b!1429728))

(assert (= (and b!1429728 res!964351) b!1429725))

(assert (= (and b!1429725 res!964356) b!1429727))

(assert (= (and b!1429727 res!964360) b!1429726))

(declare-fun m!1319815 () Bool)

(assert (=> b!1429722 m!1319815))

(assert (=> b!1429722 m!1319815))

(declare-fun m!1319817 () Bool)

(assert (=> b!1429722 m!1319817))

(declare-fun m!1319819 () Bool)

(assert (=> b!1429731 m!1319819))

(assert (=> b!1429734 m!1319815))

(assert (=> b!1429734 m!1319815))

(declare-fun m!1319821 () Bool)

(assert (=> b!1429734 m!1319821))

(assert (=> b!1429734 m!1319821))

(assert (=> b!1429734 m!1319815))

(declare-fun m!1319823 () Bool)

(assert (=> b!1429734 m!1319823))

(assert (=> b!1429733 m!1319815))

(assert (=> b!1429733 m!1319815))

(declare-fun m!1319825 () Bool)

(assert (=> b!1429733 m!1319825))

(declare-fun m!1319827 () Bool)

(assert (=> start!123280 m!1319827))

(declare-fun m!1319829 () Bool)

(assert (=> start!123280 m!1319829))

(declare-fun m!1319831 () Bool)

(assert (=> b!1429727 m!1319831))

(declare-fun m!1319833 () Bool)

(assert (=> b!1429727 m!1319833))

(declare-fun m!1319835 () Bool)

(assert (=> b!1429730 m!1319835))

(assert (=> b!1429730 m!1319835))

(declare-fun m!1319837 () Bool)

(assert (=> b!1429730 m!1319837))

(declare-fun m!1319839 () Bool)

(assert (=> b!1429730 m!1319839))

(declare-fun m!1319841 () Bool)

(assert (=> b!1429730 m!1319841))

(assert (=> b!1429726 m!1319815))

(assert (=> b!1429726 m!1319815))

(declare-fun m!1319843 () Bool)

(assert (=> b!1429726 m!1319843))

(declare-fun m!1319845 () Bool)

(assert (=> b!1429724 m!1319845))

(assert (=> b!1429724 m!1319845))

(declare-fun m!1319847 () Bool)

(assert (=> b!1429724 m!1319847))

(declare-fun m!1319849 () Bool)

(assert (=> b!1429732 m!1319849))

(declare-fun m!1319851 () Bool)

(assert (=> b!1429728 m!1319851))

(push 1)

