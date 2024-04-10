; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67546 () Bool)

(assert start!67546)

(declare-fun b!781510 () Bool)

(declare-fun res!528697 () Bool)

(declare-fun e!434679 () Bool)

(assert (=> b!781510 (=> (not res!528697) (not e!434679))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42649 0))(
  ( (array!42650 (arr!20414 (Array (_ BitVec 32) (_ BitVec 64))) (size!20835 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42649)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!781510 (= res!528697 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20835 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20835 a!3186))))))

(declare-fun b!781511 () Bool)

(declare-fun res!528699 () Bool)

(declare-fun e!434674 () Bool)

(assert (=> b!781511 (=> (not res!528699) (not e!434674))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781511 (= res!528699 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!434678 () Bool)

(declare-fun b!781512 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8014 0))(
  ( (MissingZero!8014 (index!34424 (_ BitVec 32))) (Found!8014 (index!34425 (_ BitVec 32))) (Intermediate!8014 (undefined!8826 Bool) (index!34426 (_ BitVec 32)) (x!65377 (_ BitVec 32))) (Undefined!8014) (MissingVacant!8014 (index!34427 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!781512 (= e!434678 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) (Found!8014 j!159)))))

(declare-fun b!781513 () Bool)

(declare-fun res!528693 () Bool)

(assert (=> b!781513 (=> (not res!528693) (not e!434674))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781513 (= res!528693 (and (= (size!20835 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20835 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20835 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781514 () Bool)

(declare-fun res!528688 () Bool)

(declare-fun e!434680 () Bool)

(assert (=> b!781514 (=> (not res!528688) (not e!434680))))

(assert (=> b!781514 (= res!528688 e!434678)))

(declare-fun c!86818 () Bool)

(assert (=> b!781514 (= c!86818 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!434675 () Bool)

(declare-fun lt!348265 () SeekEntryResult!8014)

(declare-fun b!781515 () Bool)

(assert (=> b!781515 (= e!434675 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348265))))

(declare-fun b!781516 () Bool)

(declare-fun res!528704 () Bool)

(declare-fun e!434681 () Bool)

(assert (=> b!781516 (=> res!528704 e!434681)))

(assert (=> b!781516 (= res!528704 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348265)))))

(declare-fun b!781517 () Bool)

(declare-datatypes ((Unit!26944 0))(
  ( (Unit!26945) )
))
(declare-fun e!434677 () Unit!26944)

(declare-fun Unit!26946 () Unit!26944)

(assert (=> b!781517 (= e!434677 Unit!26946)))

(assert (=> b!781517 false))

(declare-fun res!528691 () Bool)

(assert (=> start!67546 (=> (not res!528691) (not e!434674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67546 (= res!528691 (validMask!0 mask!3328))))

(assert (=> start!67546 e!434674))

(assert (=> start!67546 true))

(declare-fun array_inv!16210 (array!42649) Bool)

(assert (=> start!67546 (array_inv!16210 a!3186)))

(declare-fun b!781518 () Bool)

(declare-fun res!528692 () Bool)

(assert (=> b!781518 (=> (not res!528692) (not e!434680))))

(assert (=> b!781518 (= res!528692 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20414 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781519 () Bool)

(assert (=> b!781519 (= e!434674 e!434679)))

(declare-fun res!528689 () Bool)

(assert (=> b!781519 (=> (not res!528689) (not e!434679))))

(declare-fun lt!348268 () SeekEntryResult!8014)

(assert (=> b!781519 (= res!528689 (or (= lt!348268 (MissingZero!8014 i!1173)) (= lt!348268 (MissingVacant!8014 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!781519 (= lt!348268 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781520 () Bool)

(declare-fun res!528702 () Bool)

(assert (=> b!781520 (=> (not res!528702) (not e!434674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781520 (= res!528702 (validKeyInArray!0 k!2102))))

(declare-fun b!781521 () Bool)

(assert (=> b!781521 (= e!434681 true)))

(assert (=> b!781521 (= (select (store (arr!20414 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348269 () Unit!26944)

(assert (=> b!781521 (= lt!348269 e!434677)))

(declare-fun c!86817 () Bool)

(assert (=> b!781521 (= c!86817 (= (select (store (arr!20414 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781522 () Bool)

(declare-fun res!528701 () Bool)

(assert (=> b!781522 (=> (not res!528701) (not e!434674))))

(assert (=> b!781522 (= res!528701 (validKeyInArray!0 (select (arr!20414 a!3186) j!159)))))

(declare-fun b!781523 () Bool)

(declare-fun Unit!26947 () Unit!26944)

(assert (=> b!781523 (= e!434677 Unit!26947)))

(declare-fun b!781524 () Bool)

(declare-fun e!434673 () Bool)

(assert (=> b!781524 (= e!434680 e!434673)))

(declare-fun res!528700 () Bool)

(assert (=> b!781524 (=> (not res!528700) (not e!434673))))

(declare-fun lt!348264 () SeekEntryResult!8014)

(declare-fun lt!348263 () SeekEntryResult!8014)

(assert (=> b!781524 (= res!528700 (= lt!348264 lt!348263))))

(declare-fun lt!348267 () array!42649)

(declare-fun lt!348260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!8014)

(assert (=> b!781524 (= lt!348263 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348260 lt!348267 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781524 (= lt!348264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348260 mask!3328) lt!348260 lt!348267 mask!3328))))

(assert (=> b!781524 (= lt!348260 (select (store (arr!20414 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781524 (= lt!348267 (array!42650 (store (arr!20414 a!3186) i!1173 k!2102) (size!20835 a!3186)))))

(declare-fun b!781525 () Bool)

(declare-fun res!528703 () Bool)

(assert (=> b!781525 (=> res!528703 e!434681)))

(assert (=> b!781525 (= res!528703 (= (select (store (arr!20414 a!3186) i!1173 k!2102) index!1321) lt!348260))))

(declare-fun b!781526 () Bool)

(declare-fun res!528698 () Bool)

(assert (=> b!781526 (=> (not res!528698) (not e!434679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42649 (_ BitVec 32)) Bool)

(assert (=> b!781526 (= res!528698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781527 () Bool)

(assert (=> b!781527 (= e!434679 e!434680)))

(declare-fun res!528690 () Bool)

(assert (=> b!781527 (=> (not res!528690) (not e!434680))))

(declare-fun lt!348266 () SeekEntryResult!8014)

(assert (=> b!781527 (= res!528690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20414 a!3186) j!159) mask!3328) (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348266))))

(assert (=> b!781527 (= lt!348266 (Intermediate!8014 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781528 () Bool)

(declare-fun res!528696 () Bool)

(assert (=> b!781528 (=> (not res!528696) (not e!434679))))

(declare-datatypes ((List!14416 0))(
  ( (Nil!14413) (Cons!14412 (h!15532 (_ BitVec 64)) (t!20731 List!14416)) )
))
(declare-fun arrayNoDuplicates!0 (array!42649 (_ BitVec 32) List!14416) Bool)

(assert (=> b!781528 (= res!528696 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14413))))

(declare-fun b!781529 () Bool)

(assert (=> b!781529 (= e!434678 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20414 a!3186) j!159) a!3186 mask!3328) lt!348266))))

(declare-fun b!781530 () Bool)

(assert (=> b!781530 (= e!434673 (not e!434681))))

(declare-fun res!528694 () Bool)

(assert (=> b!781530 (=> res!528694 e!434681)))

(assert (=> b!781530 (= res!528694 (or (not (is-Intermediate!8014 lt!348263)) (bvslt x!1131 (x!65377 lt!348263)) (not (= x!1131 (x!65377 lt!348263))) (not (= index!1321 (index!34426 lt!348263)))))))

(assert (=> b!781530 e!434675))

(declare-fun res!528695 () Bool)

(assert (=> b!781530 (=> (not res!528695) (not e!434675))))

(declare-fun lt!348262 () SeekEntryResult!8014)

(assert (=> b!781530 (= res!528695 (= lt!348262 lt!348265))))

(assert (=> b!781530 (= lt!348265 (Found!8014 j!159))))

(assert (=> b!781530 (= lt!348262 (seekEntryOrOpen!0 (select (arr!20414 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781530 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348261 () Unit!26944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26944)

(assert (=> b!781530 (= lt!348261 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67546 res!528691) b!781513))

(assert (= (and b!781513 res!528693) b!781522))

(assert (= (and b!781522 res!528701) b!781520))

(assert (= (and b!781520 res!528702) b!781511))

(assert (= (and b!781511 res!528699) b!781519))

(assert (= (and b!781519 res!528689) b!781526))

(assert (= (and b!781526 res!528698) b!781528))

(assert (= (and b!781528 res!528696) b!781510))

(assert (= (and b!781510 res!528697) b!781527))

(assert (= (and b!781527 res!528690) b!781518))

(assert (= (and b!781518 res!528692) b!781514))

(assert (= (and b!781514 c!86818) b!781529))

(assert (= (and b!781514 (not c!86818)) b!781512))

(assert (= (and b!781514 res!528688) b!781524))

(assert (= (and b!781524 res!528700) b!781530))

(assert (= (and b!781530 res!528695) b!781515))

(assert (= (and b!781530 (not res!528694)) b!781516))

(assert (= (and b!781516 (not res!528704)) b!781525))

(assert (= (and b!781525 (not res!528703)) b!781521))

(assert (= (and b!781521 c!86817) b!781517))

(assert (= (and b!781521 (not c!86817)) b!781523))

(declare-fun m!724523 () Bool)

(assert (=> b!781512 m!724523))

(assert (=> b!781512 m!724523))

(declare-fun m!724525 () Bool)

(assert (=> b!781512 m!724525))

(assert (=> b!781529 m!724523))

(assert (=> b!781529 m!724523))

(declare-fun m!724527 () Bool)

(assert (=> b!781529 m!724527))

(declare-fun m!724529 () Bool)

(assert (=> b!781524 m!724529))

(declare-fun m!724531 () Bool)

(assert (=> b!781524 m!724531))

(declare-fun m!724533 () Bool)

(assert (=> b!781524 m!724533))

(declare-fun m!724535 () Bool)

(assert (=> b!781524 m!724535))

(assert (=> b!781524 m!724533))

(declare-fun m!724537 () Bool)

(assert (=> b!781524 m!724537))

(declare-fun m!724539 () Bool)

(assert (=> b!781518 m!724539))

(assert (=> b!781527 m!724523))

(assert (=> b!781527 m!724523))

(declare-fun m!724541 () Bool)

(assert (=> b!781527 m!724541))

(assert (=> b!781527 m!724541))

(assert (=> b!781527 m!724523))

(declare-fun m!724543 () Bool)

(assert (=> b!781527 m!724543))

(declare-fun m!724545 () Bool)

(assert (=> start!67546 m!724545))

(declare-fun m!724547 () Bool)

(assert (=> start!67546 m!724547))

(assert (=> b!781522 m!724523))

(assert (=> b!781522 m!724523))

(declare-fun m!724549 () Bool)

(assert (=> b!781522 m!724549))

(declare-fun m!724551 () Bool)

(assert (=> b!781519 m!724551))

(declare-fun m!724553 () Bool)

(assert (=> b!781526 m!724553))

(declare-fun m!724555 () Bool)

(assert (=> b!781511 m!724555))

(assert (=> b!781516 m!724523))

(assert (=> b!781516 m!724523))

(assert (=> b!781516 m!724525))

(declare-fun m!724557 () Bool)

(assert (=> b!781520 m!724557))

(assert (=> b!781515 m!724523))

(assert (=> b!781515 m!724523))

(declare-fun m!724559 () Bool)

(assert (=> b!781515 m!724559))

(declare-fun m!724561 () Bool)

(assert (=> b!781528 m!724561))

(assert (=> b!781530 m!724523))

(assert (=> b!781530 m!724523))

(declare-fun m!724563 () Bool)

(assert (=> b!781530 m!724563))

(declare-fun m!724565 () Bool)

(assert (=> b!781530 m!724565))

(declare-fun m!724567 () Bool)

(assert (=> b!781530 m!724567))

(assert (=> b!781521 m!724531))

(declare-fun m!724569 () Bool)

(assert (=> b!781521 m!724569))

(assert (=> b!781525 m!724531))

(assert (=> b!781525 m!724569))

(push 1)

