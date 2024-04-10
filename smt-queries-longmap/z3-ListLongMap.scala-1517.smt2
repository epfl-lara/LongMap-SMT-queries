; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28634 () Bool)

(assert start!28634)

(declare-fun b!292731 () Bool)

(declare-fun e!185170 () Bool)

(assert (=> b!292731 (= e!185170 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145038 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2178 0))(
  ( (MissingZero!2178 (index!10882 (_ BitVec 32))) (Found!2178 (index!10883 (_ BitVec 32))) (Intermediate!2178 (undefined!2990 Bool) (index!10884 (_ BitVec 32)) (x!29065 (_ BitVec 32))) (Undefined!2178) (MissingVacant!2178 (index!10885 (_ BitVec 32))) )
))
(declare-fun lt!145036 () SeekEntryResult!2178)

(declare-datatypes ((array!14813 0))(
  ( (array!14814 (arr!7029 (Array (_ BitVec 32) (_ BitVec 64))) (size!7381 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14813)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14813 (_ BitVec 32)) SeekEntryResult!2178)

(assert (=> b!292731 (= lt!145036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145038 k0!2524 (array!14814 (store (arr!7029 a!3312) i!1256 k0!2524) (size!7381 a!3312)) mask!3809))))

(declare-fun lt!145037 () SeekEntryResult!2178)

(assert (=> b!292731 (= lt!145037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145038 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292731 (= lt!145038 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153788 () Bool)

(declare-fun e!185171 () Bool)

(assert (=> start!28634 (=> (not res!153788) (not e!185171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28634 (= res!153788 (validMask!0 mask!3809))))

(assert (=> start!28634 e!185171))

(assert (=> start!28634 true))

(declare-fun array_inv!4992 (array!14813) Bool)

(assert (=> start!28634 (array_inv!4992 a!3312)))

(declare-fun b!292732 () Bool)

(declare-fun res!153791 () Bool)

(assert (=> b!292732 (=> (not res!153791) (not e!185171))))

(assert (=> b!292732 (= res!153791 (and (= (size!7381 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7381 a!3312))))))

(declare-fun b!292733 () Bool)

(declare-fun res!153790 () Bool)

(assert (=> b!292733 (=> (not res!153790) (not e!185170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14813 (_ BitVec 32)) Bool)

(assert (=> b!292733 (= res!153790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292734 () Bool)

(declare-fun res!153787 () Bool)

(assert (=> b!292734 (=> (not res!153787) (not e!185171))))

(declare-fun arrayContainsKey!0 (array!14813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292734 (= res!153787 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292735 () Bool)

(assert (=> b!292735 (= e!185171 e!185170)))

(declare-fun res!153789 () Bool)

(assert (=> b!292735 (=> (not res!153789) (not e!185170))))

(declare-fun lt!145039 () SeekEntryResult!2178)

(assert (=> b!292735 (= res!153789 (or (= lt!145039 (MissingZero!2178 i!1256)) (= lt!145039 (MissingVacant!2178 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14813 (_ BitVec 32)) SeekEntryResult!2178)

(assert (=> b!292735 (= lt!145039 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292736 () Bool)

(declare-fun res!153792 () Bool)

(assert (=> b!292736 (=> (not res!153792) (not e!185171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292736 (= res!153792 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28634 res!153788) b!292732))

(assert (= (and b!292732 res!153791) b!292736))

(assert (= (and b!292736 res!153792) b!292734))

(assert (= (and b!292734 res!153787) b!292735))

(assert (= (and b!292735 res!153789) b!292733))

(assert (= (and b!292733 res!153790) b!292731))

(declare-fun m!306497 () Bool)

(assert (=> b!292734 m!306497))

(declare-fun m!306499 () Bool)

(assert (=> b!292733 m!306499))

(declare-fun m!306501 () Bool)

(assert (=> b!292735 m!306501))

(declare-fun m!306503 () Bool)

(assert (=> b!292731 m!306503))

(declare-fun m!306505 () Bool)

(assert (=> b!292731 m!306505))

(declare-fun m!306507 () Bool)

(assert (=> b!292731 m!306507))

(declare-fun m!306509 () Bool)

(assert (=> b!292731 m!306509))

(declare-fun m!306511 () Bool)

(assert (=> start!28634 m!306511))

(declare-fun m!306513 () Bool)

(assert (=> start!28634 m!306513))

(declare-fun m!306515 () Bool)

(assert (=> b!292736 m!306515))

(check-sat (not b!292733) (not b!292731) (not start!28634) (not b!292736) (not b!292735) (not b!292734))
(check-sat)
