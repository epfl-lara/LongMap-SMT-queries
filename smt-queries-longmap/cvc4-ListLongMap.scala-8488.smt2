; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103450 () Bool)

(assert start!103450)

(declare-fun res!827598 () Bool)

(declare-fun e!702992 () Bool)

(assert (=> start!103450 (=> (not res!827598) (not e!702992))))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(declare-datatypes ((array!79932 0))(
  ( (array!79933 (arr!38563 (Array (_ BitVec 32) (_ BitVec 64))) (size!39099 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79932)

(assert (=> start!103450 (= res!827598 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39099 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39099 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103450 e!702992))

(assert (=> start!103450 true))

(declare-fun array_inv!29411 (array!79932) Bool)

(assert (=> start!103450 (array_inv!29411 a!3575)))

(declare-fun b!1240311 () Bool)

(declare-fun res!827599 () Bool)

(assert (=> b!1240311 (=> (not res!827599) (not e!702992))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240311 (= res!827599 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1240312 () Bool)

(declare-fun res!827597 () Bool)

(assert (=> b!1240312 (=> (not res!827597) (not e!702992))))

(assert (=> b!1240312 (= res!827597 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39099 a!3575))))))

(declare-fun b!1240313 () Bool)

(assert (=> b!1240313 (= e!702992 (not (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001))))))

(assert (= (and start!103450 res!827598) b!1240311))

(assert (= (and b!1240311 res!827599) b!1240312))

(assert (= (and b!1240312 res!827597) b!1240313))

(declare-fun m!1143637 () Bool)

(assert (=> start!103450 m!1143637))

(declare-fun m!1143639 () Bool)

(assert (=> b!1240311 m!1143639))

(declare-fun m!1143641 () Bool)

(assert (=> b!1240313 m!1143641))

(push 1)

(assert (not b!1240313))

(assert (not b!1240311))

(assert (not start!103450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136259 () Bool)

(declare-fun res!827612 () Bool)

(declare-fun e!703006 () Bool)

(assert (=> d!136259 (=> res!827612 e!703006)))

(assert (=> d!136259 (= res!827612 (= (select (arr!38563 a!3575) (bvsub from!2953 #b00000000000000000000000000000001)) k!2808))))

(assert (=> d!136259 (= (arrayContainsKey!0 a!3575 k!2808 (bvsub from!2953 #b00000000000000000000000000000001)) e!703006)))

(declare-fun b!1240326 () Bool)

(declare-fun e!703007 () Bool)

(assert (=> b!1240326 (= e!703006 e!703007)))

(declare-fun res!827613 () Bool)

(assert (=> b!1240326 (=> (not res!827613) (not e!703007))))

(assert (=> b!1240326 (= res!827613 (bvslt (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!39099 a!3575)))))

(declare-fun b!1240327 () Bool)

(assert (=> b!1240327 (= e!703007 (arrayContainsKey!0 a!3575 k!2808 (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!136259 (not res!827612)) b!1240326))

(assert (= (and b!1240326 res!827613) b!1240327))

(declare-fun m!1143651 () Bool)

(assert (=> d!136259 m!1143651))

(declare-fun m!1143653 () Bool)

(assert (=> b!1240327 m!1143653))

(assert (=> b!1240313 d!136259))

(declare-fun d!136267 () Bool)

(declare-fun res!827614 () Bool)

(declare-fun e!703008 () Bool)

(assert (=> d!136267 (=> res!827614 e!703008)))

(assert (=> d!136267 (= res!827614 (= (select (arr!38563 a!3575) from!2953) k!2808))))

(assert (=> d!136267 (= (arrayContainsKey!0 a!3575 k!2808 from!2953) e!703008)))

(declare-fun b!1240328 () Bool)

(declare-fun e!703009 () Bool)

(assert (=> b!1240328 (= e!703008 e!703009)))

(declare-fun res!827615 () Bool)

(assert (=> b!1240328 (=> (not res!827615) (not e!703009))))

(assert (=> b!1240328 (= res!827615 (bvslt (bvadd from!2953 #b00000000000000000000000000000001) (size!39099 a!3575)))))

(declare-fun b!1240329 () Bool)

(assert (=> b!1240329 (= e!703009 (arrayContainsKey!0 a!3575 k!2808 (bvadd from!2953 #b00000000000000000000000000000001)))))

(assert (= (and d!136267 (not res!827614)) b!1240328))

(assert (= (and b!1240328 res!827615) b!1240329))

(declare-fun m!1143655 () Bool)

(assert (=> d!136267 m!1143655))

(declare-fun m!1143657 () Bool)

(assert (=> b!1240329 m!1143657))

