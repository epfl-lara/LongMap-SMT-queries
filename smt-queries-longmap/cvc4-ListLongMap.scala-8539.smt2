; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104194 () Bool)

(assert start!104194)

(declare-fun res!830793 () Bool)

(declare-fun e!706067 () Bool)

(assert (=> start!104194 (=> (not res!830793) (not e!706067))))

(declare-datatypes ((array!80143 0))(
  ( (array!80144 (arr!38656 (Array (_ BitVec 32) (_ BitVec 64))) (size!39192 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80143)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104194 (= res!830793 (and (bvslt (size!39192 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39192 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39192 a!3892))))))

(assert (=> start!104194 e!706067))

(declare-fun array_inv!29504 (array!80143) Bool)

(assert (=> start!104194 (array_inv!29504 a!3892)))

(assert (=> start!104194 true))

(declare-fun b!1245310 () Bool)

(declare-fun res!830794 () Bool)

(assert (=> b!1245310 (=> (not res!830794) (not e!706067))))

(declare-datatypes ((List!27459 0))(
  ( (Nil!27456) (Cons!27455 (h!28664 (_ BitVec 64)) (t!40928 List!27459)) )
))
(declare-fun arrayNoDuplicates!0 (array!80143 (_ BitVec 32) List!27459) Bool)

(assert (=> b!1245310 (= res!830794 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27456))))

(declare-fun b!1245311 () Bool)

(assert (=> b!1245311 (= e!706067 (and (not (= from!3270 newFrom!287)) (bvsge from!3270 (size!39192 a!3892))))))

(assert (= (and start!104194 res!830793) b!1245310))

(assert (= (and b!1245310 res!830794) b!1245311))

(declare-fun m!1147385 () Bool)

(assert (=> start!104194 m!1147385))

(declare-fun m!1147387 () Bool)

(assert (=> b!1245310 m!1147387))

(push 1)

(assert (not start!104194))

(assert (not b!1245310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

