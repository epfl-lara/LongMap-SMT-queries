; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107778 () Bool)

(assert start!107778)

(declare-fun res!847258 () Bool)

(declare-fun e!727349 () Bool)

(assert (=> start!107778 (=> (not res!847258) (not e!727349))))

(declare-datatypes ((B!2130 0))(
  ( (B!2131 (val!16661 Int)) )
))
(declare-datatypes ((tuple2!21480 0))(
  ( (tuple2!21481 (_1!10751 (_ BitVec 64)) (_2!10751 B!2130)) )
))
(declare-datatypes ((List!28660 0))(
  ( (Nil!28657) (Cons!28656 (h!29865 tuple2!21480) (t!42185 List!28660)) )
))
(declare-fun l!595 () List!28660)

(declare-fun isStrictlySorted!842 (List!28660) Bool)

(assert (=> start!107778 (= res!847258 (isStrictlySorted!842 l!595))))

(assert (=> start!107778 e!727349))

(declare-fun e!727348 () Bool)

(assert (=> start!107778 e!727348))

(assert (=> start!107778 true))

(declare-fun b!1274499 () Bool)

(declare-fun res!847257 () Bool)

(assert (=> b!1274499 (=> (not res!847257) (not e!727349))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274499 (= res!847257 (and (not (= (_1!10751 (h!29865 l!595)) key!173)) (is-Cons!28656 l!595)))))

(declare-fun b!1274500 () Bool)

(assert (=> b!1274500 (= e!727349 (not (isStrictlySorted!842 (t!42185 l!595))))))

(declare-fun b!1274501 () Bool)

(declare-fun tp_is_empty!33173 () Bool)

(declare-fun tp!97965 () Bool)

(assert (=> b!1274501 (= e!727348 (and tp_is_empty!33173 tp!97965))))

(assert (= (and start!107778 res!847258) b!1274499))

(assert (= (and b!1274499 res!847257) b!1274500))

(assert (= (and start!107778 (is-Cons!28656 l!595)) b!1274501))

(declare-fun m!1170775 () Bool)

(assert (=> start!107778 m!1170775))

(declare-fun m!1170777 () Bool)

(assert (=> b!1274500 m!1170777))

(push 1)

(assert (not start!107778))

(assert (not b!1274500))

(assert (not b!1274501))

(assert tp_is_empty!33173)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140059 () Bool)

(declare-fun res!847273 () Bool)

(declare-fun e!727364 () Bool)

(assert (=> d!140059 (=> res!847273 e!727364)))

(assert (=> d!140059 (= res!847273 (or (is-Nil!28657 l!595) (is-Nil!28657 (t!42185 l!595))))))

(assert (=> d!140059 (= (isStrictlySorted!842 l!595) e!727364)))

(declare-fun b!1274516 () Bool)

(declare-fun e!727365 () Bool)

(assert (=> b!1274516 (= e!727364 e!727365)))

(declare-fun res!847274 () Bool)

(assert (=> b!1274516 (=> (not res!847274) (not e!727365))))

(assert (=> b!1274516 (= res!847274 (bvslt (_1!10751 (h!29865 l!595)) (_1!10751 (h!29865 (t!42185 l!595)))))))

(declare-fun b!1274517 () Bool)

(assert (=> b!1274517 (= e!727365 (isStrictlySorted!842 (t!42185 l!595)))))

(assert (= (and d!140059 (not res!847273)) b!1274516))

(assert (= (and b!1274516 res!847274) b!1274517))

(assert (=> b!1274517 m!1170777))

(assert (=> start!107778 d!140059))

(declare-fun d!140067 () Bool)

(declare-fun res!847279 () Bool)

(declare-fun e!727370 () Bool)

(assert (=> d!140067 (=> res!847279 e!727370)))

(assert (=> d!140067 (= res!847279 (or (is-Nil!28657 (t!42185 l!595)) (is-Nil!28657 (t!42185 (t!42185 l!595)))))))

(assert (=> d!140067 (= (isStrictlySorted!842 (t!42185 l!595)) e!727370)))

(declare-fun b!1274522 () Bool)

(declare-fun e!727371 () Bool)

(assert (=> b!1274522 (= e!727370 e!727371)))

(declare-fun res!847280 () Bool)

(assert (=> b!1274522 (=> (not res!847280) (not e!727371))))

(assert (=> b!1274522 (= res!847280 (bvslt (_1!10751 (h!29865 (t!42185 l!595))) (_1!10751 (h!29865 (t!42185 (t!42185 l!595))))))))

(declare-fun b!1274523 () Bool)

(assert (=> b!1274523 (= e!727371 (isStrictlySorted!842 (t!42185 (t!42185 l!595))))))

(assert (= (and d!140067 (not res!847279)) b!1274522))

(assert (= (and b!1274522 res!847280) b!1274523))

(declare-fun m!1170781 () Bool)

(assert (=> b!1274523 m!1170781))

(assert (=> b!1274500 d!140067))

(declare-fun b!1274539 () Bool)

(declare-fun e!727381 () Bool)

(declare-fun tp!97973 () Bool)

(assert (=> b!1274539 (= e!727381 (and tp_is_empty!33173 tp!97973))))

(assert (=> b!1274501 (= tp!97965 e!727381)))

(assert (= (and b!1274501 (is-Cons!28656 (t!42185 l!595))) b!1274539))

(push 1)

(assert (not b!1274523))

(assert (not b!1274517))

(assert (not b!1274539))

(assert tp_is_empty!33173)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

