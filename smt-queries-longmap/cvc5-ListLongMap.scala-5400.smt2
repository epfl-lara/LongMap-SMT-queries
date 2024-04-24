; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72250 () Bool)

(assert start!72250)

(declare-fun res!569524 () Bool)

(declare-fun e!467418 () Bool)

(assert (=> start!72250 (=> (not res!569524) (not e!467418))))

(declare-datatypes ((B!1206 0))(
  ( (B!1207 (val!7685 Int)) )
))
(declare-datatypes ((tuple2!10154 0))(
  ( (tuple2!10155 (_1!5088 (_ BitVec 64)) (_2!5088 B!1206)) )
))
(declare-datatypes ((List!15899 0))(
  ( (Nil!15896) (Cons!15895 (h!17032 tuple2!10154) (t!22262 List!15899)) )
))
(declare-fun l!390 () List!15899)

(declare-fun isStrictlySorted!448 (List!15899) Bool)

(assert (=> start!72250 (= res!569524 (isStrictlySorted!448 l!390))))

(assert (=> start!72250 e!467418))

(declare-fun e!467417 () Bool)

(assert (=> start!72250 e!467417))

(declare-fun b!837577 () Bool)

(declare-fun e!467416 () Bool)

(declare-datatypes ((List!15900 0))(
  ( (Nil!15897) (Cons!15896 (h!17033 (_ BitVec 64)) (t!22263 List!15900)) )
))
(declare-fun length!27 (List!15900) Int)

(declare-fun length!28 (List!15899) Int)

(assert (=> b!837577 (= e!467416 (not (= (length!27 Nil!15897) (length!28 l!390))))))

(declare-fun b!837575 () Bool)

(declare-fun res!569523 () Bool)

(assert (=> b!837575 (=> (not res!569523) (not e!467418))))

(assert (=> b!837575 (= res!569523 (not (is-Cons!15895 l!390)))))

(declare-fun b!837576 () Bool)

(assert (=> b!837576 (= e!467418 e!467416)))

(declare-fun res!569525 () Bool)

(assert (=> b!837576 (=> res!569525 e!467416)))

(assert (=> b!837576 (= res!569525 false)))

(declare-fun b!837578 () Bool)

(declare-fun tp_is_empty!15275 () Bool)

(declare-fun tp!47486 () Bool)

(assert (=> b!837578 (= e!467417 (and tp_is_empty!15275 tp!47486))))

(assert (= (and start!72250 res!569524) b!837575))

(assert (= (and b!837575 res!569523) b!837576))

(assert (= (and b!837576 (not res!569525)) b!837577))

(assert (= (and start!72250 (is-Cons!15895 l!390)) b!837578))

(declare-fun m!783145 () Bool)

(assert (=> start!72250 m!783145))

(declare-fun m!783147 () Bool)

(assert (=> b!837577 m!783147))

(declare-fun m!783149 () Bool)

(assert (=> b!837577 m!783149))

(push 1)

(assert (not start!72250))

(assert (not b!837577))

(assert (not b!837578))

(assert tp_is_empty!15275)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107997 () Bool)

(declare-fun res!569536 () Bool)

(declare-fun e!467429 () Bool)

(assert (=> d!107997 (=> res!569536 e!467429)))

(assert (=> d!107997 (= res!569536 (or (is-Nil!15896 l!390) (is-Nil!15896 (t!22262 l!390))))))

(assert (=> d!107997 (= (isStrictlySorted!448 l!390) e!467429)))

(declare-fun b!837589 () Bool)

(declare-fun e!467430 () Bool)

(assert (=> b!837589 (= e!467429 e!467430)))

(declare-fun res!569537 () Bool)

(assert (=> b!837589 (=> (not res!569537) (not e!467430))))

(assert (=> b!837589 (= res!569537 (bvslt (_1!5088 (h!17032 l!390)) (_1!5088 (h!17032 (t!22262 l!390)))))))

(declare-fun b!837590 () Bool)

(assert (=> b!837590 (= e!467430 (isStrictlySorted!448 (t!22262 l!390)))))

(assert (= (and d!107997 (not res!569536)) b!837589))

(assert (= (and b!837589 res!569537) b!837590))

(declare-fun m!783155 () Bool)

(assert (=> b!837590 m!783155))

(assert (=> start!72250 d!107997))

(declare-fun d!108005 () Bool)

(declare-fun size!22898 (List!15900) Int)

(assert (=> d!108005 (= (length!27 Nil!15897) (size!22898 Nil!15897))))

(declare-fun bs!23515 () Bool)

(assert (= bs!23515 d!108005))

(declare-fun m!783161 () Bool)

(assert (=> bs!23515 m!783161))

(assert (=> b!837577 d!108005))

(declare-fun d!108009 () Bool)

(declare-fun size!22899 (List!15899) Int)

(assert (=> d!108009 (= (length!28 l!390) (size!22899 l!390))))

(declare-fun bs!23517 () Bool)

(assert (= bs!23517 d!108009))

(declare-fun m!783165 () Bool)

(assert (=> bs!23517 m!783165))

(assert (=> b!837577 d!108009))

(declare-fun b!837610 () Bool)

(declare-fun e!467444 () Bool)

(declare-fun tp!47494 () Bool)

(assert (=> b!837610 (= e!467444 (and tp_is_empty!15275 tp!47494))))

(assert (=> b!837578 (= tp!47486 e!467444)))

(assert (= (and b!837578 (is-Cons!15895 (t!22262 l!390))) b!837610))

(push 1)

(assert (not d!108005))

(assert tp_is_empty!15275)

(assert (not d!108009))

(assert (not b!837610))

(assert (not b!837590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!108013 () Bool)

(declare-fun res!569544 () Bool)

(declare-fun e!467446 () Bool)

(assert (=> d!108013 (=> res!569544 e!467446)))

(assert (=> d!108013 (= res!569544 (or (is-Nil!15896 (t!22262 l!390)) (is-Nil!15896 (t!22262 (t!22262 l!390)))))))

(assert (=> d!108013 (= (isStrictlySorted!448 (t!22262 l!390)) e!467446)))

(declare-fun b!837612 () Bool)

(declare-fun e!467447 () Bool)

(assert (=> b!837612 (= e!467446 e!467447)))

(declare-fun res!569545 () Bool)

(assert (=> b!837612 (=> (not res!569545) (not e!467447))))

(assert (=> b!837612 (= res!569545 (bvslt (_1!5088 (h!17032 (t!22262 l!390))) (_1!5088 (h!17032 (t!22262 (t!22262 l!390))))))))

(declare-fun b!837613 () Bool)

(assert (=> b!837613 (= e!467447 (isStrictlySorted!448 (t!22262 (t!22262 l!390))))))

(assert (= (and d!108013 (not res!569544)) b!837612))

(assert (= (and b!837612 res!569545) b!837613))

(declare-fun m!783169 () Bool)

(assert (=> b!837613 m!783169))

(assert (=> b!837590 d!108013))

(declare-fun d!108015 () Bool)

(declare-fun lt!380807 () Int)

(assert (=> d!108015 (>= lt!380807 0)))

(declare-fun e!467450 () Int)

(assert (=> d!108015 (= lt!380807 e!467450)))

(declare-fun c!91361 () Bool)

(assert (=> d!108015 (= c!91361 (is-Nil!15897 Nil!15897))))

(assert (=> d!108015 (= (size!22898 Nil!15897) lt!380807)))

(declare-fun b!837618 () Bool)

(assert (=> b!837618 (= e!467450 0)))

(declare-fun b!837619 () Bool)

(assert (=> b!837619 (= e!467450 (+ 1 (size!22898 (t!22263 Nil!15897))))))

(assert (= (and d!108015 c!91361) b!837618))

(assert (= (and d!108015 (not c!91361)) b!837619))

(declare-fun m!783171 () Bool)

(assert (=> b!837619 m!783171))

(assert (=> d!108005 d!108015))

(declare-fun d!108017 () Bool)

(declare-fun lt!380812 () Int)

(assert (=> d!108017 (>= lt!380812 0)))

(declare-fun e!467455 () Int)

(assert (=> d!108017 (= lt!380812 e!467455)))

(declare-fun c!91366 () Bool)

(assert (=> d!108017 (= c!91366 (is-Nil!15896 l!390))))

(assert (=> d!108017 (= (size!22899 l!390) lt!380812)))

(declare-fun b!837628 () Bool)

(assert (=> b!837628 (= e!467455 0)))

(declare-fun b!837629 () Bool)

(assert (=> b!837629 (= e!467455 (+ 1 (size!22899 (t!22262 l!390))))))

(assert (= (and d!108017 c!91366) b!837628))

(assert (= (and d!108017 (not c!91366)) b!837629))

(declare-fun m!783173 () Bool)

(assert (=> b!837629 m!783173))

(assert (=> d!108009 d!108017))

(declare-fun b!837630 () Bool)

(declare-fun e!467456 () Bool)

(declare-fun tp!47496 () Bool)

(assert (=> b!837630 (= e!467456 (and tp_is_empty!15275 tp!47496))))

(assert (=> b!837610 (= tp!47494 e!467456)))

(assert (= (and b!837610 (is-Cons!15895 (t!22262 (t!22262 l!390)))) b!837630))

(push 1)

(assert (not b!837613))

(assert (not b!837619))

(assert tp_is_empty!15275)

(assert (not b!837630))

(assert (not b!837629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

