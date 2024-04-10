; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125072 () Bool)

(assert start!125072)

(declare-fun b!1456020 () Bool)

(declare-fun e!819248 () Bool)

(declare-fun e!819250 () Bool)

(assert (=> b!1456020 (= e!819248 e!819250)))

(declare-fun res!986587 () Bool)

(assert (=> b!1456020 (=> (not res!986587) (not e!819250))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98520 0))(
  ( (array!98521 (arr!47548 (Array (_ BitVec 32) (_ BitVec 64))) (size!48098 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98520)

(assert (=> b!1456020 (= res!986587 (= (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638168 () array!98520)

(assert (=> b!1456020 (= lt!638168 (array!98521 (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48098 a!2862)))))

(declare-fun b!1456021 () Bool)

(declare-fun res!986595 () Bool)

(assert (=> b!1456021 (=> (not res!986595) (not e!819248))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98520 (_ BitVec 32)) Bool)

(assert (=> b!1456021 (= res!986595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456022 () Bool)

(declare-fun res!986580 () Bool)

(declare-fun e!819246 () Bool)

(assert (=> b!1456022 (=> (not res!986580) (not e!819246))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456022 (= res!986580 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456023 () Bool)

(declare-fun res!986584 () Bool)

(assert (=> b!1456023 (=> (not res!986584) (not e!819248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456023 (= res!986584 (validKeyInArray!0 (select (arr!47548 a!2862) i!1006)))))

(declare-fun res!986588 () Bool)

(assert (=> start!125072 (=> (not res!986588) (not e!819248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125072 (= res!986588 (validMask!0 mask!2687))))

(assert (=> start!125072 e!819248))

(assert (=> start!125072 true))

(declare-fun array_inv!36576 (array!98520) Bool)

(assert (=> start!125072 (array_inv!36576 a!2862)))

(declare-fun b!1456024 () Bool)

(declare-fun res!986585 () Bool)

(assert (=> b!1456024 (=> (not res!986585) (not e!819248))))

(declare-datatypes ((List!34049 0))(
  ( (Nil!34046) (Cons!34045 (h!35395 (_ BitVec 64)) (t!48743 List!34049)) )
))
(declare-fun arrayNoDuplicates!0 (array!98520 (_ BitVec 32) List!34049) Bool)

(assert (=> b!1456024 (= res!986585 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34046))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1456025 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!819251 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1456025 (= e!819251 (and (or (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47548 a!2862) intermediateBeforeIndex!19) (select (arr!47548 a!2862) j!93))) (let ((bdg!53203 (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47548 a!2862) index!646) bdg!53203) (= (select (arr!47548 a!2862) index!646) (select (arr!47548 a!2862) j!93))) (= (select (arr!47548 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53203 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456026 () Bool)

(declare-fun e!819242 () Bool)

(assert (=> b!1456026 (= e!819250 e!819242)))

(declare-fun res!986593 () Bool)

(assert (=> b!1456026 (=> (not res!986593) (not e!819242))))

(declare-datatypes ((SeekEntryResult!11800 0))(
  ( (MissingZero!11800 (index!49592 (_ BitVec 32))) (Found!11800 (index!49593 (_ BitVec 32))) (Intermediate!11800 (undefined!12612 Bool) (index!49594 (_ BitVec 32)) (x!131217 (_ BitVec 32))) (Undefined!11800) (MissingVacant!11800 (index!49595 (_ BitVec 32))) )
))
(declare-fun lt!638165 () SeekEntryResult!11800)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98520 (_ BitVec 32)) SeekEntryResult!11800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456026 (= res!986593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47548 a!2862) j!93) mask!2687) (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638165))))

(assert (=> b!1456026 (= lt!638165 (Intermediate!11800 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456027 () Bool)

(declare-fun res!986579 () Bool)

(assert (=> b!1456027 (=> (not res!986579) (not e!819248))))

(assert (=> b!1456027 (= res!986579 (and (= (size!48098 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48098 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48098 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456028 () Bool)

(declare-fun e!819249 () Bool)

(assert (=> b!1456028 (= e!819249 true)))

(declare-fun lt!638164 () Bool)

(declare-fun e!819243 () Bool)

(assert (=> b!1456028 (= lt!638164 e!819243)))

(declare-fun c!134231 () Bool)

(assert (=> b!1456028 (= c!134231 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun e!819245 () Bool)

(declare-fun b!1456029 () Bool)

(declare-fun lt!638163 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98520 (_ BitVec 32)) SeekEntryResult!11800)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98520 (_ BitVec 32)) SeekEntryResult!11800)

(assert (=> b!1456029 (= e!819245 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638163 lt!638168 mask!2687) (seekEntryOrOpen!0 lt!638163 lt!638168 mask!2687)))))

(declare-fun b!1456030 () Bool)

(declare-fun res!986592 () Bool)

(assert (=> b!1456030 (=> (not res!986592) (not e!819242))))

(assert (=> b!1456030 (= res!986592 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638165))))

(declare-fun b!1456031 () Bool)

(declare-fun e!819247 () Bool)

(assert (=> b!1456031 (= e!819246 (not e!819247))))

(declare-fun res!986582 () Bool)

(assert (=> b!1456031 (=> res!986582 e!819247)))

(assert (=> b!1456031 (= res!986582 (or (and (= (select (arr!47548 a!2862) index!646) (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47548 a!2862) index!646) (select (arr!47548 a!2862) j!93))) (= (select (arr!47548 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456031 e!819251))

(declare-fun res!986581 () Bool)

(assert (=> b!1456031 (=> (not res!986581) (not e!819251))))

(assert (=> b!1456031 (= res!986581 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49096 0))(
  ( (Unit!49097) )
))
(declare-fun lt!638166 () Unit!49096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49096)

(assert (=> b!1456031 (= lt!638166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456032 () Bool)

(declare-fun res!986590 () Bool)

(assert (=> b!1456032 (=> (not res!986590) (not e!819248))))

(assert (=> b!1456032 (= res!986590 (validKeyInArray!0 (select (arr!47548 a!2862) j!93)))))

(declare-fun b!1456033 () Bool)

(declare-fun res!986594 () Bool)

(assert (=> b!1456033 (=> res!986594 e!819249)))

(declare-fun lt!638169 () (_ BitVec 32))

(assert (=> b!1456033 (= res!986594 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638169 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) lt!638165)))))

(declare-fun b!1456034 () Bool)

(declare-fun res!986589 () Bool)

(assert (=> b!1456034 (=> (not res!986589) (not e!819251))))

(assert (=> b!1456034 (= res!986589 (= (seekEntryOrOpen!0 (select (arr!47548 a!2862) j!93) a!2862 mask!2687) (Found!11800 j!93)))))

(declare-fun b!1456035 () Bool)

(assert (=> b!1456035 (= e!819242 e!819246)))

(declare-fun res!986596 () Bool)

(assert (=> b!1456035 (=> (not res!986596) (not e!819246))))

(declare-fun lt!638167 () SeekEntryResult!11800)

(assert (=> b!1456035 (= res!986596 (= lt!638167 (Intermediate!11800 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456035 (= lt!638167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638163 mask!2687) lt!638163 lt!638168 mask!2687))))

(assert (=> b!1456035 (= lt!638163 (select (store (arr!47548 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456036 () Bool)

(declare-fun res!986586 () Bool)

(assert (=> b!1456036 (=> (not res!986586) (not e!819248))))

(assert (=> b!1456036 (= res!986586 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48098 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48098 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48098 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456037 () Bool)

(assert (=> b!1456037 (= e!819243 (not (= lt!638167 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638169 lt!638163 lt!638168 mask!2687))))))

(declare-fun b!1456038 () Bool)

(declare-fun lt!638162 () SeekEntryResult!11800)

(assert (=> b!1456038 (= e!819243 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638169 intermediateAfterIndex!19 lt!638163 lt!638168 mask!2687) lt!638162)))))

(declare-fun b!1456039 () Bool)

(declare-fun res!986591 () Bool)

(assert (=> b!1456039 (=> (not res!986591) (not e!819246))))

(assert (=> b!1456039 (= res!986591 e!819245)))

(declare-fun c!134232 () Bool)

(assert (=> b!1456039 (= c!134232 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456040 () Bool)

(assert (=> b!1456040 (= e!819247 e!819249)))

(declare-fun res!986583 () Bool)

(assert (=> b!1456040 (=> res!986583 e!819249)))

(assert (=> b!1456040 (= res!986583 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638169 #b00000000000000000000000000000000) (bvsge lt!638169 (size!48098 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456040 (= lt!638169 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456040 (= lt!638162 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638163 lt!638168 mask!2687))))

(assert (=> b!1456040 (= lt!638162 (seekEntryOrOpen!0 lt!638163 lt!638168 mask!2687))))

(declare-fun b!1456041 () Bool)

(assert (=> b!1456041 (= e!819245 (= lt!638167 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638163 lt!638168 mask!2687)))))

(assert (= (and start!125072 res!986588) b!1456027))

(assert (= (and b!1456027 res!986579) b!1456023))

(assert (= (and b!1456023 res!986584) b!1456032))

(assert (= (and b!1456032 res!986590) b!1456021))

(assert (= (and b!1456021 res!986595) b!1456024))

(assert (= (and b!1456024 res!986585) b!1456036))

(assert (= (and b!1456036 res!986586) b!1456020))

(assert (= (and b!1456020 res!986587) b!1456026))

(assert (= (and b!1456026 res!986593) b!1456030))

(assert (= (and b!1456030 res!986592) b!1456035))

(assert (= (and b!1456035 res!986596) b!1456039))

(assert (= (and b!1456039 c!134232) b!1456041))

(assert (= (and b!1456039 (not c!134232)) b!1456029))

(assert (= (and b!1456039 res!986591) b!1456022))

(assert (= (and b!1456022 res!986580) b!1456031))

(assert (= (and b!1456031 res!986581) b!1456034))

(assert (= (and b!1456034 res!986589) b!1456025))

(assert (= (and b!1456031 (not res!986582)) b!1456040))

(assert (= (and b!1456040 (not res!986583)) b!1456033))

(assert (= (and b!1456033 (not res!986594)) b!1456028))

(assert (= (and b!1456028 c!134231) b!1456037))

(assert (= (and b!1456028 (not c!134231)) b!1456038))

(declare-fun m!1344171 () Bool)

(assert (=> b!1456033 m!1344171))

(assert (=> b!1456033 m!1344171))

(declare-fun m!1344173 () Bool)

(assert (=> b!1456033 m!1344173))

(assert (=> b!1456032 m!1344171))

(assert (=> b!1456032 m!1344171))

(declare-fun m!1344175 () Bool)

(assert (=> b!1456032 m!1344175))

(declare-fun m!1344177 () Bool)

(assert (=> b!1456021 m!1344177))

(declare-fun m!1344179 () Bool)

(assert (=> start!125072 m!1344179))

(declare-fun m!1344181 () Bool)

(assert (=> start!125072 m!1344181))

(assert (=> b!1456030 m!1344171))

(assert (=> b!1456030 m!1344171))

(declare-fun m!1344183 () Bool)

(assert (=> b!1456030 m!1344183))

(declare-fun m!1344185 () Bool)

(assert (=> b!1456020 m!1344185))

(declare-fun m!1344187 () Bool)

(assert (=> b!1456020 m!1344187))

(declare-fun m!1344189 () Bool)

(assert (=> b!1456031 m!1344189))

(assert (=> b!1456031 m!1344185))

(declare-fun m!1344191 () Bool)

(assert (=> b!1456031 m!1344191))

(declare-fun m!1344193 () Bool)

(assert (=> b!1456031 m!1344193))

(declare-fun m!1344195 () Bool)

(assert (=> b!1456031 m!1344195))

(assert (=> b!1456031 m!1344171))

(declare-fun m!1344197 () Bool)

(assert (=> b!1456038 m!1344197))

(declare-fun m!1344199 () Bool)

(assert (=> b!1456023 m!1344199))

(assert (=> b!1456023 m!1344199))

(declare-fun m!1344201 () Bool)

(assert (=> b!1456023 m!1344201))

(declare-fun m!1344203 () Bool)

(assert (=> b!1456029 m!1344203))

(declare-fun m!1344205 () Bool)

(assert (=> b!1456029 m!1344205))

(declare-fun m!1344207 () Bool)

(assert (=> b!1456024 m!1344207))

(declare-fun m!1344209 () Bool)

(assert (=> b!1456035 m!1344209))

(assert (=> b!1456035 m!1344209))

(declare-fun m!1344211 () Bool)

(assert (=> b!1456035 m!1344211))

(assert (=> b!1456035 m!1344185))

(declare-fun m!1344213 () Bool)

(assert (=> b!1456035 m!1344213))

(declare-fun m!1344215 () Bool)

(assert (=> b!1456040 m!1344215))

(assert (=> b!1456040 m!1344203))

(assert (=> b!1456040 m!1344205))

(declare-fun m!1344217 () Bool)

(assert (=> b!1456041 m!1344217))

(declare-fun m!1344219 () Bool)

(assert (=> b!1456037 m!1344219))

(assert (=> b!1456026 m!1344171))

(assert (=> b!1456026 m!1344171))

(declare-fun m!1344221 () Bool)

(assert (=> b!1456026 m!1344221))

(assert (=> b!1456026 m!1344221))

(assert (=> b!1456026 m!1344171))

(declare-fun m!1344223 () Bool)

(assert (=> b!1456026 m!1344223))

(assert (=> b!1456034 m!1344171))

(assert (=> b!1456034 m!1344171))

(declare-fun m!1344225 () Bool)

(assert (=> b!1456034 m!1344225))

(assert (=> b!1456025 m!1344185))

(declare-fun m!1344227 () Bool)

(assert (=> b!1456025 m!1344227))

(assert (=> b!1456025 m!1344191))

(assert (=> b!1456025 m!1344193))

(assert (=> b!1456025 m!1344171))

(push 1)

(assert (not b!1456034))

(assert (not b!1456035))

(assert (not b!1456031))

(assert (not b!1456032))

(assert (not b!1456026))

(assert (not b!1456021))

(assert (not start!125072))

(assert (not b!1456040))

(assert (not b!1456037))

(assert (not b!1456023))

(assert (not b!1456041))

(assert (not b!1456033))

(assert (not b!1456029))

(assert (not b!1456030))

(assert (not b!1456024))

(assert (not b!1456038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

