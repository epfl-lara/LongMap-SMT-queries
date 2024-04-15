; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1278 () Bool)

(assert start!1278)

(declare-fun b_free!397 () Bool)

(declare-fun b_next!397 () Bool)

(assert (=> start!1278 (= b_free!397 (not b_next!397))))

(declare-fun tp!1571 () Bool)

(declare-fun b_and!567 () Bool)

(assert (=> start!1278 (= tp!1571 b_and!567)))

(declare-fun b!10552 () Bool)

(declare-fun e!6127 () Bool)

(declare-fun tp!1569 () Bool)

(assert (=> b!10552 (= e!6127 tp!1569)))

(declare-fun res!8961 () Bool)

(declare-fun e!6126 () Bool)

(assert (=> start!1278 (=> (not res!8961) (not e!6126))))

(declare-datatypes ((B!338 0))(
  ( (B!339 (val!264 Int)) )
))
(declare-datatypes ((tuple2!324 0))(
  ( (tuple2!325 (_1!162 (_ BitVec 64)) (_2!162 B!338)) )
))
(declare-datatypes ((List!312 0))(
  ( (Nil!309) (Cons!308 (h!874 tuple2!324) (t!2471 List!312)) )
))
(declare-datatypes ((ListLongMap!305 0))(
  ( (ListLongMap!306 (toList!168 List!312)) )
))
(declare-fun lm!227 () ListLongMap!305)

(declare-fun p!216 () Int)

(declare-fun forall!38 (List!312 Int) Bool)

(assert (=> start!1278 (= res!8961 (forall!38 (toList!168 lm!227) p!216))))

(assert (=> start!1278 e!6126))

(declare-fun inv!494 (ListLongMap!305) Bool)

(assert (=> start!1278 (and (inv!494 lm!227) e!6127)))

(assert (=> start!1278 tp!1571))

(declare-fun e!6128 () Bool)

(assert (=> start!1278 e!6128))

(declare-fun b!10553 () Bool)

(declare-fun res!8960 () Bool)

(assert (=> b!10553 (=> (not res!8960) (not e!6126))))

(declare-fun kvs!4 () List!312)

(assert (=> b!10553 (= res!8960 (forall!38 kvs!4 p!216))))

(declare-fun b!10554 () Bool)

(assert (=> b!10554 (= e!6126 (= kvs!4 Nil!309))))

(declare-fun b!10555 () Bool)

(declare-fun tp_is_empty!511 () Bool)

(declare-fun tp!1570 () Bool)

(assert (=> b!10555 (= e!6128 (and tp_is_empty!511 tp!1570))))

(declare-fun b!10556 () Bool)

(declare-fun res!8962 () Bool)

(assert (=> b!10556 (=> (not res!8962) (not e!6126))))

(declare-fun isEmpty!48 (List!312) Bool)

(assert (=> b!10556 (= res!8962 (not (isEmpty!48 kvs!4)))))

(assert (= (and start!1278 res!8961) b!10553))

(assert (= (and b!10553 res!8960) b!10556))

(assert (= (and b!10556 res!8962) b!10554))

(assert (= start!1278 b!10552))

(get-info :version)

(assert (= (and start!1278 ((_ is Cons!308) kvs!4)) b!10555))

(declare-fun m!6797 () Bool)

(assert (=> start!1278 m!6797))

(declare-fun m!6799 () Bool)

(assert (=> start!1278 m!6799))

(declare-fun m!6801 () Bool)

(assert (=> b!10553 m!6801))

(declare-fun m!6803 () Bool)

(assert (=> b!10556 m!6803))

(check-sat (not b!10556) (not b!10555) tp_is_empty!511 b_and!567 (not b!10553) (not start!1278) (not b_next!397) (not b!10552))
(check-sat b_and!567 (not b_next!397))
(get-model)

(declare-fun d!1143 () Bool)

(assert (=> d!1143 (= (isEmpty!48 kvs!4) ((_ is Nil!309) kvs!4))))

(assert (=> b!10556 d!1143))

(declare-fun d!1145 () Bool)

(declare-fun res!8997 () Bool)

(declare-fun e!6163 () Bool)

(assert (=> d!1145 (=> res!8997 e!6163)))

(assert (=> d!1145 (= res!8997 ((_ is Nil!309) (toList!168 lm!227)))))

(assert (=> d!1145 (= (forall!38 (toList!168 lm!227) p!216) e!6163)))

(declare-fun b!10603 () Bool)

(declare-fun e!6164 () Bool)

(assert (=> b!10603 (= e!6163 e!6164)))

(declare-fun res!8998 () Bool)

(assert (=> b!10603 (=> (not res!8998) (not e!6164))))

(declare-fun dynLambda!53 (Int tuple2!324) Bool)

(assert (=> b!10603 (= res!8998 (dynLambda!53 p!216 (h!874 (toList!168 lm!227))))))

(declare-fun b!10604 () Bool)

(assert (=> b!10604 (= e!6164 (forall!38 (t!2471 (toList!168 lm!227)) p!216))))

(assert (= (and d!1145 (not res!8997)) b!10603))

(assert (= (and b!10603 res!8998) b!10604))

(declare-fun b_lambda!387 () Bool)

(assert (=> (not b_lambda!387) (not b!10603)))

(declare-fun t!2479 () Bool)

(declare-fun tb!163 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2479) tb!163))

(declare-fun result!295 () Bool)

(assert (=> tb!163 (= result!295 true)))

(assert (=> b!10603 t!2479))

(declare-fun b_and!577 () Bool)

(assert (= b_and!567 (and (=> t!2479 result!295) b_and!577)))

(declare-fun m!6829 () Bool)

(assert (=> b!10603 m!6829))

(declare-fun m!6831 () Bool)

(assert (=> b!10604 m!6831))

(assert (=> start!1278 d!1145))

(declare-fun d!1151 () Bool)

(declare-fun isStrictlySorted!27 (List!312) Bool)

(assert (=> d!1151 (= (inv!494 lm!227) (isStrictlySorted!27 (toList!168 lm!227)))))

(declare-fun bs!392 () Bool)

(assert (= bs!392 d!1151))

(declare-fun m!6837 () Bool)

(assert (=> bs!392 m!6837))

(assert (=> start!1278 d!1151))

(declare-fun d!1157 () Bool)

(declare-fun res!9003 () Bool)

(declare-fun e!6169 () Bool)

(assert (=> d!1157 (=> res!9003 e!6169)))

(assert (=> d!1157 (= res!9003 ((_ is Nil!309) kvs!4))))

(assert (=> d!1157 (= (forall!38 kvs!4 p!216) e!6169)))

(declare-fun b!10609 () Bool)

(declare-fun e!6170 () Bool)

(assert (=> b!10609 (= e!6169 e!6170)))

(declare-fun res!9004 () Bool)

(assert (=> b!10609 (=> (not res!9004) (not e!6170))))

(assert (=> b!10609 (= res!9004 (dynLambda!53 p!216 (h!874 kvs!4)))))

(declare-fun b!10610 () Bool)

(assert (=> b!10610 (= e!6170 (forall!38 (t!2471 kvs!4) p!216))))

(assert (= (and d!1157 (not res!9003)) b!10609))

(assert (= (and b!10609 res!9004) b!10610))

(declare-fun b_lambda!393 () Bool)

(assert (=> (not b_lambda!393) (not b!10609)))

(declare-fun t!2485 () Bool)

(declare-fun tb!169 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2485) tb!169))

(declare-fun result!301 () Bool)

(assert (=> tb!169 (= result!301 true)))

(assert (=> b!10609 t!2485))

(declare-fun b_and!583 () Bool)

(assert (= b_and!577 (and (=> t!2485 result!301) b_and!583)))

(declare-fun m!6847 () Bool)

(assert (=> b!10609 m!6847))

(declare-fun m!6849 () Bool)

(assert (=> b!10610 m!6849))

(assert (=> b!10553 d!1157))

(declare-fun b!10624 () Bool)

(declare-fun e!6178 () Bool)

(declare-fun tp!1597 () Bool)

(assert (=> b!10624 (= e!6178 (and tp_is_empty!511 tp!1597))))

(assert (=> b!10555 (= tp!1570 e!6178)))

(assert (= (and b!10555 ((_ is Cons!308) (t!2471 kvs!4))) b!10624))

(declare-fun b!10627 () Bool)

(declare-fun e!6181 () Bool)

(declare-fun tp!1600 () Bool)

(assert (=> b!10627 (= e!6181 (and tp_is_empty!511 tp!1600))))

(assert (=> b!10552 (= tp!1569 e!6181)))

(assert (= (and b!10552 ((_ is Cons!308) (toList!168 lm!227))) b!10627))

(declare-fun b_lambda!397 () Bool)

(assert (= b_lambda!393 (or (and start!1278 b_free!397) b_lambda!397)))

(declare-fun b_lambda!403 () Bool)

(assert (= b_lambda!387 (or (and start!1278 b_free!397) b_lambda!403)))

(check-sat (not b!10627) (not b_lambda!397) (not b!10624) (not b!10610) tp_is_empty!511 (not b!10604) (not b_lambda!403) (not d!1151) (not b_next!397) b_and!583)
(check-sat b_and!583 (not b_next!397))
