; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125010 () Bool)

(assert start!125010)

(declare-fun b!1453974 () Bool)

(declare-fun res!984921 () Bool)

(declare-fun e!818318 () Bool)

(assert (=> b!1453974 (=> (not res!984921) (not e!818318))))

(declare-datatypes ((array!98458 0))(
  ( (array!98459 (arr!47517 (Array (_ BitVec 32) (_ BitVec 64))) (size!48067 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98458)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453974 (= res!984921 (validKeyInArray!0 (select (arr!47517 a!2862) i!1006)))))

(declare-fun b!1453975 () Bool)

(declare-fun res!984913 () Bool)

(declare-fun e!818319 () Bool)

(assert (=> b!1453975 (=> (not res!984913) (not e!818319))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11769 0))(
  ( (MissingZero!11769 (index!49468 (_ BitVec 32))) (Found!11769 (index!49469 (_ BitVec 32))) (Intermediate!11769 (undefined!12581 Bool) (index!49470 (_ BitVec 32)) (x!131106 (_ BitVec 32))) (Undefined!11769) (MissingVacant!11769 (index!49471 (_ BitVec 32))) )
))
(declare-fun lt!637421 () SeekEntryResult!11769)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1453975 (= res!984913 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47517 a!2862) j!93) a!2862 mask!2687) lt!637421))))

(declare-fun b!1453976 () Bool)

(declare-fun res!984914 () Bool)

(assert (=> b!1453976 (=> (not res!984914) (not e!818318))))

(assert (=> b!1453976 (= res!984914 (validKeyInArray!0 (select (arr!47517 a!2862) j!93)))))

(declare-fun res!984908 () Bool)

(assert (=> start!125010 (=> (not res!984908) (not e!818318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125010 (= res!984908 (validMask!0 mask!2687))))

(assert (=> start!125010 e!818318))

(assert (=> start!125010 true))

(declare-fun array_inv!36545 (array!98458) Bool)

(assert (=> start!125010 (array_inv!36545 a!2862)))

(declare-fun lt!637419 () SeekEntryResult!11769)

(declare-fun e!818316 () Bool)

(declare-fun lt!637423 () (_ BitVec 64))

(declare-fun lt!637425 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1453977 () Bool)

(declare-fun lt!637418 () array!98458)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1453977 (= e!818316 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637425 intermediateAfterIndex!19 lt!637423 lt!637418 mask!2687) lt!637419)))))

(declare-fun b!1453978 () Bool)

(declare-fun res!984905 () Bool)

(assert (=> b!1453978 (=> (not res!984905) (not e!818318))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453978 (= res!984905 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48067 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48067 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48067 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453979 () Bool)

(declare-fun e!818321 () Bool)

(assert (=> b!1453979 (= e!818321 true)))

(declare-fun lt!637424 () Bool)

(assert (=> b!1453979 (= lt!637424 e!818316)))

(declare-fun c!134045 () Bool)

(assert (=> b!1453979 (= c!134045 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1453980 () Bool)

(declare-fun res!984915 () Bool)

(declare-fun e!818317 () Bool)

(assert (=> b!1453980 (=> (not res!984915) (not e!818317))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11769)

(assert (=> b!1453980 (= res!984915 (= (seekEntryOrOpen!0 (select (arr!47517 a!2862) j!93) a!2862 mask!2687) (Found!11769 j!93)))))

(declare-fun b!1453981 () Bool)

(declare-fun lt!637420 () SeekEntryResult!11769)

(assert (=> b!1453981 (= e!818316 (not (= lt!637420 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637425 lt!637423 lt!637418 mask!2687))))))

(declare-fun b!1453982 () Bool)

(declare-fun res!984909 () Bool)

(assert (=> b!1453982 (=> (not res!984909) (not e!818318))))

(declare-datatypes ((List!34018 0))(
  ( (Nil!34015) (Cons!34014 (h!35364 (_ BitVec 64)) (t!48712 List!34018)) )
))
(declare-fun arrayNoDuplicates!0 (array!98458 (_ BitVec 32) List!34018) Bool)

(assert (=> b!1453982 (= res!984909 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34015))))

(declare-fun b!1453983 () Bool)

(declare-fun res!984919 () Bool)

(assert (=> b!1453983 (=> res!984919 e!818321)))

(assert (=> b!1453983 (= res!984919 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637425 (select (arr!47517 a!2862) j!93) a!2862 mask!2687) lt!637421)))))

(declare-fun b!1453984 () Bool)

(declare-fun res!984911 () Bool)

(declare-fun e!818312 () Bool)

(assert (=> b!1453984 (=> (not res!984911) (not e!818312))))

(declare-fun e!818314 () Bool)

(assert (=> b!1453984 (= res!984911 e!818314)))

(declare-fun c!134046 () Bool)

(assert (=> b!1453984 (= c!134046 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453985 () Bool)

(assert (=> b!1453985 (= e!818319 e!818312)))

(declare-fun res!984907 () Bool)

(assert (=> b!1453985 (=> (not res!984907) (not e!818312))))

(assert (=> b!1453985 (= res!984907 (= lt!637420 (Intermediate!11769 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453985 (= lt!637420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637423 mask!2687) lt!637423 lt!637418 mask!2687))))

(assert (=> b!1453985 (= lt!637423 (select (store (arr!47517 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453986 () Bool)

(declare-fun e!818320 () Bool)

(assert (=> b!1453986 (= e!818318 e!818320)))

(declare-fun res!984916 () Bool)

(assert (=> b!1453986 (=> (not res!984916) (not e!818320))))

(assert (=> b!1453986 (= res!984916 (= (select (store (arr!47517 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453986 (= lt!637418 (array!98459 (store (arr!47517 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48067 a!2862)))))

(declare-fun b!1453987 () Bool)

(assert (=> b!1453987 (= e!818314 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637423 lt!637418 mask!2687) (seekEntryOrOpen!0 lt!637423 lt!637418 mask!2687)))))

(declare-fun b!1453988 () Bool)

(assert (=> b!1453988 (= e!818317 (and (or (= (select (arr!47517 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47517 a!2862) intermediateBeforeIndex!19) (select (arr!47517 a!2862) j!93))) (let ((bdg!53020 (select (store (arr!47517 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47517 a!2862) index!646) bdg!53020) (= (select (arr!47517 a!2862) index!646) (select (arr!47517 a!2862) j!93))) (= (select (arr!47517 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53020 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1453989 () Bool)

(assert (=> b!1453989 (= e!818320 e!818319)))

(declare-fun res!984917 () Bool)

(assert (=> b!1453989 (=> (not res!984917) (not e!818319))))

(assert (=> b!1453989 (= res!984917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47517 a!2862) j!93) mask!2687) (select (arr!47517 a!2862) j!93) a!2862 mask!2687) lt!637421))))

(assert (=> b!1453989 (= lt!637421 (Intermediate!11769 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453990 () Bool)

(declare-fun e!818313 () Bool)

(assert (=> b!1453990 (= e!818313 e!818321)))

(declare-fun res!984920 () Bool)

(assert (=> b!1453990 (=> res!984920 e!818321)))

(assert (=> b!1453990 (= res!984920 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637425 #b00000000000000000000000000000000) (bvsge lt!637425 (size!48067 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453990 (= lt!637425 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1453990 (= lt!637419 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637423 lt!637418 mask!2687))))

(assert (=> b!1453990 (= lt!637419 (seekEntryOrOpen!0 lt!637423 lt!637418 mask!2687))))

(declare-fun b!1453991 () Bool)

(assert (=> b!1453991 (= e!818312 (not e!818313))))

(declare-fun res!984910 () Bool)

(assert (=> b!1453991 (=> res!984910 e!818313)))

(assert (=> b!1453991 (= res!984910 (or (and (= (select (arr!47517 a!2862) index!646) (select (store (arr!47517 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47517 a!2862) index!646) (select (arr!47517 a!2862) j!93))) (= (select (arr!47517 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453991 e!818317))

(declare-fun res!984906 () Bool)

(assert (=> b!1453991 (=> (not res!984906) (not e!818317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98458 (_ BitVec 32)) Bool)

(assert (=> b!1453991 (= res!984906 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49034 0))(
  ( (Unit!49035) )
))
(declare-fun lt!637422 () Unit!49034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49034)

(assert (=> b!1453991 (= lt!637422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453992 () Bool)

(declare-fun res!984912 () Bool)

(assert (=> b!1453992 (=> (not res!984912) (not e!818318))))

(assert (=> b!1453992 (= res!984912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453993 () Bool)

(assert (=> b!1453993 (= e!818314 (= lt!637420 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637423 lt!637418 mask!2687)))))

(declare-fun b!1453994 () Bool)

(declare-fun res!984922 () Bool)

(assert (=> b!1453994 (=> (not res!984922) (not e!818312))))

(assert (=> b!1453994 (= res!984922 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453995 () Bool)

(declare-fun res!984918 () Bool)

(assert (=> b!1453995 (=> (not res!984918) (not e!818318))))

(assert (=> b!1453995 (= res!984918 (and (= (size!48067 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48067 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48067 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125010 res!984908) b!1453995))

(assert (= (and b!1453995 res!984918) b!1453974))

(assert (= (and b!1453974 res!984921) b!1453976))

(assert (= (and b!1453976 res!984914) b!1453992))

(assert (= (and b!1453992 res!984912) b!1453982))

(assert (= (and b!1453982 res!984909) b!1453978))

(assert (= (and b!1453978 res!984905) b!1453986))

(assert (= (and b!1453986 res!984916) b!1453989))

(assert (= (and b!1453989 res!984917) b!1453975))

(assert (= (and b!1453975 res!984913) b!1453985))

(assert (= (and b!1453985 res!984907) b!1453984))

(assert (= (and b!1453984 c!134046) b!1453993))

(assert (= (and b!1453984 (not c!134046)) b!1453987))

(assert (= (and b!1453984 res!984911) b!1453994))

(assert (= (and b!1453994 res!984922) b!1453991))

(assert (= (and b!1453991 res!984906) b!1453980))

(assert (= (and b!1453980 res!984915) b!1453988))

(assert (= (and b!1453991 (not res!984910)) b!1453990))

(assert (= (and b!1453990 (not res!984920)) b!1453983))

(assert (= (and b!1453983 (not res!984919)) b!1453979))

(assert (= (and b!1453979 c!134045) b!1453981))

(assert (= (and b!1453979 (not c!134045)) b!1453977))

(declare-fun m!1342373 () Bool)

(assert (=> b!1453986 m!1342373))

(declare-fun m!1342375 () Bool)

(assert (=> b!1453986 m!1342375))

(declare-fun m!1342377 () Bool)

(assert (=> b!1453981 m!1342377))

(declare-fun m!1342379 () Bool)

(assert (=> b!1453982 m!1342379))

(declare-fun m!1342381 () Bool)

(assert (=> b!1453989 m!1342381))

(assert (=> b!1453989 m!1342381))

(declare-fun m!1342383 () Bool)

(assert (=> b!1453989 m!1342383))

(assert (=> b!1453989 m!1342383))

(assert (=> b!1453989 m!1342381))

(declare-fun m!1342385 () Bool)

(assert (=> b!1453989 m!1342385))

(assert (=> b!1453975 m!1342381))

(assert (=> b!1453975 m!1342381))

(declare-fun m!1342387 () Bool)

(assert (=> b!1453975 m!1342387))

(declare-fun m!1342389 () Bool)

(assert (=> b!1453977 m!1342389))

(assert (=> b!1453976 m!1342381))

(assert (=> b!1453976 m!1342381))

(declare-fun m!1342391 () Bool)

(assert (=> b!1453976 m!1342391))

(declare-fun m!1342393 () Bool)

(assert (=> b!1453987 m!1342393))

(declare-fun m!1342395 () Bool)

(assert (=> b!1453987 m!1342395))

(assert (=> b!1453988 m!1342373))

(declare-fun m!1342397 () Bool)

(assert (=> b!1453988 m!1342397))

(declare-fun m!1342399 () Bool)

(assert (=> b!1453988 m!1342399))

(declare-fun m!1342401 () Bool)

(assert (=> b!1453988 m!1342401))

(assert (=> b!1453988 m!1342381))

(declare-fun m!1342403 () Bool)

(assert (=> start!125010 m!1342403))

(declare-fun m!1342405 () Bool)

(assert (=> start!125010 m!1342405))

(declare-fun m!1342407 () Bool)

(assert (=> b!1453992 m!1342407))

(assert (=> b!1453983 m!1342381))

(assert (=> b!1453983 m!1342381))

(declare-fun m!1342409 () Bool)

(assert (=> b!1453983 m!1342409))

(declare-fun m!1342411 () Bool)

(assert (=> b!1453974 m!1342411))

(assert (=> b!1453974 m!1342411))

(declare-fun m!1342413 () Bool)

(assert (=> b!1453974 m!1342413))

(declare-fun m!1342415 () Bool)

(assert (=> b!1453993 m!1342415))

(declare-fun m!1342417 () Bool)

(assert (=> b!1453985 m!1342417))

(assert (=> b!1453985 m!1342417))

(declare-fun m!1342419 () Bool)

(assert (=> b!1453985 m!1342419))

(assert (=> b!1453985 m!1342373))

(declare-fun m!1342421 () Bool)

(assert (=> b!1453985 m!1342421))

(assert (=> b!1453980 m!1342381))

(assert (=> b!1453980 m!1342381))

(declare-fun m!1342423 () Bool)

(assert (=> b!1453980 m!1342423))

(declare-fun m!1342425 () Bool)

(assert (=> b!1453991 m!1342425))

(assert (=> b!1453991 m!1342373))

(assert (=> b!1453991 m!1342399))

(assert (=> b!1453991 m!1342401))

(declare-fun m!1342427 () Bool)

(assert (=> b!1453991 m!1342427))

(assert (=> b!1453991 m!1342381))

(declare-fun m!1342429 () Bool)

(assert (=> b!1453990 m!1342429))

(assert (=> b!1453990 m!1342393))

(assert (=> b!1453990 m!1342395))

(check-sat (not b!1453990) (not b!1453981) (not b!1453992) (not b!1453985) (not b!1453976) (not b!1453983) (not b!1453989) (not b!1453982) (not b!1453991) (not b!1453974) (not start!125010) (not b!1453987) (not b!1453993) (not b!1453980) (not b!1453975) (not b!1453977))
(check-sat)
