; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85022 () Bool)

(assert start!85022)

(declare-fun res!663278 () Bool)

(declare-fun e!559811 () Bool)

(assert (=> start!85022 (=> (not res!663278) (not e!559811))))

(declare-datatypes ((List!20884 0))(
  ( (Nil!20881) (Cons!20880 (h!22042 (_ BitVec 64)) (t!29873 List!20884)) )
))
(declare-fun tail!21 () List!20884)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5745 (List!20884 (_ BitVec 64)) Bool)

(assert (=> start!85022 (= res!663278 (not (contains!5745 tail!21 head!726)))))

(assert (=> start!85022 e!559811))

(assert (=> start!85022 true))

(declare-fun b!992359 () Bool)

(declare-fun res!663279 () Bool)

(assert (=> b!992359 (=> (not res!663279) (not e!559811))))

(declare-fun content!439 (List!20884) (Set (_ BitVec 64)))

(assert (=> b!992359 (= res!663279 (not (set.member head!726 (content!439 tail!21))))))

(declare-fun e!559810 () Bool)

(declare-fun lt!440147 () List!20884)

(declare-fun b!992362 () Bool)

(declare-fun -!441 (List!20884 (_ BitVec 64)) List!20884)

(assert (=> b!992362 (= e!559810 (not (= (-!441 lt!440147 head!726) tail!21)))))

(declare-datatypes ((tuple2!14952 0))(
  ( (tuple2!14953 (_1!7487 (_ BitVec 64)) (_2!7487 List!20884)) )
))
(declare-fun lt!440148 () tuple2!14952)

(assert (=> b!992362 (= (-!441 (_2!7487 lt!440148) head!726) (_2!7487 lt!440148))))

(declare-datatypes ((Unit!32904 0))(
  ( (Unit!32905) )
))
(declare-fun lt!440146 () Unit!32904)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20884) Unit!32904)

(assert (=> b!992362 (= lt!440146 (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7487 lt!440148)))))

(declare-fun b!992361 () Bool)

(declare-fun e!559812 () Bool)

(assert (=> b!992361 (= e!559812 e!559810)))

(declare-fun res!663277 () Bool)

(assert (=> b!992361 (=> (not res!663277) (not e!559810))))

(assert (=> b!992361 (= res!663277 (not (contains!5745 (_2!7487 lt!440148) head!726)))))

(declare-datatypes ((Option!531 0))(
  ( (Some!530 (v!14334 tuple2!14952)) (None!529) )
))
(declare-fun lt!440149 () Option!531)

(declare-fun get!15693 (Option!531) tuple2!14952)

(assert (=> b!992361 (= lt!440148 (get!15693 lt!440149))))

(declare-fun b!992360 () Bool)

(assert (=> b!992360 (= e!559811 e!559812)))

(declare-fun res!663276 () Bool)

(assert (=> b!992360 (=> (not res!663276) (not e!559812))))

(declare-fun isEmpty!738 (Option!531) Bool)

(assert (=> b!992360 (= res!663276 (not (isEmpty!738 lt!440149)))))

(declare-fun unapply!10 (List!20884) Option!531)

(assert (=> b!992360 (= lt!440149 (unapply!10 lt!440147))))

(declare-fun $colon$colon!567 (List!20884 (_ BitVec 64)) List!20884)

(assert (=> b!992360 (= lt!440147 ($colon$colon!567 tail!21 head!726))))

(assert (= (and start!85022 res!663278) b!992359))

(assert (= (and b!992359 res!663279) b!992360))

(assert (= (and b!992360 res!663276) b!992361))

(assert (= (and b!992361 res!663277) b!992362))

(declare-fun m!920065 () Bool)

(assert (=> b!992362 m!920065))

(declare-fun m!920067 () Bool)

(assert (=> b!992362 m!920067))

(declare-fun m!920069 () Bool)

(assert (=> b!992362 m!920069))

(declare-fun m!920071 () Bool)

(assert (=> b!992361 m!920071))

(declare-fun m!920073 () Bool)

(assert (=> b!992361 m!920073))

(declare-fun m!920075 () Bool)

(assert (=> start!85022 m!920075))

(declare-fun m!920077 () Bool)

(assert (=> b!992360 m!920077))

(declare-fun m!920079 () Bool)

(assert (=> b!992360 m!920079))

(declare-fun m!920081 () Bool)

(assert (=> b!992360 m!920081))

(declare-fun m!920083 () Bool)

(assert (=> b!992359 m!920083))

(declare-fun m!920085 () Bool)

(assert (=> b!992359 m!920085))

(push 1)

(assert (not b!992361))

(assert (not b!992362))

(assert (not b!992360))

(assert (not start!85022))

(assert (not b!992359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118121 () Bool)

(declare-fun lt!440182 () Bool)

(assert (=> d!118121 (= lt!440182 (set.member head!726 (content!439 (_2!7487 lt!440148))))))

(declare-fun e!559847 () Bool)

(assert (=> d!118121 (= lt!440182 e!559847)))

(declare-fun res!663320 () Bool)

(assert (=> d!118121 (=> (not res!663320) (not e!559847))))

(assert (=> d!118121 (= res!663320 (is-Cons!20880 (_2!7487 lt!440148)))))

(assert (=> d!118121 (= (contains!5745 (_2!7487 lt!440148) head!726) lt!440182)))

(declare-fun b!992403 () Bool)

(declare-fun e!559848 () Bool)

(assert (=> b!992403 (= e!559847 e!559848)))

(declare-fun res!663321 () Bool)

(assert (=> b!992403 (=> res!663321 e!559848)))

(assert (=> b!992403 (= res!663321 (= (h!22042 (_2!7487 lt!440148)) head!726))))

(declare-fun b!992404 () Bool)

(assert (=> b!992404 (= e!559848 (contains!5745 (t!29873 (_2!7487 lt!440148)) head!726))))

(assert (= (and d!118121 res!663320) b!992403))

(assert (= (and b!992403 (not res!663321)) b!992404))

(declare-fun m!920143 () Bool)

(assert (=> d!118121 m!920143))

(declare-fun m!920145 () Bool)

(assert (=> d!118121 m!920145))

(declare-fun m!920147 () Bool)

(assert (=> b!992404 m!920147))

(assert (=> b!992361 d!118121))

(declare-fun d!118131 () Bool)

(assert (=> d!118131 (= (get!15693 lt!440149) (v!14334 lt!440149))))

(assert (=> b!992361 d!118131))

(declare-fun b!992431 () Bool)

(declare-fun e!559867 () List!20884)

(declare-fun call!42094 () List!20884)

(assert (=> b!992431 (= e!559867 call!42094)))

(declare-fun e!559868 () Bool)

(declare-fun b!992432 () Bool)

(declare-fun lt!440187 () List!20884)

(assert (=> b!992432 (= e!559868 (= (content!439 lt!440187) (set.minus (content!439 lt!440147) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!42091 () Bool)

(assert (=> bm!42091 (= call!42094 (-!441 (t!29873 lt!440147) head!726))))

(declare-fun b!992433 () Bool)

(declare-fun e!559866 () List!20884)

(assert (=> b!992433 (= e!559866 Nil!20881)))

(declare-fun b!992434 () Bool)

(assert (=> b!992434 (= e!559866 e!559867)))

(declare-fun c!100690 () Bool)

(assert (=> b!992434 (= c!100690 (= head!726 (h!22042 lt!440147)))))

(declare-fun b!992435 () Bool)

(assert (=> b!992435 (= e!559867 (Cons!20880 (h!22042 lt!440147) call!42094))))

(declare-fun d!118135 () Bool)

(assert (=> d!118135 e!559868))

(declare-fun res!663328 () Bool)

(assert (=> d!118135 (=> (not res!663328) (not e!559868))))

(declare-fun size!30684 (List!20884) Int)

(assert (=> d!118135 (= res!663328 (<= (size!30684 lt!440187) (size!30684 lt!440147)))))

(assert (=> d!118135 (= lt!440187 e!559866)))

(declare-fun c!100689 () Bool)

(assert (=> d!118135 (= c!100689 (is-Cons!20880 lt!440147))))

(assert (=> d!118135 (= (-!441 lt!440147 head!726) lt!440187)))

(assert (= (and d!118135 c!100689) b!992434))

(assert (= (and d!118135 (not c!100689)) b!992433))

(assert (= (and b!992434 c!100690) b!992431))

(assert (= (and b!992434 (not c!100690)) b!992435))

(assert (= (or b!992431 b!992435) bm!42091))

(assert (= (and d!118135 res!663328) b!992432))

(declare-fun m!920161 () Bool)

(assert (=> b!992432 m!920161))

(declare-fun m!920163 () Bool)

(assert (=> b!992432 m!920163))

(declare-fun m!920165 () Bool)

(assert (=> b!992432 m!920165))

(declare-fun m!920167 () Bool)

(assert (=> bm!42091 m!920167))

(declare-fun m!920169 () Bool)

(assert (=> d!118135 m!920169))

(declare-fun m!920171 () Bool)

(assert (=> d!118135 m!920171))

(assert (=> b!992362 d!118135))

(declare-fun b!992438 () Bool)

(declare-fun e!559871 () List!20884)

(declare-fun call!42095 () List!20884)

(assert (=> b!992438 (= e!559871 call!42095)))

(declare-fun e!559872 () Bool)

(declare-fun b!992439 () Bool)

(declare-fun lt!440190 () List!20884)

(assert (=> b!992439 (= e!559872 (= (content!439 lt!440190) (set.minus (content!439 (_2!7487 lt!440148)) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!42092 () Bool)

(assert (=> bm!42092 (= call!42095 (-!441 (t!29873 (_2!7487 lt!440148)) head!726))))

(declare-fun b!992441 () Bool)

(declare-fun e!559870 () List!20884)

(assert (=> b!992441 (= e!559870 Nil!20881)))

(declare-fun b!992443 () Bool)

(assert (=> b!992443 (= e!559870 e!559871)))

(declare-fun c!100692 () Bool)

(assert (=> b!992443 (= c!100692 (= head!726 (h!22042 (_2!7487 lt!440148))))))

(declare-fun b!992444 () Bool)

(assert (=> b!992444 (= e!559871 (Cons!20880 (h!22042 (_2!7487 lt!440148)) call!42095))))

(declare-fun d!118155 () Bool)

(assert (=> d!118155 e!559872))

(declare-fun res!663329 () Bool)

(assert (=> d!118155 (=> (not res!663329) (not e!559872))))

(assert (=> d!118155 (= res!663329 (<= (size!30684 lt!440190) (size!30684 (_2!7487 lt!440148))))))

(assert (=> d!118155 (= lt!440190 e!559870)))

(declare-fun c!100691 () Bool)

(assert (=> d!118155 (= c!100691 (is-Cons!20880 (_2!7487 lt!440148)))))

(assert (=> d!118155 (= (-!441 (_2!7487 lt!440148) head!726) lt!440190)))

(assert (= (and d!118155 c!100691) b!992443))

(assert (= (and d!118155 (not c!100691)) b!992441))

(assert (= (and b!992443 c!100692) b!992438))

(assert (= (and b!992443 (not c!100692)) b!992444))

(assert (= (or b!992438 b!992444) bm!42092))

(assert (= (and d!118155 res!663329) b!992439))

(declare-fun m!920173 () Bool)

(assert (=> b!992439 m!920173))

(assert (=> b!992439 m!920143))

(assert (=> b!992439 m!920165))

(declare-fun m!920175 () Bool)

(assert (=> bm!42092 m!920175))

(declare-fun m!920177 () Bool)

(assert (=> d!118155 m!920177))

(declare-fun m!920179 () Bool)

(assert (=> d!118155 m!920179))

(assert (=> b!992362 d!118155))

(declare-fun d!118157 () Bool)

(assert (=> d!118157 (= (-!441 (_2!7487 lt!440148) head!726) (_2!7487 lt!440148))))

(declare-fun lt!440195 () Unit!32904)

(declare-fun choose!48 ((_ BitVec 64) List!20884) Unit!32904)

(assert (=> d!118157 (= lt!440195 (choose!48 head!726 (_2!7487 lt!440148)))))

(assert (=> d!118157 (not (contains!5745 (_2!7487 lt!440148) head!726))))

(assert (=> d!118157 (= (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7487 lt!440148)) lt!440195)))

(declare-fun bs!28222 () Bool)

(assert (= bs!28222 d!118157))

(assert (=> bs!28222 m!920067))

(declare-fun m!920181 () Bool)

(assert (=> bs!28222 m!920181))

(assert (=> bs!28222 m!920071))

(assert (=> b!992362 d!118157))

(declare-fun d!118159 () Bool)

(declare-fun lt!440197 () Bool)

(assert (=> d!118159 (= lt!440197 (set.member head!726 (content!439 tail!21)))))

(declare-fun e!559890 () Bool)

(assert (=> d!118159 (= lt!440197 e!559890)))

(declare-fun res!663335 () Bool)

(assert (=> d!118159 (=> (not res!663335) (not e!559890))))

(assert (=> d!118159 (= res!663335 (is-Cons!20880 tail!21))))

(assert (=> d!118159 (= (contains!5745 tail!21 head!726) lt!440197)))

(declare-fun b!992466 () Bool)

(declare-fun e!559891 () Bool)

(assert (=> b!992466 (= e!559890 e!559891)))

(declare-fun res!663336 () Bool)

(assert (=> b!992466 (=> res!663336 e!559891)))

(assert (=> b!992466 (= res!663336 (= (h!22042 tail!21) head!726))))

(declare-fun b!992467 () Bool)

(assert (=> b!992467 (= e!559891 (contains!5745 (t!29873 tail!21) head!726))))

(assert (= (and d!118159 res!663335) b!992466))

(assert (= (and b!992466 (not res!663336)) b!992467))

(assert (=> d!118159 m!920083))

(assert (=> d!118159 m!920085))

(declare-fun m!920189 () Bool)

(assert (=> b!992467 m!920189))

(assert (=> start!85022 d!118159))

(declare-fun d!118161 () Bool)

(assert (=> d!118161 (= (isEmpty!738 lt!440149) (not (is-Some!530 lt!440149)))))

(assert (=> b!992360 d!118161))

(declare-fun d!118167 () Bool)

(assert (=> d!118167 (= (unapply!10 lt!440147) (ite (is-Nil!20881 lt!440147) None!529 (Some!530 (tuple2!14953 (h!22042 lt!440147) (t!29873 lt!440147)))))))

(assert (=> b!992360 d!118167))

(declare-fun d!118173 () Bool)

(assert (=> d!118173 (= ($colon$colon!567 tail!21 head!726) (Cons!20880 head!726 tail!21))))

(assert (=> b!992360 d!118173))

(declare-fun d!118175 () Bool)

(declare-fun c!100711 () Bool)

(assert (=> d!118175 (= c!100711 (is-Nil!20881 tail!21))))

(declare-fun e!559905 () (Set (_ BitVec 64)))

(assert (=> d!118175 (= (content!439 tail!21) e!559905)))

(declare-fun b!992487 () Bool)

(assert (=> b!992487 (= e!559905 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992488 () Bool)

(assert (=> b!992488 (= e!559905 (set.union (set.insert (h!22042 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!439 (t!29873 tail!21))))))

(assert (= (and d!118175 c!100711) b!992487))

(assert (= (and d!118175 (not c!100711)) b!992488))

(declare-fun m!920229 () Bool)

(assert (=> b!992488 m!920229))

(declare-fun m!920231 () Bool)

(assert (=> b!992488 m!920231))

(assert (=> b!992359 d!118175))

(push 1)

