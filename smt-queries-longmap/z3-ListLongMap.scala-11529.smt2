; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134260 () Bool)

(assert start!134260)

(declare-fun res!1071863 () Bool)

(declare-fun e!874206 () Bool)

(assert (=> start!134260 (=> (not res!1071863) (not e!874206))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104750 0))(
  ( (array!104751 (arr!50555 (Array (_ BitVec 32) (_ BitVec 64))) (size!51105 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104750)

(assert (=> start!134260 (= res!1071863 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51105 a!3481)) (bvslt (size!51105 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134260 e!874206))

(assert (=> start!134260 true))

(declare-fun array_inv!39282 (array!104750) Bool)

(assert (=> start!134260 (array_inv!39282 a!3481)))

(declare-datatypes ((List!36687 0))(
  ( (Nil!36684) (Cons!36683 (h!38130 (_ BitVec 64)) (t!51595 List!36687)) )
))
(declare-fun acc!619 () List!36687)

(declare-fun b!1568173 () Bool)

(declare-fun e!874207 () Bool)

(declare-fun contains!10389 (List!36687 (_ BitVec 64)) Bool)

(assert (=> b!1568173 (= e!874207 (not (contains!10389 acc!619 (select (arr!50555 a!3481) from!2856))))))

(declare-fun b!1568174 () Bool)

(declare-fun res!1071862 () Bool)

(assert (=> b!1568174 (=> (not res!1071862) (not e!874206))))

(assert (=> b!1568174 (= res!1071862 (bvslt from!2856 (size!51105 a!3481)))))

(declare-fun b!1568175 () Bool)

(declare-fun res!1071861 () Bool)

(assert (=> b!1568175 (=> (not res!1071861) (not e!874206))))

(assert (=> b!1568175 (= res!1071861 (not (contains!10389 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568176 () Bool)

(declare-fun res!1071860 () Bool)

(assert (=> b!1568176 (=> (not res!1071860) (not e!874206))))

(declare-fun noDuplicate!2661 (List!36687) Bool)

(assert (=> b!1568176 (= res!1071860 (noDuplicate!2661 acc!619))))

(declare-fun b!1568177 () Bool)

(assert (=> b!1568177 (= e!874206 false)))

(declare-fun lt!673126 () Bool)

(assert (=> b!1568177 (= lt!673126 e!874207)))

(declare-fun res!1071859 () Bool)

(assert (=> b!1568177 (=> res!1071859 e!874207)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568177 (= res!1071859 (not (validKeyInArray!0 (select (arr!50555 a!3481) from!2856))))))

(declare-fun b!1568178 () Bool)

(declare-fun res!1071864 () Bool)

(assert (=> b!1568178 (=> (not res!1071864) (not e!874206))))

(assert (=> b!1568178 (= res!1071864 (not (contains!10389 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134260 res!1071863) b!1568176))

(assert (= (and b!1568176 res!1071860) b!1568175))

(assert (= (and b!1568175 res!1071861) b!1568178))

(assert (= (and b!1568178 res!1071864) b!1568174))

(assert (= (and b!1568174 res!1071862) b!1568177))

(assert (= (and b!1568177 (not res!1071859)) b!1568173))

(declare-fun m!1442889 () Bool)

(assert (=> b!1568178 m!1442889))

(declare-fun m!1442891 () Bool)

(assert (=> b!1568177 m!1442891))

(assert (=> b!1568177 m!1442891))

(declare-fun m!1442893 () Bool)

(assert (=> b!1568177 m!1442893))

(declare-fun m!1442895 () Bool)

(assert (=> start!134260 m!1442895))

(declare-fun m!1442897 () Bool)

(assert (=> b!1568176 m!1442897))

(assert (=> b!1568173 m!1442891))

(assert (=> b!1568173 m!1442891))

(declare-fun m!1442899 () Bool)

(assert (=> b!1568173 m!1442899))

(declare-fun m!1442901 () Bool)

(assert (=> b!1568175 m!1442901))

(check-sat (not b!1568178) (not b!1568173) (not start!134260) (not b!1568175) (not b!1568177) (not b!1568176))
