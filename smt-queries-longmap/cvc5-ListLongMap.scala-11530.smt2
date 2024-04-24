; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134680 () Bool)

(assert start!134680)

(declare-fun res!1072791 () Bool)

(declare-fun e!875751 () Bool)

(assert (=> start!134680 (=> (not res!1072791) (not e!875751))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104880 0))(
  ( (array!104881 (arr!50613 (Array (_ BitVec 32) (_ BitVec 64))) (size!51164 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104880)

(assert (=> start!134680 (= res!1072791 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51164 a!3481)) (bvslt (size!51164 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134680 e!875751))

(assert (=> start!134680 true))

(declare-fun array_inv!39568 (array!104880) Bool)

(assert (=> start!134680 (array_inv!39568 a!3481)))

(declare-fun b!1570681 () Bool)

(declare-fun res!1072793 () Bool)

(assert (=> b!1570681 (=> (not res!1072793) (not e!875751))))

(declare-datatypes ((List!36723 0))(
  ( (Nil!36720) (Cons!36719 (h!38184 (_ BitVec 64)) (t!51623 List!36723)) )
))
(declare-fun acc!619 () List!36723)

(declare-fun noDuplicate!2686 (List!36723) Bool)

(assert (=> b!1570681 (= res!1072793 (noDuplicate!2686 acc!619))))

(declare-fun b!1570682 () Bool)

(assert (=> b!1570682 (= e!875751 false)))

(declare-fun lt!674046 () Bool)

(declare-fun e!875753 () Bool)

(assert (=> b!1570682 (= lt!674046 e!875753)))

(declare-fun res!1072796 () Bool)

(assert (=> b!1570682 (=> res!1072796 e!875753)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570682 (= res!1072796 (not (validKeyInArray!0 (select (arr!50613 a!3481) from!2856))))))

(declare-fun b!1570683 () Bool)

(declare-fun res!1072795 () Bool)

(assert (=> b!1570683 (=> (not res!1072795) (not e!875751))))

(assert (=> b!1570683 (= res!1072795 (bvslt from!2856 (size!51164 a!3481)))))

(declare-fun b!1570684 () Bool)

(declare-fun contains!10438 (List!36723 (_ BitVec 64)) Bool)

(assert (=> b!1570684 (= e!875753 (not (contains!10438 acc!619 (select (arr!50613 a!3481) from!2856))))))

(declare-fun b!1570685 () Bool)

(declare-fun res!1072794 () Bool)

(assert (=> b!1570685 (=> (not res!1072794) (not e!875751))))

(assert (=> b!1570685 (= res!1072794 (not (contains!10438 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570686 () Bool)

(declare-fun res!1072792 () Bool)

(assert (=> b!1570686 (=> (not res!1072792) (not e!875751))))

(assert (=> b!1570686 (= res!1072792 (not (contains!10438 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134680 res!1072791) b!1570681))

(assert (= (and b!1570681 res!1072793) b!1570685))

(assert (= (and b!1570685 res!1072794) b!1570686))

(assert (= (and b!1570686 res!1072792) b!1570683))

(assert (= (and b!1570683 res!1072795) b!1570682))

(assert (= (and b!1570682 (not res!1072796)) b!1570684))

(declare-fun m!1445203 () Bool)

(assert (=> b!1570682 m!1445203))

(assert (=> b!1570682 m!1445203))

(declare-fun m!1445205 () Bool)

(assert (=> b!1570682 m!1445205))

(declare-fun m!1445207 () Bool)

(assert (=> start!134680 m!1445207))

(declare-fun m!1445209 () Bool)

(assert (=> b!1570686 m!1445209))

(declare-fun m!1445211 () Bool)

(assert (=> b!1570681 m!1445211))

(declare-fun m!1445213 () Bool)

(assert (=> b!1570685 m!1445213))

(assert (=> b!1570684 m!1445203))

(assert (=> b!1570684 m!1445203))

(declare-fun m!1445215 () Bool)

(assert (=> b!1570684 m!1445215))

(push 1)

(assert (not b!1570684))

(assert (not b!1570686))

(assert (not b!1570682))

(assert (not start!134680))

(assert (not b!1570685))

(assert (not b!1570681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

