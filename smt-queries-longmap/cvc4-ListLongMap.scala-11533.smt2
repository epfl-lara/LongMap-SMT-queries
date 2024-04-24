; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134696 () Bool)

(assert start!134696)

(declare-fun res!1072867 () Bool)

(declare-fun e!875800 () Bool)

(assert (=> start!134696 (=> (not res!1072867) (not e!875800))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104896 0))(
  ( (array!104897 (arr!50621 (Array (_ BitVec 32) (_ BitVec 64))) (size!51172 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104896)

(assert (=> start!134696 (= res!1072867 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51172 a!3481)) (bvslt (size!51172 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134696 e!875800))

(assert (=> start!134696 true))

(declare-fun array_inv!39576 (array!104896) Bool)

(assert (=> start!134696 (array_inv!39576 a!3481)))

(declare-fun b!1570756 () Bool)

(declare-fun res!1072866 () Bool)

(assert (=> b!1570756 (=> (not res!1072866) (not e!875800))))

(declare-datatypes ((List!36731 0))(
  ( (Nil!36728) (Cons!36727 (h!38192 (_ BitVec 64)) (t!51631 List!36731)) )
))
(declare-fun acc!619 () List!36731)

(declare-fun noDuplicate!2694 (List!36731) Bool)

(assert (=> b!1570756 (= res!1072866 (noDuplicate!2694 acc!619))))

(declare-fun b!1570757 () Bool)

(declare-fun res!1072868 () Bool)

(assert (=> b!1570757 (=> (not res!1072868) (not e!875800))))

(declare-fun contains!10446 (List!36731 (_ BitVec 64)) Bool)

(assert (=> b!1570757 (= res!1072868 (not (contains!10446 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570758 () Bool)

(assert (=> b!1570758 (= e!875800 false)))

(declare-fun lt!674070 () Bool)

(assert (=> b!1570758 (= lt!674070 (contains!10446 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134696 res!1072867) b!1570756))

(assert (= (and b!1570756 res!1072866) b!1570757))

(assert (= (and b!1570757 res!1072868) b!1570758))

(declare-fun m!1445273 () Bool)

(assert (=> start!134696 m!1445273))

(declare-fun m!1445275 () Bool)

(assert (=> b!1570756 m!1445275))

(declare-fun m!1445277 () Bool)

(assert (=> b!1570757 m!1445277))

(declare-fun m!1445279 () Bool)

(assert (=> b!1570758 m!1445279))

(push 1)

(assert (not b!1570757))

(assert (not b!1570756))

(assert (not b!1570758))

(assert (not start!134696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

