; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27866 () Bool)

(assert start!27866)

(declare-fun res!148657 () Bool)

(declare-fun e!181573 () Bool)

(assert (=> start!27866 (=> (not res!148657) (not e!181573))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27866 (= res!148657 (validMask!0 mask!3809))))

(assert (=> start!27866 e!181573))

(assert (=> start!27866 true))

(declare-datatypes ((array!14354 0))(
  ( (array!14355 (arr!6810 (Array (_ BitVec 32) (_ BitVec 64))) (size!7162 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14354)

(declare-fun array_inv!4773 (array!14354) Bool)

(assert (=> start!27866 (array_inv!4773 a!3312)))

(declare-fun b!286575 () Bool)

(declare-fun res!148656 () Bool)

(assert (=> b!286575 (=> (not res!148656) (not e!181573))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286575 (= res!148656 (and (= (size!7162 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7162 a!3312))))))

(declare-fun b!286576 () Bool)

(declare-fun res!148659 () Bool)

(assert (=> b!286576 (=> (not res!148659) (not e!181573))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286576 (= res!148659 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286577 () Bool)

(declare-fun e!181574 () Bool)

(assert (=> b!286577 (= e!181573 e!181574)))

(declare-fun res!148655 () Bool)

(assert (=> b!286577 (=> (not res!148655) (not e!181574))))

(declare-datatypes ((SeekEntryResult!1959 0))(
  ( (MissingZero!1959 (index!10006 (_ BitVec 32))) (Found!1959 (index!10007 (_ BitVec 32))) (Intermediate!1959 (undefined!2771 Bool) (index!10008 (_ BitVec 32)) (x!28223 (_ BitVec 32))) (Undefined!1959) (MissingVacant!1959 (index!10009 (_ BitVec 32))) )
))
(declare-fun lt!141150 () SeekEntryResult!1959)

(assert (=> b!286577 (= res!148655 (or (= lt!141150 (MissingZero!1959 i!1256)) (= lt!141150 (MissingVacant!1959 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14354 (_ BitVec 32)) SeekEntryResult!1959)

(assert (=> b!286577 (= lt!141150 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286578 () Bool)

(assert (=> b!286578 (= e!181574 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141151 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286578 (= lt!141151 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286579 () Bool)

(declare-fun res!148658 () Bool)

(assert (=> b!286579 (=> (not res!148658) (not e!181573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286579 (= res!148658 (validKeyInArray!0 k0!2524))))

(declare-fun b!286580 () Bool)

(declare-fun res!148654 () Bool)

(assert (=> b!286580 (=> (not res!148654) (not e!181574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14354 (_ BitVec 32)) Bool)

(assert (=> b!286580 (= res!148654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27866 res!148657) b!286575))

(assert (= (and b!286575 res!148656) b!286579))

(assert (= (and b!286579 res!148658) b!286576))

(assert (= (and b!286576 res!148659) b!286577))

(assert (= (and b!286577 res!148655) b!286580))

(assert (= (and b!286580 res!148654) b!286578))

(declare-fun m!301217 () Bool)

(assert (=> b!286580 m!301217))

(declare-fun m!301219 () Bool)

(assert (=> start!27866 m!301219))

(declare-fun m!301221 () Bool)

(assert (=> start!27866 m!301221))

(declare-fun m!301223 () Bool)

(assert (=> b!286576 m!301223))

(declare-fun m!301225 () Bool)

(assert (=> b!286579 m!301225))

(declare-fun m!301227 () Bool)

(assert (=> b!286577 m!301227))

(declare-fun m!301229 () Bool)

(assert (=> b!286578 m!301229))

(check-sat (not b!286580) (not b!286578) (not b!286576) (not start!27866) (not b!286577) (not b!286579))
(check-sat)
