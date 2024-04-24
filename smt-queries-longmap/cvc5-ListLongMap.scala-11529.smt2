; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134674 () Bool)

(assert start!134674)

(declare-datatypes ((array!104874 0))(
  ( (array!104875 (arr!50610 (Array (_ BitVec 32) (_ BitVec 64))) (size!51161 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104874)

(declare-datatypes ((List!36720 0))(
  ( (Nil!36717) (Cons!36716 (h!38181 (_ BitVec 64)) (t!51620 List!36720)) )
))
(declare-fun acc!619 () List!36720)

(declare-fun b!1570627 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!875724 () Bool)

(declare-fun contains!10435 (List!36720 (_ BitVec 64)) Bool)

(assert (=> b!1570627 (= e!875724 (not (contains!10435 acc!619 (select (arr!50610 a!3481) from!2856))))))

(declare-fun b!1570628 () Bool)

(declare-fun e!875726 () Bool)

(assert (=> b!1570628 (= e!875726 false)))

(declare-fun lt!674037 () Bool)

(assert (=> b!1570628 (= lt!674037 e!875724)))

(declare-fun res!1072740 () Bool)

(assert (=> b!1570628 (=> res!1072740 e!875724)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570628 (= res!1072740 (not (validKeyInArray!0 (select (arr!50610 a!3481) from!2856))))))

(declare-fun b!1570629 () Bool)

(declare-fun res!1072739 () Bool)

(assert (=> b!1570629 (=> (not res!1072739) (not e!875726))))

(declare-fun noDuplicate!2683 (List!36720) Bool)

(assert (=> b!1570629 (= res!1072739 (noDuplicate!2683 acc!619))))

(declare-fun b!1570630 () Bool)

(declare-fun res!1072741 () Bool)

(assert (=> b!1570630 (=> (not res!1072741) (not e!875726))))

(assert (=> b!1570630 (= res!1072741 (bvslt from!2856 (size!51161 a!3481)))))

(declare-fun b!1570631 () Bool)

(declare-fun res!1072742 () Bool)

(assert (=> b!1570631 (=> (not res!1072742) (not e!875726))))

(assert (=> b!1570631 (= res!1072742 (not (contains!10435 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072737 () Bool)

(assert (=> start!134674 (=> (not res!1072737) (not e!875726))))

(assert (=> start!134674 (= res!1072737 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51161 a!3481)) (bvslt (size!51161 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134674 e!875726))

(assert (=> start!134674 true))

(declare-fun array_inv!39565 (array!104874) Bool)

(assert (=> start!134674 (array_inv!39565 a!3481)))

(declare-fun b!1570632 () Bool)

(declare-fun res!1072738 () Bool)

(assert (=> b!1570632 (=> (not res!1072738) (not e!875726))))

(assert (=> b!1570632 (= res!1072738 (not (contains!10435 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134674 res!1072737) b!1570629))

(assert (= (and b!1570629 res!1072739) b!1570631))

(assert (= (and b!1570631 res!1072742) b!1570632))

(assert (= (and b!1570632 res!1072738) b!1570630))

(assert (= (and b!1570630 res!1072741) b!1570628))

(assert (= (and b!1570628 (not res!1072740)) b!1570627))

(declare-fun m!1445161 () Bool)

(assert (=> b!1570632 m!1445161))

(declare-fun m!1445163 () Bool)

(assert (=> start!134674 m!1445163))

(declare-fun m!1445165 () Bool)

(assert (=> b!1570627 m!1445165))

(assert (=> b!1570627 m!1445165))

(declare-fun m!1445167 () Bool)

(assert (=> b!1570627 m!1445167))

(declare-fun m!1445169 () Bool)

(assert (=> b!1570629 m!1445169))

(declare-fun m!1445171 () Bool)

(assert (=> b!1570631 m!1445171))

(assert (=> b!1570628 m!1445165))

(assert (=> b!1570628 m!1445165))

(declare-fun m!1445173 () Bool)

(assert (=> b!1570628 m!1445173))

(push 1)

(assert (not b!1570628))

(assert (not start!134674))

(assert (not b!1570631))

(assert (not b!1570632))

(assert (not b!1570627))

(assert (not b!1570629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

