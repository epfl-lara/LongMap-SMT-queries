; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1238 () Bool)

(assert start!1238)

(declare-fun res!8890 () Bool)

(declare-fun e!6013 () Bool)

(assert (=> start!1238 (=> (not res!8890) (not e!6013))))

(declare-datatypes ((B!322 0))(
  ( (B!323 (val!256 Int)) )
))
(declare-datatypes ((tuple2!312 0))(
  ( (tuple2!313 (_1!156 (_ BitVec 64)) (_2!156 B!322)) )
))
(declare-datatypes ((List!308 0))(
  ( (Nil!305) (Cons!304 (h!870 tuple2!312) (t!2455 List!308)) )
))
(declare-fun l!408 () List!308)

(get-info :version)

(assert (=> start!1238 (= res!8890 ((_ is Cons!304) l!408))))

(assert (=> start!1238 e!6013))

(declare-fun e!6014 () Bool)

(assert (=> start!1238 e!6014))

(declare-fun b!10396 () Bool)

(declare-fun lt!2556 () (_ BitVec 32))

(assert (=> b!10396 (= e!6013 (and (bvslt lt!2556 #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 lt!2556) #b00000000000000000000000000000000)))))

(declare-fun intSize!2 (List!308) (_ BitVec 32))

(assert (=> b!10396 (= lt!2556 (intSize!2 (t!2455 l!408)))))

(declare-fun b!10397 () Bool)

(declare-fun tp_is_empty!495 () Bool)

(declare-fun tp!1502 () Bool)

(assert (=> b!10397 (= e!6014 (and tp_is_empty!495 tp!1502))))

(assert (= (and start!1238 res!8890) b!10396))

(assert (= (and start!1238 ((_ is Cons!304) l!408)) b!10397))

(declare-fun m!6727 () Bool)

(assert (=> b!10396 m!6727))

(check-sat (not b!10396) (not b!10397) tp_is_empty!495)
(check-sat)
(get-model)

(declare-fun d!1103 () Bool)

(declare-fun lt!2572 () (_ BitVec 32))

(assert (=> d!1103 (bvsge lt!2572 #b00000000000000000000000000000000)))

(declare-fun e!6027 () (_ BitVec 32))

(assert (=> d!1103 (= lt!2572 e!6027)))

(declare-fun c!942 () Bool)

(assert (=> d!1103 (= c!942 ((_ is Cons!304) (t!2455 l!408)))))

(assert (=> d!1103 (= (intSize!2 (t!2455 l!408)) lt!2572)))

(declare-fun b!10416 () Bool)

(declare-fun lt!2574 () (_ BitVec 32))

(assert (=> b!10416 (= e!6027 (ite (bvslt lt!2574 #b01111111111111111111111111111111) (bvadd #b00000000000000000000000000000001 lt!2574) #b00000000000000000000000000000000))))

(assert (=> b!10416 (= lt!2574 (intSize!2 (t!2455 (t!2455 l!408))))))

(declare-fun b!10418 () Bool)

(assert (=> b!10418 (= e!6027 #b00000000000000000000000000000000)))

(assert (= (and d!1103 c!942) b!10416))

(assert (= (and d!1103 (not c!942)) b!10418))

(declare-fun m!6732 () Bool)

(assert (=> b!10416 m!6732))

(assert (=> b!10396 d!1103))

(declare-fun b!10435 () Bool)

(declare-fun e!6037 () Bool)

(declare-fun tp!1513 () Bool)

(assert (=> b!10435 (= e!6037 (and tp_is_empty!495 tp!1513))))

(assert (=> b!10397 (= tp!1502 e!6037)))

(assert (= (and b!10397 ((_ is Cons!304) (t!2455 l!408))) b!10435))

(check-sat (not b!10416) (not b!10435) tp_is_empty!495)
(check-sat)
