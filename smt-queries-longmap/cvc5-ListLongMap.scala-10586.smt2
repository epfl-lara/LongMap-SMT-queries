; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124654 () Bool)

(assert start!124654)

(declare-fun b!1444115 () Bool)

(declare-fun res!976142 () Bool)

(declare-fun e!813696 () Bool)

(assert (=> b!1444115 (=> res!976142 e!813696)))

(declare-datatypes ((array!98102 0))(
  ( (array!98103 (arr!47339 (Array (_ BitVec 32) (_ BitVec 64))) (size!47889 (_ BitVec 32))) )
))
(declare-fun lt!634091 () array!98102)

(declare-datatypes ((SeekEntryResult!11591 0))(
  ( (MissingZero!11591 (index!48756 (_ BitVec 32))) (Found!11591 (index!48757 (_ BitVec 32))) (Intermediate!11591 (undefined!12403 Bool) (index!48758 (_ BitVec 32)) (x!130456 (_ BitVec 32))) (Undefined!11591) (MissingVacant!11591 (index!48759 (_ BitVec 32))) )
))
(declare-fun lt!634089 () SeekEntryResult!11591)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634087 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98102 (_ BitVec 32)) SeekEntryResult!11591)

(assert (=> b!1444115 (= res!976142 (not (= lt!634089 (seekEntryOrOpen!0 lt!634087 lt!634091 mask!2687))))))

(declare-fun b!1444116 () Bool)

(declare-fun e!813697 () Bool)

(assert (=> b!1444116 (= e!813697 (not e!813696))))

(declare-fun res!976143 () Bool)

(assert (=> b!1444116 (=> res!976143 e!813696)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98102)

(assert (=> b!1444116 (= res!976143 (or (not (= (select (arr!47339 a!2862) index!646) (select (store (arr!47339 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47339 a!2862) index!646) (select (arr!47339 a!2862) j!93)))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444116 (and (= lt!634089 (Found!11591 j!93)) (or (= (select (arr!47339 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47339 a!2862) intermediateBeforeIndex!19) (select (arr!47339 a!2862) j!93))))))

(assert (=> b!1444116 (= lt!634089 (seekEntryOrOpen!0 (select (arr!47339 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98102 (_ BitVec 32)) Bool)

(assert (=> b!1444116 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48678 0))(
  ( (Unit!48679) )
))
(declare-fun lt!634088 () Unit!48678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48678)

(assert (=> b!1444116 (= lt!634088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444117 () Bool)

(declare-fun e!813698 () Bool)

(declare-fun e!813699 () Bool)

(assert (=> b!1444117 (= e!813698 e!813699)))

(declare-fun res!976145 () Bool)

(assert (=> b!1444117 (=> (not res!976145) (not e!813699))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444117 (= res!976145 (= (select (store (arr!47339 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444117 (= lt!634091 (array!98103 (store (arr!47339 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47889 a!2862)))))

(declare-fun b!1444118 () Bool)

(declare-fun res!976155 () Bool)

(assert (=> b!1444118 (=> (not res!976155) (not e!813698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444118 (= res!976155 (validKeyInArray!0 (select (arr!47339 a!2862) i!1006)))))

(declare-fun b!1444120 () Bool)

(declare-fun res!976148 () Bool)

(assert (=> b!1444120 (=> (not res!976148) (not e!813698))))

(assert (=> b!1444120 (= res!976148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444121 () Bool)

(assert (=> b!1444121 (= e!813696 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444122 () Bool)

(declare-fun res!976150 () Bool)

(assert (=> b!1444122 (=> (not res!976150) (not e!813698))))

(assert (=> b!1444122 (= res!976150 (and (= (size!47889 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47889 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47889 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444123 () Bool)

(declare-fun res!976153 () Bool)

(declare-fun e!813700 () Bool)

(assert (=> b!1444123 (=> (not res!976153) (not e!813700))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634092 () SeekEntryResult!11591)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98102 (_ BitVec 32)) SeekEntryResult!11591)

(assert (=> b!1444123 (= res!976153 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47339 a!2862) j!93) a!2862 mask!2687) lt!634092))))

(declare-fun lt!634090 () SeekEntryResult!11591)

(declare-fun e!813695 () Bool)

(declare-fun b!1444124 () Bool)

(assert (=> b!1444124 (= e!813695 (= lt!634090 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634087 lt!634091 mask!2687)))))

(declare-fun b!1444125 () Bool)

(assert (=> b!1444125 (= e!813700 e!813697)))

(declare-fun res!976149 () Bool)

(assert (=> b!1444125 (=> (not res!976149) (not e!813697))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444125 (= res!976149 (= lt!634090 (Intermediate!11591 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444125 (= lt!634090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634087 mask!2687) lt!634087 lt!634091 mask!2687))))

(assert (=> b!1444125 (= lt!634087 (select (store (arr!47339 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444126 () Bool)

(declare-fun res!976144 () Bool)

(assert (=> b!1444126 (=> (not res!976144) (not e!813697))))

(assert (=> b!1444126 (= res!976144 e!813695)))

(declare-fun c!133497 () Bool)

(assert (=> b!1444126 (= c!133497 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444127 () Bool)

(declare-fun res!976154 () Bool)

(assert (=> b!1444127 (=> (not res!976154) (not e!813698))))

(declare-datatypes ((List!33840 0))(
  ( (Nil!33837) (Cons!33836 (h!35186 (_ BitVec 64)) (t!48534 List!33840)) )
))
(declare-fun arrayNoDuplicates!0 (array!98102 (_ BitVec 32) List!33840) Bool)

(assert (=> b!1444127 (= res!976154 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33837))))

(declare-fun b!1444128 () Bool)

(declare-fun res!976146 () Bool)

(assert (=> b!1444128 (=> (not res!976146) (not e!813698))))

(assert (=> b!1444128 (= res!976146 (validKeyInArray!0 (select (arr!47339 a!2862) j!93)))))

(declare-fun b!1444129 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98102 (_ BitVec 32)) SeekEntryResult!11591)

(assert (=> b!1444129 (= e!813695 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634087 lt!634091 mask!2687) (seekEntryOrOpen!0 lt!634087 lt!634091 mask!2687)))))

(declare-fun b!1444119 () Bool)

(declare-fun res!976151 () Bool)

(assert (=> b!1444119 (=> (not res!976151) (not e!813697))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444119 (= res!976151 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!976156 () Bool)

(assert (=> start!124654 (=> (not res!976156) (not e!813698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124654 (= res!976156 (validMask!0 mask!2687))))

(assert (=> start!124654 e!813698))

(assert (=> start!124654 true))

(declare-fun array_inv!36367 (array!98102) Bool)

(assert (=> start!124654 (array_inv!36367 a!2862)))

(declare-fun b!1444130 () Bool)

(declare-fun res!976147 () Bool)

(assert (=> b!1444130 (=> (not res!976147) (not e!813698))))

(assert (=> b!1444130 (= res!976147 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47889 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47889 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47889 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444131 () Bool)

(assert (=> b!1444131 (= e!813699 e!813700)))

(declare-fun res!976152 () Bool)

(assert (=> b!1444131 (=> (not res!976152) (not e!813700))))

(assert (=> b!1444131 (= res!976152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47339 a!2862) j!93) mask!2687) (select (arr!47339 a!2862) j!93) a!2862 mask!2687) lt!634092))))

(assert (=> b!1444131 (= lt!634092 (Intermediate!11591 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124654 res!976156) b!1444122))

(assert (= (and b!1444122 res!976150) b!1444118))

(assert (= (and b!1444118 res!976155) b!1444128))

(assert (= (and b!1444128 res!976146) b!1444120))

(assert (= (and b!1444120 res!976148) b!1444127))

(assert (= (and b!1444127 res!976154) b!1444130))

(assert (= (and b!1444130 res!976147) b!1444117))

(assert (= (and b!1444117 res!976145) b!1444131))

(assert (= (and b!1444131 res!976152) b!1444123))

(assert (= (and b!1444123 res!976153) b!1444125))

(assert (= (and b!1444125 res!976149) b!1444126))

(assert (= (and b!1444126 c!133497) b!1444124))

(assert (= (and b!1444126 (not c!133497)) b!1444129))

(assert (= (and b!1444126 res!976144) b!1444119))

(assert (= (and b!1444119 res!976151) b!1444116))

(assert (= (and b!1444116 (not res!976143)) b!1444115))

(assert (= (and b!1444115 (not res!976142)) b!1444121))

(declare-fun m!1333153 () Bool)

(assert (=> b!1444120 m!1333153))

(declare-fun m!1333155 () Bool)

(assert (=> b!1444129 m!1333155))

(declare-fun m!1333157 () Bool)

(assert (=> b!1444129 m!1333157))

(declare-fun m!1333159 () Bool)

(assert (=> b!1444128 m!1333159))

(assert (=> b!1444128 m!1333159))

(declare-fun m!1333161 () Bool)

(assert (=> b!1444128 m!1333161))

(declare-fun m!1333163 () Bool)

(assert (=> b!1444125 m!1333163))

(assert (=> b!1444125 m!1333163))

(declare-fun m!1333165 () Bool)

(assert (=> b!1444125 m!1333165))

(declare-fun m!1333167 () Bool)

(assert (=> b!1444125 m!1333167))

(declare-fun m!1333169 () Bool)

(assert (=> b!1444125 m!1333169))

(assert (=> b!1444117 m!1333167))

(declare-fun m!1333171 () Bool)

(assert (=> b!1444117 m!1333171))

(declare-fun m!1333173 () Bool)

(assert (=> b!1444118 m!1333173))

(assert (=> b!1444118 m!1333173))

(declare-fun m!1333175 () Bool)

(assert (=> b!1444118 m!1333175))

(assert (=> b!1444123 m!1333159))

(assert (=> b!1444123 m!1333159))

(declare-fun m!1333177 () Bool)

(assert (=> b!1444123 m!1333177))

(assert (=> b!1444131 m!1333159))

(assert (=> b!1444131 m!1333159))

(declare-fun m!1333179 () Bool)

(assert (=> b!1444131 m!1333179))

(assert (=> b!1444131 m!1333179))

(assert (=> b!1444131 m!1333159))

(declare-fun m!1333181 () Bool)

(assert (=> b!1444131 m!1333181))

(assert (=> b!1444115 m!1333157))

(declare-fun m!1333183 () Bool)

(assert (=> b!1444124 m!1333183))

(declare-fun m!1333185 () Bool)

(assert (=> b!1444127 m!1333185))

(declare-fun m!1333187 () Bool)

(assert (=> b!1444116 m!1333187))

(assert (=> b!1444116 m!1333167))

(declare-fun m!1333189 () Bool)

(assert (=> b!1444116 m!1333189))

(declare-fun m!1333191 () Bool)

(assert (=> b!1444116 m!1333191))

(declare-fun m!1333193 () Bool)

(assert (=> b!1444116 m!1333193))

(assert (=> b!1444116 m!1333159))

(declare-fun m!1333195 () Bool)

(assert (=> b!1444116 m!1333195))

(declare-fun m!1333197 () Bool)

(assert (=> b!1444116 m!1333197))

(assert (=> b!1444116 m!1333159))

(declare-fun m!1333199 () Bool)

(assert (=> start!124654 m!1333199))

(declare-fun m!1333201 () Bool)

(assert (=> start!124654 m!1333201))

(push 1)

