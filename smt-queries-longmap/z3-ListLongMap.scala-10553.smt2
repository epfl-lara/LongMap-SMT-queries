; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124458 () Bool)

(assert start!124458)

(declare-fun b!1440010 () Bool)

(declare-fun res!972439 () Bool)

(declare-fun e!812050 () Bool)

(assert (=> b!1440010 (=> (not res!972439) (not e!812050))))

(declare-datatypes ((array!97906 0))(
  ( (array!97907 (arr!47241 (Array (_ BitVec 32) (_ BitVec 64))) (size!47791 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97906)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440010 (= res!972439 (validKeyInArray!0 (select (arr!47241 a!2862) i!1006)))))

(declare-fun b!1440011 () Bool)

(declare-fun res!972445 () Bool)

(declare-fun e!812049 () Bool)

(assert (=> b!1440011 (=> (not res!972445) (not e!812049))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11493 0))(
  ( (MissingZero!11493 (index!48364 (_ BitVec 32))) (Found!11493 (index!48365 (_ BitVec 32))) (Intermediate!11493 (undefined!12305 Bool) (index!48366 (_ BitVec 32)) (x!130094 (_ BitVec 32))) (Undefined!11493) (MissingVacant!11493 (index!48367 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97906 (_ BitVec 32)) SeekEntryResult!11493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440011 (= res!972445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47241 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47241 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97907 (store (arr!47241 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47791 a!2862)) mask!2687) (Intermediate!11493 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440012 () Bool)

(declare-fun res!972440 () Bool)

(assert (=> b!1440012 (=> (not res!972440) (not e!812050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97906 (_ BitVec 32)) Bool)

(assert (=> b!1440012 (= res!972440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440013 () Bool)

(declare-fun res!972436 () Bool)

(assert (=> b!1440013 (=> (not res!972436) (not e!812050))))

(assert (=> b!1440013 (= res!972436 (and (= (size!47791 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47791 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47791 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440014 () Bool)

(declare-fun res!972437 () Bool)

(assert (=> b!1440014 (=> (not res!972437) (not e!812049))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632901 () SeekEntryResult!11493)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440014 (= res!972437 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47241 a!2862) j!93) a!2862 mask!2687) lt!632901))))

(declare-fun b!1440015 () Bool)

(declare-fun res!972441 () Bool)

(assert (=> b!1440015 (=> (not res!972441) (not e!812050))))

(declare-datatypes ((List!33742 0))(
  ( (Nil!33739) (Cons!33738 (h!35088 (_ BitVec 64)) (t!48436 List!33742)) )
))
(declare-fun arrayNoDuplicates!0 (array!97906 (_ BitVec 32) List!33742) Bool)

(assert (=> b!1440015 (= res!972441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33739))))

(declare-fun b!1440016 () Bool)

(assert (=> b!1440016 (= e!812050 e!812049)))

(declare-fun res!972438 () Bool)

(assert (=> b!1440016 (=> (not res!972438) (not e!812049))))

(assert (=> b!1440016 (= res!972438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47241 a!2862) j!93) mask!2687) (select (arr!47241 a!2862) j!93) a!2862 mask!2687) lt!632901))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440016 (= lt!632901 (Intermediate!11493 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440017 () Bool)

(declare-fun res!972442 () Bool)

(assert (=> b!1440017 (=> (not res!972442) (not e!812050))))

(assert (=> b!1440017 (= res!972442 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47791 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47791 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47791 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47241 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440018 () Bool)

(declare-fun res!972444 () Bool)

(assert (=> b!1440018 (=> (not res!972444) (not e!812050))))

(assert (=> b!1440018 (= res!972444 (validKeyInArray!0 (select (arr!47241 a!2862) j!93)))))

(declare-fun res!972443 () Bool)

(assert (=> start!124458 (=> (not res!972443) (not e!812050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124458 (= res!972443 (validMask!0 mask!2687))))

(assert (=> start!124458 e!812050))

(assert (=> start!124458 true))

(declare-fun array_inv!36269 (array!97906) Bool)

(assert (=> start!124458 (array_inv!36269 a!2862)))

(declare-fun b!1440009 () Bool)

(assert (=> b!1440009 (= e!812049 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (= (and start!124458 res!972443) b!1440013))

(assert (= (and b!1440013 res!972436) b!1440010))

(assert (= (and b!1440010 res!972439) b!1440018))

(assert (= (and b!1440018 res!972444) b!1440012))

(assert (= (and b!1440012 res!972440) b!1440015))

(assert (= (and b!1440015 res!972441) b!1440017))

(assert (= (and b!1440017 res!972442) b!1440016))

(assert (= (and b!1440016 res!972438) b!1440014))

(assert (= (and b!1440014 res!972437) b!1440011))

(assert (= (and b!1440011 res!972445) b!1440009))

(declare-fun m!1329147 () Bool)

(assert (=> b!1440016 m!1329147))

(assert (=> b!1440016 m!1329147))

(declare-fun m!1329149 () Bool)

(assert (=> b!1440016 m!1329149))

(assert (=> b!1440016 m!1329149))

(assert (=> b!1440016 m!1329147))

(declare-fun m!1329151 () Bool)

(assert (=> b!1440016 m!1329151))

(assert (=> b!1440018 m!1329147))

(assert (=> b!1440018 m!1329147))

(declare-fun m!1329153 () Bool)

(assert (=> b!1440018 m!1329153))

(declare-fun m!1329155 () Bool)

(assert (=> b!1440015 m!1329155))

(assert (=> b!1440014 m!1329147))

(assert (=> b!1440014 m!1329147))

(declare-fun m!1329157 () Bool)

(assert (=> b!1440014 m!1329157))

(declare-fun m!1329159 () Bool)

(assert (=> b!1440011 m!1329159))

(declare-fun m!1329161 () Bool)

(assert (=> b!1440011 m!1329161))

(assert (=> b!1440011 m!1329161))

(declare-fun m!1329163 () Bool)

(assert (=> b!1440011 m!1329163))

(assert (=> b!1440011 m!1329163))

(assert (=> b!1440011 m!1329161))

(declare-fun m!1329165 () Bool)

(assert (=> b!1440011 m!1329165))

(assert (=> b!1440017 m!1329159))

(declare-fun m!1329167 () Bool)

(assert (=> b!1440017 m!1329167))

(declare-fun m!1329169 () Bool)

(assert (=> b!1440012 m!1329169))

(declare-fun m!1329171 () Bool)

(assert (=> b!1440010 m!1329171))

(assert (=> b!1440010 m!1329171))

(declare-fun m!1329173 () Bool)

(assert (=> b!1440010 m!1329173))

(declare-fun m!1329175 () Bool)

(assert (=> start!124458 m!1329175))

(declare-fun m!1329177 () Bool)

(assert (=> start!124458 m!1329177))

(check-sat (not start!124458) (not b!1440018) (not b!1440016) (not b!1440010) (not b!1440015) (not b!1440011) (not b!1440012) (not b!1440014))
(check-sat)
