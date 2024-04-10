; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87358 () Bool)

(assert start!87358)

(declare-fun b!1012357 () Bool)

(assert (=> b!1012357 true))

(assert (=> b!1012357 true))

(declare-fun res!679982 () Bool)

(declare-fun e!569484 () Bool)

(assert (=> start!87358 (=> (not res!679982) (not e!569484))))

(declare-datatypes ((B!1338 0))(
  ( (B!1339 (val!11753 Int)) )
))
(declare-datatypes ((tuple2!15052 0))(
  ( (tuple2!15053 (_1!7537 (_ BitVec 64)) (_2!7537 B!1338)) )
))
(declare-datatypes ((List!21356 0))(
  ( (Nil!21353) (Cons!21352 (h!22550 tuple2!15052) (t!30357 List!21356)) )
))
(declare-fun l!412 () List!21356)

(declare-fun isStrictlySorted!533 (List!21356) Bool)

(assert (=> start!87358 (= res!679982 (isStrictlySorted!533 l!412))))

(assert (=> start!87358 e!569484))

(declare-fun e!569483 () Bool)

(assert (=> start!87358 e!569483))

(declare-fun tp_is_empty!23405 () Bool)

(assert (=> start!87358 tp_is_empty!23405))

(declare-fun b!1012356 () Bool)

(declare-fun tp!70280 () Bool)

(assert (=> b!1012356 (= e!569483 (and tp_is_empty!23405 tp!70280))))

(declare-datatypes ((Unit!33064 0))(
  ( (Unit!33065) )
))
(declare-fun e!569485 () Unit!33064)

(declare-fun lt!447468 () Unit!33064)

(assert (=> b!1012357 (= e!569485 lt!447468)))

(declare-datatypes ((List!21357 0))(
  ( (Nil!21354) (Cons!21353 (h!22551 (_ BitVec 64)) (t!30358 List!21357)) )
))
(declare-fun lt!447467 () List!21357)

(declare-fun value!115 () B!1338)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!10 (List!21356 List!21357 B!1338 tuple2!15052) Unit!33064)

(assert (=> b!1012357 (= lt!447468 (lemmaForallGetValueByKeySameWithASmallerHead!10 (t!30357 l!412) lt!447467 value!115 (h!22550 l!412)))))

(declare-fun lambda!347 () Int)

(declare-fun forall!212 (List!21357 Int) Bool)

(assert (=> b!1012357 (forall!212 lt!447467 lambda!347)))

(declare-fun b!1012358 () Bool)

(declare-fun Unit!33066 () Unit!33064)

(assert (=> b!1012358 (= e!569485 Unit!33066)))

(declare-fun b!1012359 () Bool)

(assert (=> b!1012359 (= e!569484 false)))

(declare-fun lt!447466 () Unit!33064)

(assert (=> b!1012359 (= lt!447466 e!569485)))

(declare-fun c!102276 () Bool)

(declare-fun isEmpty!791 (List!21357) Bool)

(assert (=> b!1012359 (= c!102276 (not (isEmpty!791 lt!447467)))))

(declare-fun getKeysOf!18 (List!21356 B!1338) List!21357)

(assert (=> b!1012359 (= lt!447467 (getKeysOf!18 (t!30357 l!412) value!115))))

(declare-fun b!1012360 () Bool)

(declare-fun res!679983 () Bool)

(assert (=> b!1012360 (=> (not res!679983) (not e!569484))))

(assert (=> b!1012360 (= res!679983 (and (is-Cons!21352 l!412) (= (_2!7537 (h!22550 l!412)) value!115)))))

(assert (= (and start!87358 res!679982) b!1012360))

(assert (= (and b!1012360 res!679983) b!1012359))

(assert (= (and b!1012359 c!102276) b!1012357))

(assert (= (and b!1012359 (not c!102276)) b!1012358))

(assert (= (and start!87358 (is-Cons!21352 l!412)) b!1012356))

(declare-fun m!935979 () Bool)

(assert (=> start!87358 m!935979))

(declare-fun m!935981 () Bool)

(assert (=> b!1012357 m!935981))

(declare-fun m!935983 () Bool)

(assert (=> b!1012357 m!935983))

(declare-fun m!935985 () Bool)

(assert (=> b!1012359 m!935985))

(declare-fun m!935987 () Bool)

(assert (=> b!1012359 m!935987))

(push 1)

(assert tp_is_empty!23405)

(assert (not b!1012357))

(assert (not b!1012359))

(assert (not b!1012356))

(assert (not start!87358))

(check-sat)

