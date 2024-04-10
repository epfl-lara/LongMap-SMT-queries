; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67374 () Bool)

(assert start!67374)

(declare-fun b!779491 () Bool)

(declare-fun e!433634 () Bool)

(declare-fun e!433630 () Bool)

(assert (=> b!779491 (= e!433634 e!433630)))

(declare-fun res!527454 () Bool)

(assert (=> b!779491 (=> (not res!527454) (not e!433630))))

(declare-datatypes ((SeekEntryResult!7994 0))(
  ( (MissingZero!7994 (index!34344 (_ BitVec 32))) (Found!7994 (index!34345 (_ BitVec 32))) (Intermediate!7994 (undefined!8806 Bool) (index!34346 (_ BitVec 32)) (x!65291 (_ BitVec 32))) (Undefined!7994) (MissingVacant!7994 (index!34347 (_ BitVec 32))) )
))
(declare-fun lt!347337 () SeekEntryResult!7994)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779491 (= res!527454 (or (= lt!347337 (MissingZero!7994 i!1173)) (= lt!347337 (MissingVacant!7994 i!1173))))))

(declare-datatypes ((array!42603 0))(
  ( (array!42604 (arr!20394 (Array (_ BitVec 32) (_ BitVec 64))) (size!20815 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42603)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42603 (_ BitVec 32)) SeekEntryResult!7994)

(assert (=> b!779491 (= lt!347337 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779492 () Bool)

(declare-fun res!527448 () Bool)

(assert (=> b!779492 (=> (not res!527448) (not e!433630))))

(declare-datatypes ((List!14396 0))(
  ( (Nil!14393) (Cons!14392 (h!15506 (_ BitVec 64)) (t!20711 List!14396)) )
))
(declare-fun arrayNoDuplicates!0 (array!42603 (_ BitVec 32) List!14396) Bool)

(assert (=> b!779492 (= res!527448 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14393))))

(declare-fun b!779493 () Bool)

(declare-fun res!527456 () Bool)

(assert (=> b!779493 (=> (not res!527456) (not e!433634))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!779493 (= res!527456 (and (= (size!20815 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20815 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20815 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779494 () Bool)

(declare-fun e!433637 () Bool)

(declare-fun e!433631 () Bool)

(assert (=> b!779494 (= e!433637 (not e!433631))))

(declare-fun res!527442 () Bool)

(assert (=> b!779494 (=> res!527442 e!433631)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!347331 () SeekEntryResult!7994)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!779494 (= res!527442 (or (not (is-Intermediate!7994 lt!347331)) (bvslt x!1131 (x!65291 lt!347331)) (not (= x!1131 (x!65291 lt!347331))) (not (= index!1321 (index!34346 lt!347331)))))))

(declare-fun e!433629 () Bool)

(assert (=> b!779494 e!433629))

(declare-fun res!527449 () Bool)

(assert (=> b!779494 (=> (not res!527449) (not e!433629))))

(declare-fun lt!347334 () SeekEntryResult!7994)

(declare-fun lt!347333 () SeekEntryResult!7994)

(assert (=> b!779494 (= res!527449 (= lt!347334 lt!347333))))

(assert (=> b!779494 (= lt!347333 (Found!7994 j!159))))

(assert (=> b!779494 (= lt!347334 (seekEntryOrOpen!0 (select (arr!20394 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42603 (_ BitVec 32)) Bool)

(assert (=> b!779494 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26882 0))(
  ( (Unit!26883) )
))
(declare-fun lt!347336 () Unit!26882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26882)

(assert (=> b!779494 (= lt!347336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779495 () Bool)

(declare-fun res!527444 () Bool)

(assert (=> b!779495 (=> (not res!527444) (not e!433634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779495 (= res!527444 (validKeyInArray!0 (select (arr!20394 a!3186) j!159)))))

(declare-fun b!779496 () Bool)

(declare-fun res!527452 () Bool)

(assert (=> b!779496 (=> (not res!527452) (not e!433630))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779496 (= res!527452 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20815 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20815 a!3186))))))

(declare-fun b!779497 () Bool)

(declare-fun e!433635 () Bool)

(assert (=> b!779497 (= e!433635 true)))

(declare-fun lt!347335 () SeekEntryResult!7994)

(assert (=> b!779497 (= lt!347334 lt!347335)))

(declare-fun b!779498 () Bool)

(declare-fun res!527441 () Bool)

(assert (=> b!779498 (=> (not res!527441) (not e!433634))))

(assert (=> b!779498 (= res!527441 (validKeyInArray!0 k!2102))))

(declare-fun e!433633 () Bool)

(declare-fun b!779499 () Bool)

(declare-fun lt!347330 () SeekEntryResult!7994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42603 (_ BitVec 32)) SeekEntryResult!7994)

(assert (=> b!779499 (= e!433633 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20394 a!3186) j!159) a!3186 mask!3328) lt!347330))))

(declare-fun b!779500 () Bool)

(declare-fun res!527453 () Bool)

(declare-fun e!433636 () Bool)

(assert (=> b!779500 (=> (not res!527453) (not e!433636))))

(assert (=> b!779500 (= res!527453 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20394 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!527445 () Bool)

(assert (=> start!67374 (=> (not res!527445) (not e!433634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67374 (= res!527445 (validMask!0 mask!3328))))

(assert (=> start!67374 e!433634))

(assert (=> start!67374 true))

(declare-fun array_inv!16190 (array!42603) Bool)

(assert (=> start!67374 (array_inv!16190 a!3186)))

(declare-fun b!779501 () Bool)

(assert (=> b!779501 (= e!433631 e!433635)))

(declare-fun res!527450 () Bool)

(assert (=> b!779501 (=> res!527450 e!433635)))

(declare-fun lt!347339 () (_ BitVec 64))

(assert (=> b!779501 (= res!527450 (or (not (= lt!347335 lt!347333)) (= (select (store (arr!20394 a!3186) i!1173 k!2102) index!1321) lt!347339) (not (= (select (store (arr!20394 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42603 (_ BitVec 32)) SeekEntryResult!7994)

(assert (=> b!779501 (= lt!347335 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20394 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779502 () Bool)

(declare-fun res!527443 () Bool)

(assert (=> b!779502 (=> (not res!527443) (not e!433630))))

(assert (=> b!779502 (= res!527443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779503 () Bool)

(assert (=> b!779503 (= e!433629 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20394 a!3186) j!159) a!3186 mask!3328) lt!347333))))

(declare-fun b!779504 () Bool)

(declare-fun res!527446 () Bool)

(assert (=> b!779504 (=> (not res!527446) (not e!433634))))

(declare-fun arrayContainsKey!0 (array!42603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779504 (= res!527446 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779505 () Bool)

(declare-fun res!527447 () Bool)

(assert (=> b!779505 (=> (not res!527447) (not e!433636))))

(assert (=> b!779505 (= res!527447 e!433633)))

(declare-fun c!86428 () Bool)

(assert (=> b!779505 (= c!86428 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779506 () Bool)

(assert (=> b!779506 (= e!433636 e!433637)))

(declare-fun res!527455 () Bool)

(assert (=> b!779506 (=> (not res!527455) (not e!433637))))

(declare-fun lt!347338 () SeekEntryResult!7994)

(assert (=> b!779506 (= res!527455 (= lt!347338 lt!347331))))

(declare-fun lt!347332 () array!42603)

(assert (=> b!779506 (= lt!347331 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347339 lt!347332 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779506 (= lt!347338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347339 mask!3328) lt!347339 lt!347332 mask!3328))))

(assert (=> b!779506 (= lt!347339 (select (store (arr!20394 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779506 (= lt!347332 (array!42604 (store (arr!20394 a!3186) i!1173 k!2102) (size!20815 a!3186)))))

(declare-fun b!779507 () Bool)

(assert (=> b!779507 (= e!433630 e!433636)))

(declare-fun res!527451 () Bool)

(assert (=> b!779507 (=> (not res!527451) (not e!433636))))

(assert (=> b!779507 (= res!527451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20394 a!3186) j!159) mask!3328) (select (arr!20394 a!3186) j!159) a!3186 mask!3328) lt!347330))))

(assert (=> b!779507 (= lt!347330 (Intermediate!7994 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779508 () Bool)

(assert (=> b!779508 (= e!433633 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20394 a!3186) j!159) a!3186 mask!3328) (Found!7994 j!159)))))

(assert (= (and start!67374 res!527445) b!779493))

(assert (= (and b!779493 res!527456) b!779495))

(assert (= (and b!779495 res!527444) b!779498))

(assert (= (and b!779498 res!527441) b!779504))

(assert (= (and b!779504 res!527446) b!779491))

(assert (= (and b!779491 res!527454) b!779502))

(assert (= (and b!779502 res!527443) b!779492))

(assert (= (and b!779492 res!527448) b!779496))

(assert (= (and b!779496 res!527452) b!779507))

(assert (= (and b!779507 res!527451) b!779500))

(assert (= (and b!779500 res!527453) b!779505))

(assert (= (and b!779505 c!86428) b!779499))

(assert (= (and b!779505 (not c!86428)) b!779508))

(assert (= (and b!779505 res!527447) b!779506))

(assert (= (and b!779506 res!527455) b!779494))

(assert (= (and b!779494 res!527449) b!779503))

(assert (= (and b!779494 (not res!527442)) b!779501))

(assert (= (and b!779501 (not res!527450)) b!779497))

(declare-fun m!722999 () Bool)

(assert (=> b!779499 m!722999))

(assert (=> b!779499 m!722999))

(declare-fun m!723001 () Bool)

(assert (=> b!779499 m!723001))

(assert (=> b!779494 m!722999))

(assert (=> b!779494 m!722999))

(declare-fun m!723003 () Bool)

(assert (=> b!779494 m!723003))

(declare-fun m!723005 () Bool)

(assert (=> b!779494 m!723005))

(declare-fun m!723007 () Bool)

(assert (=> b!779494 m!723007))

(declare-fun m!723009 () Bool)

(assert (=> b!779506 m!723009))

(declare-fun m!723011 () Bool)

(assert (=> b!779506 m!723011))

(declare-fun m!723013 () Bool)

(assert (=> b!779506 m!723013))

(assert (=> b!779506 m!723011))

(declare-fun m!723015 () Bool)

(assert (=> b!779506 m!723015))

(declare-fun m!723017 () Bool)

(assert (=> b!779506 m!723017))

(declare-fun m!723019 () Bool)

(assert (=> b!779498 m!723019))

(declare-fun m!723021 () Bool)

(assert (=> b!779500 m!723021))

(assert (=> b!779495 m!722999))

(assert (=> b!779495 m!722999))

(declare-fun m!723023 () Bool)

(assert (=> b!779495 m!723023))

(declare-fun m!723025 () Bool)

(assert (=> b!779502 m!723025))

(assert (=> b!779501 m!723015))

(declare-fun m!723027 () Bool)

(assert (=> b!779501 m!723027))

(assert (=> b!779501 m!722999))

(assert (=> b!779501 m!722999))

(declare-fun m!723029 () Bool)

(assert (=> b!779501 m!723029))

(assert (=> b!779508 m!722999))

(assert (=> b!779508 m!722999))

(assert (=> b!779508 m!723029))

(assert (=> b!779507 m!722999))

(assert (=> b!779507 m!722999))

(declare-fun m!723031 () Bool)

(assert (=> b!779507 m!723031))

(assert (=> b!779507 m!723031))

(assert (=> b!779507 m!722999))

(declare-fun m!723033 () Bool)

(assert (=> b!779507 m!723033))

(declare-fun m!723035 () Bool)

(assert (=> b!779492 m!723035))

(declare-fun m!723037 () Bool)

(assert (=> start!67374 m!723037))

(declare-fun m!723039 () Bool)

(assert (=> start!67374 m!723039))

(declare-fun m!723041 () Bool)

(assert (=> b!779491 m!723041))

(assert (=> b!779503 m!722999))

(assert (=> b!779503 m!722999))

(declare-fun m!723043 () Bool)

(assert (=> b!779503 m!723043))

(declare-fun m!723045 () Bool)

(assert (=> b!779504 m!723045))

(push 1)

