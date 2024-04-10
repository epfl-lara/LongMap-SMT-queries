; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126190 () Bool)

(assert start!126190)

(declare-fun b!1478110 () Bool)

(declare-fun e!829182 () Bool)

(declare-fun e!829179 () Bool)

(assert (=> b!1478110 (= e!829182 e!829179)))

(declare-fun res!1004172 () Bool)

(assert (=> b!1478110 (=> res!1004172 e!829179)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99296 0))(
  ( (array!99297 (arr!47927 (Array (_ BitVec 32) (_ BitVec 64))) (size!48477 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99296)

(assert (=> b!1478110 (= res!1004172 (or (and (= (select (arr!47927 a!2862) index!646) (select (store (arr!47927 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47927 a!2862) index!646) (select (arr!47927 a!2862) j!93))) (not (= (select (arr!47927 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478111 () Bool)

(declare-fun e!829181 () Bool)

(declare-fun e!829186 () Bool)

(assert (=> b!1478111 (= e!829181 e!829186)))

(declare-fun res!1004174 () Bool)

(assert (=> b!1478111 (=> (not res!1004174) (not e!829186))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478111 (= res!1004174 (= (select (store (arr!47927 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645573 () array!99296)

(assert (=> b!1478111 (= lt!645573 (array!99297 (store (arr!47927 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48477 a!2862)))))

(declare-fun res!1004163 () Bool)

(assert (=> start!126190 (=> (not res!1004163) (not e!829181))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126190 (= res!1004163 (validMask!0 mask!2687))))

(assert (=> start!126190 e!829181))

(assert (=> start!126190 true))

(declare-fun array_inv!36955 (array!99296) Bool)

(assert (=> start!126190 (array_inv!36955 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1478112 () Bool)

(declare-fun lt!645572 () (_ BitVec 64))

(declare-fun e!829183 () Bool)

(declare-datatypes ((SeekEntryResult!12167 0))(
  ( (MissingZero!12167 (index!51060 (_ BitVec 32))) (Found!12167 (index!51061 (_ BitVec 32))) (Intermediate!12167 (undefined!12979 Bool) (index!51062 (_ BitVec 32)) (x!132654 (_ BitVec 32))) (Undefined!12167) (MissingVacant!12167 (index!51063 (_ BitVec 32))) )
))
(declare-fun lt!645571 () SeekEntryResult!12167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99296 (_ BitVec 32)) SeekEntryResult!12167)

(assert (=> b!1478112 (= e!829183 (= lt!645571 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645572 lt!645573 mask!2687)))))

(declare-fun b!1478113 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99296 (_ BitVec 32)) SeekEntryResult!12167)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99296 (_ BitVec 32)) SeekEntryResult!12167)

(assert (=> b!1478113 (= e!829183 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645572 lt!645573 mask!2687) (seekEntryOrOpen!0 lt!645572 lt!645573 mask!2687)))))

(declare-fun b!1478114 () Bool)

(declare-fun res!1004173 () Bool)

(assert (=> b!1478114 (=> (not res!1004173) (not e!829181))))

(declare-datatypes ((List!34428 0))(
  ( (Nil!34425) (Cons!34424 (h!35792 (_ BitVec 64)) (t!49122 List!34428)) )
))
(declare-fun arrayNoDuplicates!0 (array!99296 (_ BitVec 32) List!34428) Bool)

(assert (=> b!1478114 (= res!1004173 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34425))))

(declare-fun b!1478115 () Bool)

(declare-fun res!1004170 () Bool)

(declare-fun e!829185 () Bool)

(assert (=> b!1478115 (=> (not res!1004170) (not e!829185))))

(declare-fun lt!645574 () SeekEntryResult!12167)

(assert (=> b!1478115 (= res!1004170 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47927 a!2862) j!93) a!2862 mask!2687) lt!645574))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1478116 () Bool)

(declare-fun e!829187 () Bool)

(assert (=> b!1478116 (= e!829187 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478117 () Bool)

(declare-fun e!829184 () Bool)

(assert (=> b!1478117 (= e!829184 (not true))))

(assert (=> b!1478117 e!829182))

(declare-fun res!1004168 () Bool)

(assert (=> b!1478117 (=> (not res!1004168) (not e!829182))))

(declare-fun lt!645576 () SeekEntryResult!12167)

(assert (=> b!1478117 (= res!1004168 (and (= lt!645576 (Found!12167 j!93)) (or (= (select (arr!47927 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47927 a!2862) intermediateBeforeIndex!19) (select (arr!47927 a!2862) j!93)))))))

(assert (=> b!1478117 (= lt!645576 (seekEntryOrOpen!0 (select (arr!47927 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99296 (_ BitVec 32)) Bool)

(assert (=> b!1478117 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49674 0))(
  ( (Unit!49675) )
))
(declare-fun lt!645575 () Unit!49674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49674)

(assert (=> b!1478117 (= lt!645575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478118 () Bool)

(declare-fun res!1004165 () Bool)

(assert (=> b!1478118 (=> (not res!1004165) (not e!829184))))

(assert (=> b!1478118 (= res!1004165 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478119 () Bool)

(assert (=> b!1478119 (= e!829185 e!829184)))

(declare-fun res!1004171 () Bool)

(assert (=> b!1478119 (=> (not res!1004171) (not e!829184))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478119 (= res!1004171 (= lt!645571 (Intermediate!12167 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478119 (= lt!645571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645572 mask!2687) lt!645572 lt!645573 mask!2687))))

(assert (=> b!1478119 (= lt!645572 (select (store (arr!47927 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478120 () Bool)

(declare-fun res!1004162 () Bool)

(assert (=> b!1478120 (=> (not res!1004162) (not e!829181))))

(assert (=> b!1478120 (= res!1004162 (and (= (size!48477 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48477 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48477 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478121 () Bool)

(declare-fun res!1004175 () Bool)

(assert (=> b!1478121 (=> (not res!1004175) (not e!829181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478121 (= res!1004175 (validKeyInArray!0 (select (arr!47927 a!2862) j!93)))))

(declare-fun b!1478122 () Bool)

(declare-fun res!1004176 () Bool)

(assert (=> b!1478122 (=> (not res!1004176) (not e!829181))))

(assert (=> b!1478122 (= res!1004176 (validKeyInArray!0 (select (arr!47927 a!2862) i!1006)))))

(declare-fun b!1478123 () Bool)

(declare-fun res!1004169 () Bool)

(assert (=> b!1478123 (=> (not res!1004169) (not e!829181))))

(assert (=> b!1478123 (= res!1004169 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48477 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48477 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48477 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478124 () Bool)

(declare-fun res!1004164 () Bool)

(assert (=> b!1478124 (=> (not res!1004164) (not e!829181))))

(assert (=> b!1478124 (= res!1004164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478125 () Bool)

(assert (=> b!1478125 (= e!829179 e!829187)))

(declare-fun res!1004166 () Bool)

(assert (=> b!1478125 (=> (not res!1004166) (not e!829187))))

(assert (=> b!1478125 (= res!1004166 (= lt!645576 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47927 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478126 () Bool)

(assert (=> b!1478126 (= e!829186 e!829185)))

(declare-fun res!1004161 () Bool)

(assert (=> b!1478126 (=> (not res!1004161) (not e!829185))))

(assert (=> b!1478126 (= res!1004161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47927 a!2862) j!93) mask!2687) (select (arr!47927 a!2862) j!93) a!2862 mask!2687) lt!645574))))

(assert (=> b!1478126 (= lt!645574 (Intermediate!12167 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478127 () Bool)

(declare-fun res!1004167 () Bool)

(assert (=> b!1478127 (=> (not res!1004167) (not e!829184))))

(assert (=> b!1478127 (= res!1004167 e!829183)))

(declare-fun c!136494 () Bool)

(assert (=> b!1478127 (= c!136494 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126190 res!1004163) b!1478120))

(assert (= (and b!1478120 res!1004162) b!1478122))

(assert (= (and b!1478122 res!1004176) b!1478121))

(assert (= (and b!1478121 res!1004175) b!1478124))

(assert (= (and b!1478124 res!1004164) b!1478114))

(assert (= (and b!1478114 res!1004173) b!1478123))

(assert (= (and b!1478123 res!1004169) b!1478111))

(assert (= (and b!1478111 res!1004174) b!1478126))

(assert (= (and b!1478126 res!1004161) b!1478115))

(assert (= (and b!1478115 res!1004170) b!1478119))

(assert (= (and b!1478119 res!1004171) b!1478127))

(assert (= (and b!1478127 c!136494) b!1478112))

(assert (= (and b!1478127 (not c!136494)) b!1478113))

(assert (= (and b!1478127 res!1004167) b!1478118))

(assert (= (and b!1478118 res!1004165) b!1478117))

(assert (= (and b!1478117 res!1004168) b!1478110))

(assert (= (and b!1478110 (not res!1004172)) b!1478125))

(assert (= (and b!1478125 res!1004166) b!1478116))

(declare-fun m!1364035 () Bool)

(assert (=> b!1478113 m!1364035))

(declare-fun m!1364037 () Bool)

(assert (=> b!1478113 m!1364037))

(declare-fun m!1364039 () Bool)

(assert (=> b!1478124 m!1364039))

(declare-fun m!1364041 () Bool)

(assert (=> b!1478117 m!1364041))

(declare-fun m!1364043 () Bool)

(assert (=> b!1478117 m!1364043))

(declare-fun m!1364045 () Bool)

(assert (=> b!1478117 m!1364045))

(declare-fun m!1364047 () Bool)

(assert (=> b!1478117 m!1364047))

(declare-fun m!1364049 () Bool)

(assert (=> b!1478117 m!1364049))

(assert (=> b!1478117 m!1364045))

(assert (=> b!1478126 m!1364045))

(assert (=> b!1478126 m!1364045))

(declare-fun m!1364051 () Bool)

(assert (=> b!1478126 m!1364051))

(assert (=> b!1478126 m!1364051))

(assert (=> b!1478126 m!1364045))

(declare-fun m!1364053 () Bool)

(assert (=> b!1478126 m!1364053))

(assert (=> b!1478125 m!1364045))

(assert (=> b!1478125 m!1364045))

(declare-fun m!1364055 () Bool)

(assert (=> b!1478125 m!1364055))

(declare-fun m!1364057 () Bool)

(assert (=> b!1478111 m!1364057))

(declare-fun m!1364059 () Bool)

(assert (=> b!1478111 m!1364059))

(assert (=> b!1478115 m!1364045))

(assert (=> b!1478115 m!1364045))

(declare-fun m!1364061 () Bool)

(assert (=> b!1478115 m!1364061))

(declare-fun m!1364063 () Bool)

(assert (=> b!1478110 m!1364063))

(assert (=> b!1478110 m!1364057))

(declare-fun m!1364065 () Bool)

(assert (=> b!1478110 m!1364065))

(assert (=> b!1478110 m!1364045))

(assert (=> b!1478121 m!1364045))

(assert (=> b!1478121 m!1364045))

(declare-fun m!1364067 () Bool)

(assert (=> b!1478121 m!1364067))

(declare-fun m!1364069 () Bool)

(assert (=> b!1478114 m!1364069))

(declare-fun m!1364071 () Bool)

(assert (=> start!126190 m!1364071))

(declare-fun m!1364073 () Bool)

(assert (=> start!126190 m!1364073))

(declare-fun m!1364075 () Bool)

(assert (=> b!1478119 m!1364075))

(assert (=> b!1478119 m!1364075))

(declare-fun m!1364077 () Bool)

(assert (=> b!1478119 m!1364077))

(assert (=> b!1478119 m!1364057))

(declare-fun m!1364079 () Bool)

(assert (=> b!1478119 m!1364079))

(declare-fun m!1364081 () Bool)

(assert (=> b!1478112 m!1364081))

(declare-fun m!1364083 () Bool)

(assert (=> b!1478122 m!1364083))

(assert (=> b!1478122 m!1364083))

(declare-fun m!1364085 () Bool)

(assert (=> b!1478122 m!1364085))

(push 1)

