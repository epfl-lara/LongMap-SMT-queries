; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75136 () Bool)

(assert start!75136)

(declare-fun res!601361 () Bool)

(declare-fun e!492838 () Bool)

(assert (=> start!75136 (=> (not res!601361) (not e!492838))))

(declare-datatypes ((B!1280 0))(
  ( (B!1281 (val!8946 Int)) )
))
(declare-datatypes ((tuple2!11906 0))(
  ( (tuple2!11907 (_1!5964 (_ BitVec 64)) (_2!5964 B!1280)) )
))
(declare-datatypes ((List!17670 0))(
  ( (Nil!17667) (Cons!17666 (h!18797 tuple2!11906) (t!24938 List!17670)) )
))
(declare-fun l!906 () List!17670)

(declare-fun isStrictlySorted!476 (List!17670) Bool)

(assert (=> start!75136 (= res!601361 (isStrictlySorted!476 l!906))))

(assert (=> start!75136 e!492838))

(declare-fun e!492839 () Bool)

(assert (=> start!75136 e!492839))

(declare-fun b!885529 () Bool)

(declare-fun ListPrimitiveSize!85 (List!17670) Int)

(assert (=> b!885529 (= e!492838 (< (ListPrimitiveSize!85 l!906) 0))))

(declare-fun b!885530 () Bool)

(declare-fun tp_is_empty!17791 () Bool)

(declare-fun tp!54312 () Bool)

(assert (=> b!885530 (= e!492839 (and tp_is_empty!17791 tp!54312))))

(assert (= (and start!75136 res!601361) b!885529))

(get-info :version)

(assert (= (and start!75136 ((_ is Cons!17666) l!906)) b!885530))

(declare-fun m!825083 () Bool)

(assert (=> start!75136 m!825083))

(declare-fun m!825085 () Bool)

(assert (=> b!885529 m!825085))

(check-sat (not start!75136) (not b!885529) (not b!885530) tp_is_empty!17791)
(check-sat)
(get-model)

(declare-fun d!109245 () Bool)

(declare-fun res!601376 () Bool)

(declare-fun e!492860 () Bool)

(assert (=> d!109245 (=> res!601376 e!492860)))

(assert (=> d!109245 (= res!601376 (or ((_ is Nil!17667) l!906) ((_ is Nil!17667) (t!24938 l!906))))))

(assert (=> d!109245 (= (isStrictlySorted!476 l!906) e!492860)))

(declare-fun b!885551 () Bool)

(declare-fun e!492861 () Bool)

(assert (=> b!885551 (= e!492860 e!492861)))

(declare-fun res!601377 () Bool)

(assert (=> b!885551 (=> (not res!601377) (not e!492861))))

(assert (=> b!885551 (= res!601377 (bvslt (_1!5964 (h!18797 l!906)) (_1!5964 (h!18797 (t!24938 l!906)))))))

(declare-fun b!885552 () Bool)

(assert (=> b!885552 (= e!492861 (isStrictlySorted!476 (t!24938 l!906)))))

(assert (= (and d!109245 (not res!601376)) b!885551))

(assert (= (and b!885551 res!601377) b!885552))

(declare-fun m!825095 () Bool)

(assert (=> b!885552 m!825095))

(assert (=> start!75136 d!109245))

(declare-fun d!109251 () Bool)

(declare-fun lt!400816 () Int)

(assert (=> d!109251 (>= lt!400816 0)))

(declare-fun e!492871 () Int)

(assert (=> d!109251 (= lt!400816 e!492871)))

(declare-fun c!93296 () Bool)

(assert (=> d!109251 (= c!93296 ((_ is Nil!17667) l!906))))

(assert (=> d!109251 (= (ListPrimitiveSize!85 l!906) lt!400816)))

(declare-fun b!885569 () Bool)

(assert (=> b!885569 (= e!492871 0)))

(declare-fun b!885570 () Bool)

(assert (=> b!885570 (= e!492871 (+ 1 (ListPrimitiveSize!85 (t!24938 l!906))))))

(assert (= (and d!109251 c!93296) b!885569))

(assert (= (and d!109251 (not c!93296)) b!885570))

(declare-fun m!825101 () Bool)

(assert (=> b!885570 m!825101))

(assert (=> b!885529 d!109251))

(declare-fun b!885577 () Bool)

(declare-fun e!492875 () Bool)

(declare-fun tp!54321 () Bool)

(assert (=> b!885577 (= e!492875 (and tp_is_empty!17791 tp!54321))))

(assert (=> b!885530 (= tp!54312 e!492875)))

(assert (= (and b!885530 ((_ is Cons!17666) (t!24938 l!906))) b!885577))

(check-sat (not b!885552) (not b!885570) (not b!885577) tp_is_empty!17791)
(check-sat)
