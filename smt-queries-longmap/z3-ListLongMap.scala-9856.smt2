; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116824 () Bool)

(assert start!116824)

(declare-fun b!1376680 () Bool)

(declare-fun res!919569 () Bool)

(declare-fun e!779833 () Bool)

(assert (=> b!1376680 (=> (not res!919569) (not e!779833))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93493 0))(
  ( (array!93494 (arr!45150 (Array (_ BitVec 32) (_ BitVec 64))) (size!45700 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93493)

(assert (=> b!1376680 (= res!919569 (and (bvslt (size!45700 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45700 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919568 () Bool)

(assert (=> start!116824 (=> (not res!919568) (not e!779833))))

(assert (=> start!116824 (= res!919568 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45700 a!4032))))))

(assert (=> start!116824 e!779833))

(assert (=> start!116824 true))

(declare-fun array_inv!34178 (array!93493) Bool)

(assert (=> start!116824 (array_inv!34178 a!4032)))

(declare-fun b!1376681 () Bool)

(declare-fun res!919567 () Bool)

(assert (=> b!1376681 (=> (not res!919567) (not e!779833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376681 (= res!919567 (not (validKeyInArray!0 (select (arr!45150 a!4032) to!206))))))

(declare-fun b!1376682 () Bool)

(declare-fun res!919564 () Bool)

(assert (=> b!1376682 (=> (not res!919564) (not e!779833))))

(assert (=> b!1376682 (= res!919564 (not (= to!206 (size!45700 a!4032))))))

(declare-fun b!1376683 () Bool)

(declare-fun res!919565 () Bool)

(assert (=> b!1376683 (=> (not res!919565) (not e!779833))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376683 (= res!919565 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376684 () Bool)

(declare-fun res!919570 () Bool)

(assert (=> b!1376684 (=> (not res!919570) (not e!779833))))

(declare-fun arrayCountValidKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376684 (= res!919570 (= (arrayCountValidKeys!0 (array!93494 (store (arr!45150 a!4032) i!1445 k0!2947) (size!45700 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376685 () Bool)

(declare-fun res!919566 () Bool)

(assert (=> b!1376685 (=> (not res!919566) (not e!779833))))

(assert (=> b!1376685 (= res!919566 (validKeyInArray!0 (select (arr!45150 a!4032) i!1445)))))

(declare-fun b!1376686 () Bool)

(assert (=> b!1376686 (= e!779833 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45700 a!4032))))))

(assert (= (and start!116824 res!919568) b!1376685))

(assert (= (and b!1376685 res!919566) b!1376683))

(assert (= (and b!1376683 res!919565) b!1376680))

(assert (= (and b!1376680 res!919569) b!1376684))

(assert (= (and b!1376684 res!919570) b!1376682))

(assert (= (and b!1376682 res!919564) b!1376681))

(assert (= (and b!1376681 res!919567) b!1376686))

(declare-fun m!1260751 () Bool)

(assert (=> start!116824 m!1260751))

(declare-fun m!1260753 () Bool)

(assert (=> b!1376683 m!1260753))

(declare-fun m!1260755 () Bool)

(assert (=> b!1376685 m!1260755))

(assert (=> b!1376685 m!1260755))

(declare-fun m!1260757 () Bool)

(assert (=> b!1376685 m!1260757))

(declare-fun m!1260759 () Bool)

(assert (=> b!1376681 m!1260759))

(assert (=> b!1376681 m!1260759))

(declare-fun m!1260761 () Bool)

(assert (=> b!1376681 m!1260761))

(declare-fun m!1260763 () Bool)

(assert (=> b!1376684 m!1260763))

(declare-fun m!1260765 () Bool)

(assert (=> b!1376684 m!1260765))

(declare-fun m!1260767 () Bool)

(assert (=> b!1376684 m!1260767))

(check-sat (not start!116824) (not b!1376685) (not b!1376684) (not b!1376683) (not b!1376681))
(check-sat)
