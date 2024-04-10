; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2232 () Bool)

(assert start!2232)

(declare-fun res!11443 () Bool)

(declare-fun e!8995 () Bool)

(assert (=> start!2232 (=> (not res!11443) (not e!8995))))

(declare-datatypes ((B!572 0))(
  ( (B!573 (val!384 Int)) )
))
(declare-datatypes ((tuple2!568 0))(
  ( (tuple2!569 (_1!284 (_ BitVec 64)) (_2!284 B!572)) )
))
(declare-datatypes ((List!439 0))(
  ( (Nil!436) (Cons!435 (h!1001 tuple2!568) (t!2841 List!439)) )
))
(declare-datatypes ((ListLongMap!399 0))(
  ( (ListLongMap!400 (toList!215 List!439)) )
))
(declare-fun thiss!177 () ListLongMap!399)

(declare-fun size!499 (List!439) Int)

(assert (=> start!2232 (= res!11443 (< (size!499 (toList!215 thiss!177)) 2147483647))))

(assert (=> start!2232 e!8995))

(declare-fun e!8996 () Bool)

(declare-fun inv!736 (ListLongMap!399) Bool)

(assert (=> start!2232 (and (inv!736 thiss!177) e!8996)))

(declare-fun b!14941 () Bool)

(declare-fun isStrictlySorted!126 (List!439) Bool)

(assert (=> b!14941 (= e!8995 (not (isStrictlySorted!126 (toList!215 thiss!177))))))

(declare-fun b!14942 () Bool)

(declare-fun tp!2408 () Bool)

(assert (=> b!14942 (= e!8996 tp!2408)))

(assert (= (and start!2232 res!11443) b!14941))

(assert (= start!2232 b!14942))

(declare-fun m!9947 () Bool)

(assert (=> start!2232 m!9947))

(declare-fun m!9949 () Bool)

(assert (=> start!2232 m!9949))

(declare-fun m!9951 () Bool)

(assert (=> b!14941 m!9951))

(push 1)

(assert (not start!2232))

(assert (not b!14941))

(assert (not b!14942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2439 () Bool)

(declare-fun lt!3644 () Int)

(assert (=> d!2439 (>= lt!3644 0)))

(declare-fun e!9016 () Int)

(assert (=> d!2439 (= lt!3644 e!9016)))

(declare-fun c!1417 () Bool)

(assert (=> d!2439 (= c!1417 (is-Nil!436 (toList!215 thiss!177)))))

(assert (=> d!2439 (= (size!499 (toList!215 thiss!177)) lt!3644)))

(declare-fun b!14969 () Bool)

(assert (=> b!14969 (= e!9016 0)))

(declare-fun b!14970 () Bool)

(assert (=> b!14970 (= e!9016 (+ 1 (size!499 (t!2841 (toList!215 thiss!177)))))))

(assert (= (and d!2439 c!1417) b!14969))

(assert (= (and d!2439 (not c!1417)) b!14970))

(declare-fun m!9967 () Bool)

(assert (=> b!14970 m!9967))

(assert (=> start!2232 d!2439))

(declare-fun d!2445 () Bool)

(assert (=> d!2445 (= (inv!736 thiss!177) (isStrictlySorted!126 (toList!215 thiss!177)))))

(declare-fun bs!613 () Bool)

(assert (= bs!613 d!2445))

(assert (=> bs!613 m!9951))

(assert (=> start!2232 d!2445))

(declare-fun d!2451 () Bool)

(declare-fun res!11464 () Bool)

(declare-fun e!9032 () Bool)

(assert (=> d!2451 (=> res!11464 e!9032)))

(assert (=> d!2451 (= res!11464 (or (is-Nil!436 (toList!215 thiss!177)) (is-Nil!436 (t!2841 (toList!215 thiss!177)))))))

(assert (=> d!2451 (= (isStrictlySorted!126 (toList!215 thiss!177)) e!9032)))

(declare-fun b!14987 () Bool)

(declare-fun e!9033 () Bool)

(assert (=> b!14987 (= e!9032 e!9033)))

(declare-fun res!11465 () Bool)

(assert (=> b!14987 (=> (not res!11465) (not e!9033))))

(assert (=> b!14987 (= res!11465 (bvslt (_1!284 (h!1001 (toList!215 thiss!177))) (_1!284 (h!1001 (t!2841 (toList!215 thiss!177))))))))

(declare-fun b!14988 () Bool)

(assert (=> b!14988 (= e!9033 (isStrictlySorted!126 (t!2841 (toList!215 thiss!177))))))

(assert (= (and d!2451 (not res!11464)) b!14987))

(assert (= (and b!14987 res!11465) b!14988))

(declare-fun m!9973 () Bool)

(assert (=> b!14988 m!9973))

(assert (=> b!14941 d!2451))

(declare-fun b!15004 () Bool)

(declare-fun e!9043 () Bool)

(declare-fun tp_is_empty!752 () Bool)

(declare-fun tp!2422 () Bool)

(assert (=> b!15004 (= e!9043 (and tp_is_empty!752 tp!2422))))

(assert (=> b!14942 (= tp!2408 e!9043)))

(assert (= (and b!14942 (is-Cons!435 (toList!215 thiss!177))) b!15004))

(push 1)

