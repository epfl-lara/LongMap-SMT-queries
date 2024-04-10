; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88864 () Bool)

(assert start!88864)

(declare-fun res!683692 () Bool)

(declare-fun e!574086 () Bool)

(assert (=> start!88864 (=> (not res!683692) (not e!574086))))

(declare-datatypes ((B!1700 0))(
  ( (B!1701 (val!11934 Int)) )
))
(declare-datatypes ((tuple2!15414 0))(
  ( (tuple2!15415 (_1!7718 (_ BitVec 64)) (_2!7718 B!1700)) )
))
(declare-datatypes ((List!21622 0))(
  ( (Nil!21619) (Cons!21618 (h!22816 tuple2!15414) (t!30632 List!21622)) )
))
(declare-fun l!996 () List!21622)

(declare-fun isStrictlySorted!687 (List!21622) Bool)

(assert (=> start!88864 (= res!683692 (isStrictlySorted!687 l!996))))

(assert (=> start!88864 e!574086))

(declare-fun e!574084 () Bool)

(assert (=> start!88864 e!574084))

(assert (=> start!88864 true))

(declare-fun tp_is_empty!23767 () Bool)

(assert (=> start!88864 tp_is_empty!23767))

(declare-fun b!1020004 () Bool)

(declare-fun e!574085 () Bool)

(declare-fun lt!449772 () List!21622)

(declare-fun length!50 (List!21622) Int)

(assert (=> b!1020004 (= e!574085 (not (= (length!50 lt!449772) (length!50 l!996))))))

(declare-fun b!1020005 () Bool)

(declare-fun tp!71191 () Bool)

(assert (=> b!1020005 (= e!574084 (and tp_is_empty!23767 tp!71191))))

(declare-fun b!1020003 () Bool)

(assert (=> b!1020003 (= e!574086 e!574085)))

(declare-fun res!683691 () Bool)

(assert (=> b!1020003 (=> (not res!683691) (not e!574085))))

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1020003 (= res!683691 (and (or (not (is-Cons!21618 l!996)) (bvsge (_1!7718 (h!22816 l!996)) key!261)) (or (not (is-Cons!21618 l!996)) (not (= (_1!7718 (h!22816 l!996)) key!261)))))))

(declare-fun value!172 () B!1700)

(declare-fun insertStrictlySorted!365 (List!21622 (_ BitVec 64) B!1700) List!21622)

(assert (=> b!1020003 (= lt!449772 (insertStrictlySorted!365 l!996 key!261 value!172))))

(declare-fun b!1020002 () Bool)

(declare-fun res!683693 () Bool)

(assert (=> b!1020002 (=> (not res!683693) (not e!574086))))

(declare-fun containsKey!547 (List!21622 (_ BitVec 64)) Bool)

(assert (=> b!1020002 (= res!683693 (containsKey!547 l!996 key!261))))

(assert (= (and start!88864 res!683692) b!1020002))

(assert (= (and b!1020002 res!683693) b!1020003))

(assert (= (and b!1020003 res!683691) b!1020004))

(assert (= (and start!88864 (is-Cons!21618 l!996)) b!1020005))

(declare-fun m!940147 () Bool)

(assert (=> start!88864 m!940147))

(declare-fun m!940149 () Bool)

(assert (=> b!1020004 m!940149))

(declare-fun m!940151 () Bool)

(assert (=> b!1020004 m!940151))

(declare-fun m!940153 () Bool)

(assert (=> b!1020003 m!940153))

(declare-fun m!940155 () Bool)

(assert (=> b!1020002 m!940155))

(push 1)

(assert (not b!1020002))

(assert (not b!1020004))

(assert tp_is_empty!23767)

(assert (not b!1020005))

(assert (not b!1020003))

(assert (not start!88864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122293 () Bool)

(declare-fun res!683716 () Bool)

(declare-fun e!574109 () Bool)

(assert (=> d!122293 (=> res!683716 e!574109)))

(assert (=> d!122293 (= res!683716 (or (is-Nil!21619 l!996) (is-Nil!21619 (t!30632 l!996))))))

(assert (=> d!122293 (= (isStrictlySorted!687 l!996) e!574109)))

(declare-fun b!1020034 () Bool)

(declare-fun e!574110 () Bool)

(assert (=> b!1020034 (= e!574109 e!574110)))

(declare-fun res!683717 () Bool)

(assert (=> b!1020034 (=> (not res!683717) (not e!574110))))

(assert (=> b!1020034 (= res!683717 (bvslt (_1!7718 (h!22816 l!996)) (_1!7718 (h!22816 (t!30632 l!996)))))))

(declare-fun b!1020035 () Bool)

(assert (=> b!1020035 (= e!574110 (isStrictlySorted!687 (t!30632 l!996)))))

(assert (= (and d!122293 (not res!683716)) b!1020034))

(assert (= (and b!1020034 res!683717) b!1020035))

(declare-fun m!940181 () Bool)

(assert (=> b!1020035 m!940181))

(assert (=> start!88864 d!122293))

(declare-fun d!122301 () Bool)

(declare-fun size!31163 (List!21622) Int)

(assert (=> d!122301 (= (length!50 lt!449772) (size!31163 lt!449772))))

(declare-fun bs!29718 () Bool)

(assert (= bs!29718 d!122301))

(declare-fun m!940183 () Bool)

(assert (=> bs!29718 m!940183))

(assert (=> b!1020004 d!122301))

(declare-fun d!122303 () Bool)

(assert (=> d!122303 (= (length!50 l!996) (size!31163 l!996))))

(declare-fun bs!29719 () Bool)

(assert (= bs!29719 d!122303))

(declare-fun m!940185 () Bool)

(assert (=> bs!29719 m!940185))

(assert (=> b!1020004 d!122303))

(declare-fun b!1020082 () Bool)

(declare-fun c!103475 () Bool)

(declare-fun c!103476 () Bool)

(declare-fun e!574140 () List!21622)

(assert (=> b!1020082 (= e!574140 (ite c!103475 (t!30632 l!996) (ite c!103476 (Cons!21618 (h!22816 l!996) (t!30632 l!996)) Nil!21619)))))

(declare-fun b!1020083 () Bool)

(declare-fun e!574138 () List!21622)

(declare-fun call!43170 () List!21622)

(assert (=> b!1020083 (= e!574138 call!43170)))

(declare-fun b!1020084 () Bool)

(declare-fun e!574137 () List!21622)

(declare-fun call!43168 () List!21622)

(assert (=> b!1020084 (= e!574137 call!43168)))

(declare-fun d!122305 () Bool)

(declare-fun e!574141 () Bool)

(assert (=> d!122305 e!574141))

(declare-fun res!683732 () Bool)

(assert (=> d!122305 (=> (not res!683732) (not e!574141))))

(declare-fun lt!449783 () List!21622)

(assert (=> d!122305 (= res!683732 (isStrictlySorted!687 lt!449783))))

(assert (=> d!122305 (= lt!449783 e!574138)))

(declare-fun c!103474 () Bool)

(assert (=> d!122305 (= c!103474 (and (is-Cons!21618 l!996) (bvslt (_1!7718 (h!22816 l!996)) key!261)))))

(assert (=> d!122305 (isStrictlySorted!687 l!996)))

(assert (=> d!122305 (= (insertStrictlySorted!365 l!996 key!261 value!172) lt!449783)))

(declare-fun bm!43165 () Bool)

(declare-fun call!43169 () List!21622)

(assert (=> bm!43165 (= call!43168 call!43169)))

(declare-fun b!1020085 () Bool)

(declare-fun e!574139 () List!21622)

(assert (=> b!1020085 (= e!574139 call!43169)))

(declare-fun b!1020086 () Bool)

(assert (=> b!1020086 (= e!574140 (insertStrictlySorted!365 (t!30632 l!996) key!261 value!172))))

(declare-fun bm!43166 () Bool)

(declare-fun $colon$colon!595 (List!21622 tuple2!15414) List!21622)

(assert (=> bm!43166 (= call!43170 ($colon$colon!595 e!574140 (ite c!103474 (h!22816 l!996) (tuple2!15415 key!261 value!172))))))

(declare-fun c!103473 () Bool)

(assert (=> bm!43166 (= c!103473 c!103474)))

(declare-fun b!1020087 () Bool)

(assert (=> b!1020087 (= e!574137 call!43168)))

(declare-fun b!1020088 () Bool)

(assert (=> b!1020088 (= e!574138 e!574139)))

(assert (=> b!1020088 (= c!103475 (and (is-Cons!21618 l!996) (= (_1!7718 (h!22816 l!996)) key!261)))))

(declare-fun b!1020089 () Bool)

(declare-fun contains!5914 (List!21622 tuple2!15414) Bool)

(assert (=> b!1020089 (= e!574141 (contains!5914 lt!449783 (tuple2!15415 key!261 value!172)))))

(declare-fun b!1020090 () Bool)

(assert (=> b!1020090 (= c!103476 (and (is-Cons!21618 l!996) (bvsgt (_1!7718 (h!22816 l!996)) key!261)))))

(assert (=> b!1020090 (= e!574139 e!574137)))

(declare-fun bm!43167 () Bool)

(assert (=> bm!43167 (= call!43169 call!43170)))

(declare-fun b!1020091 () Bool)

(declare-fun res!683733 () Bool)

(assert (=> b!1020091 (=> (not res!683733) (not e!574141))))

(assert (=> b!1020091 (= res!683733 (containsKey!547 lt!449783 key!261))))

(assert (= (and d!122305 c!103474) b!1020083))

(assert (= (and d!122305 (not c!103474)) b!1020088))

(assert (= (and b!1020088 c!103475) b!1020085))

(assert (= (and b!1020088 (not c!103475)) b!1020090))

(assert (= (and b!1020090 c!103476) b!1020084))

(assert (= (and b!1020090 (not c!103476)) b!1020087))

(assert (= (or b!1020084 b!1020087) bm!43165))

(assert (= (or b!1020085 bm!43165) bm!43167))

(assert (= (or b!1020083 bm!43167) bm!43166))

(assert (= (and bm!43166 c!103473) b!1020086))

(assert (= (and bm!43166 (not c!103473)) b!1020082))

(assert (= (and d!122305 res!683732) b!1020091))

(assert (= (and b!1020091 res!683733) b!1020089))

(declare-fun m!940189 () Bool)

(assert (=> d!122305 m!940189))

(assert (=> d!122305 m!940147))

(declare-fun m!940191 () Bool)

(assert (=> b!1020086 m!940191))

(declare-fun m!940193 () Bool)

(assert (=> b!1020091 m!940193))

(declare-fun m!940195 () Bool)

(assert (=> bm!43166 m!940195))

(declare-fun m!940197 () Bool)

(assert (=> b!1020089 m!940197))

(assert (=> b!1020003 d!122305))

(declare-fun d!122309 () Bool)

(declare-fun res!683740 () Bool)

(declare-fun e!574159 () Bool)

(assert (=> d!122309 (=> res!683740 e!574159)))

(assert (=> d!122309 (= res!683740 (and (is-Cons!21618 l!996) (= (_1!7718 (h!22816 l!996)) key!261)))))

(assert (=> d!122309 (= (containsKey!547 l!996 key!261) e!574159)))

(declare-fun b!1020122 () Bool)

(declare-fun e!574160 () Bool)

(assert (=> b!1020122 (= e!574159 e!574160)))

(declare-fun res!683741 () Bool)

(assert (=> b!1020122 (=> (not res!683741) (not e!574160))))

(assert (=> b!1020122 (= res!683741 (and (or (not (is-Cons!21618 l!996)) (bvsle (_1!7718 (h!22816 l!996)) key!261)) (is-Cons!21618 l!996) (bvslt (_1!7718 (h!22816 l!996)) key!261)))))

(declare-fun b!1020123 () Bool)

(assert (=> b!1020123 (= e!574160 (containsKey!547 (t!30632 l!996) key!261))))

(assert (= (and d!122309 (not res!683740)) b!1020122))

(assert (= (and b!1020122 res!683741) b!1020123))

(declare-fun m!940209 () Bool)

(assert (=> b!1020123 m!940209))

(assert (=> b!1020002 d!122309))

(declare-fun b!1020132 () Bool)

(declare-fun e!574165 () Bool)

(declare-fun tp!71200 () Bool)

(assert (=> b!1020132 (= e!574165 (and tp_is_empty!23767 tp!71200))))

(assert (=> b!1020005 (= tp!71191 e!574165)))

(assert (= (and b!1020005 (is-Cons!21618 (t!30632 l!996))) b!1020132))

(push 1)

(assert (not d!122305))

(assert (not b!1020086))

(assert (not b!1020089))

(assert tp_is_empty!23767)

(assert (not b!1020035))

(assert (not d!122301))

(assert (not b!1020123))

(assert (not bm!43166))

(assert (not b!1020091))

(assert (not d!122303))

(assert (not b!1020132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

