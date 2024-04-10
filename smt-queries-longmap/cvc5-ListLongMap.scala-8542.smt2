; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104208 () Bool)

(assert start!104208)

(declare-fun res!830815 () Bool)

(declare-fun e!706109 () Bool)

(assert (=> start!104208 (=> (not res!830815) (not e!706109))))

(declare-datatypes ((array!80157 0))(
  ( (array!80158 (arr!38663 (Array (_ BitVec 32) (_ BitVec 64))) (size!39199 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80157)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104208 (= res!830815 (and (bvslt (size!39199 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39199 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39199 a!3892))))))

(assert (=> start!104208 e!706109))

(declare-fun array_inv!29511 (array!80157) Bool)

(assert (=> start!104208 (array_inv!29511 a!3892)))

(assert (=> start!104208 true))

(declare-fun b!1245332 () Bool)

(assert (=> b!1245332 (= e!706109 false)))

(declare-fun lt!562901 () Bool)

(declare-datatypes ((List!27466 0))(
  ( (Nil!27463) (Cons!27462 (h!28671 (_ BitVec 64)) (t!40935 List!27466)) )
))
(declare-fun arrayNoDuplicates!0 (array!80157 (_ BitVec 32) List!27466) Bool)

(assert (=> b!1245332 (= lt!562901 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27463))))

(assert (= (and start!104208 res!830815) b!1245332))

(declare-fun m!1147413 () Bool)

(assert (=> start!104208 m!1147413))

(declare-fun m!1147415 () Bool)

(assert (=> b!1245332 m!1147415))

(push 1)

(assert (not start!104208))

(assert (not b!1245332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

