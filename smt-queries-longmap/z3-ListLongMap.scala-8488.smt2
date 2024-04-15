; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103440 () Bool)

(assert start!103440)

(declare-fun res!827536 () Bool)

(declare-fun e!702932 () Bool)

(assert (=> start!103440 (=> (not res!827536) (not e!702932))))

(declare-datatypes ((array!79849 0))(
  ( (array!79850 (arr!38522 (Array (_ BitVec 32) (_ BitVec 64))) (size!39060 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79849)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103440 (= res!827536 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39060 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39060 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103440 e!702932))

(assert (=> start!103440 true))

(declare-fun array_inv!29505 (array!79849) Bool)

(assert (=> start!103440 (array_inv!29505 a!3575)))

(declare-fun b!1240207 () Bool)

(declare-fun res!827537 () Bool)

(assert (=> b!1240207 (=> (not res!827537) (not e!702932))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240207 (= res!827537 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240208 () Bool)

(declare-fun res!827535 () Bool)

(assert (=> b!1240208 (=> (not res!827535) (not e!702932))))

(assert (=> b!1240208 (= res!827535 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39060 a!3575))))))

(declare-fun b!1240209 () Bool)

(assert (=> b!1240209 (= e!702932 (not (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001))))))

(assert (= (and start!103440 res!827536) b!1240207))

(assert (= (and b!1240207 res!827537) b!1240208))

(assert (= (and b!1240208 res!827535) b!1240209))

(declare-fun m!1143101 () Bool)

(assert (=> start!103440 m!1143101))

(declare-fun m!1143103 () Bool)

(assert (=> b!1240207 m!1143103))

(declare-fun m!1143105 () Bool)

(assert (=> b!1240209 m!1143105))

(check-sat (not b!1240209) (not b!1240207) (not start!103440))
(check-sat)
(get-model)

(declare-fun d!136125 () Bool)

(declare-fun res!827560 () Bool)

(declare-fun e!702949 () Bool)

(assert (=> d!136125 (=> res!827560 e!702949)))

(assert (=> d!136125 (= res!827560 (= (select (arr!38522 a!3575) (bvsub from!2953 #b00000000000000000000000000000001)) k0!2808))))

(assert (=> d!136125 (= (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)) e!702949)))

(declare-fun b!1240232 () Bool)

(declare-fun e!702950 () Bool)

(assert (=> b!1240232 (= e!702949 e!702950)))

(declare-fun res!827561 () Bool)

(assert (=> b!1240232 (=> (not res!827561) (not e!702950))))

(assert (=> b!1240232 (= res!827561 (bvslt (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!39060 a!3575)))))

(declare-fun b!1240233 () Bool)

(assert (=> b!1240233 (= e!702950 (arrayContainsKey!0 a!3575 k0!2808 (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!136125 (not res!827560)) b!1240232))

(assert (= (and b!1240232 res!827561) b!1240233))

(declare-fun m!1143119 () Bool)

(assert (=> d!136125 m!1143119))

(declare-fun m!1143121 () Bool)

(assert (=> b!1240233 m!1143121))

(assert (=> b!1240209 d!136125))

(declare-fun d!136127 () Bool)

(declare-fun res!827562 () Bool)

(declare-fun e!702951 () Bool)

(assert (=> d!136127 (=> res!827562 e!702951)))

(assert (=> d!136127 (= res!827562 (= (select (arr!38522 a!3575) from!2953) k0!2808))))

(assert (=> d!136127 (= (arrayContainsKey!0 a!3575 k0!2808 from!2953) e!702951)))

(declare-fun b!1240234 () Bool)

(declare-fun e!702952 () Bool)

(assert (=> b!1240234 (= e!702951 e!702952)))

(declare-fun res!827563 () Bool)

(assert (=> b!1240234 (=> (not res!827563) (not e!702952))))

(assert (=> b!1240234 (= res!827563 (bvslt (bvadd from!2953 #b00000000000000000000000000000001) (size!39060 a!3575)))))

(declare-fun b!1240235 () Bool)

(assert (=> b!1240235 (= e!702952 (arrayContainsKey!0 a!3575 k0!2808 (bvadd from!2953 #b00000000000000000000000000000001)))))

(assert (= (and d!136127 (not res!827562)) b!1240234))

(assert (= (and b!1240234 res!827563) b!1240235))

(declare-fun m!1143123 () Bool)

(assert (=> d!136127 m!1143123))

(declare-fun m!1143125 () Bool)

(assert (=> b!1240235 m!1143125))

(assert (=> b!1240207 d!136127))

(declare-fun d!136129 () Bool)

(assert (=> d!136129 (= (array_inv!29505 a!3575) (bvsge (size!39060 a!3575) #b00000000000000000000000000000000))))

(assert (=> start!103440 d!136129))

(check-sat (not b!1240233) (not b!1240235))
(check-sat)
