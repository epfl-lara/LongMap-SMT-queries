; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87354 () Bool)

(assert start!87354)

(declare-fun b!1012319 () Bool)

(assert (=> b!1012319 true))

(assert (=> b!1012319 true))

(declare-fun b!1012318 () Bool)

(declare-datatypes ((Unit!33058 0))(
  ( (Unit!33059) )
))
(declare-fun e!569467 () Unit!33058)

(declare-fun Unit!33060 () Unit!33058)

(assert (=> b!1012318 (= e!569467 Unit!33060)))

(declare-fun lt!447450 () Unit!33058)

(assert (=> b!1012319 (= e!569467 lt!447450)))

(declare-datatypes ((List!21352 0))(
  ( (Nil!21349) (Cons!21348 (h!22546 (_ BitVec 64)) (t!30353 List!21352)) )
))
(declare-fun lt!447448 () List!21352)

(declare-datatypes ((B!1334 0))(
  ( (B!1335 (val!11751 Int)) )
))
(declare-fun value!115 () B!1334)

(declare-datatypes ((tuple2!15048 0))(
  ( (tuple2!15049 (_1!7535 (_ BitVec 64)) (_2!7535 B!1334)) )
))
(declare-datatypes ((List!21353 0))(
  ( (Nil!21350) (Cons!21349 (h!22547 tuple2!15048) (t!30354 List!21353)) )
))
(declare-fun l!412 () List!21353)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!8 (List!21353 List!21352 B!1334 tuple2!15048) Unit!33058)

(assert (=> b!1012319 (= lt!447450 (lemmaForallGetValueByKeySameWithASmallerHead!8 (t!30354 l!412) lt!447448 value!115 (h!22547 l!412)))))

(declare-fun lambda!341 () Int)

(declare-fun forall!210 (List!21352 Int) Bool)

(assert (=> b!1012319 (forall!210 lt!447448 lambda!341)))

(declare-fun res!679970 () Bool)

(declare-fun e!569465 () Bool)

(assert (=> start!87354 (=> (not res!679970) (not e!569465))))

(declare-fun isStrictlySorted!531 (List!21353) Bool)

(assert (=> start!87354 (= res!679970 (isStrictlySorted!531 l!412))))

(assert (=> start!87354 e!569465))

(declare-fun e!569466 () Bool)

(assert (=> start!87354 e!569466))

(declare-fun tp_is_empty!23401 () Bool)

(assert (=> start!87354 tp_is_empty!23401))

(declare-fun b!1012320 () Bool)

(declare-fun tp!70274 () Bool)

(assert (=> b!1012320 (= e!569466 (and tp_is_empty!23401 tp!70274))))

(declare-fun b!1012321 () Bool)

(declare-fun res!679971 () Bool)

(assert (=> b!1012321 (=> (not res!679971) (not e!569465))))

(assert (=> b!1012321 (= res!679971 (and (is-Cons!21349 l!412) (= (_2!7535 (h!22547 l!412)) value!115)))))

(declare-fun b!1012322 () Bool)

(assert (=> b!1012322 (= e!569465 false)))

(declare-fun lt!447449 () Unit!33058)

(assert (=> b!1012322 (= lt!447449 e!569467)))

(declare-fun c!102270 () Bool)

(declare-fun isEmpty!789 (List!21352) Bool)

(assert (=> b!1012322 (= c!102270 (not (isEmpty!789 lt!447448)))))

(declare-fun getKeysOf!16 (List!21353 B!1334) List!21352)

(assert (=> b!1012322 (= lt!447448 (getKeysOf!16 (t!30354 l!412) value!115))))

(assert (= (and start!87354 res!679970) b!1012321))

(assert (= (and b!1012321 res!679971) b!1012322))

(assert (= (and b!1012322 c!102270) b!1012319))

(assert (= (and b!1012322 (not c!102270)) b!1012318))

(assert (= (and start!87354 (is-Cons!21349 l!412)) b!1012320))

(declare-fun m!935959 () Bool)

(assert (=> b!1012319 m!935959))

(declare-fun m!935961 () Bool)

(assert (=> b!1012319 m!935961))

(declare-fun m!935963 () Bool)

(assert (=> start!87354 m!935963))

(declare-fun m!935965 () Bool)

(assert (=> b!1012322 m!935965))

(declare-fun m!935967 () Bool)

(assert (=> b!1012322 m!935967))

(push 1)

(assert (not b!1012322))

(assert tp_is_empty!23401)

(assert (not start!87354))

(assert (not b!1012320))

(assert (not b!1012319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

