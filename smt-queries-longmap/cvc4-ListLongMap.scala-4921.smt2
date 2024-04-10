; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67774 () Bool)

(assert start!67774)

(declare-fun b!787415 () Bool)

(declare-datatypes ((Unit!27268 0))(
  ( (Unit!27269) )
))
(declare-fun e!437696 () Unit!27268)

(declare-fun Unit!27270 () Unit!27268)

(assert (=> b!787415 (= e!437696 Unit!27270)))

(declare-fun b!787416 () Bool)

(declare-fun e!437694 () Bool)

(declare-fun e!437685 () Bool)

(assert (=> b!787416 (= e!437694 e!437685)))

(declare-fun res!533304 () Bool)

(assert (=> b!787416 (=> (not res!533304) (not e!437685))))

(declare-datatypes ((SeekEntryResult!8095 0))(
  ( (MissingZero!8095 (index!34748 (_ BitVec 32))) (Found!8095 (index!34749 (_ BitVec 32))) (Intermediate!8095 (undefined!8907 Bool) (index!34750 (_ BitVec 32)) (x!65683 (_ BitVec 32))) (Undefined!8095) (MissingVacant!8095 (index!34751 (_ BitVec 32))) )
))
(declare-fun lt!351248 () SeekEntryResult!8095)

(declare-datatypes ((array!42814 0))(
  ( (array!42815 (arr!20495 (Array (_ BitVec 32) (_ BitVec 64))) (size!20916 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42814)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787416 (= res!533304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20495 a!3186) j!159) mask!3328) (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351248))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787416 (= lt!351248 (Intermediate!8095 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787417 () Bool)

(declare-fun res!533296 () Bool)

(assert (=> b!787417 (=> (not res!533296) (not e!437685))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787417 (= res!533296 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20495 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787418 () Bool)

(declare-fun e!437692 () Bool)

(declare-fun e!437689 () Bool)

(assert (=> b!787418 (= e!437692 (not e!437689))))

(declare-fun res!533311 () Bool)

(assert (=> b!787418 (=> res!533311 e!437689)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351238 () SeekEntryResult!8095)

(assert (=> b!787418 (= res!533311 (or (not (is-Intermediate!8095 lt!351238)) (bvslt x!1131 (x!65683 lt!351238)) (not (= x!1131 (x!65683 lt!351238))) (not (= index!1321 (index!34750 lt!351238)))))))

(declare-fun e!437686 () Bool)

(assert (=> b!787418 e!437686))

(declare-fun res!533305 () Bool)

(assert (=> b!787418 (=> (not res!533305) (not e!437686))))

(declare-fun lt!351241 () SeekEntryResult!8095)

(declare-fun lt!351245 () SeekEntryResult!8095)

(assert (=> b!787418 (= res!533305 (= lt!351241 lt!351245))))

(assert (=> b!787418 (= lt!351245 (Found!8095 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!787418 (= lt!351241 (seekEntryOrOpen!0 (select (arr!20495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42814 (_ BitVec 32)) Bool)

(assert (=> b!787418 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351240 () Unit!27268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27268)

(assert (=> b!787418 (= lt!351240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787420 () Bool)

(declare-fun res!533303 () Bool)

(declare-fun e!437693 () Bool)

(assert (=> b!787420 (=> (not res!533303) (not e!437693))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787420 (= res!533303 (validKeyInArray!0 k!2102))))

(declare-fun b!787421 () Bool)

(declare-fun e!437687 () Bool)

(declare-fun lt!351244 () SeekEntryResult!8095)

(assert (=> b!787421 (= e!437687 (= lt!351241 lt!351244))))

(declare-fun b!787422 () Bool)

(declare-fun Unit!27271 () Unit!27268)

(assert (=> b!787422 (= e!437696 Unit!27271)))

(assert (=> b!787422 false))

(declare-fun b!787423 () Bool)

(declare-fun e!437690 () Bool)

(assert (=> b!787423 (= e!437689 e!437690)))

(declare-fun res!533308 () Bool)

(assert (=> b!787423 (=> res!533308 e!437690)))

(assert (=> b!787423 (= res!533308 (not (= lt!351244 lt!351245)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!787423 (= lt!351244 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787424 () Bool)

(declare-fun res!533306 () Bool)

(assert (=> b!787424 (=> (not res!533306) (not e!437685))))

(declare-fun e!437691 () Bool)

(assert (=> b!787424 (= res!533306 e!437691)))

(declare-fun c!87468 () Bool)

(assert (=> b!787424 (= c!87468 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787425 () Bool)

(declare-fun e!437688 () Bool)

(assert (=> b!787425 (= e!437688 true)))

(assert (=> b!787425 e!437687))

(declare-fun res!533307 () Bool)

(assert (=> b!787425 (=> (not res!533307) (not e!437687))))

(declare-fun lt!351246 () (_ BitVec 64))

(assert (=> b!787425 (= res!533307 (= lt!351246 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351242 () Unit!27268)

(assert (=> b!787425 (= lt!351242 e!437696)))

(declare-fun c!87469 () Bool)

(assert (=> b!787425 (= c!87469 (= lt!351246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787426 () Bool)

(assert (=> b!787426 (= e!437693 e!437694)))

(declare-fun res!533300 () Bool)

(assert (=> b!787426 (=> (not res!533300) (not e!437694))))

(declare-fun lt!351247 () SeekEntryResult!8095)

(assert (=> b!787426 (= res!533300 (or (= lt!351247 (MissingZero!8095 i!1173)) (= lt!351247 (MissingVacant!8095 i!1173))))))

(assert (=> b!787426 (= lt!351247 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787427 () Bool)

(declare-fun res!533295 () Bool)

(assert (=> b!787427 (=> (not res!533295) (not e!437694))))

(declare-datatypes ((List!14497 0))(
  ( (Nil!14494) (Cons!14493 (h!15616 (_ BitVec 64)) (t!20812 List!14497)) )
))
(declare-fun arrayNoDuplicates!0 (array!42814 (_ BitVec 32) List!14497) Bool)

(assert (=> b!787427 (= res!533295 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14494))))

(declare-fun b!787428 () Bool)

(assert (=> b!787428 (= e!437690 e!437688)))

(declare-fun res!533309 () Bool)

(assert (=> b!787428 (=> res!533309 e!437688)))

(declare-fun lt!351243 () (_ BitVec 64))

(assert (=> b!787428 (= res!533309 (= lt!351246 lt!351243))))

(assert (=> b!787428 (= lt!351246 (select (store (arr!20495 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787429 () Bool)

(declare-fun res!533298 () Bool)

(assert (=> b!787429 (=> (not res!533298) (not e!437687))))

(declare-fun lt!351239 () array!42814)

(assert (=> b!787429 (= res!533298 (= (seekEntryOrOpen!0 lt!351243 lt!351239 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351243 lt!351239 mask!3328)))))

(declare-fun res!533294 () Bool)

(assert (=> start!67774 (=> (not res!533294) (not e!437693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67774 (= res!533294 (validMask!0 mask!3328))))

(assert (=> start!67774 e!437693))

(assert (=> start!67774 true))

(declare-fun array_inv!16291 (array!42814) Bool)

(assert (=> start!67774 (array_inv!16291 a!3186)))

(declare-fun b!787419 () Bool)

(declare-fun res!533299 () Bool)

(assert (=> b!787419 (=> (not res!533299) (not e!437693))))

(assert (=> b!787419 (= res!533299 (validKeyInArray!0 (select (arr!20495 a!3186) j!159)))))

(declare-fun b!787430 () Bool)

(declare-fun res!533302 () Bool)

(assert (=> b!787430 (=> (not res!533302) (not e!437693))))

(declare-fun arrayContainsKey!0 (array!42814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787430 (= res!533302 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787431 () Bool)

(assert (=> b!787431 (= e!437686 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351245))))

(declare-fun b!787432 () Bool)

(assert (=> b!787432 (= e!437691 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) (Found!8095 j!159)))))

(declare-fun b!787433 () Bool)

(declare-fun res!533312 () Bool)

(assert (=> b!787433 (=> (not res!533312) (not e!437693))))

(assert (=> b!787433 (= res!533312 (and (= (size!20916 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20916 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20916 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787434 () Bool)

(assert (=> b!787434 (= e!437691 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351248))))

(declare-fun b!787435 () Bool)

(assert (=> b!787435 (= e!437685 e!437692)))

(declare-fun res!533310 () Bool)

(assert (=> b!787435 (=> (not res!533310) (not e!437692))))

(declare-fun lt!351237 () SeekEntryResult!8095)

(assert (=> b!787435 (= res!533310 (= lt!351237 lt!351238))))

(assert (=> b!787435 (= lt!351238 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351243 lt!351239 mask!3328))))

(assert (=> b!787435 (= lt!351237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351243 mask!3328) lt!351243 lt!351239 mask!3328))))

(assert (=> b!787435 (= lt!351243 (select (store (arr!20495 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787435 (= lt!351239 (array!42815 (store (arr!20495 a!3186) i!1173 k!2102) (size!20916 a!3186)))))

(declare-fun b!787436 () Bool)

(declare-fun res!533301 () Bool)

(assert (=> b!787436 (=> (not res!533301) (not e!437694))))

(assert (=> b!787436 (= res!533301 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20916 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20916 a!3186))))))

(declare-fun b!787437 () Bool)

(declare-fun res!533297 () Bool)

(assert (=> b!787437 (=> (not res!533297) (not e!437694))))

(assert (=> b!787437 (= res!533297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67774 res!533294) b!787433))

(assert (= (and b!787433 res!533312) b!787419))

(assert (= (and b!787419 res!533299) b!787420))

(assert (= (and b!787420 res!533303) b!787430))

(assert (= (and b!787430 res!533302) b!787426))

(assert (= (and b!787426 res!533300) b!787437))

(assert (= (and b!787437 res!533297) b!787427))

(assert (= (and b!787427 res!533295) b!787436))

(assert (= (and b!787436 res!533301) b!787416))

(assert (= (and b!787416 res!533304) b!787417))

(assert (= (and b!787417 res!533296) b!787424))

(assert (= (and b!787424 c!87468) b!787434))

(assert (= (and b!787424 (not c!87468)) b!787432))

(assert (= (and b!787424 res!533306) b!787435))

(assert (= (and b!787435 res!533310) b!787418))

(assert (= (and b!787418 res!533305) b!787431))

(assert (= (and b!787418 (not res!533311)) b!787423))

(assert (= (and b!787423 (not res!533308)) b!787428))

(assert (= (and b!787428 (not res!533309)) b!787425))

(assert (= (and b!787425 c!87469) b!787422))

(assert (= (and b!787425 (not c!87469)) b!787415))

(assert (= (and b!787425 res!533307) b!787429))

(assert (= (and b!787429 res!533298) b!787421))

(declare-fun m!729001 () Bool)

(assert (=> b!787423 m!729001))

(assert (=> b!787423 m!729001))

(declare-fun m!729003 () Bool)

(assert (=> b!787423 m!729003))

(declare-fun m!729005 () Bool)

(assert (=> b!787430 m!729005))

(assert (=> b!787431 m!729001))

(assert (=> b!787431 m!729001))

(declare-fun m!729007 () Bool)

(assert (=> b!787431 m!729007))

(declare-fun m!729009 () Bool)

(assert (=> b!787429 m!729009))

(declare-fun m!729011 () Bool)

(assert (=> b!787429 m!729011))

(declare-fun m!729013 () Bool)

(assert (=> b!787428 m!729013))

(declare-fun m!729015 () Bool)

(assert (=> b!787428 m!729015))

(declare-fun m!729017 () Bool)

(assert (=> b!787417 m!729017))

(assert (=> b!787432 m!729001))

(assert (=> b!787432 m!729001))

(assert (=> b!787432 m!729003))

(declare-fun m!729019 () Bool)

(assert (=> b!787427 m!729019))

(assert (=> b!787419 m!729001))

(assert (=> b!787419 m!729001))

(declare-fun m!729021 () Bool)

(assert (=> b!787419 m!729021))

(assert (=> b!787416 m!729001))

(assert (=> b!787416 m!729001))

(declare-fun m!729023 () Bool)

(assert (=> b!787416 m!729023))

(assert (=> b!787416 m!729023))

(assert (=> b!787416 m!729001))

(declare-fun m!729025 () Bool)

(assert (=> b!787416 m!729025))

(declare-fun m!729027 () Bool)

(assert (=> b!787437 m!729027))

(declare-fun m!729029 () Bool)

(assert (=> b!787426 m!729029))

(assert (=> b!787434 m!729001))

(assert (=> b!787434 m!729001))

(declare-fun m!729031 () Bool)

(assert (=> b!787434 m!729031))

(declare-fun m!729033 () Bool)

(assert (=> b!787435 m!729033))

(assert (=> b!787435 m!729013))

(declare-fun m!729035 () Bool)

(assert (=> b!787435 m!729035))

(declare-fun m!729037 () Bool)

(assert (=> b!787435 m!729037))

(assert (=> b!787435 m!729033))

(declare-fun m!729039 () Bool)

(assert (=> b!787435 m!729039))

(declare-fun m!729041 () Bool)

(assert (=> start!67774 m!729041))

(declare-fun m!729043 () Bool)

(assert (=> start!67774 m!729043))

(assert (=> b!787418 m!729001))

(assert (=> b!787418 m!729001))

(declare-fun m!729045 () Bool)

(assert (=> b!787418 m!729045))

(declare-fun m!729047 () Bool)

(assert (=> b!787418 m!729047))

(declare-fun m!729049 () Bool)

(assert (=> b!787418 m!729049))

(declare-fun m!729051 () Bool)

(assert (=> b!787420 m!729051))

(push 1)

