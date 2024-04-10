; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28598 () Bool)

(assert start!28598)

(declare-fun b!292407 () Bool)

(declare-fun res!153465 () Bool)

(declare-fun e!185009 () Bool)

(assert (=> b!292407 (=> (not res!153465) (not e!185009))))

(declare-datatypes ((array!14777 0))(
  ( (array!14778 (arr!7011 (Array (_ BitVec 32) (_ BitVec 64))) (size!7363 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14777)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14777 (_ BitVec 32)) Bool)

(assert (=> b!292407 (= res!153465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292408 () Bool)

(declare-fun res!153466 () Bool)

(declare-fun e!185008 () Bool)

(assert (=> b!292408 (=> (not res!153466) (not e!185008))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292408 (= res!153466 (and (= (size!7363 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7363 a!3312))))))

(declare-fun b!292409 () Bool)

(declare-fun res!153463 () Bool)

(assert (=> b!292409 (=> (not res!153463) (not e!185008))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292409 (= res!153463 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153467 () Bool)

(assert (=> start!28598 (=> (not res!153467) (not e!185008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28598 (= res!153467 (validMask!0 mask!3809))))

(assert (=> start!28598 e!185008))

(assert (=> start!28598 true))

(declare-fun array_inv!4974 (array!14777) Bool)

(assert (=> start!28598 (array_inv!4974 a!3312)))

(declare-fun b!292410 () Bool)

(declare-fun res!153464 () Bool)

(assert (=> b!292410 (=> (not res!153464) (not e!185008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292410 (= res!153464 (validKeyInArray!0 k0!2524))))

(declare-fun b!292411 () Bool)

(assert (=> b!292411 (= e!185009 false)))

(declare-fun lt!144821 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2160 0))(
  ( (MissingZero!2160 (index!10810 (_ BitVec 32))) (Found!2160 (index!10811 (_ BitVec 32))) (Intermediate!2160 (undefined!2972 Bool) (index!10812 (_ BitVec 32)) (x!28999 (_ BitVec 32))) (Undefined!2160) (MissingVacant!2160 (index!10813 (_ BitVec 32))) )
))
(declare-fun lt!144822 () SeekEntryResult!2160)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14777 (_ BitVec 32)) SeekEntryResult!2160)

(assert (=> b!292411 (= lt!144822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144821 k0!2524 (array!14778 (store (arr!7011 a!3312) i!1256 k0!2524) (size!7363 a!3312)) mask!3809))))

(declare-fun lt!144823 () SeekEntryResult!2160)

(assert (=> b!292411 (= lt!144823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144821 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292411 (= lt!144821 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292412 () Bool)

(assert (=> b!292412 (= e!185008 e!185009)))

(declare-fun res!153468 () Bool)

(assert (=> b!292412 (=> (not res!153468) (not e!185009))))

(declare-fun lt!144820 () SeekEntryResult!2160)

(assert (=> b!292412 (= res!153468 (or (= lt!144820 (MissingZero!2160 i!1256)) (= lt!144820 (MissingVacant!2160 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14777 (_ BitVec 32)) SeekEntryResult!2160)

(assert (=> b!292412 (= lt!144820 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28598 res!153467) b!292408))

(assert (= (and b!292408 res!153466) b!292410))

(assert (= (and b!292410 res!153464) b!292409))

(assert (= (and b!292409 res!153463) b!292412))

(assert (= (and b!292412 res!153468) b!292407))

(assert (= (and b!292407 res!153465) b!292411))

(declare-fun m!306137 () Bool)

(assert (=> b!292411 m!306137))

(declare-fun m!306139 () Bool)

(assert (=> b!292411 m!306139))

(declare-fun m!306141 () Bool)

(assert (=> b!292411 m!306141))

(declare-fun m!306143 () Bool)

(assert (=> b!292411 m!306143))

(declare-fun m!306145 () Bool)

(assert (=> b!292410 m!306145))

(declare-fun m!306147 () Bool)

(assert (=> b!292407 m!306147))

(declare-fun m!306149 () Bool)

(assert (=> b!292409 m!306149))

(declare-fun m!306151 () Bool)

(assert (=> start!28598 m!306151))

(declare-fun m!306153 () Bool)

(assert (=> start!28598 m!306153))

(declare-fun m!306155 () Bool)

(assert (=> b!292412 m!306155))

(check-sat (not b!292409) (not b!292407) (not b!292411) (not start!28598) (not b!292410) (not b!292412))
(check-sat)
