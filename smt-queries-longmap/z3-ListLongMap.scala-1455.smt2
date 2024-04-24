; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28060 () Bool)

(assert start!28060)

(declare-fun res!149422 () Bool)

(declare-fun e!182190 () Bool)

(assert (=> start!28060 (=> (not res!149422) (not e!182190))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28060 (= res!149422 (validMask!0 mask!3809))))

(assert (=> start!28060 e!182190))

(assert (=> start!28060 true))

(declare-datatypes ((array!14424 0))(
  ( (array!14425 (arr!6841 (Array (_ BitVec 32) (_ BitVec 64))) (size!7193 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14424)

(declare-fun array_inv!4791 (array!14424) Bool)

(assert (=> start!28060 (array_inv!4791 a!3312)))

(declare-fun b!287684 () Bool)

(declare-fun res!149424 () Bool)

(assert (=> b!287684 (=> (not res!149424) (not e!182190))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287684 (= res!149424 (and (= (size!7193 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7193 a!3312))))))

(declare-fun b!287685 () Bool)

(declare-fun e!182192 () Bool)

(assert (=> b!287685 (= e!182192 false)))

(declare-datatypes ((SeekEntryResult!1955 0))(
  ( (MissingZero!1955 (index!9990 (_ BitVec 32))) (Found!1955 (index!9991 (_ BitVec 32))) (Intermediate!1955 (undefined!2767 Bool) (index!9992 (_ BitVec 32)) (x!28322 (_ BitVec 32))) (Undefined!1955) (MissingVacant!1955 (index!9993 (_ BitVec 32))) )
))
(declare-fun lt!141662 () SeekEntryResult!1955)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14424 (_ BitVec 32)) SeekEntryResult!1955)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287685 (= lt!141662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287686 () Bool)

(declare-fun res!149425 () Bool)

(assert (=> b!287686 (=> (not res!149425) (not e!182192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14424 (_ BitVec 32)) Bool)

(assert (=> b!287686 (= res!149425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287687 () Bool)

(assert (=> b!287687 (= e!182190 e!182192)))

(declare-fun res!149423 () Bool)

(assert (=> b!287687 (=> (not res!149423) (not e!182192))))

(declare-fun lt!141663 () SeekEntryResult!1955)

(assert (=> b!287687 (= res!149423 (or (= lt!141663 (MissingZero!1955 i!1256)) (= lt!141663 (MissingVacant!1955 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14424 (_ BitVec 32)) SeekEntryResult!1955)

(assert (=> b!287687 (= lt!141663 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287688 () Bool)

(declare-fun res!149427 () Bool)

(assert (=> b!287688 (=> (not res!149427) (not e!182190))))

(declare-fun arrayContainsKey!0 (array!14424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287688 (= res!149427 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287689 () Bool)

(declare-fun res!149426 () Bool)

(assert (=> b!287689 (=> (not res!149426) (not e!182190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287689 (= res!149426 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28060 res!149422) b!287684))

(assert (= (and b!287684 res!149424) b!287689))

(assert (= (and b!287689 res!149426) b!287688))

(assert (= (and b!287688 res!149427) b!287687))

(assert (= (and b!287687 res!149423) b!287686))

(assert (= (and b!287686 res!149425) b!287685))

(declare-fun m!302183 () Bool)

(assert (=> b!287689 m!302183))

(declare-fun m!302185 () Bool)

(assert (=> b!287687 m!302185))

(declare-fun m!302187 () Bool)

(assert (=> start!28060 m!302187))

(declare-fun m!302189 () Bool)

(assert (=> start!28060 m!302189))

(declare-fun m!302191 () Bool)

(assert (=> b!287688 m!302191))

(declare-fun m!302193 () Bool)

(assert (=> b!287686 m!302193))

(declare-fun m!302195 () Bool)

(assert (=> b!287685 m!302195))

(assert (=> b!287685 m!302195))

(declare-fun m!302197 () Bool)

(assert (=> b!287685 m!302197))

(check-sat (not b!287687) (not b!287685) (not b!287688) (not start!28060) (not b!287686) (not b!287689))
(check-sat)
