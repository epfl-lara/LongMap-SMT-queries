; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88680 () Bool)

(assert start!88680)

(declare-fun b!1018761 () Bool)

(declare-fun e!573272 () Bool)

(declare-fun e!573273 () Bool)

(assert (=> b!1018761 (= e!573272 e!573273)))

(declare-fun res!683089 () Bool)

(assert (=> b!1018761 (=> (not res!683089) (not e!573273))))

(declare-datatypes ((B!1672 0))(
  ( (B!1673 (val!11920 Int)) )
))
(declare-datatypes ((tuple2!15386 0))(
  ( (tuple2!15387 (_1!7704 (_ BitVec 64)) (_2!7704 B!1672)) )
))
(declare-datatypes ((List!21608 0))(
  ( (Nil!21605) (Cons!21604 (h!22802 tuple2!15386) (t!30612 List!21608)) )
))
(declare-fun l!996 () List!21608)

(declare-fun key!261 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1018761 (= res!683089 (and ((_ is Cons!21604) l!996) (bvslt (_1!7704 (h!22802 l!996)) key!261)))))

(declare-fun value!172 () B!1672)

(declare-fun lt!449595 () List!21608)

(declare-fun insertStrictlySorted!351 (List!21608 (_ BitVec 64) B!1672) List!21608)

(assert (=> b!1018761 (= lt!449595 (insertStrictlySorted!351 l!996 key!261 value!172))))

(declare-fun b!1018763 () Bool)

(declare-fun e!573271 () Bool)

(declare-fun tp_is_empty!23739 () Bool)

(declare-fun tp!71098 () Bool)

(assert (=> b!1018763 (= e!573271 (and tp_is_empty!23739 tp!71098))))

(declare-fun res!683088 () Bool)

(assert (=> start!88680 (=> (not res!683088) (not e!573272))))

(declare-fun isStrictlySorted!673 (List!21608) Bool)

(assert (=> start!88680 (= res!683088 (isStrictlySorted!673 l!996))))

(assert (=> start!88680 e!573272))

(assert (=> start!88680 e!573271))

(assert (=> start!88680 true))

(assert (=> start!88680 tp_is_empty!23739))

(declare-fun b!1018762 () Bool)

(assert (=> b!1018762 (= e!573273 (not (isStrictlySorted!673 (t!30612 l!996))))))

(declare-fun b!1018760 () Bool)

(declare-fun res!683090 () Bool)

(assert (=> b!1018760 (=> (not res!683090) (not e!573272))))

(declare-fun containsKey!533 (List!21608 (_ BitVec 64)) Bool)

(assert (=> b!1018760 (= res!683090 (containsKey!533 l!996 key!261))))

(assert (= (and start!88680 res!683088) b!1018760))

(assert (= (and b!1018760 res!683090) b!1018761))

(assert (= (and b!1018761 res!683089) b!1018762))

(assert (= (and start!88680 ((_ is Cons!21604) l!996)) b!1018763))

(declare-fun m!939477 () Bool)

(assert (=> b!1018761 m!939477))

(declare-fun m!939479 () Bool)

(assert (=> start!88680 m!939479))

(declare-fun m!939481 () Bool)

(assert (=> b!1018762 m!939481))

(declare-fun m!939483 () Bool)

(assert (=> b!1018760 m!939483))

(check-sat (not b!1018761) (not b!1018762) tp_is_empty!23739 (not b!1018763) (not start!88680) (not b!1018760))
(check-sat)
(get-model)

(declare-fun b!1018810 () Bool)

(declare-fun res!683118 () Bool)

(declare-fun e!573308 () Bool)

(assert (=> b!1018810 (=> (not res!683118) (not e!573308))))

(declare-fun lt!449601 () List!21608)

(assert (=> b!1018810 (= res!683118 (containsKey!533 lt!449601 key!261))))

(declare-fun d!121939 () Bool)

(assert (=> d!121939 e!573308))

(declare-fun res!683119 () Bool)

(assert (=> d!121939 (=> (not res!683119) (not e!573308))))

(assert (=> d!121939 (= res!683119 (isStrictlySorted!673 lt!449601))))

(declare-fun e!573310 () List!21608)

(assert (=> d!121939 (= lt!449601 e!573310)))

(declare-fun c!103208 () Bool)

(assert (=> d!121939 (= c!103208 (and ((_ is Cons!21604) l!996) (bvslt (_1!7704 (h!22802 l!996)) key!261)))))

(assert (=> d!121939 (isStrictlySorted!673 l!996)))

(assert (=> d!121939 (= (insertStrictlySorted!351 l!996 key!261 value!172) lt!449601)))

(declare-fun b!1018811 () Bool)

(declare-fun call!43001 () List!21608)

(assert (=> b!1018811 (= e!573310 call!43001)))

(declare-fun e!573307 () List!21608)

(declare-fun bm!42997 () Bool)

(declare-fun $colon$colon!582 (List!21608 tuple2!15386) List!21608)

(assert (=> bm!42997 (= call!43001 ($colon$colon!582 e!573307 (ite c!103208 (h!22802 l!996) (tuple2!15387 key!261 value!172))))))

(declare-fun c!103207 () Bool)

(assert (=> bm!42997 (= c!103207 c!103208)))

(declare-fun b!1018812 () Bool)

(assert (=> b!1018812 (= e!573307 (insertStrictlySorted!351 (t!30612 l!996) key!261 value!172))))

(declare-fun b!1018813 () Bool)

(declare-fun contains!5902 (List!21608 tuple2!15386) Bool)

(assert (=> b!1018813 (= e!573308 (contains!5902 lt!449601 (tuple2!15387 key!261 value!172)))))

(declare-fun b!1018814 () Bool)

(declare-fun e!573309 () List!21608)

(declare-fun call!43002 () List!21608)

(assert (=> b!1018814 (= e!573309 call!43002)))

(declare-fun b!1018815 () Bool)

(declare-fun c!103210 () Bool)

(declare-fun c!103209 () Bool)

(assert (=> b!1018815 (= e!573307 (ite c!103209 (t!30612 l!996) (ite c!103210 (Cons!21604 (h!22802 l!996) (t!30612 l!996)) Nil!21605)))))

(declare-fun b!1018816 () Bool)

(assert (=> b!1018816 (= c!103210 (and ((_ is Cons!21604) l!996) (bvsgt (_1!7704 (h!22802 l!996)) key!261)))))

(declare-fun e!573311 () List!21608)

(assert (=> b!1018816 (= e!573309 e!573311)))

(declare-fun bm!42998 () Bool)

(assert (=> bm!42998 (= call!43002 call!43001)))

(declare-fun b!1018817 () Bool)

(assert (=> b!1018817 (= e!573310 e!573309)))

(assert (=> b!1018817 (= c!103209 (and ((_ is Cons!21604) l!996) (= (_1!7704 (h!22802 l!996)) key!261)))))

(declare-fun bm!42999 () Bool)

(declare-fun call!43000 () List!21608)

(assert (=> bm!42999 (= call!43000 call!43002)))

(declare-fun b!1018818 () Bool)

(assert (=> b!1018818 (= e!573311 call!43000)))

(declare-fun b!1018819 () Bool)

(assert (=> b!1018819 (= e!573311 call!43000)))

(assert (= (and d!121939 c!103208) b!1018811))

(assert (= (and d!121939 (not c!103208)) b!1018817))

(assert (= (and b!1018817 c!103209) b!1018814))

(assert (= (and b!1018817 (not c!103209)) b!1018816))

(assert (= (and b!1018816 c!103210) b!1018818))

(assert (= (and b!1018816 (not c!103210)) b!1018819))

(assert (= (or b!1018818 b!1018819) bm!42999))

(assert (= (or b!1018814 bm!42999) bm!42998))

(assert (= (or b!1018811 bm!42998) bm!42997))

(assert (= (and bm!42997 c!103207) b!1018812))

(assert (= (and bm!42997 (not c!103207)) b!1018815))

(assert (= (and d!121939 res!683119) b!1018810))

(assert (= (and b!1018810 res!683118) b!1018813))

(declare-fun m!939497 () Bool)

(assert (=> d!121939 m!939497))

(assert (=> d!121939 m!939479))

(declare-fun m!939499 () Bool)

(assert (=> b!1018812 m!939499))

(declare-fun m!939501 () Bool)

(assert (=> bm!42997 m!939501))

(declare-fun m!939503 () Bool)

(assert (=> b!1018813 m!939503))

(declare-fun m!939505 () Bool)

(assert (=> b!1018810 m!939505))

(assert (=> b!1018761 d!121939))

(declare-fun d!121951 () Bool)

(declare-fun res!683124 () Bool)

(declare-fun e!573316 () Bool)

(assert (=> d!121951 (=> res!683124 e!573316)))

(assert (=> d!121951 (= res!683124 (or ((_ is Nil!21605) (t!30612 l!996)) ((_ is Nil!21605) (t!30612 (t!30612 l!996)))))))

(assert (=> d!121951 (= (isStrictlySorted!673 (t!30612 l!996)) e!573316)))

(declare-fun b!1018824 () Bool)

(declare-fun e!573317 () Bool)

(assert (=> b!1018824 (= e!573316 e!573317)))

(declare-fun res!683125 () Bool)

(assert (=> b!1018824 (=> (not res!683125) (not e!573317))))

(assert (=> b!1018824 (= res!683125 (bvslt (_1!7704 (h!22802 (t!30612 l!996))) (_1!7704 (h!22802 (t!30612 (t!30612 l!996))))))))

(declare-fun b!1018825 () Bool)

(assert (=> b!1018825 (= e!573317 (isStrictlySorted!673 (t!30612 (t!30612 l!996))))))

(assert (= (and d!121951 (not res!683124)) b!1018824))

(assert (= (and b!1018824 res!683125) b!1018825))

(declare-fun m!939507 () Bool)

(assert (=> b!1018825 m!939507))

(assert (=> b!1018762 d!121951))

(declare-fun d!121953 () Bool)

(declare-fun res!683130 () Bool)

(declare-fun e!573328 () Bool)

(assert (=> d!121953 (=> res!683130 e!573328)))

(assert (=> d!121953 (= res!683130 (and ((_ is Cons!21604) l!996) (= (_1!7704 (h!22802 l!996)) key!261)))))

(assert (=> d!121953 (= (containsKey!533 l!996 key!261) e!573328)))

(declare-fun b!1018842 () Bool)

(declare-fun e!573329 () Bool)

(assert (=> b!1018842 (= e!573328 e!573329)))

(declare-fun res!683131 () Bool)

(assert (=> b!1018842 (=> (not res!683131) (not e!573329))))

(assert (=> b!1018842 (= res!683131 (and (or (not ((_ is Cons!21604) l!996)) (bvsle (_1!7704 (h!22802 l!996)) key!261)) ((_ is Cons!21604) l!996) (bvslt (_1!7704 (h!22802 l!996)) key!261)))))

(declare-fun b!1018843 () Bool)

(assert (=> b!1018843 (= e!573329 (containsKey!533 (t!30612 l!996) key!261))))

(assert (= (and d!121953 (not res!683130)) b!1018842))

(assert (= (and b!1018842 res!683131) b!1018843))

(declare-fun m!939509 () Bool)

(assert (=> b!1018843 m!939509))

(assert (=> b!1018760 d!121953))

(declare-fun d!121955 () Bool)

(declare-fun res!683132 () Bool)

(declare-fun e!573330 () Bool)

(assert (=> d!121955 (=> res!683132 e!573330)))

(assert (=> d!121955 (= res!683132 (or ((_ is Nil!21605) l!996) ((_ is Nil!21605) (t!30612 l!996))))))

(assert (=> d!121955 (= (isStrictlySorted!673 l!996) e!573330)))

(declare-fun b!1018844 () Bool)

(declare-fun e!573331 () Bool)

(assert (=> b!1018844 (= e!573330 e!573331)))

(declare-fun res!683133 () Bool)

(assert (=> b!1018844 (=> (not res!683133) (not e!573331))))

(assert (=> b!1018844 (= res!683133 (bvslt (_1!7704 (h!22802 l!996)) (_1!7704 (h!22802 (t!30612 l!996)))))))

(declare-fun b!1018845 () Bool)

(assert (=> b!1018845 (= e!573331 (isStrictlySorted!673 (t!30612 l!996)))))

(assert (= (and d!121955 (not res!683132)) b!1018844))

(assert (= (and b!1018844 res!683133) b!1018845))

(assert (=> b!1018845 m!939481))

(assert (=> start!88680 d!121955))

(declare-fun b!1018850 () Bool)

(declare-fun e!573334 () Bool)

(declare-fun tp!71104 () Bool)

(assert (=> b!1018850 (= e!573334 (and tp_is_empty!23739 tp!71104))))

(assert (=> b!1018763 (= tp!71098 e!573334)))

(assert (= (and b!1018763 ((_ is Cons!21604) (t!30612 l!996))) b!1018850))

(check-sat (not b!1018845) (not b!1018813) tp_is_empty!23739 (not b!1018810) (not b!1018843) (not b!1018825) (not b!1018812) (not bm!42997) (not d!121939) (not b!1018850))
(check-sat)
