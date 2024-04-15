; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104208 () Bool)

(assert start!104208)

(declare-fun res!830781 () Bool)

(declare-fun e!706076 () Bool)

(assert (=> start!104208 (=> (not res!830781) (not e!706076))))

(declare-datatypes ((array!80082 0))(
  ( (array!80083 (arr!38626 (Array (_ BitVec 32) (_ BitVec 64))) (size!39164 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80082)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104208 (= res!830781 (and (bvslt (size!39164 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39164 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39164 a!3892))))))

(assert (=> start!104208 e!706076))

(declare-fun array_inv!29609 (array!80082) Bool)

(assert (=> start!104208 (array_inv!29609 a!3892)))

(assert (=> start!104208 true))

(declare-fun b!1245256 () Bool)

(assert (=> b!1245256 (= e!706076 false)))

(declare-fun lt!562728 () Bool)

(declare-datatypes ((List!27530 0))(
  ( (Nil!27527) (Cons!27526 (h!28735 (_ BitVec 64)) (t!40990 List!27530)) )
))
(declare-fun arrayNoDuplicates!0 (array!80082 (_ BitVec 32) List!27530) Bool)

(assert (=> b!1245256 (= lt!562728 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27527))))

(assert (= (and start!104208 res!830781) b!1245256))

(declare-fun m!1146899 () Bool)

(assert (=> start!104208 m!1146899))

(declare-fun m!1146901 () Bool)

(assert (=> b!1245256 m!1146901))

(push 1)

(assert (not start!104208))

(assert (not b!1245256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

