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

(declare-fun d!1081 () Bool)

(declare-fun lt!2532 () Int)

(assert (=> d!1081 (>= lt!2532 0)))

(declare-fun e!5948 () Int)

(assert (=> d!1081 (= lt!2532 e!5948)))

(declare-fun c!917 () Bool)

(assert (=> d!1081 (= c!917 ((_ is Nil!294) l!408))))

(assert (=> d!1081 (= (ListPrimitiveSize!1 l!408) lt!2532)))

(declare-fun b!10300 () Bool)

(assert (=> b!10300 (= e!5948 0)))

(declare-fun b!10301 () Bool)

(assert (=> b!10301 (= e!5948 (+ 1 (ListPrimitiveSize!1 (t!2444 l!408))))))

(assert (= (and d!1081 c!917) b!10300))

(assert (= (and d!1081 (not c!917)) b!10301))

(declare-fun m!6701 () Bool)

(assert (=> b!10301 m!6701))

(assert (=> start!1212 d!1081))

(declare-fun b!10306 () Bool)

(declare-fun e!5951 () Bool)

(declare-fun tp!1472 () Bool)

(assert (=> b!10306 (= e!5951 (and tp_is_empty!481 tp!1472))))

(assert (=> b!10289 (= tp!1463 e!5951)))

(assert (= (and b!10289 ((_ is Cons!293) (t!2444 l!408))) b!10306))

(check-sat (not b!10301) (not b!10306) tp_is_empty!481)
(check-sat)
