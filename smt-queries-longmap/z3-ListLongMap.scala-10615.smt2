; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125046 () Bool)

(assert start!125046)

(declare-fun b!1450153 () Bool)

(declare-fun res!980840 () Bool)

(declare-fun e!816755 () Bool)

(assert (=> b!1450153 (=> (not res!980840) (not e!816755))))

(declare-datatypes ((array!98389 0))(
  ( (array!98390 (arr!47479 (Array (_ BitVec 32) (_ BitVec 64))) (size!48030 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98389)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98389 (_ BitVec 32)) Bool)

(assert (=> b!1450153 (= res!980840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450154 () Bool)

(declare-fun res!980844 () Bool)

(declare-fun e!816753 () Bool)

(assert (=> b!1450154 (=> (not res!980844) (not e!816753))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450154 (= res!980844 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450155 () Bool)

(declare-fun res!980843 () Bool)

(declare-fun e!816758 () Bool)

(assert (=> b!1450155 (=> (not res!980843) (not e!816758))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11628 0))(
  ( (MissingZero!11628 (index!48904 (_ BitVec 32))) (Found!11628 (index!48905 (_ BitVec 32))) (Intermediate!11628 (undefined!12440 Bool) (index!48906 (_ BitVec 32)) (x!130749 (_ BitVec 32))) (Undefined!11628) (MissingVacant!11628 (index!48907 (_ BitVec 32))) )
))
(declare-fun lt!636155 () SeekEntryResult!11628)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98389 (_ BitVec 32)) SeekEntryResult!11628)

(assert (=> b!1450155 (= res!980843 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636155))))

(declare-fun b!1450156 () Bool)

(declare-fun res!980842 () Bool)

(assert (=> b!1450156 (=> (not res!980842) (not e!816755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450156 (= res!980842 (validKeyInArray!0 (select (arr!47479 a!2862) j!93)))))

(declare-fun b!1450157 () Bool)

(declare-fun e!816759 () Bool)

(assert (=> b!1450157 (= e!816753 (not e!816759))))

(declare-fun res!980833 () Bool)

(assert (=> b!1450157 (=> res!980833 e!816759)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1450157 (= res!980833 (or (and (= (select (arr!47479 a!2862) index!646) (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47479 a!2862) index!646) (select (arr!47479 a!2862) j!93))) (not (= (select (arr!47479 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816756 () Bool)

(assert (=> b!1450157 e!816756))

(declare-fun res!980845 () Bool)

(assert (=> b!1450157 (=> (not res!980845) (not e!816756))))

(declare-fun lt!636151 () SeekEntryResult!11628)

(assert (=> b!1450157 (= res!980845 (and (= lt!636151 (Found!11628 j!93)) (or (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) (select (arr!47479 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98389 (_ BitVec 32)) SeekEntryResult!11628)

(assert (=> b!1450157 (= lt!636151 (seekEntryOrOpen!0 (select (arr!47479 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450157 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48785 0))(
  ( (Unit!48786) )
))
(declare-fun lt!636153 () Unit!48785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48785)

(assert (=> b!1450157 (= lt!636153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450158 () Bool)

(declare-fun e!816757 () Bool)

(assert (=> b!1450158 (= e!816757 e!816758)))

(declare-fun res!980841 () Bool)

(assert (=> b!1450158 (=> (not res!980841) (not e!816758))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450158 (= res!980841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47479 a!2862) j!93) mask!2687) (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636155))))

(assert (=> b!1450158 (= lt!636155 (Intermediate!11628 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450159 () Bool)

(assert (=> b!1450159 (= e!816755 e!816757)))

(declare-fun res!980847 () Bool)

(assert (=> b!1450159 (=> (not res!980847) (not e!816757))))

(assert (=> b!1450159 (= res!980847 (= (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636156 () array!98389)

(assert (=> b!1450159 (= lt!636156 (array!98390 (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48030 a!2862)))))

(declare-fun b!1450160 () Bool)

(declare-fun res!980848 () Bool)

(assert (=> b!1450160 (=> (not res!980848) (not e!816753))))

(declare-fun e!816760 () Bool)

(assert (=> b!1450160 (= res!980848 e!816760)))

(declare-fun c!134179 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450160 (= c!134179 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450161 () Bool)

(declare-fun res!980846 () Bool)

(assert (=> b!1450161 (=> (not res!980846) (not e!816755))))

(assert (=> b!1450161 (= res!980846 (and (= (size!48030 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48030 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48030 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450163 () Bool)

(declare-fun e!816762 () Bool)

(assert (=> b!1450163 (= e!816756 e!816762)))

(declare-fun res!980849 () Bool)

(assert (=> b!1450163 (=> res!980849 e!816762)))

(assert (=> b!1450163 (= res!980849 (or (and (= (select (arr!47479 a!2862) index!646) (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47479 a!2862) index!646) (select (arr!47479 a!2862) j!93))) (not (= (select (arr!47479 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450164 () Bool)

(declare-fun res!980834 () Bool)

(assert (=> b!1450164 (=> (not res!980834) (not e!816755))))

(assert (=> b!1450164 (= res!980834 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48030 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48030 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48030 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450165 () Bool)

(assert (=> b!1450165 (= e!816759 true)))

(declare-fun lt!636154 () SeekEntryResult!11628)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98389 (_ BitVec 32)) SeekEntryResult!11628)

(assert (=> b!1450165 (= lt!636154 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47479 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1450166 () Bool)

(declare-fun res!980837 () Bool)

(assert (=> b!1450166 (=> (not res!980837) (not e!816755))))

(declare-datatypes ((List!33967 0))(
  ( (Nil!33964) (Cons!33963 (h!35324 (_ BitVec 64)) (t!48653 List!33967)) )
))
(declare-fun arrayNoDuplicates!0 (array!98389 (_ BitVec 32) List!33967) Bool)

(assert (=> b!1450166 (= res!980837 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33964))))

(declare-fun b!1450167 () Bool)

(assert (=> b!1450167 (= e!816758 e!816753)))

(declare-fun res!980836 () Bool)

(assert (=> b!1450167 (=> (not res!980836) (not e!816753))))

(declare-fun lt!636152 () SeekEntryResult!11628)

(assert (=> b!1450167 (= res!980836 (= lt!636152 (Intermediate!11628 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636157 () (_ BitVec 64))

(assert (=> b!1450167 (= lt!636152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636157 mask!2687) lt!636157 lt!636156 mask!2687))))

(assert (=> b!1450167 (= lt!636157 (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450168 () Bool)

(declare-fun res!980835 () Bool)

(assert (=> b!1450168 (=> (not res!980835) (not e!816755))))

(assert (=> b!1450168 (= res!980835 (validKeyInArray!0 (select (arr!47479 a!2862) i!1006)))))

(declare-fun b!1450169 () Bool)

(assert (=> b!1450169 (= e!816760 (= lt!636152 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636157 lt!636156 mask!2687)))))

(declare-fun b!1450170 () Bool)

(declare-fun e!816761 () Bool)

(assert (=> b!1450170 (= e!816761 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450171 () Bool)

(assert (=> b!1450171 (= e!816760 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636157 lt!636156 mask!2687) (seekEntryOrOpen!0 lt!636157 lt!636156 mask!2687)))))

(declare-fun res!980838 () Bool)

(assert (=> start!125046 (=> (not res!980838) (not e!816755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125046 (= res!980838 (validMask!0 mask!2687))))

(assert (=> start!125046 e!816755))

(assert (=> start!125046 true))

(declare-fun array_inv!36760 (array!98389) Bool)

(assert (=> start!125046 (array_inv!36760 a!2862)))

(declare-fun b!1450162 () Bool)

(assert (=> b!1450162 (= e!816762 e!816761)))

(declare-fun res!980839 () Bool)

(assert (=> b!1450162 (=> (not res!980839) (not e!816761))))

(assert (=> b!1450162 (= res!980839 (= lt!636151 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47479 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!125046 res!980838) b!1450161))

(assert (= (and b!1450161 res!980846) b!1450168))

(assert (= (and b!1450168 res!980835) b!1450156))

(assert (= (and b!1450156 res!980842) b!1450153))

(assert (= (and b!1450153 res!980840) b!1450166))

(assert (= (and b!1450166 res!980837) b!1450164))

(assert (= (and b!1450164 res!980834) b!1450159))

(assert (= (and b!1450159 res!980847) b!1450158))

(assert (= (and b!1450158 res!980841) b!1450155))

(assert (= (and b!1450155 res!980843) b!1450167))

(assert (= (and b!1450167 res!980836) b!1450160))

(assert (= (and b!1450160 c!134179) b!1450169))

(assert (= (and b!1450160 (not c!134179)) b!1450171))

(assert (= (and b!1450160 res!980848) b!1450154))

(assert (= (and b!1450154 res!980844) b!1450157))

(assert (= (and b!1450157 res!980845) b!1450163))

(assert (= (and b!1450163 (not res!980849)) b!1450162))

(assert (= (and b!1450162 res!980839) b!1450170))

(assert (= (and b!1450157 (not res!980833)) b!1450165))

(declare-fun m!1339009 () Bool)

(assert (=> b!1450163 m!1339009))

(declare-fun m!1339011 () Bool)

(assert (=> b!1450163 m!1339011))

(declare-fun m!1339013 () Bool)

(assert (=> b!1450163 m!1339013))

(declare-fun m!1339015 () Bool)

(assert (=> b!1450163 m!1339015))

(declare-fun m!1339017 () Bool)

(assert (=> b!1450157 m!1339017))

(assert (=> b!1450157 m!1339011))

(declare-fun m!1339019 () Bool)

(assert (=> b!1450157 m!1339019))

(assert (=> b!1450157 m!1339013))

(assert (=> b!1450157 m!1339009))

(assert (=> b!1450157 m!1339015))

(declare-fun m!1339021 () Bool)

(assert (=> b!1450157 m!1339021))

(declare-fun m!1339023 () Bool)

(assert (=> b!1450157 m!1339023))

(assert (=> b!1450157 m!1339015))

(assert (=> b!1450156 m!1339015))

(assert (=> b!1450156 m!1339015))

(declare-fun m!1339025 () Bool)

(assert (=> b!1450156 m!1339025))

(declare-fun m!1339027 () Bool)

(assert (=> b!1450169 m!1339027))

(declare-fun m!1339029 () Bool)

(assert (=> b!1450166 m!1339029))

(declare-fun m!1339031 () Bool)

(assert (=> b!1450167 m!1339031))

(assert (=> b!1450167 m!1339031))

(declare-fun m!1339033 () Bool)

(assert (=> b!1450167 m!1339033))

(assert (=> b!1450167 m!1339011))

(declare-fun m!1339035 () Bool)

(assert (=> b!1450167 m!1339035))

(declare-fun m!1339037 () Bool)

(assert (=> start!125046 m!1339037))

(declare-fun m!1339039 () Bool)

(assert (=> start!125046 m!1339039))

(declare-fun m!1339041 () Bool)

(assert (=> b!1450168 m!1339041))

(assert (=> b!1450168 m!1339041))

(declare-fun m!1339043 () Bool)

(assert (=> b!1450168 m!1339043))

(assert (=> b!1450162 m!1339015))

(assert (=> b!1450162 m!1339015))

(declare-fun m!1339045 () Bool)

(assert (=> b!1450162 m!1339045))

(declare-fun m!1339047 () Bool)

(assert (=> b!1450153 m!1339047))

(assert (=> b!1450159 m!1339011))

(declare-fun m!1339049 () Bool)

(assert (=> b!1450159 m!1339049))

(assert (=> b!1450158 m!1339015))

(assert (=> b!1450158 m!1339015))

(declare-fun m!1339051 () Bool)

(assert (=> b!1450158 m!1339051))

(assert (=> b!1450158 m!1339051))

(assert (=> b!1450158 m!1339015))

(declare-fun m!1339053 () Bool)

(assert (=> b!1450158 m!1339053))

(assert (=> b!1450165 m!1339015))

(assert (=> b!1450165 m!1339015))

(declare-fun m!1339055 () Bool)

(assert (=> b!1450165 m!1339055))

(assert (=> b!1450155 m!1339015))

(assert (=> b!1450155 m!1339015))

(declare-fun m!1339057 () Bool)

(assert (=> b!1450155 m!1339057))

(declare-fun m!1339059 () Bool)

(assert (=> b!1450171 m!1339059))

(declare-fun m!1339061 () Bool)

(assert (=> b!1450171 m!1339061))

(check-sat (not b!1450155) (not b!1450153) (not start!125046) (not b!1450158) (not b!1450169) (not b!1450156) (not b!1450171) (not b!1450157) (not b!1450165) (not b!1450162) (not b!1450167) (not b!1450168) (not b!1450166))
(check-sat)
