; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134688 () Bool)

(assert start!134688)

(declare-fun res!1072830 () Bool)

(declare-fun e!875777 () Bool)

(assert (=> start!134688 (=> (not res!1072830) (not e!875777))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104888 0))(
  ( (array!104889 (arr!50617 (Array (_ BitVec 32) (_ BitVec 64))) (size!51168 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104888)

(assert (=> start!134688 (= res!1072830 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51168 a!3481)) (bvslt (size!51168 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134688 e!875777))

(assert (=> start!134688 true))

(declare-fun array_inv!39572 (array!104888) Bool)

(assert (=> start!134688 (array_inv!39572 a!3481)))

(declare-fun b!1570720 () Bool)

(declare-fun res!1072832 () Bool)

(assert (=> b!1570720 (=> (not res!1072832) (not e!875777))))

(declare-datatypes ((List!36727 0))(
  ( (Nil!36724) (Cons!36723 (h!38188 (_ BitVec 64)) (t!51627 List!36727)) )
))
(declare-fun acc!619 () List!36727)

(declare-fun noDuplicate!2690 (List!36727) Bool)

(assert (=> b!1570720 (= res!1072832 (noDuplicate!2690 acc!619))))

(declare-fun b!1570721 () Bool)

(declare-fun res!1072831 () Bool)

(assert (=> b!1570721 (=> (not res!1072831) (not e!875777))))

(declare-fun contains!10442 (List!36727 (_ BitVec 64)) Bool)

(assert (=> b!1570721 (= res!1072831 (not (contains!10442 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570722 () Bool)

(assert (=> b!1570722 (= e!875777 false)))

(declare-fun lt!674058 () Bool)

(assert (=> b!1570722 (= lt!674058 (contains!10442 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134688 res!1072830) b!1570720))

(assert (= (and b!1570720 res!1072832) b!1570721))

(assert (= (and b!1570721 res!1072831) b!1570722))

(declare-fun m!1445241 () Bool)

(assert (=> start!134688 m!1445241))

(declare-fun m!1445243 () Bool)

(assert (=> b!1570720 m!1445243))

(declare-fun m!1445245 () Bool)

(assert (=> b!1570721 m!1445245))

(declare-fun m!1445247 () Bool)

(assert (=> b!1570722 m!1445247))

(check-sat (not b!1570720) (not start!134688) (not b!1570721) (not b!1570722))
(check-sat)
