; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137288 () Bool)

(assert start!137288)

(declare-fun b!1580764 () Bool)

(declare-fun res!1080006 () Bool)

(declare-fun e!881957 () Bool)

(assert (=> b!1580764 (=> (not res!1080006) (not e!881957))))

(declare-datatypes ((B!2684 0))(
  ( (B!2685 (val!19704 Int)) )
))
(declare-datatypes ((tuple2!25620 0))(
  ( (tuple2!25621 (_1!12821 (_ BitVec 64)) (_2!12821 B!2684)) )
))
(declare-datatypes ((List!36865 0))(
  ( (Nil!36862) (Cons!36861 (h!38405 tuple2!25620) (t!51771 List!36865)) )
))
(declare-fun l!1390 () List!36865)

(declare-fun key!405 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1580764 (= res!1080006 (and (or (not ((_ is Cons!36861) l!1390)) (not (= (_1!12821 (h!38405 l!1390)) key!405))) ((_ is Cons!36861) l!1390)))))

(declare-fun res!1080004 () Bool)

(declare-fun e!881958 () Bool)

(assert (=> start!137288 (=> (not res!1080004) (not e!881958))))

(declare-fun isStrictlySorted!1080 (List!36865) Bool)

(assert (=> start!137288 (= res!1080004 (isStrictlySorted!1080 l!1390))))

(assert (=> start!137288 e!881958))

(declare-fun e!881956 () Bool)

(assert (=> start!137288 e!881956))

(assert (=> start!137288 true))

(declare-fun tp_is_empty!39229 () Bool)

(assert (=> start!137288 tp_is_empty!39229))

(declare-fun b!1580765 () Bool)

(declare-fun e!881960 () Bool)

(declare-datatypes ((tuple2!25622 0))(
  ( (tuple2!25623 (_1!12822 tuple2!25620) (_2!12822 List!36865)) )
))
(declare-datatypes ((Option!919 0))(
  ( (Some!918 (v!22422 tuple2!25622)) (None!917) )
))
(declare-fun lt!676591 () Option!919)

(declare-fun get!26805 (Option!919) tuple2!25622)

(assert (=> b!1580765 (= e!881960 (not ((_ is Nil!36862) (_2!12822 (get!26805 lt!676591)))))))

(declare-fun b!1580766 () Bool)

(declare-fun tp!114543 () Bool)

(assert (=> b!1580766 (= e!881956 (and tp_is_empty!39229 tp!114543))))

(declare-fun b!1580767 () Bool)

(declare-fun res!1080003 () Bool)

(declare-fun e!881955 () Bool)

(assert (=> b!1580767 (=> res!1080003 e!881955)))

(declare-fun containsKey!926 (List!36865 (_ BitVec 64)) Bool)

(assert (=> b!1580767 (= res!1080003 (not (containsKey!926 (t!51771 l!1390) key!405)))))

(declare-fun b!1580768 () Bool)

(declare-fun res!1080000 () Bool)

(assert (=> b!1580768 (=> (not res!1080000) (not e!881958))))

(assert (=> b!1580768 (= res!1080000 (containsKey!926 l!1390 key!405))))

(declare-fun b!1580769 () Bool)

(declare-fun lt!676592 () tuple2!25620)

(declare-fun contains!10451 (List!36865 tuple2!25620) Bool)

(assert (=> b!1580769 (= e!881955 (not (contains!10451 (t!51771 l!1390) lt!676592)))))

(declare-fun b!1580770 () Bool)

(declare-fun e!881959 () Bool)

(assert (=> b!1580770 (= e!881959 e!881957)))

(declare-fun res!1079999 () Bool)

(assert (=> b!1580770 (=> (not res!1079999) (not e!881957))))

(assert (=> b!1580770 (= res!1079999 e!881960)))

(declare-fun res!1080005 () Bool)

(assert (=> b!1580770 (=> res!1080005 e!881960)))

(declare-fun isEmpty!1179 (Option!919) Bool)

(assert (=> b!1580770 (= res!1080005 (isEmpty!1179 lt!676591))))

(declare-fun unapply!91 (List!36865) Option!919)

(assert (=> b!1580770 (= lt!676591 (unapply!91 l!1390))))

(declare-fun b!1580771 () Bool)

(assert (=> b!1580771 (= e!881958 e!881959)))

(declare-fun res!1080002 () Bool)

(assert (=> b!1580771 (=> (not res!1080002) (not e!881959))))

(assert (=> b!1580771 (= res!1080002 (contains!10451 l!1390 lt!676592))))

(declare-fun value!194 () B!2684)

(assert (=> b!1580771 (= lt!676592 (tuple2!25621 key!405 value!194))))

(declare-fun b!1580772 () Bool)

(assert (=> b!1580772 (= e!881957 e!881955)))

(declare-fun res!1080001 () Bool)

(assert (=> b!1580772 (=> res!1080001 e!881955)))

(assert (=> b!1580772 (= res!1080001 (not (isStrictlySorted!1080 (t!51771 l!1390))))))

(assert (= (and start!137288 res!1080004) b!1580768))

(assert (= (and b!1580768 res!1080000) b!1580771))

(assert (= (and b!1580771 res!1080002) b!1580770))

(assert (= (and b!1580770 (not res!1080005)) b!1580765))

(assert (= (and b!1580770 res!1079999) b!1580764))

(assert (= (and b!1580764 res!1080006) b!1580772))

(assert (= (and b!1580772 (not res!1080001)) b!1580767))

(assert (= (and b!1580767 (not res!1080003)) b!1580769))

(assert (= (and start!137288 ((_ is Cons!36861) l!1390)) b!1580766))

(declare-fun m!1451323 () Bool)

(assert (=> b!1580767 m!1451323))

(declare-fun m!1451325 () Bool)

(assert (=> start!137288 m!1451325))

(declare-fun m!1451327 () Bool)

(assert (=> b!1580768 m!1451327))

(declare-fun m!1451329 () Bool)

(assert (=> b!1580772 m!1451329))

(declare-fun m!1451331 () Bool)

(assert (=> b!1580769 m!1451331))

(declare-fun m!1451333 () Bool)

(assert (=> b!1580770 m!1451333))

(declare-fun m!1451335 () Bool)

(assert (=> b!1580770 m!1451335))

(declare-fun m!1451337 () Bool)

(assert (=> b!1580771 m!1451337))

(declare-fun m!1451339 () Bool)

(assert (=> b!1580765 m!1451339))

(check-sat (not b!1580766) (not b!1580771) (not start!137288) (not b!1580770) (not b!1580767) (not b!1580772) (not b!1580769) (not b!1580768) tp_is_empty!39229 (not b!1580765))
(check-sat)
(get-model)

(declare-fun d!166379 () Bool)

(assert (=> d!166379 (= (isEmpty!1179 lt!676591) (not ((_ is Some!918) lt!676591)))))

(assert (=> b!1580770 d!166379))

(declare-fun d!166381 () Bool)

(assert (=> d!166381 (= (unapply!91 l!1390) (ite ((_ is Nil!36862) l!1390) None!917 (Some!918 (tuple2!25623 (h!38405 l!1390) (t!51771 l!1390)))))))

(assert (=> b!1580770 d!166381))

(declare-fun d!166383 () Bool)

(assert (=> d!166383 (= (get!26805 lt!676591) (v!22422 lt!676591))))

(assert (=> b!1580765 d!166383))

(declare-fun d!166387 () Bool)

(declare-fun lt!676609 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!833 (List!36865) (InoxSet tuple2!25620))

(assert (=> d!166387 (= lt!676609 (select (content!833 (t!51771 l!1390)) lt!676592))))

(declare-fun e!882012 () Bool)

(assert (=> d!166387 (= lt!676609 e!882012)))

(declare-fun res!1080069 () Bool)

(assert (=> d!166387 (=> (not res!1080069) (not e!882012))))

(assert (=> d!166387 (= res!1080069 ((_ is Cons!36861) (t!51771 l!1390)))))

(assert (=> d!166387 (= (contains!10451 (t!51771 l!1390) lt!676592) lt!676609)))

(declare-fun b!1580841 () Bool)

(declare-fun e!882011 () Bool)

(assert (=> b!1580841 (= e!882012 e!882011)))

(declare-fun res!1080070 () Bool)

(assert (=> b!1580841 (=> res!1080070 e!882011)))

(assert (=> b!1580841 (= res!1080070 (= (h!38405 (t!51771 l!1390)) lt!676592))))

(declare-fun b!1580842 () Bool)

(assert (=> b!1580842 (= e!882011 (contains!10451 (t!51771 (t!51771 l!1390)) lt!676592))))

(assert (= (and d!166387 res!1080069) b!1580841))

(assert (= (and b!1580841 (not res!1080070)) b!1580842))

(declare-fun m!1451377 () Bool)

(assert (=> d!166387 m!1451377))

(declare-fun m!1451379 () Bool)

(assert (=> d!166387 m!1451379))

(declare-fun m!1451381 () Bool)

(assert (=> b!1580842 m!1451381))

(assert (=> b!1580769 d!166387))

(declare-fun d!166395 () Bool)

(declare-fun res!1080085 () Bool)

(declare-fun e!882027 () Bool)

(assert (=> d!166395 (=> res!1080085 e!882027)))

(assert (=> d!166395 (= res!1080085 (and ((_ is Cons!36861) l!1390) (= (_1!12821 (h!38405 l!1390)) key!405)))))

(assert (=> d!166395 (= (containsKey!926 l!1390 key!405) e!882027)))

(declare-fun b!1580857 () Bool)

(declare-fun e!882028 () Bool)

(assert (=> b!1580857 (= e!882027 e!882028)))

(declare-fun res!1080086 () Bool)

(assert (=> b!1580857 (=> (not res!1080086) (not e!882028))))

(assert (=> b!1580857 (= res!1080086 (and (or (not ((_ is Cons!36861) l!1390)) (bvsle (_1!12821 (h!38405 l!1390)) key!405)) ((_ is Cons!36861) l!1390) (bvslt (_1!12821 (h!38405 l!1390)) key!405)))))

(declare-fun b!1580858 () Bool)

(assert (=> b!1580858 (= e!882028 (containsKey!926 (t!51771 l!1390) key!405))))

(assert (= (and d!166395 (not res!1080085)) b!1580857))

(assert (= (and b!1580857 res!1080086) b!1580858))

(assert (=> b!1580858 m!1451323))

(assert (=> b!1580768 d!166395))

(declare-fun d!166401 () Bool)

(declare-fun res!1080099 () Bool)

(declare-fun e!882041 () Bool)

(assert (=> d!166401 (=> res!1080099 e!882041)))

(assert (=> d!166401 (= res!1080099 (or ((_ is Nil!36862) l!1390) ((_ is Nil!36862) (t!51771 l!1390))))))

(assert (=> d!166401 (= (isStrictlySorted!1080 l!1390) e!882041)))

(declare-fun b!1580869 () Bool)

(declare-fun e!882042 () Bool)

(assert (=> b!1580869 (= e!882041 e!882042)))

(declare-fun res!1080100 () Bool)

(assert (=> b!1580869 (=> (not res!1080100) (not e!882042))))

(assert (=> b!1580869 (= res!1080100 (bvslt (_1!12821 (h!38405 l!1390)) (_1!12821 (h!38405 (t!51771 l!1390)))))))

(declare-fun b!1580870 () Bool)

(assert (=> b!1580870 (= e!882042 (isStrictlySorted!1080 (t!51771 l!1390)))))

(assert (= (and d!166401 (not res!1080099)) b!1580869))

(assert (= (and b!1580869 res!1080100) b!1580870))

(assert (=> b!1580870 m!1451329))

(assert (=> start!137288 d!166401))

(declare-fun d!166407 () Bool)

(declare-fun res!1080101 () Bool)

(declare-fun e!882043 () Bool)

(assert (=> d!166407 (=> res!1080101 e!882043)))

(assert (=> d!166407 (= res!1080101 (or ((_ is Nil!36862) (t!51771 l!1390)) ((_ is Nil!36862) (t!51771 (t!51771 l!1390)))))))

(assert (=> d!166407 (= (isStrictlySorted!1080 (t!51771 l!1390)) e!882043)))

(declare-fun b!1580873 () Bool)

(declare-fun e!882044 () Bool)

(assert (=> b!1580873 (= e!882043 e!882044)))

(declare-fun res!1080102 () Bool)

(assert (=> b!1580873 (=> (not res!1080102) (not e!882044))))

(assert (=> b!1580873 (= res!1080102 (bvslt (_1!12821 (h!38405 (t!51771 l!1390))) (_1!12821 (h!38405 (t!51771 (t!51771 l!1390))))))))

(declare-fun b!1580874 () Bool)

(assert (=> b!1580874 (= e!882044 (isStrictlySorted!1080 (t!51771 (t!51771 l!1390))))))

(assert (= (and d!166407 (not res!1080101)) b!1580873))

(assert (= (and b!1580873 res!1080102) b!1580874))

(declare-fun m!1451391 () Bool)

(assert (=> b!1580874 m!1451391))

(assert (=> b!1580772 d!166407))

(declare-fun d!166409 () Bool)

(declare-fun res!1080107 () Bool)

(declare-fun e!882049 () Bool)

(assert (=> d!166409 (=> res!1080107 e!882049)))

(assert (=> d!166409 (= res!1080107 (and ((_ is Cons!36861) (t!51771 l!1390)) (= (_1!12821 (h!38405 (t!51771 l!1390))) key!405)))))

(assert (=> d!166409 (= (containsKey!926 (t!51771 l!1390) key!405) e!882049)))

(declare-fun b!1580879 () Bool)

(declare-fun e!882050 () Bool)

(assert (=> b!1580879 (= e!882049 e!882050)))

(declare-fun res!1080108 () Bool)

(assert (=> b!1580879 (=> (not res!1080108) (not e!882050))))

(assert (=> b!1580879 (= res!1080108 (and (or (not ((_ is Cons!36861) (t!51771 l!1390))) (bvsle (_1!12821 (h!38405 (t!51771 l!1390))) key!405)) ((_ is Cons!36861) (t!51771 l!1390)) (bvslt (_1!12821 (h!38405 (t!51771 l!1390))) key!405)))))

(declare-fun b!1580880 () Bool)

(assert (=> b!1580880 (= e!882050 (containsKey!926 (t!51771 (t!51771 l!1390)) key!405))))

(assert (= (and d!166409 (not res!1080107)) b!1580879))

(assert (= (and b!1580879 res!1080108) b!1580880))

(declare-fun m!1451393 () Bool)

(assert (=> b!1580880 m!1451393))

(assert (=> b!1580767 d!166409))

(declare-fun d!166411 () Bool)

(declare-fun lt!676613 () Bool)

(assert (=> d!166411 (= lt!676613 (select (content!833 l!1390) lt!676592))))

(declare-fun e!882054 () Bool)

(assert (=> d!166411 (= lt!676613 e!882054)))

(declare-fun res!1080111 () Bool)

(assert (=> d!166411 (=> (not res!1080111) (not e!882054))))

(assert (=> d!166411 (= res!1080111 ((_ is Cons!36861) l!1390))))

(assert (=> d!166411 (= (contains!10451 l!1390 lt!676592) lt!676613)))

(declare-fun b!1580883 () Bool)

(declare-fun e!882053 () Bool)

(assert (=> b!1580883 (= e!882054 e!882053)))

(declare-fun res!1080112 () Bool)

(assert (=> b!1580883 (=> res!1080112 e!882053)))

(assert (=> b!1580883 (= res!1080112 (= (h!38405 l!1390) lt!676592))))

(declare-fun b!1580884 () Bool)

(assert (=> b!1580884 (= e!882053 (contains!10451 (t!51771 l!1390) lt!676592))))

(assert (= (and d!166411 res!1080111) b!1580883))

(assert (= (and b!1580883 (not res!1080112)) b!1580884))

(declare-fun m!1451395 () Bool)

(assert (=> d!166411 m!1451395))

(declare-fun m!1451397 () Bool)

(assert (=> d!166411 m!1451397))

(assert (=> b!1580884 m!1451331))

(assert (=> b!1580771 d!166411))

(declare-fun b!1580893 () Bool)

(declare-fun e!882061 () Bool)

(declare-fun tp!114552 () Bool)

(assert (=> b!1580893 (= e!882061 (and tp_is_empty!39229 tp!114552))))

(assert (=> b!1580766 (= tp!114543 e!882061)))

(assert (= (and b!1580766 ((_ is Cons!36861) (t!51771 l!1390))) b!1580893))

(check-sat (not d!166387) tp_is_empty!39229 (not d!166411) (not b!1580880) (not b!1580874) (not b!1580893) (not b!1580842) (not b!1580884) (not b!1580858) (not b!1580870))
(check-sat)
