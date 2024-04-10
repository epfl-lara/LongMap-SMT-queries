; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27932 () Bool)

(assert start!27932)

(declare-fun res!148910 () Bool)

(declare-fun e!181752 () Bool)

(assert (=> start!27932 (=> (not res!148910) (not e!181752))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27932 (= res!148910 (validMask!0 mask!3809))))

(assert (=> start!27932 e!181752))

(assert (=> start!27932 true))

(declare-datatypes ((array!14381 0))(
  ( (array!14382 (arr!6822 (Array (_ BitVec 32) (_ BitVec 64))) (size!7174 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14381)

(declare-fun array_inv!4785 (array!14381) Bool)

(assert (=> start!27932 (array_inv!4785 a!3312)))

(declare-fun b!286899 () Bool)

(declare-fun res!148913 () Bool)

(declare-fun e!181753 () Bool)

(assert (=> b!286899 (=> (not res!148913) (not e!181753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14381 (_ BitVec 32)) Bool)

(assert (=> b!286899 (= res!148913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286900 () Bool)

(assert (=> b!286900 (= e!181752 e!181753)))

(declare-fun res!148914 () Bool)

(assert (=> b!286900 (=> (not res!148914) (not e!181753))))

(declare-datatypes ((SeekEntryResult!1971 0))(
  ( (MissingZero!1971 (index!10054 (_ BitVec 32))) (Found!1971 (index!10055 (_ BitVec 32))) (Intermediate!1971 (undefined!2783 Bool) (index!10056 (_ BitVec 32)) (x!28270 (_ BitVec 32))) (Undefined!1971) (MissingVacant!1971 (index!10057 (_ BitVec 32))) )
))
(declare-fun lt!141295 () SeekEntryResult!1971)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286900 (= res!148914 (or (= lt!141295 (MissingZero!1971 i!1256)) (= lt!141295 (MissingVacant!1971 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14381 (_ BitVec 32)) SeekEntryResult!1971)

(assert (=> b!286900 (= lt!141295 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286901 () Bool)

(declare-fun res!148911 () Bool)

(assert (=> b!286901 (=> (not res!148911) (not e!181752))))

(declare-fun arrayContainsKey!0 (array!14381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286901 (= res!148911 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286902 () Bool)

(assert (=> b!286902 (= e!181753 false)))

(declare-fun lt!141294 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286902 (= lt!141294 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286903 () Bool)

(declare-fun res!148912 () Bool)

(assert (=> b!286903 (=> (not res!148912) (not e!181752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286903 (= res!148912 (validKeyInArray!0 k0!2524))))

(declare-fun b!286904 () Bool)

(declare-fun res!148909 () Bool)

(assert (=> b!286904 (=> (not res!148909) (not e!181752))))

(assert (=> b!286904 (= res!148909 (and (= (size!7174 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7174 a!3312))))))

(assert (= (and start!27932 res!148910) b!286904))

(assert (= (and b!286904 res!148909) b!286903))

(assert (= (and b!286903 res!148912) b!286901))

(assert (= (and b!286901 res!148911) b!286900))

(assert (= (and b!286900 res!148914) b!286899))

(assert (= (and b!286899 res!148913) b!286902))

(declare-fun m!301463 () Bool)

(assert (=> b!286901 m!301463))

(declare-fun m!301465 () Bool)

(assert (=> b!286903 m!301465))

(declare-fun m!301467 () Bool)

(assert (=> b!286899 m!301467))

(declare-fun m!301469 () Bool)

(assert (=> b!286900 m!301469))

(declare-fun m!301471 () Bool)

(assert (=> start!27932 m!301471))

(declare-fun m!301473 () Bool)

(assert (=> start!27932 m!301473))

(declare-fun m!301475 () Bool)

(assert (=> b!286902 m!301475))

(check-sat (not start!27932) (not b!286900) (not b!286903) (not b!286901) (not b!286899) (not b!286902))
(check-sat)
