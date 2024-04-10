; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27812 () Bool)

(assert start!27812)

(declare-fun res!148460 () Bool)

(declare-fun e!181421 () Bool)

(assert (=> start!27812 (=> (not res!148460) (not e!181421))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27812 (= res!148460 (validMask!0 mask!3809))))

(assert (=> start!27812 e!181421))

(assert (=> start!27812 true))

(declare-datatypes ((array!14333 0))(
  ( (array!14334 (arr!6801 (Array (_ BitVec 32) (_ BitVec 64))) (size!7153 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14333)

(declare-fun array_inv!4764 (array!14333) Bool)

(assert (=> start!27812 (array_inv!4764 a!3312)))

(declare-fun b!286305 () Bool)

(declare-fun res!148459 () Bool)

(assert (=> b!286305 (=> (not res!148459) (not e!181421))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286305 (= res!148459 (validKeyInArray!0 k0!2524))))

(declare-fun b!286306 () Bool)

(declare-fun res!148456 () Bool)

(assert (=> b!286306 (=> (not res!148456) (not e!181421))))

(declare-fun arrayContainsKey!0 (array!14333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286306 (= res!148456 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286307 () Bool)

(declare-fun res!148458 () Bool)

(assert (=> b!286307 (=> (not res!148458) (not e!181421))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286307 (= res!148458 (and (= (size!7153 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7153 a!3312))))))

(declare-fun b!286308 () Bool)

(declare-fun e!181419 () Bool)

(assert (=> b!286308 (= e!181419 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!286309 () Bool)

(declare-fun res!148457 () Bool)

(assert (=> b!286309 (=> (not res!148457) (not e!181419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14333 (_ BitVec 32)) Bool)

(assert (=> b!286309 (= res!148457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286310 () Bool)

(assert (=> b!286310 (= e!181421 e!181419)))

(declare-fun res!148461 () Bool)

(assert (=> b!286310 (=> (not res!148461) (not e!181419))))

(declare-datatypes ((SeekEntryResult!1950 0))(
  ( (MissingZero!1950 (index!9970 (_ BitVec 32))) (Found!1950 (index!9971 (_ BitVec 32))) (Intermediate!1950 (undefined!2762 Bool) (index!9972 (_ BitVec 32)) (x!28190 (_ BitVec 32))) (Undefined!1950) (MissingVacant!1950 (index!9973 (_ BitVec 32))) )
))
(declare-fun lt!141055 () SeekEntryResult!1950)

(assert (=> b!286310 (= res!148461 (or (= lt!141055 (MissingZero!1950 i!1256)) (= lt!141055 (MissingVacant!1950 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14333 (_ BitVec 32)) SeekEntryResult!1950)

(assert (=> b!286310 (= lt!141055 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!27812 res!148460) b!286307))

(assert (= (and b!286307 res!148458) b!286305))

(assert (= (and b!286305 res!148459) b!286306))

(assert (= (and b!286306 res!148456) b!286310))

(assert (= (and b!286310 res!148461) b!286309))

(assert (= (and b!286309 res!148457) b!286308))

(declare-fun m!301017 () Bool)

(assert (=> b!286309 m!301017))

(declare-fun m!301019 () Bool)

(assert (=> b!286310 m!301019))

(declare-fun m!301021 () Bool)

(assert (=> b!286306 m!301021))

(declare-fun m!301023 () Bool)

(assert (=> start!27812 m!301023))

(declare-fun m!301025 () Bool)

(assert (=> start!27812 m!301025))

(declare-fun m!301027 () Bool)

(assert (=> b!286305 m!301027))

(check-sat (not b!286310) (not b!286309) (not b!286305) (not start!27812) (not b!286306))
(check-sat)
