; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88174 () Bool)

(assert start!88174)

(declare-fun b!1016485 () Bool)

(assert (=> b!1016485 true))

(assert (=> b!1016485 true))

(declare-fun res!681831 () Bool)

(declare-fun e!571835 () Bool)

(assert (=> start!88174 (=> (not res!681831) (not e!571835))))

(declare-datatypes ((B!1538 0))(
  ( (B!1539 (val!11853 Int)) )
))
(declare-datatypes ((tuple2!15332 0))(
  ( (tuple2!15333 (_1!7677 (_ BitVec 64)) (_2!7677 B!1538)) )
))
(declare-datatypes ((List!21564 0))(
  ( (Nil!21561) (Cons!21560 (h!22758 tuple2!15332) (t!30556 List!21564)) )
))
(declare-fun l!1114 () List!21564)

(declare-fun isStrictlySorted!617 (List!21564) Bool)

(assert (=> start!88174 (= res!681831 (isStrictlySorted!617 l!1114))))

(assert (=> start!88174 e!571835))

(declare-fun e!571836 () Bool)

(assert (=> start!88174 e!571836))

(assert (=> start!88174 true))

(declare-fun tp_is_empty!23605 () Bool)

(assert (=> start!88174 tp_is_empty!23605))

(declare-fun b!1016480 () Bool)

(declare-fun res!681830 () Bool)

(assert (=> b!1016480 (=> (not res!681830) (not e!571835))))

(declare-datatypes ((List!21565 0))(
  ( (Nil!21562) (Cons!21561 (h!22759 (_ BitVec 64)) (t!30557 List!21565)) )
))
(declare-fun keys!40 () List!21565)

(get-info :version)

(assert (=> b!1016480 (= res!681830 ((_ is Cons!21561) keys!40))))

(declare-fun b!1016481 () Bool)

(declare-fun res!681832 () Bool)

(assert (=> b!1016481 (=> (not res!681832) (not e!571835))))

(declare-fun isEmpty!891 (List!21564) Bool)

(assert (=> b!1016481 (= res!681832 (not (isEmpty!891 l!1114)))))

(declare-fun b!1016482 () Bool)

(declare-fun lambda!1030 () Int)

(declare-fun forall!287 (List!21565 Int) Bool)

(assert (=> b!1016482 (= e!571835 (not (forall!287 (t!30557 keys!40) lambda!1030)))))

(declare-fun lt!449091 () List!21564)

(declare-datatypes ((Option!609 0))(
  ( (Some!608 (v!14456 B!1538)) (None!607) )
))
(declare-fun isDefined!407 (Option!609) Bool)

(declare-fun getValueByKey!558 (List!21564 (_ BitVec 64)) Option!609)

(assert (=> b!1016482 (isDefined!407 (getValueByKey!558 lt!449091 (h!22759 keys!40)))))

(declare-datatypes ((Unit!33147 0))(
  ( (Unit!33148) )
))
(declare-fun lt!449090 () Unit!33147)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!382 (List!21564 (_ BitVec 64)) Unit!33147)

(assert (=> b!1016482 (= lt!449090 (lemmaContainsKeyImpliesGetValueByKeyDefined!382 lt!449091 (h!22759 keys!40)))))

(declare-fun newHead!31 () tuple2!15332)

(assert (=> b!1016482 (= lt!449091 (Cons!21560 newHead!31 l!1114))))

(declare-fun containsKey!493 (List!21564 (_ BitVec 64)) Bool)

(assert (=> b!1016482 (containsKey!493 l!1114 (h!22759 keys!40))))

(declare-fun lt!449092 () Unit!33147)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 (List!21564 (_ BitVec 64)) Unit!33147)

(assert (=> b!1016482 (= lt!449092 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22759 keys!40)))))

(declare-fun b!1016483 () Bool)

(declare-fun res!681833 () Bool)

(assert (=> b!1016483 (=> (not res!681833) (not e!571835))))

(declare-fun head!969 (List!21564) tuple2!15332)

(assert (=> b!1016483 (= res!681833 (bvslt (_1!7677 newHead!31) (_1!7677 (head!969 l!1114))))))

(declare-fun b!1016484 () Bool)

(declare-fun tp!70793 () Bool)

(assert (=> b!1016484 (= e!571836 (and tp_is_empty!23605 tp!70793))))

(declare-fun res!681829 () Bool)

(assert (=> b!1016485 (=> (not res!681829) (not e!571835))))

(assert (=> b!1016485 (= res!681829 (forall!287 keys!40 lambda!1030))))

(assert (= (and start!88174 res!681831) b!1016481))

(assert (= (and b!1016481 res!681832) b!1016485))

(assert (= (and b!1016485 res!681829) b!1016483))

(assert (= (and b!1016483 res!681833) b!1016480))

(assert (= (and b!1016480 res!681830) b!1016482))

(assert (= (and start!88174 ((_ is Cons!21560) l!1114)) b!1016484))

(declare-fun m!937591 () Bool)

(assert (=> start!88174 m!937591))

(declare-fun m!937593 () Bool)

(assert (=> b!1016485 m!937593))

(declare-fun m!937595 () Bool)

(assert (=> b!1016481 m!937595))

(declare-fun m!937597 () Bool)

(assert (=> b!1016483 m!937597))

(declare-fun m!937599 () Bool)

(assert (=> b!1016482 m!937599))

(declare-fun m!937601 () Bool)

(assert (=> b!1016482 m!937601))

(assert (=> b!1016482 m!937599))

(declare-fun m!937603 () Bool)

(assert (=> b!1016482 m!937603))

(declare-fun m!937605 () Bool)

(assert (=> b!1016482 m!937605))

(declare-fun m!937607 () Bool)

(assert (=> b!1016482 m!937607))

(declare-fun m!937609 () Bool)

(assert (=> b!1016482 m!937609))

(check-sat (not b!1016483) (not start!88174) tp_is_empty!23605 (not b!1016484) (not b!1016481) (not b!1016482) (not b!1016485))
(check-sat)
(get-model)

(declare-fun d!121165 () Bool)

(assert (=> d!121165 (= (head!969 l!1114) (h!22758 l!1114))))

(assert (=> b!1016483 d!121165))

(declare-fun d!121167 () Bool)

(declare-fun res!681868 () Bool)

(declare-fun e!571853 () Bool)

(assert (=> d!121167 (=> res!681868 e!571853)))

(assert (=> d!121167 (= res!681868 (and ((_ is Cons!21560) l!1114) (= (_1!7677 (h!22758 l!1114)) (h!22759 keys!40))))))

(assert (=> d!121167 (= (containsKey!493 l!1114 (h!22759 keys!40)) e!571853)))

(declare-fun b!1016538 () Bool)

(declare-fun e!571854 () Bool)

(assert (=> b!1016538 (= e!571853 e!571854)))

(declare-fun res!681869 () Bool)

(assert (=> b!1016538 (=> (not res!681869) (not e!571854))))

(assert (=> b!1016538 (= res!681869 (and (or (not ((_ is Cons!21560) l!1114)) (bvsle (_1!7677 (h!22758 l!1114)) (h!22759 keys!40))) ((_ is Cons!21560) l!1114) (bvslt (_1!7677 (h!22758 l!1114)) (h!22759 keys!40))))))

(declare-fun b!1016539 () Bool)

(assert (=> b!1016539 (= e!571854 (containsKey!493 (t!30556 l!1114) (h!22759 keys!40)))))

(assert (= (and d!121167 (not res!681868)) b!1016538))

(assert (= (and b!1016538 res!681869) b!1016539))

(declare-fun m!937651 () Bool)

(assert (=> b!1016539 m!937651))

(assert (=> b!1016482 d!121167))

(declare-fun b!1016554 () Bool)

(declare-fun e!571864 () Option!609)

(assert (=> b!1016554 (= e!571864 (getValueByKey!558 (t!30556 lt!449091) (h!22759 keys!40)))))

(declare-fun b!1016553 () Bool)

(declare-fun e!571863 () Option!609)

(assert (=> b!1016553 (= e!571863 e!571864)))

(declare-fun c!102912 () Bool)

(assert (=> b!1016553 (= c!102912 (and ((_ is Cons!21560) lt!449091) (not (= (_1!7677 (h!22758 lt!449091)) (h!22759 keys!40)))))))

(declare-fun b!1016552 () Bool)

(assert (=> b!1016552 (= e!571863 (Some!608 (_2!7677 (h!22758 lt!449091))))))

(declare-fun b!1016555 () Bool)

(assert (=> b!1016555 (= e!571864 None!607)))

(declare-fun d!121169 () Bool)

(declare-fun c!102911 () Bool)

(assert (=> d!121169 (= c!102911 (and ((_ is Cons!21560) lt!449091) (= (_1!7677 (h!22758 lt!449091)) (h!22759 keys!40))))))

(assert (=> d!121169 (= (getValueByKey!558 lt!449091 (h!22759 keys!40)) e!571863)))

(assert (= (and d!121169 c!102911) b!1016552))

(assert (= (and d!121169 (not c!102911)) b!1016553))

(assert (= (and b!1016553 c!102912) b!1016554))

(assert (= (and b!1016553 (not c!102912)) b!1016555))

(declare-fun m!937655 () Bool)

(assert (=> b!1016554 m!937655))

(assert (=> b!1016482 d!121169))

(declare-fun d!121175 () Bool)

(declare-fun res!681884 () Bool)

(declare-fun e!571875 () Bool)

(assert (=> d!121175 (=> res!681884 e!571875)))

(assert (=> d!121175 (= res!681884 ((_ is Nil!21562) (t!30557 keys!40)))))

(assert (=> d!121175 (= (forall!287 (t!30557 keys!40) lambda!1030) e!571875)))

(declare-fun b!1016566 () Bool)

(declare-fun e!571876 () Bool)

(assert (=> b!1016566 (= e!571875 e!571876)))

(declare-fun res!681885 () Bool)

(assert (=> b!1016566 (=> (not res!681885) (not e!571876))))

(declare-fun dynLambda!1911 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016566 (= res!681885 (dynLambda!1911 lambda!1030 (h!22759 (t!30557 keys!40))))))

(declare-fun b!1016567 () Bool)

(assert (=> b!1016567 (= e!571876 (forall!287 (t!30557 (t!30557 keys!40)) lambda!1030))))

(assert (= (and d!121175 (not res!681884)) b!1016566))

(assert (= (and b!1016566 res!681885) b!1016567))

(declare-fun b_lambda!15509 () Bool)

(assert (=> (not b_lambda!15509) (not b!1016566)))

(declare-fun m!937657 () Bool)

(assert (=> b!1016566 m!937657))

(declare-fun m!937659 () Bool)

(assert (=> b!1016567 m!937659))

(assert (=> b!1016482 d!121175))

(declare-fun d!121177 () Bool)

(assert (=> d!121177 (containsKey!493 l!1114 (h!22759 keys!40))))

(declare-fun lt!449113 () Unit!33147)

(declare-fun choose!1659 (List!21564 (_ BitVec 64)) Unit!33147)

(assert (=> d!121177 (= lt!449113 (choose!1659 l!1114 (h!22759 keys!40)))))

(declare-fun e!571889 () Bool)

(assert (=> d!121177 e!571889))

(declare-fun res!681894 () Bool)

(assert (=> d!121177 (=> (not res!681894) (not e!571889))))

(assert (=> d!121177 (= res!681894 (isStrictlySorted!617 l!1114))))

(assert (=> d!121177 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22759 keys!40)) lt!449113)))

(declare-fun b!1016584 () Bool)

(assert (=> b!1016584 (= e!571889 (isDefined!407 (getValueByKey!558 l!1114 (h!22759 keys!40))))))

(assert (= (and d!121177 res!681894) b!1016584))

(assert (=> d!121177 m!937601))

(declare-fun m!937663 () Bool)

(assert (=> d!121177 m!937663))

(assert (=> d!121177 m!937591))

(declare-fun m!937665 () Bool)

(assert (=> b!1016584 m!937665))

(assert (=> b!1016584 m!937665))

(declare-fun m!937667 () Bool)

(assert (=> b!1016584 m!937667))

(assert (=> b!1016482 d!121177))

(declare-fun d!121183 () Bool)

(assert (=> d!121183 (isDefined!407 (getValueByKey!558 lt!449091 (h!22759 keys!40)))))

(declare-fun lt!449116 () Unit!33147)

(declare-fun choose!1660 (List!21564 (_ BitVec 64)) Unit!33147)

(assert (=> d!121183 (= lt!449116 (choose!1660 lt!449091 (h!22759 keys!40)))))

(declare-fun e!571904 () Bool)

(assert (=> d!121183 e!571904))

(declare-fun res!681903 () Bool)

(assert (=> d!121183 (=> (not res!681903) (not e!571904))))

(assert (=> d!121183 (= res!681903 (isStrictlySorted!617 lt!449091))))

(assert (=> d!121183 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!382 lt!449091 (h!22759 keys!40)) lt!449116)))

(declare-fun b!1016605 () Bool)

(assert (=> b!1016605 (= e!571904 (containsKey!493 lt!449091 (h!22759 keys!40)))))

(assert (= (and d!121183 res!681903) b!1016605))

(assert (=> d!121183 m!937599))

(assert (=> d!121183 m!937599))

(assert (=> d!121183 m!937603))

(declare-fun m!937675 () Bool)

(assert (=> d!121183 m!937675))

(declare-fun m!937677 () Bool)

(assert (=> d!121183 m!937677))

(declare-fun m!937679 () Bool)

(assert (=> b!1016605 m!937679))

(assert (=> b!1016482 d!121183))

(declare-fun d!121191 () Bool)

(declare-fun isEmpty!895 (Option!609) Bool)

(assert (=> d!121191 (= (isDefined!407 (getValueByKey!558 lt!449091 (h!22759 keys!40))) (not (isEmpty!895 (getValueByKey!558 lt!449091 (h!22759 keys!40)))))))

(declare-fun bs!29499 () Bool)

(assert (= bs!29499 d!121191))

(assert (=> bs!29499 m!937599))

(declare-fun m!937685 () Bool)

(assert (=> bs!29499 m!937685))

(assert (=> b!1016482 d!121191))

(declare-fun d!121195 () Bool)

(declare-fun res!681914 () Bool)

(declare-fun e!571917 () Bool)

(assert (=> d!121195 (=> res!681914 e!571917)))

(assert (=> d!121195 (= res!681914 (or ((_ is Nil!21561) l!1114) ((_ is Nil!21561) (t!30556 l!1114))))))

(assert (=> d!121195 (= (isStrictlySorted!617 l!1114) e!571917)))

(declare-fun b!1016618 () Bool)

(declare-fun e!571918 () Bool)

(assert (=> b!1016618 (= e!571917 e!571918)))

(declare-fun res!681915 () Bool)

(assert (=> b!1016618 (=> (not res!681915) (not e!571918))))

(assert (=> b!1016618 (= res!681915 (bvslt (_1!7677 (h!22758 l!1114)) (_1!7677 (h!22758 (t!30556 l!1114)))))))

(declare-fun b!1016619 () Bool)

(assert (=> b!1016619 (= e!571918 (isStrictlySorted!617 (t!30556 l!1114)))))

(assert (= (and d!121195 (not res!681914)) b!1016618))

(assert (= (and b!1016618 res!681915) b!1016619))

(declare-fun m!937689 () Bool)

(assert (=> b!1016619 m!937689))

(assert (=> start!88174 d!121195))

(declare-fun d!121199 () Bool)

(declare-fun res!681917 () Bool)

(declare-fun e!571920 () Bool)

(assert (=> d!121199 (=> res!681917 e!571920)))

(assert (=> d!121199 (= res!681917 ((_ is Nil!21562) keys!40))))

(assert (=> d!121199 (= (forall!287 keys!40 lambda!1030) e!571920)))

(declare-fun b!1016623 () Bool)

(declare-fun e!571921 () Bool)

(assert (=> b!1016623 (= e!571920 e!571921)))

(declare-fun res!681918 () Bool)

(assert (=> b!1016623 (=> (not res!681918) (not e!571921))))

(assert (=> b!1016623 (= res!681918 (dynLambda!1911 lambda!1030 (h!22759 keys!40)))))

(declare-fun b!1016624 () Bool)

(assert (=> b!1016624 (= e!571921 (forall!287 (t!30557 keys!40) lambda!1030))))

(assert (= (and d!121199 (not res!681917)) b!1016623))

(assert (= (and b!1016623 res!681918) b!1016624))

(declare-fun b_lambda!15513 () Bool)

(assert (=> (not b_lambda!15513) (not b!1016623)))

(declare-fun m!937697 () Bool)

(assert (=> b!1016623 m!937697))

(assert (=> b!1016624 m!937605))

(assert (=> b!1016485 d!121199))

(declare-fun d!121203 () Bool)

(assert (=> d!121203 (= (isEmpty!891 l!1114) ((_ is Nil!21561) l!1114))))

(assert (=> b!1016481 d!121203))

(declare-fun b!1016630 () Bool)

(declare-fun e!571925 () Bool)

(declare-fun tp!70802 () Bool)

(assert (=> b!1016630 (= e!571925 (and tp_is_empty!23605 tp!70802))))

(assert (=> b!1016484 (= tp!70793 e!571925)))

(assert (= (and b!1016484 ((_ is Cons!21560) (t!30556 l!1114))) b!1016630))

(declare-fun b_lambda!15515 () Bool)

(assert (= b_lambda!15513 (or b!1016485 b_lambda!15515)))

(declare-fun bs!29501 () Bool)

(declare-fun d!121209 () Bool)

(assert (= bs!29501 (and d!121209 b!1016485)))

(declare-fun value!178 () B!1538)

(assert (=> bs!29501 (= (dynLambda!1911 lambda!1030 (h!22759 keys!40)) (= (getValueByKey!558 l!1114 (h!22759 keys!40)) (Some!608 value!178)))))

(assert (=> bs!29501 m!937665))

(assert (=> b!1016623 d!121209))

(declare-fun b_lambda!15517 () Bool)

(assert (= b_lambda!15509 (or b!1016485 b_lambda!15517)))

(declare-fun bs!29502 () Bool)

(declare-fun d!121211 () Bool)

(assert (= bs!29502 (and d!121211 b!1016485)))

(assert (=> bs!29502 (= (dynLambda!1911 lambda!1030 (h!22759 (t!30557 keys!40))) (= (getValueByKey!558 l!1114 (h!22759 (t!30557 keys!40))) (Some!608 value!178)))))

(declare-fun m!937707 () Bool)

(assert (=> bs!29502 m!937707))

(assert (=> b!1016566 d!121211))

(check-sat (not b!1016624) (not b!1016605) (not b_lambda!15515) (not b!1016554) (not b_lambda!15517) (not d!121183) (not b!1016619) (not b!1016567) (not d!121177) (not bs!29501) (not bs!29502) (not b!1016539) (not d!121191) tp_is_empty!23605 (not b!1016630) (not b!1016584))
(check-sat)
