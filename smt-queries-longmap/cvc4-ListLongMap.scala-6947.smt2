; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87478 () Bool)

(assert start!87478)

(declare-fun res!680295 () Bool)

(declare-fun e!569922 () Bool)

(assert (=> start!87478 (=> (not res!680295) (not e!569922))))

(declare-datatypes ((B!1392 0))(
  ( (B!1393 (val!11780 Int)) )
))
(declare-datatypes ((tuple2!15106 0))(
  ( (tuple2!15107 (_1!7564 (_ BitVec 64)) (_2!7564 B!1392)) )
))
(declare-datatypes ((List!21399 0))(
  ( (Nil!21396) (Cons!21395 (h!22593 tuple2!15106) (t!30400 List!21399)) )
))
(declare-fun l!412 () List!21399)

(declare-fun isStrictlySorted!554 (List!21399) Bool)

(assert (=> start!87478 (= res!680295 (isStrictlySorted!554 l!412))))

(assert (=> start!87478 e!569922))

(declare-fun e!569923 () Bool)

(assert (=> start!87478 e!569923))

(declare-fun b!1013146 () Bool)

(declare-fun ListPrimitiveSize!99 (List!21399) Int)

(assert (=> b!1013146 (= e!569922 (< (ListPrimitiveSize!99 l!412) 0))))

(declare-fun b!1013147 () Bool)

(declare-fun tp_is_empty!23459 () Bool)

(declare-fun tp!70397 () Bool)

(assert (=> b!1013147 (= e!569923 (and tp_is_empty!23459 tp!70397))))

(assert (= (and start!87478 res!680295) b!1013146))

(assert (= (and start!87478 (is-Cons!21395 l!412)) b!1013147))

(declare-fun m!936311 () Bool)

(assert (=> start!87478 m!936311))

(declare-fun m!936313 () Bool)

(assert (=> b!1013146 m!936313))

(push 1)

(assert (not b!1013146))

(assert (not start!87478))

(assert (not b!1013147))

(assert tp_is_empty!23459)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120395 () Bool)

(declare-fun lt!447879 () Int)

(assert (=> d!120395 (>= lt!447879 0)))

(declare-fun e!569933 () Int)

(assert (=> d!120395 (= lt!447879 e!569933)))

(declare-fun c!102408 () Bool)

(assert (=> d!120395 (= c!102408 (is-Nil!21396 l!412))))

(assert (=> d!120395 (= (ListPrimitiveSize!99 l!412) lt!447879)))

(declare-fun b!1013162 () Bool)

(assert (=> b!1013162 (= e!569933 0)))

(declare-fun b!1013163 () Bool)

(assert (=> b!1013163 (= e!569933 (+ 1 (ListPrimitiveSize!99 (t!30400 l!412))))))

(assert (= (and d!120395 c!102408) b!1013162))

(assert (= (and d!120395 (not c!102408)) b!1013163))

(declare-fun m!936317 () Bool)

(assert (=> b!1013163 m!936317))

(assert (=> b!1013146 d!120395))

(declare-fun d!120401 () Bool)

(declare-fun res!680312 () Bool)

(declare-fun e!569951 () Bool)

(assert (=> d!120401 (=> res!680312 e!569951)))

(assert (=> d!120401 (= res!680312 (or (is-Nil!21396 l!412) (is-Nil!21396 (t!30400 l!412))))))

(assert (=> d!120401 (= (isStrictlySorted!554 l!412) e!569951)))

(declare-fun b!1013185 () Bool)

(declare-fun e!569952 () Bool)

(assert (=> b!1013185 (= e!569951 e!569952)))

(declare-fun res!680313 () Bool)

(assert (=> b!1013185 (=> (not res!680313) (not e!569952))))

(assert (=> b!1013185 (= res!680313 (bvslt (_1!7564 (h!22593 l!412)) (_1!7564 (h!22593 (t!30400 l!412)))))))

(declare-fun b!1013186 () Bool)

(assert (=> b!1013186 (= e!569952 (isStrictlySorted!554 (t!30400 l!412)))))

(assert (= (and d!120401 (not res!680312)) b!1013185))

(assert (= (and b!1013185 res!680313) b!1013186))

(declare-fun m!936323 () Bool)

(assert (=> b!1013186 m!936323))

(assert (=> start!87478 d!120401))

(declare-fun b!1013197 () Bool)

(declare-fun e!569958 () Bool)

(declare-fun tp!70405 () Bool)

(assert (=> b!1013197 (= e!569958 (and tp_is_empty!23459 tp!70405))))

(assert (=> b!1013147 (= tp!70397 e!569958)))

