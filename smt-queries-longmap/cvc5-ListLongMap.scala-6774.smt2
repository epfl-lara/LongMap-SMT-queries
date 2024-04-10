; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85154 () Bool)

(assert start!85154)

(declare-fun b!992677 () Bool)

(declare-fun res!663459 () Bool)

(declare-fun e!560030 () Bool)

(assert (=> b!992677 (=> (not res!663459) (not e!560030))))

(declare-fun head!726 () (_ BitVec 64))

(declare-datatypes ((List!20893 0))(
  ( (Nil!20890) (Cons!20889 (h!22051 (_ BitVec 64)) (t!29891 List!20893)) )
))
(declare-fun tail!21 () List!20893)

(declare-fun content!448 (List!20893) (Set (_ BitVec 64)))

(assert (=> b!992677 (= res!663459 (not (set.member head!726 (content!448 tail!21))))))

(declare-fun res!663456 () Bool)

(assert (=> start!85154 (=> (not res!663456) (not e!560030))))

(declare-fun contains!5754 (List!20893 (_ BitVec 64)) Bool)

(assert (=> start!85154 (= res!663456 (not (contains!5754 tail!21 head!726)))))

(assert (=> start!85154 e!560030))

(assert (=> start!85154 true))

(declare-fun b!992679 () Bool)

(declare-fun res!663457 () Bool)

(declare-fun e!560031 () Bool)

(assert (=> b!992679 (=> (not res!663457) (not e!560031))))

(declare-fun lt!440254 () List!20893)

(assert (=> b!992679 (= res!663457 (not (is-Nil!20890 lt!440254)))))

(declare-fun b!992680 () Bool)

(declare-fun -!447 (List!20893 (_ BitVec 64)) List!20893)

(assert (=> b!992680 (= e!560031 (not (= (-!447 lt!440254 head!726) tail!21)))))

(declare-fun b!992678 () Bool)

(assert (=> b!992678 (= e!560030 e!560031)))

(declare-fun res!663458 () Bool)

(assert (=> b!992678 (=> (not res!663458) (not e!560031))))

(declare-datatypes ((tuple2!14970 0))(
  ( (tuple2!14971 (_1!7496 (_ BitVec 64)) (_2!7496 List!20893)) )
))
(declare-datatypes ((Option!540 0))(
  ( (Some!539 (v!14352 tuple2!14970)) (None!538) )
))
(declare-fun isEmpty!747 (Option!540) Bool)

(declare-fun unapply!19 (List!20893) Option!540)

(assert (=> b!992678 (= res!663458 (isEmpty!747 (unapply!19 lt!440254)))))

(declare-fun $colon$colon!576 (List!20893 (_ BitVec 64)) List!20893)

(assert (=> b!992678 (= lt!440254 ($colon$colon!576 tail!21 head!726))))

(assert (= (and start!85154 res!663456) b!992677))

(assert (= (and b!992677 res!663459) b!992678))

(assert (= (and b!992678 res!663458) b!992679))

(assert (= (and b!992679 res!663457) b!992680))

(declare-fun m!920383 () Bool)

(assert (=> b!992677 m!920383))

(declare-fun m!920385 () Bool)

(assert (=> b!992677 m!920385))

(declare-fun m!920387 () Bool)

(assert (=> start!85154 m!920387))

(declare-fun m!920389 () Bool)

(assert (=> b!992680 m!920389))

(declare-fun m!920391 () Bool)

(assert (=> b!992678 m!920391))

(assert (=> b!992678 m!920391))

(declare-fun m!920393 () Bool)

(assert (=> b!992678 m!920393))

(declare-fun m!920395 () Bool)

(assert (=> b!992678 m!920395))

(push 1)

(assert (not b!992678))

(assert (not start!85154))

(assert (not b!992680))

(assert (not b!992677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118253 () Bool)

(assert (=> d!118253 (= (isEmpty!747 (unapply!19 lt!440254)) (not (is-Some!539 (unapply!19 lt!440254))))))

(assert (=> b!992678 d!118253))

(declare-fun d!118255 () Bool)

(assert (=> d!118255 (= (unapply!19 lt!440254) (ite (is-Nil!20890 lt!440254) None!538 (Some!539 (tuple2!14971 (h!22051 lt!440254) (t!29891 lt!440254)))))))

(assert (=> b!992678 d!118255))

(declare-fun d!118257 () Bool)

(assert (=> d!118257 (= ($colon$colon!576 tail!21 head!726) (Cons!20889 head!726 tail!21))))

(assert (=> b!992678 d!118257))

(declare-fun d!118259 () Bool)

(declare-fun lt!440269 () Bool)

(assert (=> d!118259 (= lt!440269 (set.member head!726 (content!448 tail!21)))))

(declare-fun e!560067 () Bool)

(assert (=> d!118259 (= lt!440269 e!560067)))

(declare-fun res!663498 () Bool)

(assert (=> d!118259 (=> (not res!663498) (not e!560067))))

(assert (=> d!118259 (= res!663498 (is-Cons!20889 tail!21))))

(assert (=> d!118259 (= (contains!5754 tail!21 head!726) lt!440269)))

(declare-fun b!992736 () Bool)

(declare-fun e!560068 () Bool)

(assert (=> b!992736 (= e!560067 e!560068)))

(declare-fun res!663497 () Bool)

(assert (=> b!992736 (=> res!663497 e!560068)))

(assert (=> b!992736 (= res!663497 (= (h!22051 tail!21) head!726))))

(declare-fun b!992737 () Bool)

(assert (=> b!992737 (= e!560068 (contains!5754 (t!29891 tail!21) head!726))))

(assert (= (and d!118259 res!663498) b!992736))

(assert (= (and b!992736 (not res!663497)) b!992737))

(assert (=> d!118259 m!920383))

(assert (=> d!118259 m!920385))

(declare-fun m!920443 () Bool)

(assert (=> b!992737 m!920443))

(assert (=> start!85154 d!118259))

(declare-fun d!118271 () Bool)

(declare-fun e!560096 () Bool)

(assert (=> d!118271 e!560096))

(declare-fun res!663510 () Bool)

(assert (=> d!118271 (=> (not res!663510) (not e!560096))))

(declare-fun lt!440278 () List!20893)

(declare-fun size!30692 (List!20893) Int)

(assert (=> d!118271 (= res!663510 (<= (size!30692 lt!440278) (size!30692 lt!440254)))))

(declare-fun e!560095 () List!20893)

(assert (=> d!118271 (= lt!440278 e!560095)))

(declare-fun c!100769 () Bool)

(assert (=> d!118271 (= c!100769 (is-Cons!20889 lt!440254))))

(assert (=> d!118271 (= (-!447 lt!440254 head!726) lt!440278)))

(declare-fun b!992773 () Bool)

(declare-fun e!560094 () List!20893)

(assert (=> b!992773 (= e!560095 e!560094)))

(declare-fun c!100770 () Bool)

(assert (=> b!992773 (= c!100770 (= head!726 (h!22051 lt!440254)))))

(declare-fun b!992774 () Bool)

(assert (=> b!992774 (= e!560095 Nil!20890)))

(declare-fun b!992775 () Bool)

(declare-fun call!42121 () List!20893)

(assert (=> b!992775 (= e!560094 call!42121)))

(declare-fun b!992776 () Bool)

(assert (=> b!992776 (= e!560094 (Cons!20889 (h!22051 lt!440254) call!42121))))

(declare-fun b!992777 () Bool)

(assert (=> b!992777 (= e!560096 (= (content!448 lt!440278) (set.minus (content!448 lt!440254) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!42118 () Bool)

(assert (=> bm!42118 (= call!42121 (-!447 (t!29891 lt!440254) head!726))))

(assert (= (and d!118271 c!100769) b!992773))

(assert (= (and d!118271 (not c!100769)) b!992774))

(assert (= (and b!992773 c!100770) b!992775))

(assert (= (and b!992773 (not c!100770)) b!992776))

(assert (= (or b!992775 b!992776) bm!42118))

(assert (= (and d!118271 res!663510) b!992777))

(declare-fun m!920459 () Bool)

(assert (=> d!118271 m!920459))

(declare-fun m!920461 () Bool)

(assert (=> d!118271 m!920461))

(declare-fun m!920463 () Bool)

(assert (=> b!992777 m!920463))

(declare-fun m!920467 () Bool)

(assert (=> b!992777 m!920467))

(declare-fun m!920471 () Bool)

(assert (=> b!992777 m!920471))

(declare-fun m!920473 () Bool)

(assert (=> bm!42118 m!920473))

(assert (=> b!992680 d!118271))

(declare-fun d!118279 () Bool)

(declare-fun c!100774 () Bool)

(assert (=> d!118279 (= c!100774 (is-Nil!20890 tail!21))))

(declare-fun e!560100 () (Set (_ BitVec 64)))

(assert (=> d!118279 (= (content!448 tail!21) e!560100)))

(declare-fun b!992784 () Bool)

(assert (=> b!992784 (= e!560100 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992785 () Bool)

