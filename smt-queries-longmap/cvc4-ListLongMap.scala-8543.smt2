; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104448 () Bool)

(assert start!104448)

(declare-fun res!831351 () Bool)

(declare-fun e!706986 () Bool)

(assert (=> start!104448 (=> (not res!831351) (not e!706986))))

(declare-datatypes ((array!80199 0))(
  ( (array!80200 (arr!38679 (Array (_ BitVec 32) (_ BitVec 64))) (size!39216 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80199)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104448 (= res!831351 (and (bvslt (size!39216 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39216 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39216 a!3892))))))

(assert (=> start!104448 e!706986))

(declare-fun array_inv!29617 (array!80199) Bool)

(assert (=> start!104448 (array_inv!29617 a!3892)))

(assert (=> start!104448 true))

(declare-fun b!1246657 () Bool)

(assert (=> b!1246657 (= e!706986 false)))

(declare-fun lt!563399 () Bool)

(declare-datatypes ((List!27495 0))(
  ( (Nil!27492) (Cons!27491 (h!28709 (_ BitVec 64)) (t!40956 List!27495)) )
))
(declare-fun arrayNoDuplicates!0 (array!80199 (_ BitVec 32) List!27495) Bool)

(assert (=> b!1246657 (= lt!563399 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27492))))

(assert (= (and start!104448 res!831351) b!1246657))

(declare-fun m!1149053 () Bool)

(assert (=> start!104448 m!1149053))

(declare-fun m!1149055 () Bool)

(assert (=> b!1246657 m!1149055))

(push 1)

(assert (not b!1246657))

(assert (not start!104448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

