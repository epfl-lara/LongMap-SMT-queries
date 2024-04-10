; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122838 () Bool)

(assert start!122838)

(declare-fun b!1424751 () Bool)

(declare-fun e!805157 () Bool)

(declare-fun e!805156 () Bool)

(assert (=> b!1424751 (= e!805157 (not e!805156))))

(declare-fun res!960194 () Bool)

(assert (=> b!1424751 (=> res!960194 e!805156)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97203 0))(
  ( (array!97204 (arr!46919 (Array (_ BitVec 32) (_ BitVec 64))) (size!47469 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97203)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424751 (= res!960194 (or (= (select (arr!46919 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46919 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46919 a!2831) index!585) (select (arr!46919 a!2831) j!81)) (= (select (store (arr!46919 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805154 () Bool)

(assert (=> b!1424751 e!805154))

(declare-fun res!960187 () Bool)

(assert (=> b!1424751 (=> (not res!960187) (not e!805154))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97203 (_ BitVec 32)) Bool)

(assert (=> b!1424751 (= res!960187 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48244 0))(
  ( (Unit!48245) )
))
(declare-fun lt!627687 () Unit!48244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48244)

(assert (=> b!1424751 (= lt!627687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424752 () Bool)

(declare-fun res!960186 () Bool)

(declare-fun e!805151 () Bool)

(assert (=> b!1424752 (=> (not res!960186) (not e!805151))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424752 (= res!960186 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47469 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47469 a!2831))))))

(declare-fun b!1424753 () Bool)

(declare-fun e!805153 () Bool)

(assert (=> b!1424753 (= e!805151 e!805153)))

(declare-fun res!960184 () Bool)

(assert (=> b!1424753 (=> (not res!960184) (not e!805153))))

(declare-datatypes ((SeekEntryResult!11204 0))(
  ( (MissingZero!11204 (index!47208 (_ BitVec 32))) (Found!11204 (index!47209 (_ BitVec 32))) (Intermediate!11204 (undefined!12016 Bool) (index!47210 (_ BitVec 32)) (x!128838 (_ BitVec 32))) (Undefined!11204) (MissingVacant!11204 (index!47211 (_ BitVec 32))) )
))
(declare-fun lt!627692 () SeekEntryResult!11204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97203 (_ BitVec 32)) SeekEntryResult!11204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424753 (= res!960184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46919 a!2831) j!81) mask!2608) (select (arr!46919 a!2831) j!81) a!2831 mask!2608) lt!627692))))

(assert (=> b!1424753 (= lt!627692 (Intermediate!11204 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!960196 () Bool)

(assert (=> start!122838 (=> (not res!960196) (not e!805151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122838 (= res!960196 (validMask!0 mask!2608))))

(assert (=> start!122838 e!805151))

(assert (=> start!122838 true))

(declare-fun array_inv!35947 (array!97203) Bool)

(assert (=> start!122838 (array_inv!35947 a!2831)))

(declare-fun b!1424754 () Bool)

(declare-fun e!805152 () Bool)

(assert (=> b!1424754 (= e!805156 e!805152)))

(declare-fun res!960185 () Bool)

(assert (=> b!1424754 (=> res!960185 e!805152)))

(declare-fun lt!627690 () (_ BitVec 32))

(assert (=> b!1424754 (= res!960185 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627690 #b00000000000000000000000000000000) (bvsge lt!627690 (size!47469 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424754 (= lt!627690 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424755 () Bool)

(declare-fun res!960193 () Bool)

(assert (=> b!1424755 (=> (not res!960193) (not e!805151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424755 (= res!960193 (validKeyInArray!0 (select (arr!46919 a!2831) j!81)))))

(declare-fun b!1424756 () Bool)

(declare-fun res!960188 () Bool)

(assert (=> b!1424756 (=> (not res!960188) (not e!805151))))

(assert (=> b!1424756 (= res!960188 (validKeyInArray!0 (select (arr!46919 a!2831) i!982)))))

(declare-fun b!1424757 () Bool)

(declare-fun res!960195 () Bool)

(assert (=> b!1424757 (=> (not res!960195) (not e!805157))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424757 (= res!960195 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424758 () Bool)

(declare-fun res!960198 () Bool)

(assert (=> b!1424758 (=> (not res!960198) (not e!805157))))

(declare-fun lt!627693 () array!97203)

(declare-fun lt!627691 () (_ BitVec 64))

(declare-fun lt!627689 () SeekEntryResult!11204)

(assert (=> b!1424758 (= res!960198 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627691 lt!627693 mask!2608) lt!627689))))

(declare-fun b!1424759 () Bool)

(assert (=> b!1424759 (= e!805152 true)))

(declare-fun lt!627688 () SeekEntryResult!11204)

(assert (=> b!1424759 (= lt!627688 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627690 lt!627691 lt!627693 mask!2608))))

(declare-fun b!1424760 () Bool)

(declare-fun res!960197 () Bool)

(assert (=> b!1424760 (=> (not res!960197) (not e!805157))))

(assert (=> b!1424760 (= res!960197 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46919 a!2831) j!81) a!2831 mask!2608) lt!627692))))

(declare-fun b!1424761 () Bool)

(declare-fun res!960192 () Bool)

(assert (=> b!1424761 (=> res!960192 e!805152)))

(assert (=> b!1424761 (= res!960192 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627690 (select (arr!46919 a!2831) j!81) a!2831 mask!2608) lt!627692)))))

(declare-fun b!1424762 () Bool)

(assert (=> b!1424762 (= e!805153 e!805157)))

(declare-fun res!960191 () Bool)

(assert (=> b!1424762 (=> (not res!960191) (not e!805157))))

(assert (=> b!1424762 (= res!960191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627691 mask!2608) lt!627691 lt!627693 mask!2608) lt!627689))))

(assert (=> b!1424762 (= lt!627689 (Intermediate!11204 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424762 (= lt!627691 (select (store (arr!46919 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424762 (= lt!627693 (array!97204 (store (arr!46919 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47469 a!2831)))))

(declare-fun b!1424763 () Bool)

(declare-fun res!960199 () Bool)

(assert (=> b!1424763 (=> (not res!960199) (not e!805151))))

(declare-datatypes ((List!33429 0))(
  ( (Nil!33426) (Cons!33425 (h!34727 (_ BitVec 64)) (t!48123 List!33429)) )
))
(declare-fun arrayNoDuplicates!0 (array!97203 (_ BitVec 32) List!33429) Bool)

(assert (=> b!1424763 (= res!960199 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33426))))

(declare-fun b!1424764 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97203 (_ BitVec 32)) SeekEntryResult!11204)

(assert (=> b!1424764 (= e!805154 (= (seekEntryOrOpen!0 (select (arr!46919 a!2831) j!81) a!2831 mask!2608) (Found!11204 j!81)))))

(declare-fun b!1424765 () Bool)

(declare-fun res!960190 () Bool)

(assert (=> b!1424765 (=> (not res!960190) (not e!805151))))

(assert (=> b!1424765 (= res!960190 (and (= (size!47469 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47469 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47469 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424766 () Bool)

(declare-fun res!960189 () Bool)

(assert (=> b!1424766 (=> (not res!960189) (not e!805151))))

(assert (=> b!1424766 (= res!960189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122838 res!960196) b!1424765))

(assert (= (and b!1424765 res!960190) b!1424756))

(assert (= (and b!1424756 res!960188) b!1424755))

(assert (= (and b!1424755 res!960193) b!1424766))

(assert (= (and b!1424766 res!960189) b!1424763))

(assert (= (and b!1424763 res!960199) b!1424752))

(assert (= (and b!1424752 res!960186) b!1424753))

(assert (= (and b!1424753 res!960184) b!1424762))

(assert (= (and b!1424762 res!960191) b!1424760))

(assert (= (and b!1424760 res!960197) b!1424758))

(assert (= (and b!1424758 res!960198) b!1424757))

(assert (= (and b!1424757 res!960195) b!1424751))

(assert (= (and b!1424751 res!960187) b!1424764))

(assert (= (and b!1424751 (not res!960194)) b!1424754))

(assert (= (and b!1424754 (not res!960185)) b!1424761))

(assert (= (and b!1424761 (not res!960192)) b!1424759))

(declare-fun m!1315299 () Bool)

(assert (=> b!1424761 m!1315299))

(assert (=> b!1424761 m!1315299))

(declare-fun m!1315301 () Bool)

(assert (=> b!1424761 m!1315301))

(declare-fun m!1315303 () Bool)

(assert (=> b!1424754 m!1315303))

(declare-fun m!1315305 () Bool)

(assert (=> b!1424762 m!1315305))

(assert (=> b!1424762 m!1315305))

(declare-fun m!1315307 () Bool)

(assert (=> b!1424762 m!1315307))

(declare-fun m!1315309 () Bool)

(assert (=> b!1424762 m!1315309))

(declare-fun m!1315311 () Bool)

(assert (=> b!1424762 m!1315311))

(declare-fun m!1315313 () Bool)

(assert (=> b!1424758 m!1315313))

(declare-fun m!1315315 () Bool)

(assert (=> b!1424766 m!1315315))

(declare-fun m!1315317 () Bool)

(assert (=> start!122838 m!1315317))

(declare-fun m!1315319 () Bool)

(assert (=> start!122838 m!1315319))

(assert (=> b!1424751 m!1315309))

(declare-fun m!1315321 () Bool)

(assert (=> b!1424751 m!1315321))

(declare-fun m!1315323 () Bool)

(assert (=> b!1424751 m!1315323))

(declare-fun m!1315325 () Bool)

(assert (=> b!1424751 m!1315325))

(assert (=> b!1424751 m!1315299))

(declare-fun m!1315327 () Bool)

(assert (=> b!1424751 m!1315327))

(declare-fun m!1315329 () Bool)

(assert (=> b!1424756 m!1315329))

(assert (=> b!1424756 m!1315329))

(declare-fun m!1315331 () Bool)

(assert (=> b!1424756 m!1315331))

(assert (=> b!1424764 m!1315299))

(assert (=> b!1424764 m!1315299))

(declare-fun m!1315333 () Bool)

(assert (=> b!1424764 m!1315333))

(assert (=> b!1424760 m!1315299))

(assert (=> b!1424760 m!1315299))

(declare-fun m!1315335 () Bool)

(assert (=> b!1424760 m!1315335))

(declare-fun m!1315337 () Bool)

(assert (=> b!1424763 m!1315337))

(assert (=> b!1424755 m!1315299))

(assert (=> b!1424755 m!1315299))

(declare-fun m!1315339 () Bool)

(assert (=> b!1424755 m!1315339))

(declare-fun m!1315341 () Bool)

(assert (=> b!1424759 m!1315341))

(assert (=> b!1424753 m!1315299))

(assert (=> b!1424753 m!1315299))

(declare-fun m!1315343 () Bool)

(assert (=> b!1424753 m!1315343))

(assert (=> b!1424753 m!1315343))

(assert (=> b!1424753 m!1315299))

(declare-fun m!1315345 () Bool)

(assert (=> b!1424753 m!1315345))

(push 1)

