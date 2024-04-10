; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134276 () Bool)

(assert start!134276)

(declare-fun res!1071970 () Bool)

(declare-fun e!874267 () Bool)

(assert (=> start!134276 (=> (not res!1071970) (not e!874267))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104766 0))(
  ( (array!104767 (arr!50563 (Array (_ BitVec 32) (_ BitVec 64))) (size!51113 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104766)

(assert (=> start!134276 (= res!1071970 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51113 a!3481)) (bvslt (size!51113 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134276 e!874267))

(assert (=> start!134276 true))

(declare-fun array_inv!39290 (array!104766) Bool)

(assert (=> start!134276 (array_inv!39290 a!3481)))

(declare-fun b!1568284 () Bool)

(declare-fun res!1071972 () Bool)

(assert (=> b!1568284 (=> (not res!1071972) (not e!874267))))

(declare-datatypes ((List!36695 0))(
  ( (Nil!36692) (Cons!36691 (h!38138 (_ BitVec 64)) (t!51603 List!36695)) )
))
(declare-fun acc!619 () List!36695)

(declare-fun noDuplicate!2669 (List!36695) Bool)

(assert (=> b!1568284 (= res!1071972 (noDuplicate!2669 acc!619))))

(declare-fun b!1568285 () Bool)

(declare-fun res!1071971 () Bool)

(assert (=> b!1568285 (=> (not res!1071971) (not e!874267))))

(declare-fun contains!10397 (List!36695 (_ BitVec 64)) Bool)

(assert (=> b!1568285 (= res!1071971 (not (contains!10397 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568286 () Bool)

(assert (=> b!1568286 (= e!874267 false)))

(declare-fun lt!673150 () Bool)

(assert (=> b!1568286 (= lt!673150 (contains!10397 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134276 res!1071970) b!1568284))

(assert (= (and b!1568284 res!1071972) b!1568285))

(assert (= (and b!1568285 res!1071971) b!1568286))

(declare-fun m!1442983 () Bool)

(assert (=> start!134276 m!1442983))

(declare-fun m!1442985 () Bool)

(assert (=> b!1568284 m!1442985))

(declare-fun m!1442987 () Bool)

(assert (=> b!1568285 m!1442987))

(declare-fun m!1442989 () Bool)

(assert (=> b!1568286 m!1442989))

(push 1)

(assert (not start!134276))

(assert (not b!1568286))

(assert (not b!1568285))

(assert (not b!1568284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

