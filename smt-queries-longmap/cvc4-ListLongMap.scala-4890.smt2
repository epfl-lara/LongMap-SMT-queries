; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67456 () Bool)

(assert start!67456)

(declare-fun b!780340 () Bool)

(declare-fun res!527953 () Bool)

(declare-fun e!434099 () Bool)

(assert (=> b!780340 (=> (not res!527953) (not e!434099))))

(declare-datatypes ((array!42622 0))(
  ( (array!42623 (arr!20402 (Array (_ BitVec 32) (_ BitVec 64))) (size!20823 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42622)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780340 (= res!527953 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!527965 () Bool)

(assert (=> start!67456 (=> (not res!527965) (not e!434099))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67456 (= res!527965 (validMask!0 mask!3328))))

(assert (=> start!67456 e!434099))

(assert (=> start!67456 true))

(declare-fun array_inv!16198 (array!42622) Bool)

(assert (=> start!67456 (array_inv!16198 a!3186)))

(declare-fun b!780341 () Bool)

(declare-fun e!434101 () Bool)

(declare-fun e!434105 () Bool)

(assert (=> b!780341 (= e!434101 e!434105)))

(declare-fun res!527961 () Bool)

(assert (=> b!780341 (=> (not res!527961) (not e!434105))))

(declare-datatypes ((SeekEntryResult!8002 0))(
  ( (MissingZero!8002 (index!34376 (_ BitVec 32))) (Found!8002 (index!34377 (_ BitVec 32))) (Intermediate!8002 (undefined!8814 Bool) (index!34378 (_ BitVec 32)) (x!65324 (_ BitVec 32))) (Undefined!8002) (MissingVacant!8002 (index!34379 (_ BitVec 32))) )
))
(declare-fun lt!347740 () SeekEntryResult!8002)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!8002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780341 (= res!527961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20402 a!3186) j!159) mask!3328) (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347740))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780341 (= lt!347740 (Intermediate!8002 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780342 () Bool)

(declare-fun res!527951 () Bool)

(assert (=> b!780342 (=> (not res!527951) (not e!434105))))

(declare-fun e!434100 () Bool)

(assert (=> b!780342 (= res!527951 e!434100)))

(declare-fun c!86599 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!780342 (= c!86599 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!780343 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!780343 (= e!434100 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) (Found!8002 j!159)))))

(declare-fun b!780344 () Bool)

(assert (=> b!780344 (= e!434099 e!434101)))

(declare-fun res!527966 () Bool)

(assert (=> b!780344 (=> (not res!527966) (not e!434101))))

(declare-fun lt!347738 () SeekEntryResult!8002)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780344 (= res!527966 (or (= lt!347738 (MissingZero!8002 i!1173)) (= lt!347738 (MissingVacant!8002 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!780344 (= lt!347738 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780345 () Bool)

(declare-fun e!434097 () Bool)

(declare-fun e!434103 () Bool)

(assert (=> b!780345 (= e!434097 (not e!434103))))

(declare-fun res!527956 () Bool)

(assert (=> b!780345 (=> res!527956 e!434103)))

(declare-fun lt!347736 () SeekEntryResult!8002)

(assert (=> b!780345 (= res!527956 (or (not (is-Intermediate!8002 lt!347736)) (bvslt x!1131 (x!65324 lt!347736)) (not (= x!1131 (x!65324 lt!347736))) (not (= index!1321 (index!34378 lt!347736)))))))

(declare-fun e!434102 () Bool)

(assert (=> b!780345 e!434102))

(declare-fun res!527960 () Bool)

(assert (=> b!780345 (=> (not res!527960) (not e!434102))))

(declare-fun lt!347744 () SeekEntryResult!8002)

(declare-fun lt!347741 () SeekEntryResult!8002)

(assert (=> b!780345 (= res!527960 (= lt!347744 lt!347741))))

(assert (=> b!780345 (= lt!347741 (Found!8002 j!159))))

(assert (=> b!780345 (= lt!347744 (seekEntryOrOpen!0 (select (arr!20402 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42622 (_ BitVec 32)) Bool)

(assert (=> b!780345 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26898 0))(
  ( (Unit!26899) )
))
(declare-fun lt!347743 () Unit!26898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26898)

(assert (=> b!780345 (= lt!347743 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780346 () Bool)

(assert (=> b!780346 (= e!434105 e!434097)))

(declare-fun res!527958 () Bool)

(assert (=> b!780346 (=> (not res!527958) (not e!434097))))

(declare-fun lt!347739 () SeekEntryResult!8002)

(assert (=> b!780346 (= res!527958 (= lt!347739 lt!347736))))

(declare-fun lt!347735 () (_ BitVec 64))

(declare-fun lt!347737 () array!42622)

(assert (=> b!780346 (= lt!347736 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347735 lt!347737 mask!3328))))

(assert (=> b!780346 (= lt!347739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347735 mask!3328) lt!347735 lt!347737 mask!3328))))

(assert (=> b!780346 (= lt!347735 (select (store (arr!20402 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780346 (= lt!347737 (array!42623 (store (arr!20402 a!3186) i!1173 k!2102) (size!20823 a!3186)))))

(declare-fun b!780347 () Bool)

(declare-fun res!527955 () Bool)

(assert (=> b!780347 (=> (not res!527955) (not e!434101))))

(declare-datatypes ((List!14404 0))(
  ( (Nil!14401) (Cons!14400 (h!15517 (_ BitVec 64)) (t!20719 List!14404)) )
))
(declare-fun arrayNoDuplicates!0 (array!42622 (_ BitVec 32) List!14404) Bool)

(assert (=> b!780347 (= res!527955 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14401))))

(declare-fun b!780348 () Bool)

(declare-fun res!527964 () Bool)

(assert (=> b!780348 (=> (not res!527964) (not e!434105))))

(assert (=> b!780348 (= res!527964 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20402 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780349 () Bool)

(declare-fun res!527959 () Bool)

(assert (=> b!780349 (=> (not res!527959) (not e!434101))))

(assert (=> b!780349 (= res!527959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780350 () Bool)

(declare-fun res!527962 () Bool)

(assert (=> b!780350 (=> (not res!527962) (not e!434099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780350 (= res!527962 (validKeyInArray!0 k!2102))))

(declare-fun b!780351 () Bool)

(declare-fun e!434098 () Bool)

(assert (=> b!780351 (= e!434103 e!434098)))

(declare-fun res!527954 () Bool)

(assert (=> b!780351 (=> res!527954 e!434098)))

(declare-fun lt!347742 () SeekEntryResult!8002)

(assert (=> b!780351 (= res!527954 (or (not (= lt!347742 lt!347741)) (= (select (store (arr!20402 a!3186) i!1173 k!2102) index!1321) lt!347735) (not (= (select (store (arr!20402 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780351 (= lt!347742 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780352 () Bool)

(declare-fun res!527963 () Bool)

(assert (=> b!780352 (=> (not res!527963) (not e!434099))))

(assert (=> b!780352 (= res!527963 (validKeyInArray!0 (select (arr!20402 a!3186) j!159)))))

(declare-fun b!780353 () Bool)

(assert (=> b!780353 (= e!434100 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347740))))

(declare-fun b!780354 () Bool)

(assert (=> b!780354 (= e!434098 false)))

(assert (=> b!780354 (and (= lt!347744 lt!347742) (= lt!347742 (MissingVacant!8002 resIntermediateIndex!5)))))

(declare-fun b!780355 () Bool)

(declare-fun res!527952 () Bool)

(assert (=> b!780355 (=> (not res!527952) (not e!434101))))

(assert (=> b!780355 (= res!527952 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20823 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20823 a!3186))))))

(declare-fun b!780356 () Bool)

(assert (=> b!780356 (= e!434102 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347741))))

(declare-fun b!780357 () Bool)

(declare-fun res!527957 () Bool)

(assert (=> b!780357 (=> (not res!527957) (not e!434099))))

(assert (=> b!780357 (= res!527957 (and (= (size!20823 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20823 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20823 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67456 res!527965) b!780357))

(assert (= (and b!780357 res!527957) b!780352))

(assert (= (and b!780352 res!527963) b!780350))

(assert (= (and b!780350 res!527962) b!780340))

(assert (= (and b!780340 res!527953) b!780344))

(assert (= (and b!780344 res!527966) b!780349))

(assert (= (and b!780349 res!527959) b!780347))

(assert (= (and b!780347 res!527955) b!780355))

(assert (= (and b!780355 res!527952) b!780341))

(assert (= (and b!780341 res!527961) b!780348))

(assert (= (and b!780348 res!527964) b!780342))

(assert (= (and b!780342 c!86599) b!780353))

(assert (= (and b!780342 (not c!86599)) b!780343))

(assert (= (and b!780342 res!527951) b!780346))

(assert (= (and b!780346 res!527958) b!780345))

(assert (= (and b!780345 res!527960) b!780356))

(assert (= (and b!780345 (not res!527956)) b!780351))

(assert (= (and b!780351 (not res!527954)) b!780354))

(declare-fun m!723665 () Bool)

(assert (=> b!780349 m!723665))

(declare-fun m!723667 () Bool)

(assert (=> b!780353 m!723667))

(assert (=> b!780353 m!723667))

(declare-fun m!723669 () Bool)

(assert (=> b!780353 m!723669))

(assert (=> b!780352 m!723667))

(assert (=> b!780352 m!723667))

(declare-fun m!723671 () Bool)

(assert (=> b!780352 m!723671))

(declare-fun m!723673 () Bool)

(assert (=> b!780347 m!723673))

(declare-fun m!723675 () Bool)

(assert (=> start!67456 m!723675))

(declare-fun m!723677 () Bool)

(assert (=> start!67456 m!723677))

(assert (=> b!780356 m!723667))

(assert (=> b!780356 m!723667))

(declare-fun m!723679 () Bool)

(assert (=> b!780356 m!723679))

(declare-fun m!723681 () Bool)

(assert (=> b!780340 m!723681))

(assert (=> b!780345 m!723667))

(assert (=> b!780345 m!723667))

(declare-fun m!723683 () Bool)

(assert (=> b!780345 m!723683))

(declare-fun m!723685 () Bool)

(assert (=> b!780345 m!723685))

(declare-fun m!723687 () Bool)

(assert (=> b!780345 m!723687))

(assert (=> b!780343 m!723667))

(assert (=> b!780343 m!723667))

(declare-fun m!723689 () Bool)

(assert (=> b!780343 m!723689))

(declare-fun m!723691 () Bool)

(assert (=> b!780348 m!723691))

(declare-fun m!723693 () Bool)

(assert (=> b!780350 m!723693))

(declare-fun m!723695 () Bool)

(assert (=> b!780344 m!723695))

(declare-fun m!723697 () Bool)

(assert (=> b!780346 m!723697))

(declare-fun m!723699 () Bool)

(assert (=> b!780346 m!723699))

(declare-fun m!723701 () Bool)

(assert (=> b!780346 m!723701))

(declare-fun m!723703 () Bool)

(assert (=> b!780346 m!723703))

(declare-fun m!723705 () Bool)

(assert (=> b!780346 m!723705))

(assert (=> b!780346 m!723701))

(assert (=> b!780341 m!723667))

(assert (=> b!780341 m!723667))

(declare-fun m!723707 () Bool)

(assert (=> b!780341 m!723707))

(assert (=> b!780341 m!723707))

(assert (=> b!780341 m!723667))

(declare-fun m!723709 () Bool)

(assert (=> b!780341 m!723709))

(assert (=> b!780351 m!723699))

(declare-fun m!723711 () Bool)

(assert (=> b!780351 m!723711))

(assert (=> b!780351 m!723667))

(assert (=> b!780351 m!723667))

(assert (=> b!780351 m!723689))

(push 1)

