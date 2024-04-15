; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1212 () Bool)

(assert start!1212)

(declare-datatypes ((B!308 0))(
  ( (B!309 (val!249 Int)) )
))
(declare-datatypes ((tuple2!294 0))(
  ( (tuple2!295 (_1!147 (_ BitVec 64)) (_2!147 B!308)) )
))
(declare-datatypes ((List!297 0))(
  ( (Nil!294) (Cons!293 (h!859 tuple2!294) (t!2444 List!297)) )
))
(declare-fun l!408 () List!297)

(declare-fun ListPrimitiveSize!1 (List!297) Int)

(assert (=> start!1212 (< (ListPrimitiveSize!1 l!408) 0)))

(declare-fun e!5939 () Bool)

(assert (=> start!1212 e!5939))

(declare-fun b!10289 () Bool)

(declare-fun tp_is_empty!481 () Bool)

(declare-fun tp!1463 () Bool)

(assert (=> b!10289 (= e!5939 (and tp_is_empty!481 tp!1463))))

(get-info :version)

(assert (= (and start!1212 ((_ is Cons!293) l!408)) b!10289))

(declare-fun m!6695 () Bool)

(assert (=> start!1212 m!6695))

(check-sat (not start!1212) (not b!10289) tp_is_empty!481)
(check-sat)
(get-model)

(declare-fun d!1085 () Bool)

(declare-fun lt!2538 () Int)

(assert (=> d!1085 (>= lt!2538 0)))

(declare-fun e!5954 () Int)

(assert (=> d!1085 (= lt!2538 e!5954)))

(declare-fun c!923 () Bool)

(assert (=> d!1085 (= c!923 ((_ is Nil!294) l!408))))

(assert (=> d!1085 (= (ListPrimitiveSize!1 l!408) lt!2538)))

(declare-fun b!10312 () Bool)

(assert (=> b!10312 (= e!5954 0)))

(declare-fun b!10313 () Bool)

(assert (=> b!10313 (= e!5954 (+ 1 (ListPrimitiveSize!1 (t!2444 l!408))))))

(assert (= (and d!1085 c!923) b!10312))

(assert (= (and d!1085 (not c!923)) b!10313))

(declare-fun m!6705 () Bool)

(assert (=> b!10313 m!6705))

(assert (=> start!1212 d!1085))

(declare-fun b!10328 () Bool)

(declare-fun e!5963 () Bool)

(declare-fun tp!1478 () Bool)

(assert (=> b!10328 (= e!5963 (and tp_is_empty!481 tp!1478))))

(assert (=> b!10289 (= tp!1463 e!5963)))

(assert (= (and b!10289 ((_ is Cons!293) (t!2444 l!408))) b!10328))

(check-sat (not b!10313) (not b!10328) tp_is_empty!481)
(check-sat)
