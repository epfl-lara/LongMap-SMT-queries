; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127304 () Bool)

(assert start!127304)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99760 0))(
  ( (array!99761 (arr!48145 (Array (_ BitVec 32) (_ BitVec 64))) (size!48697 (_ BitVec 32))) )
))
(declare-fun lt!651883 () array!99760)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1496355 () Bool)

(declare-fun lt!651887 () (_ BitVec 64))

(declare-fun e!838054 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12410 0))(
  ( (MissingZero!12410 (index!52032 (_ BitVec 32))) (Found!12410 (index!52033 (_ BitVec 32))) (Intermediate!12410 (undefined!13222 Bool) (index!52034 (_ BitVec 32)) (x!133655 (_ BitVec 32))) (Undefined!12410) (MissingVacant!12410 (index!52035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99760 (_ BitVec 32)) SeekEntryResult!12410)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99760 (_ BitVec 32)) SeekEntryResult!12410)

(assert (=> b!1496355 (= e!838054 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651887 lt!651883 mask!2687) (seekEntryOrOpen!0 lt!651887 lt!651883 mask!2687)))))

(declare-fun b!1496356 () Bool)

(declare-fun res!1017862 () Bool)

(declare-fun e!838055 () Bool)

(assert (=> b!1496356 (=> (not res!1017862) (not e!838055))))

(assert (=> b!1496356 (= res!1017862 e!838054)))

(declare-fun c!138793 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496356 (= c!138793 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496357 () Bool)

(declare-fun res!1017857 () Bool)

(declare-fun e!838050 () Bool)

(assert (=> b!1496357 (=> res!1017857 e!838050)))

(declare-fun e!838051 () Bool)

(assert (=> b!1496357 (= res!1017857 e!838051)))

(declare-fun c!138792 () Bool)

(assert (=> b!1496357 (= c!138792 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496358 () Bool)

(assert (=> b!1496358 (= e!838050 true)))

(declare-fun lt!651888 () SeekEntryResult!12410)

(assert (=> b!1496358 (= lt!651888 (seekEntryOrOpen!0 lt!651887 lt!651883 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!50001 0))(
  ( (Unit!50002) )
))
(declare-fun lt!651886 () Unit!50001)

(declare-fun lt!651884 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99760)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50001)

(assert (=> b!1496358 (= lt!651886 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!651884 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496359 () Bool)

(declare-fun res!1017846 () Bool)

(assert (=> b!1496359 (=> (not res!1017846) (not e!838055))))

(assert (=> b!1496359 (= res!1017846 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496360 () Bool)

(declare-fun res!1017859 () Bool)

(assert (=> b!1496360 (=> res!1017859 e!838050)))

(declare-fun lt!651885 () SeekEntryResult!12410)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99760 (_ BitVec 32)) SeekEntryResult!12410)

(assert (=> b!1496360 (= res!1017859 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651884 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!651885)))))

(declare-fun b!1496361 () Bool)

(declare-fun res!1017849 () Bool)

(assert (=> b!1496361 (=> res!1017849 e!838050)))

(assert (=> b!1496361 (= res!1017849 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496362 () Bool)

(declare-fun e!838057 () Bool)

(assert (=> b!1496362 (= e!838055 (not e!838057))))

(declare-fun res!1017845 () Bool)

(assert (=> b!1496362 (=> res!1017845 e!838057)))

(assert (=> b!1496362 (= res!1017845 (or (and (= (select (arr!48145 a!2862) index!646) (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48145 a!2862) index!646) (select (arr!48145 a!2862) j!93))) (= (select (arr!48145 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1496362 (and (= lt!651888 (Found!12410 j!93)) (or (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) (select (arr!48145 a!2862) j!93))))))

(assert (=> b!1496362 (= lt!651888 (seekEntryOrOpen!0 (select (arr!48145 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99760 (_ BitVec 32)) Bool)

(assert (=> b!1496362 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651889 () Unit!50001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50001)

(assert (=> b!1496362 (= lt!651889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496363 () Bool)

(declare-fun res!1017852 () Bool)

(declare-fun e!838058 () Bool)

(assert (=> b!1496363 (=> (not res!1017852) (not e!838058))))

(assert (=> b!1496363 (= res!1017852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496364 () Bool)

(assert (=> b!1496364 (= e!838051 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651884 intermediateAfterIndex!19 lt!651887 lt!651883 mask!2687) (seekEntryOrOpen!0 lt!651887 lt!651883 mask!2687))))))

(declare-fun b!1496365 () Bool)

(declare-fun res!1017850 () Bool)

(assert (=> b!1496365 (=> (not res!1017850) (not e!838058))))

(declare-datatypes ((List!34724 0))(
  ( (Nil!34721) (Cons!34720 (h!36118 (_ BitVec 64)) (t!49410 List!34724)) )
))
(declare-fun arrayNoDuplicates!0 (array!99760 (_ BitVec 32) List!34724) Bool)

(assert (=> b!1496365 (= res!1017850 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34721))))

(declare-fun b!1496366 () Bool)

(declare-fun e!838052 () Bool)

(assert (=> b!1496366 (= e!838052 e!838055)))

(declare-fun res!1017861 () Bool)

(assert (=> b!1496366 (=> (not res!1017861) (not e!838055))))

(declare-fun lt!651890 () SeekEntryResult!12410)

(assert (=> b!1496366 (= res!1017861 (= lt!651890 (Intermediate!12410 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496366 (= lt!651890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651887 mask!2687) lt!651887 lt!651883 mask!2687))))

(assert (=> b!1496366 (= lt!651887 (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496367 () Bool)

(assert (=> b!1496367 (= e!838051 (not (= lt!651890 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651884 lt!651887 lt!651883 mask!2687))))))

(declare-fun b!1496368 () Bool)

(declare-fun e!838056 () Bool)

(assert (=> b!1496368 (= e!838056 e!838052)))

(declare-fun res!1017860 () Bool)

(assert (=> b!1496368 (=> (not res!1017860) (not e!838052))))

(assert (=> b!1496368 (= res!1017860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48145 a!2862) j!93) mask!2687) (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!651885))))

(assert (=> b!1496368 (= lt!651885 (Intermediate!12410 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1017856 () Bool)

(assert (=> start!127304 (=> (not res!1017856) (not e!838058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127304 (= res!1017856 (validMask!0 mask!2687))))

(assert (=> start!127304 e!838058))

(assert (=> start!127304 true))

(declare-fun array_inv!37378 (array!99760) Bool)

(assert (=> start!127304 (array_inv!37378 a!2862)))

(declare-fun b!1496369 () Bool)

(declare-fun res!1017854 () Bool)

(assert (=> b!1496369 (=> (not res!1017854) (not e!838058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496369 (= res!1017854 (validKeyInArray!0 (select (arr!48145 a!2862) i!1006)))))

(declare-fun b!1496370 () Bool)

(assert (=> b!1496370 (= e!838057 e!838050)))

(declare-fun res!1017847 () Bool)

(assert (=> b!1496370 (=> res!1017847 e!838050)))

(assert (=> b!1496370 (= res!1017847 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651884 #b00000000000000000000000000000000) (bvsge lt!651884 (size!48697 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496370 (= lt!651884 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496371 () Bool)

(assert (=> b!1496371 (= e!838058 e!838056)))

(declare-fun res!1017848 () Bool)

(assert (=> b!1496371 (=> (not res!1017848) (not e!838056))))

(assert (=> b!1496371 (= res!1017848 (= (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496371 (= lt!651883 (array!99761 (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48697 a!2862)))))

(declare-fun b!1496372 () Bool)

(assert (=> b!1496372 (= e!838054 (= lt!651890 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651887 lt!651883 mask!2687)))))

(declare-fun b!1496373 () Bool)

(declare-fun res!1017858 () Bool)

(assert (=> b!1496373 (=> (not res!1017858) (not e!838058))))

(assert (=> b!1496373 (= res!1017858 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48697 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48697 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48697 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496374 () Bool)

(declare-fun res!1017855 () Bool)

(assert (=> b!1496374 (=> (not res!1017855) (not e!838058))))

(assert (=> b!1496374 (= res!1017855 (validKeyInArray!0 (select (arr!48145 a!2862) j!93)))))

(declare-fun b!1496375 () Bool)

(declare-fun res!1017853 () Bool)

(assert (=> b!1496375 (=> (not res!1017853) (not e!838052))))

(assert (=> b!1496375 (= res!1017853 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!651885))))

(declare-fun b!1496376 () Bool)

(declare-fun res!1017851 () Bool)

(assert (=> b!1496376 (=> (not res!1017851) (not e!838058))))

(assert (=> b!1496376 (= res!1017851 (and (= (size!48697 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48697 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48697 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!127304 res!1017856) b!1496376))

(assert (= (and b!1496376 res!1017851) b!1496369))

(assert (= (and b!1496369 res!1017854) b!1496374))

(assert (= (and b!1496374 res!1017855) b!1496363))

(assert (= (and b!1496363 res!1017852) b!1496365))

(assert (= (and b!1496365 res!1017850) b!1496373))

(assert (= (and b!1496373 res!1017858) b!1496371))

(assert (= (and b!1496371 res!1017848) b!1496368))

(assert (= (and b!1496368 res!1017860) b!1496375))

(assert (= (and b!1496375 res!1017853) b!1496366))

(assert (= (and b!1496366 res!1017861) b!1496356))

(assert (= (and b!1496356 c!138793) b!1496372))

(assert (= (and b!1496356 (not c!138793)) b!1496355))

(assert (= (and b!1496356 res!1017862) b!1496359))

(assert (= (and b!1496359 res!1017846) b!1496362))

(assert (= (and b!1496362 (not res!1017845)) b!1496370))

(assert (= (and b!1496370 (not res!1017847)) b!1496360))

(assert (= (and b!1496360 (not res!1017859)) b!1496357))

(assert (= (and b!1496357 c!138792) b!1496367))

(assert (= (and b!1496357 (not c!138792)) b!1496364))

(assert (= (and b!1496357 (not res!1017857)) b!1496361))

(assert (= (and b!1496361 (not res!1017849)) b!1496358))

(declare-fun m!1378965 () Bool)

(assert (=> b!1496364 m!1378965))

(declare-fun m!1378967 () Bool)

(assert (=> b!1496364 m!1378967))

(assert (=> b!1496358 m!1378967))

(declare-fun m!1378969 () Bool)

(assert (=> b!1496358 m!1378969))

(declare-fun m!1378971 () Bool)

(assert (=> b!1496367 m!1378971))

(declare-fun m!1378973 () Bool)

(assert (=> start!127304 m!1378973))

(declare-fun m!1378975 () Bool)

(assert (=> start!127304 m!1378975))

(declare-fun m!1378977 () Bool)

(assert (=> b!1496366 m!1378977))

(assert (=> b!1496366 m!1378977))

(declare-fun m!1378979 () Bool)

(assert (=> b!1496366 m!1378979))

(declare-fun m!1378981 () Bool)

(assert (=> b!1496366 m!1378981))

(declare-fun m!1378983 () Bool)

(assert (=> b!1496366 m!1378983))

(declare-fun m!1378985 () Bool)

(assert (=> b!1496355 m!1378985))

(assert (=> b!1496355 m!1378967))

(declare-fun m!1378987 () Bool)

(assert (=> b!1496374 m!1378987))

(assert (=> b!1496374 m!1378987))

(declare-fun m!1378989 () Bool)

(assert (=> b!1496374 m!1378989))

(declare-fun m!1378991 () Bool)

(assert (=> b!1496370 m!1378991))

(assert (=> b!1496375 m!1378987))

(assert (=> b!1496375 m!1378987))

(declare-fun m!1378993 () Bool)

(assert (=> b!1496375 m!1378993))

(assert (=> b!1496360 m!1378987))

(assert (=> b!1496360 m!1378987))

(declare-fun m!1378995 () Bool)

(assert (=> b!1496360 m!1378995))

(declare-fun m!1378997 () Bool)

(assert (=> b!1496362 m!1378997))

(assert (=> b!1496362 m!1378981))

(declare-fun m!1378999 () Bool)

(assert (=> b!1496362 m!1378999))

(declare-fun m!1379001 () Bool)

(assert (=> b!1496362 m!1379001))

(declare-fun m!1379003 () Bool)

(assert (=> b!1496362 m!1379003))

(assert (=> b!1496362 m!1378987))

(declare-fun m!1379005 () Bool)

(assert (=> b!1496362 m!1379005))

(declare-fun m!1379007 () Bool)

(assert (=> b!1496362 m!1379007))

(assert (=> b!1496362 m!1378987))

(declare-fun m!1379009 () Bool)

(assert (=> b!1496363 m!1379009))

(assert (=> b!1496371 m!1378981))

(declare-fun m!1379011 () Bool)

(assert (=> b!1496371 m!1379011))

(declare-fun m!1379013 () Bool)

(assert (=> b!1496369 m!1379013))

(assert (=> b!1496369 m!1379013))

(declare-fun m!1379015 () Bool)

(assert (=> b!1496369 m!1379015))

(assert (=> b!1496368 m!1378987))

(assert (=> b!1496368 m!1378987))

(declare-fun m!1379017 () Bool)

(assert (=> b!1496368 m!1379017))

(assert (=> b!1496368 m!1379017))

(assert (=> b!1496368 m!1378987))

(declare-fun m!1379019 () Bool)

(assert (=> b!1496368 m!1379019))

(declare-fun m!1379021 () Bool)

(assert (=> b!1496365 m!1379021))

(declare-fun m!1379023 () Bool)

(assert (=> b!1496372 m!1379023))

(check-sat (not b!1496367) (not b!1496375) (not b!1496363) (not b!1496364) (not b!1496370) (not b!1496366) (not start!127304) (not b!1496362) (not b!1496355) (not b!1496374) (not b!1496358) (not b!1496368) (not b!1496369) (not b!1496372) (not b!1496360) (not b!1496365))
(check-sat)
