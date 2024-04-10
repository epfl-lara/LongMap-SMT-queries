; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127362 () Bool)

(assert start!127362)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!652310 () (_ BitVec 64))

(declare-fun e!838411 () Bool)

(declare-datatypes ((array!99824 0))(
  ( (array!99825 (arr!48176 (Array (_ BitVec 32) (_ BitVec 64))) (size!48726 (_ BitVec 32))) )
))
(declare-fun lt!652311 () array!99824)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1497065 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12416 0))(
  ( (MissingZero!12416 (index!52056 (_ BitVec 32))) (Found!12416 (index!52057 (_ BitVec 32))) (Intermediate!12416 (undefined!13228 Bool) (index!52058 (_ BitVec 32)) (x!133682 (_ BitVec 32))) (Undefined!12416) (MissingVacant!12416 (index!52059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99824 (_ BitVec 32)) SeekEntryResult!12416)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99824 (_ BitVec 32)) SeekEntryResult!12416)

(assert (=> b!1497065 (= e!838411 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652310 lt!652311 mask!2687) (seekEntryOrOpen!0 lt!652310 lt!652311 mask!2687)))))

(declare-fun b!1497066 () Bool)

(declare-fun res!1018307 () Bool)

(declare-fun e!838413 () Bool)

(assert (=> b!1497066 (=> (not res!1018307) (not e!838413))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99824)

(assert (=> b!1497066 (= res!1018307 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48726 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48726 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48726 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497067 () Bool)

(declare-fun e!838412 () Bool)

(assert (=> b!1497067 (= e!838413 e!838412)))

(declare-fun res!1018299 () Bool)

(assert (=> b!1497067 (=> (not res!1018299) (not e!838412))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497067 (= res!1018299 (= (select (store (arr!48176 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497067 (= lt!652311 (array!99825 (store (arr!48176 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48726 a!2862)))))

(declare-fun b!1497068 () Bool)

(declare-fun e!838414 () Bool)

(declare-fun e!838409 () Bool)

(assert (=> b!1497068 (= e!838414 e!838409)))

(declare-fun res!1018309 () Bool)

(assert (=> b!1497068 (=> (not res!1018309) (not e!838409))))

(declare-fun lt!652305 () SeekEntryResult!12416)

(assert (=> b!1497068 (= res!1018309 (= lt!652305 (Intermediate!12416 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99824 (_ BitVec 32)) SeekEntryResult!12416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497068 (= lt!652305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652310 mask!2687) lt!652310 lt!652311 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1497068 (= lt!652310 (select (store (arr!48176 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497069 () Bool)

(assert (=> b!1497069 (= e!838412 e!838414)))

(declare-fun res!1018304 () Bool)

(assert (=> b!1497069 (=> (not res!1018304) (not e!838414))))

(declare-fun lt!652306 () SeekEntryResult!12416)

(assert (=> b!1497069 (= res!1018304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48176 a!2862) j!93) mask!2687) (select (arr!48176 a!2862) j!93) a!2862 mask!2687) lt!652306))))

(assert (=> b!1497069 (= lt!652306 (Intermediate!12416 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497070 () Bool)

(declare-fun res!1018297 () Bool)

(assert (=> b!1497070 (=> (not res!1018297) (not e!838413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497070 (= res!1018297 (validKeyInArray!0 (select (arr!48176 a!2862) j!93)))))

(declare-fun lt!652312 () (_ BitVec 32))

(declare-fun b!1497071 () Bool)

(declare-fun e!838417 () Bool)

(assert (=> b!1497071 (= e!838417 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652312 intermediateAfterIndex!19 lt!652310 lt!652311 mask!2687) (seekEntryOrOpen!0 lt!652310 lt!652311 mask!2687))))))

(declare-fun b!1497072 () Bool)

(declare-fun res!1018298 () Bool)

(assert (=> b!1497072 (=> (not res!1018298) (not e!838413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99824 (_ BitVec 32)) Bool)

(assert (=> b!1497072 (= res!1018298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497073 () Bool)

(declare-fun res!1018305 () Bool)

(assert (=> b!1497073 (=> (not res!1018305) (not e!838413))))

(assert (=> b!1497073 (= res!1018305 (validKeyInArray!0 (select (arr!48176 a!2862) i!1006)))))

(declare-fun res!1018311 () Bool)

(assert (=> start!127362 (=> (not res!1018311) (not e!838413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127362 (= res!1018311 (validMask!0 mask!2687))))

(assert (=> start!127362 e!838413))

(assert (=> start!127362 true))

(declare-fun array_inv!37204 (array!99824) Bool)

(assert (=> start!127362 (array_inv!37204 a!2862)))

(declare-fun b!1497074 () Bool)

(declare-fun res!1018296 () Bool)

(assert (=> b!1497074 (=> (not res!1018296) (not e!838413))))

(assert (=> b!1497074 (= res!1018296 (and (= (size!48726 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48726 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48726 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497075 () Bool)

(declare-fun res!1018306 () Bool)

(declare-fun e!838416 () Bool)

(assert (=> b!1497075 (=> res!1018306 e!838416)))

(assert (=> b!1497075 (= res!1018306 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652312 (select (arr!48176 a!2862) j!93) a!2862 mask!2687) lt!652306)))))

(declare-fun b!1497076 () Bool)

(assert (=> b!1497076 (= e!838416 true)))

(declare-fun lt!652307 () SeekEntryResult!12416)

(assert (=> b!1497076 (= lt!652307 (seekEntryOrOpen!0 lt!652310 lt!652311 mask!2687))))

(declare-datatypes ((Unit!50172 0))(
  ( (Unit!50173) )
))
(declare-fun lt!652309 () Unit!50172)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50172)

(assert (=> b!1497076 (= lt!652309 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652312 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497077 () Bool)

(assert (=> b!1497077 (= e!838411 (= lt!652305 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652310 lt!652311 mask!2687)))))

(declare-fun b!1497078 () Bool)

(declare-fun res!1018310 () Bool)

(assert (=> b!1497078 (=> res!1018310 e!838416)))

(assert (=> b!1497078 (= res!1018310 e!838417)))

(declare-fun c!138920 () Bool)

(assert (=> b!1497078 (= c!138920 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497079 () Bool)

(assert (=> b!1497079 (= e!838417 (not (= lt!652305 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652312 lt!652310 lt!652311 mask!2687))))))

(declare-fun b!1497080 () Bool)

(declare-fun res!1018300 () Bool)

(assert (=> b!1497080 (=> (not res!1018300) (not e!838409))))

(assert (=> b!1497080 (= res!1018300 e!838411)))

(declare-fun c!138919 () Bool)

(assert (=> b!1497080 (= c!138919 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497081 () Bool)

(declare-fun res!1018308 () Bool)

(assert (=> b!1497081 (=> (not res!1018308) (not e!838414))))

(assert (=> b!1497081 (= res!1018308 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48176 a!2862) j!93) a!2862 mask!2687) lt!652306))))

(declare-fun b!1497082 () Bool)

(declare-fun e!838410 () Bool)

(assert (=> b!1497082 (= e!838409 (not e!838410))))

(declare-fun res!1018295 () Bool)

(assert (=> b!1497082 (=> res!1018295 e!838410)))

(assert (=> b!1497082 (= res!1018295 (or (and (= (select (arr!48176 a!2862) index!646) (select (store (arr!48176 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48176 a!2862) index!646) (select (arr!48176 a!2862) j!93))) (= (select (arr!48176 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497082 (and (= lt!652307 (Found!12416 j!93)) (or (= (select (arr!48176 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48176 a!2862) intermediateBeforeIndex!19) (select (arr!48176 a!2862) j!93))))))

(assert (=> b!1497082 (= lt!652307 (seekEntryOrOpen!0 (select (arr!48176 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497082 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652308 () Unit!50172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50172)

(assert (=> b!1497082 (= lt!652308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497083 () Bool)

(declare-fun res!1018312 () Bool)

(assert (=> b!1497083 (=> (not res!1018312) (not e!838413))))

(declare-datatypes ((List!34677 0))(
  ( (Nil!34674) (Cons!34673 (h!36070 (_ BitVec 64)) (t!49371 List!34677)) )
))
(declare-fun arrayNoDuplicates!0 (array!99824 (_ BitVec 32) List!34677) Bool)

(assert (=> b!1497083 (= res!1018312 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34674))))

(declare-fun b!1497084 () Bool)

(assert (=> b!1497084 (= e!838410 e!838416)))

(declare-fun res!1018302 () Bool)

(assert (=> b!1497084 (=> res!1018302 e!838416)))

(assert (=> b!1497084 (= res!1018302 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652312 #b00000000000000000000000000000000) (bvsge lt!652312 (size!48726 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497084 (= lt!652312 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497085 () Bool)

(declare-fun res!1018301 () Bool)

(assert (=> b!1497085 (=> res!1018301 e!838416)))

(assert (=> b!1497085 (= res!1018301 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497086 () Bool)

(declare-fun res!1018303 () Bool)

(assert (=> b!1497086 (=> (not res!1018303) (not e!838409))))

(assert (=> b!1497086 (= res!1018303 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127362 res!1018311) b!1497074))

(assert (= (and b!1497074 res!1018296) b!1497073))

(assert (= (and b!1497073 res!1018305) b!1497070))

(assert (= (and b!1497070 res!1018297) b!1497072))

(assert (= (and b!1497072 res!1018298) b!1497083))

(assert (= (and b!1497083 res!1018312) b!1497066))

(assert (= (and b!1497066 res!1018307) b!1497067))

(assert (= (and b!1497067 res!1018299) b!1497069))

(assert (= (and b!1497069 res!1018304) b!1497081))

(assert (= (and b!1497081 res!1018308) b!1497068))

(assert (= (and b!1497068 res!1018309) b!1497080))

(assert (= (and b!1497080 c!138919) b!1497077))

(assert (= (and b!1497080 (not c!138919)) b!1497065))

(assert (= (and b!1497080 res!1018300) b!1497086))

(assert (= (and b!1497086 res!1018303) b!1497082))

(assert (= (and b!1497082 (not res!1018295)) b!1497084))

(assert (= (and b!1497084 (not res!1018302)) b!1497075))

(assert (= (and b!1497075 (not res!1018306)) b!1497078))

(assert (= (and b!1497078 c!138920) b!1497079))

(assert (= (and b!1497078 (not c!138920)) b!1497071))

(assert (= (and b!1497078 (not res!1018310)) b!1497085))

(assert (= (and b!1497085 (not res!1018301)) b!1497076))

(declare-fun m!1380175 () Bool)

(assert (=> b!1497067 m!1380175))

(declare-fun m!1380177 () Bool)

(assert (=> b!1497067 m!1380177))

(declare-fun m!1380179 () Bool)

(assert (=> b!1497081 m!1380179))

(assert (=> b!1497081 m!1380179))

(declare-fun m!1380181 () Bool)

(assert (=> b!1497081 m!1380181))

(declare-fun m!1380183 () Bool)

(assert (=> b!1497072 m!1380183))

(assert (=> b!1497069 m!1380179))

(assert (=> b!1497069 m!1380179))

(declare-fun m!1380185 () Bool)

(assert (=> b!1497069 m!1380185))

(assert (=> b!1497069 m!1380185))

(assert (=> b!1497069 m!1380179))

(declare-fun m!1380187 () Bool)

(assert (=> b!1497069 m!1380187))

(declare-fun m!1380189 () Bool)

(assert (=> b!1497083 m!1380189))

(declare-fun m!1380191 () Bool)

(assert (=> b!1497084 m!1380191))

(assert (=> b!1497070 m!1380179))

(assert (=> b!1497070 m!1380179))

(declare-fun m!1380193 () Bool)

(assert (=> b!1497070 m!1380193))

(declare-fun m!1380195 () Bool)

(assert (=> b!1497065 m!1380195))

(declare-fun m!1380197 () Bool)

(assert (=> b!1497065 m!1380197))

(declare-fun m!1380199 () Bool)

(assert (=> b!1497079 m!1380199))

(declare-fun m!1380201 () Bool)

(assert (=> b!1497073 m!1380201))

(assert (=> b!1497073 m!1380201))

(declare-fun m!1380203 () Bool)

(assert (=> b!1497073 m!1380203))

(assert (=> b!1497075 m!1380179))

(assert (=> b!1497075 m!1380179))

(declare-fun m!1380205 () Bool)

(assert (=> b!1497075 m!1380205))

(declare-fun m!1380207 () Bool)

(assert (=> start!127362 m!1380207))

(declare-fun m!1380209 () Bool)

(assert (=> start!127362 m!1380209))

(declare-fun m!1380211 () Bool)

(assert (=> b!1497082 m!1380211))

(assert (=> b!1497082 m!1380175))

(declare-fun m!1380213 () Bool)

(assert (=> b!1497082 m!1380213))

(declare-fun m!1380215 () Bool)

(assert (=> b!1497082 m!1380215))

(declare-fun m!1380217 () Bool)

(assert (=> b!1497082 m!1380217))

(assert (=> b!1497082 m!1380179))

(declare-fun m!1380219 () Bool)

(assert (=> b!1497082 m!1380219))

(declare-fun m!1380221 () Bool)

(assert (=> b!1497082 m!1380221))

(assert (=> b!1497082 m!1380179))

(declare-fun m!1380223 () Bool)

(assert (=> b!1497077 m!1380223))

(declare-fun m!1380225 () Bool)

(assert (=> b!1497068 m!1380225))

(assert (=> b!1497068 m!1380225))

(declare-fun m!1380227 () Bool)

(assert (=> b!1497068 m!1380227))

(assert (=> b!1497068 m!1380175))

(declare-fun m!1380229 () Bool)

(assert (=> b!1497068 m!1380229))

(assert (=> b!1497076 m!1380197))

(declare-fun m!1380231 () Bool)

(assert (=> b!1497076 m!1380231))

(declare-fun m!1380233 () Bool)

(assert (=> b!1497071 m!1380233))

(assert (=> b!1497071 m!1380197))

(push 1)

