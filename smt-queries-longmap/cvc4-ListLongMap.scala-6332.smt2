; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81616 () Bool)

(assert start!81616)

(declare-fun res!638413 () Bool)

(declare-fun e!536905 () Bool)

(assert (=> start!81616 (=> (not res!638413) (not e!536905))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81616 (= res!638413 (validMask!0 mask!4034))))

(assert (=> start!81616 e!536905))

(assert (=> start!81616 true))

(declare-datatypes ((array!57686 0))(
  ( (array!57687 (arr!27732 (Array (_ BitVec 32) (_ BitVec 64))) (size!28211 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57686)

(declare-fun array_inv!21522 (array!57686) Bool)

(assert (=> start!81616 (array_inv!21522 a!3460)))

(declare-fun b!953229 () Bool)

(assert (=> b!953229 (= e!536905 (and (= (size!28211 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)) (bvsgt #b00000000000000000000000000000000 (size!28211 a!3460))))))

(assert (= (and start!81616 res!638413) b!953229))

(declare-fun m!885315 () Bool)

(assert (=> start!81616 m!885315))

(declare-fun m!885317 () Bool)

(assert (=> start!81616 m!885317))

(push 1)

(assert (not start!81616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!115629 () Bool)

(assert (=> d!115629 (= (validMask!0 mask!4034) (and (or (= mask!4034 