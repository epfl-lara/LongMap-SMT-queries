; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125056 () Bool)

(assert start!125056)

(declare-fun b!1456287 () Bool)

(declare-fun res!986882 () Bool)

(declare-fun e!819342 () Bool)

(assert (=> b!1456287 (=> (not res!986882) (not e!819342))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11807 0))(
  ( (MissingZero!11807 (index!49620 (_ BitVec 32))) (Found!11807 (index!49621 (_ BitVec 32))) (Intermediate!11807 (undefined!12619 Bool) (index!49622 (_ BitVec 32)) (x!131243 (_ BitVec 32))) (Undefined!11807) (MissingVacant!11807 (index!49623 (_ BitVec 32))) )
))
(declare-fun lt!638101 () SeekEntryResult!11807)

(declare-datatypes ((array!98482 0))(
  ( (array!98483 (arr!47530 (Array (_ BitVec 32) (_ BitVec 64))) (size!48082 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11807)

(assert (=> b!1456287 (= res!986882 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!638101))))

(declare-fun b!1456288 () Bool)

(declare-fun res!986883 () Bool)

(declare-fun e!819340 () Bool)

(assert (=> b!1456288 (=> (not res!986883) (not e!819340))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456288 (= res!986883 (and (= (size!48082 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48082 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48082 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456289 () Bool)

(declare-fun e!819345 () Bool)

(assert (=> b!1456289 (= e!819345 e!819342)))

(declare-fun res!986895 () Bool)

(assert (=> b!1456289 (=> (not res!986895) (not e!819342))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456289 (= res!986895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47530 a!2862) j!93) mask!2687) (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!638101))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456289 (= lt!638101 (Intermediate!11807 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456291 () Bool)

(declare-fun res!986884 () Bool)

(assert (=> b!1456291 (=> (not res!986884) (not e!819340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98482 (_ BitVec 32)) Bool)

(assert (=> b!1456291 (= res!986884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456292 () Bool)

(declare-fun res!986885 () Bool)

(assert (=> b!1456292 (=> (not res!986885) (not e!819340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456292 (= res!986885 (validKeyInArray!0 (select (arr!47530 a!2862) i!1006)))))

(declare-fun b!1456293 () Bool)

(declare-fun e!819337 () Bool)

(declare-fun e!819336 () Bool)

(assert (=> b!1456293 (= e!819337 (not e!819336))))

(declare-fun res!986879 () Bool)

(assert (=> b!1456293 (=> res!986879 e!819336)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456293 (= res!986879 (or (and (= (select (arr!47530 a!2862) index!646) (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47530 a!2862) index!646) (select (arr!47530 a!2862) j!93))) (= (select (arr!47530 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819344 () Bool)

(assert (=> b!1456293 e!819344))

(declare-fun res!986888 () Bool)

(assert (=> b!1456293 (=> (not res!986888) (not e!819344))))

(assert (=> b!1456293 (= res!986888 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48951 0))(
  ( (Unit!48952) )
))
(declare-fun lt!638100 () Unit!48951)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48951)

(assert (=> b!1456293 (= lt!638100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1456294 () Bool)

(assert (=> b!1456294 (= e!819344 (and (or (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47530 a!2862) intermediateBeforeIndex!19) (select (arr!47530 a!2862) j!93))) (let ((bdg!53251 (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47530 a!2862) index!646) bdg!53251) (= (select (arr!47530 a!2862) index!646) (select (arr!47530 a!2862) j!93))) (= (select (arr!47530 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53251 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456295 () Bool)

(declare-fun e!819339 () Bool)

(assert (=> b!1456295 (= e!819339 true)))

(declare-fun lt!638098 () Bool)

(declare-fun e!819338 () Bool)

(assert (=> b!1456295 (= lt!638098 e!819338)))

(declare-fun c!134218 () Bool)

(assert (=> b!1456295 (= c!134218 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456296 () Bool)

(declare-fun res!986893 () Bool)

(assert (=> b!1456296 (=> (not res!986893) (not e!819340))))

(assert (=> b!1456296 (= res!986893 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48082 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48082 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48082 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456297 () Bool)

(declare-fun res!986887 () Bool)

(assert (=> b!1456297 (=> (not res!986887) (not e!819337))))

(assert (=> b!1456297 (= res!986887 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456298 () Bool)

(declare-fun res!986890 () Bool)

(assert (=> b!1456298 (=> (not res!986890) (not e!819344))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11807)

(assert (=> b!1456298 (= res!986890 (= (seekEntryOrOpen!0 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) (Found!11807 j!93)))))

(declare-fun b!1456299 () Bool)

(declare-fun res!986886 () Bool)

(assert (=> b!1456299 (=> (not res!986886) (not e!819340))))

(assert (=> b!1456299 (= res!986886 (validKeyInArray!0 (select (arr!47530 a!2862) j!93)))))

(declare-fun b!1456300 () Bool)

(declare-fun res!986891 () Bool)

(assert (=> b!1456300 (=> res!986891 e!819339)))

(declare-fun lt!638103 () (_ BitVec 32))

(assert (=> b!1456300 (= res!986891 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638103 (select (arr!47530 a!2862) j!93) a!2862 mask!2687) lt!638101)))))

(declare-fun b!1456301 () Bool)

(assert (=> b!1456301 (= e!819340 e!819345)))

(declare-fun res!986892 () Bool)

(assert (=> b!1456301 (=> (not res!986892) (not e!819345))))

(assert (=> b!1456301 (= res!986892 (= (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!638097 () array!98482)

(assert (=> b!1456301 (= lt!638097 (array!98483 (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48082 a!2862)))))

(declare-fun lt!638102 () SeekEntryResult!11807)

(declare-fun b!1456302 () Bool)

(declare-fun lt!638099 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98482 (_ BitVec 32)) SeekEntryResult!11807)

(assert (=> b!1456302 (= e!819338 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638103 intermediateAfterIndex!19 lt!638099 lt!638097 mask!2687) lt!638102)))))

(declare-fun res!986894 () Bool)

(assert (=> start!125056 (=> (not res!986894) (not e!819340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125056 (= res!986894 (validMask!0 mask!2687))))

(assert (=> start!125056 e!819340))

(assert (=> start!125056 true))

(declare-fun array_inv!36763 (array!98482) Bool)

(assert (=> start!125056 (array_inv!36763 a!2862)))

(declare-fun b!1456290 () Bool)

(declare-fun res!986889 () Bool)

(assert (=> b!1456290 (=> (not res!986889) (not e!819340))))

(declare-datatypes ((List!34109 0))(
  ( (Nil!34106) (Cons!34105 (h!35455 (_ BitVec 64)) (t!48795 List!34109)) )
))
(declare-fun arrayNoDuplicates!0 (array!98482 (_ BitVec 32) List!34109) Bool)

(assert (=> b!1456290 (= res!986889 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34106))))

(declare-fun b!1456303 () Bool)

(declare-fun res!986896 () Bool)

(assert (=> b!1456303 (=> (not res!986896) (not e!819337))))

(declare-fun e!819341 () Bool)

(assert (=> b!1456303 (= res!986896 e!819341)))

(declare-fun c!134217 () Bool)

(assert (=> b!1456303 (= c!134217 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456304 () Bool)

(assert (=> b!1456304 (= e!819341 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638099 lt!638097 mask!2687) (seekEntryOrOpen!0 lt!638099 lt!638097 mask!2687)))))

(declare-fun lt!638096 () SeekEntryResult!11807)

(declare-fun b!1456305 () Bool)

(assert (=> b!1456305 (= e!819338 (not (= lt!638096 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638103 lt!638099 lt!638097 mask!2687))))))

(declare-fun b!1456306 () Bool)

(assert (=> b!1456306 (= e!819341 (= lt!638096 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638099 lt!638097 mask!2687)))))

(declare-fun b!1456307 () Bool)

(assert (=> b!1456307 (= e!819342 e!819337)))

(declare-fun res!986880 () Bool)

(assert (=> b!1456307 (=> (not res!986880) (not e!819337))))

(assert (=> b!1456307 (= res!986880 (= lt!638096 (Intermediate!11807 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456307 (= lt!638096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638099 mask!2687) lt!638099 lt!638097 mask!2687))))

(assert (=> b!1456307 (= lt!638099 (select (store (arr!47530 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456308 () Bool)

(assert (=> b!1456308 (= e!819336 e!819339)))

(declare-fun res!986881 () Bool)

(assert (=> b!1456308 (=> res!986881 e!819339)))

(assert (=> b!1456308 (= res!986881 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638103 #b00000000000000000000000000000000) (bvsge lt!638103 (size!48082 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456308 (= lt!638103 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1456308 (= lt!638102 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638099 lt!638097 mask!2687))))

(assert (=> b!1456308 (= lt!638102 (seekEntryOrOpen!0 lt!638099 lt!638097 mask!2687))))

(assert (= (and start!125056 res!986894) b!1456288))

(assert (= (and b!1456288 res!986883) b!1456292))

(assert (= (and b!1456292 res!986885) b!1456299))

(assert (= (and b!1456299 res!986886) b!1456291))

(assert (= (and b!1456291 res!986884) b!1456290))

(assert (= (and b!1456290 res!986889) b!1456296))

(assert (= (and b!1456296 res!986893) b!1456301))

(assert (= (and b!1456301 res!986892) b!1456289))

(assert (= (and b!1456289 res!986895) b!1456287))

(assert (= (and b!1456287 res!986882) b!1456307))

(assert (= (and b!1456307 res!986880) b!1456303))

(assert (= (and b!1456303 c!134217) b!1456306))

(assert (= (and b!1456303 (not c!134217)) b!1456304))

(assert (= (and b!1456303 res!986896) b!1456297))

(assert (= (and b!1456297 res!986887) b!1456293))

(assert (= (and b!1456293 res!986888) b!1456298))

(assert (= (and b!1456298 res!986890) b!1456294))

(assert (= (and b!1456293 (not res!986879)) b!1456308))

(assert (= (and b!1456308 (not res!986881)) b!1456300))

(assert (= (and b!1456300 (not res!986891)) b!1456295))

(assert (= (and b!1456295 c!134218) b!1456305))

(assert (= (and b!1456295 (not c!134218)) b!1456302))

(declare-fun m!1343901 () Bool)

(assert (=> b!1456291 m!1343901))

(declare-fun m!1343903 () Bool)

(assert (=> start!125056 m!1343903))

(declare-fun m!1343905 () Bool)

(assert (=> start!125056 m!1343905))

(declare-fun m!1343907 () Bool)

(assert (=> b!1456302 m!1343907))

(declare-fun m!1343909 () Bool)

(assert (=> b!1456301 m!1343909))

(declare-fun m!1343911 () Bool)

(assert (=> b!1456301 m!1343911))

(declare-fun m!1343913 () Bool)

(assert (=> b!1456307 m!1343913))

(assert (=> b!1456307 m!1343913))

(declare-fun m!1343915 () Bool)

(assert (=> b!1456307 m!1343915))

(assert (=> b!1456307 m!1343909))

(declare-fun m!1343917 () Bool)

(assert (=> b!1456307 m!1343917))

(declare-fun m!1343919 () Bool)

(assert (=> b!1456292 m!1343919))

(assert (=> b!1456292 m!1343919))

(declare-fun m!1343921 () Bool)

(assert (=> b!1456292 m!1343921))

(declare-fun m!1343923 () Bool)

(assert (=> b!1456289 m!1343923))

(assert (=> b!1456289 m!1343923))

(declare-fun m!1343925 () Bool)

(assert (=> b!1456289 m!1343925))

(assert (=> b!1456289 m!1343925))

(assert (=> b!1456289 m!1343923))

(declare-fun m!1343927 () Bool)

(assert (=> b!1456289 m!1343927))

(declare-fun m!1343929 () Bool)

(assert (=> b!1456306 m!1343929))

(declare-fun m!1343931 () Bool)

(assert (=> b!1456304 m!1343931))

(declare-fun m!1343933 () Bool)

(assert (=> b!1456304 m!1343933))

(declare-fun m!1343935 () Bool)

(assert (=> b!1456305 m!1343935))

(assert (=> b!1456294 m!1343909))

(declare-fun m!1343937 () Bool)

(assert (=> b!1456294 m!1343937))

(declare-fun m!1343939 () Bool)

(assert (=> b!1456294 m!1343939))

(declare-fun m!1343941 () Bool)

(assert (=> b!1456294 m!1343941))

(assert (=> b!1456294 m!1343923))

(assert (=> b!1456287 m!1343923))

(assert (=> b!1456287 m!1343923))

(declare-fun m!1343943 () Bool)

(assert (=> b!1456287 m!1343943))

(declare-fun m!1343945 () Bool)

(assert (=> b!1456290 m!1343945))

(declare-fun m!1343947 () Bool)

(assert (=> b!1456308 m!1343947))

(assert (=> b!1456308 m!1343931))

(assert (=> b!1456308 m!1343933))

(declare-fun m!1343949 () Bool)

(assert (=> b!1456293 m!1343949))

(assert (=> b!1456293 m!1343909))

(assert (=> b!1456293 m!1343939))

(assert (=> b!1456293 m!1343941))

(declare-fun m!1343951 () Bool)

(assert (=> b!1456293 m!1343951))

(assert (=> b!1456293 m!1343923))

(assert (=> b!1456300 m!1343923))

(assert (=> b!1456300 m!1343923))

(declare-fun m!1343953 () Bool)

(assert (=> b!1456300 m!1343953))

(assert (=> b!1456299 m!1343923))

(assert (=> b!1456299 m!1343923))

(declare-fun m!1343955 () Bool)

(assert (=> b!1456299 m!1343955))

(assert (=> b!1456298 m!1343923))

(assert (=> b!1456298 m!1343923))

(declare-fun m!1343957 () Bool)

(assert (=> b!1456298 m!1343957))

(check-sat (not b!1456299) (not b!1456304) (not b!1456305) (not b!1456287) (not b!1456302) (not b!1456306) (not start!125056) (not b!1456292) (not b!1456298) (not b!1456308) (not b!1456289) (not b!1456300) (not b!1456307) (not b!1456293) (not b!1456291) (not b!1456290))
(check-sat)
