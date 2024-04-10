; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103846 () Bool)

(assert start!103846)

(declare-fun res!828931 () Bool)

(declare-fun e!704795 () Bool)

(assert (=> start!103846 (=> (not res!828931) (not e!704795))))

(declare-datatypes ((array!79959 0))(
  ( (array!79960 (arr!38575 (Array (_ BitVec 32) (_ BitVec 64))) (size!39111 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79959)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103846 (= res!828931 (and (bvslt (size!39111 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39111 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39111 a!3892))))))

(assert (=> start!103846 e!704795))

(declare-fun array_inv!29423 (array!79959) Bool)

(assert (=> start!103846 (array_inv!29423 a!3892)))

(assert (=> start!103846 true))

(declare-fun b!1243154 () Bool)

(declare-datatypes ((List!27378 0))(
  ( (Nil!27375) (Cons!27374 (h!28583 (_ BitVec 64)) (t!40847 List!27378)) )
))
(declare-fun noDuplicate!1977 (List!27378) Bool)

(assert (=> b!1243154 (= e!704795 (not (noDuplicate!1977 Nil!27375)))))

(assert (= (and start!103846 res!828931) b!1243154))

(declare-fun m!1145793 () Bool)

(assert (=> start!103846 m!1145793))

(declare-fun m!1145795 () Bool)

(assert (=> b!1243154 m!1145795))

(push 1)

(assert (not start!103846))

(assert (not b!1243154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

