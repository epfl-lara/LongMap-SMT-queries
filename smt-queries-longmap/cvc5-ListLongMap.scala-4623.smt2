; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64372 () Bool)

(assert start!64372)

(declare-fun b!723897 () Bool)

(declare-fun res!485413 () Bool)

(declare-fun e!405497 () Bool)

(assert (=> b!723897 (=> (not res!485413) (not e!405497))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40953 0))(
  ( (array!40954 (arr!19599 (Array (_ BitVec 32) (_ BitVec 64))) (size!20020 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40953)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723897 (= res!485413 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19599 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723898 () Bool)

(declare-fun e!405498 () Bool)

(assert (=> b!723898 (= e!405498 (not true))))

(declare-fun e!405501 () Bool)

(assert (=> b!723898 e!405501))

(declare-fun res!485420 () Bool)

(assert (=> b!723898 (=> (not res!485420) (not e!405501))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40953 (_ BitVec 32)) Bool)

(assert (=> b!723898 (= res!485420 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24716 0))(
  ( (Unit!24717) )
))
(declare-fun lt!320819 () Unit!24716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24716)

(assert (=> b!723898 (= lt!320819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723899 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405500 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7199 0))(
  ( (MissingZero!7199 (index!31164 (_ BitVec 32))) (Found!7199 (index!31165 (_ BitVec 32))) (Intermediate!7199 (undefined!8011 Bool) (index!31166 (_ BitVec 32)) (x!62160 (_ BitVec 32))) (Undefined!7199) (MissingVacant!7199 (index!31167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40953 (_ BitVec 32)) SeekEntryResult!7199)

(assert (=> b!723899 (= e!405500 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19599 a!3186) j!159) a!3186 mask!3328) (Found!7199 j!159)))))

(declare-fun b!723900 () Bool)

(declare-fun res!485410 () Bool)

(declare-fun e!405502 () Bool)

(assert (=> b!723900 (=> (not res!485410) (not e!405502))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723900 (= res!485410 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723901 () Bool)

(declare-fun res!485415 () Bool)

(assert (=> b!723901 (=> (not res!485415) (not e!405497))))

(assert (=> b!723901 (= res!485415 e!405500)))

(declare-fun c!79615 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723901 (= c!79615 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!320818 () SeekEntryResult!7199)

(declare-fun b!723902 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40953 (_ BitVec 32)) SeekEntryResult!7199)

(assert (=> b!723902 (= e!405500 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19599 a!3186) j!159) a!3186 mask!3328) lt!320818))))

(declare-fun b!723903 () Bool)

(declare-fun res!485418 () Bool)

(declare-fun e!405499 () Bool)

(assert (=> b!723903 (=> (not res!485418) (not e!405499))))

(assert (=> b!723903 (= res!485418 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20020 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20020 a!3186))))))

(declare-fun b!723904 () Bool)

(assert (=> b!723904 (= e!405499 e!405497)))

(declare-fun res!485416 () Bool)

(assert (=> b!723904 (=> (not res!485416) (not e!405497))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723904 (= res!485416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19599 a!3186) j!159) mask!3328) (select (arr!19599 a!3186) j!159) a!3186 mask!3328) lt!320818))))

(assert (=> b!723904 (= lt!320818 (Intermediate!7199 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723905 () Bool)

(declare-fun res!485422 () Bool)

(assert (=> b!723905 (=> (not res!485422) (not e!405499))))

(declare-datatypes ((List!13601 0))(
  ( (Nil!13598) (Cons!13597 (h!14651 (_ BitVec 64)) (t!19916 List!13601)) )
))
(declare-fun arrayNoDuplicates!0 (array!40953 (_ BitVec 32) List!13601) Bool)

(assert (=> b!723905 (= res!485422 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13598))))

(declare-fun b!723907 () Bool)

(declare-fun res!485421 () Bool)

(assert (=> b!723907 (=> (not res!485421) (not e!405499))))

(assert (=> b!723907 (= res!485421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723908 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40953 (_ BitVec 32)) SeekEntryResult!7199)

(assert (=> b!723908 (= e!405501 (= (seekEntryOrOpen!0 (select (arr!19599 a!3186) j!159) a!3186 mask!3328) (Found!7199 j!159)))))

(declare-fun b!723909 () Bool)

(declare-fun res!485412 () Bool)

(assert (=> b!723909 (=> (not res!485412) (not e!405502))))

(assert (=> b!723909 (= res!485412 (and (= (size!20020 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20020 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20020 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723910 () Bool)

(declare-fun res!485411 () Bool)

(assert (=> b!723910 (=> (not res!485411) (not e!405502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723910 (= res!485411 (validKeyInArray!0 k!2102))))

(declare-fun b!723911 () Bool)

(declare-fun res!485423 () Bool)

(assert (=> b!723911 (=> (not res!485423) (not e!405502))))

(assert (=> b!723911 (= res!485423 (validKeyInArray!0 (select (arr!19599 a!3186) j!159)))))

(declare-fun b!723912 () Bool)

(assert (=> b!723912 (= e!405502 e!405499)))

(declare-fun res!485417 () Bool)

(assert (=> b!723912 (=> (not res!485417) (not e!405499))))

(declare-fun lt!320816 () SeekEntryResult!7199)

(assert (=> b!723912 (= res!485417 (or (= lt!320816 (MissingZero!7199 i!1173)) (= lt!320816 (MissingVacant!7199 i!1173))))))

(assert (=> b!723912 (= lt!320816 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723906 () Bool)

(assert (=> b!723906 (= e!405497 e!405498)))

(declare-fun res!485414 () Bool)

(assert (=> b!723906 (=> (not res!485414) (not e!405498))))

(declare-fun lt!320817 () (_ BitVec 64))

(declare-fun lt!320815 () array!40953)

(assert (=> b!723906 (= res!485414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320817 mask!3328) lt!320817 lt!320815 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320817 lt!320815 mask!3328)))))

(assert (=> b!723906 (= lt!320817 (select (store (arr!19599 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723906 (= lt!320815 (array!40954 (store (arr!19599 a!3186) i!1173 k!2102) (size!20020 a!3186)))))

(declare-fun res!485419 () Bool)

(assert (=> start!64372 (=> (not res!485419) (not e!405502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64372 (= res!485419 (validMask!0 mask!3328))))

(assert (=> start!64372 e!405502))

(assert (=> start!64372 true))

(declare-fun array_inv!15395 (array!40953) Bool)

(assert (=> start!64372 (array_inv!15395 a!3186)))

(assert (= (and start!64372 res!485419) b!723909))

(assert (= (and b!723909 res!485412) b!723911))

(assert (= (and b!723911 res!485423) b!723910))

(assert (= (and b!723910 res!485411) b!723900))

(assert (= (and b!723900 res!485410) b!723912))

(assert (= (and b!723912 res!485417) b!723907))

(assert (= (and b!723907 res!485421) b!723905))

(assert (= (and b!723905 res!485422) b!723903))

(assert (= (and b!723903 res!485418) b!723904))

(assert (= (and b!723904 res!485416) b!723897))

(assert (= (and b!723897 res!485413) b!723901))

(assert (= (and b!723901 c!79615) b!723902))

(assert (= (and b!723901 (not c!79615)) b!723899))

(assert (= (and b!723901 res!485415) b!723906))

(assert (= (and b!723906 res!485414) b!723898))

(assert (= (and b!723898 res!485420) b!723908))

(declare-fun m!678301 () Bool)

(assert (=> b!723899 m!678301))

(assert (=> b!723899 m!678301))

(declare-fun m!678303 () Bool)

(assert (=> b!723899 m!678303))

(declare-fun m!678305 () Bool)

(assert (=> b!723907 m!678305))

(declare-fun m!678307 () Bool)

(assert (=> b!723905 m!678307))

(assert (=> b!723904 m!678301))

(assert (=> b!723904 m!678301))

(declare-fun m!678309 () Bool)

(assert (=> b!723904 m!678309))

(assert (=> b!723904 m!678309))

(assert (=> b!723904 m!678301))

(declare-fun m!678311 () Bool)

(assert (=> b!723904 m!678311))

(declare-fun m!678313 () Bool)

(assert (=> start!64372 m!678313))

(declare-fun m!678315 () Bool)

(assert (=> start!64372 m!678315))

(declare-fun m!678317 () Bool)

(assert (=> b!723897 m!678317))

(declare-fun m!678319 () Bool)

(assert (=> b!723912 m!678319))

(declare-fun m!678321 () Bool)

(assert (=> b!723898 m!678321))

(declare-fun m!678323 () Bool)

(assert (=> b!723898 m!678323))

(declare-fun m!678325 () Bool)

(assert (=> b!723900 m!678325))

(assert (=> b!723908 m!678301))

(assert (=> b!723908 m!678301))

(declare-fun m!678327 () Bool)

(assert (=> b!723908 m!678327))

(assert (=> b!723902 m!678301))

(assert (=> b!723902 m!678301))

(declare-fun m!678329 () Bool)

(assert (=> b!723902 m!678329))

(declare-fun m!678331 () Bool)

(assert (=> b!723910 m!678331))

(declare-fun m!678333 () Bool)

(assert (=> b!723906 m!678333))

(declare-fun m!678335 () Bool)

(assert (=> b!723906 m!678335))

(declare-fun m!678337 () Bool)

(assert (=> b!723906 m!678337))

(assert (=> b!723906 m!678335))

(declare-fun m!678339 () Bool)

(assert (=> b!723906 m!678339))

(declare-fun m!678341 () Bool)

(assert (=> b!723906 m!678341))

(assert (=> b!723911 m!678301))

(assert (=> b!723911 m!678301))

(declare-fun m!678343 () Bool)

(assert (=> b!723911 m!678343))

(push 1)

