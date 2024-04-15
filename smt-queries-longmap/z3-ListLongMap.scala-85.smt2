; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1224 () Bool)

(assert start!1224)

(declare-fun res!8878 () Bool)

(declare-fun e!5968 () Bool)

(assert (=> start!1224 (=> (not res!8878) (not e!5968))))

(declare-datatypes ((B!314 0))(
  ( (B!315 (val!252 Int)) )
))
(declare-datatypes ((tuple2!300 0))(
  ( (tuple2!301 (_1!150 (_ BitVec 64)) (_2!150 B!314)) )
))
(declare-datatypes ((List!300 0))(
  ( (Nil!297) (Cons!296 (h!862 tuple2!300) (t!2447 List!300)) )
))
(declare-fun l!408 () List!300)

(get-info :version)

(assert (=> start!1224 (= res!8878 ((_ is Cons!296) l!408))))

(assert (=> start!1224 e!5968))

(declare-fun e!5969 () Bool)

(assert (=> start!1224 e!5969))

(declare-fun b!10333 () Bool)

(declare-fun ListPrimitiveSize!4 (List!300) Int)

(assert (=> b!10333 (= e!5968 (>= (ListPrimitiveSize!4 (t!2447 l!408)) (ListPrimitiveSize!4 l!408)))))

(declare-fun b!10334 () Bool)

(declare-fun tp_is_empty!487 () Bool)

(declare-fun tp!1481 () Bool)

(assert (=> b!10334 (= e!5969 (and tp_is_empty!487 tp!1481))))

(assert (= (and start!1224 res!8878) b!10333))

(assert (= (and start!1224 ((_ is Cons!296) l!408)) b!10334))

(declare-fun m!6707 () Bool)

(assert (=> b!10333 m!6707))

(declare-fun m!6709 () Bool)

(assert (=> b!10333 m!6709))

(check-sat (not b!10333) (not b!10334) tp_is_empty!487)
(check-sat)
(get-model)

(declare-fun d!1089 () Bool)

(declare-fun lt!2545 () Int)

(assert (=> d!1089 (>= lt!2545 0)))

(declare-fun e!5988 () Int)

(assert (=> d!1089 (= lt!2545 e!5988)))

(declare-fun c!930 () Bool)

(assert (=> d!1089 (= c!930 ((_ is Nil!297) (t!2447 l!408)))))

(assert (=> d!1089 (= (ListPrimitiveSize!4 (t!2447 l!408)) lt!2545)))

(declare-fun b!10359 () Bool)

(assert (=> b!10359 (= e!5988 0)))

(declare-fun b!10360 () Bool)

(assert (=> b!10360 (= e!5988 (+ 1 (ListPrimitiveSize!4 (t!2447 (t!2447 l!408)))))))

(assert (= (and d!1089 c!930) b!10359))

(assert (= (and d!1089 (not c!930)) b!10360))

(declare-fun m!6719 () Bool)

(assert (=> b!10360 m!6719))

(assert (=> b!10333 d!1089))

(declare-fun d!1095 () Bool)

(declare-fun lt!2548 () Int)

(assert (=> d!1095 (>= lt!2548 0)))

(declare-fun e!5991 () Int)

(assert (=> d!1095 (= lt!2548 e!5991)))

(declare-fun c!933 () Bool)

(assert (=> d!1095 (= c!933 ((_ is Nil!297) l!408))))

(assert (=> d!1095 (= (ListPrimitiveSize!4 l!408) lt!2548)))

(declare-fun b!10365 () Bool)

(assert (=> b!10365 (= e!5991 0)))

(declare-fun b!10366 () Bool)

(assert (=> b!10366 (= e!5991 (+ 1 (ListPrimitiveSize!4 (t!2447 l!408))))))

(assert (= (and d!1095 c!933) b!10365))

(assert (= (and d!1095 (not c!933)) b!10366))

(assert (=> b!10366 m!6707))

(assert (=> b!10333 d!1095))

(declare-fun b!10383 () Bool)

(declare-fun e!6000 () Bool)

(declare-fun tp!1494 () Bool)

(assert (=> b!10383 (= e!6000 (and tp_is_empty!487 tp!1494))))

(assert (=> b!10334 (= tp!1481 e!6000)))

(assert (= (and b!10334 ((_ is Cons!296) (t!2447 l!408))) b!10383))

(check-sat (not b!10360) (not b!10366) (not b!10383) tp_is_empty!487)
(check-sat)
