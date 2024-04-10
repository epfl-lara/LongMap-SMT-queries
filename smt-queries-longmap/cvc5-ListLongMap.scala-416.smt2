; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7798 () Bool)

(assert start!7798)

(declare-datatypes ((B!1010 0))(
  ( (B!1011 (val!1125 Int)) )
))
(declare-datatypes ((tuple2!1832 0))(
  ( (tuple2!1833 (_1!927 (_ BitVec 64)) (_2!927 B!1010)) )
))
(declare-datatypes ((List!1322 0))(
  ( (Nil!1319) (Cons!1318 (h!1898 tuple2!1832) (t!4356 List!1322)) )
))
(declare-fun keyValues!2 () List!1322)

(declare-fun ListPrimitiveSize!55 (List!1322) Int)

(assert (=> start!7798 (< (ListPrimitiveSize!55 keyValues!2) 0)))

(declare-fun e!31783 () Bool)

(assert (=> start!7798 e!31783))

(declare-fun b!49457 () Bool)

(declare-fun tp_is_empty!2161 () Bool)

(declare-fun tp!6551 () Bool)

(assert (=> b!49457 (= e!31783 (and tp_is_empty!2161 tp!6551))))

(assert (= (and start!7798 (is-Cons!1318 keyValues!2)) b!49457))

(declare-fun m!42855 () Bool)

(assert (=> start!7798 m!42855))

(push 1)

(assert (not start!7798))

(assert (not b!49457))

(assert tp_is_empty!2161)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9913 () Bool)

(declare-fun lt!20762 () Int)

(assert (=> d!9913 (>= lt!20762 0)))

(declare-fun e!31798 () Int)

(assert (=> d!9913 (= lt!20762 e!31798)))

(declare-fun c!6684 () Bool)

(assert (=> d!9913 (= c!6684 (is-Nil!1319 keyValues!2))))

(assert (=> d!9913 (= (ListPrimitiveSize!55 keyValues!2) lt!20762)))

(declare-fun b!49480 () Bool)

(assert (=> b!49480 (= e!31798 0)))

(declare-fun b!49481 () Bool)

(assert (=> b!49481 (= e!31798 (+ 1 (ListPrimitiveSize!55 (t!4356 keyValues!2))))))

(assert (= (and d!9913 c!6684) b!49480))

(assert (= (and d!9913 (not c!6684)) b!49481))

(declare-fun m!42865 () Bool)

(assert (=> b!49481 m!42865))

(assert (=> start!7798 d!9913))

(declare-fun b!49496 () Bool)

(declare-fun e!31807 () Bool)

(declare-fun tp!6566 () Bool)

(assert (=> b!49496 (= e!31807 (and tp_is_empty!2161 tp!6566))))

(assert (=> b!49457 (= tp!6551 e!31807)))

(assert (= (and b!49457 (is-Cons!1318 (t!4356 keyValues!2))) b!49496))

(push 1)

