; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104358 () Bool)

(assert start!104358)

(declare-fun res!831098 () Bool)

(declare-fun e!706701 () Bool)

(assert (=> start!104358 (=> (not res!831098) (not e!706701))))

(declare-datatypes ((array!80145 0))(
  ( (array!80146 (arr!38655 (Array (_ BitVec 32) (_ BitVec 64))) (size!39192 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80145)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104358 (= res!831098 (and (bvslt (size!39192 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39192 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39192 a!3892))))))

(assert (=> start!104358 e!706701))

(declare-fun array_inv!29593 (array!80145) Bool)

(assert (=> start!104358 (array_inv!29593 a!3892)))

(assert (=> start!104358 true))

(declare-fun b!1246368 () Bool)

(declare-fun res!831099 () Bool)

(assert (=> b!1246368 (=> (not res!831099) (not e!706701))))

(declare-datatypes ((List!27471 0))(
  ( (Nil!27468) (Cons!27467 (h!28685 (_ BitVec 64)) (t!40932 List!27471)) )
))
(declare-fun arrayNoDuplicates!0 (array!80145 (_ BitVec 32) List!27471) Bool)

(assert (=> b!1246368 (= res!831099 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27468))))

(declare-fun b!1246369 () Bool)

(assert (=> b!1246369 (= e!706701 (and (= from!3270 newFrom!287) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104358 res!831098) b!1246368))

(assert (= (and b!1246368 res!831099) b!1246369))

(declare-fun m!1148831 () Bool)

(assert (=> start!104358 m!1148831))

(declare-fun m!1148833 () Bool)

(assert (=> b!1246368 m!1148833))

(push 1)

(assert (not start!104358))

(assert (not b!1246368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

