; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2130 () Bool)

(assert start!2130)

(declare-fun res!11119 () Bool)

(declare-fun e!8583 () Bool)

(assert (=> start!2130 (=> (not res!11119) (not e!8583))))

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

(declare-fun isStrictlySorted!105 (List!420) Bool)

(assert (=> start!2130 (= res!11119 (isStrictlySorted!105 l!522))))

(assert (=> start!2130 e!8583))

(declare-fun e!8584 () Bool)

(assert (=> start!2130 e!8584))

(declare-fun tp_is_empty!721 () Bool)

(assert (=> start!2130 tp_is_empty!721))

(declare-fun b!14343 () Bool)

(declare-fun res!11120 () Bool)

(assert (=> b!14343 (=> (not res!11120) (not e!8583))))

(declare-fun value!159 () B!542)

(get-info :version)

(assert (=> b!14343 (= res!11120 (and (not (= (_2!267 (h!982 l!522)) value!159)) ((_ is Cons!416) l!522)))))

(declare-fun b!14344 () Bool)

(declare-fun ListPrimitiveSize!25 (List!420) Int)

(assert (=> b!14344 (= e!8583 (>= (ListPrimitiveSize!25 (t!2819 l!522)) (ListPrimitiveSize!25 l!522)))))

(declare-fun b!14345 () Bool)

(declare-fun tp!2324 () Bool)

(assert (=> b!14345 (= e!8584 (and tp_is_empty!721 tp!2324))))

(assert (= (and start!2130 res!11119) b!14343))

(assert (= (and b!14343 res!11120) b!14344))

(assert (= (and start!2130 ((_ is Cons!416) l!522)) b!14345))

(declare-fun m!9603 () Bool)

(assert (=> start!2130 m!9603))

(declare-fun m!9605 () Bool)

(assert (=> b!14344 m!9605))

(declare-fun m!9607 () Bool)

(assert (=> b!14344 m!9607))

(check-sat (not b!14344) (not start!2130) (not b!14345) tp_is_empty!721)
(check-sat)
(get-model)

(declare-fun d!2239 () Bool)

(declare-fun lt!3601 () Int)

(assert (=> d!2239 (>= lt!3601 0)))

(declare-fun e!8603 () Int)

(assert (=> d!2239 (= lt!3601 e!8603)))

(declare-fun c!1339 () Bool)

(assert (=> d!2239 (= c!1339 ((_ is Nil!417) (t!2819 l!522)))))

(assert (=> d!2239 (= (ListPrimitiveSize!25 (t!2819 l!522)) lt!3601)))

(declare-fun b!14376 () Bool)

(assert (=> b!14376 (= e!8603 0)))

(declare-fun b!14377 () Bool)

(assert (=> b!14377 (= e!8603 (+ 1 (ListPrimitiveSize!25 (t!2819 (t!2819 l!522)))))))

(assert (= (and d!2239 c!1339) b!14376))

(assert (= (and d!2239 (not c!1339)) b!14377))

(declare-fun m!9623 () Bool)

(assert (=> b!14377 m!9623))

(assert (=> b!14344 d!2239))

(declare-fun d!2245 () Bool)

(declare-fun lt!3602 () Int)

(assert (=> d!2245 (>= lt!3602 0)))

(declare-fun e!8606 () Int)

(assert (=> d!2245 (= lt!3602 e!8606)))

(declare-fun c!1340 () Bool)

(assert (=> d!2245 (= c!1340 ((_ is Nil!417) l!522))))

(assert (=> d!2245 (= (ListPrimitiveSize!25 l!522) lt!3602)))

(declare-fun b!14378 () Bool)

(assert (=> b!14378 (= e!8606 0)))

(declare-fun b!14379 () Bool)

(assert (=> b!14379 (= e!8606 (+ 1 (ListPrimitiveSize!25 (t!2819 l!522))))))

(assert (= (and d!2245 c!1340) b!14378))

(assert (= (and d!2245 (not c!1340)) b!14379))

(assert (=> b!14379 m!9605))

(assert (=> b!14344 d!2245))

(declare-fun d!2247 () Bool)

(declare-fun res!11143 () Bool)

(declare-fun e!8619 () Bool)

(assert (=> d!2247 (=> res!11143 e!8619)))

(assert (=> d!2247 (= res!11143 (or ((_ is Nil!417) l!522) ((_ is Nil!417) (t!2819 l!522))))))

(assert (=> d!2247 (= (isStrictlySorted!105 l!522) e!8619)))

(declare-fun b!14398 () Bool)

(declare-fun e!8620 () Bool)

(assert (=> b!14398 (= e!8619 e!8620)))

(declare-fun res!11144 () Bool)

(assert (=> b!14398 (=> (not res!11144) (not e!8620))))

(assert (=> b!14398 (= res!11144 (bvslt (_1!267 (h!982 l!522)) (_1!267 (h!982 (t!2819 l!522)))))))

(declare-fun b!14399 () Bool)

(assert (=> b!14399 (= e!8620 (isStrictlySorted!105 (t!2819 l!522)))))

(assert (= (and d!2247 (not res!11143)) b!14398))

(assert (= (and b!14398 res!11144) b!14399))

(declare-fun m!9627 () Bool)

(assert (=> b!14399 m!9627))

(assert (=> start!2130 d!2247))

(declare-fun b!14407 () Bool)

(declare-fun e!8625 () Bool)

(declare-fun tp!2336 () Bool)

(assert (=> b!14407 (= e!8625 (and tp_is_empty!721 tp!2336))))

(assert (=> b!14345 (= tp!2324 e!8625)))

(assert (= (and b!14345 ((_ is Cons!416) (t!2819 l!522))) b!14407))

(check-sat (not b!14399) (not b!14407) (not b!14379) tp_is_empty!721 (not b!14377))
(check-sat)
