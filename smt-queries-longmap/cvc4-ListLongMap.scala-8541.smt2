; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104206 () Bool)

(assert start!104206)

(declare-fun res!830812 () Bool)

(declare-fun e!706103 () Bool)

(assert (=> start!104206 (=> (not res!830812) (not e!706103))))

(declare-datatypes ((array!80155 0))(
  ( (array!80156 (arr!38662 (Array (_ BitVec 32) (_ BitVec 64))) (size!39198 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80155)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104206 (= res!830812 (and (bvslt (size!39198 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39198 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39198 a!3892))))))

(assert (=> start!104206 e!706103))

(declare-fun array_inv!29510 (array!80155) Bool)

(assert (=> start!104206 (array_inv!29510 a!3892)))

(assert (=> start!104206 true))

(declare-fun b!1245329 () Bool)

(assert (=> b!1245329 (= e!706103 false)))

(declare-fun lt!562898 () Bool)

(declare-datatypes ((List!27465 0))(
  ( (Nil!27462) (Cons!27461 (h!28670 (_ BitVec 64)) (t!40934 List!27465)) )
))
(declare-fun arrayNoDuplicates!0 (array!80155 (_ BitVec 32) List!27465) Bool)

(assert (=> b!1245329 (= lt!562898 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27462))))

(assert (= (and start!104206 res!830812) b!1245329))

(declare-fun m!1147409 () Bool)

(assert (=> start!104206 m!1147409))

(declare-fun m!1147411 () Bool)

(assert (=> b!1245329 m!1147411))

(push 1)

(assert (not start!104206))

(assert (not b!1245329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

