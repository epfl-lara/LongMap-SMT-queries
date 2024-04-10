; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104226 () Bool)

(assert start!104226)

(declare-fun res!830869 () Bool)

(declare-fun e!706163 () Bool)

(assert (=> start!104226 (=> (not res!830869) (not e!706163))))

(declare-datatypes ((array!80175 0))(
  ( (array!80176 (arr!38672 (Array (_ BitVec 32) (_ BitVec 64))) (size!39208 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80175)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104226 (= res!830869 (and (bvslt (size!39208 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39208 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39208 a!3892))))))

(assert (=> start!104226 e!706163))

(declare-fun array_inv!29520 (array!80175) Bool)

(assert (=> start!104226 (array_inv!29520 a!3892)))

(assert (=> start!104226 true))

(declare-fun b!1245386 () Bool)

(assert (=> b!1245386 (= e!706163 false)))

(declare-fun lt!562919 () Bool)

(declare-datatypes ((List!27475 0))(
  ( (Nil!27472) (Cons!27471 (h!28680 (_ BitVec 64)) (t!40944 List!27475)) )
))
(declare-fun arrayNoDuplicates!0 (array!80175 (_ BitVec 32) List!27475) Bool)

(assert (=> b!1245386 (= lt!562919 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27472))))

(assert (= (and start!104226 res!830869) b!1245386))

(declare-fun m!1147461 () Bool)

(assert (=> start!104226 m!1147461))

(declare-fun m!1147463 () Bool)

(assert (=> b!1245386 m!1147463))

(push 1)

(assert (not start!104226))

(assert (not b!1245386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

