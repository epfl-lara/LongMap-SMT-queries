; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104196 () Bool)

(assert start!104196)

(declare-fun res!830797 () Bool)

(declare-fun e!706073 () Bool)

(assert (=> start!104196 (=> (not res!830797) (not e!706073))))

(declare-datatypes ((array!80145 0))(
  ( (array!80146 (arr!38657 (Array (_ BitVec 32) (_ BitVec 64))) (size!39193 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80145)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104196 (= res!830797 (and (bvslt (size!39193 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39193 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39193 a!3892))))))

(assert (=> start!104196 e!706073))

(declare-fun array_inv!29505 (array!80145) Bool)

(assert (=> start!104196 (array_inv!29505 a!3892)))

(assert (=> start!104196 true))

(declare-fun b!1245314 () Bool)

(assert (=> b!1245314 (= e!706073 false)))

(declare-fun lt!562883 () Bool)

(declare-datatypes ((List!27460 0))(
  ( (Nil!27457) (Cons!27456 (h!28665 (_ BitVec 64)) (t!40929 List!27460)) )
))
(declare-fun arrayNoDuplicates!0 (array!80145 (_ BitVec 32) List!27460) Bool)

(assert (=> b!1245314 (= lt!562883 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27457))))

(assert (= (and start!104196 res!830797) b!1245314))

(declare-fun m!1147389 () Bool)

(assert (=> start!104196 m!1147389))

(declare-fun m!1147391 () Bool)

(assert (=> b!1245314 m!1147391))

(push 1)

(assert (not start!104196))

(assert (not b!1245314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

