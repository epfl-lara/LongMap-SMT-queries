; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136876 () Bool)

(assert start!136876)

(declare-fun b!1578997 () Bool)

(declare-fun res!1078883 () Bool)

(declare-fun e!880790 () Bool)

(assert (=> b!1578997 (=> (not res!1078883) (not e!880790))))

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578997 (= res!1078883 (not (= a0!51 a!525)))))

(declare-fun res!1078882 () Bool)

(assert (=> start!136876 (=> (not res!1078882) (not e!880790))))

(declare-datatypes ((B!2572 0))(
  ( (B!2573 (val!19648 Int)) )
))
(declare-datatypes ((tuple2!25398 0))(
  ( (tuple2!25399 (_1!12710 (_ BitVec 64)) (_2!12710 B!2572)) )
))
(declare-datatypes ((List!36768 0))(
  ( (Nil!36765) (Cons!36764 (h!38307 tuple2!25398) (t!51682 List!36768)) )
))
(declare-datatypes ((ListLongMap!22737 0))(
  ( (ListLongMap!22738 (toList!11384 List!36768)) )
))
(declare-fun lm!251 () ListLongMap!22737)

(declare-fun contains!10440 (ListLongMap!22737 (_ BitVec 64)) Bool)

(assert (=> start!136876 (= res!1078882 (not (contains!10440 lm!251 a0!51)))))

(assert (=> start!136876 e!880790))

(declare-fun e!880789 () Bool)

(declare-fun inv!58929 (ListLongMap!22737) Bool)

(assert (=> start!136876 (and (inv!58929 lm!251) e!880789)))

(assert (=> start!136876 true))

(declare-fun tp_is_empty!39117 () Bool)

(assert (=> start!136876 tp_is_empty!39117))

(declare-fun b!1578998 () Bool)

(declare-fun res!1078881 () Bool)

(assert (=> b!1578998 (=> (not res!1078881) (not e!880790))))

(assert (=> b!1578998 (= res!1078881 (not (= a!525 a0!51)))))

(declare-fun b!1578999 () Bool)

(declare-fun res!1078884 () Bool)

(assert (=> b!1578999 (=> (not res!1078884) (not e!880790))))

(declare-fun isStrictlySorted!1029 (List!36768) Bool)

(assert (=> b!1578999 (= res!1078884 (isStrictlySorted!1029 (toList!11384 lm!251)))))

(declare-fun b!1579000 () Bool)

(declare-fun b!98 () B!2572)

(declare-fun +!5089 (ListLongMap!22737 tuple2!25398) ListLongMap!22737)

(assert (=> b!1579000 (= e!880790 (not (not (contains!10440 (+!5089 lm!251 (tuple2!25399 a!525 b!98)) a0!51))))))

(declare-fun containsKey!878 (List!36768 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!603 (List!36768 (_ BitVec 64) B!2572) List!36768)

(assert (=> b!1579000 (not (containsKey!878 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98) a0!51))))

(declare-datatypes ((Unit!52209 0))(
  ( (Unit!52210) )
))
(declare-fun lt!676372 () Unit!52209)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (List!36768 (_ BitVec 64) B!2572 (_ BitVec 64)) Unit!52209)

(assert (=> b!1579000 (= lt!676372 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (toList!11384 lm!251) a!525 b!98 a0!51))))

(declare-fun b!1579001 () Bool)

(declare-fun res!1078880 () Bool)

(assert (=> b!1579001 (=> (not res!1078880) (not e!880790))))

(assert (=> b!1579001 (= res!1078880 (not (containsKey!878 (toList!11384 lm!251) a0!51)))))

(declare-fun b!1579002 () Bool)

(declare-fun tp!114282 () Bool)

(assert (=> b!1579002 (= e!880789 tp!114282)))

(assert (= (and start!136876 res!1078882) b!1578998))

(assert (= (and b!1578998 res!1078881) b!1578999))

(assert (= (and b!1578999 res!1078884) b!1579001))

(assert (= (and b!1579001 res!1078880) b!1578997))

(assert (= (and b!1578997 res!1078883) b!1579000))

(assert (= start!136876 b!1579002))

(declare-fun m!1450957 () Bool)

(assert (=> start!136876 m!1450957))

(declare-fun m!1450959 () Bool)

(assert (=> start!136876 m!1450959))

(declare-fun m!1450961 () Bool)

(assert (=> b!1578999 m!1450961))

(declare-fun m!1450963 () Bool)

(assert (=> b!1579000 m!1450963))

(declare-fun m!1450965 () Bool)

(assert (=> b!1579000 m!1450965))

(declare-fun m!1450967 () Bool)

(assert (=> b!1579000 m!1450967))

(assert (=> b!1579000 m!1450963))

(declare-fun m!1450969 () Bool)

(assert (=> b!1579000 m!1450969))

(declare-fun m!1450971 () Bool)

(assert (=> b!1579000 m!1450971))

(assert (=> b!1579000 m!1450965))

(declare-fun m!1450973 () Bool)

(assert (=> b!1579001 m!1450973))

(check-sat (not b!1579000) (not b!1578999) (not start!136876) tp_is_empty!39117 (not b!1579002) (not b!1579001))
(check-sat)
(get-model)

(declare-fun d!166183 () Bool)

(declare-fun res!1078904 () Bool)

(declare-fun e!880801 () Bool)

(assert (=> d!166183 (=> res!1078904 e!880801)))

(get-info :version)

(assert (=> d!166183 (= res!1078904 (or ((_ is Nil!36765) (toList!11384 lm!251)) ((_ is Nil!36765) (t!51682 (toList!11384 lm!251)))))))

(assert (=> d!166183 (= (isStrictlySorted!1029 (toList!11384 lm!251)) e!880801)))

(declare-fun b!1579025 () Bool)

(declare-fun e!880802 () Bool)

(assert (=> b!1579025 (= e!880801 e!880802)))

(declare-fun res!1078905 () Bool)

(assert (=> b!1579025 (=> (not res!1078905) (not e!880802))))

(assert (=> b!1579025 (= res!1078905 (bvslt (_1!12710 (h!38307 (toList!11384 lm!251))) (_1!12710 (h!38307 (t!51682 (toList!11384 lm!251))))))))

(declare-fun b!1579026 () Bool)

(assert (=> b!1579026 (= e!880802 (isStrictlySorted!1029 (t!51682 (toList!11384 lm!251))))))

(assert (= (and d!166183 (not res!1078904)) b!1579025))

(assert (= (and b!1579025 res!1078905) b!1579026))

(declare-fun m!1450993 () Bool)

(assert (=> b!1579026 m!1450993))

(assert (=> b!1578999 d!166183))

(declare-fun d!166187 () Bool)

(declare-fun e!880824 () Bool)

(assert (=> d!166187 e!880824))

(declare-fun res!1078917 () Bool)

(assert (=> d!166187 (=> res!1078917 e!880824)))

(declare-fun lt!676399 () Bool)

(assert (=> d!166187 (= res!1078917 (not lt!676399))))

(declare-fun lt!676398 () Bool)

(assert (=> d!166187 (= lt!676399 lt!676398)))

(declare-fun lt!676400 () Unit!52209)

(declare-fun e!880823 () Unit!52209)

(assert (=> d!166187 (= lt!676400 e!880823)))

(declare-fun c!146332 () Bool)

(assert (=> d!166187 (= c!146332 lt!676398)))

(assert (=> d!166187 (= lt!676398 (containsKey!878 (toList!11384 lm!251) a0!51))))

(assert (=> d!166187 (= (contains!10440 lm!251 a0!51) lt!676399)))

(declare-fun b!1579056 () Bool)

(declare-fun lt!676401 () Unit!52209)

(assert (=> b!1579056 (= e!880823 lt!676401)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!544 (List!36768 (_ BitVec 64)) Unit!52209)

(assert (=> b!1579056 (= lt!676401 (lemmaContainsKeyImpliesGetValueByKeyDefined!544 (toList!11384 lm!251) a0!51))))

(declare-datatypes ((Option!879 0))(
  ( (Some!878 (v!22367 B!2572)) (None!877) )
))
(declare-fun isDefined!592 (Option!879) Bool)

(declare-fun getValueByKey!803 (List!36768 (_ BitVec 64)) Option!879)

(assert (=> b!1579056 (isDefined!592 (getValueByKey!803 (toList!11384 lm!251) a0!51))))

(declare-fun b!1579057 () Bool)

(declare-fun Unit!52214 () Unit!52209)

(assert (=> b!1579057 (= e!880823 Unit!52214)))

(declare-fun b!1579058 () Bool)

(assert (=> b!1579058 (= e!880824 (isDefined!592 (getValueByKey!803 (toList!11384 lm!251) a0!51)))))

(assert (= (and d!166187 c!146332) b!1579056))

(assert (= (and d!166187 (not c!146332)) b!1579057))

(assert (= (and d!166187 (not res!1078917)) b!1579058))

(assert (=> d!166187 m!1450973))

(declare-fun m!1451003 () Bool)

(assert (=> b!1579056 m!1451003))

(declare-fun m!1451005 () Bool)

(assert (=> b!1579056 m!1451005))

(assert (=> b!1579056 m!1451005))

(declare-fun m!1451007 () Bool)

(assert (=> b!1579056 m!1451007))

(assert (=> b!1579058 m!1451005))

(assert (=> b!1579058 m!1451005))

(assert (=> b!1579058 m!1451007))

(assert (=> start!136876 d!166187))

(declare-fun d!166195 () Bool)

(assert (=> d!166195 (= (inv!58929 lm!251) (isStrictlySorted!1029 (toList!11384 lm!251)))))

(declare-fun bs!45727 () Bool)

(assert (= bs!45727 d!166195))

(assert (=> bs!45727 m!1450961))

(assert (=> start!136876 d!166195))

(declare-fun d!166197 () Bool)

(declare-fun res!1078930 () Bool)

(declare-fun e!880845 () Bool)

(assert (=> d!166197 (=> res!1078930 e!880845)))

(assert (=> d!166197 (= res!1078930 (and ((_ is Cons!36764) (toList!11384 lm!251)) (= (_1!12710 (h!38307 (toList!11384 lm!251))) a0!51)))))

(assert (=> d!166197 (= (containsKey!878 (toList!11384 lm!251) a0!51) e!880845)))

(declare-fun b!1579095 () Bool)

(declare-fun e!880846 () Bool)

(assert (=> b!1579095 (= e!880845 e!880846)))

(declare-fun res!1078931 () Bool)

(assert (=> b!1579095 (=> (not res!1078931) (not e!880846))))

(assert (=> b!1579095 (= res!1078931 (and (or (not ((_ is Cons!36764) (toList!11384 lm!251))) (bvsle (_1!12710 (h!38307 (toList!11384 lm!251))) a0!51)) ((_ is Cons!36764) (toList!11384 lm!251)) (bvslt (_1!12710 (h!38307 (toList!11384 lm!251))) a0!51)))))

(declare-fun b!1579096 () Bool)

(assert (=> b!1579096 (= e!880846 (containsKey!878 (t!51682 (toList!11384 lm!251)) a0!51))))

(assert (= (and d!166197 (not res!1078930)) b!1579095))

(assert (= (and b!1579095 res!1078931) b!1579096))

(declare-fun m!1451009 () Bool)

(assert (=> b!1579096 m!1451009))

(assert (=> b!1579001 d!166197))

(declare-fun e!880896 () Bool)

(declare-fun lt!676435 () List!36768)

(declare-fun b!1579175 () Bool)

(declare-fun contains!10444 (List!36768 tuple2!25398) Bool)

(assert (=> b!1579175 (= e!880896 (contains!10444 lt!676435 (tuple2!25399 a!525 b!98)))))

(declare-fun c!146362 () Bool)

(declare-fun e!880894 () List!36768)

(declare-fun b!1579176 () Bool)

(declare-fun c!146363 () Bool)

(assert (=> b!1579176 (= e!880894 (ite c!146363 (t!51682 (toList!11384 lm!251)) (ite c!146362 (Cons!36764 (h!38307 (toList!11384 lm!251)) (t!51682 (toList!11384 lm!251))) Nil!36765)))))

(declare-fun b!1579177 () Bool)

(declare-fun e!880897 () List!36768)

(declare-fun call!72396 () List!36768)

(assert (=> b!1579177 (= e!880897 call!72396)))

(declare-fun b!1579178 () Bool)

(assert (=> b!1579178 (= e!880894 (insertStrictlySorted!603 (t!51682 (toList!11384 lm!251)) a!525 b!98))))

(declare-fun call!72397 () List!36768)

(declare-fun c!146364 () Bool)

(declare-fun bm!72393 () Bool)

(declare-fun $colon$colon!1007 (List!36768 tuple2!25398) List!36768)

(assert (=> bm!72393 (= call!72397 ($colon$colon!1007 e!880894 (ite c!146364 (h!38307 (toList!11384 lm!251)) (tuple2!25399 a!525 b!98))))))

(declare-fun c!146365 () Bool)

(assert (=> bm!72393 (= c!146365 c!146364)))

(declare-fun b!1579179 () Bool)

(declare-fun e!880895 () List!36768)

(declare-fun e!880898 () List!36768)

(assert (=> b!1579179 (= e!880895 e!880898)))

(assert (=> b!1579179 (= c!146363 (and ((_ is Cons!36764) (toList!11384 lm!251)) (= (_1!12710 (h!38307 (toList!11384 lm!251))) a!525)))))

(declare-fun d!166199 () Bool)

(assert (=> d!166199 e!880896))

(declare-fun res!1078972 () Bool)

(assert (=> d!166199 (=> (not res!1078972) (not e!880896))))

(assert (=> d!166199 (= res!1078972 (isStrictlySorted!1029 lt!676435))))

(assert (=> d!166199 (= lt!676435 e!880895)))

(assert (=> d!166199 (= c!146364 (and ((_ is Cons!36764) (toList!11384 lm!251)) (bvslt (_1!12710 (h!38307 (toList!11384 lm!251))) a!525)))))

(assert (=> d!166199 (isStrictlySorted!1029 (toList!11384 lm!251))))

(assert (=> d!166199 (= (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98) lt!676435)))

(declare-fun bm!72394 () Bool)

(declare-fun call!72398 () List!36768)

(assert (=> bm!72394 (= call!72398 call!72397)))

(declare-fun b!1579180 () Bool)

(assert (=> b!1579180 (= c!146362 (and ((_ is Cons!36764) (toList!11384 lm!251)) (bvsgt (_1!12710 (h!38307 (toList!11384 lm!251))) a!525)))))

(assert (=> b!1579180 (= e!880898 e!880897)))

(declare-fun b!1579181 () Bool)

(assert (=> b!1579181 (= e!880898 call!72398)))

(declare-fun b!1579182 () Bool)

(declare-fun res!1078971 () Bool)

(assert (=> b!1579182 (=> (not res!1078971) (not e!880896))))

(assert (=> b!1579182 (= res!1078971 (containsKey!878 lt!676435 a!525))))

(declare-fun b!1579183 () Bool)

(assert (=> b!1579183 (= e!880895 call!72397)))

(declare-fun bm!72395 () Bool)

(assert (=> bm!72395 (= call!72396 call!72398)))

(declare-fun b!1579184 () Bool)

(assert (=> b!1579184 (= e!880897 call!72396)))

(assert (= (and d!166199 c!146364) b!1579183))

(assert (= (and d!166199 (not c!146364)) b!1579179))

(assert (= (and b!1579179 c!146363) b!1579181))

(assert (= (and b!1579179 (not c!146363)) b!1579180))

(assert (= (and b!1579180 c!146362) b!1579177))

(assert (= (and b!1579180 (not c!146362)) b!1579184))

(assert (= (or b!1579177 b!1579184) bm!72395))

(assert (= (or b!1579181 bm!72395) bm!72394))

(assert (= (or b!1579183 bm!72394) bm!72393))

(assert (= (and bm!72393 c!146365) b!1579178))

(assert (= (and bm!72393 (not c!146365)) b!1579176))

(assert (= (and d!166199 res!1078972) b!1579182))

(assert (= (and b!1579182 res!1078971) b!1579175))

(declare-fun m!1451059 () Bool)

(assert (=> bm!72393 m!1451059))

(declare-fun m!1451061 () Bool)

(assert (=> d!166199 m!1451061))

(assert (=> d!166199 m!1450961))

(declare-fun m!1451063 () Bool)

(assert (=> b!1579182 m!1451063))

(declare-fun m!1451065 () Bool)

(assert (=> b!1579175 m!1451065))

(declare-fun m!1451067 () Bool)

(assert (=> b!1579178 m!1451067))

(assert (=> b!1579000 d!166199))

(declare-fun d!166215 () Bool)

(declare-fun res!1078975 () Bool)

(declare-fun e!880900 () Bool)

(assert (=> d!166215 (=> res!1078975 e!880900)))

(assert (=> d!166215 (= res!1078975 (and ((_ is Cons!36764) (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98)) (= (_1!12710 (h!38307 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98))) a0!51)))))

(assert (=> d!166215 (= (containsKey!878 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98) a0!51) e!880900)))

(declare-fun b!1579187 () Bool)

(declare-fun e!880901 () Bool)

(assert (=> b!1579187 (= e!880900 e!880901)))

(declare-fun res!1078976 () Bool)

(assert (=> b!1579187 (=> (not res!1078976) (not e!880901))))

(assert (=> b!1579187 (= res!1078976 (and (or (not ((_ is Cons!36764) (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98))) (bvsle (_1!12710 (h!38307 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98))) a0!51)) ((_ is Cons!36764) (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98)) (bvslt (_1!12710 (h!38307 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98))) a0!51)))))

(declare-fun b!1579188 () Bool)

(assert (=> b!1579188 (= e!880901 (containsKey!878 (t!51682 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98)) a0!51))))

(assert (= (and d!166215 (not res!1078975)) b!1579187))

(assert (= (and b!1579187 res!1078976) b!1579188))

(declare-fun m!1451081 () Bool)

(assert (=> b!1579188 m!1451081))

(assert (=> b!1579000 d!166215))

(declare-fun d!166219 () Bool)

(declare-fun e!880910 () Bool)

(assert (=> d!166219 e!880910))

(declare-fun res!1078984 () Bool)

(assert (=> d!166219 (=> (not res!1078984) (not e!880910))))

(declare-fun lt!676460 () ListLongMap!22737)

(assert (=> d!166219 (= res!1078984 (contains!10440 lt!676460 (_1!12710 (tuple2!25399 a!525 b!98))))))

(declare-fun lt!676462 () List!36768)

(assert (=> d!166219 (= lt!676460 (ListLongMap!22738 lt!676462))))

(declare-fun lt!676463 () Unit!52209)

(declare-fun lt!676461 () Unit!52209)

(assert (=> d!166219 (= lt!676463 lt!676461)))

(assert (=> d!166219 (= (getValueByKey!803 lt!676462 (_1!12710 (tuple2!25399 a!525 b!98))) (Some!878 (_2!12710 (tuple2!25399 a!525 b!98))))))

(declare-fun lemmaContainsTupThenGetReturnValue!390 (List!36768 (_ BitVec 64) B!2572) Unit!52209)

(assert (=> d!166219 (= lt!676461 (lemmaContainsTupThenGetReturnValue!390 lt!676462 (_1!12710 (tuple2!25399 a!525 b!98)) (_2!12710 (tuple2!25399 a!525 b!98))))))

(assert (=> d!166219 (= lt!676462 (insertStrictlySorted!603 (toList!11384 lm!251) (_1!12710 (tuple2!25399 a!525 b!98)) (_2!12710 (tuple2!25399 a!525 b!98))))))

(assert (=> d!166219 (= (+!5089 lm!251 (tuple2!25399 a!525 b!98)) lt!676460)))

(declare-fun b!1579202 () Bool)

(declare-fun res!1078985 () Bool)

(assert (=> b!1579202 (=> (not res!1078985) (not e!880910))))

(assert (=> b!1579202 (= res!1078985 (= (getValueByKey!803 (toList!11384 lt!676460) (_1!12710 (tuple2!25399 a!525 b!98))) (Some!878 (_2!12710 (tuple2!25399 a!525 b!98)))))))

(declare-fun b!1579203 () Bool)

(assert (=> b!1579203 (= e!880910 (contains!10444 (toList!11384 lt!676460) (tuple2!25399 a!525 b!98)))))

(assert (= (and d!166219 res!1078984) b!1579202))

(assert (= (and b!1579202 res!1078985) b!1579203))

(declare-fun m!1451091 () Bool)

(assert (=> d!166219 m!1451091))

(declare-fun m!1451093 () Bool)

(assert (=> d!166219 m!1451093))

(declare-fun m!1451095 () Bool)

(assert (=> d!166219 m!1451095))

(declare-fun m!1451097 () Bool)

(assert (=> d!166219 m!1451097))

(declare-fun m!1451099 () Bool)

(assert (=> b!1579202 m!1451099))

(declare-fun m!1451101 () Bool)

(assert (=> b!1579203 m!1451101))

(assert (=> b!1579000 d!166219))

(declare-fun d!166223 () Bool)

(declare-fun e!880912 () Bool)

(assert (=> d!166223 e!880912))

(declare-fun res!1078986 () Bool)

(assert (=> d!166223 (=> res!1078986 e!880912)))

(declare-fun lt!676465 () Bool)

(assert (=> d!166223 (= res!1078986 (not lt!676465))))

(declare-fun lt!676464 () Bool)

(assert (=> d!166223 (= lt!676465 lt!676464)))

(declare-fun lt!676466 () Unit!52209)

(declare-fun e!880911 () Unit!52209)

(assert (=> d!166223 (= lt!676466 e!880911)))

(declare-fun c!146369 () Bool)

(assert (=> d!166223 (= c!146369 lt!676464)))

(assert (=> d!166223 (= lt!676464 (containsKey!878 (toList!11384 (+!5089 lm!251 (tuple2!25399 a!525 b!98))) a0!51))))

(assert (=> d!166223 (= (contains!10440 (+!5089 lm!251 (tuple2!25399 a!525 b!98)) a0!51) lt!676465)))

(declare-fun b!1579204 () Bool)

(declare-fun lt!676467 () Unit!52209)

(assert (=> b!1579204 (= e!880911 lt!676467)))

(assert (=> b!1579204 (= lt!676467 (lemmaContainsKeyImpliesGetValueByKeyDefined!544 (toList!11384 (+!5089 lm!251 (tuple2!25399 a!525 b!98))) a0!51))))

(assert (=> b!1579204 (isDefined!592 (getValueByKey!803 (toList!11384 (+!5089 lm!251 (tuple2!25399 a!525 b!98))) a0!51))))

(declare-fun b!1579205 () Bool)

(declare-fun Unit!52217 () Unit!52209)

(assert (=> b!1579205 (= e!880911 Unit!52217)))

(declare-fun b!1579206 () Bool)

(assert (=> b!1579206 (= e!880912 (isDefined!592 (getValueByKey!803 (toList!11384 (+!5089 lm!251 (tuple2!25399 a!525 b!98))) a0!51)))))

(assert (= (and d!166223 c!146369) b!1579204))

(assert (= (and d!166223 (not c!146369)) b!1579205))

(assert (= (and d!166223 (not res!1078986)) b!1579206))

(declare-fun m!1451103 () Bool)

(assert (=> d!166223 m!1451103))

(declare-fun m!1451105 () Bool)

(assert (=> b!1579204 m!1451105))

(declare-fun m!1451107 () Bool)

(assert (=> b!1579204 m!1451107))

(assert (=> b!1579204 m!1451107))

(declare-fun m!1451109 () Bool)

(assert (=> b!1579204 m!1451109))

(assert (=> b!1579206 m!1451107))

(assert (=> b!1579206 m!1451107))

(assert (=> b!1579206 m!1451109))

(assert (=> b!1579000 d!166223))

(declare-fun d!166225 () Bool)

(assert (=> d!166225 (not (containsKey!878 (insertStrictlySorted!603 (toList!11384 lm!251) a!525 b!98) a0!51))))

(declare-fun lt!676477 () Unit!52209)

(declare-fun choose!2089 (List!36768 (_ BitVec 64) B!2572 (_ BitVec 64)) Unit!52209)

(assert (=> d!166225 (= lt!676477 (choose!2089 (toList!11384 lm!251) a!525 b!98 a0!51))))

(declare-fun e!880920 () Bool)

(assert (=> d!166225 e!880920))

(declare-fun res!1078998 () Bool)

(assert (=> d!166225 (=> (not res!1078998) (not e!880920))))

(assert (=> d!166225 (= res!1078998 (isStrictlySorted!1029 (toList!11384 lm!251)))))

(assert (=> d!166225 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (toList!11384 lm!251) a!525 b!98 a0!51) lt!676477)))

(declare-fun b!1579220 () Bool)

(declare-fun res!1078999 () Bool)

(assert (=> b!1579220 (=> (not res!1078999) (not e!880920))))

(assert (=> b!1579220 (= res!1078999 (not (containsKey!878 (toList!11384 lm!251) a0!51)))))

(declare-fun b!1579221 () Bool)

(assert (=> b!1579221 (= e!880920 (not (= a0!51 a!525)))))

(assert (= (and d!166225 res!1078998) b!1579220))

(assert (= (and b!1579220 res!1078999) b!1579221))

(assert (=> d!166225 m!1450965))

(assert (=> d!166225 m!1450965))

(assert (=> d!166225 m!1450967))

(declare-fun m!1451119 () Bool)

(assert (=> d!166225 m!1451119))

(assert (=> d!166225 m!1450961))

(assert (=> b!1579220 m!1450973))

(assert (=> b!1579000 d!166225))

(declare-fun b!1579230 () Bool)

(declare-fun e!880927 () Bool)

(declare-fun tp!114291 () Bool)

(assert (=> b!1579230 (= e!880927 (and tp_is_empty!39117 tp!114291))))

(assert (=> b!1579002 (= tp!114282 e!880927)))

(assert (= (and b!1579002 ((_ is Cons!36764) (toList!11384 lm!251))) b!1579230))

(check-sat tp_is_empty!39117 (not b!1579204) (not b!1579202) (not b!1579230) (not b!1579026) (not b!1579206) (not d!166219) (not bm!72393) (not b!1579220) (not b!1579188) (not d!166195) (not b!1579058) (not b!1579175) (not b!1579203) (not d!166225) (not b!1579182) (not d!166199) (not d!166223) (not b!1579096) (not d!166187) (not b!1579178) (not b!1579056))
(check-sat)
