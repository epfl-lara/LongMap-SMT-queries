; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65296 () Bool)

(assert start!65296)

(declare-fun b!741341 () Bool)

(declare-fun e!414404 () Bool)

(declare-fun e!414405 () Bool)

(assert (=> b!741341 (= e!414404 e!414405)))

(declare-fun res!498667 () Bool)

(assert (=> b!741341 (=> (not res!498667) (not e!414405))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!329374 () (_ BitVec 64))

(declare-datatypes ((array!41469 0))(
  ( (array!41470 (arr!19848 (Array (_ BitVec 32) (_ BitVec 64))) (size!20269 (_ BitVec 32))) )
))
(declare-fun lt!329371 () array!41469)

(declare-datatypes ((SeekEntryResult!7448 0))(
  ( (MissingZero!7448 (index!32160 (_ BitVec 32))) (Found!7448 (index!32161 (_ BitVec 32))) (Intermediate!7448 (undefined!8260 Bool) (index!32162 (_ BitVec 32)) (x!63142 (_ BitVec 32))) (Undefined!7448) (MissingVacant!7448 (index!32163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41469 (_ BitVec 32)) SeekEntryResult!7448)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741341 (= res!498667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329374 mask!3328) lt!329374 lt!329371 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329374 lt!329371 mask!3328)))))

(declare-fun a!3186 () array!41469)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741341 (= lt!329374 (select (store (arr!19848 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741341 (= lt!329371 (array!41470 (store (arr!19848 a!3186) i!1173 k!2102) (size!20269 a!3186)))))

(declare-fun b!741342 () Bool)

(declare-fun res!498661 () Bool)

(declare-fun e!414406 () Bool)

(assert (=> b!741342 (=> (not res!498661) (not e!414406))))

(declare-fun arrayContainsKey!0 (array!41469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741342 (= res!498661 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741343 () Bool)

(declare-fun res!498664 () Bool)

(assert (=> b!741343 (=> (not res!498664) (not e!414406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741343 (= res!498664 (validKeyInArray!0 (select (arr!19848 a!3186) j!159)))))

(declare-fun b!741344 () Bool)

(assert (=> b!741344 (= e!414405 (not true))))

(declare-fun e!414401 () Bool)

(assert (=> b!741344 e!414401))

(declare-fun res!498673 () Bool)

(assert (=> b!741344 (=> (not res!498673) (not e!414401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41469 (_ BitVec 32)) Bool)

(assert (=> b!741344 (= res!498673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25376 0))(
  ( (Unit!25377) )
))
(declare-fun lt!329373 () Unit!25376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25376)

(assert (=> b!741344 (= lt!329373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!498663 () Bool)

(assert (=> start!65296 (=> (not res!498663) (not e!414406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65296 (= res!498663 (validMask!0 mask!3328))))

(assert (=> start!65296 e!414406))

(assert (=> start!65296 true))

(declare-fun array_inv!15644 (array!41469) Bool)

(assert (=> start!65296 (array_inv!15644 a!3186)))

(declare-fun b!741345 () Bool)

(declare-fun e!414407 () Bool)

(assert (=> b!741345 (= e!414407 e!414404)))

(declare-fun res!498674 () Bool)

(assert (=> b!741345 (=> (not res!498674) (not e!414404))))

(declare-fun lt!329372 () SeekEntryResult!7448)

(assert (=> b!741345 (= res!498674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19848 a!3186) j!159) mask!3328) (select (arr!19848 a!3186) j!159) a!3186 mask!3328) lt!329372))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741345 (= lt!329372 (Intermediate!7448 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!414403 () Bool)

(declare-fun b!741346 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41469 (_ BitVec 32)) SeekEntryResult!7448)

(assert (=> b!741346 (= e!414403 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19848 a!3186) j!159) a!3186 mask!3328) (Found!7448 j!159)))))

(declare-fun b!741347 () Bool)

(declare-fun res!498672 () Bool)

(assert (=> b!741347 (=> (not res!498672) (not e!414404))))

(assert (=> b!741347 (= res!498672 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19848 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741348 () Bool)

(declare-fun res!498660 () Bool)

(assert (=> b!741348 (=> (not res!498660) (not e!414407))))

(assert (=> b!741348 (= res!498660 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20269 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20269 a!3186))))))

(declare-fun b!741349 () Bool)

(declare-fun res!498662 () Bool)

(assert (=> b!741349 (=> (not res!498662) (not e!414406))))

(assert (=> b!741349 (= res!498662 (validKeyInArray!0 k!2102))))

(declare-fun b!741350 () Bool)

(declare-fun res!498671 () Bool)

(assert (=> b!741350 (=> (not res!498671) (not e!414407))))

(declare-datatypes ((List!13850 0))(
  ( (Nil!13847) (Cons!13846 (h!14918 (_ BitVec 64)) (t!20165 List!13850)) )
))
(declare-fun arrayNoDuplicates!0 (array!41469 (_ BitVec 32) List!13850) Bool)

(assert (=> b!741350 (= res!498671 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13847))))

(declare-fun lt!329370 () SeekEntryResult!7448)

(declare-fun e!414402 () Bool)

(declare-fun b!741351 () Bool)

(assert (=> b!741351 (= e!414402 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19848 a!3186) j!159) a!3186 mask!3328) lt!329370))))

(declare-fun b!741352 () Bool)

(assert (=> b!741352 (= e!414406 e!414407)))

(declare-fun res!498665 () Bool)

(assert (=> b!741352 (=> (not res!498665) (not e!414407))))

(declare-fun lt!329375 () SeekEntryResult!7448)

(assert (=> b!741352 (= res!498665 (or (= lt!329375 (MissingZero!7448 i!1173)) (= lt!329375 (MissingVacant!7448 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41469 (_ BitVec 32)) SeekEntryResult!7448)

(assert (=> b!741352 (= lt!329375 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741353 () Bool)

(declare-fun res!498668 () Bool)

(assert (=> b!741353 (=> (not res!498668) (not e!414406))))

(assert (=> b!741353 (= res!498668 (and (= (size!20269 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20269 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20269 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741354 () Bool)

(assert (=> b!741354 (= e!414403 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19848 a!3186) j!159) a!3186 mask!3328) lt!329372))))

(declare-fun b!741355 () Bool)

(assert (=> b!741355 (= e!414401 e!414402)))

(declare-fun res!498670 () Bool)

(assert (=> b!741355 (=> (not res!498670) (not e!414402))))

(assert (=> b!741355 (= res!498670 (= (seekEntryOrOpen!0 (select (arr!19848 a!3186) j!159) a!3186 mask!3328) lt!329370))))

(assert (=> b!741355 (= lt!329370 (Found!7448 j!159))))

(declare-fun b!741356 () Bool)

(declare-fun res!498666 () Bool)

(assert (=> b!741356 (=> (not res!498666) (not e!414407))))

(assert (=> b!741356 (= res!498666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741357 () Bool)

(declare-fun res!498669 () Bool)

(assert (=> b!741357 (=> (not res!498669) (not e!414404))))

(assert (=> b!741357 (= res!498669 e!414403)))

(declare-fun c!81721 () Bool)

(assert (=> b!741357 (= c!81721 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65296 res!498663) b!741353))

(assert (= (and b!741353 res!498668) b!741343))

(assert (= (and b!741343 res!498664) b!741349))

(assert (= (and b!741349 res!498662) b!741342))

(assert (= (and b!741342 res!498661) b!741352))

(assert (= (and b!741352 res!498665) b!741356))

(assert (= (and b!741356 res!498666) b!741350))

(assert (= (and b!741350 res!498671) b!741348))

(assert (= (and b!741348 res!498660) b!741345))

(assert (= (and b!741345 res!498674) b!741347))

(assert (= (and b!741347 res!498672) b!741357))

(assert (= (and b!741357 c!81721) b!741354))

(assert (= (and b!741357 (not c!81721)) b!741346))

(assert (= (and b!741357 res!498669) b!741341))

(assert (= (and b!741341 res!498667) b!741344))

(assert (= (and b!741344 res!498673) b!741355))

(assert (= (and b!741355 res!498670) b!741351))

(declare-fun m!692323 () Bool)

(assert (=> b!741351 m!692323))

(assert (=> b!741351 m!692323))

(declare-fun m!692325 () Bool)

(assert (=> b!741351 m!692325))

(declare-fun m!692327 () Bool)

(assert (=> b!741349 m!692327))

(assert (=> b!741354 m!692323))

(assert (=> b!741354 m!692323))

(declare-fun m!692329 () Bool)

(assert (=> b!741354 m!692329))

(assert (=> b!741346 m!692323))

(assert (=> b!741346 m!692323))

(declare-fun m!692331 () Bool)

(assert (=> b!741346 m!692331))

(assert (=> b!741355 m!692323))

(assert (=> b!741355 m!692323))

(declare-fun m!692333 () Bool)

(assert (=> b!741355 m!692333))

(declare-fun m!692335 () Bool)

(assert (=> b!741347 m!692335))

(declare-fun m!692337 () Bool)

(assert (=> b!741356 m!692337))

(assert (=> b!741345 m!692323))

(assert (=> b!741345 m!692323))

(declare-fun m!692339 () Bool)

(assert (=> b!741345 m!692339))

(assert (=> b!741345 m!692339))

(assert (=> b!741345 m!692323))

(declare-fun m!692341 () Bool)

(assert (=> b!741345 m!692341))

(declare-fun m!692343 () Bool)

(assert (=> b!741341 m!692343))

(declare-fun m!692345 () Bool)

(assert (=> b!741341 m!692345))

(declare-fun m!692347 () Bool)

(assert (=> b!741341 m!692347))

(declare-fun m!692349 () Bool)

(assert (=> b!741341 m!692349))

(assert (=> b!741341 m!692343))

(declare-fun m!692351 () Bool)

(assert (=> b!741341 m!692351))

(declare-fun m!692353 () Bool)

(assert (=> b!741342 m!692353))

(declare-fun m!692355 () Bool)

(assert (=> b!741344 m!692355))

(declare-fun m!692357 () Bool)

(assert (=> b!741344 m!692357))

(declare-fun m!692359 () Bool)

(assert (=> start!65296 m!692359))

(declare-fun m!692361 () Bool)

(assert (=> start!65296 m!692361))

(declare-fun m!692363 () Bool)

(assert (=> b!741350 m!692363))

(assert (=> b!741343 m!692323))

(assert (=> b!741343 m!692323))

(declare-fun m!692365 () Bool)

(assert (=> b!741343 m!692365))

(declare-fun m!692367 () Bool)

(assert (=> b!741352 m!692367))

(push 1)

