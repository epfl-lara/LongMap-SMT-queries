; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1240 () Bool)

(assert start!1240)

(declare-fun res!8893 () Bool)

(declare-fun e!6019 () Bool)

(assert (=> start!1240 (=> (not res!8893) (not e!6019))))

(declare-datatypes ((B!324 0))(
  ( (B!325 (val!257 Int)) )
))
(declare-datatypes ((tuple2!314 0))(
  ( (tuple2!315 (_1!157 (_ BitVec 64)) (_2!157 B!324)) )
))
(declare-datatypes ((List!309 0))(
  ( (Nil!306) (Cons!305 (h!871 tuple2!314) (t!2456 List!309)) )
))
(declare-fun l!408 () List!309)

(assert (=> start!1240 (= res!8893 (is-Cons!305 l!408))))

(assert (=> start!1240 e!6019))

(declare-fun e!6020 () Bool)

(assert (=> start!1240 e!6020))

(declare-fun b!10402 () Bool)

(declare-fun lt!2559 () (_ BitVec 32))

(assert (=> b!10402 (= e!6019 (and (bvslt lt!2559 #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 lt!2559) #b00000000000000000000000000000000)))))

(declare-fun intSize!3 (List!309) (_ BitVec 32))

(assert (=> b!10402 (= lt!2559 (intSize!3 (t!2456 l!408)))))

(declare-fun b!10403 () Bool)

(declare-fun tp_is_empty!497 () Bool)

(declare-fun tp!1505 () Bool)

(assert (=> b!10403 (= e!6020 (and tp_is_empty!497 tp!1505))))

(assert (= (and start!1240 res!8893) b!10402))

(assert (= (and start!1240 (is-Cons!305 l!408)) b!10403))

(declare-fun m!6729 () Bool)

(assert (=> b!10402 m!6729))

(push 1)

(assert (not b!10402))

(assert (not b!10403))

(assert tp_is_empty!497)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1107 () Bool)

(declare-fun lt!2576 () (_ BitVec 32))

(assert (=> d!1107 (bvsge lt!2576 #b00000000000000000000000000000000)))

(declare-fun e!6029 () (_ BitVec 32))

(assert (=> d!1107 (= lt!2576 e!6029)))

(declare-fun c!944 () Bool)

(assert (=> d!1107 (= c!944 (is-Cons!305 (t!2456 l!408)))))

(assert (=> d!1107 (= (intSize!3 (t!2456 l!408)) lt!2576)))

(declare-fun b!10420 () Bool)

(declare-fun lt!2577 () (_ BitVec 32))

(assert (=> b!10420 (= e!6029 (ite (bvslt lt!2577 #b01111111111111111111111111111111) (bvadd #b00000000000000000000000000000001 lt!2577) #b00000000000000000000000000000000))))

(assert (=> b!10420 (= lt!2577 (intSize!3 (t!2456 (t!2456 l!408))))))

(declare-fun b!10421 () Bool)

(assert (=> b!10421 (= e!6029 #b00000000000000000000000000000000)))

(assert (= (and d!1107 c!944) b!10420))

(assert (= (and d!1107 (not c!944)) b!10421))

(declare-fun m!6735 () Bool)

(assert (=> b!10420 m!6735))

(assert (=> b!10402 d!1107))

(declare-fun b!10436 () Bool)

(declare-fun e!6038 () Bool)

(declare-fun tp!1514 () Bool)

(assert (=> b!10436 (= e!6038 (and tp_is_empty!497 tp!1514))))

(assert (=> b!10403 (= tp!1505 e!6038)))

(assert (= (and b!10403 (is-Cons!305 (t!2456 l!408))) b!10436))

(push 1)

