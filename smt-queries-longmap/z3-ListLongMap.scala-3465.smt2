; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48110 () Bool)

(assert start!48110)

(declare-fun b!529878 () Bool)

(declare-fun e!308752 () Bool)

(assert (=> b!529878 (= e!308752 true)))

(declare-fun lt!244386 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4543 0))(
  ( (MissingZero!4543 (index!20396 (_ BitVec 32))) (Found!4543 (index!20397 (_ BitVec 32))) (Intermediate!4543 (undefined!5355 Bool) (index!20398 (_ BitVec 32)) (x!49514 (_ BitVec 32))) (Undefined!4543) (MissingVacant!4543 (index!20399 (_ BitVec 32))) )
))
(declare-fun lt!244382 () SeekEntryResult!4543)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33547 0))(
  ( (array!33548 (arr!16120 (Array (_ BitVec 32) (_ BitVec 64))) (size!16484 (_ BitVec 32))) )
))
(declare-fun lt!244387 () array!33547)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33547 (_ BitVec 32)) SeekEntryResult!4543)

(assert (=> b!529878 (= lt!244382 (seekEntryOrOpen!0 lt!244386 lt!244387 mask!3524))))

(assert (=> b!529878 false))

(declare-fun b!529879 () Bool)

(declare-fun res!325640 () Bool)

(declare-fun e!308754 () Bool)

(assert (=> b!529879 (=> (not res!325640) (not e!308754))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529879 (= res!325640 (validKeyInArray!0 k0!2280))))

(declare-fun b!529880 () Bool)

(declare-fun a!3235 () array!33547)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!308750 () Bool)

(assert (=> b!529880 (= e!308750 (= (seekEntryOrOpen!0 (select (arr!16120 a!3235) j!176) a!3235 mask!3524) (Found!4543 j!176)))))

(declare-fun b!529881 () Bool)

(declare-fun res!325648 () Bool)

(assert (=> b!529881 (=> (not res!325648) (not e!308754))))

(assert (=> b!529881 (= res!325648 (validKeyInArray!0 (select (arr!16120 a!3235) j!176)))))

(declare-fun b!529882 () Bool)

(declare-fun res!325639 () Bool)

(declare-fun e!308753 () Bool)

(assert (=> b!529882 (=> (not res!325639) (not e!308753))))

(declare-datatypes ((List!10185 0))(
  ( (Nil!10182) (Cons!10181 (h!11121 (_ BitVec 64)) (t!16405 List!10185)) )
))
(declare-fun arrayNoDuplicates!0 (array!33547 (_ BitVec 32) List!10185) Bool)

(assert (=> b!529882 (= res!325639 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10182))))

(declare-fun b!529883 () Bool)

(declare-fun res!325644 () Bool)

(assert (=> b!529883 (=> (not res!325644) (not e!308753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33547 (_ BitVec 32)) Bool)

(assert (=> b!529883 (= res!325644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!325645 () Bool)

(assert (=> start!48110 (=> (not res!325645) (not e!308754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48110 (= res!325645 (validMask!0 mask!3524))))

(assert (=> start!48110 e!308754))

(assert (=> start!48110 true))

(declare-fun array_inv!11979 (array!33547) Bool)

(assert (=> start!48110 (array_inv!11979 a!3235)))

(declare-fun b!529884 () Bool)

(declare-fun e!308749 () Bool)

(assert (=> b!529884 (= e!308753 (not e!308749))))

(declare-fun res!325643 () Bool)

(assert (=> b!529884 (=> res!325643 e!308749)))

(declare-fun lt!244389 () SeekEntryResult!4543)

(declare-fun lt!244385 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33547 (_ BitVec 32)) SeekEntryResult!4543)

(assert (=> b!529884 (= res!325643 (= lt!244389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244385 lt!244386 lt!244387 mask!3524)))))

(declare-fun lt!244390 () (_ BitVec 32))

(assert (=> b!529884 (= lt!244389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244390 (select (arr!16120 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529884 (= lt!244385 (toIndex!0 lt!244386 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529884 (= lt!244386 (select (store (arr!16120 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529884 (= lt!244390 (toIndex!0 (select (arr!16120 a!3235) j!176) mask!3524))))

(assert (=> b!529884 (= lt!244387 (array!33548 (store (arr!16120 a!3235) i!1204 k0!2280) (size!16484 a!3235)))))

(assert (=> b!529884 e!308750))

(declare-fun res!325647 () Bool)

(assert (=> b!529884 (=> (not res!325647) (not e!308750))))

(assert (=> b!529884 (= res!325647 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16759 0))(
  ( (Unit!16760) )
))
(declare-fun lt!244383 () Unit!16759)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16759)

(assert (=> b!529884 (= lt!244383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529885 () Bool)

(declare-fun res!325642 () Bool)

(assert (=> b!529885 (=> (not res!325642) (not e!308754))))

(declare-fun arrayContainsKey!0 (array!33547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529885 (= res!325642 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529886 () Bool)

(assert (=> b!529886 (= e!308749 e!308752)))

(declare-fun res!325641 () Bool)

(assert (=> b!529886 (=> res!325641 e!308752)))

(declare-fun lt!244384 () Bool)

(assert (=> b!529886 (= res!325641 (or (and (not lt!244384) (undefined!5355 lt!244389)) (and (not lt!244384) (not (undefined!5355 lt!244389)))))))

(get-info :version)

(assert (=> b!529886 (= lt!244384 (not ((_ is Intermediate!4543) lt!244389)))))

(declare-fun b!529887 () Bool)

(declare-fun res!325646 () Bool)

(assert (=> b!529887 (=> (not res!325646) (not e!308754))))

(assert (=> b!529887 (= res!325646 (and (= (size!16484 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16484 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16484 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529888 () Bool)

(assert (=> b!529888 (= e!308754 e!308753)))

(declare-fun res!325638 () Bool)

(assert (=> b!529888 (=> (not res!325638) (not e!308753))))

(declare-fun lt!244388 () SeekEntryResult!4543)

(assert (=> b!529888 (= res!325638 (or (= lt!244388 (MissingZero!4543 i!1204)) (= lt!244388 (MissingVacant!4543 i!1204))))))

(assert (=> b!529888 (= lt!244388 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!48110 res!325645) b!529887))

(assert (= (and b!529887 res!325646) b!529881))

(assert (= (and b!529881 res!325648) b!529879))

(assert (= (and b!529879 res!325640) b!529885))

(assert (= (and b!529885 res!325642) b!529888))

(assert (= (and b!529888 res!325638) b!529883))

(assert (= (and b!529883 res!325644) b!529882))

(assert (= (and b!529882 res!325639) b!529884))

(assert (= (and b!529884 res!325647) b!529880))

(assert (= (and b!529884 (not res!325643)) b!529886))

(assert (= (and b!529886 (not res!325641)) b!529878))

(declare-fun m!510631 () Bool)

(assert (=> b!529879 m!510631))

(declare-fun m!510633 () Bool)

(assert (=> start!48110 m!510633))

(declare-fun m!510635 () Bool)

(assert (=> start!48110 m!510635))

(declare-fun m!510637 () Bool)

(assert (=> b!529878 m!510637))

(declare-fun m!510639 () Bool)

(assert (=> b!529885 m!510639))

(declare-fun m!510641 () Bool)

(assert (=> b!529880 m!510641))

(assert (=> b!529880 m!510641))

(declare-fun m!510643 () Bool)

(assert (=> b!529880 m!510643))

(declare-fun m!510645 () Bool)

(assert (=> b!529883 m!510645))

(declare-fun m!510647 () Bool)

(assert (=> b!529888 m!510647))

(declare-fun m!510649 () Bool)

(assert (=> b!529884 m!510649))

(assert (=> b!529884 m!510641))

(declare-fun m!510651 () Bool)

(assert (=> b!529884 m!510651))

(declare-fun m!510653 () Bool)

(assert (=> b!529884 m!510653))

(declare-fun m!510655 () Bool)

(assert (=> b!529884 m!510655))

(assert (=> b!529884 m!510641))

(declare-fun m!510657 () Bool)

(assert (=> b!529884 m!510657))

(assert (=> b!529884 m!510641))

(declare-fun m!510659 () Bool)

(assert (=> b!529884 m!510659))

(declare-fun m!510661 () Bool)

(assert (=> b!529884 m!510661))

(declare-fun m!510663 () Bool)

(assert (=> b!529884 m!510663))

(assert (=> b!529881 m!510641))

(assert (=> b!529881 m!510641))

(declare-fun m!510665 () Bool)

(assert (=> b!529881 m!510665))

(declare-fun m!510667 () Bool)

(assert (=> b!529882 m!510667))

(check-sat (not b!529880) (not b!529881) (not b!529888) (not b!529878) (not b!529879) (not b!529883) (not b!529885) (not b!529884) (not start!48110) (not b!529882))
(check-sat)
