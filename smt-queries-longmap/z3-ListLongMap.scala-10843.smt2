; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126854 () Bool)

(assert start!126854)

(declare-fun res!1014272 () Bool)

(declare-fun e!835304 () Bool)

(assert (=> start!126854 (=> (not res!1014272) (not e!835304))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126854 (= res!1014272 (validMask!0 mask!2687))))

(assert (=> start!126854 e!835304))

(assert (=> start!126854 true))

(declare-datatypes ((array!99625 0))(
  ( (array!99626 (arr!48085 (Array (_ BitVec 32) (_ BitVec 64))) (size!48637 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99625)

(declare-fun array_inv!37318 (array!99625) Bool)

(assert (=> start!126854 (array_inv!37318 a!2862)))

(declare-fun b!1490851 () Bool)

(declare-fun res!1014282 () Bool)

(assert (=> b!1490851 (=> (not res!1014282) (not e!835304))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490851 (= res!1014282 (validKeyInArray!0 (select (arr!48085 a!2862) j!93)))))

(declare-fun b!1490852 () Bool)

(declare-fun res!1014276 () Bool)

(declare-fun e!835302 () Bool)

(assert (=> b!1490852 (=> (not res!1014276) (not e!835302))))

(declare-fun e!835305 () Bool)

(assert (=> b!1490852 (= res!1014276 e!835305)))

(declare-fun c!137821 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490852 (= c!137821 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490853 () Bool)

(declare-fun res!1014279 () Bool)

(assert (=> b!1490853 (=> (not res!1014279) (not e!835304))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490853 (= res!1014279 (and (= (size!48637 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48637 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48637 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490854 () Bool)

(declare-fun e!835306 () Bool)

(declare-fun e!835301 () Bool)

(assert (=> b!1490854 (= e!835306 e!835301)))

(declare-fun res!1014268 () Bool)

(assert (=> b!1490854 (=> (not res!1014268) (not e!835301))))

(declare-datatypes ((SeekEntryResult!12350 0))(
  ( (MissingZero!12350 (index!51792 (_ BitVec 32))) (Found!12350 (index!51793 (_ BitVec 32))) (Intermediate!12350 (undefined!13162 Bool) (index!51794 (_ BitVec 32)) (x!133375 (_ BitVec 32))) (Undefined!12350) (MissingVacant!12350 (index!51795 (_ BitVec 32))) )
))
(declare-fun lt!649904 () SeekEntryResult!12350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490854 (= res!1014268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48085 a!2862) j!93) mask!2687) (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!649904))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490854 (= lt!649904 (Intermediate!12350 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490855 () Bool)

(assert (=> b!1490855 (= e!835301 e!835302)))

(declare-fun res!1014277 () Bool)

(assert (=> b!1490855 (=> (not res!1014277) (not e!835302))))

(declare-fun lt!649903 () SeekEntryResult!12350)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490855 (= res!1014277 (= lt!649903 (Intermediate!12350 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649900 () array!99625)

(declare-fun lt!649899 () (_ BitVec 64))

(assert (=> b!1490855 (= lt!649903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649899 mask!2687) lt!649899 lt!649900 mask!2687))))

(assert (=> b!1490855 (= lt!649899 (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490856 () Bool)

(declare-fun e!835300 () Bool)

(assert (=> b!1490856 (= e!835300 (or (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48085 a!2862) intermediateBeforeIndex!19) (select (arr!48085 a!2862) j!93))))))

(declare-fun b!1490857 () Bool)

(declare-fun res!1014274 () Bool)

(assert (=> b!1490857 (=> (not res!1014274) (not e!835302))))

(assert (=> b!1490857 (= res!1014274 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490858 () Bool)

(assert (=> b!1490858 (= e!835304 e!835306)))

(declare-fun res!1014270 () Bool)

(assert (=> b!1490858 (=> (not res!1014270) (not e!835306))))

(assert (=> b!1490858 (= res!1014270 (= (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490858 (= lt!649900 (array!99626 (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48637 a!2862)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1490859 () Bool)

(assert (=> b!1490859 (= e!835305 (= lt!649903 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649899 lt!649900 mask!2687)))))

(declare-fun b!1490860 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99625 (_ BitVec 32)) SeekEntryResult!12350)

(assert (=> b!1490860 (= e!835305 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649899 lt!649900 mask!2687) (seekEntryOrOpen!0 lt!649899 lt!649900 mask!2687)))))

(declare-fun b!1490861 () Bool)

(declare-fun res!1014273 () Bool)

(assert (=> b!1490861 (=> (not res!1014273) (not e!835300))))

(assert (=> b!1490861 (= res!1014273 (= (seekEntryOrOpen!0 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) (Found!12350 j!93)))))

(declare-fun b!1490862 () Bool)

(declare-fun res!1014271 () Bool)

(assert (=> b!1490862 (=> (not res!1014271) (not e!835304))))

(declare-datatypes ((List!34664 0))(
  ( (Nil!34661) (Cons!34660 (h!36043 (_ BitVec 64)) (t!49350 List!34664)) )
))
(declare-fun arrayNoDuplicates!0 (array!99625 (_ BitVec 32) List!34664) Bool)

(assert (=> b!1490862 (= res!1014271 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34661))))

(declare-fun b!1490863 () Bool)

(declare-fun res!1014275 () Bool)

(assert (=> b!1490863 (=> (not res!1014275) (not e!835304))))

(assert (=> b!1490863 (= res!1014275 (validKeyInArray!0 (select (arr!48085 a!2862) i!1006)))))

(declare-fun b!1490864 () Bool)

(declare-fun res!1014283 () Bool)

(assert (=> b!1490864 (=> (not res!1014283) (not e!835304))))

(assert (=> b!1490864 (= res!1014283 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48637 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48637 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48637 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490865 () Bool)

(declare-fun res!1014281 () Bool)

(assert (=> b!1490865 (=> (not res!1014281) (not e!835301))))

(assert (=> b!1490865 (= res!1014281 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48085 a!2862) j!93) a!2862 mask!2687) lt!649904))))

(declare-fun b!1490866 () Bool)

(declare-fun e!835303 () Bool)

(assert (=> b!1490866 (= e!835303 true)))

(declare-fun lt!649901 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490866 (= lt!649901 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490867 () Bool)

(assert (=> b!1490867 (= e!835302 (not e!835303))))

(declare-fun res!1014278 () Bool)

(assert (=> b!1490867 (=> res!1014278 e!835303)))

(assert (=> b!1490867 (= res!1014278 (or (and (= (select (arr!48085 a!2862) index!646) (select (store (arr!48085 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48085 a!2862) index!646) (select (arr!48085 a!2862) j!93))) (= (select (arr!48085 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490867 e!835300))

(declare-fun res!1014280 () Bool)

(assert (=> b!1490867 (=> (not res!1014280) (not e!835300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99625 (_ BitVec 32)) Bool)

(assert (=> b!1490867 (= res!1014280 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49881 0))(
  ( (Unit!49882) )
))
(declare-fun lt!649902 () Unit!49881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49881)

(assert (=> b!1490867 (= lt!649902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490868 () Bool)

(declare-fun res!1014269 () Bool)

(assert (=> b!1490868 (=> (not res!1014269) (not e!835304))))

(assert (=> b!1490868 (= res!1014269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126854 res!1014272) b!1490853))

(assert (= (and b!1490853 res!1014279) b!1490863))

(assert (= (and b!1490863 res!1014275) b!1490851))

(assert (= (and b!1490851 res!1014282) b!1490868))

(assert (= (and b!1490868 res!1014269) b!1490862))

(assert (= (and b!1490862 res!1014271) b!1490864))

(assert (= (and b!1490864 res!1014283) b!1490858))

(assert (= (and b!1490858 res!1014270) b!1490854))

(assert (= (and b!1490854 res!1014268) b!1490865))

(assert (= (and b!1490865 res!1014281) b!1490855))

(assert (= (and b!1490855 res!1014277) b!1490852))

(assert (= (and b!1490852 c!137821) b!1490859))

(assert (= (and b!1490852 (not c!137821)) b!1490860))

(assert (= (and b!1490852 res!1014276) b!1490857))

(assert (= (and b!1490857 res!1014274) b!1490867))

(assert (= (and b!1490867 res!1014280) b!1490861))

(assert (= (and b!1490861 res!1014273) b!1490856))

(assert (= (and b!1490867 (not res!1014278)) b!1490866))

(declare-fun m!1374447 () Bool)

(assert (=> b!1490856 m!1374447))

(declare-fun m!1374449 () Bool)

(assert (=> b!1490856 m!1374449))

(declare-fun m!1374451 () Bool)

(assert (=> start!126854 m!1374451))

(declare-fun m!1374453 () Bool)

(assert (=> start!126854 m!1374453))

(declare-fun m!1374455 () Bool)

(assert (=> b!1490868 m!1374455))

(declare-fun m!1374457 () Bool)

(assert (=> b!1490855 m!1374457))

(assert (=> b!1490855 m!1374457))

(declare-fun m!1374459 () Bool)

(assert (=> b!1490855 m!1374459))

(declare-fun m!1374461 () Bool)

(assert (=> b!1490855 m!1374461))

(declare-fun m!1374463 () Bool)

(assert (=> b!1490855 m!1374463))

(assert (=> b!1490851 m!1374449))

(assert (=> b!1490851 m!1374449))

(declare-fun m!1374465 () Bool)

(assert (=> b!1490851 m!1374465))

(declare-fun m!1374467 () Bool)

(assert (=> b!1490866 m!1374467))

(declare-fun m!1374469 () Bool)

(assert (=> b!1490860 m!1374469))

(declare-fun m!1374471 () Bool)

(assert (=> b!1490860 m!1374471))

(declare-fun m!1374473 () Bool)

(assert (=> b!1490867 m!1374473))

(assert (=> b!1490867 m!1374461))

(declare-fun m!1374475 () Bool)

(assert (=> b!1490867 m!1374475))

(declare-fun m!1374477 () Bool)

(assert (=> b!1490867 m!1374477))

(declare-fun m!1374479 () Bool)

(assert (=> b!1490867 m!1374479))

(assert (=> b!1490867 m!1374449))

(assert (=> b!1490858 m!1374461))

(declare-fun m!1374481 () Bool)

(assert (=> b!1490858 m!1374481))

(declare-fun m!1374483 () Bool)

(assert (=> b!1490863 m!1374483))

(assert (=> b!1490863 m!1374483))

(declare-fun m!1374485 () Bool)

(assert (=> b!1490863 m!1374485))

(assert (=> b!1490854 m!1374449))

(assert (=> b!1490854 m!1374449))

(declare-fun m!1374487 () Bool)

(assert (=> b!1490854 m!1374487))

(assert (=> b!1490854 m!1374487))

(assert (=> b!1490854 m!1374449))

(declare-fun m!1374489 () Bool)

(assert (=> b!1490854 m!1374489))

(declare-fun m!1374491 () Bool)

(assert (=> b!1490862 m!1374491))

(assert (=> b!1490865 m!1374449))

(assert (=> b!1490865 m!1374449))

(declare-fun m!1374493 () Bool)

(assert (=> b!1490865 m!1374493))

(assert (=> b!1490861 m!1374449))

(assert (=> b!1490861 m!1374449))

(declare-fun m!1374495 () Bool)

(assert (=> b!1490861 m!1374495))

(declare-fun m!1374497 () Bool)

(assert (=> b!1490859 m!1374497))

(check-sat (not b!1490861) (not b!1490855) (not b!1490863) (not b!1490867) (not b!1490860) (not start!126854) (not b!1490866) (not b!1490862) (not b!1490859) (not b!1490865) (not b!1490851) (not b!1490854) (not b!1490868))
(check-sat)
