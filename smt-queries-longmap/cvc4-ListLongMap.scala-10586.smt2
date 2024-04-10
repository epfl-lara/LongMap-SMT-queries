; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124658 () Bool)

(assert start!124658)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1444217 () Bool)

(declare-fun lt!634127 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11593 0))(
  ( (MissingZero!11593 (index!48764 (_ BitVec 32))) (Found!11593 (index!48765 (_ BitVec 32))) (Intermediate!11593 (undefined!12405 Bool) (index!48766 (_ BitVec 32)) (x!130458 (_ BitVec 32))) (Undefined!11593) (MissingVacant!11593 (index!48767 (_ BitVec 32))) )
))
(declare-fun lt!634125 () SeekEntryResult!11593)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98106 0))(
  ( (array!98107 (arr!47341 (Array (_ BitVec 32) (_ BitVec 64))) (size!47891 (_ BitVec 32))) )
))
(declare-fun lt!634123 () array!98106)

(declare-fun e!813741 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98106 (_ BitVec 32)) SeekEntryResult!11593)

(assert (=> b!1444217 (= e!813741 (= lt!634125 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634127 lt!634123 mask!2687)))))

(declare-fun b!1444218 () Bool)

(declare-fun res!976240 () Bool)

(declare-fun e!813743 () Bool)

(assert (=> b!1444218 (=> (not res!976240) (not e!813743))))

(declare-fun a!2862 () array!98106)

(declare-datatypes ((List!33842 0))(
  ( (Nil!33839) (Cons!33838 (h!35188 (_ BitVec 64)) (t!48536 List!33842)) )
))
(declare-fun arrayNoDuplicates!0 (array!98106 (_ BitVec 32) List!33842) Bool)

(assert (=> b!1444218 (= res!976240 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33839))))

(declare-fun b!1444219 () Bool)

(declare-fun e!813737 () Bool)

(declare-fun e!813742 () Bool)

(assert (=> b!1444219 (= e!813737 (not e!813742))))

(declare-fun res!976236 () Bool)

(assert (=> b!1444219 (=> res!976236 e!813742)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444219 (= res!976236 (or (not (= (select (arr!47341 a!2862) index!646) (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47341 a!2862) index!646) (select (arr!47341 a!2862) j!93)))))))

(declare-fun lt!634124 () SeekEntryResult!11593)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444219 (and (= lt!634124 (Found!11593 j!93)) (or (= (select (arr!47341 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47341 a!2862) intermediateBeforeIndex!19) (select (arr!47341 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98106 (_ BitVec 32)) SeekEntryResult!11593)

(assert (=> b!1444219 (= lt!634124 (seekEntryOrOpen!0 (select (arr!47341 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98106 (_ BitVec 32)) Bool)

(assert (=> b!1444219 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48682 0))(
  ( (Unit!48683) )
))
(declare-fun lt!634128 () Unit!48682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48682)

(assert (=> b!1444219 (= lt!634128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444220 () Bool)

(declare-fun res!976239 () Bool)

(declare-fun e!813738 () Bool)

(assert (=> b!1444220 (=> (not res!976239) (not e!813738))))

(declare-fun lt!634126 () SeekEntryResult!11593)

(assert (=> b!1444220 (= res!976239 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!634126))))

(declare-fun b!1444221 () Bool)

(assert (=> b!1444221 (= e!813738 e!813737)))

(declare-fun res!976243 () Bool)

(assert (=> b!1444221 (=> (not res!976243) (not e!813737))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444221 (= res!976243 (= lt!634125 (Intermediate!11593 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444221 (= lt!634125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634127 mask!2687) lt!634127 lt!634123 mask!2687))))

(assert (=> b!1444221 (= lt!634127 (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444222 () Bool)

(declare-fun res!976232 () Bool)

(assert (=> b!1444222 (=> res!976232 e!813742)))

(assert (=> b!1444222 (= res!976232 (not (= lt!634124 (seekEntryOrOpen!0 lt!634127 lt!634123 mask!2687))))))

(declare-fun b!1444223 () Bool)

(declare-fun res!976244 () Bool)

(assert (=> b!1444223 (=> (not res!976244) (not e!813743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444223 (= res!976244 (validKeyInArray!0 (select (arr!47341 a!2862) j!93)))))

(declare-fun b!1444224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98106 (_ BitVec 32)) SeekEntryResult!11593)

(assert (=> b!1444224 (= e!813741 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634127 lt!634123 mask!2687) (seekEntryOrOpen!0 lt!634127 lt!634123 mask!2687)))))

(declare-fun res!976246 () Bool)

(assert (=> start!124658 (=> (not res!976246) (not e!813743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124658 (= res!976246 (validMask!0 mask!2687))))

(assert (=> start!124658 e!813743))

(assert (=> start!124658 true))

(declare-fun array_inv!36369 (array!98106) Bool)

(assert (=> start!124658 (array_inv!36369 a!2862)))

(declare-fun b!1444225 () Bool)

(declare-fun e!813739 () Bool)

(assert (=> b!1444225 (= e!813739 e!813738)))

(declare-fun res!976234 () Bool)

(assert (=> b!1444225 (=> (not res!976234) (not e!813738))))

(assert (=> b!1444225 (= res!976234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47341 a!2862) j!93) mask!2687) (select (arr!47341 a!2862) j!93) a!2862 mask!2687) lt!634126))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444225 (= lt!634126 (Intermediate!11593 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444226 () Bool)

(declare-fun res!976241 () Bool)

(assert (=> b!1444226 (=> (not res!976241) (not e!813743))))

(assert (=> b!1444226 (= res!976241 (validKeyInArray!0 (select (arr!47341 a!2862) i!1006)))))

(declare-fun b!1444227 () Bool)

(assert (=> b!1444227 (= e!813743 e!813739)))

(declare-fun res!976242 () Bool)

(assert (=> b!1444227 (=> (not res!976242) (not e!813739))))

(assert (=> b!1444227 (= res!976242 (= (select (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444227 (= lt!634123 (array!98107 (store (arr!47341 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47891 a!2862)))))

(declare-fun b!1444228 () Bool)

(declare-fun res!976238 () Bool)

(assert (=> b!1444228 (=> (not res!976238) (not e!813737))))

(assert (=> b!1444228 (= res!976238 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444229 () Bool)

(declare-fun res!976233 () Bool)

(assert (=> b!1444229 (=> (not res!976233) (not e!813743))))

(assert (=> b!1444229 (= res!976233 (and (= (size!47891 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47891 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47891 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444230 () Bool)

(declare-fun res!976237 () Bool)

(assert (=> b!1444230 (=> (not res!976237) (not e!813737))))

(assert (=> b!1444230 (= res!976237 e!813741)))

(declare-fun c!133503 () Bool)

(assert (=> b!1444230 (= c!133503 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444231 () Bool)

(declare-fun res!976245 () Bool)

(assert (=> b!1444231 (=> (not res!976245) (not e!813743))))

(assert (=> b!1444231 (= res!976245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444232 () Bool)

(declare-fun res!976235 () Bool)

(assert (=> b!1444232 (=> (not res!976235) (not e!813743))))

(assert (=> b!1444232 (= res!976235 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47891 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47891 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47891 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444233 () Bool)

(assert (=> b!1444233 (= e!813742 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (= (and start!124658 res!976246) b!1444229))

(assert (= (and b!1444229 res!976233) b!1444226))

(assert (= (and b!1444226 res!976241) b!1444223))

(assert (= (and b!1444223 res!976244) b!1444231))

(assert (= (and b!1444231 res!976245) b!1444218))

(assert (= (and b!1444218 res!976240) b!1444232))

(assert (= (and b!1444232 res!976235) b!1444227))

(assert (= (and b!1444227 res!976242) b!1444225))

(assert (= (and b!1444225 res!976234) b!1444220))

(assert (= (and b!1444220 res!976239) b!1444221))

(assert (= (and b!1444221 res!976243) b!1444230))

(assert (= (and b!1444230 c!133503) b!1444217))

(assert (= (and b!1444230 (not c!133503)) b!1444224))

(assert (= (and b!1444230 res!976237) b!1444228))

(assert (= (and b!1444228 res!976238) b!1444219))

(assert (= (and b!1444219 (not res!976236)) b!1444222))

(assert (= (and b!1444222 (not res!976232)) b!1444233))

(declare-fun m!1333253 () Bool)

(assert (=> b!1444219 m!1333253))

(declare-fun m!1333255 () Bool)

(assert (=> b!1444219 m!1333255))

(declare-fun m!1333257 () Bool)

(assert (=> b!1444219 m!1333257))

(declare-fun m!1333259 () Bool)

(assert (=> b!1444219 m!1333259))

(declare-fun m!1333261 () Bool)

(assert (=> b!1444219 m!1333261))

(declare-fun m!1333263 () Bool)

(assert (=> b!1444219 m!1333263))

(declare-fun m!1333265 () Bool)

(assert (=> b!1444219 m!1333265))

(declare-fun m!1333267 () Bool)

(assert (=> b!1444219 m!1333267))

(assert (=> b!1444219 m!1333263))

(declare-fun m!1333269 () Bool)

(assert (=> b!1444221 m!1333269))

(assert (=> b!1444221 m!1333269))

(declare-fun m!1333271 () Bool)

(assert (=> b!1444221 m!1333271))

(assert (=> b!1444221 m!1333255))

(declare-fun m!1333273 () Bool)

(assert (=> b!1444221 m!1333273))

(declare-fun m!1333275 () Bool)

(assert (=> start!124658 m!1333275))

(declare-fun m!1333277 () Bool)

(assert (=> start!124658 m!1333277))

(declare-fun m!1333279 () Bool)

(assert (=> b!1444226 m!1333279))

(assert (=> b!1444226 m!1333279))

(declare-fun m!1333281 () Bool)

(assert (=> b!1444226 m!1333281))

(assert (=> b!1444223 m!1333263))

(assert (=> b!1444223 m!1333263))

(declare-fun m!1333283 () Bool)

(assert (=> b!1444223 m!1333283))

(declare-fun m!1333285 () Bool)

(assert (=> b!1444218 m!1333285))

(assert (=> b!1444225 m!1333263))

(assert (=> b!1444225 m!1333263))

(declare-fun m!1333287 () Bool)

(assert (=> b!1444225 m!1333287))

(assert (=> b!1444225 m!1333287))

(assert (=> b!1444225 m!1333263))

(declare-fun m!1333289 () Bool)

(assert (=> b!1444225 m!1333289))

(declare-fun m!1333291 () Bool)

(assert (=> b!1444224 m!1333291))

(declare-fun m!1333293 () Bool)

(assert (=> b!1444224 m!1333293))

(assert (=> b!1444220 m!1333263))

(assert (=> b!1444220 m!1333263))

(declare-fun m!1333295 () Bool)

(assert (=> b!1444220 m!1333295))

(assert (=> b!1444227 m!1333255))

(declare-fun m!1333297 () Bool)

(assert (=> b!1444227 m!1333297))

(declare-fun m!1333299 () Bool)

(assert (=> b!1444231 m!1333299))

(declare-fun m!1333301 () Bool)

(assert (=> b!1444217 m!1333301))

(assert (=> b!1444222 m!1333293))

(push 1)

(assert (not b!1444223))

(assert (not b!1444231))

(assert (not b!1444224))

(assert (not b!1444220))

(assert (not b!1444225))

