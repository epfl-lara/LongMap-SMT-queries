; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122798 () Bool)

(assert start!122798)

(declare-fun b!1423791 () Bool)

(declare-fun res!959226 () Bool)

(declare-fun e!804732 () Bool)

(assert (=> b!1423791 (=> (not res!959226) (not e!804732))))

(declare-datatypes ((array!97163 0))(
  ( (array!97164 (arr!46899 (Array (_ BitVec 32) (_ BitVec 64))) (size!47449 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97163)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423791 (= res!959226 (validKeyInArray!0 (select (arr!46899 a!2831) j!81)))))

(declare-fun res!959238 () Bool)

(assert (=> start!122798 (=> (not res!959238) (not e!804732))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122798 (= res!959238 (validMask!0 mask!2608))))

(assert (=> start!122798 e!804732))

(assert (=> start!122798 true))

(declare-fun array_inv!35927 (array!97163) Bool)

(assert (=> start!122798 (array_inv!35927 a!2831)))

(declare-fun b!1423792 () Bool)

(declare-fun res!959229 () Bool)

(assert (=> b!1423792 (=> (not res!959229) (not e!804732))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423792 (= res!959229 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47449 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47449 a!2831))))))

(declare-fun b!1423793 () Bool)

(declare-fun res!959224 () Bool)

(assert (=> b!1423793 (=> (not res!959224) (not e!804732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97163 (_ BitVec 32)) Bool)

(assert (=> b!1423793 (= res!959224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423794 () Bool)

(declare-fun res!959237 () Bool)

(declare-fun e!804734 () Bool)

(assert (=> b!1423794 (=> (not res!959237) (not e!804734))))

(declare-fun lt!627272 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11184 0))(
  ( (MissingZero!11184 (index!47128 (_ BitVec 32))) (Found!11184 (index!47129 (_ BitVec 32))) (Intermediate!11184 (undefined!11996 Bool) (index!47130 (_ BitVec 32)) (x!128762 (_ BitVec 32))) (Undefined!11184) (MissingVacant!11184 (index!47131 (_ BitVec 32))) )
))
(declare-fun lt!627273 () SeekEntryResult!11184)

(declare-fun lt!627270 () array!97163)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97163 (_ BitVec 32)) SeekEntryResult!11184)

(assert (=> b!1423794 (= res!959237 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627272 lt!627270 mask!2608) lt!627273))))

(declare-fun b!1423795 () Bool)

(declare-fun e!804736 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97163 (_ BitVec 32)) SeekEntryResult!11184)

(assert (=> b!1423795 (= e!804736 (= (seekEntryOrOpen!0 (select (arr!46899 a!2831) j!81) a!2831 mask!2608) (Found!11184 j!81)))))

(declare-fun b!1423796 () Bool)

(declare-fun res!959231 () Bool)

(assert (=> b!1423796 (=> (not res!959231) (not e!804732))))

(declare-datatypes ((List!33409 0))(
  ( (Nil!33406) (Cons!33405 (h!34707 (_ BitVec 64)) (t!48103 List!33409)) )
))
(declare-fun arrayNoDuplicates!0 (array!97163 (_ BitVec 32) List!33409) Bool)

(assert (=> b!1423796 (= res!959231 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33406))))

(declare-fun b!1423797 () Bool)

(declare-fun res!959225 () Bool)

(assert (=> b!1423797 (=> (not res!959225) (not e!804734))))

(declare-fun lt!627269 () SeekEntryResult!11184)

(assert (=> b!1423797 (= res!959225 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46899 a!2831) j!81) a!2831 mask!2608) lt!627269))))

(declare-fun b!1423798 () Bool)

(declare-fun e!804731 () Bool)

(declare-fun e!804737 () Bool)

(assert (=> b!1423798 (= e!804731 e!804737)))

(declare-fun res!959234 () Bool)

(assert (=> b!1423798 (=> res!959234 e!804737)))

(declare-fun lt!627267 () (_ BitVec 32))

(assert (=> b!1423798 (= res!959234 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627267 #b00000000000000000000000000000000) (bvsge lt!627267 (size!47449 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423798 (= lt!627267 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423799 () Bool)

(declare-fun res!959227 () Bool)

(assert (=> b!1423799 (=> (not res!959227) (not e!804732))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423799 (= res!959227 (and (= (size!47449 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47449 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47449 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423800 () Bool)

(declare-fun e!804733 () Bool)

(assert (=> b!1423800 (= e!804733 e!804734)))

(declare-fun res!959233 () Bool)

(assert (=> b!1423800 (=> (not res!959233) (not e!804734))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423800 (= res!959233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627272 mask!2608) lt!627272 lt!627270 mask!2608) lt!627273))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423800 (= lt!627273 (Intermediate!11184 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423800 (= lt!627272 (select (store (arr!46899 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423800 (= lt!627270 (array!97164 (store (arr!46899 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47449 a!2831)))))

(declare-fun b!1423801 () Bool)

(declare-fun res!959232 () Bool)

(assert (=> b!1423801 (=> (not res!959232) (not e!804734))))

(assert (=> b!1423801 (= res!959232 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423802 () Bool)

(declare-fun res!959236 () Bool)

(assert (=> b!1423802 (=> (not res!959236) (not e!804732))))

(assert (=> b!1423802 (= res!959236 (validKeyInArray!0 (select (arr!46899 a!2831) i!982)))))

(declare-fun b!1423803 () Bool)

(assert (=> b!1423803 (= e!804737 true)))

(declare-fun lt!627268 () SeekEntryResult!11184)

(assert (=> b!1423803 (= lt!627268 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627267 lt!627272 lt!627270 mask!2608))))

(declare-fun b!1423804 () Bool)

(assert (=> b!1423804 (= e!804734 (not e!804731))))

(declare-fun res!959228 () Bool)

(assert (=> b!1423804 (=> res!959228 e!804731)))

(assert (=> b!1423804 (= res!959228 (or (= (select (arr!46899 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46899 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46899 a!2831) index!585) (select (arr!46899 a!2831) j!81)) (= (select (store (arr!46899 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423804 e!804736))

(declare-fun res!959230 () Bool)

(assert (=> b!1423804 (=> (not res!959230) (not e!804736))))

(assert (=> b!1423804 (= res!959230 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48204 0))(
  ( (Unit!48205) )
))
(declare-fun lt!627271 () Unit!48204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48204)

(assert (=> b!1423804 (= lt!627271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423805 () Bool)

(assert (=> b!1423805 (= e!804732 e!804733)))

(declare-fun res!959239 () Bool)

(assert (=> b!1423805 (=> (not res!959239) (not e!804733))))

(assert (=> b!1423805 (= res!959239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46899 a!2831) j!81) mask!2608) (select (arr!46899 a!2831) j!81) a!2831 mask!2608) lt!627269))))

(assert (=> b!1423805 (= lt!627269 (Intermediate!11184 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423806 () Bool)

(declare-fun res!959235 () Bool)

(assert (=> b!1423806 (=> res!959235 e!804737)))

(assert (=> b!1423806 (= res!959235 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627267 (select (arr!46899 a!2831) j!81) a!2831 mask!2608) lt!627269)))))

(assert (= (and start!122798 res!959238) b!1423799))

(assert (= (and b!1423799 res!959227) b!1423802))

(assert (= (and b!1423802 res!959236) b!1423791))

(assert (= (and b!1423791 res!959226) b!1423793))

(assert (= (and b!1423793 res!959224) b!1423796))

(assert (= (and b!1423796 res!959231) b!1423792))

(assert (= (and b!1423792 res!959229) b!1423805))

(assert (= (and b!1423805 res!959239) b!1423800))

(assert (= (and b!1423800 res!959233) b!1423797))

(assert (= (and b!1423797 res!959225) b!1423794))

(assert (= (and b!1423794 res!959237) b!1423801))

(assert (= (and b!1423801 res!959232) b!1423804))

(assert (= (and b!1423804 res!959230) b!1423795))

(assert (= (and b!1423804 (not res!959228)) b!1423798))

(assert (= (and b!1423798 (not res!959234)) b!1423806))

(assert (= (and b!1423806 (not res!959235)) b!1423803))

(declare-fun m!1314339 () Bool)

(assert (=> b!1423798 m!1314339))

(declare-fun m!1314341 () Bool)

(assert (=> b!1423793 m!1314341))

(declare-fun m!1314343 () Bool)

(assert (=> b!1423803 m!1314343))

(declare-fun m!1314345 () Bool)

(assert (=> b!1423806 m!1314345))

(assert (=> b!1423806 m!1314345))

(declare-fun m!1314347 () Bool)

(assert (=> b!1423806 m!1314347))

(assert (=> b!1423805 m!1314345))

(assert (=> b!1423805 m!1314345))

(declare-fun m!1314349 () Bool)

(assert (=> b!1423805 m!1314349))

(assert (=> b!1423805 m!1314349))

(assert (=> b!1423805 m!1314345))

(declare-fun m!1314351 () Bool)

(assert (=> b!1423805 m!1314351))

(declare-fun m!1314353 () Bool)

(assert (=> b!1423800 m!1314353))

(assert (=> b!1423800 m!1314353))

(declare-fun m!1314355 () Bool)

(assert (=> b!1423800 m!1314355))

(declare-fun m!1314357 () Bool)

(assert (=> b!1423800 m!1314357))

(declare-fun m!1314359 () Bool)

(assert (=> b!1423800 m!1314359))

(assert (=> b!1423791 m!1314345))

(assert (=> b!1423791 m!1314345))

(declare-fun m!1314361 () Bool)

(assert (=> b!1423791 m!1314361))

(assert (=> b!1423804 m!1314357))

(declare-fun m!1314363 () Bool)

(assert (=> b!1423804 m!1314363))

(declare-fun m!1314365 () Bool)

(assert (=> b!1423804 m!1314365))

(declare-fun m!1314367 () Bool)

(assert (=> b!1423804 m!1314367))

(assert (=> b!1423804 m!1314345))

(declare-fun m!1314369 () Bool)

(assert (=> b!1423804 m!1314369))

(declare-fun m!1314371 () Bool)

(assert (=> b!1423794 m!1314371))

(assert (=> b!1423795 m!1314345))

(assert (=> b!1423795 m!1314345))

(declare-fun m!1314373 () Bool)

(assert (=> b!1423795 m!1314373))

(declare-fun m!1314375 () Bool)

(assert (=> b!1423802 m!1314375))

(assert (=> b!1423802 m!1314375))

(declare-fun m!1314377 () Bool)

(assert (=> b!1423802 m!1314377))

(assert (=> b!1423797 m!1314345))

(assert (=> b!1423797 m!1314345))

(declare-fun m!1314379 () Bool)

(assert (=> b!1423797 m!1314379))

(declare-fun m!1314381 () Bool)

(assert (=> start!122798 m!1314381))

(declare-fun m!1314383 () Bool)

(assert (=> start!122798 m!1314383))

(declare-fun m!1314385 () Bool)

(assert (=> b!1423796 m!1314385))

(check-sat (not b!1423791) (not b!1423802) (not b!1423794) (not b!1423795) (not b!1423798) (not b!1423805) (not b!1423804) (not b!1423800) (not b!1423806) (not b!1423793) (not start!122798) (not b!1423796) (not b!1423803) (not b!1423797))
(check-sat)
