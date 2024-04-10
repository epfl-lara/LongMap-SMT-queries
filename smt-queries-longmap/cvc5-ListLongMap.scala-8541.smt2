; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104202 () Bool)

(assert start!104202)

(declare-fun res!830806 () Bool)

(declare-fun e!706091 () Bool)

(assert (=> start!104202 (=> (not res!830806) (not e!706091))))

(declare-datatypes ((array!80151 0))(
  ( (array!80152 (arr!38660 (Array (_ BitVec 32) (_ BitVec 64))) (size!39196 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80151)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104202 (= res!830806 (and (bvslt (size!39196 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39196 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39196 a!3892))))))

(assert (=> start!104202 e!706091))

(declare-fun array_inv!29508 (array!80151) Bool)

(assert (=> start!104202 (array_inv!29508 a!3892)))

(assert (=> start!104202 true))

(declare-fun b!1245323 () Bool)

(assert (=> b!1245323 (= e!706091 false)))

(declare-fun lt!562892 () Bool)

(declare-datatypes ((List!27463 0))(
  ( (Nil!27460) (Cons!27459 (h!28668 (_ BitVec 64)) (t!40932 List!27463)) )
))
(declare-fun arrayNoDuplicates!0 (array!80151 (_ BitVec 32) List!27463) Bool)

(assert (=> b!1245323 (= lt!562892 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27460))))

(assert (= (and start!104202 res!830806) b!1245323))

(declare-fun m!1147401 () Bool)

(assert (=> start!104202 m!1147401))

(declare-fun m!1147403 () Bool)

(assert (=> b!1245323 m!1147403))

(push 1)

(assert (not start!104202))

(assert (not b!1245323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

