; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27728 () Bool)

(assert start!27728)

(declare-fun res!147950 () Bool)

(declare-fun e!181110 () Bool)

(assert (=> start!27728 (=> (not res!147950) (not e!181110))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27728 (= res!147950 (validMask!0 mask!3809))))

(assert (=> start!27728 e!181110))

(assert (=> start!27728 true))

(declare-datatypes ((array!14253 0))(
  ( (array!14254 (arr!6762 (Array (_ BitVec 32) (_ BitVec 64))) (size!7115 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14253)

(declare-fun array_inv!4734 (array!14253) Bool)

(assert (=> start!27728 (array_inv!4734 a!3312)))

(declare-fun b!285747 () Bool)

(declare-fun res!147951 () Bool)

(assert (=> b!285747 (=> (not res!147951) (not e!181110))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285747 (= res!147951 (and (= (size!7115 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7115 a!3312))))))

(declare-fun b!285748 () Bool)

(declare-fun res!147952 () Bool)

(assert (=> b!285748 (=> (not res!147952) (not e!181110))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285748 (= res!147952 (validKeyInArray!0 k0!2524))))

(declare-fun b!285749 () Bool)

(assert (=> b!285749 (= e!181110 (bvsge #b00000000000000000000000000000000 (size!7115 a!3312)))))

(assert (= (and start!27728 res!147950) b!285747))

(assert (= (and b!285747 res!147951) b!285748))

(assert (= (and b!285748 res!147952) b!285749))

(declare-fun m!300113 () Bool)

(assert (=> start!27728 m!300113))

(declare-fun m!300115 () Bool)

(assert (=> start!27728 m!300115))

(declare-fun m!300117 () Bool)

(assert (=> b!285748 m!300117))

(check-sat (not b!285748) (not start!27728))
(check-sat)
