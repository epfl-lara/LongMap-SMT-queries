; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103448 () Bool)

(assert start!103448)

(declare-fun res!827590 () Bool)

(declare-fun e!702986 () Bool)

(assert (=> start!103448 (=> (not res!827590) (not e!702986))))

(declare-datatypes ((array!79930 0))(
  ( (array!79931 (arr!38562 (Array (_ BitVec 32) (_ BitVec 64))) (size!39098 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79930)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103448 (= res!827590 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39098 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39098 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103448 e!702986))

(assert (=> start!103448 true))

(declare-fun array_inv!29410 (array!79930) Bool)

(assert (=> start!103448 (array_inv!29410 a!3575)))

(declare-fun b!1240302 () Bool)

(declare-fun res!827588 () Bool)

(assert (=> b!1240302 (=> (not res!827588) (not e!702986))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240302 (= res!827588 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240303 () Bool)

(declare-fun res!827589 () Bool)

(assert (=> b!1240303 (=> (not res!827589) (not e!702986))))

(assert (=> b!1240303 (= res!827589 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39098 a!3575))))))

(declare-fun b!1240304 () Bool)

(assert (=> b!1240304 (= e!702986 (not (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001))))))

(assert (= (and start!103448 res!827590) b!1240302))

(assert (= (and b!1240302 res!827588) b!1240303))

(assert (= (and b!1240303 res!827589) b!1240304))

(declare-fun m!1143631 () Bool)

(assert (=> start!103448 m!1143631))

(declare-fun m!1143633 () Bool)

(assert (=> b!1240302 m!1143633))

(declare-fun m!1143635 () Bool)

(assert (=> b!1240304 m!1143635))

(check-sat (not b!1240304) (not start!103448) (not b!1240302))
(check-sat)
(get-model)

(declare-fun d!136261 () Bool)

(declare-fun res!827620 () Bool)

(declare-fun e!703014 () Bool)

(assert (=> d!136261 (=> res!827620 e!703014)))

(assert (=> d!136261 (= res!827620 (= (select (arr!38562 a!3575) (bvsub from!2953 #b00000000000000000000000000000001)) k0!2808))))

(assert (=> d!136261 (= (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)) e!703014)))

(declare-fun b!1240334 () Bool)

(declare-fun e!703015 () Bool)

(assert (=> b!1240334 (= e!703014 e!703015)))

(declare-fun res!827621 () Bool)

(assert (=> b!1240334 (=> (not res!827621) (not e!703015))))

(assert (=> b!1240334 (= res!827621 (bvslt (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!39098 a!3575)))))

(declare-fun b!1240335 () Bool)

(assert (=> b!1240335 (= e!703015 (arrayContainsKey!0 a!3575 k0!2808 (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!136261 (not res!827620)) b!1240334))

(assert (= (and b!1240334 res!827621) b!1240335))

(declare-fun m!1143659 () Bool)

(assert (=> d!136261 m!1143659))

(declare-fun m!1143661 () Bool)

(assert (=> b!1240335 m!1143661))

(assert (=> b!1240304 d!136261))

(declare-fun d!136271 () Bool)

(assert (=> d!136271 (= (array_inv!29410 a!3575) (bvsge (size!39098 a!3575) #b00000000000000000000000000000000))))

(assert (=> start!103448 d!136271))

(declare-fun d!136273 () Bool)

(declare-fun res!827622 () Bool)

