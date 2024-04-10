; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124282 () Bool)

(assert start!124282)

(declare-fun b!1438242 () Bool)

(declare-fun res!970922 () Bool)

(declare-fun e!811343 () Bool)

(assert (=> b!1438242 (=> (not res!970922) (not e!811343))))

(declare-datatypes ((array!97808 0))(
  ( (array!97809 (arr!47195 (Array (_ BitVec 32) (_ BitVec 64))) (size!47745 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97808)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97808 (_ BitVec 32)) Bool)

(assert (=> b!1438242 (= res!970922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438243 () Bool)

(declare-fun res!970921 () Bool)

(assert (=> b!1438243 (=> (not res!970921) (not e!811343))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438243 (= res!970921 (validKeyInArray!0 (select (arr!47195 a!2862) i!1006)))))

(declare-fun b!1438244 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!811342 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1438244 (= e!811342 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438245 () Bool)

(assert (=> b!1438245 (= e!811343 e!811342)))

(declare-fun res!970923 () Bool)

(assert (=> b!1438245 (=> (not res!970923) (not e!811342))))

(declare-datatypes ((SeekEntryResult!11447 0))(
  ( (MissingZero!11447 (index!48180 (_ BitVec 32))) (Found!11447 (index!48181 (_ BitVec 32))) (Intermediate!11447 (undefined!12259 Bool) (index!48182 (_ BitVec 32)) (x!129916 (_ BitVec 32))) (Undefined!11447) (MissingVacant!11447 (index!48183 (_ BitVec 32))) )
))
(declare-fun lt!632520 () SeekEntryResult!11447)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97808 (_ BitVec 32)) SeekEntryResult!11447)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438245 (= res!970923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47195 a!2862) j!93) mask!2687) (select (arr!47195 a!2862) j!93) a!2862 mask!2687) lt!632520))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438245 (= lt!632520 (Intermediate!11447 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438246 () Bool)

(declare-fun res!970915 () Bool)

(assert (=> b!1438246 (=> (not res!970915) (not e!811343))))

(declare-datatypes ((List!33696 0))(
  ( (Nil!33693) (Cons!33692 (h!35036 (_ BitVec 64)) (t!48390 List!33696)) )
))
(declare-fun arrayNoDuplicates!0 (array!97808 (_ BitVec 32) List!33696) Bool)

(assert (=> b!1438246 (= res!970915 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33693))))

(declare-fun res!970917 () Bool)

(assert (=> start!124282 (=> (not res!970917) (not e!811343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124282 (= res!970917 (validMask!0 mask!2687))))

(assert (=> start!124282 e!811343))

(assert (=> start!124282 true))

(declare-fun array_inv!36223 (array!97808) Bool)

(assert (=> start!124282 (array_inv!36223 a!2862)))

(declare-fun b!1438247 () Bool)

(declare-fun res!970916 () Bool)

(assert (=> b!1438247 (=> (not res!970916) (not e!811343))))

(assert (=> b!1438247 (= res!970916 (validKeyInArray!0 (select (arr!47195 a!2862) j!93)))))

(declare-fun b!1438248 () Bool)

(declare-fun res!970918 () Bool)

(assert (=> b!1438248 (=> (not res!970918) (not e!811343))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438248 (= res!970918 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47745 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47745 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47745 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47195 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438249 () Bool)

(declare-fun res!970920 () Bool)

(assert (=> b!1438249 (=> (not res!970920) (not e!811343))))

(assert (=> b!1438249 (= res!970920 (and (= (size!47745 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47745 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47745 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438250 () Bool)

(declare-fun res!970924 () Bool)

(assert (=> b!1438250 (=> (not res!970924) (not e!811342))))

(assert (=> b!1438250 (= res!970924 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47195 a!2862) j!93) a!2862 mask!2687) lt!632520))))

(declare-fun b!1438251 () Bool)

(declare-fun res!970919 () Bool)

(assert (=> b!1438251 (=> (not res!970919) (not e!811342))))

(assert (=> b!1438251 (= res!970919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47195 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47195 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97809 (store (arr!47195 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47745 a!2862)) mask!2687) (Intermediate!11447 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (= (and start!124282 res!970917) b!1438249))

(assert (= (and b!1438249 res!970920) b!1438243))

(assert (= (and b!1438243 res!970921) b!1438247))

(assert (= (and b!1438247 res!970916) b!1438242))

(assert (= (and b!1438242 res!970922) b!1438246))

(assert (= (and b!1438246 res!970915) b!1438248))

(assert (= (and b!1438248 res!970918) b!1438245))

(assert (= (and b!1438245 res!970923) b!1438250))

(assert (= (and b!1438250 res!970924) b!1438251))

(assert (= (and b!1438251 res!970919) b!1438244))

(declare-fun m!1327423 () Bool)

(assert (=> b!1438242 m!1327423))

(declare-fun m!1327425 () Bool)

(assert (=> b!1438243 m!1327425))

(assert (=> b!1438243 m!1327425))

(declare-fun m!1327427 () Bool)

(assert (=> b!1438243 m!1327427))

(declare-fun m!1327429 () Bool)

(assert (=> b!1438247 m!1327429))

(assert (=> b!1438247 m!1327429))

(declare-fun m!1327431 () Bool)

(assert (=> b!1438247 m!1327431))

(assert (=> b!1438245 m!1327429))

(assert (=> b!1438245 m!1327429))

(declare-fun m!1327433 () Bool)

(assert (=> b!1438245 m!1327433))

(assert (=> b!1438245 m!1327433))

(assert (=> b!1438245 m!1327429))

(declare-fun m!1327435 () Bool)

(assert (=> b!1438245 m!1327435))

(declare-fun m!1327437 () Bool)

(assert (=> b!1438246 m!1327437))

(declare-fun m!1327439 () Bool)

(assert (=> start!124282 m!1327439))

(declare-fun m!1327441 () Bool)

(assert (=> start!124282 m!1327441))

(assert (=> b!1438250 m!1327429))

(assert (=> b!1438250 m!1327429))

(declare-fun m!1327443 () Bool)

(assert (=> b!1438250 m!1327443))

(declare-fun m!1327445 () Bool)

(assert (=> b!1438251 m!1327445))

(declare-fun m!1327447 () Bool)

(assert (=> b!1438251 m!1327447))

(assert (=> b!1438251 m!1327447))

(declare-fun m!1327449 () Bool)

(assert (=> b!1438251 m!1327449))

(assert (=> b!1438251 m!1327449))

(assert (=> b!1438251 m!1327447))

(declare-fun m!1327451 () Bool)

(assert (=> b!1438251 m!1327451))

(assert (=> b!1438248 m!1327445))

(declare-fun m!1327453 () Bool)

(assert (=> b!1438248 m!1327453))

(push 1)

