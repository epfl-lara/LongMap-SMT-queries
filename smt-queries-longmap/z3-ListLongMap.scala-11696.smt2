; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136786 () Bool)

(assert start!136786)

(declare-fun res!1078632 () Bool)

(declare-fun e!880558 () Bool)

(assert (=> start!136786 (=> (not res!1078632) (not e!880558))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105784 0))(
  ( (array!105785 (arr!51002 (Array (_ BitVec 32) (_ BitVec 64))) (size!51552 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105784)

(assert (=> start!136786 (= res!1078632 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51552 a!3559)) (bvslt (size!51552 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136786 e!880558))

(assert (=> start!136786 true))

(declare-fun array_inv!39729 (array!105784) Bool)

(assert (=> start!136786 (array_inv!39729 a!3559)))

(declare-fun b!1578691 () Bool)

(declare-fun res!1078630 () Bool)

(assert (=> b!1578691 (=> (not res!1078630) (not e!880558))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578691 (= res!1078630 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578692 () Bool)

(declare-fun res!1078631 () Bool)

(assert (=> b!1578692 (=> (not res!1078631) (not e!880558))))

(assert (=> b!1578692 (= res!1078631 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51552 a!3559))))))

(declare-fun b!1578693 () Bool)

(assert (=> b!1578693 (= e!880558 (not (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001))))))

(assert (= (and start!136786 res!1078632) b!1578691))

(assert (= (and b!1578691 res!1078630) b!1578692))

(assert (= (and b!1578692 res!1078631) b!1578693))

(declare-fun m!1450741 () Bool)

(assert (=> start!136786 m!1450741))

(declare-fun m!1450743 () Bool)

(assert (=> b!1578691 m!1450743))

(declare-fun m!1450745 () Bool)

(assert (=> b!1578693 m!1450745))

(check-sat (not b!1578691) (not start!136786) (not b!1578693))
(check-sat)
(get-model)

(declare-fun d!166121 () Bool)

(declare-fun res!1078646 () Bool)

(declare-fun e!880570 () Bool)

(assert (=> d!166121 (=> res!1078646 e!880570)))

(assert (=> d!166121 (= res!1078646 (= (select (arr!51002 a!3559) from!2937) k0!2792))))

(assert (=> d!166121 (= (arrayContainsKey!0 a!3559 k0!2792 from!2937) e!880570)))

(declare-fun b!1578707 () Bool)

(declare-fun e!880571 () Bool)

(assert (=> b!1578707 (= e!880570 e!880571)))

(declare-fun res!1078647 () Bool)

(assert (=> b!1578707 (=> (not res!1078647) (not e!880571))))

(assert (=> b!1578707 (= res!1078647 (bvslt (bvadd from!2937 #b00000000000000000000000000000001) (size!51552 a!3559)))))

(declare-fun b!1578708 () Bool)

(assert (=> b!1578708 (= e!880571 (arrayContainsKey!0 a!3559 k0!2792 (bvadd from!2937 #b00000000000000000000000000000001)))))

(assert (= (and d!166121 (not res!1078646)) b!1578707))

(assert (= (and b!1578707 res!1078647) b!1578708))

(declare-fun m!1450753 () Bool)

(assert (=> d!166121 m!1450753))

(declare-fun m!1450755 () Bool)

(assert (=> b!1578708 m!1450755))

(assert (=> b!1578691 d!166121))

(declare-fun d!166123 () Bool)

(assert (=> d!166123 (= (array_inv!39729 a!3559) (bvsge (size!51552 a!3559) #b00000000000000000000000000000000))))

(assert (=> start!136786 d!166123))

(declare-fun d!166125 () Bool)

(declare-fun res!1078648 () Bool)

(declare-fun e!880572 () Bool)

(assert (=> d!166125 (=> res!1078648 e!880572)))

(assert (=> d!166125 (= res!1078648 (= (select (arr!51002 a!3559) (bvsub from!2937 #b00000000000000000000000000000001)) k0!2792))))

(assert (=> d!166125 (= (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)) e!880572)))

(declare-fun b!1578709 () Bool)

(declare-fun e!880573 () Bool)

(assert (=> b!1578709 (= e!880572 e!880573)))

(declare-fun res!1078649 () Bool)

(assert (=> b!1578709 (=> (not res!1078649) (not e!880573))))

(assert (=> b!1578709 (= res!1078649 (bvslt (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!51552 a!3559)))))

(declare-fun b!1578710 () Bool)

(assert (=> b!1578710 (= e!880573 (arrayContainsKey!0 a!3559 k0!2792 (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!166125 (not res!1078648)) b!1578709))

(assert (= (and b!1578709 res!1078649) b!1578710))

(declare-fun m!1450757 () Bool)

(assert (=> d!166125 m!1450757))

(declare-fun m!1450759 () Bool)

(assert (=> b!1578710 m!1450759))

(assert (=> b!1578693 d!166125))

(check-sat (not b!1578708) (not b!1578710))
(check-sat)
