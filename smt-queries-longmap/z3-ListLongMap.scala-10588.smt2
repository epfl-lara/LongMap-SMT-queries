; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124636 () Bool)

(assert start!124636)

(declare-fun b!1444237 () Bool)

(declare-fun e!813714 () Bool)

(declare-fun lt!633965 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444237 (= e!813714 (validKeyInArray!0 lt!633965))))

(declare-fun b!1444238 () Bool)

(declare-fun res!976359 () Bool)

(declare-fun e!813718 () Bool)

(assert (=> b!1444238 (=> (not res!976359) (not e!813718))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444238 (= res!976359 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444239 () Bool)

(declare-fun e!813715 () Bool)

(declare-fun e!813717 () Bool)

(assert (=> b!1444239 (= e!813715 e!813717)))

(declare-fun res!976346 () Bool)

(assert (=> b!1444239 (=> (not res!976346) (not e!813717))))

(declare-datatypes ((array!98062 0))(
  ( (array!98063 (arr!47320 (Array (_ BitVec 32) (_ BitVec 64))) (size!47872 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98062)

(assert (=> b!1444239 (= res!976346 (= (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633961 () array!98062)

(assert (=> b!1444239 (= lt!633961 (array!98063 (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47872 a!2862)))))

(declare-fun b!1444240 () Bool)

(declare-fun res!976354 () Bool)

(assert (=> b!1444240 (=> res!976354 e!813714)))

(declare-datatypes ((SeekEntryResult!11597 0))(
  ( (MissingZero!11597 (index!48780 (_ BitVec 32))) (Found!11597 (index!48781 (_ BitVec 32))) (Intermediate!11597 (undefined!12409 Bool) (index!48782 (_ BitVec 32)) (x!130473 (_ BitVec 32))) (Undefined!11597) (MissingVacant!11597 (index!48783 (_ BitVec 32))) )
))
(declare-fun lt!633962 () SeekEntryResult!11597)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11597)

(assert (=> b!1444240 (= res!976354 (not (= lt!633962 (seekEntryOrOpen!0 lt!633965 lt!633961 mask!2687))))))

(declare-fun b!1444241 () Bool)

(declare-fun e!813716 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11597)

(assert (=> b!1444241 (= e!813716 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633965 lt!633961 mask!2687) (seekEntryOrOpen!0 lt!633965 lt!633961 mask!2687)))))

(declare-fun b!1444242 () Bool)

(declare-fun res!976351 () Bool)

(assert (=> b!1444242 (=> res!976351 e!813714)))

(assert (=> b!1444242 (= res!976351 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444243 () Bool)

(declare-fun res!976355 () Bool)

(assert (=> b!1444243 (=> (not res!976355) (not e!813715))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444243 (= res!976355 (validKeyInArray!0 (select (arr!47320 a!2862) j!93)))))

(declare-fun res!976356 () Bool)

(assert (=> start!124636 (=> (not res!976356) (not e!813715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124636 (= res!976356 (validMask!0 mask!2687))))

(assert (=> start!124636 e!813715))

(assert (=> start!124636 true))

(declare-fun array_inv!36553 (array!98062) Bool)

(assert (=> start!124636 (array_inv!36553 a!2862)))

(declare-fun b!1444244 () Bool)

(declare-fun res!976352 () Bool)

(assert (=> b!1444244 (=> (not res!976352) (not e!813718))))

(assert (=> b!1444244 (= res!976352 e!813716)))

(declare-fun c!133459 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444244 (= c!133459 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444245 () Bool)

(declare-fun res!976360 () Bool)

(assert (=> b!1444245 (=> (not res!976360) (not e!813715))))

(assert (=> b!1444245 (= res!976360 (validKeyInArray!0 (select (arr!47320 a!2862) i!1006)))))

(declare-fun b!1444246 () Bool)

(declare-fun lt!633963 () SeekEntryResult!11597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11597)

(assert (=> b!1444246 (= e!813716 (= lt!633963 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633965 lt!633961 mask!2687)))))

(declare-fun b!1444247 () Bool)

(assert (=> b!1444247 (= e!813718 (not e!813714))))

(declare-fun res!976350 () Bool)

(assert (=> b!1444247 (=> res!976350 e!813714)))

(assert (=> b!1444247 (= res!976350 (or (not (= (select (arr!47320 a!2862) index!646) (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47320 a!2862) index!646) (select (arr!47320 a!2862) j!93)))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444247 (and (= lt!633962 (Found!11597 j!93)) (or (= (select (arr!47320 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47320 a!2862) intermediateBeforeIndex!19) (select (arr!47320 a!2862) j!93))))))

(assert (=> b!1444247 (= lt!633962 (seekEntryOrOpen!0 (select (arr!47320 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98062 (_ BitVec 32)) Bool)

(assert (=> b!1444247 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48531 0))(
  ( (Unit!48532) )
))
(declare-fun lt!633966 () Unit!48531)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48531)

(assert (=> b!1444247 (= lt!633966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444248 () Bool)

(declare-fun res!976353 () Bool)

(assert (=> b!1444248 (=> (not res!976353) (not e!813715))))

(assert (=> b!1444248 (= res!976353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444249 () Bool)

(declare-fun e!813719 () Bool)

(assert (=> b!1444249 (= e!813717 e!813719)))

(declare-fun res!976347 () Bool)

(assert (=> b!1444249 (=> (not res!976347) (not e!813719))))

(declare-fun lt!633964 () SeekEntryResult!11597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444249 (= res!976347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47320 a!2862) j!93) mask!2687) (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633964))))

(assert (=> b!1444249 (= lt!633964 (Intermediate!11597 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444250 () Bool)

(declare-fun res!976357 () Bool)

(assert (=> b!1444250 (=> (not res!976357) (not e!813715))))

(assert (=> b!1444250 (= res!976357 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47872 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47872 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47872 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444251 () Bool)

(declare-fun res!976358 () Bool)

(assert (=> b!1444251 (=> (not res!976358) (not e!813719))))

(assert (=> b!1444251 (= res!976358 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633964))))

(declare-fun b!1444252 () Bool)

(declare-fun res!976349 () Bool)

(assert (=> b!1444252 (=> (not res!976349) (not e!813715))))

(assert (=> b!1444252 (= res!976349 (and (= (size!47872 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47872 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47872 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444253 () Bool)

(declare-fun res!976345 () Bool)

(assert (=> b!1444253 (=> (not res!976345) (not e!813715))))

(declare-datatypes ((List!33899 0))(
  ( (Nil!33896) (Cons!33895 (h!35245 (_ BitVec 64)) (t!48585 List!33899)) )
))
(declare-fun arrayNoDuplicates!0 (array!98062 (_ BitVec 32) List!33899) Bool)

(assert (=> b!1444253 (= res!976345 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33896))))

(declare-fun b!1444254 () Bool)

(assert (=> b!1444254 (= e!813719 e!813718)))

(declare-fun res!976348 () Bool)

(assert (=> b!1444254 (=> (not res!976348) (not e!813718))))

(assert (=> b!1444254 (= res!976348 (= lt!633963 (Intermediate!11597 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444254 (= lt!633963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633965 mask!2687) lt!633965 lt!633961 mask!2687))))

(assert (=> b!1444254 (= lt!633965 (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124636 res!976356) b!1444252))

(assert (= (and b!1444252 res!976349) b!1444245))

(assert (= (and b!1444245 res!976360) b!1444243))

(assert (= (and b!1444243 res!976355) b!1444248))

(assert (= (and b!1444248 res!976353) b!1444253))

(assert (= (and b!1444253 res!976345) b!1444250))

(assert (= (and b!1444250 res!976357) b!1444239))

(assert (= (and b!1444239 res!976346) b!1444249))

(assert (= (and b!1444249 res!976347) b!1444251))

(assert (= (and b!1444251 res!976358) b!1444254))

(assert (= (and b!1444254 res!976348) b!1444244))

(assert (= (and b!1444244 c!133459) b!1444246))

(assert (= (and b!1444244 (not c!133459)) b!1444241))

(assert (= (and b!1444244 res!976352) b!1444238))

(assert (= (and b!1444238 res!976359) b!1444247))

(assert (= (and b!1444247 (not res!976350)) b!1444240))

(assert (= (and b!1444240 (not res!976354)) b!1444242))

(assert (= (and b!1444242 (not res!976351)) b!1444237))

(declare-fun m!1332777 () Bool)

(assert (=> b!1444253 m!1332777))

(declare-fun m!1332779 () Bool)

(assert (=> b!1444249 m!1332779))

(assert (=> b!1444249 m!1332779))

(declare-fun m!1332781 () Bool)

(assert (=> b!1444249 m!1332781))

(assert (=> b!1444249 m!1332781))

(assert (=> b!1444249 m!1332779))

(declare-fun m!1332783 () Bool)

(assert (=> b!1444249 m!1332783))

(declare-fun m!1332785 () Bool)

(assert (=> b!1444245 m!1332785))

(assert (=> b!1444245 m!1332785))

(declare-fun m!1332787 () Bool)

(assert (=> b!1444245 m!1332787))

(assert (=> b!1444243 m!1332779))

(assert (=> b!1444243 m!1332779))

(declare-fun m!1332789 () Bool)

(assert (=> b!1444243 m!1332789))

(declare-fun m!1332791 () Bool)

(assert (=> b!1444237 m!1332791))

(declare-fun m!1332793 () Bool)

(assert (=> start!124636 m!1332793))

(declare-fun m!1332795 () Bool)

(assert (=> start!124636 m!1332795))

(declare-fun m!1332797 () Bool)

(assert (=> b!1444239 m!1332797))

(declare-fun m!1332799 () Bool)

(assert (=> b!1444239 m!1332799))

(declare-fun m!1332801 () Bool)

(assert (=> b!1444248 m!1332801))

(declare-fun m!1332803 () Bool)

(assert (=> b!1444240 m!1332803))

(declare-fun m!1332805 () Bool)

(assert (=> b!1444254 m!1332805))

(assert (=> b!1444254 m!1332805))

(declare-fun m!1332807 () Bool)

(assert (=> b!1444254 m!1332807))

(assert (=> b!1444254 m!1332797))

(declare-fun m!1332809 () Bool)

(assert (=> b!1444254 m!1332809))

(declare-fun m!1332811 () Bool)

(assert (=> b!1444241 m!1332811))

(assert (=> b!1444241 m!1332803))

(declare-fun m!1332813 () Bool)

(assert (=> b!1444246 m!1332813))

(assert (=> b!1444251 m!1332779))

(assert (=> b!1444251 m!1332779))

(declare-fun m!1332815 () Bool)

(assert (=> b!1444251 m!1332815))

(declare-fun m!1332817 () Bool)

(assert (=> b!1444247 m!1332817))

(assert (=> b!1444247 m!1332797))

(declare-fun m!1332819 () Bool)

(assert (=> b!1444247 m!1332819))

(declare-fun m!1332821 () Bool)

(assert (=> b!1444247 m!1332821))

(declare-fun m!1332823 () Bool)

(assert (=> b!1444247 m!1332823))

(assert (=> b!1444247 m!1332779))

(declare-fun m!1332825 () Bool)

(assert (=> b!1444247 m!1332825))

(declare-fun m!1332827 () Bool)

(assert (=> b!1444247 m!1332827))

(assert (=> b!1444247 m!1332779))

(check-sat (not start!124636) (not b!1444249) (not b!1444243) (not b!1444248) (not b!1444253) (not b!1444237) (not b!1444247) (not b!1444251) (not b!1444241) (not b!1444245) (not b!1444246) (not b!1444254) (not b!1444240))
(check-sat)
