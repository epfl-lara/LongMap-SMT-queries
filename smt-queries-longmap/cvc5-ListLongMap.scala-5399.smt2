; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72034 () Bool)

(assert start!72034)

(declare-fun b!836485 () Bool)

(declare-fun e!466692 () Bool)

(declare-datatypes ((List!15985 0))(
  ( (Nil!15982) (Cons!15981 (h!17112 (_ BitVec 64)) (t!22356 List!15985)) )
))
(declare-fun lt!380413 () List!15985)

(declare-datatypes ((B!1196 0))(
  ( (B!1197 (val!7680 Int)) )
))
(declare-datatypes ((tuple2!10220 0))(
  ( (tuple2!10221 (_1!5121 (_ BitVec 64)) (_2!5121 B!1196)) )
))
(declare-datatypes ((List!15986 0))(
  ( (Nil!15983) (Cons!15982 (h!17113 tuple2!10220) (t!22357 List!15986)) )
))
(declare-fun l!390 () List!15986)

(declare-fun length!17 (List!15985) Int)

(declare-fun length!18 (List!15986) Int)

(assert (=> b!836485 (= e!466692 (not (= (length!17 lt!380413) (length!18 l!390))))))

(declare-fun b!836484 () Bool)

(declare-fun e!466690 () Bool)

(assert (=> b!836484 (= e!466690 e!466692)))

(declare-fun res!569071 () Bool)

(assert (=> b!836484 (=> res!569071 e!466692)))

(declare-fun isStrictlySortedLong!0 (List!15985) Bool)

(assert (=> b!836484 (= res!569071 (not (isStrictlySortedLong!0 lt!380413)))))

(declare-fun getKeysList!4 (List!15986) List!15985)

(assert (=> b!836484 (= lt!380413 (Cons!15981 (_1!5121 (h!17113 l!390)) (getKeysList!4 (t!22357 l!390))))))

(declare-fun b!836486 () Bool)

(declare-fun e!466691 () Bool)

(declare-fun tp_is_empty!15265 () Bool)

(declare-fun tp!47459 () Bool)

(assert (=> b!836486 (= e!466691 (and tp_is_empty!15265 tp!47459))))

(declare-fun res!569070 () Bool)

(assert (=> start!72034 (=> (not res!569070) (not e!466690))))

(declare-fun isStrictlySorted!455 (List!15986) Bool)

(assert (=> start!72034 (= res!569070 (isStrictlySorted!455 l!390))))

(assert (=> start!72034 e!466690))

(assert (=> start!72034 e!466691))

(declare-fun b!836483 () Bool)

(declare-fun res!569072 () Bool)

(assert (=> b!836483 (=> (not res!569072) (not e!466690))))

(assert (=> b!836483 (= res!569072 (is-Cons!15982 l!390))))

(assert (= (and start!72034 res!569070) b!836483))

(assert (= (and b!836483 res!569072) b!836484))

(assert (= (and b!836484 (not res!569071)) b!836485))

(assert (= (and start!72034 (is-Cons!15982 l!390)) b!836486))

(declare-fun m!781711 () Bool)

(assert (=> b!836485 m!781711))

(declare-fun m!781713 () Bool)

(assert (=> b!836485 m!781713))

(declare-fun m!781715 () Bool)

(assert (=> b!836484 m!781715))

(declare-fun m!781717 () Bool)

(assert (=> b!836484 m!781717))

(declare-fun m!781719 () Bool)

(assert (=> start!72034 m!781719))

(push 1)

(assert (not start!72034))

(assert (not b!836485))

(assert (not b!836486))

(assert tp_is_empty!15265)

(assert (not b!836484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107602 () Bool)

(declare-fun res!569095 () Bool)

(declare-fun e!466715 () Bool)

(assert (=> d!107602 (=> res!569095 e!466715)))

(assert (=> d!107602 (= res!569095 (or (is-Nil!15983 l!390) (is-Nil!15983 (t!22357 l!390))))))

(assert (=> d!107602 (= (isStrictlySorted!455 l!390) e!466715)))

(declare-fun b!836515 () Bool)

(declare-fun e!466716 () Bool)

(assert (=> b!836515 (= e!466715 e!466716)))

(declare-fun res!569096 () Bool)

(assert (=> b!836515 (=> (not res!569096) (not e!466716))))

(assert (=> b!836515 (= res!569096 (bvslt (_1!5121 (h!17113 l!390)) (_1!5121 (h!17113 (t!22357 l!390)))))))

(declare-fun b!836516 () Bool)

(assert (=> b!836516 (= e!466716 (isStrictlySorted!455 (t!22357 l!390)))))

(assert (= (and d!107602 (not res!569095)) b!836515))

(assert (= (and b!836515 res!569096) b!836516))

(declare-fun m!781747 () Bool)

(assert (=> b!836516 m!781747))

(assert (=> start!72034 d!107602))

(declare-fun d!107611 () Bool)

(declare-fun res!569107 () Bool)

(declare-fun e!466727 () Bool)

(assert (=> d!107611 (=> res!569107 e!466727)))

(assert (=> d!107611 (= res!569107 (or (is-Nil!15982 lt!380413) (is-Nil!15982 (t!22356 lt!380413))))))

(assert (=> d!107611 (= (isStrictlySortedLong!0 lt!380413) e!466727)))

(declare-fun b!836527 () Bool)

(declare-fun e!466728 () Bool)

(assert (=> b!836527 (= e!466727 e!466728)))

(declare-fun res!569108 () Bool)

(assert (=> b!836527 (=> (not res!569108) (not e!466728))))

(assert (=> b!836527 (= res!569108 (bvslt (h!17112 lt!380413) (h!17112 (t!22356 lt!380413))))))

(declare-fun b!836528 () Bool)

(assert (=> b!836528 (= e!466728 (isStrictlySortedLong!0 (t!22356 lt!380413)))))

(assert (= (and d!107611 (not res!569107)) b!836527))

(assert (= (and b!836527 res!569108) b!836528))

(declare-fun m!781753 () Bool)

(assert (=> b!836528 m!781753))

(assert (=> b!836484 d!107611))

(declare-fun d!107617 () Bool)

(declare-fun e!466750 () Bool)

(assert (=> d!107617 e!466750))

(declare-fun res!569125 () Bool)

(assert (=> d!107617 (=> (not res!569125) (not e!466750))))

(declare-fun lt!380424 () List!15985)

(assert (=> d!107617 (= res!569125 (isStrictlySortedLong!0 lt!380424))))

(declare-fun e!466749 () List!15985)

(assert (=> d!107617 (= lt!380424 e!466749)))

(declare-fun c!91057 () Bool)

(assert (=> d!107617 (= c!91057 (is-Cons!15982 (t!22357 l!390)))))

(assert (=> d!107617 (isStrictlySorted!455 (t!22357 l!390))))

(assert (=> d!107617 (= (getKeysList!4 (t!22357 l!390)) lt!380424)))

(declare-fun b!836553 () Bool)

(assert (=> b!836553 (= e!466749 (Cons!15981 (_1!5121 (h!17113 (t!22357 l!390))) (getKeysList!4 (t!22357 (t!22357 l!390)))))))

(declare-fun b!836554 () Bool)

(assert (=> b!836554 (= e!466749 Nil!15982)))

(declare-fun b!836555 () Bool)

(assert (=> b!836555 (= e!466750 (= (length!17 lt!380424) (length!18 (t!22357 l!390))))))

(assert (= (and d!107617 c!91057) b!836553))

(assert (= (and d!107617 (not c!91057)) b!836554))

(assert (= (and d!107617 res!569125) b!836555))

(declare-fun m!781759 () Bool)

(assert (=> d!107617 m!781759))

(assert (=> d!107617 m!781747))

(declare-fun m!781761 () Bool)

(assert (=> b!836553 m!781761))

(declare-fun m!781763 () Bool)

(assert (=> b!836555 m!781763))

(declare-fun m!781765 () Bool)

(assert (=> b!836555 m!781765))

(assert (=> b!836484 d!107617))

(declare-fun d!107623 () Bool)

(declare-fun size!22898 (List!15985) Int)

(assert (=> d!107623 (= (length!17 lt!380413) (size!22898 lt!380413))))

(declare-fun bs!23490 () Bool)

(assert (= bs!23490 d!107623))

(declare-fun m!781767 () Bool)

(assert (=> bs!23490 m!781767))

(assert (=> b!836485 d!107623))

(declare-fun d!107625 () Bool)

(declare-fun size!22899 (List!15986) Int)

(assert (=> d!107625 (= (length!18 l!390) (size!22899 l!390))))

(declare-fun bs!23491 () Bool)

(assert (= bs!23491 d!107625))

(declare-fun m!781777 () Bool)

(assert (=> bs!23491 m!781777))

(assert (=> b!836485 d!107625))

(declare-fun b!836572 () Bool)

(declare-fun e!466762 () Bool)

(declare-fun tp!47471 () Bool)

(assert (=> b!836572 (= e!466762 (and tp_is_empty!15265 tp!47471))))

(assert (=> b!836486 (= tp!47459 e!466762)))

(assert (= (and b!836486 (is-Cons!15982 (t!22357 l!390))) b!836572))

(push 1)

(assert (not b!836528))

(assert (not d!107625))

(assert (not d!107623))

(assert (not b!836555))

(assert (not b!836553))

(assert (not b!836572))

(assert (not b!836516))

(assert tp_is_empty!15265)

(assert (not d!107617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107645 () Bool)

(declare-fun lt!380438 () Int)

(assert (=> d!107645 (>= lt!380438 0)))

(declare-fun e!466791 () Int)

(assert (=> d!107645 (= lt!380438 e!466791)))

(declare-fun c!91071 () Bool)

(assert (=> d!107645 (= c!91071 (is-Nil!15982 lt!380413))))

(assert (=> d!107645 (= (size!22898 lt!380413) lt!380438)))

(declare-fun b!836615 () Bool)

(assert (=> b!836615 (= e!466791 0)))

(declare-fun b!836616 () Bool)

(assert (=> b!836616 (= e!466791 (+ 1 (size!22898 (t!22356 lt!380413))))))

(assert (= (and d!107645 c!91071) b!836615))

(assert (= (and d!107645 (not c!91071)) b!836616))

(declare-fun m!781809 () Bool)

(assert (=> b!836616 m!781809))

(assert (=> d!107623 d!107645))

(declare-fun d!107647 () Bool)

(declare-fun res!569143 () Bool)

(declare-fun e!466792 () Bool)

(assert (=> d!107647 (=> res!569143 e!466792)))

(assert (=> d!107647 (= res!569143 (or (is-Nil!15983 (t!22357 l!390)) (is-Nil!15983 (t!22357 (t!22357 l!390)))))))

(assert (=> d!107647 (= (isStrictlySorted!455 (t!22357 l!390)) e!466792)))

(declare-fun b!836617 () Bool)

(declare-fun e!466793 () Bool)

(assert (=> b!836617 (= e!466792 e!466793)))

(declare-fun res!569144 () Bool)

(assert (=> b!836617 (=> (not res!569144) (not e!466793))))

(assert (=> b!836617 (= res!569144 (bvslt (_1!5121 (h!17113 (t!22357 l!390))) (_1!5121 (h!17113 (t!22357 (t!22357 l!390))))))))

(declare-fun b!836618 () Bool)

(assert (=> b!836618 (= e!466793 (isStrictlySorted!455 (t!22357 (t!22357 l!390))))))

(assert (= (and d!107647 (not res!569143)) b!836617))

(assert (= (and b!836617 res!569144) b!836618))

(declare-fun m!781811 () Bool)

(assert (=> b!836618 m!781811))

(assert (=> b!836516 d!107647))

(declare-fun d!107649 () Bool)

(declare-fun e!466795 () Bool)

(assert (=> d!107649 e!466795))

(declare-fun res!569145 () Bool)

(assert (=> d!107649 (=> (not res!569145) (not e!466795))))

(declare-fun lt!380439 () List!15985)

(assert (=> d!107649 (= res!569145 (isStrictlySortedLong!0 lt!380439))))

(declare-fun e!466794 () List!15985)

(assert (=> d!107649 (= lt!380439 e!466794)))

(declare-fun c!91072 () Bool)

(assert (=> d!107649 (= c!91072 (is-Cons!15982 (t!22357 (t!22357 l!390))))))

(assert (=> d!107649 (isStrictlySorted!455 (t!22357 (t!22357 l!390)))))

(assert (=> d!107649 (= (getKeysList!4 (t!22357 (t!22357 l!390))) lt!380439)))

(declare-fun b!836619 () Bool)

(assert (=> b!836619 (= e!466794 (Cons!15981 (_1!5121 (h!17113 (t!22357 (t!22357 l!390)))) (getKeysList!4 (t!22357 (t!22357 (t!22357 l!390))))))))

(declare-fun b!836620 () Bool)

(assert (=> b!836620 (= e!466794 Nil!15982)))

(declare-fun b!836621 () Bool)

(assert (=> b!836621 (= e!466795 (= (length!17 lt!380439) (length!18 (t!22357 (t!22357 l!390)))))))

(assert (= (and d!107649 c!91072) b!836619))

(assert (= (and d!107649 (not c!91072)) b!836620))

(assert (= (and d!107649 res!569145) b!836621))

(declare-fun m!781813 () Bool)

(assert (=> d!107649 m!781813))

(assert (=> d!107649 m!781811))

(declare-fun m!781815 () Bool)

(assert (=> b!836619 m!781815))

(declare-fun m!781817 () Bool)

(assert (=> b!836621 m!781817))

(declare-fun m!781819 () Bool)

(assert (=> b!836621 m!781819))

(assert (=> b!836553 d!107649))

(declare-fun d!107651 () Bool)

(declare-fun res!569146 () Bool)

(declare-fun e!466796 () Bool)

(assert (=> d!107651 (=> res!569146 e!466796)))

(assert (=> d!107651 (= res!569146 (or (is-Nil!15982 (t!22356 lt!380413)) (is-Nil!15982 (t!22356 (t!22356 lt!380413)))))))

(assert (=> d!107651 (= (isStrictlySortedLong!0 (t!22356 lt!380413)) e!466796)))

(declare-fun b!836622 () Bool)

(declare-fun e!466797 () Bool)

(assert (=> b!836622 (= e!466796 e!466797)))

(declare-fun res!569147 () Bool)

(assert (=> b!836622 (=> (not res!569147) (not e!466797))))

(assert (=> b!836622 (= res!569147 (bvslt (h!17112 (t!22356 lt!380413)) (h!17112 (t!22356 (t!22356 lt!380413)))))))

(declare-fun b!836623 () Bool)

(assert (=> b!836623 (= e!466797 (isStrictlySortedLong!0 (t!22356 (t!22356 lt!380413))))))

(assert (= (and d!107651 (not res!569146)) b!836622))

(assert (= (and b!836622 res!569147) b!836623))

(declare-fun m!781821 () Bool)

(assert (=> b!836623 m!781821))

(assert (=> b!836528 d!107651))

(declare-fun d!107653 () Bool)

(assert (=> d!107653 (= (length!17 lt!380424) (size!22898 lt!380424))))

(declare-fun bs!23494 () Bool)

(assert (= bs!23494 d!107653))

(declare-fun m!781823 () Bool)

(assert (=> bs!23494 m!781823))

(assert (=> b!836555 d!107653))

(declare-fun d!107655 () Bool)

(assert (=> d!107655 (= (length!18 (t!22357 l!390)) (size!22899 (t!22357 l!390)))))

(declare-fun bs!23495 () Bool)

(assert (= bs!23495 d!107655))

(declare-fun m!781825 () Bool)

(assert (=> bs!23495 m!781825))

(assert (=> b!836555 d!107655))

(declare-fun d!107657 () Bool)

(declare-fun res!569148 () Bool)

(declare-fun e!466798 () Bool)

(assert (=> d!107657 (=> res!569148 e!466798)))

(assert (=> d!107657 (= res!569148 (or (is-Nil!15982 lt!380424) (is-Nil!15982 (t!22356 lt!380424))))))

(assert (=> d!107657 (= (isStrictlySortedLong!0 lt!380424) e!466798)))

(declare-fun b!836624 () Bool)

(declare-fun e!466799 () Bool)

(assert (=> b!836624 (= e!466798 e!466799)))

(declare-fun res!569149 () Bool)

(assert (=> b!836624 (=> (not res!569149) (not e!466799))))

(assert (=> b!836624 (= res!569149 (bvslt (h!17112 lt!380424) (h!17112 (t!22356 lt!380424))))))

(declare-fun b!836625 () Bool)

(assert (=> b!836625 (= e!466799 (isStrictlySortedLong!0 (t!22356 lt!380424)))))

(assert (= (and d!107657 (not res!569148)) b!836624))

(assert (= (and b!836624 res!569149) b!836625))

(declare-fun m!781827 () Bool)

(assert (=> b!836625 m!781827))

(assert (=> d!107617 d!107657))

(assert (=> d!107617 d!107647))

(declare-fun d!107659 () Bool)

(declare-fun lt!380442 () Int)

(assert (=> d!107659 (>= lt!380442 0)))

(declare-fun e!466802 () Int)

(assert (=> d!107659 (= lt!380442 e!466802)))

(declare-fun c!91075 () Bool)

(assert (=> d!107659 (= c!91075 (is-Nil!15983 l!390))))

(assert (=> d!107659 (= (size!22899 l!390) lt!380442)))

(declare-fun b!836630 () Bool)

(assert (=> b!836630 (= e!466802 0)))

(declare-fun b!836631 () Bool)

(assert (=> b!836631 (= e!466802 (+ 1 (size!22899 (t!22357 l!390))))))

(assert (= (and d!107659 c!91075) b!836630))

(assert (= (and d!107659 (not c!91075)) b!836631))

(assert (=> b!836631 m!781825))

(assert (=> d!107625 d!107659))

(declare-fun b!836632 () Bool)

(declare-fun e!466803 () Bool)

(declare-fun tp!47476 () Bool)

(assert (=> b!836632 (= e!466803 (and tp_is_empty!15265 tp!47476))))

(assert (=> b!836572 (= tp!47471 e!466803)))

(assert (= (and b!836572 (is-Cons!15982 (t!22357 (t!22357 l!390)))) b!836632))

(push 1)

(assert (not d!107655))

(assert (not d!107653))

(assert (not d!107649))

(assert (not b!836623))

(assert (not b!836625))

(assert (not b!836618))

(assert tp_is_empty!15265)

(assert (not b!836632))

(assert (not b!836621))

(assert (not b!836619))

(assert (not b!836631))

(assert (not b!836616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

