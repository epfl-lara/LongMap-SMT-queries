; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137516 () Bool)

(assert start!137516)

(declare-fun res!1080684 () Bool)

(declare-fun e!882625 () Bool)

(assert (=> start!137516 (=> (not res!1080684) (not e!882625))))

(declare-datatypes ((B!2732 0))(
  ( (B!2733 (val!19728 Int)) )
))
(declare-datatypes ((tuple2!25692 0))(
  ( (tuple2!25693 (_1!12857 (_ BitVec 64)) (_2!12857 B!2732)) )
))
(declare-datatypes ((List!36889 0))(
  ( (Nil!36886) (Cons!36885 (h!38429 tuple2!25692) (t!51795 List!36889)) )
))
(declare-fun l!1356 () List!36889)

(declare-fun isStrictlySorted!1101 (List!36889) Bool)

(assert (=> start!137516 (= res!1080684 (isStrictlySorted!1101 l!1356))))

(assert (=> start!137516 e!882625))

(declare-fun e!882626 () Bool)

(assert (=> start!137516 e!882626))

(assert (=> start!137516 true))

(declare-fun b!1581703 () Bool)

(declare-fun res!1080683 () Bool)

(assert (=> b!1581703 (=> (not res!1080683) (not e!882625))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!947 (List!36889 (_ BitVec 64)) Bool)

(assert (=> b!1581703 (= res!1080683 (not (containsKey!947 l!1356 key!387)))))

(declare-fun b!1581704 () Bool)

(declare-fun ListPrimitiveSize!199 (List!36889) Int)

(assert (=> b!1581704 (= e!882625 (< (ListPrimitiveSize!199 l!1356) 0))))

(declare-fun b!1581705 () Bool)

(declare-fun tp_is_empty!39277 () Bool)

(declare-fun tp!114660 () Bool)

(assert (=> b!1581705 (= e!882626 (and tp_is_empty!39277 tp!114660))))

(assert (= (and start!137516 res!1080684) b!1581703))

(assert (= (and b!1581703 res!1080683) b!1581704))

(get-info :version)

(assert (= (and start!137516 ((_ is Cons!36885) l!1356)) b!1581705))

(declare-fun m!1451815 () Bool)

(assert (=> start!137516 m!1451815))

(declare-fun m!1451817 () Bool)

(assert (=> b!1581703 m!1451817))

(declare-fun m!1451819 () Bool)

(assert (=> b!1581704 m!1451819))

(check-sat (not b!1581705) (not b!1581704) (not b!1581703) tp_is_empty!39277 (not start!137516))
(check-sat)
(get-model)

(declare-fun d!166653 () Bool)

(declare-fun res!1080711 () Bool)

(declare-fun e!882653 () Bool)

(assert (=> d!166653 (=> res!1080711 e!882653)))

(assert (=> d!166653 (= res!1080711 (and ((_ is Cons!36885) l!1356) (= (_1!12857 (h!38429 l!1356)) key!387)))))

(assert (=> d!166653 (= (containsKey!947 l!1356 key!387) e!882653)))

(declare-fun b!1581738 () Bool)

(declare-fun e!882654 () Bool)

(assert (=> b!1581738 (= e!882653 e!882654)))

(declare-fun res!1080712 () Bool)

(assert (=> b!1581738 (=> (not res!1080712) (not e!882654))))

(assert (=> b!1581738 (= res!1080712 (and (or (not ((_ is Cons!36885) l!1356)) (bvsle (_1!12857 (h!38429 l!1356)) key!387)) ((_ is Cons!36885) l!1356) (bvslt (_1!12857 (h!38429 l!1356)) key!387)))))

(declare-fun b!1581739 () Bool)

(assert (=> b!1581739 (= e!882654 (containsKey!947 (t!51795 l!1356) key!387))))

(assert (= (and d!166653 (not res!1080711)) b!1581738))

(assert (= (and b!1581738 res!1080712) b!1581739))

(declare-fun m!1451837 () Bool)

(assert (=> b!1581739 m!1451837))

(assert (=> b!1581703 d!166653))

(declare-fun d!166663 () Bool)

(declare-fun lt!676754 () Int)

(assert (=> d!166663 (>= lt!676754 0)))

(declare-fun e!882667 () Int)

(assert (=> d!166663 (= lt!676754 e!882667)))

(declare-fun c!146546 () Bool)

(assert (=> d!166663 (= c!146546 ((_ is Nil!36886) l!1356))))

(assert (=> d!166663 (= (ListPrimitiveSize!199 l!1356) lt!676754)))

(declare-fun b!1581754 () Bool)

(assert (=> b!1581754 (= e!882667 0)))

(declare-fun b!1581755 () Bool)

(assert (=> b!1581755 (= e!882667 (+ 1 (ListPrimitiveSize!199 (t!51795 l!1356))))))

(assert (= (and d!166663 c!146546) b!1581754))

(assert (= (and d!166663 (not c!146546)) b!1581755))

(declare-fun m!1451839 () Bool)

(assert (=> b!1581755 m!1451839))

(assert (=> b!1581704 d!166663))

(declare-fun d!166665 () Bool)

(declare-fun res!1080731 () Bool)

(declare-fun e!882680 () Bool)

(assert (=> d!166665 (=> res!1080731 e!882680)))

(assert (=> d!166665 (= res!1080731 (or ((_ is Nil!36886) l!1356) ((_ is Nil!36886) (t!51795 l!1356))))))

(assert (=> d!166665 (= (isStrictlySorted!1101 l!1356) e!882680)))

(declare-fun b!1581772 () Bool)

(declare-fun e!882681 () Bool)

(assert (=> b!1581772 (= e!882680 e!882681)))

(declare-fun res!1080732 () Bool)

(assert (=> b!1581772 (=> (not res!1080732) (not e!882681))))

(assert (=> b!1581772 (= res!1080732 (bvslt (_1!12857 (h!38429 l!1356)) (_1!12857 (h!38429 (t!51795 l!1356)))))))

(declare-fun b!1581773 () Bool)

(assert (=> b!1581773 (= e!882681 (isStrictlySorted!1101 (t!51795 l!1356)))))

(assert (= (and d!166665 (not res!1080731)) b!1581772))

(assert (= (and b!1581772 res!1080732) b!1581773))

(declare-fun m!1451845 () Bool)

(assert (=> b!1581773 m!1451845))

(assert (=> start!137516 d!166665))

(declare-fun b!1581788 () Bool)

(declare-fun e!882688 () Bool)

(declare-fun tp!114671 () Bool)

(assert (=> b!1581788 (= e!882688 (and tp_is_empty!39277 tp!114671))))

(assert (=> b!1581705 (= tp!114660 e!882688)))

(assert (= (and b!1581705 ((_ is Cons!36885) (t!51795 l!1356))) b!1581788))

(check-sat (not b!1581755) (not b!1581773) tp_is_empty!39277 (not b!1581739) (not b!1581788))
(check-sat)
