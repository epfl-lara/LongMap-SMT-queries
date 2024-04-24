; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103956 () Bool)

(assert start!103956)

(declare-fun b!1243211 () Bool)

(declare-fun e!704806 () Bool)

(declare-datatypes ((B!1878 0))(
  ( (B!1879 (val!15701 Int)) )
))
(declare-datatypes ((tuple2!20290 0))(
  ( (tuple2!20291 (_1!10156 (_ BitVec 64)) (_2!10156 B!1878)) )
))
(declare-datatypes ((List!27391 0))(
  ( (Nil!27388) (Cons!27387 (h!28605 tuple2!20290) (t!40846 List!27391)) )
))
(declare-fun l!644 () List!27391)

(declare-fun isStrictlySorted!747 (List!27391) Bool)

(assert (=> b!1243211 (= e!704806 (not (isStrictlySorted!747 (t!40846 l!644))))))

(declare-fun b!1243210 () Bool)

(declare-fun res!828854 () Bool)

(assert (=> b!1243210 (=> (not res!828854) (not e!704806))))

(assert (=> b!1243210 (= res!828854 (is-Cons!27387 l!644))))

(declare-fun b!1243209 () Bool)

(declare-fun res!828855 () Bool)

(assert (=> b!1243209 (=> (not res!828855) (not e!704806))))

(assert (=> b!1243209 (= res!828855 (isStrictlySorted!747 l!644))))

(declare-fun res!828853 () Bool)

(assert (=> start!103956 (=> (not res!828853) (not e!704806))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103956 (= res!828853 (not (= key1!25 key2!15)))))

(assert (=> start!103956 e!704806))

(assert (=> start!103956 true))

(declare-fun e!704807 () Bool)

(assert (=> start!103956 e!704807))

(declare-fun b!1243212 () Bool)

(declare-fun tp_is_empty!31277 () Bool)

(declare-fun tp!92714 () Bool)

(assert (=> b!1243212 (= e!704807 (and tp_is_empty!31277 tp!92714))))

(assert (= (and start!103956 res!828853) b!1243209))

(assert (= (and b!1243209 res!828855) b!1243210))

(assert (= (and b!1243210 res!828854) b!1243211))

(assert (= (and start!103956 (is-Cons!27387 l!644)) b!1243212))

(declare-fun m!1146347 () Bool)

(assert (=> b!1243211 m!1146347))

(declare-fun m!1146349 () Bool)

(assert (=> b!1243209 m!1146349))

(push 1)

(assert (not b!1243211))

(assert (not b!1243209))

(assert (not b!1243212))

(assert tp_is_empty!31277)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137013 () Bool)

(declare-fun res!828864 () Bool)

(declare-fun e!704816 () Bool)

(assert (=> d!137013 (=> res!828864 e!704816)))

(assert (=> d!137013 (= res!828864 (or (is-Nil!27388 (t!40846 l!644)) (is-Nil!27388 (t!40846 (t!40846 l!644)))))))

(assert (=> d!137013 (= (isStrictlySorted!747 (t!40846 l!644)) e!704816)))

(declare-fun b!1243221 () Bool)

(declare-fun e!704817 () Bool)

(assert (=> b!1243221 (= e!704816 e!704817)))

(declare-fun res!828865 () Bool)

(assert (=> b!1243221 (=> (not res!828865) (not e!704817))))

(assert (=> b!1243221 (= res!828865 (bvslt (_1!10156 (h!28605 (t!40846 l!644))) (_1!10156 (h!28605 (t!40846 (t!40846 l!644))))))))

(declare-fun b!1243222 () Bool)

(assert (=> b!1243222 (= e!704817 (isStrictlySorted!747 (t!40846 (t!40846 l!644))))))

(assert (= (and d!137013 (not res!828864)) b!1243221))

(assert (= (and b!1243221 res!828865) b!1243222))

(declare-fun m!1146351 () Bool)

(assert (=> b!1243222 m!1146351))

(assert (=> b!1243211 d!137013))

(declare-fun d!137019 () Bool)

(declare-fun res!828866 () Bool)

(declare-fun e!704818 () Bool)

(assert (=> d!137019 (=> res!828866 e!704818)))

(assert (=> d!137019 (= res!828866 (or (is-Nil!27388 l!644) (is-Nil!27388 (t!40846 l!644))))))

(assert (=> d!137019 (= (isStrictlySorted!747 l!644) e!704818)))

(declare-fun b!1243223 () Bool)

(declare-fun e!704819 () Bool)

(assert (=> b!1243223 (= e!704818 e!704819)))

(declare-fun res!828867 () Bool)

(assert (=> b!1243223 (=> (not res!828867) (not e!704819))))

(assert (=> b!1243223 (= res!828867 (bvslt (_1!10156 (h!28605 l!644)) (_1!10156 (h!28605 (t!40846 l!644)))))))

(declare-fun b!1243224 () Bool)

(assert (=> b!1243224 (= e!704819 (isStrictlySorted!747 (t!40846 l!644)))))

(assert (= (and d!137019 (not res!828866)) b!1243223))

(assert (= (and b!1243223 res!828867) b!1243224))

(assert (=> b!1243224 m!1146347))

(assert (=> b!1243209 d!137019))

(declare-fun b!1243233 () Bool)

(declare-fun e!704826 () Bool)

(declare-fun tp!92717 () Bool)

(assert (=> b!1243233 (= e!704826 (and tp_is_empty!31277 tp!92717))))

(assert (=> b!1243212 (= tp!92714 e!704826)))

(assert (= (and b!1243212 (is-Cons!27387 (t!40846 l!644))) b!1243233))

(push 1)

(assert (not b!1243222))

(assert (not b!1243224))

(assert (not b!1243233))

(assert tp_is_empty!31277)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

