; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134686 () Bool)

(assert start!134686)

(declare-fun res!1072822 () Bool)

(declare-fun e!875770 () Bool)

(assert (=> start!134686 (=> (not res!1072822) (not e!875770))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104886 0))(
  ( (array!104887 (arr!50616 (Array (_ BitVec 32) (_ BitVec 64))) (size!51167 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104886)

(assert (=> start!134686 (= res!1072822 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51167 a!3481)) (bvslt (size!51167 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134686 e!875770))

(assert (=> start!134686 true))

(declare-fun array_inv!39571 (array!104886) Bool)

(assert (=> start!134686 (array_inv!39571 a!3481)))

(declare-fun b!1570711 () Bool)

(declare-fun res!1072823 () Bool)

(assert (=> b!1570711 (=> (not res!1072823) (not e!875770))))

(declare-datatypes ((List!36726 0))(
  ( (Nil!36723) (Cons!36722 (h!38187 (_ BitVec 64)) (t!51626 List!36726)) )
))
(declare-fun acc!619 () List!36726)

(declare-fun noDuplicate!2689 (List!36726) Bool)

(assert (=> b!1570711 (= res!1072823 (noDuplicate!2689 acc!619))))

(declare-fun b!1570712 () Bool)

(declare-fun res!1072821 () Bool)

(assert (=> b!1570712 (=> (not res!1072821) (not e!875770))))

(declare-fun contains!10441 (List!36726 (_ BitVec 64)) Bool)

(assert (=> b!1570712 (= res!1072821 (not (contains!10441 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570713 () Bool)

(assert (=> b!1570713 (= e!875770 false)))

(declare-fun lt!674055 () Bool)

(assert (=> b!1570713 (= lt!674055 (contains!10441 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134686 res!1072822) b!1570711))

(assert (= (and b!1570711 res!1072823) b!1570712))

(assert (= (and b!1570712 res!1072821) b!1570713))

(declare-fun m!1445233 () Bool)

(assert (=> start!134686 m!1445233))

(declare-fun m!1445235 () Bool)

(assert (=> b!1570711 m!1445235))

(declare-fun m!1445237 () Bool)

(assert (=> b!1570712 m!1445237))

(declare-fun m!1445239 () Bool)

(assert (=> b!1570713 m!1445239))

(push 1)

(assert (not b!1570712))

(assert (not b!1570711))

(assert (not start!134686))

(assert (not b!1570713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

