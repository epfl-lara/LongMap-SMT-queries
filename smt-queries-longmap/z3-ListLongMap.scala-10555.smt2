; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124470 () Bool)

(assert start!124470)

(declare-fun b!1440180 () Bool)

(declare-fun res!972609 () Bool)

(declare-fun e!812105 () Bool)

(assert (=> b!1440180 (=> (not res!972609) (not e!812105))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97918 0))(
  ( (array!97919 (arr!47247 (Array (_ BitVec 32) (_ BitVec 64))) (size!47797 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97918)

(assert (=> b!1440180 (= res!972609 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47797 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47797 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47797 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47247 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1440181 () Bool)

(declare-fun e!812103 () Bool)

(assert (=> b!1440181 (= e!812103 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun res!972615 () Bool)

(assert (=> start!124470 (=> (not res!972615) (not e!812105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124470 (= res!972615 (validMask!0 mask!2687))))

(assert (=> start!124470 e!812105))

(assert (=> start!124470 true))

(declare-fun array_inv!36275 (array!97918) Bool)

(assert (=> start!124470 (array_inv!36275 a!2862)))

(declare-fun b!1440182 () Bool)

(declare-fun res!972608 () Bool)

(assert (=> b!1440182 (=> (not res!972608) (not e!812105))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440182 (= res!972608 (and (= (size!47797 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47797 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47797 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440183 () Bool)

(assert (=> b!1440183 (= e!812105 e!812103)))

(declare-fun res!972607 () Bool)

(assert (=> b!1440183 (=> (not res!972607) (not e!812103))))

(declare-datatypes ((SeekEntryResult!11499 0))(
  ( (MissingZero!11499 (index!48388 (_ BitVec 32))) (Found!11499 (index!48389 (_ BitVec 32))) (Intermediate!11499 (undefined!12311 Bool) (index!48390 (_ BitVec 32)) (x!130116 (_ BitVec 32))) (Undefined!11499) (MissingVacant!11499 (index!48391 (_ BitVec 32))) )
))
(declare-fun lt!632928 () SeekEntryResult!11499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97918 (_ BitVec 32)) SeekEntryResult!11499)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440183 (= res!972607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47247 a!2862) j!93) mask!2687) (select (arr!47247 a!2862) j!93) a!2862 mask!2687) lt!632928))))

(assert (=> b!1440183 (= lt!632928 (Intermediate!11499 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440184 () Bool)

(declare-fun res!972611 () Bool)

(assert (=> b!1440184 (=> (not res!972611) (not e!812103))))

(assert (=> b!1440184 (= res!972611 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47247 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47247 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97919 (store (arr!47247 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47797 a!2862)) mask!2687) (Intermediate!11499 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440185 () Bool)

(declare-fun res!972614 () Bool)

(assert (=> b!1440185 (=> (not res!972614) (not e!812105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440185 (= res!972614 (validKeyInArray!0 (select (arr!47247 a!2862) i!1006)))))

(declare-fun b!1440186 () Bool)

(declare-fun res!972616 () Bool)

(assert (=> b!1440186 (=> (not res!972616) (not e!812103))))

(assert (=> b!1440186 (= res!972616 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47247 a!2862) j!93) a!2862 mask!2687) lt!632928))))

(declare-fun b!1440187 () Bool)

(declare-fun res!972613 () Bool)

(assert (=> b!1440187 (=> (not res!972613) (not e!812105))))

(declare-datatypes ((List!33748 0))(
  ( (Nil!33745) (Cons!33744 (h!35094 (_ BitVec 64)) (t!48442 List!33748)) )
))
(declare-fun arrayNoDuplicates!0 (array!97918 (_ BitVec 32) List!33748) Bool)

(assert (=> b!1440187 (= res!972613 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33745))))

(declare-fun b!1440188 () Bool)

(declare-fun res!972610 () Bool)

(assert (=> b!1440188 (=> (not res!972610) (not e!812105))))

(assert (=> b!1440188 (= res!972610 (validKeyInArray!0 (select (arr!47247 a!2862) j!93)))))

(declare-fun b!1440189 () Bool)

(declare-fun res!972612 () Bool)

(assert (=> b!1440189 (=> (not res!972612) (not e!812105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97918 (_ BitVec 32)) Bool)

(assert (=> b!1440189 (= res!972612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124470 res!972615) b!1440182))

(assert (= (and b!1440182 res!972608) b!1440185))

(assert (= (and b!1440185 res!972614) b!1440188))

(assert (= (and b!1440188 res!972610) b!1440189))

(assert (= (and b!1440189 res!972612) b!1440187))

(assert (= (and b!1440187 res!972613) b!1440180))

(assert (= (and b!1440180 res!972609) b!1440183))

(assert (= (and b!1440183 res!972607) b!1440186))

(assert (= (and b!1440186 res!972616) b!1440184))

(assert (= (and b!1440184 res!972611) b!1440181))

(declare-fun m!1329339 () Bool)

(assert (=> b!1440189 m!1329339))

(declare-fun m!1329341 () Bool)

(assert (=> b!1440187 m!1329341))

(declare-fun m!1329343 () Bool)

(assert (=> b!1440184 m!1329343))

(declare-fun m!1329345 () Bool)

(assert (=> b!1440184 m!1329345))

(assert (=> b!1440184 m!1329345))

(declare-fun m!1329347 () Bool)

(assert (=> b!1440184 m!1329347))

(assert (=> b!1440184 m!1329347))

(assert (=> b!1440184 m!1329345))

(declare-fun m!1329349 () Bool)

(assert (=> b!1440184 m!1329349))

(declare-fun m!1329351 () Bool)

(assert (=> start!124470 m!1329351))

(declare-fun m!1329353 () Bool)

(assert (=> start!124470 m!1329353))

(declare-fun m!1329355 () Bool)

(assert (=> b!1440188 m!1329355))

(assert (=> b!1440188 m!1329355))

(declare-fun m!1329357 () Bool)

(assert (=> b!1440188 m!1329357))

(assert (=> b!1440183 m!1329355))

(assert (=> b!1440183 m!1329355))

(declare-fun m!1329359 () Bool)

(assert (=> b!1440183 m!1329359))

(assert (=> b!1440183 m!1329359))

(assert (=> b!1440183 m!1329355))

(declare-fun m!1329361 () Bool)

(assert (=> b!1440183 m!1329361))

(assert (=> b!1440186 m!1329355))

(assert (=> b!1440186 m!1329355))

(declare-fun m!1329363 () Bool)

(assert (=> b!1440186 m!1329363))

(assert (=> b!1440180 m!1329343))

(declare-fun m!1329365 () Bool)

(assert (=> b!1440180 m!1329365))

(declare-fun m!1329367 () Bool)

(assert (=> b!1440185 m!1329367))

(assert (=> b!1440185 m!1329367))

(declare-fun m!1329369 () Bool)

(assert (=> b!1440185 m!1329369))

(check-sat (not b!1440185) (not b!1440183) (not start!124470) (not b!1440184) (not b!1440186) (not b!1440189) (not b!1440188) (not b!1440187))
(check-sat)
