; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44702 () Bool)

(assert start!44702)

(declare-fun b!490643 () Bool)

(declare-fun res!293637 () Bool)

(declare-fun e!288386 () Bool)

(assert (=> b!490643 (=> (not res!293637) (not e!288386))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31762 0))(
  ( (array!31763 (arr!15268 (Array (_ BitVec 32) (_ BitVec 64))) (size!15632 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31762)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490643 (= res!293637 (and (= (size!15632 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15632 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15632 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490644 () Bool)

(declare-fun res!293640 () Bool)

(declare-fun e!288384 () Bool)

(assert (=> b!490644 (=> (not res!293640) (not e!288384))))

(declare-datatypes ((List!9333 0))(
  ( (Nil!9330) (Cons!9329 (h!10191 (_ BitVec 64)) (t!15553 List!9333)) )
))
(declare-fun arrayNoDuplicates!0 (array!31762 (_ BitVec 32) List!9333) Bool)

(assert (=> b!490644 (= res!293640 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9330))))

(declare-fun b!490645 () Bool)

(declare-fun e!288385 () Bool)

(assert (=> b!490645 (= e!288384 (not e!288385))))

(declare-fun res!293635 () Bool)

(assert (=> b!490645 (=> res!293635 e!288385)))

(declare-fun lt!221686 () array!31762)

(declare-fun lt!221683 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3691 0))(
  ( (MissingZero!3691 (index!16943 (_ BitVec 32))) (Found!3691 (index!16944 (_ BitVec 32))) (Intermediate!3691 (undefined!4503 Bool) (index!16945 (_ BitVec 32)) (x!46186 (_ BitVec 32))) (Undefined!3691) (MissingVacant!3691 (index!16946 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31762 (_ BitVec 32)) SeekEntryResult!3691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490645 (= res!293635 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15268 a!3235) j!176) mask!3524) (select (arr!15268 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221683 mask!3524) lt!221683 lt!221686 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!490645 (= lt!221683 (select (store (arr!15268 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490645 (= lt!221686 (array!31763 (store (arr!15268 a!3235) i!1204 k0!2280) (size!15632 a!3235)))))

(declare-fun lt!221682 () SeekEntryResult!3691)

(assert (=> b!490645 (= lt!221682 (Found!3691 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31762 (_ BitVec 32)) SeekEntryResult!3691)

(assert (=> b!490645 (= lt!221682 (seekEntryOrOpen!0 (select (arr!15268 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31762 (_ BitVec 32)) Bool)

(assert (=> b!490645 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14389 0))(
  ( (Unit!14390) )
))
(declare-fun lt!221684 () Unit!14389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14389)

(assert (=> b!490645 (= lt!221684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490646 () Bool)

(declare-fun res!293641 () Bool)

(assert (=> b!490646 (=> (not res!293641) (not e!288386))))

(declare-fun arrayContainsKey!0 (array!31762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490646 (= res!293641 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490647 () Bool)

(assert (=> b!490647 (= e!288385 true)))

(assert (=> b!490647 (= lt!221682 (seekEntryOrOpen!0 lt!221683 lt!221686 mask!3524))))

(declare-fun lt!221681 () Unit!14389)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31762 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14389)

(assert (=> b!490647 (= lt!221681 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!293638 () Bool)

(assert (=> start!44702 (=> (not res!293638) (not e!288386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44702 (= res!293638 (validMask!0 mask!3524))))

(assert (=> start!44702 e!288386))

(assert (=> start!44702 true))

(declare-fun array_inv!11127 (array!31762) Bool)

(assert (=> start!44702 (array_inv!11127 a!3235)))

(declare-fun b!490648 () Bool)

(declare-fun res!293633 () Bool)

(assert (=> b!490648 (=> (not res!293633) (not e!288386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490648 (= res!293633 (validKeyInArray!0 (select (arr!15268 a!3235) j!176)))))

(declare-fun b!490649 () Bool)

(declare-fun res!293634 () Bool)

(assert (=> b!490649 (=> (not res!293634) (not e!288386))))

(assert (=> b!490649 (= res!293634 (validKeyInArray!0 k0!2280))))

(declare-fun b!490650 () Bool)

(declare-fun res!293636 () Bool)

(assert (=> b!490650 (=> (not res!293636) (not e!288384))))

(assert (=> b!490650 (= res!293636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490651 () Bool)

(assert (=> b!490651 (= e!288386 e!288384)))

(declare-fun res!293639 () Bool)

(assert (=> b!490651 (=> (not res!293639) (not e!288384))))

(declare-fun lt!221685 () SeekEntryResult!3691)

(assert (=> b!490651 (= res!293639 (or (= lt!221685 (MissingZero!3691 i!1204)) (= lt!221685 (MissingVacant!3691 i!1204))))))

(assert (=> b!490651 (= lt!221685 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44702 res!293638) b!490643))

(assert (= (and b!490643 res!293637) b!490648))

(assert (= (and b!490648 res!293633) b!490649))

(assert (= (and b!490649 res!293634) b!490646))

(assert (= (and b!490646 res!293641) b!490651))

(assert (= (and b!490651 res!293639) b!490650))

(assert (= (and b!490650 res!293636) b!490644))

(assert (= (and b!490644 res!293640) b!490645))

(assert (= (and b!490645 (not res!293635)) b!490647))

(declare-fun m!471121 () Bool)

(assert (=> b!490649 m!471121))

(declare-fun m!471123 () Bool)

(assert (=> b!490647 m!471123))

(declare-fun m!471125 () Bool)

(assert (=> b!490647 m!471125))

(declare-fun m!471127 () Bool)

(assert (=> start!44702 m!471127))

(declare-fun m!471129 () Bool)

(assert (=> start!44702 m!471129))

(declare-fun m!471131 () Bool)

(assert (=> b!490648 m!471131))

(assert (=> b!490648 m!471131))

(declare-fun m!471133 () Bool)

(assert (=> b!490648 m!471133))

(declare-fun m!471135 () Bool)

(assert (=> b!490645 m!471135))

(declare-fun m!471137 () Bool)

(assert (=> b!490645 m!471137))

(declare-fun m!471139 () Bool)

(assert (=> b!490645 m!471139))

(declare-fun m!471141 () Bool)

(assert (=> b!490645 m!471141))

(assert (=> b!490645 m!471131))

(declare-fun m!471143 () Bool)

(assert (=> b!490645 m!471143))

(declare-fun m!471145 () Bool)

(assert (=> b!490645 m!471145))

(declare-fun m!471147 () Bool)

(assert (=> b!490645 m!471147))

(assert (=> b!490645 m!471131))

(assert (=> b!490645 m!471141))

(assert (=> b!490645 m!471145))

(assert (=> b!490645 m!471131))

(declare-fun m!471149 () Bool)

(assert (=> b!490645 m!471149))

(assert (=> b!490645 m!471131))

(declare-fun m!471151 () Bool)

(assert (=> b!490645 m!471151))

(declare-fun m!471153 () Bool)

(assert (=> b!490650 m!471153))

(declare-fun m!471155 () Bool)

(assert (=> b!490651 m!471155))

(declare-fun m!471157 () Bool)

(assert (=> b!490646 m!471157))

(declare-fun m!471159 () Bool)

(assert (=> b!490644 m!471159))

(check-sat (not b!490645) (not b!490651) (not b!490647) (not b!490648) (not start!44702) (not b!490649) (not b!490650) (not b!490644) (not b!490646))
(check-sat)
