; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85316 () Bool)

(assert start!85316)

(declare-fun res!663693 () Bool)

(declare-fun e!560304 () Bool)

(assert (=> start!85316 (=> (not res!663693) (not e!560304))))

(declare-datatypes ((List!20911 0))(
  ( (Nil!20908) (Cons!20907 (h!22069 (_ BitVec 64)) (t!29912 List!20911)) )
))
(declare-fun l!3519 () List!20911)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5772 (List!20911 (_ BitVec 64)) Bool)

(assert (=> start!85316 (= res!663693 (not (contains!5772 l!3519 e!29)))))

(assert (=> start!85316 e!560304))

(assert (=> start!85316 true))

(declare-fun b!993008 () Bool)

(declare-fun e!560302 () Bool)

(assert (=> b!993008 (= e!560304 e!560302)))

(declare-fun res!663691 () Bool)

(assert (=> b!993008 (=> (not res!663691) (not e!560302))))

(declare-datatypes ((tuple2!15000 0))(
  ( (tuple2!15001 (_1!7511 (_ BitVec 64)) (_2!7511 List!20911)) )
))
(declare-datatypes ((Option!555 0))(
  ( (Some!554 (v!14382 tuple2!15000)) (None!553) )
))
(declare-fun lt!440402 () Option!555)

(declare-fun isEmpty!762 (Option!555) Bool)

(assert (=> b!993008 (= res!663691 (not (isEmpty!762 lt!440402)))))

(declare-fun unapply!34 (List!20911) Option!555)

(assert (=> b!993008 (= lt!440402 (unapply!34 l!3519))))

(declare-fun b!993009 () Bool)

(declare-fun e!560303 () Bool)

(assert (=> b!993009 (= e!560302 e!560303)))

(declare-fun res!663692 () Bool)

(assert (=> b!993009 (=> (not res!663692) (not e!560303))))

(declare-fun lt!440403 () tuple2!15000)

(assert (=> b!993009 (= res!663692 (not (contains!5772 (_2!7511 lt!440403) e!29)))))

(declare-fun get!15723 (Option!555) tuple2!15000)

(assert (=> b!993009 (= lt!440403 (get!15723 lt!440402))))

(declare-fun b!993010 () Bool)

(declare-fun -!450 (List!20911 (_ BitVec 64)) List!20911)

(assert (=> b!993010 (= e!560303 (not (= (-!450 l!3519 e!29) l!3519)))))

(assert (=> b!993010 (= (-!450 (_2!7511 lt!440403) e!29) (_2!7511 lt!440403))))

(declare-datatypes ((Unit!32910 0))(
  ( (Unit!32911) )
))
(declare-fun lt!440404 () Unit!32910)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20911) Unit!32910)

(assert (=> b!993010 (= lt!440404 (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7511 lt!440403)))))

(assert (= (and start!85316 res!663693) b!993008))

(assert (= (and b!993008 res!663691) b!993009))

(assert (= (and b!993009 res!663692) b!993010))

(declare-fun m!920743 () Bool)

(assert (=> start!85316 m!920743))

(declare-fun m!920745 () Bool)

(assert (=> b!993008 m!920745))

(declare-fun m!920747 () Bool)

(assert (=> b!993008 m!920747))

(declare-fun m!920749 () Bool)

(assert (=> b!993009 m!920749))

(declare-fun m!920751 () Bool)

(assert (=> b!993009 m!920751))

(declare-fun m!920753 () Bool)

(assert (=> b!993010 m!920753))

(declare-fun m!920755 () Bool)

(assert (=> b!993010 m!920755))

(declare-fun m!920757 () Bool)

(assert (=> b!993010 m!920757))

(push 1)

(assert (not b!993010))

(assert (not b!993009))

(assert (not b!993008))

(assert (not start!85316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!993059 () Bool)

(declare-fun e!560347 () List!20911)

(declare-fun e!560349 () List!20911)

(assert (=> b!993059 (= e!560347 e!560349)))

(declare-fun c!100804 () Bool)

(assert (=> b!993059 (= c!100804 (= e!29 (h!22069 l!3519)))))

(declare-fun bm!42123 () Bool)

(declare-fun call!42126 () List!20911)

(assert (=> bm!42123 (= call!42126 (-!450 (t!29912 l!3519) e!29))))

(declare-fun b!993060 () Bool)

(assert (=> b!993060 (= e!560349 (Cons!20907 (h!22069 l!3519) call!42126))))

(declare-fun b!993061 () Bool)

(assert (=> b!993061 (= e!560349 call!42126)))

(declare-fun lt!440433 () List!20911)

(declare-fun b!993062 () Bool)

(declare-fun e!560348 () Bool)

(declare-fun content!465 (List!20911) (Set (_ BitVec 64)))

(assert (=> b!993062 (= e!560348 (= (content!465 lt!440433) (set.minus (content!465 l!3519) (set.insert e!29 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!993063 () Bool)

(assert (=> b!993063 (= e!560347 Nil!20908)))

(declare-fun d!118407 () Bool)

(assert (=> d!118407 e!560348))

(declare-fun res!663726 () Bool)

(assert (=> d!118407 (=> (not res!663726) (not e!560348))))

(declare-fun size!30693 (List!20911) Int)

(assert (=> d!118407 (= res!663726 (<= (size!30693 lt!440433) (size!30693 l!3519)))))

(assert (=> d!118407 (= lt!440433 e!560347)))

(declare-fun c!100805 () Bool)

(assert (=> d!118407 (= c!100805 (is-Cons!20907 l!3519))))

(assert (=> d!118407 (= (-!450 l!3519 e!29) lt!440433)))

(assert (= (and d!118407 c!100805) b!993059))

(assert (= (and d!118407 (not c!100805)) b!993063))

(assert (= (and b!993059 c!100804) b!993061))

(assert (= (and b!993059 (not c!100804)) b!993060))

(assert (= (or b!993061 b!993060) bm!42123))

(assert (= (and d!118407 res!663726) b!993062))

(declare-fun m!920803 () Bool)

(assert (=> bm!42123 m!920803))

(declare-fun m!920805 () Bool)

(assert (=> b!993062 m!920805))

(declare-fun m!920807 () Bool)

(assert (=> b!993062 m!920807))

(declare-fun m!920809 () Bool)

(assert (=> b!993062 m!920809))

(declare-fun m!920811 () Bool)

(assert (=> d!118407 m!920811))

(declare-fun m!920813 () Bool)

(assert (=> d!118407 m!920813))

(assert (=> b!993010 d!118407))

(declare-fun b!993066 () Bool)

(declare-fun e!560352 () List!20911)

(declare-fun e!560354 () List!20911)

(assert (=> b!993066 (= e!560352 e!560354)))

(declare-fun c!100806 () Bool)

(assert (=> b!993066 (= c!100806 (= e!29 (h!22069 (_2!7511 lt!440403))))))

(declare-fun bm!42124 () Bool)

(declare-fun call!42127 () List!20911)

(assert (=> bm!42124 (= call!42127 (-!450 (t!29912 (_2!7511 lt!440403)) e!29))))

(declare-fun b!993067 () Bool)

(assert (=> b!993067 (= e!560354 (Cons!20907 (h!22069 (_2!7511 lt!440403)) call!42127))))

(declare-fun b!993068 () Bool)

(assert (=> b!993068 (= e!560354 call!42127)))

(declare-fun lt!440434 () List!20911)

(declare-fun e!560353 () Bool)

(declare-fun b!993069 () Bool)

(assert (=> b!993069 (= e!560353 (= (content!465 lt!440434) (set.minus (content!465 (_2!7511 lt!440403)) (set.insert e!29 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!993070 () Bool)

(assert (=> b!993070 (= e!560352 Nil!20908)))

(declare-fun d!118415 () Bool)

(assert (=> d!118415 e!560353))

(declare-fun res!663729 () Bool)

(assert (=> d!118415 (=> (not res!663729) (not e!560353))))

(assert (=> d!118415 (= res!663729 (<= (size!30693 lt!440434) (size!30693 (_2!7511 lt!440403))))))

(assert (=> d!118415 (= lt!440434 e!560352)))

(declare-fun c!100807 () Bool)

(assert (=> d!118415 (= c!100807 (is-Cons!20907 (_2!7511 lt!440403)))))

(assert (=> d!118415 (= (-!450 (_2!7511 lt!440403) e!29) lt!440434)))

(assert (= (and d!118415 c!100807) b!993066))

(assert (= (and d!118415 (not c!100807)) b!993070))

(assert (= (and b!993066 c!100806) b!993068))

(assert (= (and b!993066 (not c!100806)) b!993067))

(assert (= (or b!993068 b!993067) bm!42124))

(assert (= (and d!118415 res!663729) b!993069))

(declare-fun m!920815 () Bool)

(assert (=> bm!42124 m!920815))

(declare-fun m!920817 () Bool)

(assert (=> b!993069 m!920817))

(declare-fun m!920819 () Bool)

(assert (=> b!993069 m!920819))

(assert (=> b!993069 m!920809))

(declare-fun m!920821 () Bool)

(assert (=> d!118415 m!920821))

(declare-fun m!920823 () Bool)

(assert (=> d!118415 m!920823))

(assert (=> b!993010 d!118415))

(declare-fun d!118417 () Bool)

(assert (=> d!118417 (= (-!450 (_2!7511 lt!440403) e!29) (_2!7511 lt!440403))))

(declare-fun lt!440441 () Unit!32910)

(declare-fun choose!48 ((_ BitVec 64) List!20911) Unit!32910)

(assert (=> d!118417 (= lt!440441 (choose!48 e!29 (_2!7511 lt!440403)))))

(assert (=> d!118417 (not (contains!5772 (_2!7511 lt!440403) e!29))))

(assert (=> d!118417 (= (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7511 lt!440403)) lt!440441)))

(declare-fun bs!28255 () Bool)

(assert (= bs!28255 d!118417))

(assert (=> bs!28255 m!920755))

(declare-fun m!920839 () Bool)

(assert (=> bs!28255 m!920839))

(assert (=> bs!28255 m!920749))

(assert (=> b!993010 d!118417))

(declare-fun d!118421 () Bool)

(declare-fun lt!440450 () Bool)

(assert (=> d!118421 (= lt!440450 (set.member e!29 (content!465 (_2!7511 lt!440403))))))

(declare-fun e!560382 () Bool)

(assert (=> d!118421 (= lt!440450 e!560382)))

(declare-fun res!663742 () Bool)

(assert (=> d!118421 (=> (not res!663742) (not e!560382))))

(assert (=> d!118421 (= res!663742 (is-Cons!20907 (_2!7511 lt!440403)))))

(assert (=> d!118421 (= (contains!5772 (_2!7511 lt!440403) e!29) lt!440450)))

(declare-fun b!993107 () Bool)

(declare-fun e!560383 () Bool)

(assert (=> b!993107 (= e!560382 e!560383)))

(declare-fun res!663743 () Bool)

(assert (=> b!993107 (=> res!663743 e!560383)))

(assert (=> b!993107 (= res!663743 (= (h!22069 (_2!7511 lt!440403)) e!29))))

(declare-fun b!993108 () Bool)

(assert (=> b!993108 (= e!560383 (contains!5772 (t!29912 (_2!7511 lt!440403)) e!29))))

(assert (= (and d!118421 res!663742) b!993107))

(assert (= (and b!993107 (not res!663743)) b!993108))

(assert (=> d!118421 m!920819))

(declare-fun m!920873 () Bool)

(assert (=> d!118421 m!920873))

(declare-fun m!920875 () Bool)

(assert (=> b!993108 m!920875))

(assert (=> b!993009 d!118421))

(declare-fun d!118433 () Bool)

(assert (=> d!118433 (= (get!15723 lt!440402) (v!14382 lt!440402))))

(assert (=> b!993009 d!118433))

(declare-fun d!118437 () Bool)

(assert (=> d!118437 (= (isEmpty!762 lt!440402) (not (is-Some!554 lt!440402)))))

(assert (=> b!993008 d!118437))

(declare-fun d!118443 () Bool)

(assert (=> d!118443 (= (unapply!34 l!3519) (ite (is-Nil!20908 l!3519) None!553 (Some!554 (tuple2!15001 (h!22069 l!3519) (t!29912 l!3519)))))))

(assert (=> b!993008 d!118443))

(declare-fun d!118449 () Bool)

(declare-fun lt!440455 () Bool)

(assert (=> d!118449 (= lt!440455 (set.member e!29 (content!465 l!3519)))))

(declare-fun e!560387 () Bool)

(assert (=> d!118449 (= lt!440455 e!560387)))

(declare-fun res!663746 () Bool)

(assert (=> d!118449 (=> (not res!663746) (not e!560387))))

(assert (=> d!118449 (= res!663746 (is-Cons!20907 l!3519))))

(assert (=> d!118449 (= (contains!5772 l!3519 e!29) lt!440455)))

(declare-fun b!993111 () Bool)

(declare-fun e!560388 () Bool)

(assert (=> b!993111 (= e!560387 e!560388)))

(declare-fun res!663747 () Bool)

(assert (=> b!993111 (=> res!663747 e!560388)))

(assert (=> b!993111 (= res!663747 (= (h!22069 l!3519) e!29))))

(declare-fun b!993112 () Bool)

(assert (=> b!993112 (= e!560388 (contains!5772 (t!29912 l!3519) e!29))))

(assert (= (and d!118449 res!663746) b!993111))

(assert (= (and b!993111 (not res!663747)) b!993112))

(assert (=> d!118449 m!920807))

(declare-fun m!920883 () Bool)

(assert (=> d!118449 m!920883))

(declare-fun m!920885 () Bool)

(assert (=> b!993112 m!920885))

(assert (=> start!85316 d!118449))

(push 1)

