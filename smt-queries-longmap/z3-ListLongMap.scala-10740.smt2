; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125856 () Bool)

(assert start!125856)

(declare-fun b!1471105 () Bool)

(declare-fun e!826001 () Bool)

(assert (=> b!1471105 (= e!826001 false)))

(declare-fun lt!643183 () Bool)

(declare-fun e!826000 () Bool)

(assert (=> b!1471105 (= lt!643183 e!826000)))

(declare-fun c!135820 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471105 (= c!135820 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!998508 () Bool)

(declare-fun e!825998 () Bool)

(assert (=> start!125856 (=> (not res!998508) (not e!825998))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125856 (= res!998508 (validMask!0 mask!2687))))

(assert (=> start!125856 e!825998))

(assert (=> start!125856 true))

(declare-datatypes ((array!99142 0))(
  ( (array!99143 (arr!47854 (Array (_ BitVec 32) (_ BitVec 64))) (size!48405 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99142)

(declare-fun array_inv!37135 (array!99142) Bool)

(assert (=> start!125856 (array_inv!37135 a!2862)))

(declare-fun b!1471106 () Bool)

(declare-fun res!998514 () Bool)

(assert (=> b!1471106 (=> (not res!998514) (not e!825998))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471106 (= res!998514 (and (= (size!48405 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48405 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48405 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471107 () Bool)

(declare-fun e!825999 () Bool)

(assert (=> b!1471107 (= e!825999 e!826001)))

(declare-fun res!998515 () Bool)

(assert (=> b!1471107 (=> (not res!998515) (not e!826001))))

(declare-datatypes ((SeekEntryResult!11991 0))(
  ( (MissingZero!11991 (index!50356 (_ BitVec 32))) (Found!11991 (index!50357 (_ BitVec 32))) (Intermediate!11991 (undefined!12803 Bool) (index!50358 (_ BitVec 32)) (x!132121 (_ BitVec 32))) (Undefined!11991) (MissingVacant!11991 (index!50359 (_ BitVec 32))) )
))
(declare-fun lt!643182 () SeekEntryResult!11991)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471107 (= res!998515 (= lt!643182 (Intermediate!11991 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643184 () (_ BitVec 64))

(declare-fun lt!643185 () array!99142)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!11991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471107 (= lt!643182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643184 mask!2687) lt!643184 lt!643185 mask!2687))))

(assert (=> b!1471107 (= lt!643184 (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471108 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1471108 (= e!826000 (not (= lt!643182 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643184 lt!643185 mask!2687))))))

(declare-fun b!1471109 () Bool)

(declare-fun e!825997 () Bool)

(assert (=> b!1471109 (= e!825997 e!825999)))

(declare-fun res!998510 () Bool)

(assert (=> b!1471109 (=> (not res!998510) (not e!825999))))

(declare-fun lt!643186 () SeekEntryResult!11991)

(assert (=> b!1471109 (= res!998510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47854 a!2862) j!93) mask!2687) (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643186))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471109 (= lt!643186 (Intermediate!11991 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471110 () Bool)

(declare-fun res!998506 () Bool)

(assert (=> b!1471110 (=> (not res!998506) (not e!825998))))

(declare-datatypes ((List!34342 0))(
  ( (Nil!34339) (Cons!34338 (h!35702 (_ BitVec 64)) (t!49028 List!34342)) )
))
(declare-fun arrayNoDuplicates!0 (array!99142 (_ BitVec 32) List!34342) Bool)

(assert (=> b!1471110 (= res!998506 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34339))))

(declare-fun b!1471111 () Bool)

(declare-fun res!998509 () Bool)

(assert (=> b!1471111 (=> (not res!998509) (not e!825998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471111 (= res!998509 (validKeyInArray!0 (select (arr!47854 a!2862) i!1006)))))

(declare-fun b!1471112 () Bool)

(assert (=> b!1471112 (= e!825998 e!825997)))

(declare-fun res!998512 () Bool)

(assert (=> b!1471112 (=> (not res!998512) (not e!825997))))

(assert (=> b!1471112 (= res!998512 (= (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471112 (= lt!643185 (array!99143 (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48405 a!2862)))))

(declare-fun b!1471113 () Bool)

(declare-fun res!998516 () Bool)

(assert (=> b!1471113 (=> (not res!998516) (not e!825998))))

(assert (=> b!1471113 (= res!998516 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48405 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48405 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48405 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471114 () Bool)

(declare-fun res!998507 () Bool)

(assert (=> b!1471114 (=> (not res!998507) (not e!825999))))

(assert (=> b!1471114 (= res!998507 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643186))))

(declare-fun b!1471115 () Bool)

(declare-fun res!998511 () Bool)

(assert (=> b!1471115 (=> (not res!998511) (not e!825998))))

(assert (=> b!1471115 (= res!998511 (validKeyInArray!0 (select (arr!47854 a!2862) j!93)))))

(declare-fun b!1471116 () Bool)

(declare-fun res!998513 () Bool)

(assert (=> b!1471116 (=> (not res!998513) (not e!825998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99142 (_ BitVec 32)) Bool)

(assert (=> b!1471116 (= res!998513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471117 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!11991)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!11991)

(assert (=> b!1471117 (= e!826000 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643184 lt!643185 mask!2687) (seekEntryOrOpen!0 lt!643184 lt!643185 mask!2687))))))

(assert (= (and start!125856 res!998508) b!1471106))

(assert (= (and b!1471106 res!998514) b!1471111))

(assert (= (and b!1471111 res!998509) b!1471115))

(assert (= (and b!1471115 res!998511) b!1471116))

(assert (= (and b!1471116 res!998513) b!1471110))

(assert (= (and b!1471110 res!998506) b!1471113))

(assert (= (and b!1471113 res!998516) b!1471112))

(assert (= (and b!1471112 res!998512) b!1471109))

(assert (= (and b!1471109 res!998510) b!1471114))

(assert (= (and b!1471114 res!998507) b!1471107))

(assert (= (and b!1471107 res!998515) b!1471105))

(assert (= (and b!1471105 c!135820) b!1471108))

(assert (= (and b!1471105 (not c!135820)) b!1471117))

(declare-fun m!1358263 () Bool)

(assert (=> b!1471110 m!1358263))

(declare-fun m!1358265 () Bool)

(assert (=> b!1471117 m!1358265))

(declare-fun m!1358267 () Bool)

(assert (=> b!1471117 m!1358267))

(declare-fun m!1358269 () Bool)

(assert (=> b!1471115 m!1358269))

(assert (=> b!1471115 m!1358269))

(declare-fun m!1358271 () Bool)

(assert (=> b!1471115 m!1358271))

(declare-fun m!1358273 () Bool)

(assert (=> b!1471108 m!1358273))

(assert (=> b!1471109 m!1358269))

(assert (=> b!1471109 m!1358269))

(declare-fun m!1358275 () Bool)

(assert (=> b!1471109 m!1358275))

(assert (=> b!1471109 m!1358275))

(assert (=> b!1471109 m!1358269))

(declare-fun m!1358277 () Bool)

(assert (=> b!1471109 m!1358277))

(declare-fun m!1358279 () Bool)

(assert (=> b!1471107 m!1358279))

(assert (=> b!1471107 m!1358279))

(declare-fun m!1358281 () Bool)

(assert (=> b!1471107 m!1358281))

(declare-fun m!1358283 () Bool)

(assert (=> b!1471107 m!1358283))

(declare-fun m!1358285 () Bool)

(assert (=> b!1471107 m!1358285))

(assert (=> b!1471112 m!1358283))

(declare-fun m!1358287 () Bool)

(assert (=> b!1471112 m!1358287))

(assert (=> b!1471114 m!1358269))

(assert (=> b!1471114 m!1358269))

(declare-fun m!1358289 () Bool)

(assert (=> b!1471114 m!1358289))

(declare-fun m!1358291 () Bool)

(assert (=> b!1471116 m!1358291))

(declare-fun m!1358293 () Bool)

(assert (=> start!125856 m!1358293))

(declare-fun m!1358295 () Bool)

(assert (=> start!125856 m!1358295))

(declare-fun m!1358297 () Bool)

(assert (=> b!1471111 m!1358297))

(assert (=> b!1471111 m!1358297))

(declare-fun m!1358299 () Bool)

(assert (=> b!1471111 m!1358299))

(check-sat (not b!1471109) (not b!1471111) (not b!1471115) (not b!1471108) (not b!1471107) (not b!1471116) (not b!1471114) (not start!125856) (not b!1471117) (not b!1471110))
(check-sat)
