; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102240 () Bool)

(assert start!102240)

(declare-fun b!1229540 () Bool)

(declare-fun res!817372 () Bool)

(declare-fun e!698002 () Bool)

(assert (=> b!1229540 (=> (not res!817372) (not e!698002))))

(declare-datatypes ((List!27059 0))(
  ( (Nil!27056) (Cons!27055 (h!28273 (_ BitVec 64)) (t!40514 List!27059)) )
))
(declare-fun acc!823 () List!27059)

(declare-fun noDuplicate!1711 (List!27059) Bool)

(assert (=> b!1229540 (= res!817372 (noDuplicate!1711 acc!823))))

(declare-fun b!1229541 () Bool)

(declare-fun res!817378 () Bool)

(assert (=> b!1229541 (=> (not res!817378) (not e!698002))))

(declare-datatypes ((array!79313 0))(
  ( (array!79314 (arr!38273 (Array (_ BitVec 32) (_ BitVec 64))) (size!38810 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79313)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229541 (= res!817378 (validKeyInArray!0 (select (arr!38273 a!3806) from!3184)))))

(declare-fun b!1229542 () Bool)

(declare-fun res!817376 () Bool)

(assert (=> b!1229542 (=> (not res!817376) (not e!698002))))

(declare-fun arrayNoDuplicates!0 (array!79313 (_ BitVec 32) List!27059) Bool)

(assert (=> b!1229542 (= res!817376 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!817374 () Bool)

(assert (=> start!102240 (=> (not res!817374) (not e!698002))))

(assert (=> start!102240 (= res!817374 (bvslt (size!38810 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102240 e!698002))

(declare-fun array_inv!29211 (array!79313) Bool)

(assert (=> start!102240 (array_inv!29211 a!3806)))

(assert (=> start!102240 true))

(declare-fun b!1229543 () Bool)

(declare-fun res!817379 () Bool)

(assert (=> b!1229543 (=> (not res!817379) (not e!698002))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229543 (= res!817379 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229544 () Bool)

(declare-fun res!817371 () Bool)

(assert (=> b!1229544 (=> (not res!817371) (not e!698002))))

(declare-fun contains!7130 (List!27059 (_ BitVec 64)) Bool)

(assert (=> b!1229544 (= res!817371 (not (contains!7130 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229545 () Bool)

(declare-fun res!817377 () Bool)

(assert (=> b!1229545 (=> (not res!817377) (not e!698002))))

(assert (=> b!1229545 (= res!817377 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38810 a!3806)) (bvslt from!3184 (size!38810 a!3806))))))

(declare-fun b!1229546 () Bool)

(declare-fun res!817373 () Bool)

(assert (=> b!1229546 (=> (not res!817373) (not e!698002))))

(assert (=> b!1229546 (= res!817373 (not (contains!7130 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229547 () Bool)

(declare-fun res!817375 () Bool)

(assert (=> b!1229547 (=> (not res!817375) (not e!698002))))

(assert (=> b!1229547 (= res!817375 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229548 () Bool)

(assert (=> b!1229548 (= e!698002 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1229548 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27056)))

(declare-datatypes ((Unit!40661 0))(
  ( (Unit!40662) )
))
(declare-fun lt!559458 () Unit!40661)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79313 List!27059 List!27059 (_ BitVec 32)) Unit!40661)

(assert (=> b!1229548 (= lt!559458 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27056 from!3184))))

(assert (=> b!1229548 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27055 (select (arr!38273 a!3806) from!3184) acc!823))))

(assert (= (and start!102240 res!817374) b!1229547))

(assert (= (and b!1229547 res!817375) b!1229545))

(assert (= (and b!1229545 res!817377) b!1229540))

(assert (= (and b!1229540 res!817372) b!1229544))

(assert (= (and b!1229544 res!817371) b!1229546))

(assert (= (and b!1229546 res!817373) b!1229543))

(assert (= (and b!1229543 res!817379) b!1229542))

(assert (= (and b!1229542 res!817376) b!1229541))

(assert (= (and b!1229541 res!817378) b!1229548))

(declare-fun m!1134405 () Bool)

(assert (=> b!1229544 m!1134405))

(declare-fun m!1134407 () Bool)

(assert (=> b!1229543 m!1134407))

(declare-fun m!1134409 () Bool)

(assert (=> b!1229540 m!1134409))

(declare-fun m!1134411 () Bool)

(assert (=> b!1229546 m!1134411))

(declare-fun m!1134413 () Bool)

(assert (=> b!1229548 m!1134413))

(declare-fun m!1134415 () Bool)

(assert (=> b!1229548 m!1134415))

(declare-fun m!1134417 () Bool)

(assert (=> b!1229548 m!1134417))

(declare-fun m!1134419 () Bool)

(assert (=> b!1229548 m!1134419))

(declare-fun m!1134421 () Bool)

(assert (=> b!1229547 m!1134421))

(assert (=> b!1229541 m!1134417))

(assert (=> b!1229541 m!1134417))

(declare-fun m!1134423 () Bool)

(assert (=> b!1229541 m!1134423))

(declare-fun m!1134425 () Bool)

(assert (=> b!1229542 m!1134425))

(declare-fun m!1134427 () Bool)

(assert (=> start!102240 m!1134427))

(check-sat (not b!1229544) (not b!1229548) (not b!1229547) (not b!1229546) (not b!1229541) (not b!1229542) (not b!1229540) (not b!1229543) (not start!102240))
(check-sat)
