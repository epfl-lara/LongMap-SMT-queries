; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45616 () Bool)

(assert start!45616)

(declare-fun b!502636 () Bool)

(declare-fun res!304036 () Bool)

(declare-fun e!294401 () Bool)

(assert (=> b!502636 (=> res!304036 e!294401)))

(declare-datatypes ((SeekEntryResult!4033 0))(
  ( (MissingZero!4033 (index!18320 (_ BitVec 32))) (Found!4033 (index!18321 (_ BitVec 32))) (Intermediate!4033 (undefined!4845 Bool) (index!18322 (_ BitVec 32)) (x!47346 (_ BitVec 32))) (Undefined!4033) (MissingVacant!4033 (index!18323 (_ BitVec 32))) )
))
(declare-fun lt!228507 () SeekEntryResult!4033)

(assert (=> b!502636 (= res!304036 (or (undefined!4845 lt!228507) (not (is-Intermediate!4033 lt!228507))))))

(declare-fun b!502637 () Bool)

(declare-datatypes ((Unit!15208 0))(
  ( (Unit!15209) )
))
(declare-fun e!294405 () Unit!15208)

(declare-fun Unit!15210 () Unit!15208)

(assert (=> b!502637 (= e!294405 Unit!15210)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!228505 () Unit!15208)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!228506 () (_ BitVec 32))

(declare-datatypes ((array!32372 0))(
  ( (array!32373 (arr!15566 (Array (_ BitVec 32) (_ BitVec 64))) (size!15930 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32372)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15208)

(assert (=> b!502637 (= lt!228505 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228506 #b00000000000000000000000000000000 (index!18322 lt!228507) (x!47346 lt!228507) mask!3524))))

(declare-fun lt!228511 () array!32372)

(declare-fun lt!228508 () (_ BitVec 64))

(declare-fun res!304042 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502637 (= res!304042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 lt!228508 lt!228511 mask!3524) (Intermediate!4033 false (index!18322 lt!228507) (x!47346 lt!228507))))))

(declare-fun e!294403 () Bool)

(assert (=> b!502637 (=> (not res!304042) (not e!294403))))

(assert (=> b!502637 e!294403))

(declare-fun b!502638 () Bool)

(declare-fun res!304033 () Bool)

(declare-fun e!294397 () Bool)

(assert (=> b!502638 (=> (not res!304033) (not e!294397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502638 (= res!304033 (validKeyInArray!0 (select (arr!15566 a!3235) j!176)))))

(declare-fun b!502639 () Bool)

(declare-fun Unit!15211 () Unit!15208)

(assert (=> b!502639 (= e!294405 Unit!15211)))

(declare-fun b!502640 () Bool)

(declare-fun res!304034 () Bool)

(declare-fun e!294400 () Bool)

(assert (=> b!502640 (=> (not res!304034) (not e!294400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32372 (_ BitVec 32)) Bool)

(assert (=> b!502640 (= res!304034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502641 () Bool)

(declare-fun e!294398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502641 (= e!294398 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228506 (index!18322 lt!228507) (select (arr!15566 a!3235) j!176) a!3235 mask!3524) (Found!4033 j!176))))))

(declare-fun b!502642 () Bool)

(assert (=> b!502642 (= e!294397 e!294400)))

(declare-fun res!304031 () Bool)

(assert (=> b!502642 (=> (not res!304031) (not e!294400))))

(declare-fun lt!228514 () SeekEntryResult!4033)

(assert (=> b!502642 (= res!304031 (or (= lt!228514 (MissingZero!4033 i!1204)) (= lt!228514 (MissingVacant!4033 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502642 (= lt!228514 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502643 () Bool)

(declare-fun res!304041 () Bool)

(assert (=> b!502643 (=> (not res!304041) (not e!294397))))

(assert (=> b!502643 (= res!304041 (validKeyInArray!0 k!2280))))

(declare-fun res!304038 () Bool)

(assert (=> start!45616 (=> (not res!304038) (not e!294397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45616 (= res!304038 (validMask!0 mask!3524))))

(assert (=> start!45616 e!294397))

(assert (=> start!45616 true))

(declare-fun array_inv!11362 (array!32372) Bool)

(assert (=> start!45616 (array_inv!11362 a!3235)))

(declare-fun b!502644 () Bool)

(assert (=> b!502644 (= e!294403 false)))

(declare-fun b!502645 () Bool)

(declare-fun e!294399 () Bool)

(assert (=> b!502645 (= e!294399 true)))

(declare-fun lt!228512 () SeekEntryResult!4033)

(assert (=> b!502645 (= lt!228512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 lt!228508 lt!228511 mask!3524))))

(declare-fun b!502646 () Bool)

(declare-fun e!294404 () Bool)

(assert (=> b!502646 (= e!294404 (= (seekEntryOrOpen!0 (select (arr!15566 a!3235) j!176) a!3235 mask!3524) (Found!4033 j!176)))))

(declare-fun b!502647 () Bool)

(declare-fun res!304029 () Bool)

(assert (=> b!502647 (=> (not res!304029) (not e!294397))))

(declare-fun arrayContainsKey!0 (array!32372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502647 (= res!304029 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502648 () Bool)

(declare-fun res!304032 () Bool)

(assert (=> b!502648 (=> (not res!304032) (not e!294400))))

(declare-datatypes ((List!9724 0))(
  ( (Nil!9721) (Cons!9720 (h!10597 (_ BitVec 64)) (t!15952 List!9724)) )
))
(declare-fun arrayNoDuplicates!0 (array!32372 (_ BitVec 32) List!9724) Bool)

(assert (=> b!502648 (= res!304032 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9721))))

(declare-fun b!502649 () Bool)

(declare-fun res!304037 () Bool)

(assert (=> b!502649 (=> res!304037 e!294399)))

(assert (=> b!502649 (= res!304037 e!294398)))

(declare-fun res!304035 () Bool)

(assert (=> b!502649 (=> (not res!304035) (not e!294398))))

(assert (=> b!502649 (= res!304035 (bvsgt #b00000000000000000000000000000000 (x!47346 lt!228507)))))

(declare-fun b!502650 () Bool)

(assert (=> b!502650 (= e!294400 (not e!294401))))

(declare-fun res!304043 () Bool)

(assert (=> b!502650 (=> res!304043 e!294401)))

(declare-fun lt!228510 () (_ BitVec 32))

(assert (=> b!502650 (= res!304043 (= lt!228507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228510 lt!228508 lt!228511 mask!3524)))))

(assert (=> b!502650 (= lt!228507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228506 (select (arr!15566 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502650 (= lt!228510 (toIndex!0 lt!228508 mask!3524))))

(assert (=> b!502650 (= lt!228508 (select (store (arr!15566 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502650 (= lt!228506 (toIndex!0 (select (arr!15566 a!3235) j!176) mask!3524))))

(assert (=> b!502650 (= lt!228511 (array!32373 (store (arr!15566 a!3235) i!1204 k!2280) (size!15930 a!3235)))))

(assert (=> b!502650 e!294404))

(declare-fun res!304040 () Bool)

(assert (=> b!502650 (=> (not res!304040) (not e!294404))))

(assert (=> b!502650 (= res!304040 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228504 () Unit!15208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15208)

(assert (=> b!502650 (= lt!228504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502651 () Bool)

(declare-fun res!304039 () Bool)

(assert (=> b!502651 (=> (not res!304039) (not e!294397))))

(assert (=> b!502651 (= res!304039 (and (= (size!15930 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15930 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15930 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502652 () Bool)

(assert (=> b!502652 (= e!294401 e!294399)))

(declare-fun res!304030 () Bool)

(assert (=> b!502652 (=> res!304030 e!294399)))

(assert (=> b!502652 (= res!304030 (or (bvsgt (x!47346 lt!228507) #b01111111111111111111111111111110) (bvslt lt!228506 #b00000000000000000000000000000000) (bvsge lt!228506 (size!15930 a!3235)) (bvslt (index!18322 lt!228507) #b00000000000000000000000000000000) (bvsge (index!18322 lt!228507) (size!15930 a!3235)) (not (= lt!228507 (Intermediate!4033 false (index!18322 lt!228507) (x!47346 lt!228507))))))))

(assert (=> b!502652 (= (index!18322 lt!228507) i!1204)))

(declare-fun lt!228509 () Unit!15208)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15208)

(assert (=> b!502652 (= lt!228509 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228506 #b00000000000000000000000000000000 (index!18322 lt!228507) (x!47346 lt!228507) mask!3524))))

(assert (=> b!502652 (and (or (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228513 () Unit!15208)

(assert (=> b!502652 (= lt!228513 e!294405)))

(declare-fun c!59582 () Bool)

(assert (=> b!502652 (= c!59582 (= (select (arr!15566 a!3235) (index!18322 lt!228507)) (select (arr!15566 a!3235) j!176)))))

(assert (=> b!502652 (and (bvslt (x!47346 lt!228507) #b01111111111111111111111111111110) (or (= (select (arr!15566 a!3235) (index!18322 lt!228507)) (select (arr!15566 a!3235) j!176)) (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15566 a!3235) (index!18322 lt!228507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45616 res!304038) b!502651))

(assert (= (and b!502651 res!304039) b!502638))

(assert (= (and b!502638 res!304033) b!502643))

(assert (= (and b!502643 res!304041) b!502647))

(assert (= (and b!502647 res!304029) b!502642))

(assert (= (and b!502642 res!304031) b!502640))

(assert (= (and b!502640 res!304034) b!502648))

(assert (= (and b!502648 res!304032) b!502650))

(assert (= (and b!502650 res!304040) b!502646))

(assert (= (and b!502650 (not res!304043)) b!502636))

(assert (= (and b!502636 (not res!304036)) b!502652))

(assert (= (and b!502652 c!59582) b!502637))

(assert (= (and b!502652 (not c!59582)) b!502639))

(assert (= (and b!502637 res!304042) b!502644))

(assert (= (and b!502652 (not res!304030)) b!502649))

(assert (= (and b!502649 res!304035) b!502641))

(assert (= (and b!502649 (not res!304037)) b!502645))

(declare-fun m!483551 () Bool)

(assert (=> b!502646 m!483551))

(assert (=> b!502646 m!483551))

(declare-fun m!483553 () Bool)

(assert (=> b!502646 m!483553))

(assert (=> b!502638 m!483551))

(assert (=> b!502638 m!483551))

(declare-fun m!483555 () Bool)

(assert (=> b!502638 m!483555))

(declare-fun m!483557 () Bool)

(assert (=> b!502642 m!483557))

(declare-fun m!483559 () Bool)

(assert (=> b!502643 m!483559))

(declare-fun m!483561 () Bool)

(assert (=> b!502637 m!483561))

(declare-fun m!483563 () Bool)

(assert (=> b!502637 m!483563))

(declare-fun m!483565 () Bool)

(assert (=> b!502647 m!483565))

(declare-fun m!483567 () Bool)

(assert (=> b!502650 m!483567))

(declare-fun m!483569 () Bool)

(assert (=> b!502650 m!483569))

(declare-fun m!483571 () Bool)

(assert (=> b!502650 m!483571))

(declare-fun m!483573 () Bool)

(assert (=> b!502650 m!483573))

(declare-fun m!483575 () Bool)

(assert (=> b!502650 m!483575))

(assert (=> b!502650 m!483551))

(declare-fun m!483577 () Bool)

(assert (=> b!502650 m!483577))

(assert (=> b!502650 m!483551))

(declare-fun m!483579 () Bool)

(assert (=> b!502650 m!483579))

(assert (=> b!502650 m!483551))

(declare-fun m!483581 () Bool)

(assert (=> b!502650 m!483581))

(assert (=> b!502641 m!483551))

(assert (=> b!502641 m!483551))

(declare-fun m!483583 () Bool)

(assert (=> b!502641 m!483583))

(declare-fun m!483585 () Bool)

(assert (=> b!502640 m!483585))

(declare-fun m!483587 () Bool)

(assert (=> start!45616 m!483587))

(declare-fun m!483589 () Bool)

(assert (=> start!45616 m!483589))

(declare-fun m!483591 () Bool)

(assert (=> b!502648 m!483591))

(assert (=> b!502645 m!483563))

(declare-fun m!483593 () Bool)

(assert (=> b!502652 m!483593))

(declare-fun m!483595 () Bool)

(assert (=> b!502652 m!483595))

(assert (=> b!502652 m!483551))

(push 1)

