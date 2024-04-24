; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123500 () Bool)

(assert start!123500)

(declare-fun b!1430742 () Bool)

(declare-fun res!964486 () Bool)

(declare-fun e!808013 () Bool)

(assert (=> b!1430742 (=> (not res!964486) (not e!808013))))

(declare-datatypes ((array!97532 0))(
  ( (array!97533 (arr!47074 (Array (_ BitVec 32) (_ BitVec 64))) (size!47625 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97532)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97532 (_ BitVec 32)) Bool)

(assert (=> b!1430742 (= res!964486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430743 () Bool)

(declare-fun res!964487 () Bool)

(declare-fun e!808011 () Bool)

(assert (=> b!1430743 (=> (not res!964487) (not e!808011))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430743 (= res!964487 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430744 () Bool)

(declare-fun res!964489 () Bool)

(assert (=> b!1430744 (=> (not res!964489) (not e!808011))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629842 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11255 0))(
  ( (MissingZero!11255 (index!47412 (_ BitVec 32))) (Found!11255 (index!47413 (_ BitVec 32))) (Intermediate!11255 (undefined!12067 Bool) (index!47414 (_ BitVec 32)) (x!129210 (_ BitVec 32))) (Undefined!11255) (MissingVacant!11255 (index!47415 (_ BitVec 32))) )
))
(declare-fun lt!629841 () SeekEntryResult!11255)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!629839 () array!97532)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97532 (_ BitVec 32)) SeekEntryResult!11255)

(assert (=> b!1430744 (= res!964489 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629842 lt!629839 mask!2608) lt!629841))))

(declare-fun res!964493 () Bool)

(assert (=> start!123500 (=> (not res!964493) (not e!808013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123500 (= res!964493 (validMask!0 mask!2608))))

(assert (=> start!123500 e!808013))

(assert (=> start!123500 true))

(declare-fun array_inv!36355 (array!97532) Bool)

(assert (=> start!123500 (array_inv!36355 a!2831)))

(declare-fun e!808010 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1430745 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97532 (_ BitVec 32)) SeekEntryResult!11255)

(assert (=> b!1430745 (= e!808010 (= (seekEntryOrOpen!0 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) (Found!11255 j!81)))))

(declare-fun b!1430746 () Bool)

(declare-fun res!964488 () Bool)

(assert (=> b!1430746 (=> (not res!964488) (not e!808013))))

(declare-datatypes ((List!33571 0))(
  ( (Nil!33568) (Cons!33567 (h!34892 (_ BitVec 64)) (t!48257 List!33571)) )
))
(declare-fun arrayNoDuplicates!0 (array!97532 (_ BitVec 32) List!33571) Bool)

(assert (=> b!1430746 (= res!964488 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33568))))

(declare-fun b!1430747 () Bool)

(declare-fun res!964495 () Bool)

(assert (=> b!1430747 (=> (not res!964495) (not e!808011))))

(declare-fun lt!629843 () SeekEntryResult!11255)

(assert (=> b!1430747 (= res!964495 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!629843))))

(declare-fun b!1430748 () Bool)

(declare-fun res!964496 () Bool)

(assert (=> b!1430748 (=> (not res!964496) (not e!808013))))

(assert (=> b!1430748 (= res!964496 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47625 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47625 a!2831))))))

(declare-fun b!1430749 () Bool)

(declare-fun res!964492 () Bool)

(assert (=> b!1430749 (=> (not res!964492) (not e!808013))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430749 (= res!964492 (validKeyInArray!0 (select (arr!47074 a!2831) i!982)))))

(declare-fun b!1430750 () Bool)

(declare-fun e!808012 () Bool)

(assert (=> b!1430750 (= e!808013 e!808012)))

(declare-fun res!964491 () Bool)

(assert (=> b!1430750 (=> (not res!964491) (not e!808012))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430750 (= res!964491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47074 a!2831) j!81) mask!2608) (select (arr!47074 a!2831) j!81) a!2831 mask!2608) lt!629843))))

(assert (=> b!1430750 (= lt!629843 (Intermediate!11255 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430751 () Bool)

(declare-fun res!964498 () Bool)

(assert (=> b!1430751 (=> (not res!964498) (not e!808013))))

(assert (=> b!1430751 (= res!964498 (validKeyInArray!0 (select (arr!47074 a!2831) j!81)))))

(declare-fun b!1430752 () Bool)

(declare-fun res!964494 () Bool)

(assert (=> b!1430752 (=> (not res!964494) (not e!808013))))

(assert (=> b!1430752 (= res!964494 (and (= (size!47625 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47625 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47625 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430753 () Bool)

(assert (=> b!1430753 (= e!808012 e!808011)))

(declare-fun res!964490 () Bool)

(assert (=> b!1430753 (=> (not res!964490) (not e!808011))))

(assert (=> b!1430753 (= res!964490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629842 mask!2608) lt!629842 lt!629839 mask!2608) lt!629841))))

(assert (=> b!1430753 (= lt!629841 (Intermediate!11255 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430753 (= lt!629842 (select (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430753 (= lt!629839 (array!97533 (store (arr!47074 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47625 a!2831)))))

(declare-fun b!1430754 () Bool)

(assert (=> b!1430754 (= e!808011 (not true))))

(assert (=> b!1430754 e!808010))

(declare-fun res!964497 () Bool)

(assert (=> b!1430754 (=> (not res!964497) (not e!808010))))

(assert (=> b!1430754 (= res!964497 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48287 0))(
  ( (Unit!48288) )
))
(declare-fun lt!629840 () Unit!48287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48287)

(assert (=> b!1430754 (= lt!629840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123500 res!964493) b!1430752))

(assert (= (and b!1430752 res!964494) b!1430749))

(assert (= (and b!1430749 res!964492) b!1430751))

(assert (= (and b!1430751 res!964498) b!1430742))

(assert (= (and b!1430742 res!964486) b!1430746))

(assert (= (and b!1430746 res!964488) b!1430748))

(assert (= (and b!1430748 res!964496) b!1430750))

(assert (= (and b!1430750 res!964491) b!1430753))

(assert (= (and b!1430753 res!964490) b!1430747))

(assert (= (and b!1430747 res!964495) b!1430744))

(assert (= (and b!1430744 res!964489) b!1430743))

(assert (= (and b!1430743 res!964487) b!1430754))

(assert (= (and b!1430754 res!964497) b!1430745))

(declare-fun m!1320963 () Bool)

(assert (=> b!1430747 m!1320963))

(assert (=> b!1430747 m!1320963))

(declare-fun m!1320965 () Bool)

(assert (=> b!1430747 m!1320965))

(assert (=> b!1430745 m!1320963))

(assert (=> b!1430745 m!1320963))

(declare-fun m!1320967 () Bool)

(assert (=> b!1430745 m!1320967))

(declare-fun m!1320969 () Bool)

(assert (=> b!1430753 m!1320969))

(assert (=> b!1430753 m!1320969))

(declare-fun m!1320971 () Bool)

(assert (=> b!1430753 m!1320971))

(declare-fun m!1320973 () Bool)

(assert (=> b!1430753 m!1320973))

(declare-fun m!1320975 () Bool)

(assert (=> b!1430753 m!1320975))

(declare-fun m!1320977 () Bool)

(assert (=> start!123500 m!1320977))

(declare-fun m!1320979 () Bool)

(assert (=> start!123500 m!1320979))

(declare-fun m!1320981 () Bool)

(assert (=> b!1430746 m!1320981))

(declare-fun m!1320983 () Bool)

(assert (=> b!1430754 m!1320983))

(declare-fun m!1320985 () Bool)

(assert (=> b!1430754 m!1320985))

(declare-fun m!1320987 () Bool)

(assert (=> b!1430749 m!1320987))

(assert (=> b!1430749 m!1320987))

(declare-fun m!1320989 () Bool)

(assert (=> b!1430749 m!1320989))

(declare-fun m!1320991 () Bool)

(assert (=> b!1430744 m!1320991))

(declare-fun m!1320993 () Bool)

(assert (=> b!1430742 m!1320993))

(assert (=> b!1430751 m!1320963))

(assert (=> b!1430751 m!1320963))

(declare-fun m!1320995 () Bool)

(assert (=> b!1430751 m!1320995))

(assert (=> b!1430750 m!1320963))

(assert (=> b!1430750 m!1320963))

(declare-fun m!1320997 () Bool)

(assert (=> b!1430750 m!1320997))

(assert (=> b!1430750 m!1320997))

(assert (=> b!1430750 m!1320963))

(declare-fun m!1320999 () Bool)

(assert (=> b!1430750 m!1320999))

(check-sat (not b!1430751) (not b!1430749) (not b!1430746) (not b!1430745) (not b!1430750) (not start!123500) (not b!1430753) (not b!1430747) (not b!1430754) (not b!1430742) (not b!1430744))
(check-sat)
