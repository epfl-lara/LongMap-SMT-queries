; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125544 () Bool)

(assert start!125544)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641030 () (_ BitVec 64))

(declare-fun e!823046 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1463959 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!98830 0))(
  ( (array!98831 (arr!47698 (Array (_ BitVec 32) (_ BitVec 64))) (size!48249 (_ BitVec 32))) )
))
(declare-fun lt!641026 () array!98830)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11847 0))(
  ( (MissingZero!11847 (index!49780 (_ BitVec 32))) (Found!11847 (index!49781 (_ BitVec 32))) (Intermediate!11847 (undefined!12659 Bool) (index!49782 (_ BitVec 32)) (x!131561 (_ BitVec 32))) (Undefined!11847) (MissingVacant!11847 (index!49783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11847)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1463959 (= e!823046 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641030 lt!641026 mask!2687) (seekEntryOrOpen!0 lt!641030 lt!641026 mask!2687)))))

(declare-fun b!1463961 () Bool)

(declare-fun res!992333 () Bool)

(declare-fun e!823045 () Bool)

(assert (=> b!1463961 (=> (not res!992333) (not e!823045))))

(declare-fun lt!641029 () SeekEntryResult!11847)

(declare-fun a!2862 () array!98830)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98830 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1463961 (= res!992333 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641029))))

(declare-fun b!1463962 () Bool)

(declare-fun res!992335 () Bool)

(declare-fun e!823053 () Bool)

(assert (=> b!1463962 (=> res!992335 e!823053)))

(declare-fun lt!641031 () (_ BitVec 32))

(assert (=> b!1463962 (= res!992335 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641031 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641029)))))

(declare-fun lt!641027 () SeekEntryResult!11847)

(declare-fun b!1463963 () Bool)

(assert (=> b!1463963 (= e!823046 (= lt!641027 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641030 lt!641026 mask!2687)))))

(declare-fun b!1463964 () Bool)

(declare-fun res!992328 () Bool)

(declare-fun e!823051 () Bool)

(assert (=> b!1463964 (=> (not res!992328) (not e!823051))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463964 (= res!992328 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463965 () Bool)

(declare-fun res!992336 () Bool)

(declare-fun e!823047 () Bool)

(assert (=> b!1463965 (=> (not res!992336) (not e!823047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463965 (= res!992336 (validKeyInArray!0 (select (arr!47698 a!2862) i!1006)))))

(declare-fun b!1463966 () Bool)

(declare-fun res!992334 () Bool)

(assert (=> b!1463966 (=> (not res!992334) (not e!823047))))

(assert (=> b!1463966 (= res!992334 (and (= (size!48249 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48249 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48249 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463967 () Bool)

(declare-fun res!992337 () Bool)

(assert (=> b!1463967 (=> (not res!992337) (not e!823047))))

(assert (=> b!1463967 (= res!992337 (validKeyInArray!0 (select (arr!47698 a!2862) j!93)))))

(declare-fun b!1463968 () Bool)

(declare-fun res!992342 () Bool)

(assert (=> b!1463968 (=> (not res!992342) (not e!823047))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463968 (= res!992342 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48249 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48249 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48249 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463969 () Bool)

(declare-fun e!823052 () Bool)

(assert (=> b!1463969 (= e!823052 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641031 intermediateAfterIndex!19 lt!641030 lt!641026 mask!2687) (seekEntryOrOpen!0 lt!641030 lt!641026 mask!2687))))))

(declare-fun b!1463970 () Bool)

(declare-fun e!823049 () Bool)

(assert (=> b!1463970 (= e!823049 e!823045)))

(declare-fun res!992344 () Bool)

(assert (=> b!1463970 (=> (not res!992344) (not e!823045))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463970 (= res!992344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47698 a!2862) j!93) mask!2687) (select (arr!47698 a!2862) j!93) a!2862 mask!2687) lt!641029))))

(assert (=> b!1463970 (= lt!641029 (Intermediate!11847 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!823044 () Bool)

(declare-fun b!1463971 () Bool)

(assert (=> b!1463971 (= e!823044 (or (= (select (arr!47698 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47698 a!2862) intermediateBeforeIndex!19) (select (arr!47698 a!2862) j!93))))))

(declare-fun b!1463972 () Bool)

(declare-fun res!992340 () Bool)

(assert (=> b!1463972 (=> (not res!992340) (not e!823044))))

(assert (=> b!1463972 (= res!992340 (= (seekEntryOrOpen!0 (select (arr!47698 a!2862) j!93) a!2862 mask!2687) (Found!11847 j!93)))))

(declare-fun b!1463973 () Bool)

(assert (=> b!1463973 (= e!823045 e!823051)))

(declare-fun res!992341 () Bool)

(assert (=> b!1463973 (=> (not res!992341) (not e!823051))))

(assert (=> b!1463973 (= res!992341 (= lt!641027 (Intermediate!11847 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1463973 (= lt!641027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641030 mask!2687) lt!641030 lt!641026 mask!2687))))

(assert (=> b!1463973 (= lt!641030 (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463974 () Bool)

(assert (=> b!1463974 (= e!823047 e!823049)))

(declare-fun res!992331 () Bool)

(assert (=> b!1463974 (=> (not res!992331) (not e!823049))))

(assert (=> b!1463974 (= res!992331 (= (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463974 (= lt!641026 (array!98831 (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48249 a!2862)))))

(declare-fun b!1463975 () Bool)

(declare-fun res!992330 () Bool)

(assert (=> b!1463975 (=> (not res!992330) (not e!823047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98830 (_ BitVec 32)) Bool)

(assert (=> b!1463975 (= res!992330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463976 () Bool)

(declare-fun res!992343 () Bool)

(assert (=> b!1463976 (=> (not res!992343) (not e!823047))))

(declare-datatypes ((List!34186 0))(
  ( (Nil!34183) (Cons!34182 (h!35546 (_ BitVec 64)) (t!48872 List!34186)) )
))
(declare-fun arrayNoDuplicates!0 (array!98830 (_ BitVec 32) List!34186) Bool)

(assert (=> b!1463976 (= res!992343 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34183))))

(declare-fun b!1463977 () Bool)

(assert (=> b!1463977 (= e!823053 true)))

(declare-fun lt!641032 () Bool)

(assert (=> b!1463977 (= lt!641032 e!823052)))

(declare-fun c!135336 () Bool)

(assert (=> b!1463977 (= c!135336 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463978 () Bool)

(declare-fun res!992332 () Bool)

(assert (=> b!1463978 (=> (not res!992332) (not e!823051))))

(assert (=> b!1463978 (= res!992332 e!823046)))

(declare-fun c!135337 () Bool)

(assert (=> b!1463978 (= c!135337 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463979 () Bool)

(declare-fun e!823048 () Bool)

(assert (=> b!1463979 (= e!823051 (not e!823048))))

(declare-fun res!992339 () Bool)

(assert (=> b!1463979 (=> res!992339 e!823048)))

(assert (=> b!1463979 (= res!992339 (or (and (= (select (arr!47698 a!2862) index!646) (select (store (arr!47698 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47698 a!2862) index!646) (select (arr!47698 a!2862) j!93))) (= (select (arr!47698 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463979 e!823044))

(declare-fun res!992338 () Bool)

(assert (=> b!1463979 (=> (not res!992338) (not e!823044))))

(assert (=> b!1463979 (= res!992338 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49223 0))(
  ( (Unit!49224) )
))
(declare-fun lt!641028 () Unit!49223)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49223)

(assert (=> b!1463979 (= lt!641028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463980 () Bool)

(assert (=> b!1463980 (= e!823048 e!823053)))

(declare-fun res!992329 () Bool)

(assert (=> b!1463980 (=> res!992329 e!823053)))

(assert (=> b!1463980 (= res!992329 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641031 #b00000000000000000000000000000000) (bvsge lt!641031 (size!48249 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463980 (= lt!641031 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1463960 () Bool)

(assert (=> b!1463960 (= e!823052 (not (= lt!641027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641031 lt!641030 lt!641026 mask!2687))))))

(declare-fun res!992345 () Bool)

(assert (=> start!125544 (=> (not res!992345) (not e!823047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125544 (= res!992345 (validMask!0 mask!2687))))

(assert (=> start!125544 e!823047))

(assert (=> start!125544 true))

(declare-fun array_inv!36979 (array!98830) Bool)

(assert (=> start!125544 (array_inv!36979 a!2862)))

(assert (= (and start!125544 res!992345) b!1463966))

(assert (= (and b!1463966 res!992334) b!1463965))

(assert (= (and b!1463965 res!992336) b!1463967))

(assert (= (and b!1463967 res!992337) b!1463975))

(assert (= (and b!1463975 res!992330) b!1463976))

(assert (= (and b!1463976 res!992343) b!1463968))

(assert (= (and b!1463968 res!992342) b!1463974))

(assert (= (and b!1463974 res!992331) b!1463970))

(assert (= (and b!1463970 res!992344) b!1463961))

(assert (= (and b!1463961 res!992333) b!1463973))

(assert (= (and b!1463973 res!992341) b!1463978))

(assert (= (and b!1463978 c!135337) b!1463963))

(assert (= (and b!1463978 (not c!135337)) b!1463959))

(assert (= (and b!1463978 res!992332) b!1463964))

(assert (= (and b!1463964 res!992328) b!1463979))

(assert (= (and b!1463979 res!992338) b!1463972))

(assert (= (and b!1463972 res!992340) b!1463971))

(assert (= (and b!1463979 (not res!992339)) b!1463980))

(assert (= (and b!1463980 (not res!992329)) b!1463962))

(assert (= (and b!1463962 (not res!992335)) b!1463977))

(assert (= (and b!1463977 c!135336) b!1463960))

(assert (= (and b!1463977 (not c!135336)) b!1463969))

(declare-fun m!1351417 () Bool)

(assert (=> b!1463973 m!1351417))

(assert (=> b!1463973 m!1351417))

(declare-fun m!1351419 () Bool)

(assert (=> b!1463973 m!1351419))

(declare-fun m!1351421 () Bool)

(assert (=> b!1463973 m!1351421))

(declare-fun m!1351423 () Bool)

(assert (=> b!1463973 m!1351423))

(declare-fun m!1351425 () Bool)

(assert (=> b!1463962 m!1351425))

(assert (=> b!1463962 m!1351425))

(declare-fun m!1351427 () Bool)

(assert (=> b!1463962 m!1351427))

(declare-fun m!1351429 () Bool)

(assert (=> b!1463976 m!1351429))

(declare-fun m!1351431 () Bool)

(assert (=> b!1463963 m!1351431))

(declare-fun m!1351433 () Bool)

(assert (=> b!1463960 m!1351433))

(declare-fun m!1351435 () Bool)

(assert (=> b!1463965 m!1351435))

(assert (=> b!1463965 m!1351435))

(declare-fun m!1351437 () Bool)

(assert (=> b!1463965 m!1351437))

(declare-fun m!1351439 () Bool)

(assert (=> start!125544 m!1351439))

(declare-fun m!1351441 () Bool)

(assert (=> start!125544 m!1351441))

(declare-fun m!1351443 () Bool)

(assert (=> b!1463969 m!1351443))

(declare-fun m!1351445 () Bool)

(assert (=> b!1463969 m!1351445))

(assert (=> b!1463974 m!1351421))

(declare-fun m!1351447 () Bool)

(assert (=> b!1463974 m!1351447))

(assert (=> b!1463961 m!1351425))

(assert (=> b!1463961 m!1351425))

(declare-fun m!1351449 () Bool)

(assert (=> b!1463961 m!1351449))

(declare-fun m!1351451 () Bool)

(assert (=> b!1463980 m!1351451))

(declare-fun m!1351453 () Bool)

(assert (=> b!1463959 m!1351453))

(assert (=> b!1463959 m!1351445))

(assert (=> b!1463972 m!1351425))

(assert (=> b!1463972 m!1351425))

(declare-fun m!1351455 () Bool)

(assert (=> b!1463972 m!1351455))

(declare-fun m!1351457 () Bool)

(assert (=> b!1463975 m!1351457))

(assert (=> b!1463970 m!1351425))

(assert (=> b!1463970 m!1351425))

(declare-fun m!1351459 () Bool)

(assert (=> b!1463970 m!1351459))

(assert (=> b!1463970 m!1351459))

(assert (=> b!1463970 m!1351425))

(declare-fun m!1351461 () Bool)

(assert (=> b!1463970 m!1351461))

(declare-fun m!1351463 () Bool)

(assert (=> b!1463971 m!1351463))

(assert (=> b!1463971 m!1351425))

(assert (=> b!1463967 m!1351425))

(assert (=> b!1463967 m!1351425))

(declare-fun m!1351465 () Bool)

(assert (=> b!1463967 m!1351465))

(declare-fun m!1351467 () Bool)

(assert (=> b!1463979 m!1351467))

(assert (=> b!1463979 m!1351421))

(declare-fun m!1351469 () Bool)

(assert (=> b!1463979 m!1351469))

(declare-fun m!1351471 () Bool)

(assert (=> b!1463979 m!1351471))

(declare-fun m!1351473 () Bool)

(assert (=> b!1463979 m!1351473))

(assert (=> b!1463979 m!1351425))

(check-sat (not b!1463976) (not b!1463959) (not b!1463961) (not b!1463979) (not b!1463962) (not b!1463972) (not b!1463970) (not b!1463980) (not b!1463969) (not b!1463965) (not b!1463963) (not start!125544) (not b!1463973) (not b!1463967) (not b!1463960) (not b!1463975))
(check-sat)
