; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104226 () Bool)

(assert start!104226)

(declare-fun res!830835 () Bool)

(declare-fun e!706130 () Bool)

(assert (=> start!104226 (=> (not res!830835) (not e!706130))))

(declare-datatypes ((array!80100 0))(
  ( (array!80101 (arr!38635 (Array (_ BitVec 32) (_ BitVec 64))) (size!39173 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80100)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104226 (= res!830835 (and (bvslt (size!39173 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39173 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39173 a!3892))))))

(assert (=> start!104226 e!706130))

(declare-fun array_inv!29618 (array!80100) Bool)

(assert (=> start!104226 (array_inv!29618 a!3892)))

(assert (=> start!104226 true))

(declare-fun b!1245310 () Bool)

(assert (=> b!1245310 (= e!706130 false)))

(declare-fun lt!562746 () Bool)

(declare-datatypes ((List!27539 0))(
  ( (Nil!27536) (Cons!27535 (h!28744 (_ BitVec 64)) (t!40999 List!27539)) )
))
(declare-fun arrayNoDuplicates!0 (array!80100 (_ BitVec 32) List!27539) Bool)

(assert (=> b!1245310 (= lt!562746 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27536))))

(assert (= (and start!104226 res!830835) b!1245310))

(declare-fun m!1146947 () Bool)

(assert (=> start!104226 m!1146947))

(declare-fun m!1146949 () Bool)

(assert (=> b!1245310 m!1146949))

(push 1)

(assert (not start!104226))

(assert (not b!1245310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

