; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29950 () Bool)

(assert start!29950)

(declare-fun res!158747 () Bool)

(declare-fun e!189993 () Bool)

(assert (=> start!29950 (=> (not res!158747) (not e!189993))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29950 (= res!158747 (validMask!0 mask!3709))))

(assert (=> start!29950 e!189993))

(assert (=> start!29950 true))

(declare-datatypes ((array!15198 0))(
  ( (array!15199 (arr!7192 (Array (_ BitVec 32) (_ BitVec 64))) (size!7544 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15198)

(declare-fun array_inv!5142 (array!15198) Bool)

(assert (=> start!29950 (array_inv!5142 a!3293)))

(declare-fun b!300946 () Bool)

(declare-fun res!158746 () Bool)

(assert (=> b!300946 (=> (not res!158746) (not e!189993))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300946 (= res!158746 (and (= (size!7544 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7544 a!3293))))))

(declare-fun b!300947 () Bool)

(declare-fun res!158748 () Bool)

(assert (=> b!300947 (=> (not res!158748) (not e!189993))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300947 (= res!158748 (validKeyInArray!0 k0!2441))))

(declare-fun b!300948 () Bool)

(assert (=> b!300948 (= e!189993 (bvsge #b00000000000000000000000000000000 (size!7544 a!3293)))))

(assert (= (and start!29950 res!158747) b!300946))

(assert (= (and b!300946 res!158746) b!300947))

(assert (= (and b!300947 res!158748) b!300948))

(declare-fun m!313011 () Bool)

(assert (=> start!29950 m!313011))

(declare-fun m!313013 () Bool)

(assert (=> start!29950 m!313013))

(declare-fun m!313015 () Bool)

(assert (=> b!300947 m!313015))

(check-sat (not start!29950) (not b!300947))
(check-sat)
