; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124850 () Bool)

(assert start!124850)

(declare-fun b!1449453 () Bool)

(declare-fun e!816254 () Bool)

(declare-fun e!816246 () Bool)

(assert (=> b!1449453 (= e!816254 e!816246)))

(declare-fun res!980907 () Bool)

(assert (=> b!1449453 (=> (not res!980907) (not e!816246))))

(declare-datatypes ((array!98298 0))(
  ( (array!98299 (arr!47437 (Array (_ BitVec 32) (_ BitVec 64))) (size!47987 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98298)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11689 0))(
  ( (MissingZero!11689 (index!49148 (_ BitVec 32))) (Found!11689 (index!49149 (_ BitVec 32))) (Intermediate!11689 (undefined!12501 Bool) (index!49150 (_ BitVec 32)) (x!130810 (_ BitVec 32))) (Undefined!11689) (MissingVacant!11689 (index!49151 (_ BitVec 32))) )
))
(declare-fun lt!635906 () SeekEntryResult!11689)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98298 (_ BitVec 32)) SeekEntryResult!11689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449453 (= res!980907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47437 a!2862) j!93) mask!2687) (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!635906))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449453 (= lt!635906 (Intermediate!11689 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449454 () Bool)

(declare-fun res!980896 () Bool)

(declare-fun e!816250 () Bool)

(assert (=> b!1449454 (=> (not res!980896) (not e!816250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98298 (_ BitVec 32)) Bool)

(assert (=> b!1449454 (= res!980896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!980893 () Bool)

(assert (=> start!124850 (=> (not res!980893) (not e!816250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124850 (= res!980893 (validMask!0 mask!2687))))

(assert (=> start!124850 e!816250))

(assert (=> start!124850 true))

(declare-fun array_inv!36465 (array!98298) Bool)

(assert (=> start!124850 (array_inv!36465 a!2862)))

(declare-fun b!1449455 () Bool)

(declare-fun res!980897 () Bool)

(assert (=> b!1449455 (=> (not res!980897) (not e!816250))))

(declare-datatypes ((List!33938 0))(
  ( (Nil!33935) (Cons!33934 (h!35284 (_ BitVec 64)) (t!48632 List!33938)) )
))
(declare-fun arrayNoDuplicates!0 (array!98298 (_ BitVec 32) List!33938) Bool)

(assert (=> b!1449455 (= res!980897 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33935))))

(declare-fun b!1449456 () Bool)

(declare-fun e!816245 () Bool)

(assert (=> b!1449456 (= e!816245 true)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!635904 () SeekEntryResult!11689)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98298 (_ BitVec 32)) SeekEntryResult!11689)

(assert (=> b!1449456 (= lt!635904 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47437 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449457 () Bool)

(declare-fun res!980904 () Bool)

(declare-fun e!816249 () Bool)

(assert (=> b!1449457 (=> (not res!980904) (not e!816249))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449457 (= res!980904 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449458 () Bool)

(declare-fun res!980900 () Bool)

(assert (=> b!1449458 (=> (not res!980900) (not e!816249))))

(declare-fun e!816247 () Bool)

(assert (=> b!1449458 (= res!980900 e!816247)))

(declare-fun c!133791 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449458 (= c!133791 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!635909 () array!98298)

(declare-fun b!1449459 () Bool)

(declare-fun lt!635908 () (_ BitVec 64))

(declare-fun lt!635910 () SeekEntryResult!11689)

(assert (=> b!1449459 (= e!816247 (= lt!635910 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635908 lt!635909 mask!2687)))))

(declare-fun b!1449460 () Bool)

(assert (=> b!1449460 (= e!816250 e!816254)))

(declare-fun res!980901 () Bool)

(assert (=> b!1449460 (=> (not res!980901) (not e!816254))))

(assert (=> b!1449460 (= res!980901 (= (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449460 (= lt!635909 (array!98299 (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47987 a!2862)))))

(declare-fun b!1449461 () Bool)

(declare-fun res!980899 () Bool)

(assert (=> b!1449461 (=> (not res!980899) (not e!816250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449461 (= res!980899 (validKeyInArray!0 (select (arr!47437 a!2862) i!1006)))))

(declare-fun b!1449462 () Bool)

(declare-fun res!980898 () Bool)

(assert (=> b!1449462 (=> (not res!980898) (not e!816250))))

(assert (=> b!1449462 (= res!980898 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47987 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47987 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47987 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449463 () Bool)

(assert (=> b!1449463 (= e!816249 (not e!816245))))

(declare-fun res!980905 () Bool)

(assert (=> b!1449463 (=> res!980905 e!816245)))

(assert (=> b!1449463 (= res!980905 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816251 () Bool)

(assert (=> b!1449463 e!816251))

(declare-fun res!980902 () Bool)

(assert (=> b!1449463 (=> (not res!980902) (not e!816251))))

(declare-fun lt!635907 () SeekEntryResult!11689)

(assert (=> b!1449463 (= res!980902 (and (= lt!635907 (Found!11689 j!93)) (or (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) (select (arr!47437 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98298 (_ BitVec 32)) SeekEntryResult!11689)

(assert (=> b!1449463 (= lt!635907 (seekEntryOrOpen!0 (select (arr!47437 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449463 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48874 0))(
  ( (Unit!48875) )
))
(declare-fun lt!635905 () Unit!48874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48874)

(assert (=> b!1449463 (= lt!635905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449464 () Bool)

(assert (=> b!1449464 (= e!816247 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635908 lt!635909 mask!2687) (seekEntryOrOpen!0 lt!635908 lt!635909 mask!2687)))))

(declare-fun b!1449465 () Bool)

(declare-fun res!980895 () Bool)

(assert (=> b!1449465 (=> (not res!980895) (not e!816250))))

(assert (=> b!1449465 (= res!980895 (and (= (size!47987 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47987 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47987 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449466 () Bool)

(declare-fun e!816253 () Bool)

(declare-fun e!816248 () Bool)

(assert (=> b!1449466 (= e!816253 e!816248)))

(declare-fun res!980892 () Bool)

(assert (=> b!1449466 (=> (not res!980892) (not e!816248))))

(assert (=> b!1449466 (= res!980892 (= lt!635907 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449467 () Bool)

(declare-fun res!980903 () Bool)

(assert (=> b!1449467 (=> (not res!980903) (not e!816246))))

(assert (=> b!1449467 (= res!980903 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!635906))))

(declare-fun b!1449468 () Bool)

(assert (=> b!1449468 (= e!816251 e!816253)))

(declare-fun res!980894 () Bool)

(assert (=> b!1449468 (=> res!980894 e!816253)))

(assert (=> b!1449468 (= res!980894 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449469 () Bool)

(assert (=> b!1449469 (= e!816246 e!816249)))

(declare-fun res!980908 () Bool)

(assert (=> b!1449469 (=> (not res!980908) (not e!816249))))

(assert (=> b!1449469 (= res!980908 (= lt!635910 (Intermediate!11689 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449469 (= lt!635910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635908 mask!2687) lt!635908 lt!635909 mask!2687))))

(assert (=> b!1449469 (= lt!635908 (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449470 () Bool)

(declare-fun res!980906 () Bool)

(assert (=> b!1449470 (=> (not res!980906) (not e!816250))))

(assert (=> b!1449470 (= res!980906 (validKeyInArray!0 (select (arr!47437 a!2862) j!93)))))

(declare-fun b!1449471 () Bool)

(assert (=> b!1449471 (= e!816248 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124850 res!980893) b!1449465))

(assert (= (and b!1449465 res!980895) b!1449461))

(assert (= (and b!1449461 res!980899) b!1449470))

(assert (= (and b!1449470 res!980906) b!1449454))

(assert (= (and b!1449454 res!980896) b!1449455))

(assert (= (and b!1449455 res!980897) b!1449462))

(assert (= (and b!1449462 res!980898) b!1449460))

(assert (= (and b!1449460 res!980901) b!1449453))

(assert (= (and b!1449453 res!980907) b!1449467))

(assert (= (and b!1449467 res!980903) b!1449469))

(assert (= (and b!1449469 res!980908) b!1449458))

(assert (= (and b!1449458 c!133791) b!1449459))

(assert (= (and b!1449458 (not c!133791)) b!1449464))

(assert (= (and b!1449458 res!980900) b!1449457))

(assert (= (and b!1449457 res!980904) b!1449463))

(assert (= (and b!1449463 res!980902) b!1449468))

(assert (= (and b!1449468 (not res!980894)) b!1449466))

(assert (= (and b!1449466 res!980892) b!1449471))

(assert (= (and b!1449463 (not res!980905)) b!1449456))

(declare-fun m!1338163 () Bool)

(assert (=> b!1449463 m!1338163))

(declare-fun m!1338165 () Bool)

(assert (=> b!1449463 m!1338165))

(declare-fun m!1338167 () Bool)

(assert (=> b!1449463 m!1338167))

(declare-fun m!1338169 () Bool)

(assert (=> b!1449463 m!1338169))

(declare-fun m!1338171 () Bool)

(assert (=> b!1449463 m!1338171))

(declare-fun m!1338173 () Bool)

(assert (=> b!1449463 m!1338173))

(declare-fun m!1338175 () Bool)

(assert (=> b!1449463 m!1338175))

(declare-fun m!1338177 () Bool)

(assert (=> b!1449463 m!1338177))

(assert (=> b!1449463 m!1338173))

(declare-fun m!1338179 () Bool)

(assert (=> b!1449464 m!1338179))

(declare-fun m!1338181 () Bool)

(assert (=> b!1449464 m!1338181))

(declare-fun m!1338183 () Bool)

(assert (=> b!1449459 m!1338183))

(assert (=> b!1449467 m!1338173))

(assert (=> b!1449467 m!1338173))

(declare-fun m!1338185 () Bool)

(assert (=> b!1449467 m!1338185))

(assert (=> b!1449453 m!1338173))

(assert (=> b!1449453 m!1338173))

(declare-fun m!1338187 () Bool)

(assert (=> b!1449453 m!1338187))

(assert (=> b!1449453 m!1338187))

(assert (=> b!1449453 m!1338173))

(declare-fun m!1338189 () Bool)

(assert (=> b!1449453 m!1338189))

(assert (=> b!1449470 m!1338173))

(assert (=> b!1449470 m!1338173))

(declare-fun m!1338191 () Bool)

(assert (=> b!1449470 m!1338191))

(declare-fun m!1338193 () Bool)

(assert (=> b!1449469 m!1338193))

(assert (=> b!1449469 m!1338193))

(declare-fun m!1338195 () Bool)

(assert (=> b!1449469 m!1338195))

(assert (=> b!1449469 m!1338165))

(declare-fun m!1338197 () Bool)

(assert (=> b!1449469 m!1338197))

(assert (=> b!1449466 m!1338173))

(assert (=> b!1449466 m!1338173))

(declare-fun m!1338199 () Bool)

(assert (=> b!1449466 m!1338199))

(declare-fun m!1338201 () Bool)

(assert (=> b!1449455 m!1338201))

(declare-fun m!1338203 () Bool)

(assert (=> b!1449454 m!1338203))

(assert (=> b!1449468 m!1338171))

(assert (=> b!1449468 m!1338165))

(assert (=> b!1449468 m!1338169))

(assert (=> b!1449468 m!1338173))

(assert (=> b!1449460 m!1338165))

(declare-fun m!1338205 () Bool)

(assert (=> b!1449460 m!1338205))

(declare-fun m!1338207 () Bool)

(assert (=> start!124850 m!1338207))

(declare-fun m!1338209 () Bool)

(assert (=> start!124850 m!1338209))

(declare-fun m!1338211 () Bool)

(assert (=> b!1449461 m!1338211))

(assert (=> b!1449461 m!1338211))

(declare-fun m!1338213 () Bool)

(assert (=> b!1449461 m!1338213))

(assert (=> b!1449456 m!1338173))

(assert (=> b!1449456 m!1338173))

(declare-fun m!1338215 () Bool)

(assert (=> b!1449456 m!1338215))

(push 1)

