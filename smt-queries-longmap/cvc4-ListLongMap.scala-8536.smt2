; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104134 () Bool)

(assert start!104134)

(declare-fun res!830590 () Bool)

(declare-fun e!705872 () Bool)

(assert (=> start!104134 (=> (not res!830590) (not e!705872))))

(declare-datatypes ((array!80119 0))(
  ( (array!80120 (arr!38647 (Array (_ BitVec 32) (_ BitVec 64))) (size!39183 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80119)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104134 (= res!830590 (and (bvslt (size!39183 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39183 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39183 a!3892))))))

(assert (=> start!104134 e!705872))

(declare-fun array_inv!29495 (array!80119) Bool)

(assert (=> start!104134 (array_inv!29495 a!3892)))

(assert (=> start!104134 true))

(declare-fun b!1245071 () Bool)

(assert (=> b!1245071 (= e!705872 false)))

(declare-fun lt!562868 () Bool)

(declare-datatypes ((List!27450 0))(
  ( (Nil!27447) (Cons!27446 (h!28655 (_ BitVec 64)) (t!40919 List!27450)) )
))
(declare-fun arrayNoDuplicates!0 (array!80119 (_ BitVec 32) List!27450) Bool)

(assert (=> b!1245071 (= lt!562868 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27447))))

(assert (= (and start!104134 res!830590) b!1245071))

(declare-fun m!1147223 () Bool)

(assert (=> start!104134 m!1147223))

(declare-fun m!1147225 () Bool)

(assert (=> b!1245071 m!1147225))

(push 1)

(assert (not b!1245071))

(assert (not start!104134))

(check-sat)

