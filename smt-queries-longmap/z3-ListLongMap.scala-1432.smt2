; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27752 () Bool)

(assert start!27752)

(declare-fun res!148008 () Bool)

(declare-fun e!181145 () Bool)

(assert (=> start!27752 (=> (not res!148008) (not e!181145))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27752 (= res!148008 (validMask!0 mask!3809))))

(assert (=> start!27752 e!181145))

(assert (=> start!27752 true))

(declare-datatypes ((array!14266 0))(
  ( (array!14267 (arr!6768 (Array (_ BitVec 32) (_ BitVec 64))) (size!7121 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14266)

(declare-fun array_inv!4740 (array!14266) Bool)

(assert (=> start!27752 (array_inv!4740 a!3312)))

(declare-fun b!285803 () Bool)

(declare-fun res!148007 () Bool)

(assert (=> b!285803 (=> (not res!148007) (not e!181145))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285803 (= res!148007 (and (= (size!7121 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7121 a!3312))))))

(declare-fun b!285805 () Bool)

(declare-fun res!148006 () Bool)

(assert (=> b!285805 (=> (not res!148006) (not e!181145))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285805 (= res!148006 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!285804 () Bool)

(declare-fun res!148009 () Bool)

(assert (=> b!285804 (=> (not res!148009) (not e!181145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285804 (= res!148009 (validKeyInArray!0 k0!2524))))

(declare-fun b!285806 () Bool)

(assert (=> b!285806 (= e!181145 (bvslt mask!3809 #b00000000000000000000000000000000))))

(assert (= (and start!27752 res!148008) b!285803))

(assert (= (and b!285803 res!148007) b!285804))

(assert (= (and b!285804 res!148009) b!285805))

(assert (= (and b!285805 res!148006) b!285806))

(declare-fun m!300149 () Bool)

(assert (=> start!27752 m!300149))

(declare-fun m!300151 () Bool)

(assert (=> start!27752 m!300151))

(declare-fun m!300153 () Bool)

(assert (=> b!285805 m!300153))

(declare-fun m!300155 () Bool)

(assert (=> b!285804 m!300155))

(check-sat (not b!285805) (not b!285804) (not start!27752))
(check-sat)
