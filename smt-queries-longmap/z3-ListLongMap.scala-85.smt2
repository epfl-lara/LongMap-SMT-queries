; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1226 () Bool)

(assert start!1226)

(declare-fun res!8881 () Bool)

(declare-fun e!5974 () Bool)

(assert (=> start!1226 (=> (not res!8881) (not e!5974))))

(declare-datatypes ((B!316 0))(
  ( (B!317 (val!253 Int)) )
))
(declare-datatypes ((tuple2!306 0))(
  ( (tuple2!307 (_1!153 (_ BitVec 64)) (_2!153 B!316)) )
))
(declare-datatypes ((List!305 0))(
  ( (Nil!302) (Cons!301 (h!867 tuple2!306) (t!2452 List!305)) )
))
(declare-fun l!408 () List!305)

(get-info :version)

(assert (=> start!1226 (= res!8881 ((_ is Cons!301) l!408))))

(assert (=> start!1226 e!5974))

(declare-fun e!5975 () Bool)

(assert (=> start!1226 e!5975))

(declare-fun b!10339 () Bool)

(declare-fun ListPrimitiveSize!5 (List!305) Int)

(assert (=> b!10339 (= e!5974 (>= (ListPrimitiveSize!5 (t!2452 l!408)) (ListPrimitiveSize!5 l!408)))))

(declare-fun b!10340 () Bool)

(declare-fun tp_is_empty!489 () Bool)

(declare-fun tp!1484 () Bool)

(assert (=> b!10340 (= e!5975 (and tp_is_empty!489 tp!1484))))

(assert (= (and start!1226 res!8881) b!10339))

(assert (= (and start!1226 ((_ is Cons!301) l!408)) b!10340))

(declare-fun m!6711 () Bool)

(assert (=> b!10339 m!6711))

(declare-fun m!6713 () Bool)

(assert (=> b!10339 m!6713))

(check-sat (not b!10339) (not b!10340) tp_is_empty!489)
(check-sat)
(get-model)

(declare-fun d!1093 () Bool)

(declare-fun lt!2546 () Int)

(assert (=> d!1093 (>= lt!2546 0)))

(declare-fun e!5990 () Int)

(assert (=> d!1093 (= lt!2546 e!5990)))

(declare-fun c!932 () Bool)

(assert (=> d!1093 (= c!932 ((_ is Nil!302) (t!2452 l!408)))))

(assert (=> d!1093 (= (ListPrimitiveSize!5 (t!2452 l!408)) lt!2546)))

(declare-fun b!10362 () Bool)

(assert (=> b!10362 (= e!5990 0)))

(declare-fun b!10364 () Bool)

(assert (=> b!10364 (= e!5990 (+ 1 (ListPrimitiveSize!5 (t!2452 (t!2452 l!408)))))))

(assert (= (and d!1093 c!932) b!10362))

(assert (= (and d!1093 (not c!932)) b!10364))

(declare-fun m!6721 () Bool)

(assert (=> b!10364 m!6721))

(assert (=> b!10339 d!1093))

(declare-fun d!1097 () Bool)

(declare-fun lt!2549 () Int)

(assert (=> d!1097 (>= lt!2549 0)))

(declare-fun e!5992 () Int)

(assert (=> d!1097 (= lt!2549 e!5992)))

(declare-fun c!934 () Bool)

(assert (=> d!1097 (= c!934 ((_ is Nil!302) l!408))))

(assert (=> d!1097 (= (ListPrimitiveSize!5 l!408) lt!2549)))

(declare-fun b!10366 () Bool)

(assert (=> b!10366 (= e!5992 0)))

(declare-fun b!10368 () Bool)

(assert (=> b!10368 (= e!5992 (+ 1 (ListPrimitiveSize!5 (t!2452 l!408))))))

(assert (= (and d!1097 c!934) b!10366))

(assert (= (and d!1097 (not c!934)) b!10368))

(assert (=> b!10368 m!6711))

(assert (=> b!10339 d!1097))

(declare-fun b!10384 () Bool)

(declare-fun e!6001 () Bool)

(declare-fun tp!1495 () Bool)

(assert (=> b!10384 (= e!6001 (and tp_is_empty!489 tp!1495))))

(assert (=> b!10340 (= tp!1484 e!6001)))

(assert (= (and b!10340 ((_ is Cons!301) (t!2452 l!408))) b!10384))

(check-sat (not b!10364) (not b!10368) (not b!10384) tp_is_empty!489)
(check-sat)
