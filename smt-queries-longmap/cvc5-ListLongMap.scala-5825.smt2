; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75130 () Bool)

(assert start!75130)

(declare-fun res!601413 () Bool)

(declare-fun e!492882 () Bool)

(assert (=> start!75130 (=> (not res!601413) (not e!492882))))

(declare-datatypes ((B!1268 0))(
  ( (B!1269 (val!8940 Int)) )
))
(declare-datatypes ((tuple2!11874 0))(
  ( (tuple2!11875 (_1!5948 (_ BitVec 64)) (_2!5948 B!1268)) )
))
(declare-datatypes ((List!17656 0))(
  ( (Nil!17653) (Cons!17652 (h!18783 tuple2!11874) (t!24933 List!17656)) )
))
(declare-fun l!906 () List!17656)

(declare-fun isStrictlySorted!477 (List!17656) Bool)

(assert (=> start!75130 (= res!601413 (isStrictlySorted!477 l!906))))

(assert (=> start!75130 e!492882))

(declare-fun e!492881 () Bool)

(assert (=> start!75130 e!492881))

(assert (=> start!75130 true))

(declare-fun tp_is_empty!17779 () Bool)

(assert (=> start!75130 tp_is_empty!17779))

(declare-fun b!885605 () Bool)

(declare-fun res!601414 () Bool)

(assert (=> b!885605 (=> (not res!601414) (not e!492882))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885605 (= res!601414 (or (not (is-Cons!17652 l!906)) (bvsge (_1!5948 (h!18783 l!906)) key1!49)))))

(declare-fun b!885606 () Bool)

(declare-fun v1!38 () B!1268)

(declare-fun insertStrictlySorted!294 (List!17656 (_ BitVec 64) B!1268) List!17656)

(assert (=> b!885606 (= e!492882 (not (isStrictlySorted!477 (insertStrictlySorted!294 l!906 key1!49 v1!38))))))

(declare-fun b!885607 () Bool)

(declare-fun tp!54284 () Bool)

(assert (=> b!885607 (= e!492881 (and tp_is_empty!17779 tp!54284))))

(assert (= (and start!75130 res!601413) b!885605))

(assert (= (and b!885605 res!601414) b!885606))

(assert (= (and start!75130 (is-Cons!17652 l!906)) b!885607))

(declare-fun m!825781 () Bool)

(assert (=> start!75130 m!825781))

(declare-fun m!825783 () Bool)

(assert (=> b!885606 m!825783))

(assert (=> b!885606 m!825783))

(declare-fun m!825785 () Bool)

(assert (=> b!885606 m!825785))

(push 1)

(assert (not start!75130))

(assert (not b!885606))

(assert (not b!885607))

(assert tp_is_empty!17779)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109425 () Bool)

(declare-fun res!601445 () Bool)

(declare-fun e!492913 () Bool)

(assert (=> d!109425 (=> res!601445 e!492913)))

(assert (=> d!109425 (= res!601445 (or (is-Nil!17653 l!906) (is-Nil!17653 (t!24933 l!906))))))

(assert (=> d!109425 (= (isStrictlySorted!477 l!906) e!492913)))

(declare-fun b!885644 () Bool)

(declare-fun e!492914 () Bool)

(assert (=> b!885644 (= e!492913 e!492914)))

(declare-fun res!601446 () Bool)

(assert (=> b!885644 (=> (not res!601446) (not e!492914))))

(assert (=> b!885644 (= res!601446 (bvslt (_1!5948 (h!18783 l!906)) (_1!5948 (h!18783 (t!24933 l!906)))))))

(declare-fun b!885645 () Bool)

(assert (=> b!885645 (= e!492914 (isStrictlySorted!477 (t!24933 l!906)))))

(assert (= (and d!109425 (not res!601445)) b!885644))

(assert (= (and b!885644 res!601446) b!885645))

(declare-fun m!825805 () Bool)

(assert (=> b!885645 m!825805))

(assert (=> start!75130 d!109425))

(declare-fun d!109433 () Bool)

(declare-fun res!601449 () Bool)

(declare-fun e!492917 () Bool)

(assert (=> d!109433 (=> res!601449 e!492917)))

(assert (=> d!109433 (= res!601449 (or (is-Nil!17653 (insertStrictlySorted!294 l!906 key1!49 v1!38)) (is-Nil!17653 (t!24933 (insertStrictlySorted!294 l!906 key1!49 v1!38)))))))

(assert (=> d!109433 (= (isStrictlySorted!477 (insertStrictlySorted!294 l!906 key1!49 v1!38)) e!492917)))

(declare-fun b!885648 () Bool)

(declare-fun e!492918 () Bool)

(assert (=> b!885648 (= e!492917 e!492918)))

(declare-fun res!601450 () Bool)

(assert (=> b!885648 (=> (not res!601450) (not e!492918))))

(assert (=> b!885648 (= res!601450 (bvslt (_1!5948 (h!18783 (insertStrictlySorted!294 l!906 key1!49 v1!38))) (_1!5948 (h!18783 (t!24933 (insertStrictlySorted!294 l!906 key1!49 v1!38))))))))

(declare-fun b!885649 () Bool)

(assert (=> b!885649 (= e!492918 (isStrictlySorted!477 (t!24933 (insertStrictlySorted!294 l!906 key1!49 v1!38))))))

(assert (= (and d!109433 (not res!601449)) b!885648))

(assert (= (and b!885648 res!601450) b!885649))

(declare-fun m!825809 () Bool)

(assert (=> b!885649 m!825809))

(assert (=> b!885606 d!109433))

(declare-fun lt!401044 () List!17656)

(declare-fun e!492963 () Bool)

(declare-fun b!885725 () Bool)

(declare-fun contains!4294 (List!17656 tuple2!11874) Bool)

(assert (=> b!885725 (= e!492963 (contains!4294 lt!401044 (tuple2!11875 key1!49 v1!38)))))

(declare-fun b!885726 () Bool)

(declare-fun e!492965 () List!17656)

(declare-fun call!39143 () List!17656)

(assert (=> b!885726 (= e!492965 call!39143)))

(declare-fun b!885727 () Bool)

(declare-fun c!93347 () Bool)

(declare-fun e!492958 () List!17656)

(declare-fun c!93350 () Bool)

(assert (=> b!885727 (= e!492958 (ite c!93350 (t!24933 l!906) (ite c!93347 (Cons!17652 (h!18783 l!906) (t!24933 l!906)) Nil!17653)))))

(declare-fun b!885728 () Bool)

(assert (=> b!885728 (= e!492965 call!39143)))

(declare-fun d!109437 () Bool)

(assert (=> d!109437 e!492963))

(declare-fun res!601465 () Bool)

(assert (=> d!109437 (=> (not res!601465) (not e!492963))))

(assert (=> d!109437 (= res!601465 (isStrictlySorted!477 lt!401044))))

(declare-fun e!492960 () List!17656)

