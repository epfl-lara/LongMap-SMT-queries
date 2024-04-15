; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27854 () Bool)

(assert start!27854)

(declare-fun b!286356 () Bool)

(declare-fun e!181436 () Bool)

(declare-fun e!181437 () Bool)

(assert (=> b!286356 (= e!181436 e!181437)))

(declare-fun res!148487 () Bool)

(assert (=> b!286356 (=> (not res!148487) (not e!181437))))

(declare-datatypes ((SeekEntryResult!1949 0))(
  ( (MissingZero!1949 (index!9966 (_ BitVec 32))) (Found!1949 (index!9967 (_ BitVec 32))) (Intermediate!1949 (undefined!2761 Bool) (index!9968 (_ BitVec 32)) (x!28204 (_ BitVec 32))) (Undefined!1949) (MissingVacant!1949 (index!9969 (_ BitVec 32))) )
))
(declare-fun lt!140945 () SeekEntryResult!1949)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286356 (= res!148487 (or (= lt!140945 (MissingZero!1949 i!1256)) (= lt!140945 (MissingVacant!1949 i!1256))))))

(declare-datatypes ((array!14335 0))(
  ( (array!14336 (arr!6801 (Array (_ BitVec 32) (_ BitVec 64))) (size!7154 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14335)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14335 (_ BitVec 32)) SeekEntryResult!1949)

(assert (=> b!286356 (= lt!140945 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148489 () Bool)

(assert (=> start!27854 (=> (not res!148489) (not e!181436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27854 (= res!148489 (validMask!0 mask!3809))))

(assert (=> start!27854 e!181436))

(assert (=> start!27854 true))

(declare-fun array_inv!4773 (array!14335) Bool)

(assert (=> start!27854 (array_inv!4773 a!3312)))

(declare-fun b!286357 () Bool)

(declare-fun res!148488 () Bool)

(assert (=> b!286357 (=> (not res!148488) (not e!181437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14335 (_ BitVec 32)) Bool)

(assert (=> b!286357 (= res!148488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286358 () Bool)

(declare-fun res!148490 () Bool)

(assert (=> b!286358 (=> (not res!148490) (not e!181436))))

(declare-fun arrayContainsKey!0 (array!14335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286358 (= res!148490 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286359 () Bool)

(declare-fun res!148491 () Bool)

(assert (=> b!286359 (=> (not res!148491) (not e!181436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286359 (= res!148491 (validKeyInArray!0 k0!2524))))

(declare-fun b!286360 () Bool)

(declare-fun res!148492 () Bool)

(assert (=> b!286360 (=> (not res!148492) (not e!181436))))

(assert (=> b!286360 (= res!148492 (and (= (size!7154 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7154 a!3312))))))

(declare-fun b!286361 () Bool)

(assert (=> b!286361 (= e!181437 false)))

(declare-fun lt!140946 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286361 (= lt!140946 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!27854 res!148489) b!286360))

(assert (= (and b!286360 res!148492) b!286359))

(assert (= (and b!286359 res!148491) b!286358))

(assert (= (and b!286358 res!148490) b!286356))

(assert (= (and b!286356 res!148487) b!286357))

(assert (= (and b!286357 res!148488) b!286361))

(declare-fun m!300569 () Bool)

(assert (=> b!286359 m!300569))

(declare-fun m!300571 () Bool)

(assert (=> b!286361 m!300571))

(declare-fun m!300573 () Bool)

(assert (=> b!286357 m!300573))

(declare-fun m!300575 () Bool)

(assert (=> start!27854 m!300575))

(declare-fun m!300577 () Bool)

(assert (=> start!27854 m!300577))

(declare-fun m!300579 () Bool)

(assert (=> b!286356 m!300579))

(declare-fun m!300581 () Bool)

(assert (=> b!286358 m!300581))

(check-sat (not b!286361) (not b!286356) (not start!27854) (not b!286357) (not b!286358) (not b!286359))
(check-sat)
