; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85320 () Bool)

(assert start!85320)

(declare-fun res!663710 () Bool)

(declare-fun e!560322 () Bool)

(assert (=> start!85320 (=> (not res!663710) (not e!560322))))

(declare-datatypes ((List!20913 0))(
  ( (Nil!20910) (Cons!20909 (h!22071 (_ BitVec 64)) (t!29914 List!20913)) )
))
(declare-fun l!3519 () List!20913)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5774 (List!20913 (_ BitVec 64)) Bool)

(assert (=> start!85320 (= res!663710 (not (contains!5774 l!3519 e!29)))))

(assert (=> start!85320 e!560322))

(assert (=> start!85320 true))

(declare-fun b!993026 () Bool)

(declare-fun e!560320 () Bool)

(assert (=> b!993026 (= e!560322 e!560320)))

(declare-fun res!663709 () Bool)

(assert (=> b!993026 (=> (not res!663709) (not e!560320))))

(declare-datatypes ((tuple2!15004 0))(
  ( (tuple2!15005 (_1!7513 (_ BitVec 64)) (_2!7513 List!20913)) )
))
(declare-datatypes ((Option!557 0))(
  ( (Some!556 (v!14384 tuple2!15004)) (None!555) )
))
(declare-fun lt!440422 () Option!557)

(declare-fun isEmpty!764 (Option!557) Bool)

(assert (=> b!993026 (= res!663709 (not (isEmpty!764 lt!440422)))))

(declare-fun unapply!36 (List!20913) Option!557)

(assert (=> b!993026 (= lt!440422 (unapply!36 l!3519))))

(declare-fun b!993027 () Bool)

(declare-fun e!560321 () Bool)

(assert (=> b!993027 (= e!560320 e!560321)))

(declare-fun res!663711 () Bool)

(assert (=> b!993027 (=> (not res!663711) (not e!560321))))

(declare-fun lt!440420 () tuple2!15004)

(assert (=> b!993027 (= res!663711 (not (contains!5774 (_2!7513 lt!440420) e!29)))))

(declare-fun get!15725 (Option!557) tuple2!15004)

(assert (=> b!993027 (= lt!440420 (get!15725 lt!440422))))

(declare-fun b!993028 () Bool)

(declare-fun -!452 (List!20913 (_ BitVec 64)) List!20913)

(assert (=> b!993028 (= e!560321 (not (= (-!452 l!3519 e!29) l!3519)))))

(assert (=> b!993028 (= (-!452 (_2!7513 lt!440420) e!29) (_2!7513 lt!440420))))

(declare-datatypes ((Unit!32914 0))(
  ( (Unit!32915) )
))
(declare-fun lt!440421 () Unit!32914)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20913) Unit!32914)

(assert (=> b!993028 (= lt!440421 (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7513 lt!440420)))))

(assert (= (and start!85320 res!663710) b!993026))

(assert (= (and b!993026 res!663709) b!993027))

(assert (= (and b!993027 res!663711) b!993028))

(declare-fun m!920775 () Bool)

(assert (=> start!85320 m!920775))

(declare-fun m!920777 () Bool)

(assert (=> b!993026 m!920777))

(declare-fun m!920779 () Bool)

(assert (=> b!993026 m!920779))

(declare-fun m!920781 () Bool)

(assert (=> b!993027 m!920781))

(declare-fun m!920783 () Bool)

(assert (=> b!993027 m!920783))

(declare-fun m!920785 () Bool)

(assert (=> b!993028 m!920785))

(declare-fun m!920787 () Bool)

(assert (=> b!993028 m!920787))

(declare-fun m!920789 () Bool)

(assert (=> b!993028 m!920789))

(push 1)

(assert (not start!85320))

(assert (not b!993028))

(assert (not b!993027))

(assert (not b!993026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118409 () Bool)

(declare-fun lt!440430 () Bool)

(declare-fun content!464 (List!20913) (Set (_ BitVec 64)))

(assert (=> d!118409 (= lt!440430 (member e!29 (content!464 l!3519)))))

(declare-fun e!560338 () Bool)

(assert (=> d!118409 (= lt!440430 e!560338)))

(declare-fun res!663723 () Bool)

(assert (=> d!118409 (=> (not res!663723) (not e!560338))))

(assert (=> d!118409 (= res!663723 (is-Cons!20909 l!3519))))

(assert (=> d!118409 (= (contains!5774 l!3519 e!29) lt!440430)))

(declare-fun b!993047 () Bool)

(declare-fun e!560339 () Bool)

(assert (=> b!993047 (= e!560338 e!560339)))

(declare-fun res!663722 () Bool)

(assert (=> b!993047 (=> res!663722 e!560339)))

(assert (=> b!993047 (= res!663722 (= (h!22071 l!3519) e!29))))

(declare-fun b!993048 () Bool)

(assert (=> b!993048 (= e!560339 (contains!5774 (t!29914 l!3519) e!29))))

(assert (= (and d!118409 res!663723) b!993047))

(assert (= (and b!993047 (not res!663722)) b!993048))

(declare-fun m!920797 () Bool)

(assert (=> d!118409 m!920797))

(declare-fun m!920799 () Bool)

(assert (=> d!118409 m!920799))

(declare-fun m!920801 () Bool)

(assert (=> b!993048 m!920801))

(assert (=> start!85320 d!118409))

(declare-fun b!993091 () Bool)

(declare-fun e!560369 () List!20913)

(declare-fun e!560371 () List!20913)

(assert (=> b!993091 (= e!560369 e!560371)))

(declare-fun c!100816 () Bool)

(assert (=> b!993091 (= c!100816 (= e!29 (h!22071 l!3519)))))

(declare-fun d!118413 () Bool)

(declare-fun e!560370 () Bool)

(assert (=> d!118413 e!560370))

(declare-fun res!663734 () Bool)

(assert (=> d!118413 (=> (not res!663734) (not e!560370))))

(declare-fun lt!440442 () List!20913)

(declare-fun size!30695 (List!20913) Int)

(assert (=> d!118413 (= res!663734 (<= (size!30695 lt!440442) (size!30695 l!3519)))))

(assert (=> d!118413 (= lt!440442 e!560369)))

(declare-fun c!100817 () Bool)

(assert (=> d!118413 (= c!100817 (is-Cons!20909 l!3519))))

(assert (=> d!118413 (= (-!452 l!3519 e!29) lt!440442)))

(declare-fun b!993092 () Bool)

(assert (=> b!993092 (= e!560370 (= (content!464 lt!440442) (setminus (content!464 l!3519) (insert e!29 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!993093 () Bool)

(assert (=> b!993093 (= e!560369 Nil!20910)))

(declare-fun b!993094 () Bool)

(declare-fun call!42132 () List!20913)

(assert (=> b!993094 (= e!560371 (Cons!20909 (h!22071 l!3519) call!42132))))

(declare-fun b!993095 () Bool)

(assert (=> b!993095 (= e!560371 call!42132)))

(declare-fun bm!42129 () Bool)

(assert (=> bm!42129 (= call!42132 (-!452 (t!29914 l!3519) e!29))))

(assert (= (and d!118413 c!100817) b!993091))

(assert (= (and d!118413 (not c!100817)) b!993093))

(assert (= (and b!993091 c!100816) b!993095))

(assert (= (and b!993091 (not c!100816)) b!993094))

(assert (= (or b!993095 b!993094) bm!42129))

(assert (= (and d!118413 res!663734) b!993092))

(declare-fun m!920847 () Bool)

(assert (=> d!118413 m!920847))

(declare-fun m!920849 () Bool)

(assert (=> d!118413 m!920849))

(declare-fun m!920851 () Bool)

(assert (=> b!993092 m!920851))

(assert (=> b!993092 m!920797))

(declare-fun m!920853 () Bool)

(assert (=> b!993092 m!920853))

(declare-fun m!920855 () Bool)

(assert (=> bm!42129 m!920855))

(assert (=> b!993028 d!118413))

(declare-fun b!993096 () Bool)

(declare-fun e!560372 () List!20913)

(declare-fun e!560374 () List!20913)

(assert (=> b!993096 (= e!560372 e!560374)))

(declare-fun c!100818 () Bool)

(assert (=> b!993096 (= c!100818 (= e!29 (h!22071 (_2!7513 lt!440420))))))

(declare-fun d!118425 () Bool)

(declare-fun e!560373 () Bool)

(assert (=> d!118425 e!560373))

(declare-fun res!663735 () Bool)

(assert (=> d!118425 (=> (not res!663735) (not e!560373))))

(declare-fun lt!440443 () List!20913)

(assert (=> d!118425 (= res!663735 (<= (size!30695 lt!440443) (size!30695 (_2!7513 lt!440420))))))

(assert (=> d!118425 (= lt!440443 e!560372)))

(declare-fun c!100819 () Bool)

(assert (=> d!118425 (= c!100819 (is-Cons!20909 (_2!7513 lt!440420)))))

(assert (=> d!118425 (= (-!452 (_2!7513 lt!440420) e!29) lt!440443)))

(declare-fun b!993097 () Bool)

(assert (=> b!993097 (= e!560373 (= (content!464 lt!440443) (setminus (content!464 (_2!7513 lt!440420)) (insert e!29 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!993098 () Bool)

(assert (=> b!993098 (= e!560372 Nil!20910)))

(declare-fun b!993099 () Bool)

(declare-fun call!42133 () List!20913)

(assert (=> b!993099 (= e!560374 (Cons!20909 (h!22071 (_2!7513 lt!440420)) call!42133))))

(declare-fun b!993100 () Bool)

(assert (=> b!993100 (= e!560374 call!42133)))

(declare-fun bm!42130 () Bool)

(assert (=> bm!42130 (= call!42133 (-!452 (t!29914 (_2!7513 lt!440420)) e!29))))

(assert (= (and d!118425 c!100819) b!993096))

(assert (= (and d!118425 (not c!100819)) b!993098))

(assert (= (and b!993096 c!100818) b!993100))

(assert (= (and b!993096 (not c!100818)) b!993099))

(assert (= (or b!993100 b!993099) bm!42130))

(assert (= (and d!118425 res!663735) b!993097))

(declare-fun m!920857 () Bool)

(assert (=> d!118425 m!920857))

(declare-fun m!920859 () Bool)

(assert (=> d!118425 m!920859))

