; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27726 () Bool)

(assert start!27726)

(declare-fun res!148066 () Bool)

(declare-fun e!181235 () Bool)

(assert (=> start!27726 (=> (not res!148066) (not e!181235))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27726 (= res!148066 (validMask!0 mask!3809))))

(assert (=> start!27726 e!181235))

(assert (=> start!27726 true))

(declare-datatypes ((array!14261 0))(
  ( (array!14262 (arr!6766 (Array (_ BitVec 32) (_ BitVec 64))) (size!7118 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14261)

(declare-fun array_inv!4716 (array!14261) Bool)

(assert (=> start!27726 (array_inv!4716 a!3312)))

(declare-fun b!285941 () Bool)

(declare-fun res!148068 () Bool)

(assert (=> b!285941 (=> (not res!148068) (not e!181235))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285941 (= res!148068 (and (= (size!7118 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7118 a!3312))))))

(declare-fun b!285942 () Bool)

(declare-fun res!148067 () Bool)

(assert (=> b!285942 (=> (not res!148067) (not e!181235))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285942 (= res!148067 (validKeyInArray!0 k0!2524))))

(declare-fun b!285943 () Bool)

(assert (=> b!285943 (= e!181235 (bvsge #b00000000000000000000000000000000 (size!7118 a!3312)))))

(assert (= (and start!27726 res!148066) b!285941))

(assert (= (and b!285941 res!148068) b!285942))

(assert (= (and b!285942 res!148067) b!285943))

(declare-fun m!300911 () Bool)

(assert (=> start!27726 m!300911))

(declare-fun m!300913 () Bool)

(assert (=> start!27726 m!300913))

(declare-fun m!300915 () Bool)

(assert (=> b!285942 m!300915))

(check-sat (not start!27726) (not b!285942))
(check-sat)
