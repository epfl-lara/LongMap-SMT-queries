; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65406 () Bool)

(assert start!65406)

(declare-fun b!741564 () Bool)

(declare-fun e!414635 () Bool)

(declare-fun e!414627 () Bool)

(assert (=> b!741564 (= e!414635 (not e!414627))))

(declare-fun res!498527 () Bool)

(assert (=> b!741564 (=> res!498527 e!414627)))

(declare-datatypes ((SeekEntryResult!7390 0))(
  ( (MissingZero!7390 (index!31928 (_ BitVec 32))) (Found!7390 (index!31929 (_ BitVec 32))) (Intermediate!7390 (undefined!8202 Bool) (index!31930 (_ BitVec 32)) (x!63072 (_ BitVec 32))) (Undefined!7390) (MissingVacant!7390 (index!31931 (_ BitVec 32))) )
))
(declare-fun lt!329453 () SeekEntryResult!7390)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!741564 (= res!498527 (or (not ((_ is Intermediate!7390) lt!329453)) (bvsge x!1131 (x!63072 lt!329453))))))

(declare-fun lt!329448 () SeekEntryResult!7390)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!741564 (= lt!329448 (Found!7390 j!159))))

(declare-fun e!414630 () Bool)

(assert (=> b!741564 e!414630))

(declare-fun res!498540 () Bool)

(assert (=> b!741564 (=> (not res!498540) (not e!414630))))

(declare-datatypes ((array!41449 0))(
  ( (array!41450 (arr!19834 (Array (_ BitVec 32) (_ BitVec 64))) (size!20254 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41449)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41449 (_ BitVec 32)) Bool)

(assert (=> b!741564 (= res!498540 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25333 0))(
  ( (Unit!25334) )
))
(declare-fun lt!329460 () Unit!25333)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25333)

(assert (=> b!741564 (= lt!329460 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741565 () Bool)

(declare-fun e!414639 () Unit!25333)

(declare-fun Unit!25335 () Unit!25333)

(assert (=> b!741565 (= e!414639 Unit!25335)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329449 () SeekEntryResult!7390)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!741565 (= lt!329449 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!329457 () (_ BitVec 32))

(assert (=> b!741565 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329457 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329448)))

(declare-fun b!741566 () Bool)

(declare-fun res!498531 () Bool)

(declare-fun e!414631 () Bool)

(assert (=> b!741566 (=> (not res!498531) (not e!414631))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741566 (= res!498531 (validKeyInArray!0 k0!2102))))

(declare-fun b!741567 () Bool)

(declare-fun e!414637 () Bool)

(declare-fun e!414632 () Bool)

(assert (=> b!741567 (= e!414637 e!414632)))

(declare-fun res!498530 () Bool)

(assert (=> b!741567 (=> (not res!498530) (not e!414632))))

(declare-fun lt!329455 () SeekEntryResult!7390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741567 (= res!498530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19834 a!3186) j!159) mask!3328) (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329455))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741567 (= lt!329455 (Intermediate!7390 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!414638 () Bool)

(declare-fun b!741568 () Bool)

(assert (=> b!741568 (= e!414638 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329455))))

(declare-fun b!741569 () Bool)

(declare-fun res!498528 () Bool)

(assert (=> b!741569 (=> (not res!498528) (not e!414631))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741569 (= res!498528 (and (= (size!20254 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20254 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20254 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741570 () Bool)

(declare-fun res!498535 () Bool)

(declare-fun e!414629 () Bool)

(assert (=> b!741570 (=> res!498535 e!414629)))

(declare-fun lt!329452 () (_ BitVec 64))

(declare-fun lt!329454 () SeekEntryResult!7390)

(declare-fun lt!329458 () array!41449)

(assert (=> b!741570 (= res!498535 (not (= lt!329454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329457 lt!329452 lt!329458 mask!3328))))))

(declare-fun b!741571 () Bool)

(assert (=> b!741571 (= e!414638 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) (Found!7390 j!159)))))

(declare-fun b!741572 () Bool)

(declare-fun res!498532 () Bool)

(assert (=> b!741572 (=> (not res!498532) (not e!414632))))

(assert (=> b!741572 (= res!498532 e!414638)))

(declare-fun c!81905 () Bool)

(assert (=> b!741572 (= c!81905 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741574 () Bool)

(declare-fun res!498541 () Bool)

(assert (=> b!741574 (=> (not res!498541) (not e!414632))))

(assert (=> b!741574 (= res!498541 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19834 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741575 () Bool)

(declare-fun res!498543 () Bool)

(assert (=> b!741575 (=> (not res!498543) (not e!414637))))

(assert (=> b!741575 (= res!498543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741576 () Bool)

(declare-fun Unit!25336 () Unit!25333)

(assert (=> b!741576 (= e!414639 Unit!25336)))

(assert (=> b!741576 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329457 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329455)))

(declare-fun b!741577 () Bool)

(assert (=> b!741577 (= e!414632 e!414635)))

(declare-fun res!498525 () Bool)

(assert (=> b!741577 (=> (not res!498525) (not e!414635))))

(assert (=> b!741577 (= res!498525 (= lt!329454 lt!329453))))

(assert (=> b!741577 (= lt!329453 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329452 lt!329458 mask!3328))))

(assert (=> b!741577 (= lt!329454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329452 mask!3328) lt!329452 lt!329458 mask!3328))))

(assert (=> b!741577 (= lt!329452 (select (store (arr!19834 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741577 (= lt!329458 (array!41450 (store (arr!19834 a!3186) i!1173 k0!2102) (size!20254 a!3186)))))

(declare-fun b!741578 () Bool)

(declare-fun e!414628 () Bool)

(assert (=> b!741578 (= e!414628 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329457 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329455)))))

(declare-fun b!741579 () Bool)

(declare-fun res!498537 () Bool)

(assert (=> b!741579 (=> (not res!498537) (not e!414637))))

(declare-datatypes ((List!13743 0))(
  ( (Nil!13740) (Cons!13739 (h!14817 (_ BitVec 64)) (t!20050 List!13743)) )
))
(declare-fun arrayNoDuplicates!0 (array!41449 (_ BitVec 32) List!13743) Bool)

(assert (=> b!741579 (= res!498537 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13740))))

(declare-fun b!741580 () Bool)

(declare-fun res!498542 () Bool)

(assert (=> b!741580 (=> (not res!498542) (not e!414637))))

(assert (=> b!741580 (= res!498542 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20254 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20254 a!3186))))))

(declare-fun b!741581 () Bool)

(assert (=> b!741581 (= e!414627 e!414629)))

(declare-fun res!498539 () Bool)

(assert (=> b!741581 (=> res!498539 e!414629)))

(assert (=> b!741581 (= res!498539 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329457 #b00000000000000000000000000000000) (bvsge lt!329457 (size!20254 a!3186))))))

(declare-fun lt!329450 () Unit!25333)

(assert (=> b!741581 (= lt!329450 e!414639)))

(declare-fun c!81904 () Bool)

(declare-fun lt!329451 () Bool)

(assert (=> b!741581 (= c!81904 lt!329451)))

(assert (=> b!741581 (= lt!329451 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741581 (= lt!329457 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!741582 () Bool)

(declare-fun res!498526 () Bool)

(assert (=> b!741582 (=> (not res!498526) (not e!414631))))

(assert (=> b!741582 (= res!498526 (validKeyInArray!0 (select (arr!19834 a!3186) j!159)))))

(declare-fun b!741583 () Bool)

(declare-fun res!498529 () Bool)

(assert (=> b!741583 (=> res!498529 e!414629)))

(assert (=> b!741583 (= res!498529 e!414628)))

(declare-fun c!81903 () Bool)

(assert (=> b!741583 (= c!81903 lt!329451)))

(declare-fun b!741584 () Bool)

(declare-fun res!498538 () Bool)

(assert (=> b!741584 (=> (not res!498538) (not e!414631))))

(declare-fun arrayContainsKey!0 (array!41449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741584 (= res!498538 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741585 () Bool)

(assert (=> b!741585 (= e!414628 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329457 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329448)))))

(declare-fun b!741586 () Bool)

(declare-fun e!414633 () Bool)

(assert (=> b!741586 (= e!414629 e!414633)))

(declare-fun res!498534 () Bool)

(assert (=> b!741586 (=> res!498534 e!414633)))

(assert (=> b!741586 (= res!498534 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41449 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!741586 (= (seekEntryOrOpen!0 lt!329452 lt!329458 mask!3328) lt!329448)))

(declare-fun lt!329459 () Unit!25333)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25333)

(assert (=> b!741586 (= lt!329459 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329457 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun lt!329447 () SeekEntryResult!7390)

(declare-fun e!414634 () Bool)

(declare-fun b!741587 () Bool)

(assert (=> b!741587 (= e!414634 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329447))))

(declare-fun b!741588 () Bool)

(assert (=> b!741588 (= e!414630 e!414634)))

(declare-fun res!498536 () Bool)

(assert (=> b!741588 (=> (not res!498536) (not e!414634))))

(assert (=> b!741588 (= res!498536 (= (seekEntryOrOpen!0 (select (arr!19834 a!3186) j!159) a!3186 mask!3328) lt!329447))))

(assert (=> b!741588 (= lt!329447 (Found!7390 j!159))))

(declare-fun b!741589 () Bool)

(assert (=> b!741589 (= e!414631 e!414637)))

(declare-fun res!498533 () Bool)

(assert (=> b!741589 (=> (not res!498533) (not e!414637))))

(declare-fun lt!329456 () SeekEntryResult!7390)

(assert (=> b!741589 (= res!498533 (or (= lt!329456 (MissingZero!7390 i!1173)) (= lt!329456 (MissingVacant!7390 i!1173))))))

(assert (=> b!741589 (= lt!329456 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!498544 () Bool)

(assert (=> start!65406 (=> (not res!498544) (not e!414631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65406 (= res!498544 (validMask!0 mask!3328))))

(assert (=> start!65406 e!414631))

(assert (=> start!65406 true))

(declare-fun array_inv!15693 (array!41449) Bool)

(assert (=> start!65406 (array_inv!15693 a!3186)))

(declare-fun b!741573 () Bool)

(assert (=> b!741573 (= e!414633 (validKeyInArray!0 lt!329452))))

(assert (= (and start!65406 res!498544) b!741569))

(assert (= (and b!741569 res!498528) b!741582))

(assert (= (and b!741582 res!498526) b!741566))

(assert (= (and b!741566 res!498531) b!741584))

(assert (= (and b!741584 res!498538) b!741589))

(assert (= (and b!741589 res!498533) b!741575))

(assert (= (and b!741575 res!498543) b!741579))

(assert (= (and b!741579 res!498537) b!741580))

(assert (= (and b!741580 res!498542) b!741567))

(assert (= (and b!741567 res!498530) b!741574))

(assert (= (and b!741574 res!498541) b!741572))

(assert (= (and b!741572 c!81905) b!741568))

(assert (= (and b!741572 (not c!81905)) b!741571))

(assert (= (and b!741572 res!498532) b!741577))

(assert (= (and b!741577 res!498525) b!741564))

(assert (= (and b!741564 res!498540) b!741588))

(assert (= (and b!741588 res!498536) b!741587))

(assert (= (and b!741564 (not res!498527)) b!741581))

(assert (= (and b!741581 c!81904) b!741576))

(assert (= (and b!741581 (not c!81904)) b!741565))

(assert (= (and b!741581 (not res!498539)) b!741583))

(assert (= (and b!741583 c!81903) b!741578))

(assert (= (and b!741583 (not c!81903)) b!741585))

(assert (= (and b!741583 (not res!498529)) b!741570))

(assert (= (and b!741570 (not res!498535)) b!741586))

(assert (= (and b!741586 (not res!498534)) b!741573))

(declare-fun m!693027 () Bool)

(assert (=> b!741571 m!693027))

(assert (=> b!741571 m!693027))

(declare-fun m!693029 () Bool)

(assert (=> b!741571 m!693029))

(assert (=> b!741568 m!693027))

(assert (=> b!741568 m!693027))

(declare-fun m!693031 () Bool)

(assert (=> b!741568 m!693031))

(declare-fun m!693033 () Bool)

(assert (=> b!741566 m!693033))

(declare-fun m!693035 () Bool)

(assert (=> b!741589 m!693035))

(assert (=> b!741587 m!693027))

(assert (=> b!741587 m!693027))

(declare-fun m!693037 () Bool)

(assert (=> b!741587 m!693037))

(assert (=> b!741588 m!693027))

(assert (=> b!741588 m!693027))

(declare-fun m!693039 () Bool)

(assert (=> b!741588 m!693039))

(assert (=> b!741578 m!693027))

(assert (=> b!741578 m!693027))

(declare-fun m!693041 () Bool)

(assert (=> b!741578 m!693041))

(declare-fun m!693043 () Bool)

(assert (=> b!741586 m!693043))

(declare-fun m!693045 () Bool)

(assert (=> b!741586 m!693045))

(declare-fun m!693047 () Bool)

(assert (=> b!741579 m!693047))

(declare-fun m!693049 () Bool)

(assert (=> b!741575 m!693049))

(declare-fun m!693051 () Bool)

(assert (=> start!65406 m!693051))

(declare-fun m!693053 () Bool)

(assert (=> start!65406 m!693053))

(assert (=> b!741567 m!693027))

(assert (=> b!741567 m!693027))

(declare-fun m!693055 () Bool)

(assert (=> b!741567 m!693055))

(assert (=> b!741567 m!693055))

(assert (=> b!741567 m!693027))

(declare-fun m!693057 () Bool)

(assert (=> b!741567 m!693057))

(declare-fun m!693059 () Bool)

(assert (=> b!741577 m!693059))

(declare-fun m!693061 () Bool)

(assert (=> b!741577 m!693061))

(declare-fun m!693063 () Bool)

(assert (=> b!741577 m!693063))

(declare-fun m!693065 () Bool)

(assert (=> b!741577 m!693065))

(declare-fun m!693067 () Bool)

(assert (=> b!741577 m!693067))

(assert (=> b!741577 m!693063))

(assert (=> b!741576 m!693027))

(assert (=> b!741576 m!693027))

(assert (=> b!741576 m!693041))

(declare-fun m!693069 () Bool)

(assert (=> b!741581 m!693069))

(assert (=> b!741565 m!693027))

(assert (=> b!741565 m!693027))

(assert (=> b!741565 m!693029))

(assert (=> b!741565 m!693027))

(declare-fun m!693071 () Bool)

(assert (=> b!741565 m!693071))

(assert (=> b!741582 m!693027))

(assert (=> b!741582 m!693027))

(declare-fun m!693073 () Bool)

(assert (=> b!741582 m!693073))

(declare-fun m!693075 () Bool)

(assert (=> b!741574 m!693075))

(assert (=> b!741585 m!693027))

(assert (=> b!741585 m!693027))

(assert (=> b!741585 m!693071))

(declare-fun m!693077 () Bool)

(assert (=> b!741584 m!693077))

(declare-fun m!693079 () Bool)

(assert (=> b!741564 m!693079))

(declare-fun m!693081 () Bool)

(assert (=> b!741564 m!693081))

(declare-fun m!693083 () Bool)

(assert (=> b!741573 m!693083))

(declare-fun m!693085 () Bool)

(assert (=> b!741570 m!693085))

(check-sat (not b!741585) (not b!741565) (not b!741586) (not start!65406) (not b!741579) (not b!741568) (not b!741567) (not b!741575) (not b!741587) (not b!741581) (not b!741570) (not b!741584) (not b!741576) (not b!741571) (not b!741577) (not b!741564) (not b!741582) (not b!741589) (not b!741566) (not b!741588) (not b!741573) (not b!741578))
(check-sat)
