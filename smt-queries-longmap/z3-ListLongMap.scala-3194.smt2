; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44780 () Bool)

(assert start!44780)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!288876 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!491716 () Bool)

(declare-datatypes ((array!31840 0))(
  ( (array!31841 (arr!15307 (Array (_ BitVec 32) (_ BitVec 64))) (size!15671 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31840)

(declare-datatypes ((SeekEntryResult!3730 0))(
  ( (MissingZero!3730 (index!17099 (_ BitVec 32))) (Found!3730 (index!17100 (_ BitVec 32))) (Intermediate!3730 (undefined!4542 Bool) (index!17101 (_ BitVec 32)) (x!46329 (_ BitVec 32))) (Undefined!3730) (MissingVacant!3730 (index!17102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31840 (_ BitVec 32)) SeekEntryResult!3730)

(assert (=> b!491716 (= e!288876 (= (seekEntryOrOpen!0 (select (arr!15307 a!3235) j!176) a!3235 mask!3524) (Found!3730 j!176)))))

(declare-fun b!491717 () Bool)

(declare-fun res!294710 () Bool)

(declare-fun e!288873 () Bool)

(assert (=> b!491717 (=> (not res!294710) (not e!288873))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491717 (= res!294710 (validKeyInArray!0 k0!2280))))

(declare-fun b!491718 () Bool)

(declare-fun res!294715 () Bool)

(declare-fun e!288872 () Bool)

(assert (=> b!491718 (=> (not res!294715) (not e!288872))))

(declare-datatypes ((List!9372 0))(
  ( (Nil!9369) (Cons!9368 (h!10230 (_ BitVec 64)) (t!15592 List!9372)) )
))
(declare-fun arrayNoDuplicates!0 (array!31840 (_ BitVec 32) List!9372) Bool)

(assert (=> b!491718 (= res!294715 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9369))))

(declare-fun b!491719 () Bool)

(declare-fun e!288874 () Bool)

(assert (=> b!491719 (= e!288872 (not e!288874))))

(declare-fun res!294713 () Bool)

(assert (=> b!491719 (=> res!294713 e!288874)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31840 (_ BitVec 32)) SeekEntryResult!3730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491719 (= res!294713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15307 a!3235) j!176) mask!3524) (select (arr!15307 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15307 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15307 a!3235) i!1204 k0!2280) j!176) (array!31841 (store (arr!15307 a!3235) i!1204 k0!2280) (size!15671 a!3235)) mask!3524)))))

(assert (=> b!491719 e!288876))

(declare-fun res!294712 () Bool)

(assert (=> b!491719 (=> (not res!294712) (not e!288876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31840 (_ BitVec 32)) Bool)

(assert (=> b!491719 (= res!294712 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14467 0))(
  ( (Unit!14468) )
))
(declare-fun lt!222376 () Unit!14467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14467)

(assert (=> b!491719 (= lt!222376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491720 () Bool)

(declare-fun res!294707 () Bool)

(assert (=> b!491720 (=> (not res!294707) (not e!288873))))

(assert (=> b!491720 (= res!294707 (validKeyInArray!0 (select (arr!15307 a!3235) j!176)))))

(declare-fun b!491721 () Bool)

(declare-fun res!294706 () Bool)

(assert (=> b!491721 (=> (not res!294706) (not e!288873))))

(declare-fun arrayContainsKey!0 (array!31840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491721 (= res!294706 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491722 () Bool)

(declare-fun res!294714 () Bool)

(assert (=> b!491722 (=> (not res!294714) (not e!288872))))

(assert (=> b!491722 (= res!294714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491723 () Bool)

(assert (=> b!491723 (= e!288874 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!491724 () Bool)

(assert (=> b!491724 (= e!288873 e!288872)))

(declare-fun res!294711 () Bool)

(assert (=> b!491724 (=> (not res!294711) (not e!288872))))

(declare-fun lt!222375 () SeekEntryResult!3730)

(assert (=> b!491724 (= res!294711 (or (= lt!222375 (MissingZero!3730 i!1204)) (= lt!222375 (MissingVacant!3730 i!1204))))))

(assert (=> b!491724 (= lt!222375 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294709 () Bool)

(assert (=> start!44780 (=> (not res!294709) (not e!288873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44780 (= res!294709 (validMask!0 mask!3524))))

(assert (=> start!44780 e!288873))

(assert (=> start!44780 true))

(declare-fun array_inv!11166 (array!31840) Bool)

(assert (=> start!44780 (array_inv!11166 a!3235)))

(declare-fun b!491725 () Bool)

(declare-fun res!294708 () Bool)

(assert (=> b!491725 (=> (not res!294708) (not e!288873))))

(assert (=> b!491725 (= res!294708 (and (= (size!15671 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15671 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15671 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44780 res!294709) b!491725))

(assert (= (and b!491725 res!294708) b!491720))

(assert (= (and b!491720 res!294707) b!491717))

(assert (= (and b!491717 res!294710) b!491721))

(assert (= (and b!491721 res!294706) b!491724))

(assert (= (and b!491724 res!294711) b!491722))

(assert (= (and b!491722 res!294714) b!491718))

(assert (= (and b!491718 res!294715) b!491719))

(assert (= (and b!491719 res!294712) b!491716))

(assert (= (and b!491719 (not res!294713)) b!491723))

(declare-fun m!472693 () Bool)

(assert (=> b!491724 m!472693))

(declare-fun m!472695 () Bool)

(assert (=> b!491722 m!472695))

(declare-fun m!472697 () Bool)

(assert (=> start!44780 m!472697))

(declare-fun m!472699 () Bool)

(assert (=> start!44780 m!472699))

(declare-fun m!472701 () Bool)

(assert (=> b!491716 m!472701))

(assert (=> b!491716 m!472701))

(declare-fun m!472703 () Bool)

(assert (=> b!491716 m!472703))

(declare-fun m!472705 () Bool)

(assert (=> b!491721 m!472705))

(declare-fun m!472707 () Bool)

(assert (=> b!491717 m!472707))

(declare-fun m!472709 () Bool)

(assert (=> b!491718 m!472709))

(declare-fun m!472711 () Bool)

(assert (=> b!491719 m!472711))

(declare-fun m!472713 () Bool)

(assert (=> b!491719 m!472713))

(declare-fun m!472715 () Bool)

(assert (=> b!491719 m!472715))

(declare-fun m!472717 () Bool)

(assert (=> b!491719 m!472717))

(assert (=> b!491719 m!472701))

(declare-fun m!472719 () Bool)

(assert (=> b!491719 m!472719))

(assert (=> b!491719 m!472701))

(assert (=> b!491719 m!472717))

(declare-fun m!472721 () Bool)

(assert (=> b!491719 m!472721))

(assert (=> b!491719 m!472715))

(declare-fun m!472723 () Bool)

(assert (=> b!491719 m!472723))

(assert (=> b!491719 m!472701))

(declare-fun m!472725 () Bool)

(assert (=> b!491719 m!472725))

(assert (=> b!491719 m!472715))

(assert (=> b!491719 m!472721))

(assert (=> b!491720 m!472701))

(assert (=> b!491720 m!472701))

(declare-fun m!472727 () Bool)

(assert (=> b!491720 m!472727))

(check-sat (not b!491724) (not b!491717) (not b!491720) (not b!491721) (not b!491716) (not start!44780) (not b!491719) (not b!491722) (not b!491718))
(check-sat)
