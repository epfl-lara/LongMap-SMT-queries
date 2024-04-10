; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137810 () Bool)

(assert start!137810)

(declare-fun b!1583066 () Bool)

(declare-fun e!883589 () Bool)

(declare-datatypes ((B!2836 0))(
  ( (B!2837 (val!19780 Int)) )
))
(declare-datatypes ((tuple2!25728 0))(
  ( (tuple2!25729 (_1!12875 (_ BitVec 64)) (_2!12875 B!2836)) )
))
(declare-datatypes ((List!36900 0))(
  ( (Nil!36897) (Cons!36896 (h!38439 tuple2!25728) (t!51814 List!36900)) )
))
(declare-fun l!1065 () List!36900)

(declare-fun key!287 () (_ BitVec 64))

(declare-datatypes ((Option!942 0))(
  ( (Some!941 (v!22469 B!2836)) (None!940) )
))
(declare-fun isDefined!607 (Option!942) Bool)

(declare-fun getValueByKey!833 (List!36900 (_ BitVec 64)) Option!942)

(assert (=> b!1583066 (= e!883589 (not (isDefined!607 (getValueByKey!833 l!1065 key!287))))))

(assert (=> b!1583066 (isDefined!607 (getValueByKey!833 (t!51814 l!1065) key!287))))

(declare-datatypes ((Unit!52281 0))(
  ( (Unit!52282) )
))
(declare-fun lt!677154 () Unit!52281)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!556 (List!36900 (_ BitVec 64)) Unit!52281)

(assert (=> b!1583066 (= lt!677154 (lemmaContainsKeyImpliesGetValueByKeyDefined!556 (t!51814 l!1065) key!287))))

(declare-fun b!1583068 () Bool)

(declare-fun e!883588 () Bool)

(declare-fun tp_is_empty!39369 () Bool)

(declare-fun tp!114896 () Bool)

(assert (=> b!1583068 (= e!883588 (and tp_is_empty!39369 tp!114896))))

(declare-fun b!1583069 () Bool)

(declare-fun res!1081471 () Bool)

(assert (=> b!1583069 (=> (not res!1081471) (not e!883589))))

(declare-fun isStrictlySorted!1134 (List!36900) Bool)

(assert (=> b!1583069 (= res!1081471 (isStrictlySorted!1134 (t!51814 l!1065)))))

(declare-fun b!1583070 () Bool)

(declare-fun res!1081470 () Bool)

(assert (=> b!1583070 (=> (not res!1081470) (not e!883589))))

(declare-fun containsKey!980 (List!36900 (_ BitVec 64)) Bool)

(assert (=> b!1583070 (= res!1081470 (containsKey!980 (t!51814 l!1065) key!287))))

(declare-fun b!1583071 () Bool)

(declare-fun res!1081472 () Bool)

(assert (=> b!1583071 (=> (not res!1081472) (not e!883589))))

(assert (=> b!1583071 (= res!1081472 (containsKey!980 l!1065 key!287))))

(declare-fun b!1583067 () Bool)

(declare-fun res!1081473 () Bool)

(assert (=> b!1583067 (=> (not res!1081473) (not e!883589))))

(get-info :version)

(assert (=> b!1583067 (= res!1081473 (and ((_ is Cons!36896) l!1065) (not (= (_1!12875 (h!38439 l!1065)) key!287))))))

(declare-fun res!1081469 () Bool)

(assert (=> start!137810 (=> (not res!1081469) (not e!883589))))

(assert (=> start!137810 (= res!1081469 (isStrictlySorted!1134 l!1065))))

(assert (=> start!137810 e!883589))

(assert (=> start!137810 e!883588))

(assert (=> start!137810 true))

(assert (= (and start!137810 res!1081469) b!1583071))

(assert (= (and b!1583071 res!1081472) b!1583067))

(assert (= (and b!1583067 res!1081473) b!1583069))

(assert (= (and b!1583069 res!1081471) b!1583070))

(assert (= (and b!1583070 res!1081470) b!1583066))

(assert (= (and start!137810 ((_ is Cons!36896) l!1065)) b!1583068))

(declare-fun m!1453151 () Bool)

(assert (=> start!137810 m!1453151))

(declare-fun m!1453153 () Bool)

(assert (=> b!1583071 m!1453153))

(declare-fun m!1453155 () Bool)

(assert (=> b!1583070 m!1453155))

(declare-fun m!1453157 () Bool)

(assert (=> b!1583069 m!1453157))

(declare-fun m!1453159 () Bool)

(assert (=> b!1583066 m!1453159))

(declare-fun m!1453161 () Bool)

(assert (=> b!1583066 m!1453161))

(assert (=> b!1583066 m!1453159))

(declare-fun m!1453163 () Bool)

(assert (=> b!1583066 m!1453163))

(declare-fun m!1453165 () Bool)

(assert (=> b!1583066 m!1453165))

(assert (=> b!1583066 m!1453161))

(declare-fun m!1453167 () Bool)

(assert (=> b!1583066 m!1453167))

(check-sat tp_is_empty!39369 (not b!1583068) (not b!1583066) (not b!1583071) (not b!1583069) (not start!137810) (not b!1583070))
(check-sat)
(get-model)

(declare-fun d!167117 () Bool)

(declare-fun res!1081493 () Bool)

(declare-fun e!883600 () Bool)

(assert (=> d!167117 (=> res!1081493 e!883600)))

(assert (=> d!167117 (= res!1081493 (or ((_ is Nil!36897) l!1065) ((_ is Nil!36897) (t!51814 l!1065))))))

(assert (=> d!167117 (= (isStrictlySorted!1134 l!1065) e!883600)))

(declare-fun b!1583094 () Bool)

(declare-fun e!883601 () Bool)

(assert (=> b!1583094 (= e!883600 e!883601)))

(declare-fun res!1081494 () Bool)

(assert (=> b!1583094 (=> (not res!1081494) (not e!883601))))

(assert (=> b!1583094 (= res!1081494 (bvslt (_1!12875 (h!38439 l!1065)) (_1!12875 (h!38439 (t!51814 l!1065)))))))

(declare-fun b!1583095 () Bool)

(assert (=> b!1583095 (= e!883601 (isStrictlySorted!1134 (t!51814 l!1065)))))

(assert (= (and d!167117 (not res!1081493)) b!1583094))

(assert (= (and b!1583094 res!1081494) b!1583095))

(assert (=> b!1583095 m!1453157))

(assert (=> start!137810 d!167117))

(declare-fun d!167123 () Bool)

(declare-fun res!1081495 () Bool)

(declare-fun e!883602 () Bool)

(assert (=> d!167123 (=> res!1081495 e!883602)))

(assert (=> d!167123 (= res!1081495 (or ((_ is Nil!36897) (t!51814 l!1065)) ((_ is Nil!36897) (t!51814 (t!51814 l!1065)))))))

(assert (=> d!167123 (= (isStrictlySorted!1134 (t!51814 l!1065)) e!883602)))

(declare-fun b!1583096 () Bool)

(declare-fun e!883603 () Bool)

(assert (=> b!1583096 (= e!883602 e!883603)))

(declare-fun res!1081496 () Bool)

(assert (=> b!1583096 (=> (not res!1081496) (not e!883603))))

(assert (=> b!1583096 (= res!1081496 (bvslt (_1!12875 (h!38439 (t!51814 l!1065))) (_1!12875 (h!38439 (t!51814 (t!51814 l!1065))))))))

(declare-fun b!1583097 () Bool)

(assert (=> b!1583097 (= e!883603 (isStrictlySorted!1134 (t!51814 (t!51814 l!1065))))))

(assert (= (and d!167123 (not res!1081495)) b!1583096))

(assert (= (and b!1583096 res!1081496) b!1583097))

(declare-fun m!1453187 () Bool)

(assert (=> b!1583097 m!1453187))

(assert (=> b!1583069 d!167123))

(declare-fun d!167125 () Bool)

(declare-fun res!1081513 () Bool)

(declare-fun e!883620 () Bool)

(assert (=> d!167125 (=> res!1081513 e!883620)))

(assert (=> d!167125 (= res!1081513 (and ((_ is Cons!36896) (t!51814 l!1065)) (= (_1!12875 (h!38439 (t!51814 l!1065))) key!287)))))

(assert (=> d!167125 (= (containsKey!980 (t!51814 l!1065) key!287) e!883620)))

(declare-fun b!1583114 () Bool)

(declare-fun e!883621 () Bool)

(assert (=> b!1583114 (= e!883620 e!883621)))

(declare-fun res!1081514 () Bool)

(assert (=> b!1583114 (=> (not res!1081514) (not e!883621))))

(assert (=> b!1583114 (= res!1081514 (and (or (not ((_ is Cons!36896) (t!51814 l!1065))) (bvsle (_1!12875 (h!38439 (t!51814 l!1065))) key!287)) ((_ is Cons!36896) (t!51814 l!1065)) (bvslt (_1!12875 (h!38439 (t!51814 l!1065))) key!287)))))

(declare-fun b!1583115 () Bool)

(assert (=> b!1583115 (= e!883621 (containsKey!980 (t!51814 (t!51814 l!1065)) key!287))))

(assert (= (and d!167125 (not res!1081513)) b!1583114))

(assert (= (and b!1583114 res!1081514) b!1583115))

(declare-fun m!1453193 () Bool)

(assert (=> b!1583115 m!1453193))

(assert (=> b!1583070 d!167125))

(declare-fun d!167131 () Bool)

(declare-fun res!1081518 () Bool)

(declare-fun e!883626 () Bool)

(assert (=> d!167131 (=> res!1081518 e!883626)))

(assert (=> d!167131 (= res!1081518 (and ((_ is Cons!36896) l!1065) (= (_1!12875 (h!38439 l!1065)) key!287)))))

(assert (=> d!167131 (= (containsKey!980 l!1065 key!287) e!883626)))

(declare-fun b!1583118 () Bool)

(declare-fun e!883627 () Bool)

(assert (=> b!1583118 (= e!883626 e!883627)))

(declare-fun res!1081520 () Bool)

(assert (=> b!1583118 (=> (not res!1081520) (not e!883627))))

(assert (=> b!1583118 (= res!1081520 (and (or (not ((_ is Cons!36896) l!1065)) (bvsle (_1!12875 (h!38439 l!1065)) key!287)) ((_ is Cons!36896) l!1065) (bvslt (_1!12875 (h!38439 l!1065)) key!287)))))

(declare-fun b!1583119 () Bool)

(assert (=> b!1583119 (= e!883627 (containsKey!980 (t!51814 l!1065) key!287))))

(assert (= (and d!167131 (not res!1081518)) b!1583118))

(assert (= (and b!1583118 res!1081520) b!1583119))

(assert (=> b!1583119 m!1453155))

(assert (=> b!1583071 d!167131))

(declare-fun d!167133 () Bool)

(declare-fun isEmpty!1189 (Option!942) Bool)

(assert (=> d!167133 (= (isDefined!607 (getValueByKey!833 l!1065 key!287)) (not (isEmpty!1189 (getValueByKey!833 l!1065 key!287))))))

(declare-fun bs!45885 () Bool)

(assert (= bs!45885 d!167133))

(assert (=> bs!45885 m!1453159))

(declare-fun m!1453195 () Bool)

(assert (=> bs!45885 m!1453195))

(assert (=> b!1583066 d!167133))

(declare-fun b!1583153 () Bool)

(declare-fun e!883647 () Option!942)

(assert (=> b!1583153 (= e!883647 None!940)))

(declare-fun d!167135 () Bool)

(declare-fun c!146694 () Bool)

(assert (=> d!167135 (= c!146694 (and ((_ is Cons!36896) l!1065) (= (_1!12875 (h!38439 l!1065)) key!287)))))

(declare-fun e!883646 () Option!942)

(assert (=> d!167135 (= (getValueByKey!833 l!1065 key!287) e!883646)))

(declare-fun b!1583151 () Bool)

(assert (=> b!1583151 (= e!883646 e!883647)))

(declare-fun c!146695 () Bool)

(assert (=> b!1583151 (= c!146695 (and ((_ is Cons!36896) l!1065) (not (= (_1!12875 (h!38439 l!1065)) key!287))))))

(declare-fun b!1583150 () Bool)

(assert (=> b!1583150 (= e!883646 (Some!941 (_2!12875 (h!38439 l!1065))))))

(declare-fun b!1583152 () Bool)

(assert (=> b!1583152 (= e!883647 (getValueByKey!833 (t!51814 l!1065) key!287))))

(assert (= (and d!167135 c!146694) b!1583150))

(assert (= (and d!167135 (not c!146694)) b!1583151))

(assert (= (and b!1583151 c!146695) b!1583152))

(assert (= (and b!1583151 (not c!146695)) b!1583153))

(assert (=> b!1583152 m!1453161))

(assert (=> b!1583066 d!167135))

(declare-fun b!1583161 () Bool)

(declare-fun e!883651 () Option!942)

(assert (=> b!1583161 (= e!883651 None!940)))

(declare-fun d!167145 () Bool)

(declare-fun c!146698 () Bool)

(assert (=> d!167145 (= c!146698 (and ((_ is Cons!36896) (t!51814 l!1065)) (= (_1!12875 (h!38439 (t!51814 l!1065))) key!287)))))

(declare-fun e!883650 () Option!942)

(assert (=> d!167145 (= (getValueByKey!833 (t!51814 l!1065) key!287) e!883650)))

(declare-fun b!1583159 () Bool)

(assert (=> b!1583159 (= e!883650 e!883651)))

(declare-fun c!146699 () Bool)

(assert (=> b!1583159 (= c!146699 (and ((_ is Cons!36896) (t!51814 l!1065)) (not (= (_1!12875 (h!38439 (t!51814 l!1065))) key!287))))))

(declare-fun b!1583158 () Bool)

(assert (=> b!1583158 (= e!883650 (Some!941 (_2!12875 (h!38439 (t!51814 l!1065)))))))

(declare-fun b!1583160 () Bool)

(assert (=> b!1583160 (= e!883651 (getValueByKey!833 (t!51814 (t!51814 l!1065)) key!287))))

(assert (= (and d!167145 c!146698) b!1583158))

(assert (= (and d!167145 (not c!146698)) b!1583159))

(assert (= (and b!1583159 c!146699) b!1583160))

(assert (= (and b!1583159 (not c!146699)) b!1583161))

(declare-fun m!1453203 () Bool)

(assert (=> b!1583160 m!1453203))

(assert (=> b!1583066 d!167145))

(declare-fun d!167147 () Bool)

(assert (=> d!167147 (= (isDefined!607 (getValueByKey!833 (t!51814 l!1065) key!287)) (not (isEmpty!1189 (getValueByKey!833 (t!51814 l!1065) key!287))))))

(declare-fun bs!45888 () Bool)

(assert (= bs!45888 d!167147))

(assert (=> bs!45888 m!1453161))

(declare-fun m!1453205 () Bool)

(assert (=> bs!45888 m!1453205))

(assert (=> b!1583066 d!167147))

(declare-fun d!167149 () Bool)

(assert (=> d!167149 (isDefined!607 (getValueByKey!833 (t!51814 l!1065) key!287))))

(declare-fun lt!677162 () Unit!52281)

(declare-fun choose!2104 (List!36900 (_ BitVec 64)) Unit!52281)

(assert (=> d!167149 (= lt!677162 (choose!2104 (t!51814 l!1065) key!287))))

(declare-fun e!883664 () Bool)

(assert (=> d!167149 e!883664))

(declare-fun res!1081533 () Bool)

(assert (=> d!167149 (=> (not res!1081533) (not e!883664))))

(assert (=> d!167149 (= res!1081533 (isStrictlySorted!1134 (t!51814 l!1065)))))

(assert (=> d!167149 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!556 (t!51814 l!1065) key!287) lt!677162)))

(declare-fun b!1583182 () Bool)

(assert (=> b!1583182 (= e!883664 (containsKey!980 (t!51814 l!1065) key!287))))

(assert (= (and d!167149 res!1081533) b!1583182))

(assert (=> d!167149 m!1453161))

(assert (=> d!167149 m!1453161))

(assert (=> d!167149 m!1453167))

(declare-fun m!1453215 () Bool)

(assert (=> d!167149 m!1453215))

(assert (=> d!167149 m!1453157))

(assert (=> b!1583182 m!1453155))

(assert (=> b!1583066 d!167149))

(declare-fun b!1583190 () Bool)

(declare-fun e!883670 () Bool)

(declare-fun tp!114902 () Bool)

(assert (=> b!1583190 (= e!883670 (and tp_is_empty!39369 tp!114902))))

(assert (=> b!1583068 (= tp!114896 e!883670)))

(assert (= (and b!1583068 ((_ is Cons!36896) (t!51814 l!1065))) b!1583190))

(check-sat (not d!167133) (not d!167149) tp_is_empty!39369 (not b!1583190) (not b!1583095) (not b!1583119) (not b!1583152) (not b!1583115) (not d!167147) (not b!1583097) (not b!1583182) (not b!1583160))
(check-sat)
