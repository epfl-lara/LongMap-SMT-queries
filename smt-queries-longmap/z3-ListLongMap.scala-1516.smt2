; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28628 () Bool)

(assert start!28628)

(declare-fun b!292677 () Bool)

(declare-fun res!153737 () Bool)

(declare-fun e!185142 () Bool)

(assert (=> b!292677 (=> (not res!153737) (not e!185142))))

(declare-datatypes ((array!14807 0))(
  ( (array!14808 (arr!7026 (Array (_ BitVec 32) (_ BitVec 64))) (size!7378 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14807)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14807 (_ BitVec 32)) Bool)

(assert (=> b!292677 (= res!153737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292678 () Bool)

(declare-fun res!153735 () Bool)

(declare-fun e!185144 () Bool)

(assert (=> b!292678 (=> (not res!153735) (not e!185144))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292678 (= res!153735 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292679 () Bool)

(declare-fun res!153738 () Bool)

(assert (=> b!292679 (=> (not res!153738) (not e!185144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292679 (= res!153738 (validKeyInArray!0 k0!2524))))

(declare-fun b!292680 () Bool)

(declare-fun res!153736 () Bool)

(assert (=> b!292680 (=> (not res!153736) (not e!185144))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292680 (= res!153736 (and (= (size!7378 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7378 a!3312))))))

(declare-fun res!153733 () Bool)

(assert (=> start!28628 (=> (not res!153733) (not e!185144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28628 (= res!153733 (validMask!0 mask!3809))))

(assert (=> start!28628 e!185144))

(assert (=> start!28628 true))

(declare-fun array_inv!4989 (array!14807) Bool)

(assert (=> start!28628 (array_inv!4989 a!3312)))

(declare-fun b!292681 () Bool)

(assert (=> b!292681 (= e!185144 e!185142)))

(declare-fun res!153734 () Bool)

(assert (=> b!292681 (=> (not res!153734) (not e!185142))))

(declare-datatypes ((SeekEntryResult!2175 0))(
  ( (MissingZero!2175 (index!10870 (_ BitVec 32))) (Found!2175 (index!10871 (_ BitVec 32))) (Intermediate!2175 (undefined!2987 Bool) (index!10872 (_ BitVec 32)) (x!29054 (_ BitVec 32))) (Undefined!2175) (MissingVacant!2175 (index!10873 (_ BitVec 32))) )
))
(declare-fun lt!145003 () SeekEntryResult!2175)

(assert (=> b!292681 (= res!153734 (or (= lt!145003 (MissingZero!2175 i!1256)) (= lt!145003 (MissingVacant!2175 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14807 (_ BitVec 32)) SeekEntryResult!2175)

(assert (=> b!292681 (= lt!145003 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292682 () Bool)

(assert (=> b!292682 (= e!185142 false)))

(declare-fun lt!145000 () (_ BitVec 32))

(declare-fun lt!145002 () SeekEntryResult!2175)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14807 (_ BitVec 32)) SeekEntryResult!2175)

(assert (=> b!292682 (= lt!145002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145000 k0!2524 (array!14808 (store (arr!7026 a!3312) i!1256 k0!2524) (size!7378 a!3312)) mask!3809))))

(declare-fun lt!145001 () SeekEntryResult!2175)

(assert (=> b!292682 (= lt!145001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145000 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292682 (= lt!145000 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28628 res!153733) b!292680))

(assert (= (and b!292680 res!153736) b!292679))

(assert (= (and b!292679 res!153738) b!292678))

(assert (= (and b!292678 res!153735) b!292681))

(assert (= (and b!292681 res!153734) b!292677))

(assert (= (and b!292677 res!153737) b!292682))

(declare-fun m!306437 () Bool)

(assert (=> b!292682 m!306437))

(declare-fun m!306439 () Bool)

(assert (=> b!292682 m!306439))

(declare-fun m!306441 () Bool)

(assert (=> b!292682 m!306441))

(declare-fun m!306443 () Bool)

(assert (=> b!292682 m!306443))

(declare-fun m!306445 () Bool)

(assert (=> b!292681 m!306445))

(declare-fun m!306447 () Bool)

(assert (=> b!292678 m!306447))

(declare-fun m!306449 () Bool)

(assert (=> start!28628 m!306449))

(declare-fun m!306451 () Bool)

(assert (=> start!28628 m!306451))

(declare-fun m!306453 () Bool)

(assert (=> b!292679 m!306453))

(declare-fun m!306455 () Bool)

(assert (=> b!292677 m!306455))

(check-sat (not b!292682) (not start!28628) (not b!292678) (not b!292679) (not b!292681) (not b!292677))
(check-sat)
