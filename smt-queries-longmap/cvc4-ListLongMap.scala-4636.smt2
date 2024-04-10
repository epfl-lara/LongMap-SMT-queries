; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64520 () Bool)

(assert start!64520)

(declare-fun b!726344 () Bool)

(declare-fun e!406681 () Bool)

(declare-fun e!406688 () Bool)

(assert (=> b!726344 (= e!406681 e!406688)))

(declare-fun res!487348 () Bool)

(assert (=> b!726344 (=> (not res!487348) (not e!406688))))

(declare-datatypes ((SeekEntryResult!7240 0))(
  ( (MissingZero!7240 (index!31328 (_ BitVec 32))) (Found!7240 (index!31329 (_ BitVec 32))) (Intermediate!7240 (undefined!8052 Bool) (index!31330 (_ BitVec 32)) (x!62314 (_ BitVec 32))) (Undefined!7240) (MissingVacant!7240 (index!31331 (_ BitVec 32))) )
))
(declare-fun lt!321677 () SeekEntryResult!7240)

(declare-fun lt!321681 () SeekEntryResult!7240)

(assert (=> b!726344 (= res!487348 (= lt!321677 lt!321681))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321678 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41038 0))(
  ( (array!41039 (arr!19640 (Array (_ BitVec 32) (_ BitVec 64))) (size!20061 (_ BitVec 32))) )
))
(declare-fun lt!321679 () array!41038)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41038 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!726344 (= lt!321681 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321678 lt!321679 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726344 (= lt!321677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321678 mask!3328) lt!321678 lt!321679 mask!3328))))

(declare-fun a!3186 () array!41038)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!726344 (= lt!321678 (select (store (arr!19640 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726344 (= lt!321679 (array!41039 (store (arr!19640 a!3186) i!1173 k!2102) (size!20061 a!3186)))))

(declare-fun b!726345 () Bool)

(declare-fun res!487338 () Bool)

(declare-fun e!406683 () Bool)

(assert (=> b!726345 (=> (not res!487338) (not e!406683))))

(declare-datatypes ((List!13642 0))(
  ( (Nil!13639) (Cons!13638 (h!14695 (_ BitVec 64)) (t!19957 List!13642)) )
))
(declare-fun arrayNoDuplicates!0 (array!41038 (_ BitVec 32) List!13642) Bool)

(assert (=> b!726345 (= res!487338 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13639))))

(declare-fun b!726346 () Bool)

(assert (=> b!726346 (= e!406683 e!406681)))

(declare-fun res!487351 () Bool)

(assert (=> b!726346 (=> (not res!487351) (not e!406681))))

(declare-fun lt!321676 () SeekEntryResult!7240)

(assert (=> b!726346 (= res!487351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19640 a!3186) j!159) mask!3328) (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321676))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726346 (= lt!321676 (Intermediate!7240 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726347 () Bool)

(declare-fun e!406685 () Bool)

(assert (=> b!726347 (= e!406685 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321676))))

(declare-fun b!726348 () Bool)

(declare-fun res!487341 () Bool)

(declare-fun e!406687 () Bool)

(assert (=> b!726348 (=> (not res!487341) (not e!406687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726348 (= res!487341 (validKeyInArray!0 k!2102))))

(declare-fun b!726350 () Bool)

(declare-fun res!487344 () Bool)

(assert (=> b!726350 (=> (not res!487344) (not e!406687))))

(assert (=> b!726350 (= res!487344 (and (= (size!20061 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20061 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20061 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726351 () Bool)

(declare-fun res!487343 () Bool)

(assert (=> b!726351 (=> (not res!487343) (not e!406687))))

(assert (=> b!726351 (= res!487343 (validKeyInArray!0 (select (arr!19640 a!3186) j!159)))))

(declare-fun b!726352 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41038 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!726352 (= e!406685 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) (Found!7240 j!159)))))

(declare-fun b!726353 () Bool)

(declare-fun res!487349 () Bool)

(assert (=> b!726353 (=> (not res!487349) (not e!406683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41038 (_ BitVec 32)) Bool)

(assert (=> b!726353 (= res!487349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726354 () Bool)

(declare-fun res!487340 () Bool)

(assert (=> b!726354 (=> (not res!487340) (not e!406687))))

(declare-fun arrayContainsKey!0 (array!41038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726354 (= res!487340 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726355 () Bool)

(declare-fun res!487342 () Bool)

(assert (=> b!726355 (=> (not res!487342) (not e!406683))))

(assert (=> b!726355 (= res!487342 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20061 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20061 a!3186))))))

(declare-fun b!726356 () Bool)

(assert (=> b!726356 (= e!406688 (not (or (not (is-Intermediate!7240 lt!321681)) (bvsge x!1131 (x!62314 lt!321681)) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(declare-fun e!406684 () Bool)

(assert (=> b!726356 e!406684))

(declare-fun res!487345 () Bool)

(assert (=> b!726356 (=> (not res!487345) (not e!406684))))

(assert (=> b!726356 (= res!487345 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24798 0))(
  ( (Unit!24799) )
))
(declare-fun lt!321682 () Unit!24798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24798)

(assert (=> b!726356 (= lt!321682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726349 () Bool)

(declare-fun e!406686 () Bool)

(assert (=> b!726349 (= e!406684 e!406686)))

(declare-fun res!487347 () Bool)

(assert (=> b!726349 (=> (not res!487347) (not e!406686))))

(declare-fun lt!321683 () SeekEntryResult!7240)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41038 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!726349 (= res!487347 (= (seekEntryOrOpen!0 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321683))))

(assert (=> b!726349 (= lt!321683 (Found!7240 j!159))))

(declare-fun res!487346 () Bool)

(assert (=> start!64520 (=> (not res!487346) (not e!406687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64520 (= res!487346 (validMask!0 mask!3328))))

(assert (=> start!64520 e!406687))

(assert (=> start!64520 true))

(declare-fun array_inv!15436 (array!41038) Bool)

(assert (=> start!64520 (array_inv!15436 a!3186)))

(declare-fun b!726357 () Bool)

(assert (=> b!726357 (= e!406687 e!406683)))

(declare-fun res!487350 () Bool)

(assert (=> b!726357 (=> (not res!487350) (not e!406683))))

(declare-fun lt!321680 () SeekEntryResult!7240)

(assert (=> b!726357 (= res!487350 (or (= lt!321680 (MissingZero!7240 i!1173)) (= lt!321680 (MissingVacant!7240 i!1173))))))

(assert (=> b!726357 (= lt!321680 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726358 () Bool)

(declare-fun res!487352 () Bool)

(assert (=> b!726358 (=> (not res!487352) (not e!406681))))

(assert (=> b!726358 (= res!487352 e!406685)))

(declare-fun c!79876 () Bool)

(assert (=> b!726358 (= c!79876 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726359 () Bool)

(assert (=> b!726359 (= e!406686 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321683))))

(declare-fun b!726360 () Bool)

(declare-fun res!487339 () Bool)

(assert (=> b!726360 (=> (not res!487339) (not e!406681))))

(assert (=> b!726360 (= res!487339 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19640 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64520 res!487346) b!726350))

(assert (= (and b!726350 res!487344) b!726351))

(assert (= (and b!726351 res!487343) b!726348))

(assert (= (and b!726348 res!487341) b!726354))

(assert (= (and b!726354 res!487340) b!726357))

(assert (= (and b!726357 res!487350) b!726353))

(assert (= (and b!726353 res!487349) b!726345))

(assert (= (and b!726345 res!487338) b!726355))

(assert (= (and b!726355 res!487342) b!726346))

(assert (= (and b!726346 res!487351) b!726360))

(assert (= (and b!726360 res!487339) b!726358))

(assert (= (and b!726358 c!79876) b!726347))

(assert (= (and b!726358 (not c!79876)) b!726352))

(assert (= (and b!726358 res!487352) b!726344))

(assert (= (and b!726344 res!487348) b!726356))

(assert (= (and b!726356 res!487345) b!726349))

(assert (= (and b!726349 res!487347) b!726359))

(declare-fun m!680415 () Bool)

(assert (=> b!726351 m!680415))

(assert (=> b!726351 m!680415))

(declare-fun m!680417 () Bool)

(assert (=> b!726351 m!680417))

(declare-fun m!680419 () Bool)

(assert (=> b!726360 m!680419))

(declare-fun m!680421 () Bool)

(assert (=> b!726354 m!680421))

(declare-fun m!680423 () Bool)

(assert (=> b!726344 m!680423))

(declare-fun m!680425 () Bool)

(assert (=> b!726344 m!680425))

(declare-fun m!680427 () Bool)

(assert (=> b!726344 m!680427))

(declare-fun m!680429 () Bool)

(assert (=> b!726344 m!680429))

(assert (=> b!726344 m!680427))

(declare-fun m!680431 () Bool)

(assert (=> b!726344 m!680431))

(declare-fun m!680433 () Bool)

(assert (=> b!726345 m!680433))

(assert (=> b!726347 m!680415))

(assert (=> b!726347 m!680415))

(declare-fun m!680435 () Bool)

(assert (=> b!726347 m!680435))

(assert (=> b!726349 m!680415))

(assert (=> b!726349 m!680415))

(declare-fun m!680437 () Bool)

(assert (=> b!726349 m!680437))

(declare-fun m!680439 () Bool)

(assert (=> b!726356 m!680439))

(declare-fun m!680441 () Bool)

(assert (=> b!726356 m!680441))

(declare-fun m!680443 () Bool)

(assert (=> b!726357 m!680443))

(assert (=> b!726346 m!680415))

(assert (=> b!726346 m!680415))

(declare-fun m!680445 () Bool)

(assert (=> b!726346 m!680445))

(assert (=> b!726346 m!680445))

(assert (=> b!726346 m!680415))

(declare-fun m!680447 () Bool)

(assert (=> b!726346 m!680447))

(declare-fun m!680449 () Bool)

(assert (=> b!726353 m!680449))

(declare-fun m!680451 () Bool)

(assert (=> b!726348 m!680451))

(assert (=> b!726359 m!680415))

(assert (=> b!726359 m!680415))

(declare-fun m!680453 () Bool)

(assert (=> b!726359 m!680453))

(assert (=> b!726352 m!680415))

(assert (=> b!726352 m!680415))

(declare-fun m!680455 () Bool)

(assert (=> b!726352 m!680455))

(declare-fun m!680457 () Bool)

(assert (=> start!64520 m!680457))

(declare-fun m!680459 () Bool)

(assert (=> start!64520 m!680459))

(push 1)

