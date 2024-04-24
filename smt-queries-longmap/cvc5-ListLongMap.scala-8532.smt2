; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104302 () Bool)

(assert start!104302)

(declare-fun res!830901 () Bool)

(declare-fun e!706512 () Bool)

(assert (=> start!104302 (=> (not res!830901) (not e!706512))))

(declare-datatypes ((array!80124 0))(
  ( (array!80125 (arr!38647 (Array (_ BitVec 32) (_ BitVec 64))) (size!39184 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80124)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104302 (= res!830901 (and (bvslt (size!39184 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39184 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39184 a!3892))))))

(assert (=> start!104302 e!706512))

(declare-fun array_inv!29585 (array!80124) Bool)

(assert (=> start!104302 (array_inv!29585 a!3892)))

(assert (=> start!104302 true))

(declare-fun b!1246135 () Bool)

(assert (=> b!1246135 (= e!706512 false)))

(declare-fun lt!563333 () Bool)

(declare-datatypes ((List!27463 0))(
  ( (Nil!27460) (Cons!27459 (h!28677 (_ BitVec 64)) (t!40924 List!27463)) )
))
(declare-fun arrayNoDuplicates!0 (array!80124 (_ BitVec 32) List!27463) Bool)

(assert (=> b!1246135 (= lt!563333 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27460))))

(assert (= (and start!104302 res!830901) b!1246135))

(declare-fun m!1148681 () Bool)

(assert (=> start!104302 m!1148681))

(declare-fun m!1148683 () Bool)

(assert (=> b!1246135 m!1148683))

(push 1)

(assert (not start!104302))

(assert (not b!1246135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

