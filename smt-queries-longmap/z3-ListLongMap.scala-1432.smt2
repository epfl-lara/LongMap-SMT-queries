; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27758 () Bool)

(assert start!27758)

(declare-fun b!285965 () Bool)

(declare-fun e!181253 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!285965 (= e!181253 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!285962 () Bool)

(declare-fun res!148116 () Bool)

(assert (=> b!285962 (=> (not res!148116) (not e!181253))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14279 0))(
  ( (array!14280 (arr!6774 (Array (_ BitVec 32) (_ BitVec 64))) (size!7126 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14279)

(assert (=> b!285962 (= res!148116 (and (= (size!7126 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7126 a!3312))))))

(declare-fun res!148113 () Bool)

(assert (=> start!27758 (=> (not res!148113) (not e!181253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27758 (= res!148113 (validMask!0 mask!3809))))

(assert (=> start!27758 e!181253))

(assert (=> start!27758 true))

(declare-fun array_inv!4737 (array!14279) Bool)

(assert (=> start!27758 (array_inv!4737 a!3312)))

(declare-fun b!285963 () Bool)

(declare-fun res!148115 () Bool)

(assert (=> b!285963 (=> (not res!148115) (not e!181253))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285963 (= res!148115 (validKeyInArray!0 k0!2524))))

(declare-fun b!285964 () Bool)

(declare-fun res!148114 () Bool)

(assert (=> b!285964 (=> (not res!148114) (not e!181253))))

(declare-fun arrayContainsKey!0 (array!14279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285964 (= res!148114 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27758 res!148113) b!285962))

(assert (= (and b!285962 res!148116) b!285963))

(assert (= (and b!285963 res!148115) b!285964))

(assert (= (and b!285964 res!148114) b!285965))

(declare-fun m!300749 () Bool)

(assert (=> start!27758 m!300749))

(declare-fun m!300751 () Bool)

(assert (=> start!27758 m!300751))

(declare-fun m!300753 () Bool)

(assert (=> b!285963 m!300753))

(declare-fun m!300755 () Bool)

(assert (=> b!285964 m!300755))

(check-sat (not start!27758) (not b!285963) (not b!285964))
(check-sat)
