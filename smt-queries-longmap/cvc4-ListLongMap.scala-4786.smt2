; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65780 () Bool)

(assert start!65780)

(declare-datatypes ((array!41953 0))(
  ( (array!41954 (arr!20090 (Array (_ BitVec 32) (_ BitVec 64))) (size!20511 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41953)

(declare-datatypes ((SeekEntryResult!7690 0))(
  ( (MissingZero!7690 (index!33128 (_ BitVec 32))) (Found!7690 (index!33129 (_ BitVec 32))) (Intermediate!7690 (undefined!8502 Bool) (index!33130 (_ BitVec 32)) (x!64024 (_ BitVec 32))) (Undefined!7690) (MissingVacant!7690 (index!33131 (_ BitVec 32))) )
))
(declare-fun lt!336728 () SeekEntryResult!7690)

(declare-fun b!756323 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421743 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!756323 (= e!421743 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336728))))

(declare-fun b!756324 () Bool)

(declare-fun res!511353 () Bool)

(declare-fun e!421745 () Bool)

(assert (=> b!756324 (=> (not res!511353) (not e!421745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41953 (_ BitVec 32)) Bool)

(assert (=> b!756324 (= res!511353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756325 () Bool)

(declare-fun res!511346 () Bool)

(declare-fun e!421740 () Bool)

(assert (=> b!756325 (=> (not res!511346) (not e!421740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756325 (= res!511346 (validKeyInArray!0 (select (arr!20090 a!3186) j!159)))))

(declare-fun b!756326 () Bool)

(declare-fun res!511352 () Bool)

(assert (=> b!756326 (=> (not res!511352) (not e!421745))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756326 (= res!511352 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20511 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20511 a!3186))))))

(declare-fun res!511363 () Bool)

(assert (=> start!65780 (=> (not res!511363) (not e!421740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65780 (= res!511363 (validMask!0 mask!3328))))

(assert (=> start!65780 e!421740))

(assert (=> start!65780 true))

(declare-fun array_inv!15886 (array!41953) Bool)

(assert (=> start!65780 (array_inv!15886 a!3186)))

(declare-fun b!756327 () Bool)

(declare-datatypes ((Unit!26140 0))(
  ( (Unit!26141) )
))
(declare-fun e!421736 () Unit!26140)

(declare-fun Unit!26142 () Unit!26140)

(assert (=> b!756327 (= e!421736 Unit!26142)))

(assert (=> b!756327 false))

(declare-fun b!756328 () Bool)

(declare-fun e!421735 () Bool)

(declare-fun e!421741 () Bool)

(assert (=> b!756328 (= e!421735 e!421741)))

(declare-fun res!511358 () Bool)

(assert (=> b!756328 (=> res!511358 e!421741)))

(declare-fun lt!336731 () SeekEntryResult!7690)

(declare-fun lt!336735 () SeekEntryResult!7690)

(assert (=> b!756328 (= res!511358 (not (= lt!336731 lt!336735)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!756328 (= lt!336731 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756329 () Bool)

(declare-fun e!421734 () Bool)

(declare-fun e!421738 () Bool)

(assert (=> b!756329 (= e!421734 e!421738)))

(declare-fun res!511354 () Bool)

(assert (=> b!756329 (=> (not res!511354) (not e!421738))))

(declare-fun lt!336732 () SeekEntryResult!7690)

(declare-fun lt!336736 () SeekEntryResult!7690)

(assert (=> b!756329 (= res!511354 (= lt!336732 lt!336736))))

(declare-fun lt!336734 () array!41953)

(declare-fun lt!336727 () (_ BitVec 64))

(assert (=> b!756329 (= lt!336736 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336727 lt!336734 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756329 (= lt!336732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336727 mask!3328) lt!336727 lt!336734 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!756329 (= lt!336727 (select (store (arr!20090 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756329 (= lt!336734 (array!41954 (store (arr!20090 a!3186) i!1173 k!2102) (size!20511 a!3186)))))

(declare-fun b!756330 () Bool)

(declare-fun res!511362 () Bool)

(declare-fun e!421739 () Bool)

(assert (=> b!756330 (=> (not res!511362) (not e!421739))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41953 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!756330 (= res!511362 (= (seekEntryOrOpen!0 lt!336727 lt!336734 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336727 lt!336734 mask!3328)))))

(declare-fun b!756331 () Bool)

(declare-fun e!421742 () Bool)

(assert (=> b!756331 (= e!421741 e!421742)))

(declare-fun res!511350 () Bool)

(assert (=> b!756331 (=> res!511350 e!421742)))

(declare-fun lt!336733 () (_ BitVec 64))

(assert (=> b!756331 (= res!511350 (= lt!336733 lt!336727))))

(assert (=> b!756331 (= lt!336733 (select (store (arr!20090 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756332 () Bool)

(declare-fun res!511349 () Bool)

(assert (=> b!756332 (=> (not res!511349) (not e!421745))))

(declare-datatypes ((List!14092 0))(
  ( (Nil!14089) (Cons!14088 (h!15160 (_ BitVec 64)) (t!20407 List!14092)) )
))
(declare-fun arrayNoDuplicates!0 (array!41953 (_ BitVec 32) List!14092) Bool)

(assert (=> b!756332 (= res!511349 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14089))))

(declare-fun b!756333 () Bool)

(declare-fun res!511351 () Bool)

(assert (=> b!756333 (=> (not res!511351) (not e!421740))))

(assert (=> b!756333 (= res!511351 (validKeyInArray!0 k!2102))))

(declare-fun b!756334 () Bool)

(declare-fun res!511356 () Bool)

(assert (=> b!756334 (=> (not res!511356) (not e!421740))))

(assert (=> b!756334 (= res!511356 (and (= (size!20511 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20511 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20511 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756335 () Bool)

(assert (=> b!756335 (= e!421742 true)))

(assert (=> b!756335 e!421739))

(declare-fun res!511361 () Bool)

(assert (=> b!756335 (=> (not res!511361) (not e!421739))))

(assert (=> b!756335 (= res!511361 (= lt!336733 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336737 () Unit!26140)

(assert (=> b!756335 (= lt!336737 e!421736)))

(declare-fun c!82870 () Bool)

(assert (=> b!756335 (= c!82870 (= lt!336733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756336 () Bool)

(assert (=> b!756336 (= e!421745 e!421734)))

(declare-fun res!511360 () Bool)

(assert (=> b!756336 (=> (not res!511360) (not e!421734))))

(assert (=> b!756336 (= res!511360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20090 a!3186) j!159) mask!3328) (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336728))))

(assert (=> b!756336 (= lt!336728 (Intermediate!7690 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756337 () Bool)

(assert (=> b!756337 (= e!421743 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) (Found!7690 j!159)))))

(declare-fun b!756338 () Bool)

(declare-fun res!511355 () Bool)

(assert (=> b!756338 (=> (not res!511355) (not e!421734))))

(assert (=> b!756338 (= res!511355 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20090 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756339 () Bool)

(declare-fun Unit!26143 () Unit!26140)

(assert (=> b!756339 (= e!421736 Unit!26143)))

(declare-fun b!756340 () Bool)

(declare-fun res!511347 () Bool)

(assert (=> b!756340 (=> (not res!511347) (not e!421740))))

(declare-fun arrayContainsKey!0 (array!41953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756340 (= res!511347 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756341 () Bool)

(declare-fun lt!336726 () SeekEntryResult!7690)

(assert (=> b!756341 (= e!421739 (= lt!336726 lt!336731))))

(declare-fun b!756342 () Bool)

(assert (=> b!756342 (= e!421740 e!421745)))

(declare-fun res!511359 () Bool)

(assert (=> b!756342 (=> (not res!511359) (not e!421745))))

(declare-fun lt!336729 () SeekEntryResult!7690)

(assert (=> b!756342 (= res!511359 (or (= lt!336729 (MissingZero!7690 i!1173)) (= lt!336729 (MissingVacant!7690 i!1173))))))

(assert (=> b!756342 (= lt!336729 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756343 () Bool)

(declare-fun e!421737 () Bool)

(assert (=> b!756343 (= e!421737 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336735))))

(declare-fun b!756344 () Bool)

(assert (=> b!756344 (= e!421738 (not e!421735))))

(declare-fun res!511364 () Bool)

(assert (=> b!756344 (=> res!511364 e!421735)))

(assert (=> b!756344 (= res!511364 (or (not (is-Intermediate!7690 lt!336736)) (bvslt x!1131 (x!64024 lt!336736)) (not (= x!1131 (x!64024 lt!336736))) (not (= index!1321 (index!33130 lt!336736)))))))

(assert (=> b!756344 e!421737))

(declare-fun res!511348 () Bool)

(assert (=> b!756344 (=> (not res!511348) (not e!421737))))

(assert (=> b!756344 (= res!511348 (= lt!336726 lt!336735))))

(assert (=> b!756344 (= lt!336735 (Found!7690 j!159))))

(assert (=> b!756344 (= lt!336726 (seekEntryOrOpen!0 (select (arr!20090 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756344 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336730 () Unit!26140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26140)

(assert (=> b!756344 (= lt!336730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756345 () Bool)

(declare-fun res!511357 () Bool)

(assert (=> b!756345 (=> (not res!511357) (not e!421734))))

(assert (=> b!756345 (= res!511357 e!421743)))

(declare-fun c!82869 () Bool)

(assert (=> b!756345 (= c!82869 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65780 res!511363) b!756334))

(assert (= (and b!756334 res!511356) b!756325))

(assert (= (and b!756325 res!511346) b!756333))

(assert (= (and b!756333 res!511351) b!756340))

(assert (= (and b!756340 res!511347) b!756342))

(assert (= (and b!756342 res!511359) b!756324))

(assert (= (and b!756324 res!511353) b!756332))

(assert (= (and b!756332 res!511349) b!756326))

(assert (= (and b!756326 res!511352) b!756336))

(assert (= (and b!756336 res!511360) b!756338))

(assert (= (and b!756338 res!511355) b!756345))

(assert (= (and b!756345 c!82869) b!756323))

(assert (= (and b!756345 (not c!82869)) b!756337))

(assert (= (and b!756345 res!511357) b!756329))

(assert (= (and b!756329 res!511354) b!756344))

(assert (= (and b!756344 res!511348) b!756343))

(assert (= (and b!756344 (not res!511364)) b!756328))

(assert (= (and b!756328 (not res!511358)) b!756331))

(assert (= (and b!756331 (not res!511350)) b!756335))

(assert (= (and b!756335 c!82870) b!756327))

(assert (= (and b!756335 (not c!82870)) b!756339))

(assert (= (and b!756335 res!511361) b!756330))

(assert (= (and b!756330 res!511362) b!756341))

(declare-fun m!704307 () Bool)

(assert (=> b!756323 m!704307))

(assert (=> b!756323 m!704307))

(declare-fun m!704309 () Bool)

(assert (=> b!756323 m!704309))

(declare-fun m!704311 () Bool)

(assert (=> b!756332 m!704311))

(assert (=> b!756344 m!704307))

(assert (=> b!756344 m!704307))

(declare-fun m!704313 () Bool)

(assert (=> b!756344 m!704313))

(declare-fun m!704315 () Bool)

(assert (=> b!756344 m!704315))

(declare-fun m!704317 () Bool)

(assert (=> b!756344 m!704317))

(declare-fun m!704319 () Bool)

(assert (=> b!756340 m!704319))

(declare-fun m!704321 () Bool)

(assert (=> b!756324 m!704321))

(declare-fun m!704323 () Bool)

(assert (=> b!756333 m!704323))

(declare-fun m!704325 () Bool)

(assert (=> b!756331 m!704325))

(declare-fun m!704327 () Bool)

(assert (=> b!756331 m!704327))

(declare-fun m!704329 () Bool)

(assert (=> b!756342 m!704329))

(assert (=> b!756343 m!704307))

(assert (=> b!756343 m!704307))

(declare-fun m!704331 () Bool)

(assert (=> b!756343 m!704331))

(declare-fun m!704333 () Bool)

(assert (=> start!65780 m!704333))

(declare-fun m!704335 () Bool)

(assert (=> start!65780 m!704335))

(declare-fun m!704337 () Bool)

(assert (=> b!756330 m!704337))

(declare-fun m!704339 () Bool)

(assert (=> b!756330 m!704339))

(assert (=> b!756325 m!704307))

(assert (=> b!756325 m!704307))

(declare-fun m!704341 () Bool)

(assert (=> b!756325 m!704341))

(assert (=> b!756337 m!704307))

(assert (=> b!756337 m!704307))

(declare-fun m!704343 () Bool)

(assert (=> b!756337 m!704343))

(declare-fun m!704345 () Bool)

(assert (=> b!756329 m!704345))

(declare-fun m!704347 () Bool)

(assert (=> b!756329 m!704347))

(declare-fun m!704349 () Bool)

(assert (=> b!756329 m!704349))

(assert (=> b!756329 m!704325))

(assert (=> b!756329 m!704347))

(declare-fun m!704351 () Bool)

(assert (=> b!756329 m!704351))

(declare-fun m!704353 () Bool)

(assert (=> b!756338 m!704353))

(assert (=> b!756328 m!704307))

(assert (=> b!756328 m!704307))

(assert (=> b!756328 m!704343))

(assert (=> b!756336 m!704307))

(assert (=> b!756336 m!704307))

(declare-fun m!704355 () Bool)

(assert (=> b!756336 m!704355))

(assert (=> b!756336 m!704355))

(assert (=> b!756336 m!704307))

(declare-fun m!704357 () Bool)

(assert (=> b!756336 m!704357))

(push 1)

