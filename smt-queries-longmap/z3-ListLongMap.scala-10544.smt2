; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124404 () Bool)

(assert start!124404)

(declare-fun b!1439221 () Bool)

(declare-fun res!971648 () Bool)

(declare-fun e!811798 () Bool)

(assert (=> b!1439221 (=> (not res!971648) (not e!811798))))

(declare-datatypes ((array!97852 0))(
  ( (array!97853 (arr!47214 (Array (_ BitVec 32) (_ BitVec 64))) (size!47764 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97852)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439221 (= res!971648 (validKeyInArray!0 (select (arr!47214 a!2862) i!1006)))))

(declare-fun b!1439222 () Bool)

(declare-fun e!811797 () Bool)

(assert (=> b!1439222 (= e!811797 false)))

(declare-datatypes ((SeekEntryResult!11466 0))(
  ( (MissingZero!11466 (index!48256 (_ BitVec 32))) (Found!11466 (index!48257 (_ BitVec 32))) (Intermediate!11466 (undefined!12278 Bool) (index!48258 (_ BitVec 32)) (x!129995 (_ BitVec 32))) (Undefined!11466) (MissingVacant!11466 (index!48259 (_ BitVec 32))) )
))
(declare-fun lt!632771 () SeekEntryResult!11466)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97852 (_ BitVec 32)) SeekEntryResult!11466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439222 (= lt!632771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97853 (store (arr!47214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47764 a!2862)) mask!2687))))

(declare-fun b!1439223 () Bool)

(declare-fun res!971649 () Bool)

(assert (=> b!1439223 (=> (not res!971649) (not e!811797))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!632772 () SeekEntryResult!11466)

(assert (=> b!1439223 (= res!971649 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47214 a!2862) j!93) a!2862 mask!2687) lt!632772))))

(declare-fun b!1439224 () Bool)

(declare-fun res!971653 () Bool)

(assert (=> b!1439224 (=> (not res!971653) (not e!811798))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439224 (= res!971653 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47764 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47764 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47764 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47214 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439226 () Bool)

(declare-fun res!971654 () Bool)

(assert (=> b!1439226 (=> (not res!971654) (not e!811798))))

(assert (=> b!1439226 (= res!971654 (and (= (size!47764 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47764 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47764 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439227 () Bool)

(assert (=> b!1439227 (= e!811798 e!811797)))

(declare-fun res!971650 () Bool)

(assert (=> b!1439227 (=> (not res!971650) (not e!811797))))

(assert (=> b!1439227 (= res!971650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47214 a!2862) j!93) mask!2687) (select (arr!47214 a!2862) j!93) a!2862 mask!2687) lt!632772))))

(assert (=> b!1439227 (= lt!632772 (Intermediate!11466 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439228 () Bool)

(declare-fun res!971655 () Bool)

(assert (=> b!1439228 (=> (not res!971655) (not e!811798))))

(assert (=> b!1439228 (= res!971655 (validKeyInArray!0 (select (arr!47214 a!2862) j!93)))))

(declare-fun b!1439229 () Bool)

(declare-fun res!971652 () Bool)

(assert (=> b!1439229 (=> (not res!971652) (not e!811798))))

(declare-datatypes ((List!33715 0))(
  ( (Nil!33712) (Cons!33711 (h!35061 (_ BitVec 64)) (t!48409 List!33715)) )
))
(declare-fun arrayNoDuplicates!0 (array!97852 (_ BitVec 32) List!33715) Bool)

(assert (=> b!1439229 (= res!971652 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33712))))

(declare-fun b!1439225 () Bool)

(declare-fun res!971651 () Bool)

(assert (=> b!1439225 (=> (not res!971651) (not e!811798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97852 (_ BitVec 32)) Bool)

(assert (=> b!1439225 (= res!971651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971656 () Bool)

(assert (=> start!124404 (=> (not res!971656) (not e!811798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124404 (= res!971656 (validMask!0 mask!2687))))

(assert (=> start!124404 e!811798))

(assert (=> start!124404 true))

(declare-fun array_inv!36242 (array!97852) Bool)

(assert (=> start!124404 (array_inv!36242 a!2862)))

(assert (= (and start!124404 res!971656) b!1439226))

(assert (= (and b!1439226 res!971654) b!1439221))

(assert (= (and b!1439221 res!971648) b!1439228))

(assert (= (and b!1439228 res!971655) b!1439225))

(assert (= (and b!1439225 res!971651) b!1439229))

(assert (= (and b!1439229 res!971652) b!1439224))

(assert (= (and b!1439224 res!971653) b!1439227))

(assert (= (and b!1439227 res!971650) b!1439223))

(assert (= (and b!1439223 res!971649) b!1439222))

(declare-fun m!1328271 () Bool)

(assert (=> b!1439228 m!1328271))

(assert (=> b!1439228 m!1328271))

(declare-fun m!1328273 () Bool)

(assert (=> b!1439228 m!1328273))

(declare-fun m!1328275 () Bool)

(assert (=> b!1439221 m!1328275))

(assert (=> b!1439221 m!1328275))

(declare-fun m!1328277 () Bool)

(assert (=> b!1439221 m!1328277))

(assert (=> b!1439227 m!1328271))

(assert (=> b!1439227 m!1328271))

(declare-fun m!1328279 () Bool)

(assert (=> b!1439227 m!1328279))

(assert (=> b!1439227 m!1328279))

(assert (=> b!1439227 m!1328271))

(declare-fun m!1328281 () Bool)

(assert (=> b!1439227 m!1328281))

(declare-fun m!1328283 () Bool)

(assert (=> start!124404 m!1328283))

(declare-fun m!1328285 () Bool)

(assert (=> start!124404 m!1328285))

(declare-fun m!1328287 () Bool)

(assert (=> b!1439222 m!1328287))

(declare-fun m!1328289 () Bool)

(assert (=> b!1439222 m!1328289))

(assert (=> b!1439222 m!1328289))

(declare-fun m!1328291 () Bool)

(assert (=> b!1439222 m!1328291))

(assert (=> b!1439222 m!1328291))

(assert (=> b!1439222 m!1328289))

(declare-fun m!1328293 () Bool)

(assert (=> b!1439222 m!1328293))

(assert (=> b!1439224 m!1328287))

(declare-fun m!1328295 () Bool)

(assert (=> b!1439224 m!1328295))

(assert (=> b!1439223 m!1328271))

(assert (=> b!1439223 m!1328271))

(declare-fun m!1328297 () Bool)

(assert (=> b!1439223 m!1328297))

(declare-fun m!1328299 () Bool)

(assert (=> b!1439229 m!1328299))

(declare-fun m!1328301 () Bool)

(assert (=> b!1439225 m!1328301))

(check-sat (not b!1439228) (not b!1439222) (not b!1439221) (not b!1439225) (not b!1439223) (not b!1439227) (not start!124404) (not b!1439229))
(check-sat)
