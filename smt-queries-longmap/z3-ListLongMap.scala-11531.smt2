; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134220 () Bool)

(assert start!134220)

(declare-fun res!1071816 () Bool)

(declare-fun e!874052 () Bool)

(assert (=> start!134220 (=> (not res!1071816) (not e!874052))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104688 0))(
  ( (array!104689 (arr!50525 (Array (_ BitVec 32) (_ BitVec 64))) (size!51077 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104688)

(assert (=> start!134220 (= res!1071816 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51077 a!3481)) (bvslt (size!51077 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134220 e!874052))

(assert (=> start!134220 true))

(declare-fun array_inv!39461 (array!104688) Bool)

(assert (=> start!134220 (array_inv!39461 a!3481)))

(declare-fun b!1567944 () Bool)

(declare-fun res!1071814 () Bool)

(assert (=> b!1567944 (=> (not res!1071814) (not e!874052))))

(declare-datatypes ((List!36733 0))(
  ( (Nil!36730) (Cons!36729 (h!38177 (_ BitVec 64)) (t!51633 List!36733)) )
))
(declare-fun acc!619 () List!36733)

(declare-fun noDuplicate!2690 (List!36733) Bool)

(assert (=> b!1567944 (= res!1071814 (noDuplicate!2690 acc!619))))

(declare-fun b!1567945 () Bool)

(declare-fun res!1071815 () Bool)

(assert (=> b!1567945 (=> (not res!1071815) (not e!874052))))

(declare-fun contains!10349 (List!36733 (_ BitVec 64)) Bool)

(assert (=> b!1567945 (= res!1071815 (not (contains!10349 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567946 () Bool)

(assert (=> b!1567946 (= e!874052 false)))

(declare-fun lt!672855 () Bool)

(assert (=> b!1567946 (= lt!672855 (contains!10349 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134220 res!1071816) b!1567944))

(assert (= (and b!1567944 res!1071814) b!1567945))

(assert (= (and b!1567945 res!1071815) b!1567946))

(declare-fun m!1442067 () Bool)

(assert (=> start!134220 m!1442067))

(declare-fun m!1442069 () Bool)

(assert (=> b!1567944 m!1442069))

(declare-fun m!1442071 () Bool)

(assert (=> b!1567945 m!1442071))

(declare-fun m!1442073 () Bool)

(assert (=> b!1567946 m!1442073))

(check-sat (not b!1567946) (not b!1567944) (not b!1567945) (not start!134220))
(check-sat)
