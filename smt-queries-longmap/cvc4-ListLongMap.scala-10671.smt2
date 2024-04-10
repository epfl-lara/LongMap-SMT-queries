; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125168 () Bool)

(assert start!125168)

(declare-fun b!1459188 () Bool)

(declare-fun res!989171 () Bool)

(declare-fun e!820659 () Bool)

(assert (=> b!1459188 (=> (not res!989171) (not e!820659))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98616 0))(
  ( (array!98617 (arr!47596 (Array (_ BitVec 32) (_ BitVec 64))) (size!48146 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98616)

(assert (=> b!1459188 (= res!989171 (and (= (size!48146 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48146 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48146 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459189 () Bool)

(declare-fun e!820658 () Bool)

(declare-fun e!820663 () Bool)

(assert (=> b!1459189 (= e!820658 e!820663)))

(declare-fun res!989175 () Bool)

(assert (=> b!1459189 (=> res!989175 e!820663)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639348 () (_ BitVec 32))

(assert (=> b!1459189 (= res!989175 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639348 #b00000000000000000000000000000000) (bvsge lt!639348 (size!48146 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459189 (= lt!639348 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639347 () array!98616)

(declare-datatypes ((SeekEntryResult!11848 0))(
  ( (MissingZero!11848 (index!49784 (_ BitVec 32))) (Found!11848 (index!49785 (_ BitVec 32))) (Intermediate!11848 (undefined!12660 Bool) (index!49786 (_ BitVec 32)) (x!131393 (_ BitVec 32))) (Undefined!11848) (MissingVacant!11848 (index!49787 (_ BitVec 32))) )
))
(declare-fun lt!639343 () SeekEntryResult!11848)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639340 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98616 (_ BitVec 32)) SeekEntryResult!11848)

(assert (=> b!1459189 (= lt!639343 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639340 lt!639347 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98616 (_ BitVec 32)) SeekEntryResult!11848)

(assert (=> b!1459189 (= lt!639343 (seekEntryOrOpen!0 lt!639340 lt!639347 mask!2687))))

(declare-fun b!1459190 () Bool)

(declare-fun res!989178 () Bool)

(assert (=> b!1459190 (=> res!989178 e!820663)))

(declare-fun e!820660 () Bool)

(assert (=> b!1459190 (= res!989178 e!820660)))

(declare-fun c!134519 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459190 (= c!134519 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459191 () Bool)

(declare-fun res!989185 () Bool)

(assert (=> b!1459191 (=> (not res!989185) (not e!820659))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459191 (= res!989185 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48146 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48146 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48146 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!989186 () Bool)

(assert (=> start!125168 (=> (not res!989186) (not e!820659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125168 (= res!989186 (validMask!0 mask!2687))))

(assert (=> start!125168 e!820659))

(assert (=> start!125168 true))

(declare-fun array_inv!36624 (array!98616) Bool)

(assert (=> start!125168 (array_inv!36624 a!2862)))

(declare-fun b!1459192 () Bool)

(declare-fun res!989184 () Bool)

(declare-fun e!820662 () Bool)

(assert (=> b!1459192 (=> (not res!989184) (not e!820662))))

(declare-fun e!820661 () Bool)

(assert (=> b!1459192 (= res!989184 e!820661)))

(declare-fun c!134520 () Bool)

(assert (=> b!1459192 (= c!134520 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459193 () Bool)

(assert (=> b!1459193 (= e!820663 true)))

(declare-fun lt!639346 () SeekEntryResult!11848)

(assert (=> b!1459193 (= lt!639346 lt!639343)))

(declare-datatypes ((Unit!49192 0))(
  ( (Unit!49193) )
))
(declare-fun lt!639341 () Unit!49192)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49192)

(assert (=> b!1459193 (= lt!639341 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639348 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459194 () Bool)

(declare-fun res!989173 () Bool)

(declare-fun e!820664 () Bool)

(assert (=> b!1459194 (=> (not res!989173) (not e!820664))))

(declare-fun lt!639342 () SeekEntryResult!11848)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98616 (_ BitVec 32)) SeekEntryResult!11848)

(assert (=> b!1459194 (= res!989173 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!639342))))

(declare-fun b!1459195 () Bool)

(declare-fun res!989181 () Bool)

(assert (=> b!1459195 (=> (not res!989181) (not e!820659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459195 (= res!989181 (validKeyInArray!0 (select (arr!47596 a!2862) i!1006)))))

(declare-fun b!1459196 () Bool)

(declare-fun e!820656 () Bool)

(assert (=> b!1459196 (= e!820659 e!820656)))

(declare-fun res!989174 () Bool)

(assert (=> b!1459196 (=> (not res!989174) (not e!820656))))

(assert (=> b!1459196 (= res!989174 (= (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459196 (= lt!639347 (array!98617 (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48146 a!2862)))))

(declare-fun b!1459197 () Bool)

(declare-fun res!989179 () Bool)

(assert (=> b!1459197 (=> res!989179 e!820663)))

(assert (=> b!1459197 (= res!989179 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639348 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!639342)))))

(declare-fun b!1459198 () Bool)

(declare-fun res!989182 () Bool)

(assert (=> b!1459198 (=> (not res!989182) (not e!820659))))

(declare-datatypes ((List!34097 0))(
  ( (Nil!34094) (Cons!34093 (h!35443 (_ BitVec 64)) (t!48791 List!34097)) )
))
(declare-fun arrayNoDuplicates!0 (array!98616 (_ BitVec 32) List!34097) Bool)

(assert (=> b!1459198 (= res!989182 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34094))))

(declare-fun b!1459199 () Bool)

(assert (=> b!1459199 (= e!820660 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639348 intermediateAfterIndex!19 lt!639340 lt!639347 mask!2687) lt!639343)))))

(declare-fun lt!639344 () SeekEntryResult!11848)

(declare-fun b!1459200 () Bool)

(assert (=> b!1459200 (= e!820660 (not (= lt!639344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639348 lt!639340 lt!639347 mask!2687))))))

(declare-fun b!1459201 () Bool)

(declare-fun res!989172 () Bool)

(assert (=> b!1459201 (=> (not res!989172) (not e!820662))))

(assert (=> b!1459201 (= res!989172 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459202 () Bool)

(assert (=> b!1459202 (= e!820664 e!820662)))

(declare-fun res!989183 () Bool)

(assert (=> b!1459202 (=> (not res!989183) (not e!820662))))

(assert (=> b!1459202 (= res!989183 (= lt!639344 (Intermediate!11848 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459202 (= lt!639344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639340 mask!2687) lt!639340 lt!639347 mask!2687))))

(assert (=> b!1459202 (= lt!639340 (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459203 () Bool)

(assert (=> b!1459203 (= e!820661 (= lt!639344 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639340 lt!639347 mask!2687)))))

(declare-fun b!1459204 () Bool)

(declare-fun res!989180 () Bool)

(assert (=> b!1459204 (=> (not res!989180) (not e!820659))))

(assert (=> b!1459204 (= res!989180 (validKeyInArray!0 (select (arr!47596 a!2862) j!93)))))

(declare-fun b!1459205 () Bool)

(assert (=> b!1459205 (= e!820656 e!820664)))

(declare-fun res!989187 () Bool)

(assert (=> b!1459205 (=> (not res!989187) (not e!820664))))

(assert (=> b!1459205 (= res!989187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47596 a!2862) j!93) mask!2687) (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!639342))))

(assert (=> b!1459205 (= lt!639342 (Intermediate!11848 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459206 () Bool)

(assert (=> b!1459206 (= e!820661 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639340 lt!639347 mask!2687) (seekEntryOrOpen!0 lt!639340 lt!639347 mask!2687)))))

(declare-fun b!1459207 () Bool)

(assert (=> b!1459207 (= e!820662 (not e!820658))))

(declare-fun res!989188 () Bool)

(assert (=> b!1459207 (=> res!989188 e!820658)))

(assert (=> b!1459207 (= res!989188 (or (and (= (select (arr!47596 a!2862) index!646) (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47596 a!2862) index!646) (select (arr!47596 a!2862) j!93))) (= (select (arr!47596 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459207 (and (= lt!639346 (Found!11848 j!93)) (or (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) (select (arr!47596 a!2862) j!93))) (let ((bdg!53485 (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47596 a!2862) index!646) bdg!53485) (= (select (arr!47596 a!2862) index!646) (select (arr!47596 a!2862) j!93))) (= (select (arr!47596 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53485 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459207 (= lt!639346 (seekEntryOrOpen!0 (select (arr!47596 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98616 (_ BitVec 32)) Bool)

(assert (=> b!1459207 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639345 () Unit!49192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49192)

(assert (=> b!1459207 (= lt!639345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459208 () Bool)

(declare-fun res!989177 () Bool)

(assert (=> b!1459208 (=> (not res!989177) (not e!820659))))

(assert (=> b!1459208 (= res!989177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459209 () Bool)

(declare-fun res!989176 () Bool)

(assert (=> b!1459209 (=> res!989176 e!820663)))

(assert (=> b!1459209 (= res!989176 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(assert (= (and start!125168 res!989186) b!1459188))

(assert (= (and b!1459188 res!989171) b!1459195))

(assert (= (and b!1459195 res!989181) b!1459204))

(assert (= (and b!1459204 res!989180) b!1459208))

(assert (= (and b!1459208 res!989177) b!1459198))

(assert (= (and b!1459198 res!989182) b!1459191))

(assert (= (and b!1459191 res!989185) b!1459196))

(assert (= (and b!1459196 res!989174) b!1459205))

(assert (= (and b!1459205 res!989187) b!1459194))

(assert (= (and b!1459194 res!989173) b!1459202))

(assert (= (and b!1459202 res!989183) b!1459192))

(assert (= (and b!1459192 c!134520) b!1459203))

(assert (= (and b!1459192 (not c!134520)) b!1459206))

(assert (= (and b!1459192 res!989184) b!1459201))

(assert (= (and b!1459201 res!989172) b!1459207))

(assert (= (and b!1459207 (not res!989188)) b!1459189))

(assert (= (and b!1459189 (not res!989175)) b!1459197))

(assert (= (and b!1459197 (not res!989179)) b!1459190))

(assert (= (and b!1459190 c!134519) b!1459200))

(assert (= (and b!1459190 (not c!134519)) b!1459199))

(assert (= (and b!1459190 (not res!989178)) b!1459209))

(assert (= (and b!1459209 (not res!989176)) b!1459193))

(declare-fun m!1346971 () Bool)

(assert (=> b!1459189 m!1346971))

(declare-fun m!1346973 () Bool)

(assert (=> b!1459189 m!1346973))

(declare-fun m!1346975 () Bool)

(assert (=> b!1459189 m!1346975))

(declare-fun m!1346977 () Bool)

(assert (=> b!1459202 m!1346977))

(assert (=> b!1459202 m!1346977))

(declare-fun m!1346979 () Bool)

(assert (=> b!1459202 m!1346979))

(declare-fun m!1346981 () Bool)

(assert (=> b!1459202 m!1346981))

(declare-fun m!1346983 () Bool)

(assert (=> b!1459202 m!1346983))

(declare-fun m!1346985 () Bool)

(assert (=> b!1459197 m!1346985))

(assert (=> b!1459197 m!1346985))

(declare-fun m!1346987 () Bool)

(assert (=> b!1459197 m!1346987))

(declare-fun m!1346989 () Bool)

(assert (=> b!1459193 m!1346989))

(declare-fun m!1346991 () Bool)

(assert (=> b!1459195 m!1346991))

(assert (=> b!1459195 m!1346991))

(declare-fun m!1346993 () Bool)

(assert (=> b!1459195 m!1346993))

(declare-fun m!1346995 () Bool)

(assert (=> b!1459208 m!1346995))

(declare-fun m!1346997 () Bool)

(assert (=> b!1459199 m!1346997))

(declare-fun m!1346999 () Bool)

(assert (=> b!1459203 m!1346999))

(assert (=> b!1459194 m!1346985))

(assert (=> b!1459194 m!1346985))

(declare-fun m!1347001 () Bool)

(assert (=> b!1459194 m!1347001))

(declare-fun m!1347003 () Bool)

(assert (=> b!1459198 m!1347003))

(assert (=> b!1459204 m!1346985))

(assert (=> b!1459204 m!1346985))

(declare-fun m!1347005 () Bool)

(assert (=> b!1459204 m!1347005))

(assert (=> b!1459196 m!1346981))

(declare-fun m!1347007 () Bool)

(assert (=> b!1459196 m!1347007))

(assert (=> b!1459206 m!1346973))

(assert (=> b!1459206 m!1346975))

(declare-fun m!1347009 () Bool)

(assert (=> b!1459207 m!1347009))

(assert (=> b!1459207 m!1346981))

(declare-fun m!1347011 () Bool)

(assert (=> b!1459207 m!1347011))

(declare-fun m!1347013 () Bool)

(assert (=> b!1459207 m!1347013))

(declare-fun m!1347015 () Bool)

(assert (=> b!1459207 m!1347015))

(assert (=> b!1459207 m!1346985))

(declare-fun m!1347017 () Bool)

(assert (=> b!1459207 m!1347017))

(declare-fun m!1347019 () Bool)

(assert (=> b!1459207 m!1347019))

(assert (=> b!1459207 m!1346985))

(declare-fun m!1347021 () Bool)

(assert (=> b!1459200 m!1347021))

(assert (=> b!1459205 m!1346985))

(assert (=> b!1459205 m!1346985))

(declare-fun m!1347023 () Bool)

(assert (=> b!1459205 m!1347023))

(assert (=> b!1459205 m!1347023))

(assert (=> b!1459205 m!1346985))

(declare-fun m!1347025 () Bool)

(assert (=> b!1459205 m!1347025))

(declare-fun m!1347027 () Bool)

(assert (=> start!125168 m!1347027))

(declare-fun m!1347029 () Bool)

(assert (=> start!125168 m!1347029))

(push 1)

