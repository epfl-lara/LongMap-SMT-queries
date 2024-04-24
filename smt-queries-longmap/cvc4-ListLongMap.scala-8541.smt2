; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104436 () Bool)

(assert start!104436)

(declare-fun res!831333 () Bool)

(declare-fun e!706950 () Bool)

(assert (=> start!104436 (=> (not res!831333) (not e!706950))))

(declare-datatypes ((array!80187 0))(
  ( (array!80188 (arr!38673 (Array (_ BitVec 32) (_ BitVec 64))) (size!39210 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80187)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104436 (= res!831333 (and (bvslt (size!39210 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39210 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39210 a!3892))))))

(assert (=> start!104436 e!706950))

(declare-fun array_inv!29611 (array!80187) Bool)

(assert (=> start!104436 (array_inv!29611 a!3892)))

(assert (=> start!104436 true))

(declare-fun b!1246639 () Bool)

(assert (=> b!1246639 (= e!706950 false)))

(declare-fun lt!563381 () Bool)

(declare-datatypes ((List!27489 0))(
  ( (Nil!27486) (Cons!27485 (h!28703 (_ BitVec 64)) (t!40950 List!27489)) )
))
(declare-fun arrayNoDuplicates!0 (array!80187 (_ BitVec 32) List!27489) Bool)

(assert (=> b!1246639 (= lt!563381 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27486))))

(assert (= (and start!104436 res!831333) b!1246639))

(declare-fun m!1149029 () Bool)

(assert (=> start!104436 m!1149029))

(declare-fun m!1149031 () Bool)

(assert (=> b!1246639 m!1149031))

(push 1)

(assert (not b!1246639))

(assert (not start!104436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

