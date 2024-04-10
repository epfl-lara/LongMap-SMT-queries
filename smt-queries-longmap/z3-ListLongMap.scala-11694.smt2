; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136774 () Bool)

(assert start!136774)

(declare-fun res!1078589 () Bool)

(declare-fun e!880522 () Bool)

(assert (=> start!136774 (=> (not res!1078589) (not e!880522))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105772 0))(
  ( (array!105773 (arr!50996 (Array (_ BitVec 32) (_ BitVec 64))) (size!51546 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105772)

(assert (=> start!136774 (= res!1078589 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51546 a!3559)) (bvslt (size!51546 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136774 e!880522))

(assert (=> start!136774 true))

(declare-fun array_inv!39723 (array!105772) Bool)

(assert (=> start!136774 (array_inv!39723 a!3559)))

(declare-fun b!1578650 () Bool)

(declare-fun res!1078590 () Bool)

(assert (=> b!1578650 (=> (not res!1078590) (not e!880522))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578650 (= res!1078590 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578651 () Bool)

(assert (=> b!1578651 (= e!880522 (and (bvsle from!2937 #b00000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!51546 a!3559))))))

(assert (= (and start!136774 res!1078589) b!1578650))

(assert (= (and b!1578650 res!1078590) b!1578651))

(declare-fun m!1450715 () Bool)

(assert (=> start!136774 m!1450715))

(declare-fun m!1450717 () Bool)

(assert (=> b!1578650 m!1450717))

(check-sat (not start!136774) (not b!1578650))
(check-sat)
