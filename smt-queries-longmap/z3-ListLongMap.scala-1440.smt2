; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27796 () Bool)

(assert start!27796)

(declare-datatypes ((SeekEntryResult!1910 0))(
  ( (MissingZero!1910 (index!9810 (_ BitVec 32))) (Found!1910 (index!9811 (_ BitVec 32))) (Intermediate!1910 (undefined!2722 Bool) (index!9812 (_ BitVec 32)) (x!28142 (_ BitVec 32))) (Undefined!1910) (MissingVacant!1910 (index!9813 (_ BitVec 32))) )
))
(declare-fun lt!141102 () SeekEntryResult!1910)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun b!286297 () Bool)

(declare-datatypes ((array!14322 0))(
  ( (array!14323 (arr!6796 (Array (_ BitVec 32) (_ BitVec 64))) (size!7148 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14322)

(declare-fun e!181414 () Bool)

(assert (=> b!286297 (= e!181414 (and (or (= lt!141102 (MissingZero!1910 i!1256)) (= lt!141102 (MissingVacant!1910 i!1256))) (bvsgt #b00000000000000000000000000000000 (size!7148 a!3312))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14322 (_ BitVec 32)) SeekEntryResult!1910)

(assert (=> b!286297 (= lt!141102 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286295 () Bool)

(declare-fun res!148421 () Bool)

(assert (=> b!286295 (=> (not res!148421) (not e!181414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286295 (= res!148421 (validKeyInArray!0 k0!2524))))

(declare-fun b!286296 () Bool)

(declare-fun res!148420 () Bool)

(assert (=> b!286296 (=> (not res!148420) (not e!181414))))

(declare-fun arrayContainsKey!0 (array!14322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286296 (= res!148420 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148419 () Bool)

(assert (=> start!27796 (=> (not res!148419) (not e!181414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27796 (= res!148419 (validMask!0 mask!3809))))

(assert (=> start!27796 e!181414))

(assert (=> start!27796 true))

(declare-fun array_inv!4746 (array!14322) Bool)

(assert (=> start!27796 (array_inv!4746 a!3312)))

(declare-fun b!286294 () Bool)

(declare-fun res!148422 () Bool)

(assert (=> b!286294 (=> (not res!148422) (not e!181414))))

(assert (=> b!286294 (= res!148422 (and (= (size!7148 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7148 a!3312))))))

(assert (= (and start!27796 res!148419) b!286294))

(assert (= (and b!286294 res!148422) b!286295))

(assert (= (and b!286295 res!148421) b!286296))

(assert (= (and b!286296 res!148420) b!286297))

(declare-fun m!301181 () Bool)

(assert (=> b!286297 m!301181))

(declare-fun m!301183 () Bool)

(assert (=> b!286295 m!301183))

(declare-fun m!301185 () Bool)

(assert (=> b!286296 m!301185))

(declare-fun m!301187 () Bool)

(assert (=> start!27796 m!301187))

(declare-fun m!301189 () Bool)

(assert (=> start!27796 m!301189))

(check-sat (not b!286297) (not b!286295) (not b!286296) (not start!27796))
(check-sat)
