; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126800 () Bool)

(assert start!126800)

(declare-fun e!834634 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12323 0))(
  ( (MissingZero!12323 (index!51684 (_ BitVec 32))) (Found!12323 (index!51685 (_ BitVec 32))) (Intermediate!12323 (undefined!13135 Bool) (index!51686 (_ BitVec 32)) (x!133276 (_ BitVec 32))) (Undefined!12323) (MissingVacant!12323 (index!51687 (_ BitVec 32))) )
))
(declare-fun lt!649345 () SeekEntryResult!12323)

(declare-datatypes ((array!99571 0))(
  ( (array!99572 (arr!48058 (Array (_ BitVec 32) (_ BitVec 64))) (size!48610 (_ BitVec 32))) )
))
(declare-fun lt!649343 () array!99571)

(declare-fun b!1489293 () Bool)

(declare-fun lt!649342 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!649339 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12323)

(assert (=> b!1489293 (= e!834634 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649339 intermediateAfterIndex!19 lt!649342 lt!649343 mask!2687) lt!649345)))))

(declare-fun b!1489294 () Bool)

(declare-fun res!1012928 () Bool)

(declare-fun e!834635 () Bool)

(assert (=> b!1489294 (=> res!1012928 e!834635)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489294 (= res!1012928 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489295 () Bool)

(declare-fun res!1012926 () Bool)

(declare-fun e!834630 () Bool)

(assert (=> b!1489295 (=> (not res!1012926) (not e!834630))))

(declare-fun lt!649346 () SeekEntryResult!12323)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun a!2862 () array!99571)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12323)

(assert (=> b!1489295 (= res!1012926 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!649346))))

(declare-fun b!1489296 () Bool)

(declare-fun res!1012930 () Bool)

(declare-fun e!834627 () Bool)

(assert (=> b!1489296 (=> (not res!1012930) (not e!834627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489296 (= res!1012930 (validKeyInArray!0 (select (arr!48058 a!2862) j!93)))))

(declare-fun b!1489298 () Bool)

(declare-fun e!834628 () Bool)

(assert (=> b!1489298 (= e!834627 e!834628)))

(declare-fun res!1012931 () Bool)

(assert (=> b!1489298 (=> (not res!1012931) (not e!834628))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489298 (= res!1012931 (= (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489298 (= lt!649343 (array!99572 (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48610 a!2862)))))

(declare-fun e!834631 () Bool)

(declare-fun b!1489299 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99571 (_ BitVec 32)) SeekEntryResult!12323)

(assert (=> b!1489299 (= e!834631 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649342 lt!649343 mask!2687) (seekEntryOrOpen!0 lt!649342 lt!649343 mask!2687)))))

(declare-fun b!1489300 () Bool)

(declare-fun res!1012922 () Bool)

(declare-fun e!834629 () Bool)

(assert (=> b!1489300 (=> (not res!1012922) (not e!834629))))

(assert (=> b!1489300 (= res!1012922 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!649340 () SeekEntryResult!12323)

(declare-fun b!1489301 () Bool)

(assert (=> b!1489301 (= e!834631 (= lt!649340 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649342 lt!649343 mask!2687)))))

(declare-fun b!1489302 () Bool)

(declare-fun res!1012927 () Bool)

(assert (=> b!1489302 (=> (not res!1012927) (not e!834627))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489302 (= res!1012927 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48610 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48610 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48610 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489303 () Bool)

(declare-fun res!1012936 () Bool)

(assert (=> b!1489303 (=> (not res!1012936) (not e!834629))))

(assert (=> b!1489303 (= res!1012936 e!834631)))

(declare-fun c!137716 () Bool)

(assert (=> b!1489303 (= c!137716 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489304 () Bool)

(assert (=> b!1489304 (= e!834630 e!834629)))

(declare-fun res!1012935 () Bool)

(assert (=> b!1489304 (=> (not res!1012935) (not e!834629))))

(assert (=> b!1489304 (= res!1012935 (= lt!649340 (Intermediate!12323 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489304 (= lt!649340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649342 mask!2687) lt!649342 lt!649343 mask!2687))))

(assert (=> b!1489304 (= lt!649342 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489305 () Bool)

(declare-fun res!1012938 () Bool)

(assert (=> b!1489305 (=> (not res!1012938) (not e!834627))))

(assert (=> b!1489305 (= res!1012938 (validKeyInArray!0 (select (arr!48058 a!2862) i!1006)))))

(declare-fun b!1489306 () Bool)

(declare-fun res!1012934 () Bool)

(assert (=> b!1489306 (=> (not res!1012934) (not e!834627))))

(declare-datatypes ((List!34637 0))(
  ( (Nil!34634) (Cons!34633 (h!36016 (_ BitVec 64)) (t!49323 List!34637)) )
))
(declare-fun arrayNoDuplicates!0 (array!99571 (_ BitVec 32) List!34637) Bool)

(assert (=> b!1489306 (= res!1012934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34634))))

(declare-fun b!1489307 () Bool)

(declare-fun res!1012939 () Bool)

(assert (=> b!1489307 (=> res!1012939 e!834635)))

(assert (=> b!1489307 (= res!1012939 e!834634)))

(declare-fun c!137715 () Bool)

(assert (=> b!1489307 (= c!137715 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489308 () Bool)

(declare-fun e!834632 () Bool)

(assert (=> b!1489308 (= e!834629 (not e!834632))))

(declare-fun res!1012933 () Bool)

(assert (=> b!1489308 (=> res!1012933 e!834632)))

(assert (=> b!1489308 (= res!1012933 (or (and (= (select (arr!48058 a!2862) index!646) (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!649344 () SeekEntryResult!12323)

(assert (=> b!1489308 (and (= lt!649344 (Found!12323 j!93)) (or (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) (select (arr!48058 a!2862) j!93))) (let ((bdg!54738 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48058 a!2862) index!646) bdg!54738) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54738 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489308 (= lt!649344 (seekEntryOrOpen!0 (select (arr!48058 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99571 (_ BitVec 32)) Bool)

(assert (=> b!1489308 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49827 0))(
  ( (Unit!49828) )
))
(declare-fun lt!649338 () Unit!49827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49827)

(assert (=> b!1489308 (= lt!649338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489309 () Bool)

(assert (=> b!1489309 (= e!834635 true)))

(assert (=> b!1489309 (= lt!649344 lt!649345)))

(declare-fun lt!649341 () Unit!49827)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49827)

(assert (=> b!1489309 (= lt!649341 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649339 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489310 () Bool)

(assert (=> b!1489310 (= e!834632 e!834635)))

(declare-fun res!1012923 () Bool)

(assert (=> b!1489310 (=> res!1012923 e!834635)))

(assert (=> b!1489310 (= res!1012923 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649339 #b00000000000000000000000000000000) (bvsge lt!649339 (size!48610 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489310 (= lt!649339 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489310 (= lt!649345 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649342 lt!649343 mask!2687))))

(assert (=> b!1489310 (= lt!649345 (seekEntryOrOpen!0 lt!649342 lt!649343 mask!2687))))

(declare-fun b!1489311 () Bool)

(assert (=> b!1489311 (= e!834634 (not (= lt!649340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649339 lt!649342 lt!649343 mask!2687))))))

(declare-fun b!1489312 () Bool)

(declare-fun res!1012932 () Bool)

(assert (=> b!1489312 (=> (not res!1012932) (not e!834627))))

(assert (=> b!1489312 (= res!1012932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489313 () Bool)

(assert (=> b!1489313 (= e!834628 e!834630)))

(declare-fun res!1012929 () Bool)

(assert (=> b!1489313 (=> (not res!1012929) (not e!834630))))

(assert (=> b!1489313 (= res!1012929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48058 a!2862) j!93) mask!2687) (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!649346))))

(assert (=> b!1489313 (= lt!649346 (Intermediate!12323 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489314 () Bool)

(declare-fun res!1012924 () Bool)

(assert (=> b!1489314 (=> (not res!1012924) (not e!834627))))

(assert (=> b!1489314 (= res!1012924 (and (= (size!48610 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48610 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48610 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489297 () Bool)

(declare-fun res!1012937 () Bool)

(assert (=> b!1489297 (=> res!1012937 e!834635)))

(assert (=> b!1489297 (= res!1012937 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649339 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!649346)))))

(declare-fun res!1012925 () Bool)

(assert (=> start!126800 (=> (not res!1012925) (not e!834627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126800 (= res!1012925 (validMask!0 mask!2687))))

(assert (=> start!126800 e!834627))

(assert (=> start!126800 true))

(declare-fun array_inv!37291 (array!99571) Bool)

(assert (=> start!126800 (array_inv!37291 a!2862)))

(assert (= (and start!126800 res!1012925) b!1489314))

(assert (= (and b!1489314 res!1012924) b!1489305))

(assert (= (and b!1489305 res!1012938) b!1489296))

(assert (= (and b!1489296 res!1012930) b!1489312))

(assert (= (and b!1489312 res!1012932) b!1489306))

(assert (= (and b!1489306 res!1012934) b!1489302))

(assert (= (and b!1489302 res!1012927) b!1489298))

(assert (= (and b!1489298 res!1012931) b!1489313))

(assert (= (and b!1489313 res!1012929) b!1489295))

(assert (= (and b!1489295 res!1012926) b!1489304))

(assert (= (and b!1489304 res!1012935) b!1489303))

(assert (= (and b!1489303 c!137716) b!1489301))

(assert (= (and b!1489303 (not c!137716)) b!1489299))

(assert (= (and b!1489303 res!1012936) b!1489300))

(assert (= (and b!1489300 res!1012922) b!1489308))

(assert (= (and b!1489308 (not res!1012933)) b!1489310))

(assert (= (and b!1489310 (not res!1012923)) b!1489297))

(assert (= (and b!1489297 (not res!1012937)) b!1489307))

(assert (= (and b!1489307 c!137715) b!1489311))

(assert (= (and b!1489307 (not c!137715)) b!1489293))

(assert (= (and b!1489307 (not res!1012939)) b!1489294))

(assert (= (and b!1489294 (not res!1012928)) b!1489309))

(declare-fun m!1372971 () Bool)

(assert (=> b!1489295 m!1372971))

(assert (=> b!1489295 m!1372971))

(declare-fun m!1372973 () Bool)

(assert (=> b!1489295 m!1372973))

(assert (=> b!1489297 m!1372971))

(assert (=> b!1489297 m!1372971))

(declare-fun m!1372975 () Bool)

(assert (=> b!1489297 m!1372975))

(declare-fun m!1372977 () Bool)

(assert (=> start!126800 m!1372977))

(declare-fun m!1372979 () Bool)

(assert (=> start!126800 m!1372979))

(declare-fun m!1372981 () Bool)

(assert (=> b!1489306 m!1372981))

(declare-fun m!1372983 () Bool)

(assert (=> b!1489308 m!1372983))

(declare-fun m!1372985 () Bool)

(assert (=> b!1489308 m!1372985))

(declare-fun m!1372987 () Bool)

(assert (=> b!1489308 m!1372987))

(declare-fun m!1372989 () Bool)

(assert (=> b!1489308 m!1372989))

(declare-fun m!1372991 () Bool)

(assert (=> b!1489308 m!1372991))

(assert (=> b!1489308 m!1372971))

(declare-fun m!1372993 () Bool)

(assert (=> b!1489308 m!1372993))

(declare-fun m!1372995 () Bool)

(assert (=> b!1489308 m!1372995))

(assert (=> b!1489308 m!1372971))

(declare-fun m!1372997 () Bool)

(assert (=> b!1489310 m!1372997))

(declare-fun m!1372999 () Bool)

(assert (=> b!1489310 m!1372999))

(declare-fun m!1373001 () Bool)

(assert (=> b!1489310 m!1373001))

(declare-fun m!1373003 () Bool)

(assert (=> b!1489304 m!1373003))

(assert (=> b!1489304 m!1373003))

(declare-fun m!1373005 () Bool)

(assert (=> b!1489304 m!1373005))

(assert (=> b!1489304 m!1372985))

(declare-fun m!1373007 () Bool)

(assert (=> b!1489304 m!1373007))

(assert (=> b!1489298 m!1372985))

(declare-fun m!1373009 () Bool)

(assert (=> b!1489298 m!1373009))

(declare-fun m!1373011 () Bool)

(assert (=> b!1489312 m!1373011))

(declare-fun m!1373013 () Bool)

(assert (=> b!1489311 m!1373013))

(declare-fun m!1373015 () Bool)

(assert (=> b!1489293 m!1373015))

(assert (=> b!1489296 m!1372971))

(assert (=> b!1489296 m!1372971))

(declare-fun m!1373017 () Bool)

(assert (=> b!1489296 m!1373017))

(declare-fun m!1373019 () Bool)

(assert (=> b!1489309 m!1373019))

(declare-fun m!1373021 () Bool)

(assert (=> b!1489301 m!1373021))

(assert (=> b!1489313 m!1372971))

(assert (=> b!1489313 m!1372971))

(declare-fun m!1373023 () Bool)

(assert (=> b!1489313 m!1373023))

(assert (=> b!1489313 m!1373023))

(assert (=> b!1489313 m!1372971))

(declare-fun m!1373025 () Bool)

(assert (=> b!1489313 m!1373025))

(declare-fun m!1373027 () Bool)

(assert (=> b!1489305 m!1373027))

(assert (=> b!1489305 m!1373027))

(declare-fun m!1373029 () Bool)

(assert (=> b!1489305 m!1373029))

(assert (=> b!1489299 m!1372999))

(assert (=> b!1489299 m!1373001))

(check-sat (not b!1489306) (not b!1489313) (not b!1489301) (not start!126800) (not b!1489299) (not b!1489312) (not b!1489305) (not b!1489309) (not b!1489304) (not b!1489310) (not b!1489297) (not b!1489311) (not b!1489295) (not b!1489293) (not b!1489308) (not b!1489296))
(check-sat)
