; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45618 () Bool)

(assert start!45618)

(declare-fun b!502687 () Bool)

(declare-fun res!304080 () Bool)

(declare-fun e!294432 () Bool)

(assert (=> b!502687 (=> (not res!304080) (not e!294432))))

(declare-datatypes ((array!32374 0))(
  ( (array!32375 (arr!15567 (Array (_ BitVec 32) (_ BitVec 64))) (size!15931 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32374)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502687 (= res!304080 (validKeyInArray!0 (select (arr!15567 a!3235) j!176)))))

(declare-fun b!502688 () Bool)

(declare-fun res!304078 () Bool)

(assert (=> b!502688 (=> (not res!304078) (not e!294432))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!502688 (= res!304078 (validKeyInArray!0 k!2280))))

(declare-fun b!502689 () Bool)

(declare-fun e!294429 () Bool)

(declare-fun e!294431 () Bool)

(assert (=> b!502689 (= e!294429 (not e!294431))))

(declare-fun res!304083 () Bool)

(assert (=> b!502689 (=> res!304083 e!294431)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!228545 () (_ BitVec 64))

(declare-fun lt!228540 () (_ BitVec 32))

(declare-fun lt!228541 () array!32374)

(declare-datatypes ((SeekEntryResult!4034 0))(
  ( (MissingZero!4034 (index!18324 (_ BitVec 32))) (Found!4034 (index!18325 (_ BitVec 32))) (Intermediate!4034 (undefined!4846 Bool) (index!18326 (_ BitVec 32)) (x!47355 (_ BitVec 32))) (Undefined!4034) (MissingVacant!4034 (index!18327 (_ BitVec 32))) )
))
(declare-fun lt!228546 () SeekEntryResult!4034)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32374 (_ BitVec 32)) SeekEntryResult!4034)

(assert (=> b!502689 (= res!304083 (= lt!228546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228540 lt!228545 lt!228541 mask!3524)))))

(declare-fun lt!228539 () (_ BitVec 32))

(assert (=> b!502689 (= lt!228546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228539 (select (arr!15567 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502689 (= lt!228540 (toIndex!0 lt!228545 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502689 (= lt!228545 (select (store (arr!15567 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502689 (= lt!228539 (toIndex!0 (select (arr!15567 a!3235) j!176) mask!3524))))

(assert (=> b!502689 (= lt!228541 (array!32375 (store (arr!15567 a!3235) i!1204 k!2280) (size!15931 a!3235)))))

(declare-fun e!294426 () Bool)

(assert (=> b!502689 e!294426))

(declare-fun res!304079 () Bool)

(assert (=> b!502689 (=> (not res!304079) (not e!294426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32374 (_ BitVec 32)) Bool)

(assert (=> b!502689 (= res!304079 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15212 0))(
  ( (Unit!15213) )
))
(declare-fun lt!228538 () Unit!15212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15212)

(assert (=> b!502689 (= lt!228538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502690 () Bool)

(assert (=> b!502690 (= e!294432 e!294429)))

(declare-fun res!304074 () Bool)

(assert (=> b!502690 (=> (not res!304074) (not e!294429))))

(declare-fun lt!228544 () SeekEntryResult!4034)

(assert (=> b!502690 (= res!304074 (or (= lt!228544 (MissingZero!4034 i!1204)) (= lt!228544 (MissingVacant!4034 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32374 (_ BitVec 32)) SeekEntryResult!4034)

(assert (=> b!502690 (= lt!228544 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502691 () Bool)

(declare-fun res!304088 () Bool)

(assert (=> b!502691 (=> (not res!304088) (not e!294432))))

(assert (=> b!502691 (= res!304088 (and (= (size!15931 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15931 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15931 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!304084 () Bool)

(assert (=> start!45618 (=> (not res!304084) (not e!294432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45618 (= res!304084 (validMask!0 mask!3524))))

(assert (=> start!45618 e!294432))

(assert (=> start!45618 true))

(declare-fun array_inv!11363 (array!32374) Bool)

(assert (=> start!45618 (array_inv!11363 a!3235)))

(declare-fun b!502692 () Bool)

(declare-fun e!294425 () Bool)

(assert (=> b!502692 (= e!294425 true)))

(declare-fun lt!228543 () SeekEntryResult!4034)

(assert (=> b!502692 (= lt!228543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228539 lt!228545 lt!228541 mask!3524))))

(declare-fun b!502693 () Bool)

(declare-fun res!304081 () Bool)

(assert (=> b!502693 (=> (not res!304081) (not e!294429))))

(assert (=> b!502693 (= res!304081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502694 () Bool)

(declare-fun res!304077 () Bool)

(assert (=> b!502694 (=> (not res!304077) (not e!294432))))

(declare-fun arrayContainsKey!0 (array!32374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502694 (= res!304077 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502695 () Bool)

(declare-fun e!294424 () Unit!15212)

(declare-fun Unit!15214 () Unit!15212)

(assert (=> b!502695 (= e!294424 Unit!15214)))

(declare-fun b!502696 () Bool)

(declare-fun res!304075 () Bool)

(assert (=> b!502696 (=> res!304075 e!294425)))

(declare-fun e!294428 () Bool)

(assert (=> b!502696 (= res!304075 e!294428)))

(declare-fun res!304087 () Bool)

(assert (=> b!502696 (=> (not res!304087) (not e!294428))))

(assert (=> b!502696 (= res!304087 (bvsgt #b00000000000000000000000000000000 (x!47355 lt!228546)))))

(declare-fun b!502697 () Bool)

(assert (=> b!502697 (= e!294426 (= (seekEntryOrOpen!0 (select (arr!15567 a!3235) j!176) a!3235 mask!3524) (Found!4034 j!176)))))

(declare-fun b!502698 () Bool)

(declare-fun Unit!15215 () Unit!15212)

(assert (=> b!502698 (= e!294424 Unit!15215)))

(declare-fun lt!228542 () Unit!15212)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32374 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15212)

(assert (=> b!502698 (= lt!228542 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228539 #b00000000000000000000000000000000 (index!18326 lt!228546) (x!47355 lt!228546) mask!3524))))

(declare-fun res!304082 () Bool)

(assert (=> b!502698 (= res!304082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228539 lt!228545 lt!228541 mask!3524) (Intermediate!4034 false (index!18326 lt!228546) (x!47355 lt!228546))))))

(declare-fun e!294430 () Bool)

(assert (=> b!502698 (=> (not res!304082) (not e!294430))))

(assert (=> b!502698 e!294430))

(declare-fun b!502699 () Bool)

(assert (=> b!502699 (= e!294431 e!294425)))

(declare-fun res!304086 () Bool)

(assert (=> b!502699 (=> res!304086 e!294425)))

(assert (=> b!502699 (= res!304086 (or (bvsgt (x!47355 lt!228546) #b01111111111111111111111111111110) (bvslt lt!228539 #b00000000000000000000000000000000) (bvsge lt!228539 (size!15931 a!3235)) (bvslt (index!18326 lt!228546) #b00000000000000000000000000000000) (bvsge (index!18326 lt!228546) (size!15931 a!3235)) (not (= lt!228546 (Intermediate!4034 false (index!18326 lt!228546) (x!47355 lt!228546))))))))

(assert (=> b!502699 (= (index!18326 lt!228546) i!1204)))

(declare-fun lt!228547 () Unit!15212)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32374 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15212)

(assert (=> b!502699 (= lt!228547 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228539 #b00000000000000000000000000000000 (index!18326 lt!228546) (x!47355 lt!228546) mask!3524))))

(assert (=> b!502699 (and (or (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228537 () Unit!15212)

(assert (=> b!502699 (= lt!228537 e!294424)))

(declare-fun c!59585 () Bool)

(assert (=> b!502699 (= c!59585 (= (select (arr!15567 a!3235) (index!18326 lt!228546)) (select (arr!15567 a!3235) j!176)))))

(assert (=> b!502699 (and (bvslt (x!47355 lt!228546) #b01111111111111111111111111111110) (or (= (select (arr!15567 a!3235) (index!18326 lt!228546)) (select (arr!15567 a!3235) j!176)) (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15567 a!3235) (index!18326 lt!228546)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502700 () Bool)

(declare-fun res!304076 () Bool)

(assert (=> b!502700 (=> res!304076 e!294431)))

(assert (=> b!502700 (= res!304076 (or (undefined!4846 lt!228546) (not (is-Intermediate!4034 lt!228546))))))

(declare-fun b!502701 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32374 (_ BitVec 32)) SeekEntryResult!4034)

(assert (=> b!502701 (= e!294428 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228539 (index!18326 lt!228546) (select (arr!15567 a!3235) j!176) a!3235 mask!3524) (Found!4034 j!176))))))

(declare-fun b!502702 () Bool)

(declare-fun res!304085 () Bool)

(assert (=> b!502702 (=> (not res!304085) (not e!294429))))

(declare-datatypes ((List!9725 0))(
  ( (Nil!9722) (Cons!9721 (h!10598 (_ BitVec 64)) (t!15953 List!9725)) )
))
(declare-fun arrayNoDuplicates!0 (array!32374 (_ BitVec 32) List!9725) Bool)

(assert (=> b!502702 (= res!304085 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9722))))

(declare-fun b!502703 () Bool)

(assert (=> b!502703 (= e!294430 false)))

(assert (= (and start!45618 res!304084) b!502691))

(assert (= (and b!502691 res!304088) b!502687))

(assert (= (and b!502687 res!304080) b!502688))

(assert (= (and b!502688 res!304078) b!502694))

(assert (= (and b!502694 res!304077) b!502690))

(assert (= (and b!502690 res!304074) b!502693))

(assert (= (and b!502693 res!304081) b!502702))

(assert (= (and b!502702 res!304085) b!502689))

(assert (= (and b!502689 res!304079) b!502697))

(assert (= (and b!502689 (not res!304083)) b!502700))

(assert (= (and b!502700 (not res!304076)) b!502699))

(assert (= (and b!502699 c!59585) b!502698))

(assert (= (and b!502699 (not c!59585)) b!502695))

(assert (= (and b!502698 res!304082) b!502703))

(assert (= (and b!502699 (not res!304086)) b!502696))

(assert (= (and b!502696 res!304087) b!502701))

(assert (= (and b!502696 (not res!304075)) b!502692))

(declare-fun m!483597 () Bool)

(assert (=> b!502698 m!483597))

(declare-fun m!483599 () Bool)

(assert (=> b!502698 m!483599))

(declare-fun m!483601 () Bool)

(assert (=> b!502694 m!483601))

(declare-fun m!483603 () Bool)

(assert (=> b!502690 m!483603))

(declare-fun m!483605 () Bool)

(assert (=> b!502689 m!483605))

(declare-fun m!483607 () Bool)

(assert (=> b!502689 m!483607))

(declare-fun m!483609 () Bool)

(assert (=> b!502689 m!483609))

(declare-fun m!483611 () Bool)

(assert (=> b!502689 m!483611))

(declare-fun m!483613 () Bool)

(assert (=> b!502689 m!483613))

(declare-fun m!483615 () Bool)

(assert (=> b!502689 m!483615))

(assert (=> b!502689 m!483605))

(declare-fun m!483617 () Bool)

(assert (=> b!502689 m!483617))

(declare-fun m!483619 () Bool)

(assert (=> b!502689 m!483619))

(assert (=> b!502689 m!483605))

(declare-fun m!483621 () Bool)

(assert (=> b!502689 m!483621))

(declare-fun m!483623 () Bool)

(assert (=> start!45618 m!483623))

(declare-fun m!483625 () Bool)

(assert (=> start!45618 m!483625))

(assert (=> b!502687 m!483605))

(assert (=> b!502687 m!483605))

(declare-fun m!483627 () Bool)

(assert (=> b!502687 m!483627))

(assert (=> b!502701 m!483605))

(assert (=> b!502701 m!483605))

(declare-fun m!483629 () Bool)

(assert (=> b!502701 m!483629))

(declare-fun m!483631 () Bool)

(assert (=> b!502702 m!483631))

(declare-fun m!483633 () Bool)

(assert (=> b!502693 m!483633))

(declare-fun m!483635 () Bool)

(assert (=> b!502699 m!483635))

(declare-fun m!483637 () Bool)

(assert (=> b!502699 m!483637))

(assert (=> b!502699 m!483605))

(declare-fun m!483639 () Bool)

(assert (=> b!502688 m!483639))

(assert (=> b!502692 m!483599))

(assert (=> b!502697 m!483605))

(assert (=> b!502697 m!483605))

(declare-fun m!483641 () Bool)

(assert (=> b!502697 m!483641))

(push 1)

