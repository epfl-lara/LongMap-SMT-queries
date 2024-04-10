; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124744 () Bool)

(assert start!124744)

(declare-fun lt!634795 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814659 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98192 0))(
  ( (array!98193 (arr!47384 (Array (_ BitVec 32) (_ BitVec 64))) (size!47934 (_ BitVec 32))) )
))
(declare-fun lt!634796 () array!98192)

(declare-datatypes ((SeekEntryResult!11636 0))(
  ( (MissingZero!11636 (index!48936 (_ BitVec 32))) (Found!11636 (index!48937 (_ BitVec 32))) (Intermediate!11636 (undefined!12448 Bool) (index!48938 (_ BitVec 32)) (x!130621 (_ BitVec 32))) (Undefined!11636) (MissingVacant!11636 (index!48939 (_ BitVec 32))) )
))
(declare-fun lt!634791 () SeekEntryResult!11636)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1446432 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98192 (_ BitVec 32)) SeekEntryResult!11636)

(assert (=> b!1446432 (= e!814659 (= lt!634791 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634795 lt!634796 mask!2687)))))

(declare-fun b!1446433 () Bool)

(declare-fun e!814657 () Bool)

(declare-fun e!814655 () Bool)

(assert (=> b!1446433 (= e!814657 e!814655)))

(declare-fun res!978205 () Bool)

(assert (=> b!1446433 (=> (not res!978205) (not e!814655))))

(declare-fun lt!634797 () SeekEntryResult!11636)

(declare-fun a!2862 () array!98192)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446433 (= res!978205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47384 a!2862) j!93) mask!2687) (select (arr!47384 a!2862) j!93) a!2862 mask!2687) lt!634797))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446433 (= lt!634797 (Intermediate!11636 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446434 () Bool)

(declare-fun res!978204 () Bool)

(assert (=> b!1446434 (=> (not res!978204) (not e!814655))))

(assert (=> b!1446434 (= res!978204 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47384 a!2862) j!93) a!2862 mask!2687) lt!634797))))

(declare-fun b!1446435 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98192 (_ BitVec 32)) SeekEntryResult!11636)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98192 (_ BitVec 32)) SeekEntryResult!11636)

(assert (=> b!1446435 (= e!814659 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634795 lt!634796 mask!2687) (seekEntryOrOpen!0 lt!634795 lt!634796 mask!2687)))))

(declare-fun res!978197 () Bool)

(declare-fun e!814658 () Bool)

(assert (=> start!124744 (=> (not res!978197) (not e!814658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124744 (= res!978197 (validMask!0 mask!2687))))

(assert (=> start!124744 e!814658))

(assert (=> start!124744 true))

(declare-fun array_inv!36412 (array!98192) Bool)

(assert (=> start!124744 (array_inv!36412 a!2862)))

(declare-fun b!1446436 () Bool)

(declare-fun res!978192 () Bool)

(assert (=> b!1446436 (=> (not res!978192) (not e!814658))))

(declare-datatypes ((List!33885 0))(
  ( (Nil!33882) (Cons!33881 (h!35231 (_ BitVec 64)) (t!48579 List!33885)) )
))
(declare-fun arrayNoDuplicates!0 (array!98192 (_ BitVec 32) List!33885) Bool)

(assert (=> b!1446436 (= res!978192 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33882))))

(declare-fun b!1446437 () Bool)

(declare-fun res!978191 () Bool)

(declare-fun e!814661 () Bool)

(assert (=> b!1446437 (=> (not res!978191) (not e!814661))))

(assert (=> b!1446437 (= res!978191 e!814659)))

(declare-fun c!133632 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446437 (= c!133632 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446438 () Bool)

(declare-fun e!814656 () Bool)

(declare-fun e!814664 () Bool)

(assert (=> b!1446438 (= e!814656 e!814664)))

(declare-fun res!978196 () Bool)

(assert (=> b!1446438 (=> res!978196 e!814664)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446438 (= res!978196 (or (and (= (select (arr!47384 a!2862) index!646) (select (store (arr!47384 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47384 a!2862) index!646) (select (arr!47384 a!2862) j!93))) (not (= (select (arr!47384 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446439 () Bool)

(declare-fun e!814663 () Bool)

(assert (=> b!1446439 (= e!814664 e!814663)))

(declare-fun res!978193 () Bool)

(assert (=> b!1446439 (=> (not res!978193) (not e!814663))))

(declare-fun lt!634794 () SeekEntryResult!11636)

(assert (=> b!1446439 (= res!978193 (= lt!634794 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47384 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446440 () Bool)

(declare-fun res!978202 () Bool)

(assert (=> b!1446440 (=> (not res!978202) (not e!814661))))

(assert (=> b!1446440 (= res!978202 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446441 () Bool)

(declare-fun e!814660 () Bool)

(assert (=> b!1446441 (= e!814661 (not e!814660))))

(declare-fun res!978198 () Bool)

(assert (=> b!1446441 (=> res!978198 e!814660)))

(assert (=> b!1446441 (= res!978198 (or (and (= (select (arr!47384 a!2862) index!646) (select (store (arr!47384 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47384 a!2862) index!646) (select (arr!47384 a!2862) j!93))) (not (= (select (arr!47384 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47384 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446441 e!814656))

(declare-fun res!978199 () Bool)

(assert (=> b!1446441 (=> (not res!978199) (not e!814656))))

(assert (=> b!1446441 (= res!978199 (and (= lt!634794 (Found!11636 j!93)) (or (= (select (arr!47384 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47384 a!2862) intermediateBeforeIndex!19) (select (arr!47384 a!2862) j!93)))))))

(assert (=> b!1446441 (= lt!634794 (seekEntryOrOpen!0 (select (arr!47384 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98192 (_ BitVec 32)) Bool)

(assert (=> b!1446441 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48768 0))(
  ( (Unit!48769) )
))
(declare-fun lt!634793 () Unit!48768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48768)

(assert (=> b!1446441 (= lt!634793 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446442 () Bool)

(assert (=> b!1446442 (= e!814660 true)))

(declare-fun lt!634792 () SeekEntryResult!11636)

(assert (=> b!1446442 (= lt!634792 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47384 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446443 () Bool)

(assert (=> b!1446443 (= e!814658 e!814657)))

(declare-fun res!978194 () Bool)

(assert (=> b!1446443 (=> (not res!978194) (not e!814657))))

(assert (=> b!1446443 (= res!978194 (= (select (store (arr!47384 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446443 (= lt!634796 (array!98193 (store (arr!47384 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47934 a!2862)))))

(declare-fun b!1446444 () Bool)

(declare-fun res!978200 () Bool)

(assert (=> b!1446444 (=> (not res!978200) (not e!814658))))

(assert (=> b!1446444 (= res!978200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446445 () Bool)

(declare-fun res!978201 () Bool)

(assert (=> b!1446445 (=> (not res!978201) (not e!814658))))

(assert (=> b!1446445 (= res!978201 (and (= (size!47934 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47934 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47934 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446446 () Bool)

(declare-fun res!978203 () Bool)

(assert (=> b!1446446 (=> (not res!978203) (not e!814658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446446 (= res!978203 (validKeyInArray!0 (select (arr!47384 a!2862) j!93)))))

(declare-fun b!1446447 () Bool)

(assert (=> b!1446447 (= e!814655 e!814661)))

(declare-fun res!978189 () Bool)

(assert (=> b!1446447 (=> (not res!978189) (not e!814661))))

(assert (=> b!1446447 (= res!978189 (= lt!634791 (Intermediate!11636 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446447 (= lt!634791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634795 mask!2687) lt!634795 lt!634796 mask!2687))))

(assert (=> b!1446447 (= lt!634795 (select (store (arr!47384 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446448 () Bool)

(assert (=> b!1446448 (= e!814663 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446449 () Bool)

(declare-fun res!978190 () Bool)

(assert (=> b!1446449 (=> (not res!978190) (not e!814658))))

(assert (=> b!1446449 (= res!978190 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47934 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47934 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47934 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446450 () Bool)

(declare-fun res!978195 () Bool)

(assert (=> b!1446450 (=> (not res!978195) (not e!814658))))

(assert (=> b!1446450 (= res!978195 (validKeyInArray!0 (select (arr!47384 a!2862) i!1006)))))

(assert (= (and start!124744 res!978197) b!1446445))

(assert (= (and b!1446445 res!978201) b!1446450))

(assert (= (and b!1446450 res!978195) b!1446446))

(assert (= (and b!1446446 res!978203) b!1446444))

(assert (= (and b!1446444 res!978200) b!1446436))

(assert (= (and b!1446436 res!978192) b!1446449))

(assert (= (and b!1446449 res!978190) b!1446443))

(assert (= (and b!1446443 res!978194) b!1446433))

(assert (= (and b!1446433 res!978205) b!1446434))

(assert (= (and b!1446434 res!978204) b!1446447))

(assert (= (and b!1446447 res!978189) b!1446437))

(assert (= (and b!1446437 c!133632) b!1446432))

(assert (= (and b!1446437 (not c!133632)) b!1446435))

(assert (= (and b!1446437 res!978191) b!1446440))

(assert (= (and b!1446440 res!978202) b!1446441))

(assert (= (and b!1446441 res!978199) b!1446438))

(assert (= (and b!1446438 (not res!978196)) b!1446439))

(assert (= (and b!1446439 res!978193) b!1446448))

(assert (= (and b!1446441 (not res!978198)) b!1446442))

(declare-fun m!1335301 () Bool)

(assert (=> b!1446438 m!1335301))

(declare-fun m!1335303 () Bool)

(assert (=> b!1446438 m!1335303))

(declare-fun m!1335305 () Bool)

(assert (=> b!1446438 m!1335305))

(declare-fun m!1335307 () Bool)

(assert (=> b!1446438 m!1335307))

(declare-fun m!1335309 () Bool)

(assert (=> b!1446450 m!1335309))

(assert (=> b!1446450 m!1335309))

(declare-fun m!1335311 () Bool)

(assert (=> b!1446450 m!1335311))

(assert (=> b!1446434 m!1335307))

(assert (=> b!1446434 m!1335307))

(declare-fun m!1335313 () Bool)

(assert (=> b!1446434 m!1335313))

(declare-fun m!1335315 () Bool)

(assert (=> b!1446444 m!1335315))

(declare-fun m!1335317 () Bool)

(assert (=> b!1446432 m!1335317))

(assert (=> b!1446446 m!1335307))

(assert (=> b!1446446 m!1335307))

(declare-fun m!1335319 () Bool)

(assert (=> b!1446446 m!1335319))

(assert (=> b!1446439 m!1335307))

(assert (=> b!1446439 m!1335307))

(declare-fun m!1335321 () Bool)

(assert (=> b!1446439 m!1335321))

(assert (=> b!1446442 m!1335307))

(assert (=> b!1446442 m!1335307))

(declare-fun m!1335323 () Bool)

(assert (=> b!1446442 m!1335323))

(declare-fun m!1335325 () Bool)

(assert (=> b!1446447 m!1335325))

(assert (=> b!1446447 m!1335325))

(declare-fun m!1335327 () Bool)

(assert (=> b!1446447 m!1335327))

(assert (=> b!1446447 m!1335303))

(declare-fun m!1335329 () Bool)

(assert (=> b!1446447 m!1335329))

(assert (=> b!1446443 m!1335303))

(declare-fun m!1335331 () Bool)

(assert (=> b!1446443 m!1335331))

(declare-fun m!1335333 () Bool)

(assert (=> b!1446436 m!1335333))

(declare-fun m!1335335 () Bool)

(assert (=> start!124744 m!1335335))

(declare-fun m!1335337 () Bool)

(assert (=> start!124744 m!1335337))

(declare-fun m!1335339 () Bool)

(assert (=> b!1446441 m!1335339))

(assert (=> b!1446441 m!1335303))

(declare-fun m!1335341 () Bool)

(assert (=> b!1446441 m!1335341))

(assert (=> b!1446441 m!1335305))

(assert (=> b!1446441 m!1335301))

(assert (=> b!1446441 m!1335307))

(declare-fun m!1335343 () Bool)

(assert (=> b!1446441 m!1335343))

(declare-fun m!1335345 () Bool)

(assert (=> b!1446441 m!1335345))

(assert (=> b!1446441 m!1335307))

(declare-fun m!1335347 () Bool)

(assert (=> b!1446435 m!1335347))

(declare-fun m!1335349 () Bool)

(assert (=> b!1446435 m!1335349))

(assert (=> b!1446433 m!1335307))

(assert (=> b!1446433 m!1335307))

(declare-fun m!1335351 () Bool)

(assert (=> b!1446433 m!1335351))

(assert (=> b!1446433 m!1335351))

(assert (=> b!1446433 m!1335307))

(declare-fun m!1335353 () Bool)

(assert (=> b!1446433 m!1335353))

(push 1)

