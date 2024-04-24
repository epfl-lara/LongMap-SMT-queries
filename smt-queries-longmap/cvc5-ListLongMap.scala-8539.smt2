; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104426 () Bool)

(assert start!104426)

(declare-fun res!831317 () Bool)

(declare-fun e!706920 () Bool)

(assert (=> start!104426 (=> (not res!831317) (not e!706920))))

(declare-datatypes ((array!80177 0))(
  ( (array!80178 (arr!38668 (Array (_ BitVec 32) (_ BitVec 64))) (size!39205 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80177)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104426 (= res!831317 (and (bvslt (size!39205 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39205 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39205 a!3892))))))

(assert (=> start!104426 e!706920))

(declare-fun array_inv!29606 (array!80177) Bool)

(assert (=> start!104426 (array_inv!29606 a!3892)))

(assert (=> start!104426 true))

(declare-fun b!1246623 () Bool)

(declare-fun res!831318 () Bool)

(assert (=> b!1246623 (=> (not res!831318) (not e!706920))))

(declare-datatypes ((List!27484 0))(
  ( (Nil!27481) (Cons!27480 (h!28698 (_ BitVec 64)) (t!40945 List!27484)) )
))
(declare-fun arrayNoDuplicates!0 (array!80177 (_ BitVec 32) List!27484) Bool)

(assert (=> b!1246623 (= res!831318 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27481))))

(declare-fun b!1246624 () Bool)

(assert (=> b!1246624 (= e!706920 (and (not (= from!3270 newFrom!287)) (bvsge from!3270 (size!39205 a!3892))))))

(assert (= (and start!104426 res!831317) b!1246623))

(assert (= (and b!1246623 res!831318) b!1246624))

(declare-fun m!1149009 () Bool)

(assert (=> start!104426 m!1149009))

(declare-fun m!1149011 () Bool)

(assert (=> b!1246623 m!1149011))

(push 1)

(assert (not b!1246623))

(assert (not start!104426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

