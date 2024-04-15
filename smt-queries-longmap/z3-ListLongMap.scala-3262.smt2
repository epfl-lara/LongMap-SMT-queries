; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45432 () Bool)

(assert start!45432)

(declare-fun b!499682 () Bool)

(declare-datatypes ((Unit!14986 0))(
  ( (Unit!14987) )
))
(declare-fun e!292770 () Unit!14986)

(declare-fun Unit!14988 () Unit!14986)

(assert (=> b!499682 (= e!292770 Unit!14988)))

(declare-fun b!499683 () Bool)

(declare-fun e!292774 () Bool)

(declare-fun e!292773 () Bool)

(assert (=> b!499683 (= e!292774 e!292773)))

(declare-fun res!301729 () Bool)

(assert (=> b!499683 (=> res!301729 e!292773)))

(declare-datatypes ((SeekEntryResult!3979 0))(
  ( (MissingZero!3979 (index!18098 (_ BitVec 32))) (Found!3979 (index!18099 (_ BitVec 32))) (Intermediate!3979 (undefined!4791 Bool) (index!18100 (_ BitVec 32)) (x!47147 (_ BitVec 32))) (Undefined!3979) (MissingVacant!3979 (index!18101 (_ BitVec 32))) )
))
(declare-fun lt!226561 () SeekEntryResult!3979)

(declare-datatypes ((array!32267 0))(
  ( (array!32268 (arr!15515 (Array (_ BitVec 32) (_ BitVec 64))) (size!15880 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32267)

(declare-fun lt!226557 () (_ BitVec 32))

(assert (=> b!499683 (= res!301729 (or (bvsgt #b00000000000000000000000000000000 (x!47147 lt!226561)) (bvsgt (x!47147 lt!226561) #b01111111111111111111111111111110) (bvslt lt!226557 #b00000000000000000000000000000000) (bvsge lt!226557 (size!15880 a!3235)) (bvslt (index!18100 lt!226561) #b00000000000000000000000000000000) (bvsge (index!18100 lt!226561) (size!15880 a!3235)) (not (= lt!226561 (Intermediate!3979 false (index!18100 lt!226561) (x!47147 lt!226561))))))))

(assert (=> b!499683 (and (or (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226564 () Unit!14986)

(assert (=> b!499683 (= lt!226564 e!292770)))

(declare-fun c!59259 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499683 (= c!59259 (= (select (arr!15515 a!3235) (index!18100 lt!226561)) (select (arr!15515 a!3235) j!176)))))

(assert (=> b!499683 (and (bvslt (x!47147 lt!226561) #b01111111111111111111111111111110) (or (= (select (arr!15515 a!3235) (index!18100 lt!226561)) (select (arr!15515 a!3235) j!176)) (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15515 a!3235) (index!18100 lt!226561)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499684 () Bool)

(declare-fun res!301728 () Bool)

(declare-fun e!292771 () Bool)

(assert (=> b!499684 (=> (not res!301728) (not e!292771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499684 (= res!301728 (validKeyInArray!0 (select (arr!15515 a!3235) j!176)))))

(declare-fun b!499685 () Bool)

(declare-fun res!301720 () Bool)

(assert (=> b!499685 (=> (not res!301720) (not e!292771))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499685 (= res!301720 (and (= (size!15880 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15880 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15880 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499686 () Bool)

(declare-fun e!292769 () Bool)

(assert (=> b!499686 (= e!292769 false)))

(declare-fun b!499687 () Bool)

(declare-fun res!301723 () Bool)

(assert (=> b!499687 (=> (not res!301723) (not e!292771))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499687 (= res!301723 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499688 () Bool)

(declare-fun res!301724 () Bool)

(declare-fun e!292776 () Bool)

(assert (=> b!499688 (=> (not res!301724) (not e!292776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32267 (_ BitVec 32)) Bool)

(assert (=> b!499688 (= res!301724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301721 () Bool)

(assert (=> start!45432 (=> (not res!301721) (not e!292771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45432 (= res!301721 (validMask!0 mask!3524))))

(assert (=> start!45432 e!292771))

(assert (=> start!45432 true))

(declare-fun array_inv!11398 (array!32267) Bool)

(assert (=> start!45432 (array_inv!11398 a!3235)))

(declare-fun b!499689 () Bool)

(declare-fun e!292772 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32267 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!499689 (= e!292772 (= (seekEntryOrOpen!0 (select (arr!15515 a!3235) j!176) a!3235 mask!3524) (Found!3979 j!176)))))

(declare-fun b!499690 () Bool)

(declare-fun res!301725 () Bool)

(assert (=> b!499690 (=> res!301725 e!292774)))

(get-info :version)

(assert (=> b!499690 (= res!301725 (or (undefined!4791 lt!226561) (not ((_ is Intermediate!3979) lt!226561))))))

(declare-fun b!499691 () Bool)

(assert (=> b!499691 (= e!292771 e!292776)))

(declare-fun res!301718 () Bool)

(assert (=> b!499691 (=> (not res!301718) (not e!292776))))

(declare-fun lt!226560 () SeekEntryResult!3979)

(assert (=> b!499691 (= res!301718 (or (= lt!226560 (MissingZero!3979 i!1204)) (= lt!226560 (MissingVacant!3979 i!1204))))))

(assert (=> b!499691 (= lt!226560 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499692 () Bool)

(declare-fun res!301719 () Bool)

(assert (=> b!499692 (=> (not res!301719) (not e!292771))))

(assert (=> b!499692 (= res!301719 (validKeyInArray!0 k0!2280))))

(declare-fun b!499693 () Bool)

(assert (=> b!499693 (= e!292776 (not e!292774))))

(declare-fun res!301726 () Bool)

(assert (=> b!499693 (=> res!301726 e!292774)))

(declare-fun lt!226556 () (_ BitVec 32))

(declare-fun lt!226562 () (_ BitVec 64))

(declare-fun lt!226559 () array!32267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32267 (_ BitVec 32)) SeekEntryResult!3979)

(assert (=> b!499693 (= res!301726 (= lt!226561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226556 lt!226562 lt!226559 mask!3524)))))

(assert (=> b!499693 (= lt!226561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226557 (select (arr!15515 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499693 (= lt!226556 (toIndex!0 lt!226562 mask!3524))))

(assert (=> b!499693 (= lt!226562 (select (store (arr!15515 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499693 (= lt!226557 (toIndex!0 (select (arr!15515 a!3235) j!176) mask!3524))))

(assert (=> b!499693 (= lt!226559 (array!32268 (store (arr!15515 a!3235) i!1204 k0!2280) (size!15880 a!3235)))))

(assert (=> b!499693 e!292772))

(declare-fun res!301722 () Bool)

(assert (=> b!499693 (=> (not res!301722) (not e!292772))))

(assert (=> b!499693 (= res!301722 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226558 () Unit!14986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14986)

(assert (=> b!499693 (= lt!226558 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499694 () Bool)

(declare-fun res!301727 () Bool)

(assert (=> b!499694 (=> (not res!301727) (not e!292776))))

(declare-datatypes ((List!9712 0))(
  ( (Nil!9709) (Cons!9708 (h!10582 (_ BitVec 64)) (t!15931 List!9712)) )
))
(declare-fun arrayNoDuplicates!0 (array!32267 (_ BitVec 32) List!9712) Bool)

(assert (=> b!499694 (= res!301727 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9709))))

(declare-fun b!499695 () Bool)

(assert (=> b!499695 (= e!292773 true)))

(declare-fun lt!226563 () SeekEntryResult!3979)

(assert (=> b!499695 (= lt!226563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226557 lt!226562 lt!226559 mask!3524))))

(declare-fun b!499696 () Bool)

(declare-fun Unit!14989 () Unit!14986)

(assert (=> b!499696 (= e!292770 Unit!14989)))

(declare-fun lt!226555 () Unit!14986)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14986)

(assert (=> b!499696 (= lt!226555 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226557 #b00000000000000000000000000000000 (index!18100 lt!226561) (x!47147 lt!226561) mask!3524))))

(declare-fun res!301730 () Bool)

(assert (=> b!499696 (= res!301730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226557 lt!226562 lt!226559 mask!3524) (Intermediate!3979 false (index!18100 lt!226561) (x!47147 lt!226561))))))

(assert (=> b!499696 (=> (not res!301730) (not e!292769))))

(assert (=> b!499696 e!292769))

(assert (= (and start!45432 res!301721) b!499685))

(assert (= (and b!499685 res!301720) b!499684))

(assert (= (and b!499684 res!301728) b!499692))

(assert (= (and b!499692 res!301719) b!499687))

(assert (= (and b!499687 res!301723) b!499691))

(assert (= (and b!499691 res!301718) b!499688))

(assert (= (and b!499688 res!301724) b!499694))

(assert (= (and b!499694 res!301727) b!499693))

(assert (= (and b!499693 res!301722) b!499689))

(assert (= (and b!499693 (not res!301726)) b!499690))

(assert (= (and b!499690 (not res!301725)) b!499683))

(assert (= (and b!499683 c!59259) b!499696))

(assert (= (and b!499683 (not c!59259)) b!499682))

(assert (= (and b!499696 res!301730) b!499686))

(assert (= (and b!499683 (not res!301729)) b!499695))

(declare-fun m!480367 () Bool)

(assert (=> b!499692 m!480367))

(declare-fun m!480369 () Bool)

(assert (=> b!499696 m!480369))

(declare-fun m!480371 () Bool)

(assert (=> b!499696 m!480371))

(declare-fun m!480373 () Bool)

(assert (=> b!499683 m!480373))

(declare-fun m!480375 () Bool)

(assert (=> b!499683 m!480375))

(declare-fun m!480377 () Bool)

(assert (=> b!499688 m!480377))

(declare-fun m!480379 () Bool)

(assert (=> start!45432 m!480379))

(declare-fun m!480381 () Bool)

(assert (=> start!45432 m!480381))

(declare-fun m!480383 () Bool)

(assert (=> b!499694 m!480383))

(declare-fun m!480385 () Bool)

(assert (=> b!499693 m!480385))

(declare-fun m!480387 () Bool)

(assert (=> b!499693 m!480387))

(assert (=> b!499693 m!480375))

(declare-fun m!480389 () Bool)

(assert (=> b!499693 m!480389))

(declare-fun m!480391 () Bool)

(assert (=> b!499693 m!480391))

(declare-fun m!480393 () Bool)

(assert (=> b!499693 m!480393))

(declare-fun m!480395 () Bool)

(assert (=> b!499693 m!480395))

(assert (=> b!499693 m!480375))

(declare-fun m!480397 () Bool)

(assert (=> b!499693 m!480397))

(assert (=> b!499693 m!480375))

(declare-fun m!480399 () Bool)

(assert (=> b!499693 m!480399))

(assert (=> b!499689 m!480375))

(assert (=> b!499689 m!480375))

(declare-fun m!480401 () Bool)

(assert (=> b!499689 m!480401))

(declare-fun m!480403 () Bool)

(assert (=> b!499691 m!480403))

(declare-fun m!480405 () Bool)

(assert (=> b!499687 m!480405))

(assert (=> b!499684 m!480375))

(assert (=> b!499684 m!480375))

(declare-fun m!480407 () Bool)

(assert (=> b!499684 m!480407))

(assert (=> b!499695 m!480371))

(check-sat (not b!499691) (not b!499694) (not b!499689) (not b!499692) (not b!499687) (not start!45432) (not b!499693) (not b!499695) (not b!499684) (not b!499696) (not b!499688))
(check-sat)
