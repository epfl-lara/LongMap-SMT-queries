; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134274 () Bool)

(assert start!134274)

(declare-fun res!1071963 () Bool)

(declare-fun e!874262 () Bool)

(assert (=> start!134274 (=> (not res!1071963) (not e!874262))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104764 0))(
  ( (array!104765 (arr!50562 (Array (_ BitVec 32) (_ BitVec 64))) (size!51112 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104764)

(assert (=> start!134274 (= res!1071963 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51112 a!3481)) (bvslt (size!51112 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134274 e!874262))

(assert (=> start!134274 true))

(declare-fun array_inv!39289 (array!104764) Bool)

(assert (=> start!134274 (array_inv!39289 a!3481)))

(declare-fun b!1568275 () Bool)

(declare-fun res!1071962 () Bool)

(assert (=> b!1568275 (=> (not res!1071962) (not e!874262))))

(declare-datatypes ((List!36694 0))(
  ( (Nil!36691) (Cons!36690 (h!38137 (_ BitVec 64)) (t!51602 List!36694)) )
))
(declare-fun acc!619 () List!36694)

(declare-fun noDuplicate!2668 (List!36694) Bool)

(assert (=> b!1568275 (= res!1071962 (noDuplicate!2668 acc!619))))

(declare-fun b!1568276 () Bool)

(declare-fun res!1071961 () Bool)

(assert (=> b!1568276 (=> (not res!1071961) (not e!874262))))

(declare-fun contains!10396 (List!36694 (_ BitVec 64)) Bool)

(assert (=> b!1568276 (= res!1071961 (not (contains!10396 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568277 () Bool)

(assert (=> b!1568277 (= e!874262 false)))

(declare-fun lt!673147 () Bool)

(assert (=> b!1568277 (= lt!673147 (contains!10396 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134274 res!1071963) b!1568275))

(assert (= (and b!1568275 res!1071962) b!1568276))

(assert (= (and b!1568276 res!1071961) b!1568277))

(declare-fun m!1442975 () Bool)

(assert (=> start!134274 m!1442975))

(declare-fun m!1442977 () Bool)

(assert (=> b!1568275 m!1442977))

(declare-fun m!1442979 () Bool)

(assert (=> b!1568276 m!1442979))

(declare-fun m!1442981 () Bool)

(assert (=> b!1568277 m!1442981))

(push 1)

(assert (not b!1568275))

(assert (not start!134274))

(assert (not b!1568277))

(assert (not b!1568276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

