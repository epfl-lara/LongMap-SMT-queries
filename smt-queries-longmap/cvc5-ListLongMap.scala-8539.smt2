; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104190 () Bool)

(assert start!104190)

(declare-fun res!830753 () Bool)

(declare-fun e!706022 () Bool)

(assert (=> start!104190 (=> (not res!830753) (not e!706022))))

(declare-datatypes ((array!80064 0))(
  ( (array!80065 (arr!38617 (Array (_ BitVec 32) (_ BitVec 64))) (size!39155 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80064)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104190 (= res!830753 (and (bvslt (size!39155 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39155 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39155 a!3892))))))

(assert (=> start!104190 e!706022))

(declare-fun array_inv!29600 (array!80064) Bool)

(assert (=> start!104190 (array_inv!29600 a!3892)))

(assert (=> start!104190 true))

(declare-fun b!1245228 () Bool)

(declare-fun res!830754 () Bool)

(assert (=> b!1245228 (=> (not res!830754) (not e!706022))))

(declare-datatypes ((List!27521 0))(
  ( (Nil!27518) (Cons!27517 (h!28726 (_ BitVec 64)) (t!40981 List!27521)) )
))
(declare-fun arrayNoDuplicates!0 (array!80064 (_ BitVec 32) List!27521) Bool)

(assert (=> b!1245228 (= res!830754 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27518))))

(declare-fun b!1245229 () Bool)

(assert (=> b!1245229 (= e!706022 (and (not (= from!3270 newFrom!287)) (bvsge from!3270 (size!39155 a!3892))))))

(assert (= (and start!104190 res!830753) b!1245228))

(assert (= (and b!1245228 res!830754) b!1245229))

(declare-fun m!1146863 () Bool)

(assert (=> start!104190 m!1146863))

(declare-fun m!1146865 () Bool)

(assert (=> b!1245228 m!1146865))

(push 1)

(assert (not start!104190))

(assert (not b!1245228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

