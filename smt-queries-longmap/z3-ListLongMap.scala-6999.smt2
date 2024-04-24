; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89098 () Bool)

(assert start!89098)

(declare-fun res!684201 () Bool)

(declare-fun e!574930 () Bool)

(assert (=> start!89098 (=> (not res!684201) (not e!574930))))

(declare-datatypes ((B!1700 0))(
  ( (B!1701 (val!11934 Int)) )
))
(declare-datatypes ((tuple2!15418 0))(
  ( (tuple2!15419 (_1!7720 (_ BitVec 64)) (_2!7720 B!1700)) )
))
(declare-datatypes ((List!21611 0))(
  ( (Nil!21608) (Cons!21607 (h!22814 tuple2!15418) (t!30613 List!21611)) )
))
(declare-fun l!996 () List!21611)

(declare-fun isStrictlySorted!675 (List!21611) Bool)

(assert (=> start!89098 (= res!684201 (isStrictlySorted!675 l!996))))

(assert (=> start!89098 e!574930))

(declare-fun e!574932 () Bool)

(assert (=> start!89098 e!574932))

(assert (=> start!89098 true))

(declare-fun tp_is_empty!23767 () Bool)

(assert (=> start!89098 tp_is_empty!23767))

(declare-fun b!1021325 () Bool)

(declare-fun e!574931 () Bool)

(declare-fun lt!450287 () List!21611)

(declare-fun length!50 (List!21611) Int)

(assert (=> b!1021325 (= e!574931 (not (= (length!50 lt!450287) (length!50 l!996))))))

(declare-fun b!1021323 () Bool)

(declare-fun res!684203 () Bool)

(assert (=> b!1021323 (=> (not res!684203) (not e!574930))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!549 (List!21611 (_ BitVec 64)) Bool)

(assert (=> b!1021323 (= res!684203 (containsKey!549 l!996 key!261))))

(declare-fun b!1021326 () Bool)

(declare-fun tp!71191 () Bool)

(assert (=> b!1021326 (= e!574932 (and tp_is_empty!23767 tp!71191))))

(declare-fun b!1021324 () Bool)

(assert (=> b!1021324 (= e!574930 e!574931)))

(declare-fun res!684202 () Bool)

(assert (=> b!1021324 (=> (not res!684202) (not e!574931))))

(get-info :version)

(assert (=> b!1021324 (= res!684202 (and (or (not ((_ is Cons!21607) l!996)) (bvsge (_1!7720 (h!22814 l!996)) key!261)) (or (not ((_ is Cons!21607) l!996)) (not (= (_1!7720 (h!22814 l!996)) key!261)))))))

(declare-fun value!172 () B!1700)

(declare-fun insertStrictlySorted!366 (List!21611 (_ BitVec 64) B!1700) List!21611)

(assert (=> b!1021324 (= lt!450287 (insertStrictlySorted!366 l!996 key!261 value!172))))

(assert (= (and start!89098 res!684201) b!1021323))

(assert (= (and b!1021323 res!684203) b!1021324))

(assert (= (and b!1021324 res!684202) b!1021325))

(assert (= (and start!89098 ((_ is Cons!21607) l!996)) b!1021326))

(declare-fun m!941811 () Bool)

(assert (=> start!89098 m!941811))

(declare-fun m!941813 () Bool)

(assert (=> b!1021325 m!941813))

(declare-fun m!941815 () Bool)

(assert (=> b!1021325 m!941815))

(declare-fun m!941817 () Bool)

(assert (=> b!1021323 m!941817))

(declare-fun m!941819 () Bool)

(assert (=> b!1021324 m!941819))

(check-sat (not b!1021326) tp_is_empty!23767 (not b!1021323) (not b!1021324) (not start!89098) (not b!1021325))
(check-sat)
(get-model)

(declare-fun d!122753 () Bool)

(declare-fun res!684230 () Bool)

(declare-fun e!574959 () Bool)

(assert (=> d!122753 (=> res!684230 e!574959)))

(assert (=> d!122753 (= res!684230 (and ((_ is Cons!21607) l!996) (= (_1!7720 (h!22814 l!996)) key!261)))))

(assert (=> d!122753 (= (containsKey!549 l!996 key!261) e!574959)))

(declare-fun b!1021359 () Bool)

(declare-fun e!574960 () Bool)

(assert (=> b!1021359 (= e!574959 e!574960)))

(declare-fun res!684231 () Bool)

(assert (=> b!1021359 (=> (not res!684231) (not e!574960))))

(assert (=> b!1021359 (= res!684231 (and (or (not ((_ is Cons!21607) l!996)) (bvsle (_1!7720 (h!22814 l!996)) key!261)) ((_ is Cons!21607) l!996) (bvslt (_1!7720 (h!22814 l!996)) key!261)))))

(declare-fun b!1021360 () Bool)

(assert (=> b!1021360 (= e!574960 (containsKey!549 (t!30613 l!996) key!261))))

(assert (= (and d!122753 (not res!684230)) b!1021359))

(assert (= (and b!1021359 res!684231) b!1021360))

(declare-fun m!941841 () Bool)

(assert (=> b!1021360 m!941841))

(assert (=> b!1021323 d!122753))

(declare-fun b!1021411 () Bool)

(declare-fun e!574997 () List!21611)

(declare-fun e!574996 () List!21611)

(assert (=> b!1021411 (= e!574997 e!574996)))

(declare-fun c!103886 () Bool)

(assert (=> b!1021411 (= c!103886 (and ((_ is Cons!21607) l!996) (= (_1!7720 (h!22814 l!996)) key!261)))))

(declare-fun lt!450298 () List!21611)

(declare-fun e!574994 () Bool)

(declare-fun b!1021412 () Bool)

(declare-fun contains!5937 (List!21611 tuple2!15418) Bool)

(assert (=> b!1021412 (= e!574994 (contains!5937 lt!450298 (tuple2!15419 key!261 value!172)))))

(declare-fun b!1021413 () Bool)

(declare-fun c!103887 () Bool)

(declare-fun e!574993 () List!21611)

(assert (=> b!1021413 (= e!574993 (ite c!103886 (t!30613 l!996) (ite c!103887 (Cons!21607 (h!22814 l!996) (t!30613 l!996)) Nil!21608)))))

(declare-fun bm!43232 () Bool)

(declare-fun call!43235 () List!21611)

(declare-fun call!43236 () List!21611)

(assert (=> bm!43232 (= call!43235 call!43236)))

(declare-fun b!1021414 () Bool)

(declare-fun e!574995 () List!21611)

(declare-fun call!43237 () List!21611)

(assert (=> b!1021414 (= e!574995 call!43237)))

(declare-fun d!122759 () Bool)

(assert (=> d!122759 e!574994))

(declare-fun res!684251 () Bool)

(assert (=> d!122759 (=> (not res!684251) (not e!574994))))

(assert (=> d!122759 (= res!684251 (isStrictlySorted!675 lt!450298))))

(assert (=> d!122759 (= lt!450298 e!574997)))

(declare-fun c!103888 () Bool)

(assert (=> d!122759 (= c!103888 (and ((_ is Cons!21607) l!996) (bvslt (_1!7720 (h!22814 l!996)) key!261)))))

(assert (=> d!122759 (isStrictlySorted!675 l!996)))

(assert (=> d!122759 (= (insertStrictlySorted!366 l!996 key!261 value!172) lt!450298)))

(declare-fun bm!43233 () Bool)

(declare-fun $colon$colon!597 (List!21611 tuple2!15418) List!21611)

(assert (=> bm!43233 (= call!43236 ($colon$colon!597 e!574993 (ite c!103888 (h!22814 l!996) (tuple2!15419 key!261 value!172))))))

(declare-fun c!103889 () Bool)

(assert (=> bm!43233 (= c!103889 c!103888)))

(declare-fun b!1021415 () Bool)

(assert (=> b!1021415 (= e!574997 call!43236)))

(declare-fun bm!43234 () Bool)

(assert (=> bm!43234 (= call!43237 call!43235)))

(declare-fun b!1021416 () Bool)

(assert (=> b!1021416 (= c!103887 (and ((_ is Cons!21607) l!996) (bvsgt (_1!7720 (h!22814 l!996)) key!261)))))

(assert (=> b!1021416 (= e!574996 e!574995)))

(declare-fun b!1021417 () Bool)

(assert (=> b!1021417 (= e!574996 call!43235)))

(declare-fun b!1021418 () Bool)

(assert (=> b!1021418 (= e!574993 (insertStrictlySorted!366 (t!30613 l!996) key!261 value!172))))

(declare-fun b!1021419 () Bool)

(assert (=> b!1021419 (= e!574995 call!43237)))

(declare-fun b!1021420 () Bool)

(declare-fun res!684250 () Bool)

(assert (=> b!1021420 (=> (not res!684250) (not e!574994))))

(assert (=> b!1021420 (= res!684250 (containsKey!549 lt!450298 key!261))))

(assert (= (and d!122759 c!103888) b!1021415))

(assert (= (and d!122759 (not c!103888)) b!1021411))

(assert (= (and b!1021411 c!103886) b!1021417))

(assert (= (and b!1021411 (not c!103886)) b!1021416))

(assert (= (and b!1021416 c!103887) b!1021414))

(assert (= (and b!1021416 (not c!103887)) b!1021419))

(assert (= (or b!1021414 b!1021419) bm!43234))

(assert (= (or b!1021417 bm!43234) bm!43232))

(assert (= (or b!1021415 bm!43232) bm!43233))

(assert (= (and bm!43233 c!103889) b!1021418))

(assert (= (and bm!43233 (not c!103889)) b!1021413))

(assert (= (and d!122759 res!684251) b!1021420))

(assert (= (and b!1021420 res!684250) b!1021412))

(declare-fun m!941853 () Bool)

(assert (=> b!1021412 m!941853))

(declare-fun m!941855 () Bool)

(assert (=> b!1021418 m!941855))

(declare-fun m!941857 () Bool)

(assert (=> b!1021420 m!941857))

(declare-fun m!941859 () Bool)

(assert (=> d!122759 m!941859))

(assert (=> d!122759 m!941811))

(declare-fun m!941861 () Bool)

(assert (=> bm!43233 m!941861))

(assert (=> b!1021324 d!122759))

(declare-fun d!122771 () Bool)

(declare-fun res!684262 () Bool)

(declare-fun e!575015 () Bool)

(assert (=> d!122771 (=> res!684262 e!575015)))

(assert (=> d!122771 (= res!684262 (or ((_ is Nil!21608) l!996) ((_ is Nil!21608) (t!30613 l!996))))))

(assert (=> d!122771 (= (isStrictlySorted!675 l!996) e!575015)))

(declare-fun b!1021451 () Bool)

(declare-fun e!575016 () Bool)

(assert (=> b!1021451 (= e!575015 e!575016)))

(declare-fun res!684263 () Bool)

(assert (=> b!1021451 (=> (not res!684263) (not e!575016))))

(assert (=> b!1021451 (= res!684263 (bvslt (_1!7720 (h!22814 l!996)) (_1!7720 (h!22814 (t!30613 l!996)))))))

(declare-fun b!1021452 () Bool)

(assert (=> b!1021452 (= e!575016 (isStrictlySorted!675 (t!30613 l!996)))))

(assert (= (and d!122771 (not res!684262)) b!1021451))

(assert (= (and b!1021451 res!684263) b!1021452))

(declare-fun m!941873 () Bool)

(assert (=> b!1021452 m!941873))

(assert (=> start!89098 d!122771))

(declare-fun d!122775 () Bool)

(declare-fun size!31183 (List!21611) Int)

(assert (=> d!122775 (= (length!50 lt!450287) (size!31183 lt!450287))))

(declare-fun bs!29738 () Bool)

(assert (= bs!29738 d!122775))

(declare-fun m!941875 () Bool)

(assert (=> bs!29738 m!941875))

(assert (=> b!1021325 d!122775))

(declare-fun d!122777 () Bool)

(assert (=> d!122777 (= (length!50 l!996) (size!31183 l!996))))

(declare-fun bs!29739 () Bool)

(assert (= bs!29739 d!122777))

(declare-fun m!941877 () Bool)

(assert (=> bs!29739 m!941877))

(assert (=> b!1021325 d!122777))

(declare-fun b!1021471 () Bool)

(declare-fun e!575029 () Bool)

(declare-fun tp!71200 () Bool)

(assert (=> b!1021471 (= e!575029 (and tp_is_empty!23767 tp!71200))))

(assert (=> b!1021326 (= tp!71191 e!575029)))

(assert (= (and b!1021326 ((_ is Cons!21607) (t!30613 l!996))) b!1021471))

(check-sat (not b!1021471) (not bm!43233) (not b!1021418) (not b!1021452) (not d!122775) (not b!1021412) (not d!122759) (not b!1021360) (not b!1021420) tp_is_empty!23767 (not d!122777))
(check-sat)
