; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132558 () Bool)

(assert start!132558)

(declare-fun e!865387 () Bool)

(declare-datatypes ((B!2246 0))(
  ( (B!2247 (val!19209 Int)) )
))
(declare-datatypes ((tuple2!24866 0))(
  ( (tuple2!24867 (_1!12444 (_ BitVec 64)) (_2!12444 B!2246)) )
))
(declare-datatypes ((List!36288 0))(
  ( (Nil!36285) (Cons!36284 (h!37731 tuple2!24866) (t!51001 List!36288)) )
))
(declare-fun lt!669743 () List!36288)

(declare-datatypes ((ListLongMap!22475 0))(
  ( (ListLongMap!22476 (toList!11253 List!36288)) )
))
(declare-fun lm!249 () ListLongMap!22475)

(declare-fun b!1554158 () Bool)

(declare-fun a0!49 () (_ BitVec 64))

(declare-datatypes ((Option!832 0))(
  ( (Some!831 (v!22010 B!2246)) (None!830) )
))
(declare-fun getValueByKey!757 (List!36288 (_ BitVec 64)) Option!832)

(assert (=> b!1554158 (= e!865387 (= (getValueByKey!757 lt!669743 a0!49) (getValueByKey!757 (toList!11253 lm!249) a0!49)))))

(declare-fun b!1554159 () Bool)

(declare-fun e!865386 () Bool)

(declare-fun tp!112201 () Bool)

(assert (=> b!1554159 (= e!865386 tp!112201)))

(declare-fun b!1554160 () Bool)

(declare-fun res!1063676 () Bool)

(declare-fun e!865385 () Bool)

(assert (=> b!1554160 (=> (not res!1063676) (not e!865385))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554160 (= res!1063676 (not (= a0!49 a!523)))))

(declare-fun res!1063678 () Bool)

(assert (=> start!132558 (=> (not res!1063678) (not e!865385))))

(declare-fun contains!10122 (ListLongMap!22475 (_ BitVec 64)) Bool)

(assert (=> start!132558 (= res!1063678 (contains!10122 lm!249 a0!49))))

(assert (=> start!132558 e!865385))

(declare-fun inv!57351 (ListLongMap!22475) Bool)

(assert (=> start!132558 (and (inv!57351 lm!249) e!865386)))

(assert (=> start!132558 true))

(declare-fun tp_is_empty!38257 () Bool)

(assert (=> start!132558 tp_is_empty!38257))

(declare-fun b!1554161 () Bool)

(declare-fun e!865388 () Bool)

(assert (=> b!1554161 (= e!865385 (not e!865388))))

(declare-fun res!1063675 () Bool)

(assert (=> b!1554161 (=> res!1063675 e!865388)))

(declare-fun isStrictlySorted!903 (List!36288) Bool)

(assert (=> b!1554161 (= res!1063675 (not (isStrictlySorted!903 (toList!11253 lm!249))))))

(assert (=> b!1554161 e!865387))

(declare-fun res!1063677 () Bool)

(assert (=> b!1554161 (=> (not res!1063677) (not e!865387))))

(declare-fun containsKey!774 (List!36288 (_ BitVec 64)) Bool)

(assert (=> b!1554161 (= res!1063677 (containsKey!774 lt!669743 a0!49))))

(declare-fun b!96 () B!2246)

(declare-fun insertStrictlySorted!517 (List!36288 (_ BitVec 64) B!2246) List!36288)

(assert (=> b!1554161 (= lt!669743 (insertStrictlySorted!517 (toList!11253 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51610 0))(
  ( (Unit!51611) )
))
(declare-fun lt!669744 () Unit!51610)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (List!36288 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51610)

(assert (=> b!1554161 (= lt!669744 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11253 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1554162 () Bool)

(declare-fun apply!1100 (ListLongMap!22475 (_ BitVec 64)) B!2246)

(declare-fun +!5046 (ListLongMap!22475 tuple2!24866) ListLongMap!22475)

(assert (=> b!1554162 (= e!865388 (= (apply!1100 (+!5046 lm!249 (tuple2!24867 a!523 b!96)) a0!49) (apply!1100 lm!249 a0!49)))))

(declare-fun isDefined!569 (Option!832) Bool)

(assert (=> b!1554162 (isDefined!569 (getValueByKey!757 (toList!11253 lm!249) a0!49))))

(declare-fun lt!669745 () Unit!51610)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!518 (List!36288 (_ BitVec 64)) Unit!51610)

(assert (=> b!1554162 (= lt!669745 (lemmaContainsKeyImpliesGetValueByKeyDefined!518 (toList!11253 lm!249) a0!49))))

(declare-fun b!1554163 () Bool)

(declare-fun res!1063674 () Bool)

(assert (=> b!1554163 (=> (not res!1063674) (not e!865385))))

(assert (=> b!1554163 (= res!1063674 (containsKey!774 (toList!11253 lm!249) a0!49))))

(assert (= (and start!132558 res!1063678) b!1554160))

(assert (= (and b!1554160 res!1063676) b!1554163))

(assert (= (and b!1554163 res!1063674) b!1554161))

(assert (= (and b!1554161 res!1063677) b!1554158))

(assert (= (and b!1554161 (not res!1063675)) b!1554162))

(assert (= start!132558 b!1554159))

(declare-fun m!1431881 () Bool)

(assert (=> start!132558 m!1431881))

(declare-fun m!1431883 () Bool)

(assert (=> start!132558 m!1431883))

(declare-fun m!1431885 () Bool)

(assert (=> b!1554161 m!1431885))

(declare-fun m!1431887 () Bool)

(assert (=> b!1554161 m!1431887))

(declare-fun m!1431889 () Bool)

(assert (=> b!1554161 m!1431889))

(declare-fun m!1431891 () Bool)

(assert (=> b!1554161 m!1431891))

(declare-fun m!1431893 () Bool)

(assert (=> b!1554162 m!1431893))

(declare-fun m!1431895 () Bool)

(assert (=> b!1554162 m!1431895))

(declare-fun m!1431897 () Bool)

(assert (=> b!1554162 m!1431897))

(assert (=> b!1554162 m!1431895))

(declare-fun m!1431899 () Bool)

(assert (=> b!1554162 m!1431899))

(declare-fun m!1431901 () Bool)

(assert (=> b!1554162 m!1431901))

(assert (=> b!1554162 m!1431897))

(declare-fun m!1431903 () Bool)

(assert (=> b!1554162 m!1431903))

(declare-fun m!1431905 () Bool)

(assert (=> b!1554158 m!1431905))

(assert (=> b!1554158 m!1431895))

(declare-fun m!1431907 () Bool)

(assert (=> b!1554163 m!1431907))

(check-sat (not b!1554158) (not b!1554161) (not b!1554162) (not start!132558) (not b!1554159) tp_is_empty!38257 (not b!1554163))
(check-sat)
(get-model)

(declare-fun b!1554223 () Bool)

(declare-fun e!865426 () Option!832)

(assert (=> b!1554223 (= e!865426 None!830)))

(declare-fun b!1554222 () Bool)

(assert (=> b!1554222 (= e!865426 (getValueByKey!757 (t!51001 lt!669743) a0!49))))

(declare-fun b!1554221 () Bool)

(declare-fun e!865425 () Option!832)

(assert (=> b!1554221 (= e!865425 e!865426)))

(declare-fun c!143341 () Bool)

(get-info :version)

(assert (=> b!1554221 (= c!143341 (and ((_ is Cons!36284) lt!669743) (not (= (_1!12444 (h!37731 lt!669743)) a0!49))))))

(declare-fun d!161503 () Bool)

(declare-fun c!143340 () Bool)

(assert (=> d!161503 (= c!143340 (and ((_ is Cons!36284) lt!669743) (= (_1!12444 (h!37731 lt!669743)) a0!49)))))

(assert (=> d!161503 (= (getValueByKey!757 lt!669743 a0!49) e!865425)))

(declare-fun b!1554220 () Bool)

(assert (=> b!1554220 (= e!865425 (Some!831 (_2!12444 (h!37731 lt!669743))))))

(assert (= (and d!161503 c!143340) b!1554220))

(assert (= (and d!161503 (not c!143340)) b!1554221))

(assert (= (and b!1554221 c!143341) b!1554222))

(assert (= (and b!1554221 (not c!143341)) b!1554223))

(declare-fun m!1431965 () Bool)

(assert (=> b!1554222 m!1431965))

(assert (=> b!1554158 d!161503))

(declare-fun b!1554231 () Bool)

(declare-fun e!865430 () Option!832)

(assert (=> b!1554231 (= e!865430 None!830)))

(declare-fun b!1554230 () Bool)

(assert (=> b!1554230 (= e!865430 (getValueByKey!757 (t!51001 (toList!11253 lm!249)) a0!49))))

(declare-fun b!1554229 () Bool)

(declare-fun e!865429 () Option!832)

(assert (=> b!1554229 (= e!865429 e!865430)))

(declare-fun c!143345 () Bool)

(assert (=> b!1554229 (= c!143345 (and ((_ is Cons!36284) (toList!11253 lm!249)) (not (= (_1!12444 (h!37731 (toList!11253 lm!249))) a0!49))))))

(declare-fun d!161509 () Bool)

(declare-fun c!143344 () Bool)

(assert (=> d!161509 (= c!143344 (and ((_ is Cons!36284) (toList!11253 lm!249)) (= (_1!12444 (h!37731 (toList!11253 lm!249))) a0!49)))))

(assert (=> d!161509 (= (getValueByKey!757 (toList!11253 lm!249) a0!49) e!865429)))

(declare-fun b!1554228 () Bool)

(assert (=> b!1554228 (= e!865429 (Some!831 (_2!12444 (h!37731 (toList!11253 lm!249)))))))

(assert (= (and d!161509 c!143344) b!1554228))

(assert (= (and d!161509 (not c!143344)) b!1554229))

(assert (= (and b!1554229 c!143345) b!1554230))

(assert (= (and b!1554229 (not c!143345)) b!1554231))

(declare-fun m!1431969 () Bool)

(assert (=> b!1554230 m!1431969))

(assert (=> b!1554158 d!161509))

(declare-fun d!161513 () Bool)

(declare-fun e!865447 () Bool)

(assert (=> d!161513 e!865447))

(declare-fun res!1063726 () Bool)

(assert (=> d!161513 (=> res!1063726 e!865447)))

(declare-fun lt!669776 () Bool)

(assert (=> d!161513 (= res!1063726 (not lt!669776))))

(declare-fun lt!669778 () Bool)

(assert (=> d!161513 (= lt!669776 lt!669778)))

(declare-fun lt!669775 () Unit!51610)

(declare-fun e!865446 () Unit!51610)

(assert (=> d!161513 (= lt!669775 e!865446)))

(declare-fun c!143348 () Bool)

(assert (=> d!161513 (= c!143348 lt!669778)))

(assert (=> d!161513 (= lt!669778 (containsKey!774 (toList!11253 lm!249) a0!49))))

(assert (=> d!161513 (= (contains!10122 lm!249 a0!49) lt!669776)))

(declare-fun b!1554249 () Bool)

(declare-fun lt!669777 () Unit!51610)

(assert (=> b!1554249 (= e!865446 lt!669777)))

(assert (=> b!1554249 (= lt!669777 (lemmaContainsKeyImpliesGetValueByKeyDefined!518 (toList!11253 lm!249) a0!49))))

(assert (=> b!1554249 (isDefined!569 (getValueByKey!757 (toList!11253 lm!249) a0!49))))

(declare-fun b!1554250 () Bool)

(declare-fun Unit!51616 () Unit!51610)

(assert (=> b!1554250 (= e!865446 Unit!51616)))

(declare-fun b!1554251 () Bool)

(assert (=> b!1554251 (= e!865447 (isDefined!569 (getValueByKey!757 (toList!11253 lm!249) a0!49)))))

(assert (= (and d!161513 c!143348) b!1554249))

(assert (= (and d!161513 (not c!143348)) b!1554250))

(assert (= (and d!161513 (not res!1063726)) b!1554251))

(assert (=> d!161513 m!1431907))

(assert (=> b!1554249 m!1431901))

(assert (=> b!1554249 m!1431895))

(assert (=> b!1554249 m!1431895))

(assert (=> b!1554249 m!1431899))

(assert (=> b!1554251 m!1431895))

(assert (=> b!1554251 m!1431895))

(assert (=> b!1554251 m!1431899))

(assert (=> start!132558 d!161513))

(declare-fun d!161527 () Bool)

(assert (=> d!161527 (= (inv!57351 lm!249) (isStrictlySorted!903 (toList!11253 lm!249)))))

(declare-fun bs!44644 () Bool)

(assert (= bs!44644 d!161527))

(assert (=> bs!44644 m!1431885))

(assert (=> start!132558 d!161527))

(declare-fun d!161529 () Bool)

(declare-fun res!1063731 () Bool)

(declare-fun e!865452 () Bool)

(assert (=> d!161529 (=> res!1063731 e!865452)))

(assert (=> d!161529 (= res!1063731 (and ((_ is Cons!36284) (toList!11253 lm!249)) (= (_1!12444 (h!37731 (toList!11253 lm!249))) a0!49)))))

(assert (=> d!161529 (= (containsKey!774 (toList!11253 lm!249) a0!49) e!865452)))

(declare-fun b!1554256 () Bool)

(declare-fun e!865453 () Bool)

(assert (=> b!1554256 (= e!865452 e!865453)))

(declare-fun res!1063732 () Bool)

(assert (=> b!1554256 (=> (not res!1063732) (not e!865453))))

(assert (=> b!1554256 (= res!1063732 (and (or (not ((_ is Cons!36284) (toList!11253 lm!249))) (bvsle (_1!12444 (h!37731 (toList!11253 lm!249))) a0!49)) ((_ is Cons!36284) (toList!11253 lm!249)) (bvslt (_1!12444 (h!37731 (toList!11253 lm!249))) a0!49)))))

(declare-fun b!1554257 () Bool)

(assert (=> b!1554257 (= e!865453 (containsKey!774 (t!51001 (toList!11253 lm!249)) a0!49))))

(assert (= (and d!161529 (not res!1063731)) b!1554256))

(assert (= (and b!1554256 res!1063732) b!1554257))

(declare-fun m!1431985 () Bool)

(assert (=> b!1554257 m!1431985))

(assert (=> b!1554163 d!161529))

(assert (=> b!1554162 d!161509))

(declare-fun d!161531 () Bool)

(declare-fun isEmpty!1144 (Option!832) Bool)

(assert (=> d!161531 (= (isDefined!569 (getValueByKey!757 (toList!11253 lm!249) a0!49)) (not (isEmpty!1144 (getValueByKey!757 (toList!11253 lm!249) a0!49))))))

(declare-fun bs!44645 () Bool)

(assert (= bs!44645 d!161531))

(assert (=> bs!44645 m!1431895))

(declare-fun m!1431987 () Bool)

(assert (=> bs!44645 m!1431987))

(assert (=> b!1554162 d!161531))

(declare-fun d!161533 () Bool)

(assert (=> d!161533 (isDefined!569 (getValueByKey!757 (toList!11253 lm!249) a0!49))))

(declare-fun lt!669795 () Unit!51610)

(declare-fun choose!2059 (List!36288 (_ BitVec 64)) Unit!51610)

(assert (=> d!161533 (= lt!669795 (choose!2059 (toList!11253 lm!249) a0!49))))

(declare-fun e!865467 () Bool)

(assert (=> d!161533 e!865467))

(declare-fun res!1063741 () Bool)

(assert (=> d!161533 (=> (not res!1063741) (not e!865467))))

(assert (=> d!161533 (= res!1063741 (isStrictlySorted!903 (toList!11253 lm!249)))))

(assert (=> d!161533 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!518 (toList!11253 lm!249) a0!49) lt!669795)))

(declare-fun b!1554282 () Bool)

(assert (=> b!1554282 (= e!865467 (containsKey!774 (toList!11253 lm!249) a0!49))))

(assert (= (and d!161533 res!1063741) b!1554282))

(assert (=> d!161533 m!1431895))

(assert (=> d!161533 m!1431895))

(assert (=> d!161533 m!1431899))

(declare-fun m!1431991 () Bool)

(assert (=> d!161533 m!1431991))

(assert (=> d!161533 m!1431885))

(assert (=> b!1554282 m!1431907))

(assert (=> b!1554162 d!161533))

(declare-fun d!161535 () Bool)

(declare-fun get!26060 (Option!832) B!2246)

(assert (=> d!161535 (= (apply!1100 lm!249 a0!49) (get!26060 (getValueByKey!757 (toList!11253 lm!249) a0!49)))))

(declare-fun bs!44646 () Bool)

(assert (= bs!44646 d!161535))

(assert (=> bs!44646 m!1431895))

(assert (=> bs!44646 m!1431895))

(declare-fun m!1432003 () Bool)

(assert (=> bs!44646 m!1432003))

(assert (=> b!1554162 d!161535))

(declare-fun d!161539 () Bool)

(assert (=> d!161539 (= (apply!1100 (+!5046 lm!249 (tuple2!24867 a!523 b!96)) a0!49) (get!26060 (getValueByKey!757 (toList!11253 (+!5046 lm!249 (tuple2!24867 a!523 b!96))) a0!49)))))

(declare-fun bs!44647 () Bool)

(assert (= bs!44647 d!161539))

(declare-fun m!1432005 () Bool)

(assert (=> bs!44647 m!1432005))

(assert (=> bs!44647 m!1432005))

(declare-fun m!1432007 () Bool)

(assert (=> bs!44647 m!1432007))

(assert (=> b!1554162 d!161539))

(declare-fun d!161541 () Bool)

(declare-fun e!865493 () Bool)

(assert (=> d!161541 e!865493))

(declare-fun res!1063768 () Bool)

(assert (=> d!161541 (=> (not res!1063768) (not e!865493))))

(declare-fun lt!669809 () ListLongMap!22475)

(assert (=> d!161541 (= res!1063768 (contains!10122 lt!669809 (_1!12444 (tuple2!24867 a!523 b!96))))))

(declare-fun lt!669807 () List!36288)

(assert (=> d!161541 (= lt!669809 (ListLongMap!22476 lt!669807))))

(declare-fun lt!669808 () Unit!51610)

(declare-fun lt!669810 () Unit!51610)

(assert (=> d!161541 (= lt!669808 lt!669810)))

(assert (=> d!161541 (= (getValueByKey!757 lt!669807 (_1!12444 (tuple2!24867 a!523 b!96))) (Some!831 (_2!12444 (tuple2!24867 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!380 (List!36288 (_ BitVec 64) B!2246) Unit!51610)

(assert (=> d!161541 (= lt!669810 (lemmaContainsTupThenGetReturnValue!380 lt!669807 (_1!12444 (tuple2!24867 a!523 b!96)) (_2!12444 (tuple2!24867 a!523 b!96))))))

(assert (=> d!161541 (= lt!669807 (insertStrictlySorted!517 (toList!11253 lm!249) (_1!12444 (tuple2!24867 a!523 b!96)) (_2!12444 (tuple2!24867 a!523 b!96))))))

(assert (=> d!161541 (= (+!5046 lm!249 (tuple2!24867 a!523 b!96)) lt!669809)))

(declare-fun b!1554317 () Bool)

(declare-fun res!1063769 () Bool)

(assert (=> b!1554317 (=> (not res!1063769) (not e!865493))))

(assert (=> b!1554317 (= res!1063769 (= (getValueByKey!757 (toList!11253 lt!669809) (_1!12444 (tuple2!24867 a!523 b!96))) (Some!831 (_2!12444 (tuple2!24867 a!523 b!96)))))))

(declare-fun b!1554318 () Bool)

(declare-fun contains!10127 (List!36288 tuple2!24866) Bool)

(assert (=> b!1554318 (= e!865493 (contains!10127 (toList!11253 lt!669809) (tuple2!24867 a!523 b!96)))))

(assert (= (and d!161541 res!1063768) b!1554317))

(assert (= (and b!1554317 res!1063769) b!1554318))

(declare-fun m!1432023 () Bool)

(assert (=> d!161541 m!1432023))

(declare-fun m!1432025 () Bool)

(assert (=> d!161541 m!1432025))

(declare-fun m!1432027 () Bool)

(assert (=> d!161541 m!1432027))

(declare-fun m!1432029 () Bool)

(assert (=> d!161541 m!1432029))

(declare-fun m!1432031 () Bool)

(assert (=> b!1554317 m!1432031))

(declare-fun m!1432033 () Bool)

(assert (=> b!1554318 m!1432033))

(assert (=> b!1554162 d!161541))

(declare-fun d!161549 () Bool)

(declare-fun res!1063776 () Bool)

(declare-fun e!865504 () Bool)

(assert (=> d!161549 (=> res!1063776 e!865504)))

(assert (=> d!161549 (= res!1063776 (or ((_ is Nil!36285) (toList!11253 lm!249)) ((_ is Nil!36285) (t!51001 (toList!11253 lm!249)))))))

(assert (=> d!161549 (= (isStrictlySorted!903 (toList!11253 lm!249)) e!865504)))

(declare-fun b!1554333 () Bool)

(declare-fun e!865505 () Bool)

(assert (=> b!1554333 (= e!865504 e!865505)))

(declare-fun res!1063777 () Bool)

(assert (=> b!1554333 (=> (not res!1063777) (not e!865505))))

(assert (=> b!1554333 (= res!1063777 (bvslt (_1!12444 (h!37731 (toList!11253 lm!249))) (_1!12444 (h!37731 (t!51001 (toList!11253 lm!249))))))))

(declare-fun b!1554334 () Bool)

(assert (=> b!1554334 (= e!865505 (isStrictlySorted!903 (t!51001 (toList!11253 lm!249))))))

(assert (= (and d!161549 (not res!1063776)) b!1554333))

(assert (= (and b!1554333 res!1063777) b!1554334))

(declare-fun m!1432041 () Bool)

(assert (=> b!1554334 m!1432041))

(assert (=> b!1554161 d!161549))

(declare-fun d!161553 () Bool)

(declare-fun res!1063778 () Bool)

(declare-fun e!865506 () Bool)

(assert (=> d!161553 (=> res!1063778 e!865506)))

(assert (=> d!161553 (= res!1063778 (and ((_ is Cons!36284) lt!669743) (= (_1!12444 (h!37731 lt!669743)) a0!49)))))

(assert (=> d!161553 (= (containsKey!774 lt!669743 a0!49) e!865506)))

(declare-fun b!1554335 () Bool)

(declare-fun e!865507 () Bool)

(assert (=> b!1554335 (= e!865506 e!865507)))

(declare-fun res!1063779 () Bool)

(assert (=> b!1554335 (=> (not res!1063779) (not e!865507))))

(assert (=> b!1554335 (= res!1063779 (and (or (not ((_ is Cons!36284) lt!669743)) (bvsle (_1!12444 (h!37731 lt!669743)) a0!49)) ((_ is Cons!36284) lt!669743) (bvslt (_1!12444 (h!37731 lt!669743)) a0!49)))))

(declare-fun b!1554336 () Bool)

(assert (=> b!1554336 (= e!865507 (containsKey!774 (t!51001 lt!669743) a0!49))))

(assert (= (and d!161553 (not res!1063778)) b!1554335))

(assert (= (and b!1554335 res!1063779) b!1554336))

(declare-fun m!1432043 () Bool)

(assert (=> b!1554336 m!1432043))

(assert (=> b!1554161 d!161553))

(declare-fun bm!71414 () Bool)

(declare-fun call!71417 () List!36288)

(declare-fun call!71418 () List!36288)

(assert (=> bm!71414 (= call!71417 call!71418)))

(declare-fun b!1554404 () Bool)

(declare-fun lt!669831 () List!36288)

(declare-fun e!865546 () Bool)

(assert (=> b!1554404 (= e!865546 (contains!10127 lt!669831 (tuple2!24867 a!523 b!96)))))

(declare-fun d!161555 () Bool)

(assert (=> d!161555 e!865546))

(declare-fun res!1063803 () Bool)

(assert (=> d!161555 (=> (not res!1063803) (not e!865546))))

(assert (=> d!161555 (= res!1063803 (isStrictlySorted!903 lt!669831))))

(declare-fun e!865549 () List!36288)

(assert (=> d!161555 (= lt!669831 e!865549)))

(declare-fun c!143387 () Bool)

(assert (=> d!161555 (= c!143387 (and ((_ is Cons!36284) (toList!11253 lm!249)) (bvslt (_1!12444 (h!37731 (toList!11253 lm!249))) a!523)))))

(assert (=> d!161555 (isStrictlySorted!903 (toList!11253 lm!249))))

(assert (=> d!161555 (= (insertStrictlySorted!517 (toList!11253 lm!249) a!523 b!96) lt!669831)))

(declare-fun e!865547 () List!36288)

(declare-fun b!1554405 () Bool)

(assert (=> b!1554405 (= e!865547 (insertStrictlySorted!517 (t!51001 (toList!11253 lm!249)) a!523 b!96))))

(declare-fun b!1554406 () Bool)

(declare-fun e!865550 () List!36288)

(declare-fun call!71419 () List!36288)

(assert (=> b!1554406 (= e!865550 call!71419)))

(declare-fun b!1554407 () Bool)

(declare-fun e!865548 () List!36288)

(assert (=> b!1554407 (= e!865549 e!865548)))

(declare-fun c!143389 () Bool)

(assert (=> b!1554407 (= c!143389 (and ((_ is Cons!36284) (toList!11253 lm!249)) (= (_1!12444 (h!37731 (toList!11253 lm!249))) a!523)))))

(declare-fun b!1554408 () Bool)

(declare-fun c!143388 () Bool)

(assert (=> b!1554408 (= c!143388 (and ((_ is Cons!36284) (toList!11253 lm!249)) (bvsgt (_1!12444 (h!37731 (toList!11253 lm!249))) a!523)))))

(assert (=> b!1554408 (= e!865548 e!865550)))

(declare-fun b!1554409 () Bool)

(assert (=> b!1554409 (= e!865547 (ite c!143389 (t!51001 (toList!11253 lm!249)) (ite c!143388 (Cons!36284 (h!37731 (toList!11253 lm!249)) (t!51001 (toList!11253 lm!249))) Nil!36285)))))

(declare-fun bm!71415 () Bool)

(declare-fun $colon$colon!954 (List!36288 tuple2!24866) List!36288)

(assert (=> bm!71415 (= call!71418 ($colon$colon!954 e!865547 (ite c!143387 (h!37731 (toList!11253 lm!249)) (tuple2!24867 a!523 b!96))))))

(declare-fun c!143390 () Bool)

(assert (=> bm!71415 (= c!143390 c!143387)))

(declare-fun b!1554410 () Bool)

(declare-fun res!1063804 () Bool)

(assert (=> b!1554410 (=> (not res!1063804) (not e!865546))))

(assert (=> b!1554410 (= res!1063804 (containsKey!774 lt!669831 a!523))))

(declare-fun b!1554411 () Bool)

(assert (=> b!1554411 (= e!865548 call!71417)))

(declare-fun bm!71416 () Bool)

(assert (=> bm!71416 (= call!71419 call!71417)))

(declare-fun b!1554412 () Bool)

(assert (=> b!1554412 (= e!865550 call!71419)))

(declare-fun b!1554413 () Bool)

(assert (=> b!1554413 (= e!865549 call!71418)))

(assert (= (and d!161555 c!143387) b!1554413))

(assert (= (and d!161555 (not c!143387)) b!1554407))

(assert (= (and b!1554407 c!143389) b!1554411))

(assert (= (and b!1554407 (not c!143389)) b!1554408))

(assert (= (and b!1554408 c!143388) b!1554406))

(assert (= (and b!1554408 (not c!143388)) b!1554412))

(assert (= (or b!1554406 b!1554412) bm!71416))

(assert (= (or b!1554411 bm!71416) bm!71414))

(assert (= (or b!1554413 bm!71414) bm!71415))

(assert (= (and bm!71415 c!143390) b!1554405))

(assert (= (and bm!71415 (not c!143390)) b!1554409))

(assert (= (and d!161555 res!1063803) b!1554410))

(assert (= (and b!1554410 res!1063804) b!1554404))

(declare-fun m!1432073 () Bool)

(assert (=> bm!71415 m!1432073))

(declare-fun m!1432075 () Bool)

(assert (=> b!1554404 m!1432075))

(declare-fun m!1432077 () Bool)

(assert (=> d!161555 m!1432077))

(assert (=> d!161555 m!1431885))

(declare-fun m!1432079 () Bool)

(assert (=> b!1554410 m!1432079))

(declare-fun m!1432081 () Bool)

(assert (=> b!1554405 m!1432081))

(assert (=> b!1554161 d!161555))

(declare-fun d!161571 () Bool)

(declare-fun e!865568 () Bool)

(assert (=> d!161571 e!865568))

(declare-fun res!1063819 () Bool)

(assert (=> d!161571 (=> (not res!1063819) (not e!865568))))

(assert (=> d!161571 (= res!1063819 (= (containsKey!774 (insertStrictlySorted!517 (toList!11253 lm!249) a!523 b!96) a0!49) (containsKey!774 (toList!11253 lm!249) a0!49)))))

(declare-fun lt!669858 () Unit!51610)

(declare-fun choose!2062 (List!36288 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51610)

(assert (=> d!161571 (= lt!669858 (choose!2062 (toList!11253 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865569 () Bool)

(assert (=> d!161571 e!865569))

(declare-fun res!1063818 () Bool)

(assert (=> d!161571 (=> (not res!1063818) (not e!865569))))

(assert (=> d!161571 (= res!1063818 (isStrictlySorted!903 (toList!11253 lm!249)))))

(assert (=> d!161571 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11253 lm!249) a!523 b!96 a0!49) lt!669858)))

(declare-fun b!1554437 () Bool)

(assert (=> b!1554437 (= e!865569 (not (= a!523 a0!49)))))

(declare-fun b!1554438 () Bool)

(assert (=> b!1554438 (= e!865568 (= (getValueByKey!757 (insertStrictlySorted!517 (toList!11253 lm!249) a!523 b!96) a0!49) (getValueByKey!757 (toList!11253 lm!249) a0!49)))))

(assert (= (and d!161571 res!1063818) b!1554437))

(assert (= (and d!161571 res!1063819) b!1554438))

(assert (=> d!161571 m!1431889))

(declare-fun m!1432097 () Bool)

(assert (=> d!161571 m!1432097))

(assert (=> d!161571 m!1431889))

(declare-fun m!1432099 () Bool)

(assert (=> d!161571 m!1432099))

(assert (=> d!161571 m!1431907))

(assert (=> d!161571 m!1431885))

(assert (=> b!1554438 m!1431889))

(assert (=> b!1554438 m!1431889))

(declare-fun m!1432101 () Bool)

(assert (=> b!1554438 m!1432101))

(assert (=> b!1554438 m!1431895))

(assert (=> b!1554161 d!161571))

(declare-fun b!1554453 () Bool)

(declare-fun e!865578 () Bool)

(declare-fun tp!112210 () Bool)

(assert (=> b!1554453 (= e!865578 (and tp_is_empty!38257 tp!112210))))

(assert (=> b!1554159 (= tp!112201 e!865578)))

(assert (= (and b!1554159 ((_ is Cons!36284) (toList!11253 lm!249))) b!1554453))

(check-sat (not d!161513) (not d!161535) (not b!1554222) (not d!161571) (not b!1554249) (not b!1554251) (not b!1554282) tp_is_empty!38257 (not b!1554438) (not d!161539) (not b!1554410) (not d!161527) (not bm!71415) (not d!161541) (not b!1554334) (not b!1554318) (not b!1554257) (not b!1554404) (not d!161555) (not b!1554336) (not b!1554405) (not b!1554230) (not b!1554317) (not d!161533) (not b!1554453) (not d!161531))
(check-sat)
