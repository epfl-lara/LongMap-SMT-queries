; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28316 () Bool)

(assert start!28316)

(declare-fun b!290139 () Bool)

(declare-fun e!183612 () Bool)

(assert (=> b!290139 (= e!183612 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143291 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2091 0))(
  ( (MissingZero!2091 (index!10534 (_ BitVec 32))) (Found!2091 (index!10535 (_ BitVec 32))) (Intermediate!2091 (undefined!2903 Bool) (index!10536 (_ BitVec 32)) (x!28728 (_ BitVec 32))) (Undefined!2091) (MissingVacant!2091 (index!10537 (_ BitVec 32))) )
))
(declare-fun lt!143293 () SeekEntryResult!2091)

(declare-datatypes ((array!14630 0))(
  ( (array!14631 (arr!6942 (Array (_ BitVec 32) (_ BitVec 64))) (size!7294 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14630)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14630 (_ BitVec 32)) SeekEntryResult!2091)

(assert (=> b!290139 (= lt!143293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143291 k0!2524 (array!14631 (store (arr!6942 a!3312) i!1256 k0!2524) (size!7294 a!3312)) mask!3809))))

(declare-fun lt!143292 () SeekEntryResult!2091)

(assert (=> b!290139 (= lt!143292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143291 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290139 (= lt!143291 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290140 () Bool)

(declare-fun res!151621 () Bool)

(declare-fun e!183614 () Bool)

(assert (=> b!290140 (=> (not res!151621) (not e!183614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290140 (= res!151621 (validKeyInArray!0 k0!2524))))

(declare-fun b!290142 () Bool)

(declare-fun res!151620 () Bool)

(assert (=> b!290142 (=> (not res!151620) (not e!183612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14630 (_ BitVec 32)) Bool)

(assert (=> b!290142 (= res!151620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290143 () Bool)

(assert (=> b!290143 (= e!183614 e!183612)))

(declare-fun res!151622 () Bool)

(assert (=> b!290143 (=> (not res!151622) (not e!183612))))

(declare-fun lt!143290 () SeekEntryResult!2091)

(assert (=> b!290143 (= res!151622 (or (= lt!143290 (MissingZero!2091 i!1256)) (= lt!143290 (MissingVacant!2091 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14630 (_ BitVec 32)) SeekEntryResult!2091)

(assert (=> b!290143 (= lt!143290 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290144 () Bool)

(declare-fun res!151623 () Bool)

(assert (=> b!290144 (=> (not res!151623) (not e!183614))))

(declare-fun arrayContainsKey!0 (array!14630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290144 (= res!151623 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290141 () Bool)

(declare-fun res!151619 () Bool)

(assert (=> b!290141 (=> (not res!151619) (not e!183614))))

(assert (=> b!290141 (= res!151619 (and (= (size!7294 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7294 a!3312))))))

(declare-fun res!151618 () Bool)

(assert (=> start!28316 (=> (not res!151618) (not e!183614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28316 (= res!151618 (validMask!0 mask!3809))))

(assert (=> start!28316 e!183614))

(assert (=> start!28316 true))

(declare-fun array_inv!4905 (array!14630) Bool)

(assert (=> start!28316 (array_inv!4905 a!3312)))

(assert (= (and start!28316 res!151618) b!290141))

(assert (= (and b!290141 res!151619) b!290140))

(assert (= (and b!290140 res!151621) b!290144))

(assert (= (and b!290144 res!151623) b!290143))

(assert (= (and b!290143 res!151622) b!290142))

(assert (= (and b!290142 res!151620) b!290139))

(declare-fun m!304247 () Bool)

(assert (=> b!290139 m!304247))

(declare-fun m!304249 () Bool)

(assert (=> b!290139 m!304249))

(declare-fun m!304251 () Bool)

(assert (=> b!290139 m!304251))

(declare-fun m!304253 () Bool)

(assert (=> b!290139 m!304253))

(declare-fun m!304255 () Bool)

(assert (=> b!290144 m!304255))

(declare-fun m!304257 () Bool)

(assert (=> b!290142 m!304257))

(declare-fun m!304259 () Bool)

(assert (=> start!28316 m!304259))

(declare-fun m!304261 () Bool)

(assert (=> start!28316 m!304261))

(declare-fun m!304263 () Bool)

(assert (=> b!290143 m!304263))

(declare-fun m!304265 () Bool)

(assert (=> b!290140 m!304265))

(check-sat (not b!290140) (not b!290139) (not start!28316) (not b!290144) (not b!290143) (not b!290142))
(check-sat)
