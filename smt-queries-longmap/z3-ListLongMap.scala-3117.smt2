; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43800 () Bool)

(assert start!43800)

(declare-fun b!483800 () Bool)

(declare-fun e!284765 () Bool)

(declare-fun e!284766 () Bool)

(assert (=> b!483800 (= e!284765 e!284766)))

(declare-fun res!288290 () Bool)

(assert (=> b!483800 (=> (not res!288290) (not e!284766))))

(declare-datatypes ((B!1124 0))(
  ( (B!1125 (val!7014 Int)) )
))
(declare-datatypes ((tuple2!9280 0))(
  ( (tuple2!9281 (_1!4651 (_ BitVec 64)) (_2!4651 B!1124)) )
))
(declare-datatypes ((List!9316 0))(
  ( (Nil!9313) (Cons!9312 (h!10168 tuple2!9280) (t!15529 List!9316)) )
))
(declare-fun l!956 () List!9316)

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!483800 (= res!288290 (and ((_ is Cons!9312) l!956) (bvslt (_1!4651 (h!10168 l!956)) key!251)))))

(declare-fun value!166 () B!1124)

(declare-fun lt!219109 () List!9316)

(declare-fun insertStrictlySorted!233 (List!9316 (_ BitVec 64) B!1124) List!9316)

(assert (=> b!483800 (= lt!219109 (insertStrictlySorted!233 l!956 key!251 value!166))))

(declare-fun b!483801 () Bool)

(declare-fun isStrictlySorted!413 (List!9316) Bool)

(assert (=> b!483801 (= e!284766 (not (isStrictlySorted!413 (t!15529 l!956))))))

(declare-fun b!483802 () Bool)

(declare-fun e!284764 () Bool)

(declare-fun tp_is_empty!13933 () Bool)

(declare-fun tp!43498 () Bool)

(assert (=> b!483802 (= e!284764 (and tp_is_empty!13933 tp!43498))))

(declare-fun b!483799 () Bool)

(declare-fun res!288288 () Bool)

(assert (=> b!483799 (=> (not res!288288) (not e!284765))))

(declare-fun containsKey!378 (List!9316 (_ BitVec 64)) Bool)

(assert (=> b!483799 (= res!288288 (not (containsKey!378 l!956 key!251)))))

(declare-fun res!288289 () Bool)

(assert (=> start!43800 (=> (not res!288289) (not e!284765))))

(assert (=> start!43800 (= res!288289 (isStrictlySorted!413 l!956))))

(assert (=> start!43800 e!284765))

(assert (=> start!43800 e!284764))

(assert (=> start!43800 true))

(assert (=> start!43800 tp_is_empty!13933))

(assert (= (and start!43800 res!288289) b!483799))

(assert (= (and b!483799 res!288288) b!483800))

(assert (= (and b!483800 res!288290) b!483801))

(assert (= (and start!43800 ((_ is Cons!9312) l!956)) b!483802))

(declare-fun m!464145 () Bool)

(assert (=> b!483800 m!464145))

(declare-fun m!464147 () Bool)

(assert (=> b!483801 m!464147))

(declare-fun m!464149 () Bool)

(assert (=> b!483799 m!464149))

(declare-fun m!464151 () Bool)

(assert (=> start!43800 m!464151))

(check-sat (not b!483801) (not b!483802) (not b!483800) (not b!483799) tp_is_empty!13933 (not start!43800))
(check-sat)
(get-model)

(declare-fun d!76843 () Bool)

(declare-fun res!288317 () Bool)

(declare-fun e!284793 () Bool)

(assert (=> d!76843 (=> res!288317 e!284793)))

(assert (=> d!76843 (= res!288317 (or ((_ is Nil!9313) (t!15529 l!956)) ((_ is Nil!9313) (t!15529 (t!15529 l!956)))))))

(assert (=> d!76843 (= (isStrictlySorted!413 (t!15529 l!956)) e!284793)))

(declare-fun b!483835 () Bool)

(declare-fun e!284794 () Bool)

(assert (=> b!483835 (= e!284793 e!284794)))

(declare-fun res!288318 () Bool)

(assert (=> b!483835 (=> (not res!288318) (not e!284794))))

(assert (=> b!483835 (= res!288318 (bvslt (_1!4651 (h!10168 (t!15529 l!956))) (_1!4651 (h!10168 (t!15529 (t!15529 l!956))))))))

(declare-fun b!483836 () Bool)

(assert (=> b!483836 (= e!284794 (isStrictlySorted!413 (t!15529 (t!15529 l!956))))))

(assert (= (and d!76843 (not res!288317)) b!483835))

(assert (= (and b!483835 res!288318) b!483836))

(declare-fun m!464169 () Bool)

(assert (=> b!483836 m!464169))

(assert (=> b!483801 d!76843))

(declare-fun d!76847 () Bool)

(declare-fun res!288321 () Bool)

(declare-fun e!284797 () Bool)

(assert (=> d!76847 (=> res!288321 e!284797)))

(assert (=> d!76847 (= res!288321 (or ((_ is Nil!9313) l!956) ((_ is Nil!9313) (t!15529 l!956))))))

(assert (=> d!76847 (= (isStrictlySorted!413 l!956) e!284797)))

(declare-fun b!483839 () Bool)

(declare-fun e!284798 () Bool)

(assert (=> b!483839 (= e!284797 e!284798)))

(declare-fun res!288322 () Bool)

(assert (=> b!483839 (=> (not res!288322) (not e!284798))))

(assert (=> b!483839 (= res!288322 (bvslt (_1!4651 (h!10168 l!956)) (_1!4651 (h!10168 (t!15529 l!956)))))))

(declare-fun b!483840 () Bool)

(assert (=> b!483840 (= e!284798 (isStrictlySorted!413 (t!15529 l!956)))))

(assert (= (and d!76847 (not res!288321)) b!483839))

(assert (= (and b!483839 res!288322) b!483840))

(assert (=> b!483840 m!464147))

(assert (=> start!43800 d!76847))

(declare-fun bm!31058 () Bool)

(declare-fun call!31062 () List!9316)

(declare-fun call!31061 () List!9316)

(assert (=> bm!31058 (= call!31062 call!31061)))

(declare-fun e!284842 () List!9316)

(declare-fun c!58128 () Bool)

(declare-fun bm!31059 () Bool)

(declare-fun $colon$colon!115 (List!9316 tuple2!9280) List!9316)

(assert (=> bm!31059 (= call!31061 ($colon$colon!115 e!284842 (ite c!58128 (h!10168 l!956) (tuple2!9281 key!251 value!166))))))

(declare-fun c!58126 () Bool)

(assert (=> bm!31059 (= c!58126 c!58128)))

(declare-fun b!483911 () Bool)

(declare-fun e!284839 () List!9316)

(assert (=> b!483911 (= e!284839 call!31061)))

(declare-fun b!483912 () Bool)

(assert (=> b!483912 (= e!284842 (insertStrictlySorted!233 (t!15529 l!956) key!251 value!166))))

(declare-fun bm!31060 () Bool)

(declare-fun call!31063 () List!9316)

(assert (=> bm!31060 (= call!31063 call!31062)))

(declare-fun e!284840 () Bool)

(declare-fun lt!219122 () List!9316)

(declare-fun b!483913 () Bool)

(declare-fun contains!2660 (List!9316 tuple2!9280) Bool)

(assert (=> b!483913 (= e!284840 (contains!2660 lt!219122 (tuple2!9281 key!251 value!166)))))

(declare-fun b!483914 () Bool)

(declare-fun e!284841 () List!9316)

(assert (=> b!483914 (= e!284841 call!31063)))

(declare-fun b!483915 () Bool)

(declare-fun e!284843 () List!9316)

(assert (=> b!483915 (= e!284839 e!284843)))

(declare-fun c!58129 () Bool)

(assert (=> b!483915 (= c!58129 (and ((_ is Cons!9312) l!956) (= (_1!4651 (h!10168 l!956)) key!251)))))

(declare-fun b!483916 () Bool)

(assert (=> b!483916 (= e!284843 call!31062)))

(declare-fun b!483917 () Bool)

(declare-fun res!288346 () Bool)

(assert (=> b!483917 (=> (not res!288346) (not e!284840))))

(assert (=> b!483917 (= res!288346 (containsKey!378 lt!219122 key!251))))

(declare-fun b!483918 () Bool)

(declare-fun c!58127 () Bool)

(assert (=> b!483918 (= c!58127 (and ((_ is Cons!9312) l!956) (bvsgt (_1!4651 (h!10168 l!956)) key!251)))))

(assert (=> b!483918 (= e!284843 e!284841)))

(declare-fun b!483920 () Bool)

(assert (=> b!483920 (= e!284842 (ite c!58129 (t!15529 l!956) (ite c!58127 (Cons!9312 (h!10168 l!956) (t!15529 l!956)) Nil!9313)))))

(declare-fun d!76851 () Bool)

(assert (=> d!76851 e!284840))

(declare-fun res!288345 () Bool)

(assert (=> d!76851 (=> (not res!288345) (not e!284840))))

(assert (=> d!76851 (= res!288345 (isStrictlySorted!413 lt!219122))))

(assert (=> d!76851 (= lt!219122 e!284839)))

(assert (=> d!76851 (= c!58128 (and ((_ is Cons!9312) l!956) (bvslt (_1!4651 (h!10168 l!956)) key!251)))))

(assert (=> d!76851 (isStrictlySorted!413 l!956)))

(assert (=> d!76851 (= (insertStrictlySorted!233 l!956 key!251 value!166) lt!219122)))

(declare-fun b!483919 () Bool)

(assert (=> b!483919 (= e!284841 call!31063)))

(assert (= (and d!76851 c!58128) b!483911))

(assert (= (and d!76851 (not c!58128)) b!483915))

(assert (= (and b!483915 c!58129) b!483916))

(assert (= (and b!483915 (not c!58129)) b!483918))

(assert (= (and b!483918 c!58127) b!483914))

(assert (= (and b!483918 (not c!58127)) b!483919))

(assert (= (or b!483914 b!483919) bm!31060))

(assert (= (or b!483916 bm!31060) bm!31058))

(assert (= (or b!483911 bm!31058) bm!31059))

(assert (= (and bm!31059 c!58126) b!483912))

(assert (= (and bm!31059 (not c!58126)) b!483920))

(assert (= (and d!76851 res!288345) b!483917))

(assert (= (and b!483917 res!288346) b!483913))

(declare-fun m!464175 () Bool)

(assert (=> d!76851 m!464175))

(assert (=> d!76851 m!464151))

(declare-fun m!464178 () Bool)

(assert (=> bm!31059 m!464178))

(declare-fun m!464181 () Bool)

(assert (=> b!483917 m!464181))

(declare-fun m!464185 () Bool)

(assert (=> b!483913 m!464185))

(declare-fun m!464189 () Bool)

(assert (=> b!483912 m!464189))

(assert (=> b!483800 d!76851))

(declare-fun d!76861 () Bool)

(declare-fun res!288359 () Bool)

(declare-fun e!284862 () Bool)

(assert (=> d!76861 (=> res!288359 e!284862)))

(assert (=> d!76861 (= res!288359 (and ((_ is Cons!9312) l!956) (= (_1!4651 (h!10168 l!956)) key!251)))))

(assert (=> d!76861 (= (containsKey!378 l!956 key!251) e!284862)))

(declare-fun b!483949 () Bool)

(declare-fun e!284863 () Bool)

(assert (=> b!483949 (= e!284862 e!284863)))

(declare-fun res!288360 () Bool)

(assert (=> b!483949 (=> (not res!288360) (not e!284863))))

(assert (=> b!483949 (= res!288360 (and (or (not ((_ is Cons!9312) l!956)) (bvsle (_1!4651 (h!10168 l!956)) key!251)) ((_ is Cons!9312) l!956) (bvslt (_1!4651 (h!10168 l!956)) key!251)))))

(declare-fun b!483950 () Bool)

(assert (=> b!483950 (= e!284863 (containsKey!378 (t!15529 l!956) key!251))))

(assert (= (and d!76861 (not res!288359)) b!483949))

(assert (= (and b!483949 res!288360) b!483950))

(declare-fun m!464205 () Bool)

(assert (=> b!483950 m!464205))

(assert (=> b!483799 d!76861))

(declare-fun b!483962 () Bool)

(declare-fun e!284871 () Bool)

(declare-fun tp!43510 () Bool)

(assert (=> b!483962 (= e!284871 (and tp_is_empty!13933 tp!43510))))

(assert (=> b!483802 (= tp!43498 e!284871)))

(assert (= (and b!483802 ((_ is Cons!9312) (t!15529 l!956))) b!483962))

(check-sat (not b!483962) (not d!76851) (not b!483840) (not bm!31059) (not b!483950) (not b!483913) (not b!483917) tp_is_empty!13933 (not b!483836) (not b!483912))
(check-sat)
