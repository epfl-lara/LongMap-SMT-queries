; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88234 () Bool)

(assert start!88234)

(declare-fun b!1016818 () Bool)

(assert (=> b!1016818 true))

(assert (=> b!1016818 true))

(declare-fun b!1016813 () Bool)

(declare-fun res!682021 () Bool)

(declare-fun e!572041 () Bool)

(assert (=> b!1016813 (=> (not res!682021) (not e!572041))))

(declare-datatypes ((B!1544 0))(
  ( (B!1545 (val!11856 Int)) )
))
(declare-datatypes ((tuple2!15258 0))(
  ( (tuple2!15259 (_1!7640 (_ BitVec 64)) (_2!7640 B!1544)) )
))
(declare-fun newHead!31 () tuple2!15258)

(declare-datatypes ((List!21535 0))(
  ( (Nil!21532) (Cons!21531 (h!22729 tuple2!15258) (t!30536 List!21535)) )
))
(declare-fun l!1114 () List!21535)

(declare-fun head!973 (List!21535) tuple2!15258)

(assert (=> b!1016813 (= res!682021 (bvslt (_1!7640 newHead!31) (_1!7640 (head!973 l!1114))))))

(declare-fun b!1016814 () Bool)

(declare-fun e!572042 () Bool)

(declare-datatypes ((List!21536 0))(
  ( (Nil!21533) (Cons!21532 (h!22730 (_ BitVec 64)) (t!30537 List!21536)) )
))
(declare-fun keys!40 () List!21536)

(declare-fun ListPrimitiveSize!124 (List!21536) Int)

(assert (=> b!1016814 (= e!572042 (< (ListPrimitiveSize!124 (t!30537 keys!40)) (ListPrimitiveSize!124 keys!40)))))

(declare-fun b!1016815 () Bool)

(assert (=> b!1016815 (= e!572041 (not e!572042))))

(declare-fun res!682017 () Bool)

(assert (=> b!1016815 (=> res!682017 e!572042)))

(declare-fun lambda!1045 () Int)

(declare-fun forall!286 (List!21536 Int) Bool)

(assert (=> b!1016815 (= res!682017 (not (forall!286 (t!30537 keys!40) lambda!1045)))))

(declare-fun lt!449337 () List!21535)

(declare-datatypes ((Option!609 0))(
  ( (Some!608 (v!14459 B!1544)) (None!607) )
))
(declare-fun isDefined!407 (Option!609) Bool)

(declare-fun getValueByKey!558 (List!21535 (_ BitVec 64)) Option!609)

(assert (=> b!1016815 (isDefined!407 (getValueByKey!558 lt!449337 (h!22730 keys!40)))))

(declare-datatypes ((Unit!33257 0))(
  ( (Unit!33258) )
))
(declare-fun lt!449336 () Unit!33257)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!386 (List!21535 (_ BitVec 64)) Unit!33257)

(assert (=> b!1016815 (= lt!449336 (lemmaContainsKeyImpliesGetValueByKeyDefined!386 lt!449337 (h!22730 keys!40)))))

(assert (=> b!1016815 (= lt!449337 (Cons!21531 newHead!31 l!1114))))

(declare-fun containsKey!496 (List!21535 (_ BitVec 64)) Bool)

(assert (=> b!1016815 (containsKey!496 l!1114 (h!22730 keys!40))))

(declare-fun lt!449335 () Unit!33257)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 (List!21535 (_ BitVec 64)) Unit!33257)

(assert (=> b!1016815 (= lt!449335 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22730 keys!40)))))

(declare-fun b!1016816 () Bool)

(declare-fun res!682020 () Bool)

(assert (=> b!1016816 (=> (not res!682020) (not e!572041))))

(assert (=> b!1016816 (= res!682020 (is-Cons!21532 keys!40))))

(declare-fun res!682022 () Bool)

(assert (=> start!88234 (=> (not res!682022) (not e!572041))))

(declare-fun isStrictlySorted!624 (List!21535) Bool)

(assert (=> start!88234 (= res!682022 (isStrictlySorted!624 l!1114))))

(assert (=> start!88234 e!572041))

(declare-fun e!572043 () Bool)

(assert (=> start!88234 e!572043))

(assert (=> start!88234 true))

(declare-fun tp_is_empty!23611 () Bool)

(assert (=> start!88234 tp_is_empty!23611))

(declare-fun b!1016817 () Bool)

(declare-fun res!682019 () Bool)

(assert (=> b!1016817 (=> (not res!682019) (not e!572041))))

(declare-fun isEmpty!892 (List!21535) Bool)

(assert (=> b!1016817 (= res!682019 (not (isEmpty!892 l!1114)))))

(declare-fun res!682018 () Bool)

(assert (=> b!1016818 (=> (not res!682018) (not e!572041))))

(assert (=> b!1016818 (= res!682018 (forall!286 keys!40 lambda!1045))))

(declare-fun b!1016819 () Bool)

(declare-fun tp!70810 () Bool)

(assert (=> b!1016819 (= e!572043 (and tp_is_empty!23611 tp!70810))))

(assert (= (and start!88234 res!682022) b!1016817))

(assert (= (and b!1016817 res!682019) b!1016818))

(assert (= (and b!1016818 res!682018) b!1016813))

(assert (= (and b!1016813 res!682021) b!1016816))

(assert (= (and b!1016816 res!682020) b!1016815))

(assert (= (and b!1016815 (not res!682017)) b!1016814))

(assert (= (and start!88234 (is-Cons!21531 l!1114)) b!1016819))

(declare-fun m!938347 () Bool)

(assert (=> b!1016817 m!938347))

(declare-fun m!938349 () Bool)

(assert (=> b!1016814 m!938349))

(declare-fun m!938351 () Bool)

(assert (=> b!1016814 m!938351))

(declare-fun m!938353 () Bool)

(assert (=> start!88234 m!938353))

(declare-fun m!938355 () Bool)

(assert (=> b!1016813 m!938355))

(declare-fun m!938357 () Bool)

(assert (=> b!1016818 m!938357))

(declare-fun m!938359 () Bool)

(assert (=> b!1016815 m!938359))

(declare-fun m!938361 () Bool)

(assert (=> b!1016815 m!938361))

(declare-fun m!938363 () Bool)

(assert (=> b!1016815 m!938363))

(assert (=> b!1016815 m!938361))

(declare-fun m!938365 () Bool)

(assert (=> b!1016815 m!938365))

(declare-fun m!938367 () Bool)

(assert (=> b!1016815 m!938367))

(declare-fun m!938369 () Bool)

(assert (=> b!1016815 m!938369))

(push 1)

(assert (not b!1016818))

(assert (not b!1016819))

(assert tp_is_empty!23611)

(assert (not start!88234))

(assert (not b!1016814))

(assert (not b!1016817))

(assert (not b!1016815))

(assert (not b!1016813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121385 () Bool)

(declare-fun res!682073 () Bool)

(declare-fun e!572082 () Bool)

(assert (=> d!121385 (=> res!682073 e!572082)))

(assert (=> d!121385 (= res!682073 (and (is-Cons!21531 l!1114) (= (_1!7640 (h!22729 l!1114)) (h!22730 keys!40))))))

(assert (=> d!121385 (= (containsKey!496 l!1114 (h!22730 keys!40)) e!572082)))

(declare-fun b!1016900 () Bool)

(declare-fun e!572083 () Bool)

(assert (=> b!1016900 (= e!572082 e!572083)))

(declare-fun res!682074 () Bool)

(assert (=> b!1016900 (=> (not res!682074) (not e!572083))))

(assert (=> b!1016900 (= res!682074 (and (or (not (is-Cons!21531 l!1114)) (bvsle (_1!7640 (h!22729 l!1114)) (h!22730 keys!40))) (is-Cons!21531 l!1114) (bvslt (_1!7640 (h!22729 l!1114)) (h!22730 keys!40))))))

(declare-fun b!1016901 () Bool)

(assert (=> b!1016901 (= e!572083 (containsKey!496 (t!30536 l!1114) (h!22730 keys!40)))))

(assert (= (and d!121385 (not res!682073)) b!1016900))

(assert (= (and b!1016900 res!682074) b!1016901))

(declare-fun m!938423 () Bool)

(assert (=> b!1016901 m!938423))

(assert (=> b!1016815 d!121385))

(declare-fun d!121391 () Bool)

(declare-fun isEmpty!895 (Option!609) Bool)

(assert (=> d!121391 (= (isDefined!407 (getValueByKey!558 lt!449337 (h!22730 keys!40))) (not (isEmpty!895 (getValueByKey!558 lt!449337 (h!22730 keys!40)))))))

(declare-fun bs!29539 () Bool)

(assert (= bs!29539 d!121391))

(assert (=> bs!29539 m!938361))

(declare-fun m!938429 () Bool)

(assert (=> bs!29539 m!938429))

(assert (=> b!1016815 d!121391))

(declare-fun d!121395 () Bool)

(assert (=> d!121395 (isDefined!407 (getValueByKey!558 lt!449337 (h!22730 keys!40)))))

(declare-fun lt!449361 () Unit!33257)

(declare-fun choose!1658 (List!21535 (_ BitVec 64)) Unit!33257)

(assert (=> d!121395 (= lt!449361 (choose!1658 lt!449337 (h!22730 keys!40)))))

(declare-fun e!572097 () Bool)

(assert (=> d!121395 e!572097))

(declare-fun res!682088 () Bool)

(assert (=> d!121395 (=> (not res!682088) (not e!572097))))

(assert (=> d!121395 (= res!682088 (isStrictlySorted!624 lt!449337))))

(assert (=> d!121395 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!386 lt!449337 (h!22730 keys!40)) lt!449361)))

(declare-fun b!1016915 () Bool)

(assert (=> b!1016915 (= e!572097 (containsKey!496 lt!449337 (h!22730 keys!40)))))

(assert (= (and d!121395 res!682088) b!1016915))

(assert (=> d!121395 m!938361))

(assert (=> d!121395 m!938361))

(assert (=> d!121395 m!938365))

(declare-fun m!938439 () Bool)

(assert (=> d!121395 m!938439))

(declare-fun m!938441 () Bool)

(assert (=> d!121395 m!938441))

(declare-fun m!938443 () Bool)

(assert (=> b!1016915 m!938443))

(assert (=> b!1016815 d!121395))

(declare-fun d!121401 () Bool)

(declare-fun c!102969 () Bool)

(assert (=> d!121401 (= c!102969 (and (is-Cons!21531 lt!449337) (= (_1!7640 (h!22729 lt!449337)) (h!22730 keys!40))))))

(declare-fun e!572111 () Option!609)

(assert (=> d!121401 (= (getValueByKey!558 lt!449337 (h!22730 keys!40)) e!572111)))

(declare-fun b!1016935 () Bool)

(declare-fun e!572112 () Option!609)

(assert (=> b!1016935 (= e!572112 (getValueByKey!558 (t!30536 lt!449337) (h!22730 keys!40)))))

(declare-fun b!1016933 () Bool)

(assert (=> b!1016933 (= e!572111 (Some!608 (_2!7640 (h!22729 lt!449337))))))

(declare-fun b!1016936 () Bool)

(assert (=> b!1016936 (= e!572112 None!607)))

(declare-fun b!1016934 () Bool)

(assert (=> b!1016934 (= e!572111 e!572112)))

(declare-fun c!102970 () Bool)

(assert (=> b!1016934 (= c!102970 (and (is-Cons!21531 lt!449337) (not (= (_1!7640 (h!22729 lt!449337)) (h!22730 keys!40)))))))

(assert (= (and d!121401 c!102969) b!1016933))

(assert (= (and d!121401 (not c!102969)) b!1016934))

(assert (= (and b!1016934 c!102970) b!1016935))

(assert (= (and b!1016934 (not c!102970)) b!1016936))

(declare-fun m!938457 () Bool)

(assert (=> b!1016935 m!938457))

(assert (=> b!1016815 d!121401))

(declare-fun d!121411 () Bool)

(declare-fun res!682112 () Bool)

(declare-fun e!572127 () Bool)

(assert (=> d!121411 (=> res!682112 e!572127)))

(assert (=> d!121411 (= res!682112 (is-Nil!21533 (t!30537 keys!40)))))

(assert (=> d!121411 (= (forall!286 (t!30537 keys!40) lambda!1045) e!572127)))

(declare-fun b!1016951 () Bool)

(declare-fun e!572128 () Bool)

(assert (=> b!1016951 (= e!572127 e!572128)))

(declare-fun res!682113 () Bool)

(assert (=> b!1016951 (=> (not res!682113) (not e!572128))))

(declare-fun dynLambda!1922 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016951 (= res!682113 (dynLambda!1922 lambda!1045 (h!22730 (t!30537 keys!40))))))

(declare-fun b!1016952 () Bool)

(assert (=> b!1016952 (= e!572128 (forall!286 (t!30537 (t!30537 keys!40)) lambda!1045))))

(assert (= (and d!121411 (not res!682112)) b!1016951))

(assert (= (and b!1016951 res!682113) b!1016952))

(declare-fun b_lambda!15559 () Bool)

(assert (=> (not b_lambda!15559) (not b!1016951)))

(declare-fun m!938465 () Bool)

(assert (=> b!1016951 m!938465))

(declare-fun m!938467 () Bool)

(assert (=> b!1016952 m!938467))

(assert (=> b!1016815 d!121411))

(declare-fun d!121417 () Bool)

(assert (=> d!121417 (containsKey!496 l!1114 (h!22730 keys!40))))

(declare-fun lt!449372 () Unit!33257)

(declare-fun choose!1660 (List!21535 (_ BitVec 64)) Unit!33257)

(assert (=> d!121417 (= lt!449372 (choose!1660 l!1114 (h!22730 keys!40)))))

(declare-fun e!572140 () Bool)

(assert (=> d!121417 e!572140))

(declare-fun res!682123 () Bool)

(assert (=> d!121417 (=> (not res!682123) (not e!572140))))

(assert (=> d!121417 (= res!682123 (isStrictlySorted!624 l!1114))))

(assert (=> d!121417 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22730 keys!40)) lt!449372)))

(declare-fun b!1016966 () Bool)

(assert (=> b!1016966 (= e!572140 (isDefined!407 (getValueByKey!558 l!1114 (h!22730 keys!40))))))

(assert (= (and d!121417 res!682123) b!1016966))

(assert (=> d!121417 m!938363))

(declare-fun m!938477 () Bool)

(assert (=> d!121417 m!938477))

(assert (=> d!121417 m!938353))

(declare-fun m!938479 () Bool)

(assert (=> b!1016966 m!938479))

(assert (=> b!1016966 m!938479))

(declare-fun m!938481 () Bool)

(assert (=> b!1016966 m!938481))

(assert (=> b!1016815 d!121417))

(declare-fun d!121427 () Bool)

(declare-fun res!682131 () Bool)

(declare-fun e!572153 () Bool)

(assert (=> d!121427 (=> res!682131 e!572153)))

(assert (=> d!121427 (= res!682131 (or (is-Nil!21532 l!1114) (is-Nil!21532 (t!30536 l!1114))))))

(assert (=> d!121427 (= (isStrictlySorted!624 l!1114) e!572153)))

(declare-fun b!1016983 () Bool)

(declare-fun e!572154 () Bool)

(assert (=> b!1016983 (= e!572153 e!572154)))

(declare-fun res!682132 () Bool)

(assert (=> b!1016983 (=> (not res!682132) (not e!572154))))

(assert (=> b!1016983 (= res!682132 (bvslt (_1!7640 (h!22729 l!1114)) (_1!7640 (h!22729 (t!30536 l!1114)))))))

(declare-fun b!1016984 () Bool)

(assert (=> b!1016984 (= e!572154 (isStrictlySorted!624 (t!30536 l!1114)))))

(assert (= (and d!121427 (not res!682131)) b!1016983))

(assert (= (and b!1016983 res!682132) b!1016984))

(declare-fun m!938493 () Bool)

(assert (=> b!1016984 m!938493))

(assert (=> start!88234 d!121427))

(declare-fun d!121437 () Bool)

(assert (=> d!121437 (= (isEmpty!892 l!1114) (is-Nil!21532 l!1114))))

(assert (=> b!1016817 d!121437))

(declare-fun d!121439 () Bool)

(declare-fun res!682133 () Bool)

(declare-fun e!572155 () Bool)

(assert (=> d!121439 (=> res!682133 e!572155)))

(assert (=> d!121439 (= res!682133 (is-Nil!21533 keys!40))))

(assert (=> d!121439 (= (forall!286 keys!40 lambda!1045) e!572155)))

(declare-fun b!1016985 () Bool)

(declare-fun e!572156 () Bool)

(assert (=> b!1016985 (= e!572155 e!572156)))

(declare-fun res!682134 () Bool)

(assert (=> b!1016985 (=> (not res!682134) (not e!572156))))

(assert (=> b!1016985 (= res!682134 (dynLambda!1922 lambda!1045 (h!22730 keys!40)))))

(declare-fun b!1016986 () Bool)

(assert (=> b!1016986 (= e!572156 (forall!286 (t!30537 keys!40) lambda!1045))))

(assert (= (and d!121439 (not res!682133)) b!1016985))

(assert (= (and b!1016985 res!682134) b!1016986))

(declare-fun b_lambda!15567 () Bool)

(assert (=> (not b_lambda!15567) (not b!1016985)))

(declare-fun m!938495 () Bool)

(assert (=> b!1016985 m!938495))

(assert (=> b!1016986 m!938359))

(assert (=> b!1016818 d!121439))

(declare-fun d!121441 () Bool)

(assert (=> d!121441 (= (head!973 l!1114) (h!22729 l!1114))))

(assert (=> b!1016813 d!121441))

(declare-fun d!121443 () Bool)

(declare-fun lt!449380 () Int)

(assert (=> d!121443 (>= lt!449380 0)))

(declare-fun e!572165 () Int)

(assert (=> d!121443 (= lt!449380 e!572165)))

(declare-fun c!102983 () Bool)

(assert (=> d!121443 (= c!102983 (is-Nil!21533 (t!30537 keys!40)))))

(assert (=> d!121443 (= (ListPrimitiveSize!124 (t!30537 keys!40)) lt!449380)))

(declare-fun b!1017003 () Bool)

(assert (=> b!1017003 (= e!572165 0)))

(declare-fun b!1017004 () Bool)

(assert (=> b!1017004 (= e!572165 (+ 1 (ListPrimitiveSize!124 (t!30537 (t!30537 keys!40)))))))

(assert (= (and d!121443 c!102983) b!1017003))

(assert (= (and d!121443 (not c!102983)) b!1017004))

(declare-fun m!938499 () Bool)

(assert (=> b!1017004 m!938499))

(assert (=> b!1016814 d!121443))

(declare-fun d!121447 () Bool)

(declare-fun lt!449381 () Int)

(assert (=> d!121447 (>= lt!449381 0)))

(declare-fun e!572166 () Int)

