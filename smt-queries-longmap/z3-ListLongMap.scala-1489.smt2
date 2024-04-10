; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28322 () Bool)

(assert start!28322)

(declare-fun b!290193 () Bool)

(declare-fun res!151672 () Bool)

(declare-fun e!183641 () Bool)

(assert (=> b!290193 (=> (not res!151672) (not e!183641))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290193 (= res!151672 (validKeyInArray!0 k0!2524))))

(declare-fun b!290194 () Bool)

(declare-fun res!151677 () Bool)

(declare-fun e!183639 () Bool)

(assert (=> b!290194 (=> (not res!151677) (not e!183639))))

(declare-datatypes ((array!14636 0))(
  ( (array!14637 (arr!6945 (Array (_ BitVec 32) (_ BitVec 64))) (size!7297 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14636)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14636 (_ BitVec 32)) Bool)

(assert (=> b!290194 (= res!151677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290195 () Bool)

(declare-fun res!151675 () Bool)

(assert (=> b!290195 (=> (not res!151675) (not e!183641))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290195 (= res!151675 (and (= (size!7297 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7297 a!3312))))))

(declare-fun b!290196 () Bool)

(assert (=> b!290196 (= e!183641 e!183639)))

(declare-fun res!151674 () Bool)

(assert (=> b!290196 (=> (not res!151674) (not e!183639))))

(declare-datatypes ((SeekEntryResult!2094 0))(
  ( (MissingZero!2094 (index!10546 (_ BitVec 32))) (Found!2094 (index!10547 (_ BitVec 32))) (Intermediate!2094 (undefined!2906 Bool) (index!10548 (_ BitVec 32)) (x!28739 (_ BitVec 32))) (Undefined!2094) (MissingVacant!2094 (index!10549 (_ BitVec 32))) )
))
(declare-fun lt!143329 () SeekEntryResult!2094)

(assert (=> b!290196 (= res!151674 (or (= lt!143329 (MissingZero!2094 i!1256)) (= lt!143329 (MissingVacant!2094 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14636 (_ BitVec 32)) SeekEntryResult!2094)

(assert (=> b!290196 (= lt!143329 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290197 () Bool)

(assert (=> b!290197 (= e!183639 false)))

(declare-fun lt!143328 () (_ BitVec 32))

(declare-fun lt!143326 () SeekEntryResult!2094)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14636 (_ BitVec 32)) SeekEntryResult!2094)

(assert (=> b!290197 (= lt!143326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143328 k0!2524 (array!14637 (store (arr!6945 a!3312) i!1256 k0!2524) (size!7297 a!3312)) mask!3809))))

(declare-fun lt!143327 () SeekEntryResult!2094)

(assert (=> b!290197 (= lt!143327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143328 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290197 (= lt!143328 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290198 () Bool)

(declare-fun res!151676 () Bool)

(assert (=> b!290198 (=> (not res!151676) (not e!183641))))

(declare-fun arrayContainsKey!0 (array!14636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290198 (= res!151676 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151673 () Bool)

(assert (=> start!28322 (=> (not res!151673) (not e!183641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28322 (= res!151673 (validMask!0 mask!3809))))

(assert (=> start!28322 e!183641))

(assert (=> start!28322 true))

(declare-fun array_inv!4908 (array!14636) Bool)

(assert (=> start!28322 (array_inv!4908 a!3312)))

(assert (= (and start!28322 res!151673) b!290195))

(assert (= (and b!290195 res!151675) b!290193))

(assert (= (and b!290193 res!151672) b!290198))

(assert (= (and b!290198 res!151676) b!290196))

(assert (= (and b!290196 res!151674) b!290194))

(assert (= (and b!290194 res!151677) b!290197))

(declare-fun m!304307 () Bool)

(assert (=> start!28322 m!304307))

(declare-fun m!304309 () Bool)

(assert (=> start!28322 m!304309))

(declare-fun m!304311 () Bool)

(assert (=> b!290198 m!304311))

(declare-fun m!304313 () Bool)

(assert (=> b!290194 m!304313))

(declare-fun m!304315 () Bool)

(assert (=> b!290193 m!304315))

(declare-fun m!304317 () Bool)

(assert (=> b!290197 m!304317))

(declare-fun m!304319 () Bool)

(assert (=> b!290197 m!304319))

(declare-fun m!304321 () Bool)

(assert (=> b!290197 m!304321))

(declare-fun m!304323 () Bool)

(assert (=> b!290197 m!304323))

(declare-fun m!304325 () Bool)

(assert (=> b!290196 m!304325))

(check-sat (not b!290193) (not b!290198) (not start!28322) (not b!290194) (not b!290196) (not b!290197))
(check-sat)
