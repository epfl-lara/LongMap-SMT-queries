; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134868 () Bool)

(assert start!134868)

(declare-fun res!1073580 () Bool)

(declare-fun e!876589 () Bool)

(assert (=> start!134868 (=> (not res!1073580) (not e!876589))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134868 (= res!1073580 (not (= key1!37 key2!21)))))

(assert (=> start!134868 e!876589))

(assert (=> start!134868 true))

(declare-fun e!876590 () Bool)

(assert (=> start!134868 e!876590))

(declare-fun b!1572155 () Bool)

(declare-datatypes ((B!2534 0))(
  ( (B!2535 (val!19629 Int)) )
))
(declare-datatypes ((tuple2!25420 0))(
  ( (tuple2!25421 (_1!12721 (_ BitVec 64)) (_2!12721 B!2534)) )
))
(declare-datatypes ((List!36781 0))(
  ( (Nil!36778) (Cons!36777 (h!38242 tuple2!25420) (t!51681 List!36781)) )
))
(declare-fun l!750 () List!36781)

(declare-fun isStrictlySorted!1001 (List!36781) Bool)

(assert (=> b!1572155 (= e!876589 (not (isStrictlySorted!1001 (t!51681 l!750))))))

(declare-fun b!1572154 () Bool)

(declare-fun res!1073582 () Bool)

(assert (=> b!1572154 (=> (not res!1073582) (not e!876589))))

(get-info :version)

(assert (=> b!1572154 (= res!1073582 (and ((_ is Cons!36777) l!750) (bvslt (_1!12721 (h!38242 l!750)) key1!37) (bvslt (_1!12721 (h!38242 l!750)) key2!21)))))

(declare-fun b!1572153 () Bool)

(declare-fun res!1073581 () Bool)

(assert (=> b!1572153 (=> (not res!1073581) (not e!876589))))

(assert (=> b!1572153 (= res!1073581 (isStrictlySorted!1001 l!750))))

(declare-fun b!1572156 () Bool)

(declare-fun tp_is_empty!39085 () Bool)

(declare-fun tp!114174 () Bool)

(assert (=> b!1572156 (= e!876590 (and tp_is_empty!39085 tp!114174))))

(assert (= (and start!134868 res!1073580) b!1572153))

(assert (= (and b!1572153 res!1073581) b!1572154))

(assert (= (and b!1572154 res!1073582) b!1572155))

(assert (= (and start!134868 ((_ is Cons!36777) l!750)) b!1572156))

(declare-fun m!1446141 () Bool)

(assert (=> b!1572155 m!1446141))

(declare-fun m!1446143 () Bool)

(assert (=> b!1572153 m!1446143))

(check-sat (not b!1572155) (not b!1572153) (not b!1572156) tp_is_empty!39085)
(check-sat)
(get-model)

(declare-fun d!164635 () Bool)

(declare-fun res!1073605 () Bool)

(declare-fun e!876607 () Bool)

(assert (=> d!164635 (=> res!1073605 e!876607)))

(assert (=> d!164635 (= res!1073605 (or ((_ is Nil!36778) (t!51681 l!750)) ((_ is Nil!36778) (t!51681 (t!51681 l!750)))))))

(assert (=> d!164635 (= (isStrictlySorted!1001 (t!51681 l!750)) e!876607)))

(declare-fun b!1572185 () Bool)

(declare-fun e!876608 () Bool)

(assert (=> b!1572185 (= e!876607 e!876608)))

(declare-fun res!1073606 () Bool)

(assert (=> b!1572185 (=> (not res!1073606) (not e!876608))))

(assert (=> b!1572185 (= res!1073606 (bvslt (_1!12721 (h!38242 (t!51681 l!750))) (_1!12721 (h!38242 (t!51681 (t!51681 l!750))))))))

(declare-fun b!1572186 () Bool)

(assert (=> b!1572186 (= e!876608 (isStrictlySorted!1001 (t!51681 (t!51681 l!750))))))

(assert (= (and d!164635 (not res!1073605)) b!1572185))

(assert (= (and b!1572185 res!1073606) b!1572186))

(declare-fun m!1446153 () Bool)

(assert (=> b!1572186 m!1446153))

(assert (=> b!1572155 d!164635))

(declare-fun d!164637 () Bool)

(declare-fun res!1073607 () Bool)

(declare-fun e!876609 () Bool)

(assert (=> d!164637 (=> res!1073607 e!876609)))

(assert (=> d!164637 (= res!1073607 (or ((_ is Nil!36778) l!750) ((_ is Nil!36778) (t!51681 l!750))))))

(assert (=> d!164637 (= (isStrictlySorted!1001 l!750) e!876609)))

(declare-fun b!1572187 () Bool)

(declare-fun e!876610 () Bool)

(assert (=> b!1572187 (= e!876609 e!876610)))

(declare-fun res!1073608 () Bool)

(assert (=> b!1572187 (=> (not res!1073608) (not e!876610))))

(assert (=> b!1572187 (= res!1073608 (bvslt (_1!12721 (h!38242 l!750)) (_1!12721 (h!38242 (t!51681 l!750)))))))

(declare-fun b!1572188 () Bool)

(assert (=> b!1572188 (= e!876610 (isStrictlySorted!1001 (t!51681 l!750)))))

(assert (= (and d!164637 (not res!1073607)) b!1572187))

(assert (= (and b!1572187 res!1073608) b!1572188))

(assert (=> b!1572188 m!1446141))

(assert (=> b!1572153 d!164637))

(declare-fun b!1572193 () Bool)

(declare-fun e!876613 () Bool)

(declare-fun tp!114183 () Bool)

(assert (=> b!1572193 (= e!876613 (and tp_is_empty!39085 tp!114183))))

(assert (=> b!1572156 (= tp!114174 e!876613)))

(assert (= (and b!1572156 ((_ is Cons!36777) (t!51681 l!750))) b!1572193))

(check-sat (not b!1572186) (not b!1572188) (not b!1572193) tp_is_empty!39085)
(check-sat)
