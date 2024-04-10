; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27782 () Bool)

(assert start!27782)

(declare-fun res!148268 () Bool)

(declare-fun e!181324 () Bool)

(assert (=> start!27782 (=> (not res!148268) (not e!181324))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27782 (= res!148268 (validMask!0 mask!3809))))

(assert (=> start!27782 e!181324))

(assert (=> start!27782 true))

(declare-datatypes ((array!14303 0))(
  ( (array!14304 (arr!6786 (Array (_ BitVec 32) (_ BitVec 64))) (size!7138 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14303)

(declare-fun array_inv!4749 (array!14303) Bool)

(assert (=> start!27782 (array_inv!4749 a!3312)))

(declare-fun b!286118 () Bool)

(assert (=> b!286118 (= e!181324 false)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1935 0))(
  ( (MissingZero!1935 (index!9910 (_ BitVec 32))) (Found!1935 (index!9911 (_ BitVec 32))) (Intermediate!1935 (undefined!2747 Bool) (index!9912 (_ BitVec 32)) (x!28135 (_ BitVec 32))) (Undefined!1935) (MissingVacant!1935 (index!9913 (_ BitVec 32))) )
))
(declare-fun lt!141010 () SeekEntryResult!1935)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14303 (_ BitVec 32)) SeekEntryResult!1935)

(assert (=> b!286118 (= lt!141010 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286116 () Bool)

(declare-fun res!148266 () Bool)

(assert (=> b!286116 (=> (not res!148266) (not e!181324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286116 (= res!148266 (validKeyInArray!0 k0!2524))))

(declare-fun b!286115 () Bool)

(declare-fun res!148267 () Bool)

(assert (=> b!286115 (=> (not res!148267) (not e!181324))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286115 (= res!148267 (and (= (size!7138 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7138 a!3312))))))

(declare-fun b!286117 () Bool)

(declare-fun res!148269 () Bool)

(assert (=> b!286117 (=> (not res!148269) (not e!181324))))

(declare-fun arrayContainsKey!0 (array!14303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286117 (= res!148269 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27782 res!148268) b!286115))

(assert (= (and b!286115 res!148267) b!286116))

(assert (= (and b!286116 res!148266) b!286117))

(assert (= (and b!286117 res!148269) b!286118))

(declare-fun m!300865 () Bool)

(assert (=> start!27782 m!300865))

(declare-fun m!300867 () Bool)

(assert (=> start!27782 m!300867))

(declare-fun m!300869 () Bool)

(assert (=> b!286118 m!300869))

(declare-fun m!300871 () Bool)

(assert (=> b!286116 m!300871))

(declare-fun m!300873 () Bool)

(assert (=> b!286117 m!300873))

(check-sat (not b!286116) (not b!286117) (not start!27782) (not b!286118))
(check-sat)
