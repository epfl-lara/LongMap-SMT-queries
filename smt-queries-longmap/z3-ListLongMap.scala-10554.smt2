; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124464 () Bool)

(assert start!124464)

(declare-fun b!1440094 () Bool)

(declare-fun e!812076 () Bool)

(assert (=> b!1440094 (= e!812076 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97912 0))(
  ( (array!97913 (arr!47244 (Array (_ BitVec 32) (_ BitVec 64))) (size!47794 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97912)

(declare-datatypes ((SeekEntryResult!11496 0))(
  ( (MissingZero!11496 (index!48376 (_ BitVec 32))) (Found!11496 (index!48377 (_ BitVec 32))) (Intermediate!11496 (undefined!12308 Bool) (index!48378 (_ BitVec 32)) (x!130105 (_ BitVec 32))) (Undefined!11496) (MissingVacant!11496 (index!48379 (_ BitVec 32))) )
))
(declare-fun lt!632915 () SeekEntryResult!11496)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97912 (_ BitVec 32)) SeekEntryResult!11496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440094 (= lt!632915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47244 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47244 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97913 (store (arr!47244 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47794 a!2862)) mask!2687))))

(declare-fun b!1440095 () Bool)

(declare-fun res!972529 () Bool)

(declare-fun e!812078 () Bool)

(assert (=> b!1440095 (=> (not res!972529) (not e!812078))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440095 (= res!972529 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47794 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47794 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47794 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47244 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440096 () Bool)

(declare-fun res!972525 () Bool)

(assert (=> b!1440096 (=> (not res!972525) (not e!812078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440096 (= res!972525 (validKeyInArray!0 (select (arr!47244 a!2862) j!93)))))

(declare-fun b!1440097 () Bool)

(declare-fun res!972523 () Bool)

(assert (=> b!1440097 (=> (not res!972523) (not e!812078))))

(assert (=> b!1440097 (= res!972523 (validKeyInArray!0 (select (arr!47244 a!2862) i!1006)))))

(declare-fun b!1440098 () Bool)

(declare-fun res!972528 () Bool)

(assert (=> b!1440098 (=> (not res!972528) (not e!812076))))

(declare-fun lt!632916 () SeekEntryResult!11496)

(assert (=> b!1440098 (= res!972528 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47244 a!2862) j!93) a!2862 mask!2687) lt!632916))))

(declare-fun b!1440099 () Bool)

(declare-fun res!972524 () Bool)

(assert (=> b!1440099 (=> (not res!972524) (not e!812078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97912 (_ BitVec 32)) Bool)

(assert (=> b!1440099 (= res!972524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972527 () Bool)

(assert (=> start!124464 (=> (not res!972527) (not e!812078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124464 (= res!972527 (validMask!0 mask!2687))))

(assert (=> start!124464 e!812078))

(assert (=> start!124464 true))

(declare-fun array_inv!36272 (array!97912) Bool)

(assert (=> start!124464 (array_inv!36272 a!2862)))

(declare-fun b!1440100 () Bool)

(assert (=> b!1440100 (= e!812078 e!812076)))

(declare-fun res!972522 () Bool)

(assert (=> b!1440100 (=> (not res!972522) (not e!812076))))

(assert (=> b!1440100 (= res!972522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47244 a!2862) j!93) mask!2687) (select (arr!47244 a!2862) j!93) a!2862 mask!2687) lt!632916))))

(assert (=> b!1440100 (= lt!632916 (Intermediate!11496 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440101 () Bool)

(declare-fun res!972521 () Bool)

(assert (=> b!1440101 (=> (not res!972521) (not e!812078))))

(assert (=> b!1440101 (= res!972521 (and (= (size!47794 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47794 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47794 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440102 () Bool)

(declare-fun res!972526 () Bool)

(assert (=> b!1440102 (=> (not res!972526) (not e!812078))))

(declare-datatypes ((List!33745 0))(
  ( (Nil!33742) (Cons!33741 (h!35091 (_ BitVec 64)) (t!48439 List!33745)) )
))
(declare-fun arrayNoDuplicates!0 (array!97912 (_ BitVec 32) List!33745) Bool)

(assert (=> b!1440102 (= res!972526 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33742))))

(assert (= (and start!124464 res!972527) b!1440101))

(assert (= (and b!1440101 res!972521) b!1440097))

(assert (= (and b!1440097 res!972523) b!1440096))

(assert (= (and b!1440096 res!972525) b!1440099))

(assert (= (and b!1440099 res!972524) b!1440102))

(assert (= (and b!1440102 res!972526) b!1440095))

(assert (= (and b!1440095 res!972529) b!1440100))

(assert (= (and b!1440100 res!972522) b!1440098))

(assert (= (and b!1440098 res!972528) b!1440094))

(declare-fun m!1329243 () Bool)

(assert (=> b!1440099 m!1329243))

(declare-fun m!1329245 () Bool)

(assert (=> b!1440100 m!1329245))

(assert (=> b!1440100 m!1329245))

(declare-fun m!1329247 () Bool)

(assert (=> b!1440100 m!1329247))

(assert (=> b!1440100 m!1329247))

(assert (=> b!1440100 m!1329245))

(declare-fun m!1329249 () Bool)

(assert (=> b!1440100 m!1329249))

(declare-fun m!1329251 () Bool)

(assert (=> b!1440102 m!1329251))

(declare-fun m!1329253 () Bool)

(assert (=> b!1440095 m!1329253))

(declare-fun m!1329255 () Bool)

(assert (=> b!1440095 m!1329255))

(declare-fun m!1329257 () Bool)

(assert (=> start!124464 m!1329257))

(declare-fun m!1329259 () Bool)

(assert (=> start!124464 m!1329259))

(assert (=> b!1440094 m!1329253))

(declare-fun m!1329261 () Bool)

(assert (=> b!1440094 m!1329261))

(assert (=> b!1440094 m!1329261))

(declare-fun m!1329263 () Bool)

(assert (=> b!1440094 m!1329263))

(assert (=> b!1440094 m!1329263))

(assert (=> b!1440094 m!1329261))

(declare-fun m!1329265 () Bool)

(assert (=> b!1440094 m!1329265))

(declare-fun m!1329267 () Bool)

(assert (=> b!1440097 m!1329267))

(assert (=> b!1440097 m!1329267))

(declare-fun m!1329269 () Bool)

(assert (=> b!1440097 m!1329269))

(assert (=> b!1440098 m!1329245))

(assert (=> b!1440098 m!1329245))

(declare-fun m!1329271 () Bool)

(assert (=> b!1440098 m!1329271))

(assert (=> b!1440096 m!1329245))

(assert (=> b!1440096 m!1329245))

(declare-fun m!1329273 () Bool)

(assert (=> b!1440096 m!1329273))

(check-sat (not b!1440099) (not b!1440098) (not b!1440096) (not b!1440094) (not b!1440097) (not b!1440100) (not start!124464) (not b!1440102))
(check-sat)
