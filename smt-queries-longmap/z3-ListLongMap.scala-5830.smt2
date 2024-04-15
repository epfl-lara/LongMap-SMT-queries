; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75184 () Bool)

(assert start!75184)

(declare-fun b!885770 () Bool)

(declare-fun e!493007 () Bool)

(declare-fun tp_is_empty!17809 () Bool)

(declare-fun tp!54366 () Bool)

(assert (=> b!885770 (= e!493007 (and tp_is_empty!17809 tp!54366))))

(declare-fun b!885768 () Bool)

(declare-fun res!601485 () Bool)

(declare-fun e!493006 () Bool)

(assert (=> b!885768 (=> (not res!601485) (not e!493006))))

(declare-datatypes ((B!1298 0))(
  ( (B!1299 (val!8955 Int)) )
))
(declare-datatypes ((tuple2!11924 0))(
  ( (tuple2!11925 (_1!5973 (_ BitVec 64)) (_2!5973 B!1298)) )
))
(declare-datatypes ((List!17679 0))(
  ( (Nil!17676) (Cons!17675 (h!18806 tuple2!11924) (t!24947 List!17679)) )
))
(declare-fun l!906 () List!17679)

(declare-fun isStrictlySorted!485 (List!17679) Bool)

(assert (=> b!885768 (= res!601485 (isStrictlySorted!485 (t!24947 l!906)))))

(declare-fun res!601486 () Bool)

(assert (=> start!75184 (=> (not res!601486) (not e!493006))))

(assert (=> start!75184 (= res!601486 (isStrictlySorted!485 l!906))))

(assert (=> start!75184 e!493006))

(assert (=> start!75184 e!493007))

(assert (=> start!75184 true))

(assert (=> start!75184 tp_is_empty!17809))

(declare-fun b!885767 () Bool)

(declare-fun res!601487 () Bool)

(assert (=> b!885767 (=> (not res!601487) (not e!493006))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885767 (= res!601487 (and ((_ is Cons!17675) l!906) (bvslt (_1!5973 (h!18806 l!906)) key1!49)))))

(declare-fun v2!16 () B!1298)

(declare-fun v1!38 () B!1298)

(declare-fun b!885769 () Bool)

(declare-fun insertStrictlySorted!298 (List!17679 (_ BitVec 64) B!1298) List!17679)

(assert (=> b!885769 (= e!493006 (not (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 l!906 key1!49 v2!16))))))

(assert (=> b!885769 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30182 0))(
  ( (Unit!30183) )
))
(declare-fun lt!400832 () Unit!30182)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!13 (List!17679 (_ BitVec 64) B!1298 B!1298) Unit!30182)

(assert (=> b!885769 (= lt!400832 (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24947 l!906) key1!49 v1!38 v2!16))))

(assert (= (and start!75184 res!601486) b!885767))

(assert (= (and b!885767 res!601487) b!885768))

(assert (= (and b!885768 res!601485) b!885769))

(assert (= (and start!75184 ((_ is Cons!17675) l!906)) b!885770))

(declare-fun m!825161 () Bool)

(assert (=> b!885768 m!825161))

(declare-fun m!825163 () Bool)

(assert (=> start!75184 m!825163))

(declare-fun m!825165 () Bool)

(assert (=> b!885769 m!825165))

(declare-fun m!825167 () Bool)

(assert (=> b!885769 m!825167))

(declare-fun m!825169 () Bool)

(assert (=> b!885769 m!825169))

(declare-fun m!825171 () Bool)

(assert (=> b!885769 m!825171))

(declare-fun m!825173 () Bool)

(assert (=> b!885769 m!825173))

(assert (=> b!885769 m!825171))

(declare-fun m!825175 () Bool)

(assert (=> b!885769 m!825175))

(assert (=> b!885769 m!825165))

(declare-fun m!825177 () Bool)

(assert (=> b!885769 m!825177))

(check-sat tp_is_empty!17809 (not start!75184) (not b!885770) (not b!885769) (not b!885768))
(check-sat)
(get-model)

(declare-fun d!109299 () Bool)

(declare-fun res!601510 () Bool)

(declare-fun e!493024 () Bool)

(assert (=> d!109299 (=> res!601510 e!493024)))

(assert (=> d!109299 (= res!601510 (or ((_ is Nil!17676) (t!24947 l!906)) ((_ is Nil!17676) (t!24947 (t!24947 l!906)))))))

(assert (=> d!109299 (= (isStrictlySorted!485 (t!24947 l!906)) e!493024)))

(declare-fun b!885799 () Bool)

(declare-fun e!493025 () Bool)

(assert (=> b!885799 (= e!493024 e!493025)))

(declare-fun res!601511 () Bool)

(assert (=> b!885799 (=> (not res!601511) (not e!493025))))

(assert (=> b!885799 (= res!601511 (bvslt (_1!5973 (h!18806 (t!24947 l!906))) (_1!5973 (h!18806 (t!24947 (t!24947 l!906))))))))

(declare-fun b!885800 () Bool)

(assert (=> b!885800 (= e!493025 (isStrictlySorted!485 (t!24947 (t!24947 l!906))))))

(assert (= (and d!109299 (not res!601510)) b!885799))

(assert (= (and b!885799 res!601511) b!885800))

(declare-fun m!825215 () Bool)

(assert (=> b!885800 m!825215))

(assert (=> b!885768 d!109299))

(declare-fun d!109303 () Bool)

(declare-fun res!601512 () Bool)

(declare-fun e!493026 () Bool)

(assert (=> d!109303 (=> res!601512 e!493026)))

(assert (=> d!109303 (= res!601512 (or ((_ is Nil!17676) l!906) ((_ is Nil!17676) (t!24947 l!906))))))

(assert (=> d!109303 (= (isStrictlySorted!485 l!906) e!493026)))

(declare-fun b!885801 () Bool)

(declare-fun e!493027 () Bool)

(assert (=> b!885801 (= e!493026 e!493027)))

(declare-fun res!601513 () Bool)

(assert (=> b!885801 (=> (not res!601513) (not e!493027))))

(assert (=> b!885801 (= res!601513 (bvslt (_1!5973 (h!18806 l!906)) (_1!5973 (h!18806 (t!24947 l!906)))))))

(declare-fun b!885802 () Bool)

(assert (=> b!885802 (= e!493027 (isStrictlySorted!485 (t!24947 l!906)))))

(assert (= (and d!109303 (not res!601512)) b!885801))

(assert (= (and b!885801 res!601513) b!885802))

(assert (=> b!885802 m!825161))

(assert (=> start!75184 d!109303))

(declare-fun d!109305 () Bool)

(assert (=> d!109305 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v2!16))))

(declare-fun lt!400841 () Unit!30182)

(declare-fun choose!1460 (List!17679 (_ BitVec 64) B!1298 B!1298) Unit!30182)

(assert (=> d!109305 (= lt!400841 (choose!1460 (t!24947 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109305 (isStrictlySorted!485 (t!24947 l!906))))

(assert (=> d!109305 (= (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24947 l!906) key1!49 v1!38 v2!16) lt!400841)))

(declare-fun bs!24816 () Bool)

(assert (= bs!24816 d!109305))

(declare-fun m!825219 () Bool)

(assert (=> bs!24816 m!825219))

(assert (=> bs!24816 m!825175))

(assert (=> bs!24816 m!825161))

(assert (=> bs!24816 m!825165))

(assert (=> bs!24816 m!825165))

(assert (=> bs!24816 m!825167))

(assert (=> b!885769 d!109305))

(declare-fun d!109311 () Bool)

(declare-fun e!493095 () Bool)

(assert (=> d!109311 e!493095))

(declare-fun res!601551 () Bool)

(assert (=> d!109311 (=> (not res!601551) (not e!493095))))

(declare-fun lt!400858 () List!17679)

(assert (=> d!109311 (= res!601551 (isStrictlySorted!485 lt!400858))))

(declare-fun e!493098 () List!17679)

(assert (=> d!109311 (= lt!400858 e!493098)))

(declare-fun c!93350 () Bool)

(assert (=> d!109311 (= c!93350 (and ((_ is Cons!17675) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (bvslt (_1!5973 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109311 (isStrictlySorted!485 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))))

(assert (=> d!109311 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38) key1!49 v2!16) lt!400858)))

(declare-fun bm!39150 () Bool)

(declare-fun call!39154 () List!17679)

(declare-fun call!39155 () List!17679)

(assert (=> bm!39150 (= call!39154 call!39155)))

(declare-fun b!885919 () Bool)

(declare-fun contains!4271 (List!17679 tuple2!11924) Bool)

(assert (=> b!885919 (= e!493095 (contains!4271 lt!400858 (tuple2!11925 key1!49 v2!16)))))

(declare-fun c!93352 () Bool)

(declare-fun b!885920 () Bool)

(assert (=> b!885920 (= c!93352 (and ((_ is Cons!17675) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (bvsgt (_1!5973 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun e!493094 () List!17679)

(declare-fun e!493096 () List!17679)

(assert (=> b!885920 (= e!493094 e!493096)))

(declare-fun bm!39151 () Bool)

(declare-fun call!39153 () List!17679)

(assert (=> bm!39151 (= call!39153 call!39154)))

(declare-fun b!885921 () Bool)

(assert (=> b!885921 (= e!493094 call!39154)))

(declare-fun b!885922 () Bool)

(declare-fun e!493097 () List!17679)

(assert (=> b!885922 (= e!493097 (insertStrictlySorted!298 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!885923 () Bool)

(assert (=> b!885923 (= e!493096 call!39153)))

(declare-fun c!93351 () Bool)

(declare-fun b!885924 () Bool)

(assert (=> b!885924 (= e!493097 (ite c!93351 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (ite c!93352 (Cons!17675 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) Nil!17676)))))

(declare-fun b!885925 () Bool)

(assert (=> b!885925 (= e!493098 e!493094)))

(assert (=> b!885925 (= c!93351 (and ((_ is Cons!17675) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (= (_1!5973 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!885926 () Bool)

(assert (=> b!885926 (= e!493098 call!39155)))

(declare-fun bm!39152 () Bool)

(declare-fun $colon$colon!548 (List!17679 tuple2!11924) List!17679)

(assert (=> bm!39152 (= call!39155 ($colon$colon!548 e!493097 (ite c!93350 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93353 () Bool)

(assert (=> bm!39152 (= c!93353 c!93350)))

(declare-fun b!885927 () Bool)

(assert (=> b!885927 (= e!493096 call!39153)))

(declare-fun b!885928 () Bool)

(declare-fun res!601550 () Bool)

(assert (=> b!885928 (=> (not res!601550) (not e!493095))))

(declare-fun containsKey!412 (List!17679 (_ BitVec 64)) Bool)

(assert (=> b!885928 (= res!601550 (containsKey!412 lt!400858 key1!49))))

(assert (= (and d!109311 c!93350) b!885926))

(assert (= (and d!109311 (not c!93350)) b!885925))

(assert (= (and b!885925 c!93351) b!885921))

(assert (= (and b!885925 (not c!93351)) b!885920))

(assert (= (and b!885920 c!93352) b!885923))

(assert (= (and b!885920 (not c!93352)) b!885927))

(assert (= (or b!885923 b!885927) bm!39151))

(assert (= (or b!885921 bm!39151) bm!39150))

(assert (= (or b!885926 bm!39150) bm!39152))

(assert (= (and bm!39152 c!93353) b!885922))

(assert (= (and bm!39152 (not c!93353)) b!885924))

(assert (= (and d!109311 res!601551) b!885928))

(assert (= (and b!885928 res!601550) b!885919))

(declare-fun m!825287 () Bool)

(assert (=> d!109311 m!825287))

(assert (=> d!109311 m!825165))

(declare-fun m!825289 () Bool)

(assert (=> d!109311 m!825289))

(declare-fun m!825291 () Bool)

(assert (=> b!885919 m!825291))

(declare-fun m!825293 () Bool)

(assert (=> b!885922 m!825293))

(declare-fun m!825295 () Bool)

(assert (=> bm!39152 m!825295))

(declare-fun m!825297 () Bool)

(assert (=> b!885928 m!825297))

(assert (=> b!885769 d!109311))

(declare-fun d!109333 () Bool)

(declare-fun e!493105 () Bool)

(assert (=> d!109333 e!493105))

(declare-fun res!601553 () Bool)

(assert (=> d!109333 (=> (not res!601553) (not e!493105))))

(declare-fun lt!400861 () List!17679)

(assert (=> d!109333 (= res!601553 (isStrictlySorted!485 lt!400861))))

(declare-fun e!493110 () List!17679)

(assert (=> d!109333 (= lt!400861 e!493110)))

(declare-fun c!93356 () Bool)

(assert (=> d!109333 (= c!93356 (and ((_ is Cons!17675) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvslt (_1!5973 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109333 (isStrictlySorted!485 (insertStrictlySorted!298 l!906 key1!49 v1!38))))

(assert (=> d!109333 (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) lt!400861)))

(declare-fun bm!39153 () Bool)

(declare-fun call!39157 () List!17679)

(declare-fun call!39158 () List!17679)

(assert (=> bm!39153 (= call!39157 call!39158)))

(declare-fun b!885942 () Bool)

(assert (=> b!885942 (= e!493105 (contains!4271 lt!400861 (tuple2!11925 key1!49 v2!16)))))

(declare-fun c!93359 () Bool)

(declare-fun b!885943 () Bool)

(assert (=> b!885943 (= c!93359 (and ((_ is Cons!17675) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvsgt (_1!5973 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun e!493104 () List!17679)

(declare-fun e!493107 () List!17679)

(assert (=> b!885943 (= e!493104 e!493107)))

(declare-fun bm!39154 () Bool)

(declare-fun call!39156 () List!17679)

(assert (=> bm!39154 (= call!39156 call!39157)))

(declare-fun b!885944 () Bool)

(assert (=> b!885944 (= e!493104 call!39157)))

(declare-fun e!493109 () List!17679)

(declare-fun b!885945 () Bool)

(assert (=> b!885945 (= e!493109 (insertStrictlySorted!298 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!885946 () Bool)

(assert (=> b!885946 (= e!493107 call!39156)))

(declare-fun b!885947 () Bool)

(declare-fun c!93358 () Bool)

(assert (=> b!885947 (= e!493109 (ite c!93358 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (ite c!93359 (Cons!17675 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) Nil!17676)))))

(declare-fun b!885948 () Bool)

(assert (=> b!885948 (= e!493110 e!493104)))

(assert (=> b!885948 (= c!93358 (and ((_ is Cons!17675) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (= (_1!5973 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun b!885949 () Bool)

(assert (=> b!885949 (= e!493110 call!39158)))

(declare-fun bm!39155 () Bool)

(assert (=> bm!39155 (= call!39158 ($colon$colon!548 e!493109 (ite c!93356 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93361 () Bool)

(assert (=> bm!39155 (= c!93361 c!93356)))

(declare-fun b!885950 () Bool)

(assert (=> b!885950 (= e!493107 call!39156)))

(declare-fun b!885951 () Bool)

(declare-fun res!601552 () Bool)

(assert (=> b!885951 (=> (not res!601552) (not e!493105))))

(assert (=> b!885951 (= res!601552 (containsKey!412 lt!400861 key1!49))))

(assert (= (and d!109333 c!93356) b!885949))

(assert (= (and d!109333 (not c!93356)) b!885948))

(assert (= (and b!885948 c!93358) b!885944))

(assert (= (and b!885948 (not c!93358)) b!885943))

(assert (= (and b!885943 c!93359) b!885946))

(assert (= (and b!885943 (not c!93359)) b!885950))

(assert (= (or b!885946 b!885950) bm!39154))

(assert (= (or b!885944 bm!39154) bm!39153))

(assert (= (or b!885949 bm!39153) bm!39155))

(assert (= (and bm!39155 c!93361) b!885945))

(assert (= (and bm!39155 (not c!93361)) b!885947))

(assert (= (and d!109333 res!601553) b!885951))

(assert (= (and b!885951 res!601552) b!885942))

(declare-fun m!825299 () Bool)

(assert (=> d!109333 m!825299))

(assert (=> d!109333 m!825171))

(declare-fun m!825301 () Bool)

(assert (=> d!109333 m!825301))

(declare-fun m!825303 () Bool)

(assert (=> b!885942 m!825303))

(declare-fun m!825305 () Bool)

(assert (=> b!885945 m!825305))

(declare-fun m!825307 () Bool)

(assert (=> bm!39155 m!825307))

(declare-fun m!825309 () Bool)

(assert (=> b!885951 m!825309))

(assert (=> b!885769 d!109333))

(declare-fun d!109335 () Bool)

(declare-fun e!493114 () Bool)

(assert (=> d!109335 e!493114))

(declare-fun res!601555 () Bool)

(assert (=> d!109335 (=> (not res!601555) (not e!493114))))

(declare-fun lt!400862 () List!17679)

(assert (=> d!109335 (= res!601555 (isStrictlySorted!485 lt!400862))))

(declare-fun e!493117 () List!17679)

(assert (=> d!109335 (= lt!400862 e!493117)))

(declare-fun c!93364 () Bool)

(assert (=> d!109335 (= c!93364 (and ((_ is Cons!17675) (t!24947 l!906)) (bvslt (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(assert (=> d!109335 (isStrictlySorted!485 (t!24947 l!906))))

(assert (=> d!109335 (= (insertStrictlySorted!298 (t!24947 l!906) key1!49 v2!16) lt!400862)))

(declare-fun bm!39160 () Bool)

(declare-fun call!39164 () List!17679)

(declare-fun call!39165 () List!17679)

(assert (=> bm!39160 (= call!39164 call!39165)))

(declare-fun b!885956 () Bool)

(assert (=> b!885956 (= e!493114 (contains!4271 lt!400862 (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!885957 () Bool)

(declare-fun c!93366 () Bool)

(assert (=> b!885957 (= c!93366 (and ((_ is Cons!17675) (t!24947 l!906)) (bvsgt (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(declare-fun e!493113 () List!17679)

(declare-fun e!493115 () List!17679)

(assert (=> b!885957 (= e!493113 e!493115)))

(declare-fun bm!39161 () Bool)

(declare-fun call!39163 () List!17679)

(assert (=> bm!39161 (= call!39163 call!39164)))

(declare-fun b!885958 () Bool)

(assert (=> b!885958 (= e!493113 call!39164)))

(declare-fun e!493116 () List!17679)

(declare-fun b!885959 () Bool)

(assert (=> b!885959 (= e!493116 (insertStrictlySorted!298 (t!24947 (t!24947 l!906)) key1!49 v2!16))))

(declare-fun b!885960 () Bool)

(assert (=> b!885960 (= e!493115 call!39163)))

(declare-fun b!885961 () Bool)

(declare-fun c!93365 () Bool)

(assert (=> b!885961 (= e!493116 (ite c!93365 (t!24947 (t!24947 l!906)) (ite c!93366 (Cons!17675 (h!18806 (t!24947 l!906)) (t!24947 (t!24947 l!906))) Nil!17676)))))

(declare-fun b!885962 () Bool)

(assert (=> b!885962 (= e!493117 e!493113)))

(assert (=> b!885962 (= c!93365 (and ((_ is Cons!17675) (t!24947 l!906)) (= (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(declare-fun b!885963 () Bool)

(assert (=> b!885963 (= e!493117 call!39165)))

(declare-fun bm!39162 () Bool)

(assert (=> bm!39162 (= call!39165 ($colon$colon!548 e!493116 (ite c!93364 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93367 () Bool)

(assert (=> bm!39162 (= c!93367 c!93364)))

(declare-fun b!885964 () Bool)

(assert (=> b!885964 (= e!493115 call!39163)))

(declare-fun b!885965 () Bool)

(declare-fun res!601554 () Bool)

(assert (=> b!885965 (=> (not res!601554) (not e!493114))))

(assert (=> b!885965 (= res!601554 (containsKey!412 lt!400862 key1!49))))

(assert (= (and d!109335 c!93364) b!885963))

(assert (= (and d!109335 (not c!93364)) b!885962))

(assert (= (and b!885962 c!93365) b!885958))

(assert (= (and b!885962 (not c!93365)) b!885957))

(assert (= (and b!885957 c!93366) b!885960))

(assert (= (and b!885957 (not c!93366)) b!885964))

(assert (= (or b!885960 b!885964) bm!39161))

(assert (= (or b!885958 bm!39161) bm!39160))

(assert (= (or b!885963 bm!39160) bm!39162))

(assert (= (and bm!39162 c!93367) b!885959))

(assert (= (and bm!39162 (not c!93367)) b!885961))

(assert (= (and d!109335 res!601555) b!885965))

(assert (= (and b!885965 res!601554) b!885956))

(declare-fun m!825311 () Bool)

(assert (=> d!109335 m!825311))

(assert (=> d!109335 m!825161))

(declare-fun m!825313 () Bool)

(assert (=> b!885956 m!825313))

(declare-fun m!825315 () Bool)

(assert (=> b!885959 m!825315))

(declare-fun m!825317 () Bool)

(assert (=> bm!39162 m!825317))

(declare-fun m!825319 () Bool)

(assert (=> b!885965 m!825319))

(assert (=> b!885769 d!109335))

(declare-fun d!109337 () Bool)

(declare-fun e!493121 () Bool)

(assert (=> d!109337 e!493121))

(declare-fun res!601557 () Bool)

(assert (=> d!109337 (=> (not res!601557) (not e!493121))))

(declare-fun lt!400863 () List!17679)

(assert (=> d!109337 (= res!601557 (isStrictlySorted!485 lt!400863))))

(declare-fun e!493124 () List!17679)

(assert (=> d!109337 (= lt!400863 e!493124)))

(declare-fun c!93370 () Bool)

(assert (=> d!109337 (= c!93370 (and ((_ is Cons!17675) (t!24947 l!906)) (bvslt (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(assert (=> d!109337 (isStrictlySorted!485 (t!24947 l!906))))

(assert (=> d!109337 (= (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38) lt!400863)))

(declare-fun bm!39165 () Bool)

(declare-fun call!39169 () List!17679)

(declare-fun call!39170 () List!17679)

(assert (=> bm!39165 (= call!39169 call!39170)))

(declare-fun b!885970 () Bool)

(assert (=> b!885970 (= e!493121 (contains!4271 lt!400863 (tuple2!11925 key1!49 v1!38)))))

(declare-fun b!885971 () Bool)

(declare-fun c!93372 () Bool)

(assert (=> b!885971 (= c!93372 (and ((_ is Cons!17675) (t!24947 l!906)) (bvsgt (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(declare-fun e!493120 () List!17679)

(declare-fun e!493122 () List!17679)

(assert (=> b!885971 (= e!493120 e!493122)))

(declare-fun bm!39166 () Bool)

(declare-fun call!39168 () List!17679)

(assert (=> bm!39166 (= call!39168 call!39169)))

(declare-fun b!885972 () Bool)

(assert (=> b!885972 (= e!493120 call!39169)))

(declare-fun e!493123 () List!17679)

(declare-fun b!885973 () Bool)

(assert (=> b!885973 (= e!493123 (insertStrictlySorted!298 (t!24947 (t!24947 l!906)) key1!49 v1!38))))

(declare-fun b!885974 () Bool)

(assert (=> b!885974 (= e!493122 call!39168)))

(declare-fun c!93371 () Bool)

(declare-fun b!885975 () Bool)

(assert (=> b!885975 (= e!493123 (ite c!93371 (t!24947 (t!24947 l!906)) (ite c!93372 (Cons!17675 (h!18806 (t!24947 l!906)) (t!24947 (t!24947 l!906))) Nil!17676)))))

(declare-fun b!885976 () Bool)

(assert (=> b!885976 (= e!493124 e!493120)))

(assert (=> b!885976 (= c!93371 (and ((_ is Cons!17675) (t!24947 l!906)) (= (_1!5973 (h!18806 (t!24947 l!906))) key1!49)))))

(declare-fun b!885977 () Bool)

(assert (=> b!885977 (= e!493124 call!39170)))

(declare-fun bm!39167 () Bool)

(assert (=> bm!39167 (= call!39170 ($colon$colon!548 e!493123 (ite c!93370 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v1!38))))))

(declare-fun c!93373 () Bool)

(assert (=> bm!39167 (= c!93373 c!93370)))

(declare-fun b!885978 () Bool)

(assert (=> b!885978 (= e!493122 call!39168)))

(declare-fun b!885979 () Bool)

(declare-fun res!601556 () Bool)

(assert (=> b!885979 (=> (not res!601556) (not e!493121))))

(assert (=> b!885979 (= res!601556 (containsKey!412 lt!400863 key1!49))))

(assert (= (and d!109337 c!93370) b!885977))

(assert (= (and d!109337 (not c!93370)) b!885976))

(assert (= (and b!885976 c!93371) b!885972))

(assert (= (and b!885976 (not c!93371)) b!885971))

(assert (= (and b!885971 c!93372) b!885974))

(assert (= (and b!885971 (not c!93372)) b!885978))

(assert (= (or b!885974 b!885978) bm!39166))

(assert (= (or b!885972 bm!39166) bm!39165))

(assert (= (or b!885977 bm!39165) bm!39167))

(assert (= (and bm!39167 c!93373) b!885973))

(assert (= (and bm!39167 (not c!93373)) b!885975))

(assert (= (and d!109337 res!601557) b!885979))

(assert (= (and b!885979 res!601556) b!885970))

(declare-fun m!825321 () Bool)

(assert (=> d!109337 m!825321))

(assert (=> d!109337 m!825161))

(declare-fun m!825323 () Bool)

(assert (=> b!885970 m!825323))

(declare-fun m!825325 () Bool)

(assert (=> b!885973 m!825325))

(declare-fun m!825327 () Bool)

(assert (=> bm!39167 m!825327))

(declare-fun m!825329 () Bool)

(assert (=> b!885979 m!825329))

(assert (=> b!885769 d!109337))

(declare-fun d!109339 () Bool)

(declare-fun e!493128 () Bool)

(assert (=> d!109339 e!493128))

(declare-fun res!601563 () Bool)

(assert (=> d!109339 (=> (not res!601563) (not e!493128))))

(declare-fun lt!400864 () List!17679)

(assert (=> d!109339 (= res!601563 (isStrictlySorted!485 lt!400864))))

(declare-fun e!493131 () List!17679)

(assert (=> d!109339 (= lt!400864 e!493131)))

(declare-fun c!93374 () Bool)

(assert (=> d!109339 (= c!93374 (and ((_ is Cons!17675) l!906) (bvslt (_1!5973 (h!18806 l!906)) key1!49)))))

(assert (=> d!109339 (isStrictlySorted!485 l!906)))

(assert (=> d!109339 (= (insertStrictlySorted!298 l!906 key1!49 v2!16) lt!400864)))

(declare-fun bm!39168 () Bool)

(declare-fun call!39172 () List!17679)

(declare-fun call!39173 () List!17679)

(assert (=> bm!39168 (= call!39172 call!39173)))

(declare-fun b!885984 () Bool)

(assert (=> b!885984 (= e!493128 (contains!4271 lt!400864 (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!885985 () Bool)

(declare-fun c!93376 () Bool)

(assert (=> b!885985 (= c!93376 (and ((_ is Cons!17675) l!906) (bvsgt (_1!5973 (h!18806 l!906)) key1!49)))))

(declare-fun e!493127 () List!17679)

(declare-fun e!493129 () List!17679)

(assert (=> b!885985 (= e!493127 e!493129)))

(declare-fun bm!39169 () Bool)

(declare-fun call!39171 () List!17679)

(assert (=> bm!39169 (= call!39171 call!39172)))

(declare-fun b!885986 () Bool)

(assert (=> b!885986 (= e!493127 call!39172)))

(declare-fun b!885987 () Bool)

(declare-fun e!493130 () List!17679)

(assert (=> b!885987 (= e!493130 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v2!16))))

(declare-fun b!885988 () Bool)

(assert (=> b!885988 (= e!493129 call!39171)))

(declare-fun b!885989 () Bool)

(declare-fun c!93375 () Bool)

(assert (=> b!885989 (= e!493130 (ite c!93375 (t!24947 l!906) (ite c!93376 (Cons!17675 (h!18806 l!906) (t!24947 l!906)) Nil!17676)))))

(declare-fun b!885990 () Bool)

(assert (=> b!885990 (= e!493131 e!493127)))

(assert (=> b!885990 (= c!93375 (and ((_ is Cons!17675) l!906) (= (_1!5973 (h!18806 l!906)) key1!49)))))

(declare-fun b!885991 () Bool)

(assert (=> b!885991 (= e!493131 call!39173)))

(declare-fun bm!39170 () Bool)

(assert (=> bm!39170 (= call!39173 ($colon$colon!548 e!493130 (ite c!93374 (h!18806 l!906) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93377 () Bool)

(assert (=> bm!39170 (= c!93377 c!93374)))

(declare-fun b!885992 () Bool)

(assert (=> b!885992 (= e!493129 call!39171)))

(declare-fun b!885993 () Bool)

(declare-fun res!601562 () Bool)

(assert (=> b!885993 (=> (not res!601562) (not e!493128))))

(assert (=> b!885993 (= res!601562 (containsKey!412 lt!400864 key1!49))))

(assert (= (and d!109339 c!93374) b!885991))

(assert (= (and d!109339 (not c!93374)) b!885990))

(assert (= (and b!885990 c!93375) b!885986))

(assert (= (and b!885990 (not c!93375)) b!885985))

(assert (= (and b!885985 c!93376) b!885988))

(assert (= (and b!885985 (not c!93376)) b!885992))

(assert (= (or b!885988 b!885992) bm!39169))

(assert (= (or b!885986 bm!39169) bm!39168))

(assert (= (or b!885991 bm!39168) bm!39170))

(assert (= (and bm!39170 c!93377) b!885987))

(assert (= (and bm!39170 (not c!93377)) b!885989))

(assert (= (and d!109339 res!601563) b!885993))

(assert (= (and b!885993 res!601562) b!885984))

(declare-fun m!825331 () Bool)

(assert (=> d!109339 m!825331))

(assert (=> d!109339 m!825163))

(declare-fun m!825333 () Bool)

(assert (=> b!885984 m!825333))

(assert (=> b!885987 m!825175))

(declare-fun m!825335 () Bool)

(assert (=> bm!39170 m!825335))

(declare-fun m!825337 () Bool)

(assert (=> b!885993 m!825337))

(assert (=> b!885769 d!109339))

(declare-fun d!109341 () Bool)

(declare-fun e!493133 () Bool)

(assert (=> d!109341 e!493133))

(declare-fun res!601565 () Bool)

(assert (=> d!109341 (=> (not res!601565) (not e!493133))))

(declare-fun lt!400865 () List!17679)

(assert (=> d!109341 (= res!601565 (isStrictlySorted!485 lt!400865))))

(declare-fun e!493136 () List!17679)

(assert (=> d!109341 (= lt!400865 e!493136)))

(declare-fun c!93378 () Bool)

(assert (=> d!109341 (= c!93378 (and ((_ is Cons!17675) l!906) (bvslt (_1!5973 (h!18806 l!906)) key1!49)))))

(assert (=> d!109341 (isStrictlySorted!485 l!906)))

(assert (=> d!109341 (= (insertStrictlySorted!298 l!906 key1!49 v1!38) lt!400865)))

(declare-fun bm!39171 () Bool)

(declare-fun call!39175 () List!17679)

(declare-fun call!39176 () List!17679)

(assert (=> bm!39171 (= call!39175 call!39176)))

(declare-fun b!885994 () Bool)

(assert (=> b!885994 (= e!493133 (contains!4271 lt!400865 (tuple2!11925 key1!49 v1!38)))))

(declare-fun b!885995 () Bool)

(declare-fun c!93380 () Bool)

(assert (=> b!885995 (= c!93380 (and ((_ is Cons!17675) l!906) (bvsgt (_1!5973 (h!18806 l!906)) key1!49)))))

(declare-fun e!493132 () List!17679)

(declare-fun e!493134 () List!17679)

(assert (=> b!885995 (= e!493132 e!493134)))

(declare-fun bm!39172 () Bool)

(declare-fun call!39174 () List!17679)

(assert (=> bm!39172 (= call!39174 call!39175)))

(declare-fun b!885996 () Bool)

(assert (=> b!885996 (= e!493132 call!39175)))

(declare-fun b!885997 () Bool)

(declare-fun e!493135 () List!17679)

(assert (=> b!885997 (= e!493135 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))))

(declare-fun b!885998 () Bool)

(assert (=> b!885998 (= e!493134 call!39174)))

(declare-fun b!885999 () Bool)

(declare-fun c!93379 () Bool)

(assert (=> b!885999 (= e!493135 (ite c!93379 (t!24947 l!906) (ite c!93380 (Cons!17675 (h!18806 l!906) (t!24947 l!906)) Nil!17676)))))

(declare-fun b!886000 () Bool)

(assert (=> b!886000 (= e!493136 e!493132)))

(assert (=> b!886000 (= c!93379 (and ((_ is Cons!17675) l!906) (= (_1!5973 (h!18806 l!906)) key1!49)))))

(declare-fun b!886001 () Bool)

(assert (=> b!886001 (= e!493136 call!39176)))

(declare-fun bm!39173 () Bool)

(assert (=> bm!39173 (= call!39176 ($colon$colon!548 e!493135 (ite c!93378 (h!18806 l!906) (tuple2!11925 key1!49 v1!38))))))

(declare-fun c!93381 () Bool)

(assert (=> bm!39173 (= c!93381 c!93378)))

(declare-fun b!886002 () Bool)

(assert (=> b!886002 (= e!493134 call!39174)))

(declare-fun b!886003 () Bool)

(declare-fun res!601564 () Bool)

(assert (=> b!886003 (=> (not res!601564) (not e!493133))))

(assert (=> b!886003 (= res!601564 (containsKey!412 lt!400865 key1!49))))

(assert (= (and d!109341 c!93378) b!886001))

(assert (= (and d!109341 (not c!93378)) b!886000))

(assert (= (and b!886000 c!93379) b!885996))

(assert (= (and b!886000 (not c!93379)) b!885995))

(assert (= (and b!885995 c!93380) b!885998))

(assert (= (and b!885995 (not c!93380)) b!886002))

(assert (= (or b!885998 b!886002) bm!39172))

(assert (= (or b!885996 bm!39172) bm!39171))

(assert (= (or b!886001 bm!39171) bm!39173))

(assert (= (and bm!39173 c!93381) b!885997))

(assert (= (and bm!39173 (not c!93381)) b!885999))

(assert (= (and d!109341 res!601565) b!886003))

(assert (= (and b!886003 res!601564) b!885994))

(declare-fun m!825339 () Bool)

(assert (=> d!109341 m!825339))

(assert (=> d!109341 m!825163))

(declare-fun m!825341 () Bool)

(assert (=> b!885994 m!825341))

(assert (=> b!885997 m!825165))

(declare-fun m!825343 () Bool)

(assert (=> bm!39173 m!825343))

(declare-fun m!825345 () Bool)

(assert (=> b!886003 m!825345))

(assert (=> b!885769 d!109341))

(declare-fun b!886018 () Bool)

(declare-fun e!493144 () Bool)

(declare-fun tp!54378 () Bool)

(assert (=> b!886018 (= e!493144 (and tp_is_empty!17809 tp!54378))))

(assert (=> b!885770 (= tp!54366 e!493144)))

(assert (= (and b!885770 ((_ is Cons!17675) (t!24947 l!906))) b!886018))

(check-sat (not b!885965) (not b!885945) (not bm!39167) (not d!109337) tp_is_empty!17809 (not bm!39170) (not b!885997) (not b!885800) (not bm!39152) (not b!885994) (not b!885979) (not d!109305) (not d!109341) (not d!109311) (not b!885987) (not b!886018) (not d!109339) (not b!885802) (not b!885970) (not d!109335) (not b!885922) (not bm!39173) (not b!885959) (not bm!39162) (not b!885956) (not b!885984) (not b!885951) (not b!885928) (not b!885993) (not b!886003) (not b!885919) (not d!109333) (not b!885973) (not bm!39155) (not b!885942))
(check-sat)
(get-model)

(declare-fun d!109353 () Bool)

(declare-fun res!601582 () Bool)

(declare-fun e!493177 () Bool)

(assert (=> d!109353 (=> res!601582 e!493177)))

(assert (=> d!109353 (= res!601582 (and ((_ is Cons!17675) lt!400864) (= (_1!5973 (h!18806 lt!400864)) key1!49)))))

(assert (=> d!109353 (= (containsKey!412 lt!400864 key1!49) e!493177)))

(declare-fun b!886078 () Bool)

(declare-fun e!493178 () Bool)

(assert (=> b!886078 (= e!493177 e!493178)))

(declare-fun res!601583 () Bool)

(assert (=> b!886078 (=> (not res!601583) (not e!493178))))

(assert (=> b!886078 (= res!601583 (and (or (not ((_ is Cons!17675) lt!400864)) (bvsle (_1!5973 (h!18806 lt!400864)) key1!49)) ((_ is Cons!17675) lt!400864) (bvslt (_1!5973 (h!18806 lt!400864)) key1!49)))))

(declare-fun b!886079 () Bool)

(assert (=> b!886079 (= e!493178 (containsKey!412 (t!24947 lt!400864) key1!49))))

(assert (= (and d!109353 (not res!601582)) b!886078))

(assert (= (and b!886078 res!601583) b!886079))

(declare-fun m!825407 () Bool)

(assert (=> b!886079 m!825407))

(assert (=> b!885993 d!109353))

(declare-fun d!109355 () Bool)

(declare-fun e!493180 () Bool)

(assert (=> d!109355 e!493180))

(declare-fun res!601585 () Bool)

(assert (=> d!109355 (=> (not res!601585) (not e!493180))))

(declare-fun lt!400872 () List!17679)

(assert (=> d!109355 (= res!601585 (isStrictlySorted!485 lt!400872))))

(declare-fun e!493183 () List!17679)

(assert (=> d!109355 (= lt!400872 e!493183)))

(declare-fun c!93406 () Bool)

(assert (=> d!109355 (= c!93406 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (bvslt (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> d!109355 (isStrictlySorted!485 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))))

(assert (=> d!109355 (= (insertStrictlySorted!298 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) key1!49 v2!16) lt!400872)))

(declare-fun bm!39192 () Bool)

(declare-fun call!39196 () List!17679)

(declare-fun call!39197 () List!17679)

(assert (=> bm!39192 (= call!39196 call!39197)))

(declare-fun b!886080 () Bool)

(assert (=> b!886080 (= e!493180 (contains!4271 lt!400872 (tuple2!11925 key1!49 v2!16)))))

(declare-fun c!93408 () Bool)

(declare-fun b!886081 () Bool)

(assert (=> b!886081 (= c!93408 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (bvsgt (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun e!493179 () List!17679)

(declare-fun e!493181 () List!17679)

(assert (=> b!886081 (= e!493179 e!493181)))

(declare-fun bm!39193 () Bool)

(declare-fun call!39195 () List!17679)

(assert (=> bm!39193 (= call!39195 call!39196)))

(declare-fun b!886082 () Bool)

(assert (=> b!886082 (= e!493179 call!39196)))

(declare-fun e!493182 () List!17679)

(declare-fun b!886083 () Bool)

(assert (=> b!886083 (= e!493182 (insertStrictlySorted!298 (t!24947 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!886084 () Bool)

(assert (=> b!886084 (= e!493181 call!39195)))

(declare-fun c!93407 () Bool)

(declare-fun b!886085 () Bool)

(assert (=> b!886085 (= e!493182 (ite c!93407 (t!24947 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (ite c!93408 (Cons!17675 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (t!24947 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))) Nil!17676)))))

(declare-fun b!886086 () Bool)

(assert (=> b!886086 (= e!493183 e!493179)))

(assert (=> b!886086 (= c!93407 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (= (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun b!886087 () Bool)

(assert (=> b!886087 (= e!493183 call!39197)))

(declare-fun bm!39194 () Bool)

(assert (=> bm!39194 (= call!39197 ($colon$colon!548 e!493182 (ite c!93406 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93409 () Bool)

(assert (=> bm!39194 (= c!93409 c!93406)))

(declare-fun b!886088 () Bool)

(assert (=> b!886088 (= e!493181 call!39195)))

(declare-fun b!886089 () Bool)

(declare-fun res!601584 () Bool)

(assert (=> b!886089 (=> (not res!601584) (not e!493180))))

(assert (=> b!886089 (= res!601584 (containsKey!412 lt!400872 key1!49))))

(assert (= (and d!109355 c!93406) b!886087))

(assert (= (and d!109355 (not c!93406)) b!886086))

(assert (= (and b!886086 c!93407) b!886082))

(assert (= (and b!886086 (not c!93407)) b!886081))

(assert (= (and b!886081 c!93408) b!886084))

(assert (= (and b!886081 (not c!93408)) b!886088))

(assert (= (or b!886084 b!886088) bm!39193))

(assert (= (or b!886082 bm!39193) bm!39192))

(assert (= (or b!886087 bm!39192) bm!39194))

(assert (= (and bm!39194 c!93409) b!886083))

(assert (= (and bm!39194 (not c!93409)) b!886085))

(assert (= (and d!109355 res!601585) b!886089))

(assert (= (and b!886089 res!601584) b!886080))

(declare-fun m!825409 () Bool)

(assert (=> d!109355 m!825409))

(declare-fun m!825411 () Bool)

(assert (=> d!109355 m!825411))

(declare-fun m!825413 () Bool)

(assert (=> b!886080 m!825413))

(declare-fun m!825415 () Bool)

(assert (=> b!886083 m!825415))

(declare-fun m!825417 () Bool)

(assert (=> bm!39194 m!825417))

(declare-fun m!825419 () Bool)

(assert (=> b!886089 m!825419))

(assert (=> b!885922 d!109355))

(declare-fun d!109357 () Bool)

(assert (=> d!109357 (= ($colon$colon!548 e!493116 (ite c!93364 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v2!16))) (Cons!17675 (ite c!93364 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v2!16)) e!493116))))

(assert (=> bm!39162 d!109357))

(declare-fun d!109361 () Bool)

(declare-fun e!493185 () Bool)

(assert (=> d!109361 e!493185))

(declare-fun res!601588 () Bool)

(assert (=> d!109361 (=> (not res!601588) (not e!493185))))

(declare-fun lt!400874 () List!17679)

(assert (=> d!109361 (= res!601588 (isStrictlySorted!485 lt!400874))))

(declare-fun e!493190 () List!17679)

(assert (=> d!109361 (= lt!400874 e!493190)))

(declare-fun c!93410 () Bool)

(assert (=> d!109361 (= c!93410 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvslt (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109361 (isStrictlySorted!485 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))

(assert (=> d!109361 (= (insertStrictlySorted!298 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16) lt!400874)))

(declare-fun bm!39195 () Bool)

(declare-fun call!39199 () List!17679)

(declare-fun call!39200 () List!17679)

(assert (=> bm!39195 (= call!39199 call!39200)))

(declare-fun b!886090 () Bool)

(assert (=> b!886090 (= e!493185 (contains!4271 lt!400874 (tuple2!11925 key1!49 v2!16)))))

(declare-fun c!93413 () Bool)

(declare-fun b!886091 () Bool)

(assert (=> b!886091 (= c!93413 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvsgt (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun e!493184 () List!17679)

(declare-fun e!493186 () List!17679)

(assert (=> b!886091 (= e!493184 e!493186)))

(declare-fun bm!39196 () Bool)

(declare-fun call!39198 () List!17679)

(assert (=> bm!39196 (= call!39198 call!39199)))

(declare-fun b!886092 () Bool)

(assert (=> b!886092 (= e!493184 call!39199)))

(declare-fun b!886093 () Bool)

(declare-fun e!493188 () List!17679)

(assert (=> b!886093 (= e!493188 (insertStrictlySorted!298 (t!24947 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!886094 () Bool)

(assert (=> b!886094 (= e!493186 call!39198)))

(declare-fun c!93411 () Bool)

(declare-fun b!886095 () Bool)

(assert (=> b!886095 (= e!493188 (ite c!93411 (t!24947 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (ite c!93413 (Cons!17675 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (t!24947 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) Nil!17676)))))

(declare-fun b!886096 () Bool)

(assert (=> b!886096 (= e!493190 e!493184)))

(assert (=> b!886096 (= c!93411 (and ((_ is Cons!17675) (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (= (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun b!886097 () Bool)

(assert (=> b!886097 (= e!493190 call!39200)))

(declare-fun bm!39197 () Bool)

(assert (=> bm!39197 (= call!39200 ($colon$colon!548 e!493188 (ite c!93410 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93414 () Bool)

(assert (=> bm!39197 (= c!93414 c!93410)))

(declare-fun b!886098 () Bool)

(assert (=> b!886098 (= e!493186 call!39198)))

(declare-fun b!886099 () Bool)

(declare-fun res!601586 () Bool)

(assert (=> b!886099 (=> (not res!601586) (not e!493185))))

(assert (=> b!886099 (= res!601586 (containsKey!412 lt!400874 key1!49))))

(assert (= (and d!109361 c!93410) b!886097))

(assert (= (and d!109361 (not c!93410)) b!886096))

(assert (= (and b!886096 c!93411) b!886092))

(assert (= (and b!886096 (not c!93411)) b!886091))

(assert (= (and b!886091 c!93413) b!886094))

(assert (= (and b!886091 (not c!93413)) b!886098))

(assert (= (or b!886094 b!886098) bm!39196))

(assert (= (or b!886092 bm!39196) bm!39195))

(assert (= (or b!886097 bm!39195) bm!39197))

(assert (= (and bm!39197 c!93414) b!886093))

(assert (= (and bm!39197 (not c!93414)) b!886095))

(assert (= (and d!109361 res!601588) b!886099))

(assert (= (and b!886099 res!601586) b!886090))

(declare-fun m!825421 () Bool)

(assert (=> d!109361 m!825421))

(declare-fun m!825423 () Bool)

(assert (=> d!109361 m!825423))

(declare-fun m!825425 () Bool)

(assert (=> b!886090 m!825425))

(declare-fun m!825427 () Bool)

(assert (=> b!886093 m!825427))

(declare-fun m!825429 () Bool)

(assert (=> bm!39197 m!825429))

(declare-fun m!825431 () Bool)

(assert (=> b!886099 m!825431))

(assert (=> b!885945 d!109361))

(declare-fun d!109363 () Bool)

(declare-fun lt!400877 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!392 (List!17679) (InoxSet tuple2!11924))

(assert (=> d!109363 (= lt!400877 (select (content!392 lt!400863) (tuple2!11925 key1!49 v1!38)))))

(declare-fun e!493203 () Bool)

(assert (=> d!109363 (= lt!400877 e!493203)))

(declare-fun res!601599 () Bool)

(assert (=> d!109363 (=> (not res!601599) (not e!493203))))

(assert (=> d!109363 (= res!601599 ((_ is Cons!17675) lt!400863))))

(assert (=> d!109363 (= (contains!4271 lt!400863 (tuple2!11925 key1!49 v1!38)) lt!400877)))

(declare-fun b!886118 () Bool)

(declare-fun e!493202 () Bool)

(assert (=> b!886118 (= e!493203 e!493202)))

(declare-fun res!601598 () Bool)

(assert (=> b!886118 (=> res!601598 e!493202)))

(assert (=> b!886118 (= res!601598 (= (h!18806 lt!400863) (tuple2!11925 key1!49 v1!38)))))

(declare-fun b!886119 () Bool)

(assert (=> b!886119 (= e!493202 (contains!4271 (t!24947 lt!400863) (tuple2!11925 key1!49 v1!38)))))

(assert (= (and d!109363 res!601599) b!886118))

(assert (= (and b!886118 (not res!601598)) b!886119))

(declare-fun m!825447 () Bool)

(assert (=> d!109363 m!825447))

(declare-fun m!825449 () Bool)

(assert (=> d!109363 m!825449))

(declare-fun m!825451 () Bool)

(assert (=> b!886119 m!825451))

(assert (=> b!885970 d!109363))

(declare-fun d!109373 () Bool)

(declare-fun res!601600 () Bool)

(declare-fun e!493204 () Bool)

(assert (=> d!109373 (=> res!601600 e!493204)))

(assert (=> d!109373 (= res!601600 (and ((_ is Cons!17675) lt!400862) (= (_1!5973 (h!18806 lt!400862)) key1!49)))))

(assert (=> d!109373 (= (containsKey!412 lt!400862 key1!49) e!493204)))

(declare-fun b!886120 () Bool)

(declare-fun e!493205 () Bool)

(assert (=> b!886120 (= e!493204 e!493205)))

(declare-fun res!601601 () Bool)

(assert (=> b!886120 (=> (not res!601601) (not e!493205))))

(assert (=> b!886120 (= res!601601 (and (or (not ((_ is Cons!17675) lt!400862)) (bvsle (_1!5973 (h!18806 lt!400862)) key1!49)) ((_ is Cons!17675) lt!400862) (bvslt (_1!5973 (h!18806 lt!400862)) key1!49)))))

(declare-fun b!886121 () Bool)

(assert (=> b!886121 (= e!493205 (containsKey!412 (t!24947 lt!400862) key1!49))))

(assert (= (and d!109373 (not res!601600)) b!886120))

(assert (= (and b!886120 res!601601) b!886121))

(declare-fun m!825453 () Bool)

(assert (=> b!886121 m!825453))

(assert (=> b!885965 d!109373))

(declare-fun d!109375 () Bool)

(declare-fun res!601602 () Bool)

(declare-fun e!493206 () Bool)

(assert (=> d!109375 (=> res!601602 e!493206)))

(assert (=> d!109375 (= res!601602 (or ((_ is Nil!17676) lt!400861) ((_ is Nil!17676) (t!24947 lt!400861))))))

(assert (=> d!109375 (= (isStrictlySorted!485 lt!400861) e!493206)))

(declare-fun b!886122 () Bool)

(declare-fun e!493207 () Bool)

(assert (=> b!886122 (= e!493206 e!493207)))

(declare-fun res!601603 () Bool)

(assert (=> b!886122 (=> (not res!601603) (not e!493207))))

(assert (=> b!886122 (= res!601603 (bvslt (_1!5973 (h!18806 lt!400861)) (_1!5973 (h!18806 (t!24947 lt!400861)))))))

(declare-fun b!886123 () Bool)

(assert (=> b!886123 (= e!493207 (isStrictlySorted!485 (t!24947 lt!400861)))))

(assert (= (and d!109375 (not res!601602)) b!886122))

(assert (= (and b!886122 res!601603) b!886123))

(declare-fun m!825455 () Bool)

(assert (=> b!886123 m!825455))

(assert (=> d!109333 d!109375))

(declare-fun d!109377 () Bool)

(declare-fun res!601604 () Bool)

(declare-fun e!493208 () Bool)

(assert (=> d!109377 (=> res!601604 e!493208)))

(assert (=> d!109377 (= res!601604 (or ((_ is Nil!17676) (insertStrictlySorted!298 l!906 key1!49 v1!38)) ((_ is Nil!17676) (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))))

(assert (=> d!109377 (= (isStrictlySorted!485 (insertStrictlySorted!298 l!906 key1!49 v1!38)) e!493208)))

(declare-fun b!886124 () Bool)

(declare-fun e!493209 () Bool)

(assert (=> b!886124 (= e!493208 e!493209)))

(declare-fun res!601605 () Bool)

(assert (=> b!886124 (=> (not res!601605) (not e!493209))))

(assert (=> b!886124 (= res!601605 (bvslt (_1!5973 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))))

(declare-fun b!886125 () Bool)

(assert (=> b!886125 (= e!493209 (isStrictlySorted!485 (t!24947 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))

(assert (= (and d!109377 (not res!601604)) b!886124))

(assert (= (and b!886124 res!601605) b!886125))

(assert (=> b!886125 m!825423))

(assert (=> d!109333 d!109377))

(declare-fun lt!400878 () Bool)

(declare-fun d!109379 () Bool)

(assert (=> d!109379 (= lt!400878 (select (content!392 lt!400858) (tuple2!11925 key1!49 v2!16)))))

(declare-fun e!493211 () Bool)

(assert (=> d!109379 (= lt!400878 e!493211)))

(declare-fun res!601607 () Bool)

(assert (=> d!109379 (=> (not res!601607) (not e!493211))))

(assert (=> d!109379 (= res!601607 ((_ is Cons!17675) lt!400858))))

(assert (=> d!109379 (= (contains!4271 lt!400858 (tuple2!11925 key1!49 v2!16)) lt!400878)))

(declare-fun b!886126 () Bool)

(declare-fun e!493210 () Bool)

(assert (=> b!886126 (= e!493211 e!493210)))

(declare-fun res!601606 () Bool)

(assert (=> b!886126 (=> res!601606 e!493210)))

(assert (=> b!886126 (= res!601606 (= (h!18806 lt!400858) (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!886127 () Bool)

(assert (=> b!886127 (= e!493210 (contains!4271 (t!24947 lt!400858) (tuple2!11925 key1!49 v2!16)))))

(assert (= (and d!109379 res!601607) b!886126))

(assert (= (and b!886126 (not res!601606)) b!886127))

(declare-fun m!825457 () Bool)

(assert (=> d!109379 m!825457))

(declare-fun m!825459 () Bool)

(assert (=> d!109379 m!825459))

(declare-fun m!825461 () Bool)

(assert (=> b!886127 m!825461))

(assert (=> b!885919 d!109379))

(declare-fun d!109381 () Bool)

(declare-fun res!601608 () Bool)

(declare-fun e!493212 () Bool)

(assert (=> d!109381 (=> res!601608 e!493212)))

(assert (=> d!109381 (= res!601608 (or ((_ is Nil!17676) (t!24947 (t!24947 l!906))) ((_ is Nil!17676) (t!24947 (t!24947 (t!24947 l!906))))))))

(assert (=> d!109381 (= (isStrictlySorted!485 (t!24947 (t!24947 l!906))) e!493212)))

(declare-fun b!886128 () Bool)

(declare-fun e!493213 () Bool)

(assert (=> b!886128 (= e!493212 e!493213)))

(declare-fun res!601609 () Bool)

(assert (=> b!886128 (=> (not res!601609) (not e!493213))))

(assert (=> b!886128 (= res!601609 (bvslt (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) (_1!5973 (h!18806 (t!24947 (t!24947 (t!24947 l!906)))))))))

(declare-fun b!886129 () Bool)

(assert (=> b!886129 (= e!493213 (isStrictlySorted!485 (t!24947 (t!24947 (t!24947 l!906)))))))

(assert (= (and d!109381 (not res!601608)) b!886128))

(assert (= (and b!886128 res!601609) b!886129))

(declare-fun m!825463 () Bool)

(assert (=> b!886129 m!825463))

(assert (=> b!885800 d!109381))

(declare-fun d!109383 () Bool)

(declare-fun res!601612 () Bool)

(declare-fun e!493217 () Bool)

(assert (=> d!109383 (=> res!601612 e!493217)))

(assert (=> d!109383 (= res!601612 (and ((_ is Cons!17675) lt!400865) (= (_1!5973 (h!18806 lt!400865)) key1!49)))))

(assert (=> d!109383 (= (containsKey!412 lt!400865 key1!49) e!493217)))

(declare-fun b!886132 () Bool)

(declare-fun e!493219 () Bool)

(assert (=> b!886132 (= e!493217 e!493219)))

(declare-fun res!601614 () Bool)

(assert (=> b!886132 (=> (not res!601614) (not e!493219))))

(assert (=> b!886132 (= res!601614 (and (or (not ((_ is Cons!17675) lt!400865)) (bvsle (_1!5973 (h!18806 lt!400865)) key1!49)) ((_ is Cons!17675) lt!400865) (bvslt (_1!5973 (h!18806 lt!400865)) key1!49)))))

(declare-fun b!886133 () Bool)

(assert (=> b!886133 (= e!493219 (containsKey!412 (t!24947 lt!400865) key1!49))))

(assert (= (and d!109383 (not res!601612)) b!886132))

(assert (= (and b!886132 res!601614) b!886133))

(declare-fun m!825465 () Bool)

(assert (=> b!886133 m!825465))

(assert (=> b!886003 d!109383))

(declare-fun d!109385 () Bool)

(declare-fun e!493221 () Bool)

(assert (=> d!109385 e!493221))

(declare-fun res!601617 () Bool)

(assert (=> d!109385 (=> (not res!601617) (not e!493221))))

(declare-fun lt!400879 () List!17679)

(assert (=> d!109385 (= res!601617 (isStrictlySorted!485 lt!400879))))

(declare-fun e!493224 () List!17679)

(assert (=> d!109385 (= lt!400879 e!493224)))

(declare-fun c!93418 () Bool)

(assert (=> d!109385 (= c!93418 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (bvslt (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(assert (=> d!109385 (isStrictlySorted!485 (t!24947 (t!24947 l!906)))))

(assert (=> d!109385 (= (insertStrictlySorted!298 (t!24947 (t!24947 l!906)) key1!49 v2!16) lt!400879)))

(declare-fun bm!39201 () Bool)

(declare-fun call!39205 () List!17679)

(declare-fun call!39206 () List!17679)

(assert (=> bm!39201 (= call!39205 call!39206)))

(declare-fun b!886136 () Bool)

(assert (=> b!886136 (= e!493221 (contains!4271 lt!400879 (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!886137 () Bool)

(declare-fun c!93420 () Bool)

(assert (=> b!886137 (= c!93420 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (bvsgt (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(declare-fun e!493220 () List!17679)

(declare-fun e!493222 () List!17679)

(assert (=> b!886137 (= e!493220 e!493222)))

(declare-fun bm!39202 () Bool)

(declare-fun call!39204 () List!17679)

(assert (=> bm!39202 (= call!39204 call!39205)))

(declare-fun b!886138 () Bool)

(assert (=> b!886138 (= e!493220 call!39205)))

(declare-fun b!886139 () Bool)

(declare-fun e!493223 () List!17679)

(assert (=> b!886139 (= e!493223 (insertStrictlySorted!298 (t!24947 (t!24947 (t!24947 l!906))) key1!49 v2!16))))

(declare-fun b!886140 () Bool)

(assert (=> b!886140 (= e!493222 call!39204)))

(declare-fun c!93419 () Bool)

(declare-fun b!886141 () Bool)

(assert (=> b!886141 (= e!493223 (ite c!93419 (t!24947 (t!24947 (t!24947 l!906))) (ite c!93420 (Cons!17675 (h!18806 (t!24947 (t!24947 l!906))) (t!24947 (t!24947 (t!24947 l!906)))) Nil!17676)))))

(declare-fun b!886142 () Bool)

(assert (=> b!886142 (= e!493224 e!493220)))

(assert (=> b!886142 (= c!93419 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (= (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(declare-fun b!886143 () Bool)

(assert (=> b!886143 (= e!493224 call!39206)))

(declare-fun bm!39203 () Bool)

(assert (=> bm!39203 (= call!39206 ($colon$colon!548 e!493223 (ite c!93418 (h!18806 (t!24947 (t!24947 l!906))) (tuple2!11925 key1!49 v2!16))))))

(declare-fun c!93421 () Bool)

(assert (=> bm!39203 (= c!93421 c!93418)))

(declare-fun b!886144 () Bool)

(assert (=> b!886144 (= e!493222 call!39204)))

(declare-fun b!886145 () Bool)

(declare-fun res!601616 () Bool)

(assert (=> b!886145 (=> (not res!601616) (not e!493221))))

(assert (=> b!886145 (= res!601616 (containsKey!412 lt!400879 key1!49))))

(assert (= (and d!109385 c!93418) b!886143))

(assert (= (and d!109385 (not c!93418)) b!886142))

(assert (= (and b!886142 c!93419) b!886138))

(assert (= (and b!886142 (not c!93419)) b!886137))

(assert (= (and b!886137 c!93420) b!886140))

(assert (= (and b!886137 (not c!93420)) b!886144))

(assert (= (or b!886140 b!886144) bm!39202))

(assert (= (or b!886138 bm!39202) bm!39201))

(assert (= (or b!886143 bm!39201) bm!39203))

(assert (= (and bm!39203 c!93421) b!886139))

(assert (= (and bm!39203 (not c!93421)) b!886141))

(assert (= (and d!109385 res!601617) b!886145))

(assert (= (and b!886145 res!601616) b!886136))

(declare-fun m!825467 () Bool)

(assert (=> d!109385 m!825467))

(assert (=> d!109385 m!825215))

(declare-fun m!825469 () Bool)

(assert (=> b!886136 m!825469))

(declare-fun m!825471 () Bool)

(assert (=> b!886139 m!825471))

(declare-fun m!825473 () Bool)

(assert (=> bm!39203 m!825473))

(declare-fun m!825475 () Bool)

(assert (=> b!886145 m!825475))

(assert (=> b!885959 d!109385))

(declare-fun d!109387 () Bool)

(declare-fun res!601618 () Bool)

(declare-fun e!493225 () Bool)

(assert (=> d!109387 (=> res!601618 e!493225)))

(assert (=> d!109387 (= res!601618 (or ((_ is Nil!17676) lt!400862) ((_ is Nil!17676) (t!24947 lt!400862))))))

(assert (=> d!109387 (= (isStrictlySorted!485 lt!400862) e!493225)))

(declare-fun b!886146 () Bool)

(declare-fun e!493226 () Bool)

(assert (=> b!886146 (= e!493225 e!493226)))

(declare-fun res!601619 () Bool)

(assert (=> b!886146 (=> (not res!601619) (not e!493226))))

(assert (=> b!886146 (= res!601619 (bvslt (_1!5973 (h!18806 lt!400862)) (_1!5973 (h!18806 (t!24947 lt!400862)))))))

(declare-fun b!886147 () Bool)

(assert (=> b!886147 (= e!493226 (isStrictlySorted!485 (t!24947 lt!400862)))))

(assert (= (and d!109387 (not res!601618)) b!886146))

(assert (= (and b!886146 res!601619) b!886147))

(declare-fun m!825477 () Bool)

(assert (=> b!886147 m!825477))

(assert (=> d!109335 d!109387))

(assert (=> d!109335 d!109299))

(declare-fun lt!400880 () Bool)

(declare-fun d!109389 () Bool)

(assert (=> d!109389 (= lt!400880 (select (content!392 lt!400861) (tuple2!11925 key1!49 v2!16)))))

(declare-fun e!493228 () Bool)

(assert (=> d!109389 (= lt!400880 e!493228)))

(declare-fun res!601621 () Bool)

(assert (=> d!109389 (=> (not res!601621) (not e!493228))))

(assert (=> d!109389 (= res!601621 ((_ is Cons!17675) lt!400861))))

(assert (=> d!109389 (= (contains!4271 lt!400861 (tuple2!11925 key1!49 v2!16)) lt!400880)))

(declare-fun b!886148 () Bool)

(declare-fun e!493227 () Bool)

(assert (=> b!886148 (= e!493228 e!493227)))

(declare-fun res!601620 () Bool)

(assert (=> b!886148 (=> res!601620 e!493227)))

(assert (=> b!886148 (= res!601620 (= (h!18806 lt!400861) (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!886149 () Bool)

(assert (=> b!886149 (= e!493227 (contains!4271 (t!24947 lt!400861) (tuple2!11925 key1!49 v2!16)))))

(assert (= (and d!109389 res!601621) b!886148))

(assert (= (and b!886148 (not res!601620)) b!886149))

(declare-fun m!825479 () Bool)

(assert (=> d!109389 m!825479))

(declare-fun m!825481 () Bool)

(assert (=> d!109389 m!825481))

(declare-fun m!825483 () Bool)

(assert (=> b!886149 m!825483))

(assert (=> b!885942 d!109389))

(declare-fun d!109391 () Bool)

(assert (=> d!109391 (= ($colon$colon!548 e!493130 (ite c!93374 (h!18806 l!906) (tuple2!11925 key1!49 v2!16))) (Cons!17675 (ite c!93374 (h!18806 l!906) (tuple2!11925 key1!49 v2!16)) e!493130))))

(assert (=> bm!39170 d!109391))

(declare-fun d!109393 () Bool)

(assert (=> d!109393 (= ($colon$colon!548 e!493123 (ite c!93370 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v1!38))) (Cons!17675 (ite c!93370 (h!18806 (t!24947 l!906)) (tuple2!11925 key1!49 v1!38)) e!493123))))

(assert (=> bm!39167 d!109393))

(declare-fun d!109395 () Bool)

(declare-fun res!601624 () Bool)

(declare-fun e!493231 () Bool)

(assert (=> d!109395 (=> res!601624 e!493231)))

(assert (=> d!109395 (= res!601624 (or ((_ is Nil!17676) lt!400865) ((_ is Nil!17676) (t!24947 lt!400865))))))

(assert (=> d!109395 (= (isStrictlySorted!485 lt!400865) e!493231)))

(declare-fun b!886152 () Bool)

(declare-fun e!493232 () Bool)

(assert (=> b!886152 (= e!493231 e!493232)))

(declare-fun res!601625 () Bool)

(assert (=> b!886152 (=> (not res!601625) (not e!493232))))

(assert (=> b!886152 (= res!601625 (bvslt (_1!5973 (h!18806 lt!400865)) (_1!5973 (h!18806 (t!24947 lt!400865)))))))

(declare-fun b!886153 () Bool)

(assert (=> b!886153 (= e!493232 (isStrictlySorted!485 (t!24947 lt!400865)))))

(assert (= (and d!109395 (not res!601624)) b!886152))

(assert (= (and b!886152 res!601625) b!886153))

(declare-fun m!825487 () Bool)

(assert (=> b!886153 m!825487))

(assert (=> d!109341 d!109395))

(assert (=> d!109341 d!109303))

(declare-fun d!109399 () Bool)

(declare-fun lt!400881 () Bool)

(assert (=> d!109399 (= lt!400881 (select (content!392 lt!400864) (tuple2!11925 key1!49 v2!16)))))

(declare-fun e!493234 () Bool)

(assert (=> d!109399 (= lt!400881 e!493234)))

(declare-fun res!601627 () Bool)

(assert (=> d!109399 (=> (not res!601627) (not e!493234))))

(assert (=> d!109399 (= res!601627 ((_ is Cons!17675) lt!400864))))

(assert (=> d!109399 (= (contains!4271 lt!400864 (tuple2!11925 key1!49 v2!16)) lt!400881)))

(declare-fun b!886154 () Bool)

(declare-fun e!493233 () Bool)

(assert (=> b!886154 (= e!493234 e!493233)))

(declare-fun res!601626 () Bool)

(assert (=> b!886154 (=> res!601626 e!493233)))

(assert (=> b!886154 (= res!601626 (= (h!18806 lt!400864) (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!886155 () Bool)

(assert (=> b!886155 (= e!493233 (contains!4271 (t!24947 lt!400864) (tuple2!11925 key1!49 v2!16)))))

(assert (= (and d!109399 res!601627) b!886154))

(assert (= (and b!886154 (not res!601626)) b!886155))

(declare-fun m!825489 () Bool)

(assert (=> d!109399 m!825489))

(declare-fun m!825491 () Bool)

(assert (=> d!109399 m!825491))

(declare-fun m!825493 () Bool)

(assert (=> b!886155 m!825493))

(assert (=> b!885984 d!109399))

(declare-fun d!109401 () Bool)

(declare-fun res!601628 () Bool)

(declare-fun e!493235 () Bool)

(assert (=> d!109401 (=> res!601628 e!493235)))

(assert (=> d!109401 (= res!601628 (or ((_ is Nil!17676) lt!400858) ((_ is Nil!17676) (t!24947 lt!400858))))))

(assert (=> d!109401 (= (isStrictlySorted!485 lt!400858) e!493235)))

(declare-fun b!886156 () Bool)

(declare-fun e!493236 () Bool)

(assert (=> b!886156 (= e!493235 e!493236)))

(declare-fun res!601629 () Bool)

(assert (=> b!886156 (=> (not res!601629) (not e!493236))))

(assert (=> b!886156 (= res!601629 (bvslt (_1!5973 (h!18806 lt!400858)) (_1!5973 (h!18806 (t!24947 lt!400858)))))))

(declare-fun b!886157 () Bool)

(assert (=> b!886157 (= e!493236 (isStrictlySorted!485 (t!24947 lt!400858)))))

(assert (= (and d!109401 (not res!601628)) b!886156))

(assert (= (and b!886156 res!601629) b!886157))

(declare-fun m!825495 () Bool)

(assert (=> b!886157 m!825495))

(assert (=> d!109311 d!109401))

(declare-fun d!109403 () Bool)

(declare-fun res!601630 () Bool)

(declare-fun e!493237 () Bool)

(assert (=> d!109403 (=> res!601630 e!493237)))

(assert (=> d!109403 (= res!601630 (or ((_ is Nil!17676) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) ((_ is Nil!17676) (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)))))))

(assert (=> d!109403 (= (isStrictlySorted!485 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) e!493237)))

(declare-fun b!886158 () Bool)

(declare-fun e!493238 () Bool)

(assert (=> b!886158 (= e!493237 e!493238)))

(declare-fun res!601631 () Bool)

(assert (=> b!886158 (=> (not res!601631) (not e!493238))))

(assert (=> b!886158 (= res!601631 (bvslt (_1!5973 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))) (_1!5973 (h!18806 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))))))))

(declare-fun b!886159 () Bool)

(assert (=> b!886159 (= e!493238 (isStrictlySorted!485 (t!24947 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38))))))

(assert (= (and d!109403 (not res!601630)) b!886158))

(assert (= (and b!886158 res!601631) b!886159))

(assert (=> b!886159 m!825411))

(assert (=> d!109311 d!109403))

(declare-fun d!109405 () Bool)

(declare-fun res!601632 () Bool)

(declare-fun e!493239 () Bool)

(assert (=> d!109405 (=> res!601632 e!493239)))

(assert (=> d!109405 (= res!601632 (or ((_ is Nil!17676) lt!400864) ((_ is Nil!17676) (t!24947 lt!400864))))))

(assert (=> d!109405 (= (isStrictlySorted!485 lt!400864) e!493239)))

(declare-fun b!886160 () Bool)

(declare-fun e!493240 () Bool)

(assert (=> b!886160 (= e!493239 e!493240)))

(declare-fun res!601633 () Bool)

(assert (=> b!886160 (=> (not res!601633) (not e!493240))))

(assert (=> b!886160 (= res!601633 (bvslt (_1!5973 (h!18806 lt!400864)) (_1!5973 (h!18806 (t!24947 lt!400864)))))))

(declare-fun b!886161 () Bool)

(assert (=> b!886161 (= e!493240 (isStrictlySorted!485 (t!24947 lt!400864)))))

(assert (= (and d!109405 (not res!601632)) b!886160))

(assert (= (and b!886160 res!601633) b!886161))

(declare-fun m!825497 () Bool)

(assert (=> b!886161 m!825497))

(assert (=> d!109339 d!109405))

(assert (=> d!109339 d!109303))

(declare-fun d!109407 () Bool)

(declare-fun res!601634 () Bool)

(declare-fun e!493241 () Bool)

(assert (=> d!109407 (=> res!601634 e!493241)))

(assert (=> d!109407 (= res!601634 (and ((_ is Cons!17675) lt!400863) (= (_1!5973 (h!18806 lt!400863)) key1!49)))))

(assert (=> d!109407 (= (containsKey!412 lt!400863 key1!49) e!493241)))

(declare-fun b!886162 () Bool)

(declare-fun e!493242 () Bool)

(assert (=> b!886162 (= e!493241 e!493242)))

(declare-fun res!601635 () Bool)

(assert (=> b!886162 (=> (not res!601635) (not e!493242))))

(assert (=> b!886162 (= res!601635 (and (or (not ((_ is Cons!17675) lt!400863)) (bvsle (_1!5973 (h!18806 lt!400863)) key1!49)) ((_ is Cons!17675) lt!400863) (bvslt (_1!5973 (h!18806 lt!400863)) key1!49)))))

(declare-fun b!886163 () Bool)

(assert (=> b!886163 (= e!493242 (containsKey!412 (t!24947 lt!400863) key1!49))))

(assert (= (and d!109407 (not res!601634)) b!886162))

(assert (= (and b!886162 res!601635) b!886163))

(declare-fun m!825499 () Bool)

(assert (=> b!886163 m!825499))

(assert (=> b!885979 d!109407))

(declare-fun d!109409 () Bool)

(assert (=> d!109409 (= ($colon$colon!548 e!493135 (ite c!93378 (h!18806 l!906) (tuple2!11925 key1!49 v1!38))) (Cons!17675 (ite c!93378 (h!18806 l!906) (tuple2!11925 key1!49 v1!38)) e!493135))))

(assert (=> bm!39173 d!109409))

(declare-fun d!109411 () Bool)

(declare-fun lt!400882 () Bool)

(assert (=> d!109411 (= lt!400882 (select (content!392 lt!400862) (tuple2!11925 key1!49 v2!16)))))

(declare-fun e!493244 () Bool)

(assert (=> d!109411 (= lt!400882 e!493244)))

(declare-fun res!601637 () Bool)

(assert (=> d!109411 (=> (not res!601637) (not e!493244))))

(assert (=> d!109411 (= res!601637 ((_ is Cons!17675) lt!400862))))

(assert (=> d!109411 (= (contains!4271 lt!400862 (tuple2!11925 key1!49 v2!16)) lt!400882)))

(declare-fun b!886164 () Bool)

(declare-fun e!493243 () Bool)

(assert (=> b!886164 (= e!493244 e!493243)))

(declare-fun res!601636 () Bool)

(assert (=> b!886164 (=> res!601636 e!493243)))

(assert (=> b!886164 (= res!601636 (= (h!18806 lt!400862) (tuple2!11925 key1!49 v2!16)))))

(declare-fun b!886165 () Bool)

(assert (=> b!886165 (= e!493243 (contains!4271 (t!24947 lt!400862) (tuple2!11925 key1!49 v2!16)))))

(assert (= (and d!109411 res!601637) b!886164))

(assert (= (and b!886164 (not res!601636)) b!886165))

(declare-fun m!825501 () Bool)

(assert (=> d!109411 m!825501))

(declare-fun m!825503 () Bool)

(assert (=> d!109411 m!825503))

(declare-fun m!825505 () Bool)

(assert (=> b!886165 m!825505))

(assert (=> b!885956 d!109411))

(assert (=> b!885987 d!109335))

(assert (=> b!885802 d!109299))

(declare-fun d!109413 () Bool)

(declare-fun lt!400883 () Bool)

(assert (=> d!109413 (= lt!400883 (select (content!392 lt!400865) (tuple2!11925 key1!49 v1!38)))))

(declare-fun e!493246 () Bool)

(assert (=> d!109413 (= lt!400883 e!493246)))

(declare-fun res!601639 () Bool)

(assert (=> d!109413 (=> (not res!601639) (not e!493246))))

(assert (=> d!109413 (= res!601639 ((_ is Cons!17675) lt!400865))))

(assert (=> d!109413 (= (contains!4271 lt!400865 (tuple2!11925 key1!49 v1!38)) lt!400883)))

(declare-fun b!886166 () Bool)

(declare-fun e!493245 () Bool)

(assert (=> b!886166 (= e!493246 e!493245)))

(declare-fun res!601638 () Bool)

(assert (=> b!886166 (=> res!601638 e!493245)))

(assert (=> b!886166 (= res!601638 (= (h!18806 lt!400865) (tuple2!11925 key1!49 v1!38)))))

(declare-fun b!886167 () Bool)

(assert (=> b!886167 (= e!493245 (contains!4271 (t!24947 lt!400865) (tuple2!11925 key1!49 v1!38)))))

(assert (= (and d!109413 res!601639) b!886166))

(assert (= (and b!886166 (not res!601638)) b!886167))

(declare-fun m!825507 () Bool)

(assert (=> d!109413 m!825507))

(declare-fun m!825509 () Bool)

(assert (=> d!109413 m!825509))

(declare-fun m!825511 () Bool)

(assert (=> b!886167 m!825511))

(assert (=> b!885994 d!109413))

(declare-fun d!109415 () Bool)

(assert (=> d!109415 (= ($colon$colon!548 e!493097 (ite c!93350 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (tuple2!11925 key1!49 v2!16))) (Cons!17675 (ite c!93350 (h!18806 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38)) (tuple2!11925 key1!49 v2!16)) e!493097))))

(assert (=> bm!39152 d!109415))

(declare-fun d!109417 () Bool)

(declare-fun res!601640 () Bool)

(declare-fun e!493247 () Bool)

(assert (=> d!109417 (=> res!601640 e!493247)))

(assert (=> d!109417 (= res!601640 (and ((_ is Cons!17675) lt!400858) (= (_1!5973 (h!18806 lt!400858)) key1!49)))))

(assert (=> d!109417 (= (containsKey!412 lt!400858 key1!49) e!493247)))

(declare-fun b!886168 () Bool)

(declare-fun e!493248 () Bool)

(assert (=> b!886168 (= e!493247 e!493248)))

(declare-fun res!601641 () Bool)

(assert (=> b!886168 (=> (not res!601641) (not e!493248))))

(assert (=> b!886168 (= res!601641 (and (or (not ((_ is Cons!17675) lt!400858)) (bvsle (_1!5973 (h!18806 lt!400858)) key1!49)) ((_ is Cons!17675) lt!400858) (bvslt (_1!5973 (h!18806 lt!400858)) key1!49)))))

(declare-fun b!886169 () Bool)

(assert (=> b!886169 (= e!493248 (containsKey!412 (t!24947 lt!400858) key1!49))))

(assert (= (and d!109417 (not res!601640)) b!886168))

(assert (= (and b!886168 res!601641) b!886169))

(declare-fun m!825513 () Bool)

(assert (=> b!886169 m!825513))

(assert (=> b!885928 d!109417))

(declare-fun d!109419 () Bool)

(declare-fun e!493254 () Bool)

(assert (=> d!109419 e!493254))

(declare-fun res!601647 () Bool)

(assert (=> d!109419 (=> (not res!601647) (not e!493254))))

(declare-fun lt!400886 () List!17679)

(assert (=> d!109419 (= res!601647 (isStrictlySorted!485 lt!400886))))

(declare-fun e!493257 () List!17679)

(assert (=> d!109419 (= lt!400886 e!493257)))

(declare-fun c!93422 () Bool)

(assert (=> d!109419 (= c!93422 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (bvslt (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(assert (=> d!109419 (isStrictlySorted!485 (t!24947 (t!24947 l!906)))))

(assert (=> d!109419 (= (insertStrictlySorted!298 (t!24947 (t!24947 l!906)) key1!49 v1!38) lt!400886)))

(declare-fun bm!39204 () Bool)

(declare-fun call!39208 () List!17679)

(declare-fun call!39209 () List!17679)

(assert (=> bm!39204 (= call!39208 call!39209)))

(declare-fun b!886174 () Bool)

(assert (=> b!886174 (= e!493254 (contains!4271 lt!400886 (tuple2!11925 key1!49 v1!38)))))

(declare-fun b!886175 () Bool)

(declare-fun c!93424 () Bool)

(assert (=> b!886175 (= c!93424 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (bvsgt (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(declare-fun e!493253 () List!17679)

(declare-fun e!493255 () List!17679)

(assert (=> b!886175 (= e!493253 e!493255)))

(declare-fun bm!39205 () Bool)

(declare-fun call!39207 () List!17679)

(assert (=> bm!39205 (= call!39207 call!39208)))

(declare-fun b!886176 () Bool)

(assert (=> b!886176 (= e!493253 call!39208)))

(declare-fun e!493256 () List!17679)

(declare-fun b!886177 () Bool)

(assert (=> b!886177 (= e!493256 (insertStrictlySorted!298 (t!24947 (t!24947 (t!24947 l!906))) key1!49 v1!38))))

(declare-fun b!886178 () Bool)

(assert (=> b!886178 (= e!493255 call!39207)))

(declare-fun b!886179 () Bool)

(declare-fun c!93423 () Bool)

(assert (=> b!886179 (= e!493256 (ite c!93423 (t!24947 (t!24947 (t!24947 l!906))) (ite c!93424 (Cons!17675 (h!18806 (t!24947 (t!24947 l!906))) (t!24947 (t!24947 (t!24947 l!906)))) Nil!17676)))))

(declare-fun b!886180 () Bool)

(assert (=> b!886180 (= e!493257 e!493253)))

(assert (=> b!886180 (= c!93423 (and ((_ is Cons!17675) (t!24947 (t!24947 l!906))) (= (_1!5973 (h!18806 (t!24947 (t!24947 l!906)))) key1!49)))))

(declare-fun b!886181 () Bool)

(assert (=> b!886181 (= e!493257 call!39209)))

(declare-fun bm!39206 () Bool)

(assert (=> bm!39206 (= call!39209 ($colon$colon!548 e!493256 (ite c!93422 (h!18806 (t!24947 (t!24947 l!906))) (tuple2!11925 key1!49 v1!38))))))

(declare-fun c!93425 () Bool)

(assert (=> bm!39206 (= c!93425 c!93422)))

(declare-fun b!886182 () Bool)

(assert (=> b!886182 (= e!493255 call!39207)))

(declare-fun b!886183 () Bool)

(declare-fun res!601646 () Bool)

(assert (=> b!886183 (=> (not res!601646) (not e!493254))))

(assert (=> b!886183 (= res!601646 (containsKey!412 lt!400886 key1!49))))

(assert (= (and d!109419 c!93422) b!886181))

(assert (= (and d!109419 (not c!93422)) b!886180))

(assert (= (and b!886180 c!93423) b!886176))

(assert (= (and b!886180 (not c!93423)) b!886175))

(assert (= (and b!886175 c!93424) b!886178))

(assert (= (and b!886175 (not c!93424)) b!886182))

(assert (= (or b!886178 b!886182) bm!39205))

(assert (= (or b!886176 bm!39205) bm!39204))

(assert (= (or b!886181 bm!39204) bm!39206))

(assert (= (and bm!39206 c!93425) b!886177))

(assert (= (and bm!39206 (not c!93425)) b!886179))

(assert (= (and d!109419 res!601647) b!886183))

(assert (= (and b!886183 res!601646) b!886174))

(declare-fun m!825515 () Bool)

(assert (=> d!109419 m!825515))

(assert (=> d!109419 m!825215))

(declare-fun m!825517 () Bool)

(assert (=> b!886174 m!825517))

(declare-fun m!825519 () Bool)

(assert (=> b!886177 m!825519))

(declare-fun m!825521 () Bool)

(assert (=> bm!39206 m!825521))

(declare-fun m!825523 () Bool)

(assert (=> b!886183 m!825523))

(assert (=> b!885973 d!109419))

(declare-fun d!109421 () Bool)

(declare-fun res!601648 () Bool)

(declare-fun e!493258 () Bool)

(assert (=> d!109421 (=> res!601648 e!493258)))

(assert (=> d!109421 (= res!601648 (or ((_ is Nil!17676) lt!400863) ((_ is Nil!17676) (t!24947 lt!400863))))))

(assert (=> d!109421 (= (isStrictlySorted!485 lt!400863) e!493258)))

(declare-fun b!886184 () Bool)

(declare-fun e!493259 () Bool)

(assert (=> b!886184 (= e!493258 e!493259)))

(declare-fun res!601649 () Bool)

(assert (=> b!886184 (=> (not res!601649) (not e!493259))))

(assert (=> b!886184 (= res!601649 (bvslt (_1!5973 (h!18806 lt!400863)) (_1!5973 (h!18806 (t!24947 lt!400863)))))))

(declare-fun b!886185 () Bool)

(assert (=> b!886185 (= e!493259 (isStrictlySorted!485 (t!24947 lt!400863)))))

(assert (= (and d!109421 (not res!601648)) b!886184))

(assert (= (and b!886184 res!601649) b!886185))

(declare-fun m!825525 () Bool)

(assert (=> b!886185 m!825525))

(assert (=> d!109337 d!109421))

(assert (=> d!109337 d!109299))

(assert (=> d!109305 d!109311))

(assert (=> d!109305 d!109299))

(assert (=> d!109305 d!109335))

(assert (=> d!109305 d!109337))

(declare-fun d!109423 () Bool)

(assert (=> d!109423 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24947 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24947 l!906) key1!49 v2!16))))

(assert (=> d!109423 true))

(declare-fun _$8!133 () Unit!30182)

(assert (=> d!109423 (= (choose!1460 (t!24947 l!906) key1!49 v1!38 v2!16) _$8!133)))

(declare-fun bs!24819 () Bool)

(assert (= bs!24819 d!109423))

(assert (=> bs!24819 m!825165))

(assert (=> bs!24819 m!825165))

(assert (=> bs!24819 m!825167))

(assert (=> bs!24819 m!825175))

(assert (=> d!109305 d!109423))

(declare-fun d!109429 () Bool)

(assert (=> d!109429 (= ($colon$colon!548 e!493109 (ite c!93356 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11925 key1!49 v2!16))) (Cons!17675 (ite c!93356 (h!18806 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11925 key1!49 v2!16)) e!493109))))

(assert (=> bm!39155 d!109429))

(assert (=> b!885997 d!109337))

(declare-fun d!109431 () Bool)

(declare-fun res!601656 () Bool)

(declare-fun e!493269 () Bool)

(assert (=> d!109431 (=> res!601656 e!493269)))

(assert (=> d!109431 (= res!601656 (and ((_ is Cons!17675) lt!400861) (= (_1!5973 (h!18806 lt!400861)) key1!49)))))

(assert (=> d!109431 (= (containsKey!412 lt!400861 key1!49) e!493269)))

(declare-fun b!886200 () Bool)

(declare-fun e!493270 () Bool)

(assert (=> b!886200 (= e!493269 e!493270)))

(declare-fun res!601657 () Bool)

(assert (=> b!886200 (=> (not res!601657) (not e!493270))))

(assert (=> b!886200 (= res!601657 (and (or (not ((_ is Cons!17675) lt!400861)) (bvsle (_1!5973 (h!18806 lt!400861)) key1!49)) ((_ is Cons!17675) lt!400861) (bvslt (_1!5973 (h!18806 lt!400861)) key1!49)))))

(declare-fun b!886201 () Bool)

(assert (=> b!886201 (= e!493270 (containsKey!412 (t!24947 lt!400861) key1!49))))

(assert (= (and d!109431 (not res!601656)) b!886200))

(assert (= (and b!886200 res!601657) b!886201))

(declare-fun m!825539 () Bool)

(assert (=> b!886201 m!825539))

(assert (=> b!885951 d!109431))

(declare-fun b!886202 () Bool)

(declare-fun e!493271 () Bool)

(declare-fun tp!54382 () Bool)

(assert (=> b!886202 (= e!493271 (and tp_is_empty!17809 tp!54382))))

(assert (=> b!886018 (= tp!54378 e!493271)))

(assert (= (and b!886018 ((_ is Cons!17675) (t!24947 (t!24947 l!906)))) b!886202))

(check-sat (not bm!39203) (not d!109389) (not b!886201) (not b!886167) (not b!886153) (not b!886123) (not b!886133) (not b!886177) (not b!886090) (not b!886163) (not b!886129) (not d!109363) (not d!109379) (not bm!39194) (not d!109399) (not b!886145) (not b!886139) (not b!886121) (not d!109411) (not b!886089) (not b!886136) (not b!886099) tp_is_empty!17809 (not d!109423) (not d!109361) (not bm!39197) (not b!886174) (not b!886083) (not d!109413) (not b!886127) (not b!886093) (not d!109385) (not d!109419) (not b!886161) (not b!886155) (not bm!39206) (not b!886125) (not b!886185) (not d!109355) (not b!886147) (not b!886080) (not b!886165) (not b!886119) (not b!886183) (not b!886157) (not b!886079) (not b!886202) (not b!886149) (not b!886159) (not b!886169))
(check-sat)
