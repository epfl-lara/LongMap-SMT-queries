; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125406 () Bool)

(assert start!125406)

(declare-fun b!1461176 () Bool)

(declare-fun res!990223 () Bool)

(declare-fun e!821767 () Bool)

(assert (=> b!1461176 (=> (not res!990223) (not e!821767))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461176 (= res!990223 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461177 () Bool)

(declare-fun res!990219 () Bool)

(declare-fun e!821772 () Bool)

(assert (=> b!1461177 (=> (not res!990219) (not e!821772))))

(declare-datatypes ((array!98749 0))(
  ( (array!98750 (arr!47659 (Array (_ BitVec 32) (_ BitVec 64))) (size!48210 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98749)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98749 (_ BitVec 32)) Bool)

(assert (=> b!1461177 (= res!990219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461178 () Bool)

(declare-fun e!821764 () Bool)

(assert (=> b!1461178 (= e!821764 e!821767)))

(declare-fun res!990213 () Bool)

(assert (=> b!1461178 (=> (not res!990213) (not e!821767))))

(declare-datatypes ((SeekEntryResult!11808 0))(
  ( (MissingZero!11808 (index!49624 (_ BitVec 32))) (Found!11808 (index!49625 (_ BitVec 32))) (Intermediate!11808 (undefined!12620 Bool) (index!49626 (_ BitVec 32)) (x!131409 (_ BitVec 32))) (Undefined!11808) (MissingVacant!11808 (index!49627 (_ BitVec 32))) )
))
(declare-fun lt!640089 () SeekEntryResult!11808)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1461178 (= res!990213 (= lt!640089 (Intermediate!11808 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640093 () (_ BitVec 64))

(declare-fun lt!640095 () array!98749)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98749 (_ BitVec 32)) SeekEntryResult!11808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461178 (= lt!640089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640093 mask!2687) lt!640093 lt!640095 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1461178 (= lt!640093 (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!821771 () Bool)

(declare-fun b!1461179 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98749 (_ BitVec 32)) SeekEntryResult!11808)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98749 (_ BitVec 32)) SeekEntryResult!11808)

(assert (=> b!1461179 (= e!821771 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640093 lt!640095 mask!2687) (seekEntryOrOpen!0 lt!640093 lt!640095 mask!2687)))))

(declare-fun b!1461180 () Bool)

(declare-fun res!990222 () Bool)

(assert (=> b!1461180 (=> (not res!990222) (not e!821772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461180 (= res!990222 (validKeyInArray!0 (select (arr!47659 a!2862) i!1006)))))

(declare-fun b!1461181 () Bool)

(declare-fun res!990218 () Bool)

(declare-fun e!821765 () Bool)

(assert (=> b!1461181 (=> res!990218 e!821765)))

(declare-fun lt!640096 () SeekEntryResult!11808)

(declare-fun lt!640092 () (_ BitVec 32))

(assert (=> b!1461181 (= res!990218 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640092 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640096)))))

(declare-fun b!1461182 () Bool)

(declare-fun res!990230 () Bool)

(assert (=> b!1461182 (=> (not res!990230) (not e!821772))))

(assert (=> b!1461182 (= res!990230 (validKeyInArray!0 (select (arr!47659 a!2862) j!93)))))

(declare-fun res!990226 () Bool)

(assert (=> start!125406 (=> (not res!990226) (not e!821772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125406 (= res!990226 (validMask!0 mask!2687))))

(assert (=> start!125406 e!821772))

(assert (=> start!125406 true))

(declare-fun array_inv!36940 (array!98749) Bool)

(assert (=> start!125406 (array_inv!36940 a!2862)))

(declare-fun b!1461175 () Bool)

(declare-fun e!821768 () Bool)

(assert (=> b!1461175 (= e!821768 (not (= lt!640089 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640092 lt!640093 lt!640095 mask!2687))))))

(declare-fun b!1461183 () Bool)

(declare-fun e!821769 () Bool)

(assert (=> b!1461183 (= e!821772 e!821769)))

(declare-fun res!990220 () Bool)

(assert (=> b!1461183 (=> (not res!990220) (not e!821769))))

(assert (=> b!1461183 (= res!990220 (= (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461183 (= lt!640095 (array!98750 (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48210 a!2862)))))

(declare-fun b!1461184 () Bool)

(declare-fun e!821770 () Bool)

(assert (=> b!1461184 (= e!821767 (not e!821770))))

(declare-fun res!990217 () Bool)

(assert (=> b!1461184 (=> res!990217 e!821770)))

(assert (=> b!1461184 (= res!990217 (or (and (= (select (arr!47659 a!2862) index!646) (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47659 a!2862) index!646) (select (arr!47659 a!2862) j!93))) (= (select (arr!47659 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!640094 () SeekEntryResult!11808)

(assert (=> b!1461184 (and (= lt!640094 (Found!11808 j!93)) (or (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) (select (arr!47659 a!2862) j!93))) (let ((bdg!53546 (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47659 a!2862) index!646) bdg!53546) (= (select (arr!47659 a!2862) index!646) (select (arr!47659 a!2862) j!93))) (= (select (arr!47659 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53546 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1461184 (= lt!640094 (seekEntryOrOpen!0 (select (arr!47659 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1461184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49145 0))(
  ( (Unit!49146) )
))
(declare-fun lt!640091 () Unit!49145)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49145)

(assert (=> b!1461184 (= lt!640091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461185 () Bool)

(assert (=> b!1461185 (= e!821771 (= lt!640089 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640093 lt!640095 mask!2687)))))

(declare-fun b!1461186 () Bool)

(declare-fun res!990221 () Bool)

(assert (=> b!1461186 (=> res!990221 e!821765)))

(assert (=> b!1461186 (= res!990221 e!821768)))

(declare-fun c!135001 () Bool)

(assert (=> b!1461186 (= c!135001 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461187 () Bool)

(assert (=> b!1461187 (= e!821770 e!821765)))

(declare-fun res!990215 () Bool)

(assert (=> b!1461187 (=> res!990215 e!821765)))

(assert (=> b!1461187 (= res!990215 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640092 #b00000000000000000000000000000000) (bvsge lt!640092 (size!48210 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461187 (= lt!640092 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!640090 () SeekEntryResult!11808)

(assert (=> b!1461187 (= lt!640090 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640093 lt!640095 mask!2687))))

(assert (=> b!1461187 (= lt!640090 (seekEntryOrOpen!0 lt!640093 lt!640095 mask!2687))))

(declare-fun b!1461188 () Bool)

(assert (=> b!1461188 (= e!821765 true)))

(assert (=> b!1461188 (= lt!640094 lt!640090)))

(declare-fun lt!640088 () Unit!49145)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49145)

(assert (=> b!1461188 (= lt!640088 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!640092 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1461189 () Bool)

(declare-fun res!990225 () Bool)

(assert (=> b!1461189 (=> (not res!990225) (not e!821764))))

(assert (=> b!1461189 (= res!990225 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640096))))

(declare-fun b!1461190 () Bool)

(declare-fun res!990214 () Bool)

(assert (=> b!1461190 (=> res!990214 e!821765)))

(assert (=> b!1461190 (= res!990214 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1461191 () Bool)

(declare-fun res!990216 () Bool)

(assert (=> b!1461191 (=> (not res!990216) (not e!821772))))

(assert (=> b!1461191 (= res!990216 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48210 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48210 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48210 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461192 () Bool)

(declare-fun res!990229 () Bool)

(assert (=> b!1461192 (=> (not res!990229) (not e!821772))))

(declare-datatypes ((List!34147 0))(
  ( (Nil!34144) (Cons!34143 (h!35504 (_ BitVec 64)) (t!48833 List!34147)) )
))
(declare-fun arrayNoDuplicates!0 (array!98749 (_ BitVec 32) List!34147) Bool)

(assert (=> b!1461192 (= res!990229 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34144))))

(declare-fun b!1461193 () Bool)

(assert (=> b!1461193 (= e!821768 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640092 intermediateAfterIndex!19 lt!640093 lt!640095 mask!2687) lt!640090)))))

(declare-fun b!1461194 () Bool)

(assert (=> b!1461194 (= e!821769 e!821764)))

(declare-fun res!990224 () Bool)

(assert (=> b!1461194 (=> (not res!990224) (not e!821764))))

(assert (=> b!1461194 (= res!990224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47659 a!2862) j!93) mask!2687) (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640096))))

(assert (=> b!1461194 (= lt!640096 (Intermediate!11808 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461195 () Bool)

(declare-fun res!990228 () Bool)

(assert (=> b!1461195 (=> (not res!990228) (not e!821767))))

(assert (=> b!1461195 (= res!990228 e!821771)))

(declare-fun c!135000 () Bool)

(assert (=> b!1461195 (= c!135000 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461196 () Bool)

(declare-fun res!990227 () Bool)

(assert (=> b!1461196 (=> (not res!990227) (not e!821772))))

(assert (=> b!1461196 (= res!990227 (and (= (size!48210 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48210 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48210 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125406 res!990226) b!1461196))

(assert (= (and b!1461196 res!990227) b!1461180))

(assert (= (and b!1461180 res!990222) b!1461182))

(assert (= (and b!1461182 res!990230) b!1461177))

(assert (= (and b!1461177 res!990219) b!1461192))

(assert (= (and b!1461192 res!990229) b!1461191))

(assert (= (and b!1461191 res!990216) b!1461183))

(assert (= (and b!1461183 res!990220) b!1461194))

(assert (= (and b!1461194 res!990224) b!1461189))

(assert (= (and b!1461189 res!990225) b!1461178))

(assert (= (and b!1461178 res!990213) b!1461195))

(assert (= (and b!1461195 c!135000) b!1461185))

(assert (= (and b!1461195 (not c!135000)) b!1461179))

(assert (= (and b!1461195 res!990228) b!1461176))

(assert (= (and b!1461176 res!990223) b!1461184))

(assert (= (and b!1461184 (not res!990217)) b!1461187))

(assert (= (and b!1461187 (not res!990215)) b!1461181))

(assert (= (and b!1461181 (not res!990218)) b!1461186))

(assert (= (and b!1461186 c!135001) b!1461175))

(assert (= (and b!1461186 (not c!135001)) b!1461193))

(assert (= (and b!1461186 (not res!990221)) b!1461190))

(assert (= (and b!1461190 (not res!990214)) b!1461188))

(declare-fun m!1349011 () Bool)

(assert (=> b!1461192 m!1349011))

(declare-fun m!1349013 () Bool)

(assert (=> b!1461189 m!1349013))

(assert (=> b!1461189 m!1349013))

(declare-fun m!1349015 () Bool)

(assert (=> b!1461189 m!1349015))

(declare-fun m!1349017 () Bool)

(assert (=> b!1461180 m!1349017))

(assert (=> b!1461180 m!1349017))

(declare-fun m!1349019 () Bool)

(assert (=> b!1461180 m!1349019))

(declare-fun m!1349021 () Bool)

(assert (=> start!125406 m!1349021))

(declare-fun m!1349023 () Bool)

(assert (=> start!125406 m!1349023))

(declare-fun m!1349025 () Bool)

(assert (=> b!1461185 m!1349025))

(assert (=> b!1461182 m!1349013))

(assert (=> b!1461182 m!1349013))

(declare-fun m!1349027 () Bool)

(assert (=> b!1461182 m!1349027))

(assert (=> b!1461194 m!1349013))

(assert (=> b!1461194 m!1349013))

(declare-fun m!1349029 () Bool)

(assert (=> b!1461194 m!1349029))

(assert (=> b!1461194 m!1349029))

(assert (=> b!1461194 m!1349013))

(declare-fun m!1349031 () Bool)

(assert (=> b!1461194 m!1349031))

(declare-fun m!1349033 () Bool)

(assert (=> b!1461177 m!1349033))

(declare-fun m!1349035 () Bool)

(assert (=> b!1461175 m!1349035))

(declare-fun m!1349037 () Bool)

(assert (=> b!1461193 m!1349037))

(declare-fun m!1349039 () Bool)

(assert (=> b!1461184 m!1349039))

(declare-fun m!1349041 () Bool)

(assert (=> b!1461184 m!1349041))

(declare-fun m!1349043 () Bool)

(assert (=> b!1461184 m!1349043))

(declare-fun m!1349045 () Bool)

(assert (=> b!1461184 m!1349045))

(declare-fun m!1349047 () Bool)

(assert (=> b!1461184 m!1349047))

(assert (=> b!1461184 m!1349013))

(declare-fun m!1349049 () Bool)

(assert (=> b!1461184 m!1349049))

(declare-fun m!1349051 () Bool)

(assert (=> b!1461184 m!1349051))

(assert (=> b!1461184 m!1349013))

(assert (=> b!1461183 m!1349041))

(declare-fun m!1349053 () Bool)

(assert (=> b!1461183 m!1349053))

(declare-fun m!1349055 () Bool)

(assert (=> b!1461178 m!1349055))

(assert (=> b!1461178 m!1349055))

(declare-fun m!1349057 () Bool)

(assert (=> b!1461178 m!1349057))

(assert (=> b!1461178 m!1349041))

(declare-fun m!1349059 () Bool)

(assert (=> b!1461178 m!1349059))

(declare-fun m!1349061 () Bool)

(assert (=> b!1461187 m!1349061))

(declare-fun m!1349063 () Bool)

(assert (=> b!1461187 m!1349063))

(declare-fun m!1349065 () Bool)

(assert (=> b!1461187 m!1349065))

(assert (=> b!1461181 m!1349013))

(assert (=> b!1461181 m!1349013))

(declare-fun m!1349067 () Bool)

(assert (=> b!1461181 m!1349067))

(assert (=> b!1461179 m!1349063))

(assert (=> b!1461179 m!1349065))

(declare-fun m!1349069 () Bool)

(assert (=> b!1461188 m!1349069))

(check-sat (not b!1461178) (not b!1461193) (not b!1461179) (not b!1461188) (not b!1461192) (not b!1461181) (not start!125406) (not b!1461194) (not b!1461184) (not b!1461175) (not b!1461185) (not b!1461187) (not b!1461180) (not b!1461177) (not b!1461182) (not b!1461189))
(check-sat)
