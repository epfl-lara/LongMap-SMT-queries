; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1984 () Bool)

(assert start!1984)

(declare-fun res!10518 () Bool)

(declare-fun e!7991 () Bool)

(assert (=> start!1984 (=> (not res!10518) (not e!7991))))

(declare-datatypes ((B!486 0))(
  ( (B!487 (val!341 Int)) )
))
(declare-datatypes ((tuple2!482 0))(
  ( (tuple2!483 (_1!241 (_ BitVec 64)) (_2!241 B!486)) )
))
(declare-datatypes ((List!396 0))(
  ( (Nil!393) (Cons!392 (h!958 tuple2!482) (t!2792 List!396)) )
))
(declare-fun l!522 () List!396)

(declare-fun isStrictlySorted!83 (List!396) Bool)

(assert (=> start!1984 (= res!10518 (isStrictlySorted!83 l!522))))

(assert (=> start!1984 e!7991))

(declare-fun e!7990 () Bool)

(assert (=> start!1984 e!7990))

(declare-fun tp_is_empty!665 () Bool)

(assert (=> start!1984 tp_is_empty!665))

(declare-fun b!13338 () Bool)

(declare-fun res!10519 () Bool)

(assert (=> b!13338 (=> (not res!10519) (not e!7991))))

(declare-fun value!159 () B!486)

(assert (=> b!13338 (= res!10519 (and (not (= (_2!241 (h!958 l!522)) value!159)) (is-Cons!392 l!522)))))

(declare-fun b!13339 () Bool)

(assert (=> b!13339 (= e!7991 (not (isStrictlySorted!83 (t!2792 l!522))))))

(declare-fun b!13340 () Bool)

(declare-fun tp!2174 () Bool)

(assert (=> b!13340 (= e!7990 (and tp_is_empty!665 tp!2174))))

(assert (= (and start!1984 res!10518) b!13338))

(assert (= (and b!13338 res!10519) b!13339))

(assert (= (and start!1984 (is-Cons!392 l!522)) b!13340))

(declare-fun m!9091 () Bool)

(assert (=> start!1984 m!9091))

(declare-fun m!9093 () Bool)

(assert (=> b!13339 m!9093))

(push 1)

(assert (not b!13339))

(assert (not start!1984))

(assert (not b!13340))

(assert tp_is_empty!665)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2003 () Bool)

(declare-fun res!10536 () Bool)

(declare-fun e!8008 () Bool)

(assert (=> d!2003 (=> res!10536 e!8008)))

(assert (=> d!2003 (= res!10536 (or (is-Nil!393 (t!2792 l!522)) (is-Nil!393 (t!2792 (t!2792 l!522)))))))

(assert (=> d!2003 (= (isStrictlySorted!83 (t!2792 l!522)) e!8008)))

(declare-fun b!13357 () Bool)

(declare-fun e!8009 () Bool)

(assert (=> b!13357 (= e!8008 e!8009)))

(declare-fun res!10537 () Bool)

(assert (=> b!13357 (=> (not res!10537) (not e!8009))))

(assert (=> b!13357 (= res!10537 (bvslt (_1!241 (h!958 (t!2792 l!522))) (_1!241 (h!958 (t!2792 (t!2792 l!522))))))))

(declare-fun b!13358 () Bool)

(assert (=> b!13358 (= e!8009 (isStrictlySorted!83 (t!2792 (t!2792 l!522))))))

(assert (= (and d!2003 (not res!10536)) b!13357))

(assert (= (and b!13357 res!10537) b!13358))

(declare-fun m!9097 () Bool)

(assert (=> b!13358 m!9097))

(assert (=> b!13339 d!2003))

(declare-fun d!2009 () Bool)

(declare-fun res!10542 () Bool)

(declare-fun e!8014 () Bool)

(assert (=> d!2009 (=> res!10542 e!8014)))

(assert (=> d!2009 (= res!10542 (or (is-Nil!393 l!522) (is-Nil!393 (t!2792 l!522))))))

(assert (=> d!2009 (= (isStrictlySorted!83 l!522) e!8014)))

(declare-fun b!13363 () Bool)

(declare-fun e!8015 () Bool)

(assert (=> b!13363 (= e!8014 e!8015)))

(declare-fun res!10543 () Bool)

(assert (=> b!13363 (=> (not res!10543) (not e!8015))))

(assert (=> b!13363 (= res!10543 (bvslt (_1!241 (h!958 l!522)) (_1!241 (h!958 (t!2792 l!522)))))))

(declare-fun b!13364 () Bool)

(assert (=> b!13364 (= e!8015 (isStrictlySorted!83 (t!2792 l!522)))))

(assert (= (and d!2009 (not res!10542)) b!13363))

(assert (= (and b!13363 res!10543) b!13364))

(assert (=> b!13364 m!9093))

(assert (=> start!1984 d!2009))

(declare-fun b!13379 () Bool)

(declare-fun e!8024 () Bool)

(declare-fun tp!2183 () Bool)

(assert (=> b!13379 (= e!8024 (and tp_is_empty!665 tp!2183))))

(assert (=> b!13340 (= tp!2174 e!8024)))

(assert (= (and b!13340 (is-Cons!392 (t!2792 l!522))) b!13379))

(push 1)

