; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43938 () Bool)

(assert start!43938)

(declare-fun res!288769 () Bool)

(declare-fun e!285396 () Bool)

(assert (=> start!43938 (=> (not res!288769) (not e!285396))))

(declare-datatypes ((B!1148 0))(
  ( (B!1149 (val!7026 Int)) )
))
(declare-datatypes ((tuple2!9304 0))(
  ( (tuple2!9305 (_1!4663 (_ BitVec 64)) (_2!4663 B!1148)) )
))
(declare-datatypes ((List!9328 0))(
  ( (Nil!9325) (Cons!9324 (h!10180 tuple2!9304) (t!15544 List!9328)) )
))
(declare-fun l!956 () List!9328)

(declare-fun isStrictlySorted!425 (List!9328) Bool)

(assert (=> start!43938 (= res!288769 (isStrictlySorted!425 l!956))))

(assert (=> start!43938 e!285396))

(declare-fun e!285395 () Bool)

(assert (=> start!43938 e!285395))

(assert (=> start!43938 true))

(declare-fun tp_is_empty!13957 () Bool)

(assert (=> start!43938 tp_is_empty!13957))

(declare-fun b!484775 () Bool)

(declare-fun res!288770 () Bool)

(assert (=> b!484775 (=> (not res!288770) (not e!285396))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!390 (List!9328 (_ BitVec 64)) Bool)

(assert (=> b!484775 (= res!288770 (not (containsKey!390 l!956 key!251)))))

(declare-fun b!484776 () Bool)

(get-info :version)

(assert (=> b!484776 (= e!285396 (and ((_ is Cons!9324) l!956) (= (_1!4663 (h!10180 l!956)) key!251)))))

(declare-fun value!166 () B!1148)

(declare-fun lt!219247 () List!9328)

(declare-fun insertStrictlySorted!245 (List!9328 (_ BitVec 64) B!1148) List!9328)

(assert (=> b!484776 (= lt!219247 (insertStrictlySorted!245 l!956 key!251 value!166))))

(declare-fun b!484777 () Bool)

(declare-fun tp!43573 () Bool)

(assert (=> b!484777 (= e!285395 (and tp_is_empty!13957 tp!43573))))

(assert (= (and start!43938 res!288769) b!484775))

(assert (= (and b!484775 res!288770) b!484776))

(assert (= (and start!43938 ((_ is Cons!9324) l!956)) b!484777))

(declare-fun m!464655 () Bool)

(assert (=> start!43938 m!464655))

(declare-fun m!464657 () Bool)

(assert (=> b!484775 m!464657))

(declare-fun m!464659 () Bool)

(assert (=> b!484776 m!464659))

(check-sat tp_is_empty!13957 (not b!484776) (not b!484777) (not start!43938) (not b!484775))
(check-sat)
(get-model)

(declare-fun d!77111 () Bool)

(declare-fun res!288795 () Bool)

(declare-fun e!285421 () Bool)

(assert (=> d!77111 (=> res!288795 e!285421)))

(assert (=> d!77111 (= res!288795 (or ((_ is Nil!9325) l!956) ((_ is Nil!9325) (t!15544 l!956))))))

(assert (=> d!77111 (= (isStrictlySorted!425 l!956) e!285421)))

(declare-fun b!484808 () Bool)

(declare-fun e!285423 () Bool)

(assert (=> b!484808 (= e!285421 e!285423)))

(declare-fun res!288797 () Bool)

(assert (=> b!484808 (=> (not res!288797) (not e!285423))))

(assert (=> b!484808 (= res!288797 (bvslt (_1!4663 (h!10180 l!956)) (_1!4663 (h!10180 (t!15544 l!956)))))))

(declare-fun b!484810 () Bool)

(assert (=> b!484810 (= e!285423 (isStrictlySorted!425 (t!15544 l!956)))))

(assert (= (and d!77111 (not res!288795)) b!484808))

(assert (= (and b!484808 res!288797) b!484810))

(declare-fun m!464675 () Bool)

(assert (=> b!484810 m!464675))

(assert (=> start!43938 d!77111))

(declare-fun d!77115 () Bool)

(declare-fun res!288813 () Bool)

(declare-fun e!285439 () Bool)

(assert (=> d!77115 (=> res!288813 e!285439)))

(assert (=> d!77115 (= res!288813 (and ((_ is Cons!9324) l!956) (= (_1!4663 (h!10180 l!956)) key!251)))))

(assert (=> d!77115 (= (containsKey!390 l!956 key!251) e!285439)))

(declare-fun b!484826 () Bool)

(declare-fun e!285440 () Bool)

(assert (=> b!484826 (= e!285439 e!285440)))

(declare-fun res!288814 () Bool)

(assert (=> b!484826 (=> (not res!288814) (not e!285440))))

(assert (=> b!484826 (= res!288814 (and (or (not ((_ is Cons!9324) l!956)) (bvsle (_1!4663 (h!10180 l!956)) key!251)) ((_ is Cons!9324) l!956) (bvslt (_1!4663 (h!10180 l!956)) key!251)))))

(declare-fun b!484827 () Bool)

(assert (=> b!484827 (= e!285440 (containsKey!390 (t!15544 l!956) key!251))))

(assert (= (and d!77115 (not res!288813)) b!484826))

(assert (= (and b!484826 res!288814) b!484827))

(declare-fun m!464680 () Bool)

(assert (=> b!484827 m!464680))

(assert (=> b!484775 d!77115))

(declare-fun b!484892 () Bool)

(declare-fun lt!219260 () List!9328)

(declare-fun e!285477 () Bool)

(declare-fun contains!2672 (List!9328 tuple2!9304) Bool)

(assert (=> b!484892 (= e!285477 (contains!2672 lt!219260 (tuple2!9305 key!251 value!166)))))

(declare-fun b!484901 () Bool)

(declare-fun res!288832 () Bool)

(assert (=> b!484901 (=> (not res!288832) (not e!285477))))

(assert (=> b!484901 (= res!288832 (containsKey!390 lt!219260 key!251))))

(declare-fun e!285480 () List!9328)

(declare-fun b!484903 () Bool)

(assert (=> b!484903 (= e!285480 (insertStrictlySorted!245 (t!15544 l!956) key!251 value!166))))

(declare-fun b!484904 () Bool)

(declare-fun c!58327 () Bool)

(declare-fun c!58325 () Bool)

(assert (=> b!484904 (= e!285480 (ite c!58327 (t!15544 l!956) (ite c!58325 (Cons!9324 (h!10180 l!956) (t!15544 l!956)) Nil!9325)))))

(declare-fun b!484905 () Bool)

(declare-fun e!285481 () List!9328)

(declare-fun call!31191 () List!9328)

(assert (=> b!484905 (= e!285481 call!31191)))

(declare-fun d!77121 () Bool)

(assert (=> d!77121 e!285477))

(declare-fun res!288835 () Bool)

(assert (=> d!77121 (=> (not res!288835) (not e!285477))))

(assert (=> d!77121 (= res!288835 (isStrictlySorted!425 lt!219260))))

(declare-fun e!285475 () List!9328)

(assert (=> d!77121 (= lt!219260 e!285475)))

(declare-fun c!58329 () Bool)

(assert (=> d!77121 (= c!58329 (and ((_ is Cons!9324) l!956) (bvslt (_1!4663 (h!10180 l!956)) key!251)))))

(assert (=> d!77121 (isStrictlySorted!425 l!956)))

(assert (=> d!77121 (= (insertStrictlySorted!245 l!956 key!251 value!166) lt!219260)))

(declare-fun bm!31187 () Bool)

(declare-fun call!31188 () List!9328)

(declare-fun $colon$colon!128 (List!9328 tuple2!9304) List!9328)

(assert (=> bm!31187 (= call!31188 ($colon$colon!128 e!285480 (ite c!58329 (h!10180 l!956) (tuple2!9305 key!251 value!166))))))

(declare-fun c!58324 () Bool)

(assert (=> bm!31187 (= c!58324 c!58329)))

(declare-fun bm!31188 () Bool)

(declare-fun call!31187 () List!9328)

(assert (=> bm!31188 (= call!31187 call!31188)))

(declare-fun b!484909 () Bool)

(declare-fun e!285478 () List!9328)

(assert (=> b!484909 (= e!285475 e!285478)))

(assert (=> b!484909 (= c!58327 (and ((_ is Cons!9324) l!956) (= (_1!4663 (h!10180 l!956)) key!251)))))

(declare-fun b!484911 () Bool)

(assert (=> b!484911 (= e!285475 call!31188)))

(declare-fun bm!31189 () Bool)

(assert (=> bm!31189 (= call!31191 call!31187)))

(declare-fun b!484914 () Bool)

(assert (=> b!484914 (= c!58325 (and ((_ is Cons!9324) l!956) (bvsgt (_1!4663 (h!10180 l!956)) key!251)))))

(assert (=> b!484914 (= e!285478 e!285481)))

(declare-fun b!484915 () Bool)

(assert (=> b!484915 (= e!285481 call!31191)))

(declare-fun b!484916 () Bool)

(assert (=> b!484916 (= e!285478 call!31187)))

(assert (= (and d!77121 c!58329) b!484911))

(assert (= (and d!77121 (not c!58329)) b!484909))

(assert (= (and b!484909 c!58327) b!484916))

(assert (= (and b!484909 (not c!58327)) b!484914))

(assert (= (and b!484914 c!58325) b!484915))

(assert (= (and b!484914 (not c!58325)) b!484905))

(assert (= (or b!484915 b!484905) bm!31189))

(assert (= (or b!484916 bm!31189) bm!31188))

(assert (= (or b!484911 bm!31188) bm!31187))

(assert (= (and bm!31187 c!58324) b!484903))

(assert (= (and bm!31187 (not c!58324)) b!484904))

(assert (= (and d!77121 res!288835) b!484901))

(assert (= (and b!484901 res!288832) b!484892))

(declare-fun m!464687 () Bool)

(assert (=> b!484892 m!464687))

(declare-fun m!464691 () Bool)

(assert (=> b!484901 m!464691))

(declare-fun m!464697 () Bool)

(assert (=> b!484903 m!464697))

(declare-fun m!464703 () Bool)

(assert (=> bm!31187 m!464703))

(declare-fun m!464707 () Bool)

(assert (=> d!77121 m!464707))

(assert (=> d!77121 m!464655))

(assert (=> b!484776 d!77121))

(declare-fun b!484936 () Bool)

(declare-fun e!285497 () Bool)

(declare-fun tp!43588 () Bool)

(assert (=> b!484936 (= e!285497 (and tp_is_empty!13957 tp!43588))))

(assert (=> b!484777 (= tp!43573 e!285497)))

(assert (= (and b!484777 ((_ is Cons!9324) (t!15544 l!956))) b!484936))

(check-sat tp_is_empty!13957 (not d!77121) (not b!484901) (not bm!31187) (not b!484810) (not b!484903) (not b!484892) (not b!484827) (not b!484936))
(check-sat)
