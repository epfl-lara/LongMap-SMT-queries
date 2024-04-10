; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1224 () Bool)

(assert start!1224)

(declare-fun res!8878 () Bool)

(declare-fun e!5968 () Bool)

(assert (=> start!1224 (=> (not res!8878) (not e!5968))))

(declare-datatypes ((B!314 0))(
  ( (B!315 (val!252 Int)) )
))
(declare-datatypes ((tuple2!304 0))(
  ( (tuple2!305 (_1!152 (_ BitVec 64)) (_2!152 B!314)) )
))
(declare-datatypes ((List!304 0))(
  ( (Nil!301) (Cons!300 (h!866 tuple2!304) (t!2451 List!304)) )
))
(declare-fun l!408 () List!304)

(assert (=> start!1224 (= res!8878 (is-Cons!300 l!408))))

(assert (=> start!1224 e!5968))

(declare-fun e!5969 () Bool)

(assert (=> start!1224 e!5969))

(declare-fun b!10333 () Bool)

(declare-fun ListPrimitiveSize!4 (List!304) Int)

(assert (=> b!10333 (= e!5968 (>= (ListPrimitiveSize!4 (t!2451 l!408)) (ListPrimitiveSize!4 l!408)))))

(declare-fun b!10334 () Bool)

(declare-fun tp_is_empty!487 () Bool)

(declare-fun tp!1481 () Bool)

(assert (=> b!10334 (= e!5969 (and tp_is_empty!487 tp!1481))))

(assert (= (and start!1224 res!8878) b!10333))

(assert (= (and start!1224 (is-Cons!300 l!408)) b!10334))

(declare-fun m!6707 () Bool)

(assert (=> b!10333 m!6707))

(declare-fun m!6709 () Bool)

(assert (=> b!10333 m!6709))

(push 1)

(assert (not b!10333))

(assert (not b!10334))

(assert tp_is_empty!487)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1090 () Bool)

(declare-fun lt!2545 () Int)

(assert (=> d!1090 (>= lt!2545 0)))

(declare-fun e!5988 () Int)

(assert (=> d!1090 (= lt!2545 e!5988)))

(declare-fun c!930 () Bool)

(assert (=> d!1090 (= c!930 (is-Nil!301 (t!2451 l!408)))))

(assert (=> d!1090 (= (ListPrimitiveSize!4 (t!2451 l!408)) lt!2545)))

(declare-fun b!10359 () Bool)

(assert (=> b!10359 (= e!5988 0)))

(declare-fun b!10360 () Bool)

(assert (=> b!10360 (= e!5988 (+ 1 (ListPrimitiveSize!4 (t!2451 (t!2451 l!408)))))))

(assert (= (and d!1090 c!930) b!10359))

(assert (= (and d!1090 (not c!930)) b!10360))

(declare-fun m!6720 () Bool)

(assert (=> b!10360 m!6720))

(assert (=> b!10333 d!1090))

(declare-fun d!1096 () Bool)

(declare-fun lt!2548 () Int)

(assert (=> d!1096 (>= lt!2548 0)))

(declare-fun e!5991 () Int)

(assert (=> d!1096 (= lt!2548 e!5991)))

(declare-fun c!933 () Bool)

(assert (=> d!1096 (= c!933 (is-Nil!301 l!408))))

(assert (=> d!1096 (= (ListPrimitiveSize!4 l!408) lt!2548)))

(declare-fun b!10365 () Bool)

(assert (=> b!10365 (= e!5991 0)))

(declare-fun b!10367 () Bool)

(assert (=> b!10367 (= e!5991 (+ 1 (ListPrimitiveSize!4 (t!2451 l!408))))))

(assert (= (and d!1096 c!933) b!10365))

(assert (= (and d!1096 (not c!933)) b!10367))

(assert (=> b!10367 m!6707))

(assert (=> b!10333 d!1096))

(declare-fun b!10383 () Bool)

(declare-fun e!6000 () Bool)

(declare-fun tp!1494 () Bool)

(assert (=> b!10383 (= e!6000 (and tp_is_empty!487 tp!1494))))

(assert (=> b!10334 (= tp!1481 e!6000)))

(assert (= (and b!10334 (is-Cons!300 (t!2451 l!408))) b!10383))

(push 1)

