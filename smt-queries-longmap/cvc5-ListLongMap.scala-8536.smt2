; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104130 () Bool)

(assert start!104130)

(declare-fun res!830584 () Bool)

(declare-fun e!705860 () Bool)

(assert (=> start!104130 (=> (not res!830584) (not e!705860))))

(declare-datatypes ((array!80115 0))(
  ( (array!80116 (arr!38645 (Array (_ BitVec 32) (_ BitVec 64))) (size!39181 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80115)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104130 (= res!830584 (and (bvslt (size!39181 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39181 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39181 a!3892))))))

(assert (=> start!104130 e!705860))

(declare-fun array_inv!29493 (array!80115) Bool)

(assert (=> start!104130 (array_inv!29493 a!3892)))

(assert (=> start!104130 true))

(declare-fun b!1245065 () Bool)

(assert (=> b!1245065 (= e!705860 false)))

(declare-fun lt!562862 () Bool)

(declare-datatypes ((List!27448 0))(
  ( (Nil!27445) (Cons!27444 (h!28653 (_ BitVec 64)) (t!40917 List!27448)) )
))
(declare-fun arrayNoDuplicates!0 (array!80115 (_ BitVec 32) List!27448) Bool)

(assert (=> b!1245065 (= lt!562862 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27445))))

(assert (= (and start!104130 res!830584) b!1245065))

(declare-fun m!1147215 () Bool)

(assert (=> start!104130 m!1147215))

(declare-fun m!1147217 () Bool)

(assert (=> b!1245065 m!1147217))

(push 1)

(assert (not start!104130))

(assert (not b!1245065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

