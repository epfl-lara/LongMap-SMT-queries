; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27728 () Bool)

(assert start!27728)

(declare-fun res!148054 () Bool)

(declare-fun e!181217 () Bool)

(assert (=> start!27728 (=> (not res!148054) (not e!181217))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27728 (= res!148054 (validMask!0 mask!3809))))

(assert (=> start!27728 e!181217))

(assert (=> start!27728 true))

(declare-datatypes ((array!14264 0))(
  ( (array!14265 (arr!6768 (Array (_ BitVec 32) (_ BitVec 64))) (size!7120 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14264)

(declare-fun array_inv!4731 (array!14264) Bool)

(assert (=> start!27728 (array_inv!4731 a!3312)))

(declare-fun b!285903 () Bool)

(declare-fun res!148056 () Bool)

(assert (=> b!285903 (=> (not res!148056) (not e!181217))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285903 (= res!148056 (and (= (size!7120 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7120 a!3312))))))

(declare-fun b!285904 () Bool)

(declare-fun res!148055 () Bool)

(assert (=> b!285904 (=> (not res!148055) (not e!181217))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285904 (= res!148055 (validKeyInArray!0 k0!2524))))

(declare-fun b!285905 () Bool)

(assert (=> b!285905 (= e!181217 (bvsge #b00000000000000000000000000000000 (size!7120 a!3312)))))

(assert (= (and start!27728 res!148054) b!285903))

(assert (= (and b!285903 res!148056) b!285904))

(assert (= (and b!285904 res!148055) b!285905))

(declare-fun m!300711 () Bool)

(assert (=> start!27728 m!300711))

(declare-fun m!300713 () Bool)

(assert (=> start!27728 m!300713))

(declare-fun m!300715 () Bool)

(assert (=> b!285904 m!300715))

(check-sat (not start!27728) (not b!285904))
(check-sat)
