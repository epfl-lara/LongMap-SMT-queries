; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75076 () Bool)

(assert start!75076)

(declare-fun res!601187 () Bool)

(declare-fun e!492559 () Bool)

(assert (=> start!75076 (=> (not res!601187) (not e!492559))))

(declare-datatypes ((B!1250 0))(
  ( (B!1251 (val!8931 Int)) )
))
(declare-datatypes ((tuple2!11876 0))(
  ( (tuple2!11877 (_1!5949 (_ BitVec 64)) (_2!5949 B!1250)) )
))
(declare-datatypes ((List!17655 0))(
  ( (Nil!17652) (Cons!17651 (h!18782 tuple2!11876) (t!24923 List!17655)) )
))
(declare-fun l!906 () List!17655)

(declare-fun isStrictlySorted!467 (List!17655) Bool)

(assert (=> start!75076 (= res!601187 (isStrictlySorted!467 l!906))))

(assert (=> start!75076 e!492559))

(declare-fun e!492560 () Bool)

(assert (=> start!75076 e!492560))

(assert (=> start!75076 true))

(declare-fun tp_is_empty!17761 () Bool)

(assert (=> start!75076 tp_is_empty!17761))

(declare-fun b!885065 () Bool)

(declare-fun tp!54249 () Bool)

(assert (=> b!885065 (= e!492560 (and tp_is_empty!17761 tp!54249))))

(declare-fun b!885062 () Bool)

(declare-fun res!601185 () Bool)

(assert (=> b!885062 (=> (not res!601185) (not e!492559))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885062 (= res!601185 (and ((_ is Cons!17651) l!906) (bvslt (_1!5949 (h!18782 l!906)) key1!49)))))

(declare-fun b!885064 () Bool)

(declare-fun v1!38 () B!1250)

(declare-fun insertStrictlySorted!289 (List!17655 (_ BitVec 64) B!1250) List!17655)

(assert (=> b!885064 (= e!492559 (not (isStrictlySorted!467 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(declare-fun v2!16 () B!1250)

(assert (=> b!885064 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24923 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30170 0))(
  ( (Unit!30171) )
))
(declare-fun lt!400757 () Unit!30170)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!7 (List!17655 (_ BitVec 64) B!1250 B!1250) Unit!30170)

(assert (=> b!885064 (= lt!400757 (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24923 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885063 () Bool)

(declare-fun res!601186 () Bool)

(assert (=> b!885063 (=> (not res!601186) (not e!492559))))

(assert (=> b!885063 (= res!601186 (isStrictlySorted!467 (t!24923 l!906)))))

(assert (= (and start!75076 res!601187) b!885062))

(assert (= (and b!885062 res!601185) b!885063))

(assert (= (and b!885063 res!601186) b!885064))

(assert (= (and start!75076 ((_ is Cons!17651) l!906)) b!885065))

(declare-fun m!824801 () Bool)

(assert (=> start!75076 m!824801))

(declare-fun m!824803 () Bool)

(assert (=> b!885064 m!824803))

(declare-fun m!824805 () Bool)

(assert (=> b!885064 m!824805))

(declare-fun m!824807 () Bool)

(assert (=> b!885064 m!824807))

(declare-fun m!824809 () Bool)

(assert (=> b!885064 m!824809))

(declare-fun m!824811 () Bool)

(assert (=> b!885064 m!824811))

(assert (=> b!885064 m!824809))

(declare-fun m!824813 () Bool)

(assert (=> b!885064 m!824813))

(assert (=> b!885064 m!824803))

(declare-fun m!824815 () Bool)

(assert (=> b!885063 m!824815))

(check-sat (not b!885063) (not start!75076) (not b!885065) (not b!885064) tp_is_empty!17761)
(check-sat)
(get-model)

(declare-fun d!109169 () Bool)

(assert (=> d!109169 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24923 l!906) key1!49 v2!16))))

(declare-fun lt!400766 () Unit!30170)

(declare-fun choose!1456 (List!17655 (_ BitVec 64) B!1250 B!1250) Unit!30170)

(assert (=> d!109169 (= lt!400766 (choose!1456 (t!24923 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109169 (isStrictlySorted!467 (t!24923 l!906))))

(assert (=> d!109169 (= (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24923 l!906) key1!49 v1!38 v2!16) lt!400766)))

(declare-fun bs!24789 () Bool)

(assert (= bs!24789 d!109169))

(assert (=> bs!24789 m!824803))

(assert (=> bs!24789 m!824805))

(assert (=> bs!24789 m!824815))

(declare-fun m!824849 () Bool)

(assert (=> bs!24789 m!824849))

(assert (=> bs!24789 m!824803))

(assert (=> bs!24789 m!824813))

(assert (=> b!885064 d!109169))

(declare-fun b!885134 () Bool)

(declare-fun e!492599 () List!17655)

(declare-fun call!39052 () List!17655)

(assert (=> b!885134 (= e!492599 call!39052)))

(declare-fun b!885135 () Bool)

(declare-fun res!601219 () Bool)

(declare-fun e!492601 () Bool)

(assert (=> b!885135 (=> (not res!601219) (not e!492601))))

(declare-fun lt!400779 () List!17655)

(declare-fun containsKey!405 (List!17655 (_ BitVec 64)) Bool)

(assert (=> b!885135 (= res!601219 (containsKey!405 lt!400779 key1!49))))

(declare-fun bm!39047 () Bool)

(declare-fun c!93197 () Bool)

(declare-fun e!492603 () List!17655)

(declare-fun $colon$colon!541 (List!17655 tuple2!11876) List!17655)

(assert (=> bm!39047 (= call!39052 ($colon$colon!541 e!492603 (ite c!93197 (h!18782 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (tuple2!11877 key1!49 v2!16))))))

(declare-fun c!93199 () Bool)

(assert (=> bm!39047 (= c!93199 c!93197)))

(declare-fun bm!39048 () Bool)

(declare-fun call!39053 () List!17655)

(assert (=> bm!39048 (= call!39053 call!39052)))

(declare-fun b!885137 () Bool)

(declare-fun e!492602 () List!17655)

(assert (=> b!885137 (= e!492599 e!492602)))

(declare-fun c!93198 () Bool)

(assert (=> b!885137 (= c!93198 (and ((_ is Cons!17651) (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (= (_1!5949 (h!18782 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!885138 () Bool)

(assert (=> b!885138 (= e!492602 call!39053)))

(declare-fun b!885139 () Bool)

(declare-fun e!492600 () List!17655)

(declare-fun call!39054 () List!17655)

(assert (=> b!885139 (= e!492600 call!39054)))

(declare-fun bm!39049 () Bool)

(assert (=> bm!39049 (= call!39054 call!39053)))

(declare-fun c!93200 () Bool)

(declare-fun b!885140 () Bool)

(assert (=> b!885140 (= e!492603 (ite c!93198 (t!24923 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (ite c!93200 (Cons!17651 (h!18782 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (t!24923 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))) Nil!17652)))))

(declare-fun b!885141 () Bool)

(assert (=> b!885141 (= e!492603 (insertStrictlySorted!289 (t!24923 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!885142 () Bool)

(assert (=> b!885142 (= e!492600 call!39054)))

(declare-fun b!885143 () Bool)

(assert (=> b!885143 (= c!93200 (and ((_ is Cons!17651) (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (bvsgt (_1!5949 (h!18782 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> b!885143 (= e!492602 e!492600)))

(declare-fun b!885136 () Bool)

(declare-fun contains!4264 (List!17655 tuple2!11876) Bool)

(assert (=> b!885136 (= e!492601 (contains!4264 lt!400779 (tuple2!11877 key1!49 v2!16)))))

(declare-fun d!109173 () Bool)

(assert (=> d!109173 e!492601))

(declare-fun res!601218 () Bool)

(assert (=> d!109173 (=> (not res!601218) (not e!492601))))

(assert (=> d!109173 (= res!601218 (isStrictlySorted!467 lt!400779))))

(assert (=> d!109173 (= lt!400779 e!492599)))

(assert (=> d!109173 (= c!93197 (and ((_ is Cons!17651) (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38)) (bvslt (_1!5949 (h!18782 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109173 (isStrictlySorted!467 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))))

(assert (=> d!109173 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38) key1!49 v2!16) lt!400779)))

(assert (= (and d!109173 c!93197) b!885134))

(assert (= (and d!109173 (not c!93197)) b!885137))

(assert (= (and b!885137 c!93198) b!885138))

(assert (= (and b!885137 (not c!93198)) b!885143))

(assert (= (and b!885143 c!93200) b!885139))

(assert (= (and b!885143 (not c!93200)) b!885142))

(assert (= (or b!885139 b!885142) bm!39049))

(assert (= (or b!885138 bm!39049) bm!39048))

(assert (= (or b!885134 bm!39048) bm!39047))

(assert (= (and bm!39047 c!93199) b!885141))

(assert (= (and bm!39047 (not c!93199)) b!885140))

(assert (= (and d!109173 res!601218) b!885135))

(assert (= (and b!885135 res!601219) b!885136))

(declare-fun m!824857 () Bool)

(assert (=> bm!39047 m!824857))

(declare-fun m!824859 () Bool)

(assert (=> d!109173 m!824859))

(assert (=> d!109173 m!824803))

(declare-fun m!824861 () Bool)

(assert (=> d!109173 m!824861))

(declare-fun m!824863 () Bool)

(assert (=> b!885141 m!824863))

(declare-fun m!824865 () Bool)

(assert (=> b!885135 m!824865))

(declare-fun m!824867 () Bool)

(assert (=> b!885136 m!824867))

(assert (=> b!885064 d!109173))

(declare-fun b!885156 () Bool)

(declare-fun e!492610 () List!17655)

(declare-fun call!39061 () List!17655)

(assert (=> b!885156 (= e!492610 call!39061)))

(declare-fun b!885157 () Bool)

(declare-fun res!601221 () Bool)

(declare-fun e!492612 () Bool)

(assert (=> b!885157 (=> (not res!601221) (not e!492612))))

(declare-fun lt!400780 () List!17655)

(assert (=> b!885157 (= res!601221 (containsKey!405 lt!400780 key1!49))))

(declare-fun bm!39058 () Bool)

(declare-fun e!492614 () List!17655)

(declare-fun c!93207 () Bool)

(assert (=> bm!39058 (= call!39061 ($colon$colon!541 e!492614 (ite c!93207 (h!18782 (t!24923 l!906)) (tuple2!11877 key1!49 v2!16))))))

(declare-fun c!93209 () Bool)

(assert (=> bm!39058 (= c!93209 c!93207)))

(declare-fun bm!39059 () Bool)

(declare-fun call!39062 () List!17655)

(assert (=> bm!39059 (= call!39062 call!39061)))

(declare-fun b!885159 () Bool)

(declare-fun e!492613 () List!17655)

(assert (=> b!885159 (= e!492610 e!492613)))

(declare-fun c!93208 () Bool)

(assert (=> b!885159 (= c!93208 (and ((_ is Cons!17651) (t!24923 l!906)) (= (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(declare-fun b!885160 () Bool)

(assert (=> b!885160 (= e!492613 call!39062)))

(declare-fun b!885161 () Bool)

(declare-fun e!492611 () List!17655)

(declare-fun call!39063 () List!17655)

(assert (=> b!885161 (= e!492611 call!39063)))

(declare-fun bm!39060 () Bool)

(assert (=> bm!39060 (= call!39063 call!39062)))

(declare-fun b!885162 () Bool)

(declare-fun c!93210 () Bool)

(assert (=> b!885162 (= e!492614 (ite c!93208 (t!24923 (t!24923 l!906)) (ite c!93210 (Cons!17651 (h!18782 (t!24923 l!906)) (t!24923 (t!24923 l!906))) Nil!17652)))))

(declare-fun b!885163 () Bool)

(assert (=> b!885163 (= e!492614 (insertStrictlySorted!289 (t!24923 (t!24923 l!906)) key1!49 v2!16))))

(declare-fun b!885164 () Bool)

(assert (=> b!885164 (= e!492611 call!39063)))

(declare-fun b!885165 () Bool)

(assert (=> b!885165 (= c!93210 (and ((_ is Cons!17651) (t!24923 l!906)) (bvsgt (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(assert (=> b!885165 (= e!492613 e!492611)))

(declare-fun b!885158 () Bool)

(assert (=> b!885158 (= e!492612 (contains!4264 lt!400780 (tuple2!11877 key1!49 v2!16)))))

(declare-fun d!109185 () Bool)

(assert (=> d!109185 e!492612))

(declare-fun res!601220 () Bool)

(assert (=> d!109185 (=> (not res!601220) (not e!492612))))

(assert (=> d!109185 (= res!601220 (isStrictlySorted!467 lt!400780))))

(assert (=> d!109185 (= lt!400780 e!492610)))

(assert (=> d!109185 (= c!93207 (and ((_ is Cons!17651) (t!24923 l!906)) (bvslt (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(assert (=> d!109185 (isStrictlySorted!467 (t!24923 l!906))))

(assert (=> d!109185 (= (insertStrictlySorted!289 (t!24923 l!906) key1!49 v2!16) lt!400780)))

(assert (= (and d!109185 c!93207) b!885156))

(assert (= (and d!109185 (not c!93207)) b!885159))

(assert (= (and b!885159 c!93208) b!885160))

(assert (= (and b!885159 (not c!93208)) b!885165))

(assert (= (and b!885165 c!93210) b!885161))

(assert (= (and b!885165 (not c!93210)) b!885164))

(assert (= (or b!885161 b!885164) bm!39060))

(assert (= (or b!885160 bm!39060) bm!39059))

(assert (= (or b!885156 bm!39059) bm!39058))

(assert (= (and bm!39058 c!93209) b!885163))

(assert (= (and bm!39058 (not c!93209)) b!885162))

(assert (= (and d!109185 res!601220) b!885157))

(assert (= (and b!885157 res!601221) b!885158))

(declare-fun m!824869 () Bool)

(assert (=> bm!39058 m!824869))

(declare-fun m!824871 () Bool)

(assert (=> d!109185 m!824871))

(assert (=> d!109185 m!824815))

(declare-fun m!824873 () Bool)

(assert (=> b!885163 m!824873))

(declare-fun m!824875 () Bool)

(assert (=> b!885157 m!824875))

(declare-fun m!824877 () Bool)

(assert (=> b!885158 m!824877))

(assert (=> b!885064 d!109185))

(declare-fun b!885174 () Bool)

(declare-fun e!492619 () List!17655)

(declare-fun call!39066 () List!17655)

(assert (=> b!885174 (= e!492619 call!39066)))

(declare-fun b!885175 () Bool)

(declare-fun res!601227 () Bool)

(declare-fun e!492621 () Bool)

(assert (=> b!885175 (=> (not res!601227) (not e!492621))))

(declare-fun lt!400781 () List!17655)

(assert (=> b!885175 (= res!601227 (containsKey!405 lt!400781 key1!49))))

(declare-fun bm!39063 () Bool)

(declare-fun e!492623 () List!17655)

(declare-fun c!93213 () Bool)

(assert (=> bm!39063 (= call!39066 ($colon$colon!541 e!492623 (ite c!93213 (h!18782 (t!24923 l!906)) (tuple2!11877 key1!49 v1!38))))))

(declare-fun c!93215 () Bool)

(assert (=> bm!39063 (= c!93215 c!93213)))

(declare-fun bm!39064 () Bool)

(declare-fun call!39067 () List!17655)

(assert (=> bm!39064 (= call!39067 call!39066)))

(declare-fun b!885177 () Bool)

(declare-fun e!492622 () List!17655)

(assert (=> b!885177 (= e!492619 e!492622)))

(declare-fun c!93214 () Bool)

(assert (=> b!885177 (= c!93214 (and ((_ is Cons!17651) (t!24923 l!906)) (= (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(declare-fun b!885178 () Bool)

(assert (=> b!885178 (= e!492622 call!39067)))

(declare-fun b!885179 () Bool)

(declare-fun e!492620 () List!17655)

(declare-fun call!39068 () List!17655)

(assert (=> b!885179 (= e!492620 call!39068)))

(declare-fun bm!39065 () Bool)

(assert (=> bm!39065 (= call!39068 call!39067)))

(declare-fun b!885180 () Bool)

(declare-fun c!93216 () Bool)

(assert (=> b!885180 (= e!492623 (ite c!93214 (t!24923 (t!24923 l!906)) (ite c!93216 (Cons!17651 (h!18782 (t!24923 l!906)) (t!24923 (t!24923 l!906))) Nil!17652)))))

(declare-fun b!885181 () Bool)

(assert (=> b!885181 (= e!492623 (insertStrictlySorted!289 (t!24923 (t!24923 l!906)) key1!49 v1!38))))

(declare-fun b!885182 () Bool)

(assert (=> b!885182 (= e!492620 call!39068)))

(declare-fun b!885183 () Bool)

(assert (=> b!885183 (= c!93216 (and ((_ is Cons!17651) (t!24923 l!906)) (bvsgt (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(assert (=> b!885183 (= e!492622 e!492620)))

(declare-fun b!885176 () Bool)

(assert (=> b!885176 (= e!492621 (contains!4264 lt!400781 (tuple2!11877 key1!49 v1!38)))))

(declare-fun d!109187 () Bool)

(assert (=> d!109187 e!492621))

(declare-fun res!601226 () Bool)

(assert (=> d!109187 (=> (not res!601226) (not e!492621))))

(assert (=> d!109187 (= res!601226 (isStrictlySorted!467 lt!400781))))

(assert (=> d!109187 (= lt!400781 e!492619)))

(assert (=> d!109187 (= c!93213 (and ((_ is Cons!17651) (t!24923 l!906)) (bvslt (_1!5949 (h!18782 (t!24923 l!906))) key1!49)))))

(assert (=> d!109187 (isStrictlySorted!467 (t!24923 l!906))))

(assert (=> d!109187 (= (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38) lt!400781)))

(assert (= (and d!109187 c!93213) b!885174))

(assert (= (and d!109187 (not c!93213)) b!885177))

(assert (= (and b!885177 c!93214) b!885178))

(assert (= (and b!885177 (not c!93214)) b!885183))

(assert (= (and b!885183 c!93216) b!885179))

(assert (= (and b!885183 (not c!93216)) b!885182))

(assert (= (or b!885179 b!885182) bm!39065))

(assert (= (or b!885178 bm!39065) bm!39064))

(assert (= (or b!885174 bm!39064) bm!39063))

(assert (= (and bm!39063 c!93215) b!885181))

(assert (= (and bm!39063 (not c!93215)) b!885180))

(assert (= (and d!109187 res!601226) b!885175))

(assert (= (and b!885175 res!601227) b!885176))

(declare-fun m!824879 () Bool)

(assert (=> bm!39063 m!824879))

(declare-fun m!824881 () Bool)

(assert (=> d!109187 m!824881))

(assert (=> d!109187 m!824815))

(declare-fun m!824883 () Bool)

(assert (=> b!885181 m!824883))

(declare-fun m!824885 () Bool)

(assert (=> b!885175 m!824885))

(declare-fun m!824887 () Bool)

(assert (=> b!885176 m!824887))

(assert (=> b!885064 d!109187))

(declare-fun b!885188 () Bool)

(declare-fun e!492626 () List!17655)

(declare-fun call!39069 () List!17655)

(assert (=> b!885188 (= e!492626 call!39069)))

(declare-fun b!885189 () Bool)

(declare-fun res!601233 () Bool)

(declare-fun e!492628 () Bool)

(assert (=> b!885189 (=> (not res!601233) (not e!492628))))

(declare-fun lt!400782 () List!17655)

(assert (=> b!885189 (= res!601233 (containsKey!405 lt!400782 key1!49))))

(declare-fun c!93217 () Bool)

(declare-fun e!492630 () List!17655)

(declare-fun bm!39066 () Bool)

(assert (=> bm!39066 (= call!39069 ($colon$colon!541 e!492630 (ite c!93217 (h!18782 l!906) (tuple2!11877 key1!49 v1!38))))))

(declare-fun c!93219 () Bool)

(assert (=> bm!39066 (= c!93219 c!93217)))

(declare-fun bm!39067 () Bool)

(declare-fun call!39070 () List!17655)

(assert (=> bm!39067 (= call!39070 call!39069)))

(declare-fun b!885191 () Bool)

(declare-fun e!492629 () List!17655)

(assert (=> b!885191 (= e!492626 e!492629)))

(declare-fun c!93218 () Bool)

(assert (=> b!885191 (= c!93218 (and ((_ is Cons!17651) l!906) (= (_1!5949 (h!18782 l!906)) key1!49)))))

(declare-fun b!885192 () Bool)

(assert (=> b!885192 (= e!492629 call!39070)))

(declare-fun b!885193 () Bool)

(declare-fun e!492627 () List!17655)

(declare-fun call!39071 () List!17655)

(assert (=> b!885193 (= e!492627 call!39071)))

(declare-fun bm!39068 () Bool)

(assert (=> bm!39068 (= call!39071 call!39070)))

(declare-fun c!93220 () Bool)

(declare-fun b!885194 () Bool)

(assert (=> b!885194 (= e!492630 (ite c!93218 (t!24923 l!906) (ite c!93220 (Cons!17651 (h!18782 l!906) (t!24923 l!906)) Nil!17652)))))

(declare-fun b!885195 () Bool)

(assert (=> b!885195 (= e!492630 (insertStrictlySorted!289 (t!24923 l!906) key1!49 v1!38))))

(declare-fun b!885196 () Bool)

(assert (=> b!885196 (= e!492627 call!39071)))

(declare-fun b!885197 () Bool)

(assert (=> b!885197 (= c!93220 (and ((_ is Cons!17651) l!906) (bvsgt (_1!5949 (h!18782 l!906)) key1!49)))))

(assert (=> b!885197 (= e!492629 e!492627)))

(declare-fun b!885190 () Bool)

(assert (=> b!885190 (= e!492628 (contains!4264 lt!400782 (tuple2!11877 key1!49 v1!38)))))

(declare-fun d!109189 () Bool)

(assert (=> d!109189 e!492628))

(declare-fun res!601232 () Bool)

(assert (=> d!109189 (=> (not res!601232) (not e!492628))))

(assert (=> d!109189 (= res!601232 (isStrictlySorted!467 lt!400782))))

(assert (=> d!109189 (= lt!400782 e!492626)))

(assert (=> d!109189 (= c!93217 (and ((_ is Cons!17651) l!906) (bvslt (_1!5949 (h!18782 l!906)) key1!49)))))

(assert (=> d!109189 (isStrictlySorted!467 l!906)))

(assert (=> d!109189 (= (insertStrictlySorted!289 l!906 key1!49 v1!38) lt!400782)))

(assert (= (and d!109189 c!93217) b!885188))

(assert (= (and d!109189 (not c!93217)) b!885191))

(assert (= (and b!885191 c!93218) b!885192))

(assert (= (and b!885191 (not c!93218)) b!885197))

(assert (= (and b!885197 c!93220) b!885193))

(assert (= (and b!885197 (not c!93220)) b!885196))

(assert (= (or b!885193 b!885196) bm!39068))

(assert (= (or b!885192 bm!39068) bm!39067))

(assert (= (or b!885188 bm!39067) bm!39066))

(assert (= (and bm!39066 c!93219) b!885195))

(assert (= (and bm!39066 (not c!93219)) b!885194))

(assert (= (and d!109189 res!601232) b!885189))

(assert (= (and b!885189 res!601233) b!885190))

(declare-fun m!824889 () Bool)

(assert (=> bm!39066 m!824889))

(declare-fun m!824891 () Bool)

(assert (=> d!109189 m!824891))

(assert (=> d!109189 m!824801))

(assert (=> b!885195 m!824803))

(declare-fun m!824893 () Bool)

(assert (=> b!885189 m!824893))

(declare-fun m!824895 () Bool)

(assert (=> b!885190 m!824895))

(assert (=> b!885064 d!109189))

(declare-fun d!109191 () Bool)

(declare-fun res!601244 () Bool)

(declare-fun e!492650 () Bool)

(assert (=> d!109191 (=> res!601244 e!492650)))

(assert (=> d!109191 (= res!601244 (or ((_ is Nil!17652) (insertStrictlySorted!289 l!906 key1!49 v1!38)) ((_ is Nil!17652) (t!24923 (insertStrictlySorted!289 l!906 key1!49 v1!38)))))))

(assert (=> d!109191 (= (isStrictlySorted!467 (insertStrictlySorted!289 l!906 key1!49 v1!38)) e!492650)))

(declare-fun b!885232 () Bool)

(declare-fun e!492651 () Bool)

(assert (=> b!885232 (= e!492650 e!492651)))

(declare-fun res!601245 () Bool)

(assert (=> b!885232 (=> (not res!601245) (not e!492651))))

(assert (=> b!885232 (= res!601245 (bvslt (_1!5949 (h!18782 (insertStrictlySorted!289 l!906 key1!49 v1!38))) (_1!5949 (h!18782 (t!24923 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))))

(declare-fun b!885233 () Bool)

(assert (=> b!885233 (= e!492651 (isStrictlySorted!467 (t!24923 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(assert (= (and d!109191 (not res!601244)) b!885232))

(assert (= (and b!885232 res!601245) b!885233))

(declare-fun m!824931 () Bool)

(assert (=> b!885233 m!824931))

(assert (=> b!885064 d!109191))

(declare-fun d!109199 () Bool)

(declare-fun res!601250 () Bool)

(declare-fun e!492662 () Bool)

(assert (=> d!109199 (=> res!601250 e!492662)))

(assert (=> d!109199 (= res!601250 (or ((_ is Nil!17652) (t!24923 l!906)) ((_ is Nil!17652) (t!24923 (t!24923 l!906)))))))

(assert (=> d!109199 (= (isStrictlySorted!467 (t!24923 l!906)) e!492662)))

(declare-fun b!885254 () Bool)

(declare-fun e!492663 () Bool)

(assert (=> b!885254 (= e!492662 e!492663)))

(declare-fun res!601251 () Bool)

(assert (=> b!885254 (=> (not res!601251) (not e!492663))))

(assert (=> b!885254 (= res!601251 (bvslt (_1!5949 (h!18782 (t!24923 l!906))) (_1!5949 (h!18782 (t!24923 (t!24923 l!906))))))))

(declare-fun b!885255 () Bool)

(assert (=> b!885255 (= e!492663 (isStrictlySorted!467 (t!24923 (t!24923 l!906))))))

(assert (= (and d!109199 (not res!601250)) b!885254))

(assert (= (and b!885254 res!601251) b!885255))

(declare-fun m!824933 () Bool)

(assert (=> b!885255 m!824933))

(assert (=> b!885063 d!109199))

(declare-fun d!109201 () Bool)

(declare-fun res!601252 () Bool)

(declare-fun e!492664 () Bool)

(assert (=> d!109201 (=> res!601252 e!492664)))

(assert (=> d!109201 (= res!601252 (or ((_ is Nil!17652) l!906) ((_ is Nil!17652) (t!24923 l!906))))))

(assert (=> d!109201 (= (isStrictlySorted!467 l!906) e!492664)))

(declare-fun b!885256 () Bool)

(declare-fun e!492665 () Bool)

(assert (=> b!885256 (= e!492664 e!492665)))

(declare-fun res!601253 () Bool)

(assert (=> b!885256 (=> (not res!601253) (not e!492665))))

(assert (=> b!885256 (= res!601253 (bvslt (_1!5949 (h!18782 l!906)) (_1!5949 (h!18782 (t!24923 l!906)))))))

(declare-fun b!885257 () Bool)

(assert (=> b!885257 (= e!492665 (isStrictlySorted!467 (t!24923 l!906)))))

(assert (= (and d!109201 (not res!601252)) b!885256))

(assert (= (and b!885256 res!601253) b!885257))

(assert (=> b!885257 m!824815))

(assert (=> start!75076 d!109201))

(declare-fun b!885282 () Bool)

(declare-fun e!492678 () Bool)

(declare-fun tp!54258 () Bool)

(assert (=> b!885282 (= e!492678 (and tp_is_empty!17761 tp!54258))))

(assert (=> b!885065 (= tp!54249 e!492678)))

(assert (= (and b!885065 ((_ is Cons!17651) (t!24923 l!906))) b!885282))

(check-sat (not b!885175) (not d!109173) (not b!885255) (not b!885233) (not b!885176) (not d!109185) (not d!109189) tp_is_empty!17761 (not b!885189) (not bm!39066) (not bm!39063) (not b!885158) (not d!109169) (not b!885136) (not b!885195) (not b!885157) (not b!885135) (not b!885163) (not d!109187) (not bm!39047) (not bm!39058) (not b!885257) (not b!885181) (not b!885190) (not b!885141) (not b!885282))
(check-sat)
