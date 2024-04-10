; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132610 () Bool)

(assert start!132610)

(declare-datatypes ((B!2248 0))(
  ( (B!2249 (val!19210 Int)) )
))
(declare-datatypes ((tuple2!24796 0))(
  ( (tuple2!24797 (_1!12409 (_ BitVec 64)) (_2!12409 B!2248)) )
))
(declare-datatypes ((List!36244 0))(
  ( (Nil!36241) (Cons!36240 (h!37686 tuple2!24796) (t!50965 List!36244)) )
))
(declare-fun lt!670038 () List!36244)

(declare-datatypes ((ListLongMap!22405 0))(
  ( (ListLongMap!22406 (toList!11218 List!36244)) )
))
(declare-fun lm!249 () ListLongMap!22405)

(declare-fun e!865598 () Bool)

(declare-fun b!1554489 () Bool)

(declare-fun a0!49 () (_ BitVec 64))

(declare-datatypes ((Option!831 0))(
  ( (Some!830 (v!22015 B!2248)) (None!829) )
))
(declare-fun getValueByKey!755 (List!36244 (_ BitVec 64)) Option!831)

(assert (=> b!1554489 (= e!865598 (= (getValueByKey!755 lt!670038 a0!49) (getValueByKey!755 (toList!11218 lm!249) a0!49)))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2248)

(declare-fun b!1554490 () Bool)

(declare-fun e!865596 () Bool)

(declare-fun apply!1114 (ListLongMap!22405 (_ BitVec 64)) B!2248)

(declare-fun +!5016 (ListLongMap!22405 tuple2!24796) ListLongMap!22405)

(assert (=> b!1554490 (= e!865596 (= (apply!1114 (+!5016 lm!249 (tuple2!24797 a!523 b!96)) a0!49) (apply!1114 lm!249 a0!49)))))

(declare-fun isDefined!568 (Option!831) Bool)

(assert (=> b!1554490 (isDefined!568 (getValueByKey!755 (toList!11218 lm!249) a0!49))))

(declare-datatypes ((Unit!51796 0))(
  ( (Unit!51797) )
))
(declare-fun lt!670040 () Unit!51796)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!520 (List!36244 (_ BitVec 64)) Unit!51796)

(assert (=> b!1554490 (= lt!670040 (lemmaContainsKeyImpliesGetValueByKeyDefined!520 (toList!11218 lm!249) a0!49))))

(declare-fun b!1554492 () Bool)

(declare-fun e!865595 () Bool)

(assert (=> b!1554492 (= e!865595 (not e!865596))))

(declare-fun res!1063818 () Bool)

(assert (=> b!1554492 (=> res!1063818 e!865596)))

(declare-fun isStrictlySorted!906 (List!36244) Bool)

(assert (=> b!1554492 (= res!1063818 (not (isStrictlySorted!906 (toList!11218 lm!249))))))

(assert (=> b!1554492 e!865598))

(declare-fun res!1063822 () Bool)

(assert (=> b!1554492 (=> (not res!1063822) (not e!865598))))

(declare-fun containsKey!777 (List!36244 (_ BitVec 64)) Bool)

(assert (=> b!1554492 (= res!1063822 (containsKey!777 lt!670038 a0!49))))

(declare-fun insertStrictlySorted!517 (List!36244 (_ BitVec 64) B!2248) List!36244)

(assert (=> b!1554492 (= lt!670038 (insertStrictlySorted!517 (toList!11218 lm!249) a!523 b!96))))

(declare-fun lt!670039 () Unit!51796)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!14 (List!36244 (_ BitVec 64) B!2248 (_ BitVec 64)) Unit!51796)

(assert (=> b!1554492 (= lt!670039 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!14 (toList!11218 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1554493 () Bool)

(declare-fun e!865597 () Bool)

(declare-fun tp!112203 () Bool)

(assert (=> b!1554493 (= e!865597 tp!112203)))

(declare-fun b!1554494 () Bool)

(declare-fun res!1063819 () Bool)

(assert (=> b!1554494 (=> (not res!1063819) (not e!865595))))

(assert (=> b!1554494 (= res!1063819 (not (= a0!49 a!523)))))

(declare-fun res!1063821 () Bool)

(assert (=> start!132610 (=> (not res!1063821) (not e!865595))))

(declare-fun contains!10166 (ListLongMap!22405 (_ BitVec 64)) Bool)

(assert (=> start!132610 (= res!1063821 (contains!10166 lm!249 a0!49))))

(assert (=> start!132610 e!865595))

(declare-fun inv!57352 (ListLongMap!22405) Bool)

(assert (=> start!132610 (and (inv!57352 lm!249) e!865597)))

(assert (=> start!132610 true))

(declare-fun tp_is_empty!38259 () Bool)

(assert (=> start!132610 tp_is_empty!38259))

(declare-fun b!1554491 () Bool)

(declare-fun res!1063820 () Bool)

(assert (=> b!1554491 (=> (not res!1063820) (not e!865595))))

(assert (=> b!1554491 (= res!1063820 (containsKey!777 (toList!11218 lm!249) a0!49))))

(assert (= (and start!132610 res!1063821) b!1554494))

(assert (= (and b!1554494 res!1063819) b!1554491))

(assert (= (and b!1554491 res!1063820) b!1554492))

(assert (= (and b!1554492 res!1063822) b!1554489))

(assert (= (and b!1554492 (not res!1063818)) b!1554490))

(assert (= start!132610 b!1554493))

(declare-fun m!1432801 () Bool)

(assert (=> b!1554491 m!1432801))

(declare-fun m!1432803 () Bool)

(assert (=> b!1554489 m!1432803))

(declare-fun m!1432805 () Bool)

(assert (=> b!1554489 m!1432805))

(declare-fun m!1432807 () Bool)

(assert (=> b!1554490 m!1432807))

(assert (=> b!1554490 m!1432805))

(declare-fun m!1432809 () Bool)

(assert (=> b!1554490 m!1432809))

(assert (=> b!1554490 m!1432805))

(declare-fun m!1432811 () Bool)

(assert (=> b!1554490 m!1432811))

(declare-fun m!1432813 () Bool)

(assert (=> b!1554490 m!1432813))

(assert (=> b!1554490 m!1432809))

(declare-fun m!1432815 () Bool)

(assert (=> b!1554490 m!1432815))

(declare-fun m!1432817 () Bool)

(assert (=> start!132610 m!1432817))

(declare-fun m!1432819 () Bool)

(assert (=> start!132610 m!1432819))

(declare-fun m!1432821 () Bool)

(assert (=> b!1554492 m!1432821))

(declare-fun m!1432823 () Bool)

(assert (=> b!1554492 m!1432823))

(declare-fun m!1432825 () Bool)

(assert (=> b!1554492 m!1432825))

(declare-fun m!1432827 () Bool)

(assert (=> b!1554492 m!1432827))

(check-sat (not b!1554491) (not b!1554492) tp_is_empty!38259 (not start!132610) (not b!1554489) (not b!1554493) (not b!1554490))
(check-sat)
(get-model)

(declare-fun d!161759 () Bool)

(declare-fun res!1063846 () Bool)

(declare-fun e!865625 () Bool)

(assert (=> d!161759 (=> res!1063846 e!865625)))

(get-info :version)

(assert (=> d!161759 (= res!1063846 (and ((_ is Cons!36240) (toList!11218 lm!249)) (= (_1!12409 (h!37686 (toList!11218 lm!249))) a0!49)))))

(assert (=> d!161759 (= (containsKey!777 (toList!11218 lm!249) a0!49) e!865625)))

(declare-fun b!1554533 () Bool)

(declare-fun e!865626 () Bool)

(assert (=> b!1554533 (= e!865625 e!865626)))

(declare-fun res!1063847 () Bool)

(assert (=> b!1554533 (=> (not res!1063847) (not e!865626))))

(assert (=> b!1554533 (= res!1063847 (and (or (not ((_ is Cons!36240) (toList!11218 lm!249))) (bvsle (_1!12409 (h!37686 (toList!11218 lm!249))) a0!49)) ((_ is Cons!36240) (toList!11218 lm!249)) (bvslt (_1!12409 (h!37686 (toList!11218 lm!249))) a0!49)))))

(declare-fun b!1554534 () Bool)

(assert (=> b!1554534 (= e!865626 (containsKey!777 (t!50965 (toList!11218 lm!249)) a0!49))))

(assert (= (and d!161759 (not res!1063846)) b!1554533))

(assert (= (and b!1554533 res!1063847) b!1554534))

(declare-fun m!1432859 () Bool)

(assert (=> b!1554534 m!1432859))

(assert (=> b!1554491 d!161759))

(declare-fun d!161765 () Bool)

(declare-fun c!143431 () Bool)

(assert (=> d!161765 (= c!143431 (and ((_ is Cons!36240) lt!670038) (= (_1!12409 (h!37686 lt!670038)) a0!49)))))

(declare-fun e!865644 () Option!831)

(assert (=> d!161765 (= (getValueByKey!755 lt!670038 a0!49) e!865644)))

(declare-fun b!1554556 () Bool)

(assert (=> b!1554556 (= e!865644 (Some!830 (_2!12409 (h!37686 lt!670038))))))

(declare-fun b!1554557 () Bool)

(declare-fun e!865645 () Option!831)

(assert (=> b!1554557 (= e!865644 e!865645)))

(declare-fun c!143432 () Bool)

(assert (=> b!1554557 (= c!143432 (and ((_ is Cons!36240) lt!670038) (not (= (_1!12409 (h!37686 lt!670038)) a0!49))))))

(declare-fun b!1554558 () Bool)

(assert (=> b!1554558 (= e!865645 (getValueByKey!755 (t!50965 lt!670038) a0!49))))

(declare-fun b!1554559 () Bool)

(assert (=> b!1554559 (= e!865645 None!829)))

(assert (= (and d!161765 c!143431) b!1554556))

(assert (= (and d!161765 (not c!143431)) b!1554557))

(assert (= (and b!1554557 c!143432) b!1554558))

(assert (= (and b!1554557 (not c!143432)) b!1554559))

(declare-fun m!1432871 () Bool)

(assert (=> b!1554558 m!1432871))

(assert (=> b!1554489 d!161765))

(declare-fun d!161777 () Bool)

(declare-fun c!143433 () Bool)

(assert (=> d!161777 (= c!143433 (and ((_ is Cons!36240) (toList!11218 lm!249)) (= (_1!12409 (h!37686 (toList!11218 lm!249))) a0!49)))))

(declare-fun e!865646 () Option!831)

(assert (=> d!161777 (= (getValueByKey!755 (toList!11218 lm!249) a0!49) e!865646)))

(declare-fun b!1554560 () Bool)

(assert (=> b!1554560 (= e!865646 (Some!830 (_2!12409 (h!37686 (toList!11218 lm!249)))))))

(declare-fun b!1554561 () Bool)

(declare-fun e!865647 () Option!831)

(assert (=> b!1554561 (= e!865646 e!865647)))

(declare-fun c!143434 () Bool)

(assert (=> b!1554561 (= c!143434 (and ((_ is Cons!36240) (toList!11218 lm!249)) (not (= (_1!12409 (h!37686 (toList!11218 lm!249))) a0!49))))))

(declare-fun b!1554562 () Bool)

(assert (=> b!1554562 (= e!865647 (getValueByKey!755 (t!50965 (toList!11218 lm!249)) a0!49))))

(declare-fun b!1554563 () Bool)

(assert (=> b!1554563 (= e!865647 None!829)))

(assert (= (and d!161777 c!143433) b!1554560))

(assert (= (and d!161777 (not c!143433)) b!1554561))

(assert (= (and b!1554561 c!143434) b!1554562))

(assert (= (and b!1554561 (not c!143434)) b!1554563))

(declare-fun m!1432873 () Bool)

(assert (=> b!1554562 m!1432873))

(assert (=> b!1554489 d!161777))

(assert (=> b!1554490 d!161777))

(declare-fun d!161779 () Bool)

(declare-fun isEmpty!1139 (Option!831) Bool)

(assert (=> d!161779 (= (isDefined!568 (getValueByKey!755 (toList!11218 lm!249) a0!49)) (not (isEmpty!1139 (getValueByKey!755 (toList!11218 lm!249) a0!49))))))

(declare-fun bs!44688 () Bool)

(assert (= bs!44688 d!161779))

(assert (=> bs!44688 m!1432805))

(declare-fun m!1432875 () Bool)

(assert (=> bs!44688 m!1432875))

(assert (=> b!1554490 d!161779))

(declare-fun d!161781 () Bool)

(assert (=> d!161781 (isDefined!568 (getValueByKey!755 (toList!11218 lm!249) a0!49))))

(declare-fun lt!670055 () Unit!51796)

(declare-fun choose!2050 (List!36244 (_ BitVec 64)) Unit!51796)

(assert (=> d!161781 (= lt!670055 (choose!2050 (toList!11218 lm!249) a0!49))))

(declare-fun e!865650 () Bool)

(assert (=> d!161781 e!865650))

(declare-fun res!1063863 () Bool)

(assert (=> d!161781 (=> (not res!1063863) (not e!865650))))

(assert (=> d!161781 (= res!1063863 (isStrictlySorted!906 (toList!11218 lm!249)))))

(assert (=> d!161781 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!520 (toList!11218 lm!249) a0!49) lt!670055)))

(declare-fun b!1554566 () Bool)

(assert (=> b!1554566 (= e!865650 (containsKey!777 (toList!11218 lm!249) a0!49))))

(assert (= (and d!161781 res!1063863) b!1554566))

(assert (=> d!161781 m!1432805))

(assert (=> d!161781 m!1432805))

(assert (=> d!161781 m!1432811))

(declare-fun m!1432883 () Bool)

(assert (=> d!161781 m!1432883))

(assert (=> d!161781 m!1432821))

(assert (=> b!1554566 m!1432801))

(assert (=> b!1554490 d!161781))

(declare-fun d!161787 () Bool)

(declare-fun get!26061 (Option!831) B!2248)

(assert (=> d!161787 (= (apply!1114 lm!249 a0!49) (get!26061 (getValueByKey!755 (toList!11218 lm!249) a0!49)))))

(declare-fun bs!44691 () Bool)

(assert (= bs!44691 d!161787))

(assert (=> bs!44691 m!1432805))

(assert (=> bs!44691 m!1432805))

(declare-fun m!1432885 () Bool)

(assert (=> bs!44691 m!1432885))

(assert (=> b!1554490 d!161787))

(declare-fun d!161789 () Bool)

(assert (=> d!161789 (= (apply!1114 (+!5016 lm!249 (tuple2!24797 a!523 b!96)) a0!49) (get!26061 (getValueByKey!755 (toList!11218 (+!5016 lm!249 (tuple2!24797 a!523 b!96))) a0!49)))))

(declare-fun bs!44692 () Bool)

(assert (= bs!44692 d!161789))

(declare-fun m!1432887 () Bool)

(assert (=> bs!44692 m!1432887))

(assert (=> bs!44692 m!1432887))

(declare-fun m!1432889 () Bool)

(assert (=> bs!44692 m!1432889))

(assert (=> b!1554490 d!161789))

(declare-fun d!161791 () Bool)

(declare-fun e!865677 () Bool)

(assert (=> d!161791 e!865677))

(declare-fun res!1063886 () Bool)

(assert (=> d!161791 (=> (not res!1063886) (not e!865677))))

(declare-fun lt!670080 () ListLongMap!22405)

(assert (=> d!161791 (= res!1063886 (contains!10166 lt!670080 (_1!12409 (tuple2!24797 a!523 b!96))))))

(declare-fun lt!670082 () List!36244)

(assert (=> d!161791 (= lt!670080 (ListLongMap!22406 lt!670082))))

(declare-fun lt!670079 () Unit!51796)

(declare-fun lt!670081 () Unit!51796)

(assert (=> d!161791 (= lt!670079 lt!670081)))

(assert (=> d!161791 (= (getValueByKey!755 lt!670082 (_1!12409 (tuple2!24797 a!523 b!96))) (Some!830 (_2!12409 (tuple2!24797 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!378 (List!36244 (_ BitVec 64) B!2248) Unit!51796)

(assert (=> d!161791 (= lt!670081 (lemmaContainsTupThenGetReturnValue!378 lt!670082 (_1!12409 (tuple2!24797 a!523 b!96)) (_2!12409 (tuple2!24797 a!523 b!96))))))

(assert (=> d!161791 (= lt!670082 (insertStrictlySorted!517 (toList!11218 lm!249) (_1!12409 (tuple2!24797 a!523 b!96)) (_2!12409 (tuple2!24797 a!523 b!96))))))

(assert (=> d!161791 (= (+!5016 lm!249 (tuple2!24797 a!523 b!96)) lt!670080)))

(declare-fun b!1554613 () Bool)

(declare-fun res!1063887 () Bool)

(assert (=> b!1554613 (=> (not res!1063887) (not e!865677))))

(assert (=> b!1554613 (= res!1063887 (= (getValueByKey!755 (toList!11218 lt!670080) (_1!12409 (tuple2!24797 a!523 b!96))) (Some!830 (_2!12409 (tuple2!24797 a!523 b!96)))))))

(declare-fun b!1554614 () Bool)

(declare-fun contains!10169 (List!36244 tuple2!24796) Bool)

(assert (=> b!1554614 (= e!865677 (contains!10169 (toList!11218 lt!670080) (tuple2!24797 a!523 b!96)))))

(assert (= (and d!161791 res!1063886) b!1554613))

(assert (= (and b!1554613 res!1063887) b!1554614))

(declare-fun m!1432915 () Bool)

(assert (=> d!161791 m!1432915))

(declare-fun m!1432917 () Bool)

(assert (=> d!161791 m!1432917))

(declare-fun m!1432919 () Bool)

(assert (=> d!161791 m!1432919))

(declare-fun m!1432921 () Bool)

(assert (=> d!161791 m!1432921))

(declare-fun m!1432923 () Bool)

(assert (=> b!1554613 m!1432923))

(declare-fun m!1432925 () Bool)

(assert (=> b!1554614 m!1432925))

(assert (=> b!1554490 d!161791))

(declare-fun d!161799 () Bool)

(declare-fun e!865693 () Bool)

(assert (=> d!161799 e!865693))

(declare-fun res!1063900 () Bool)

(assert (=> d!161799 (=> res!1063900 e!865693)))

(declare-fun lt!670096 () Bool)

(assert (=> d!161799 (= res!1063900 (not lt!670096))))

(declare-fun lt!670095 () Bool)

(assert (=> d!161799 (= lt!670096 lt!670095)))

(declare-fun lt!670094 () Unit!51796)

(declare-fun e!865692 () Unit!51796)

(assert (=> d!161799 (= lt!670094 e!865692)))

(declare-fun c!143449 () Bool)

(assert (=> d!161799 (= c!143449 lt!670095)))

(assert (=> d!161799 (= lt!670095 (containsKey!777 (toList!11218 lm!249) a0!49))))

(assert (=> d!161799 (= (contains!10166 lm!249 a0!49) lt!670096)))

(declare-fun b!1554631 () Bool)

(declare-fun lt!670093 () Unit!51796)

(assert (=> b!1554631 (= e!865692 lt!670093)))

(assert (=> b!1554631 (= lt!670093 (lemmaContainsKeyImpliesGetValueByKeyDefined!520 (toList!11218 lm!249) a0!49))))

(assert (=> b!1554631 (isDefined!568 (getValueByKey!755 (toList!11218 lm!249) a0!49))))

(declare-fun b!1554632 () Bool)

(declare-fun Unit!51800 () Unit!51796)

(assert (=> b!1554632 (= e!865692 Unit!51800)))

(declare-fun b!1554633 () Bool)

(assert (=> b!1554633 (= e!865693 (isDefined!568 (getValueByKey!755 (toList!11218 lm!249) a0!49)))))

(assert (= (and d!161799 c!143449) b!1554631))

(assert (= (and d!161799 (not c!143449)) b!1554632))

(assert (= (and d!161799 (not res!1063900)) b!1554633))

(assert (=> d!161799 m!1432801))

(assert (=> b!1554631 m!1432813))

(assert (=> b!1554631 m!1432805))

(assert (=> b!1554631 m!1432805))

(assert (=> b!1554631 m!1432811))

(assert (=> b!1554633 m!1432805))

(assert (=> b!1554633 m!1432805))

(assert (=> b!1554633 m!1432811))

(assert (=> start!132610 d!161799))

(declare-fun d!161803 () Bool)

(assert (=> d!161803 (= (inv!57352 lm!249) (isStrictlySorted!906 (toList!11218 lm!249)))))

(declare-fun bs!44693 () Bool)

(assert (= bs!44693 d!161803))

(assert (=> bs!44693 m!1432821))

(assert (=> start!132610 d!161803))

(declare-fun d!161807 () Bool)

(declare-fun res!1063907 () Bool)

(declare-fun e!865704 () Bool)

(assert (=> d!161807 (=> res!1063907 e!865704)))

(assert (=> d!161807 (= res!1063907 (or ((_ is Nil!36241) (toList!11218 lm!249)) ((_ is Nil!36241) (t!50965 (toList!11218 lm!249)))))))

(assert (=> d!161807 (= (isStrictlySorted!906 (toList!11218 lm!249)) e!865704)))

(declare-fun b!1554650 () Bool)

(declare-fun e!865705 () Bool)

(assert (=> b!1554650 (= e!865704 e!865705)))

(declare-fun res!1063908 () Bool)

(assert (=> b!1554650 (=> (not res!1063908) (not e!865705))))

(assert (=> b!1554650 (= res!1063908 (bvslt (_1!12409 (h!37686 (toList!11218 lm!249))) (_1!12409 (h!37686 (t!50965 (toList!11218 lm!249))))))))

(declare-fun b!1554651 () Bool)

(assert (=> b!1554651 (= e!865705 (isStrictlySorted!906 (t!50965 (toList!11218 lm!249))))))

(assert (= (and d!161807 (not res!1063907)) b!1554650))

(assert (= (and b!1554650 res!1063908) b!1554651))

(declare-fun m!1432935 () Bool)

(assert (=> b!1554651 m!1432935))

(assert (=> b!1554492 d!161807))

(declare-fun d!161809 () Bool)

(declare-fun res!1063909 () Bool)

(declare-fun e!865712 () Bool)

(assert (=> d!161809 (=> res!1063909 e!865712)))

(assert (=> d!161809 (= res!1063909 (and ((_ is Cons!36240) lt!670038) (= (_1!12409 (h!37686 lt!670038)) a0!49)))))

(assert (=> d!161809 (= (containsKey!777 lt!670038 a0!49) e!865712)))

(declare-fun b!1554662 () Bool)

(declare-fun e!865713 () Bool)

(assert (=> b!1554662 (= e!865712 e!865713)))

(declare-fun res!1063910 () Bool)

(assert (=> b!1554662 (=> (not res!1063910) (not e!865713))))

(assert (=> b!1554662 (= res!1063910 (and (or (not ((_ is Cons!36240) lt!670038)) (bvsle (_1!12409 (h!37686 lt!670038)) a0!49)) ((_ is Cons!36240) lt!670038) (bvslt (_1!12409 (h!37686 lt!670038)) a0!49)))))

(declare-fun b!1554663 () Bool)

(assert (=> b!1554663 (= e!865713 (containsKey!777 (t!50965 lt!670038) a0!49))))

(assert (= (and d!161809 (not res!1063909)) b!1554662))

(assert (= (and b!1554662 res!1063910) b!1554663))

(declare-fun m!1432939 () Bool)

(assert (=> b!1554663 m!1432939))

(assert (=> b!1554492 d!161809))

(declare-fun b!1554732 () Bool)

(declare-fun e!865757 () List!36244)

(declare-fun e!865755 () List!36244)

(assert (=> b!1554732 (= e!865757 e!865755)))

(declare-fun c!143486 () Bool)

(assert (=> b!1554732 (= c!143486 (and ((_ is Cons!36240) (toList!11218 lm!249)) (= (_1!12409 (h!37686 (toList!11218 lm!249))) a!523)))))

(declare-fun c!143484 () Bool)

(declare-fun e!865754 () List!36244)

(declare-fun bm!71449 () Bool)

(declare-fun call!71454 () List!36244)

(declare-fun $colon$colon!952 (List!36244 tuple2!24796) List!36244)

(assert (=> bm!71449 (= call!71454 ($colon$colon!952 e!865754 (ite c!143484 (h!37686 (toList!11218 lm!249)) (tuple2!24797 a!523 b!96))))))

(declare-fun c!143483 () Bool)

(assert (=> bm!71449 (= c!143483 c!143484)))

(declare-fun c!143485 () Bool)

(declare-fun b!1554733 () Bool)

(assert (=> b!1554733 (= e!865754 (ite c!143486 (t!50965 (toList!11218 lm!249)) (ite c!143485 (Cons!36240 (h!37686 (toList!11218 lm!249)) (t!50965 (toList!11218 lm!249))) Nil!36241)))))

(declare-fun bm!71450 () Bool)

(declare-fun call!71453 () List!36244)

(declare-fun call!71452 () List!36244)

(assert (=> bm!71450 (= call!71453 call!71452)))

(declare-fun b!1554734 () Bool)

(assert (=> b!1554734 (= e!865757 call!71454)))

(declare-fun b!1554735 () Bool)

(declare-fun e!865756 () Bool)

(declare-fun lt!670121 () List!36244)

(assert (=> b!1554735 (= e!865756 (contains!10169 lt!670121 (tuple2!24797 a!523 b!96)))))

(declare-fun b!1554736 () Bool)

(declare-fun res!1063934 () Bool)

(assert (=> b!1554736 (=> (not res!1063934) (not e!865756))))

(assert (=> b!1554736 (= res!1063934 (containsKey!777 lt!670121 a!523))))

(declare-fun b!1554737 () Bool)

(declare-fun e!865758 () List!36244)

(assert (=> b!1554737 (= e!865758 call!71453)))

(declare-fun d!161813 () Bool)

(assert (=> d!161813 e!865756))

(declare-fun res!1063933 () Bool)

(assert (=> d!161813 (=> (not res!1063933) (not e!865756))))

(assert (=> d!161813 (= res!1063933 (isStrictlySorted!906 lt!670121))))

(assert (=> d!161813 (= lt!670121 e!865757)))

(assert (=> d!161813 (= c!143484 (and ((_ is Cons!36240) (toList!11218 lm!249)) (bvslt (_1!12409 (h!37686 (toList!11218 lm!249))) a!523)))))

(assert (=> d!161813 (isStrictlySorted!906 (toList!11218 lm!249))))

(assert (=> d!161813 (= (insertStrictlySorted!517 (toList!11218 lm!249) a!523 b!96) lt!670121)))

(declare-fun b!1554738 () Bool)

(assert (=> b!1554738 (= e!865754 (insertStrictlySorted!517 (t!50965 (toList!11218 lm!249)) a!523 b!96))))

(declare-fun bm!71451 () Bool)

(assert (=> bm!71451 (= call!71452 call!71454)))

(declare-fun b!1554739 () Bool)

(assert (=> b!1554739 (= c!143485 (and ((_ is Cons!36240) (toList!11218 lm!249)) (bvsgt (_1!12409 (h!37686 (toList!11218 lm!249))) a!523)))))

(assert (=> b!1554739 (= e!865755 e!865758)))

(declare-fun b!1554740 () Bool)

(assert (=> b!1554740 (= e!865755 call!71452)))

(declare-fun b!1554741 () Bool)

(assert (=> b!1554741 (= e!865758 call!71453)))

(assert (= (and d!161813 c!143484) b!1554734))

(assert (= (and d!161813 (not c!143484)) b!1554732))

(assert (= (and b!1554732 c!143486) b!1554740))

(assert (= (and b!1554732 (not c!143486)) b!1554739))

(assert (= (and b!1554739 c!143485) b!1554741))

(assert (= (and b!1554739 (not c!143485)) b!1554737))

(assert (= (or b!1554741 b!1554737) bm!71450))

(assert (= (or b!1554740 bm!71450) bm!71451))

(assert (= (or b!1554734 bm!71451) bm!71449))

(assert (= (and bm!71449 c!143483) b!1554738))

(assert (= (and bm!71449 (not c!143483)) b!1554733))

(assert (= (and d!161813 res!1063933) b!1554736))

(assert (= (and b!1554736 res!1063934) b!1554735))

(declare-fun m!1432971 () Bool)

(assert (=> bm!71449 m!1432971))

(declare-fun m!1432973 () Bool)

(assert (=> b!1554738 m!1432973))

(declare-fun m!1432975 () Bool)

(assert (=> b!1554735 m!1432975))

(declare-fun m!1432977 () Bool)

(assert (=> b!1554736 m!1432977))

(declare-fun m!1432979 () Bool)

(assert (=> d!161813 m!1432979))

(assert (=> d!161813 m!1432821))

(assert (=> b!1554492 d!161813))

(declare-fun d!161835 () Bool)

(declare-fun e!865774 () Bool)

(assert (=> d!161835 e!865774))

(declare-fun res!1063948 () Bool)

(assert (=> d!161835 (=> (not res!1063948) (not e!865774))))

(assert (=> d!161835 (= res!1063948 (= (containsKey!777 (insertStrictlySorted!517 (toList!11218 lm!249) a!523 b!96) a0!49) (containsKey!777 (toList!11218 lm!249) a0!49)))))

(declare-fun lt!670144 () Unit!51796)

(declare-fun choose!2053 (List!36244 (_ BitVec 64) B!2248 (_ BitVec 64)) Unit!51796)

(assert (=> d!161835 (= lt!670144 (choose!2053 (toList!11218 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865773 () Bool)

(assert (=> d!161835 e!865773))

(declare-fun res!1063949 () Bool)

(assert (=> d!161835 (=> (not res!1063949) (not e!865773))))

(assert (=> d!161835 (= res!1063949 (isStrictlySorted!906 (toList!11218 lm!249)))))

(assert (=> d!161835 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!14 (toList!11218 lm!249) a!523 b!96 a0!49) lt!670144)))

(declare-fun b!1554761 () Bool)

(assert (=> b!1554761 (= e!865773 (not (= a!523 a0!49)))))

(declare-fun b!1554762 () Bool)

(assert (=> b!1554762 (= e!865774 (= (getValueByKey!755 (insertStrictlySorted!517 (toList!11218 lm!249) a!523 b!96) a0!49) (getValueByKey!755 (toList!11218 lm!249) a0!49)))))

(assert (= (and d!161835 res!1063949) b!1554761))

(assert (= (and d!161835 res!1063948) b!1554762))

(assert (=> d!161835 m!1432801))

(assert (=> d!161835 m!1432825))

(declare-fun m!1432983 () Bool)

(assert (=> d!161835 m!1432983))

(assert (=> d!161835 m!1432825))

(assert (=> d!161835 m!1432821))

(declare-fun m!1432985 () Bool)

(assert (=> d!161835 m!1432985))

(assert (=> b!1554762 m!1432825))

(assert (=> b!1554762 m!1432825))

(declare-fun m!1432987 () Bool)

(assert (=> b!1554762 m!1432987))

(assert (=> b!1554762 m!1432805))

(assert (=> b!1554492 d!161835))

(declare-fun b!1554778 () Bool)

(declare-fun e!865783 () Bool)

(declare-fun tp!112214 () Bool)

(assert (=> b!1554778 (= e!865783 (and tp_is_empty!38259 tp!112214))))

(assert (=> b!1554493 (= tp!112203 e!865783)))

(assert (= (and b!1554493 ((_ is Cons!36240) (toList!11218 lm!249))) b!1554778))

(check-sat (not b!1554558) (not d!161779) (not b!1554663) (not b!1554762) (not b!1554631) (not d!161803) (not d!161787) (not b!1554613) (not bm!71449) (not d!161799) (not b!1554566) (not b!1554735) (not b!1554534) (not b!1554738) (not d!161791) (not d!161789) (not b!1554651) (not b!1554614) (not b!1554562) (not b!1554633) (not d!161835) tp_is_empty!38259 (not d!161781) (not d!161813) (not b!1554736) (not b!1554778))
(check-sat)
