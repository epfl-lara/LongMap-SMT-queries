; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134180 () Bool)

(assert start!134180)

(declare-fun b!1567693 () Bool)

(declare-fun res!1071380 () Bool)

(declare-fun e!873897 () Bool)

(assert (=> b!1567693 (=> (not res!1071380) (not e!873897))))

(declare-datatypes ((List!36671 0))(
  ( (Nil!36668) (Cons!36667 (h!38114 (_ BitVec 64)) (t!51579 List!36671)) )
))
(declare-fun acc!619 () List!36671)

(declare-fun noDuplicate!2645 (List!36671) Bool)

(assert (=> b!1567693 (= res!1071380 (noDuplicate!2645 acc!619))))

(declare-fun b!1567694 () Bool)

(declare-fun res!1071381 () Bool)

(assert (=> b!1567694 (=> (not res!1071381) (not e!873897))))

(declare-fun contains!10373 (List!36671 (_ BitVec 64)) Bool)

(assert (=> b!1567694 (= res!1071381 (not (contains!10373 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567695 () Bool)

(declare-fun res!1071383 () Bool)

(assert (=> b!1567695 (=> (not res!1071383) (not e!873897))))

(assert (=> b!1567695 (= res!1071383 (not (contains!10373 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567696 () Bool)

(assert (=> b!1567696 (= e!873897 false)))

(declare-fun lt!673033 () Bool)

(declare-fun e!873898 () Bool)

(assert (=> b!1567696 (= lt!673033 e!873898)))

(declare-fun res!1071384 () Bool)

(assert (=> b!1567696 (=> res!1071384 e!873898)))

(declare-datatypes ((array!104712 0))(
  ( (array!104713 (arr!50539 (Array (_ BitVec 32) (_ BitVec 64))) (size!51089 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104712)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567696 (= res!1071384 (not (validKeyInArray!0 (select (arr!50539 a!3481) from!2856))))))

(declare-fun b!1567697 () Bool)

(declare-fun res!1071379 () Bool)

(assert (=> b!1567697 (=> (not res!1071379) (not e!873897))))

(assert (=> b!1567697 (= res!1071379 (bvslt from!2856 (size!51089 a!3481)))))

(declare-fun b!1567698 () Bool)

(assert (=> b!1567698 (= e!873898 (not (contains!10373 acc!619 (select (arr!50539 a!3481) from!2856))))))

(declare-fun res!1071382 () Bool)

(assert (=> start!134180 (=> (not res!1071382) (not e!873897))))

(assert (=> start!134180 (= res!1071382 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51089 a!3481)) (bvslt (size!51089 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134180 e!873897))

(assert (=> start!134180 true))

(declare-fun array_inv!39266 (array!104712) Bool)

(assert (=> start!134180 (array_inv!39266 a!3481)))

(assert (= (and start!134180 res!1071382) b!1567693))

(assert (= (and b!1567693 res!1071380) b!1567694))

(assert (= (and b!1567694 res!1071381) b!1567695))

(assert (= (and b!1567695 res!1071383) b!1567697))

(assert (= (and b!1567697 res!1071379) b!1567696))

(assert (= (and b!1567696 (not res!1071384)) b!1567698))

(declare-fun m!1442479 () Bool)

(assert (=> start!134180 m!1442479))

(declare-fun m!1442481 () Bool)

(assert (=> b!1567695 m!1442481))

(declare-fun m!1442483 () Bool)

(assert (=> b!1567696 m!1442483))

(assert (=> b!1567696 m!1442483))

(declare-fun m!1442485 () Bool)

(assert (=> b!1567696 m!1442485))

(assert (=> b!1567698 m!1442483))

(assert (=> b!1567698 m!1442483))

(declare-fun m!1442487 () Bool)

(assert (=> b!1567698 m!1442487))

(declare-fun m!1442489 () Bool)

(assert (=> b!1567694 m!1442489))

(declare-fun m!1442491 () Bool)

(assert (=> b!1567693 m!1442491))

(push 1)

(assert (not b!1567696))

(assert (not b!1567694))

(assert (not b!1567698))

(assert (not b!1567693))

(assert (not b!1567695))

(assert (not start!134180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

