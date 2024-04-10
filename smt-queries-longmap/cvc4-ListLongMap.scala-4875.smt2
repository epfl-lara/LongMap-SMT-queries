; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67168 () Bool)

(assert start!67168)

(declare-fun b!776542 () Bool)

(declare-fun e!432117 () Bool)

(declare-fun e!432121 () Bool)

(assert (=> b!776542 (= e!432117 e!432121)))

(declare-fun res!525342 () Bool)

(assert (=> b!776542 (=> (not res!525342) (not e!432121))))

(declare-datatypes ((SeekEntryResult!7957 0))(
  ( (MissingZero!7957 (index!34196 (_ BitVec 32))) (Found!7957 (index!34197 (_ BitVec 32))) (Intermediate!7957 (undefined!8769 Bool) (index!34198 (_ BitVec 32)) (x!65132 (_ BitVec 32))) (Undefined!7957) (MissingVacant!7957 (index!34199 (_ BitVec 32))) )
))
(declare-fun lt!345975 () SeekEntryResult!7957)

(declare-fun lt!345979 () SeekEntryResult!7957)

(assert (=> b!776542 (= res!525342 (= lt!345975 lt!345979))))

(declare-datatypes ((array!42523 0))(
  ( (array!42524 (arr!20357 (Array (_ BitVec 32) (_ BitVec 64))) (size!20778 (_ BitVec 32))) )
))
(declare-fun lt!345976 () array!42523)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345974 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776542 (= lt!345979 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345974 lt!345976 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776542 (= lt!345975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345974 mask!3328) lt!345974 lt!345976 mask!3328))))

(declare-fun a!3186 () array!42523)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!776542 (= lt!345974 (select (store (arr!20357 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776542 (= lt!345976 (array!42524 (store (arr!20357 a!3186) i!1173 k!2102) (size!20778 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!776543 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!345977 () SeekEntryResult!7957)

(declare-fun e!432118 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776543 (= e!432118 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345977))))

(declare-fun b!776544 () Bool)

(declare-fun res!525345 () Bool)

(declare-fun e!432122 () Bool)

(assert (=> b!776544 (=> (not res!525345) (not e!432122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42523 (_ BitVec 32)) Bool)

(assert (=> b!776544 (= res!525345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!525335 () Bool)

(declare-fun e!432119 () Bool)

(assert (=> start!67168 (=> (not res!525335) (not e!432119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67168 (= res!525335 (validMask!0 mask!3328))))

(assert (=> start!67168 e!432119))

(assert (=> start!67168 true))

(declare-fun array_inv!16153 (array!42523) Bool)

(assert (=> start!67168 (array_inv!16153 a!3186)))

(declare-fun b!776545 () Bool)

(declare-fun res!525343 () Bool)

(assert (=> b!776545 (=> (not res!525343) (not e!432122))))

(assert (=> b!776545 (= res!525343 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20778 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20778 a!3186))))))

(declare-fun b!776546 () Bool)

(declare-fun res!525333 () Bool)

(assert (=> b!776546 (=> (not res!525333) (not e!432119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776546 (= res!525333 (validKeyInArray!0 k!2102))))

(declare-fun b!776547 () Bool)

(assert (=> b!776547 (= e!432119 e!432122)))

(declare-fun res!525338 () Bool)

(assert (=> b!776547 (=> (not res!525338) (not e!432122))))

(declare-fun lt!345978 () SeekEntryResult!7957)

(assert (=> b!776547 (= res!525338 (or (= lt!345978 (MissingZero!7957 i!1173)) (= lt!345978 (MissingVacant!7957 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42523 (_ BitVec 32)) SeekEntryResult!7957)

(assert (=> b!776547 (= lt!345978 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776548 () Bool)

(declare-fun res!525346 () Bool)

(assert (=> b!776548 (=> (not res!525346) (not e!432119))))

(assert (=> b!776548 (= res!525346 (validKeyInArray!0 (select (arr!20357 a!3186) j!159)))))

(declare-fun b!776549 () Bool)

(declare-fun res!525344 () Bool)

(assert (=> b!776549 (=> (not res!525344) (not e!432117))))

(assert (=> b!776549 (= res!525344 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20357 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776550 () Bool)

(declare-fun res!525340 () Bool)

(assert (=> b!776550 (=> (not res!525340) (not e!432117))))

(declare-fun e!432125 () Bool)

(assert (=> b!776550 (= res!525340 e!432125)))

(declare-fun c!86005 () Bool)

(assert (=> b!776550 (= c!86005 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!345973 () SeekEntryResult!7957)

(declare-fun b!776551 () Bool)

(assert (=> b!776551 (= e!432125 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345973))))

(declare-fun b!776552 () Bool)

(assert (=> b!776552 (= e!432122 e!432117)))

(declare-fun res!525334 () Bool)

(assert (=> b!776552 (=> (not res!525334) (not e!432117))))

(assert (=> b!776552 (= res!525334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20357 a!3186) j!159) mask!3328) (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345973))))

(assert (=> b!776552 (= lt!345973 (Intermediate!7957 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776553 () Bool)

(declare-fun e!432124 () Bool)

(assert (=> b!776553 (= e!432124 e!432118)))

(declare-fun res!525341 () Bool)

(assert (=> b!776553 (=> (not res!525341) (not e!432118))))

(assert (=> b!776553 (= res!525341 (= (seekEntryOrOpen!0 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) lt!345977))))

(assert (=> b!776553 (= lt!345977 (Found!7957 j!159))))

(declare-fun b!776554 () Bool)

(declare-fun res!525339 () Bool)

(assert (=> b!776554 (=> (not res!525339) (not e!432119))))

(assert (=> b!776554 (= res!525339 (and (= (size!20778 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20778 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20778 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776555 () Bool)

(declare-fun e!432120 () Bool)

(assert (=> b!776555 (= e!432121 (not e!432120))))

(declare-fun res!525336 () Bool)

(assert (=> b!776555 (=> res!525336 e!432120)))

(assert (=> b!776555 (= res!525336 (or (not (is-Intermediate!7957 lt!345979)) (bvslt x!1131 (x!65132 lt!345979)) (not (= x!1131 (x!65132 lt!345979))) (not (= index!1321 (index!34198 lt!345979)))))))

(assert (=> b!776555 e!432124))

(declare-fun res!525332 () Bool)

(assert (=> b!776555 (=> (not res!525332) (not e!432124))))

(assert (=> b!776555 (= res!525332 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26808 0))(
  ( (Unit!26809) )
))
(declare-fun lt!345980 () Unit!26808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26808)

(assert (=> b!776555 (= lt!345980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776556 () Bool)

(assert (=> b!776556 (= e!432125 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328) (Found!7957 j!159)))))

(declare-fun b!776557 () Bool)

(assert (=> b!776557 (= e!432120 true)))

(declare-fun lt!345972 () SeekEntryResult!7957)

(assert (=> b!776557 (= lt!345972 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20357 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776558 () Bool)

(declare-fun res!525347 () Bool)

(assert (=> b!776558 (=> (not res!525347) (not e!432119))))

(declare-fun arrayContainsKey!0 (array!42523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776558 (= res!525347 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776559 () Bool)

(declare-fun res!525337 () Bool)

(assert (=> b!776559 (=> (not res!525337) (not e!432122))))

(declare-datatypes ((List!14359 0))(
  ( (Nil!14356) (Cons!14355 (h!15463 (_ BitVec 64)) (t!20674 List!14359)) )
))
(declare-fun arrayNoDuplicates!0 (array!42523 (_ BitVec 32) List!14359) Bool)

(assert (=> b!776559 (= res!525337 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14356))))

(assert (= (and start!67168 res!525335) b!776554))

(assert (= (and b!776554 res!525339) b!776548))

(assert (= (and b!776548 res!525346) b!776546))

(assert (= (and b!776546 res!525333) b!776558))

(assert (= (and b!776558 res!525347) b!776547))

(assert (= (and b!776547 res!525338) b!776544))

(assert (= (and b!776544 res!525345) b!776559))

(assert (= (and b!776559 res!525337) b!776545))

(assert (= (and b!776545 res!525343) b!776552))

(assert (= (and b!776552 res!525334) b!776549))

(assert (= (and b!776549 res!525344) b!776550))

(assert (= (and b!776550 c!86005) b!776551))

(assert (= (and b!776550 (not c!86005)) b!776556))

(assert (= (and b!776550 res!525340) b!776542))

(assert (= (and b!776542 res!525342) b!776555))

(assert (= (and b!776555 res!525332) b!776553))

(assert (= (and b!776553 res!525341) b!776543))

(assert (= (and b!776555 (not res!525336)) b!776557))

(declare-fun m!720607 () Bool)

(assert (=> b!776546 m!720607))

(declare-fun m!720609 () Bool)

(assert (=> start!67168 m!720609))

(declare-fun m!720611 () Bool)

(assert (=> start!67168 m!720611))

(declare-fun m!720613 () Bool)

(assert (=> b!776557 m!720613))

(assert (=> b!776557 m!720613))

(declare-fun m!720615 () Bool)

(assert (=> b!776557 m!720615))

(declare-fun m!720617 () Bool)

(assert (=> b!776558 m!720617))

(declare-fun m!720619 () Bool)

(assert (=> b!776549 m!720619))

(assert (=> b!776556 m!720613))

(assert (=> b!776556 m!720613))

(assert (=> b!776556 m!720615))

(assert (=> b!776548 m!720613))

(assert (=> b!776548 m!720613))

(declare-fun m!720621 () Bool)

(assert (=> b!776548 m!720621))

(assert (=> b!776543 m!720613))

(assert (=> b!776543 m!720613))

(declare-fun m!720623 () Bool)

(assert (=> b!776543 m!720623))

(declare-fun m!720625 () Bool)

(assert (=> b!776559 m!720625))

(declare-fun m!720627 () Bool)

(assert (=> b!776555 m!720627))

(declare-fun m!720629 () Bool)

(assert (=> b!776555 m!720629))

(declare-fun m!720631 () Bool)

(assert (=> b!776542 m!720631))

(declare-fun m!720633 () Bool)

(assert (=> b!776542 m!720633))

(assert (=> b!776542 m!720633))

(declare-fun m!720635 () Bool)

(assert (=> b!776542 m!720635))

(declare-fun m!720637 () Bool)

(assert (=> b!776542 m!720637))

(declare-fun m!720639 () Bool)

(assert (=> b!776542 m!720639))

(assert (=> b!776551 m!720613))

(assert (=> b!776551 m!720613))

(declare-fun m!720641 () Bool)

(assert (=> b!776551 m!720641))

(assert (=> b!776553 m!720613))

(assert (=> b!776553 m!720613))

(declare-fun m!720643 () Bool)

(assert (=> b!776553 m!720643))

(declare-fun m!720645 () Bool)

(assert (=> b!776544 m!720645))

(declare-fun m!720647 () Bool)

(assert (=> b!776547 m!720647))

(assert (=> b!776552 m!720613))

(assert (=> b!776552 m!720613))

(declare-fun m!720649 () Bool)

(assert (=> b!776552 m!720649))

(assert (=> b!776552 m!720649))

(assert (=> b!776552 m!720613))

(declare-fun m!720651 () Bool)

(assert (=> b!776552 m!720651))

(push 1)

