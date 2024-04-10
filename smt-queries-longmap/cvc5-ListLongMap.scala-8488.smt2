; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103446 () Bool)

(assert start!103446)

(declare-fun res!827580 () Bool)

(declare-fun e!702980 () Bool)

(assert (=> start!103446 (=> (not res!827580) (not e!702980))))

(declare-datatypes ((array!79928 0))(
  ( (array!79929 (arr!38561 (Array (_ BitVec 32) (_ BitVec 64))) (size!39097 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79928)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103446 (= res!827580 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39097 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39097 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103446 e!702980))

(assert (=> start!103446 true))

(declare-fun array_inv!29409 (array!79928) Bool)

(assert (=> start!103446 (array_inv!29409 a!3575)))

(declare-fun b!1240293 () Bool)

(declare-fun res!827579 () Bool)

(assert (=> b!1240293 (=> (not res!827579) (not e!702980))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240293 (= res!827579 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240294 () Bool)

(declare-fun res!827581 () Bool)

(assert (=> b!1240294 (=> (not res!827581) (not e!702980))))

(assert (=> b!1240294 (= res!827581 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39097 a!3575))))))

(declare-fun b!1240295 () Bool)

(assert (=> b!1240295 (= e!702980 (not (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001))))))

(assert (= (and start!103446 res!827580) b!1240293))

(assert (= (and b!1240293 res!827579) b!1240294))

(assert (= (and b!1240294 res!827581) b!1240295))

(declare-fun m!1143625 () Bool)

(assert (=> start!103446 m!1143625))

(declare-fun m!1143627 () Bool)

(assert (=> b!1240293 m!1143627))

(declare-fun m!1143629 () Bool)

(assert (=> b!1240295 m!1143629))

(push 1)

(assert (not b!1240295))

(assert (not start!103446))

(assert (not b!1240293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136257 () Bool)

(declare-fun res!827604 () Bool)

(declare-fun e!702998 () Bool)

(assert (=> d!136257 (=> res!827604 e!702998)))

(assert (=> d!136257 (= res!827604 (= (select (arr!38561 a!3575) (bvsub from!2953 #b00000000000000000000000000000001)) k!2808))))

(assert (=> d!136257 (= (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)) e!702998)))

(declare-fun b!1240318 () Bool)

(declare-fun e!702999 () Bool)

(assert (=> b!1240318 (= e!702998 e!702999)))

(declare-fun res!827605 () Bool)

(assert (=> b!1240318 (=> (not res!827605) (not e!702999))))

(assert (=> b!1240318 (= res!827605 (bvslt (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!39097 a!3575)))))

(declare-fun b!1240319 () Bool)

(assert (=> b!1240319 (= e!702999 (arrayContainsKey!0 a!3575 k!2808 (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!136257 (not res!827604)) b!1240318))

(assert (= (and b!1240318 res!827605) b!1240319))

(declare-fun m!1143643 () Bool)

(assert (=> d!136257 m!1143643))

(declare-fun m!1143645 () Bool)

(assert (=> b!1240319 m!1143645))

(assert (=> b!1240295 d!136257))

(declare-fun d!136263 () Bool)

(assert (=> d!136263 (= (array_inv!29409 a!3575) (bvsge (size!39097 a!3575) #b00000000000000000000000000000000))))

(assert (=> start!103446 d!136263))

(declare-fun d!136265 () Bool)

(declare-fun res!827606 () Bool)

(declare-fun e!703000 () Bool)

(assert (=> d!136265 (=> res!827606 e!703000)))

(assert (=> d!136265 (= res!827606 (= (select (arr!38561 a!3575) from!2953) k!2808))))

(assert (=> d!136265 (= (arrayContainsKey!0 a!3575 k!2808 from!2953) e!703000)))

(declare-fun b!1240320 () Bool)

(declare-fun e!703001 () Bool)

(assert (=> b!1240320 (= e!703000 e!703001)))

(declare-fun res!827607 () Bool)

(assert (=> b!1240320 (=> (not res!827607) (not e!703001))))

(assert (=> b!1240320 (= res!827607 (bvslt (bvadd from!2953 #b00000000000000000000000000000001) (size!39097 a!3575)))))

(declare-fun b!1240321 () Bool)

(assert (=> b!1240321 (= e!703001 (arrayContainsKey!0 a!3575 k!2808 (bvadd from!2953 #b00000000000000000000000000000001)))))

(assert (= (and d!136265 (not res!827606)) b!1240320))

(assert (= (and b!1240320 res!827607) b!1240321))

(declare-fun m!1143647 () Bool)

(assert (=> d!136265 m!1143647))

(declare-fun m!1143649 () Bool)

(assert (=> b!1240321 m!1143649))

(assert (=> b!1240293 d!136265))

(push 1)

(assert (not b!1240319))

(assert (not b!1240321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

