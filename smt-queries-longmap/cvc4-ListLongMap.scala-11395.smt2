; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132612 () Bool)

(assert start!132612)

(declare-fun b!1554507 () Bool)

(declare-fun res!1063836 () Bool)

(declare-fun e!865610 () Bool)

(assert (=> b!1554507 (=> (not res!1063836) (not e!865610))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554507 (= res!1063836 (not (= a0!49 a!523)))))

(declare-fun b!1554508 () Bool)

(declare-fun res!1063837 () Bool)

(assert (=> b!1554508 (=> (not res!1063837) (not e!865610))))

(declare-datatypes ((B!2250 0))(
  ( (B!2251 (val!19211 Int)) )
))
(declare-datatypes ((tuple2!24798 0))(
  ( (tuple2!24799 (_1!12410 (_ BitVec 64)) (_2!12410 B!2250)) )
))
(declare-datatypes ((List!36245 0))(
  ( (Nil!36242) (Cons!36241 (h!37687 tuple2!24798) (t!50966 List!36245)) )
))
(declare-datatypes ((ListLongMap!22407 0))(
  ( (ListLongMap!22408 (toList!11219 List!36245)) )
))
(declare-fun lm!249 () ListLongMap!22407)

(declare-fun containsKey!778 (List!36245 (_ BitVec 64)) Bool)

(assert (=> b!1554508 (= res!1063837 (containsKey!778 (toList!11219 lm!249) a0!49))))

(declare-fun b!1554509 () Bool)

(declare-fun e!865609 () Bool)

(declare-fun tp!112206 () Bool)

(assert (=> b!1554509 (= e!865609 tp!112206)))

(declare-fun b!1554510 () Bool)

(declare-fun e!865608 () Bool)

(assert (=> b!1554510 (= e!865610 (not e!865608))))

(declare-fun res!1063835 () Bool)

(assert (=> b!1554510 (=> res!1063835 e!865608)))

(declare-fun isStrictlySorted!907 (List!36245) Bool)

(assert (=> b!1554510 (= res!1063835 (not (isStrictlySorted!907 (toList!11219 lm!249))))))

(declare-fun e!865607 () Bool)

(assert (=> b!1554510 e!865607))

(declare-fun res!1063833 () Bool)

(assert (=> b!1554510 (=> (not res!1063833) (not e!865607))))

(declare-fun lt!670049 () List!36245)

(assert (=> b!1554510 (= res!1063833 (containsKey!778 lt!670049 a0!49))))

(declare-fun b!96 () B!2250)

(declare-fun insertStrictlySorted!518 (List!36245 (_ BitVec 64) B!2250) List!36245)

(assert (=> b!1554510 (= lt!670049 (insertStrictlySorted!518 (toList!11219 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51798 0))(
  ( (Unit!51799) )
))
(declare-fun lt!670048 () Unit!51798)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!15 (List!36245 (_ BitVec 64) B!2250 (_ BitVec 64)) Unit!51798)

(assert (=> b!1554510 (= lt!670048 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!15 (toList!11219 lm!249) a!523 b!96 a0!49))))

(declare-fun res!1063834 () Bool)

(assert (=> start!132612 (=> (not res!1063834) (not e!865610))))

(declare-fun contains!10167 (ListLongMap!22407 (_ BitVec 64)) Bool)

(assert (=> start!132612 (= res!1063834 (contains!10167 lm!249 a0!49))))

(assert (=> start!132612 e!865610))

(declare-fun inv!57353 (ListLongMap!22407) Bool)

(assert (=> start!132612 (and (inv!57353 lm!249) e!865609)))

(assert (=> start!132612 true))

(declare-fun tp_is_empty!38261 () Bool)

(assert (=> start!132612 tp_is_empty!38261))

(declare-fun b!1554511 () Bool)

(declare-fun apply!1115 (ListLongMap!22407 (_ BitVec 64)) B!2250)

(declare-fun +!5017 (ListLongMap!22407 tuple2!24798) ListLongMap!22407)

(assert (=> b!1554511 (= e!865608 (= (apply!1115 (+!5017 lm!249 (tuple2!24799 a!523 b!96)) a0!49) (apply!1115 lm!249 a0!49)))))

(declare-datatypes ((Option!832 0))(
  ( (Some!831 (v!22016 B!2250)) (None!830) )
))
(declare-fun isDefined!569 (Option!832) Bool)

(declare-fun getValueByKey!756 (List!36245 (_ BitVec 64)) Option!832)

(assert (=> b!1554511 (isDefined!569 (getValueByKey!756 (toList!11219 lm!249) a0!49))))

(declare-fun lt!670047 () Unit!51798)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!521 (List!36245 (_ BitVec 64)) Unit!51798)

(assert (=> b!1554511 (= lt!670047 (lemmaContainsKeyImpliesGetValueByKeyDefined!521 (toList!11219 lm!249) a0!49))))

(declare-fun b!1554512 () Bool)

(assert (=> b!1554512 (= e!865607 (= (getValueByKey!756 lt!670049 a0!49) (getValueByKey!756 (toList!11219 lm!249) a0!49)))))

(assert (= (and start!132612 res!1063834) b!1554507))

(assert (= (and b!1554507 res!1063836) b!1554508))

(assert (= (and b!1554508 res!1063837) b!1554510))

(assert (= (and b!1554510 res!1063833) b!1554512))

(assert (= (and b!1554510 (not res!1063835)) b!1554511))

(assert (= start!132612 b!1554509))

(declare-fun m!1432829 () Bool)

(assert (=> b!1554511 m!1432829))

(declare-fun m!1432831 () Bool)

(assert (=> b!1554511 m!1432831))

(declare-fun m!1432833 () Bool)

(assert (=> b!1554511 m!1432833))

(assert (=> b!1554511 m!1432831))

(declare-fun m!1432835 () Bool)

(assert (=> b!1554511 m!1432835))

(declare-fun m!1432837 () Bool)

(assert (=> b!1554511 m!1432837))

(assert (=> b!1554511 m!1432833))

(declare-fun m!1432839 () Bool)

(assert (=> b!1554511 m!1432839))

(declare-fun m!1432841 () Bool)

(assert (=> start!132612 m!1432841))

(declare-fun m!1432843 () Bool)

(assert (=> start!132612 m!1432843))

(declare-fun m!1432845 () Bool)

(assert (=> b!1554512 m!1432845))

(assert (=> b!1554512 m!1432831))

(declare-fun m!1432847 () Bool)

(assert (=> b!1554510 m!1432847))

(declare-fun m!1432849 () Bool)

(assert (=> b!1554510 m!1432849))

(declare-fun m!1432851 () Bool)

(assert (=> b!1554510 m!1432851))

(declare-fun m!1432853 () Bool)

(assert (=> b!1554510 m!1432853))

(declare-fun m!1432855 () Bool)

(assert (=> b!1554508 m!1432855))

(push 1)

(assert (not b!1554512))

(assert (not start!132612))

(assert (not b!1554510))

(assert (not b!1554509))

(assert (not b!1554508))

(assert (not b!1554511))

(assert tp_is_empty!38261)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161757 () Bool)

(declare-fun c!143425 () Bool)

(assert (=> d!161757 (= c!143425 (and (is-Cons!36241 (toList!11219 lm!249)) (= (_1!12410 (h!37687 (toList!11219 lm!249))) a0!49)))))

(declare-fun e!865623 () Option!832)

(assert (=> d!161757 (= (getValueByKey!756 (toList!11219 lm!249) a0!49) e!865623)))

(declare-fun b!1554532 () Bool)

(declare-fun e!865624 () Option!832)

(assert (=> b!1554532 (= e!865624 None!830)))

(declare-fun b!1554530 () Bool)

(assert (=> b!1554530 (= e!865623 e!865624)))

(declare-fun c!143426 () Bool)

(assert (=> b!1554530 (= c!143426 (and (is-Cons!36241 (toList!11219 lm!249)) (not (= (_1!12410 (h!37687 (toList!11219 lm!249))) a0!49))))))

(declare-fun b!1554529 () Bool)

(assert (=> b!1554529 (= e!865623 (Some!831 (_2!12410 (h!37687 (toList!11219 lm!249)))))))

(declare-fun b!1554531 () Bool)

(assert (=> b!1554531 (= e!865624 (getValueByKey!756 (t!50966 (toList!11219 lm!249)) a0!49))))

(assert (= (and d!161757 c!143425) b!1554529))

(assert (= (and d!161757 (not c!143425)) b!1554530))

(assert (= (and b!1554530 c!143426) b!1554531))

(assert (= (and b!1554530 (not c!143426)) b!1554532))

(declare-fun m!1432857 () Bool)

(assert (=> b!1554531 m!1432857))

(assert (=> b!1554511 d!161757))

(declare-fun d!161763 () Bool)

(declare-fun isEmpty!1138 (Option!832) Bool)

(assert (=> d!161763 (= (isDefined!569 (getValueByKey!756 (toList!11219 lm!249) a0!49)) (not (isEmpty!1138 (getValueByKey!756 (toList!11219 lm!249) a0!49))))))

(declare-fun bs!44687 () Bool)

(assert (= bs!44687 d!161763))

(assert (=> bs!44687 m!1432831))

(declare-fun m!1432863 () Bool)

(assert (=> bs!44687 m!1432863))

(assert (=> b!1554511 d!161763))

(declare-fun d!161769 () Bool)

(assert (=> d!161769 (isDefined!569 (getValueByKey!756 (toList!11219 lm!249) a0!49))))

(declare-fun lt!670052 () Unit!51798)

(declare-fun choose!2049 (List!36245 (_ BitVec 64)) Unit!51798)

(assert (=> d!161769 (= lt!670052 (choose!2049 (toList!11219 lm!249) a0!49))))

(declare-fun e!865643 () Bool)

(assert (=> d!161769 e!865643))

(declare-fun res!1063860 () Bool)

(assert (=> d!161769 (=> (not res!1063860) (not e!865643))))

(assert (=> d!161769 (= res!1063860 (isStrictlySorted!907 (toList!11219 lm!249)))))

(assert (=> d!161769 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!521 (toList!11219 lm!249) a0!49) lt!670052)))

(declare-fun b!1554555 () Bool)

(assert (=> b!1554555 (= e!865643 (containsKey!778 (toList!11219 lm!249) a0!49))))

(assert (= (and d!161769 res!1063860) b!1554555))

(assert (=> d!161769 m!1432831))

(assert (=> d!161769 m!1432831))

(assert (=> d!161769 m!1432835))

(declare-fun m!1432869 () Bool)

(assert (=> d!161769 m!1432869))

(assert (=> d!161769 m!1432847))

(assert (=> b!1554555 m!1432855))

(assert (=> b!1554511 d!161769))

(declare-fun d!161775 () Bool)

(declare-fun get!26060 (Option!832) B!2250)

(assert (=> d!161775 (= (apply!1115 lm!249 a0!49) (get!26060 (getValueByKey!756 (toList!11219 lm!249) a0!49)))))

(declare-fun bs!44689 () Bool)

(assert (= bs!44689 d!161775))

(assert (=> bs!44689 m!1432831))

(assert (=> bs!44689 m!1432831))

(declare-fun m!1432877 () Bool)

(assert (=> bs!44689 m!1432877))

(assert (=> b!1554511 d!161775))

(declare-fun d!161783 () Bool)

(assert (=> d!161783 (= (apply!1115 (+!5017 lm!249 (tuple2!24799 a!523 b!96)) a0!49) (get!26060 (getValueByKey!756 (toList!11219 (+!5017 lm!249 (tuple2!24799 a!523 b!96))) a0!49)))))

(declare-fun bs!44690 () Bool)

(assert (= bs!44690 d!161783))

(declare-fun m!1432879 () Bool)

(assert (=> bs!44690 m!1432879))

(assert (=> bs!44690 m!1432879))

(declare-fun m!1432881 () Bool)

(assert (=> bs!44690 m!1432881))

(assert (=> b!1554511 d!161783))

(declare-fun d!161785 () Bool)

(declare-fun e!865661 () Bool)

(assert (=> d!161785 e!865661))

(declare-fun res!1063869 () Bool)

(assert (=> d!161785 (=> (not res!1063869) (not e!865661))))

(declare-fun lt!670068 () ListLongMap!22407)

(assert (=> d!161785 (= res!1063869 (contains!10167 lt!670068 (_1!12410 (tuple2!24799 a!523 b!96))))))

(declare-fun lt!670066 () List!36245)

(assert (=> d!161785 (= lt!670068 (ListLongMap!22408 lt!670066))))

(declare-fun lt!670069 () Unit!51798)

(declare-fun lt!670067 () Unit!51798)

(assert (=> d!161785 (= lt!670069 lt!670067)))

(assert (=> d!161785 (= (getValueByKey!756 lt!670066 (_1!12410 (tuple2!24799 a!523 b!96))) (Some!831 (_2!12410 (tuple2!24799 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!379 (List!36245 (_ BitVec 64) B!2250) Unit!51798)

(assert (=> d!161785 (= lt!670067 (lemmaContainsTupThenGetReturnValue!379 lt!670066 (_1!12410 (tuple2!24799 a!523 b!96)) (_2!12410 (tuple2!24799 a!523 b!96))))))

(assert (=> d!161785 (= lt!670066 (insertStrictlySorted!518 (toList!11219 lm!249) (_1!12410 (tuple2!24799 a!523 b!96)) (_2!12410 (tuple2!24799 a!523 b!96))))))

(assert (=> d!161785 (= (+!5017 lm!249 (tuple2!24799 a!523 b!96)) lt!670068)))

(declare-fun b!1554587 () Bool)

(declare-fun res!1063868 () Bool)

(assert (=> b!1554587 (=> (not res!1063868) (not e!865661))))

(assert (=> b!1554587 (= res!1063868 (= (getValueByKey!756 (toList!11219 lt!670068) (_1!12410 (tuple2!24799 a!523 b!96))) (Some!831 (_2!12410 (tuple2!24799 a!523 b!96)))))))

(declare-fun b!1554588 () Bool)

(declare-fun contains!10170 (List!36245 tuple2!24798) Bool)

(assert (=> b!1554588 (= e!865661 (contains!10170 (toList!11219 lt!670068) (tuple2!24799 a!523 b!96)))))

(assert (= (and d!161785 res!1063869) b!1554587))

(assert (= (and b!1554587 res!1063868) b!1554588))

(declare-fun m!1432891 () Bool)

(assert (=> d!161785 m!1432891))

(declare-fun m!1432893 () Bool)

(assert (=> d!161785 m!1432893))

(declare-fun m!1432895 () Bool)

(assert (=> d!161785 m!1432895))

(declare-fun m!1432897 () Bool)

(assert (=> d!161785 m!1432897))

(declare-fun m!1432899 () Bool)

(assert (=> b!1554587 m!1432899))

(declare-fun m!1432901 () Bool)

(assert (=> b!1554588 m!1432901))

(assert (=> b!1554511 d!161785))

(declare-fun d!161793 () Bool)

(declare-fun res!1063882 () Bool)

(declare-fun e!865670 () Bool)

(assert (=> d!161793 (=> res!1063882 e!865670)))

(assert (=> d!161793 (= res!1063882 (or (is-Nil!36242 (toList!11219 lm!249)) (is-Nil!36242 (t!50966 (toList!11219 lm!249)))))))

(assert (=> d!161793 (= (isStrictlySorted!907 (toList!11219 lm!249)) e!865670)))

(declare-fun b!1554601 () Bool)

(declare-fun e!865671 () Bool)

(assert (=> b!1554601 (= e!865670 e!865671)))

(declare-fun res!1063883 () Bool)

(assert (=> b!1554601 (=> (not res!1063883) (not e!865671))))

(assert (=> b!1554601 (= res!1063883 (bvslt (_1!12410 (h!37687 (toList!11219 lm!249))) (_1!12410 (h!37687 (t!50966 (toList!11219 lm!249))))))))

(declare-fun b!1554602 () Bool)

(assert (=> b!1554602 (= e!865671 (isStrictlySorted!907 (t!50966 (toList!11219 lm!249))))))

(assert (= (and d!161793 (not res!1063882)) b!1554601))

(assert (= (and b!1554601 res!1063883) b!1554602))

(declare-fun m!1432903 () Bool)

(assert (=> b!1554602 m!1432903))

(assert (=> b!1554510 d!161793))

(declare-fun d!161795 () Bool)

(declare-fun res!1063892 () Bool)

(declare-fun e!865682 () Bool)

(assert (=> d!161795 (=> res!1063892 e!865682)))

(assert (=> d!161795 (= res!1063892 (and (is-Cons!36241 lt!670049) (= (_1!12410 (h!37687 lt!670049)) a0!49)))))

(assert (=> d!161795 (= (containsKey!778 lt!670049 a0!49) e!865682)))

(declare-fun b!1554619 () Bool)

(declare-fun e!865683 () Bool)

(assert (=> b!1554619 (= e!865682 e!865683)))

(declare-fun res!1063893 () Bool)

(assert (=> b!1554619 (=> (not res!1063893) (not e!865683))))

(assert (=> b!1554619 (= res!1063893 (and (or (not (is-Cons!36241 lt!670049)) (bvsle (_1!12410 (h!37687 lt!670049)) a0!49)) (is-Cons!36241 lt!670049) (bvslt (_1!12410 (h!37687 lt!670049)) a0!49)))))

(declare-fun b!1554620 () Bool)

(assert (=> b!1554620 (= e!865683 (containsKey!778 (t!50966 lt!670049) a0!49))))

(assert (= (and d!161795 (not res!1063892)) b!1554619))

(assert (= (and b!1554619 res!1063893) b!1554620))

(declare-fun m!1432927 () Bool)

(assert (=> b!1554620 m!1432927))

(assert (=> b!1554510 d!161795))

(declare-fun b!1554686 () Bool)

(declare-fun e!865730 () List!36245)

(declare-fun call!71444 () List!36245)

(assert (=> b!1554686 (= e!865730 call!71444)))

(declare-fun d!161801 () Bool)

(declare-fun e!865729 () Bool)

(assert (=> d!161801 e!865729))

(declare-fun res!1063918 () Bool)

(assert (=> d!161801 (=> (not res!1063918) (not e!865729))))

(declare-fun lt!670108 () List!36245)

(assert (=> d!161801 (= res!1063918 (isStrictlySorted!907 lt!670108))))

(declare-fun e!865728 () List!36245)

(assert (=> d!161801 (= lt!670108 e!865728)))

(declare-fun c!143469 () Bool)

(assert (=> d!161801 (= c!143469 (and (is-Cons!36241 (toList!11219 lm!249)) (bvslt (_1!12410 (h!37687 (toList!11219 lm!249))) a!523)))))

(assert (=> d!161801 (isStrictlySorted!907 (toList!11219 lm!249))))

(assert (=> d!161801 (= (insertStrictlySorted!518 (toList!11219 lm!249) a!523 b!96) lt!670108)))

(declare-fun b!1554687 () Bool)

(declare-fun res!1063917 () Bool)

(assert (=> b!1554687 (=> (not res!1063917) (not e!865729))))

(assert (=> b!1554687 (= res!1063917 (containsKey!778 lt!670108 a!523))))

(declare-fun bm!71440 () Bool)

(declare-fun call!71443 () List!36245)

(assert (=> bm!71440 (= call!71444 call!71443)))

(declare-fun b!1554688 () Bool)

(declare-fun e!865727 () List!36245)

(assert (=> b!1554688 (= e!865727 (insertStrictlySorted!518 (t!50966 (toList!11219 lm!249)) a!523 b!96))))

(declare-fun b!1554689 () Bool)

(declare-fun c!143471 () Bool)

(declare-fun c!143468 () Bool)

(assert (=> b!1554689 (= e!865727 (ite c!143468 (t!50966 (toList!11219 lm!249)) (ite c!143471 (Cons!36241 (h!37687 (toList!11219 lm!249)) (t!50966 (toList!11219 lm!249))) Nil!36242)))))

(declare-fun b!1554690 () Bool)

(assert (=> b!1554690 (= e!865728 call!71443)))

(declare-fun b!1554691 () Bool)

(declare-fun e!865726 () List!36245)

(declare-fun call!71445 () List!36245)

(assert (=> b!1554691 (= e!865726 call!71445)))

(declare-fun bm!71441 () Bool)

(assert (=> bm!71441 (= call!71445 call!71444)))

(declare-fun b!1554692 () Bool)

(assert (=> b!1554692 (= e!865728 e!865730)))

(assert (=> b!1554692 (= c!143468 (and (is-Cons!36241 (toList!11219 lm!249)) (= (_1!12410 (h!37687 (toList!11219 lm!249))) a!523)))))

(declare-fun b!1554693 () Bool)

(assert (=> b!1554693 (= e!865729 (contains!10170 lt!670108 (tuple2!24799 a!523 b!96)))))

(declare-fun b!1554694 () Bool)

(assert (=> b!1554694 (= e!865726 call!71445)))

(declare-fun b!1554695 () Bool)

(assert (=> b!1554695 (= c!143471 (and (is-Cons!36241 (toList!11219 lm!249)) (bvsgt (_1!12410 (h!37687 (toList!11219 lm!249))) a!523)))))

(assert (=> b!1554695 (= e!865730 e!865726)))

(declare-fun bm!71442 () Bool)

(declare-fun $colon$colon!953 (List!36245 tuple2!24798) List!36245)

(assert (=> bm!71442 (= call!71443 ($colon$colon!953 e!865727 (ite c!143469 (h!37687 (toList!11219 lm!249)) (tuple2!24799 a!523 b!96))))))

(declare-fun c!143470 () Bool)

(assert (=> bm!71442 (= c!143470 c!143469)))

(assert (= (and d!161801 c!143469) b!1554690))

(assert (= (and d!161801 (not c!143469)) b!1554692))

(assert (= (and b!1554692 c!143468) b!1554686))

(assert (= (and b!1554692 (not c!143468)) b!1554695))

(assert (= (and b!1554695 c!143471) b!1554694))

(assert (= (and b!1554695 (not c!143471)) b!1554691))

(assert (= (or b!1554694 b!1554691) bm!71441))

(assert (= (or b!1554686 bm!71441) bm!71440))

(assert (= (or b!1554690 bm!71440) bm!71442))

(assert (= (and bm!71442 c!143470) b!1554688))

(assert (= (and bm!71442 (not c!143470)) b!1554689))

(assert (= (and d!161801 res!1063918) b!1554687))

(assert (= (and b!1554687 res!1063917) b!1554693))

(declare-fun m!1432943 () Bool)

(assert (=> bm!71442 m!1432943))

(declare-fun m!1432945 () Bool)

(assert (=> b!1554688 m!1432945))

(declare-fun m!1432947 () Bool)

(assert (=> d!161801 m!1432947))

(assert (=> d!161801 m!1432847))

(declare-fun m!1432949 () Bool)

(assert (=> b!1554693 m!1432949))

(declare-fun m!1432951 () Bool)

(assert (=> b!1554687 m!1432951))

(assert (=> b!1554510 d!161801))

(declare-fun d!161819 () Bool)

(declare-fun e!865751 () Bool)

(assert (=> d!161819 e!865751))

(declare-fun res!1063932 () Bool)

(assert (=> d!161819 (=> (not res!1063932) (not e!865751))))

(assert (=> d!161819 (= res!1063932 (= (containsKey!778 (insertStrictlySorted!518 (toList!11219 lm!249) a!523 b!96) a0!49) (containsKey!778 (toList!11219 lm!249) a0!49)))))

(declare-fun lt!670120 () Unit!51798)

(declare-fun choose!2054 (List!36245 (_ BitVec 64) B!2250 (_ BitVec 64)) Unit!51798)

(assert (=> d!161819 (= lt!670120 (choose!2054 (toList!11219 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865750 () Bool)

(assert (=> d!161819 e!865750))

(declare-fun res!1063931 () Bool)

(assert (=> d!161819 (=> (not res!1063931) (not e!865750))))

(assert (=> d!161819 (= res!1063931 (isStrictlySorted!907 (toList!11219 lm!249)))))

(assert (=> d!161819 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!15 (toList!11219 lm!249) a!523 b!96 a0!49) lt!670120)))

(declare-fun b!1554726 () Bool)

(assert (=> b!1554726 (= e!865750 (not (= a!523 a0!49)))))

(declare-fun b!1554727 () Bool)

(assert (=> b!1554727 (= e!865751 (= (getValueByKey!756 (insertStrictlySorted!518 (toList!11219 lm!249) a!523 b!96) a0!49) (getValueByKey!756 (toList!11219 lm!249) a0!49)))))

(assert (= (and d!161819 res!1063931) b!1554726))

(assert (= (and d!161819 res!1063932) b!1554727))

(assert (=> d!161819 m!1432851))

(declare-fun m!1432963 () Bool)

(assert (=> d!161819 m!1432963))

(assert (=> d!161819 m!1432847))

(assert (=> d!161819 m!1432855))

(assert (=> d!161819 m!1432851))

(declare-fun m!1432965 () Bool)

(assert (=> d!161819 m!1432965))

(assert (=> b!1554727 m!1432851))

(assert (=> b!1554727 m!1432851))

(declare-fun m!1432967 () Bool)

(assert (=> b!1554727 m!1432967))

(assert (=> b!1554727 m!1432831))

(assert (=> b!1554510 d!161819))

(declare-fun d!161831 () Bool)

(declare-fun c!143481 () Bool)

(assert (=> d!161831 (= c!143481 (and (is-Cons!36241 lt!670049) (= (_1!12410 (h!37687 lt!670049)) a0!49)))))

(declare-fun e!865752 () Option!832)

