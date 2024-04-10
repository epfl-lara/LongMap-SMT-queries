; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113782 () Bool)

(assert start!113782)

(declare-fun k0!387 () (_ BitVec 64))

(declare-datatypes ((B!2194 0))(
  ( (B!2195 (val!18886 Int)) )
))
(declare-datatypes ((tuple2!24366 0))(
  ( (tuple2!24367 (_1!12194 (_ BitVec 64)) (_2!12194 B!2194)) )
))
(declare-datatypes ((List!31504 0))(
  ( (Nil!31501) (Cons!31500 (h!32709 tuple2!24366) (t!46162 List!31504)) )
))
(declare-datatypes ((ListLongMap!22023 0))(
  ( (ListLongMap!22024 (toList!11027 List!31504)) )
))
(declare-fun contains!9213 (ListLongMap!22023 (_ BitVec 64)) Bool)

(assert (=> start!113782 (contains!9213 (ListLongMap!22024 Nil!31501) k0!387)))

(assert (=> start!113782 true))

(declare-fun bs!38725 () Bool)

(assert (= bs!38725 start!113782))

(declare-fun m!1237401 () Bool)

(assert (=> bs!38725 m!1237401))

(check-sat (not start!113782))
(check-sat)
(get-model)

(declare-fun d!144857 () Bool)

(declare-fun e!768036 () Bool)

(assert (=> d!144857 e!768036))

(declare-fun res!895622 () Bool)

(assert (=> d!144857 (=> res!895622 e!768036)))

(declare-fun lt!596929 () Bool)

(assert (=> d!144857 (= res!895622 (not lt!596929))))

(declare-fun lt!596927 () Bool)

(assert (=> d!144857 (= lt!596929 lt!596927)))

(declare-datatypes ((Unit!44223 0))(
  ( (Unit!44224) )
))
(declare-fun lt!596925 () Unit!44223)

(declare-fun e!768035 () Unit!44223)

(assert (=> d!144857 (= lt!596925 e!768035)))

(declare-fun c!126690 () Bool)

(assert (=> d!144857 (= c!126690 lt!596927)))

(declare-fun containsKey!747 (List!31504 (_ BitVec 64)) Bool)

(assert (=> d!144857 (= lt!596927 (containsKey!747 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(assert (=> d!144857 (= (contains!9213 (ListLongMap!22024 Nil!31501) k0!387) lt!596929)))

(declare-fun b!1350122 () Bool)

(declare-fun lt!596924 () Unit!44223)

(assert (=> b!1350122 (= e!768035 lt!596924)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!493 (List!31504 (_ BitVec 64)) Unit!44223)

(assert (=> b!1350122 (= lt!596924 (lemmaContainsKeyImpliesGetValueByKeyDefined!493 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(declare-datatypes ((Option!777 0))(
  ( (Some!776 (v!21531 B!2194)) (None!775) )
))
(declare-fun isDefined!532 (Option!777) Bool)

(declare-fun getValueByKey!725 (List!31504 (_ BitVec 64)) Option!777)

(assert (=> b!1350122 (isDefined!532 (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(declare-fun b!1350123 () Bool)

(declare-fun Unit!44229 () Unit!44223)

(assert (=> b!1350123 (= e!768035 Unit!44229)))

(declare-fun b!1350124 () Bool)

(assert (=> b!1350124 (= e!768036 (isDefined!532 (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387)))))

(assert (= (and d!144857 c!126690) b!1350122))

(assert (= (and d!144857 (not c!126690)) b!1350123))

(assert (= (and d!144857 (not res!895622)) b!1350124))

(declare-fun m!1237407 () Bool)

(assert (=> d!144857 m!1237407))

(declare-fun m!1237411 () Bool)

(assert (=> b!1350122 m!1237411))

(declare-fun m!1237417 () Bool)

(assert (=> b!1350122 m!1237417))

(assert (=> b!1350122 m!1237417))

(declare-fun m!1237423 () Bool)

(assert (=> b!1350122 m!1237423))

(assert (=> b!1350124 m!1237417))

(assert (=> b!1350124 m!1237417))

(assert (=> b!1350124 m!1237423))

(assert (=> start!113782 d!144857))

(check-sat (not d!144857) (not b!1350122) (not b!1350124))
(check-sat)
(get-model)

(declare-fun d!144859 () Bool)

(declare-fun res!895629 () Bool)

(declare-fun e!768045 () Bool)

(assert (=> d!144859 (=> res!895629 e!768045)))

(get-info :version)

(assert (=> d!144859 (= res!895629 (and ((_ is Cons!31500) (toList!11027 (ListLongMap!22024 Nil!31501))) (= (_1!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501)))) k0!387)))))

(assert (=> d!144859 (= (containsKey!747 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387) e!768045)))

(declare-fun b!1350135 () Bool)

(declare-fun e!768046 () Bool)

(assert (=> b!1350135 (= e!768045 e!768046)))

(declare-fun res!895630 () Bool)

(assert (=> b!1350135 (=> (not res!895630) (not e!768046))))

(assert (=> b!1350135 (= res!895630 (and (or (not ((_ is Cons!31500) (toList!11027 (ListLongMap!22024 Nil!31501)))) (bvsle (_1!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501)))) k0!387)) ((_ is Cons!31500) (toList!11027 (ListLongMap!22024 Nil!31501))) (bvslt (_1!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501)))) k0!387)))))

(declare-fun b!1350136 () Bool)

(assert (=> b!1350136 (= e!768046 (containsKey!747 (t!46162 (toList!11027 (ListLongMap!22024 Nil!31501))) k0!387))))

(assert (= (and d!144859 (not res!895629)) b!1350135))

(assert (= (and b!1350135 res!895630) b!1350136))

(declare-fun m!1237431 () Bool)

(assert (=> b!1350136 m!1237431))

(assert (=> d!144857 d!144859))

(declare-fun d!144865 () Bool)

(assert (=> d!144865 (isDefined!532 (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(declare-fun lt!596938 () Unit!44223)

(declare-fun choose!1987 (List!31504 (_ BitVec 64)) Unit!44223)

(assert (=> d!144865 (= lt!596938 (choose!1987 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(declare-fun e!768053 () Bool)

(assert (=> d!144865 e!768053))

(declare-fun res!895633 () Bool)

(assert (=> d!144865 (=> (not res!895633) (not e!768053))))

(declare-fun isStrictlySorted!884 (List!31504) Bool)

(assert (=> d!144865 (= res!895633 (isStrictlySorted!884 (toList!11027 (ListLongMap!22024 Nil!31501))))))

(assert (=> d!144865 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!493 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387) lt!596938)))

(declare-fun b!1350147 () Bool)

(assert (=> b!1350147 (= e!768053 (containsKey!747 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))

(assert (= (and d!144865 res!895633) b!1350147))

(assert (=> d!144865 m!1237417))

(assert (=> d!144865 m!1237417))

(assert (=> d!144865 m!1237423))

(declare-fun m!1237433 () Bool)

(assert (=> d!144865 m!1237433))

(declare-fun m!1237435 () Bool)

(assert (=> d!144865 m!1237435))

(assert (=> b!1350147 m!1237407))

(assert (=> b!1350122 d!144865))

(declare-fun d!144869 () Bool)

(declare-fun isEmpty!1102 (Option!777) Bool)

(assert (=> d!144869 (= (isDefined!532 (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387)) (not (isEmpty!1102 (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387))))))

(declare-fun bs!38728 () Bool)

(assert (= bs!38728 d!144869))

(assert (=> bs!38728 m!1237417))

(declare-fun m!1237439 () Bool)

(assert (=> bs!38728 m!1237439))

(assert (=> b!1350122 d!144869))

(declare-fun b!1350174 () Bool)

(declare-fun e!768070 () Option!777)

(assert (=> b!1350174 (= e!768070 (Some!776 (_2!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501))))))))

(declare-fun b!1350175 () Bool)

(declare-fun e!768071 () Option!777)

(assert (=> b!1350175 (= e!768070 e!768071)))

(declare-fun c!126708 () Bool)

(assert (=> b!1350175 (= c!126708 (and ((_ is Cons!31500) (toList!11027 (ListLongMap!22024 Nil!31501))) (not (= (_1!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501)))) k0!387))))))

(declare-fun b!1350176 () Bool)

(assert (=> b!1350176 (= e!768071 (getValueByKey!725 (t!46162 (toList!11027 (ListLongMap!22024 Nil!31501))) k0!387))))

(declare-fun b!1350177 () Bool)

(assert (=> b!1350177 (= e!768071 None!775)))

(declare-fun d!144873 () Bool)

(declare-fun c!126707 () Bool)

(assert (=> d!144873 (= c!126707 (and ((_ is Cons!31500) (toList!11027 (ListLongMap!22024 Nil!31501))) (= (_1!12194 (h!32709 (toList!11027 (ListLongMap!22024 Nil!31501)))) k0!387)))))

(assert (=> d!144873 (= (getValueByKey!725 (toList!11027 (ListLongMap!22024 Nil!31501)) k0!387) e!768070)))

(assert (= (and d!144873 c!126707) b!1350174))

(assert (= (and d!144873 (not c!126707)) b!1350175))

(assert (= (and b!1350175 c!126708) b!1350176))

(assert (= (and b!1350175 (not c!126708)) b!1350177))

(declare-fun m!1237451 () Bool)

(assert (=> b!1350176 m!1237451))

(assert (=> b!1350122 d!144873))

(assert (=> b!1350124 d!144869))

(assert (=> b!1350124 d!144873))

(check-sat (not b!1350147) (not b!1350176) (not d!144869) (not b!1350136) (not d!144865))
(check-sat)
