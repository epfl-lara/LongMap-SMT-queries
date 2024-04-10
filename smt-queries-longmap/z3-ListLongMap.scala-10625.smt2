; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124890 () Bool)

(assert start!124890)

(declare-fun b!1450643 () Bool)

(declare-fun e!816854 () Bool)

(declare-fun e!816849 () Bool)

(assert (=> b!1450643 (= e!816854 e!816849)))

(declare-fun res!981978 () Bool)

(assert (=> b!1450643 (=> (not res!981978) (not e!816849))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11709 0))(
  ( (MissingZero!11709 (index!49228 (_ BitVec 32))) (Found!11709 (index!49229 (_ BitVec 32))) (Intermediate!11709 (undefined!12521 Bool) (index!49230 (_ BitVec 32)) (x!130886 (_ BitVec 32))) (Undefined!11709) (MissingVacant!11709 (index!49231 (_ BitVec 32))) )
))
(declare-fun lt!636380 () SeekEntryResult!11709)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450643 (= res!981978 (= lt!636380 (Intermediate!11709 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!636379 () (_ BitVec 64))

(declare-datatypes ((array!98338 0))(
  ( (array!98339 (arr!47457 (Array (_ BitVec 32) (_ BitVec 64))) (size!48007 (_ BitVec 32))) )
))
(declare-fun lt!636377 () array!98338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450643 (= lt!636380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636379 mask!2687) lt!636379 lt!636377 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98338)

(assert (=> b!1450643 (= lt!636379 (select (store (arr!47457 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450644 () Bool)

(declare-fun res!981968 () Bool)

(declare-fun e!816848 () Bool)

(assert (=> b!1450644 (=> (not res!981968) (not e!816848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450644 (= res!981968 (validKeyInArray!0 (select (arr!47457 a!2862) j!93)))))

(declare-fun b!1450645 () Bool)

(declare-fun res!981964 () Bool)

(assert (=> b!1450645 (=> (not res!981964) (not e!816854))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636376 () SeekEntryResult!11709)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450645 (= res!981964 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47457 a!2862) j!93) a!2862 mask!2687) lt!636376))))

(declare-fun b!1450646 () Bool)

(declare-fun res!981970 () Bool)

(assert (=> b!1450646 (=> (not res!981970) (not e!816849))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450646 (= res!981970 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450647 () Bool)

(declare-fun e!816845 () Bool)

(assert (=> b!1450647 (= e!816845 (= lt!636380 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636379 lt!636377 mask!2687)))))

(declare-fun b!1450648 () Bool)

(declare-fun e!816853 () Bool)

(declare-fun e!816850 () Bool)

(assert (=> b!1450648 (= e!816853 e!816850)))

(declare-fun res!981965 () Bool)

(assert (=> b!1450648 (=> res!981965 e!816850)))

(assert (=> b!1450648 (= res!981965 (or (and (= (select (arr!47457 a!2862) index!646) (select (store (arr!47457 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47457 a!2862) index!646) (select (arr!47457 a!2862) j!93))) (not (= (select (arr!47457 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450649 () Bool)

(declare-fun e!816852 () Bool)

(assert (=> b!1450649 (= e!816849 (not e!816852))))

(declare-fun res!981973 () Bool)

(assert (=> b!1450649 (=> res!981973 e!816852)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1450649 (= res!981973 (or (and (= (select (arr!47457 a!2862) index!646) (select (store (arr!47457 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47457 a!2862) index!646) (select (arr!47457 a!2862) j!93))) (not (= (select (arr!47457 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47457 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450649 e!816853))

(declare-fun res!981971 () Bool)

(assert (=> b!1450649 (=> (not res!981971) (not e!816853))))

(declare-fun lt!636374 () SeekEntryResult!11709)

(declare-fun lt!636378 () SeekEntryResult!11709)

(assert (=> b!1450649 (= res!981971 (and (= lt!636378 lt!636374) (or (= (select (arr!47457 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47457 a!2862) intermediateBeforeIndex!19) (select (arr!47457 a!2862) j!93)))))))

(assert (=> b!1450649 (= lt!636374 (Found!11709 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11709)

(assert (=> b!1450649 (= lt!636378 (seekEntryOrOpen!0 (select (arr!47457 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98338 (_ BitVec 32)) Bool)

(assert (=> b!1450649 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48914 0))(
  ( (Unit!48915) )
))
(declare-fun lt!636375 () Unit!48914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48914)

(assert (=> b!1450649 (= lt!636375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450650 () Bool)

(declare-fun res!981977 () Bool)

(assert (=> b!1450650 (=> (not res!981977) (not e!816848))))

(assert (=> b!1450650 (= res!981977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450651 () Bool)

(declare-fun res!981976 () Bool)

(assert (=> b!1450651 (=> (not res!981976) (not e!816848))))

(assert (=> b!1450651 (= res!981976 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48007 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48007 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48007 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450653 () Bool)

(declare-fun res!981966 () Bool)

(assert (=> b!1450653 (=> res!981966 e!816852)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98338 (_ BitVec 32)) SeekEntryResult!11709)

(assert (=> b!1450653 (= res!981966 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47457 a!2862) j!93) a!2862 mask!2687) lt!636374)))))

(declare-fun b!1450654 () Bool)

(assert (=> b!1450654 (= e!816845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636379 lt!636377 mask!2687) (seekEntryOrOpen!0 lt!636379 lt!636377 mask!2687)))))

(declare-fun b!1450655 () Bool)

(declare-fun res!981969 () Bool)

(assert (=> b!1450655 (=> (not res!981969) (not e!816849))))

(assert (=> b!1450655 (= res!981969 e!816845)))

(declare-fun c!133851 () Bool)

(assert (=> b!1450655 (= c!133851 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450656 () Bool)

(declare-fun e!816851 () Bool)

(assert (=> b!1450656 (= e!816851 e!816854)))

(declare-fun res!981972 () Bool)

(assert (=> b!1450656 (=> (not res!981972) (not e!816854))))

(assert (=> b!1450656 (= res!981972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47457 a!2862) j!93) mask!2687) (select (arr!47457 a!2862) j!93) a!2862 mask!2687) lt!636376))))

(assert (=> b!1450656 (= lt!636376 (Intermediate!11709 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450657 () Bool)

(declare-fun e!816847 () Bool)

(assert (=> b!1450657 (= e!816847 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450658 () Bool)

(assert (=> b!1450658 (= e!816852 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450658 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636379 lt!636377 mask!2687) lt!636374)))

(declare-fun lt!636381 () Unit!48914)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48914)

(assert (=> b!1450658 (= lt!636381 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450659 () Bool)

(declare-fun res!981963 () Bool)

(assert (=> b!1450659 (=> (not res!981963) (not e!816848))))

(assert (=> b!1450659 (= res!981963 (and (= (size!48007 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48007 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48007 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450660 () Bool)

(assert (=> b!1450660 (= e!816850 e!816847)))

(declare-fun res!981975 () Bool)

(assert (=> b!1450660 (=> (not res!981975) (not e!816847))))

(assert (=> b!1450660 (= res!981975 (= lt!636378 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47457 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450652 () Bool)

(declare-fun res!981974 () Bool)

(assert (=> b!1450652 (=> (not res!981974) (not e!816848))))

(declare-datatypes ((List!33958 0))(
  ( (Nil!33955) (Cons!33954 (h!35304 (_ BitVec 64)) (t!48652 List!33958)) )
))
(declare-fun arrayNoDuplicates!0 (array!98338 (_ BitVec 32) List!33958) Bool)

(assert (=> b!1450652 (= res!981974 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33955))))

(declare-fun res!981979 () Bool)

(assert (=> start!124890 (=> (not res!981979) (not e!816848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124890 (= res!981979 (validMask!0 mask!2687))))

(assert (=> start!124890 e!816848))

(assert (=> start!124890 true))

(declare-fun array_inv!36485 (array!98338) Bool)

(assert (=> start!124890 (array_inv!36485 a!2862)))

(declare-fun b!1450661 () Bool)

(assert (=> b!1450661 (= e!816848 e!816851)))

(declare-fun res!981967 () Bool)

(assert (=> b!1450661 (=> (not res!981967) (not e!816851))))

(assert (=> b!1450661 (= res!981967 (= (select (store (arr!47457 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450661 (= lt!636377 (array!98339 (store (arr!47457 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48007 a!2862)))))

(declare-fun b!1450662 () Bool)

(declare-fun res!981962 () Bool)

(assert (=> b!1450662 (=> (not res!981962) (not e!816848))))

(assert (=> b!1450662 (= res!981962 (validKeyInArray!0 (select (arr!47457 a!2862) i!1006)))))

(assert (= (and start!124890 res!981979) b!1450659))

(assert (= (and b!1450659 res!981963) b!1450662))

(assert (= (and b!1450662 res!981962) b!1450644))

(assert (= (and b!1450644 res!981968) b!1450650))

(assert (= (and b!1450650 res!981977) b!1450652))

(assert (= (and b!1450652 res!981974) b!1450651))

(assert (= (and b!1450651 res!981976) b!1450661))

(assert (= (and b!1450661 res!981967) b!1450656))

(assert (= (and b!1450656 res!981972) b!1450645))

(assert (= (and b!1450645 res!981964) b!1450643))

(assert (= (and b!1450643 res!981978) b!1450655))

(assert (= (and b!1450655 c!133851) b!1450647))

(assert (= (and b!1450655 (not c!133851)) b!1450654))

(assert (= (and b!1450655 res!981969) b!1450646))

(assert (= (and b!1450646 res!981970) b!1450649))

(assert (= (and b!1450649 res!981971) b!1450648))

(assert (= (and b!1450648 (not res!981965)) b!1450660))

(assert (= (and b!1450660 res!981975) b!1450657))

(assert (= (and b!1450649 (not res!981973)) b!1450653))

(assert (= (and b!1450653 (not res!981966)) b!1450658))

(declare-fun m!1339275 () Bool)

(assert (=> b!1450656 m!1339275))

(assert (=> b!1450656 m!1339275))

(declare-fun m!1339277 () Bool)

(assert (=> b!1450656 m!1339277))

(assert (=> b!1450656 m!1339277))

(assert (=> b!1450656 m!1339275))

(declare-fun m!1339279 () Bool)

(assert (=> b!1450656 m!1339279))

(declare-fun m!1339281 () Bool)

(assert (=> b!1450648 m!1339281))

(declare-fun m!1339283 () Bool)

(assert (=> b!1450648 m!1339283))

(declare-fun m!1339285 () Bool)

(assert (=> b!1450648 m!1339285))

(assert (=> b!1450648 m!1339275))

(assert (=> b!1450644 m!1339275))

(assert (=> b!1450644 m!1339275))

(declare-fun m!1339287 () Bool)

(assert (=> b!1450644 m!1339287))

(declare-fun m!1339289 () Bool)

(assert (=> b!1450643 m!1339289))

(assert (=> b!1450643 m!1339289))

(declare-fun m!1339291 () Bool)

(assert (=> b!1450643 m!1339291))

(assert (=> b!1450643 m!1339283))

(declare-fun m!1339293 () Bool)

(assert (=> b!1450643 m!1339293))

(assert (=> b!1450660 m!1339275))

(assert (=> b!1450660 m!1339275))

(declare-fun m!1339295 () Bool)

(assert (=> b!1450660 m!1339295))

(declare-fun m!1339297 () Bool)

(assert (=> b!1450649 m!1339297))

(assert (=> b!1450649 m!1339283))

(declare-fun m!1339299 () Bool)

(assert (=> b!1450649 m!1339299))

(assert (=> b!1450649 m!1339285))

(assert (=> b!1450649 m!1339281))

(assert (=> b!1450649 m!1339275))

(declare-fun m!1339301 () Bool)

(assert (=> b!1450649 m!1339301))

(declare-fun m!1339303 () Bool)

(assert (=> b!1450649 m!1339303))

(assert (=> b!1450649 m!1339275))

(assert (=> b!1450661 m!1339283))

(declare-fun m!1339305 () Bool)

(assert (=> b!1450661 m!1339305))

(assert (=> b!1450653 m!1339275))

(assert (=> b!1450653 m!1339275))

(declare-fun m!1339307 () Bool)

(assert (=> b!1450653 m!1339307))

(declare-fun m!1339309 () Bool)

(assert (=> start!124890 m!1339309))

(declare-fun m!1339311 () Bool)

(assert (=> start!124890 m!1339311))

(declare-fun m!1339313 () Bool)

(assert (=> b!1450658 m!1339313))

(declare-fun m!1339315 () Bool)

(assert (=> b!1450658 m!1339315))

(declare-fun m!1339317 () Bool)

(assert (=> b!1450662 m!1339317))

(assert (=> b!1450662 m!1339317))

(declare-fun m!1339319 () Bool)

(assert (=> b!1450662 m!1339319))

(assert (=> b!1450654 m!1339313))

(declare-fun m!1339321 () Bool)

(assert (=> b!1450654 m!1339321))

(declare-fun m!1339323 () Bool)

(assert (=> b!1450650 m!1339323))

(declare-fun m!1339325 () Bool)

(assert (=> b!1450647 m!1339325))

(declare-fun m!1339327 () Bool)

(assert (=> b!1450652 m!1339327))

(assert (=> b!1450645 m!1339275))

(assert (=> b!1450645 m!1339275))

(declare-fun m!1339329 () Bool)

(assert (=> b!1450645 m!1339329))

(check-sat (not b!1450654) (not b!1450647) (not b!1450652) (not b!1450653) (not b!1450660) (not b!1450643) (not b!1450649) (not b!1450662) (not b!1450645) (not b!1450644) (not b!1450650) (not b!1450658) (not b!1450656) (not start!124890))
(check-sat)
