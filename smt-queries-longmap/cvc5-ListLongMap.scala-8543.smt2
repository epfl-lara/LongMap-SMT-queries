; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104214 () Bool)

(assert start!104214)

(declare-fun res!830824 () Bool)

(declare-fun e!706127 () Bool)

(assert (=> start!104214 (=> (not res!830824) (not e!706127))))

(declare-datatypes ((array!80163 0))(
  ( (array!80164 (arr!38666 (Array (_ BitVec 32) (_ BitVec 64))) (size!39202 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80163)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104214 (= res!830824 (and (bvslt (size!39202 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39202 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39202 a!3892))))))

(assert (=> start!104214 e!706127))

(declare-fun array_inv!29514 (array!80163) Bool)

(assert (=> start!104214 (array_inv!29514 a!3892)))

(assert (=> start!104214 true))

(declare-fun b!1245341 () Bool)

(assert (=> b!1245341 (= e!706127 false)))

(declare-fun lt!562910 () Bool)

(declare-datatypes ((List!27469 0))(
  ( (Nil!27466) (Cons!27465 (h!28674 (_ BitVec 64)) (t!40938 List!27469)) )
))
(declare-fun arrayNoDuplicates!0 (array!80163 (_ BitVec 32) List!27469) Bool)

(assert (=> b!1245341 (= lt!562910 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27466))))

(assert (= (and start!104214 res!830824) b!1245341))

(declare-fun m!1147425 () Bool)

(assert (=> start!104214 m!1147425))

(declare-fun m!1147427 () Bool)

(assert (=> b!1245341 m!1147427))

(push 1)

(assert (not start!104214))

(assert (not b!1245341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

