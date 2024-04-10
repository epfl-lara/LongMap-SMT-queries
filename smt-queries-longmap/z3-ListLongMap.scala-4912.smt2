; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67718 () Bool)

(assert start!67718)

(declare-fun e!436684 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42758 0))(
  ( (array!42759 (arr!20467 (Array (_ BitVec 32) (_ BitVec 64))) (size!20888 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42758)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!785483 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8067 0))(
  ( (MissingZero!8067 (index!34636 (_ BitVec 32))) (Found!8067 (index!34637 (_ BitVec 32))) (Intermediate!8067 (undefined!8879 Bool) (index!34638 (_ BitVec 32)) (x!65583 (_ BitVec 32))) (Undefined!8067) (MissingVacant!8067 (index!34639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42758 (_ BitVec 32)) SeekEntryResult!8067)

(assert (=> b!785483 (= e!436684 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) (Found!8067 j!159)))))

(declare-fun b!785484 () Bool)

(declare-fun e!436686 () Bool)

(declare-fun e!436678 () Bool)

(assert (=> b!785484 (= e!436686 e!436678)))

(declare-fun res!531701 () Bool)

(assert (=> b!785484 (=> (not res!531701) (not e!436678))))

(declare-fun lt!350229 () SeekEntryResult!8067)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785484 (= res!531701 (or (= lt!350229 (MissingZero!8067 i!1173)) (= lt!350229 (MissingVacant!8067 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42758 (_ BitVec 32)) SeekEntryResult!8067)

(assert (=> b!785484 (= lt!350229 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785485 () Bool)

(declare-fun res!531698 () Bool)

(declare-fun e!436683 () Bool)

(assert (=> b!785485 (=> (not res!531698) (not e!436683))))

(assert (=> b!785485 (= res!531698 e!436684)))

(declare-fun c!87301 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785485 (= c!87301 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785486 () Bool)

(declare-fun res!531715 () Bool)

(assert (=> b!785486 (=> (not res!531715) (not e!436686))))

(assert (=> b!785486 (= res!531715 (and (= (size!20888 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20888 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20888 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785487 () Bool)

(declare-fun e!436677 () Bool)

(assert (=> b!785487 (= e!436677 true)))

(declare-fun e!436679 () Bool)

(assert (=> b!785487 e!436679))

(declare-fun res!531707 () Bool)

(assert (=> b!785487 (=> (not res!531707) (not e!436679))))

(declare-fun lt!350230 () (_ BitVec 64))

(assert (=> b!785487 (= res!531707 (= lt!350230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27156 0))(
  ( (Unit!27157) )
))
(declare-fun lt!350238 () Unit!27156)

(declare-fun e!436681 () Unit!27156)

(assert (=> b!785487 (= lt!350238 e!436681)))

(declare-fun c!87300 () Bool)

(assert (=> b!785487 (= c!87300 (= lt!350230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785488 () Bool)

(declare-fun e!436680 () Bool)

(declare-fun lt!350231 () SeekEntryResult!8067)

(assert (=> b!785488 (= e!436680 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350231))))

(declare-fun b!785489 () Bool)

(assert (=> b!785489 (= e!436678 e!436683)))

(declare-fun res!531703 () Bool)

(assert (=> b!785489 (=> (not res!531703) (not e!436683))))

(declare-fun lt!350239 () SeekEntryResult!8067)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42758 (_ BitVec 32)) SeekEntryResult!8067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785489 (= res!531703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20467 a!3186) j!159) mask!3328) (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350239))))

(assert (=> b!785489 (= lt!350239 (Intermediate!8067 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785490 () Bool)

(declare-fun e!436685 () Bool)

(assert (=> b!785490 (= e!436685 e!436677)))

(declare-fun res!531714 () Bool)

(assert (=> b!785490 (=> res!531714 e!436677)))

(declare-fun lt!350240 () (_ BitVec 64))

(assert (=> b!785490 (= res!531714 (= lt!350230 lt!350240))))

(assert (=> b!785490 (= lt!350230 (select (store (arr!20467 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!531710 () Bool)

(assert (=> start!67718 (=> (not res!531710) (not e!436686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67718 (= res!531710 (validMask!0 mask!3328))))

(assert (=> start!67718 e!436686))

(assert (=> start!67718 true))

(declare-fun array_inv!16263 (array!42758) Bool)

(assert (=> start!67718 (array_inv!16263 a!3186)))

(declare-fun b!785491 () Bool)

(declare-fun e!436682 () Bool)

(declare-fun e!436687 () Bool)

(assert (=> b!785491 (= e!436682 (not e!436687))))

(declare-fun res!531699 () Bool)

(assert (=> b!785491 (=> res!531699 e!436687)))

(declare-fun lt!350232 () SeekEntryResult!8067)

(get-info :version)

(assert (=> b!785491 (= res!531699 (or (not ((_ is Intermediate!8067) lt!350232)) (bvslt x!1131 (x!65583 lt!350232)) (not (= x!1131 (x!65583 lt!350232))) (not (= index!1321 (index!34638 lt!350232)))))))

(assert (=> b!785491 e!436680))

(declare-fun res!531716 () Bool)

(assert (=> b!785491 (=> (not res!531716) (not e!436680))))

(declare-fun lt!350237 () SeekEntryResult!8067)

(assert (=> b!785491 (= res!531716 (= lt!350237 lt!350231))))

(assert (=> b!785491 (= lt!350231 (Found!8067 j!159))))

(assert (=> b!785491 (= lt!350237 (seekEntryOrOpen!0 (select (arr!20467 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42758 (_ BitVec 32)) Bool)

(assert (=> b!785491 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350233 () Unit!27156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27156)

(assert (=> b!785491 (= lt!350233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785492 () Bool)

(declare-fun res!531702 () Bool)

(assert (=> b!785492 (=> (not res!531702) (not e!436678))))

(assert (=> b!785492 (= res!531702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785493 () Bool)

(declare-fun res!531712 () Bool)

(assert (=> b!785493 (=> (not res!531712) (not e!436686))))

(declare-fun arrayContainsKey!0 (array!42758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785493 (= res!531712 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785494 () Bool)

(declare-fun res!531709 () Bool)

(assert (=> b!785494 (=> (not res!531709) (not e!436686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785494 (= res!531709 (validKeyInArray!0 k0!2102))))

(declare-fun b!785495 () Bool)

(assert (=> b!785495 (= e!436683 e!436682)))

(declare-fun res!531713 () Bool)

(assert (=> b!785495 (=> (not res!531713) (not e!436682))))

(declare-fun lt!350234 () SeekEntryResult!8067)

(assert (=> b!785495 (= res!531713 (= lt!350234 lt!350232))))

(declare-fun lt!350236 () array!42758)

(assert (=> b!785495 (= lt!350232 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350240 lt!350236 mask!3328))))

(assert (=> b!785495 (= lt!350234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350240 mask!3328) lt!350240 lt!350236 mask!3328))))

(assert (=> b!785495 (= lt!350240 (select (store (arr!20467 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785495 (= lt!350236 (array!42759 (store (arr!20467 a!3186) i!1173 k0!2102) (size!20888 a!3186)))))

(declare-fun b!785496 () Bool)

(declare-fun Unit!27158 () Unit!27156)

(assert (=> b!785496 (= e!436681 Unit!27158)))

(assert (=> b!785496 false))

(declare-fun b!785497 () Bool)

(declare-fun res!531704 () Bool)

(assert (=> b!785497 (=> (not res!531704) (not e!436683))))

(assert (=> b!785497 (= res!531704 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20467 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785498 () Bool)

(declare-fun res!531708 () Bool)

(assert (=> b!785498 (=> (not res!531708) (not e!436686))))

(assert (=> b!785498 (= res!531708 (validKeyInArray!0 (select (arr!20467 a!3186) j!159)))))

(declare-fun b!785499 () Bool)

(declare-fun res!531711 () Bool)

(assert (=> b!785499 (=> (not res!531711) (not e!436678))))

(assert (=> b!785499 (= res!531711 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20888 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20888 a!3186))))))

(declare-fun b!785500 () Bool)

(assert (=> b!785500 (= e!436687 e!436685)))

(declare-fun res!531706 () Bool)

(assert (=> b!785500 (=> res!531706 e!436685)))

(declare-fun lt!350235 () SeekEntryResult!8067)

(assert (=> b!785500 (= res!531706 (not (= lt!350235 lt!350231)))))

(assert (=> b!785500 (= lt!350235 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785501 () Bool)

(assert (=> b!785501 (= e!436679 (= lt!350237 lt!350235))))

(declare-fun b!785502 () Bool)

(declare-fun res!531705 () Bool)

(assert (=> b!785502 (=> (not res!531705) (not e!436679))))

(assert (=> b!785502 (= res!531705 (= (seekEntryOrOpen!0 lt!350240 lt!350236 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350240 lt!350236 mask!3328)))))

(declare-fun b!785503 () Bool)

(declare-fun Unit!27159 () Unit!27156)

(assert (=> b!785503 (= e!436681 Unit!27159)))

(declare-fun b!785504 () Bool)

(assert (=> b!785504 (= e!436684 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350239))))

(declare-fun b!785505 () Bool)

(declare-fun res!531700 () Bool)

(assert (=> b!785505 (=> (not res!531700) (not e!436678))))

(declare-datatypes ((List!14469 0))(
  ( (Nil!14466) (Cons!14465 (h!15588 (_ BitVec 64)) (t!20784 List!14469)) )
))
(declare-fun arrayNoDuplicates!0 (array!42758 (_ BitVec 32) List!14469) Bool)

(assert (=> b!785505 (= res!531700 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14466))))

(assert (= (and start!67718 res!531710) b!785486))

(assert (= (and b!785486 res!531715) b!785498))

(assert (= (and b!785498 res!531708) b!785494))

(assert (= (and b!785494 res!531709) b!785493))

(assert (= (and b!785493 res!531712) b!785484))

(assert (= (and b!785484 res!531701) b!785492))

(assert (= (and b!785492 res!531702) b!785505))

(assert (= (and b!785505 res!531700) b!785499))

(assert (= (and b!785499 res!531711) b!785489))

(assert (= (and b!785489 res!531703) b!785497))

(assert (= (and b!785497 res!531704) b!785485))

(assert (= (and b!785485 c!87301) b!785504))

(assert (= (and b!785485 (not c!87301)) b!785483))

(assert (= (and b!785485 res!531698) b!785495))

(assert (= (and b!785495 res!531713) b!785491))

(assert (= (and b!785491 res!531716) b!785488))

(assert (= (and b!785491 (not res!531699)) b!785500))

(assert (= (and b!785500 (not res!531706)) b!785490))

(assert (= (and b!785490 (not res!531714)) b!785487))

(assert (= (and b!785487 c!87300) b!785496))

(assert (= (and b!785487 (not c!87300)) b!785503))

(assert (= (and b!785487 res!531707) b!785502))

(assert (= (and b!785502 res!531705) b!785501))

(declare-fun m!727545 () Bool)

(assert (=> b!785502 m!727545))

(declare-fun m!727547 () Bool)

(assert (=> b!785502 m!727547))

(declare-fun m!727549 () Bool)

(assert (=> b!785491 m!727549))

(assert (=> b!785491 m!727549))

(declare-fun m!727551 () Bool)

(assert (=> b!785491 m!727551))

(declare-fun m!727553 () Bool)

(assert (=> b!785491 m!727553))

(declare-fun m!727555 () Bool)

(assert (=> b!785491 m!727555))

(assert (=> b!785483 m!727549))

(assert (=> b!785483 m!727549))

(declare-fun m!727557 () Bool)

(assert (=> b!785483 m!727557))

(assert (=> b!785489 m!727549))

(assert (=> b!785489 m!727549))

(declare-fun m!727559 () Bool)

(assert (=> b!785489 m!727559))

(assert (=> b!785489 m!727559))

(assert (=> b!785489 m!727549))

(declare-fun m!727561 () Bool)

(assert (=> b!785489 m!727561))

(declare-fun m!727563 () Bool)

(assert (=> b!785497 m!727563))

(declare-fun m!727565 () Bool)

(assert (=> b!785505 m!727565))

(declare-fun m!727567 () Bool)

(assert (=> b!785484 m!727567))

(declare-fun m!727569 () Bool)

(assert (=> b!785492 m!727569))

(declare-fun m!727571 () Bool)

(assert (=> b!785493 m!727571))

(declare-fun m!727573 () Bool)

(assert (=> start!67718 m!727573))

(declare-fun m!727575 () Bool)

(assert (=> start!67718 m!727575))

(assert (=> b!785500 m!727549))

(assert (=> b!785500 m!727549))

(assert (=> b!785500 m!727557))

(declare-fun m!727577 () Bool)

(assert (=> b!785495 m!727577))

(assert (=> b!785495 m!727577))

(declare-fun m!727579 () Bool)

(assert (=> b!785495 m!727579))

(declare-fun m!727581 () Bool)

(assert (=> b!785495 m!727581))

(declare-fun m!727583 () Bool)

(assert (=> b!785495 m!727583))

(declare-fun m!727585 () Bool)

(assert (=> b!785495 m!727585))

(declare-fun m!727587 () Bool)

(assert (=> b!785494 m!727587))

(assert (=> b!785488 m!727549))

(assert (=> b!785488 m!727549))

(declare-fun m!727589 () Bool)

(assert (=> b!785488 m!727589))

(assert (=> b!785490 m!727581))

(declare-fun m!727591 () Bool)

(assert (=> b!785490 m!727591))

(assert (=> b!785498 m!727549))

(assert (=> b!785498 m!727549))

(declare-fun m!727593 () Bool)

(assert (=> b!785498 m!727593))

(assert (=> b!785504 m!727549))

(assert (=> b!785504 m!727549))

(declare-fun m!727595 () Bool)

(assert (=> b!785504 m!727595))

(check-sat (not b!785502) (not b!785505) (not b!785498) (not b!785484) (not start!67718) (not b!785492) (not b!785489) (not b!785493) (not b!785495) (not b!785504) (not b!785500) (not b!785488) (not b!785483) (not b!785491) (not b!785494))
(check-sat)
