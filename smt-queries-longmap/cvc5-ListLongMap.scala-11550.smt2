; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134456 () Bool)

(assert start!134456)

(declare-fun b!1569720 () Bool)

(declare-fun e!875080 () Bool)

(declare-fun tp_is_empty!39085 () Bool)

(declare-fun tp!114174 () Bool)

(assert (=> b!1569720 (= e!875080 (and tp_is_empty!39085 tp!114174))))

(declare-fun b!1569718 () Bool)

(declare-fun res!1072720 () Bool)

(declare-fun e!875081 () Bool)

(assert (=> b!1569718 (=> (not res!1072720) (not e!875081))))

(declare-datatypes ((B!2534 0))(
  ( (B!2535 (val!19629 Int)) )
))
(declare-datatypes ((tuple2!25360 0))(
  ( (tuple2!25361 (_1!12691 (_ BitVec 64)) (_2!12691 B!2534)) )
))
(declare-datatypes ((List!36749 0))(
  ( (Nil!36746) (Cons!36745 (h!38192 tuple2!25360) (t!51657 List!36749)) )
))
(declare-fun l!750 () List!36749)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569718 (= res!1072720 (and (is-Cons!36745 l!750) (bvslt (_1!12691 (h!38192 l!750)) key1!37) (bvslt (_1!12691 (h!38192 l!750)) key2!21)))))

(declare-fun b!1569719 () Bool)

(declare-fun isStrictlySorted!1013 (List!36749) Bool)

(assert (=> b!1569719 (= e!875081 (not (isStrictlySorted!1013 (t!51657 l!750))))))

(declare-fun b!1569717 () Bool)

(declare-fun res!1072721 () Bool)

(assert (=> b!1569717 (=> (not res!1072721) (not e!875081))))

(assert (=> b!1569717 (= res!1072721 (isStrictlySorted!1013 l!750))))

(declare-fun res!1072722 () Bool)

(assert (=> start!134456 (=> (not res!1072722) (not e!875081))))

(assert (=> start!134456 (= res!1072722 (not (= key1!37 key2!21)))))

(assert (=> start!134456 e!875081))

(assert (=> start!134456 true))

(assert (=> start!134456 e!875080))

(assert (= (and start!134456 res!1072722) b!1569717))

(assert (= (and b!1569717 res!1072721) b!1569718))

(assert (= (and b!1569718 res!1072720) b!1569719))

(assert (= (and start!134456 (is-Cons!36745 l!750)) b!1569720))

(declare-fun m!1443883 () Bool)

(assert (=> b!1569719 m!1443883))

(declare-fun m!1443885 () Bool)

(assert (=> b!1569717 m!1443885))

(push 1)

(assert (not b!1569719))

(assert (not b!1569717))

(assert (not b!1569720))

(assert tp_is_empty!39085)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163937 () Bool)

(declare-fun res!1072753 () Bool)

(declare-fun e!875109 () Bool)

(assert (=> d!163937 (=> res!1072753 e!875109)))

(assert (=> d!163937 (= res!1072753 (or (is-Nil!36746 (t!51657 l!750)) (is-Nil!36746 (t!51657 (t!51657 l!750)))))))

(assert (=> d!163937 (= (isStrictlySorted!1013 (t!51657 l!750)) e!875109)))

(declare-fun b!1569762 () Bool)

(declare-fun e!875110 () Bool)

(assert (=> b!1569762 (= e!875109 e!875110)))

(declare-fun res!1072754 () Bool)

(assert (=> b!1569762 (=> (not res!1072754) (not e!875110))))

(assert (=> b!1569762 (= res!1072754 (bvslt (_1!12691 (h!38192 (t!51657 l!750))) (_1!12691 (h!38192 (t!51657 (t!51657 l!750))))))))

(declare-fun b!1569763 () Bool)

(assert (=> b!1569763 (= e!875110 (isStrictlySorted!1013 (t!51657 (t!51657 l!750))))))

(assert (= (and d!163937 (not res!1072753)) b!1569762))

(assert (= (and b!1569762 res!1072754) b!1569763))

(declare-fun m!1443897 () Bool)

(assert (=> b!1569763 m!1443897))

(assert (=> b!1569719 d!163937))

(declare-fun d!163939 () Bool)

(declare-fun res!1072755 () Bool)

(declare-fun e!875111 () Bool)

(assert (=> d!163939 (=> res!1072755 e!875111)))

(assert (=> d!163939 (= res!1072755 (or (is-Nil!36746 l!750) (is-Nil!36746 (t!51657 l!750))))))

(assert (=> d!163939 (= (isStrictlySorted!1013 l!750) e!875111)))

(declare-fun b!1569764 () Bool)

(declare-fun e!875112 () Bool)

(assert (=> b!1569764 (= e!875111 e!875112)))

(declare-fun res!1072756 () Bool)

(assert (=> b!1569764 (=> (not res!1072756) (not e!875112))))

(assert (=> b!1569764 (= res!1072756 (bvslt (_1!12691 (h!38192 l!750)) (_1!12691 (h!38192 (t!51657 l!750)))))))

(declare-fun b!1569765 () Bool)

(assert (=> b!1569765 (= e!875112 (isStrictlySorted!1013 (t!51657 l!750)))))

(assert (= (and d!163939 (not res!1072755)) b!1569764))

(assert (= (and b!1569764 res!1072756) b!1569765))

(assert (=> b!1569765 m!1443883))

(assert (=> b!1569717 d!163939))

(declare-fun b!1569770 () Bool)

(declare-fun e!875115 () Bool)

(declare-fun tp!114186 () Bool)

(assert (=> b!1569770 (= e!875115 (and tp_is_empty!39085 tp!114186))))

(assert (=> b!1569720 (= tp!114174 e!875115)))

(assert (= (and b!1569720 (is-Cons!36745 (t!51657 l!750))) b!1569770))

(push 1)

(assert (not b!1569763))

