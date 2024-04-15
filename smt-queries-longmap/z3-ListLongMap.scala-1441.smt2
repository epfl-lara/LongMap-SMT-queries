; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27806 () Bool)

(assert start!27806)

(declare-fun b!286140 () Bool)

(declare-fun e!181310 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286140 (= e!181310 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun res!148344 () Bool)

(declare-fun e!181309 () Bool)

(assert (=> start!27806 (=> (not res!148344) (not e!181309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27806 (= res!148344 (validMask!0 mask!3809))))

(assert (=> start!27806 e!181309))

(assert (=> start!27806 true))

(declare-datatypes ((array!14320 0))(
  ( (array!14321 (arr!6795 (Array (_ BitVec 32) (_ BitVec 64))) (size!7148 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14320)

(declare-fun array_inv!4767 (array!14320) Bool)

(assert (=> start!27806 (array_inv!4767 a!3312)))

(declare-fun b!286141 () Bool)

(declare-fun res!148347 () Bool)

(assert (=> b!286141 (=> (not res!148347) (not e!181309))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286141 (= res!148347 (and (= (size!7148 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7148 a!3312))))))

(declare-fun b!286142 () Bool)

(assert (=> b!286142 (= e!181309 e!181310)))

(declare-fun res!148348 () Bool)

(assert (=> b!286142 (=> (not res!148348) (not e!181310))))

(declare-datatypes ((SeekEntryResult!1943 0))(
  ( (MissingZero!1943 (index!9942 (_ BitVec 32))) (Found!1943 (index!9943 (_ BitVec 32))) (Intermediate!1943 (undefined!2755 Bool) (index!9944 (_ BitVec 32)) (x!28182 (_ BitVec 32))) (Undefined!1943) (MissingVacant!1943 (index!9945 (_ BitVec 32))) )
))
(declare-fun lt!140871 () SeekEntryResult!1943)

(assert (=> b!286142 (= res!148348 (or (= lt!140871 (MissingZero!1943 i!1256)) (= lt!140871 (MissingVacant!1943 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14320 (_ BitVec 32)) SeekEntryResult!1943)

(assert (=> b!286142 (= lt!140871 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286143 () Bool)

(declare-fun res!148345 () Bool)

(assert (=> b!286143 (=> (not res!148345) (not e!181309))))

(declare-fun arrayContainsKey!0 (array!14320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286143 (= res!148345 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286144 () Bool)

(declare-fun res!148343 () Bool)

(assert (=> b!286144 (=> (not res!148343) (not e!181309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286144 (= res!148343 (validKeyInArray!0 k0!2524))))

(declare-fun b!286145 () Bool)

(declare-fun res!148346 () Bool)

(assert (=> b!286145 (=> (not res!148346) (not e!181310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14320 (_ BitVec 32)) Bool)

(assert (=> b!286145 (= res!148346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27806 res!148344) b!286141))

(assert (= (and b!286141 res!148347) b!286144))

(assert (= (and b!286144 res!148343) b!286143))

(assert (= (and b!286143 res!148345) b!286142))

(assert (= (and b!286142 res!148348) b!286145))

(assert (= (and b!286145 res!148346) b!286140))

(declare-fun m!300413 () Bool)

(assert (=> b!286145 m!300413))

(declare-fun m!300415 () Bool)

(assert (=> b!286143 m!300415))

(declare-fun m!300417 () Bool)

(assert (=> b!286144 m!300417))

(declare-fun m!300419 () Bool)

(assert (=> start!27806 m!300419))

(declare-fun m!300421 () Bool)

(assert (=> start!27806 m!300421))

(declare-fun m!300423 () Bool)

(assert (=> b!286142 m!300423))

(check-sat (not b!286145) (not start!27806) (not b!286144) (not b!286143) (not b!286142))
(check-sat)
