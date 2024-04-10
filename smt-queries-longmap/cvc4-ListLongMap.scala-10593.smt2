; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124700 () Bool)

(assert start!124700)

(declare-fun b!1445307 () Bool)

(declare-fun e!814187 () Bool)

(declare-fun e!814191 () Bool)

(assert (=> b!1445307 (= e!814187 e!814191)))

(declare-fun res!977195 () Bool)

(assert (=> b!1445307 (=> (not res!977195) (not e!814191))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98148 0))(
  ( (array!98149 (arr!47362 (Array (_ BitVec 32) (_ BitVec 64))) (size!47912 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98148)

(assert (=> b!1445307 (= res!977195 (= (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634461 () array!98148)

(assert (=> b!1445307 (= lt!634461 (array!98149 (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47912 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1445308 () Bool)

(declare-datatypes ((SeekEntryResult!11614 0))(
  ( (MissingZero!11614 (index!48848 (_ BitVec 32))) (Found!11614 (index!48849 (_ BitVec 32))) (Intermediate!11614 (undefined!12426 Bool) (index!48850 (_ BitVec 32)) (x!130535 (_ BitVec 32))) (Undefined!11614) (MissingVacant!11614 (index!48851 (_ BitVec 32))) )
))
(declare-fun lt!634460 () SeekEntryResult!11614)

(declare-fun e!814188 () Bool)

(declare-fun lt!634457 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98148 (_ BitVec 32)) SeekEntryResult!11614)

(assert (=> b!1445308 (= e!814188 (= lt!634460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634457 lt!634461 mask!2687)))))

(declare-fun b!1445309 () Bool)

(declare-fun e!814190 () Bool)

(assert (=> b!1445309 (= e!814191 e!814190)))

(declare-fun res!977207 () Bool)

(assert (=> b!1445309 (=> (not res!977207) (not e!814190))))

(declare-fun lt!634458 () SeekEntryResult!11614)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445309 (= res!977207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47362 a!2862) j!93) mask!2687) (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634458))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445309 (= lt!634458 (Intermediate!11614 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445310 () Bool)

(declare-fun res!977196 () Bool)

(assert (=> b!1445310 (=> (not res!977196) (not e!814187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445310 (= res!977196 (validKeyInArray!0 (select (arr!47362 a!2862) j!93)))))

(declare-fun b!1445311 () Bool)

(declare-fun res!977209 () Bool)

(assert (=> b!1445311 (=> (not res!977209) (not e!814187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98148 (_ BitVec 32)) Bool)

(assert (=> b!1445311 (= res!977209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445312 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98148 (_ BitVec 32)) SeekEntryResult!11614)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98148 (_ BitVec 32)) SeekEntryResult!11614)

(assert (=> b!1445312 (= e!814188 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634457 lt!634461 mask!2687) (seekEntryOrOpen!0 lt!634457 lt!634461 mask!2687)))))

(declare-fun b!1445313 () Bool)

(declare-fun res!977206 () Bool)

(assert (=> b!1445313 (=> (not res!977206) (not e!814190))))

(assert (=> b!1445313 (= res!977206 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634458))))

(declare-fun b!1445314 () Bool)

(declare-fun res!977197 () Bool)

(assert (=> b!1445314 (=> (not res!977197) (not e!814187))))

(assert (=> b!1445314 (= res!977197 (and (= (size!47912 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47912 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47912 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445315 () Bool)

(declare-fun e!814192 () Bool)

(assert (=> b!1445315 (= e!814192 (or (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) (select (arr!47362 a!2862) j!93))))))

(declare-fun b!1445306 () Bool)

(declare-fun res!977203 () Bool)

(assert (=> b!1445306 (=> (not res!977203) (not e!814187))))

(assert (=> b!1445306 (= res!977203 (validKeyInArray!0 (select (arr!47362 a!2862) i!1006)))))

(declare-fun res!977202 () Bool)

(assert (=> start!124700 (=> (not res!977202) (not e!814187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124700 (= res!977202 (validMask!0 mask!2687))))

(assert (=> start!124700 e!814187))

(assert (=> start!124700 true))

(declare-fun array_inv!36390 (array!98148) Bool)

(assert (=> start!124700 (array_inv!36390 a!2862)))

(declare-fun b!1445316 () Bool)

(declare-fun res!977205 () Bool)

(assert (=> b!1445316 (=> (not res!977205) (not e!814187))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445316 (= res!977205 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47912 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47912 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47912 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445317 () Bool)

(declare-fun e!814189 () Bool)

(assert (=> b!1445317 (= e!814189 (not true))))

(assert (=> b!1445317 e!814192))

(declare-fun res!977200 () Bool)

(assert (=> b!1445317 (=> (not res!977200) (not e!814192))))

(assert (=> b!1445317 (= res!977200 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48724 0))(
  ( (Unit!48725) )
))
(declare-fun lt!634459 () Unit!48724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48724)

(assert (=> b!1445317 (= lt!634459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445318 () Bool)

(declare-fun res!977204 () Bool)

(assert (=> b!1445318 (=> (not res!977204) (not e!814189))))

(assert (=> b!1445318 (= res!977204 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445319 () Bool)

(declare-fun res!977208 () Bool)

(assert (=> b!1445319 (=> (not res!977208) (not e!814192))))

(assert (=> b!1445319 (= res!977208 (= (seekEntryOrOpen!0 (select (arr!47362 a!2862) j!93) a!2862 mask!2687) (Found!11614 j!93)))))

(declare-fun b!1445320 () Bool)

(assert (=> b!1445320 (= e!814190 e!814189)))

(declare-fun res!977199 () Bool)

(assert (=> b!1445320 (=> (not res!977199) (not e!814189))))

(assert (=> b!1445320 (= res!977199 (= lt!634460 (Intermediate!11614 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445320 (= lt!634460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634457 mask!2687) lt!634457 lt!634461 mask!2687))))

(assert (=> b!1445320 (= lt!634457 (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445321 () Bool)

(declare-fun res!977201 () Bool)

(assert (=> b!1445321 (=> (not res!977201) (not e!814189))))

(assert (=> b!1445321 (= res!977201 e!814188)))

(declare-fun c!133566 () Bool)

(assert (=> b!1445321 (= c!133566 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445322 () Bool)

(declare-fun res!977198 () Bool)

(assert (=> b!1445322 (=> (not res!977198) (not e!814187))))

(declare-datatypes ((List!33863 0))(
  ( (Nil!33860) (Cons!33859 (h!35209 (_ BitVec 64)) (t!48557 List!33863)) )
))
(declare-fun arrayNoDuplicates!0 (array!98148 (_ BitVec 32) List!33863) Bool)

(assert (=> b!1445322 (= res!977198 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33860))))

(assert (= (and start!124700 res!977202) b!1445314))

(assert (= (and b!1445314 res!977197) b!1445306))

(assert (= (and b!1445306 res!977203) b!1445310))

(assert (= (and b!1445310 res!977196) b!1445311))

(assert (= (and b!1445311 res!977209) b!1445322))

(assert (= (and b!1445322 res!977198) b!1445316))

(assert (= (and b!1445316 res!977205) b!1445307))

(assert (= (and b!1445307 res!977195) b!1445309))

(assert (= (and b!1445309 res!977207) b!1445313))

(assert (= (and b!1445313 res!977206) b!1445320))

(assert (= (and b!1445320 res!977199) b!1445321))

(assert (= (and b!1445321 c!133566) b!1445308))

(assert (= (and b!1445321 (not c!133566)) b!1445312))

(assert (= (and b!1445321 res!977201) b!1445318))

(assert (= (and b!1445318 res!977204) b!1445317))

(assert (= (and b!1445317 res!977200) b!1445319))

(assert (= (and b!1445319 res!977208) b!1445315))

(declare-fun m!1334265 () Bool)

(assert (=> b!1445311 m!1334265))

(declare-fun m!1334267 () Bool)

(assert (=> b!1445322 m!1334267))

(declare-fun m!1334269 () Bool)

(assert (=> start!124700 m!1334269))

(declare-fun m!1334271 () Bool)

(assert (=> start!124700 m!1334271))

(declare-fun m!1334273 () Bool)

(assert (=> b!1445310 m!1334273))

(assert (=> b!1445310 m!1334273))

(declare-fun m!1334275 () Bool)

(assert (=> b!1445310 m!1334275))

(declare-fun m!1334277 () Bool)

(assert (=> b!1445315 m!1334277))

(assert (=> b!1445315 m!1334273))

(assert (=> b!1445319 m!1334273))

(assert (=> b!1445319 m!1334273))

(declare-fun m!1334279 () Bool)

(assert (=> b!1445319 m!1334279))

(declare-fun m!1334281 () Bool)

(assert (=> b!1445312 m!1334281))

(declare-fun m!1334283 () Bool)

(assert (=> b!1445312 m!1334283))

(assert (=> b!1445309 m!1334273))

(assert (=> b!1445309 m!1334273))

(declare-fun m!1334285 () Bool)

(assert (=> b!1445309 m!1334285))

(assert (=> b!1445309 m!1334285))

(assert (=> b!1445309 m!1334273))

(declare-fun m!1334287 () Bool)

(assert (=> b!1445309 m!1334287))

(declare-fun m!1334289 () Bool)

(assert (=> b!1445320 m!1334289))

(assert (=> b!1445320 m!1334289))

(declare-fun m!1334291 () Bool)

(assert (=> b!1445320 m!1334291))

(declare-fun m!1334293 () Bool)

(assert (=> b!1445320 m!1334293))

(declare-fun m!1334295 () Bool)

(assert (=> b!1445320 m!1334295))

(declare-fun m!1334297 () Bool)

(assert (=> b!1445306 m!1334297))

(assert (=> b!1445306 m!1334297))

(declare-fun m!1334299 () Bool)

(assert (=> b!1445306 m!1334299))

(assert (=> b!1445307 m!1334293))

(declare-fun m!1334301 () Bool)

(assert (=> b!1445307 m!1334301))

(declare-fun m!1334303 () Bool)

(assert (=> b!1445308 m!1334303))

(declare-fun m!1334305 () Bool)

(assert (=> b!1445317 m!1334305))

(declare-fun m!1334307 () Bool)

(assert (=> b!1445317 m!1334307))

(assert (=> b!1445313 m!1334273))

(assert (=> b!1445313 m!1334273))

(declare-fun m!1334309 () Bool)

(assert (=> b!1445313 m!1334309))

(push 1)

(assert (not b!1445319))

(assert (not b!1445322))

