; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2026 () Bool)

(assert start!2026)

(declare-fun b!13650 () Bool)

(assert (=> b!13650 true))

(declare-fun b!13647 () Bool)

(declare-fun res!10719 () Bool)

(declare-fun e!8172 () Bool)

(assert (=> b!13647 (=> (not res!10719) (not e!8172))))

(declare-datatypes ((B!498 0))(
  ( (B!499 (val!347 Int)) )
))
(declare-datatypes ((tuple2!494 0))(
  ( (tuple2!495 (_1!247 (_ BitVec 64)) (_2!247 B!498)) )
))
(declare-datatypes ((List!402 0))(
  ( (Nil!399) (Cons!398 (h!964 tuple2!494) (t!2798 List!402)) )
))
(declare-fun l!522 () List!402)

(declare-fun value!159 () B!498)

(assert (=> b!13647 (= res!10719 (and (not (= (_2!247 (h!964 l!522)) value!159)) (is-Cons!398 l!522)))))

(declare-fun b!13648 () Bool)

(declare-fun res!10715 () Bool)

(declare-fun e!8174 () Bool)

(assert (=> b!13648 (=> (not res!10715) (not e!8174))))

(declare-fun isEmpty!86 (List!402) Bool)

(assert (=> b!13648 (= res!10715 (not (isEmpty!86 l!522)))))

(declare-fun b!13649 () Bool)

(declare-fun res!10718 () Bool)

(assert (=> b!13649 (=> (not res!10718) (not e!8174))))

(declare-fun lt!3534 () List!402)

(assert (=> b!13649 (= res!10718 (not (isEmpty!86 lt!3534)))))

(declare-fun res!10720 () Bool)

(assert (=> b!13650 (=> (not res!10720) (not e!8174))))

(declare-fun lambda!95 () Int)

(declare-fun forall!79 (List!402 Int) Bool)

(assert (=> b!13650 (= res!10720 (forall!79 lt!3534 lambda!95))))

(declare-fun b!13651 () Bool)

(declare-fun e!8173 () Bool)

(declare-fun tp_is_empty!677 () Bool)

(declare-fun tp!2210 () Bool)

(assert (=> b!13651 (= e!8173 (and tp_is_empty!677 tp!2210))))

(declare-fun res!10716 () Bool)

(assert (=> start!2026 (=> (not res!10716) (not e!8172))))

(declare-fun isStrictlySorted!89 (List!402) Bool)

(assert (=> start!2026 (= res!10716 (isStrictlySorted!89 l!522))))

(assert (=> start!2026 e!8172))

(assert (=> start!2026 e!8173))

(assert (=> start!2026 tp_is_empty!677))

(declare-fun b!13652 () Bool)

(assert (=> b!13652 (= e!8172 e!8174)))

(declare-fun res!10717 () Bool)

(assert (=> b!13652 (=> (not res!10717) (not e!8174))))

(assert (=> b!13652 (= res!10717 (isStrictlySorted!89 lt!3534))))

(declare-fun filterByValue!12 (List!402 B!498) List!402)

(assert (=> b!13652 (= lt!3534 (filterByValue!12 (t!2798 l!522) value!159))))

(declare-fun b!13653 () Bool)

(assert (=> b!13653 (= e!8174 (= l!522 Nil!399))))

(assert (= (and start!2026 res!10716) b!13647))

(assert (= (and b!13647 res!10719) b!13652))

(assert (= (and b!13652 res!10717) b!13650))

(assert (= (and b!13650 res!10720) b!13648))

(assert (= (and b!13648 res!10715) b!13649))

(assert (= (and b!13649 res!10718) b!13653))

(assert (= (and start!2026 (is-Cons!398 l!522)) b!13651))

(declare-fun m!9233 () Bool)

(assert (=> start!2026 m!9233))

(declare-fun m!9235 () Bool)

(assert (=> b!13652 m!9235))

(declare-fun m!9237 () Bool)

(assert (=> b!13652 m!9237))

(declare-fun m!9239 () Bool)

(assert (=> b!13648 m!9239))

(declare-fun m!9241 () Bool)

(assert (=> b!13649 m!9241))

(declare-fun m!9243 () Bool)

(assert (=> b!13650 m!9243))

(push 1)

