; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124716 () Bool)

(assert start!124716)

(declare-fun b!1441916 () Bool)

(declare-fun e!813069 () Bool)

(declare-fun e!813067 () Bool)

(assert (=> b!1441916 (= e!813069 e!813067)))

(declare-fun res!973520 () Bool)

(assert (=> b!1441916 (=> (not res!973520) (not e!813067))))

(declare-datatypes ((SeekEntryResult!11463 0))(
  ( (MissingZero!11463 (index!48244 (_ BitVec 32))) (Found!11463 (index!48245 (_ BitVec 32))) (Intermediate!11463 (undefined!12275 Bool) (index!48246 (_ BitVec 32)) (x!130144 (_ BitVec 32))) (Undefined!11463) (MissingVacant!11463 (index!48247 (_ BitVec 32))) )
))
(declare-fun lt!633468 () SeekEntryResult!11463)

(declare-datatypes ((array!98059 0))(
  ( (array!98060 (arr!47314 (Array (_ BitVec 32) (_ BitVec 64))) (size!47865 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98059)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98059 (_ BitVec 32)) SeekEntryResult!11463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441916 (= res!973520 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47314 a!2862) j!93) mask!2687) (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633468))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441916 (= lt!633468 (Intermediate!11463 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441917 () Bool)

(declare-fun res!973526 () Bool)

(assert (=> b!1441917 (=> (not res!973526) (not e!813069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441917 (= res!973526 (validKeyInArray!0 (select (arr!47314 a!2862) j!93)))))

(declare-fun b!1441918 () Bool)

(declare-fun res!973521 () Bool)

(assert (=> b!1441918 (=> (not res!973521) (not e!813069))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441918 (= res!973521 (validKeyInArray!0 (select (arr!47314 a!2862) i!1006)))))

(declare-fun res!973525 () Bool)

(assert (=> start!124716 (=> (not res!973525) (not e!813069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124716 (= res!973525 (validMask!0 mask!2687))))

(assert (=> start!124716 e!813069))

(assert (=> start!124716 true))

(declare-fun array_inv!36595 (array!98059) Bool)

(assert (=> start!124716 (array_inv!36595 a!2862)))

(declare-fun b!1441919 () Bool)

(assert (=> b!1441919 (= e!813067 false)))

(declare-fun lt!633469 () SeekEntryResult!11463)

(assert (=> b!1441919 (= lt!633469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98060 (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47865 a!2862)) mask!2687))))

(declare-fun b!1441920 () Bool)

(declare-fun res!973523 () Bool)

(assert (=> b!1441920 (=> (not res!973523) (not e!813069))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441920 (= res!973523 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47865 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47865 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47865 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441921 () Bool)

(declare-fun res!973524 () Bool)

(assert (=> b!1441921 (=> (not res!973524) (not e!813067))))

(assert (=> b!1441921 (= res!973524 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633468))))

(declare-fun b!1441922 () Bool)

(declare-fun res!973519 () Bool)

(assert (=> b!1441922 (=> (not res!973519) (not e!813069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98059 (_ BitVec 32)) Bool)

(assert (=> b!1441922 (= res!973519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441923 () Bool)

(declare-fun res!973518 () Bool)

(assert (=> b!1441923 (=> (not res!973518) (not e!813069))))

(declare-datatypes ((List!33802 0))(
  ( (Nil!33799) (Cons!33798 (h!35159 (_ BitVec 64)) (t!48488 List!33802)) )
))
(declare-fun arrayNoDuplicates!0 (array!98059 (_ BitVec 32) List!33802) Bool)

(assert (=> b!1441923 (= res!973518 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33799))))

(declare-fun b!1441924 () Bool)

(declare-fun res!973522 () Bool)

(assert (=> b!1441924 (=> (not res!973522) (not e!813069))))

(assert (=> b!1441924 (= res!973522 (and (= (size!47865 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47865 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47865 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124716 res!973525) b!1441924))

(assert (= (and b!1441924 res!973522) b!1441918))

(assert (= (and b!1441918 res!973521) b!1441917))

(assert (= (and b!1441917 res!973526) b!1441922))

(assert (= (and b!1441922 res!973519) b!1441923))

(assert (= (and b!1441923 res!973518) b!1441920))

(assert (= (and b!1441920 res!973523) b!1441916))

(assert (= (and b!1441916 res!973520) b!1441921))

(assert (= (and b!1441921 res!973524) b!1441919))

(declare-fun m!1331233 () Bool)

(assert (=> b!1441918 m!1331233))

(assert (=> b!1441918 m!1331233))

(declare-fun m!1331235 () Bool)

(assert (=> b!1441918 m!1331235))

(declare-fun m!1331237 () Bool)

(assert (=> b!1441917 m!1331237))

(assert (=> b!1441917 m!1331237))

(declare-fun m!1331239 () Bool)

(assert (=> b!1441917 m!1331239))

(assert (=> b!1441921 m!1331237))

(assert (=> b!1441921 m!1331237))

(declare-fun m!1331241 () Bool)

(assert (=> b!1441921 m!1331241))

(declare-fun m!1331243 () Bool)

(assert (=> b!1441919 m!1331243))

(declare-fun m!1331245 () Bool)

(assert (=> b!1441919 m!1331245))

(assert (=> b!1441919 m!1331245))

(declare-fun m!1331247 () Bool)

(assert (=> b!1441919 m!1331247))

(assert (=> b!1441919 m!1331247))

(assert (=> b!1441919 m!1331245))

(declare-fun m!1331249 () Bool)

(assert (=> b!1441919 m!1331249))

(assert (=> b!1441920 m!1331243))

(declare-fun m!1331251 () Bool)

(assert (=> b!1441920 m!1331251))

(declare-fun m!1331253 () Bool)

(assert (=> b!1441923 m!1331253))

(declare-fun m!1331255 () Bool)

(assert (=> b!1441922 m!1331255))

(assert (=> b!1441916 m!1331237))

(assert (=> b!1441916 m!1331237))

(declare-fun m!1331257 () Bool)

(assert (=> b!1441916 m!1331257))

(assert (=> b!1441916 m!1331257))

(assert (=> b!1441916 m!1331237))

(declare-fun m!1331259 () Bool)

(assert (=> b!1441916 m!1331259))

(declare-fun m!1331261 () Bool)

(assert (=> start!124716 m!1331261))

(declare-fun m!1331263 () Bool)

(assert (=> start!124716 m!1331263))

(check-sat (not b!1441922) (not b!1441923) (not b!1441918) (not b!1441916) (not b!1441921) (not start!124716) (not b!1441919) (not b!1441917))
(check-sat)
