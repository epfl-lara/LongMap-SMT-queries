; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27860 () Bool)

(assert start!27860)

(declare-fun b!286410 () Bool)

(declare-fun res!148544 () Bool)

(declare-fun e!181462 () Bool)

(assert (=> b!286410 (=> (not res!148544) (not e!181462))))

(declare-datatypes ((array!14341 0))(
  ( (array!14342 (arr!6804 (Array (_ BitVec 32) (_ BitVec 64))) (size!7157 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14341)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286410 (= res!148544 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286411 () Bool)

(declare-fun e!181464 () Bool)

(assert (=> b!286411 (= e!181462 e!181464)))

(declare-fun res!148546 () Bool)

(assert (=> b!286411 (=> (not res!148546) (not e!181464))))

(declare-datatypes ((SeekEntryResult!1952 0))(
  ( (MissingZero!1952 (index!9978 (_ BitVec 32))) (Found!1952 (index!9979 (_ BitVec 32))) (Intermediate!1952 (undefined!2764 Bool) (index!9980 (_ BitVec 32)) (x!28215 (_ BitVec 32))) (Undefined!1952) (MissingVacant!1952 (index!9981 (_ BitVec 32))) )
))
(declare-fun lt!140963 () SeekEntryResult!1952)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286411 (= res!148546 (or (= lt!140963 (MissingZero!1952 i!1256)) (= lt!140963 (MissingVacant!1952 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14341 (_ BitVec 32)) SeekEntryResult!1952)

(assert (=> b!286411 (= lt!140963 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286413 () Bool)

(assert (=> b!286413 (= e!181464 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!140964 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286413 (= lt!140964 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286414 () Bool)

(declare-fun res!148542 () Bool)

(assert (=> b!286414 (=> (not res!148542) (not e!181462))))

(assert (=> b!286414 (= res!148542 (and (= (size!7157 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7157 a!3312))))))

(declare-fun b!286415 () Bool)

(declare-fun res!148543 () Bool)

(assert (=> b!286415 (=> (not res!148543) (not e!181464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14341 (_ BitVec 32)) Bool)

(assert (=> b!286415 (= res!148543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148541 () Bool)

(assert (=> start!27860 (=> (not res!148541) (not e!181462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27860 (= res!148541 (validMask!0 mask!3809))))

(assert (=> start!27860 e!181462))

(assert (=> start!27860 true))

(declare-fun array_inv!4776 (array!14341) Bool)

(assert (=> start!27860 (array_inv!4776 a!3312)))

(declare-fun b!286412 () Bool)

(declare-fun res!148545 () Bool)

(assert (=> b!286412 (=> (not res!148545) (not e!181462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286412 (= res!148545 (validKeyInArray!0 k0!2524))))

(assert (= (and start!27860 res!148541) b!286414))

(assert (= (and b!286414 res!148542) b!286412))

(assert (= (and b!286412 res!148545) b!286410))

(assert (= (and b!286410 res!148544) b!286411))

(assert (= (and b!286411 res!148546) b!286415))

(assert (= (and b!286415 res!148543) b!286413))

(declare-fun m!300611 () Bool)

(assert (=> b!286415 m!300611))

(declare-fun m!300613 () Bool)

(assert (=> start!27860 m!300613))

(declare-fun m!300615 () Bool)

(assert (=> start!27860 m!300615))

(declare-fun m!300617 () Bool)

(assert (=> b!286410 m!300617))

(declare-fun m!300619 () Bool)

(assert (=> b!286411 m!300619))

(declare-fun m!300621 () Bool)

(assert (=> b!286413 m!300621))

(declare-fun m!300623 () Bool)

(assert (=> b!286412 m!300623))

(check-sat (not b!286410) (not b!286412) (not b!286415) (not b!286413) (not start!27860) (not b!286411))
(check-sat)
