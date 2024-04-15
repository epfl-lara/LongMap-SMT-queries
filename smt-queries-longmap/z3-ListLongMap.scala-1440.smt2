; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27800 () Bool)

(assert start!27800)

(declare-fun b!286101 () Bool)

(declare-fun res!148303 () Bool)

(declare-fun e!181290 () Bool)

(assert (=> b!286101 (=> (not res!148303) (not e!181290))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286101 (= res!148303 (validKeyInArray!0 k0!2524))))

(declare-fun b!286103 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14314 0))(
  ( (array!14315 (arr!6792 (Array (_ BitVec 32) (_ BitVec 64))) (size!7145 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14314)

(declare-datatypes ((SeekEntryResult!1940 0))(
  ( (MissingZero!1940 (index!9930 (_ BitVec 32))) (Found!1940 (index!9931 (_ BitVec 32))) (Intermediate!1940 (undefined!2752 Bool) (index!9932 (_ BitVec 32)) (x!28171 (_ BitVec 32))) (Undefined!1940) (MissingVacant!1940 (index!9933 (_ BitVec 32))) )
))
(declare-fun lt!140862 () SeekEntryResult!1940)

(assert (=> b!286103 (= e!181290 (and (or (= lt!140862 (MissingZero!1940 i!1256)) (= lt!140862 (MissingVacant!1940 i!1256))) (bvsgt #b00000000000000000000000000000000 (size!7145 a!3312))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14314 (_ BitVec 32)) SeekEntryResult!1940)

(assert (=> b!286103 (= lt!140862 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148305 () Bool)

(assert (=> start!27800 (=> (not res!148305) (not e!181290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27800 (= res!148305 (validMask!0 mask!3809))))

(assert (=> start!27800 e!181290))

(assert (=> start!27800 true))

(declare-fun array_inv!4764 (array!14314) Bool)

(assert (=> start!27800 (array_inv!4764 a!3312)))

(declare-fun b!286100 () Bool)

(declare-fun res!148306 () Bool)

(assert (=> b!286100 (=> (not res!148306) (not e!181290))))

(assert (=> b!286100 (= res!148306 (and (= (size!7145 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7145 a!3312))))))

(declare-fun b!286102 () Bool)

(declare-fun res!148304 () Bool)

(assert (=> b!286102 (=> (not res!148304) (not e!181290))))

(declare-fun arrayContainsKey!0 (array!14314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286102 (= res!148304 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27800 res!148305) b!286100))

(assert (= (and b!286100 res!148306) b!286101))

(assert (= (and b!286101 res!148303) b!286102))

(assert (= (and b!286102 res!148304) b!286103))

(declare-fun m!300383 () Bool)

(assert (=> b!286101 m!300383))

(declare-fun m!300385 () Bool)

(assert (=> b!286103 m!300385))

(declare-fun m!300387 () Bool)

(assert (=> start!27800 m!300387))

(declare-fun m!300389 () Bool)

(assert (=> start!27800 m!300389))

(declare-fun m!300391 () Bool)

(assert (=> b!286102 m!300391))

(check-sat (not b!286102) (not start!27800) (not b!286103) (not b!286101))
(check-sat)
