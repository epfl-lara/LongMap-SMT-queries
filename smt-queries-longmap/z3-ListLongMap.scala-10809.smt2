; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126452 () Bool)

(assert start!126452)

(declare-fun b!1483234 () Bool)

(declare-fun res!1008321 () Bool)

(declare-fun e!831653 () Bool)

(assert (=> b!1483234 (=> (not res!1008321) (not e!831653))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99412 0))(
  ( (array!99413 (arr!47983 (Array (_ BitVec 32) (_ BitVec 64))) (size!48535 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99412)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483234 (= res!1008321 (or (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) (select (arr!47983 a!2862) j!93))))))

(declare-fun b!1483235 () Bool)

(declare-fun e!831657 () Bool)

(declare-fun e!831659 () Bool)

(assert (=> b!1483235 (= e!831657 (not e!831659))))

(declare-fun res!1008323 () Bool)

(assert (=> b!1483235 (=> res!1008323 e!831659)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483235 (= res!1008323 (or (and (= (select (arr!47983 a!2862) index!646) (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47983 a!2862) index!646) (select (arr!47983 a!2862) j!93))) (= (select (arr!47983 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483235 e!831653))

(declare-fun res!1008327 () Bool)

(assert (=> b!1483235 (=> (not res!1008327) (not e!831653))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99412 (_ BitVec 32)) Bool)

(assert (=> b!1483235 (= res!1008327 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49677 0))(
  ( (Unit!49678) )
))
(declare-fun lt!647182 () Unit!49677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49677)

(assert (=> b!1483235 (= lt!647182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483236 () Bool)

(declare-fun res!1008319 () Bool)

(declare-fun e!831654 () Bool)

(assert (=> b!1483236 (=> (not res!1008319) (not e!831654))))

(assert (=> b!1483236 (= res!1008319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!831650 () Bool)

(declare-fun b!1483237 () Bool)

(declare-fun lt!647178 () (_ BitVec 64))

(declare-fun lt!647177 () array!99412)

(declare-datatypes ((SeekEntryResult!12248 0))(
  ( (MissingZero!12248 (index!51384 (_ BitVec 32))) (Found!12248 (index!51385 (_ BitVec 32))) (Intermediate!12248 (undefined!13060 Bool) (index!51386 (_ BitVec 32)) (x!132965 (_ BitVec 32))) (Undefined!12248) (MissingVacant!12248 (index!51387 (_ BitVec 32))) )
))
(declare-fun lt!647179 () SeekEntryResult!12248)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12248)

(assert (=> b!1483237 (= e!831650 (= lt!647179 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647178 lt!647177 mask!2687)))))

(declare-fun res!1008324 () Bool)

(assert (=> start!126452 (=> (not res!1008324) (not e!831654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126452 (= res!1008324 (validMask!0 mask!2687))))

(assert (=> start!126452 e!831654))

(assert (=> start!126452 true))

(declare-fun array_inv!37216 (array!99412) Bool)

(assert (=> start!126452 (array_inv!37216 a!2862)))

(declare-fun b!1483238 () Bool)

(declare-fun res!1008320 () Bool)

(assert (=> b!1483238 (=> (not res!1008320) (not e!831657))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483238 (= res!1008320 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483239 () Bool)

(declare-fun res!1008322 () Bool)

(assert (=> b!1483239 (=> (not res!1008322) (not e!831657))))

(assert (=> b!1483239 (= res!1008322 e!831650)))

(declare-fun c!136984 () Bool)

(assert (=> b!1483239 (= c!136984 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483240 () Bool)

(declare-fun res!1008330 () Bool)

(assert (=> b!1483240 (=> (not res!1008330) (not e!831654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483240 (= res!1008330 (validKeyInArray!0 (select (arr!47983 a!2862) j!93)))))

(declare-fun b!1483241 () Bool)

(declare-fun e!831658 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12248)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99412 (_ BitVec 32)) SeekEntryResult!12248)

(assert (=> b!1483241 (= e!831658 (= (seekEntryOrOpen!0 lt!647178 lt!647177 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647178 lt!647177 mask!2687)))))

(declare-fun b!1483242 () Bool)

(declare-fun e!831656 () Bool)

(assert (=> b!1483242 (= e!831656 e!831657)))

(declare-fun res!1008329 () Bool)

(assert (=> b!1483242 (=> (not res!1008329) (not e!831657))))

(assert (=> b!1483242 (= res!1008329 (= lt!647179 (Intermediate!12248 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483242 (= lt!647179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647178 mask!2687) lt!647178 lt!647177 mask!2687))))

(assert (=> b!1483242 (= lt!647178 (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483243 () Bool)

(declare-fun res!1008316 () Bool)

(assert (=> b!1483243 (=> (not res!1008316) (not e!831656))))

(declare-fun lt!647180 () SeekEntryResult!12248)

(assert (=> b!1483243 (= res!1008316 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!647180))))

(declare-fun b!1483244 () Bool)

(assert (=> b!1483244 (= e!831659 true)))

(declare-fun lt!647181 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483244 (= lt!647181 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483245 () Bool)

(declare-fun res!1008331 () Bool)

(assert (=> b!1483245 (=> (not res!1008331) (not e!831654))))

(declare-datatypes ((List!34562 0))(
  ( (Nil!34559) (Cons!34558 (h!35932 (_ BitVec 64)) (t!49248 List!34562)) )
))
(declare-fun arrayNoDuplicates!0 (array!99412 (_ BitVec 32) List!34562) Bool)

(assert (=> b!1483245 (= res!1008331 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34559))))

(declare-fun b!1483246 () Bool)

(assert (=> b!1483246 (= e!831650 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647178 lt!647177 mask!2687) (seekEntryOrOpen!0 lt!647178 lt!647177 mask!2687)))))

(declare-fun b!1483247 () Bool)

(declare-fun e!831652 () Bool)

(assert (=> b!1483247 (= e!831652 e!831656)))

(declare-fun res!1008334 () Bool)

(assert (=> b!1483247 (=> (not res!1008334) (not e!831656))))

(assert (=> b!1483247 (= res!1008334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47983 a!2862) j!93) mask!2687) (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!647180))))

(assert (=> b!1483247 (= lt!647180 (Intermediate!12248 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483248 () Bool)

(declare-fun res!1008318 () Bool)

(assert (=> b!1483248 (=> (not res!1008318) (not e!831654))))

(assert (=> b!1483248 (= res!1008318 (validKeyInArray!0 (select (arr!47983 a!2862) i!1006)))))

(declare-fun b!1483249 () Bool)

(declare-fun res!1008317 () Bool)

(assert (=> b!1483249 (=> (not res!1008317) (not e!831653))))

(assert (=> b!1483249 (= res!1008317 (= (seekEntryOrOpen!0 (select (arr!47983 a!2862) j!93) a!2862 mask!2687) (Found!12248 j!93)))))

(declare-fun b!1483250 () Bool)

(assert (=> b!1483250 (= e!831654 e!831652)))

(declare-fun res!1008332 () Bool)

(assert (=> b!1483250 (=> (not res!1008332) (not e!831652))))

(assert (=> b!1483250 (= res!1008332 (= (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483250 (= lt!647177 (array!99413 (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48535 a!2862)))))

(declare-fun b!1483251 () Bool)

(declare-fun res!1008326 () Bool)

(assert (=> b!1483251 (=> (not res!1008326) (not e!831654))))

(assert (=> b!1483251 (= res!1008326 (and (= (size!48535 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48535 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48535 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483252 () Bool)

(declare-fun e!831655 () Bool)

(assert (=> b!1483252 (= e!831655 e!831658)))

(declare-fun res!1008333 () Bool)

(assert (=> b!1483252 (=> (not res!1008333) (not e!831658))))

(declare-fun lt!647183 () (_ BitVec 64))

(assert (=> b!1483252 (= res!1008333 (and (= index!646 intermediateAfterIndex!19) (= lt!647183 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483253 () Bool)

(assert (=> b!1483253 (= e!831653 e!831655)))

(declare-fun res!1008328 () Bool)

(assert (=> b!1483253 (=> res!1008328 e!831655)))

(assert (=> b!1483253 (= res!1008328 (or (and (= (select (arr!47983 a!2862) index!646) lt!647183) (= (select (arr!47983 a!2862) index!646) (select (arr!47983 a!2862) j!93))) (= (select (arr!47983 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483253 (= lt!647183 (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483254 () Bool)

(declare-fun res!1008325 () Bool)

(assert (=> b!1483254 (=> (not res!1008325) (not e!831654))))

(assert (=> b!1483254 (= res!1008325 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48535 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48535 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48535 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126452 res!1008324) b!1483251))

(assert (= (and b!1483251 res!1008326) b!1483248))

(assert (= (and b!1483248 res!1008318) b!1483240))

(assert (= (and b!1483240 res!1008330) b!1483236))

(assert (= (and b!1483236 res!1008319) b!1483245))

(assert (= (and b!1483245 res!1008331) b!1483254))

(assert (= (and b!1483254 res!1008325) b!1483250))

(assert (= (and b!1483250 res!1008332) b!1483247))

(assert (= (and b!1483247 res!1008334) b!1483243))

(assert (= (and b!1483243 res!1008316) b!1483242))

(assert (= (and b!1483242 res!1008329) b!1483239))

(assert (= (and b!1483239 c!136984) b!1483237))

(assert (= (and b!1483239 (not c!136984)) b!1483246))

(assert (= (and b!1483239 res!1008322) b!1483238))

(assert (= (and b!1483238 res!1008320) b!1483235))

(assert (= (and b!1483235 res!1008327) b!1483249))

(assert (= (and b!1483249 res!1008317) b!1483234))

(assert (= (and b!1483234 res!1008321) b!1483253))

(assert (= (and b!1483253 (not res!1008328)) b!1483252))

(assert (= (and b!1483252 res!1008333) b!1483241))

(assert (= (and b!1483235 (not res!1008323)) b!1483244))

(declare-fun m!1368153 () Bool)

(assert (=> start!126452 m!1368153))

(declare-fun m!1368155 () Bool)

(assert (=> start!126452 m!1368155))

(declare-fun m!1368157 () Bool)

(assert (=> b!1483240 m!1368157))

(assert (=> b!1483240 m!1368157))

(declare-fun m!1368159 () Bool)

(assert (=> b!1483240 m!1368159))

(declare-fun m!1368161 () Bool)

(assert (=> b!1483237 m!1368161))

(declare-fun m!1368163 () Bool)

(assert (=> b!1483248 m!1368163))

(assert (=> b!1483248 m!1368163))

(declare-fun m!1368165 () Bool)

(assert (=> b!1483248 m!1368165))

(declare-fun m!1368167 () Bool)

(assert (=> b!1483253 m!1368167))

(assert (=> b!1483253 m!1368157))

(declare-fun m!1368169 () Bool)

(assert (=> b!1483253 m!1368169))

(declare-fun m!1368171 () Bool)

(assert (=> b!1483253 m!1368171))

(declare-fun m!1368173 () Bool)

(assert (=> b!1483242 m!1368173))

(assert (=> b!1483242 m!1368173))

(declare-fun m!1368175 () Bool)

(assert (=> b!1483242 m!1368175))

(assert (=> b!1483242 m!1368169))

(declare-fun m!1368177 () Bool)

(assert (=> b!1483242 m!1368177))

(assert (=> b!1483249 m!1368157))

(assert (=> b!1483249 m!1368157))

(declare-fun m!1368179 () Bool)

(assert (=> b!1483249 m!1368179))

(assert (=> b!1483243 m!1368157))

(assert (=> b!1483243 m!1368157))

(declare-fun m!1368181 () Bool)

(assert (=> b!1483243 m!1368181))

(assert (=> b!1483250 m!1368169))

(declare-fun m!1368183 () Bool)

(assert (=> b!1483250 m!1368183))

(declare-fun m!1368185 () Bool)

(assert (=> b!1483234 m!1368185))

(assert (=> b!1483234 m!1368157))

(declare-fun m!1368187 () Bool)

(assert (=> b!1483244 m!1368187))

(declare-fun m!1368189 () Bool)

(assert (=> b!1483241 m!1368189))

(declare-fun m!1368191 () Bool)

(assert (=> b!1483241 m!1368191))

(assert (=> b!1483247 m!1368157))

(assert (=> b!1483247 m!1368157))

(declare-fun m!1368193 () Bool)

(assert (=> b!1483247 m!1368193))

(assert (=> b!1483247 m!1368193))

(assert (=> b!1483247 m!1368157))

(declare-fun m!1368195 () Bool)

(assert (=> b!1483247 m!1368195))

(assert (=> b!1483246 m!1368191))

(assert (=> b!1483246 m!1368189))

(declare-fun m!1368197 () Bool)

(assert (=> b!1483235 m!1368197))

(assert (=> b!1483235 m!1368169))

(assert (=> b!1483235 m!1368171))

(assert (=> b!1483235 m!1368167))

(declare-fun m!1368199 () Bool)

(assert (=> b!1483235 m!1368199))

(assert (=> b!1483235 m!1368157))

(declare-fun m!1368201 () Bool)

(assert (=> b!1483245 m!1368201))

(declare-fun m!1368203 () Bool)

(assert (=> b!1483236 m!1368203))

(check-sat (not b!1483245) (not b!1483237) (not b!1483248) (not b!1483246) (not b!1483247) (not b!1483240) (not start!126452) (not b!1483249) (not b!1483241) (not b!1483243) (not b!1483244) (not b!1483235) (not b!1483242) (not b!1483236))
(check-sat)
