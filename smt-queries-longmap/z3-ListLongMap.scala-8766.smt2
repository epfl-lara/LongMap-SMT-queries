; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106704 () Bool)

(assert start!106704)

(declare-fun b!1267124 () Bool)

(declare-fun res!843329 () Bool)

(declare-fun e!721761 () Bool)

(assert (=> b!1267124 (=> (not res!843329) (not e!721761))))

(declare-datatypes ((B!1988 0))(
  ( (B!1989 (val!16329 Int)) )
))
(declare-datatypes ((tuple2!21186 0))(
  ( (tuple2!21187 (_1!10604 (_ BitVec 64)) (_2!10604 B!1988)) )
))
(declare-datatypes ((List!28357 0))(
  ( (Nil!28354) (Cons!28353 (h!29571 tuple2!21186) (t!41870 List!28357)) )
))
(declare-fun l!706 () List!28357)

(get-info :version)

(assert (=> b!1267124 (= res!843329 ((_ is Cons!28353) l!706))))

(declare-fun res!843330 () Bool)

(assert (=> start!106704 (=> (not res!843330) (not e!721761))))

(declare-fun isStrictlySorted!784 (List!28357) Bool)

(assert (=> start!106704 (= res!843330 (isStrictlySorted!784 l!706))))

(assert (=> start!106704 e!721761))

(declare-fun e!721760 () Bool)

(assert (=> start!106704 e!721760))

(assert (=> start!106704 true))

(declare-fun b!1267125 () Bool)

(declare-fun tp_is_empty!32521 () Bool)

(declare-fun tp!96392 () Bool)

(assert (=> b!1267125 (= e!721760 (and tp_is_empty!32521 tp!96392))))

(declare-fun b!1267126 () Bool)

(declare-fun res!843331 () Bool)

(assert (=> b!1267126 (=> (not res!843331) (not e!721761))))

(assert (=> b!1267126 (= res!843331 (isStrictlySorted!784 (t!41870 l!706)))))

(declare-fun b!1267127 () Bool)

(declare-fun res!843332 () Bool)

(assert (=> b!1267127 (=> (not res!843332) (not e!721761))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!655 (List!28357 (_ BitVec 64)) Bool)

(assert (=> b!1267127 (= res!843332 (not (containsKey!655 l!706 key1!31)))))

(declare-fun b!1267128 () Bool)

(declare-fun ListPrimitiveSize!154 (List!28357) Int)

(assert (=> b!1267128 (= e!721761 (>= (ListPrimitiveSize!154 (t!41870 l!706)) (ListPrimitiveSize!154 l!706)))))

(declare-fun b!1267129 () Bool)

(declare-fun res!843328 () Bool)

(assert (=> b!1267129 (=> (not res!843328) (not e!721761))))

(assert (=> b!1267129 (= res!843328 (not (containsKey!655 (t!41870 l!706) key1!31)))))

(assert (= (and start!106704 res!843330) b!1267127))

(assert (= (and b!1267127 res!843332) b!1267124))

(assert (= (and b!1267124 res!843329) b!1267126))

(assert (= (and b!1267126 res!843331) b!1267129))

(assert (= (and b!1267129 res!843328) b!1267128))

(assert (= (and start!106704 ((_ is Cons!28353) l!706)) b!1267125))

(declare-fun m!1167361 () Bool)

(assert (=> b!1267129 m!1167361))

(declare-fun m!1167363 () Bool)

(assert (=> start!106704 m!1167363))

(declare-fun m!1167365 () Bool)

(assert (=> b!1267127 m!1167365))

(declare-fun m!1167367 () Bool)

(assert (=> b!1267126 m!1167367))

(declare-fun m!1167369 () Bool)

(assert (=> b!1267128 m!1167369))

(declare-fun m!1167371 () Bool)

(assert (=> b!1267128 m!1167371))

(check-sat tp_is_empty!32521 (not b!1267127) (not start!106704) (not b!1267125) (not b!1267128) (not b!1267129) (not b!1267126))
(check-sat)
(get-model)

(declare-fun d!139441 () Bool)

(declare-fun res!843375 () Bool)

(declare-fun e!721786 () Bool)

(assert (=> d!139441 (=> res!843375 e!721786)))

(assert (=> d!139441 (= res!843375 (or ((_ is Nil!28354) (t!41870 l!706)) ((_ is Nil!28354) (t!41870 (t!41870 l!706)))))))

(assert (=> d!139441 (= (isStrictlySorted!784 (t!41870 l!706)) e!721786)))

(declare-fun b!1267176 () Bool)

(declare-fun e!721787 () Bool)

(assert (=> b!1267176 (= e!721786 e!721787)))

(declare-fun res!843376 () Bool)

(assert (=> b!1267176 (=> (not res!843376) (not e!721787))))

(assert (=> b!1267176 (= res!843376 (bvslt (_1!10604 (h!29571 (t!41870 l!706))) (_1!10604 (h!29571 (t!41870 (t!41870 l!706))))))))

(declare-fun b!1267177 () Bool)

(assert (=> b!1267177 (= e!721787 (isStrictlySorted!784 (t!41870 (t!41870 l!706))))))

(assert (= (and d!139441 (not res!843375)) b!1267176))

(assert (= (and b!1267176 res!843376) b!1267177))

(declare-fun m!1167397 () Bool)

(assert (=> b!1267177 m!1167397))

(assert (=> b!1267126 d!139441))

(declare-fun d!139447 () Bool)

(declare-fun res!843379 () Bool)

(declare-fun e!721790 () Bool)

(assert (=> d!139447 (=> res!843379 e!721790)))

(assert (=> d!139447 (= res!843379 (or ((_ is Nil!28354) l!706) ((_ is Nil!28354) (t!41870 l!706))))))

(assert (=> d!139447 (= (isStrictlySorted!784 l!706) e!721790)))

(declare-fun b!1267182 () Bool)

(declare-fun e!721791 () Bool)

(assert (=> b!1267182 (= e!721790 e!721791)))

(declare-fun res!843380 () Bool)

(assert (=> b!1267182 (=> (not res!843380) (not e!721791))))

(assert (=> b!1267182 (= res!843380 (bvslt (_1!10604 (h!29571 l!706)) (_1!10604 (h!29571 (t!41870 l!706)))))))

(declare-fun b!1267183 () Bool)

(assert (=> b!1267183 (= e!721791 (isStrictlySorted!784 (t!41870 l!706)))))

(assert (= (and d!139447 (not res!843379)) b!1267182))

(assert (= (and b!1267182 res!843380) b!1267183))

(assert (=> b!1267183 m!1167367))

(assert (=> start!106704 d!139447))

(declare-fun d!139451 () Bool)

(declare-fun res!843391 () Bool)

(declare-fun e!721806 () Bool)

(assert (=> d!139451 (=> res!843391 e!721806)))

(assert (=> d!139451 (= res!843391 (and ((_ is Cons!28353) l!706) (= (_1!10604 (h!29571 l!706)) key1!31)))))

(assert (=> d!139451 (= (containsKey!655 l!706 key1!31) e!721806)))

(declare-fun b!1267202 () Bool)

(declare-fun e!721807 () Bool)

(assert (=> b!1267202 (= e!721806 e!721807)))

(declare-fun res!843392 () Bool)

(assert (=> b!1267202 (=> (not res!843392) (not e!721807))))

(assert (=> b!1267202 (= res!843392 (and (or (not ((_ is Cons!28353) l!706)) (bvsle (_1!10604 (h!29571 l!706)) key1!31)) ((_ is Cons!28353) l!706) (bvslt (_1!10604 (h!29571 l!706)) key1!31)))))

(declare-fun b!1267203 () Bool)

(assert (=> b!1267203 (= e!721807 (containsKey!655 (t!41870 l!706) key1!31))))

(assert (= (and d!139451 (not res!843391)) b!1267202))

(assert (= (and b!1267202 res!843392) b!1267203))

(assert (=> b!1267203 m!1167361))

(assert (=> b!1267127 d!139451))

(declare-fun d!139459 () Bool)

(declare-fun res!843395 () Bool)

(declare-fun e!721810 () Bool)

(assert (=> d!139459 (=> res!843395 e!721810)))

(assert (=> d!139459 (= res!843395 (and ((_ is Cons!28353) (t!41870 l!706)) (= (_1!10604 (h!29571 (t!41870 l!706))) key1!31)))))

(assert (=> d!139459 (= (containsKey!655 (t!41870 l!706) key1!31) e!721810)))

(declare-fun b!1267206 () Bool)

(declare-fun e!721811 () Bool)

(assert (=> b!1267206 (= e!721810 e!721811)))

(declare-fun res!843396 () Bool)

(assert (=> b!1267206 (=> (not res!843396) (not e!721811))))

(assert (=> b!1267206 (= res!843396 (and (or (not ((_ is Cons!28353) (t!41870 l!706))) (bvsle (_1!10604 (h!29571 (t!41870 l!706))) key1!31)) ((_ is Cons!28353) (t!41870 l!706)) (bvslt (_1!10604 (h!29571 (t!41870 l!706))) key1!31)))))

(declare-fun b!1267207 () Bool)

(assert (=> b!1267207 (= e!721811 (containsKey!655 (t!41870 (t!41870 l!706)) key1!31))))

(assert (= (and d!139459 (not res!843395)) b!1267206))

(assert (= (and b!1267206 res!843396) b!1267207))

(declare-fun m!1167401 () Bool)

(assert (=> b!1267207 m!1167401))

(assert (=> b!1267129 d!139459))

(declare-fun d!139463 () Bool)

(declare-fun lt!574553 () Int)

(assert (=> d!139463 (>= lt!574553 0)))

(declare-fun e!721823 () Int)

(assert (=> d!139463 (= lt!574553 e!721823)))

(declare-fun c!123738 () Bool)

(assert (=> d!139463 (= c!123738 ((_ is Nil!28354) (t!41870 l!706)))))

(assert (=> d!139463 (= (ListPrimitiveSize!154 (t!41870 l!706)) lt!574553)))

(declare-fun b!1267224 () Bool)

(assert (=> b!1267224 (= e!721823 0)))

(declare-fun b!1267225 () Bool)

(assert (=> b!1267225 (= e!721823 (+ 1 (ListPrimitiveSize!154 (t!41870 (t!41870 l!706)))))))

(assert (= (and d!139463 c!123738) b!1267224))

(assert (= (and d!139463 (not c!123738)) b!1267225))

(declare-fun m!1167405 () Bool)

(assert (=> b!1267225 m!1167405))

(assert (=> b!1267128 d!139463))

(declare-fun d!139467 () Bool)

(declare-fun lt!574555 () Int)

(assert (=> d!139467 (>= lt!574555 0)))

(declare-fun e!721825 () Int)

(assert (=> d!139467 (= lt!574555 e!721825)))

(declare-fun c!123740 () Bool)

(assert (=> d!139467 (= c!123740 ((_ is Nil!28354) l!706))))

(assert (=> d!139467 (= (ListPrimitiveSize!154 l!706) lt!574555)))

(declare-fun b!1267228 () Bool)

(assert (=> b!1267228 (= e!721825 0)))

(declare-fun b!1267229 () Bool)

(assert (=> b!1267229 (= e!721825 (+ 1 (ListPrimitiveSize!154 (t!41870 l!706))))))

(assert (= (and d!139467 c!123740) b!1267228))

(assert (= (and d!139467 (not c!123740)) b!1267229))

(assert (=> b!1267229 m!1167369))

(assert (=> b!1267128 d!139467))

(declare-fun b!1267242 () Bool)

(declare-fun e!721836 () Bool)

(declare-fun tp!96401 () Bool)

(assert (=> b!1267242 (= e!721836 (and tp_is_empty!32521 tp!96401))))

(assert (=> b!1267125 (= tp!96392 e!721836)))

(assert (= (and b!1267125 ((_ is Cons!28353) (t!41870 l!706))) b!1267242))

(check-sat tp_is_empty!32521 (not b!1267225) (not b!1267229) (not b!1267183) (not b!1267207) (not b!1267203) (not b!1267177) (not b!1267242))
(check-sat)
