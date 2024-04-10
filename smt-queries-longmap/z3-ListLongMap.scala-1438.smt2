; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27794 () Bool)

(assert start!27794)

(declare-fun b!286187 () Bool)

(declare-fun res!148340 () Bool)

(declare-fun e!181361 () Bool)

(assert (=> b!286187 (=> (not res!148340) (not e!181361))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14315 0))(
  ( (array!14316 (arr!6792 (Array (_ BitVec 32) (_ BitVec 64))) (size!7144 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14315)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286187 (= res!148340 (and (= (size!7144 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7144 a!3312))))))

(declare-fun b!286188 () Bool)

(declare-fun res!148338 () Bool)

(assert (=> b!286188 (=> (not res!148338) (not e!181361))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286188 (= res!148338 (validKeyInArray!0 k0!2524))))

(declare-fun b!286189 () Bool)

(declare-fun res!148339 () Bool)

(assert (=> b!286189 (=> (not res!148339) (not e!181361))))

(declare-fun arrayContainsKey!0 (array!14315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286189 (= res!148339 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286190 () Bool)

(assert (=> b!286190 (= e!181361 false)))

(declare-datatypes ((SeekEntryResult!1941 0))(
  ( (MissingZero!1941 (index!9934 (_ BitVec 32))) (Found!1941 (index!9935 (_ BitVec 32))) (Intermediate!1941 (undefined!2753 Bool) (index!9936 (_ BitVec 32)) (x!28157 (_ BitVec 32))) (Undefined!1941) (MissingVacant!1941 (index!9937 (_ BitVec 32))) )
))
(declare-fun lt!141028 () SeekEntryResult!1941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14315 (_ BitVec 32)) SeekEntryResult!1941)

(assert (=> b!286190 (= lt!141028 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!148341 () Bool)

(assert (=> start!27794 (=> (not res!148341) (not e!181361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27794 (= res!148341 (validMask!0 mask!3809))))

(assert (=> start!27794 e!181361))

(assert (=> start!27794 true))

(declare-fun array_inv!4755 (array!14315) Bool)

(assert (=> start!27794 (array_inv!4755 a!3312)))

(assert (= (and start!27794 res!148341) b!286187))

(assert (= (and b!286187 res!148340) b!286188))

(assert (= (and b!286188 res!148338) b!286189))

(assert (= (and b!286189 res!148339) b!286190))

(declare-fun m!300925 () Bool)

(assert (=> b!286188 m!300925))

(declare-fun m!300927 () Bool)

(assert (=> b!286189 m!300927))

(declare-fun m!300929 () Bool)

(assert (=> b!286190 m!300929))

(declare-fun m!300931 () Bool)

(assert (=> start!27794 m!300931))

(declare-fun m!300933 () Bool)

(assert (=> start!27794 m!300933))

(check-sat (not b!286189) (not start!27794) (not b!286190) (not b!286188))
