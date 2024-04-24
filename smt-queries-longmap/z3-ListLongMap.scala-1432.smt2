; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27748 () Bool)

(assert start!27748)

(declare-fun res!148125 () Bool)

(declare-fun e!181270 () Bool)

(assert (=> start!27748 (=> (not res!148125) (not e!181270))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27748 (= res!148125 (validMask!0 mask!3809))))

(assert (=> start!27748 e!181270))

(assert (=> start!27748 true))

(declare-datatypes ((array!14274 0))(
  ( (array!14275 (arr!6772 (Array (_ BitVec 32) (_ BitVec 64))) (size!7124 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14274)

(declare-fun array_inv!4722 (array!14274) Bool)

(assert (=> start!27748 (array_inv!4722 a!3312)))

(declare-fun b!285997 () Bool)

(declare-fun res!148124 () Bool)

(assert (=> b!285997 (=> (not res!148124) (not e!181270))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285997 (= res!148124 (and (= (size!7124 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7124 a!3312))))))

(declare-fun b!285999 () Bool)

(declare-fun res!148122 () Bool)

(assert (=> b!285999 (=> (not res!148122) (not e!181270))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285999 (= res!148122 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286000 () Bool)

(assert (=> b!286000 (= e!181270 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!285998 () Bool)

(declare-fun res!148123 () Bool)

(assert (=> b!285998 (=> (not res!148123) (not e!181270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285998 (= res!148123 (validKeyInArray!0 k0!2524))))

(assert (= (and start!27748 res!148125) b!285997))

(assert (= (and b!285997 res!148124) b!285998))

(assert (= (and b!285998 res!148123) b!285999))

(assert (= (and b!285999 res!148122) b!286000))

(declare-fun m!300947 () Bool)

(assert (=> start!27748 m!300947))

(declare-fun m!300949 () Bool)

(assert (=> start!27748 m!300949))

(declare-fun m!300951 () Bool)

(assert (=> b!285999 m!300951))

(declare-fun m!300953 () Bool)

(assert (=> b!285998 m!300953))

(check-sat (not start!27748) (not b!285999) (not b!285998))
(check-sat)
