; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137808 () Bool)

(assert start!137808)

(declare-fun b!1583048 () Bool)

(declare-fun res!1081458 () Bool)

(declare-fun e!883583 () Bool)

(assert (=> b!1583048 (=> (not res!1081458) (not e!883583))))

(declare-datatypes ((B!2834 0))(
  ( (B!2835 (val!19779 Int)) )
))
(declare-datatypes ((tuple2!25726 0))(
  ( (tuple2!25727 (_1!12874 (_ BitVec 64)) (_2!12874 B!2834)) )
))
(declare-datatypes ((List!36899 0))(
  ( (Nil!36896) (Cons!36895 (h!38438 tuple2!25726) (t!51813 List!36899)) )
))
(declare-fun l!1065 () List!36899)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!979 (List!36899 (_ BitVec 64)) Bool)

(assert (=> b!1583048 (= res!1081458 (containsKey!979 (t!51813 l!1065) key!287))))

(declare-fun b!1583049 () Bool)

(declare-datatypes ((Option!941 0))(
  ( (Some!940 (v!22468 B!2834)) (None!939) )
))
(declare-fun isDefined!606 (Option!941) Bool)

(declare-fun getValueByKey!832 (List!36899 (_ BitVec 64)) Option!941)

(assert (=> b!1583049 (= e!883583 (not (isDefined!606 (getValueByKey!832 l!1065 key!287))))))

(assert (=> b!1583049 (isDefined!606 (getValueByKey!832 (t!51813 l!1065) key!287))))

(declare-datatypes ((Unit!52279 0))(
  ( (Unit!52280) )
))
(declare-fun lt!677151 () Unit!52279)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!555 (List!36899 (_ BitVec 64)) Unit!52279)

(assert (=> b!1583049 (= lt!677151 (lemmaContainsKeyImpliesGetValueByKeyDefined!555 (t!51813 l!1065) key!287))))

(declare-fun b!1583050 () Bool)

(declare-fun res!1081455 () Bool)

(assert (=> b!1583050 (=> (not res!1081455) (not e!883583))))

(declare-fun isStrictlySorted!1133 (List!36899) Bool)

(assert (=> b!1583050 (= res!1081455 (isStrictlySorted!1133 (t!51813 l!1065)))))

(declare-fun b!1583051 () Bool)

(declare-fun e!883582 () Bool)

(declare-fun tp_is_empty!39367 () Bool)

(declare-fun tp!114893 () Bool)

(assert (=> b!1583051 (= e!883582 (and tp_is_empty!39367 tp!114893))))

(declare-fun res!1081457 () Bool)

(assert (=> start!137808 (=> (not res!1081457) (not e!883583))))

(assert (=> start!137808 (= res!1081457 (isStrictlySorted!1133 l!1065))))

(assert (=> start!137808 e!883583))

(assert (=> start!137808 e!883582))

(assert (=> start!137808 true))

(declare-fun b!1583052 () Bool)

(declare-fun res!1081454 () Bool)

(assert (=> b!1583052 (=> (not res!1081454) (not e!883583))))

(assert (=> b!1583052 (= res!1081454 (containsKey!979 l!1065 key!287))))

(declare-fun b!1583053 () Bool)

(declare-fun res!1081456 () Bool)

(assert (=> b!1583053 (=> (not res!1081456) (not e!883583))))

(assert (=> b!1583053 (= res!1081456 (and (is-Cons!36895 l!1065) (not (= (_1!12874 (h!38438 l!1065)) key!287))))))

(assert (= (and start!137808 res!1081457) b!1583052))

(assert (= (and b!1583052 res!1081454) b!1583053))

(assert (= (and b!1583053 res!1081456) b!1583050))

(assert (= (and b!1583050 res!1081455) b!1583048))

(assert (= (and b!1583048 res!1081458) b!1583049))

(assert (= (and start!137808 (is-Cons!36895 l!1065)) b!1583051))

(declare-fun m!1453133 () Bool)

(assert (=> b!1583048 m!1453133))

(declare-fun m!1453135 () Bool)

(assert (=> b!1583052 m!1453135))

(declare-fun m!1453137 () Bool)

(assert (=> b!1583049 m!1453137))

(declare-fun m!1453139 () Bool)

(assert (=> b!1583049 m!1453139))

(assert (=> b!1583049 m!1453137))

(declare-fun m!1453141 () Bool)

(assert (=> b!1583049 m!1453141))

(declare-fun m!1453143 () Bool)

(assert (=> b!1583049 m!1453143))

(assert (=> b!1583049 m!1453139))

(declare-fun m!1453145 () Bool)

(assert (=> b!1583049 m!1453145))

(declare-fun m!1453147 () Bool)

(assert (=> start!137808 m!1453147))

(declare-fun m!1453149 () Bool)

(assert (=> b!1583050 m!1453149))

(push 1)

(assert (not b!1583050))

(assert (not b!1583048))

(assert (not start!137808))

(assert (not b!1583052))

(assert tp_is_empty!39367)

(assert (not b!1583049))

(assert (not b!1583051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167121 () Bool)

(declare-fun res!1081511 () Bool)

(declare-fun e!883618 () Bool)

(assert (=> d!167121 (=> res!1081511 e!883618)))

(assert (=> d!167121 (= res!1081511 (and (is-Cons!36895 (t!51813 l!1065)) (= (_1!12874 (h!38438 (t!51813 l!1065))) key!287)))))

(assert (=> d!167121 (= (containsKey!979 (t!51813 l!1065) key!287) e!883618)))

(declare-fun b!1583112 () Bool)

(declare-fun e!883619 () Bool)

(assert (=> b!1583112 (= e!883618 e!883619)))

(declare-fun res!1081512 () Bool)

(assert (=> b!1583112 (=> (not res!1081512) (not e!883619))))

(assert (=> b!1583112 (= res!1081512 (and (or (not (is-Cons!36895 (t!51813 l!1065))) (bvsle (_1!12874 (h!38438 (t!51813 l!1065))) key!287)) (is-Cons!36895 (t!51813 l!1065)) (bvslt (_1!12874 (h!38438 (t!51813 l!1065))) key!287)))))

(declare-fun b!1583113 () Bool)

(assert (=> b!1583113 (= e!883619 (containsKey!979 (t!51813 (t!51813 l!1065)) key!287))))

(assert (= (and d!167121 (not res!1081511)) b!1583112))

(assert (= (and b!1583112 res!1081512) b!1583113))

(declare-fun m!1453191 () Bool)

(assert (=> b!1583113 m!1453191))

(assert (=> b!1583048 d!167121))

(declare-fun d!167129 () Bool)

(declare-fun res!1081527 () Bool)

(declare-fun e!883634 () Bool)

(assert (=> d!167129 (=> res!1081527 e!883634)))

(assert (=> d!167129 (= res!1081527 (or (is-Nil!36896 l!1065) (is-Nil!36896 (t!51813 l!1065))))))

(assert (=> d!167129 (= (isStrictlySorted!1133 l!1065) e!883634)))

(declare-fun b!1583128 () Bool)

(declare-fun e!883635 () Bool)

(assert (=> b!1583128 (= e!883634 e!883635)))

(declare-fun res!1081528 () Bool)

(assert (=> b!1583128 (=> (not res!1081528) (not e!883635))))

(assert (=> b!1583128 (= res!1081528 (bvslt (_1!12874 (h!38438 l!1065)) (_1!12874 (h!38438 (t!51813 l!1065)))))))

(declare-fun b!1583129 () Bool)

(assert (=> b!1583129 (= e!883635 (isStrictlySorted!1133 (t!51813 l!1065)))))

(assert (= (and d!167129 (not res!1081527)) b!1583128))

(assert (= (and b!1583128 res!1081528) b!1583129))

(assert (=> b!1583129 m!1453149))

(assert (=> start!137808 d!167129))

(declare-fun d!167141 () Bool)

(declare-fun isEmpty!1187 (Option!941) Bool)

(assert (=> d!167141 (= (isDefined!606 (getValueByKey!832 l!1065 key!287)) (not (isEmpty!1187 (getValueByKey!832 l!1065 key!287))))))

(declare-fun bs!45887 () Bool)

(assert (= bs!45887 d!167141))

(assert (=> bs!45887 m!1453137))

(declare-fun m!1453201 () Bool)

(assert (=> bs!45887 m!1453201))

(assert (=> b!1583049 d!167141))

(declare-fun d!167143 () Bool)

(declare-fun c!146704 () Bool)

(assert (=> d!167143 (= c!146704 (and (is-Cons!36895 l!1065) (= (_1!12874 (h!38438 l!1065)) key!287)))))

(declare-fun e!883656 () Option!941)

(assert (=> d!167143 (= (getValueByKey!832 l!1065 key!287) e!883656)))

(declare-fun b!1583171 () Bool)

(declare-fun e!883657 () Option!941)

(assert (=> b!1583171 (= e!883656 e!883657)))

(declare-fun c!146705 () Bool)

(assert (=> b!1583171 (= c!146705 (and (is-Cons!36895 l!1065) (not (= (_1!12874 (h!38438 l!1065)) key!287))))))

(declare-fun b!1583173 () Bool)

(assert (=> b!1583173 (= e!883657 None!939)))

(declare-fun b!1583170 () Bool)

(assert (=> b!1583170 (= e!883656 (Some!940 (_2!12874 (h!38438 l!1065))))))

(declare-fun b!1583172 () Bool)

(assert (=> b!1583172 (= e!883657 (getValueByKey!832 (t!51813 l!1065) key!287))))

(assert (= (and d!167143 c!146704) b!1583170))

(assert (= (and d!167143 (not c!146704)) b!1583171))

(assert (= (and b!1583171 c!146705) b!1583172))

(assert (= (and b!1583171 (not c!146705)) b!1583173))

(assert (=> b!1583172 m!1453139))

(assert (=> b!1583049 d!167143))

(declare-fun d!167157 () Bool)

(declare-fun c!146706 () Bool)

(assert (=> d!167157 (= c!146706 (and (is-Cons!36895 (t!51813 l!1065)) (= (_1!12874 (h!38438 (t!51813 l!1065))) key!287)))))

(declare-fun e!883658 () Option!941)

(assert (=> d!167157 (= (getValueByKey!832 (t!51813 l!1065) key!287) e!883658)))

(declare-fun b!1583175 () Bool)

(declare-fun e!883659 () Option!941)

(assert (=> b!1583175 (= e!883658 e!883659)))

(declare-fun c!146707 () Bool)

(assert (=> b!1583175 (= c!146707 (and (is-Cons!36895 (t!51813 l!1065)) (not (= (_1!12874 (h!38438 (t!51813 l!1065))) key!287))))))

(declare-fun b!1583177 () Bool)

(assert (=> b!1583177 (= e!883659 None!939)))

(declare-fun b!1583174 () Bool)

(assert (=> b!1583174 (= e!883658 (Some!940 (_2!12874 (h!38438 (t!51813 l!1065)))))))

(declare-fun b!1583176 () Bool)

(assert (=> b!1583176 (= e!883659 (getValueByKey!832 (t!51813 (t!51813 l!1065)) key!287))))

(assert (= (and d!167157 c!146706) b!1583174))

(assert (= (and d!167157 (not c!146706)) b!1583175))

(assert (= (and b!1583175 c!146707) b!1583176))

(assert (= (and b!1583175 (not c!146707)) b!1583177))

(declare-fun m!1453211 () Bool)

(assert (=> b!1583176 m!1453211))

(assert (=> b!1583049 d!167157))

(declare-fun d!167159 () Bool)

(assert (=> d!167159 (= (isDefined!606 (getValueByKey!832 (t!51813 l!1065) key!287)) (not (isEmpty!1187 (getValueByKey!832 (t!51813 l!1065) key!287))))))

(declare-fun bs!45890 () Bool)

(assert (= bs!45890 d!167159))

(assert (=> bs!45890 m!1453139))

(declare-fun m!1453213 () Bool)

(assert (=> bs!45890 m!1453213))

(assert (=> b!1583049 d!167159))

(declare-fun d!167161 () Bool)

(assert (=> d!167161 (isDefined!606 (getValueByKey!832 (t!51813 l!1065) key!287))))

(declare-fun lt!677166 () Unit!52279)

(declare-fun choose!2105 (List!36899 (_ BitVec 64)) Unit!52279)

(assert (=> d!167161 (= lt!677166 (choose!2105 (t!51813 l!1065) key!287))))

(declare-fun e!883675 () Bool)

(assert (=> d!167161 e!883675))

(declare-fun res!1081541 () Bool)

(assert (=> d!167161 (=> (not res!1081541) (not e!883675))))

(assert (=> d!167161 (= res!1081541 (isStrictlySorted!1133 (t!51813 l!1065)))))

(assert (=> d!167161 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!555 (t!51813 l!1065) key!287) lt!677166)))

(declare-fun b!1583195 () Bool)

(assert (=> b!1583195 (= e!883675 (containsKey!979 (t!51813 l!1065) key!287))))

(assert (= (and d!167161 res!1081541) b!1583195))

(assert (=> d!167161 m!1453139))

(assert (=> d!167161 m!1453139))

(assert (=> d!167161 m!1453145))

(declare-fun m!1453219 () Bool)

(assert (=> d!167161 m!1453219))

(assert (=> d!167161 m!1453149))

(assert (=> b!1583195 m!1453133))

(assert (=> b!1583049 d!167161))

(declare-fun d!167167 () Bool)

(declare-fun res!1081542 () Bool)

(declare-fun e!883678 () Bool)

(assert (=> d!167167 (=> res!1081542 e!883678)))

(assert (=> d!167167 (= res!1081542 (or (is-Nil!36896 (t!51813 l!1065)) (is-Nil!36896 (t!51813 (t!51813 l!1065)))))))

(assert (=> d!167167 (= (isStrictlySorted!1133 (t!51813 l!1065)) e!883678)))

(declare-fun b!1583200 () Bool)

(declare-fun e!883679 () Bool)

(assert (=> b!1583200 (= e!883678 e!883679)))

(declare-fun res!1081543 () Bool)

(assert (=> b!1583200 (=> (not res!1081543) (not e!883679))))

(assert (=> b!1583200 (= res!1081543 (bvslt (_1!12874 (h!38438 (t!51813 l!1065))) (_1!12874 (h!38438 (t!51813 (t!51813 l!1065))))))))

(declare-fun b!1583201 () Bool)

(assert (=> b!1583201 (= e!883679 (isStrictlySorted!1133 (t!51813 (t!51813 l!1065))))))

(assert (= (and d!167167 (not res!1081542)) b!1583200))

(assert (= (and b!1583200 res!1081543) b!1583201))

(declare-fun m!1453221 () Bool)

(assert (=> b!1583201 m!1453221))

(assert (=> b!1583050 d!167167))

(declare-fun d!167169 () Bool)

(declare-fun res!1081544 () Bool)

(declare-fun e!883681 () Bool)

(assert (=> d!167169 (=> res!1081544 e!883681)))

(assert (=> d!167169 (= res!1081544 (and (is-Cons!36895 l!1065) (= (_1!12874 (h!38438 l!1065)) key!287)))))

(assert (=> d!167169 (= (containsKey!979 l!1065 key!287) e!883681)))

(declare-fun b!1583203 () Bool)

(declare-fun e!883682 () Bool)

(assert (=> b!1583203 (= e!883681 e!883682)))

(declare-fun res!1081545 () Bool)

(assert (=> b!1583203 (=> (not res!1081545) (not e!883682))))

(assert (=> b!1583203 (= res!1081545 (and (or (not (is-Cons!36895 l!1065)) (bvsle (_1!12874 (h!38438 l!1065)) key!287)) (is-Cons!36895 l!1065) (bvslt (_1!12874 (h!38438 l!1065)) key!287)))))

(declare-fun b!1583204 () Bool)

