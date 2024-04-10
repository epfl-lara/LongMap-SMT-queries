; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27788 () Bool)

(assert start!27788)

(declare-fun b!286154 () Bool)

(declare-fun e!181342 () Bool)

(assert (=> b!286154 (= e!181342 false)))

(declare-datatypes ((array!14309 0))(
  ( (array!14310 (arr!6789 (Array (_ BitVec 32) (_ BitVec 64))) (size!7141 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14309)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1938 0))(
  ( (MissingZero!1938 (index!9922 (_ BitVec 32))) (Found!1938 (index!9923 (_ BitVec 32))) (Intermediate!1938 (undefined!2750 Bool) (index!9924 (_ BitVec 32)) (x!28146 (_ BitVec 32))) (Undefined!1938) (MissingVacant!1938 (index!9925 (_ BitVec 32))) )
))
(declare-fun lt!141019 () SeekEntryResult!1938)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14309 (_ BitVec 32)) SeekEntryResult!1938)

(assert (=> b!286154 (= lt!141019 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148302 () Bool)

(assert (=> start!27788 (=> (not res!148302) (not e!181342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27788 (= res!148302 (validMask!0 mask!3809))))

(assert (=> start!27788 e!181342))

(assert (=> start!27788 true))

(declare-fun array_inv!4752 (array!14309) Bool)

(assert (=> start!27788 (array_inv!4752 a!3312)))

(declare-fun b!286152 () Bool)

(declare-fun res!148303 () Bool)

(assert (=> b!286152 (=> (not res!148303) (not e!181342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286152 (= res!148303 (validKeyInArray!0 k0!2524))))

(declare-fun b!286151 () Bool)

(declare-fun res!148305 () Bool)

(assert (=> b!286151 (=> (not res!148305) (not e!181342))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286151 (= res!148305 (and (= (size!7141 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7141 a!3312))))))

(declare-fun b!286153 () Bool)

(declare-fun res!148304 () Bool)

(assert (=> b!286153 (=> (not res!148304) (not e!181342))))

(declare-fun arrayContainsKey!0 (array!14309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286153 (= res!148304 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27788 res!148302) b!286151))

(assert (= (and b!286151 res!148305) b!286152))

(assert (= (and b!286152 res!148303) b!286153))

(assert (= (and b!286153 res!148304) b!286154))

(declare-fun m!300895 () Bool)

(assert (=> b!286154 m!300895))

(declare-fun m!300897 () Bool)

(assert (=> start!27788 m!300897))

(declare-fun m!300899 () Bool)

(assert (=> start!27788 m!300899))

(declare-fun m!300901 () Bool)

(assert (=> b!286152 m!300901))

(declare-fun m!300903 () Bool)

(assert (=> b!286153 m!300903))

(check-sat (not b!286153) (not start!27788) (not b!286154) (not b!286152))
