; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136780 () Bool)

(assert start!136780)

(declare-fun res!1078616 () Bool)

(declare-fun e!880433 () Bool)

(assert (=> start!136780 (=> (not res!1078616) (not e!880433))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105734 0))(
  ( (array!105735 (arr!50975 (Array (_ BitVec 32) (_ BitVec 64))) (size!51527 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105734)

(assert (=> start!136780 (= res!1078616 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51527 a!3559)) (bvslt (size!51527 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136780 e!880433))

(assert (=> start!136780 true))

(declare-fun array_inv!39911 (array!105734) Bool)

(assert (=> start!136780 (array_inv!39911 a!3559)))

(declare-fun b!1578492 () Bool)

(declare-fun res!1078617 () Bool)

(assert (=> b!1578492 (=> (not res!1078617) (not e!880433))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578492 (= res!1078617 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578493 () Bool)

(declare-fun res!1078615 () Bool)

(assert (=> b!1578493 (=> (not res!1078615) (not e!880433))))

(assert (=> b!1578493 (= res!1078615 (bvsle from!2937 #b00000000000000000000000000000000))))

(declare-fun b!1578494 () Bool)

(assert (=> b!1578494 (= e!880433 (not (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))))

(assert (= (and start!136780 res!1078616) b!1578492))

(assert (= (and b!1578492 res!1078617) b!1578493))

(assert (= (and b!1578493 res!1078615) b!1578494))

(declare-fun m!1449945 () Bool)

(assert (=> start!136780 m!1449945))

(declare-fun m!1449947 () Bool)

(assert (=> b!1578492 m!1449947))

(declare-fun m!1449949 () Bool)

(assert (=> b!1578494 m!1449949))

(check-sat (not b!1578492) (not start!136780) (not b!1578494))
(check-sat)
