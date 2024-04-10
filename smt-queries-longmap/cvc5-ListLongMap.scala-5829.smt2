; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75184 () Bool)

(assert start!75184)

(declare-fun b!885907 () Bool)

(declare-fun res!601546 () Bool)

(declare-fun e!493092 () Bool)

(assert (=> b!885907 (=> (not res!601546) (not e!493092))))

(declare-datatypes ((B!1292 0))(
  ( (B!1293 (val!8952 Int)) )
))
(declare-datatypes ((tuple2!11898 0))(
  ( (tuple2!11899 (_1!5960 (_ BitVec 64)) (_2!5960 B!1292)) )
))
(declare-datatypes ((List!17668 0))(
  ( (Nil!17665) (Cons!17664 (h!18795 tuple2!11898) (t!24945 List!17668)) )
))
(declare-fun l!906 () List!17668)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885907 (= res!601546 (and (is-Cons!17664 l!906) (bvslt (_1!5960 (h!18795 l!906)) key1!49)))))

(declare-fun b!885910 () Bool)

(declare-fun e!493091 () Bool)

(declare-fun tp_is_empty!17803 () Bool)

(declare-fun tp!54347 () Bool)

(assert (=> b!885910 (= e!493091 (and tp_is_empty!17803 tp!54347))))

(declare-fun b!885909 () Bool)

(declare-fun ListPrimitiveSize!88 (List!17668) Int)

(assert (=> b!885909 (= e!493092 (>= (ListPrimitiveSize!88 (t!24945 l!906)) (ListPrimitiveSize!88 l!906)))))

(declare-fun b!885908 () Bool)

(declare-fun res!601544 () Bool)

(assert (=> b!885908 (=> (not res!601544) (not e!493092))))

(declare-fun isStrictlySorted!486 (List!17668) Bool)

(assert (=> b!885908 (= res!601544 (isStrictlySorted!486 (t!24945 l!906)))))

(declare-fun res!601545 () Bool)

(assert (=> start!75184 (=> (not res!601545) (not e!493092))))

(assert (=> start!75184 (= res!601545 (isStrictlySorted!486 l!906))))

(assert (=> start!75184 e!493092))

(assert (=> start!75184 e!493091))

(assert (=> start!75184 true))

(assert (= (and start!75184 res!601545) b!885907))

(assert (= (and b!885907 res!601546) b!885908))

(assert (= (and b!885908 res!601544) b!885909))

(assert (= (and start!75184 (is-Cons!17664 l!906)) b!885910))

(declare-fun m!825883 () Bool)

(assert (=> b!885909 m!825883))

(declare-fun m!825885 () Bool)

(assert (=> b!885909 m!825885))

(declare-fun m!825887 () Bool)

(assert (=> b!885908 m!825887))

(declare-fun m!825889 () Bool)

(assert (=> start!75184 m!825889))

(push 1)

(assert (not b!885910))

(assert (not b!885909))

(assert tp_is_empty!17803)

(assert (not start!75184))

(assert (not b!885908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109477 () Bool)

(declare-fun lt!401060 () Int)

(assert (=> d!109477 (>= lt!401060 0)))

(declare-fun e!493115 () Int)

(assert (=> d!109477 (= lt!401060 e!493115)))

(declare-fun c!93369 () Bool)

(assert (=> d!109477 (= c!93369 (is-Nil!17665 (t!24945 l!906)))))

(assert (=> d!109477 (= (ListPrimitiveSize!88 (t!24945 l!906)) lt!401060)))

(declare-fun b!885951 () Bool)

(assert (=> b!885951 (= e!493115 0)))

(declare-fun b!885952 () Bool)

(assert (=> b!885952 (= e!493115 (+ 1 (ListPrimitiveSize!88 (t!24945 (t!24945 l!906)))))))

(assert (= (and d!109477 c!93369) b!885951))

(assert (= (and d!109477 (not c!93369)) b!885952))

(declare-fun m!825909 () Bool)

(assert (=> b!885952 m!825909))

(assert (=> b!885909 d!109477))

(declare-fun d!109481 () Bool)

(declare-fun lt!401061 () Int)

(assert (=> d!109481 (>= lt!401061 0)))

(declare-fun e!493118 () Int)

(assert (=> d!109481 (= lt!401061 e!493118)))

(declare-fun c!93370 () Bool)

(assert (=> d!109481 (= c!93370 (is-Nil!17665 l!906))))

(assert (=> d!109481 (= (ListPrimitiveSize!88 l!906) lt!401061)))

(declare-fun b!885955 () Bool)

(assert (=> b!885955 (= e!493118 0)))

(declare-fun b!885956 () Bool)

(assert (=> b!885956 (= e!493118 (+ 1 (ListPrimitiveSize!88 (t!24945 l!906))))))

(assert (= (and d!109481 c!93370) b!885955))

(assert (= (and d!109481 (not c!93370)) b!885956))

(assert (=> b!885956 m!825883))

(assert (=> b!885909 d!109481))

(declare-fun d!109485 () Bool)

(declare-fun res!601577 () Bool)

(declare-fun e!493132 () Bool)

(assert (=> d!109485 (=> res!601577 e!493132)))

(assert (=> d!109485 (= res!601577 (or (is-Nil!17665 (t!24945 l!906)) (is-Nil!17665 (t!24945 (t!24945 l!906)))))))

(assert (=> d!109485 (= (isStrictlySorted!486 (t!24945 l!906)) e!493132)))

(declare-fun b!885976 () Bool)

(declare-fun e!493133 () Bool)

(assert (=> b!885976 (= e!493132 e!493133)))

(declare-fun res!601578 () Bool)

(assert (=> b!885976 (=> (not res!601578) (not e!493133))))

(assert (=> b!885976 (= res!601578 (bvslt (_1!5960 (h!18795 (t!24945 l!906))) (_1!5960 (h!18795 (t!24945 (t!24945 l!906))))))))

(declare-fun b!885977 () Bool)

(assert (=> b!885977 (= e!493133 (isStrictlySorted!486 (t!24945 (t!24945 l!906))))))

(assert (= (and d!109485 (not res!601577)) b!885976))

(assert (= (and b!885976 res!601578) b!885977))

(declare-fun m!825915 () Bool)

(assert (=> b!885977 m!825915))

(assert (=> b!885908 d!109485))

(declare-fun d!109491 () Bool)

(declare-fun res!601579 () Bool)

(declare-fun e!493134 () Bool)

(assert (=> d!109491 (=> res!601579 e!493134)))

(assert (=> d!109491 (= res!601579 (or (is-Nil!17665 l!906) (is-Nil!17665 (t!24945 l!906))))))

(assert (=> d!109491 (= (isStrictlySorted!486 l!906) e!493134)))

(declare-fun b!885978 () Bool)

(declare-fun e!493135 () Bool)

(assert (=> b!885978 (= e!493134 e!493135)))

(declare-fun res!601580 () Bool)

(assert (=> b!885978 (=> (not res!601580) (not e!493135))))

(assert (=> b!885978 (= res!601580 (bvslt (_1!5960 (h!18795 l!906)) (_1!5960 (h!18795 (t!24945 l!906)))))))

(declare-fun b!885979 () Bool)

(assert (=> b!885979 (= e!493135 (isStrictlySorted!486 (t!24945 l!906)))))

(assert (= (and d!109491 (not res!601579)) b!885978))

(assert (= (and b!885978 res!601580) b!885979))

(assert (=> b!885979 m!825887))

(assert (=> start!75184 d!109491))

(declare-fun b!885984 () Bool)

(declare-fun e!493138 () Bool)

(declare-fun tp!54359 () Bool)

(assert (=> b!885984 (= e!493138 (and tp_is_empty!17803 tp!54359))))

(assert (=> b!885910 (= tp!54347 e!493138)))

(assert (= (and b!885910 (is-Cons!17664 (t!24945 l!906))) b!885984))

(push 1)

