; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103654 () Bool)

(assert start!103654)

(declare-fun b!1241505 () Bool)

(declare-fun res!828157 () Bool)

(declare-fun e!703697 () Bool)

(assert (=> b!1241505 (=> (not res!828157) (not e!703697))))

(declare-datatypes ((B!1848 0))(
  ( (B!1849 (val!15686 Int)) )
))
(declare-datatypes ((tuple2!20244 0))(
  ( (tuple2!20245 (_1!10133 (_ BitVec 64)) (_2!10133 B!1848)) )
))
(declare-datatypes ((List!27351 0))(
  ( (Nil!27348) (Cons!27347 (h!28556 tuple2!20244) (t!40814 List!27351)) )
))
(declare-fun l!644 () List!27351)

(assert (=> b!1241505 (= res!828157 (not (is-Cons!27347 l!644)))))

(declare-fun b!1241504 () Bool)

(declare-fun res!828156 () Bool)

(assert (=> b!1241504 (=> (not res!828156) (not e!703697))))

(declare-fun isStrictlySorted!750 (List!27351) Bool)

(assert (=> b!1241504 (= res!828156 (isStrictlySorted!750 l!644))))

(declare-fun b!1241506 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!129 (List!27351 (_ BitVec 64)) List!27351)

(assert (=> b!1241506 (= e!703697 (not (isStrictlySorted!750 (removeStrictlySorted!129 l!644 key2!15))))))

(declare-fun res!828155 () Bool)

(assert (=> start!103654 (=> (not res!828155) (not e!703697))))

(declare-fun key1!25 () (_ BitVec 64))

(assert (=> start!103654 (= res!828155 (not (= key1!25 key2!15)))))

(assert (=> start!103654 e!703697))

(assert (=> start!103654 true))

(declare-fun e!703698 () Bool)

(assert (=> start!103654 e!703698))

(declare-fun b!1241507 () Bool)

(declare-fun tp_is_empty!31247 () Bool)

(declare-fun tp!92642 () Bool)

(assert (=> b!1241507 (= e!703698 (and tp_is_empty!31247 tp!92642))))

(assert (= (and start!103654 res!828155) b!1241504))

(assert (= (and b!1241504 res!828156) b!1241505))

(assert (= (and b!1241505 res!828157) b!1241506))

(assert (= (and start!103654 (is-Cons!27347 l!644)) b!1241507))

(declare-fun m!1144573 () Bool)

(assert (=> b!1241504 m!1144573))

(declare-fun m!1144575 () Bool)

(assert (=> b!1241506 m!1144575))

(assert (=> b!1241506 m!1144575))

(declare-fun m!1144577 () Bool)

(assert (=> b!1241506 m!1144577))

(push 1)

(assert (not b!1241506))

(assert (not b!1241504))

(assert (not b!1241507))

(assert tp_is_empty!31247)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136495 () Bool)

(declare-fun res!828174 () Bool)

(declare-fun e!703719 () Bool)

(assert (=> d!136495 (=> res!828174 e!703719)))

(assert (=> d!136495 (= res!828174 (or (is-Nil!27348 (removeStrictlySorted!129 l!644 key2!15)) (is-Nil!27348 (t!40814 (removeStrictlySorted!129 l!644 key2!15)))))))

(assert (=> d!136495 (= (isStrictlySorted!750 (removeStrictlySorted!129 l!644 key2!15)) e!703719)))

(declare-fun b!1241532 () Bool)

(declare-fun e!703720 () Bool)

(assert (=> b!1241532 (= e!703719 e!703720)))

(declare-fun res!828175 () Bool)

(assert (=> b!1241532 (=> (not res!828175) (not e!703720))))

(assert (=> b!1241532 (= res!828175 (bvslt (_1!10133 (h!28556 (removeStrictlySorted!129 l!644 key2!15))) (_1!10133 (h!28556 (t!40814 (removeStrictlySorted!129 l!644 key2!15))))))))

(declare-fun b!1241533 () Bool)

(assert (=> b!1241533 (= e!703720 (isStrictlySorted!750 (t!40814 (removeStrictlySorted!129 l!644 key2!15))))))

(assert (= (and d!136495 (not res!828174)) b!1241532))

(assert (= (and b!1241532 res!828175) b!1241533))

(declare-fun m!1144583 () Bool)

(assert (=> b!1241533 m!1144583))

(assert (=> b!1241506 d!136495))

(declare-fun b!1241580 () Bool)

(declare-fun e!703751 () List!27351)

(assert (=> b!1241580 (= e!703751 (t!40814 l!644))))

(declare-fun b!1241582 () Bool)

(declare-fun e!703752 () Bool)

(declare-fun lt!562151 () List!27351)

(declare-fun containsKey!608 (List!27351 (_ BitVec 64)) Bool)

(assert (=> b!1241582 (= e!703752 (not (containsKey!608 lt!562151 key2!15)))))

(declare-fun b!1241583 () Bool)

(declare-fun e!703753 () List!27351)

(declare-fun $colon$colon!622 (List!27351 tuple2!20244) List!27351)

(assert (=> b!1241583 (= e!703753 ($colon$colon!622 (removeStrictlySorted!129 (t!40814 l!644) key2!15) (h!28556 l!644)))))

(declare-fun b!1241584 () Bool)

(assert (=> b!1241584 (= e!703753 Nil!27348)))

