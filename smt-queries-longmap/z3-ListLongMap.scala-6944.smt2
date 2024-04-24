; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87694 () Bool)

(assert start!87694)

(declare-fun b!1014401 () Bool)

(assert (=> b!1014401 true))

(assert (=> b!1014401 true))

(declare-fun b!1014399 () Bool)

(declare-datatypes ((Unit!33100 0))(
  ( (Unit!33101) )
))
(declare-fun e!570725 () Unit!33100)

(declare-fun Unit!33102 () Unit!33100)

(assert (=> b!1014399 (= e!570725 Unit!33102)))

(declare-fun b!1014400 () Bool)

(declare-fun e!570724 () Bool)

(declare-fun tp_is_empty!23437 () Bool)

(declare-fun tp!70365 () Bool)

(assert (=> b!1014400 (= e!570724 (and tp_is_empty!23437 tp!70365))))

(declare-fun lt!448369 () Unit!33100)

(assert (=> b!1014401 (= e!570725 lt!448369)))

(declare-datatypes ((List!21374 0))(
  ( (Nil!21371) (Cons!21370 (h!22577 (_ BitVec 64)) (t!30367 List!21374)) )
))
(declare-fun lt!448368 () List!21374)

(declare-datatypes ((B!1370 0))(
  ( (B!1371 (val!11769 Int)) )
))
(declare-fun value!115 () B!1370)

(declare-datatypes ((tuple2!15088 0))(
  ( (tuple2!15089 (_1!7555 (_ BitVec 64)) (_2!7555 B!1370)) )
))
(declare-datatypes ((List!21375 0))(
  ( (Nil!21372) (Cons!21371 (h!22578 tuple2!15088) (t!30368 List!21375)) )
))
(declare-fun l!412 () List!21375)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!20 (List!21375 List!21374 B!1370 tuple2!15088) Unit!33100)

(assert (=> b!1014401 (= lt!448369 (lemmaForallGetValueByKeySameWithASmallerHead!20 (t!30368 l!412) lt!448368 value!115 (h!22578 l!412)))))

(declare-fun lambda!473 () Int)

(declare-fun forall!225 (List!21374 Int) Bool)

(assert (=> b!1014401 (forall!225 lt!448368 lambda!473)))

(declare-fun b!1014402 () Bool)

(declare-fun e!570726 () Bool)

(assert (=> b!1014402 (= e!570726 false)))

(declare-fun lt!448370 () Unit!33100)

(assert (=> b!1014402 (= lt!448370 e!570725)))

(declare-fun c!102811 () Bool)

(declare-fun isEmpty!814 (List!21374) Bool)

(assert (=> b!1014402 (= c!102811 (not (isEmpty!814 lt!448368)))))

(declare-fun getKeysOf!31 (List!21375 B!1370) List!21374)

(assert (=> b!1014402 (= lt!448368 (getKeysOf!31 (t!30368 l!412) value!115))))

(declare-fun b!1014403 () Bool)

(declare-fun res!680791 () Bool)

(assert (=> b!1014403 (=> (not res!680791) (not e!570726))))

(get-info :version)

(assert (=> b!1014403 (= res!680791 (and (not (= (_2!7555 (h!22578 l!412)) value!115)) ((_ is Cons!21371) l!412)))))

(declare-fun res!680792 () Bool)

(assert (=> start!87694 (=> (not res!680792) (not e!570726))))

(declare-fun isStrictlySorted!537 (List!21375) Bool)

(assert (=> start!87694 (= res!680792 (isStrictlySorted!537 l!412))))

(assert (=> start!87694 e!570726))

(assert (=> start!87694 e!570724))

(assert (=> start!87694 tp_is_empty!23437))

(assert (= (and start!87694 res!680792) b!1014403))

(assert (= (and b!1014403 res!680791) b!1014402))

(assert (= (and b!1014402 c!102811) b!1014401))

(assert (= (and b!1014402 (not c!102811)) b!1014399))

(assert (= (and start!87694 ((_ is Cons!21371) l!412)) b!1014400))

(declare-fun m!937949 () Bool)

(assert (=> b!1014401 m!937949))

(declare-fun m!937951 () Bool)

(assert (=> b!1014401 m!937951))

(declare-fun m!937953 () Bool)

(assert (=> b!1014402 m!937953))

(declare-fun m!937955 () Bool)

(assert (=> b!1014402 m!937955))

(declare-fun m!937957 () Bool)

(assert (=> start!87694 m!937957))

(check-sat (not start!87694) (not b!1014400) (not b!1014401) (not b!1014402) tp_is_empty!23437)
(check-sat)
