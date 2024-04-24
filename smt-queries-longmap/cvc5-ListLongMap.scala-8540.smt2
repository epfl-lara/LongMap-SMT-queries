; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104432 () Bool)

(assert start!104432)

(declare-fun res!831327 () Bool)

(declare-fun e!706938 () Bool)

(assert (=> start!104432 (=> (not res!831327) (not e!706938))))

(declare-datatypes ((array!80183 0))(
  ( (array!80184 (arr!38671 (Array (_ BitVec 32) (_ BitVec 64))) (size!39208 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80183)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104432 (= res!831327 (and (bvslt (size!39208 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39208 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39208 a!3892))))))

(assert (=> start!104432 e!706938))

(declare-fun array_inv!29609 (array!80183) Bool)

(assert (=> start!104432 (array_inv!29609 a!3892)))

(assert (=> start!104432 true))

(declare-fun b!1246633 () Bool)

(assert (=> b!1246633 (= e!706938 false)))

(declare-fun lt!563375 () Bool)

(declare-datatypes ((List!27487 0))(
  ( (Nil!27484) (Cons!27483 (h!28701 (_ BitVec 64)) (t!40948 List!27487)) )
))
(declare-fun arrayNoDuplicates!0 (array!80183 (_ BitVec 32) List!27487) Bool)

(assert (=> b!1246633 (= lt!563375 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27484))))

(assert (= (and start!104432 res!831327) b!1246633))

(declare-fun m!1149021 () Bool)

(assert (=> start!104432 m!1149021))

(declare-fun m!1149023 () Bool)

(assert (=> b!1246633 m!1149023))

(push 1)

(assert (not start!104432))

(assert (not b!1246633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

