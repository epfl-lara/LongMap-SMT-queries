; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125696 () Bool)

(assert start!125696)

(declare-fun b!1471068 () Bool)

(declare-fun res!999125 () Bool)

(declare-fun e!825718 () Bool)

(assert (=> b!1471068 (=> (not res!999125) (not e!825718))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99087 0))(
  ( (array!99088 (arr!47830 (Array (_ BitVec 32) (_ BitVec 64))) (size!48380 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99087)

(assert (=> b!1471068 (= res!999125 (and (= (size!48380 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48380 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48380 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!643124 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643121 () array!99087)

(declare-fun e!825721 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1471069 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12070 0))(
  ( (MissingZero!12070 (index!50672 (_ BitVec 32))) (Found!12070 (index!50673 (_ BitVec 32))) (Intermediate!12070 (undefined!12882 Bool) (index!50674 (_ BitVec 32)) (x!132248 (_ BitVec 32))) (Undefined!12070) (MissingVacant!12070 (index!50675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99087 (_ BitVec 32)) SeekEntryResult!12070)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99087 (_ BitVec 32)) SeekEntryResult!12070)

(assert (=> b!1471069 (= e!825721 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643124 lt!643121 mask!2687) (seekEntryOrOpen!0 lt!643124 lt!643121 mask!2687)))))

(declare-fun b!1471070 () Bool)

(declare-fun res!999122 () Bool)

(assert (=> b!1471070 (=> (not res!999122) (not e!825718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471070 (= res!999122 (validKeyInArray!0 (select (arr!47830 a!2862) i!1006)))))

(declare-fun b!1471071 () Bool)

(declare-fun res!999132 () Bool)

(assert (=> b!1471071 (=> (not res!999132) (not e!825718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99087 (_ BitVec 32)) Bool)

(assert (=> b!1471071 (= res!999132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471072 () Bool)

(declare-fun res!999131 () Bool)

(assert (=> b!1471072 (=> (not res!999131) (not e!825718))))

(assert (=> b!1471072 (= res!999131 (validKeyInArray!0 (select (arr!47830 a!2862) j!93)))))

(declare-fun b!1471073 () Bool)

(declare-fun e!825717 () Bool)

(assert (=> b!1471073 (= e!825718 e!825717)))

(declare-fun res!999121 () Bool)

(assert (=> b!1471073 (=> (not res!999121) (not e!825717))))

(assert (=> b!1471073 (= res!999121 (= (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471073 (= lt!643121 (array!99088 (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48380 a!2862)))))

(declare-fun b!1471074 () Bool)

(declare-fun res!999123 () Bool)

(declare-fun e!825719 () Bool)

(assert (=> b!1471074 (=> (not res!999123) (not e!825719))))

(assert (=> b!1471074 (= res!999123 e!825721)))

(declare-fun c!135486 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471074 (= c!135486 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471075 () Bool)

(declare-fun res!999130 () Bool)

(assert (=> b!1471075 (=> (not res!999130) (not e!825718))))

(declare-datatypes ((List!34331 0))(
  ( (Nil!34328) (Cons!34327 (h!35680 (_ BitVec 64)) (t!49025 List!34331)) )
))
(declare-fun arrayNoDuplicates!0 (array!99087 (_ BitVec 32) List!34331) Bool)

(assert (=> b!1471075 (= res!999130 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34328))))

(declare-fun b!1471076 () Bool)

(declare-fun lt!643122 () SeekEntryResult!12070)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99087 (_ BitVec 32)) SeekEntryResult!12070)

(assert (=> b!1471076 (= e!825721 (= lt!643122 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643124 lt!643121 mask!2687)))))

(declare-fun res!999133 () Bool)

(assert (=> start!125696 (=> (not res!999133) (not e!825718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125696 (= res!999133 (validMask!0 mask!2687))))

(assert (=> start!125696 e!825718))

(assert (=> start!125696 true))

(declare-fun array_inv!36858 (array!99087) Bool)

(assert (=> start!125696 (array_inv!36858 a!2862)))

(declare-fun b!1471077 () Bool)

(declare-fun res!999126 () Bool)

(assert (=> b!1471077 (=> (not res!999126) (not e!825718))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471077 (= res!999126 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48380 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48380 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48380 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471078 () Bool)

(declare-fun e!825722 () Bool)

(assert (=> b!1471078 (= e!825717 e!825722)))

(declare-fun res!999127 () Bool)

(assert (=> b!1471078 (=> (not res!999127) (not e!825722))))

(declare-fun lt!643125 () SeekEntryResult!12070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471078 (= res!999127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643125))))

(assert (=> b!1471078 (= lt!643125 (Intermediate!12070 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471079 () Bool)

(assert (=> b!1471079 (= e!825722 e!825719)))

(declare-fun res!999124 () Bool)

(assert (=> b!1471079 (=> (not res!999124) (not e!825719))))

(assert (=> b!1471079 (= res!999124 (= lt!643122 (Intermediate!12070 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471079 (= lt!643122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643124 mask!2687) lt!643124 lt!643121 mask!2687))))

(assert (=> b!1471079 (= lt!643124 (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471080 () Bool)

(assert (=> b!1471080 (= e!825719 (not (or (= (select (arr!47830 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47830 a!2862) intermediateBeforeIndex!19) (select (arr!47830 a!2862) j!93)))))))

(declare-fun e!825720 () Bool)

(assert (=> b!1471080 e!825720))

(declare-fun res!999120 () Bool)

(assert (=> b!1471080 (=> (not res!999120) (not e!825720))))

(assert (=> b!1471080 (= res!999120 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49480 0))(
  ( (Unit!49481) )
))
(declare-fun lt!643123 () Unit!49480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49480)

(assert (=> b!1471080 (= lt!643123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471081 () Bool)

(declare-fun res!999128 () Bool)

(assert (=> b!1471081 (=> (not res!999128) (not e!825722))))

(assert (=> b!1471081 (= res!999128 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643125))))

(declare-fun b!1471082 () Bool)

(assert (=> b!1471082 (= e!825720 (= (seekEntryOrOpen!0 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) (Found!12070 j!93)))))

(declare-fun b!1471083 () Bool)

(declare-fun res!999129 () Bool)

(assert (=> b!1471083 (=> (not res!999129) (not e!825719))))

(assert (=> b!1471083 (= res!999129 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125696 res!999133) b!1471068))

(assert (= (and b!1471068 res!999125) b!1471070))

(assert (= (and b!1471070 res!999122) b!1471072))

(assert (= (and b!1471072 res!999131) b!1471071))

(assert (= (and b!1471071 res!999132) b!1471075))

(assert (= (and b!1471075 res!999130) b!1471077))

(assert (= (and b!1471077 res!999126) b!1471073))

(assert (= (and b!1471073 res!999121) b!1471078))

(assert (= (and b!1471078 res!999127) b!1471081))

(assert (= (and b!1471081 res!999128) b!1471079))

(assert (= (and b!1471079 res!999124) b!1471074))

(assert (= (and b!1471074 c!135486) b!1471076))

(assert (= (and b!1471074 (not c!135486)) b!1471069))

(assert (= (and b!1471074 res!999123) b!1471083))

(assert (= (and b!1471083 res!999129) b!1471080))

(assert (= (and b!1471080 res!999120) b!1471082))

(declare-fun m!1358019 () Bool)

(assert (=> b!1471069 m!1358019))

(declare-fun m!1358021 () Bool)

(assert (=> b!1471069 m!1358021))

(declare-fun m!1358023 () Bool)

(assert (=> b!1471072 m!1358023))

(assert (=> b!1471072 m!1358023))

(declare-fun m!1358025 () Bool)

(assert (=> b!1471072 m!1358025))

(declare-fun m!1358027 () Bool)

(assert (=> b!1471071 m!1358027))

(declare-fun m!1358029 () Bool)

(assert (=> start!125696 m!1358029))

(declare-fun m!1358031 () Bool)

(assert (=> start!125696 m!1358031))

(assert (=> b!1471078 m!1358023))

(assert (=> b!1471078 m!1358023))

(declare-fun m!1358033 () Bool)

(assert (=> b!1471078 m!1358033))

(assert (=> b!1471078 m!1358033))

(assert (=> b!1471078 m!1358023))

(declare-fun m!1358035 () Bool)

(assert (=> b!1471078 m!1358035))

(declare-fun m!1358037 () Bool)

(assert (=> b!1471076 m!1358037))

(declare-fun m!1358039 () Bool)

(assert (=> b!1471079 m!1358039))

(assert (=> b!1471079 m!1358039))

(declare-fun m!1358041 () Bool)

(assert (=> b!1471079 m!1358041))

(declare-fun m!1358043 () Bool)

(assert (=> b!1471079 m!1358043))

(declare-fun m!1358045 () Bool)

(assert (=> b!1471079 m!1358045))

(assert (=> b!1471073 m!1358043))

(declare-fun m!1358047 () Bool)

(assert (=> b!1471073 m!1358047))

(declare-fun m!1358049 () Bool)

(assert (=> b!1471070 m!1358049))

(assert (=> b!1471070 m!1358049))

(declare-fun m!1358051 () Bool)

(assert (=> b!1471070 m!1358051))

(assert (=> b!1471081 m!1358023))

(assert (=> b!1471081 m!1358023))

(declare-fun m!1358053 () Bool)

(assert (=> b!1471081 m!1358053))

(declare-fun m!1358055 () Bool)

(assert (=> b!1471080 m!1358055))

(assert (=> b!1471080 m!1358023))

(declare-fun m!1358057 () Bool)

(assert (=> b!1471080 m!1358057))

(declare-fun m!1358059 () Bool)

(assert (=> b!1471080 m!1358059))

(assert (=> b!1471082 m!1358023))

(assert (=> b!1471082 m!1358023))

(declare-fun m!1358061 () Bool)

(assert (=> b!1471082 m!1358061))

(declare-fun m!1358063 () Bool)

(assert (=> b!1471075 m!1358063))

(push 1)

(assert (not b!1471082))

(assert (not start!125696))

(assert (not b!1471075))

(assert (not b!1471069))

(assert (not b!1471071))

(assert (not b!1471081))

(assert (not b!1471072))

(assert (not b!1471076))

(assert (not b!1471079))

(assert (not b!1471070))

(assert (not b!1471078))

(assert (not b!1471080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1471147 () Bool)

(declare-fun e!825765 () SeekEntryResult!12070)

(declare-fun e!825767 () SeekEntryResult!12070)

(assert (=> b!1471147 (= e!825765 e!825767)))

(declare-fun c!135507 () Bool)

(declare-fun lt!643146 () (_ BitVec 64))

(assert (=> b!1471147 (= c!135507 (or (= lt!643146 lt!643124) (= (bvadd lt!643146 lt!643146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471148 () Bool)

(declare-fun lt!643147 () SeekEntryResult!12070)

(assert (=> b!1471148 (and (bvsge (index!50674 lt!643147) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643147) (size!48380 lt!643121)))))

(declare-fun res!999163 () Bool)

(assert (=> b!1471148 (= res!999163 (= (select (arr!47830 lt!643121) (index!50674 lt!643147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825764 () Bool)

(assert (=> b!1471148 (=> res!999163 e!825764)))

(declare-fun b!1471149 () Bool)

(declare-fun e!825766 () Bool)

(declare-fun e!825768 () Bool)

(assert (=> b!1471149 (= e!825766 e!825768)))

(declare-fun res!999161 () Bool)

(assert (=> b!1471149 (= res!999161 (and (is-Intermediate!12070 lt!643147) (not (undefined!12882 lt!643147)) (bvslt (x!132248 lt!643147) #b01111111111111111111111111111110) (bvsge (x!132248 lt!643147) #b00000000000000000000000000000000) (bvsge (x!132248 lt!643147) x!665)))))

(assert (=> b!1471149 (=> (not res!999161) (not e!825768))))

(declare-fun b!1471150 () Bool)

(assert (=> b!1471150 (and (bvsge (index!50674 lt!643147) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643147) (size!48380 lt!643121)))))

(declare-fun res!999162 () Bool)

(assert (=> b!1471150 (= res!999162 (= (select (arr!47830 lt!643121) (index!50674 lt!643147)) lt!643124))))

(assert (=> b!1471150 (=> res!999162 e!825764)))

(assert (=> b!1471150 (= e!825768 e!825764)))

(declare-fun b!1471151 () Bool)

(assert (=> b!1471151 (and (bvsge (index!50674 lt!643147) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643147) (size!48380 lt!643121)))))

(assert (=> b!1471151 (= e!825764 (= (select (arr!47830 lt!643121) (index!50674 lt!643147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155429 () Bool)

(assert (=> d!155429 e!825766))

(declare-fun c!135505 () Bool)

(assert (=> d!155429 (= c!135505 (and (is-Intermediate!12070 lt!643147) (undefined!12882 lt!643147)))))

(assert (=> d!155429 (= lt!643147 e!825765)))

(declare-fun c!135506 () Bool)

(assert (=> d!155429 (= c!135506 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155429 (= lt!643146 (select (arr!47830 lt!643121) index!646))))

(assert (=> d!155429 (validMask!0 mask!2687)))

(assert (=> d!155429 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643124 lt!643121 mask!2687) lt!643147)))

(declare-fun b!1471152 () Bool)

(assert (=> b!1471152 (= e!825766 (bvsge (x!132248 lt!643147) #b01111111111111111111111111111110))))

(declare-fun b!1471153 () Bool)

(assert (=> b!1471153 (= e!825765 (Intermediate!12070 true index!646 x!665))))

(declare-fun b!1471154 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471154 (= e!825767 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643124 lt!643121 mask!2687))))

(declare-fun b!1471155 () Bool)

(assert (=> b!1471155 (= e!825767 (Intermediate!12070 false index!646 x!665))))

(assert (= (and d!155429 c!135506) b!1471153))

(assert (= (and d!155429 (not c!135506)) b!1471147))

(assert (= (and b!1471147 c!135507) b!1471155))

(assert (= (and b!1471147 (not c!135507)) b!1471154))

(assert (= (and d!155429 c!135505) b!1471152))

(assert (= (and d!155429 (not c!135505)) b!1471149))

(assert (= (and b!1471149 res!999161) b!1471150))

(assert (= (and b!1471150 (not res!999162)) b!1471148))

(assert (= (and b!1471148 (not res!999163)) b!1471151))

(declare-fun m!1358081 () Bool)

(assert (=> b!1471150 m!1358081))

(assert (=> b!1471148 m!1358081))

(assert (=> b!1471151 m!1358081))

(declare-fun m!1358087 () Bool)

(assert (=> d!155429 m!1358087))

(assert (=> d!155429 m!1358029))

(declare-fun m!1358091 () Bool)

(assert (=> b!1471154 m!1358091))

(assert (=> b!1471154 m!1358091))

(declare-fun m!1358093 () Bool)

(assert (=> b!1471154 m!1358093))

(assert (=> b!1471076 d!155429))

(declare-fun b!1471165 () Bool)

(declare-fun e!825775 () SeekEntryResult!12070)

(declare-fun e!825777 () SeekEntryResult!12070)

(assert (=> b!1471165 (= e!825775 e!825777)))

(declare-fun c!135513 () Bool)

(declare-fun lt!643150 () (_ BitVec 64))

(assert (=> b!1471165 (= c!135513 (or (= lt!643150 (select (arr!47830 a!2862) j!93)) (= (bvadd lt!643150 lt!643150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471166 () Bool)

(declare-fun lt!643151 () SeekEntryResult!12070)

(assert (=> b!1471166 (and (bvsge (index!50674 lt!643151) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643151) (size!48380 a!2862)))))

(declare-fun res!999169 () Bool)

(assert (=> b!1471166 (= res!999169 (= (select (arr!47830 a!2862) (index!50674 lt!643151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825774 () Bool)

(assert (=> b!1471166 (=> res!999169 e!825774)))

(declare-fun b!1471167 () Bool)

(declare-fun e!825776 () Bool)

(declare-fun e!825778 () Bool)

(assert (=> b!1471167 (= e!825776 e!825778)))

(declare-fun res!999167 () Bool)

(assert (=> b!1471167 (= res!999167 (and (is-Intermediate!12070 lt!643151) (not (undefined!12882 lt!643151)) (bvslt (x!132248 lt!643151) #b01111111111111111111111111111110) (bvsge (x!132248 lt!643151) #b00000000000000000000000000000000) (bvsge (x!132248 lt!643151) #b00000000000000000000000000000000)))))

(assert (=> b!1471167 (=> (not res!999167) (not e!825778))))

(declare-fun b!1471168 () Bool)

(assert (=> b!1471168 (and (bvsge (index!50674 lt!643151) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643151) (size!48380 a!2862)))))

(declare-fun res!999168 () Bool)

(assert (=> b!1471168 (= res!999168 (= (select (arr!47830 a!2862) (index!50674 lt!643151)) (select (arr!47830 a!2862) j!93)))))

(assert (=> b!1471168 (=> res!999168 e!825774)))

(assert (=> b!1471168 (= e!825778 e!825774)))

(declare-fun b!1471169 () Bool)

(assert (=> b!1471169 (and (bvsge (index!50674 lt!643151) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643151) (size!48380 a!2862)))))

(assert (=> b!1471169 (= e!825774 (= (select (arr!47830 a!2862) (index!50674 lt!643151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155435 () Bool)

(assert (=> d!155435 e!825776))

(declare-fun c!135511 () Bool)

(assert (=> d!155435 (= c!135511 (and (is-Intermediate!12070 lt!643151) (undefined!12882 lt!643151)))))

(assert (=> d!155435 (= lt!643151 e!825775)))

(declare-fun c!135512 () Bool)

(assert (=> d!155435 (= c!135512 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155435 (= lt!643150 (select (arr!47830 a!2862) (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687)))))

(assert (=> d!155435 (validMask!0 mask!2687)))

(assert (=> d!155435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643151)))

(declare-fun b!1471170 () Bool)

(assert (=> b!1471170 (= e!825776 (bvsge (x!132248 lt!643151) #b01111111111111111111111111111110))))

(declare-fun b!1471171 () Bool)

(assert (=> b!1471171 (= e!825775 (Intermediate!12070 true (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471172 () Bool)

(assert (=> b!1471172 (= e!825777 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471173 () Bool)

(assert (=> b!1471173 (= e!825777 (Intermediate!12070 false (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155435 c!135512) b!1471171))

(assert (= (and d!155435 (not c!135512)) b!1471165))

(assert (= (and b!1471165 c!135513) b!1471173))

(assert (= (and b!1471165 (not c!135513)) b!1471172))

(assert (= (and d!155435 c!135511) b!1471170))

(assert (= (and d!155435 (not c!135511)) b!1471167))

(assert (= (and b!1471167 res!999167) b!1471168))

(assert (= (and b!1471168 (not res!999168)) b!1471166))

(assert (= (and b!1471166 (not res!999169)) b!1471169))

(declare-fun m!1358097 () Bool)

(assert (=> b!1471168 m!1358097))

(assert (=> b!1471166 m!1358097))

(assert (=> b!1471169 m!1358097))

(assert (=> d!155435 m!1358033))

(declare-fun m!1358099 () Bool)

(assert (=> d!155435 m!1358099))

(assert (=> d!155435 m!1358029))

(assert (=> b!1471172 m!1358033))

(declare-fun m!1358101 () Bool)

(assert (=> b!1471172 m!1358101))

(assert (=> b!1471172 m!1358101))

(assert (=> b!1471172 m!1358023))

(declare-fun m!1358103 () Bool)

(assert (=> b!1471172 m!1358103))

(assert (=> b!1471078 d!155435))

(declare-fun d!155439 () Bool)

(declare-fun lt!643171 () (_ BitVec 32))

(declare-fun lt!643170 () (_ BitVec 32))

(assert (=> d!155439 (= lt!643171 (bvmul (bvxor lt!643170 (bvlshr lt!643170 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155439 (= lt!643170 ((_ extract 31 0) (bvand (bvxor (select (arr!47830 a!2862) j!93) (bvlshr (select (arr!47830 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155439 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999171 (let ((h!35682 ((_ extract 31 0) (bvand (bvxor (select (arr!47830 a!2862) j!93) (bvlshr (select (arr!47830 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132252 (bvmul (bvxor h!35682 (bvlshr h!35682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132252 (bvlshr x!132252 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999171 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999171 #b00000000000000000000000000000000))))))

(assert (=> d!155439 (= (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (bvand (bvxor lt!643171 (bvlshr lt!643171 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471078 d!155439))

(declare-fun b!1471191 () Bool)

(declare-fun e!825791 () SeekEntryResult!12070)

(declare-fun e!825793 () SeekEntryResult!12070)

(assert (=> b!1471191 (= e!825791 e!825793)))

(declare-fun c!135521 () Bool)

(declare-fun lt!643172 () (_ BitVec 64))

(assert (=> b!1471191 (= c!135521 (or (= lt!643172 lt!643124) (= (bvadd lt!643172 lt!643172) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471192 () Bool)

(declare-fun lt!643173 () SeekEntryResult!12070)

(assert (=> b!1471192 (and (bvsge (index!50674 lt!643173) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643173) (size!48380 lt!643121)))))

(declare-fun res!999181 () Bool)

(assert (=> b!1471192 (= res!999181 (= (select (arr!47830 lt!643121) (index!50674 lt!643173)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825790 () Bool)

(assert (=> b!1471192 (=> res!999181 e!825790)))

(declare-fun b!1471193 () Bool)

(declare-fun e!825792 () Bool)

(declare-fun e!825794 () Bool)

(assert (=> b!1471193 (= e!825792 e!825794)))

(declare-fun res!999179 () Bool)

(assert (=> b!1471193 (= res!999179 (and (is-Intermediate!12070 lt!643173) (not (undefined!12882 lt!643173)) (bvslt (x!132248 lt!643173) #b01111111111111111111111111111110) (bvsge (x!132248 lt!643173) #b00000000000000000000000000000000) (bvsge (x!132248 lt!643173) #b00000000000000000000000000000000)))))

(assert (=> b!1471193 (=> (not res!999179) (not e!825794))))

(declare-fun b!1471194 () Bool)

(assert (=> b!1471194 (and (bvsge (index!50674 lt!643173) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643173) (size!48380 lt!643121)))))

(declare-fun res!999180 () Bool)

(assert (=> b!1471194 (= res!999180 (= (select (arr!47830 lt!643121) (index!50674 lt!643173)) lt!643124))))

(assert (=> b!1471194 (=> res!999180 e!825790)))

(assert (=> b!1471194 (= e!825794 e!825790)))

(declare-fun b!1471195 () Bool)

(assert (=> b!1471195 (and (bvsge (index!50674 lt!643173) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643173) (size!48380 lt!643121)))))

(assert (=> b!1471195 (= e!825790 (= (select (arr!47830 lt!643121) (index!50674 lt!643173)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155443 () Bool)

(assert (=> d!155443 e!825792))

(declare-fun c!135519 () Bool)

(assert (=> d!155443 (= c!135519 (and (is-Intermediate!12070 lt!643173) (undefined!12882 lt!643173)))))

(assert (=> d!155443 (= lt!643173 e!825791)))

(declare-fun c!135520 () Bool)

(assert (=> d!155443 (= c!135520 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155443 (= lt!643172 (select (arr!47830 lt!643121) (toIndex!0 lt!643124 mask!2687)))))

(assert (=> d!155443 (validMask!0 mask!2687)))

(assert (=> d!155443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643124 mask!2687) lt!643124 lt!643121 mask!2687) lt!643173)))

(declare-fun b!1471196 () Bool)

(assert (=> b!1471196 (= e!825792 (bvsge (x!132248 lt!643173) #b01111111111111111111111111111110))))

(declare-fun b!1471197 () Bool)

(assert (=> b!1471197 (= e!825791 (Intermediate!12070 true (toIndex!0 lt!643124 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471198 () Bool)

(assert (=> b!1471198 (= e!825793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643124 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643124 lt!643121 mask!2687))))

(declare-fun b!1471199 () Bool)

(assert (=> b!1471199 (= e!825793 (Intermediate!12070 false (toIndex!0 lt!643124 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155443 c!135520) b!1471197))

(assert (= (and d!155443 (not c!135520)) b!1471191))

(assert (= (and b!1471191 c!135521) b!1471199))

(assert (= (and b!1471191 (not c!135521)) b!1471198))

(assert (= (and d!155443 c!135519) b!1471196))

(assert (= (and d!155443 (not c!135519)) b!1471193))

(assert (= (and b!1471193 res!999179) b!1471194))

(assert (= (and b!1471194 (not res!999180)) b!1471192))

(assert (= (and b!1471192 (not res!999181)) b!1471195))

(declare-fun m!1358113 () Bool)

(assert (=> b!1471194 m!1358113))

(assert (=> b!1471192 m!1358113))

(assert (=> b!1471195 m!1358113))

(assert (=> d!155443 m!1358039))

(declare-fun m!1358115 () Bool)

(assert (=> d!155443 m!1358115))

(assert (=> d!155443 m!1358029))

(assert (=> b!1471198 m!1358039))

(declare-fun m!1358117 () Bool)

(assert (=> b!1471198 m!1358117))

(assert (=> b!1471198 m!1358117))

(declare-fun m!1358119 () Bool)

(assert (=> b!1471198 m!1358119))

(assert (=> b!1471079 d!155443))

(declare-fun d!155449 () Bool)

(declare-fun lt!643179 () (_ BitVec 32))

(declare-fun lt!643178 () (_ BitVec 32))

(assert (=> d!155449 (= lt!643179 (bvmul (bvxor lt!643178 (bvlshr lt!643178 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155449 (= lt!643178 ((_ extract 31 0) (bvand (bvxor lt!643124 (bvlshr lt!643124 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155449 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999171 (let ((h!35682 ((_ extract 31 0) (bvand (bvxor lt!643124 (bvlshr lt!643124 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132252 (bvmul (bvxor h!35682 (bvlshr h!35682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132252 (bvlshr x!132252 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999171 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999171 #b00000000000000000000000000000000))))))

(assert (=> d!155449 (= (toIndex!0 lt!643124 mask!2687) (bvand (bvxor lt!643179 (bvlshr lt!643179 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471079 d!155449))

(declare-fun b!1471243 () Bool)

(declare-fun e!825820 () SeekEntryResult!12070)

(assert (=> b!1471243 (= e!825820 Undefined!12070)))

(declare-fun b!1471244 () Bool)

(declare-fun c!135543 () Bool)

(declare-fun lt!643196 () (_ BitVec 64))

(assert (=> b!1471244 (= c!135543 (= lt!643196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825819 () SeekEntryResult!12070)

(declare-fun e!825818 () SeekEntryResult!12070)

(assert (=> b!1471244 (= e!825819 e!825818)))

(declare-fun b!1471245 () Bool)

(assert (=> b!1471245 (= e!825818 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643124 lt!643121 mask!2687))))

(declare-fun lt!643197 () SeekEntryResult!12070)

(declare-fun d!155451 () Bool)

(assert (=> d!155451 (and (or (is-Undefined!12070 lt!643197) (not (is-Found!12070 lt!643197)) (and (bvsge (index!50673 lt!643197) #b00000000000000000000000000000000) (bvslt (index!50673 lt!643197) (size!48380 lt!643121)))) (or (is-Undefined!12070 lt!643197) (is-Found!12070 lt!643197) (not (is-MissingVacant!12070 lt!643197)) (not (= (index!50675 lt!643197) intermediateAfterIndex!19)) (and (bvsge (index!50675 lt!643197) #b00000000000000000000000000000000) (bvslt (index!50675 lt!643197) (size!48380 lt!643121)))) (or (is-Undefined!12070 lt!643197) (ite (is-Found!12070 lt!643197) (= (select (arr!47830 lt!643121) (index!50673 lt!643197)) lt!643124) (and (is-MissingVacant!12070 lt!643197) (= (index!50675 lt!643197) intermediateAfterIndex!19) (= (select (arr!47830 lt!643121) (index!50675 lt!643197)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155451 (= lt!643197 e!825820)))

(declare-fun c!135541 () Bool)

(assert (=> d!155451 (= c!135541 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155451 (= lt!643196 (select (arr!47830 lt!643121) index!646))))

(assert (=> d!155451 (validMask!0 mask!2687)))

(assert (=> d!155451 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643124 lt!643121 mask!2687) lt!643197)))

(declare-fun b!1471246 () Bool)

(assert (=> b!1471246 (= e!825820 e!825819)))

(declare-fun c!135542 () Bool)

(assert (=> b!1471246 (= c!135542 (= lt!643196 lt!643124))))

(declare-fun b!1471247 () Bool)

(assert (=> b!1471247 (= e!825818 (MissingVacant!12070 intermediateAfterIndex!19))))

(declare-fun b!1471248 () Bool)

(assert (=> b!1471248 (= e!825819 (Found!12070 index!646))))

(assert (= (and d!155451 c!135541) b!1471243))

(assert (= (and d!155451 (not c!135541)) b!1471246))

(assert (= (and b!1471246 c!135542) b!1471248))

(assert (= (and b!1471246 (not c!135542)) b!1471244))

(assert (= (and b!1471244 c!135543) b!1471247))

(assert (= (and b!1471244 (not c!135543)) b!1471245))

(assert (=> b!1471245 m!1358091))

(assert (=> b!1471245 m!1358091))

(declare-fun m!1358143 () Bool)

(assert (=> b!1471245 m!1358143))

(declare-fun m!1358145 () Bool)

(assert (=> d!155451 m!1358145))

(declare-fun m!1358149 () Bool)

(assert (=> d!155451 m!1358149))

(assert (=> d!155451 m!1358087))

(assert (=> d!155451 m!1358029))

(assert (=> b!1471069 d!155451))

(declare-fun b!1471306 () Bool)

(declare-fun e!825853 () SeekEntryResult!12070)

(declare-fun e!825852 () SeekEntryResult!12070)

(assert (=> b!1471306 (= e!825853 e!825852)))

(declare-fun lt!643219 () (_ BitVec 64))

(declare-fun lt!643220 () SeekEntryResult!12070)

(assert (=> b!1471306 (= lt!643219 (select (arr!47830 lt!643121) (index!50674 lt!643220)))))

(declare-fun c!135568 () Bool)

(assert (=> b!1471306 (= c!135568 (= lt!643219 lt!643124))))

(declare-fun b!1471307 () Bool)

(declare-fun c!135570 () Bool)

(assert (=> b!1471307 (= c!135570 (= lt!643219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825851 () SeekEntryResult!12070)

(assert (=> b!1471307 (= e!825852 e!825851)))

(declare-fun b!1471308 () Bool)

(assert (=> b!1471308 (= e!825852 (Found!12070 (index!50674 lt!643220)))))

(declare-fun b!1471309 () Bool)

(assert (=> b!1471309 (= e!825851 (MissingZero!12070 (index!50674 lt!643220)))))

(declare-fun b!1471310 () Bool)

(assert (=> b!1471310 (= e!825853 Undefined!12070)))

(declare-fun d!155461 () Bool)

(declare-fun lt!643221 () SeekEntryResult!12070)

(assert (=> d!155461 (and (or (is-Undefined!12070 lt!643221) (not (is-Found!12070 lt!643221)) (and (bvsge (index!50673 lt!643221) #b00000000000000000000000000000000) (bvslt (index!50673 lt!643221) (size!48380 lt!643121)))) (or (is-Undefined!12070 lt!643221) (is-Found!12070 lt!643221) (not (is-MissingZero!12070 lt!643221)) (and (bvsge (index!50672 lt!643221) #b00000000000000000000000000000000) (bvslt (index!50672 lt!643221) (size!48380 lt!643121)))) (or (is-Undefined!12070 lt!643221) (is-Found!12070 lt!643221) (is-MissingZero!12070 lt!643221) (not (is-MissingVacant!12070 lt!643221)) (and (bvsge (index!50675 lt!643221) #b00000000000000000000000000000000) (bvslt (index!50675 lt!643221) (size!48380 lt!643121)))) (or (is-Undefined!12070 lt!643221) (ite (is-Found!12070 lt!643221) (= (select (arr!47830 lt!643121) (index!50673 lt!643221)) lt!643124) (ite (is-MissingZero!12070 lt!643221) (= (select (arr!47830 lt!643121) (index!50672 lt!643221)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12070 lt!643221) (= (select (arr!47830 lt!643121) (index!50675 lt!643221)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155461 (= lt!643221 e!825853)))

(declare-fun c!135569 () Bool)

(assert (=> d!155461 (= c!135569 (and (is-Intermediate!12070 lt!643220) (undefined!12882 lt!643220)))))

(assert (=> d!155461 (= lt!643220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643124 mask!2687) lt!643124 lt!643121 mask!2687))))

(assert (=> d!155461 (validMask!0 mask!2687)))

(assert (=> d!155461 (= (seekEntryOrOpen!0 lt!643124 lt!643121 mask!2687) lt!643221)))

(declare-fun b!1471311 () Bool)

(assert (=> b!1471311 (= e!825851 (seekKeyOrZeroReturnVacant!0 (x!132248 lt!643220) (index!50674 lt!643220) (index!50674 lt!643220) lt!643124 lt!643121 mask!2687))))

(assert (= (and d!155461 c!135569) b!1471310))

(assert (= (and d!155461 (not c!135569)) b!1471306))

(assert (= (and b!1471306 c!135568) b!1471308))

(assert (= (and b!1471306 (not c!135568)) b!1471307))

(assert (= (and b!1471307 c!135570) b!1471309))

(assert (= (and b!1471307 (not c!135570)) b!1471311))

(declare-fun m!1358161 () Bool)

(assert (=> b!1471306 m!1358161))

(assert (=> d!155461 m!1358029))

(assert (=> d!155461 m!1358039))

(assert (=> d!155461 m!1358039))

(assert (=> d!155461 m!1358041))

(declare-fun m!1358169 () Bool)

(assert (=> d!155461 m!1358169))

(declare-fun m!1358171 () Bool)

(assert (=> d!155461 m!1358171))

(declare-fun m!1358175 () Bool)

(assert (=> d!155461 m!1358175))

(declare-fun m!1358177 () Bool)

(assert (=> b!1471311 m!1358177))

(assert (=> b!1471069 d!155461))

(declare-fun b!1471344 () Bool)

(declare-fun e!825874 () Bool)

(declare-fun e!825872 () Bool)

(assert (=> b!1471344 (= e!825874 e!825872)))

(declare-fun lt!643242 () (_ BitVec 64))

(assert (=> b!1471344 (= lt!643242 (select (arr!47830 a!2862) j!93))))

(declare-fun lt!643241 () Unit!49480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99087 (_ BitVec 64) (_ BitVec 32)) Unit!49480)

(assert (=> b!1471344 (= lt!643241 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643242 j!93))))

(declare-fun arrayContainsKey!0 (array!99087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1471344 (arrayContainsKey!0 a!2862 lt!643242 #b00000000000000000000000000000000)))

(declare-fun lt!643240 () Unit!49480)

(assert (=> b!1471344 (= lt!643240 lt!643241)))

(declare-fun res!999201 () Bool)

(assert (=> b!1471344 (= res!999201 (= (seekEntryOrOpen!0 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) (Found!12070 j!93)))))

(assert (=> b!1471344 (=> (not res!999201) (not e!825872))))

(declare-fun d!155467 () Bool)

(declare-fun res!999200 () Bool)

(declare-fun e!825873 () Bool)

(assert (=> d!155467 (=> res!999200 e!825873)))

(assert (=> d!155467 (= res!999200 (bvsge j!93 (size!48380 a!2862)))))

(assert (=> d!155467 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825873)))

(declare-fun b!1471345 () Bool)

(declare-fun call!67729 () Bool)

(assert (=> b!1471345 (= e!825872 call!67729)))

(declare-fun b!1471346 () Bool)

(assert (=> b!1471346 (= e!825873 e!825874)))

(declare-fun c!135585 () Bool)

(assert (=> b!1471346 (= c!135585 (validKeyInArray!0 (select (arr!47830 a!2862) j!93)))))

(declare-fun b!1471347 () Bool)

(assert (=> b!1471347 (= e!825874 call!67729)))

(declare-fun bm!67726 () Bool)

(assert (=> bm!67726 (= call!67729 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155467 (not res!999200)) b!1471346))

(assert (= (and b!1471346 c!135585) b!1471344))

(assert (= (and b!1471346 (not c!135585)) b!1471347))

(assert (= (and b!1471344 res!999201) b!1471345))

(assert (= (or b!1471345 b!1471347) bm!67726))

(assert (=> b!1471344 m!1358023))

(declare-fun m!1358191 () Bool)

(assert (=> b!1471344 m!1358191))

(declare-fun m!1358195 () Bool)

(assert (=> b!1471344 m!1358195))

(assert (=> b!1471344 m!1358023))

(assert (=> b!1471344 m!1358061))

(assert (=> b!1471346 m!1358023))

(assert (=> b!1471346 m!1358023))

(assert (=> b!1471346 m!1358025))

(declare-fun m!1358203 () Bool)

(assert (=> bm!67726 m!1358203))

(assert (=> b!1471080 d!155467))

(declare-fun d!155473 () Bool)

(assert (=> d!155473 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643252 () Unit!49480)

(declare-fun choose!38 (array!99087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49480)

(assert (=> d!155473 (= lt!643252 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155473 (validMask!0 mask!2687)))

(assert (=> d!155473 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643252)))

(declare-fun bs!42508 () Bool)

(assert (= bs!42508 d!155473))

(assert (=> bs!42508 m!1358057))

(declare-fun m!1358225 () Bool)

(assert (=> bs!42508 m!1358225))

(assert (=> bs!42508 m!1358029))

(assert (=> b!1471080 d!155473))

(declare-fun d!155485 () Bool)

(assert (=> d!155485 (= (validKeyInArray!0 (select (arr!47830 a!2862) i!1006)) (and (not (= (select (arr!47830 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47830 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471070 d!155485))

(declare-fun b!1471370 () Bool)

(declare-fun e!825889 () SeekEntryResult!12070)

(declare-fun e!825891 () SeekEntryResult!12070)

(assert (=> b!1471370 (= e!825889 e!825891)))

(declare-fun lt!643257 () (_ BitVec 64))

(declare-fun c!135595 () Bool)

(assert (=> b!1471370 (= c!135595 (or (= lt!643257 (select (arr!47830 a!2862) j!93)) (= (bvadd lt!643257 lt!643257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471371 () Bool)

(declare-fun lt!643258 () SeekEntryResult!12070)

(assert (=> b!1471371 (and (bvsge (index!50674 lt!643258) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643258) (size!48380 a!2862)))))

(declare-fun res!999213 () Bool)

(assert (=> b!1471371 (= res!999213 (= (select (arr!47830 a!2862) (index!50674 lt!643258)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825888 () Bool)

(assert (=> b!1471371 (=> res!999213 e!825888)))

(declare-fun b!1471372 () Bool)

(declare-fun e!825890 () Bool)

(declare-fun e!825892 () Bool)

(assert (=> b!1471372 (= e!825890 e!825892)))

(declare-fun res!999211 () Bool)

(assert (=> b!1471372 (= res!999211 (and (is-Intermediate!12070 lt!643258) (not (undefined!12882 lt!643258)) (bvslt (x!132248 lt!643258) #b01111111111111111111111111111110) (bvsge (x!132248 lt!643258) #b00000000000000000000000000000000) (bvsge (x!132248 lt!643258) x!665)))))

(assert (=> b!1471372 (=> (not res!999211) (not e!825892))))

(declare-fun b!1471373 () Bool)

(assert (=> b!1471373 (and (bvsge (index!50674 lt!643258) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643258) (size!48380 a!2862)))))

(declare-fun res!999212 () Bool)

(assert (=> b!1471373 (= res!999212 (= (select (arr!47830 a!2862) (index!50674 lt!643258)) (select (arr!47830 a!2862) j!93)))))

(assert (=> b!1471373 (=> res!999212 e!825888)))

(assert (=> b!1471373 (= e!825892 e!825888)))

(declare-fun b!1471374 () Bool)

(assert (=> b!1471374 (and (bvsge (index!50674 lt!643258) #b00000000000000000000000000000000) (bvslt (index!50674 lt!643258) (size!48380 a!2862)))))

(assert (=> b!1471374 (= e!825888 (= (select (arr!47830 a!2862) (index!50674 lt!643258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!155487 () Bool)

(assert (=> d!155487 e!825890))

(declare-fun c!135593 () Bool)

(assert (=> d!155487 (= c!135593 (and (is-Intermediate!12070 lt!643258) (undefined!12882 lt!643258)))))

(assert (=> d!155487 (= lt!643258 e!825889)))

(declare-fun c!135594 () Bool)

(assert (=> d!155487 (= c!135594 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155487 (= lt!643257 (select (arr!47830 a!2862) index!646))))

(assert (=> d!155487 (validMask!0 mask!2687)))

(assert (=> d!155487 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643258)))

(declare-fun b!1471375 () Bool)

(assert (=> b!1471375 (= e!825890 (bvsge (x!132248 lt!643258) #b01111111111111111111111111111110))))

(declare-fun b!1471376 () Bool)

(assert (=> b!1471376 (= e!825889 (Intermediate!12070 true index!646 x!665))))

(declare-fun b!1471377 () Bool)

(assert (=> b!1471377 (= e!825891 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471378 () Bool)

(assert (=> b!1471378 (= e!825891 (Intermediate!12070 false index!646 x!665))))

(assert (= (and d!155487 c!135594) b!1471376))

(assert (= (and d!155487 (not c!135594)) b!1471370))

(assert (= (and b!1471370 c!135595) b!1471378))

(assert (= (and b!1471370 (not c!135595)) b!1471377))

(assert (= (and d!155487 c!135593) b!1471375))

(assert (= (and d!155487 (not c!135593)) b!1471372))

(assert (= (and b!1471372 res!999211) b!1471373))

(assert (= (and b!1471373 (not res!999212)) b!1471371))

(assert (= (and b!1471371 (not res!999213)) b!1471374))

(declare-fun m!1358227 () Bool)

(assert (=> b!1471373 m!1358227))

(assert (=> b!1471371 m!1358227))

(assert (=> b!1471374 m!1358227))

(declare-fun m!1358229 () Bool)

(assert (=> d!155487 m!1358229))

(assert (=> d!155487 m!1358029))

(assert (=> b!1471377 m!1358091))

(assert (=> b!1471377 m!1358091))

(assert (=> b!1471377 m!1358023))

(declare-fun m!1358231 () Bool)

(assert (=> b!1471377 m!1358231))

(assert (=> b!1471081 d!155487))

(declare-fun b!1471379 () Bool)

(declare-fun e!825895 () Bool)

(declare-fun e!825893 () Bool)

(assert (=> b!1471379 (= e!825895 e!825893)))

(declare-fun lt!643263 () (_ BitVec 64))

(assert (=> b!1471379 (= lt!643263 (select (arr!47830 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643262 () Unit!49480)

(assert (=> b!1471379 (= lt!643262 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643263 #b00000000000000000000000000000000))))

(assert (=> b!1471379 (arrayContainsKey!0 a!2862 lt!643263 #b00000000000000000000000000000000)))

(declare-fun lt!643261 () Unit!49480)

(assert (=> b!1471379 (= lt!643261 lt!643262)))

(declare-fun res!999215 () Bool)

(assert (=> b!1471379 (= res!999215 (= (seekEntryOrOpen!0 (select (arr!47830 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12070 #b00000000000000000000000000000000)))))

(assert (=> b!1471379 (=> (not res!999215) (not e!825893))))

(declare-fun d!155491 () Bool)

(declare-fun res!999214 () Bool)

(declare-fun e!825894 () Bool)

(assert (=> d!155491 (=> res!999214 e!825894)))

(assert (=> d!155491 (= res!999214 (bvsge #b00000000000000000000000000000000 (size!48380 a!2862)))))

(assert (=> d!155491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825894)))

(declare-fun b!1471380 () Bool)

(declare-fun call!67731 () Bool)

(assert (=> b!1471380 (= e!825893 call!67731)))

(declare-fun b!1471381 () Bool)

(assert (=> b!1471381 (= e!825894 e!825895)))

(declare-fun c!135596 () Bool)

(assert (=> b!1471381 (= c!135596 (validKeyInArray!0 (select (arr!47830 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471382 () Bool)

(assert (=> b!1471382 (= e!825895 call!67731)))

(declare-fun bm!67728 () Bool)

(assert (=> bm!67728 (= call!67731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155491 (not res!999214)) b!1471381))

(assert (= (and b!1471381 c!135596) b!1471379))

(assert (= (and b!1471381 (not c!135596)) b!1471382))

(assert (= (and b!1471379 res!999215) b!1471380))

(assert (= (or b!1471380 b!1471382) bm!67728))

(declare-fun m!1358233 () Bool)

(assert (=> b!1471379 m!1358233))

(declare-fun m!1358235 () Bool)

(assert (=> b!1471379 m!1358235))

(declare-fun m!1358237 () Bool)

(assert (=> b!1471379 m!1358237))

(assert (=> b!1471379 m!1358233))

(declare-fun m!1358239 () Bool)

(assert (=> b!1471379 m!1358239))

(assert (=> b!1471381 m!1358233))

(assert (=> b!1471381 m!1358233))

(declare-fun m!1358241 () Bool)

(assert (=> b!1471381 m!1358241))

(declare-fun m!1358243 () Bool)

(assert (=> bm!67728 m!1358243))

(assert (=> b!1471071 d!155491))

(declare-fun d!155493 () Bool)

(assert (=> d!155493 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125696 d!155493))

(declare-fun d!155505 () Bool)

(assert (=> d!155505 (= (array_inv!36858 a!2862) (bvsge (size!48380 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125696 d!155505))

(declare-fun b!1471411 () Bool)

(declare-fun e!825918 () SeekEntryResult!12070)

(declare-fun e!825917 () SeekEntryResult!12070)

(assert (=> b!1471411 (= e!825918 e!825917)))

(declare-fun lt!643269 () (_ BitVec 64))

(declare-fun lt!643270 () SeekEntryResult!12070)

(assert (=> b!1471411 (= lt!643269 (select (arr!47830 a!2862) (index!50674 lt!643270)))))

(declare-fun c!135604 () Bool)

(assert (=> b!1471411 (= c!135604 (= lt!643269 (select (arr!47830 a!2862) j!93)))))

(declare-fun b!1471412 () Bool)

(declare-fun c!135606 () Bool)

(assert (=> b!1471412 (= c!135606 (= lt!643269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825916 () SeekEntryResult!12070)

(assert (=> b!1471412 (= e!825917 e!825916)))

(declare-fun b!1471413 () Bool)

(assert (=> b!1471413 (= e!825917 (Found!12070 (index!50674 lt!643270)))))

(declare-fun b!1471414 () Bool)

(assert (=> b!1471414 (= e!825916 (MissingZero!12070 (index!50674 lt!643270)))))

(declare-fun b!1471415 () Bool)

(assert (=> b!1471415 (= e!825918 Undefined!12070)))

(declare-fun d!155507 () Bool)

(declare-fun lt!643271 () SeekEntryResult!12070)

(assert (=> d!155507 (and (or (is-Undefined!12070 lt!643271) (not (is-Found!12070 lt!643271)) (and (bvsge (index!50673 lt!643271) #b00000000000000000000000000000000) (bvslt (index!50673 lt!643271) (size!48380 a!2862)))) (or (is-Undefined!12070 lt!643271) (is-Found!12070 lt!643271) (not (is-MissingZero!12070 lt!643271)) (and (bvsge (index!50672 lt!643271) #b00000000000000000000000000000000) (bvslt (index!50672 lt!643271) (size!48380 a!2862)))) (or (is-Undefined!12070 lt!643271) (is-Found!12070 lt!643271) (is-MissingZero!12070 lt!643271) (not (is-MissingVacant!12070 lt!643271)) (and (bvsge (index!50675 lt!643271) #b00000000000000000000000000000000) (bvslt (index!50675 lt!643271) (size!48380 a!2862)))) (or (is-Undefined!12070 lt!643271) (ite (is-Found!12070 lt!643271) (= (select (arr!47830 a!2862) (index!50673 lt!643271)) (select (arr!47830 a!2862) j!93)) (ite (is-MissingZero!12070 lt!643271) (= (select (arr!47830 a!2862) (index!50672 lt!643271)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12070 lt!643271) (= (select (arr!47830 a!2862) (index!50675 lt!643271)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155507 (= lt!643271 e!825918)))

(declare-fun c!135605 () Bool)

(assert (=> d!155507 (= c!135605 (and (is-Intermediate!12070 lt!643270) (undefined!12882 lt!643270)))))

(assert (=> d!155507 (= lt!643270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155507 (validMask!0 mask!2687)))

(assert (=> d!155507 (= (seekEntryOrOpen!0 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!643271)))

(declare-fun b!1471416 () Bool)

(assert (=> b!1471416 (= e!825916 (seekKeyOrZeroReturnVacant!0 (x!132248 lt!643270) (index!50674 lt!643270) (index!50674 lt!643270) (select (arr!47830 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155507 c!135605) b!1471415))

(assert (= (and d!155507 (not c!135605)) b!1471411))

(assert (= (and b!1471411 c!135604) b!1471413))

(assert (= (and b!1471411 (not c!135604)) b!1471412))

(assert (= (and b!1471412 c!135606) b!1471414))

(assert (= (and b!1471412 (not c!135606)) b!1471416))

(declare-fun m!1358267 () Bool)

(assert (=> b!1471411 m!1358267))

(assert (=> d!155507 m!1358029))

(assert (=> d!155507 m!1358023))

(assert (=> d!155507 m!1358033))

(assert (=> d!155507 m!1358033))

(assert (=> d!155507 m!1358023))

(assert (=> d!155507 m!1358035))

(declare-fun m!1358269 () Bool)

(assert (=> d!155507 m!1358269))

(declare-fun m!1358271 () Bool)

(assert (=> d!155507 m!1358271))

(declare-fun m!1358273 () Bool)

(assert (=> d!155507 m!1358273))

(assert (=> b!1471416 m!1358023))

(declare-fun m!1358275 () Bool)

(assert (=> b!1471416 m!1358275))

(assert (=> b!1471082 d!155507))

(declare-fun d!155509 () Bool)

(assert (=> d!155509 (= (validKeyInArray!0 (select (arr!47830 a!2862) j!93)) (and (not (= (select (arr!47830 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47830 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471072 d!155509))

(declare-fun b!1471427 () Bool)

(declare-fun e!825927 () Bool)

(declare-fun call!67738 () Bool)

(assert (=> b!1471427 (= e!825927 call!67738)))

(declare-fun b!1471428 () Bool)

(assert (=> b!1471428 (= e!825927 call!67738)))

(declare-fun d!155511 () Bool)

(declare-fun res!999236 () Bool)

(declare-fun e!825928 () Bool)

(assert (=> d!155511 (=> res!999236 e!825928)))

(assert (=> d!155511 (= res!999236 (bvsge #b00000000000000000000000000000000 (size!48380 a!2862)))))

(assert (=> d!155511 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34328) e!825928)))

(declare-fun b!1471429 () Bool)

(declare-fun e!825929 () Bool)

(declare-fun contains!9901 (List!34331 (_ BitVec 64)) Bool)

(assert (=> b!1471429 (= e!825929 (contains!9901 Nil!34328 (select (arr!47830 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471430 () Bool)

(declare-fun e!825930 () Bool)

(assert (=> b!1471430 (= e!825928 e!825930)))

(declare-fun res!999238 () Bool)

(assert (=> b!1471430 (=> (not res!999238) (not e!825930))))

(assert (=> b!1471430 (= res!999238 (not e!825929))))

(declare-fun res!999237 () Bool)

(assert (=> b!1471430 (=> (not res!999237) (not e!825929))))

(assert (=> b!1471430 (= res!999237 (validKeyInArray!0 (select (arr!47830 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67735 () Bool)

(declare-fun c!135609 () Bool)

(assert (=> bm!67735 (= call!67738 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135609 (Cons!34327 (select (arr!47830 a!2862) #b00000000000000000000000000000000) Nil!34328) Nil!34328)))))

(declare-fun b!1471431 () Bool)

(assert (=> b!1471431 (= e!825930 e!825927)))

