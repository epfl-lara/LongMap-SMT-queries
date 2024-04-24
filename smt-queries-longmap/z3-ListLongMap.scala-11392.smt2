; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132918 () Bool)

(assert start!132918)

(declare-fun res!1064409 () Bool)

(declare-fun e!866753 () Bool)

(assert (=> start!132918 (=> (not res!1064409) (not e!866753))))

(declare-datatypes ((B!2228 0))(
  ( (B!2229 (val!19200 Int)) )
))
(declare-datatypes ((tuple2!24830 0))(
  ( (tuple2!24831 (_1!12426 (_ BitVec 64)) (_2!12426 B!2228)) )
))
(declare-datatypes ((List!36263 0))(
  ( (Nil!36260) (Cons!36259 (h!37723 tuple2!24830) (t!50976 List!36263)) )
))
(declare-datatypes ((ListLongMap!22447 0))(
  ( (ListLongMap!22448 (toList!11239 List!36263)) )
))
(declare-fun lm!249 () ListLongMap!22447)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10196 (ListLongMap!22447 (_ BitVec 64)) Bool)

(assert (=> start!132918 (= res!1064409 (contains!10196 lm!249 a0!49))))

(assert (=> start!132918 e!866753))

(declare-fun e!866752 () Bool)

(declare-fun inv!57327 (ListLongMap!22447) Bool)

(assert (=> start!132918 (and (inv!57327 lm!249) e!866752)))

(assert (=> start!132918 true))

(declare-fun b!1556406 () Bool)

(declare-fun res!1064408 () Bool)

(assert (=> b!1556406 (=> (not res!1064408) (not e!866753))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1556406 (= res!1064408 (not (= a0!49 a!523)))))

(declare-fun b!1556407 () Bool)

(declare-fun containsKey!767 (List!36263 (_ BitVec 64)) Bool)

(assert (=> b!1556407 (= e!866753 (not (containsKey!767 (toList!11239 lm!249) a0!49)))))

(declare-fun b!1556408 () Bool)

(declare-fun tp!112146 () Bool)

(assert (=> b!1556408 (= e!866752 tp!112146)))

(assert (= (and start!132918 res!1064409) b!1556406))

(assert (= (and b!1556406 res!1064408) b!1556407))

(assert (= start!132918 b!1556408))

(declare-fun m!1434785 () Bool)

(assert (=> start!132918 m!1434785))

(declare-fun m!1434787 () Bool)

(assert (=> start!132918 m!1434787))

(declare-fun m!1434789 () Bool)

(assert (=> b!1556407 m!1434789))

(check-sat (not start!132918) (not b!1556407) (not b!1556408))
(check-sat)
(get-model)

(declare-fun d!162355 () Bool)

(declare-fun e!866782 () Bool)

(assert (=> d!162355 e!866782))

(declare-fun res!1064436 () Bool)

(assert (=> d!162355 (=> res!1064436 e!866782)))

(declare-fun lt!670798 () Bool)

(assert (=> d!162355 (= res!1064436 (not lt!670798))))

(declare-fun lt!670796 () Bool)

(assert (=> d!162355 (= lt!670798 lt!670796)))

(declare-datatypes ((Unit!51678 0))(
  ( (Unit!51679) )
))
(declare-fun lt!670797 () Unit!51678)

(declare-fun e!866783 () Unit!51678)

(assert (=> d!162355 (= lt!670797 e!866783)))

(declare-fun c!144136 () Bool)

(assert (=> d!162355 (= c!144136 lt!670796)))

(assert (=> d!162355 (= lt!670796 (containsKey!767 (toList!11239 lm!249) a0!49))))

(assert (=> d!162355 (= (contains!10196 lm!249 a0!49) lt!670798)))

(declare-fun b!1556445 () Bool)

(declare-fun lt!670795 () Unit!51678)

(assert (=> b!1556445 (= e!866783 lt!670795)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!510 (List!36263 (_ BitVec 64)) Unit!51678)

(assert (=> b!1556445 (= lt!670795 (lemmaContainsKeyImpliesGetValueByKeyDefined!510 (toList!11239 lm!249) a0!49))))

(declare-datatypes ((Option!816 0))(
  ( (Some!815 (v!21997 B!2228)) (None!814) )
))
(declare-fun isDefined!556 (Option!816) Bool)

(declare-fun getValueByKey!741 (List!36263 (_ BitVec 64)) Option!816)

(assert (=> b!1556445 (isDefined!556 (getValueByKey!741 (toList!11239 lm!249) a0!49))))

(declare-fun b!1556446 () Bool)

(declare-fun Unit!51680 () Unit!51678)

(assert (=> b!1556446 (= e!866783 Unit!51680)))

(declare-fun b!1556447 () Bool)

(assert (=> b!1556447 (= e!866782 (isDefined!556 (getValueByKey!741 (toList!11239 lm!249) a0!49)))))

(assert (= (and d!162355 c!144136) b!1556445))

(assert (= (and d!162355 (not c!144136)) b!1556446))

(assert (= (and d!162355 (not res!1064436)) b!1556447))

(assert (=> d!162355 m!1434789))

(declare-fun m!1434807 () Bool)

(assert (=> b!1556445 m!1434807))

(declare-fun m!1434809 () Bool)

(assert (=> b!1556445 m!1434809))

(assert (=> b!1556445 m!1434809))

(declare-fun m!1434811 () Bool)

(assert (=> b!1556445 m!1434811))

(assert (=> b!1556447 m!1434809))

(assert (=> b!1556447 m!1434809))

(assert (=> b!1556447 m!1434811))

(assert (=> start!132918 d!162355))

(declare-fun d!162365 () Bool)

(declare-fun isStrictlySorted!885 (List!36263) Bool)

(assert (=> d!162365 (= (inv!57327 lm!249) (isStrictlySorted!885 (toList!11239 lm!249)))))

(declare-fun bs!44687 () Bool)

(assert (= bs!44687 d!162365))

(declare-fun m!1434813 () Bool)

(assert (=> bs!44687 m!1434813))

(assert (=> start!132918 d!162365))

(declare-fun d!162367 () Bool)

(declare-fun res!1064446 () Bool)

(declare-fun e!866798 () Bool)

(assert (=> d!162367 (=> res!1064446 e!866798)))

(get-info :version)

(assert (=> d!162367 (= res!1064446 (and ((_ is Cons!36259) (toList!11239 lm!249)) (= (_1!12426 (h!37723 (toList!11239 lm!249))) a0!49)))))

(assert (=> d!162367 (= (containsKey!767 (toList!11239 lm!249) a0!49) e!866798)))

(declare-fun b!1556467 () Bool)

(declare-fun e!866799 () Bool)

(assert (=> b!1556467 (= e!866798 e!866799)))

(declare-fun res!1064447 () Bool)

(assert (=> b!1556467 (=> (not res!1064447) (not e!866799))))

(assert (=> b!1556467 (= res!1064447 (and (or (not ((_ is Cons!36259) (toList!11239 lm!249))) (bvsle (_1!12426 (h!37723 (toList!11239 lm!249))) a0!49)) ((_ is Cons!36259) (toList!11239 lm!249)) (bvslt (_1!12426 (h!37723 (toList!11239 lm!249))) a0!49)))))

(declare-fun b!1556468 () Bool)

(assert (=> b!1556468 (= e!866799 (containsKey!767 (t!50976 (toList!11239 lm!249)) a0!49))))

(assert (= (and d!162367 (not res!1064446)) b!1556467))

(assert (= (and b!1556467 res!1064447) b!1556468))

(declare-fun m!1434821 () Bool)

(assert (=> b!1556468 m!1434821))

(assert (=> b!1556407 d!162367))

(declare-fun b!1556480 () Bool)

(declare-fun e!866806 () Bool)

(declare-fun tp_is_empty!38239 () Bool)

(declare-fun tp!112157 () Bool)

(assert (=> b!1556480 (= e!866806 (and tp_is_empty!38239 tp!112157))))

(assert (=> b!1556408 (= tp!112146 e!866806)))

(assert (= (and b!1556408 ((_ is Cons!36259) (toList!11239 lm!249))) b!1556480))

(check-sat (not b!1556447) (not b!1556468) (not b!1556480) (not b!1556445) tp_is_empty!38239 (not d!162365) (not d!162355))
(check-sat)
