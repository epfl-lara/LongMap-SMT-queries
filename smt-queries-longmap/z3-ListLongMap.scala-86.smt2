; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1236 () Bool)

(assert start!1236)

(declare-fun res!8887 () Bool)

(declare-fun e!6007 () Bool)

(assert (=> start!1236 (=> (not res!8887) (not e!6007))))

(declare-datatypes ((B!320 0))(
  ( (B!321 (val!255 Int)) )
))
(declare-datatypes ((tuple2!306 0))(
  ( (tuple2!307 (_1!153 (_ BitVec 64)) (_2!153 B!320)) )
))
(declare-datatypes ((List!303 0))(
  ( (Nil!300) (Cons!299 (h!865 tuple2!306) (t!2450 List!303)) )
))
(declare-fun l!408 () List!303)

(get-info :version)

(assert (=> start!1236 (= res!8887 ((_ is Cons!299) l!408))))

(assert (=> start!1236 e!6007))

(declare-fun e!6008 () Bool)

(assert (=> start!1236 e!6008))

(declare-fun b!10390 () Bool)

(declare-fun lt!2553 () (_ BitVec 32))

(assert (=> b!10390 (= e!6007 (and (bvslt lt!2553 #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 lt!2553) #b00000000000000000000000000000000)))))

(declare-fun intSize!1 (List!303) (_ BitVec 32))

(assert (=> b!10390 (= lt!2553 (intSize!1 (t!2450 l!408)))))

(declare-fun b!10391 () Bool)

(declare-fun tp_is_empty!493 () Bool)

(declare-fun tp!1499 () Bool)

(assert (=> b!10391 (= e!6008 (and tp_is_empty!493 tp!1499))))

(assert (= (and start!1236 res!8887) b!10390))

(assert (= (and start!1236 ((_ is Cons!299) l!408)) b!10391))

(declare-fun m!6725 () Bool)

(assert (=> b!10390 m!6725))

(check-sat (not b!10390) (not b!10391) tp_is_empty!493)
(check-sat)
(get-model)

(declare-fun d!1105 () Bool)

(declare-fun lt!2568 () (_ BitVec 32))

(assert (=> d!1105 (bvsge lt!2568 #b00000000000000000000000000000000)))

(declare-fun e!6025 () (_ BitVec 32))

(assert (=> d!1105 (= lt!2568 e!6025)))

(declare-fun c!940 () Bool)

(assert (=> d!1105 (= c!940 ((_ is Cons!299) (t!2450 l!408)))))

(assert (=> d!1105 (= (intSize!1 (t!2450 l!408)) lt!2568)))

(declare-fun b!10413 () Bool)

(declare-fun lt!2570 () (_ BitVec 32))

(assert (=> b!10413 (= e!6025 (ite (bvslt lt!2570 #b01111111111111111111111111111111) (bvadd #b00000000000000000000000000000001 lt!2570) #b00000000000000000000000000000000))))

(assert (=> b!10413 (= lt!2570 (intSize!1 (t!2450 (t!2450 l!408))))))

(declare-fun b!10415 () Bool)

(assert (=> b!10415 (= e!6025 #b00000000000000000000000000000000)))

(assert (= (and d!1105 c!940) b!10413))

(assert (= (and d!1105 (not c!940)) b!10415))

(declare-fun m!6732 () Bool)

(assert (=> b!10413 m!6732))

(assert (=> b!10390 d!1105))

(declare-fun b!10428 () Bool)

(declare-fun e!6033 () Bool)

(declare-fun tp!1510 () Bool)

(assert (=> b!10428 (= e!6033 (and tp_is_empty!493 tp!1510))))

(assert (=> b!10391 (= tp!1499 e!6033)))

(assert (= (and b!10391 ((_ is Cons!299) (t!2450 l!408))) b!10428))

(check-sat (not b!10413) (not b!10428) tp_is_empty!493)
(check-sat)
