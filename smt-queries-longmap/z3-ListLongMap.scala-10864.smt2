; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127310 () Bool)

(assert start!127310)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99766 0))(
  ( (array!99767 (arr!48148 (Array (_ BitVec 32) (_ BitVec 64))) (size!48700 (_ BitVec 32))) )
))
(declare-fun lt!651958 () array!99766)

(declare-fun e!838132 () Bool)

(declare-fun b!1496553 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!651960 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12413 0))(
  ( (MissingZero!12413 (index!52044 (_ BitVec 32))) (Found!12413 (index!52045 (_ BitVec 32))) (Intermediate!12413 (undefined!13225 Bool) (index!52046 (_ BitVec 32)) (x!133666 (_ BitVec 32))) (Undefined!12413) (MissingVacant!12413 (index!52047 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99766 (_ BitVec 32)) SeekEntryResult!12413)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99766 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1496553 (= e!838132 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651960 lt!651958 mask!2687) (seekEntryOrOpen!0 lt!651960 lt!651958 mask!2687)))))

(declare-fun b!1496554 () Bool)

(declare-fun res!1018018 () Bool)

(declare-fun e!838138 () Bool)

(assert (=> b!1496554 (=> (not res!1018018) (not e!838138))))

(declare-fun a!2862 () array!99766)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496554 (= res!1018018 (validKeyInArray!0 (select (arr!48148 a!2862) i!1006)))))

(declare-fun b!1496556 () Bool)

(declare-fun res!1018015 () Bool)

(declare-fun e!838137 () Bool)

(assert (=> b!1496556 (=> (not res!1018015) (not e!838137))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496556 (= res!1018015 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496557 () Bool)

(declare-fun res!1018008 () Bool)

(declare-fun e!838135 () Bool)

(assert (=> b!1496557 (=> res!1018008 e!838135)))

(declare-fun e!838136 () Bool)

(assert (=> b!1496557 (= res!1018008 e!838136)))

(declare-fun c!138810 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496557 (= c!138810 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496558 () Bool)

(declare-fun e!838134 () Bool)

(assert (=> b!1496558 (= e!838137 (not e!838134))))

(declare-fun res!1018017 () Bool)

(assert (=> b!1496558 (=> res!1018017 e!838134)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496558 (= res!1018017 (or (and (= (select (arr!48148 a!2862) index!646) (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48148 a!2862) index!646) (select (arr!48148 a!2862) j!93))) (= (select (arr!48148 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!651956 () SeekEntryResult!12413)

(assert (=> b!1496558 (and (= lt!651956 (Found!12413 j!93)) (or (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48148 a!2862) intermediateBeforeIndex!19) (select (arr!48148 a!2862) j!93))))))

(assert (=> b!1496558 (= lt!651956 (seekEntryOrOpen!0 (select (arr!48148 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99766 (_ BitVec 32)) Bool)

(assert (=> b!1496558 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50007 0))(
  ( (Unit!50008) )
))
(declare-fun lt!651959 () Unit!50007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50007)

(assert (=> b!1496558 (= lt!651959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496559 () Bool)

(declare-fun res!1018023 () Bool)

(assert (=> b!1496559 (=> (not res!1018023) (not e!838138))))

(assert (=> b!1496559 (= res!1018023 (validKeyInArray!0 (select (arr!48148 a!2862) j!93)))))

(declare-fun b!1496560 () Bool)

(declare-fun res!1018022 () Bool)

(assert (=> b!1496560 (=> (not res!1018022) (not e!838137))))

(assert (=> b!1496560 (= res!1018022 e!838132)))

(declare-fun c!138811 () Bool)

(assert (=> b!1496560 (= c!138811 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!651962 () SeekEntryResult!12413)

(declare-fun b!1496561 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99766 (_ BitVec 32)) SeekEntryResult!12413)

(assert (=> b!1496561 (= e!838132 (= lt!651962 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651960 lt!651958 mask!2687)))))

(declare-fun b!1496562 () Bool)

(declare-fun res!1018007 () Bool)

(assert (=> b!1496562 (=> res!1018007 e!838135)))

(assert (=> b!1496562 (= res!1018007 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496563 () Bool)

(declare-fun e!838133 () Bool)

(assert (=> b!1496563 (= e!838138 e!838133)))

(declare-fun res!1018014 () Bool)

(assert (=> b!1496563 (=> (not res!1018014) (not e!838133))))

(assert (=> b!1496563 (= res!1018014 (= (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496563 (= lt!651958 (array!99767 (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48700 a!2862)))))

(declare-fun b!1496564 () Bool)

(declare-fun res!1018016 () Bool)

(assert (=> b!1496564 (=> res!1018016 e!838135)))

(declare-fun lt!651955 () SeekEntryResult!12413)

(declare-fun lt!651961 () (_ BitVec 32))

(assert (=> b!1496564 (= res!1018016 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651961 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!651955)))))

(declare-fun b!1496565 () Bool)

(declare-fun res!1018012 () Bool)

(assert (=> b!1496565 (=> (not res!1018012) (not e!838138))))

(declare-datatypes ((List!34727 0))(
  ( (Nil!34724) (Cons!34723 (h!36121 (_ BitVec 64)) (t!49413 List!34727)) )
))
(declare-fun arrayNoDuplicates!0 (array!99766 (_ BitVec 32) List!34727) Bool)

(assert (=> b!1496565 (= res!1018012 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34724))))

(declare-fun b!1496566 () Bool)

(declare-fun e!838131 () Bool)

(assert (=> b!1496566 (= e!838133 e!838131)))

(declare-fun res!1018009 () Bool)

(assert (=> b!1496566 (=> (not res!1018009) (not e!838131))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496566 (= res!1018009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48148 a!2862) j!93) mask!2687) (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!651955))))

(assert (=> b!1496566 (= lt!651955 (Intermediate!12413 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496567 () Bool)

(declare-fun res!1018013 () Bool)

(assert (=> b!1496567 (=> (not res!1018013) (not e!838138))))

(assert (=> b!1496567 (= res!1018013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496568 () Bool)

(assert (=> b!1496568 (= e!838136 (not (= lt!651962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651961 lt!651960 lt!651958 mask!2687))))))

(declare-fun b!1496569 () Bool)

(assert (=> b!1496569 (= e!838134 e!838135)))

(declare-fun res!1018010 () Bool)

(assert (=> b!1496569 (=> res!1018010 e!838135)))

(assert (=> b!1496569 (= res!1018010 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651961 #b00000000000000000000000000000000) (bvsge lt!651961 (size!48700 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496569 (= lt!651961 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496570 () Bool)

(declare-fun res!1018020 () Bool)

(assert (=> b!1496570 (=> (not res!1018020) (not e!838131))))

(assert (=> b!1496570 (= res!1018020 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48148 a!2862) j!93) a!2862 mask!2687) lt!651955))))

(declare-fun b!1496571 () Bool)

(declare-fun res!1018021 () Bool)

(assert (=> b!1496571 (=> (not res!1018021) (not e!838138))))

(assert (=> b!1496571 (= res!1018021 (and (= (size!48700 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48700 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48700 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496572 () Bool)

(assert (=> b!1496572 (= e!838135 true)))

(assert (=> b!1496572 (= lt!651956 (seekEntryOrOpen!0 lt!651960 lt!651958 mask!2687))))

(declare-fun lt!651957 () Unit!50007)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50007)

(assert (=> b!1496572 (= lt!651957 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!651961 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496573 () Bool)

(assert (=> b!1496573 (= e!838131 e!838137)))

(declare-fun res!1018024 () Bool)

(assert (=> b!1496573 (=> (not res!1018024) (not e!838137))))

(assert (=> b!1496573 (= res!1018024 (= lt!651962 (Intermediate!12413 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1496573 (= lt!651962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651960 mask!2687) lt!651960 lt!651958 mask!2687))))

(assert (=> b!1496573 (= lt!651960 (select (store (arr!48148 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496574 () Bool)

(assert (=> b!1496574 (= e!838136 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651961 intermediateAfterIndex!19 lt!651960 lt!651958 mask!2687) (seekEntryOrOpen!0 lt!651960 lt!651958 mask!2687))))))

(declare-fun res!1018011 () Bool)

(assert (=> start!127310 (=> (not res!1018011) (not e!838138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127310 (= res!1018011 (validMask!0 mask!2687))))

(assert (=> start!127310 e!838138))

(assert (=> start!127310 true))

(declare-fun array_inv!37381 (array!99766) Bool)

(assert (=> start!127310 (array_inv!37381 a!2862)))

(declare-fun b!1496555 () Bool)

(declare-fun res!1018019 () Bool)

(assert (=> b!1496555 (=> (not res!1018019) (not e!838138))))

(assert (=> b!1496555 (= res!1018019 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48700 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48700 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48700 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127310 res!1018011) b!1496571))

(assert (= (and b!1496571 res!1018021) b!1496554))

(assert (= (and b!1496554 res!1018018) b!1496559))

(assert (= (and b!1496559 res!1018023) b!1496567))

(assert (= (and b!1496567 res!1018013) b!1496565))

(assert (= (and b!1496565 res!1018012) b!1496555))

(assert (= (and b!1496555 res!1018019) b!1496563))

(assert (= (and b!1496563 res!1018014) b!1496566))

(assert (= (and b!1496566 res!1018009) b!1496570))

(assert (= (and b!1496570 res!1018020) b!1496573))

(assert (= (and b!1496573 res!1018024) b!1496560))

(assert (= (and b!1496560 c!138811) b!1496561))

(assert (= (and b!1496560 (not c!138811)) b!1496553))

(assert (= (and b!1496560 res!1018022) b!1496556))

(assert (= (and b!1496556 res!1018015) b!1496558))

(assert (= (and b!1496558 (not res!1018017)) b!1496569))

(assert (= (and b!1496569 (not res!1018010)) b!1496564))

(assert (= (and b!1496564 (not res!1018016)) b!1496557))

(assert (= (and b!1496557 c!138810) b!1496568))

(assert (= (and b!1496557 (not c!138810)) b!1496574))

(assert (= (and b!1496557 (not res!1018008)) b!1496562))

(assert (= (and b!1496562 (not res!1018007)) b!1496572))

(declare-fun m!1379145 () Bool)

(assert (=> start!127310 m!1379145))

(declare-fun m!1379147 () Bool)

(assert (=> start!127310 m!1379147))

(declare-fun m!1379149 () Bool)

(assert (=> b!1496561 m!1379149))

(declare-fun m!1379151 () Bool)

(assert (=> b!1496567 m!1379151))

(declare-fun m!1379153 () Bool)

(assert (=> b!1496570 m!1379153))

(assert (=> b!1496570 m!1379153))

(declare-fun m!1379155 () Bool)

(assert (=> b!1496570 m!1379155))

(declare-fun m!1379157 () Bool)

(assert (=> b!1496572 m!1379157))

(declare-fun m!1379159 () Bool)

(assert (=> b!1496572 m!1379159))

(declare-fun m!1379161 () Bool)

(assert (=> b!1496554 m!1379161))

(assert (=> b!1496554 m!1379161))

(declare-fun m!1379163 () Bool)

(assert (=> b!1496554 m!1379163))

(assert (=> b!1496566 m!1379153))

(assert (=> b!1496566 m!1379153))

(declare-fun m!1379165 () Bool)

(assert (=> b!1496566 m!1379165))

(assert (=> b!1496566 m!1379165))

(assert (=> b!1496566 m!1379153))

(declare-fun m!1379167 () Bool)

(assert (=> b!1496566 m!1379167))

(declare-fun m!1379169 () Bool)

(assert (=> b!1496558 m!1379169))

(declare-fun m!1379171 () Bool)

(assert (=> b!1496558 m!1379171))

(declare-fun m!1379173 () Bool)

(assert (=> b!1496558 m!1379173))

(declare-fun m!1379175 () Bool)

(assert (=> b!1496558 m!1379175))

(declare-fun m!1379177 () Bool)

(assert (=> b!1496558 m!1379177))

(assert (=> b!1496558 m!1379153))

(declare-fun m!1379179 () Bool)

(assert (=> b!1496558 m!1379179))

(declare-fun m!1379181 () Bool)

(assert (=> b!1496558 m!1379181))

(assert (=> b!1496558 m!1379153))

(declare-fun m!1379183 () Bool)

(assert (=> b!1496565 m!1379183))

(declare-fun m!1379185 () Bool)

(assert (=> b!1496568 m!1379185))

(declare-fun m!1379187 () Bool)

(assert (=> b!1496569 m!1379187))

(declare-fun m!1379189 () Bool)

(assert (=> b!1496573 m!1379189))

(assert (=> b!1496573 m!1379189))

(declare-fun m!1379191 () Bool)

(assert (=> b!1496573 m!1379191))

(assert (=> b!1496573 m!1379171))

(declare-fun m!1379193 () Bool)

(assert (=> b!1496573 m!1379193))

(assert (=> b!1496564 m!1379153))

(assert (=> b!1496564 m!1379153))

(declare-fun m!1379195 () Bool)

(assert (=> b!1496564 m!1379195))

(declare-fun m!1379197 () Bool)

(assert (=> b!1496553 m!1379197))

(assert (=> b!1496553 m!1379157))

(declare-fun m!1379199 () Bool)

(assert (=> b!1496574 m!1379199))

(assert (=> b!1496574 m!1379157))

(assert (=> b!1496563 m!1379171))

(declare-fun m!1379201 () Bool)

(assert (=> b!1496563 m!1379201))

(assert (=> b!1496559 m!1379153))

(assert (=> b!1496559 m!1379153))

(declare-fun m!1379203 () Bool)

(assert (=> b!1496559 m!1379203))

(check-sat (not b!1496569) (not b!1496559) (not start!127310) (not b!1496561) (not b!1496568) (not b!1496565) (not b!1496572) (not b!1496570) (not b!1496554) (not b!1496573) (not b!1496553) (not b!1496567) (not b!1496566) (not b!1496558) (not b!1496574) (not b!1496564))
(check-sat)
