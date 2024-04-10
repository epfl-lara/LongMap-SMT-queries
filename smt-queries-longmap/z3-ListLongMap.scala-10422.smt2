; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122696 () Bool)

(assert start!122696)

(declare-fun b!1421467 () Bool)

(declare-fun e!803745 () Bool)

(assert (=> b!1421467 (= e!803745 (not true))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97061 0))(
  ( (array!97062 (arr!46848 (Array (_ BitVec 32) (_ BitVec 64))) (size!47398 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97061)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97061 (_ BitVec 32)) Bool)

(assert (=> b!1421467 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48102 0))(
  ( (Unit!48103) )
))
(declare-fun lt!626279 () Unit!48102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48102)

(assert (=> b!1421467 (= lt!626279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421468 () Bool)

(declare-fun res!956905 () Bool)

(assert (=> b!1421468 (=> (not res!956905) (not e!803745))))

(declare-datatypes ((SeekEntryResult!11133 0))(
  ( (MissingZero!11133 (index!46924 (_ BitVec 32))) (Found!11133 (index!46925 (_ BitVec 32))) (Intermediate!11133 (undefined!11945 Bool) (index!46926 (_ BitVec 32)) (x!128575 (_ BitVec 32))) (Undefined!11133) (MissingVacant!11133 (index!46927 (_ BitVec 32))) )
))
(declare-fun lt!626277 () SeekEntryResult!11133)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97061 (_ BitVec 32)) SeekEntryResult!11133)

(assert (=> b!1421468 (= res!956905 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46848 a!2831) j!81) a!2831 mask!2608) lt!626277))))

(declare-fun b!1421469 () Bool)

(declare-fun res!956902 () Bool)

(declare-fun e!803747 () Bool)

(assert (=> b!1421469 (=> (not res!956902) (not e!803747))))

(assert (=> b!1421469 (= res!956902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956906 () Bool)

(assert (=> start!122696 (=> (not res!956906) (not e!803747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122696 (= res!956906 (validMask!0 mask!2608))))

(assert (=> start!122696 e!803747))

(assert (=> start!122696 true))

(declare-fun array_inv!35876 (array!97061) Bool)

(assert (=> start!122696 (array_inv!35876 a!2831)))

(declare-fun b!1421470 () Bool)

(declare-fun res!956903 () Bool)

(assert (=> b!1421470 (=> (not res!956903) (not e!803747))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421470 (= res!956903 (and (= (size!47398 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47398 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47398 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421471 () Bool)

(declare-fun res!956900 () Bool)

(assert (=> b!1421471 (=> (not res!956900) (not e!803747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421471 (= res!956900 (validKeyInArray!0 (select (arr!46848 a!2831) j!81)))))

(declare-fun b!1421472 () Bool)

(declare-fun e!803746 () Bool)

(assert (=> b!1421472 (= e!803746 e!803745)))

(declare-fun res!956908 () Bool)

(assert (=> b!1421472 (=> (not res!956908) (not e!803745))))

(declare-fun lt!626280 () (_ BitVec 64))

(declare-fun lt!626276 () array!97061)

(declare-fun lt!626278 () SeekEntryResult!11133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421472 (= res!956908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626280 mask!2608) lt!626280 lt!626276 mask!2608) lt!626278))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421472 (= lt!626278 (Intermediate!11133 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421472 (= lt!626280 (select (store (arr!46848 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421472 (= lt!626276 (array!97062 (store (arr!46848 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47398 a!2831)))))

(declare-fun b!1421473 () Bool)

(declare-fun res!956904 () Bool)

(assert (=> b!1421473 (=> (not res!956904) (not e!803747))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421473 (= res!956904 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47398 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47398 a!2831))))))

(declare-fun b!1421474 () Bool)

(assert (=> b!1421474 (= e!803747 e!803746)))

(declare-fun res!956910 () Bool)

(assert (=> b!1421474 (=> (not res!956910) (not e!803746))))

(assert (=> b!1421474 (= res!956910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46848 a!2831) j!81) mask!2608) (select (arr!46848 a!2831) j!81) a!2831 mask!2608) lt!626277))))

(assert (=> b!1421474 (= lt!626277 (Intermediate!11133 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421475 () Bool)

(declare-fun res!956909 () Bool)

(assert (=> b!1421475 (=> (not res!956909) (not e!803745))))

(assert (=> b!1421475 (= res!956909 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421476 () Bool)

(declare-fun res!956911 () Bool)

(assert (=> b!1421476 (=> (not res!956911) (not e!803747))))

(assert (=> b!1421476 (= res!956911 (validKeyInArray!0 (select (arr!46848 a!2831) i!982)))))

(declare-fun b!1421477 () Bool)

(declare-fun res!956901 () Bool)

(assert (=> b!1421477 (=> (not res!956901) (not e!803745))))

(assert (=> b!1421477 (= res!956901 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626280 lt!626276 mask!2608) lt!626278))))

(declare-fun b!1421478 () Bool)

(declare-fun res!956907 () Bool)

(assert (=> b!1421478 (=> (not res!956907) (not e!803747))))

(declare-datatypes ((List!33358 0))(
  ( (Nil!33355) (Cons!33354 (h!34656 (_ BitVec 64)) (t!48052 List!33358)) )
))
(declare-fun arrayNoDuplicates!0 (array!97061 (_ BitVec 32) List!33358) Bool)

(assert (=> b!1421478 (= res!956907 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33355))))

(assert (= (and start!122696 res!956906) b!1421470))

(assert (= (and b!1421470 res!956903) b!1421476))

(assert (= (and b!1421476 res!956911) b!1421471))

(assert (= (and b!1421471 res!956900) b!1421469))

(assert (= (and b!1421469 res!956902) b!1421478))

(assert (= (and b!1421478 res!956907) b!1421473))

(assert (= (and b!1421473 res!956904) b!1421474))

(assert (= (and b!1421474 res!956910) b!1421472))

(assert (= (and b!1421472 res!956908) b!1421468))

(assert (= (and b!1421468 res!956905) b!1421477))

(assert (= (and b!1421477 res!956901) b!1421475))

(assert (= (and b!1421475 res!956909) b!1421467))

(declare-fun m!1312011 () Bool)

(assert (=> b!1421474 m!1312011))

(assert (=> b!1421474 m!1312011))

(declare-fun m!1312013 () Bool)

(assert (=> b!1421474 m!1312013))

(assert (=> b!1421474 m!1312013))

(assert (=> b!1421474 m!1312011))

(declare-fun m!1312015 () Bool)

(assert (=> b!1421474 m!1312015))

(assert (=> b!1421468 m!1312011))

(assert (=> b!1421468 m!1312011))

(declare-fun m!1312017 () Bool)

(assert (=> b!1421468 m!1312017))

(declare-fun m!1312019 () Bool)

(assert (=> b!1421477 m!1312019))

(declare-fun m!1312021 () Bool)

(assert (=> start!122696 m!1312021))

(declare-fun m!1312023 () Bool)

(assert (=> start!122696 m!1312023))

(declare-fun m!1312025 () Bool)

(assert (=> b!1421469 m!1312025))

(declare-fun m!1312027 () Bool)

(assert (=> b!1421478 m!1312027))

(declare-fun m!1312029 () Bool)

(assert (=> b!1421467 m!1312029))

(declare-fun m!1312031 () Bool)

(assert (=> b!1421467 m!1312031))

(declare-fun m!1312033 () Bool)

(assert (=> b!1421476 m!1312033))

(assert (=> b!1421476 m!1312033))

(declare-fun m!1312035 () Bool)

(assert (=> b!1421476 m!1312035))

(assert (=> b!1421471 m!1312011))

(assert (=> b!1421471 m!1312011))

(declare-fun m!1312037 () Bool)

(assert (=> b!1421471 m!1312037))

(declare-fun m!1312039 () Bool)

(assert (=> b!1421472 m!1312039))

(assert (=> b!1421472 m!1312039))

(declare-fun m!1312041 () Bool)

(assert (=> b!1421472 m!1312041))

(declare-fun m!1312043 () Bool)

(assert (=> b!1421472 m!1312043))

(declare-fun m!1312045 () Bool)

(assert (=> b!1421472 m!1312045))

(check-sat (not b!1421474) (not b!1421478) (not b!1421476) (not b!1421472) (not b!1421471) (not b!1421469) (not b!1421477) (not b!1421468) (not b!1421467) (not start!122696))
(check-sat)
