; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125226 () Bool)

(assert start!125226)

(declare-fun b!1455236 () Bool)

(declare-fun res!985368 () Bool)

(declare-fun e!819123 () Bool)

(assert (=> b!1455236 (=> (not res!985368) (not e!819123))))

(declare-datatypes ((array!98569 0))(
  ( (array!98570 (arr!47569 (Array (_ BitVec 32) (_ BitVec 64))) (size!48120 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98569)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98569 (_ BitVec 32)) Bool)

(assert (=> b!1455236 (= res!985368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455237 () Bool)

(declare-fun res!985360 () Bool)

(declare-fun e!819128 () Bool)

(assert (=> b!1455237 (=> (not res!985360) (not e!819128))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11718 0))(
  ( (MissingZero!11718 (index!49264 (_ BitVec 32))) (Found!11718 (index!49265 (_ BitVec 32))) (Intermediate!11718 (undefined!12530 Bool) (index!49266 (_ BitVec 32)) (x!131079 (_ BitVec 32))) (Undefined!11718) (MissingVacant!11718 (index!49267 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98569 (_ BitVec 32)) SeekEntryResult!11718)

(assert (=> b!1455237 (= res!985360 (= (seekEntryOrOpen!0 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) (Found!11718 j!93)))))

(declare-fun b!1455238 () Bool)

(declare-fun res!985358 () Bool)

(assert (=> b!1455238 (=> (not res!985358) (not e!819123))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455238 (= res!985358 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48120 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48120 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48120 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455239 () Bool)

(declare-fun res!985369 () Bool)

(assert (=> b!1455239 (=> (not res!985369) (not e!819123))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455239 (= res!985369 (and (= (size!48120 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48120 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48120 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455240 () Bool)

(declare-fun e!819126 () Bool)

(assert (=> b!1455240 (= e!819126 true)))

(declare-fun lt!637873 () Bool)

(declare-fun e!819129 () Bool)

(assert (=> b!1455240 (= lt!637873 e!819129)))

(declare-fun c!134460 () Bool)

(assert (=> b!1455240 (= c!134460 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455241 () Bool)

(declare-fun res!985363 () Bool)

(assert (=> b!1455241 (=> res!985363 e!819126)))

(declare-fun lt!637878 () (_ BitVec 32))

(declare-fun lt!637876 () SeekEntryResult!11718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98569 (_ BitVec 32)) SeekEntryResult!11718)

(assert (=> b!1455241 (= res!985363 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637878 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!637876)))))

(declare-fun b!1455242 () Bool)

(declare-fun e!819122 () Bool)

(assert (=> b!1455242 (= e!819122 e!819126)))

(declare-fun res!985353 () Bool)

(assert (=> b!1455242 (=> res!985353 e!819126)))

(assert (=> b!1455242 (= res!985353 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637878 #b00000000000000000000000000000000) (bvsge lt!637878 (size!48120 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455242 (= lt!637878 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!637872 () (_ BitVec 64))

(declare-fun lt!637875 () SeekEntryResult!11718)

(declare-fun lt!637879 () array!98569)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98569 (_ BitVec 32)) SeekEntryResult!11718)

(assert (=> b!1455242 (= lt!637875 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637872 lt!637879 mask!2687))))

(assert (=> b!1455242 (= lt!637875 (seekEntryOrOpen!0 lt!637872 lt!637879 mask!2687))))

(declare-fun b!1455243 () Bool)

(declare-fun res!985366 () Bool)

(declare-fun e!819124 () Bool)

(assert (=> b!1455243 (=> (not res!985366) (not e!819124))))

(assert (=> b!1455243 (= res!985366 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!637876))))

(declare-fun b!1455244 () Bool)

(declare-fun e!819121 () Bool)

(assert (=> b!1455244 (= e!819121 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637872 lt!637879 mask!2687) (seekEntryOrOpen!0 lt!637872 lt!637879 mask!2687)))))

(declare-fun b!1455245 () Bool)

(declare-fun res!985365 () Bool)

(assert (=> b!1455245 (=> (not res!985365) (not e!819123))))

(declare-datatypes ((List!34057 0))(
  ( (Nil!34054) (Cons!34053 (h!35414 (_ BitVec 64)) (t!48743 List!34057)) )
))
(declare-fun arrayNoDuplicates!0 (array!98569 (_ BitVec 32) List!34057) Bool)

(assert (=> b!1455245 (= res!985365 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34054))))

(declare-fun lt!637877 () SeekEntryResult!11718)

(declare-fun b!1455246 () Bool)

(assert (=> b!1455246 (= e!819121 (= lt!637877 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637872 lt!637879 mask!2687)))))

(declare-fun b!1455235 () Bool)

(declare-fun e!819125 () Bool)

(assert (=> b!1455235 (= e!819125 (not e!819122))))

(declare-fun res!985356 () Bool)

(assert (=> b!1455235 (=> res!985356 e!819122)))

(assert (=> b!1455235 (= res!985356 (or (and (= (select (arr!47569 a!2862) index!646) (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47569 a!2862) index!646) (select (arr!47569 a!2862) j!93))) (= (select (arr!47569 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455235 e!819128))

(declare-fun res!985355 () Bool)

(assert (=> b!1455235 (=> (not res!985355) (not e!819128))))

(assert (=> b!1455235 (= res!985355 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48965 0))(
  ( (Unit!48966) )
))
(declare-fun lt!637874 () Unit!48965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48965)

(assert (=> b!1455235 (= lt!637874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!985354 () Bool)

(assert (=> start!125226 (=> (not res!985354) (not e!819123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125226 (= res!985354 (validMask!0 mask!2687))))

(assert (=> start!125226 e!819123))

(assert (=> start!125226 true))

(declare-fun array_inv!36850 (array!98569) Bool)

(assert (=> start!125226 (array_inv!36850 a!2862)))

(declare-fun b!1455247 () Bool)

(declare-fun res!985370 () Bool)

(assert (=> b!1455247 (=> (not res!985370) (not e!819123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455247 (= res!985370 (validKeyInArray!0 (select (arr!47569 a!2862) i!1006)))))

(declare-fun b!1455248 () Bool)

(assert (=> b!1455248 (= e!819124 e!819125)))

(declare-fun res!985357 () Bool)

(assert (=> b!1455248 (=> (not res!985357) (not e!819125))))

(assert (=> b!1455248 (= res!985357 (= lt!637877 (Intermediate!11718 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455248 (= lt!637877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637872 mask!2687) lt!637872 lt!637879 mask!2687))))

(assert (=> b!1455248 (= lt!637872 (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455249 () Bool)

(assert (=> b!1455249 (= e!819129 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637878 intermediateAfterIndex!19 lt!637872 lt!637879 mask!2687) lt!637875)))))

(declare-fun b!1455250 () Bool)

(assert (=> b!1455250 (= e!819129 (not (= lt!637877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637878 lt!637872 lt!637879 mask!2687))))))

(declare-fun b!1455251 () Bool)

(assert (=> b!1455251 (= e!819128 (and (or (= (select (arr!47569 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47569 a!2862) intermediateBeforeIndex!19) (select (arr!47569 a!2862) j!93))) (let ((bdg!53018 (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47569 a!2862) index!646) bdg!53018) (= (select (arr!47569 a!2862) index!646) (select (arr!47569 a!2862) j!93))) (= (select (arr!47569 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53018 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455252 () Bool)

(declare-fun e!819127 () Bool)

(assert (=> b!1455252 (= e!819123 e!819127)))

(declare-fun res!985359 () Bool)

(assert (=> b!1455252 (=> (not res!985359) (not e!819127))))

(assert (=> b!1455252 (= res!985359 (= (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455252 (= lt!637879 (array!98570 (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48120 a!2862)))))

(declare-fun b!1455253 () Bool)

(declare-fun res!985361 () Bool)

(assert (=> b!1455253 (=> (not res!985361) (not e!819125))))

(assert (=> b!1455253 (= res!985361 e!819121)))

(declare-fun c!134461 () Bool)

(assert (=> b!1455253 (= c!134461 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455254 () Bool)

(assert (=> b!1455254 (= e!819127 e!819124)))

(declare-fun res!985367 () Bool)

(assert (=> b!1455254 (=> (not res!985367) (not e!819124))))

(assert (=> b!1455254 (= res!985367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47569 a!2862) j!93) mask!2687) (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!637876))))

(assert (=> b!1455254 (= lt!637876 (Intermediate!11718 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455255 () Bool)

(declare-fun res!985364 () Bool)

(assert (=> b!1455255 (=> (not res!985364) (not e!819125))))

(assert (=> b!1455255 (= res!985364 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455256 () Bool)

(declare-fun res!985362 () Bool)

(assert (=> b!1455256 (=> (not res!985362) (not e!819123))))

(assert (=> b!1455256 (= res!985362 (validKeyInArray!0 (select (arr!47569 a!2862) j!93)))))

(assert (= (and start!125226 res!985354) b!1455239))

(assert (= (and b!1455239 res!985369) b!1455247))

(assert (= (and b!1455247 res!985370) b!1455256))

(assert (= (and b!1455256 res!985362) b!1455236))

(assert (= (and b!1455236 res!985368) b!1455245))

(assert (= (and b!1455245 res!985365) b!1455238))

(assert (= (and b!1455238 res!985358) b!1455252))

(assert (= (and b!1455252 res!985359) b!1455254))

(assert (= (and b!1455254 res!985367) b!1455243))

(assert (= (and b!1455243 res!985366) b!1455248))

(assert (= (and b!1455248 res!985357) b!1455253))

(assert (= (and b!1455253 c!134461) b!1455246))

(assert (= (and b!1455253 (not c!134461)) b!1455244))

(assert (= (and b!1455253 res!985361) b!1455255))

(assert (= (and b!1455255 res!985364) b!1455235))

(assert (= (and b!1455235 res!985355) b!1455237))

(assert (= (and b!1455237 res!985360) b!1455251))

(assert (= (and b!1455235 (not res!985356)) b!1455242))

(assert (= (and b!1455242 (not res!985353)) b!1455241))

(assert (= (and b!1455241 (not res!985363)) b!1455240))

(assert (= (and b!1455240 c!134460) b!1455250))

(assert (= (and b!1455240 (not c!134460)) b!1455249))

(declare-fun m!1343755 () Bool)

(assert (=> b!1455243 m!1343755))

(assert (=> b!1455243 m!1343755))

(declare-fun m!1343757 () Bool)

(assert (=> b!1455243 m!1343757))

(declare-fun m!1343759 () Bool)

(assert (=> b!1455246 m!1343759))

(declare-fun m!1343761 () Bool)

(assert (=> b!1455245 m!1343761))

(assert (=> b!1455237 m!1343755))

(assert (=> b!1455237 m!1343755))

(declare-fun m!1343763 () Bool)

(assert (=> b!1455237 m!1343763))

(declare-fun m!1343765 () Bool)

(assert (=> b!1455235 m!1343765))

(declare-fun m!1343767 () Bool)

(assert (=> b!1455235 m!1343767))

(declare-fun m!1343769 () Bool)

(assert (=> b!1455235 m!1343769))

(declare-fun m!1343771 () Bool)

(assert (=> b!1455235 m!1343771))

(declare-fun m!1343773 () Bool)

(assert (=> b!1455235 m!1343773))

(assert (=> b!1455235 m!1343755))

(declare-fun m!1343775 () Bool)

(assert (=> b!1455244 m!1343775))

(declare-fun m!1343777 () Bool)

(assert (=> b!1455244 m!1343777))

(declare-fun m!1343779 () Bool)

(assert (=> b!1455242 m!1343779))

(assert (=> b!1455242 m!1343775))

(assert (=> b!1455242 m!1343777))

(assert (=> b!1455251 m!1343767))

(declare-fun m!1343781 () Bool)

(assert (=> b!1455251 m!1343781))

(assert (=> b!1455251 m!1343769))

(assert (=> b!1455251 m!1343771))

(assert (=> b!1455251 m!1343755))

(assert (=> b!1455252 m!1343767))

(declare-fun m!1343783 () Bool)

(assert (=> b!1455252 m!1343783))

(declare-fun m!1343785 () Bool)

(assert (=> b!1455250 m!1343785))

(declare-fun m!1343787 () Bool)

(assert (=> b!1455236 m!1343787))

(declare-fun m!1343789 () Bool)

(assert (=> start!125226 m!1343789))

(declare-fun m!1343791 () Bool)

(assert (=> start!125226 m!1343791))

(declare-fun m!1343793 () Bool)

(assert (=> b!1455248 m!1343793))

(assert (=> b!1455248 m!1343793))

(declare-fun m!1343795 () Bool)

(assert (=> b!1455248 m!1343795))

(assert (=> b!1455248 m!1343767))

(declare-fun m!1343797 () Bool)

(assert (=> b!1455248 m!1343797))

(assert (=> b!1455241 m!1343755))

(assert (=> b!1455241 m!1343755))

(declare-fun m!1343799 () Bool)

(assert (=> b!1455241 m!1343799))

(assert (=> b!1455256 m!1343755))

(assert (=> b!1455256 m!1343755))

(declare-fun m!1343801 () Bool)

(assert (=> b!1455256 m!1343801))

(declare-fun m!1343803 () Bool)

(assert (=> b!1455249 m!1343803))

(declare-fun m!1343805 () Bool)

(assert (=> b!1455247 m!1343805))

(assert (=> b!1455247 m!1343805))

(declare-fun m!1343807 () Bool)

(assert (=> b!1455247 m!1343807))

(assert (=> b!1455254 m!1343755))

(assert (=> b!1455254 m!1343755))

(declare-fun m!1343809 () Bool)

(assert (=> b!1455254 m!1343809))

(assert (=> b!1455254 m!1343809))

(assert (=> b!1455254 m!1343755))

(declare-fun m!1343811 () Bool)

(assert (=> b!1455254 m!1343811))

(check-sat (not start!125226) (not b!1455247) (not b!1455250) (not b!1455235) (not b!1455245) (not b!1455256) (not b!1455236) (not b!1455242) (not b!1455246) (not b!1455241) (not b!1455248) (not b!1455244) (not b!1455237) (not b!1455243) (not b!1455249) (not b!1455254))
(check-sat)
