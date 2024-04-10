; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1214 () Bool)

(assert start!1214)

(declare-datatypes ((B!310 0))(
  ( (B!311 (val!250 Int)) )
))
(declare-datatypes ((tuple2!300 0))(
  ( (tuple2!301 (_1!150 (_ BitVec 64)) (_2!150 B!310)) )
))
(declare-datatypes ((List!302 0))(
  ( (Nil!299) (Cons!298 (h!864 tuple2!300) (t!2449 List!302)) )
))
(declare-fun l!408 () List!302)

(declare-fun ListPrimitiveSize!2 (List!302) Int)

(assert (=> start!1214 (< (ListPrimitiveSize!2 l!408) 0)))

(declare-fun e!5942 () Bool)

(assert (=> start!1214 e!5942))

(declare-fun b!10292 () Bool)

(declare-fun tp_is_empty!483 () Bool)

(declare-fun tp!1466 () Bool)

(assert (=> b!10292 (= e!5942 (and tp_is_empty!483 tp!1466))))

(get-info :version)

(assert (= (and start!1214 ((_ is Cons!298) l!408)) b!10292))

(declare-fun m!6697 () Bool)

(assert (=> start!1214 m!6697))

(check-sat (not start!1214) (not b!10292) tp_is_empty!483)
(check-sat)
(get-model)

(declare-fun d!1081 () Bool)

(declare-fun lt!2537 () Int)

(assert (=> d!1081 (>= lt!2537 0)))

(declare-fun e!5952 () Int)

(assert (=> d!1081 (= lt!2537 e!5952)))

(declare-fun c!921 () Bool)

(assert (=> d!1081 (= c!921 ((_ is Nil!299) l!408))))

(assert (=> d!1081 (= (ListPrimitiveSize!2 l!408) lt!2537)))

(declare-fun b!10308 () Bool)

(assert (=> b!10308 (= e!5952 0)))

(declare-fun b!10309 () Bool)

(assert (=> b!10309 (= e!5952 (+ 1 (ListPrimitiveSize!2 (t!2449 l!408))))))

(assert (= (and d!1081 c!921) b!10308))

(assert (= (and d!1081 (not c!921)) b!10309))

(declare-fun m!6702 () Bool)

(assert (=> b!10309 m!6702))

(assert (=> start!1214 d!1081))

(declare-fun b!10327 () Bool)

(declare-fun e!5962 () Bool)

(declare-fun tp!1477 () Bool)

(assert (=> b!10327 (= e!5962 (and tp_is_empty!483 tp!1477))))

(assert (=> b!10292 (= tp!1466 e!5962)))

(assert (= (and b!10292 ((_ is Cons!298) (t!2449 l!408))) b!10327))

(check-sat (not b!10309) (not b!10327) tp_is_empty!483)
(check-sat)
