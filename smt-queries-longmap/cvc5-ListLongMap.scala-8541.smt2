; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104202 () Bool)

(assert start!104202)

(declare-fun res!830772 () Bool)

(declare-fun e!706058 () Bool)

(assert (=> start!104202 (=> (not res!830772) (not e!706058))))

(declare-datatypes ((array!80076 0))(
  ( (array!80077 (arr!38623 (Array (_ BitVec 32) (_ BitVec 64))) (size!39161 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80076)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104202 (= res!830772 (and (bvslt (size!39161 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39161 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39161 a!3892))))))

(assert (=> start!104202 e!706058))

(declare-fun array_inv!29606 (array!80076) Bool)

(assert (=> start!104202 (array_inv!29606 a!3892)))

(assert (=> start!104202 true))

(declare-fun b!1245247 () Bool)

(assert (=> b!1245247 (= e!706058 false)))

(declare-fun lt!562719 () Bool)

(declare-datatypes ((List!27527 0))(
  ( (Nil!27524) (Cons!27523 (h!28732 (_ BitVec 64)) (t!40987 List!27527)) )
))
(declare-fun arrayNoDuplicates!0 (array!80076 (_ BitVec 32) List!27527) Bool)

(assert (=> b!1245247 (= lt!562719 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27524))))

(assert (= (and start!104202 res!830772) b!1245247))

(declare-fun m!1146887 () Bool)

(assert (=> start!104202 m!1146887))

(declare-fun m!1146889 () Bool)

(assert (=> b!1245247 m!1146889))

(push 1)

(assert (not b!1245247))

(assert (not start!104202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

