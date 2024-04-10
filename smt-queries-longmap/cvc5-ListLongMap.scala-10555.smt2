; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124468 () Bool)

(assert start!124468)

(declare-fun b!1440150 () Bool)

(declare-fun res!972581 () Bool)

(declare-fun e!812096 () Bool)

(assert (=> b!1440150 (=> (not res!972581) (not e!812096))))

(declare-datatypes ((array!97916 0))(
  ( (array!97917 (arr!47246 (Array (_ BitVec 32) (_ BitVec 64))) (size!47796 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97916)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440150 (= res!972581 (validKeyInArray!0 (select (arr!47246 a!2862) j!93)))))

(declare-fun res!972582 () Bool)

(assert (=> start!124468 (=> (not res!972582) (not e!812096))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124468 (= res!972582 (validMask!0 mask!2687))))

(assert (=> start!124468 e!812096))

(assert (=> start!124468 true))

(declare-fun array_inv!36274 (array!97916) Bool)

(assert (=> start!124468 (array_inv!36274 a!2862)))

(declare-fun b!1440151 () Bool)

(declare-fun res!972577 () Bool)

(assert (=> b!1440151 (=> (not res!972577) (not e!812096))))

(declare-datatypes ((List!33747 0))(
  ( (Nil!33744) (Cons!33743 (h!35093 (_ BitVec 64)) (t!48441 List!33747)) )
))
(declare-fun arrayNoDuplicates!0 (array!97916 (_ BitVec 32) List!33747) Bool)

(assert (=> b!1440151 (= res!972577 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33744))))

(declare-fun b!1440152 () Bool)

(declare-fun res!972578 () Bool)

(assert (=> b!1440152 (=> (not res!972578) (not e!812096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97916 (_ BitVec 32)) Bool)

(assert (=> b!1440152 (= res!972578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440153 () Bool)

(declare-fun res!972580 () Bool)

(declare-fun e!812094 () Bool)

(assert (=> b!1440153 (=> (not res!972580) (not e!812094))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11498 0))(
  ( (MissingZero!11498 (index!48384 (_ BitVec 32))) (Found!11498 (index!48385 (_ BitVec 32))) (Intermediate!11498 (undefined!12310 Bool) (index!48386 (_ BitVec 32)) (x!130115 (_ BitVec 32))) (Undefined!11498) (MissingVacant!11498 (index!48387 (_ BitVec 32))) )
))
(declare-fun lt!632925 () SeekEntryResult!11498)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97916 (_ BitVec 32)) SeekEntryResult!11498)

(assert (=> b!1440153 (= res!972580 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47246 a!2862) j!93) a!2862 mask!2687) lt!632925))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1440154 () Bool)

(assert (=> b!1440154 (= e!812094 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440155 () Bool)

(declare-fun res!972579 () Bool)

(assert (=> b!1440155 (=> (not res!972579) (not e!812096))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440155 (= res!972579 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47796 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47796 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47796 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47246 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440156 () Bool)

(declare-fun res!972584 () Bool)

(assert (=> b!1440156 (=> (not res!972584) (not e!812094))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440156 (= res!972584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47246 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47246 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97917 (store (arr!47246 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47796 a!2862)) mask!2687) (Intermediate!11498 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440157 () Bool)

(declare-fun res!972586 () Bool)

(assert (=> b!1440157 (=> (not res!972586) (not e!812096))))

(assert (=> b!1440157 (= res!972586 (and (= (size!47796 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47796 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47796 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440158 () Bool)

(declare-fun res!972585 () Bool)

(assert (=> b!1440158 (=> (not res!972585) (not e!812096))))

(assert (=> b!1440158 (= res!972585 (validKeyInArray!0 (select (arr!47246 a!2862) i!1006)))))

(declare-fun b!1440159 () Bool)

(assert (=> b!1440159 (= e!812096 e!812094)))

(declare-fun res!972583 () Bool)

(assert (=> b!1440159 (=> (not res!972583) (not e!812094))))

(assert (=> b!1440159 (= res!972583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47246 a!2862) j!93) mask!2687) (select (arr!47246 a!2862) j!93) a!2862 mask!2687) lt!632925))))

(assert (=> b!1440159 (= lt!632925 (Intermediate!11498 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124468 res!972582) b!1440157))

(assert (= (and b!1440157 res!972586) b!1440158))

(assert (= (and b!1440158 res!972585) b!1440150))

(assert (= (and b!1440150 res!972581) b!1440152))

(assert (= (and b!1440152 res!972578) b!1440151))

(assert (= (and b!1440151 res!972577) b!1440155))

(assert (= (and b!1440155 res!972579) b!1440159))

(assert (= (and b!1440159 res!972583) b!1440153))

(assert (= (and b!1440153 res!972580) b!1440156))

(assert (= (and b!1440156 res!972584) b!1440154))

(declare-fun m!1329307 () Bool)

(assert (=> b!1440155 m!1329307))

(declare-fun m!1329309 () Bool)

(assert (=> b!1440155 m!1329309))

(declare-fun m!1329311 () Bool)

(assert (=> b!1440152 m!1329311))

(assert (=> b!1440156 m!1329307))

(declare-fun m!1329313 () Bool)

(assert (=> b!1440156 m!1329313))

(assert (=> b!1440156 m!1329313))

(declare-fun m!1329315 () Bool)

(assert (=> b!1440156 m!1329315))

(assert (=> b!1440156 m!1329315))

(assert (=> b!1440156 m!1329313))

(declare-fun m!1329317 () Bool)

(assert (=> b!1440156 m!1329317))

(declare-fun m!1329319 () Bool)

(assert (=> b!1440150 m!1329319))

(assert (=> b!1440150 m!1329319))

(declare-fun m!1329321 () Bool)

(assert (=> b!1440150 m!1329321))

(assert (=> b!1440153 m!1329319))

(assert (=> b!1440153 m!1329319))

(declare-fun m!1329323 () Bool)

(assert (=> b!1440153 m!1329323))

(declare-fun m!1329325 () Bool)

(assert (=> start!124468 m!1329325))

(declare-fun m!1329327 () Bool)

(assert (=> start!124468 m!1329327))

(declare-fun m!1329329 () Bool)

(assert (=> b!1440158 m!1329329))

(assert (=> b!1440158 m!1329329))

(declare-fun m!1329331 () Bool)

(assert (=> b!1440158 m!1329331))

(assert (=> b!1440159 m!1329319))

(assert (=> b!1440159 m!1329319))

(declare-fun m!1329333 () Bool)

(assert (=> b!1440159 m!1329333))

(assert (=> b!1440159 m!1329333))

(assert (=> b!1440159 m!1329319))

(declare-fun m!1329335 () Bool)

(assert (=> b!1440159 m!1329335))

(declare-fun m!1329337 () Bool)

(assert (=> b!1440151 m!1329337))

(push 1)

(assert (not b!1440159))

(assert (not b!1440156))

(assert (not b!1440158))

(assert (not b!1440152))

(assert (not b!1440151))

(assert (not b!1440153))

(assert (not start!124468))

(assert (not b!1440150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

