; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137744 () Bool)

(assert start!137744)

(declare-fun res!1081224 () Bool)

(declare-fun e!883346 () Bool)

(assert (=> start!137744 (=> (not res!1081224) (not e!883346))))

(declare-datatypes ((B!2818 0))(
  ( (B!2819 (val!19771 Int)) )
))
(declare-datatypes ((tuple2!25710 0))(
  ( (tuple2!25711 (_1!12866 (_ BitVec 64)) (_2!12866 B!2818)) )
))
(declare-datatypes ((List!36891 0))(
  ( (Nil!36888) (Cons!36887 (h!38430 tuple2!25710) (t!51805 List!36891)) )
))
(declare-fun l!1065 () List!36891)

(declare-fun isStrictlySorted!1125 (List!36891) Bool)

(assert (=> start!137744 (= res!1081224 (isStrictlySorted!1125 l!1065))))

(assert (=> start!137744 e!883346))

(declare-fun e!883345 () Bool)

(assert (=> start!137744 e!883345))

(assert (=> start!137744 true))

(declare-fun b!1582706 () Bool)

(declare-fun res!1081223 () Bool)

(assert (=> b!1582706 (=> (not res!1081223) (not e!883346))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!971 (List!36891 (_ BitVec 64)) Bool)

(assert (=> b!1582706 (= res!1081223 (containsKey!971 l!1065 key!287))))

(declare-fun b!1582707 () Bool)

(declare-fun ListPrimitiveSize!206 (List!36891) Int)

(assert (=> b!1582707 (= e!883346 (< (ListPrimitiveSize!206 l!1065) 0))))

(declare-fun b!1582708 () Bool)

(declare-fun tp_is_empty!39351 () Bool)

(declare-fun tp!114842 () Bool)

(assert (=> b!1582708 (= e!883345 (and tp_is_empty!39351 tp!114842))))

(assert (= (and start!137744 res!1081224) b!1582706))

(assert (= (and b!1582706 res!1081223) b!1582707))

(get-info :version)

(assert (= (and start!137744 ((_ is Cons!36887) l!1065)) b!1582708))

(declare-fun m!1453013 () Bool)

(assert (=> start!137744 m!1453013))

(declare-fun m!1453015 () Bool)

(assert (=> b!1582706 m!1453015))

(declare-fun m!1453017 () Bool)

(assert (=> b!1582707 m!1453017))

(check-sat (not b!1582706) tp_is_empty!39351 (not start!137744) (not b!1582708) (not b!1582707))
(check-sat)
(get-model)

(declare-fun d!167033 () Bool)

(declare-fun res!1081239 () Bool)

(declare-fun e!883363 () Bool)

(assert (=> d!167033 (=> res!1081239 e!883363)))

(assert (=> d!167033 (= res!1081239 (or ((_ is Nil!36888) l!1065) ((_ is Nil!36888) (t!51805 l!1065))))))

(assert (=> d!167033 (= (isStrictlySorted!1125 l!1065) e!883363)))

(declare-fun b!1582730 () Bool)

(declare-fun e!883364 () Bool)

(assert (=> b!1582730 (= e!883363 e!883364)))

(declare-fun res!1081240 () Bool)

(assert (=> b!1582730 (=> (not res!1081240) (not e!883364))))

(assert (=> b!1582730 (= res!1081240 (bvslt (_1!12866 (h!38430 l!1065)) (_1!12866 (h!38430 (t!51805 l!1065)))))))

(declare-fun b!1582731 () Bool)

(assert (=> b!1582731 (= e!883364 (isStrictlySorted!1125 (t!51805 l!1065)))))

(assert (= (and d!167033 (not res!1081239)) b!1582730))

(assert (= (and b!1582730 res!1081240) b!1582731))

(declare-fun m!1453025 () Bool)

(assert (=> b!1582731 m!1453025))

(assert (=> start!137744 d!167033))

(declare-fun d!167039 () Bool)

(declare-fun lt!677133 () Int)

(assert (=> d!167039 (>= lt!677133 0)))

(declare-fun e!883374 () Int)

(assert (=> d!167039 (= lt!677133 e!883374)))

(declare-fun c!146668 () Bool)

(assert (=> d!167039 (= c!146668 ((_ is Nil!36888) l!1065))))

(assert (=> d!167039 (= (ListPrimitiveSize!206 l!1065) lt!677133)))

(declare-fun b!1582744 () Bool)

(assert (=> b!1582744 (= e!883374 0)))

(declare-fun b!1582745 () Bool)

(assert (=> b!1582745 (= e!883374 (+ 1 (ListPrimitiveSize!206 (t!51805 l!1065))))))

(assert (= (and d!167039 c!146668) b!1582744))

(assert (= (and d!167039 (not c!146668)) b!1582745))

(declare-fun m!1453031 () Bool)

(assert (=> b!1582745 m!1453031))

(assert (=> b!1582707 d!167039))

(declare-fun d!167045 () Bool)

(declare-fun res!1081263 () Bool)

(declare-fun e!883393 () Bool)

(assert (=> d!167045 (=> res!1081263 e!883393)))

(assert (=> d!167045 (= res!1081263 (and ((_ is Cons!36887) l!1065) (= (_1!12866 (h!38430 l!1065)) key!287)))))

(assert (=> d!167045 (= (containsKey!971 l!1065 key!287) e!883393)))

(declare-fun b!1582766 () Bool)

(declare-fun e!883394 () Bool)

(assert (=> b!1582766 (= e!883393 e!883394)))

(declare-fun res!1081264 () Bool)

(assert (=> b!1582766 (=> (not res!1081264) (not e!883394))))

(assert (=> b!1582766 (= res!1081264 (and (or (not ((_ is Cons!36887) l!1065)) (bvsle (_1!12866 (h!38430 l!1065)) key!287)) ((_ is Cons!36887) l!1065) (bvslt (_1!12866 (h!38430 l!1065)) key!287)))))

(declare-fun b!1582767 () Bool)

(assert (=> b!1582767 (= e!883394 (containsKey!971 (t!51805 l!1065) key!287))))

(assert (= (and d!167045 (not res!1081263)) b!1582766))

(assert (= (and b!1582766 res!1081264) b!1582767))

(declare-fun m!1453037 () Bool)

(assert (=> b!1582767 m!1453037))

(assert (=> b!1582706 d!167045))

(declare-fun b!1582782 () Bool)

(declare-fun e!883402 () Bool)

(declare-fun tp!114848 () Bool)

(assert (=> b!1582782 (= e!883402 (and tp_is_empty!39351 tp!114848))))

(assert (=> b!1582708 (= tp!114842 e!883402)))

(assert (= (and b!1582708 ((_ is Cons!36887) (t!51805 l!1065))) b!1582782))

(check-sat (not b!1582745) (not b!1582731) (not b!1582782) (not b!1582767) tp_is_empty!39351)
(check-sat)
