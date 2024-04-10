; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88134 () Bool)

(assert start!88134)

(declare-fun b!1016482 () Bool)

(assert (=> b!1016482 true))

(assert (=> b!1016482 true))

(declare-fun b!1016478 () Bool)

(declare-fun res!681785 () Bool)

(declare-fun e!571816 () Bool)

(assert (=> b!1016478 (=> (not res!681785) (not e!571816))))

(declare-datatypes ((B!1534 0))(
  ( (B!1535 (val!11851 Int)) )
))
(declare-datatypes ((tuple2!15248 0))(
  ( (tuple2!15249 (_1!7635 (_ BitVec 64)) (_2!7635 B!1534)) )
))
(declare-fun newHead!31 () tuple2!15248)

(declare-datatypes ((List!21525 0))(
  ( (Nil!21522) (Cons!21521 (h!22719 tuple2!15248) (t!30526 List!21525)) )
))
(declare-fun l!1114 () List!21525)

(declare-fun head!968 (List!21525) tuple2!15248)

(assert (=> b!1016478 (= res!681785 (bvslt (_1!7635 newHead!31) (_1!7635 (head!968 l!1114))))))

(declare-fun b!1016479 () Bool)

(declare-fun res!681788 () Bool)

(assert (=> b!1016479 (=> (not res!681788) (not e!571816))))

(declare-datatypes ((List!21526 0))(
  ( (Nil!21523) (Cons!21522 (h!22720 (_ BitVec 64)) (t!30527 List!21526)) )
))
(declare-fun keys!40 () List!21526)

(get-info :version)

(assert (=> b!1016479 (= res!681788 ((_ is Cons!21522) keys!40))))

(declare-fun b!1016480 () Bool)

(declare-fun res!681783 () Bool)

(assert (=> b!1016480 (=> (not res!681783) (not e!571816))))

(declare-fun isEmpty!884 (List!21525) Bool)

(assert (=> b!1016480 (= res!681783 (not (isEmpty!884 l!1114)))))

(declare-fun b!1016481 () Bool)

(declare-fun e!571817 () Bool)

(declare-fun tp_is_empty!23601 () Bool)

(declare-fun tp!70777 () Bool)

(assert (=> b!1016481 (= e!571817 (and tp_is_empty!23601 tp!70777))))

(declare-fun res!681787 () Bool)

(assert (=> b!1016482 (=> (not res!681787) (not e!571816))))

(declare-fun lambda!1022 () Int)

(declare-fun forall!281 (List!21526 Int) Bool)

(assert (=> b!1016482 (= res!681787 (forall!281 keys!40 lambda!1022))))

(declare-fun b!1016484 () Bool)

(declare-fun e!571818 () Bool)

(assert (=> b!1016484 (= e!571816 (not e!571818))))

(declare-fun res!681784 () Bool)

(assert (=> b!1016484 (=> (not res!681784) (not e!571818))))

(declare-fun lt!449268 () List!21525)

(declare-fun isStrictlySorted!619 (List!21525) Bool)

(assert (=> b!1016484 (= res!681784 (isStrictlySorted!619 lt!449268))))

(assert (=> b!1016484 (= lt!449268 (Cons!21521 newHead!31 l!1114))))

(declare-fun containsKey!491 (List!21525 (_ BitVec 64)) Bool)

(assert (=> b!1016484 (containsKey!491 l!1114 (h!22720 keys!40))))

(declare-datatypes ((Unit!33247 0))(
  ( (Unit!33248) )
))
(declare-fun lt!449267 () Unit!33247)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!11 (List!21525 (_ BitVec 64)) Unit!33247)

(assert (=> b!1016484 (= lt!449267 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!11 l!1114 (h!22720 keys!40)))))

(declare-fun res!681786 () Bool)

(assert (=> start!88134 (=> (not res!681786) (not e!571816))))

(assert (=> start!88134 (= res!681786 (isStrictlySorted!619 l!1114))))

(assert (=> start!88134 e!571816))

(assert (=> start!88134 e!571817))

(assert (=> start!88134 true))

(assert (=> start!88134 tp_is_empty!23601))

(declare-fun b!1016483 () Bool)

(assert (=> b!1016483 (= e!571818 (containsKey!491 lt!449268 (h!22720 keys!40)))))

(assert (= (and start!88134 res!681786) b!1016480))

(assert (= (and b!1016480 res!681783) b!1016482))

(assert (= (and b!1016482 res!681787) b!1016478))

(assert (= (and b!1016478 res!681785) b!1016479))

(assert (= (and b!1016479 res!681788) b!1016484))

(assert (= (and b!1016484 res!681784) b!1016483))

(assert (= (and start!88134 ((_ is Cons!21521) l!1114)) b!1016481))

(declare-fun m!938117 () Bool)

(assert (=> b!1016480 m!938117))

(declare-fun m!938119 () Bool)

(assert (=> b!1016478 m!938119))

(declare-fun m!938121 () Bool)

(assert (=> start!88134 m!938121))

(declare-fun m!938123 () Bool)

(assert (=> b!1016484 m!938123))

(declare-fun m!938125 () Bool)

(assert (=> b!1016484 m!938125))

(declare-fun m!938127 () Bool)

(assert (=> b!1016484 m!938127))

(declare-fun m!938129 () Bool)

(assert (=> b!1016482 m!938129))

(declare-fun m!938131 () Bool)

(assert (=> b!1016483 m!938131))

(check-sat (not b!1016481) (not b!1016483) (not b!1016484) (not b!1016482) (not start!88134) tp_is_empty!23601 (not b!1016478) (not b!1016480))
(check-sat)
(get-model)

(declare-fun d!121251 () Bool)

(declare-fun res!681811 () Bool)

(declare-fun e!571832 () Bool)

(assert (=> d!121251 (=> res!681811 e!571832)))

(assert (=> d!121251 (= res!681811 ((_ is Nil!21523) keys!40))))

(assert (=> d!121251 (= (forall!281 keys!40 lambda!1022) e!571832)))

(declare-fun b!1016518 () Bool)

(declare-fun e!571833 () Bool)

(assert (=> b!1016518 (= e!571832 e!571833)))

(declare-fun res!681812 () Bool)

(assert (=> b!1016518 (=> (not res!681812) (not e!571833))))

(declare-fun dynLambda!1915 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016518 (= res!681812 (dynLambda!1915 lambda!1022 (h!22720 keys!40)))))

(declare-fun b!1016519 () Bool)

(assert (=> b!1016519 (= e!571833 (forall!281 (t!30527 keys!40) lambda!1022))))

(assert (= (and d!121251 (not res!681811)) b!1016518))

(assert (= (and b!1016518 res!681812) b!1016519))

(declare-fun b_lambda!15519 () Bool)

(assert (=> (not b_lambda!15519) (not b!1016518)))

(declare-fun m!938149 () Bool)

(assert (=> b!1016518 m!938149))

(declare-fun m!938151 () Bool)

(assert (=> b!1016519 m!938151))

(assert (=> b!1016482 d!121251))

(declare-fun d!121253 () Bool)

(declare-fun res!681817 () Bool)

(declare-fun e!571838 () Bool)

(assert (=> d!121253 (=> res!681817 e!571838)))

(assert (=> d!121253 (= res!681817 (and ((_ is Cons!21521) lt!449268) (= (_1!7635 (h!22719 lt!449268)) (h!22720 keys!40))))))

(assert (=> d!121253 (= (containsKey!491 lt!449268 (h!22720 keys!40)) e!571838)))

(declare-fun b!1016524 () Bool)

(declare-fun e!571839 () Bool)

(assert (=> b!1016524 (= e!571838 e!571839)))

(declare-fun res!681818 () Bool)

(assert (=> b!1016524 (=> (not res!681818) (not e!571839))))

(assert (=> b!1016524 (= res!681818 (and (or (not ((_ is Cons!21521) lt!449268)) (bvsle (_1!7635 (h!22719 lt!449268)) (h!22720 keys!40))) ((_ is Cons!21521) lt!449268) (bvslt (_1!7635 (h!22719 lt!449268)) (h!22720 keys!40))))))

(declare-fun b!1016525 () Bool)

(assert (=> b!1016525 (= e!571839 (containsKey!491 (t!30526 lt!449268) (h!22720 keys!40)))))

(assert (= (and d!121253 (not res!681817)) b!1016524))

(assert (= (and b!1016524 res!681818) b!1016525))

(declare-fun m!938153 () Bool)

(assert (=> b!1016525 m!938153))

(assert (=> b!1016483 d!121253))

(declare-fun d!121257 () Bool)

(assert (=> d!121257 (= (head!968 l!1114) (h!22719 l!1114))))

(assert (=> b!1016478 d!121257))

(declare-fun d!121259 () Bool)

(declare-fun res!681829 () Bool)

(declare-fun e!571850 () Bool)

(assert (=> d!121259 (=> res!681829 e!571850)))

(assert (=> d!121259 (= res!681829 (or ((_ is Nil!21522) l!1114) ((_ is Nil!21522) (t!30526 l!1114))))))

(assert (=> d!121259 (= (isStrictlySorted!619 l!1114) e!571850)))

(declare-fun b!1016536 () Bool)

(declare-fun e!571851 () Bool)

(assert (=> b!1016536 (= e!571850 e!571851)))

(declare-fun res!681830 () Bool)

(assert (=> b!1016536 (=> (not res!681830) (not e!571851))))

(assert (=> b!1016536 (= res!681830 (bvslt (_1!7635 (h!22719 l!1114)) (_1!7635 (h!22719 (t!30526 l!1114)))))))

(declare-fun b!1016537 () Bool)

(assert (=> b!1016537 (= e!571851 (isStrictlySorted!619 (t!30526 l!1114)))))

(assert (= (and d!121259 (not res!681829)) b!1016536))

(assert (= (and b!1016536 res!681830) b!1016537))

(declare-fun m!938159 () Bool)

(assert (=> b!1016537 m!938159))

(assert (=> start!88134 d!121259))

(declare-fun d!121267 () Bool)

(declare-fun res!681831 () Bool)

(declare-fun e!571852 () Bool)

(assert (=> d!121267 (=> res!681831 e!571852)))

(assert (=> d!121267 (= res!681831 (or ((_ is Nil!21522) lt!449268) ((_ is Nil!21522) (t!30526 lt!449268))))))

(assert (=> d!121267 (= (isStrictlySorted!619 lt!449268) e!571852)))

(declare-fun b!1016538 () Bool)

(declare-fun e!571853 () Bool)

(assert (=> b!1016538 (= e!571852 e!571853)))

(declare-fun res!681832 () Bool)

(assert (=> b!1016538 (=> (not res!681832) (not e!571853))))

(assert (=> b!1016538 (= res!681832 (bvslt (_1!7635 (h!22719 lt!449268)) (_1!7635 (h!22719 (t!30526 lt!449268)))))))

(declare-fun b!1016539 () Bool)

(assert (=> b!1016539 (= e!571853 (isStrictlySorted!619 (t!30526 lt!449268)))))

(assert (= (and d!121267 (not res!681831)) b!1016538))

(assert (= (and b!1016538 res!681832) b!1016539))

(declare-fun m!938161 () Bool)

(assert (=> b!1016539 m!938161))

(assert (=> b!1016484 d!121267))

(declare-fun d!121269 () Bool)

(declare-fun res!681833 () Bool)

(declare-fun e!571854 () Bool)

(assert (=> d!121269 (=> res!681833 e!571854)))

(assert (=> d!121269 (= res!681833 (and ((_ is Cons!21521) l!1114) (= (_1!7635 (h!22719 l!1114)) (h!22720 keys!40))))))

(assert (=> d!121269 (= (containsKey!491 l!1114 (h!22720 keys!40)) e!571854)))

(declare-fun b!1016540 () Bool)

(declare-fun e!571855 () Bool)

(assert (=> b!1016540 (= e!571854 e!571855)))

(declare-fun res!681834 () Bool)

(assert (=> b!1016540 (=> (not res!681834) (not e!571855))))

(assert (=> b!1016540 (= res!681834 (and (or (not ((_ is Cons!21521) l!1114)) (bvsle (_1!7635 (h!22719 l!1114)) (h!22720 keys!40))) ((_ is Cons!21521) l!1114) (bvslt (_1!7635 (h!22719 l!1114)) (h!22720 keys!40))))))

(declare-fun b!1016541 () Bool)

(assert (=> b!1016541 (= e!571855 (containsKey!491 (t!30526 l!1114) (h!22720 keys!40)))))

(assert (= (and d!121269 (not res!681833)) b!1016540))

(assert (= (and b!1016540 res!681834) b!1016541))

(declare-fun m!938163 () Bool)

(assert (=> b!1016541 m!938163))

(assert (=> b!1016484 d!121269))

(declare-fun d!121271 () Bool)

(assert (=> d!121271 (containsKey!491 l!1114 (h!22720 keys!40))))

(declare-fun lt!449277 () Unit!33247)

(declare-fun choose!1648 (List!21525 (_ BitVec 64)) Unit!33247)

(assert (=> d!121271 (= lt!449277 (choose!1648 l!1114 (h!22720 keys!40)))))

(declare-fun e!571870 () Bool)

(assert (=> d!121271 e!571870))

(declare-fun res!681849 () Bool)

(assert (=> d!121271 (=> (not res!681849) (not e!571870))))

(assert (=> d!121271 (= res!681849 (isStrictlySorted!619 l!1114))))

(assert (=> d!121271 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!11 l!1114 (h!22720 keys!40)) lt!449277)))

(declare-fun b!1016556 () Bool)

(declare-datatypes ((Option!603 0))(
  ( (Some!602 (v!14453 B!1534)) (None!601) )
))
(declare-fun isDefined!401 (Option!603) Bool)

(declare-fun getValueByKey!552 (List!21525 (_ BitVec 64)) Option!603)

(assert (=> b!1016556 (= e!571870 (isDefined!401 (getValueByKey!552 l!1114 (h!22720 keys!40))))))

(assert (= (and d!121271 res!681849) b!1016556))

(assert (=> d!121271 m!938125))

(declare-fun m!938171 () Bool)

(assert (=> d!121271 m!938171))

(assert (=> d!121271 m!938121))

(declare-fun m!938173 () Bool)

(assert (=> b!1016556 m!938173))

(assert (=> b!1016556 m!938173))

(declare-fun m!938175 () Bool)

(assert (=> b!1016556 m!938175))

(assert (=> b!1016484 d!121271))

(declare-fun d!121277 () Bool)

(assert (=> d!121277 (= (isEmpty!884 l!1114) ((_ is Nil!21522) l!1114))))

(assert (=> b!1016480 d!121277))

(declare-fun b!1016571 () Bool)

(declare-fun e!571883 () Bool)

(declare-fun tp!70783 () Bool)

(assert (=> b!1016571 (= e!571883 (and tp_is_empty!23601 tp!70783))))

(assert (=> b!1016481 (= tp!70777 e!571883)))

(assert (= (and b!1016481 ((_ is Cons!21521) (t!30526 l!1114))) b!1016571))

(declare-fun b_lambda!15525 () Bool)

(assert (= b_lambda!15519 (or b!1016482 b_lambda!15525)))

(declare-fun bs!29521 () Bool)

(declare-fun d!121281 () Bool)

(assert (= bs!29521 (and d!121281 b!1016482)))

(declare-fun value!178 () B!1534)

(assert (=> bs!29521 (= (dynLambda!1915 lambda!1022 (h!22720 keys!40)) (= (getValueByKey!552 l!1114 (h!22720 keys!40)) (Some!602 value!178)))))

(assert (=> bs!29521 m!938173))

(assert (=> b!1016518 d!121281))

(check-sat (not b!1016525) (not b!1016519) (not d!121271) (not b!1016541) (not bs!29521) (not b!1016571) tp_is_empty!23601 (not b!1016556) (not b_lambda!15525) (not b!1016539) (not b!1016537))
(check-sat)
