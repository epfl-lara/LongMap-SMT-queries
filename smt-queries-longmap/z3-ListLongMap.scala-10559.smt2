; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124462 () Bool)

(assert start!124462)

(declare-fun b!1440299 () Bool)

(declare-fun res!972852 () Bool)

(declare-fun e!812088 () Bool)

(assert (=> b!1440299 (=> (not res!972852) (not e!812088))))

(declare-datatypes ((array!97888 0))(
  ( (array!97889 (arr!47233 (Array (_ BitVec 32) (_ BitVec 64))) (size!47785 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97888)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97888 (_ BitVec 32)) Bool)

(assert (=> b!1440299 (= res!972852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972843 () Bool)

(assert (=> start!124462 (=> (not res!972843) (not e!812088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124462 (= res!972843 (validMask!0 mask!2687))))

(assert (=> start!124462 e!812088))

(assert (=> start!124462 true))

(declare-fun array_inv!36466 (array!97888) Bool)

(assert (=> start!124462 (array_inv!36466 a!2862)))

(declare-fun b!1440300 () Bool)

(declare-fun res!972851 () Bool)

(declare-fun e!812087 () Bool)

(assert (=> b!1440300 (=> (not res!972851) (not e!812087))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11510 0))(
  ( (MissingZero!11510 (index!48432 (_ BitVec 32))) (Found!11510 (index!48433 (_ BitVec 32))) (Intermediate!11510 (undefined!12322 Bool) (index!48434 (_ BitVec 32)) (x!130154 (_ BitVec 32))) (Undefined!11510) (MissingVacant!11510 (index!48435 (_ BitVec 32))) )
))
(declare-fun lt!632745 () SeekEntryResult!11510)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97888 (_ BitVec 32)) SeekEntryResult!11510)

(assert (=> b!1440300 (= res!972851 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632745))))

(declare-fun b!1440301 () Bool)

(declare-fun res!972846 () Bool)

(assert (=> b!1440301 (=> (not res!972846) (not e!812087))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440301 (= res!972846 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440302 () Bool)

(declare-fun res!972850 () Bool)

(assert (=> b!1440302 (=> (not res!972850) (not e!812088))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440302 (= res!972850 (validKeyInArray!0 (select (arr!47233 a!2862) i!1006)))))

(declare-fun b!1440303 () Bool)

(declare-fun res!972853 () Bool)

(assert (=> b!1440303 (=> (not res!972853) (not e!812088))))

(assert (=> b!1440303 (= res!972853 (validKeyInArray!0 (select (arr!47233 a!2862) j!93)))))

(declare-fun b!1440304 () Bool)

(declare-fun res!972844 () Bool)

(assert (=> b!1440304 (=> (not res!972844) (not e!812088))))

(declare-datatypes ((List!33812 0))(
  ( (Nil!33809) (Cons!33808 (h!35158 (_ BitVec 64)) (t!48498 List!33812)) )
))
(declare-fun arrayNoDuplicates!0 (array!97888 (_ BitVec 32) List!33812) Bool)

(assert (=> b!1440304 (= res!972844 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33809))))

(declare-fun b!1440305 () Bool)

(declare-fun res!972847 () Bool)

(assert (=> b!1440305 (=> (not res!972847) (not e!812088))))

(assert (=> b!1440305 (= res!972847 (and (= (size!47785 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47785 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47785 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440306 () Bool)

(declare-fun res!972848 () Bool)

(assert (=> b!1440306 (=> (not res!972848) (not e!812087))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440306 (= res!972848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97889 (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47785 a!2862)) mask!2687) (Intermediate!11510 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440307 () Bool)

(assert (=> b!1440307 (= e!812088 e!812087)))

(declare-fun res!972849 () Bool)

(assert (=> b!1440307 (=> (not res!972849) (not e!812087))))

(assert (=> b!1440307 (= res!972849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47233 a!2862) j!93) mask!2687) (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632745))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440307 (= lt!632745 (Intermediate!11510 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440308 () Bool)

(declare-fun res!972845 () Bool)

(assert (=> b!1440308 (=> (not res!972845) (not e!812088))))

(assert (=> b!1440308 (= res!972845 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47785 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47785 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47785 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440309 () Bool)

(assert (=> b!1440309 (= e!812087 (not (validKeyInArray!0 (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(assert (= (and start!124462 res!972843) b!1440305))

(assert (= (and b!1440305 res!972847) b!1440302))

(assert (= (and b!1440302 res!972850) b!1440303))

(assert (= (and b!1440303 res!972853) b!1440299))

(assert (= (and b!1440299 res!972852) b!1440304))

(assert (= (and b!1440304 res!972844) b!1440308))

(assert (= (and b!1440308 res!972845) b!1440307))

(assert (= (and b!1440307 res!972849) b!1440300))

(assert (= (and b!1440300 res!972851) b!1440306))

(assert (= (and b!1440306 res!972848) b!1440301))

(assert (= (and b!1440301 res!972846) b!1440309))

(declare-fun m!1329015 () Bool)

(assert (=> b!1440304 m!1329015))

(declare-fun m!1329017 () Bool)

(assert (=> b!1440300 m!1329017))

(assert (=> b!1440300 m!1329017))

(declare-fun m!1329019 () Bool)

(assert (=> b!1440300 m!1329019))

(assert (=> b!1440307 m!1329017))

(assert (=> b!1440307 m!1329017))

(declare-fun m!1329021 () Bool)

(assert (=> b!1440307 m!1329021))

(assert (=> b!1440307 m!1329021))

(assert (=> b!1440307 m!1329017))

(declare-fun m!1329023 () Bool)

(assert (=> b!1440307 m!1329023))

(declare-fun m!1329025 () Bool)

(assert (=> b!1440299 m!1329025))

(assert (=> b!1440303 m!1329017))

(assert (=> b!1440303 m!1329017))

(declare-fun m!1329027 () Bool)

(assert (=> b!1440303 m!1329027))

(declare-fun m!1329029 () Bool)

(assert (=> b!1440306 m!1329029))

(declare-fun m!1329031 () Bool)

(assert (=> b!1440306 m!1329031))

(assert (=> b!1440306 m!1329031))

(declare-fun m!1329033 () Bool)

(assert (=> b!1440306 m!1329033))

(assert (=> b!1440306 m!1329033))

(assert (=> b!1440306 m!1329031))

(declare-fun m!1329035 () Bool)

(assert (=> b!1440306 m!1329035))

(declare-fun m!1329037 () Bool)

(assert (=> b!1440302 m!1329037))

(assert (=> b!1440302 m!1329037))

(declare-fun m!1329039 () Bool)

(assert (=> b!1440302 m!1329039))

(assert (=> b!1440308 m!1329029))

(declare-fun m!1329041 () Bool)

(assert (=> b!1440308 m!1329041))

(assert (=> b!1440309 m!1329029))

(assert (=> b!1440309 m!1329031))

(assert (=> b!1440309 m!1329031))

(declare-fun m!1329043 () Bool)

(assert (=> b!1440309 m!1329043))

(declare-fun m!1329045 () Bool)

(assert (=> start!124462 m!1329045))

(declare-fun m!1329047 () Bool)

(assert (=> start!124462 m!1329047))

(check-sat (not b!1440304) (not b!1440302) (not b!1440309) (not b!1440299) (not b!1440307) (not b!1440306) (not b!1440303) (not start!124462) (not b!1440300))
(check-sat)
