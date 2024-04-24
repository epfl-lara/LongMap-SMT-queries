; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103684 () Bool)

(assert start!103684)

(declare-fun res!828112 () Bool)

(declare-fun e!703843 () Bool)

(assert (=> start!103684 (=> (not res!828112) (not e!703843))))

(declare-datatypes ((array!79964 0))(
  ( (array!79965 (arr!38573 (Array (_ BitVec 32) (_ BitVec 64))) (size!39110 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79964)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103684 (= res!828112 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39110 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39110 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103684 e!703843))

(assert (=> start!103684 true))

(declare-fun array_inv!29511 (array!79964) Bool)

(assert (=> start!103684 (array_inv!29511 a!3575)))

(declare-fun b!1241617 () Bool)

(declare-fun res!828114 () Bool)

(assert (=> b!1241617 (=> (not res!828114) (not e!703843))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241617 (= res!828114 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1241618 () Bool)

(declare-fun res!828113 () Bool)

(assert (=> b!1241618 (=> (not res!828113) (not e!703843))))

(assert (=> b!1241618 (= res!828113 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39110 a!3575))))))

(declare-fun b!1241619 () Bool)

(assert (=> b!1241619 (= e!703843 (not (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001))))))

(assert (= (and start!103684 res!828112) b!1241617))

(assert (= (and b!1241617 res!828114) b!1241618))

(assert (= (and b!1241618 res!828113) b!1241619))

(declare-fun m!1145273 () Bool)

(assert (=> start!103684 m!1145273))

(declare-fun m!1145275 () Bool)

(assert (=> b!1241617 m!1145275))

(declare-fun m!1145277 () Bool)

(assert (=> b!1241619 m!1145277))

(check-sat (not b!1241619) (not start!103684) (not b!1241617))
(check-sat)
(get-model)

(declare-fun d!136723 () Bool)

(declare-fun res!828137 () Bool)

(declare-fun e!703861 () Bool)

(assert (=> d!136723 (=> res!828137 e!703861)))

(assert (=> d!136723 (= res!828137 (= (select (arr!38573 a!3575) (bvsub from!2953 #b00000000000000000000000000000001)) k0!2808))))

(assert (=> d!136723 (= (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)) e!703861)))

(declare-fun b!1241642 () Bool)

(declare-fun e!703862 () Bool)

(assert (=> b!1241642 (= e!703861 e!703862)))

(declare-fun res!828138 () Bool)

(assert (=> b!1241642 (=> (not res!828138) (not e!703862))))

(assert (=> b!1241642 (= res!828138 (bvslt (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!39110 a!3575)))))

(declare-fun b!1241643 () Bool)

(assert (=> b!1241643 (= e!703862 (arrayContainsKey!0 a!3575 k0!2808 (bvadd (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!136723 (not res!828137)) b!1241642))

(assert (= (and b!1241642 res!828138) b!1241643))

(declare-fun m!1145291 () Bool)

(assert (=> d!136723 m!1145291))

(declare-fun m!1145293 () Bool)

(assert (=> b!1241643 m!1145293))

(assert (=> b!1241619 d!136723))

(declare-fun d!136725 () Bool)

(assert (=> d!136725 (= (array_inv!29511 a!3575) (bvsge (size!39110 a!3575) #b00000000000000000000000000000000))))

(assert (=> start!103684 d!136725))

(declare-fun d!136727 () Bool)

(declare-fun res!828139 () Bool)

(declare-fun e!703863 () Bool)

(assert (=> d!136727 (=> res!828139 e!703863)))

(assert (=> d!136727 (= res!828139 (= (select (arr!38573 a!3575) from!2953) k0!2808))))

(assert (=> d!136727 (= (arrayContainsKey!0 a!3575 k0!2808 from!2953) e!703863)))

(declare-fun b!1241644 () Bool)

(declare-fun e!703864 () Bool)

(assert (=> b!1241644 (= e!703863 e!703864)))

(declare-fun res!828140 () Bool)

(assert (=> b!1241644 (=> (not res!828140) (not e!703864))))

(assert (=> b!1241644 (= res!828140 (bvslt (bvadd from!2953 #b00000000000000000000000000000001) (size!39110 a!3575)))))

(declare-fun b!1241645 () Bool)

(assert (=> b!1241645 (= e!703864 (arrayContainsKey!0 a!3575 k0!2808 (bvadd from!2953 #b00000000000000000000000000000001)))))

(assert (= (and d!136727 (not res!828139)) b!1241644))

(assert (= (and b!1241644 res!828140) b!1241645))

(declare-fun m!1145295 () Bool)

(assert (=> d!136727 m!1145295))

(declare-fun m!1145297 () Bool)

(assert (=> b!1241645 m!1145297))

(assert (=> b!1241617 d!136727))

(check-sat (not b!1241645) (not b!1241643))
(check-sat)
