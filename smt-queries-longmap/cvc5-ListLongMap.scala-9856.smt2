; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116822 () Bool)

(assert start!116822)

(declare-fun b!1376659 () Bool)

(declare-fun res!919545 () Bool)

(declare-fun e!779826 () Bool)

(assert (=> b!1376659 (=> (not res!919545) (not e!779826))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376659 (= res!919545 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376660 () Bool)

(declare-fun res!919544 () Bool)

(assert (=> b!1376660 (=> (not res!919544) (not e!779826))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93491 0))(
  ( (array!93492 (arr!45149 (Array (_ BitVec 32) (_ BitVec 64))) (size!45699 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93491)

(declare-fun arrayCountValidKeys!0 (array!93491 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376660 (= res!919544 (= (arrayCountValidKeys!0 (array!93492 (store (arr!45149 a!4032) i!1445 k!2947) (size!45699 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376661 () Bool)

(declare-fun res!919543 () Bool)

(assert (=> b!1376661 (=> (not res!919543) (not e!779826))))

(assert (=> b!1376661 (= res!919543 (not (= to!206 (size!45699 a!4032))))))

(declare-fun b!1376662 () Bool)

(declare-fun res!919549 () Bool)

(assert (=> b!1376662 (=> (not res!919549) (not e!779826))))

(assert (=> b!1376662 (= res!919549 (validKeyInArray!0 (select (arr!45149 a!4032) i!1445)))))

(declare-fun b!1376663 () Bool)

(declare-fun res!919548 () Bool)

(assert (=> b!1376663 (=> (not res!919548) (not e!779826))))

(assert (=> b!1376663 (= res!919548 (not (validKeyInArray!0 (select (arr!45149 a!4032) to!206))))))

(declare-fun res!919547 () Bool)

(assert (=> start!116822 (=> (not res!919547) (not e!779826))))

(assert (=> start!116822 (= res!919547 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45699 a!4032))))))

(assert (=> start!116822 e!779826))

(assert (=> start!116822 true))

(declare-fun array_inv!34177 (array!93491) Bool)

(assert (=> start!116822 (array_inv!34177 a!4032)))

(declare-fun b!1376664 () Bool)

(declare-fun res!919546 () Bool)

(assert (=> b!1376664 (=> (not res!919546) (not e!779826))))

(assert (=> b!1376664 (= res!919546 (and (bvslt (size!45699 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45699 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376665 () Bool)

(assert (=> b!1376665 (= e!779826 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45699 a!4032))))))

(assert (= (and start!116822 res!919547) b!1376662))

(assert (= (and b!1376662 res!919549) b!1376659))

(assert (= (and b!1376659 res!919545) b!1376664))

(assert (= (and b!1376664 res!919546) b!1376660))

(assert (= (and b!1376660 res!919544) b!1376661))

(assert (= (and b!1376661 res!919543) b!1376663))

(assert (= (and b!1376663 res!919548) b!1376665))

(declare-fun m!1260733 () Bool)

(assert (=> b!1376662 m!1260733))

(assert (=> b!1376662 m!1260733))

(declare-fun m!1260735 () Bool)

(assert (=> b!1376662 m!1260735))

(declare-fun m!1260737 () Bool)

(assert (=> b!1376660 m!1260737))

(declare-fun m!1260739 () Bool)

(assert (=> b!1376660 m!1260739))

(declare-fun m!1260741 () Bool)

(assert (=> b!1376660 m!1260741))

(declare-fun m!1260743 () Bool)

(assert (=> start!116822 m!1260743))

(declare-fun m!1260745 () Bool)

(assert (=> b!1376659 m!1260745))

(declare-fun m!1260747 () Bool)

(assert (=> b!1376663 m!1260747))

(assert (=> b!1376663 m!1260747))

(declare-fun m!1260749 () Bool)

(assert (=> b!1376663 m!1260749))

(push 1)

(assert (not b!1376659))

(assert (not b!1376663))

(assert (not b!1376660))

(assert (not b!1376662))

(assert (not start!116822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

