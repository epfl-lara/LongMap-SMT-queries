; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44724 () Bool)

(assert start!44724)

(declare-fun b!490759 () Bool)

(declare-fun e!288395 () Bool)

(declare-fun e!288399 () Bool)

(assert (=> b!490759 (= e!288395 e!288399)))

(declare-fun res!293841 () Bool)

(assert (=> b!490759 (=> res!293841 e!288399)))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!490759 (= res!293841 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((array!31793 0))(
  ( (array!31794 (arr!15284 (Array (_ BitVec 32) (_ BitVec 64))) (size!15649 (_ BitVec 32))) )
))
(declare-fun lt!221656 () array!31793)

(declare-datatypes ((SeekEntryResult!3748 0))(
  ( (MissingZero!3748 (index!17171 (_ BitVec 32))) (Found!3748 (index!17172 (_ BitVec 32))) (Intermediate!3748 (undefined!4560 Bool) (index!17173 (_ BitVec 32)) (x!46273 (_ BitVec 32))) (Undefined!3748) (MissingVacant!3748 (index!17174 (_ BitVec 32))) )
))
(declare-fun lt!221654 () SeekEntryResult!3748)

(declare-fun lt!221651 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31793 (_ BitVec 32)) SeekEntryResult!3748)

(assert (=> b!490759 (= lt!221654 (seekEntryOrOpen!0 lt!221651 lt!221656 mask!3524))))

(declare-datatypes ((Unit!14428 0))(
  ( (Unit!14429) )
))
(declare-fun lt!221653 () Unit!14428)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31793)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14428)

(assert (=> b!490759 (= lt!221653 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490760 () Bool)

(declare-fun res!293839 () Bool)

(declare-fun e!288398 () Bool)

(assert (=> b!490760 (=> (not res!293839) (not e!288398))))

(assert (=> b!490760 (= res!293839 (and (= (size!15649 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15649 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15649 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490761 () Bool)

(declare-fun e!288397 () Bool)

(assert (=> b!490761 (= e!288397 (not e!288395))))

(declare-fun res!293840 () Bool)

(assert (=> b!490761 (=> res!293840 e!288395)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31793 (_ BitVec 32)) SeekEntryResult!3748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490761 (= res!293840 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15284 a!3235) j!176) mask!3524) (select (arr!15284 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221651 mask!3524) lt!221651 lt!221656 mask!3524))))))

(assert (=> b!490761 (= lt!221651 (select (store (arr!15284 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490761 (= lt!221656 (array!31794 (store (arr!15284 a!3235) i!1204 k0!2280) (size!15649 a!3235)))))

(assert (=> b!490761 (= lt!221654 (Found!3748 j!176))))

(assert (=> b!490761 (= lt!221654 (seekEntryOrOpen!0 (select (arr!15284 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31793 (_ BitVec 32)) Bool)

(assert (=> b!490761 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221655 () Unit!14428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14428)

(assert (=> b!490761 (= lt!221655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293837 () Bool)

(assert (=> start!44724 (=> (not res!293837) (not e!288398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44724 (= res!293837 (validMask!0 mask!3524))))

(assert (=> start!44724 e!288398))

(assert (=> start!44724 true))

(declare-fun array_inv!11167 (array!31793) Bool)

(assert (=> start!44724 (array_inv!11167 a!3235)))

(declare-fun b!490762 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490762 (= e!288399 (validKeyInArray!0 lt!221651))))

(declare-fun b!490763 () Bool)

(assert (=> b!490763 (= e!288398 e!288397)))

(declare-fun res!293845 () Bool)

(assert (=> b!490763 (=> (not res!293845) (not e!288397))))

(declare-fun lt!221652 () SeekEntryResult!3748)

(assert (=> b!490763 (= res!293845 (or (= lt!221652 (MissingZero!3748 i!1204)) (= lt!221652 (MissingVacant!3748 i!1204))))))

(assert (=> b!490763 (= lt!221652 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490764 () Bool)

(declare-fun res!293844 () Bool)

(assert (=> b!490764 (=> (not res!293844) (not e!288398))))

(assert (=> b!490764 (= res!293844 (validKeyInArray!0 k0!2280))))

(declare-fun b!490765 () Bool)

(declare-fun res!293843 () Bool)

(assert (=> b!490765 (=> (not res!293843) (not e!288398))))

(declare-fun arrayContainsKey!0 (array!31793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490765 (= res!293843 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490766 () Bool)

(declare-fun res!293846 () Bool)

(assert (=> b!490766 (=> (not res!293846) (not e!288398))))

(assert (=> b!490766 (= res!293846 (validKeyInArray!0 (select (arr!15284 a!3235) j!176)))))

(declare-fun b!490767 () Bool)

(declare-fun res!293842 () Bool)

(assert (=> b!490767 (=> (not res!293842) (not e!288397))))

(assert (=> b!490767 (= res!293842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490768 () Bool)

(declare-fun res!293838 () Bool)

(assert (=> b!490768 (=> (not res!293838) (not e!288397))))

(declare-datatypes ((List!9481 0))(
  ( (Nil!9478) (Cons!9477 (h!10339 (_ BitVec 64)) (t!15700 List!9481)) )
))
(declare-fun arrayNoDuplicates!0 (array!31793 (_ BitVec 32) List!9481) Bool)

(assert (=> b!490768 (= res!293838 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9478))))

(assert (= (and start!44724 res!293837) b!490760))

(assert (= (and b!490760 res!293839) b!490766))

(assert (= (and b!490766 res!293846) b!490764))

(assert (= (and b!490764 res!293844) b!490765))

(assert (= (and b!490765 res!293843) b!490763))

(assert (= (and b!490763 res!293845) b!490767))

(assert (= (and b!490767 res!293842) b!490768))

(assert (= (and b!490768 res!293838) b!490761))

(assert (= (and b!490761 (not res!293840)) b!490759))

(assert (= (and b!490759 (not res!293841)) b!490762))

(declare-fun m!470665 () Bool)

(assert (=> start!44724 m!470665))

(declare-fun m!470667 () Bool)

(assert (=> start!44724 m!470667))

(declare-fun m!470669 () Bool)

(assert (=> b!490768 m!470669))

(declare-fun m!470671 () Bool)

(assert (=> b!490766 m!470671))

(assert (=> b!490766 m!470671))

(declare-fun m!470673 () Bool)

(assert (=> b!490766 m!470673))

(declare-fun m!470675 () Bool)

(assert (=> b!490764 m!470675))

(declare-fun m!470677 () Bool)

(assert (=> b!490762 m!470677))

(declare-fun m!470679 () Bool)

(assert (=> b!490763 m!470679))

(declare-fun m!470681 () Bool)

(assert (=> b!490759 m!470681))

(declare-fun m!470683 () Bool)

(assert (=> b!490759 m!470683))

(declare-fun m!470685 () Bool)

(assert (=> b!490767 m!470685))

(declare-fun m!470687 () Bool)

(assert (=> b!490761 m!470687))

(declare-fun m!470689 () Bool)

(assert (=> b!490761 m!470689))

(declare-fun m!470691 () Bool)

(assert (=> b!490761 m!470691))

(assert (=> b!490761 m!470671))

(declare-fun m!470693 () Bool)

(assert (=> b!490761 m!470693))

(assert (=> b!490761 m!470671))

(assert (=> b!490761 m!470691))

(assert (=> b!490761 m!470671))

(declare-fun m!470695 () Bool)

(assert (=> b!490761 m!470695))

(assert (=> b!490761 m!470671))

(declare-fun m!470697 () Bool)

(assert (=> b!490761 m!470697))

(declare-fun m!470699 () Bool)

(assert (=> b!490761 m!470699))

(declare-fun m!470701 () Bool)

(assert (=> b!490761 m!470701))

(declare-fun m!470703 () Bool)

(assert (=> b!490761 m!470703))

(assert (=> b!490761 m!470699))

(declare-fun m!470705 () Bool)

(assert (=> b!490765 m!470705))

(check-sat (not b!490767) (not b!490761) (not b!490765) (not b!490762) (not b!490764) (not b!490768) (not b!490763) (not b!490759) (not start!44724) (not b!490766))
(check-sat)
