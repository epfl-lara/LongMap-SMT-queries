; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64526 () Bool)

(assert start!64526)

(declare-fun b!726497 () Bool)

(declare-fun res!487481 () Bool)

(declare-fun e!406754 () Bool)

(assert (=> b!726497 (=> (not res!487481) (not e!406754))))

(declare-datatypes ((array!41044 0))(
  ( (array!41045 (arr!19643 (Array (_ BitVec 32) (_ BitVec 64))) (size!20064 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41044)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41044 (_ BitVec 32)) Bool)

(assert (=> b!726497 (= res!487481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726498 () Bool)

(declare-fun res!487480 () Bool)

(assert (=> b!726498 (=> (not res!487480) (not e!406754))))

(declare-datatypes ((List!13645 0))(
  ( (Nil!13642) (Cons!13641 (h!14698 (_ BitVec 64)) (t!19960 List!13645)) )
))
(declare-fun arrayNoDuplicates!0 (array!41044 (_ BitVec 32) List!13645) Bool)

(assert (=> b!726498 (= res!487480 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13642))))

(declare-fun b!726499 () Bool)

(declare-fun e!406756 () Bool)

(declare-fun e!406759 () Bool)

(assert (=> b!726499 (= e!406756 e!406759)))

(declare-fun res!487475 () Bool)

(assert (=> b!726499 (=> (not res!487475) (not e!406759))))

(declare-datatypes ((SeekEntryResult!7243 0))(
  ( (MissingZero!7243 (index!31340 (_ BitVec 32))) (Found!7243 (index!31341 (_ BitVec 32))) (Intermediate!7243 (undefined!8055 Bool) (index!31342 (_ BitVec 32)) (x!62325 (_ BitVec 32))) (Undefined!7243) (MissingVacant!7243 (index!31343 (_ BitVec 32))) )
))
(declare-fun lt!321748 () SeekEntryResult!7243)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41044 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726499 (= res!487475 (= (seekEntryOrOpen!0 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321748))))

(assert (=> b!726499 (= lt!321748 (Found!7243 j!159))))

(declare-fun b!726500 () Bool)

(declare-fun res!487486 () Bool)

(declare-fun e!406755 () Bool)

(assert (=> b!726500 (=> (not res!487486) (not e!406755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726500 (= res!487486 (validKeyInArray!0 (select (arr!19643 a!3186) j!159)))))

(declare-fun b!726501 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406758 () Bool)

(declare-fun lt!321753 () SeekEntryResult!7243)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41044 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726501 (= e!406758 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321753))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!726502 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41044 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726502 (= e!406758 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) (Found!7243 j!159)))))

(declare-fun b!726503 () Bool)

(declare-fun res!487476 () Bool)

(assert (=> b!726503 (=> (not res!487476) (not e!406755))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726503 (= res!487476 (and (= (size!20064 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20064 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20064 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726504 () Bool)

(declare-fun lt!321749 () SeekEntryResult!7243)

(declare-fun e!406757 () Bool)

(assert (=> b!726504 (= e!406757 (not (or (not (is-Intermediate!7243 lt!321749)) (bvsge x!1131 (x!62325 lt!321749)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!726504 e!406756))

(declare-fun res!487479 () Bool)

(assert (=> b!726504 (=> (not res!487479) (not e!406756))))

(assert (=> b!726504 (= res!487479 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24804 0))(
  ( (Unit!24805) )
))
(declare-fun lt!321752 () Unit!24804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24804)

(assert (=> b!726504 (= lt!321752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726505 () Bool)

(declare-fun res!487478 () Bool)

(assert (=> b!726505 (=> (not res!487478) (not e!406755))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!726505 (= res!487478 (validKeyInArray!0 k!2102))))

(declare-fun res!487473 () Bool)

(assert (=> start!64526 (=> (not res!487473) (not e!406755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64526 (= res!487473 (validMask!0 mask!3328))))

(assert (=> start!64526 e!406755))

(assert (=> start!64526 true))

(declare-fun array_inv!15439 (array!41044) Bool)

(assert (=> start!64526 (array_inv!15439 a!3186)))

(declare-fun b!726506 () Bool)

(declare-fun e!406753 () Bool)

(assert (=> b!726506 (= e!406753 e!406757)))

(declare-fun res!487487 () Bool)

(assert (=> b!726506 (=> (not res!487487) (not e!406757))))

(declare-fun lt!321750 () SeekEntryResult!7243)

(assert (=> b!726506 (= res!487487 (= lt!321750 lt!321749))))

(declare-fun lt!321755 () (_ BitVec 64))

(declare-fun lt!321754 () array!41044)

(assert (=> b!726506 (= lt!321749 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321755 lt!321754 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726506 (= lt!321750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321755 mask!3328) lt!321755 lt!321754 mask!3328))))

(assert (=> b!726506 (= lt!321755 (select (store (arr!19643 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726506 (= lt!321754 (array!41045 (store (arr!19643 a!3186) i!1173 k!2102) (size!20064 a!3186)))))

(declare-fun b!726507 () Bool)

(declare-fun res!487477 () Bool)

(assert (=> b!726507 (=> (not res!487477) (not e!406754))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726507 (= res!487477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20064 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20064 a!3186))))))

(declare-fun b!726508 () Bool)

(declare-fun res!487474 () Bool)

(assert (=> b!726508 (=> (not res!487474) (not e!406753))))

(assert (=> b!726508 (= res!487474 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19643 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726509 () Bool)

(assert (=> b!726509 (= e!406759 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321748))))

(declare-fun b!726510 () Bool)

(assert (=> b!726510 (= e!406754 e!406753)))

(declare-fun res!487483 () Bool)

(assert (=> b!726510 (=> (not res!487483) (not e!406753))))

(assert (=> b!726510 (= res!487483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19643 a!3186) j!159) mask!3328) (select (arr!19643 a!3186) j!159) a!3186 mask!3328) lt!321753))))

(assert (=> b!726510 (= lt!321753 (Intermediate!7243 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726511 () Bool)

(declare-fun res!487482 () Bool)

(assert (=> b!726511 (=> (not res!487482) (not e!406755))))

(declare-fun arrayContainsKey!0 (array!41044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726511 (= res!487482 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726512 () Bool)

(declare-fun res!487484 () Bool)

(assert (=> b!726512 (=> (not res!487484) (not e!406753))))

(assert (=> b!726512 (= res!487484 e!406758)))

(declare-fun c!79885 () Bool)

(assert (=> b!726512 (= c!79885 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726513 () Bool)

(assert (=> b!726513 (= e!406755 e!406754)))

(declare-fun res!487485 () Bool)

(assert (=> b!726513 (=> (not res!487485) (not e!406754))))

(declare-fun lt!321751 () SeekEntryResult!7243)

(assert (=> b!726513 (= res!487485 (or (= lt!321751 (MissingZero!7243 i!1173)) (= lt!321751 (MissingVacant!7243 i!1173))))))

(assert (=> b!726513 (= lt!321751 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64526 res!487473) b!726503))

(assert (= (and b!726503 res!487476) b!726500))

(assert (= (and b!726500 res!487486) b!726505))

(assert (= (and b!726505 res!487478) b!726511))

(assert (= (and b!726511 res!487482) b!726513))

(assert (= (and b!726513 res!487485) b!726497))

(assert (= (and b!726497 res!487481) b!726498))

(assert (= (and b!726498 res!487480) b!726507))

(assert (= (and b!726507 res!487477) b!726510))

(assert (= (and b!726510 res!487483) b!726508))

(assert (= (and b!726508 res!487474) b!726512))

(assert (= (and b!726512 c!79885) b!726501))

(assert (= (and b!726512 (not c!79885)) b!726502))

(assert (= (and b!726512 res!487484) b!726506))

(assert (= (and b!726506 res!487487) b!726504))

(assert (= (and b!726504 res!487479) b!726499))

(assert (= (and b!726499 res!487475) b!726509))

(declare-fun m!680553 () Bool)

(assert (=> b!726505 m!680553))

(declare-fun m!680555 () Bool)

(assert (=> start!64526 m!680555))

(declare-fun m!680557 () Bool)

(assert (=> start!64526 m!680557))

(declare-fun m!680559 () Bool)

(assert (=> b!726500 m!680559))

(assert (=> b!726500 m!680559))

(declare-fun m!680561 () Bool)

(assert (=> b!726500 m!680561))

(assert (=> b!726510 m!680559))

(assert (=> b!726510 m!680559))

(declare-fun m!680563 () Bool)

(assert (=> b!726510 m!680563))

(assert (=> b!726510 m!680563))

(assert (=> b!726510 m!680559))

(declare-fun m!680565 () Bool)

(assert (=> b!726510 m!680565))

(declare-fun m!680567 () Bool)

(assert (=> b!726506 m!680567))

(declare-fun m!680569 () Bool)

(assert (=> b!726506 m!680569))

(declare-fun m!680571 () Bool)

(assert (=> b!726506 m!680571))

(declare-fun m!680573 () Bool)

(assert (=> b!726506 m!680573))

(assert (=> b!726506 m!680573))

(declare-fun m!680575 () Bool)

(assert (=> b!726506 m!680575))

(declare-fun m!680577 () Bool)

(assert (=> b!726513 m!680577))

(declare-fun m!680579 () Bool)

(assert (=> b!726498 m!680579))

(assert (=> b!726501 m!680559))

(assert (=> b!726501 m!680559))

(declare-fun m!680581 () Bool)

(assert (=> b!726501 m!680581))

(declare-fun m!680583 () Bool)

(assert (=> b!726508 m!680583))

(declare-fun m!680585 () Bool)

(assert (=> b!726511 m!680585))

(declare-fun m!680587 () Bool)

(assert (=> b!726497 m!680587))

(assert (=> b!726499 m!680559))

(assert (=> b!726499 m!680559))

(declare-fun m!680589 () Bool)

(assert (=> b!726499 m!680589))

(assert (=> b!726509 m!680559))

(assert (=> b!726509 m!680559))

(declare-fun m!680591 () Bool)

(assert (=> b!726509 m!680591))

(assert (=> b!726502 m!680559))

(assert (=> b!726502 m!680559))

(declare-fun m!680593 () Bool)

(assert (=> b!726502 m!680593))

(declare-fun m!680595 () Bool)

(assert (=> b!726504 m!680595))

(declare-fun m!680597 () Bool)

(assert (=> b!726504 m!680597))

(push 1)

(assert (not b!726499))

(assert (not b!726511))

(assert (not b!726504))

(assert (not b!726510))

(assert (not b!726505))

(assert (not b!726497))

(assert (not start!64526))

(assert (not b!726498))

(assert (not b!726501))

(assert (not b!726506))

(assert (not b!726500))

(assert (not b!726502))

(assert (not b!726513))

(assert (not b!726509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

