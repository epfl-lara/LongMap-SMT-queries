; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124152 () Bool)

(assert start!124152)

(declare-fun b!1437232 () Bool)

(declare-fun res!970122 () Bool)

(declare-fun e!810880 () Bool)

(assert (=> b!1437232 (=> (not res!970122) (not e!810880))))

(declare-datatypes ((array!97756 0))(
  ( (array!97757 (arr!47172 (Array (_ BitVec 32) (_ BitVec 64))) (size!47722 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97756)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437232 (= res!970122 (validKeyInArray!0 (select (arr!47172 a!2862) j!93)))))

(declare-fun res!970115 () Bool)

(assert (=> start!124152 (=> (not res!970115) (not e!810880))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124152 (= res!970115 (validMask!0 mask!2687))))

(assert (=> start!124152 e!810880))

(assert (=> start!124152 true))

(declare-fun array_inv!36200 (array!97756) Bool)

(assert (=> start!124152 (array_inv!36200 a!2862)))

(declare-fun b!1437233 () Bool)

(declare-fun res!970116 () Bool)

(assert (=> b!1437233 (=> (not res!970116) (not e!810880))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437233 (= res!970116 (and (= (size!47722 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47722 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47722 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437234 () Bool)

(declare-fun res!970118 () Bool)

(assert (=> b!1437234 (=> (not res!970118) (not e!810880))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437234 (= res!970118 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47722 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47722 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47722 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437235 () Bool)

(declare-fun res!970121 () Bool)

(assert (=> b!1437235 (=> (not res!970121) (not e!810880))))

(declare-datatypes ((List!33673 0))(
  ( (Nil!33670) (Cons!33669 (h!35007 (_ BitVec 64)) (t!48367 List!33673)) )
))
(declare-fun arrayNoDuplicates!0 (array!97756 (_ BitVec 32) List!33673) Bool)

(assert (=> b!1437235 (= res!970121 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33670))))

(declare-fun b!1437236 () Bool)

(declare-fun res!970117 () Bool)

(assert (=> b!1437236 (=> (not res!970117) (not e!810880))))

(assert (=> b!1437236 (= res!970117 (validKeyInArray!0 (select (arr!47172 a!2862) i!1006)))))

(declare-fun b!1437237 () Bool)

(declare-fun res!970120 () Bool)

(declare-fun e!810881 () Bool)

(assert (=> b!1437237 (=> (not res!970120) (not e!810881))))

(declare-datatypes ((SeekEntryResult!11424 0))(
  ( (MissingZero!11424 (index!48088 (_ BitVec 32))) (Found!11424 (index!48089 (_ BitVec 32))) (Intermediate!11424 (undefined!12236 Bool) (index!48090 (_ BitVec 32)) (x!129817 (_ BitVec 32))) (Undefined!11424) (MissingVacant!11424 (index!48091 (_ BitVec 32))) )
))
(declare-fun lt!632253 () SeekEntryResult!11424)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97756 (_ BitVec 32)) SeekEntryResult!11424)

(assert (=> b!1437237 (= res!970120 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47172 a!2862) j!93) a!2862 mask!2687) lt!632253))))

(declare-fun b!1437238 () Bool)

(declare-fun res!970123 () Bool)

(assert (=> b!1437238 (=> (not res!970123) (not e!810880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97756 (_ BitVec 32)) Bool)

(assert (=> b!1437238 (= res!970123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437239 () Bool)

(assert (=> b!1437239 (= e!810881 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1437240 () Bool)

(assert (=> b!1437240 (= e!810880 e!810881)))

(declare-fun res!970119 () Bool)

(assert (=> b!1437240 (=> (not res!970119) (not e!810881))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437240 (= res!970119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47172 a!2862) j!93) mask!2687) (select (arr!47172 a!2862) j!93) a!2862 mask!2687) lt!632253))))

(assert (=> b!1437240 (= lt!632253 (Intermediate!11424 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124152 res!970115) b!1437233))

(assert (= (and b!1437233 res!970116) b!1437236))

(assert (= (and b!1437236 res!970117) b!1437232))

(assert (= (and b!1437232 res!970122) b!1437238))

(assert (= (and b!1437238 res!970123) b!1437235))

(assert (= (and b!1437235 res!970121) b!1437234))

(assert (= (and b!1437234 res!970118) b!1437240))

(assert (= (and b!1437240 res!970119) b!1437237))

(assert (= (and b!1437237 res!970120) b!1437239))

(declare-fun m!1326555 () Bool)

(assert (=> b!1437232 m!1326555))

(assert (=> b!1437232 m!1326555))

(declare-fun m!1326557 () Bool)

(assert (=> b!1437232 m!1326557))

(assert (=> b!1437237 m!1326555))

(assert (=> b!1437237 m!1326555))

(declare-fun m!1326559 () Bool)

(assert (=> b!1437237 m!1326559))

(declare-fun m!1326561 () Bool)

(assert (=> b!1437235 m!1326561))

(declare-fun m!1326563 () Bool)

(assert (=> b!1437236 m!1326563))

(assert (=> b!1437236 m!1326563))

(declare-fun m!1326565 () Bool)

(assert (=> b!1437236 m!1326565))

(declare-fun m!1326567 () Bool)

(assert (=> b!1437238 m!1326567))

(declare-fun m!1326569 () Bool)

(assert (=> b!1437234 m!1326569))

(declare-fun m!1326571 () Bool)

(assert (=> b!1437234 m!1326571))

(declare-fun m!1326573 () Bool)

(assert (=> start!124152 m!1326573))

(declare-fun m!1326575 () Bool)

(assert (=> start!124152 m!1326575))

(assert (=> b!1437240 m!1326555))

(assert (=> b!1437240 m!1326555))

(declare-fun m!1326577 () Bool)

(assert (=> b!1437240 m!1326577))

(assert (=> b!1437240 m!1326577))

(assert (=> b!1437240 m!1326555))

(declare-fun m!1326579 () Bool)

(assert (=> b!1437240 m!1326579))

(check-sat (not b!1437236) (not b!1437237) (not b!1437232) (not b!1437238) (not b!1437235) (not b!1437240) (not start!124152))
(check-sat)
