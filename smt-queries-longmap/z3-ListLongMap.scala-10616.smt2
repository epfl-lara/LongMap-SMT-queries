; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125052 () Bool)

(assert start!125052)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1450325 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98395 0))(
  ( (array!98396 (arr!47482 (Array (_ BitVec 32) (_ BitVec 64))) (size!48033 (_ BitVec 32))) )
))
(declare-fun lt!636218 () array!98395)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!816851 () Bool)

(declare-fun lt!636219 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11631 0))(
  ( (MissingZero!11631 (index!48916 (_ BitVec 32))) (Found!11631 (index!48917 (_ BitVec 32))) (Intermediate!11631 (undefined!12443 Bool) (index!48918 (_ BitVec 32)) (x!130760 (_ BitVec 32))) (Undefined!11631) (MissingVacant!11631 (index!48919 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98395 (_ BitVec 32)) SeekEntryResult!11631)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98395 (_ BitVec 32)) SeekEntryResult!11631)

(assert (=> b!1450325 (= e!816851 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636219 lt!636218 mask!2687) (seekEntryOrOpen!0 lt!636219 lt!636218 mask!2687)))))

(declare-fun b!1450326 () Bool)

(declare-fun res!980988 () Bool)

(declare-fun e!816852 () Bool)

(assert (=> b!1450326 (=> (not res!980988) (not e!816852))))

(declare-fun a!2862 () array!98395)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98395 (_ BitVec 32)) Bool)

(assert (=> b!1450326 (= res!980988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450327 () Bool)

(declare-fun e!816850 () Bool)

(declare-fun e!816844 () Bool)

(assert (=> b!1450327 (= e!816850 e!816844)))

(declare-fun res!981001 () Bool)

(assert (=> b!1450327 (=> (not res!981001) (not e!816844))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!636215 () SeekEntryResult!11631)

(assert (=> b!1450327 (= res!981001 (= lt!636215 (Intermediate!11631 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98395 (_ BitVec 32)) SeekEntryResult!11631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450327 (= lt!636215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636219 mask!2687) lt!636219 lt!636218 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450327 (= lt!636219 (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450328 () Bool)

(declare-fun e!816847 () Bool)

(assert (=> b!1450328 (= e!816847 e!816850)))

(declare-fun res!980996 () Bool)

(assert (=> b!1450328 (=> (not res!980996) (not e!816850))))

(declare-fun lt!636217 () SeekEntryResult!11631)

(assert (=> b!1450328 (= res!980996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47482 a!2862) j!93) mask!2687) (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636217))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450328 (= lt!636217 (Intermediate!11631 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450329 () Bool)

(declare-fun res!980995 () Bool)

(assert (=> b!1450329 (=> (not res!980995) (not e!816844))))

(assert (=> b!1450329 (= res!980995 e!816851)))

(declare-fun c!134188 () Bool)

(assert (=> b!1450329 (= c!134188 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450330 () Bool)

(declare-fun res!980997 () Bool)

(assert (=> b!1450330 (=> (not res!980997) (not e!816850))))

(assert (=> b!1450330 (= res!980997 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636217))))

(declare-fun b!1450331 () Bool)

(declare-fun e!816849 () Bool)

(assert (=> b!1450331 (= e!816844 (not e!816849))))

(declare-fun res!981002 () Bool)

(assert (=> b!1450331 (=> res!981002 e!816849)))

(assert (=> b!1450331 (= res!981002 (or (and (= (select (arr!47482 a!2862) index!646) (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (not (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816845 () Bool)

(assert (=> b!1450331 e!816845))

(declare-fun res!980989 () Bool)

(assert (=> b!1450331 (=> (not res!980989) (not e!816845))))

(declare-fun lt!636214 () SeekEntryResult!11631)

(assert (=> b!1450331 (= res!980989 (and (= lt!636214 (Found!11631 j!93)) (or (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) (select (arr!47482 a!2862) j!93)))))))

(assert (=> b!1450331 (= lt!636214 (seekEntryOrOpen!0 (select (arr!47482 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1450331 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48791 0))(
  ( (Unit!48792) )
))
(declare-fun lt!636216 () Unit!48791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48791)

(assert (=> b!1450331 (= lt!636216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450332 () Bool)

(declare-fun res!980998 () Bool)

(assert (=> b!1450332 (=> (not res!980998) (not e!816844))))

(assert (=> b!1450332 (= res!980998 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450333 () Bool)

(declare-fun res!980990 () Bool)

(assert (=> b!1450333 (=> (not res!980990) (not e!816852))))

(assert (=> b!1450333 (= res!980990 (and (= (size!48033 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48033 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48033 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450334 () Bool)

(declare-fun e!816848 () Bool)

(assert (=> b!1450334 (= e!816845 e!816848)))

(declare-fun res!980991 () Bool)

(assert (=> b!1450334 (=> res!980991 e!816848)))

(assert (=> b!1450334 (= res!980991 (or (and (= (select (arr!47482 a!2862) index!646) (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (not (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450335 () Bool)

(declare-fun e!816843 () Bool)

(assert (=> b!1450335 (= e!816843 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450336 () Bool)

(declare-fun res!980999 () Bool)

(assert (=> b!1450336 (=> (not res!980999) (not e!816852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450336 (= res!980999 (validKeyInArray!0 (select (arr!47482 a!2862) j!93)))))

(declare-fun res!980994 () Bool)

(assert (=> start!125052 (=> (not res!980994) (not e!816852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125052 (= res!980994 (validMask!0 mask!2687))))

(assert (=> start!125052 e!816852))

(assert (=> start!125052 true))

(declare-fun array_inv!36763 (array!98395) Bool)

(assert (=> start!125052 (array_inv!36763 a!2862)))

(declare-fun b!1450324 () Bool)

(declare-fun res!980986 () Bool)

(assert (=> b!1450324 (=> (not res!980986) (not e!816852))))

(assert (=> b!1450324 (= res!980986 (validKeyInArray!0 (select (arr!47482 a!2862) i!1006)))))

(declare-fun b!1450337 () Bool)

(assert (=> b!1450337 (= e!816849 true)))

(declare-fun lt!636220 () SeekEntryResult!11631)

(assert (=> b!1450337 (= lt!636220 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47482 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1450338 () Bool)

(assert (=> b!1450338 (= e!816852 e!816847)))

(declare-fun res!981000 () Bool)

(assert (=> b!1450338 (=> (not res!981000) (not e!816847))))

(assert (=> b!1450338 (= res!981000 (= (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450338 (= lt!636218 (array!98396 (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48033 a!2862)))))

(declare-fun b!1450339 () Bool)

(assert (=> b!1450339 (= e!816848 e!816843)))

(declare-fun res!980987 () Bool)

(assert (=> b!1450339 (=> (not res!980987) (not e!816843))))

(assert (=> b!1450339 (= res!980987 (= lt!636214 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47482 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450340 () Bool)

(assert (=> b!1450340 (= e!816851 (= lt!636215 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636219 lt!636218 mask!2687)))))

(declare-fun b!1450341 () Bool)

(declare-fun res!980993 () Bool)

(assert (=> b!1450341 (=> (not res!980993) (not e!816852))))

(assert (=> b!1450341 (= res!980993 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48033 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48033 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48033 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450342 () Bool)

(declare-fun res!980992 () Bool)

(assert (=> b!1450342 (=> (not res!980992) (not e!816852))))

(declare-datatypes ((List!33970 0))(
  ( (Nil!33967) (Cons!33966 (h!35327 (_ BitVec 64)) (t!48656 List!33970)) )
))
(declare-fun arrayNoDuplicates!0 (array!98395 (_ BitVec 32) List!33970) Bool)

(assert (=> b!1450342 (= res!980992 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33967))))

(assert (= (and start!125052 res!980994) b!1450333))

(assert (= (and b!1450333 res!980990) b!1450324))

(assert (= (and b!1450324 res!980986) b!1450336))

(assert (= (and b!1450336 res!980999) b!1450326))

(assert (= (and b!1450326 res!980988) b!1450342))

(assert (= (and b!1450342 res!980992) b!1450341))

(assert (= (and b!1450341 res!980993) b!1450338))

(assert (= (and b!1450338 res!981000) b!1450328))

(assert (= (and b!1450328 res!980996) b!1450330))

(assert (= (and b!1450330 res!980997) b!1450327))

(assert (= (and b!1450327 res!981001) b!1450329))

(assert (= (and b!1450329 c!134188) b!1450340))

(assert (= (and b!1450329 (not c!134188)) b!1450325))

(assert (= (and b!1450329 res!980995) b!1450332))

(assert (= (and b!1450332 res!980998) b!1450331))

(assert (= (and b!1450331 res!980989) b!1450334))

(assert (= (and b!1450334 (not res!980991)) b!1450339))

(assert (= (and b!1450339 res!980987) b!1450335))

(assert (= (and b!1450331 (not res!981002)) b!1450337))

(declare-fun m!1339171 () Bool)

(assert (=> b!1450340 m!1339171))

(declare-fun m!1339173 () Bool)

(assert (=> b!1450337 m!1339173))

(assert (=> b!1450337 m!1339173))

(declare-fun m!1339175 () Bool)

(assert (=> b!1450337 m!1339175))

(assert (=> b!1450339 m!1339173))

(assert (=> b!1450339 m!1339173))

(declare-fun m!1339177 () Bool)

(assert (=> b!1450339 m!1339177))

(declare-fun m!1339179 () Bool)

(assert (=> b!1450331 m!1339179))

(declare-fun m!1339181 () Bool)

(assert (=> b!1450331 m!1339181))

(declare-fun m!1339183 () Bool)

(assert (=> b!1450331 m!1339183))

(declare-fun m!1339185 () Bool)

(assert (=> b!1450331 m!1339185))

(declare-fun m!1339187 () Bool)

(assert (=> b!1450331 m!1339187))

(assert (=> b!1450331 m!1339173))

(declare-fun m!1339189 () Bool)

(assert (=> b!1450331 m!1339189))

(declare-fun m!1339191 () Bool)

(assert (=> b!1450331 m!1339191))

(assert (=> b!1450331 m!1339173))

(assert (=> b!1450334 m!1339187))

(assert (=> b!1450334 m!1339181))

(assert (=> b!1450334 m!1339185))

(assert (=> b!1450334 m!1339173))

(assert (=> b!1450338 m!1339181))

(declare-fun m!1339193 () Bool)

(assert (=> b!1450338 m!1339193))

(assert (=> b!1450330 m!1339173))

(assert (=> b!1450330 m!1339173))

(declare-fun m!1339195 () Bool)

(assert (=> b!1450330 m!1339195))

(declare-fun m!1339197 () Bool)

(assert (=> b!1450324 m!1339197))

(assert (=> b!1450324 m!1339197))

(declare-fun m!1339199 () Bool)

(assert (=> b!1450324 m!1339199))

(declare-fun m!1339201 () Bool)

(assert (=> b!1450326 m!1339201))

(assert (=> b!1450336 m!1339173))

(assert (=> b!1450336 m!1339173))

(declare-fun m!1339203 () Bool)

(assert (=> b!1450336 m!1339203))

(declare-fun m!1339205 () Bool)

(assert (=> start!125052 m!1339205))

(declare-fun m!1339207 () Bool)

(assert (=> start!125052 m!1339207))

(declare-fun m!1339209 () Bool)

(assert (=> b!1450327 m!1339209))

(assert (=> b!1450327 m!1339209))

(declare-fun m!1339211 () Bool)

(assert (=> b!1450327 m!1339211))

(assert (=> b!1450327 m!1339181))

(declare-fun m!1339213 () Bool)

(assert (=> b!1450327 m!1339213))

(declare-fun m!1339215 () Bool)

(assert (=> b!1450325 m!1339215))

(declare-fun m!1339217 () Bool)

(assert (=> b!1450325 m!1339217))

(declare-fun m!1339219 () Bool)

(assert (=> b!1450342 m!1339219))

(assert (=> b!1450328 m!1339173))

(assert (=> b!1450328 m!1339173))

(declare-fun m!1339221 () Bool)

(assert (=> b!1450328 m!1339221))

(assert (=> b!1450328 m!1339221))

(assert (=> b!1450328 m!1339173))

(declare-fun m!1339223 () Bool)

(assert (=> b!1450328 m!1339223))

(check-sat (not b!1450327) (not b!1450326) (not b!1450331) (not b!1450328) (not b!1450340) (not b!1450342) (not start!125052) (not b!1450324) (not b!1450330) (not b!1450325) (not b!1450339) (not b!1450337) (not b!1450336))
(check-sat)
