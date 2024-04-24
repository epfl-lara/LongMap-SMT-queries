; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28288 () Bool)

(assert start!28288)

(declare-fun b!290006 () Bool)

(declare-fun e!183548 () Bool)

(assert (=> b!290006 (= e!183548 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14607 0))(
  ( (array!14608 (arr!6931 (Array (_ BitVec 32) (_ BitVec 64))) (size!7283 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14607)

(declare-fun lt!143232 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2045 0))(
  ( (MissingZero!2045 (index!10350 (_ BitVec 32))) (Found!2045 (index!10351 (_ BitVec 32))) (Intermediate!2045 (undefined!2857 Bool) (index!10352 (_ BitVec 32)) (x!28658 (_ BitVec 32))) (Undefined!2045) (MissingVacant!2045 (index!10353 (_ BitVec 32))) )
))
(declare-fun lt!143229 () SeekEntryResult!2045)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14607 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!290006 (= lt!143229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143232 k0!2524 (array!14608 (store (arr!6931 a!3312) i!1256 k0!2524) (size!7283 a!3312)) mask!3809))))

(declare-fun lt!143230 () SeekEntryResult!2045)

(assert (=> b!290006 (= lt!143230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143232 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290006 (= lt!143232 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290007 () Bool)

(declare-fun res!151460 () Bool)

(declare-fun e!183547 () Bool)

(assert (=> b!290007 (=> (not res!151460) (not e!183547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290007 (= res!151460 (validKeyInArray!0 k0!2524))))

(declare-fun b!290009 () Bool)

(declare-fun res!151459 () Bool)

(assert (=> b!290009 (=> (not res!151459) (not e!183547))))

(declare-fun arrayContainsKey!0 (array!14607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290009 (= res!151459 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290010 () Bool)

(declare-fun res!151461 () Bool)

(assert (=> b!290010 (=> (not res!151461) (not e!183547))))

(assert (=> b!290010 (= res!151461 (and (= (size!7283 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7283 a!3312))))))

(declare-fun b!290011 () Bool)

(declare-fun res!151462 () Bool)

(assert (=> b!290011 (=> (not res!151462) (not e!183548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14607 (_ BitVec 32)) Bool)

(assert (=> b!290011 (= res!151462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151464 () Bool)

(assert (=> start!28288 (=> (not res!151464) (not e!183547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28288 (= res!151464 (validMask!0 mask!3809))))

(assert (=> start!28288 e!183547))

(assert (=> start!28288 true))

(declare-fun array_inv!4881 (array!14607) Bool)

(assert (=> start!28288 (array_inv!4881 a!3312)))

(declare-fun b!290008 () Bool)

(assert (=> b!290008 (= e!183547 e!183548)))

(declare-fun res!151463 () Bool)

(assert (=> b!290008 (=> (not res!151463) (not e!183548))))

(declare-fun lt!143231 () SeekEntryResult!2045)

(assert (=> b!290008 (= res!151463 (or (= lt!143231 (MissingZero!2045 i!1256)) (= lt!143231 (MissingVacant!2045 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14607 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!290008 (= lt!143231 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28288 res!151464) b!290010))

(assert (= (and b!290010 res!151461) b!290007))

(assert (= (and b!290007 res!151460) b!290009))

(assert (= (and b!290009 res!151459) b!290008))

(assert (= (and b!290008 res!151463) b!290011))

(assert (= (and b!290011 res!151462) b!290006))

(declare-fun m!304253 () Bool)

(assert (=> b!290007 m!304253))

(declare-fun m!304255 () Bool)

(assert (=> b!290009 m!304255))

(declare-fun m!304257 () Bool)

(assert (=> b!290008 m!304257))

(declare-fun m!304259 () Bool)

(assert (=> start!28288 m!304259))

(declare-fun m!304261 () Bool)

(assert (=> start!28288 m!304261))

(declare-fun m!304263 () Bool)

(assert (=> b!290006 m!304263))

(declare-fun m!304265 () Bool)

(assert (=> b!290006 m!304265))

(declare-fun m!304267 () Bool)

(assert (=> b!290006 m!304267))

(declare-fun m!304269 () Bool)

(assert (=> b!290006 m!304269))

(declare-fun m!304271 () Bool)

(assert (=> b!290011 m!304271))

(check-sat (not b!290006) (not start!28288) (not b!290011) (not b!290009) (not b!290008) (not b!290007))
(check-sat)
