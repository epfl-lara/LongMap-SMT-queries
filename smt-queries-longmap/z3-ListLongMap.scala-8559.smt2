; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104514 () Bool)

(assert start!104514)

(declare-fun res!832064 () Bool)

(declare-fun e!707179 () Bool)

(assert (=> start!104514 (=> (not res!832064) (not e!707179))))

(declare-datatypes ((array!80201 0))(
  ( (array!80202 (arr!38675 (Array (_ BitVec 32) (_ BitVec 64))) (size!39213 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80201)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104514 (= res!832064 (and (bvslt (size!39213 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39213 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39213 a!3892))))))

(assert (=> start!104514 e!707179))

(declare-fun array_inv!29658 (array!80201) Bool)

(assert (=> start!104514 (array_inv!29658 a!3892)))

(assert (=> start!104514 true))

(declare-fun b!1246830 () Bool)

(declare-fun res!832063 () Bool)

(assert (=> b!1246830 (=> (not res!832063) (not e!707179))))

(declare-datatypes ((List!27579 0))(
  ( (Nil!27576) (Cons!27575 (h!28784 (_ BitVec 64)) (t!41039 List!27579)) )
))
(declare-fun arrayNoDuplicates!0 (array!80201 (_ BitVec 32) List!27579) Bool)

(assert (=> b!1246830 (= res!832063 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27576))))

(declare-fun b!1246831 () Bool)

(declare-fun res!832065 () Bool)

(assert (=> b!1246831 (=> (not res!832065) (not e!707179))))

(assert (=> b!1246831 (= res!832065 (= from!3270 newFrom!287))))

(declare-fun b!1246832 () Bool)

(assert (=> b!1246832 (= e!707179 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27576)))))

(assert (= (and start!104514 res!832064) b!1246830))

(assert (= (and b!1246830 res!832063) b!1246831))

(assert (= (and b!1246831 res!832065) b!1246832))

(declare-fun m!1148101 () Bool)

(assert (=> start!104514 m!1148101))

(declare-fun m!1148103 () Bool)

(assert (=> b!1246830 m!1148103))

(declare-fun m!1148105 () Bool)

(assert (=> b!1246832 m!1148105))

(check-sat (not b!1246832) (not b!1246830) (not start!104514))
(check-sat)
