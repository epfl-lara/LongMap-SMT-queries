; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27800 () Bool)

(assert start!27800)

(declare-fun res!148377 () Bool)

(declare-fun e!181378 () Bool)

(assert (=> start!27800 (=> (not res!148377) (not e!181378))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27800 (= res!148377 (validMask!0 mask!3809))))

(assert (=> start!27800 e!181378))

(assert (=> start!27800 true))

(declare-datatypes ((array!14321 0))(
  ( (array!14322 (arr!6795 (Array (_ BitVec 32) (_ BitVec 64))) (size!7147 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14321)

(declare-fun array_inv!4758 (array!14321) Bool)

(assert (=> start!27800 (array_inv!4758 a!3312)))

(declare-fun b!286224 () Bool)

(declare-fun res!148375 () Bool)

(assert (=> b!286224 (=> (not res!148375) (not e!181378))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286224 (= res!148375 (validKeyInArray!0 k0!2524))))

(declare-fun b!286225 () Bool)

(declare-fun res!148376 () Bool)

(assert (=> b!286225 (=> (not res!148376) (not e!181378))))

(declare-fun arrayContainsKey!0 (array!14321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286225 (= res!148376 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286223 () Bool)

(declare-fun res!148374 () Bool)

(assert (=> b!286223 (=> (not res!148374) (not e!181378))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286223 (= res!148374 (and (= (size!7147 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7147 a!3312))))))

(declare-fun b!286226 () Bool)

(assert (=> b!286226 (= e!181378 false)))

(declare-datatypes ((SeekEntryResult!1944 0))(
  ( (MissingZero!1944 (index!9946 (_ BitVec 32))) (Found!1944 (index!9947 (_ BitVec 32))) (Intermediate!1944 (undefined!2756 Bool) (index!9948 (_ BitVec 32)) (x!28168 (_ BitVec 32))) (Undefined!1944) (MissingVacant!1944 (index!9949 (_ BitVec 32))) )
))
(declare-fun lt!141037 () SeekEntryResult!1944)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14321 (_ BitVec 32)) SeekEntryResult!1944)

(assert (=> b!286226 (= lt!141037 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!27800 res!148377) b!286223))

(assert (= (and b!286223 res!148374) b!286224))

(assert (= (and b!286224 res!148375) b!286225))

(assert (= (and b!286225 res!148376) b!286226))

(declare-fun m!300955 () Bool)

(assert (=> start!27800 m!300955))

(declare-fun m!300957 () Bool)

(assert (=> start!27800 m!300957))

(declare-fun m!300959 () Bool)

(assert (=> b!286224 m!300959))

(declare-fun m!300961 () Bool)

(assert (=> b!286225 m!300961))

(declare-fun m!300963 () Bool)

(assert (=> b!286226 m!300963))

(check-sat (not start!27800) (not b!286225) (not b!286226) (not b!286224))
