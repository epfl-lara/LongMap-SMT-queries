; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28600 () Bool)

(assert start!28600)

(declare-fun b!292545 () Bool)

(declare-fun res!153577 () Bool)

(declare-fun e!185076 () Bool)

(assert (=> b!292545 (=> (not res!153577) (not e!185076))))

(declare-datatypes ((array!14784 0))(
  ( (array!14785 (arr!7015 (Array (_ BitVec 32) (_ BitVec 64))) (size!7367 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14784)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292545 (= res!153577 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292546 () Bool)

(declare-fun res!153575 () Bool)

(declare-fun e!185077 () Bool)

(assert (=> b!292546 (=> (not res!153575) (not e!185077))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14784 (_ BitVec 32)) Bool)

(assert (=> b!292546 (= res!153575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292547 () Bool)

(assert (=> b!292547 (= e!185077 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2129 0))(
  ( (MissingZero!2129 (index!10686 (_ BitVec 32))) (Found!2129 (index!10687 (_ BitVec 32))) (Intermediate!2129 (undefined!2941 Bool) (index!10688 (_ BitVec 32)) (x!28984 (_ BitVec 32))) (Undefined!2129) (MissingVacant!2129 (index!10689 (_ BitVec 32))) )
))
(declare-fun lt!144941 () SeekEntryResult!2129)

(declare-fun lt!144940 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14784 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!292547 (= lt!144941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144940 k0!2524 (array!14785 (store (arr!7015 a!3312) i!1256 k0!2524) (size!7367 a!3312)) mask!3809))))

(declare-fun lt!144939 () SeekEntryResult!2129)

(assert (=> b!292547 (= lt!144939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144940 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292547 (= lt!144940 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292548 () Bool)

(declare-fun res!153578 () Bool)

(assert (=> b!292548 (=> (not res!153578) (not e!185076))))

(assert (=> b!292548 (= res!153578 (and (= (size!7367 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7367 a!3312))))))

(declare-fun b!292549 () Bool)

(declare-fun res!153574 () Bool)

(assert (=> b!292549 (=> (not res!153574) (not e!185076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292549 (= res!153574 (validKeyInArray!0 k0!2524))))

(declare-fun b!292544 () Bool)

(assert (=> b!292544 (= e!185076 e!185077)))

(declare-fun res!153579 () Bool)

(assert (=> b!292544 (=> (not res!153579) (not e!185077))))

(declare-fun lt!144942 () SeekEntryResult!2129)

(assert (=> b!292544 (= res!153579 (or (= lt!144942 (MissingZero!2129 i!1256)) (= lt!144942 (MissingVacant!2129 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14784 (_ BitVec 32)) SeekEntryResult!2129)

(assert (=> b!292544 (= lt!144942 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153576 () Bool)

(assert (=> start!28600 (=> (not res!153576) (not e!185076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28600 (= res!153576 (validMask!0 mask!3809))))

(assert (=> start!28600 e!185076))

(assert (=> start!28600 true))

(declare-fun array_inv!4965 (array!14784) Bool)

(assert (=> start!28600 (array_inv!4965 a!3312)))

(assert (= (and start!28600 res!153576) b!292548))

(assert (= (and b!292548 res!153578) b!292549))

(assert (= (and b!292549 res!153574) b!292545))

(assert (= (and b!292545 res!153577) b!292544))

(assert (= (and b!292544 res!153579) b!292546))

(assert (= (and b!292546 res!153575) b!292547))

(declare-fun m!306443 () Bool)

(assert (=> b!292547 m!306443))

(declare-fun m!306445 () Bool)

(assert (=> b!292547 m!306445))

(declare-fun m!306447 () Bool)

(assert (=> b!292547 m!306447))

(declare-fun m!306449 () Bool)

(assert (=> b!292547 m!306449))

(declare-fun m!306451 () Bool)

(assert (=> b!292545 m!306451))

(declare-fun m!306453 () Bool)

(assert (=> b!292544 m!306453))

(declare-fun m!306455 () Bool)

(assert (=> b!292546 m!306455))

(declare-fun m!306457 () Bool)

(assert (=> b!292549 m!306457))

(declare-fun m!306459 () Bool)

(assert (=> start!28600 m!306459))

(declare-fun m!306461 () Bool)

(assert (=> start!28600 m!306461))

(check-sat (not b!292546) (not b!292544) (not b!292547) (not b!292549) (not b!292545) (not start!28600))
(check-sat)
