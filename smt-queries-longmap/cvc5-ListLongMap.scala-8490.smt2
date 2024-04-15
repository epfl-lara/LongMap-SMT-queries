; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103466 () Bool)

(assert start!103466)

(declare-fun b!1240319 () Bool)

(declare-fun res!827649 () Bool)

(declare-fun e!703001 () Bool)

(assert (=> b!1240319 (=> (not res!827649) (not e!703001))))

(declare-datatypes ((array!79867 0))(
  ( (array!79868 (arr!38530 (Array (_ BitVec 32) (_ BitVec 64))) (size!39068 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79867)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240319 (= res!827649 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39068 a!3575))))))

(declare-fun res!827648 () Bool)

(assert (=> start!103466 (=> (not res!827648) (not e!703001))))

(assert (=> start!103466 (= res!827648 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39068 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39068 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103466 e!703001))

(assert (=> start!103466 true))

(declare-fun array_inv!29513 (array!79867) Bool)

(assert (=> start!103466 (array_inv!29513 a!3575)))

(declare-fun b!1240320 () Bool)

(declare-fun res!827647 () Bool)

(assert (=> b!1240320 (=> (not res!827647) (not e!703001))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240320 (= res!827647 (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240318 () Bool)

(declare-fun res!827646 () Bool)

(assert (=> b!1240318 (=> (not res!827646) (not e!703001))))

(assert (=> b!1240318 (= res!827646 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240321 () Bool)

(assert (=> b!1240321 (= e!703001 (not true))))

(assert (=> b!1240321 (arrayContainsKey!0 a!3575 k!2808 newFrom!281)))

(declare-datatypes ((Unit!41074 0))(
  ( (Unit!41075) )
))
(declare-fun lt!561744 () Unit!41074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79867 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41074)

(assert (=> b!1240321 (= lt!561744 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(assert (= (and start!103466 res!827648) b!1240318))

(assert (= (and b!1240318 res!827646) b!1240319))

(assert (= (and b!1240319 res!827649) b!1240320))

(assert (= (and b!1240320 res!827647) b!1240321))

(declare-fun m!1143173 () Bool)

(assert (=> start!103466 m!1143173))

(declare-fun m!1143175 () Bool)

(assert (=> b!1240320 m!1143175))

(declare-fun m!1143177 () Bool)

(assert (=> b!1240318 m!1143177))

(declare-fun m!1143179 () Bool)

(assert (=> b!1240321 m!1143179))

(declare-fun m!1143181 () Bool)

(assert (=> b!1240321 m!1143181))

(push 1)

(assert (not b!1240321))

(assert (not b!1240318))

(assert (not start!103466))

(assert (not b!1240320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

