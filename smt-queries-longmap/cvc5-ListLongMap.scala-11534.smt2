; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134704 () Bool)

(assert start!134704)

(declare-fun b!1570816 () Bool)

(declare-fun e!875834 () Bool)

(assert (=> b!1570816 (= e!875834 false)))

(declare-fun lt!674082 () Bool)

(declare-fun e!875832 () Bool)

(assert (=> b!1570816 (= lt!674082 e!875832)))

(declare-fun res!1072928 () Bool)

(assert (=> b!1570816 (=> res!1072928 e!875832)))

(declare-datatypes ((array!104904 0))(
  ( (array!104905 (arr!50625 (Array (_ BitVec 32) (_ BitVec 64))) (size!51176 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104904)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570816 (= res!1072928 (not (validKeyInArray!0 (select (arr!50625 a!3481) from!2856))))))

(declare-datatypes ((List!36735 0))(
  ( (Nil!36732) (Cons!36731 (h!38196 (_ BitVec 64)) (t!51635 List!36735)) )
))
(declare-fun acc!619 () List!36735)

(declare-fun b!1570817 () Bool)

(declare-fun contains!10450 (List!36735 (_ BitVec 64)) Bool)

(assert (=> b!1570817 (= e!875832 (not (contains!10450 acc!619 (select (arr!50625 a!3481) from!2856))))))

(declare-fun b!1570818 () Bool)

(declare-fun res!1072927 () Bool)

(assert (=> b!1570818 (=> (not res!1072927) (not e!875834))))

(assert (=> b!1570818 (= res!1072927 (not (contains!10450 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072931 () Bool)

(assert (=> start!134704 (=> (not res!1072931) (not e!875834))))

(assert (=> start!134704 (= res!1072931 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51176 a!3481)) (bvslt (size!51176 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134704 e!875834))

(assert (=> start!134704 true))

(declare-fun array_inv!39580 (array!104904) Bool)

(assert (=> start!134704 (array_inv!39580 a!3481)))

(declare-fun b!1570819 () Bool)

(declare-fun res!1072929 () Bool)

(assert (=> b!1570819 (=> (not res!1072929) (not e!875834))))

(declare-fun noDuplicate!2698 (List!36735) Bool)

(assert (=> b!1570819 (= res!1072929 (noDuplicate!2698 acc!619))))

(declare-fun b!1570820 () Bool)

(declare-fun res!1072930 () Bool)

(assert (=> b!1570820 (=> (not res!1072930) (not e!875834))))

(assert (=> b!1570820 (= res!1072930 (not (contains!10450 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570821 () Bool)

(declare-fun res!1072926 () Bool)

(assert (=> b!1570821 (=> (not res!1072926) (not e!875834))))

(assert (=> b!1570821 (= res!1072926 (bvslt from!2856 (size!51176 a!3481)))))

(assert (= (and start!134704 res!1072931) b!1570819))

(assert (= (and b!1570819 res!1072929) b!1570820))

(assert (= (and b!1570820 res!1072930) b!1570818))

(assert (= (and b!1570818 res!1072927) b!1570821))

(assert (= (and b!1570821 res!1072926) b!1570816))

(assert (= (and b!1570816 (not res!1072928)) b!1570817))

(declare-fun m!1445317 () Bool)

(assert (=> b!1570817 m!1445317))

(assert (=> b!1570817 m!1445317))

(declare-fun m!1445319 () Bool)

(assert (=> b!1570817 m!1445319))

(declare-fun m!1445321 () Bool)

(assert (=> b!1570820 m!1445321))

(declare-fun m!1445323 () Bool)

(assert (=> start!134704 m!1445323))

(declare-fun m!1445325 () Bool)

(assert (=> b!1570818 m!1445325))

(assert (=> b!1570816 m!1445317))

(assert (=> b!1570816 m!1445317))

(declare-fun m!1445327 () Bool)

(assert (=> b!1570816 m!1445327))

(declare-fun m!1445329 () Bool)

(assert (=> b!1570819 m!1445329))

(push 1)

(assert (not start!134704))

(assert (not b!1570820))

(assert (not b!1570816))

(assert (not b!1570819))

(assert (not b!1570817))

(assert (not b!1570818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

