; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124656 () Bool)

(assert start!124656)

(declare-fun b!1441043 () Bool)

(declare-fun res!972649 () Bool)

(declare-fun e!812797 () Bool)

(assert (=> b!1441043 (=> (not res!972649) (not e!812797))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97999 0))(
  ( (array!98000 (arr!47284 (Array (_ BitVec 32) (_ BitVec 64))) (size!47835 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97999)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11433 0))(
  ( (MissingZero!11433 (index!48124 (_ BitVec 32))) (Found!11433 (index!48125 (_ BitVec 32))) (Intermediate!11433 (undefined!12245 Bool) (index!48126 (_ BitVec 32)) (x!130034 (_ BitVec 32))) (Undefined!11433) (MissingVacant!11433 (index!48127 (_ BitVec 32))) )
))
(declare-fun lt!633333 () SeekEntryResult!11433)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97999 (_ BitVec 32)) SeekEntryResult!11433)

(assert (=> b!1441043 (= res!972649 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633333))))

(declare-fun b!1441044 () Bool)

(assert (=> b!1441044 (= e!812797 false)))

(declare-fun lt!633334 () SeekEntryResult!11433)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441044 (= lt!633334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98000 (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47835 a!2862)) mask!2687))))

(declare-fun b!1441045 () Bool)

(declare-fun res!972650 () Bool)

(declare-fun e!812799 () Bool)

(assert (=> b!1441045 (=> (not res!972650) (not e!812799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97999 (_ BitVec 32)) Bool)

(assert (=> b!1441045 (= res!972650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972653 () Bool)

(assert (=> start!124656 (=> (not res!972653) (not e!812799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124656 (= res!972653 (validMask!0 mask!2687))))

(assert (=> start!124656 e!812799))

(assert (=> start!124656 true))

(declare-fun array_inv!36565 (array!97999) Bool)

(assert (=> start!124656 (array_inv!36565 a!2862)))

(declare-fun b!1441046 () Bool)

(assert (=> b!1441046 (= e!812799 e!812797)))

(declare-fun res!972646 () Bool)

(assert (=> b!1441046 (=> (not res!972646) (not e!812797))))

(assert (=> b!1441046 (= res!972646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47284 a!2862) j!93) mask!2687) (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633333))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441046 (= lt!633333 (Intermediate!11433 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441047 () Bool)

(declare-fun res!972647 () Bool)

(assert (=> b!1441047 (=> (not res!972647) (not e!812799))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441047 (= res!972647 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47835 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47835 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47835 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1441048 () Bool)

(declare-fun res!972648 () Bool)

(assert (=> b!1441048 (=> (not res!972648) (not e!812799))))

(declare-datatypes ((List!33772 0))(
  ( (Nil!33769) (Cons!33768 (h!35129 (_ BitVec 64)) (t!48458 List!33772)) )
))
(declare-fun arrayNoDuplicates!0 (array!97999 (_ BitVec 32) List!33772) Bool)

(assert (=> b!1441048 (= res!972648 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33769))))

(declare-fun b!1441049 () Bool)

(declare-fun res!972652 () Bool)

(assert (=> b!1441049 (=> (not res!972652) (not e!812799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441049 (= res!972652 (validKeyInArray!0 (select (arr!47284 a!2862) j!93)))))

(declare-fun b!1441050 () Bool)

(declare-fun res!972645 () Bool)

(assert (=> b!1441050 (=> (not res!972645) (not e!812799))))

(assert (=> b!1441050 (= res!972645 (and (= (size!47835 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47835 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47835 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441051 () Bool)

(declare-fun res!972651 () Bool)

(assert (=> b!1441051 (=> (not res!972651) (not e!812799))))

(assert (=> b!1441051 (= res!972651 (validKeyInArray!0 (select (arr!47284 a!2862) i!1006)))))

(assert (= (and start!124656 res!972653) b!1441050))

(assert (= (and b!1441050 res!972645) b!1441051))

(assert (= (and b!1441051 res!972651) b!1441049))

(assert (= (and b!1441049 res!972652) b!1441045))

(assert (= (and b!1441045 res!972650) b!1441048))

(assert (= (and b!1441048 res!972648) b!1441047))

(assert (= (and b!1441047 res!972647) b!1441046))

(assert (= (and b!1441046 res!972646) b!1441043))

(assert (= (and b!1441043 res!972649) b!1441044))

(declare-fun m!1330261 () Bool)

(assert (=> b!1441046 m!1330261))

(assert (=> b!1441046 m!1330261))

(declare-fun m!1330263 () Bool)

(assert (=> b!1441046 m!1330263))

(assert (=> b!1441046 m!1330263))

(assert (=> b!1441046 m!1330261))

(declare-fun m!1330265 () Bool)

(assert (=> b!1441046 m!1330265))

(declare-fun m!1330267 () Bool)

(assert (=> b!1441047 m!1330267))

(declare-fun m!1330269 () Bool)

(assert (=> b!1441047 m!1330269))

(declare-fun m!1330271 () Bool)

(assert (=> b!1441051 m!1330271))

(assert (=> b!1441051 m!1330271))

(declare-fun m!1330273 () Bool)

(assert (=> b!1441051 m!1330273))

(declare-fun m!1330275 () Bool)

(assert (=> b!1441045 m!1330275))

(assert (=> b!1441044 m!1330267))

(declare-fun m!1330277 () Bool)

(assert (=> b!1441044 m!1330277))

(assert (=> b!1441044 m!1330277))

(declare-fun m!1330279 () Bool)

(assert (=> b!1441044 m!1330279))

(assert (=> b!1441044 m!1330279))

(assert (=> b!1441044 m!1330277))

(declare-fun m!1330281 () Bool)

(assert (=> b!1441044 m!1330281))

(declare-fun m!1330283 () Bool)

(assert (=> start!124656 m!1330283))

(declare-fun m!1330285 () Bool)

(assert (=> start!124656 m!1330285))

(assert (=> b!1441043 m!1330261))

(assert (=> b!1441043 m!1330261))

(declare-fun m!1330287 () Bool)

(assert (=> b!1441043 m!1330287))

(declare-fun m!1330289 () Bool)

(assert (=> b!1441048 m!1330289))

(assert (=> b!1441049 m!1330261))

(assert (=> b!1441049 m!1330261))

(declare-fun m!1330291 () Bool)

(assert (=> b!1441049 m!1330291))

(check-sat (not b!1441049) (not start!124656) (not b!1441045) (not b!1441051) (not b!1441044) (not b!1441043) (not b!1441048) (not b!1441046))
(check-sat)
