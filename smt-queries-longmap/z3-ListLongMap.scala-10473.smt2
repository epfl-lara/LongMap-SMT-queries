; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123404 () Bool)

(assert start!123404)

(declare-fun b!1429614 () Bool)

(declare-fun res!963565 () Bool)

(declare-fun e!807508 () Bool)

(assert (=> b!1429614 (=> (not res!963565) (not e!807508))))

(declare-datatypes ((array!97487 0))(
  ( (array!97488 (arr!47053 (Array (_ BitVec 32) (_ BitVec 64))) (size!47604 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97487)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429614 (= res!963565 (validKeyInArray!0 (select (arr!47053 a!2831) j!81)))))

(declare-fun b!1429615 () Bool)

(declare-fun e!807507 () Bool)

(declare-fun e!807509 () Bool)

(assert (=> b!1429615 (= e!807507 e!807509)))

(declare-fun res!963569 () Bool)

(assert (=> b!1429615 (=> (not res!963569) (not e!807509))))

(declare-fun lt!629396 () (_ BitVec 64))

(declare-fun lt!629393 () array!97487)

(declare-datatypes ((SeekEntryResult!11234 0))(
  ( (MissingZero!11234 (index!47328 (_ BitVec 32))) (Found!11234 (index!47329 (_ BitVec 32))) (Intermediate!11234 (undefined!12046 Bool) (index!47330 (_ BitVec 32)) (x!129127 (_ BitVec 32))) (Undefined!11234) (MissingVacant!11234 (index!47331 (_ BitVec 32))) )
))
(declare-fun lt!629394 () SeekEntryResult!11234)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97487 (_ BitVec 32)) SeekEntryResult!11234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429615 (= res!963569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629396 mask!2608) lt!629396 lt!629393 mask!2608) lt!629394))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429615 (= lt!629394 (Intermediate!11234 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429615 (= lt!629396 (select (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429615 (= lt!629393 (array!97488 (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47604 a!2831)))))

(declare-fun res!963563 () Bool)

(assert (=> start!123404 (=> (not res!963563) (not e!807508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123404 (= res!963563 (validMask!0 mask!2608))))

(assert (=> start!123404 e!807508))

(assert (=> start!123404 true))

(declare-fun array_inv!36334 (array!97487) Bool)

(assert (=> start!123404 (array_inv!36334 a!2831)))

(declare-fun b!1429616 () Bool)

(declare-fun res!963562 () Bool)

(assert (=> b!1429616 (=> (not res!963562) (not e!807509))))

(declare-fun lt!629392 () SeekEntryResult!11234)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429616 (= res!963562 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!629392))))

(declare-fun b!1429617 () Bool)

(declare-fun res!963571 () Bool)

(assert (=> b!1429617 (=> (not res!963571) (not e!807508))))

(assert (=> b!1429617 (= res!963571 (validKeyInArray!0 (select (arr!47053 a!2831) i!982)))))

(declare-fun b!1429618 () Bool)

(declare-fun e!807505 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97487 (_ BitVec 32)) SeekEntryResult!11234)

(assert (=> b!1429618 (= e!807505 (= (seekEntryOrOpen!0 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) (Found!11234 j!81)))))

(declare-fun b!1429619 () Bool)

(assert (=> b!1429619 (= e!807508 e!807507)))

(declare-fun res!963568 () Bool)

(assert (=> b!1429619 (=> (not res!963568) (not e!807507))))

(assert (=> b!1429619 (= res!963568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47053 a!2831) j!81) mask!2608) (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!629392))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429619 (= lt!629392 (Intermediate!11234 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429620 () Bool)

(declare-fun res!963570 () Bool)

(assert (=> b!1429620 (=> (not res!963570) (not e!807508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97487 (_ BitVec 32)) Bool)

(assert (=> b!1429620 (= res!963570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429621 () Bool)

(declare-fun res!963566 () Bool)

(assert (=> b!1429621 (=> (not res!963566) (not e!807508))))

(declare-datatypes ((List!33550 0))(
  ( (Nil!33547) (Cons!33546 (h!34868 (_ BitVec 64)) (t!48236 List!33550)) )
))
(declare-fun arrayNoDuplicates!0 (array!97487 (_ BitVec 32) List!33550) Bool)

(assert (=> b!1429621 (= res!963566 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33547))))

(declare-fun b!1429622 () Bool)

(declare-fun res!963561 () Bool)

(assert (=> b!1429622 (=> (not res!963561) (not e!807508))))

(assert (=> b!1429622 (= res!963561 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47604 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47604 a!2831))))))

(declare-fun b!1429623 () Bool)

(declare-fun res!963564 () Bool)

(assert (=> b!1429623 (=> (not res!963564) (not e!807509))))

(assert (=> b!1429623 (= res!963564 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629396 lt!629393 mask!2608) lt!629394))))

(declare-fun b!1429624 () Bool)

(assert (=> b!1429624 (= e!807509 (not true))))

(assert (=> b!1429624 e!807505))

(declare-fun res!963559 () Bool)

(assert (=> b!1429624 (=> (not res!963559) (not e!807505))))

(assert (=> b!1429624 (= res!963559 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48245 0))(
  ( (Unit!48246) )
))
(declare-fun lt!629395 () Unit!48245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48245)

(assert (=> b!1429624 (= lt!629395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429625 () Bool)

(declare-fun res!963560 () Bool)

(assert (=> b!1429625 (=> (not res!963560) (not e!807509))))

(assert (=> b!1429625 (= res!963560 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429626 () Bool)

(declare-fun res!963567 () Bool)

(assert (=> b!1429626 (=> (not res!963567) (not e!807508))))

(assert (=> b!1429626 (= res!963567 (and (= (size!47604 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47604 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47604 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123404 res!963563) b!1429626))

(assert (= (and b!1429626 res!963567) b!1429617))

(assert (= (and b!1429617 res!963571) b!1429614))

(assert (= (and b!1429614 res!963565) b!1429620))

(assert (= (and b!1429620 res!963570) b!1429621))

(assert (= (and b!1429621 res!963566) b!1429622))

(assert (= (and b!1429622 res!963561) b!1429619))

(assert (= (and b!1429619 res!963568) b!1429615))

(assert (= (and b!1429615 res!963569) b!1429616))

(assert (= (and b!1429616 res!963562) b!1429623))

(assert (= (and b!1429623 res!963564) b!1429625))

(assert (= (and b!1429625 res!963560) b!1429624))

(assert (= (and b!1429624 res!963559) b!1429618))

(declare-fun m!1319973 () Bool)

(assert (=> b!1429619 m!1319973))

(assert (=> b!1429619 m!1319973))

(declare-fun m!1319975 () Bool)

(assert (=> b!1429619 m!1319975))

(assert (=> b!1429619 m!1319975))

(assert (=> b!1429619 m!1319973))

(declare-fun m!1319977 () Bool)

(assert (=> b!1429619 m!1319977))

(declare-fun m!1319979 () Bool)

(assert (=> b!1429621 m!1319979))

(declare-fun m!1319981 () Bool)

(assert (=> b!1429617 m!1319981))

(assert (=> b!1429617 m!1319981))

(declare-fun m!1319983 () Bool)

(assert (=> b!1429617 m!1319983))

(assert (=> b!1429616 m!1319973))

(assert (=> b!1429616 m!1319973))

(declare-fun m!1319985 () Bool)

(assert (=> b!1429616 m!1319985))

(declare-fun m!1319987 () Bool)

(assert (=> b!1429623 m!1319987))

(assert (=> b!1429614 m!1319973))

(assert (=> b!1429614 m!1319973))

(declare-fun m!1319989 () Bool)

(assert (=> b!1429614 m!1319989))

(declare-fun m!1319991 () Bool)

(assert (=> start!123404 m!1319991))

(declare-fun m!1319993 () Bool)

(assert (=> start!123404 m!1319993))

(declare-fun m!1319995 () Bool)

(assert (=> b!1429620 m!1319995))

(declare-fun m!1319997 () Bool)

(assert (=> b!1429624 m!1319997))

(declare-fun m!1319999 () Bool)

(assert (=> b!1429624 m!1319999))

(declare-fun m!1320001 () Bool)

(assert (=> b!1429615 m!1320001))

(assert (=> b!1429615 m!1320001))

(declare-fun m!1320003 () Bool)

(assert (=> b!1429615 m!1320003))

(declare-fun m!1320005 () Bool)

(assert (=> b!1429615 m!1320005))

(declare-fun m!1320007 () Bool)

(assert (=> b!1429615 m!1320007))

(assert (=> b!1429618 m!1319973))

(assert (=> b!1429618 m!1319973))

(declare-fun m!1320009 () Bool)

(assert (=> b!1429618 m!1320009))

(check-sat (not b!1429617) (not b!1429615) (not b!1429620) (not b!1429619) (not start!123404) (not b!1429623) (not b!1429618) (not b!1429616) (not b!1429621) (not b!1429624) (not b!1429614))
(check-sat)
