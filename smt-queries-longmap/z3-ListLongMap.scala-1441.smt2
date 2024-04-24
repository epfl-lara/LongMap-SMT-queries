; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27802 () Bool)

(assert start!27802)

(declare-fun b!286334 () Bool)

(declare-fun res!148462 () Bool)

(declare-fun e!181435 () Bool)

(assert (=> b!286334 (=> (not res!148462) (not e!181435))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14328 0))(
  ( (array!14329 (arr!6799 (Array (_ BitVec 32) (_ BitVec 64))) (size!7151 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14328)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286334 (= res!148462 (and (= (size!7151 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7151 a!3312))))))

(declare-fun res!148463 () Bool)

(assert (=> start!27802 (=> (not res!148463) (not e!181435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27802 (= res!148463 (validMask!0 mask!3809))))

(assert (=> start!27802 e!181435))

(assert (=> start!27802 true))

(declare-fun array_inv!4749 (array!14328) Bool)

(assert (=> start!27802 (array_inv!4749 a!3312)))

(declare-fun b!286335 () Bool)

(declare-fun e!181434 () Bool)

(assert (=> b!286335 (= e!181434 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!286336 () Bool)

(declare-fun res!148459 () Bool)

(assert (=> b!286336 (=> (not res!148459) (not e!181435))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286336 (= res!148459 (validKeyInArray!0 k0!2524))))

(declare-fun b!286337 () Bool)

(assert (=> b!286337 (= e!181435 e!181434)))

(declare-fun res!148461 () Bool)

(assert (=> b!286337 (=> (not res!148461) (not e!181434))))

(declare-datatypes ((SeekEntryResult!1913 0))(
  ( (MissingZero!1913 (index!9822 (_ BitVec 32))) (Found!1913 (index!9823 (_ BitVec 32))) (Intermediate!1913 (undefined!2725 Bool) (index!9824 (_ BitVec 32)) (x!28153 (_ BitVec 32))) (Undefined!1913) (MissingVacant!1913 (index!9825 (_ BitVec 32))) )
))
(declare-fun lt!141111 () SeekEntryResult!1913)

(assert (=> b!286337 (= res!148461 (or (= lt!141111 (MissingZero!1913 i!1256)) (= lt!141111 (MissingVacant!1913 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14328 (_ BitVec 32)) SeekEntryResult!1913)

(assert (=> b!286337 (= lt!141111 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286338 () Bool)

(declare-fun res!148464 () Bool)

(assert (=> b!286338 (=> (not res!148464) (not e!181434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14328 (_ BitVec 32)) Bool)

(assert (=> b!286338 (= res!148464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286339 () Bool)

(declare-fun res!148460 () Bool)

(assert (=> b!286339 (=> (not res!148460) (not e!181435))))

(declare-fun arrayContainsKey!0 (array!14328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286339 (= res!148460 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27802 res!148463) b!286334))

(assert (= (and b!286334 res!148462) b!286336))

(assert (= (and b!286336 res!148459) b!286339))

(assert (= (and b!286339 res!148460) b!286337))

(assert (= (and b!286337 res!148461) b!286338))

(assert (= (and b!286338 res!148464) b!286335))

(declare-fun m!301211 () Bool)

(assert (=> start!27802 m!301211))

(declare-fun m!301213 () Bool)

(assert (=> start!27802 m!301213))

(declare-fun m!301215 () Bool)

(assert (=> b!286336 m!301215))

(declare-fun m!301217 () Bool)

(assert (=> b!286339 m!301217))

(declare-fun m!301219 () Bool)

(assert (=> b!286337 m!301219))

(declare-fun m!301221 () Bool)

(assert (=> b!286338 m!301221))

(check-sat (not b!286339) (not start!27802) (not b!286338) (not b!286337) (not b!286336))
(check-sat)
