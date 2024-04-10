; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27730 () Bool)

(assert start!27730)

(declare-fun res!148063 () Bool)

(declare-fun e!181223 () Bool)

(assert (=> start!27730 (=> (not res!148063) (not e!181223))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27730 (= res!148063 (validMask!0 mask!3809))))

(assert (=> start!27730 e!181223))

(assert (=> start!27730 true))

(declare-datatypes ((array!14266 0))(
  ( (array!14267 (arr!6769 (Array (_ BitVec 32) (_ BitVec 64))) (size!7121 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14266)

(declare-fun array_inv!4732 (array!14266) Bool)

(assert (=> start!27730 (array_inv!4732 a!3312)))

(declare-fun b!285912 () Bool)

(declare-fun res!148065 () Bool)

(assert (=> b!285912 (=> (not res!148065) (not e!181223))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285912 (= res!148065 (and (= (size!7121 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7121 a!3312))))))

(declare-fun b!285913 () Bool)

(declare-fun res!148064 () Bool)

(assert (=> b!285913 (=> (not res!148064) (not e!181223))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285913 (= res!148064 (validKeyInArray!0 k!2524))))

(declare-fun b!285914 () Bool)

(assert (=> b!285914 (= e!181223 (bvsge #b00000000000000000000000000000000 (size!7121 a!3312)))))

(assert (= (and start!27730 res!148063) b!285912))

(assert (= (and b!285912 res!148065) b!285913))

(assert (= (and b!285913 res!148064) b!285914))

(declare-fun m!300717 () Bool)

(assert (=> start!27730 m!300717))

(declare-fun m!300719 () Bool)

(assert (=> start!27730 m!300719))

(declare-fun m!300721 () Bool)

(assert (=> b!285913 m!300721))

(push 1)

(assert (not b!285913))

(assert (not start!27730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

