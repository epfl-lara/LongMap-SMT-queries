; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103708 () Bool)

(assert start!103708)

(declare-fun b!1241776 () Bool)

(declare-fun e!703880 () Bool)

(declare-fun tp_is_empty!31273 () Bool)

(declare-fun tp!92708 () Bool)

(assert (=> b!1241776 (= e!703880 (and tp_is_empty!31273 tp!92708))))

(declare-fun res!828256 () Bool)

(declare-fun e!703881 () Bool)

(assert (=> start!103708 (=> (not res!828256) (not e!703881))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103708 (= res!828256 (not (= key1!25 key2!15)))))

(assert (=> start!103708 e!703881))

(assert (=> start!103708 true))

(assert (=> start!103708 e!703880))

(declare-fun b!1241773 () Bool)

(declare-fun res!828258 () Bool)

(assert (=> b!1241773 (=> (not res!828258) (not e!703881))))

(declare-datatypes ((B!1874 0))(
  ( (B!1875 (val!15699 Int)) )
))
(declare-datatypes ((tuple2!20354 0))(
  ( (tuple2!20355 (_1!10188 (_ BitVec 64)) (_2!10188 B!1874)) )
))
(declare-datatypes ((List!27426 0))(
  ( (Nil!27423) (Cons!27422 (h!28631 tuple2!20354) (t!40880 List!27426)) )
))
(declare-fun l!644 () List!27426)

(declare-fun isStrictlySorted!753 (List!27426) Bool)

(assert (=> b!1241773 (= res!828258 (isStrictlySorted!753 l!644))))

(declare-fun b!1241775 () Bool)

(assert (=> b!1241775 (= e!703881 (not (isStrictlySorted!753 (t!40880 l!644))))))

(declare-fun b!1241774 () Bool)

(declare-fun res!828257 () Bool)

(assert (=> b!1241774 (=> (not res!828257) (not e!703881))))

(get-info :version)

(assert (=> b!1241774 (= res!828257 ((_ is Cons!27422) l!644))))

(assert (= (and start!103708 res!828256) b!1241773))

(assert (= (and b!1241773 res!828258) b!1241774))

(assert (= (and b!1241774 res!828257) b!1241775))

(assert (= (and start!103708 ((_ is Cons!27422) l!644)) b!1241776))

(declare-fun m!1144165 () Bool)

(assert (=> b!1241773 m!1144165))

(declare-fun m!1144167 () Bool)

(assert (=> b!1241775 m!1144167))

(check-sat (not b!1241773) (not b!1241775) (not b!1241776) tp_is_empty!31273)
(check-sat)
(get-model)

(declare-fun d!136415 () Bool)

(declare-fun res!828289 () Bool)

(declare-fun e!703906 () Bool)

(assert (=> d!136415 (=> res!828289 e!703906)))

(assert (=> d!136415 (= res!828289 (or ((_ is Nil!27423) l!644) ((_ is Nil!27423) (t!40880 l!644))))))

(assert (=> d!136415 (= (isStrictlySorted!753 l!644) e!703906)))

(declare-fun b!1241815 () Bool)

(declare-fun e!703907 () Bool)

(assert (=> b!1241815 (= e!703906 e!703907)))

(declare-fun res!828290 () Bool)

(assert (=> b!1241815 (=> (not res!828290) (not e!703907))))

(assert (=> b!1241815 (= res!828290 (bvslt (_1!10188 (h!28631 l!644)) (_1!10188 (h!28631 (t!40880 l!644)))))))

(declare-fun b!1241816 () Bool)

(assert (=> b!1241816 (= e!703907 (isStrictlySorted!753 (t!40880 l!644)))))

(assert (= (and d!136415 (not res!828289)) b!1241815))

(assert (= (and b!1241815 res!828290) b!1241816))

(assert (=> b!1241816 m!1144167))

(assert (=> b!1241773 d!136415))

(declare-fun d!136421 () Bool)

(declare-fun res!828291 () Bool)

(declare-fun e!703910 () Bool)

(assert (=> d!136421 (=> res!828291 e!703910)))

(assert (=> d!136421 (= res!828291 (or ((_ is Nil!27423) (t!40880 l!644)) ((_ is Nil!27423) (t!40880 (t!40880 l!644)))))))

(assert (=> d!136421 (= (isStrictlySorted!753 (t!40880 l!644)) e!703910)))

(declare-fun b!1241819 () Bool)

(declare-fun e!703911 () Bool)

(assert (=> b!1241819 (= e!703910 e!703911)))

(declare-fun res!828292 () Bool)

(assert (=> b!1241819 (=> (not res!828292) (not e!703911))))

(assert (=> b!1241819 (= res!828292 (bvslt (_1!10188 (h!28631 (t!40880 l!644))) (_1!10188 (h!28631 (t!40880 (t!40880 l!644))))))))

(declare-fun b!1241820 () Bool)

(assert (=> b!1241820 (= e!703911 (isStrictlySorted!753 (t!40880 (t!40880 l!644))))))

(assert (= (and d!136421 (not res!828291)) b!1241819))

(assert (= (and b!1241819 res!828292) b!1241820))

(declare-fun m!1144179 () Bool)

(assert (=> b!1241820 m!1144179))

(assert (=> b!1241775 d!136421))

(declare-fun b!1241830 () Bool)

(declare-fun e!703919 () Bool)

(declare-fun tp!92720 () Bool)

(assert (=> b!1241830 (= e!703919 (and tp_is_empty!31273 tp!92720))))

(assert (=> b!1241776 (= tp!92708 e!703919)))

(assert (= (and b!1241776 ((_ is Cons!27422) (t!40880 l!644))) b!1241830))

(check-sat (not b!1241820) (not b!1241816) (not b!1241830) tp_is_empty!31273)
(check-sat)
