; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92264 () Bool)

(assert start!92264)

(declare-fun b!1048564 () Bool)

(declare-fun res!697694 () Bool)

(declare-fun e!594760 () Bool)

(assert (=> b!1048564 (=> (not res!697694) (not e!594760))))

(declare-datatypes ((array!66065 0))(
  ( (array!66066 (arr!31772 (Array (_ BitVec 32) (_ BitVec 64))) (size!32308 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66065)

(declare-datatypes ((List!22084 0))(
  ( (Nil!22081) (Cons!22080 (h!23289 (_ BitVec 64)) (t!31391 List!22084)) )
))
(declare-fun arrayNoDuplicates!0 (array!66065 (_ BitVec 32) List!22084) Bool)

(assert (=> b!1048564 (= res!697694 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22081))))

(declare-fun b!1048565 () Bool)

(declare-fun e!594757 () Bool)

(assert (=> b!1048565 (= e!594760 e!594757)))

(declare-fun res!697696 () Bool)

(assert (=> b!1048565 (=> (not res!697696) (not e!594757))))

(declare-fun lt!463229 () array!66065)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048565 (= res!697696 (arrayContainsKey!0 lt!463229 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048565 (= lt!463229 (array!66066 (store (arr!31772 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32308 a!3488)))))

(declare-fun b!1048567 () Bool)

(declare-fun res!697697 () Bool)

(assert (=> b!1048567 (=> (not res!697697) (not e!594760))))

(assert (=> b!1048567 (= res!697697 (= (select (arr!31772 a!3488) i!1381) k0!2747))))

(declare-fun b!1048568 () Bool)

(declare-fun e!594755 () Bool)

(assert (=> b!1048568 (= e!594757 e!594755)))

(declare-fun res!697691 () Bool)

(assert (=> b!1048568 (=> (not res!697691) (not e!594755))))

(declare-fun lt!463230 () (_ BitVec 32))

(assert (=> b!1048568 (= res!697691 (not (= lt!463230 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66065 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048568 (= lt!463230 (arrayScanForKey!0 lt!463229 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048569 () Bool)

(assert (=> b!1048569 (= e!594755 (not true))))

(declare-fun e!594758 () Bool)

(assert (=> b!1048569 e!594758))

(declare-fun res!697692 () Bool)

(assert (=> b!1048569 (=> (not res!697692) (not e!594758))))

(assert (=> b!1048569 (= res!697692 (= (select (store (arr!31772 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463230) k0!2747))))

(declare-fun b!1048570 () Bool)

(declare-fun res!697693 () Bool)

(assert (=> b!1048570 (=> (not res!697693) (not e!594760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048570 (= res!697693 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048571 () Bool)

(declare-fun e!594756 () Bool)

(assert (=> b!1048571 (= e!594758 e!594756)))

(declare-fun res!697690 () Bool)

(assert (=> b!1048571 (=> res!697690 e!594756)))

(assert (=> b!1048571 (= res!697690 (bvsle lt!463230 i!1381))))

(declare-fun res!697695 () Bool)

(assert (=> start!92264 (=> (not res!697695) (not e!594760))))

(assert (=> start!92264 (= res!697695 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32308 a!3488)) (bvslt (size!32308 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92264 e!594760))

(assert (=> start!92264 true))

(declare-fun array_inv!24552 (array!66065) Bool)

(assert (=> start!92264 (array_inv!24552 a!3488)))

(declare-fun b!1048566 () Bool)

(assert (=> b!1048566 (= e!594756 (arrayContainsKey!0 a!3488 k0!2747 lt!463230))))

(assert (= (and start!92264 res!697695) b!1048564))

(assert (= (and b!1048564 res!697694) b!1048570))

(assert (= (and b!1048570 res!697693) b!1048567))

(assert (= (and b!1048567 res!697697) b!1048565))

(assert (= (and b!1048565 res!697696) b!1048568))

(assert (= (and b!1048568 res!697691) b!1048569))

(assert (= (and b!1048569 res!697692) b!1048571))

(assert (= (and b!1048571 (not res!697690)) b!1048566))

(declare-fun m!969503 () Bool)

(assert (=> b!1048570 m!969503))

(declare-fun m!969505 () Bool)

(assert (=> start!92264 m!969505))

(declare-fun m!969507 () Bool)

(assert (=> b!1048566 m!969507))

(declare-fun m!969509 () Bool)

(assert (=> b!1048568 m!969509))

(declare-fun m!969511 () Bool)

(assert (=> b!1048564 m!969511))

(declare-fun m!969513 () Bool)

(assert (=> b!1048569 m!969513))

(declare-fun m!969515 () Bool)

(assert (=> b!1048569 m!969515))

(declare-fun m!969517 () Bool)

(assert (=> b!1048565 m!969517))

(assert (=> b!1048565 m!969513))

(declare-fun m!969519 () Bool)

(assert (=> b!1048567 m!969519))

(check-sat (not b!1048568) (not start!92264) (not b!1048564) (not b!1048565) (not b!1048566) (not b!1048570))
(check-sat)
