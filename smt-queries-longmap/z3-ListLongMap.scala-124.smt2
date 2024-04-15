; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2130 () Bool)

(assert start!2130)

(declare-fun res!11122 () Bool)

(declare-fun e!8588 () Bool)

(assert (=> start!2130 (=> (not res!11122) (not e!8588))))

(declare-datatypes ((B!542 0))(
  ( (B!543 (val!369 Int)) )
))
(declare-datatypes ((tuple2!534 0))(
  ( (tuple2!535 (_1!267 (_ BitVec 64)) (_2!267 B!542)) )
))
(declare-datatypes ((List!420 0))(
  ( (Nil!417) (Cons!416 (h!982 tuple2!534) (t!2819 List!420)) )
))
(declare-fun l!522 () List!420)

(declare-fun isStrictlySorted!108 (List!420) Bool)

(assert (=> start!2130 (= res!11122 (isStrictlySorted!108 l!522))))

(assert (=> start!2130 e!8588))

(declare-fun e!8587 () Bool)

(assert (=> start!2130 e!8587))

(declare-fun tp_is_empty!721 () Bool)

(assert (=> start!2130 tp_is_empty!721))

(declare-fun b!14349 () Bool)

(declare-fun res!11121 () Bool)

(assert (=> b!14349 (=> (not res!11121) (not e!8588))))

(declare-fun value!159 () B!542)

(get-info :version)

(assert (=> b!14349 (= res!11121 (and (not (= (_2!267 (h!982 l!522)) value!159)) ((_ is Cons!416) l!522)))))

(declare-fun b!14350 () Bool)

(declare-fun ListPrimitiveSize!25 (List!420) Int)

(assert (=> b!14350 (= e!8588 (>= (ListPrimitiveSize!25 (t!2819 l!522)) (ListPrimitiveSize!25 l!522)))))

(declare-fun b!14351 () Bool)

(declare-fun tp!2324 () Bool)

(assert (=> b!14351 (= e!8587 (and tp_is_empty!721 tp!2324))))

(assert (= (and start!2130 res!11122) b!14349))

(assert (= (and b!14349 res!11121) b!14350))

(assert (= (and start!2130 ((_ is Cons!416) l!522)) b!14351))

(declare-fun m!9603 () Bool)

(assert (=> start!2130 m!9603))

(declare-fun m!9605 () Bool)

(assert (=> b!14350 m!9605))

(declare-fun m!9607 () Bool)

(assert (=> b!14350 m!9607))

(check-sat (not b!14350) (not start!2130) (not b!14351) tp_is_empty!721)
(check-sat)
(get-model)

(declare-fun d!2241 () Bool)

(declare-fun lt!3597 () Int)

(assert (=> d!2241 (>= lt!3597 0)))

(declare-fun e!8603 () Int)

(assert (=> d!2241 (= lt!3597 e!8603)))

(declare-fun c!1337 () Bool)

(assert (=> d!2241 (= c!1337 ((_ is Nil!417) (t!2819 l!522)))))

(assert (=> d!2241 (= (ListPrimitiveSize!25 (t!2819 l!522)) lt!3597)))

(declare-fun b!14374 () Bool)

(assert (=> b!14374 (= e!8603 0)))

(declare-fun b!14375 () Bool)

(assert (=> b!14375 (= e!8603 (+ 1 (ListPrimitiveSize!25 (t!2819 (t!2819 l!522)))))))

(assert (= (and d!2241 c!1337) b!14374))

(assert (= (and d!2241 (not c!1337)) b!14375))

(declare-fun m!9621 () Bool)

(assert (=> b!14375 m!9621))

(assert (=> b!14350 d!2241))

(declare-fun d!2245 () Bool)

(declare-fun lt!3598 () Int)

(assert (=> d!2245 (>= lt!3598 0)))

(declare-fun e!8604 () Int)

(assert (=> d!2245 (= lt!3598 e!8604)))

(declare-fun c!1338 () Bool)

(assert (=> d!2245 (= c!1338 ((_ is Nil!417) l!522))))

(assert (=> d!2245 (= (ListPrimitiveSize!25 l!522) lt!3598)))

(declare-fun b!14376 () Bool)

(assert (=> b!14376 (= e!8604 0)))

(declare-fun b!14377 () Bool)

(assert (=> b!14377 (= e!8604 (+ 1 (ListPrimitiveSize!25 (t!2819 l!522))))))

(assert (= (and d!2245 c!1338) b!14376))

(assert (= (and d!2245 (not c!1338)) b!14377))

(assert (=> b!14377 m!9605))

(assert (=> b!14350 d!2245))

(declare-fun d!2249 () Bool)

(declare-fun res!11139 () Bool)

(declare-fun e!8613 () Bool)

(assert (=> d!2249 (=> res!11139 e!8613)))

(assert (=> d!2249 (= res!11139 (or ((_ is Nil!417) l!522) ((_ is Nil!417) (t!2819 l!522))))))

(assert (=> d!2249 (= (isStrictlySorted!108 l!522) e!8613)))

(declare-fun b!14390 () Bool)

(declare-fun e!8614 () Bool)

(assert (=> b!14390 (= e!8613 e!8614)))

(declare-fun res!11140 () Bool)

(assert (=> b!14390 (=> (not res!11140) (not e!8614))))

(assert (=> b!14390 (= res!11140 (bvslt (_1!267 (h!982 l!522)) (_1!267 (h!982 (t!2819 l!522)))))))

(declare-fun b!14391 () Bool)

(assert (=> b!14391 (= e!8614 (isStrictlySorted!108 (t!2819 l!522)))))

(assert (= (and d!2249 (not res!11139)) b!14390))

(assert (= (and b!14390 res!11140) b!14391))

(declare-fun m!9623 () Bool)

(assert (=> b!14391 m!9623))

(assert (=> start!2130 d!2249))

(declare-fun b!14404 () Bool)

(declare-fun e!8621 () Bool)

(declare-fun tp!2333 () Bool)

(assert (=> b!14404 (= e!8621 (and tp_is_empty!721 tp!2333))))

(assert (=> b!14351 (= tp!2324 e!8621)))

(assert (= (and b!14351 ((_ is Cons!416) (t!2819 l!522))) b!14404))

(check-sat (not b!14377) tp_is_empty!721 (not b!14391) (not b!14375) (not b!14404))
(check-sat)
