; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1212 () Bool)

(assert start!1212)

(declare-datatypes ((B!308 0))(
  ( (B!309 (val!249 Int)) )
))
(declare-datatypes ((tuple2!298 0))(
  ( (tuple2!299 (_1!149 (_ BitVec 64)) (_2!149 B!308)) )
))
(declare-datatypes ((List!301 0))(
  ( (Nil!298) (Cons!297 (h!863 tuple2!298) (t!2448 List!301)) )
))
(declare-fun l!408 () List!301)

(declare-fun ListPrimitiveSize!1 (List!301) Int)

(assert (=> start!1212 (< (ListPrimitiveSize!1 l!408) 0)))

(declare-fun e!5939 () Bool)

(assert (=> start!1212 e!5939))

(declare-fun b!10289 () Bool)

(declare-fun tp_is_empty!481 () Bool)

(declare-fun tp!1463 () Bool)

(assert (=> b!10289 (= e!5939 (and tp_is_empty!481 tp!1463))))

(assert (= (and start!1212 (is-Cons!297 l!408)) b!10289))

(declare-fun m!6695 () Bool)

(assert (=> start!1212 m!6695))

(push 1)

(assert (not start!1212))

(assert (not b!10289))

(assert tp_is_empty!481)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1083 () Bool)

(declare-fun lt!2536 () Int)

(assert (=> d!1083 (>= lt!2536 0)))

(declare-fun e!5954 () Int)

(assert (=> d!1083 (= lt!2536 e!5954)))

(declare-fun c!923 () Bool)

(assert (=> d!1083 (= c!923 (is-Nil!298 l!408))))

(assert (=> d!1083 (= (ListPrimitiveSize!1 l!408) lt!2536)))

(declare-fun b!10312 () Bool)

(assert (=> b!10312 (= e!5954 0)))

(declare-fun b!10313 () Bool)

(assert (=> b!10313 (= e!5954 (+ 1 (ListPrimitiveSize!1 (t!2448 l!408))))))

(assert (= (and d!1083 c!923) b!10312))

(assert (= (and d!1083 (not c!923)) b!10313))

(declare-fun m!6705 () Bool)

(assert (=> b!10313 m!6705))

(assert (=> start!1212 d!1083))

(declare-fun b!10326 () Bool)

(declare-fun e!5961 () Bool)

(declare-fun tp!1476 () Bool)

(assert (=> b!10326 (= e!5961 (and tp_is_empty!481 tp!1476))))

(assert (=> b!10289 (= tp!1463 e!5961)))

(assert (= (and b!10289 (is-Cons!297 (t!2448 l!408))) b!10326))

(push 1)

(assert (not b!10313))

(assert (not b!10326))

(assert tp_is_empty!481)

(check-sat)

(pop 1)

