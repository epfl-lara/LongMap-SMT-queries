; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87460 () Bool)

(assert start!87460)

(declare-fun b!1013107 () Bool)

(assert (=> b!1013107 true))

(assert (=> b!1013107 true))

(declare-fun b!1013103 () Bool)

(declare-datatypes ((Unit!33108 0))(
  ( (Unit!33109) )
))
(declare-fun e!569886 () Unit!33108)

(declare-fun Unit!33110 () Unit!33108)

(assert (=> b!1013103 (= e!569886 Unit!33110)))

(declare-fun b!1013104 () Bool)

(declare-fun e!569887 () Bool)

(declare-fun tp_is_empty!23441 () Bool)

(declare-fun tp!70370 () Bool)

(assert (=> b!1013104 (= e!569887 (and tp_is_empty!23441 tp!70370))))

(declare-fun b!1013105 () Bool)

(declare-fun res!680286 () Bool)

(declare-fun e!569885 () Bool)

(assert (=> b!1013105 (=> (not res!680286) (not e!569885))))

(declare-datatypes ((B!1374 0))(
  ( (B!1375 (val!11771 Int)) )
))
(declare-datatypes ((tuple2!15088 0))(
  ( (tuple2!15089 (_1!7555 (_ BitVec 64)) (_2!7555 B!1374)) )
))
(declare-datatypes ((List!21389 0))(
  ( (Nil!21386) (Cons!21385 (h!22583 tuple2!15088) (t!30390 List!21389)) )
))
(declare-fun l!412 () List!21389)

(declare-fun value!115 () B!1374)

(assert (=> b!1013105 (= res!680286 (and (not (= (_2!7555 (h!22583 l!412)) value!115)) (is-Cons!21385 l!412)))))

(declare-fun b!1013106 () Bool)

(assert (=> b!1013106 (= e!569885 false)))

(declare-fun lt!447872 () Unit!33108)

(assert (=> b!1013106 (= lt!447872 e!569886)))

(declare-fun c!102402 () Bool)

(declare-datatypes ((List!21390 0))(
  ( (Nil!21387) (Cons!21386 (h!22584 (_ BitVec 64)) (t!30391 List!21390)) )
))
(declare-fun lt!447871 () List!21390)

(declare-fun isEmpty!812 (List!21390) Bool)

(assert (=> b!1013106 (= c!102402 (not (isEmpty!812 lt!447871)))))

(declare-fun getKeysOf!33 (List!21389 B!1374) List!21390)

(assert (=> b!1013106 (= lt!447871 (getKeysOf!33 (t!30390 l!412) value!115))))

(declare-fun lt!447873 () Unit!33108)

(assert (=> b!1013107 (= e!569886 lt!447873)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!21 (List!21389 List!21390 B!1374 tuple2!15088) Unit!33108)

(assert (=> b!1013107 (= lt!447873 (lemmaForallGetValueByKeySameWithASmallerHead!21 (t!30390 l!412) lt!447871 value!115 (h!22583 l!412)))))

(declare-fun lambda!479 () Int)

(declare-fun forall!226 (List!21390 Int) Bool)

(assert (=> b!1013107 (forall!226 lt!447871 lambda!479)))

(declare-fun res!680285 () Bool)

(assert (=> start!87460 (=> (not res!680285) (not e!569885))))

(declare-fun isStrictlySorted!551 (List!21389) Bool)

(assert (=> start!87460 (= res!680285 (isStrictlySorted!551 l!412))))

(assert (=> start!87460 e!569885))

(assert (=> start!87460 e!569887))

(assert (=> start!87460 tp_is_empty!23441))

(assert (= (and start!87460 res!680285) b!1013105))

(assert (= (and b!1013105 res!680286) b!1013106))

(assert (= (and b!1013106 c!102402) b!1013107))

(assert (= (and b!1013106 (not c!102402)) b!1013103))

(assert (= (and start!87460 (is-Cons!21385 l!412)) b!1013104))

(declare-fun m!936293 () Bool)

(assert (=> b!1013106 m!936293))

(declare-fun m!936295 () Bool)

(assert (=> b!1013106 m!936295))

(declare-fun m!936297 () Bool)

(assert (=> b!1013107 m!936297))

(declare-fun m!936299 () Bool)

(assert (=> b!1013107 m!936299))

(declare-fun m!936301 () Bool)

(assert (=> start!87460 m!936301))

(push 1)

(assert (not b!1013106))

