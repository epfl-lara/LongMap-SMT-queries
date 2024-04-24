; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27856 () Bool)

(assert start!27856)

(declare-fun b!286604 () Bool)

(declare-fun res!148662 () Bool)

(declare-fun e!181587 () Bool)

(assert (=> b!286604 (=> (not res!148662) (not e!181587))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286604 (= res!148662 (validKeyInArray!0 k0!2524))))

(declare-fun b!286605 () Bool)

(declare-fun e!181588 () Bool)

(assert (=> b!286605 (= e!181587 e!181588)))

(declare-fun res!148658 () Bool)

(assert (=> b!286605 (=> (not res!148658) (not e!181588))))

(declare-datatypes ((SeekEntryResult!1922 0))(
  ( (MissingZero!1922 (index!9858 (_ BitVec 32))) (Found!1922 (index!9859 (_ BitVec 32))) (Intermediate!1922 (undefined!2734 Bool) (index!9860 (_ BitVec 32)) (x!28186 (_ BitVec 32))) (Undefined!1922) (MissingVacant!1922 (index!9861 (_ BitVec 32))) )
))
(declare-fun lt!141203 () SeekEntryResult!1922)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286605 (= res!148658 (or (= lt!141203 (MissingZero!1922 i!1256)) (= lt!141203 (MissingVacant!1922 i!1256))))))

(declare-datatypes ((array!14349 0))(
  ( (array!14350 (arr!6808 (Array (_ BitVec 32) (_ BitVec 64))) (size!7160 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14349)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14349 (_ BitVec 32)) SeekEntryResult!1922)

(assert (=> b!286605 (= lt!141203 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286606 () Bool)

(declare-fun res!148661 () Bool)

(assert (=> b!286606 (=> (not res!148661) (not e!181587))))

(assert (=> b!286606 (= res!148661 (and (= (size!7160 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7160 a!3312))))))

(declare-fun b!286607 () Bool)

(declare-fun res!148660 () Bool)

(assert (=> b!286607 (=> (not res!148660) (not e!181588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14349 (_ BitVec 32)) Bool)

(assert (=> b!286607 (= res!148660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286608 () Bool)

(declare-fun res!148657 () Bool)

(assert (=> b!286608 (=> (not res!148657) (not e!181587))))

(declare-fun arrayContainsKey!0 (array!14349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286608 (= res!148657 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148659 () Bool)

(assert (=> start!27856 (=> (not res!148659) (not e!181587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27856 (= res!148659 (validMask!0 mask!3809))))

(assert (=> start!27856 e!181587))

(assert (=> start!27856 true))

(declare-fun array_inv!4758 (array!14349) Bool)

(assert (=> start!27856 (array_inv!4758 a!3312)))

(declare-fun b!286609 () Bool)

(assert (=> b!286609 (= e!181588 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141204 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286609 (= lt!141204 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!27856 res!148659) b!286606))

(assert (= (and b!286606 res!148661) b!286604))

(assert (= (and b!286604 res!148662) b!286608))

(assert (= (and b!286608 res!148657) b!286605))

(assert (= (and b!286605 res!148658) b!286607))

(assert (= (and b!286607 res!148660) b!286609))

(declare-fun m!301409 () Bool)

(assert (=> b!286605 m!301409))

(declare-fun m!301411 () Bool)

(assert (=> b!286608 m!301411))

(declare-fun m!301413 () Bool)

(assert (=> b!286609 m!301413))

(declare-fun m!301415 () Bool)

(assert (=> start!27856 m!301415))

(declare-fun m!301417 () Bool)

(assert (=> start!27856 m!301417))

(declare-fun m!301419 () Bool)

(assert (=> b!286607 m!301419))

(declare-fun m!301421 () Bool)

(assert (=> b!286604 m!301421))

(check-sat (not b!286604) (not b!286608) (not b!286607) (not start!27856) (not b!286609) (not b!286605))
(check-sat)
