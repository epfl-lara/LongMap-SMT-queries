; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123542 () Bool)

(assert start!123542)

(declare-fun b!1432236 () Bool)

(declare-fun e!808513 () Bool)

(assert (=> b!1432236 (= e!808513 true)))

(declare-fun lt!630509 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432236 (= lt!630509 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432237 () Bool)

(declare-fun e!808515 () Bool)

(declare-fun e!808516 () Bool)

(assert (=> b!1432237 (= e!808515 e!808516)))

(declare-fun res!966104 () Bool)

(assert (=> b!1432237 (=> (not res!966104) (not e!808516))))

(declare-datatypes ((array!97514 0))(
  ( (array!97515 (arr!47064 (Array (_ BitVec 32) (_ BitVec 64))) (size!47614 (_ BitVec 32))) )
))
(declare-fun lt!630508 () array!97514)

(declare-fun lt!630510 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11343 0))(
  ( (MissingZero!11343 (index!47764 (_ BitVec 32))) (Found!11343 (index!47765 (_ BitVec 32))) (Intermediate!11343 (undefined!12155 Bool) (index!47766 (_ BitVec 32)) (x!129409 (_ BitVec 32))) (Undefined!11343) (MissingVacant!11343 (index!47767 (_ BitVec 32))) )
))
(declare-fun lt!630507 () SeekEntryResult!11343)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97514 (_ BitVec 32)) SeekEntryResult!11343)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432237 (= res!966104 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630510 mask!2608) lt!630510 lt!630508 mask!2608) lt!630507))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432237 (= lt!630507 (Intermediate!11343 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97514)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432237 (= lt!630510 (select (store (arr!47064 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432237 (= lt!630508 (array!97515 (store (arr!47064 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47614 a!2831)))))

(declare-fun b!1432238 () Bool)

(declare-fun res!966112 () Bool)

(declare-fun e!808512 () Bool)

(assert (=> b!1432238 (=> (not res!966112) (not e!808512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432238 (= res!966112 (validKeyInArray!0 (select (arr!47064 a!2831) i!982)))))

(declare-fun b!1432239 () Bool)

(declare-fun res!966101 () Bool)

(assert (=> b!1432239 (=> (not res!966101) (not e!808516))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432239 (= res!966101 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432240 () Bool)

(declare-fun res!966107 () Bool)

(assert (=> b!1432240 (=> (not res!966107) (not e!808512))))

(assert (=> b!1432240 (= res!966107 (and (= (size!47614 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47614 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47614 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432241 () Bool)

(declare-fun res!966109 () Bool)

(assert (=> b!1432241 (=> (not res!966109) (not e!808512))))

(declare-datatypes ((List!33574 0))(
  ( (Nil!33571) (Cons!33570 (h!34893 (_ BitVec 64)) (t!48268 List!33574)) )
))
(declare-fun arrayNoDuplicates!0 (array!97514 (_ BitVec 32) List!33574) Bool)

(assert (=> b!1432241 (= res!966109 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33571))))

(declare-fun b!1432242 () Bool)

(declare-fun res!966099 () Bool)

(assert (=> b!1432242 (=> (not res!966099) (not e!808516))))

(declare-fun lt!630506 () SeekEntryResult!11343)

(assert (=> b!1432242 (= res!966099 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47064 a!2831) j!81) a!2831 mask!2608) lt!630506))))

(declare-fun b!1432243 () Bool)

(declare-fun res!966105 () Bool)

(assert (=> b!1432243 (=> (not res!966105) (not e!808512))))

(assert (=> b!1432243 (= res!966105 (validKeyInArray!0 (select (arr!47064 a!2831) j!81)))))

(declare-fun b!1432244 () Bool)

(declare-fun res!966103 () Bool)

(assert (=> b!1432244 (=> (not res!966103) (not e!808512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97514 (_ BitVec 32)) Bool)

(assert (=> b!1432244 (= res!966103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432235 () Bool)

(assert (=> b!1432235 (= e!808512 e!808515)))

(declare-fun res!966110 () Bool)

(assert (=> b!1432235 (=> (not res!966110) (not e!808515))))

(assert (=> b!1432235 (= res!966110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47064 a!2831) j!81) mask!2608) (select (arr!47064 a!2831) j!81) a!2831 mask!2608) lt!630506))))

(assert (=> b!1432235 (= lt!630506 (Intermediate!11343 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!966102 () Bool)

(assert (=> start!123542 (=> (not res!966102) (not e!808512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123542 (= res!966102 (validMask!0 mask!2608))))

(assert (=> start!123542 e!808512))

(assert (=> start!123542 true))

(declare-fun array_inv!36092 (array!97514) Bool)

(assert (=> start!123542 (array_inv!36092 a!2831)))

(declare-fun b!1432245 () Bool)

(declare-fun res!966106 () Bool)

(assert (=> b!1432245 (=> (not res!966106) (not e!808512))))

(assert (=> b!1432245 (= res!966106 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47614 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47614 a!2831))))))

(declare-fun b!1432246 () Bool)

(assert (=> b!1432246 (= e!808516 (not e!808513))))

(declare-fun res!966100 () Bool)

(assert (=> b!1432246 (=> res!966100 e!808513)))

(assert (=> b!1432246 (= res!966100 (or (= (select (arr!47064 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47064 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47064 a!2831) index!585) (select (arr!47064 a!2831) j!81)) (= (select (store (arr!47064 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808517 () Bool)

(assert (=> b!1432246 e!808517))

(declare-fun res!966111 () Bool)

(assert (=> b!1432246 (=> (not res!966111) (not e!808517))))

(assert (=> b!1432246 (= res!966111 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48432 0))(
  ( (Unit!48433) )
))
(declare-fun lt!630505 () Unit!48432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48432)

(assert (=> b!1432246 (= lt!630505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432247 () Bool)

(declare-fun res!966108 () Bool)

(assert (=> b!1432247 (=> (not res!966108) (not e!808516))))

(assert (=> b!1432247 (= res!966108 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630510 lt!630508 mask!2608) lt!630507))))

(declare-fun b!1432248 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97514 (_ BitVec 32)) SeekEntryResult!11343)

(assert (=> b!1432248 (= e!808517 (= (seekEntryOrOpen!0 (select (arr!47064 a!2831) j!81) a!2831 mask!2608) (Found!11343 j!81)))))

(assert (= (and start!123542 res!966102) b!1432240))

(assert (= (and b!1432240 res!966107) b!1432238))

(assert (= (and b!1432238 res!966112) b!1432243))

(assert (= (and b!1432243 res!966105) b!1432244))

(assert (= (and b!1432244 res!966103) b!1432241))

(assert (= (and b!1432241 res!966109) b!1432245))

(assert (= (and b!1432245 res!966106) b!1432235))

(assert (= (and b!1432235 res!966110) b!1432237))

(assert (= (and b!1432237 res!966104) b!1432242))

(assert (= (and b!1432242 res!966099) b!1432247))

(assert (= (and b!1432247 res!966108) b!1432239))

(assert (= (and b!1432239 res!966101) b!1432246))

(assert (= (and b!1432246 res!966111) b!1432248))

(assert (= (and b!1432246 (not res!966100)) b!1432236))

(declare-fun m!1322033 () Bool)

(assert (=> b!1432244 m!1322033))

(declare-fun m!1322035 () Bool)

(assert (=> start!123542 m!1322035))

(declare-fun m!1322037 () Bool)

(assert (=> start!123542 m!1322037))

(declare-fun m!1322039 () Bool)

(assert (=> b!1432238 m!1322039))

(assert (=> b!1432238 m!1322039))

(declare-fun m!1322041 () Bool)

(assert (=> b!1432238 m!1322041))

(declare-fun m!1322043 () Bool)

(assert (=> b!1432242 m!1322043))

(assert (=> b!1432242 m!1322043))

(declare-fun m!1322045 () Bool)

(assert (=> b!1432242 m!1322045))

(assert (=> b!1432243 m!1322043))

(assert (=> b!1432243 m!1322043))

(declare-fun m!1322047 () Bool)

(assert (=> b!1432243 m!1322047))

(assert (=> b!1432248 m!1322043))

(assert (=> b!1432248 m!1322043))

(declare-fun m!1322049 () Bool)

(assert (=> b!1432248 m!1322049))

(declare-fun m!1322051 () Bool)

(assert (=> b!1432237 m!1322051))

(assert (=> b!1432237 m!1322051))

(declare-fun m!1322053 () Bool)

(assert (=> b!1432237 m!1322053))

(declare-fun m!1322055 () Bool)

(assert (=> b!1432237 m!1322055))

(declare-fun m!1322057 () Bool)

(assert (=> b!1432237 m!1322057))

(declare-fun m!1322059 () Bool)

(assert (=> b!1432236 m!1322059))

(assert (=> b!1432235 m!1322043))

(assert (=> b!1432235 m!1322043))

(declare-fun m!1322061 () Bool)

(assert (=> b!1432235 m!1322061))

(assert (=> b!1432235 m!1322061))

(assert (=> b!1432235 m!1322043))

(declare-fun m!1322063 () Bool)

(assert (=> b!1432235 m!1322063))

(assert (=> b!1432246 m!1322055))

(declare-fun m!1322065 () Bool)

(assert (=> b!1432246 m!1322065))

(declare-fun m!1322067 () Bool)

(assert (=> b!1432246 m!1322067))

(declare-fun m!1322069 () Bool)

(assert (=> b!1432246 m!1322069))

(assert (=> b!1432246 m!1322043))

(declare-fun m!1322071 () Bool)

(assert (=> b!1432246 m!1322071))

(declare-fun m!1322073 () Bool)

(assert (=> b!1432241 m!1322073))

(declare-fun m!1322075 () Bool)

(assert (=> b!1432247 m!1322075))

(check-sat (not b!1432238) (not b!1432236) (not b!1432242) (not b!1432244) (not b!1432248) (not b!1432237) (not b!1432241) (not b!1432243) (not start!123542) (not b!1432235) (not b!1432246) (not b!1432247))
(check-sat)
