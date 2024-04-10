; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124984 () Bool)

(assert start!124984)

(declare-fun b!1453166 () Bool)

(declare-fun e!817948 () Bool)

(declare-fun e!817951 () Bool)

(assert (=> b!1453166 (= e!817948 e!817951)))

(declare-fun res!984214 () Bool)

(assert (=> b!1453166 (=> (not res!984214) (not e!817951))))

(declare-datatypes ((SeekEntryResult!11756 0))(
  ( (MissingZero!11756 (index!49416 (_ BitVec 32))) (Found!11756 (index!49417 (_ BitVec 32))) (Intermediate!11756 (undefined!12568 Bool) (index!49418 (_ BitVec 32)) (x!131061 (_ BitVec 32))) (Undefined!11756) (MissingVacant!11756 (index!49419 (_ BitVec 32))) )
))
(declare-fun lt!637157 () SeekEntryResult!11756)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1453166 (= res!984214 (= lt!637157 (Intermediate!11756 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98432 0))(
  ( (array!98433 (arr!47504 (Array (_ BitVec 32) (_ BitVec 64))) (size!48054 (_ BitVec 32))) )
))
(declare-fun lt!637158 () array!98432)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637160 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98432 (_ BitVec 32)) SeekEntryResult!11756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453166 (= lt!637157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637160 mask!2687) lt!637160 lt!637158 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98432)

(assert (=> b!1453166 (= lt!637160 (select (store (arr!47504 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453167 () Bool)

(declare-fun res!984216 () Bool)

(assert (=> b!1453167 (=> (not res!984216) (not e!817951))))

(declare-fun e!817955 () Bool)

(assert (=> b!1453167 (= res!984216 e!817955)))

(declare-fun c!133992 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1453167 (= c!133992 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453168 () Bool)

(declare-fun res!984218 () Bool)

(declare-fun e!817952 () Bool)

(assert (=> b!1453168 (=> (not res!984218) (not e!817952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98432 (_ BitVec 32)) Bool)

(assert (=> b!1453168 (= res!984218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453169 () Bool)

(declare-fun e!817947 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98432 (_ BitVec 32)) SeekEntryResult!11756)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98432 (_ BitVec 32)) SeekEntryResult!11756)

(assert (=> b!1453169 (= e!817947 (= (seekEntryOrOpen!0 lt!637160 lt!637158 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637160 lt!637158 mask!2687)))))

(declare-fun b!1453170 () Bool)

(declare-fun e!817953 () Bool)

(assert (=> b!1453170 (= e!817953 e!817947)))

(declare-fun res!984209 () Bool)

(assert (=> b!1453170 (=> (not res!984209) (not e!817947))))

(declare-fun lt!637159 () (_ BitVec 64))

(assert (=> b!1453170 (= res!984209 (and (= index!646 intermediateAfterIndex!19) (= lt!637159 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453171 () Bool)

(declare-fun res!984204 () Bool)

(assert (=> b!1453171 (=> (not res!984204) (not e!817952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453171 (= res!984204 (validKeyInArray!0 (select (arr!47504 a!2862) i!1006)))))

(declare-fun b!1453172 () Bool)

(declare-fun res!984217 () Bool)

(assert (=> b!1453172 (=> (not res!984217) (not e!817951))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453172 (= res!984217 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453173 () Bool)

(declare-fun res!984220 () Bool)

(assert (=> b!1453173 (=> (not res!984220) (not e!817948))))

(declare-fun lt!637161 () SeekEntryResult!11756)

(assert (=> b!1453173 (= res!984220 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47504 a!2862) j!93) a!2862 mask!2687) lt!637161))))

(declare-fun b!1453174 () Bool)

(declare-fun res!984215 () Bool)

(assert (=> b!1453174 (=> (not res!984215) (not e!817952))))

(declare-datatypes ((List!34005 0))(
  ( (Nil!34002) (Cons!34001 (h!35351 (_ BitVec 64)) (t!48699 List!34005)) )
))
(declare-fun arrayNoDuplicates!0 (array!98432 (_ BitVec 32) List!34005) Bool)

(assert (=> b!1453174 (= res!984215 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34002))))

(declare-fun b!1453175 () Bool)

(declare-fun res!984212 () Bool)

(declare-fun e!817949 () Bool)

(assert (=> b!1453175 (=> (not res!984212) (not e!817949))))

(assert (=> b!1453175 (= res!984212 (= (seekEntryOrOpen!0 (select (arr!47504 a!2862) j!93) a!2862 mask!2687) (Found!11756 j!93)))))

(declare-fun b!1453176 () Bool)

(assert (=> b!1453176 (= e!817955 (= lt!637157 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637160 lt!637158 mask!2687)))))

(declare-fun res!984203 () Bool)

(assert (=> start!124984 (=> (not res!984203) (not e!817952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124984 (= res!984203 (validMask!0 mask!2687))))

(assert (=> start!124984 e!817952))

(assert (=> start!124984 true))

(declare-fun array_inv!36532 (array!98432) Bool)

(assert (=> start!124984 (array_inv!36532 a!2862)))

(declare-fun b!1453177 () Bool)

(declare-fun res!984205 () Bool)

(assert (=> b!1453177 (=> (not res!984205) (not e!817952))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453177 (= res!984205 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48054 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48054 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48054 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453178 () Bool)

(declare-fun res!984208 () Bool)

(assert (=> b!1453178 (=> (not res!984208) (not e!817952))))

(assert (=> b!1453178 (= res!984208 (validKeyInArray!0 (select (arr!47504 a!2862) j!93)))))

(declare-fun b!1453179 () Bool)

(assert (=> b!1453179 (= e!817951 (not (or (and (= (select (arr!47504 a!2862) index!646) (select (store (arr!47504 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47504 a!2862) index!646) (select (arr!47504 a!2862) j!93))) (= (select (arr!47504 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1453179 e!817949))

(declare-fun res!984207 () Bool)

(assert (=> b!1453179 (=> (not res!984207) (not e!817949))))

(assert (=> b!1453179 (= res!984207 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49008 0))(
  ( (Unit!49009) )
))
(declare-fun lt!637156 () Unit!49008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49008)

(assert (=> b!1453179 (= lt!637156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453180 () Bool)

(assert (=> b!1453180 (= e!817949 e!817953)))

(declare-fun res!984213 () Bool)

(assert (=> b!1453180 (=> res!984213 e!817953)))

(assert (=> b!1453180 (= res!984213 (or (and (= (select (arr!47504 a!2862) index!646) lt!637159) (= (select (arr!47504 a!2862) index!646) (select (arr!47504 a!2862) j!93))) (= (select (arr!47504 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453180 (= lt!637159 (select (store (arr!47504 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453181 () Bool)

(declare-fun res!984219 () Bool)

(assert (=> b!1453181 (=> (not res!984219) (not e!817949))))

(assert (=> b!1453181 (= res!984219 (or (= (select (arr!47504 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47504 a!2862) intermediateBeforeIndex!19) (select (arr!47504 a!2862) j!93))))))

(declare-fun b!1453182 () Bool)

(declare-fun e!817954 () Bool)

(assert (=> b!1453182 (= e!817952 e!817954)))

(declare-fun res!984211 () Bool)

(assert (=> b!1453182 (=> (not res!984211) (not e!817954))))

(assert (=> b!1453182 (= res!984211 (= (select (store (arr!47504 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453182 (= lt!637158 (array!98433 (store (arr!47504 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48054 a!2862)))))

(declare-fun b!1453183 () Bool)

(assert (=> b!1453183 (= e!817954 e!817948)))

(declare-fun res!984206 () Bool)

(assert (=> b!1453183 (=> (not res!984206) (not e!817948))))

(assert (=> b!1453183 (= res!984206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47504 a!2862) j!93) mask!2687) (select (arr!47504 a!2862) j!93) a!2862 mask!2687) lt!637161))))

(assert (=> b!1453183 (= lt!637161 (Intermediate!11756 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453184 () Bool)

(declare-fun res!984210 () Bool)

(assert (=> b!1453184 (=> (not res!984210) (not e!817952))))

(assert (=> b!1453184 (= res!984210 (and (= (size!48054 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48054 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48054 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453185 () Bool)

(assert (=> b!1453185 (= e!817955 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637160 lt!637158 mask!2687) (seekEntryOrOpen!0 lt!637160 lt!637158 mask!2687)))))

(assert (= (and start!124984 res!984203) b!1453184))

(assert (= (and b!1453184 res!984210) b!1453171))

(assert (= (and b!1453171 res!984204) b!1453178))

(assert (= (and b!1453178 res!984208) b!1453168))

(assert (= (and b!1453168 res!984218) b!1453174))

(assert (= (and b!1453174 res!984215) b!1453177))

(assert (= (and b!1453177 res!984205) b!1453182))

(assert (= (and b!1453182 res!984211) b!1453183))

(assert (= (and b!1453183 res!984206) b!1453173))

(assert (= (and b!1453173 res!984220) b!1453166))

(assert (= (and b!1453166 res!984214) b!1453167))

(assert (= (and b!1453167 c!133992) b!1453176))

(assert (= (and b!1453167 (not c!133992)) b!1453185))

(assert (= (and b!1453167 res!984216) b!1453172))

(assert (= (and b!1453172 res!984217) b!1453179))

(assert (= (and b!1453179 res!984207) b!1453175))

(assert (= (and b!1453175 res!984212) b!1453181))

(assert (= (and b!1453181 res!984219) b!1453180))

(assert (= (and b!1453180 (not res!984213)) b!1453170))

(assert (= (and b!1453170 res!984209) b!1453169))

(declare-fun m!1341691 () Bool)

(assert (=> b!1453175 m!1341691))

(assert (=> b!1453175 m!1341691))

(declare-fun m!1341693 () Bool)

(assert (=> b!1453175 m!1341693))

(declare-fun m!1341695 () Bool)

(assert (=> b!1453171 m!1341695))

(assert (=> b!1453171 m!1341695))

(declare-fun m!1341697 () Bool)

(assert (=> b!1453171 m!1341697))

(assert (=> b!1453173 m!1341691))

(assert (=> b!1453173 m!1341691))

(declare-fun m!1341699 () Bool)

(assert (=> b!1453173 m!1341699))

(declare-fun m!1341701 () Bool)

(assert (=> b!1453181 m!1341701))

(assert (=> b!1453181 m!1341691))

(declare-fun m!1341703 () Bool)

(assert (=> b!1453185 m!1341703))

(declare-fun m!1341705 () Bool)

(assert (=> b!1453185 m!1341705))

(assert (=> b!1453183 m!1341691))

(assert (=> b!1453183 m!1341691))

(declare-fun m!1341707 () Bool)

(assert (=> b!1453183 m!1341707))

(assert (=> b!1453183 m!1341707))

(assert (=> b!1453183 m!1341691))

(declare-fun m!1341709 () Bool)

(assert (=> b!1453183 m!1341709))

(assert (=> b!1453178 m!1341691))

(assert (=> b!1453178 m!1341691))

(declare-fun m!1341711 () Bool)

(assert (=> b!1453178 m!1341711))

(declare-fun m!1341713 () Bool)

(assert (=> b!1453174 m!1341713))

(declare-fun m!1341715 () Bool)

(assert (=> b!1453179 m!1341715))

(declare-fun m!1341717 () Bool)

(assert (=> b!1453179 m!1341717))

(declare-fun m!1341719 () Bool)

(assert (=> b!1453179 m!1341719))

(declare-fun m!1341721 () Bool)

(assert (=> b!1453179 m!1341721))

(declare-fun m!1341723 () Bool)

(assert (=> b!1453179 m!1341723))

(assert (=> b!1453179 m!1341691))

(assert (=> b!1453180 m!1341721))

(assert (=> b!1453180 m!1341691))

(assert (=> b!1453180 m!1341717))

(assert (=> b!1453180 m!1341719))

(declare-fun m!1341725 () Bool)

(assert (=> b!1453176 m!1341725))

(declare-fun m!1341727 () Bool)

(assert (=> b!1453166 m!1341727))

(assert (=> b!1453166 m!1341727))

(declare-fun m!1341729 () Bool)

(assert (=> b!1453166 m!1341729))

(assert (=> b!1453166 m!1341717))

(declare-fun m!1341731 () Bool)

(assert (=> b!1453166 m!1341731))

(assert (=> b!1453169 m!1341705))

(assert (=> b!1453169 m!1341703))

(assert (=> b!1453182 m!1341717))

(declare-fun m!1341733 () Bool)

(assert (=> b!1453182 m!1341733))

(declare-fun m!1341735 () Bool)

(assert (=> start!124984 m!1341735))

(declare-fun m!1341737 () Bool)

(assert (=> start!124984 m!1341737))

(declare-fun m!1341739 () Bool)

(assert (=> b!1453168 m!1341739))

(push 1)

