; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138348 () Bool)

(assert start!138348)

(declare-fun res!1082611 () Bool)

(declare-fun e!885448 () Bool)

(assert (=> start!138348 (=> (not res!1082611) (not e!885448))))

(declare-datatypes ((B!2858 0))(
  ( (B!2859 (val!19791 Int)) )
))
(declare-datatypes ((tuple2!25810 0))(
  ( (tuple2!25811 (_1!12916 (_ BitVec 64)) (_2!12916 B!2858)) )
))
(declare-datatypes ((List!36943 0))(
  ( (Nil!36940) (Cons!36939 (h!38500 tuple2!25810) (t!51849 List!36943)) )
))
(declare-fun l!548 () List!36943)

(declare-fun isStrictlySorted!1133 (List!36943) Bool)

(assert (=> start!138348 (= res!1082611 (isStrictlySorted!1133 l!548))))

(assert (=> start!138348 e!885448))

(declare-fun e!885447 () Bool)

(assert (=> start!138348 e!885447))

(assert (=> start!138348 true))

(declare-fun b!1585999 () Bool)

(declare-fun res!1082610 () Bool)

(assert (=> b!1585999 (=> (not res!1082610) (not e!885448))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585999 (= res!1082610 (and (not (= (_1!12916 (h!38500 l!548)) key!159)) ((_ is Cons!36939) l!548)))))

(declare-fun b!1586000 () Bool)

(declare-fun ListPrimitiveSize!214 (List!36943) Int)

(assert (=> b!1586000 (= e!885448 (>= (ListPrimitiveSize!214 (t!51849 l!548)) (ListPrimitiveSize!214 l!548)))))

(declare-fun b!1586001 () Bool)

(declare-fun tp_is_empty!39391 () Bool)

(declare-fun tp!114968 () Bool)

(assert (=> b!1586001 (= e!885447 (and tp_is_empty!39391 tp!114968))))

(assert (= (and start!138348 res!1082611) b!1585999))

(assert (= (and b!1585999 res!1082610) b!1586000))

(assert (= (and start!138348 ((_ is Cons!36939) l!548)) b!1586001))

(declare-fun m!1455651 () Bool)

(assert (=> start!138348 m!1455651))

(declare-fun m!1455653 () Bool)

(assert (=> b!1586000 m!1455653))

(declare-fun m!1455655 () Bool)

(assert (=> b!1586000 m!1455655))

(check-sat (not b!1586000) (not start!138348) (not b!1586001) tp_is_empty!39391)
(check-sat)
(get-model)

(declare-fun d!167973 () Bool)

(declare-fun lt!678087 () Int)

(assert (=> d!167973 (>= lt!678087 0)))

(declare-fun e!885463 () Int)

(assert (=> d!167973 (= lt!678087 e!885463)))

(declare-fun c!147546 () Bool)

(assert (=> d!167973 (= c!147546 ((_ is Nil!36940) (t!51849 l!548)))))

(assert (=> d!167973 (= (ListPrimitiveSize!214 (t!51849 l!548)) lt!678087)))

(declare-fun b!1586024 () Bool)

(assert (=> b!1586024 (= e!885463 0)))

(declare-fun b!1586025 () Bool)

(assert (=> b!1586025 (= e!885463 (+ 1 (ListPrimitiveSize!214 (t!51849 (t!51849 l!548)))))))

(assert (= (and d!167973 c!147546) b!1586024))

(assert (= (and d!167973 (not c!147546)) b!1586025))

(declare-fun m!1455669 () Bool)

(assert (=> b!1586025 m!1455669))

(assert (=> b!1586000 d!167973))

(declare-fun d!167975 () Bool)

(declare-fun lt!678088 () Int)

(assert (=> d!167975 (>= lt!678088 0)))

(declare-fun e!885464 () Int)

(assert (=> d!167975 (= lt!678088 e!885464)))

(declare-fun c!147547 () Bool)

(assert (=> d!167975 (= c!147547 ((_ is Nil!36940) l!548))))

(assert (=> d!167975 (= (ListPrimitiveSize!214 l!548) lt!678088)))

(declare-fun b!1586026 () Bool)

(assert (=> b!1586026 (= e!885464 0)))

(declare-fun b!1586027 () Bool)

(assert (=> b!1586027 (= e!885464 (+ 1 (ListPrimitiveSize!214 (t!51849 l!548))))))

(assert (= (and d!167975 c!147547) b!1586026))

(assert (= (and d!167975 (not c!147547)) b!1586027))

(assert (=> b!1586027 m!1455653))

(assert (=> b!1586000 d!167975))

(declare-fun d!167977 () Bool)

(declare-fun res!1082628 () Bool)

(declare-fun e!885471 () Bool)

(assert (=> d!167977 (=> res!1082628 e!885471)))

(assert (=> d!167977 (= res!1082628 (or ((_ is Nil!36940) l!548) ((_ is Nil!36940) (t!51849 l!548))))))

(assert (=> d!167977 (= (isStrictlySorted!1133 l!548) e!885471)))

(declare-fun b!1586036 () Bool)

(declare-fun e!885472 () Bool)

(assert (=> b!1586036 (= e!885471 e!885472)))

(declare-fun res!1082629 () Bool)

(assert (=> b!1586036 (=> (not res!1082629) (not e!885472))))

(assert (=> b!1586036 (= res!1082629 (bvslt (_1!12916 (h!38500 l!548)) (_1!12916 (h!38500 (t!51849 l!548)))))))

(declare-fun b!1586037 () Bool)

(assert (=> b!1586037 (= e!885472 (isStrictlySorted!1133 (t!51849 l!548)))))

(assert (= (and d!167977 (not res!1082628)) b!1586036))

(assert (= (and b!1586036 res!1082629) b!1586037))

(declare-fun m!1455671 () Bool)

(assert (=> b!1586037 m!1455671))

(assert (=> start!138348 d!167977))

(declare-fun b!1586048 () Bool)

(declare-fun e!885478 () Bool)

(declare-fun tp!114977 () Bool)

(assert (=> b!1586048 (= e!885478 (and tp_is_empty!39391 tp!114977))))

(assert (=> b!1586001 (= tp!114968 e!885478)))

(assert (= (and b!1586001 ((_ is Cons!36939) (t!51849 l!548))) b!1586048))

(check-sat (not b!1586048) (not b!1586025) (not b!1586027) tp_is_empty!39391 (not b!1586037))
(check-sat)
