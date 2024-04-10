; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125136 () Bool)

(assert start!125136)

(declare-fun b!1458132 () Bool)

(declare-fun res!988317 () Bool)

(declare-fun e!820209 () Bool)

(assert (=> b!1458132 (=> (not res!988317) (not e!820209))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98584 0))(
  ( (array!98585 (arr!47580 (Array (_ BitVec 32) (_ BitVec 64))) (size!48130 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98584)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458132 (= res!988317 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48130 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48130 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48130 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!638936 () array!98584)

(declare-fun lt!638931 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1458133 () Bool)

(declare-fun e!820203 () Bool)

(declare-datatypes ((SeekEntryResult!11832 0))(
  ( (MissingZero!11832 (index!49720 (_ BitVec 32))) (Found!11832 (index!49721 (_ BitVec 32))) (Intermediate!11832 (undefined!12644 Bool) (index!49722 (_ BitVec 32)) (x!131337 (_ BitVec 32))) (Undefined!11832) (MissingVacant!11832 (index!49723 (_ BitVec 32))) )
))
(declare-fun lt!638937 () SeekEntryResult!11832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11832)

(assert (=> b!1458133 (= e!820203 (= lt!638937 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638931 lt!638936 mask!2687)))))

(declare-fun b!1458134 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11832)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98584 (_ BitVec 32)) SeekEntryResult!11832)

(assert (=> b!1458134 (= e!820203 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638931 lt!638936 mask!2687) (seekEntryOrOpen!0 lt!638931 lt!638936 mask!2687)))))

(declare-fun b!1458135 () Bool)

(declare-fun lt!638932 () SeekEntryResult!11832)

(declare-fun lt!638934 () (_ BitVec 32))

(declare-fun e!820208 () Bool)

(assert (=> b!1458135 (= e!820208 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638934 intermediateAfterIndex!19 lt!638931 lt!638936 mask!2687) lt!638932)))))

(declare-fun b!1458136 () Bool)

(declare-fun e!820206 () Bool)

(declare-fun e!820210 () Bool)

(assert (=> b!1458136 (= e!820206 e!820210)))

(declare-fun res!988307 () Bool)

(assert (=> b!1458136 (=> (not res!988307) (not e!820210))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!638930 () SeekEntryResult!11832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458136 (= res!988307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47580 a!2862) j!93) mask!2687) (select (arr!47580 a!2862) j!93) a!2862 mask!2687) lt!638930))))

(assert (=> b!1458136 (= lt!638930 (Intermediate!11832 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458137 () Bool)

(declare-fun res!988312 () Bool)

(assert (=> b!1458137 (=> (not res!988312) (not e!820209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458137 (= res!988312 (validKeyInArray!0 (select (arr!47580 a!2862) j!93)))))

(declare-fun res!988313 () Bool)

(assert (=> start!125136 (=> (not res!988313) (not e!820209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125136 (= res!988313 (validMask!0 mask!2687))))

(assert (=> start!125136 e!820209))

(assert (=> start!125136 true))

(declare-fun array_inv!36608 (array!98584) Bool)

(assert (=> start!125136 (array_inv!36608 a!2862)))

(declare-fun b!1458138 () Bool)

(declare-fun res!988319 () Bool)

(assert (=> b!1458138 (=> (not res!988319) (not e!820209))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458138 (= res!988319 (and (= (size!48130 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48130 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48130 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458139 () Bool)

(declare-fun res!988321 () Bool)

(assert (=> b!1458139 (=> (not res!988321) (not e!820209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98584 (_ BitVec 32)) Bool)

(assert (=> b!1458139 (= res!988321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458140 () Bool)

(declare-fun res!988318 () Bool)

(declare-fun e!820207 () Bool)

(assert (=> b!1458140 (=> (not res!988318) (not e!820207))))

(assert (=> b!1458140 (= res!988318 e!820203)))

(declare-fun c!134423 () Bool)

(assert (=> b!1458140 (= c!134423 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458141 () Bool)

(declare-fun res!988316 () Bool)

(assert (=> b!1458141 (=> (not res!988316) (not e!820209))))

(declare-datatypes ((List!34081 0))(
  ( (Nil!34078) (Cons!34077 (h!35427 (_ BitVec 64)) (t!48775 List!34081)) )
))
(declare-fun arrayNoDuplicates!0 (array!98584 (_ BitVec 32) List!34081) Bool)

(assert (=> b!1458141 (= res!988316 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34078))))

(declare-fun b!1458142 () Bool)

(declare-fun e!820204 () Bool)

(assert (=> b!1458142 (= e!820204 (and (or (= (select (arr!47580 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47580 a!2862) intermediateBeforeIndex!19) (select (arr!47580 a!2862) j!93))) (let ((bdg!53398 (select (store (arr!47580 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47580 a!2862) index!646) bdg!53398) (= (select (arr!47580 a!2862) index!646) (select (arr!47580 a!2862) j!93))) (= (select (arr!47580 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53398 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458143 () Bool)

(declare-fun res!988322 () Bool)

(assert (=> b!1458143 (=> (not res!988322) (not e!820204))))

(assert (=> b!1458143 (= res!988322 (= (seekEntryOrOpen!0 (select (arr!47580 a!2862) j!93) a!2862 mask!2687) (Found!11832 j!93)))))

(declare-fun b!1458144 () Bool)

(assert (=> b!1458144 (= e!820210 e!820207)))

(declare-fun res!988309 () Bool)

(assert (=> b!1458144 (=> (not res!988309) (not e!820207))))

(assert (=> b!1458144 (= res!988309 (= lt!638937 (Intermediate!11832 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458144 (= lt!638937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638931 mask!2687) lt!638931 lt!638936 mask!2687))))

(assert (=> b!1458144 (= lt!638931 (select (store (arr!47580 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458145 () Bool)

(declare-fun e!820205 () Bool)

(assert (=> b!1458145 (= e!820207 (not e!820205))))

(declare-fun res!988311 () Bool)

(assert (=> b!1458145 (=> res!988311 e!820205)))

(assert (=> b!1458145 (= res!988311 (or (and (= (select (arr!47580 a!2862) index!646) (select (store (arr!47580 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47580 a!2862) index!646) (select (arr!47580 a!2862) j!93))) (= (select (arr!47580 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458145 e!820204))

(declare-fun res!988314 () Bool)

(assert (=> b!1458145 (=> (not res!988314) (not e!820204))))

(assert (=> b!1458145 (= res!988314 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49160 0))(
  ( (Unit!49161) )
))
(declare-fun lt!638935 () Unit!49160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49160)

(assert (=> b!1458145 (= lt!638935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458146 () Bool)

(declare-fun e!820202 () Bool)

(assert (=> b!1458146 (= e!820202 true)))

(declare-fun lt!638933 () Bool)

(assert (=> b!1458146 (= lt!638933 e!820208)))

(declare-fun c!134424 () Bool)

(assert (=> b!1458146 (= c!134424 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458147 () Bool)

(assert (=> b!1458147 (= e!820208 (not (= lt!638937 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638934 lt!638931 lt!638936 mask!2687))))))

(declare-fun b!1458148 () Bool)

(assert (=> b!1458148 (= e!820209 e!820206)))

(declare-fun res!988323 () Bool)

(assert (=> b!1458148 (=> (not res!988323) (not e!820206))))

(assert (=> b!1458148 (= res!988323 (= (select (store (arr!47580 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458148 (= lt!638936 (array!98585 (store (arr!47580 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48130 a!2862)))))

(declare-fun b!1458149 () Bool)

(declare-fun res!988320 () Bool)

(assert (=> b!1458149 (=> res!988320 e!820202)))

(assert (=> b!1458149 (= res!988320 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638934 (select (arr!47580 a!2862) j!93) a!2862 mask!2687) lt!638930)))))

(declare-fun b!1458150 () Bool)

(assert (=> b!1458150 (= e!820205 e!820202)))

(declare-fun res!988308 () Bool)

(assert (=> b!1458150 (=> res!988308 e!820202)))

(assert (=> b!1458150 (= res!988308 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638934 #b00000000000000000000000000000000) (bvsge lt!638934 (size!48130 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458150 (= lt!638934 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458150 (= lt!638932 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638931 lt!638936 mask!2687))))

(assert (=> b!1458150 (= lt!638932 (seekEntryOrOpen!0 lt!638931 lt!638936 mask!2687))))

(declare-fun b!1458151 () Bool)

(declare-fun res!988315 () Bool)

(assert (=> b!1458151 (=> (not res!988315) (not e!820209))))

(assert (=> b!1458151 (= res!988315 (validKeyInArray!0 (select (arr!47580 a!2862) i!1006)))))

(declare-fun b!1458152 () Bool)

(declare-fun res!988310 () Bool)

(assert (=> b!1458152 (=> (not res!988310) (not e!820207))))

(assert (=> b!1458152 (= res!988310 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458153 () Bool)

(declare-fun res!988324 () Bool)

(assert (=> b!1458153 (=> (not res!988324) (not e!820210))))

(assert (=> b!1458153 (= res!988324 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47580 a!2862) j!93) a!2862 mask!2687) lt!638930))))

(assert (= (and start!125136 res!988313) b!1458138))

(assert (= (and b!1458138 res!988319) b!1458151))

(assert (= (and b!1458151 res!988315) b!1458137))

(assert (= (and b!1458137 res!988312) b!1458139))

(assert (= (and b!1458139 res!988321) b!1458141))

(assert (= (and b!1458141 res!988316) b!1458132))

(assert (= (and b!1458132 res!988317) b!1458148))

(assert (= (and b!1458148 res!988323) b!1458136))

(assert (= (and b!1458136 res!988307) b!1458153))

(assert (= (and b!1458153 res!988324) b!1458144))

(assert (= (and b!1458144 res!988309) b!1458140))

(assert (= (and b!1458140 c!134423) b!1458133))

(assert (= (and b!1458140 (not c!134423)) b!1458134))

(assert (= (and b!1458140 res!988318) b!1458152))

(assert (= (and b!1458152 res!988310) b!1458145))

(assert (= (and b!1458145 res!988314) b!1458143))

(assert (= (and b!1458143 res!988322) b!1458142))

(assert (= (and b!1458145 (not res!988311)) b!1458150))

(assert (= (and b!1458150 (not res!988308)) b!1458149))

(assert (= (and b!1458149 (not res!988320)) b!1458146))

(assert (= (and b!1458146 c!134424) b!1458147))

(assert (= (and b!1458146 (not c!134424)) b!1458135))

(declare-fun m!1346027 () Bool)

(assert (=> b!1458150 m!1346027))

(declare-fun m!1346029 () Bool)

(assert (=> b!1458150 m!1346029))

(declare-fun m!1346031 () Bool)

(assert (=> b!1458150 m!1346031))

(declare-fun m!1346033 () Bool)

(assert (=> b!1458141 m!1346033))

(declare-fun m!1346035 () Bool)

(assert (=> b!1458135 m!1346035))

(declare-fun m!1346037 () Bool)

(assert (=> start!125136 m!1346037))

(declare-fun m!1346039 () Bool)

(assert (=> start!125136 m!1346039))

(declare-fun m!1346041 () Bool)

(assert (=> b!1458149 m!1346041))

(assert (=> b!1458149 m!1346041))

(declare-fun m!1346043 () Bool)

(assert (=> b!1458149 m!1346043))

(assert (=> b!1458136 m!1346041))

(assert (=> b!1458136 m!1346041))

(declare-fun m!1346045 () Bool)

(assert (=> b!1458136 m!1346045))

(assert (=> b!1458136 m!1346045))

(assert (=> b!1458136 m!1346041))

(declare-fun m!1346047 () Bool)

(assert (=> b!1458136 m!1346047))

(declare-fun m!1346049 () Bool)

(assert (=> b!1458147 m!1346049))

(declare-fun m!1346051 () Bool)

(assert (=> b!1458144 m!1346051))

(assert (=> b!1458144 m!1346051))

(declare-fun m!1346053 () Bool)

(assert (=> b!1458144 m!1346053))

(declare-fun m!1346055 () Bool)

(assert (=> b!1458144 m!1346055))

(declare-fun m!1346057 () Bool)

(assert (=> b!1458144 m!1346057))

(assert (=> b!1458148 m!1346055))

(declare-fun m!1346059 () Bool)

(assert (=> b!1458148 m!1346059))

(declare-fun m!1346061 () Bool)

(assert (=> b!1458133 m!1346061))

(assert (=> b!1458134 m!1346029))

(assert (=> b!1458134 m!1346031))

(declare-fun m!1346063 () Bool)

(assert (=> b!1458145 m!1346063))

(assert (=> b!1458145 m!1346055))

(declare-fun m!1346065 () Bool)

(assert (=> b!1458145 m!1346065))

(declare-fun m!1346067 () Bool)

(assert (=> b!1458145 m!1346067))

(declare-fun m!1346069 () Bool)

(assert (=> b!1458145 m!1346069))

(assert (=> b!1458145 m!1346041))

(assert (=> b!1458143 m!1346041))

(assert (=> b!1458143 m!1346041))

(declare-fun m!1346071 () Bool)

(assert (=> b!1458143 m!1346071))

(declare-fun m!1346073 () Bool)

(assert (=> b!1458139 m!1346073))

(assert (=> b!1458153 m!1346041))

(assert (=> b!1458153 m!1346041))

(declare-fun m!1346075 () Bool)

(assert (=> b!1458153 m!1346075))

(declare-fun m!1346077 () Bool)

(assert (=> b!1458151 m!1346077))

(assert (=> b!1458151 m!1346077))

(declare-fun m!1346079 () Bool)

(assert (=> b!1458151 m!1346079))

(assert (=> b!1458142 m!1346055))

(declare-fun m!1346081 () Bool)

(assert (=> b!1458142 m!1346081))

(assert (=> b!1458142 m!1346065))

(assert (=> b!1458142 m!1346067))

(assert (=> b!1458142 m!1346041))

(assert (=> b!1458137 m!1346041))

(assert (=> b!1458137 m!1346041))

(declare-fun m!1346083 () Bool)

(assert (=> b!1458137 m!1346083))

(check-sat (not start!125136) (not b!1458153) (not b!1458141) (not b!1458150) (not b!1458151) (not b!1458137) (not b!1458133) (not b!1458143) (not b!1458134) (not b!1458149) (not b!1458144) (not b!1458135) (not b!1458139) (not b!1458136) (not b!1458147) (not b!1458145))
(check-sat)
