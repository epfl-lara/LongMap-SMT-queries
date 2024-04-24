; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134658 () Bool)

(assert start!134658)

(declare-fun res!1072586 () Bool)

(declare-fun e!875647 () Bool)

(assert (=> start!134658 (=> (not res!1072586) (not e!875647))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104858 0))(
  ( (array!104859 (arr!50602 (Array (_ BitVec 32) (_ BitVec 64))) (size!51153 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104858)

(assert (=> start!134658 (= res!1072586 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51153 a!3481)) (bvslt (size!51153 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134658 e!875647))

(assert (=> start!134658 true))

(declare-fun array_inv!39557 (array!104858) Bool)

(assert (=> start!134658 (array_inv!39557 a!3481)))

(declare-fun b!1570476 () Bool)

(declare-fun res!1072590 () Bool)

(assert (=> b!1570476 (=> (not res!1072590) (not e!875647))))

(declare-datatypes ((List!36712 0))(
  ( (Nil!36709) (Cons!36708 (h!38173 (_ BitVec 64)) (t!51612 List!36712)) )
))
(declare-fun acc!619 () List!36712)

(declare-fun contains!10427 (List!36712 (_ BitVec 64)) Bool)

(assert (=> b!1570476 (= res!1072590 (not (contains!10427 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570477 () Bool)

(declare-fun res!1072592 () Bool)

(assert (=> b!1570477 (=> (not res!1072592) (not e!875647))))

(declare-fun noDuplicate!2675 (List!36712) Bool)

(assert (=> b!1570477 (= res!1072592 (noDuplicate!2675 acc!619))))

(declare-fun b!1570478 () Bool)

(declare-fun e!875646 () Bool)

(declare-fun lt!674013 () Bool)

(assert (=> b!1570478 (= e!875646 (and (not lt!674013) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1570479 () Bool)

(declare-fun res!1072588 () Bool)

(assert (=> b!1570479 (=> (not res!1072588) (not e!875647))))

(assert (=> b!1570479 (= res!1072588 (not (contains!10427 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570480 () Bool)

(declare-fun e!875648 () Bool)

(assert (=> b!1570480 (= e!875648 (not (contains!10427 acc!619 (select (arr!50602 a!3481) from!2856))))))

(declare-fun b!1570481 () Bool)

(declare-fun res!1072587 () Bool)

(assert (=> b!1570481 (=> (not res!1072587) (not e!875647))))

(assert (=> b!1570481 (= res!1072587 (bvslt from!2856 (size!51153 a!3481)))))

(declare-fun b!1570482 () Bool)

(assert (=> b!1570482 (= e!875647 e!875646)))

(declare-fun res!1072591 () Bool)

(assert (=> b!1570482 (=> (not res!1072591) (not e!875646))))

(assert (=> b!1570482 (= res!1072591 e!875648)))

(declare-fun res!1072589 () Bool)

(assert (=> b!1570482 (=> res!1072589 e!875648)))

(assert (=> b!1570482 (= res!1072589 (not lt!674013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570482 (= lt!674013 (validKeyInArray!0 (select (arr!50602 a!3481) from!2856)))))

(assert (= (and start!134658 res!1072586) b!1570477))

(assert (= (and b!1570477 res!1072592) b!1570476))

(assert (= (and b!1570476 res!1072590) b!1570479))

(assert (= (and b!1570479 res!1072588) b!1570481))

(assert (= (and b!1570481 res!1072587) b!1570482))

(assert (= (and b!1570482 (not res!1072589)) b!1570480))

(assert (= (and b!1570482 res!1072591) b!1570478))

(declare-fun m!1445049 () Bool)

(assert (=> b!1570482 m!1445049))

(assert (=> b!1570482 m!1445049))

(declare-fun m!1445051 () Bool)

(assert (=> b!1570482 m!1445051))

(assert (=> b!1570480 m!1445049))

(assert (=> b!1570480 m!1445049))

(declare-fun m!1445053 () Bool)

(assert (=> b!1570480 m!1445053))

(declare-fun m!1445055 () Bool)

(assert (=> b!1570476 m!1445055))

(declare-fun m!1445057 () Bool)

(assert (=> start!134658 m!1445057))

(declare-fun m!1445059 () Bool)

(assert (=> b!1570479 m!1445059))

(declare-fun m!1445061 () Bool)

(assert (=> b!1570477 m!1445061))

(check-sat (not start!134658) (not b!1570479) (not b!1570480) (not b!1570476) (not b!1570477) (not b!1570482))
(check-sat)
