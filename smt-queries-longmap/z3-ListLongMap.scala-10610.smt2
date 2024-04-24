; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125016 () Bool)

(assert start!125016)

(declare-fun b!1449298 () Bool)

(declare-fun e!816309 () Bool)

(declare-fun e!816312 () Bool)

(assert (=> b!1449298 (= e!816309 e!816312)))

(declare-fun res!980071 () Bool)

(assert (=> b!1449298 (=> (not res!980071) (not e!816312))))

(declare-datatypes ((SeekEntryResult!11613 0))(
  ( (MissingZero!11613 (index!48844 (_ BitVec 32))) (Found!11613 (index!48845 (_ BitVec 32))) (Intermediate!11613 (undefined!12425 Bool) (index!48846 (_ BitVec 32)) (x!130694 (_ BitVec 32))) (Undefined!11613) (MissingVacant!11613 (index!48847 (_ BitVec 32))) )
))
(declare-fun lt!635841 () SeekEntryResult!11613)

(declare-datatypes ((array!98359 0))(
  ( (array!98360 (arr!47464 (Array (_ BitVec 32) (_ BitVec 64))) (size!48015 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98359)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98359 (_ BitVec 32)) SeekEntryResult!11613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449298 (= res!980071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47464 a!2862) j!93) mask!2687) (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!635841))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449298 (= lt!635841 (Intermediate!11613 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449299 () Bool)

(declare-fun res!980076 () Bool)

(declare-fun e!816311 () Bool)

(assert (=> b!1449299 (=> (not res!980076) (not e!816311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449299 (= res!980076 (validKeyInArray!0 (select (arr!47464 a!2862) j!93)))))

(declare-fun b!1449300 () Bool)

(assert (=> b!1449300 (= e!816311 e!816309)))

(declare-fun res!980082 () Bool)

(assert (=> b!1449300 (=> (not res!980082) (not e!816309))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449300 (= res!980082 (= (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635839 () array!98359)

(assert (=> b!1449300 (= lt!635839 (array!98360 (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48015 a!2862)))))

(declare-fun b!1449301 () Bool)

(declare-fun res!980069 () Bool)

(assert (=> b!1449301 (=> (not res!980069) (not e!816311))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1449301 (= res!980069 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48015 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48015 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48015 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449302 () Bool)

(declare-fun e!816310 () Bool)

(declare-fun e!816303 () Bool)

(assert (=> b!1449302 (= e!816310 e!816303)))

(declare-fun res!980083 () Bool)

(assert (=> b!1449302 (=> res!980083 e!816303)))

(assert (=> b!1449302 (= res!980083 (or (and (= (select (arr!47464 a!2862) index!646) (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47464 a!2862) index!646) (select (arr!47464 a!2862) j!93))) (not (= (select (arr!47464 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449303 () Bool)

(declare-fun res!980084 () Bool)

(assert (=> b!1449303 (=> (not res!980084) (not e!816312))))

(assert (=> b!1449303 (= res!980084 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!635841))))

(declare-fun b!1449304 () Bool)

(declare-fun lt!635842 () (_ BitVec 64))

(declare-fun e!816306 () Bool)

(declare-fun lt!635837 () SeekEntryResult!11613)

(assert (=> b!1449304 (= e!816306 (= lt!635837 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635842 lt!635839 mask!2687)))))

(declare-fun b!1449305 () Bool)

(declare-fun res!980081 () Bool)

(assert (=> b!1449305 (=> (not res!980081) (not e!816311))))

(assert (=> b!1449305 (= res!980081 (validKeyInArray!0 (select (arr!47464 a!2862) i!1006)))))

(declare-fun b!1449306 () Bool)

(declare-fun e!816307 () Bool)

(declare-fun e!816304 () Bool)

(assert (=> b!1449306 (= e!816307 (not e!816304))))

(declare-fun res!980072 () Bool)

(assert (=> b!1449306 (=> res!980072 e!816304)))

(assert (=> b!1449306 (= res!980072 (or (and (= (select (arr!47464 a!2862) index!646) (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47464 a!2862) index!646) (select (arr!47464 a!2862) j!93))) (not (= (select (arr!47464 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449306 e!816310))

(declare-fun res!980080 () Bool)

(assert (=> b!1449306 (=> (not res!980080) (not e!816310))))

(declare-fun lt!635836 () SeekEntryResult!11613)

(assert (=> b!1449306 (= res!980080 (and (= lt!635836 (Found!11613 j!93)) (or (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) (select (arr!47464 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98359 (_ BitVec 32)) SeekEntryResult!11613)

(assert (=> b!1449306 (= lt!635836 (seekEntryOrOpen!0 (select (arr!47464 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98359 (_ BitVec 32)) Bool)

(assert (=> b!1449306 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48755 0))(
  ( (Unit!48756) )
))
(declare-fun lt!635838 () Unit!48755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48755)

(assert (=> b!1449306 (= lt!635838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449307 () Bool)

(declare-fun res!980077 () Bool)

(assert (=> b!1449307 (=> (not res!980077) (not e!816311))))

(declare-datatypes ((List!33952 0))(
  ( (Nil!33949) (Cons!33948 (h!35309 (_ BitVec 64)) (t!48638 List!33952)) )
))
(declare-fun arrayNoDuplicates!0 (array!98359 (_ BitVec 32) List!33952) Bool)

(assert (=> b!1449307 (= res!980077 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33949))))

(declare-fun e!816305 () Bool)

(declare-fun b!1449308 () Bool)

(assert (=> b!1449308 (= e!816305 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!980078 () Bool)

(assert (=> start!125016 (=> (not res!980078) (not e!816311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125016 (= res!980078 (validMask!0 mask!2687))))

(assert (=> start!125016 e!816311))

(assert (=> start!125016 true))

(declare-fun array_inv!36745 (array!98359) Bool)

(assert (=> start!125016 (array_inv!36745 a!2862)))

(declare-fun b!1449309 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98359 (_ BitVec 32)) SeekEntryResult!11613)

(assert (=> b!1449309 (= e!816306 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635842 lt!635839 mask!2687) (seekEntryOrOpen!0 lt!635842 lt!635839 mask!2687)))))

(declare-fun b!1449310 () Bool)

(assert (=> b!1449310 (= e!816304 true)))

(declare-fun lt!635840 () SeekEntryResult!11613)

(assert (=> b!1449310 (= lt!635840 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47464 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449311 () Bool)

(assert (=> b!1449311 (= e!816312 e!816307)))

(declare-fun res!980075 () Bool)

(assert (=> b!1449311 (=> (not res!980075) (not e!816307))))

(assert (=> b!1449311 (= res!980075 (= lt!635837 (Intermediate!11613 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449311 (= lt!635837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635842 mask!2687) lt!635842 lt!635839 mask!2687))))

(assert (=> b!1449311 (= lt!635842 (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449312 () Bool)

(declare-fun res!980068 () Bool)

(assert (=> b!1449312 (=> (not res!980068) (not e!816307))))

(assert (=> b!1449312 (= res!980068 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449313 () Bool)

(declare-fun res!980070 () Bool)

(assert (=> b!1449313 (=> (not res!980070) (not e!816311))))

(assert (=> b!1449313 (= res!980070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449314 () Bool)

(declare-fun res!980079 () Bool)

(assert (=> b!1449314 (=> (not res!980079) (not e!816307))))

(assert (=> b!1449314 (= res!980079 e!816306)))

(declare-fun c!134134 () Bool)

(assert (=> b!1449314 (= c!134134 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449315 () Bool)

(declare-fun res!980073 () Bool)

(assert (=> b!1449315 (=> (not res!980073) (not e!816311))))

(assert (=> b!1449315 (= res!980073 (and (= (size!48015 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48015 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48015 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449316 () Bool)

(assert (=> b!1449316 (= e!816303 e!816305)))

(declare-fun res!980074 () Bool)

(assert (=> b!1449316 (=> (not res!980074) (not e!816305))))

(assert (=> b!1449316 (= res!980074 (= lt!635836 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47464 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!125016 res!980078) b!1449315))

(assert (= (and b!1449315 res!980073) b!1449305))

(assert (= (and b!1449305 res!980081) b!1449299))

(assert (= (and b!1449299 res!980076) b!1449313))

(assert (= (and b!1449313 res!980070) b!1449307))

(assert (= (and b!1449307 res!980077) b!1449301))

(assert (= (and b!1449301 res!980069) b!1449300))

(assert (= (and b!1449300 res!980082) b!1449298))

(assert (= (and b!1449298 res!980071) b!1449303))

(assert (= (and b!1449303 res!980084) b!1449311))

(assert (= (and b!1449311 res!980075) b!1449314))

(assert (= (and b!1449314 c!134134) b!1449304))

(assert (= (and b!1449314 (not c!134134)) b!1449309))

(assert (= (and b!1449314 res!980079) b!1449312))

(assert (= (and b!1449312 res!980068) b!1449306))

(assert (= (and b!1449306 res!980080) b!1449302))

(assert (= (and b!1449302 (not res!980083)) b!1449316))

(assert (= (and b!1449316 res!980074) b!1449308))

(assert (= (and b!1449306 (not res!980072)) b!1449310))

(declare-fun m!1338199 () Bool)

(assert (=> b!1449313 m!1338199))

(declare-fun m!1338201 () Bool)

(assert (=> b!1449300 m!1338201))

(declare-fun m!1338203 () Bool)

(assert (=> b!1449300 m!1338203))

(declare-fun m!1338205 () Bool)

(assert (=> b!1449303 m!1338205))

(assert (=> b!1449303 m!1338205))

(declare-fun m!1338207 () Bool)

(assert (=> b!1449303 m!1338207))

(declare-fun m!1338209 () Bool)

(assert (=> b!1449311 m!1338209))

(assert (=> b!1449311 m!1338209))

(declare-fun m!1338211 () Bool)

(assert (=> b!1449311 m!1338211))

(assert (=> b!1449311 m!1338201))

(declare-fun m!1338213 () Bool)

(assert (=> b!1449311 m!1338213))

(declare-fun m!1338215 () Bool)

(assert (=> start!125016 m!1338215))

(declare-fun m!1338217 () Bool)

(assert (=> start!125016 m!1338217))

(assert (=> b!1449299 m!1338205))

(assert (=> b!1449299 m!1338205))

(declare-fun m!1338219 () Bool)

(assert (=> b!1449299 m!1338219))

(declare-fun m!1338221 () Bool)

(assert (=> b!1449306 m!1338221))

(assert (=> b!1449306 m!1338201))

(declare-fun m!1338223 () Bool)

(assert (=> b!1449306 m!1338223))

(declare-fun m!1338225 () Bool)

(assert (=> b!1449306 m!1338225))

(declare-fun m!1338227 () Bool)

(assert (=> b!1449306 m!1338227))

(assert (=> b!1449306 m!1338205))

(declare-fun m!1338229 () Bool)

(assert (=> b!1449306 m!1338229))

(declare-fun m!1338231 () Bool)

(assert (=> b!1449306 m!1338231))

(assert (=> b!1449306 m!1338205))

(declare-fun m!1338233 () Bool)

(assert (=> b!1449305 m!1338233))

(assert (=> b!1449305 m!1338233))

(declare-fun m!1338235 () Bool)

(assert (=> b!1449305 m!1338235))

(declare-fun m!1338237 () Bool)

(assert (=> b!1449309 m!1338237))

(declare-fun m!1338239 () Bool)

(assert (=> b!1449309 m!1338239))

(assert (=> b!1449298 m!1338205))

(assert (=> b!1449298 m!1338205))

(declare-fun m!1338241 () Bool)

(assert (=> b!1449298 m!1338241))

(assert (=> b!1449298 m!1338241))

(assert (=> b!1449298 m!1338205))

(declare-fun m!1338243 () Bool)

(assert (=> b!1449298 m!1338243))

(assert (=> b!1449302 m!1338227))

(assert (=> b!1449302 m!1338201))

(assert (=> b!1449302 m!1338225))

(assert (=> b!1449302 m!1338205))

(assert (=> b!1449310 m!1338205))

(assert (=> b!1449310 m!1338205))

(declare-fun m!1338245 () Bool)

(assert (=> b!1449310 m!1338245))

(assert (=> b!1449316 m!1338205))

(assert (=> b!1449316 m!1338205))

(declare-fun m!1338247 () Bool)

(assert (=> b!1449316 m!1338247))

(declare-fun m!1338249 () Bool)

(assert (=> b!1449307 m!1338249))

(declare-fun m!1338251 () Bool)

(assert (=> b!1449304 m!1338251))

(check-sat (not b!1449307) (not b!1449303) (not b!1449311) (not b!1449306) (not b!1449313) (not b!1449309) (not b!1449299) (not b!1449304) (not b!1449298) (not b!1449316) (not b!1449305) (not b!1449310) (not start!125016))
(check-sat)
