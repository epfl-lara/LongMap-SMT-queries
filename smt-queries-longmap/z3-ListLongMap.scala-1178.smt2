; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25410 () Bool)

(assert start!25410)

(declare-fun b!264684 () Bool)

(declare-fun res!129197 () Bool)

(declare-fun e!171472 () Bool)

(assert (=> b!264684 (=> (not res!129197) (not e!171472))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264684 (= res!129197 (validKeyInArray!0 k0!2698))))

(declare-fun b!264685 () Bool)

(declare-fun res!129195 () Bool)

(assert (=> b!264685 (=> (not res!129195) (not e!171472))))

(declare-datatypes ((array!12706 0))(
  ( (array!12707 (arr!6012 (Array (_ BitVec 32) (_ BitVec 64))) (size!6364 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12706)

(declare-fun arrayContainsKey!0 (array!12706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264685 (= res!129195 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264683 () Bool)

(declare-fun res!129196 () Bool)

(assert (=> b!264683 (=> (not res!129196) (not e!171472))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264683 (= res!129196 (and (= (size!6364 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6364 a!3436))))))

(declare-fun b!264686 () Bool)

(assert (=> b!264686 (= e!171472 false)))

(declare-datatypes ((SeekEntryResult!1203 0))(
  ( (MissingZero!1203 (index!6982 (_ BitVec 32))) (Found!1203 (index!6983 (_ BitVec 32))) (Intermediate!1203 (undefined!2015 Bool) (index!6984 (_ BitVec 32)) (x!25312 (_ BitVec 32))) (Undefined!1203) (MissingVacant!1203 (index!6985 (_ BitVec 32))) )
))
(declare-fun lt!133891 () SeekEntryResult!1203)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12706 (_ BitVec 32)) SeekEntryResult!1203)

(assert (=> b!264686 (= lt!133891 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!129198 () Bool)

(assert (=> start!25410 (=> (not res!129198) (not e!171472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25410 (= res!129198 (validMask!0 mask!4002))))

(assert (=> start!25410 e!171472))

(assert (=> start!25410 true))

(declare-fun array_inv!3975 (array!12706) Bool)

(assert (=> start!25410 (array_inv!3975 a!3436)))

(assert (= (and start!25410 res!129198) b!264683))

(assert (= (and b!264683 res!129196) b!264684))

(assert (= (and b!264684 res!129197) b!264685))

(assert (= (and b!264685 res!129195) b!264686))

(declare-fun m!281695 () Bool)

(assert (=> b!264684 m!281695))

(declare-fun m!281697 () Bool)

(assert (=> b!264685 m!281697))

(declare-fun m!281699 () Bool)

(assert (=> b!264686 m!281699))

(declare-fun m!281701 () Bool)

(assert (=> start!25410 m!281701))

(declare-fun m!281703 () Bool)

(assert (=> start!25410 m!281703))

(check-sat (not b!264685) (not start!25410) (not b!264686) (not b!264684))
(check-sat)
