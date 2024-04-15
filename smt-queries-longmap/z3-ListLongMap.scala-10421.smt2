; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122684 () Bool)

(assert start!122684)

(declare-fun b!1421242 () Bool)

(declare-fun res!956731 () Bool)

(declare-fun e!803660 () Bool)

(assert (=> b!1421242 (=> (not res!956731) (not e!803660))))

(declare-datatypes ((array!97002 0))(
  ( (array!97003 (arr!46819 (Array (_ BitVec 32) (_ BitVec 64))) (size!47371 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97002)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97002 (_ BitVec 32)) Bool)

(assert (=> b!1421242 (= res!956731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421243 () Bool)

(declare-fun res!956734 () Bool)

(declare-fun e!803658 () Bool)

(assert (=> b!1421243 (=> (not res!956734) (not e!803658))))

(declare-fun lt!626027 () array!97002)

(declare-datatypes ((SeekEntryResult!11131 0))(
  ( (MissingZero!11131 (index!46916 (_ BitVec 32))) (Found!11131 (index!46917 (_ BitVec 32))) (Intermediate!11131 (undefined!11943 Bool) (index!46918 (_ BitVec 32)) (x!128562 (_ BitVec 32))) (Undefined!11131) (MissingVacant!11131 (index!46919 (_ BitVec 32))) )
))
(declare-fun lt!626026 () SeekEntryResult!11131)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!626029 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97002 (_ BitVec 32)) SeekEntryResult!11131)

(assert (=> b!1421243 (= res!956734 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626029 lt!626027 mask!2608) lt!626026))))

(declare-fun b!1421244 () Bool)

(declare-fun res!956727 () Bool)

(assert (=> b!1421244 (=> (not res!956727) (not e!803660))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421244 (= res!956727 (validKeyInArray!0 (select (arr!46819 a!2831) i!982)))))

(declare-fun b!1421246 () Bool)

(declare-fun res!956737 () Bool)

(assert (=> b!1421246 (=> (not res!956737) (not e!803660))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421246 (= res!956737 (validKeyInArray!0 (select (arr!46819 a!2831) j!81)))))

(declare-fun b!1421247 () Bool)

(declare-fun e!803659 () Bool)

(assert (=> b!1421247 (= e!803659 e!803658)))

(declare-fun res!956729 () Bool)

(assert (=> b!1421247 (=> (not res!956729) (not e!803658))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421247 (= res!956729 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626029 mask!2608) lt!626029 lt!626027 mask!2608) lt!626026))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421247 (= lt!626026 (Intermediate!11131 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421247 (= lt!626029 (select (store (arr!46819 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421247 (= lt!626027 (array!97003 (store (arr!46819 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47371 a!2831)))))

(declare-fun b!1421248 () Bool)

(declare-fun res!956728 () Bool)

(assert (=> b!1421248 (=> (not res!956728) (not e!803658))))

(declare-fun lt!626030 () SeekEntryResult!11131)

(assert (=> b!1421248 (= res!956728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46819 a!2831) j!81) a!2831 mask!2608) lt!626030))))

(declare-fun b!1421249 () Bool)

(declare-fun res!956733 () Bool)

(assert (=> b!1421249 (=> (not res!956733) (not e!803660))))

(declare-datatypes ((List!33407 0))(
  ( (Nil!33404) (Cons!33403 (h!34705 (_ BitVec 64)) (t!48093 List!33407)) )
))
(declare-fun arrayNoDuplicates!0 (array!97002 (_ BitVec 32) List!33407) Bool)

(assert (=> b!1421249 (= res!956733 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33404))))

(declare-fun b!1421250 () Bool)

(assert (=> b!1421250 (= e!803658 (not true))))

(assert (=> b!1421250 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!47937 0))(
  ( (Unit!47938) )
))
(declare-fun lt!626028 () Unit!47937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47937)

(assert (=> b!1421250 (= lt!626028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421251 () Bool)

(declare-fun res!956730 () Bool)

(assert (=> b!1421251 (=> (not res!956730) (not e!803658))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421251 (= res!956730 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!956735 () Bool)

(assert (=> start!122684 (=> (not res!956735) (not e!803660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122684 (= res!956735 (validMask!0 mask!2608))))

(assert (=> start!122684 e!803660))

(assert (=> start!122684 true))

(declare-fun array_inv!36052 (array!97002) Bool)

(assert (=> start!122684 (array_inv!36052 a!2831)))

(declare-fun b!1421245 () Bool)

(declare-fun res!956732 () Bool)

(assert (=> b!1421245 (=> (not res!956732) (not e!803660))))

(assert (=> b!1421245 (= res!956732 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47371 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47371 a!2831))))))

(declare-fun b!1421252 () Bool)

(declare-fun res!956726 () Bool)

(assert (=> b!1421252 (=> (not res!956726) (not e!803660))))

(assert (=> b!1421252 (= res!956726 (and (= (size!47371 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47371 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47371 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421253 () Bool)

(assert (=> b!1421253 (= e!803660 e!803659)))

(declare-fun res!956736 () Bool)

(assert (=> b!1421253 (=> (not res!956736) (not e!803659))))

(assert (=> b!1421253 (= res!956736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46819 a!2831) j!81) mask!2608) (select (arr!46819 a!2831) j!81) a!2831 mask!2608) lt!626030))))

(assert (=> b!1421253 (= lt!626030 (Intermediate!11131 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122684 res!956735) b!1421252))

(assert (= (and b!1421252 res!956726) b!1421244))

(assert (= (and b!1421244 res!956727) b!1421246))

(assert (= (and b!1421246 res!956737) b!1421242))

(assert (= (and b!1421242 res!956731) b!1421249))

(assert (= (and b!1421249 res!956733) b!1421245))

(assert (= (and b!1421245 res!956732) b!1421253))

(assert (= (and b!1421253 res!956736) b!1421247))

(assert (= (and b!1421247 res!956729) b!1421248))

(assert (= (and b!1421248 res!956728) b!1421243))

(assert (= (and b!1421243 res!956734) b!1421251))

(assert (= (and b!1421251 res!956730) b!1421250))

(declare-fun m!1311315 () Bool)

(assert (=> b!1421253 m!1311315))

(assert (=> b!1421253 m!1311315))

(declare-fun m!1311317 () Bool)

(assert (=> b!1421253 m!1311317))

(assert (=> b!1421253 m!1311317))

(assert (=> b!1421253 m!1311315))

(declare-fun m!1311319 () Bool)

(assert (=> b!1421253 m!1311319))

(declare-fun m!1311321 () Bool)

(assert (=> b!1421243 m!1311321))

(assert (=> b!1421248 m!1311315))

(assert (=> b!1421248 m!1311315))

(declare-fun m!1311323 () Bool)

(assert (=> b!1421248 m!1311323))

(declare-fun m!1311325 () Bool)

(assert (=> start!122684 m!1311325))

(declare-fun m!1311327 () Bool)

(assert (=> start!122684 m!1311327))

(declare-fun m!1311329 () Bool)

(assert (=> b!1421249 m!1311329))

(declare-fun m!1311331 () Bool)

(assert (=> b!1421244 m!1311331))

(assert (=> b!1421244 m!1311331))

(declare-fun m!1311333 () Bool)

(assert (=> b!1421244 m!1311333))

(declare-fun m!1311335 () Bool)

(assert (=> b!1421247 m!1311335))

(assert (=> b!1421247 m!1311335))

(declare-fun m!1311337 () Bool)

(assert (=> b!1421247 m!1311337))

(declare-fun m!1311339 () Bool)

(assert (=> b!1421247 m!1311339))

(declare-fun m!1311341 () Bool)

(assert (=> b!1421247 m!1311341))

(assert (=> b!1421246 m!1311315))

(assert (=> b!1421246 m!1311315))

(declare-fun m!1311343 () Bool)

(assert (=> b!1421246 m!1311343))

(declare-fun m!1311345 () Bool)

(assert (=> b!1421242 m!1311345))

(declare-fun m!1311347 () Bool)

(assert (=> b!1421250 m!1311347))

(declare-fun m!1311349 () Bool)

(assert (=> b!1421250 m!1311349))

(check-sat (not b!1421244) (not b!1421248) (not b!1421246) (not b!1421242) (not b!1421253) (not b!1421250) (not b!1421247) (not start!122684) (not b!1421243) (not b!1421249))
(check-sat)
