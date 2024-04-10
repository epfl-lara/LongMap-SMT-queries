; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27938 () Bool)

(assert start!27938)

(declare-fun res!148963 () Bool)

(declare-fun e!181781 () Bool)

(assert (=> start!27938 (=> (not res!148963) (not e!181781))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27938 (= res!148963 (validMask!0 mask!3809))))

(assert (=> start!27938 e!181781))

(assert (=> start!27938 true))

(declare-datatypes ((array!14387 0))(
  ( (array!14388 (arr!6825 (Array (_ BitVec 32) (_ BitVec 64))) (size!7177 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14387)

(declare-fun array_inv!4788 (array!14387) Bool)

(assert (=> start!27938 (array_inv!4788 a!3312)))

(declare-fun b!286953 () Bool)

(declare-fun e!181779 () Bool)

(assert (=> b!286953 (= e!181781 e!181779)))

(declare-fun res!148964 () Bool)

(assert (=> b!286953 (=> (not res!148964) (not e!181779))))

(declare-datatypes ((SeekEntryResult!1974 0))(
  ( (MissingZero!1974 (index!10066 (_ BitVec 32))) (Found!1974 (index!10067 (_ BitVec 32))) (Intermediate!1974 (undefined!2786 Bool) (index!10068 (_ BitVec 32)) (x!28281 (_ BitVec 32))) (Undefined!1974) (MissingVacant!1974 (index!10069 (_ BitVec 32))) )
))
(declare-fun lt!141312 () SeekEntryResult!1974)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286953 (= res!148964 (or (= lt!141312 (MissingZero!1974 i!1256)) (= lt!141312 (MissingVacant!1974 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14387 (_ BitVec 32)) SeekEntryResult!1974)

(assert (=> b!286953 (= lt!141312 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286954 () Bool)

(declare-fun res!148966 () Bool)

(assert (=> b!286954 (=> (not res!148966) (not e!181781))))

(assert (=> b!286954 (= res!148966 (and (= (size!7177 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7177 a!3312))))))

(declare-fun b!286955 () Bool)

(declare-fun res!148965 () Bool)

(assert (=> b!286955 (=> (not res!148965) (not e!181781))))

(declare-fun arrayContainsKey!0 (array!14387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286955 (= res!148965 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286956 () Bool)

(declare-fun res!148968 () Bool)

(assert (=> b!286956 (=> (not res!148968) (not e!181779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14387 (_ BitVec 32)) Bool)

(assert (=> b!286956 (= res!148968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286957 () Bool)

(assert (=> b!286957 (= e!181779 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141313 () SeekEntryResult!1974)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14387 (_ BitVec 32)) SeekEntryResult!1974)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286957 (= lt!141313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!286958 () Bool)

(declare-fun res!148967 () Bool)

(assert (=> b!286958 (=> (not res!148967) (not e!181781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286958 (= res!148967 (validKeyInArray!0 k0!2524))))

(assert (= (and start!27938 res!148963) b!286954))

(assert (= (and b!286954 res!148966) b!286958))

(assert (= (and b!286958 res!148967) b!286955))

(assert (= (and b!286955 res!148965) b!286953))

(assert (= (and b!286953 res!148964) b!286956))

(assert (= (and b!286956 res!148968) b!286957))

(declare-fun m!301507 () Bool)

(assert (=> b!286953 m!301507))

(declare-fun m!301509 () Bool)

(assert (=> b!286958 m!301509))

(declare-fun m!301511 () Bool)

(assert (=> b!286955 m!301511))

(declare-fun m!301513 () Bool)

(assert (=> b!286957 m!301513))

(assert (=> b!286957 m!301513))

(declare-fun m!301515 () Bool)

(assert (=> b!286957 m!301515))

(declare-fun m!301517 () Bool)

(assert (=> b!286956 m!301517))

(declare-fun m!301519 () Bool)

(assert (=> start!27938 m!301519))

(declare-fun m!301521 () Bool)

(assert (=> start!27938 m!301521))

(check-sat (not start!27938) (not b!286953) (not b!286958) (not b!286957) (not b!286956) (not b!286955))
(check-sat)
