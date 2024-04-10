; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85284 () Bool)

(assert start!85284)

(declare-fun res!663660 () Bool)

(declare-fun e!560259 () Bool)

(assert (=> start!85284 (=> (not res!663660) (not e!560259))))

(declare-datatypes ((List!20910 0))(
  ( (Nil!20907) (Cons!20906 (h!22068 (_ BitVec 64)) (t!29911 List!20910)) )
))
(declare-fun l!3519 () List!20910)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5771 (List!20910 (_ BitVec 64)) Bool)

(assert (=> start!85284 (= res!663660 (not (contains!5771 l!3519 e!29)))))

(assert (=> start!85284 e!560259))

(assert (=> start!85284 true))

(declare-fun b!992951 () Bool)

(declare-fun e!560257 () Bool)

(assert (=> b!992951 (= e!560259 e!560257)))

(declare-fun res!663659 () Bool)

(assert (=> b!992951 (=> (not res!663659) (not e!560257))))

(declare-datatypes ((tuple2!14998 0))(
  ( (tuple2!14999 (_1!7510 (_ BitVec 64)) (_2!7510 List!20910)) )
))
(declare-datatypes ((Option!554 0))(
  ( (Some!553 (v!14378 tuple2!14998)) (None!552) )
))
(declare-fun lt!440370 () Option!554)

(declare-fun isEmpty!761 (Option!554) Bool)

(assert (=> b!992951 (= res!663659 (not (isEmpty!761 lt!440370)))))

(declare-fun unapply!33 (List!20910) Option!554)

(assert (=> b!992951 (= lt!440370 (unapply!33 l!3519))))

(declare-fun b!992952 () Bool)

(declare-fun e!560258 () Bool)

(assert (=> b!992952 (= e!560257 e!560258)))

(declare-fun res!663658 () Bool)

(assert (=> b!992952 (=> (not res!663658) (not e!560258))))

(declare-fun lt!440371 () tuple2!14998)

(assert (=> b!992952 (= res!663658 (not (contains!5771 (_2!7510 lt!440371) e!29)))))

(declare-fun get!15720 (Option!554) tuple2!14998)

(assert (=> b!992952 (= lt!440371 (get!15720 lt!440370))))

(declare-fun b!992953 () Bool)

(declare-fun ListPrimitiveSize!96 (List!20910) Int)

(assert (=> b!992953 (= e!560258 (>= (ListPrimitiveSize!96 (_2!7510 lt!440371)) (ListPrimitiveSize!96 l!3519)))))

(assert (= (and start!85284 res!663660) b!992951))

(assert (= (and b!992951 res!663659) b!992952))

(assert (= (and b!992952 res!663658) b!992953))

(declare-fun m!920681 () Bool)

(assert (=> start!85284 m!920681))

(declare-fun m!920683 () Bool)

(assert (=> b!992951 m!920683))

(declare-fun m!920685 () Bool)

(assert (=> b!992951 m!920685))

(declare-fun m!920687 () Bool)

(assert (=> b!992952 m!920687))

(declare-fun m!920689 () Bool)

(assert (=> b!992952 m!920689))

(declare-fun m!920691 () Bool)

(assert (=> b!992953 m!920691))

(declare-fun m!920693 () Bool)

(assert (=> b!992953 m!920693))

(push 1)

(assert (not b!992951))

(assert (not b!992952))

(assert (not start!85284))

(assert (not b!992953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118365 () Bool)

(assert (=> d!118365 (= (isEmpty!761 lt!440370) (not (is-Some!553 lt!440370)))))

(assert (=> b!992951 d!118365))

(declare-fun d!118369 () Bool)

(assert (=> d!118369 (= (unapply!33 l!3519) (ite (is-Nil!20907 l!3519) None!552 (Some!553 (tuple2!14999 (h!22068 l!3519) (t!29911 l!3519)))))))

(assert (=> b!992951 d!118369))

(declare-fun d!118373 () Bool)

(declare-fun lt!440383 () Bool)

(declare-fun content!462 (List!20910) (Set (_ BitVec 64)))

(assert (=> d!118373 (= lt!440383 (member e!29 (content!462 (_2!7510 lt!440371))))))

(declare-fun e!560281 () Bool)

(assert (=> d!118373 (= lt!440383 e!560281)))

(declare-fun res!663679 () Bool)

(assert (=> d!118373 (=> (not res!663679) (not e!560281))))

(assert (=> d!118373 (= res!663679 (is-Cons!20906 (_2!7510 lt!440371)))))

(assert (=> d!118373 (= (contains!5771 (_2!7510 lt!440371) e!29) lt!440383)))

(declare-fun b!992976 () Bool)

(declare-fun e!560280 () Bool)

(assert (=> b!992976 (= e!560281 e!560280)))

(declare-fun res!663680 () Bool)

(assert (=> b!992976 (=> res!663680 e!560280)))

(assert (=> b!992976 (= res!663680 (= (h!22068 (_2!7510 lt!440371)) e!29))))

(declare-fun b!992977 () Bool)

(assert (=> b!992977 (= e!560280 (contains!5771 (t!29911 (_2!7510 lt!440371)) e!29))))

(assert (= (and d!118373 res!663679) b!992976))

(assert (= (and b!992976 (not res!663680)) b!992977))

(declare-fun m!920713 () Bool)

(assert (=> d!118373 m!920713))

(declare-fun m!920715 () Bool)

(assert (=> d!118373 m!920715))

(declare-fun m!920717 () Bool)

(assert (=> b!992977 m!920717))

(assert (=> b!992952 d!118373))

(declare-fun d!118383 () Bool)

(assert (=> d!118383 (= (get!15720 lt!440370) (v!14378 lt!440370))))

(assert (=> b!992952 d!118383))

(declare-fun d!118389 () Bool)

(declare-fun lt!440387 () Bool)

(assert (=> d!118389 (= lt!440387 (member e!29 (content!462 l!3519)))))

(declare-fun e!560287 () Bool)

(assert (=> d!118389 (= lt!440387 e!560287)))

(declare-fun res!663683 () Bool)

(assert (=> d!118389 (=> (not res!663683) (not e!560287))))

(assert (=> d!118389 (= res!663683 (is-Cons!20906 l!3519))))

(assert (=> d!118389 (= (contains!5771 l!3519 e!29) lt!440387)))

(declare-fun b!992984 () Bool)

(declare-fun e!560286 () Bool)

(assert (=> b!992984 (= e!560287 e!560286)))

(declare-fun res!663684 () Bool)

(assert (=> b!992984 (=> res!663684 e!560286)))

(assert (=> b!992984 (= res!663684 (= (h!22068 l!3519) e!29))))

(declare-fun b!992985 () Bool)

(assert (=> b!992985 (= e!560286 (contains!5771 (t!29911 l!3519) e!29))))

(assert (= (and d!118389 res!663683) b!992984))

(assert (= (and b!992984 (not res!663684)) b!992985))

(declare-fun m!920729 () Bool)

(assert (=> d!118389 m!920729))

(declare-fun m!920731 () Bool)

(assert (=> d!118389 m!920731))

(declare-fun m!920733 () Bool)

(assert (=> b!992985 m!920733))

(assert (=> start!85284 d!118389))

(declare-fun d!118395 () Bool)

(declare-fun lt!440393 () Int)

(assert (=> d!118395 (>= lt!440393 0)))

(declare-fun e!560293 () Int)

