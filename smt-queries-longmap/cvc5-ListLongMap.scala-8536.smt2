; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104366 () Bool)

(assert start!104366)

(declare-fun res!831114 () Bool)

(declare-fun e!706725 () Bool)

(assert (=> start!104366 (=> (not res!831114) (not e!706725))))

(declare-datatypes ((array!80153 0))(
  ( (array!80154 (arr!38659 (Array (_ BitVec 32) (_ BitVec 64))) (size!39196 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80153)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104366 (= res!831114 (and (bvslt (size!39196 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39196 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39196 a!3892))))))

(assert (=> start!104366 e!706725))

(declare-fun array_inv!29597 (array!80153) Bool)

(assert (=> start!104366 (array_inv!29597 a!3892)))

(assert (=> start!104366 true))

(declare-fun b!1246384 () Bool)

(assert (=> b!1246384 (= e!706725 false)))

(declare-fun lt!563354 () Bool)

(declare-datatypes ((List!27475 0))(
  ( (Nil!27472) (Cons!27471 (h!28689 (_ BitVec 64)) (t!40936 List!27475)) )
))
(declare-fun arrayNoDuplicates!0 (array!80153 (_ BitVec 32) List!27475) Bool)

(assert (=> b!1246384 (= lt!563354 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27472))))

(assert (= (and start!104366 res!831114) b!1246384))

(declare-fun m!1148847 () Bool)

(assert (=> start!104366 m!1148847))

(declare-fun m!1148849 () Bool)

(assert (=> b!1246384 m!1148849))

(push 1)

(assert (not b!1246384))

(assert (not start!104366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

