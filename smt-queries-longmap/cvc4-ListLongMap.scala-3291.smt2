; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45694 () Bool)

(assert start!45694)

(declare-fun b!504625 () Bool)

(declare-fun res!305792 () Bool)

(declare-fun e!295454 () Bool)

(assert (=> b!504625 (=> (not res!305792) (not e!295454))))

(declare-datatypes ((array!32450 0))(
  ( (array!32451 (arr!15605 (Array (_ BitVec 32) (_ BitVec 64))) (size!15969 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32450)

(declare-datatypes ((List!9763 0))(
  ( (Nil!9760) (Cons!9759 (h!10636 (_ BitVec 64)) (t!15991 List!9763)) )
))
(declare-fun arrayNoDuplicates!0 (array!32450 (_ BitVec 32) List!9763) Bool)

(assert (=> b!504625 (= res!305792 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9760))))

(declare-fun b!504626 () Bool)

(declare-fun e!295455 () Bool)

(assert (=> b!504626 (= e!295455 e!295454)))

(declare-fun res!305798 () Bool)

(assert (=> b!504626 (=> (not res!305798) (not e!295454))))

(declare-datatypes ((SeekEntryResult!4072 0))(
  ( (MissingZero!4072 (index!18476 (_ BitVec 32))) (Found!4072 (index!18477 (_ BitVec 32))) (Intermediate!4072 (undefined!4884 Bool) (index!18478 (_ BitVec 32)) (x!47489 (_ BitVec 32))) (Undefined!4072) (MissingVacant!4072 (index!18479 (_ BitVec 32))) )
))
(declare-fun lt!229798 () SeekEntryResult!4072)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504626 (= res!305798 (or (= lt!229798 (MissingZero!4072 i!1204)) (= lt!229798 (MissingVacant!4072 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504626 (= lt!229798 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!305794 () Bool)

(assert (=> start!45694 (=> (not res!305794) (not e!295455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45694 (= res!305794 (validMask!0 mask!3524))))

(assert (=> start!45694 e!295455))

(assert (=> start!45694 true))

(declare-fun array_inv!11401 (array!32450) Bool)

(assert (=> start!45694 (array_inv!11401 a!3235)))

(declare-fun b!504627 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295451 () Bool)

(assert (=> b!504627 (= e!295451 (= (seekEntryOrOpen!0 (select (arr!15605 a!3235) j!176) a!3235 mask!3524) (Found!4072 j!176)))))

(declare-fun b!504628 () Bool)

(declare-fun res!305795 () Bool)

(assert (=> b!504628 (=> (not res!305795) (not e!295455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504628 (= res!305795 (validKeyInArray!0 (select (arr!15605 a!3235) j!176)))))

(declare-fun b!504629 () Bool)

(declare-fun res!305791 () Bool)

(declare-fun e!295456 () Bool)

(assert (=> b!504629 (=> res!305791 e!295456)))

(declare-fun e!295452 () Bool)

(assert (=> b!504629 (= res!305791 e!295452)))

(declare-fun res!305797 () Bool)

(assert (=> b!504629 (=> (not res!305797) (not e!295452))))

(declare-fun lt!229792 () SeekEntryResult!4072)

(assert (=> b!504629 (= res!305797 (bvsgt #b00000000000000000000000000000000 (x!47489 lt!229792)))))

(declare-fun b!504630 () Bool)

(assert (=> b!504630 (= e!295456 true)))

(declare-fun lt!229797 () (_ BitVec 32))

(declare-fun lt!229799 () (_ BitVec 64))

(declare-fun lt!229801 () array!32450)

(declare-fun lt!229794 () SeekEntryResult!4072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504630 (= lt!229794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229797 lt!229799 lt!229801 mask!3524))))

(declare-fun b!504631 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32450 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504631 (= e!295452 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229797 (index!18478 lt!229792) (select (arr!15605 a!3235) j!176) a!3235 mask!3524) (Found!4072 j!176))))))

(declare-fun b!504632 () Bool)

(declare-fun res!305796 () Bool)

(assert (=> b!504632 (=> (not res!305796) (not e!295455))))

(declare-fun arrayContainsKey!0 (array!32450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504632 (= res!305796 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504633 () Bool)

(declare-fun e!295458 () Bool)

(assert (=> b!504633 (= e!295454 (not e!295458))))

(declare-fun res!305784 () Bool)

(assert (=> b!504633 (=> res!305784 e!295458)))

(declare-fun lt!229793 () (_ BitVec 32))

(assert (=> b!504633 (= res!305784 (= lt!229792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229793 lt!229799 lt!229801 mask!3524)))))

(assert (=> b!504633 (= lt!229792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229797 (select (arr!15605 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504633 (= lt!229793 (toIndex!0 lt!229799 mask!3524))))

(assert (=> b!504633 (= lt!229799 (select (store (arr!15605 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504633 (= lt!229797 (toIndex!0 (select (arr!15605 a!3235) j!176) mask!3524))))

(assert (=> b!504633 (= lt!229801 (array!32451 (store (arr!15605 a!3235) i!1204 k!2280) (size!15969 a!3235)))))

(assert (=> b!504633 e!295451))

(declare-fun res!305787 () Bool)

(assert (=> b!504633 (=> (not res!305787) (not e!295451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32450 (_ BitVec 32)) Bool)

(assert (=> b!504633 (= res!305787 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15364 0))(
  ( (Unit!15365) )
))
(declare-fun lt!229795 () Unit!15364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15364)

(assert (=> b!504633 (= lt!229795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504634 () Bool)

(declare-fun res!305788 () Bool)

(assert (=> b!504634 (=> (not res!305788) (not e!295454))))

(assert (=> b!504634 (= res!305788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504635 () Bool)

(declare-fun e!295450 () Unit!15364)

(declare-fun Unit!15366 () Unit!15364)

(assert (=> b!504635 (= e!295450 Unit!15366)))

(declare-fun lt!229791 () Unit!15364)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15364)

(assert (=> b!504635 (= lt!229791 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229797 #b00000000000000000000000000000000 (index!18478 lt!229792) (x!47489 lt!229792) mask!3524))))

(declare-fun res!305790 () Bool)

(assert (=> b!504635 (= res!305790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229797 lt!229799 lt!229801 mask!3524) (Intermediate!4072 false (index!18478 lt!229792) (x!47489 lt!229792))))))

(declare-fun e!295457 () Bool)

(assert (=> b!504635 (=> (not res!305790) (not e!295457))))

(assert (=> b!504635 e!295457))

(declare-fun b!504636 () Bool)

(declare-fun res!305793 () Bool)

(assert (=> b!504636 (=> (not res!305793) (not e!295455))))

(assert (=> b!504636 (= res!305793 (and (= (size!15969 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15969 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15969 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504637 () Bool)

(declare-fun res!305786 () Bool)

(assert (=> b!504637 (=> res!305786 e!295458)))

(assert (=> b!504637 (= res!305786 (or (undefined!4884 lt!229792) (not (is-Intermediate!4072 lt!229792))))))

(declare-fun b!504638 () Bool)

(declare-fun res!305789 () Bool)

(assert (=> b!504638 (=> (not res!305789) (not e!295455))))

(assert (=> b!504638 (= res!305789 (validKeyInArray!0 k!2280))))

(declare-fun b!504639 () Bool)

(assert (=> b!504639 (= e!295457 false)))

(declare-fun b!504640 () Bool)

(declare-fun Unit!15367 () Unit!15364)

(assert (=> b!504640 (= e!295450 Unit!15367)))

(declare-fun b!504641 () Bool)

(assert (=> b!504641 (= e!295458 e!295456)))

(declare-fun res!305785 () Bool)

(assert (=> b!504641 (=> res!305785 e!295456)))

(assert (=> b!504641 (= res!305785 (or (bvsgt (x!47489 lt!229792) #b01111111111111111111111111111110) (bvslt lt!229797 #b00000000000000000000000000000000) (bvsge lt!229797 (size!15969 a!3235)) (bvslt (index!18478 lt!229792) #b00000000000000000000000000000000) (bvsge (index!18478 lt!229792) (size!15969 a!3235)) (not (= lt!229792 (Intermediate!4072 false (index!18478 lt!229792) (x!47489 lt!229792))))))))

(assert (=> b!504641 (= (index!18478 lt!229792) i!1204)))

(declare-fun lt!229800 () Unit!15364)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15364)

(assert (=> b!504641 (= lt!229800 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229797 #b00000000000000000000000000000000 (index!18478 lt!229792) (x!47489 lt!229792) mask!3524))))

(assert (=> b!504641 (and (or (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229796 () Unit!15364)

(assert (=> b!504641 (= lt!229796 e!295450)))

(declare-fun c!59699 () Bool)

(assert (=> b!504641 (= c!59699 (= (select (arr!15605 a!3235) (index!18478 lt!229792)) (select (arr!15605 a!3235) j!176)))))

(assert (=> b!504641 (and (bvslt (x!47489 lt!229792) #b01111111111111111111111111111110) (or (= (select (arr!15605 a!3235) (index!18478 lt!229792)) (select (arr!15605 a!3235) j!176)) (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15605 a!3235) (index!18478 lt!229792)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45694 res!305794) b!504636))

(assert (= (and b!504636 res!305793) b!504628))

(assert (= (and b!504628 res!305795) b!504638))

(assert (= (and b!504638 res!305789) b!504632))

(assert (= (and b!504632 res!305796) b!504626))

(assert (= (and b!504626 res!305798) b!504634))

(assert (= (and b!504634 res!305788) b!504625))

(assert (= (and b!504625 res!305792) b!504633))

(assert (= (and b!504633 res!305787) b!504627))

(assert (= (and b!504633 (not res!305784)) b!504637))

(assert (= (and b!504637 (not res!305786)) b!504641))

(assert (= (and b!504641 c!59699) b!504635))

(assert (= (and b!504641 (not c!59699)) b!504640))

(assert (= (and b!504635 res!305790) b!504639))

(assert (= (and b!504641 (not res!305785)) b!504629))

(assert (= (and b!504629 res!305797) b!504631))

(assert (= (and b!504629 (not res!305791)) b!504630))

(declare-fun m!485345 () Bool)

(assert (=> b!504632 m!485345))

(declare-fun m!485347 () Bool)

(assert (=> b!504630 m!485347))

(declare-fun m!485349 () Bool)

(assert (=> b!504641 m!485349))

(declare-fun m!485351 () Bool)

(assert (=> b!504641 m!485351))

(declare-fun m!485353 () Bool)

(assert (=> b!504641 m!485353))

(declare-fun m!485355 () Bool)

(assert (=> b!504633 m!485355))

(declare-fun m!485357 () Bool)

(assert (=> b!504633 m!485357))

(declare-fun m!485359 () Bool)

(assert (=> b!504633 m!485359))

(declare-fun m!485361 () Bool)

(assert (=> b!504633 m!485361))

(assert (=> b!504633 m!485353))

(declare-fun m!485363 () Bool)

(assert (=> b!504633 m!485363))

(assert (=> b!504633 m!485353))

(declare-fun m!485365 () Bool)

(assert (=> b!504633 m!485365))

(assert (=> b!504633 m!485353))

(declare-fun m!485367 () Bool)

(assert (=> b!504633 m!485367))

(declare-fun m!485369 () Bool)

(assert (=> b!504633 m!485369))

(assert (=> b!504628 m!485353))

(assert (=> b!504628 m!485353))

(declare-fun m!485371 () Bool)

(assert (=> b!504628 m!485371))

(declare-fun m!485373 () Bool)

(assert (=> b!504626 m!485373))

(declare-fun m!485375 () Bool)

(assert (=> b!504625 m!485375))

(declare-fun m!485377 () Bool)

(assert (=> b!504635 m!485377))

(assert (=> b!504635 m!485347))

(assert (=> b!504631 m!485353))

(assert (=> b!504631 m!485353))

(declare-fun m!485379 () Bool)

(assert (=> b!504631 m!485379))

(declare-fun m!485381 () Bool)

(assert (=> b!504638 m!485381))

(assert (=> b!504627 m!485353))

(assert (=> b!504627 m!485353))

(declare-fun m!485383 () Bool)

(assert (=> b!504627 m!485383))

(declare-fun m!485385 () Bool)

(assert (=> start!45694 m!485385))

(declare-fun m!485387 () Bool)

(assert (=> start!45694 m!485387))

(declare-fun m!485389 () Bool)

(assert (=> b!504634 m!485389))

(push 1)

