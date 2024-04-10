; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138080 () Bool)

(assert start!138080)

(declare-fun b!1584521 () Bool)

(declare-fun res!1082294 () Bool)

(declare-fun e!884536 () Bool)

(assert (=> b!1584521 (=> (not res!1082294) (not e!884536))))

(declare-datatypes ((B!2928 0))(
  ( (B!2929 (val!19826 Int)) )
))
(declare-datatypes ((tuple2!25820 0))(
  ( (tuple2!25821 (_1!12921 (_ BitVec 64)) (_2!12921 B!2928)) )
))
(declare-datatypes ((List!36946 0))(
  ( (Nil!36943) (Cons!36942 (h!38485 tuple2!25820) (t!51860 List!36946)) )
))
(declare-fun l!1251 () List!36946)

(declare-fun isStrictlySorted!1171 (List!36946) Bool)

(assert (=> b!1584521 (= res!1082294 (isStrictlySorted!1171 (t!51860 l!1251)))))

(declare-fun res!1082292 () Bool)

(assert (=> start!138080 (=> (not res!1082292) (not e!884536))))

(assert (=> start!138080 (= res!1082292 (isStrictlySorted!1171 l!1251))))

(assert (=> start!138080 e!884536))

(declare-fun e!884535 () Bool)

(assert (=> start!138080 e!884535))

(assert (=> start!138080 true))

(declare-fun tp_is_empty!39461 () Bool)

(assert (=> start!138080 tp_is_empty!39461))

(declare-fun b!1584522 () Bool)

(declare-fun tp!115126 () Bool)

(assert (=> b!1584522 (= e!884535 (and tp_is_empty!39461 tp!115126))))

(declare-fun b!1584523 () Bool)

(declare-fun res!1082290 () Bool)

(assert (=> b!1584523 (=> (not res!1082290) (not e!884536))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(assert (=> b!1584523 (= res!1082290 (and (not (= otherKey!56 newKey!123)) (is-Cons!36942 l!1251)))))

(declare-fun b!1584524 () Bool)

(declare-fun res!1082293 () Bool)

(assert (=> b!1584524 (=> (not res!1082293) (not e!884536))))

(declare-fun containsKey!1005 (List!36946 (_ BitVec 64)) Bool)

(assert (=> b!1584524 (= res!1082293 (not (containsKey!1005 (t!51860 l!1251) otherKey!56)))))

(declare-fun b!1584525 () Bool)

(declare-fun res!1082291 () Bool)

(assert (=> b!1584525 (=> (not res!1082291) (not e!884536))))

(assert (=> b!1584525 (= res!1082291 (not (containsKey!1005 l!1251 otherKey!56)))))

(declare-fun b!1584526 () Bool)

(declare-fun newValue!123 () B!2928)

(declare-fun insertStrictlySorted!628 (List!36946 (_ BitVec 64) B!2928) List!36946)

(assert (=> b!1584526 (= e!884536 (not (not (containsKey!1005 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123) otherKey!56))))))

(assert (=> b!1584526 (not (containsKey!1005 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52301 0))(
  ( (Unit!52302) )
))
(declare-fun lt!677265 () Unit!52301)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!12 (List!36946 (_ BitVec 64) B!2928 (_ BitVec 64)) Unit!52301)

(assert (=> b!1584526 (= lt!677265 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!12 (t!51860 l!1251) newKey!123 newValue!123 otherKey!56))))

(assert (= (and start!138080 res!1082292) b!1584525))

(assert (= (and b!1584525 res!1082291) b!1584523))

(assert (= (and b!1584523 res!1082290) b!1584521))

(assert (= (and b!1584521 res!1082294) b!1584524))

(assert (= (and b!1584524 res!1082293) b!1584526))

(assert (= (and start!138080 (is-Cons!36942 l!1251)) b!1584522))

(declare-fun m!1453775 () Bool)

(assert (=> b!1584526 m!1453775))

(declare-fun m!1453777 () Bool)

(assert (=> b!1584526 m!1453777))

(declare-fun m!1453779 () Bool)

(assert (=> b!1584526 m!1453779))

(declare-fun m!1453781 () Bool)

(assert (=> b!1584526 m!1453781))

(assert (=> b!1584526 m!1453777))

(declare-fun m!1453783 () Bool)

(assert (=> b!1584526 m!1453783))

(assert (=> b!1584526 m!1453779))

(declare-fun m!1453785 () Bool)

(assert (=> b!1584521 m!1453785))

(declare-fun m!1453787 () Bool)

(assert (=> b!1584524 m!1453787))

(declare-fun m!1453789 () Bool)

(assert (=> start!138080 m!1453789))

(declare-fun m!1453791 () Bool)

(assert (=> b!1584525 m!1453791))

(push 1)

(assert (not b!1584524))

(assert tp_is_empty!39461)

(assert (not b!1584525))

(assert (not b!1584522))

(assert (not start!138080))

(assert (not b!1584521))

(assert (not b!1584526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167441 () Bool)

(declare-fun res!1082303 () Bool)

(declare-fun e!884545 () Bool)

(assert (=> d!167441 (=> res!1082303 e!884545)))

(assert (=> d!167441 (= res!1082303 (or (is-Nil!36943 (t!51860 l!1251)) (is-Nil!36943 (t!51860 (t!51860 l!1251)))))))

(assert (=> d!167441 (= (isStrictlySorted!1171 (t!51860 l!1251)) e!884545)))

(declare-fun b!1584535 () Bool)

(declare-fun e!884546 () Bool)

(assert (=> b!1584535 (= e!884545 e!884546)))

(declare-fun res!1082304 () Bool)

(assert (=> b!1584535 (=> (not res!1082304) (not e!884546))))

(assert (=> b!1584535 (= res!1082304 (bvslt (_1!12921 (h!38485 (t!51860 l!1251))) (_1!12921 (h!38485 (t!51860 (t!51860 l!1251))))))))

(declare-fun b!1584536 () Bool)

(assert (=> b!1584536 (= e!884546 (isStrictlySorted!1171 (t!51860 (t!51860 l!1251))))))

(assert (= (and d!167441 (not res!1082303)) b!1584535))

(assert (= (and b!1584535 res!1082304) b!1584536))

(declare-fun m!1453793 () Bool)

(assert (=> b!1584536 m!1453793))

(assert (=> b!1584521 d!167441))

(declare-fun d!167445 () Bool)

(declare-fun res!1082307 () Bool)

(declare-fun e!884549 () Bool)

(assert (=> d!167445 (=> res!1082307 e!884549)))

(assert (=> d!167445 (= res!1082307 (or (is-Nil!36943 l!1251) (is-Nil!36943 (t!51860 l!1251))))))

(assert (=> d!167445 (= (isStrictlySorted!1171 l!1251) e!884549)))

(declare-fun b!1584539 () Bool)

(declare-fun e!884550 () Bool)

(assert (=> b!1584539 (= e!884549 e!884550)))

(declare-fun res!1082308 () Bool)

(assert (=> b!1584539 (=> (not res!1082308) (not e!884550))))

(assert (=> b!1584539 (= res!1082308 (bvslt (_1!12921 (h!38485 l!1251)) (_1!12921 (h!38485 (t!51860 l!1251)))))))

(declare-fun b!1584540 () Bool)

(assert (=> b!1584540 (= e!884550 (isStrictlySorted!1171 (t!51860 l!1251)))))

(assert (= (and d!167445 (not res!1082307)) b!1584539))

(assert (= (and b!1584539 res!1082308) b!1584540))

(assert (=> b!1584540 m!1453785))

(assert (=> start!138080 d!167445))

(declare-fun d!167447 () Bool)

(declare-fun res!1082321 () Bool)

(declare-fun e!884569 () Bool)

(assert (=> d!167447 (=> res!1082321 e!884569)))

(assert (=> d!167447 (= res!1082321 (and (is-Cons!36942 (t!51860 l!1251)) (= (_1!12921 (h!38485 (t!51860 l!1251))) otherKey!56)))))

(assert (=> d!167447 (= (containsKey!1005 (t!51860 l!1251) otherKey!56) e!884569)))

(declare-fun b!1584565 () Bool)

(declare-fun e!884570 () Bool)

(assert (=> b!1584565 (= e!884569 e!884570)))

(declare-fun res!1082322 () Bool)

(assert (=> b!1584565 (=> (not res!1082322) (not e!884570))))

(assert (=> b!1584565 (= res!1082322 (and (or (not (is-Cons!36942 (t!51860 l!1251))) (bvsle (_1!12921 (h!38485 (t!51860 l!1251))) otherKey!56)) (is-Cons!36942 (t!51860 l!1251)) (bvslt (_1!12921 (h!38485 (t!51860 l!1251))) otherKey!56)))))

(declare-fun b!1584566 () Bool)

(assert (=> b!1584566 (= e!884570 (containsKey!1005 (t!51860 (t!51860 l!1251)) otherKey!56))))

(assert (= (and d!167447 (not res!1082321)) b!1584565))

(assert (= (and b!1584565 res!1082322) b!1584566))

(declare-fun m!1453797 () Bool)

(assert (=> b!1584566 m!1453797))

(assert (=> b!1584524 d!167447))

(declare-fun d!167453 () Bool)

(declare-fun res!1082323 () Bool)

(declare-fun e!884571 () Bool)

(assert (=> d!167453 (=> res!1082323 e!884571)))

(assert (=> d!167453 (= res!1082323 (and (is-Cons!36942 l!1251) (= (_1!12921 (h!38485 l!1251)) otherKey!56)))))

(assert (=> d!167453 (= (containsKey!1005 l!1251 otherKey!56) e!884571)))

(declare-fun b!1584567 () Bool)

(declare-fun e!884572 () Bool)

(assert (=> b!1584567 (= e!884571 e!884572)))

(declare-fun res!1082324 () Bool)

(assert (=> b!1584567 (=> (not res!1082324) (not e!884572))))

(assert (=> b!1584567 (= res!1082324 (and (or (not (is-Cons!36942 l!1251)) (bvsle (_1!12921 (h!38485 l!1251)) otherKey!56)) (is-Cons!36942 l!1251) (bvslt (_1!12921 (h!38485 l!1251)) otherKey!56)))))

(declare-fun b!1584568 () Bool)

(assert (=> b!1584568 (= e!884572 (containsKey!1005 (t!51860 l!1251) otherKey!56))))

(assert (= (and d!167453 (not res!1082323)) b!1584567))

(assert (= (and b!1584567 res!1082324) b!1584568))

(assert (=> b!1584568 m!1453787))

(assert (=> b!1584525 d!167453))

(declare-fun e!884644 () Bool)

(declare-fun b!1584680 () Bool)

(declare-fun lt!677278 () List!36946)

(declare-fun contains!10528 (List!36946 tuple2!25820) Bool)

(assert (=> b!1584680 (= e!884644 (contains!10528 lt!677278 (tuple2!25821 newKey!123 newValue!123)))))

(declare-fun b!1584681 () Bool)

(declare-fun e!884643 () List!36946)

(declare-fun call!72571 () List!36946)

(assert (=> b!1584681 (= e!884643 call!72571)))

(declare-fun b!1584682 () Bool)

(declare-fun c!146893 () Bool)

(assert (=> b!1584682 (= c!146893 (and (is-Cons!36942 l!1251) (bvsgt (_1!12921 (h!38485 l!1251)) newKey!123)))))

(declare-fun e!884642 () List!36946)

(assert (=> b!1584682 (= e!884642 e!884643)))

(declare-fun c!146890 () Bool)

(declare-fun b!1584683 () Bool)

(declare-fun e!884641 () List!36946)

(assert (=> b!1584683 (= e!884641 (ite c!146890 (t!51860 l!1251) (ite c!146893 (Cons!36942 (h!38485 l!1251) (t!51860 l!1251)) Nil!36943)))))

(declare-fun b!1584684 () Bool)

(assert (=> b!1584684 (= e!884643 call!72571)))

(declare-fun b!1584685 () Bool)

(declare-fun e!884640 () List!36946)

(assert (=> b!1584685 (= e!884640 e!884642)))

(assert (=> b!1584685 (= c!146890 (and (is-Cons!36942 l!1251) (= (_1!12921 (h!38485 l!1251)) newKey!123)))))

(declare-fun b!1584686 () Bool)

(declare-fun call!72570 () List!36946)

(assert (=> b!1584686 (= e!884642 call!72570)))

(declare-fun b!1584687 () Bool)

(assert (=> b!1584687 (= e!884641 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123))))

(declare-fun bm!72568 () Bool)

(declare-fun call!72572 () List!36946)

(assert (=> bm!72568 (= call!72570 call!72572)))

(declare-fun b!1584688 () Bool)

(declare-fun res!1082371 () Bool)

(assert (=> b!1584688 (=> (not res!1082371) (not e!884644))))

(assert (=> b!1584688 (= res!1082371 (containsKey!1005 lt!677278 newKey!123))))

(declare-fun c!146894 () Bool)

(declare-fun bm!72567 () Bool)

(declare-fun $colon$colon!1024 (List!36946 tuple2!25820) List!36946)

(assert (=> bm!72567 (= call!72572 ($colon$colon!1024 e!884641 (ite c!146894 (h!38485 l!1251) (tuple2!25821 newKey!123 newValue!123))))))

(declare-fun c!146895 () Bool)

(assert (=> bm!72567 (= c!146895 c!146894)))

(declare-fun d!167459 () Bool)

(assert (=> d!167459 e!884644))

(declare-fun res!1082372 () Bool)

(assert (=> d!167459 (=> (not res!1082372) (not e!884644))))

(assert (=> d!167459 (= res!1082372 (isStrictlySorted!1171 lt!677278))))

(assert (=> d!167459 (= lt!677278 e!884640)))

(assert (=> d!167459 (= c!146894 (and (is-Cons!36942 l!1251) (bvslt (_1!12921 (h!38485 l!1251)) newKey!123)))))

(assert (=> d!167459 (isStrictlySorted!1171 l!1251)))

(assert (=> d!167459 (= (insertStrictlySorted!628 l!1251 newKey!123 newValue!123) lt!677278)))

(declare-fun b!1584689 () Bool)

(assert (=> b!1584689 (= e!884640 call!72572)))

(declare-fun bm!72569 () Bool)

(assert (=> bm!72569 (= call!72571 call!72570)))

(assert (= (and d!167459 c!146894) b!1584689))

(assert (= (and d!167459 (not c!146894)) b!1584685))

(assert (= (and b!1584685 c!146890) b!1584686))

(assert (= (and b!1584685 (not c!146890)) b!1584682))

(assert (= (and b!1584682 c!146893) b!1584681))

(assert (= (and b!1584682 (not c!146893)) b!1584684))

(assert (= (or b!1584681 b!1584684) bm!72569))

(assert (= (or b!1584686 bm!72569) bm!72568))

(assert (= (or b!1584689 bm!72568) bm!72567))

(assert (= (and bm!72567 c!146895) b!1584687))

(assert (= (and bm!72567 (not c!146895)) b!1584683))

(assert (= (and d!167459 res!1082372) b!1584688))

(assert (= (and b!1584688 res!1082371) b!1584680))

(declare-fun m!1453831 () Bool)

(assert (=> d!167459 m!1453831))

(assert (=> d!167459 m!1453789))

(declare-fun m!1453834 () Bool)

(assert (=> b!1584680 m!1453834))

(declare-fun m!1453837 () Bool)

(assert (=> b!1584688 m!1453837))

(assert (=> b!1584687 m!1453777))

(declare-fun m!1453843 () Bool)

(assert (=> bm!72567 m!1453843))

(assert (=> b!1584526 d!167459))

(declare-fun b!1584692 () Bool)

(declare-fun lt!677279 () List!36946)

(declare-fun e!884654 () Bool)

(assert (=> b!1584692 (= e!884654 (contains!10528 lt!677279 (tuple2!25821 newKey!123 newValue!123)))))

(declare-fun b!1584694 () Bool)

(declare-fun e!884653 () List!36946)

(declare-fun call!72575 () List!36946)

(assert (=> b!1584694 (= e!884653 call!72575)))

(declare-fun b!1584696 () Bool)

(declare-fun c!146898 () Bool)

(assert (=> b!1584696 (= c!146898 (and (is-Cons!36942 (t!51860 l!1251)) (bvsgt (_1!12921 (h!38485 (t!51860 l!1251))) newKey!123)))))

(declare-fun e!884651 () List!36946)

(assert (=> b!1584696 (= e!884651 e!884653)))

(declare-fun e!884649 () List!36946)

(declare-fun b!1584698 () Bool)

(declare-fun c!146897 () Bool)

(assert (=> b!1584698 (= e!884649 (ite c!146897 (t!51860 (t!51860 l!1251)) (ite c!146898 (Cons!36942 (h!38485 (t!51860 l!1251)) (t!51860 (t!51860 l!1251))) Nil!36943)))))

(declare-fun b!1584700 () Bool)

(assert (=> b!1584700 (= e!884653 call!72575)))

(declare-fun b!1584702 () Bool)

(declare-fun e!884646 () List!36946)

(assert (=> b!1584702 (= e!884646 e!884651)))

(assert (=> b!1584702 (= c!146897 (and (is-Cons!36942 (t!51860 l!1251)) (= (_1!12921 (h!38485 (t!51860 l!1251))) newKey!123)))))

(declare-fun b!1584703 () Bool)

(declare-fun call!72573 () List!36946)

(assert (=> b!1584703 (= e!884651 call!72573)))

(declare-fun b!1584705 () Bool)

(assert (=> b!1584705 (= e!884649 (insertStrictlySorted!628 (t!51860 (t!51860 l!1251)) newKey!123 newValue!123))))

(declare-fun bm!72574 () Bool)

(declare-fun call!72578 () List!36946)

(assert (=> bm!72574 (= call!72573 call!72578)))

(declare-fun b!1584708 () Bool)

(declare-fun res!1082375 () Bool)

(assert (=> b!1584708 (=> (not res!1082375) (not e!884654))))

(assert (=> b!1584708 (= res!1082375 (containsKey!1005 lt!677279 newKey!123))))

(declare-fun c!146899 () Bool)

(declare-fun bm!72571 () Bool)

(assert (=> bm!72571 (= call!72578 ($colon$colon!1024 e!884649 (ite c!146899 (h!38485 (t!51860 l!1251)) (tuple2!25821 newKey!123 newValue!123))))))

(declare-fun c!146901 () Bool)

(assert (=> bm!72571 (= c!146901 c!146899)))

(declare-fun d!167478 () Bool)

(assert (=> d!167478 e!884654))

(declare-fun res!1082376 () Bool)

(assert (=> d!167478 (=> (not res!1082376) (not e!884654))))

(assert (=> d!167478 (= res!1082376 (isStrictlySorted!1171 lt!677279))))

(assert (=> d!167478 (= lt!677279 e!884646)))

(assert (=> d!167478 (= c!146899 (and (is-Cons!36942 (t!51860 l!1251)) (bvslt (_1!12921 (h!38485 (t!51860 l!1251))) newKey!123)))))

(assert (=> d!167478 (isStrictlySorted!1171 (t!51860 l!1251))))

(assert (=> d!167478 (= (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123) lt!677279)))

(declare-fun b!1584709 () Bool)

(assert (=> b!1584709 (= e!884646 call!72578)))

(declare-fun bm!72575 () Bool)

(assert (=> bm!72575 (= call!72575 call!72573)))

(assert (= (and d!167478 c!146899) b!1584709))

(assert (= (and d!167478 (not c!146899)) b!1584702))

(assert (= (and b!1584702 c!146897) b!1584703))

(assert (= (and b!1584702 (not c!146897)) b!1584696))

(assert (= (and b!1584696 c!146898) b!1584694))

(assert (= (and b!1584696 (not c!146898)) b!1584700))

(assert (= (or b!1584694 b!1584700) bm!72575))

(assert (= (or b!1584703 bm!72575) bm!72574))

(assert (= (or b!1584709 bm!72574) bm!72571))

(assert (= (and bm!72571 c!146901) b!1584705))

(assert (= (and bm!72571 (not c!146901)) b!1584698))

(assert (= (and d!167478 res!1082376) b!1584708))

(assert (= (and b!1584708 res!1082375) b!1584692))

(declare-fun m!1453847 () Bool)

(assert (=> d!167478 m!1453847))

(assert (=> d!167478 m!1453785))

(declare-fun m!1453850 () Bool)

(assert (=> b!1584692 m!1453850))

(declare-fun m!1453853 () Bool)

(assert (=> b!1584708 m!1453853))

(declare-fun m!1453857 () Bool)

(assert (=> b!1584705 m!1453857))

(declare-fun m!1453861 () Bool)

(assert (=> bm!72571 m!1453861))

(assert (=> b!1584526 d!167478))

(declare-fun d!167483 () Bool)

(assert (=> d!167483 (not (containsKey!1005 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677285 () Unit!52301)

(declare-fun choose!2112 (List!36946 (_ BitVec 64) B!2928 (_ BitVec 64)) Unit!52301)

(assert (=> d!167483 (= lt!677285 (choose!2112 (t!51860 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884659 () Bool)

(assert (=> d!167483 e!884659))

(declare-fun res!1082385 () Bool)

(assert (=> d!167483 (=> (not res!1082385) (not e!884659))))

(assert (=> d!167483 (= res!1082385 (isStrictlySorted!1171 (t!51860 l!1251)))))

(assert (=> d!167483 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!12 (t!51860 l!1251) newKey!123 newValue!123 otherKey!56) lt!677285)))

(declare-fun b!1584718 () Bool)

(declare-fun res!1082387 () Bool)

(assert (=> b!1584718 (=> (not res!1082387) (not e!884659))))

(assert (=> b!1584718 (= res!1082387 (not (containsKey!1005 (t!51860 l!1251) otherKey!56)))))

(declare-fun b!1584720 () Bool)

(assert (=> b!1584720 (= e!884659 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167483 res!1082385) b!1584718))

(assert (= (and b!1584718 res!1082387) b!1584720))

(assert (=> d!167483 m!1453777))

(assert (=> d!167483 m!1453777))

(assert (=> d!167483 m!1453783))

(declare-fun m!1453866 () Bool)

(assert (=> d!167483 m!1453866))

(assert (=> d!167483 m!1453785))

(assert (=> b!1584718 m!1453787))

(assert (=> b!1584526 d!167483))

(declare-fun d!167486 () Bool)

(declare-fun res!1082390 () Bool)

(declare-fun e!884662 () Bool)

(assert (=> d!167486 (=> res!1082390 e!884662)))

(assert (=> d!167486 (= res!1082390 (and (is-Cons!36942 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123)) (= (_1!12921 (h!38485 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167486 (= (containsKey!1005 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123) otherKey!56) e!884662)))

(declare-fun b!1584723 () Bool)

(declare-fun e!884664 () Bool)

(assert (=> b!1584723 (= e!884662 e!884664)))

(declare-fun res!1082392 () Bool)

(assert (=> b!1584723 (=> (not res!1082392) (not e!884664))))

(assert (=> b!1584723 (= res!1082392 (and (or (not (is-Cons!36942 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123))) (bvsle (_1!12921 (h!38485 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123))) otherKey!56)) (is-Cons!36942 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123)) (bvslt (_1!12921 (h!38485 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584725 () Bool)

(assert (=> b!1584725 (= e!884664 (containsKey!1005 (t!51860 (insertStrictlySorted!628 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167486 (not res!1082390)) b!1584723))

(assert (= (and b!1584723 res!1082392) b!1584725))

(declare-fun m!1453870 () Bool)

(assert (=> b!1584725 m!1453870))

(assert (=> b!1584526 d!167486))

(declare-fun d!167491 () Bool)

(declare-fun res!1082394 () Bool)

(declare-fun e!884666 () Bool)

(assert (=> d!167491 (=> res!1082394 e!884666)))

(assert (=> d!167491 (= res!1082394 (and (is-Cons!36942 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123)) (= (_1!12921 (h!38485 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167491 (= (containsKey!1005 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123) otherKey!56) e!884666)))

(declare-fun b!1584727 () Bool)

(declare-fun e!884668 () Bool)

(assert (=> b!1584727 (= e!884666 e!884668)))

(declare-fun res!1082396 () Bool)

(assert (=> b!1584727 (=> (not res!1082396) (not e!884668))))

(assert (=> b!1584727 (= res!1082396 (and (or (not (is-Cons!36942 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123))) (bvsle (_1!12921 (h!38485 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123))) otherKey!56)) (is-Cons!36942 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123)) (bvslt (_1!12921 (h!38485 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584729 () Bool)

(assert (=> b!1584729 (= e!884668 (containsKey!1005 (t!51860 (insertStrictlySorted!628 (t!51860 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167491 (not res!1082394)) b!1584727))

(assert (= (and b!1584727 res!1082396) b!1584729))

(declare-fun m!1453875 () Bool)

(assert (=> b!1584729 m!1453875))

(assert (=> b!1584526 d!167491))

(declare-fun b!1584738 () Bool)

(declare-fun e!884673 () Bool)

(declare-fun tp!115134 () Bool)

(assert (=> b!1584738 (= e!884673 (and tp_is_empty!39461 tp!115134))))

(assert (=> b!1584522 (= tp!115126 e!884673)))

(assert (= (and b!1584522 (is-Cons!36942 (t!51860 l!1251))) b!1584738))

(push 1)

(assert (not b!1584725))

(assert (not b!1584687))

(assert (not b!1584688))

(assert tp_is_empty!39461)

(assert (not b!1584705))

(assert (not b!1584536))

(assert (not b!1584708))

(assert (not b!1584540))

(assert (not b!1584692))

(assert (not d!167459))

(assert (not b!1584568))

(assert (not bm!72567))

(assert (not b!1584718))

(assert (not d!167478))

(assert (not b!1584729))

(assert (not d!167483))

(assert (not b!1584738))

(assert (not bm!72571))

(assert (not b!1584566))

(assert (not b!1584680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

