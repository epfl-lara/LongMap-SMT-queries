; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104196 () Bool)

(assert start!104196)

(declare-fun res!830763 () Bool)

(declare-fun e!706040 () Bool)

(assert (=> start!104196 (=> (not res!830763) (not e!706040))))

(declare-datatypes ((array!80070 0))(
  ( (array!80071 (arr!38620 (Array (_ BitVec 32) (_ BitVec 64))) (size!39158 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80070)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104196 (= res!830763 (and (bvslt (size!39158 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39158 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39158 a!3892))))))

(assert (=> start!104196 e!706040))

(declare-fun array_inv!29603 (array!80070) Bool)

(assert (=> start!104196 (array_inv!29603 a!3892)))

(assert (=> start!104196 true))

(declare-fun b!1245238 () Bool)

(assert (=> b!1245238 (= e!706040 false)))

(declare-fun lt!562710 () Bool)

(declare-datatypes ((List!27524 0))(
  ( (Nil!27521) (Cons!27520 (h!28729 (_ BitVec 64)) (t!40984 List!27524)) )
))
(declare-fun arrayNoDuplicates!0 (array!80070 (_ BitVec 32) List!27524) Bool)

(assert (=> b!1245238 (= lt!562710 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27521))))

(assert (= (and start!104196 res!830763) b!1245238))

(declare-fun m!1146875 () Bool)

(assert (=> start!104196 m!1146875))

(declare-fun m!1146877 () Bool)

(assert (=> b!1245238 m!1146877))

(push 1)

(assert (not b!1245238))

(assert (not start!104196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

