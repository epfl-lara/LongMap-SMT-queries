; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136780 () Bool)

(assert start!136780)

(declare-fun res!1078607 () Bool)

(declare-fun e!880540 () Bool)

(assert (=> start!136780 (=> (not res!1078607) (not e!880540))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105778 0))(
  ( (array!105779 (arr!50999 (Array (_ BitVec 32) (_ BitVec 64))) (size!51549 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105778)

(assert (=> start!136780 (= res!1078607 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51549 a!3559)) (bvslt (size!51549 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136780 e!880540))

(assert (=> start!136780 true))

(declare-fun array_inv!39726 (array!105778) Bool)

(assert (=> start!136780 (array_inv!39726 a!3559)))

(declare-fun b!1578668 () Bool)

(declare-fun res!1078608 () Bool)

(assert (=> b!1578668 (=> (not res!1078608) (not e!880540))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578668 (= res!1078608 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578669 () Bool)

(assert (=> b!1578669 (= e!880540 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvsge (bvsub from!2937 #b00000000000000000000000000000001) (size!51549 a!3559))))))

(assert (= (and start!136780 res!1078607) b!1578668))

(assert (= (and b!1578668 res!1078608) b!1578669))

(declare-fun m!1450727 () Bool)

(assert (=> start!136780 m!1450727))

(declare-fun m!1450729 () Bool)

(assert (=> b!1578668 m!1450729))

(check-sat (not start!136780) (not b!1578668))
(check-sat)
