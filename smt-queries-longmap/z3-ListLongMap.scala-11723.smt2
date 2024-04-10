; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137270 () Bool)

(assert start!137270)

(declare-fun b!1580891 () Bool)

(declare-fun e!882014 () Bool)

(declare-datatypes ((B!2680 0))(
  ( (B!2681 (val!19702 Int)) )
))
(declare-datatypes ((tuple2!25544 0))(
  ( (tuple2!25545 (_1!12783 (_ BitVec 64)) (_2!12783 B!2680)) )
))
(declare-datatypes ((List!36822 0))(
  ( (Nil!36819) (Cons!36818 (h!38361 tuple2!25544) (t!51736 List!36822)) )
))
(declare-datatypes ((tuple2!25546 0))(
  ( (tuple2!25547 (_1!12784 tuple2!25544) (_2!12784 List!36822)) )
))
(declare-datatypes ((Option!913 0))(
  ( (Some!912 (v!22419 tuple2!25546)) (None!911) )
))
(declare-fun lt!676837 () Option!913)

(get-info :version)

(declare-fun get!26804 (Option!913) tuple2!25546)

(assert (=> b!1580891 (= e!882014 (not ((_ is Nil!36819) (_2!12784 (get!26804 lt!676837)))))))

(declare-fun b!1580892 () Bool)

(declare-fun e!882016 () Bool)

(declare-fun e!882013 () Bool)

(assert (=> b!1580892 (= e!882016 e!882013)))

(declare-fun res!1080001 () Bool)

(assert (=> b!1580892 (=> (not res!1080001) (not e!882013))))

(declare-fun l!1390 () List!36822)

(declare-fun lt!676839 () tuple2!25544)

(declare-fun contains!10494 (List!36822 tuple2!25544) Bool)

(assert (=> b!1580892 (= res!1080001 (contains!10494 l!1390 lt!676839))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2680)

(assert (=> b!1580892 (= lt!676839 (tuple2!25545 key!405 value!194))))

(declare-fun b!1580893 () Bool)

(declare-fun res!1080006 () Bool)

(assert (=> b!1580893 (=> (not res!1080006) (not e!882016))))

(declare-fun containsKey!926 (List!36822 (_ BitVec 64)) Bool)

(assert (=> b!1580893 (= res!1080006 (containsKey!926 l!1390 key!405))))

(declare-fun b!1580894 () Bool)

(declare-fun e!882017 () Bool)

(assert (=> b!1580894 (= e!882013 e!882017)))

(declare-fun res!1080004 () Bool)

(assert (=> b!1580894 (=> (not res!1080004) (not e!882017))))

(assert (=> b!1580894 (= res!1080004 e!882014)))

(declare-fun res!1080002 () Bool)

(assert (=> b!1580894 (=> res!1080002 e!882014)))

(declare-fun isEmpty!1173 (Option!913) Bool)

(assert (=> b!1580894 (= res!1080002 (isEmpty!1173 lt!676837))))

(declare-fun unapply!89 (List!36822) Option!913)

(assert (=> b!1580894 (= lt!676837 (unapply!89 l!1390))))

(declare-fun b!1580895 () Bool)

(declare-fun e!882015 () Bool)

(declare-fun tp_is_empty!39225 () Bool)

(declare-fun tp!114527 () Bool)

(assert (=> b!1580895 (= e!882015 (and tp_is_empty!39225 tp!114527))))

(declare-fun res!1080005 () Bool)

(assert (=> start!137270 (=> (not res!1080005) (not e!882016))))

(declare-fun isStrictlySorted!1080 (List!36822) Bool)

(assert (=> start!137270 (= res!1080005 (isStrictlySorted!1080 l!1390))))

(assert (=> start!137270 e!882016))

(assert (=> start!137270 e!882015))

(assert (=> start!137270 true))

(assert (=> start!137270 tp_is_empty!39225))

(declare-fun b!1580896 () Bool)

(declare-fun res!1080003 () Bool)

(assert (=> b!1580896 (=> (not res!1080003) (not e!882017))))

(assert (=> b!1580896 (= res!1080003 (not (containsKey!926 (t!51736 l!1390) key!405)))))

(declare-fun b!1580897 () Bool)

(declare-fun res!1079999 () Bool)

(assert (=> b!1580897 (=> (not res!1079999) (not e!882017))))

(assert (=> b!1580897 (= res!1079999 (isStrictlySorted!1080 (t!51736 l!1390)))))

(declare-fun b!1580898 () Bool)

(declare-datatypes ((Option!914 0))(
  ( (Some!913 (v!22420 B!2680)) (None!912) )
))
(declare-fun getValueByKey!818 (List!36822 (_ BitVec 64)) Option!914)

(assert (=> b!1580898 (= e!882017 (not (= (getValueByKey!818 l!1390 key!405) (Some!913 value!194))))))

(assert (=> b!1580898 (not (contains!10494 (t!51736 l!1390) lt!676839))))

(declare-datatypes ((Unit!52248 0))(
  ( (Unit!52249) )
))
(declare-fun lt!676838 () Unit!52248)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!5 (List!36822 (_ BitVec 64) B!2680) Unit!52248)

(assert (=> b!1580898 (= lt!676838 (lemmaNotContainsKeyThenNotContainsTuple!5 (t!51736 l!1390) key!405 value!194))))

(declare-fun b!1580899 () Bool)

(declare-fun res!1080000 () Bool)

(assert (=> b!1580899 (=> (not res!1080000) (not e!882017))))

(assert (=> b!1580899 (= res!1080000 (and ((_ is Cons!36818) l!1390) (= (_1!12783 (h!38361 l!1390)) key!405)))))

(assert (= (and start!137270 res!1080005) b!1580893))

(assert (= (and b!1580893 res!1080006) b!1580892))

(assert (= (and b!1580892 res!1080001) b!1580894))

(assert (= (and b!1580894 (not res!1080002)) b!1580891))

(assert (= (and b!1580894 res!1080004) b!1580899))

(assert (= (and b!1580899 res!1080000) b!1580897))

(assert (= (and b!1580897 res!1079999) b!1580896))

(assert (= (and b!1580896 res!1080003) b!1580898))

(assert (= (and start!137270 ((_ is Cons!36818) l!1390)) b!1580895))

(declare-fun m!1452099 () Bool)

(assert (=> b!1580891 m!1452099))

(declare-fun m!1452101 () Bool)

(assert (=> b!1580892 m!1452101))

(declare-fun m!1452103 () Bool)

(assert (=> b!1580894 m!1452103))

(declare-fun m!1452105 () Bool)

(assert (=> b!1580894 m!1452105))

(declare-fun m!1452107 () Bool)

(assert (=> b!1580893 m!1452107))

(declare-fun m!1452109 () Bool)

(assert (=> start!137270 m!1452109))

(declare-fun m!1452111 () Bool)

(assert (=> b!1580897 m!1452111))

(declare-fun m!1452113 () Bool)

(assert (=> b!1580896 m!1452113))

(declare-fun m!1452115 () Bool)

(assert (=> b!1580898 m!1452115))

(declare-fun m!1452117 () Bool)

(assert (=> b!1580898 m!1452117))

(declare-fun m!1452119 () Bool)

(assert (=> b!1580898 m!1452119))

(check-sat (not b!1580893) (not start!137270) (not b!1580896) (not b!1580897) (not b!1580895) (not b!1580892) tp_is_empty!39225 (not b!1580891) (not b!1580894) (not b!1580898))
(check-sat)
(get-model)

(declare-fun d!166549 () Bool)

(declare-fun lt!676851 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!840 (List!36822) (InoxSet tuple2!25544))

(assert (=> d!166549 (= lt!676851 (select (content!840 l!1390) lt!676839))))

(declare-fun e!882037 () Bool)

(assert (=> d!166549 (= lt!676851 e!882037)))

(declare-fun res!1080035 () Bool)

(assert (=> d!166549 (=> (not res!1080035) (not e!882037))))

(assert (=> d!166549 (= res!1080035 ((_ is Cons!36818) l!1390))))

(assert (=> d!166549 (= (contains!10494 l!1390 lt!676839) lt!676851)))

(declare-fun b!1580931 () Bool)

(declare-fun e!882038 () Bool)

(assert (=> b!1580931 (= e!882037 e!882038)))

(declare-fun res!1080036 () Bool)

(assert (=> b!1580931 (=> res!1080036 e!882038)))

(assert (=> b!1580931 (= res!1080036 (= (h!38361 l!1390) lt!676839))))

(declare-fun b!1580932 () Bool)

(assert (=> b!1580932 (= e!882038 (contains!10494 (t!51736 l!1390) lt!676839))))

(assert (= (and d!166549 res!1080035) b!1580931))

(assert (= (and b!1580931 (not res!1080036)) b!1580932))

(declare-fun m!1452143 () Bool)

(assert (=> d!166549 m!1452143))

(declare-fun m!1452145 () Bool)

(assert (=> d!166549 m!1452145))

(assert (=> b!1580932 m!1452117))

(assert (=> b!1580892 d!166549))

(declare-fun d!166551 () Bool)

(declare-fun res!1080045 () Bool)

(declare-fun e!882047 () Bool)

(assert (=> d!166551 (=> res!1080045 e!882047)))

(assert (=> d!166551 (= res!1080045 (and ((_ is Cons!36818) l!1390) (= (_1!12783 (h!38361 l!1390)) key!405)))))

(assert (=> d!166551 (= (containsKey!926 l!1390 key!405) e!882047)))

(declare-fun b!1580941 () Bool)

(declare-fun e!882048 () Bool)

(assert (=> b!1580941 (= e!882047 e!882048)))

(declare-fun res!1080046 () Bool)

(assert (=> b!1580941 (=> (not res!1080046) (not e!882048))))

(assert (=> b!1580941 (= res!1080046 (and (or (not ((_ is Cons!36818) l!1390)) (bvsle (_1!12783 (h!38361 l!1390)) key!405)) ((_ is Cons!36818) l!1390) (bvslt (_1!12783 (h!38361 l!1390)) key!405)))))

(declare-fun b!1580942 () Bool)

(assert (=> b!1580942 (= e!882048 (containsKey!926 (t!51736 l!1390) key!405))))

(assert (= (and d!166551 (not res!1080045)) b!1580941))

(assert (= (and b!1580941 res!1080046) b!1580942))

(assert (=> b!1580942 m!1452113))

(assert (=> b!1580893 d!166551))

(declare-fun b!1580963 () Bool)

(declare-fun e!882065 () Option!914)

(assert (=> b!1580963 (= e!882065 (Some!913 (_2!12783 (h!38361 l!1390))))))

(declare-fun b!1580966 () Bool)

(declare-fun e!882066 () Option!914)

(assert (=> b!1580966 (= e!882066 None!912)))

(declare-fun b!1580965 () Bool)

(assert (=> b!1580965 (= e!882066 (getValueByKey!818 (t!51736 l!1390) key!405))))

(declare-fun d!166557 () Bool)

(declare-fun c!146565 () Bool)

(assert (=> d!166557 (= c!146565 (and ((_ is Cons!36818) l!1390) (= (_1!12783 (h!38361 l!1390)) key!405)))))

(assert (=> d!166557 (= (getValueByKey!818 l!1390 key!405) e!882065)))

(declare-fun b!1580964 () Bool)

(assert (=> b!1580964 (= e!882065 e!882066)))

(declare-fun c!146566 () Bool)

(assert (=> b!1580964 (= c!146566 (and ((_ is Cons!36818) l!1390) (not (= (_1!12783 (h!38361 l!1390)) key!405))))))

(assert (= (and d!166557 c!146565) b!1580963))

(assert (= (and d!166557 (not c!146565)) b!1580964))

(assert (= (and b!1580964 c!146566) b!1580965))

(assert (= (and b!1580964 (not c!146566)) b!1580966))

(declare-fun m!1452155 () Bool)

(assert (=> b!1580965 m!1452155))

(assert (=> b!1580898 d!166557))

(declare-fun d!166565 () Bool)

(declare-fun lt!676858 () Bool)

(assert (=> d!166565 (= lt!676858 (select (content!840 (t!51736 l!1390)) lt!676839))))

(declare-fun e!882071 () Bool)

(assert (=> d!166565 (= lt!676858 e!882071)))

(declare-fun res!1080063 () Bool)

(assert (=> d!166565 (=> (not res!1080063) (not e!882071))))

(assert (=> d!166565 (= res!1080063 ((_ is Cons!36818) (t!51736 l!1390)))))

(assert (=> d!166565 (= (contains!10494 (t!51736 l!1390) lt!676839) lt!676858)))

(declare-fun b!1580971 () Bool)

(declare-fun e!882072 () Bool)

(assert (=> b!1580971 (= e!882071 e!882072)))

(declare-fun res!1080064 () Bool)

(assert (=> b!1580971 (=> res!1080064 e!882072)))

(assert (=> b!1580971 (= res!1080064 (= (h!38361 (t!51736 l!1390)) lt!676839))))

(declare-fun b!1580972 () Bool)

(assert (=> b!1580972 (= e!882072 (contains!10494 (t!51736 (t!51736 l!1390)) lt!676839))))

(assert (= (and d!166565 res!1080063) b!1580971))

(assert (= (and b!1580971 (not res!1080064)) b!1580972))

(declare-fun m!1452157 () Bool)

(assert (=> d!166565 m!1452157))

(declare-fun m!1452159 () Bool)

(assert (=> d!166565 m!1452159))

(declare-fun m!1452161 () Bool)

(assert (=> b!1580972 m!1452161))

(assert (=> b!1580898 d!166565))

(declare-fun d!166567 () Bool)

(assert (=> d!166567 (not (contains!10494 (t!51736 l!1390) (tuple2!25545 key!405 value!194)))))

(declare-fun lt!676861 () Unit!52248)

(declare-fun choose!2096 (List!36822 (_ BitVec 64) B!2680) Unit!52248)

(assert (=> d!166567 (= lt!676861 (choose!2096 (t!51736 l!1390) key!405 value!194))))

(declare-fun e!882079 () Bool)

(assert (=> d!166567 e!882079))

(declare-fun res!1080071 () Bool)

(assert (=> d!166567 (=> (not res!1080071) (not e!882079))))

(assert (=> d!166567 (= res!1080071 (isStrictlySorted!1080 (t!51736 l!1390)))))

(assert (=> d!166567 (= (lemmaNotContainsKeyThenNotContainsTuple!5 (t!51736 l!1390) key!405 value!194) lt!676861)))

(declare-fun b!1580979 () Bool)

(assert (=> b!1580979 (= e!882079 (not (containsKey!926 (t!51736 l!1390) key!405)))))

(assert (= (and d!166567 res!1080071) b!1580979))

(declare-fun m!1452165 () Bool)

(assert (=> d!166567 m!1452165))

(declare-fun m!1452167 () Bool)

(assert (=> d!166567 m!1452167))

(assert (=> d!166567 m!1452111))

(assert (=> b!1580979 m!1452113))

(assert (=> b!1580898 d!166567))

(declare-fun d!166583 () Bool)

(assert (=> d!166583 (= (get!26804 lt!676837) (v!22419 lt!676837))))

(assert (=> b!1580891 d!166583))

(declare-fun d!166585 () Bool)

(declare-fun res!1080076 () Bool)

(declare-fun e!882084 () Bool)

(assert (=> d!166585 (=> res!1080076 e!882084)))

(assert (=> d!166585 (= res!1080076 (and ((_ is Cons!36818) (t!51736 l!1390)) (= (_1!12783 (h!38361 (t!51736 l!1390))) key!405)))))

(assert (=> d!166585 (= (containsKey!926 (t!51736 l!1390) key!405) e!882084)))

(declare-fun b!1580986 () Bool)

(declare-fun e!882085 () Bool)

(assert (=> b!1580986 (= e!882084 e!882085)))

(declare-fun res!1080077 () Bool)

(assert (=> b!1580986 (=> (not res!1080077) (not e!882085))))

(assert (=> b!1580986 (= res!1080077 (and (or (not ((_ is Cons!36818) (t!51736 l!1390))) (bvsle (_1!12783 (h!38361 (t!51736 l!1390))) key!405)) ((_ is Cons!36818) (t!51736 l!1390)) (bvslt (_1!12783 (h!38361 (t!51736 l!1390))) key!405)))))

(declare-fun b!1580987 () Bool)

(assert (=> b!1580987 (= e!882085 (containsKey!926 (t!51736 (t!51736 l!1390)) key!405))))

(assert (= (and d!166585 (not res!1080076)) b!1580986))

(assert (= (and b!1580986 res!1080077) b!1580987))

(declare-fun m!1452169 () Bool)

(assert (=> b!1580987 m!1452169))

(assert (=> b!1580896 d!166585))

(declare-fun d!166587 () Bool)

(declare-fun res!1080088 () Bool)

(declare-fun e!882104 () Bool)

(assert (=> d!166587 (=> res!1080088 e!882104)))

(assert (=> d!166587 (= res!1080088 (or ((_ is Nil!36819) (t!51736 l!1390)) ((_ is Nil!36819) (t!51736 (t!51736 l!1390)))))))

(assert (=> d!166587 (= (isStrictlySorted!1080 (t!51736 l!1390)) e!882104)))

(declare-fun b!1581012 () Bool)

(declare-fun e!882105 () Bool)

(assert (=> b!1581012 (= e!882104 e!882105)))

(declare-fun res!1080089 () Bool)

(assert (=> b!1581012 (=> (not res!1080089) (not e!882105))))

(assert (=> b!1581012 (= res!1080089 (bvslt (_1!12783 (h!38361 (t!51736 l!1390))) (_1!12783 (h!38361 (t!51736 (t!51736 l!1390))))))))

(declare-fun b!1581013 () Bool)

(assert (=> b!1581013 (= e!882105 (isStrictlySorted!1080 (t!51736 (t!51736 l!1390))))))

(assert (= (and d!166587 (not res!1080088)) b!1581012))

(assert (= (and b!1581012 res!1080089) b!1581013))

(declare-fun m!1452181 () Bool)

(assert (=> b!1581013 m!1452181))

(assert (=> b!1580897 d!166587))

(declare-fun d!166597 () Bool)

(declare-fun res!1080090 () Bool)

(declare-fun e!882108 () Bool)

(assert (=> d!166597 (=> res!1080090 e!882108)))

(assert (=> d!166597 (= res!1080090 (or ((_ is Nil!36819) l!1390) ((_ is Nil!36819) (t!51736 l!1390))))))

(assert (=> d!166597 (= (isStrictlySorted!1080 l!1390) e!882108)))

(declare-fun b!1581018 () Bool)

(declare-fun e!882109 () Bool)

(assert (=> b!1581018 (= e!882108 e!882109)))

(declare-fun res!1080091 () Bool)

(assert (=> b!1581018 (=> (not res!1080091) (not e!882109))))

(assert (=> b!1581018 (= res!1080091 (bvslt (_1!12783 (h!38361 l!1390)) (_1!12783 (h!38361 (t!51736 l!1390)))))))

(declare-fun b!1581019 () Bool)

(assert (=> b!1581019 (= e!882109 (isStrictlySorted!1080 (t!51736 l!1390)))))

(assert (= (and d!166597 (not res!1080090)) b!1581018))

(assert (= (and b!1581018 res!1080091) b!1581019))

(assert (=> b!1581019 m!1452111))

(assert (=> start!137270 d!166597))

(declare-fun d!166599 () Bool)

(assert (=> d!166599 (= (isEmpty!1173 lt!676837) (not ((_ is Some!912) lt!676837)))))

(assert (=> b!1580894 d!166599))

(declare-fun d!166601 () Bool)

(assert (=> d!166601 (= (unapply!89 l!1390) (ite ((_ is Nil!36819) l!1390) None!911 (Some!912 (tuple2!25547 (h!38361 l!1390) (t!51736 l!1390)))))))

(assert (=> b!1580894 d!166601))

(declare-fun b!1581032 () Bool)

(declare-fun e!882118 () Bool)

(declare-fun tp!114533 () Bool)

(assert (=> b!1581032 (= e!882118 (and tp_is_empty!39225 tp!114533))))

(assert (=> b!1580895 (= tp!114527 e!882118)))

(assert (= (and b!1580895 ((_ is Cons!36818) (t!51736 l!1390))) b!1581032))

(check-sat (not b!1581019) (not b!1581013) (not d!166567) (not d!166549) (not d!166565) (not b!1580942) (not b!1580932) (not b!1580987) (not b!1580972) (not b!1580979) (not b!1580965) (not b!1581032) tp_is_empty!39225)
(check-sat)
