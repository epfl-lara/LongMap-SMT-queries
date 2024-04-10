; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87456 () Bool)

(assert start!87456)

(declare-fun b!1013066 () Bool)

(assert (=> b!1013066 true))

(assert (=> b!1013066 true))

(declare-fun b!1013065 () Bool)

(declare-fun res!680274 () Bool)

(declare-fun e!569869 () Bool)

(assert (=> b!1013065 (=> (not res!680274) (not e!569869))))

(declare-datatypes ((B!1370 0))(
  ( (B!1371 (val!11769 Int)) )
))
(declare-datatypes ((tuple2!15084 0))(
  ( (tuple2!15085 (_1!7553 (_ BitVec 64)) (_2!7553 B!1370)) )
))
(declare-datatypes ((List!21385 0))(
  ( (Nil!21382) (Cons!21381 (h!22579 tuple2!15084) (t!30386 List!21385)) )
))
(declare-fun l!412 () List!21385)

(declare-fun value!115 () B!1370)

(assert (=> b!1013065 (= res!680274 (and (not (= (_2!7553 (h!22579 l!412)) value!115)) (is-Cons!21381 l!412)))))

(declare-datatypes ((Unit!33102 0))(
  ( (Unit!33103) )
))
(declare-fun e!569867 () Unit!33102)

(declare-fun lt!447855 () Unit!33102)

(assert (=> b!1013066 (= e!569867 lt!447855)))

(declare-datatypes ((List!21386 0))(
  ( (Nil!21383) (Cons!21382 (h!22580 (_ BitVec 64)) (t!30387 List!21386)) )
))
(declare-fun lt!447854 () List!21386)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!19 (List!21385 List!21386 B!1370 tuple2!15084) Unit!33102)

(assert (=> b!1013066 (= lt!447855 (lemmaForallGetValueByKeySameWithASmallerHead!19 (t!30386 l!412) lt!447854 value!115 (h!22579 l!412)))))

(declare-fun lambda!473 () Int)

(declare-fun forall!224 (List!21386 Int) Bool)

(assert (=> b!1013066 (forall!224 lt!447854 lambda!473)))

(declare-fun b!1013067 () Bool)

(assert (=> b!1013067 (= e!569869 false)))

(declare-fun lt!447853 () Unit!33102)

(assert (=> b!1013067 (= lt!447853 e!569867)))

(declare-fun c!102396 () Bool)

(declare-fun isEmpty!810 (List!21386) Bool)

(assert (=> b!1013067 (= c!102396 (not (isEmpty!810 lt!447854)))))

(declare-fun getKeysOf!31 (List!21385 B!1370) List!21386)

(assert (=> b!1013067 (= lt!447854 (getKeysOf!31 (t!30386 l!412) value!115))))

(declare-fun res!680273 () Bool)

(assert (=> start!87456 (=> (not res!680273) (not e!569869))))

(declare-fun isStrictlySorted!549 (List!21385) Bool)

(assert (=> start!87456 (= res!680273 (isStrictlySorted!549 l!412))))

(assert (=> start!87456 e!569869))

(declare-fun e!569868 () Bool)

(assert (=> start!87456 e!569868))

(declare-fun tp_is_empty!23437 () Bool)

(assert (=> start!87456 tp_is_empty!23437))

(declare-fun b!1013068 () Bool)

(declare-fun Unit!33104 () Unit!33102)

(assert (=> b!1013068 (= e!569867 Unit!33104)))

(declare-fun b!1013069 () Bool)

(declare-fun tp!70364 () Bool)

(assert (=> b!1013069 (= e!569868 (and tp_is_empty!23437 tp!70364))))

(assert (= (and start!87456 res!680273) b!1013065))

(assert (= (and b!1013065 res!680274) b!1013067))

(assert (= (and b!1013067 c!102396) b!1013066))

(assert (= (and b!1013067 (not c!102396)) b!1013068))

(assert (= (and start!87456 (is-Cons!21381 l!412)) b!1013069))

(declare-fun m!936273 () Bool)

(assert (=> b!1013066 m!936273))

(declare-fun m!936275 () Bool)

(assert (=> b!1013066 m!936275))

(declare-fun m!936277 () Bool)

(assert (=> b!1013067 m!936277))

(declare-fun m!936279 () Bool)

(assert (=> b!1013067 m!936279))

(declare-fun m!936281 () Bool)

(assert (=> start!87456 m!936281))

(push 1)

(assert (not start!87456))

(assert (not b!1013067))

(assert tp_is_empty!23437)

(assert (not b!1013069))

(assert (not b!1013066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

