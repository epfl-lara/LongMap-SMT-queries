; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134270 () Bool)

(assert start!134270)

(declare-fun res!1071945 () Bool)

(declare-fun e!874249 () Bool)

(assert (=> start!134270 (=> (not res!1071945) (not e!874249))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104760 0))(
  ( (array!104761 (arr!50560 (Array (_ BitVec 32) (_ BitVec 64))) (size!51110 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104760)

(assert (=> start!134270 (= res!1071945 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51110 a!3481)) (bvslt (size!51110 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134270 e!874249))

(assert (=> start!134270 true))

(declare-fun array_inv!39287 (array!104760) Bool)

(assert (=> start!134270 (array_inv!39287 a!3481)))

(declare-fun b!1568257 () Bool)

(declare-fun res!1071943 () Bool)

(assert (=> b!1568257 (=> (not res!1071943) (not e!874249))))

(declare-datatypes ((List!36692 0))(
  ( (Nil!36689) (Cons!36688 (h!38135 (_ BitVec 64)) (t!51600 List!36692)) )
))
(declare-fun acc!619 () List!36692)

(declare-fun noDuplicate!2666 (List!36692) Bool)

(assert (=> b!1568257 (= res!1071943 (noDuplicate!2666 acc!619))))

(declare-fun b!1568258 () Bool)

(declare-fun res!1071944 () Bool)

(assert (=> b!1568258 (=> (not res!1071944) (not e!874249))))

(declare-fun contains!10394 (List!36692 (_ BitVec 64)) Bool)

(assert (=> b!1568258 (= res!1071944 (not (contains!10394 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568259 () Bool)

(assert (=> b!1568259 (= e!874249 false)))

(declare-fun lt!673141 () Bool)

(assert (=> b!1568259 (= lt!673141 (contains!10394 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134270 res!1071945) b!1568257))

(assert (= (and b!1568257 res!1071943) b!1568258))

(assert (= (and b!1568258 res!1071944) b!1568259))

(declare-fun m!1442959 () Bool)

(assert (=> start!134270 m!1442959))

(declare-fun m!1442961 () Bool)

(assert (=> b!1568257 m!1442961))

(declare-fun m!1442963 () Bool)

(assert (=> b!1568258 m!1442963))

(declare-fun m!1442965 () Bool)

(assert (=> b!1568259 m!1442965))

(push 1)

(assert (not start!134270))

(assert (not b!1568259))

(assert (not b!1568258))

(assert (not b!1568257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

