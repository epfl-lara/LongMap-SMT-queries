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

(declare-fun e!6126 () Bool)

(declare-fun tp_is_empty!511 () Bool)

(declare-fun tp!1570 () Bool)

(assert (=> b!10552 (= e!6126 (and tp_is_empty!511 tp!1570))))

(declare-fun b!10553 () Bool)

(declare-fun e!6128 () Bool)

(declare-fun tp!1569 () Bool)

(assert (=> b!10553 (= e!6128 tp!1569)))

(declare-fun res!8960 () Bool)

(declare-fun e!6127 () Bool)

(assert (=> start!1278 (=> (not res!8960) (not e!6127))))

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

(assert (=> start!1278 (= res!8960 (forall!38 (toList!168 lm!227) p!216))))

(assert (=> start!1278 e!6127))

(declare-fun inv!494 (ListLongMap!305) Bool)

(assert (=> start!1278 (and (inv!494 lm!227) e!6128)))

(assert (=> start!1278 tp!1571))

(assert (=> start!1278 e!6126))

(declare-fun b!10554 () Bool)

(declare-fun kvs!4 () List!312)

(assert (=> b!10554 (= e!6127 (= kvs!4 Nil!309))))

(declare-fun b!10555 () Bool)

(declare-fun res!8961 () Bool)

(assert (=> b!10555 (=> (not res!8961) (not e!6127))))

(assert (=> b!10555 (= res!8961 (forall!38 kvs!4 p!216))))

(declare-fun b!10556 () Bool)

(declare-fun res!8962 () Bool)

(assert (=> b!10556 (=> (not res!8962) (not e!6127))))

(declare-fun isEmpty!48 (List!312) Bool)

(assert (=> b!10556 (= res!8962 (not (isEmpty!48 kvs!4)))))

(assert (= (and start!1278 res!8960) b!10555))

(assert (= (and b!10555 res!8961) b!10556))

(assert (= (and b!10556 res!8962) b!10554))

(assert (= start!1278 b!10553))

(get-info :version)

(assert (= (and start!1278 ((_ is Cons!308) kvs!4)) b!10552))

(declare-fun m!6793 () Bool)

(assert (=> start!1278 m!6793))

(declare-fun m!6795 () Bool)

(assert (=> start!1278 m!6795))

(declare-fun m!6797 () Bool)

(assert (=> b!10555 m!6797))

(declare-fun m!6799 () Bool)

(assert (=> b!10556 m!6799))

(check-sat (not b!10555) b_and!567 (not b!10552) (not b_next!397) (not b!10553) tp_is_empty!511 (not b!10556) (not start!1278))
(check-sat b_and!567 (not b_next!397))
(get-model)

(declare-fun d!1139 () Bool)

(declare-fun res!8985 () Bool)

(declare-fun e!6151 () Bool)

(assert (=> d!1139 (=> res!8985 e!6151)))

(assert (=> d!1139 (= res!8985 ((_ is Nil!309) (toList!168 lm!227)))))

(assert (=> d!1139 (= (forall!38 (toList!168 lm!227) p!216) e!6151)))

(declare-fun b!10591 () Bool)

(declare-fun e!6152 () Bool)

(assert (=> b!10591 (= e!6151 e!6152)))

(declare-fun res!8986 () Bool)

(assert (=> b!10591 (=> (not res!8986) (not e!6152))))

(declare-fun dynLambda!52 (Int tuple2!324) Bool)

(assert (=> b!10591 (= res!8986 (dynLambda!52 p!216 (h!874 (toList!168 lm!227))))))

(declare-fun b!10592 () Bool)

(assert (=> b!10592 (= e!6152 (forall!38 (t!2471 (toList!168 lm!227)) p!216))))

(assert (= (and d!1139 (not res!8985)) b!10591))

(assert (= (and b!10591 res!8986) b!10592))

(declare-fun b_lambda!383 () Bool)

(assert (=> (not b_lambda!383) (not b!10591)))

(declare-fun t!2475 () Bool)

(declare-fun tb!159 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2475) tb!159))

(declare-fun result!291 () Bool)

(assert (=> tb!159 (= result!291 true)))

(assert (=> b!10591 t!2475))

(declare-fun b_and!573 () Bool)

(assert (= b_and!567 (and (=> t!2475 result!291) b_and!573)))

(declare-fun m!6817 () Bool)

(assert (=> b!10591 m!6817))

(declare-fun m!6819 () Bool)

(assert (=> b!10592 m!6819))

(assert (=> start!1278 d!1139))

(declare-fun d!1141 () Bool)

(declare-fun isStrictlySorted!26 (List!312) Bool)

(assert (=> d!1141 (= (inv!494 lm!227) (isStrictlySorted!26 (toList!168 lm!227)))))

(declare-fun bs!390 () Bool)

(assert (= bs!390 d!1141))

(declare-fun m!6821 () Bool)

(assert (=> bs!390 m!6821))

(assert (=> start!1278 d!1141))

(declare-fun d!1147 () Bool)

(declare-fun res!8987 () Bool)

(declare-fun e!6153 () Bool)

(assert (=> d!1147 (=> res!8987 e!6153)))

(assert (=> d!1147 (= res!8987 ((_ is Nil!309) kvs!4))))

(assert (=> d!1147 (= (forall!38 kvs!4 p!216) e!6153)))

(declare-fun b!10593 () Bool)

(declare-fun e!6154 () Bool)

(assert (=> b!10593 (= e!6153 e!6154)))

(declare-fun res!8988 () Bool)

(assert (=> b!10593 (=> (not res!8988) (not e!6154))))

(assert (=> b!10593 (= res!8988 (dynLambda!52 p!216 (h!874 kvs!4)))))

(declare-fun b!10594 () Bool)

(assert (=> b!10594 (= e!6154 (forall!38 (t!2471 kvs!4) p!216))))

(assert (= (and d!1147 (not res!8987)) b!10593))

(assert (= (and b!10593 res!8988) b!10594))

(declare-fun b_lambda!385 () Bool)

(assert (=> (not b_lambda!385) (not b!10593)))

(declare-fun t!2477 () Bool)

(declare-fun tb!161 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2477) tb!161))

(declare-fun result!293 () Bool)

(assert (=> tb!161 (= result!293 true)))

(assert (=> b!10593 t!2477))

(declare-fun b_and!575 () Bool)

(assert (= b_and!573 (and (=> t!2477 result!293) b_and!575)))

(declare-fun m!6823 () Bool)

(assert (=> b!10593 m!6823))

(declare-fun m!6825 () Bool)

(assert (=> b!10594 m!6825))

(assert (=> b!10555 d!1147))

(declare-fun d!1151 () Bool)

(assert (=> d!1151 (= (isEmpty!48 kvs!4) ((_ is Nil!309) kvs!4))))

(assert (=> b!10556 d!1151))

(declare-fun b!10607 () Bool)

(declare-fun e!6165 () Bool)

(declare-fun tp!1592 () Bool)

(assert (=> b!10607 (= e!6165 (and tp_is_empty!511 tp!1592))))

(assert (=> b!10553 (= tp!1569 e!6165)))

(assert (= (and b!10553 ((_ is Cons!308) (toList!168 lm!227))) b!10607))

(declare-fun b!10608 () Bool)

(declare-fun e!6166 () Bool)

(declare-fun tp!1593 () Bool)

(assert (=> b!10608 (= e!6166 (and tp_is_empty!511 tp!1593))))

(assert (=> b!10552 (= tp!1570 e!6166)))

(assert (= (and b!10552 ((_ is Cons!308) (t!2471 kvs!4))) b!10608))

(declare-fun b_lambda!387 () Bool)

(assert (= b_lambda!383 (or (and start!1278 b_free!397) b_lambda!387)))

(declare-fun b_lambda!389 () Bool)

(assert (= b_lambda!385 (or (and start!1278 b_free!397) b_lambda!389)))

(check-sat (not b!10608) (not b_lambda!389) (not b_lambda!387) (not b!10592) tp_is_empty!511 (not b!10607) b_and!575 (not d!1141) (not b_next!397) (not b!10594))
(check-sat b_and!575 (not b_next!397))
