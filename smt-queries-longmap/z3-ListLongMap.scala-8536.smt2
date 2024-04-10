; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104132 () Bool)

(assert start!104132)

(declare-fun res!830587 () Bool)

(declare-fun e!705866 () Bool)

(assert (=> start!104132 (=> (not res!830587) (not e!705866))))

(declare-datatypes ((array!80117 0))(
  ( (array!80118 (arr!38646 (Array (_ BitVec 32) (_ BitVec 64))) (size!39182 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80117)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104132 (= res!830587 (and (bvslt (size!39182 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39182 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39182 a!3892))))))

(assert (=> start!104132 e!705866))

(declare-fun array_inv!29494 (array!80117) Bool)

(assert (=> start!104132 (array_inv!29494 a!3892)))

(assert (=> start!104132 true))

(declare-fun b!1245068 () Bool)

(assert (=> b!1245068 (= e!705866 false)))

(declare-fun lt!562865 () Bool)

(declare-datatypes ((List!27449 0))(
  ( (Nil!27446) (Cons!27445 (h!28654 (_ BitVec 64)) (t!40918 List!27449)) )
))
(declare-fun arrayNoDuplicates!0 (array!80117 (_ BitVec 32) List!27449) Bool)

(assert (=> b!1245068 (= lt!562865 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27446))))

(assert (= (and start!104132 res!830587) b!1245068))

(declare-fun m!1147219 () Bool)

(assert (=> start!104132 m!1147219))

(declare-fun m!1147221 () Bool)

(assert (=> b!1245068 m!1147221))

(check-sat (not b!1245068) (not start!104132))
