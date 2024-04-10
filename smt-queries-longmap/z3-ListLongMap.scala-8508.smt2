; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103718 () Bool)

(assert start!103718)

(declare-fun b!1241876 () Bool)

(declare-fun e!703937 () Bool)

(declare-fun tp_is_empty!31275 () Bool)

(declare-fun tp!92711 () Bool)

(assert (=> b!1241876 (= e!703937 (and tp_is_empty!31275 tp!92711))))

(declare-fun res!828313 () Bool)

(declare-fun e!703938 () Bool)

(assert (=> start!103718 (=> (not res!828313) (not e!703938))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103718 (= res!828313 (not (= key1!25 key2!15)))))

(assert (=> start!103718 e!703938))

(assert (=> start!103718 true))

(assert (=> start!103718 e!703937))

(declare-fun b!1241874 () Bool)

(declare-fun res!828311 () Bool)

(assert (=> b!1241874 (=> (not res!828311) (not e!703938))))

(declare-datatypes ((B!1876 0))(
  ( (B!1877 (val!15700 Int)) )
))
(declare-datatypes ((tuple2!20272 0))(
  ( (tuple2!20273 (_1!10147 (_ BitVec 64)) (_2!10147 B!1876)) )
))
(declare-datatypes ((List!27365 0))(
  ( (Nil!27362) (Cons!27361 (h!28570 tuple2!20272) (t!40828 List!27365)) )
))
(declare-fun l!644 () List!27365)

(get-info :version)

(assert (=> b!1241874 (= res!828311 ((_ is Cons!27361) l!644))))

(declare-fun b!1241873 () Bool)

(declare-fun res!828312 () Bool)

(assert (=> b!1241873 (=> (not res!828312) (not e!703938))))

(declare-fun isStrictlySorted!758 (List!27365) Bool)

(assert (=> b!1241873 (= res!828312 (isStrictlySorted!758 l!644))))

(declare-fun b!1241875 () Bool)

(assert (=> b!1241875 (= e!703938 (not (isStrictlySorted!758 (t!40828 l!644))))))

(assert (= (and start!103718 res!828313) b!1241873))

(assert (= (and b!1241873 res!828312) b!1241874))

(assert (= (and b!1241874 res!828311) b!1241875))

(assert (= (and start!103718 ((_ is Cons!27361) l!644)) b!1241876))

(declare-fun m!1144703 () Bool)

(assert (=> b!1241873 m!1144703))

(declare-fun m!1144705 () Bool)

(assert (=> b!1241875 m!1144705))

(check-sat (not b!1241873) (not b!1241875) (not b!1241876) tp_is_empty!31275)
(check-sat)
(get-model)

(declare-fun d!136551 () Bool)

(declare-fun res!828334 () Bool)

(declare-fun e!703956 () Bool)

(assert (=> d!136551 (=> res!828334 e!703956)))

(assert (=> d!136551 (= res!828334 (or ((_ is Nil!27362) l!644) ((_ is Nil!27362) (t!40828 l!644))))))

(assert (=> d!136551 (= (isStrictlySorted!758 l!644) e!703956)))

(declare-fun b!1241899 () Bool)

(declare-fun e!703957 () Bool)

(assert (=> b!1241899 (= e!703956 e!703957)))

(declare-fun res!828335 () Bool)

(assert (=> b!1241899 (=> (not res!828335) (not e!703957))))

(assert (=> b!1241899 (= res!828335 (bvslt (_1!10147 (h!28570 l!644)) (_1!10147 (h!28570 (t!40828 l!644)))))))

(declare-fun b!1241900 () Bool)

(assert (=> b!1241900 (= e!703957 (isStrictlySorted!758 (t!40828 l!644)))))

(assert (= (and d!136551 (not res!828334)) b!1241899))

(assert (= (and b!1241899 res!828335) b!1241900))

(assert (=> b!1241900 m!1144705))

(assert (=> b!1241873 d!136551))

(declare-fun d!136557 () Bool)

(declare-fun res!828340 () Bool)

(declare-fun e!703962 () Bool)

(assert (=> d!136557 (=> res!828340 e!703962)))

(assert (=> d!136557 (= res!828340 (or ((_ is Nil!27362) (t!40828 l!644)) ((_ is Nil!27362) (t!40828 (t!40828 l!644)))))))

(assert (=> d!136557 (= (isStrictlySorted!758 (t!40828 l!644)) e!703962)))

(declare-fun b!1241906 () Bool)

(declare-fun e!703964 () Bool)

(assert (=> b!1241906 (= e!703962 e!703964)))

(declare-fun res!828342 () Bool)

(assert (=> b!1241906 (=> (not res!828342) (not e!703964))))

(assert (=> b!1241906 (= res!828342 (bvslt (_1!10147 (h!28570 (t!40828 l!644))) (_1!10147 (h!28570 (t!40828 (t!40828 l!644))))))))

(declare-fun b!1241908 () Bool)

(assert (=> b!1241908 (= e!703964 (isStrictlySorted!758 (t!40828 (t!40828 l!644))))))

(assert (= (and d!136557 (not res!828340)) b!1241906))

(assert (= (and b!1241906 res!828342) b!1241908))

(declare-fun m!1144711 () Bool)

(assert (=> b!1241908 m!1144711))

(assert (=> b!1241875 d!136557))

(declare-fun b!1241920 () Bool)

(declare-fun e!703972 () Bool)

(declare-fun tp!92720 () Bool)

(assert (=> b!1241920 (= e!703972 (and tp_is_empty!31275 tp!92720))))

(assert (=> b!1241876 (= tp!92711 e!703972)))

(assert (= (and b!1241876 ((_ is Cons!27361) (t!40828 l!644))) b!1241920))

(check-sat (not b!1241900) (not b!1241908) (not b!1241920) tp_is_empty!31275)
(check-sat)
