; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1278 () Bool)

(assert start!1278)

(declare-fun b_free!397 () Bool)

(declare-fun b_next!397 () Bool)

(assert (=> start!1278 (= b_free!397 (not b_next!397))))

(declare-fun tp!1570 () Bool)

(declare-fun b_and!567 () Bool)

(assert (=> start!1278 (= tp!1570 b_and!567)))

(declare-fun res!8962 () Bool)

(declare-fun e!6126 () Bool)

(assert (=> start!1278 (=> (not res!8962) (not e!6126))))

(declare-datatypes ((B!338 0))(
  ( (B!339 (val!264 Int)) )
))
(declare-datatypes ((tuple2!328 0))(
  ( (tuple2!329 (_1!164 (_ BitVec 64)) (_2!164 B!338)) )
))
(declare-datatypes ((List!316 0))(
  ( (Nil!313) (Cons!312 (h!878 tuple2!328) (t!2475 List!316)) )
))
(declare-datatypes ((ListLongMap!309 0))(
  ( (ListLongMap!310 (toList!170 List!316)) )
))
(declare-fun lm!227 () ListLongMap!309)

(declare-fun p!216 () Int)

(declare-fun forall!38 (List!316 Int) Bool)

(assert (=> start!1278 (= res!8962 (forall!38 (toList!170 lm!227) p!216))))

(assert (=> start!1278 e!6126))

(declare-fun e!6128 () Bool)

(declare-fun inv!494 (ListLongMap!309) Bool)

(assert (=> start!1278 (and (inv!494 lm!227) e!6128)))

(assert (=> start!1278 tp!1570))

(declare-fun e!6127 () Bool)

(assert (=> start!1278 e!6127))

(declare-fun b!10552 () Bool)

(declare-fun tp!1571 () Bool)

(assert (=> b!10552 (= e!6128 tp!1571)))

(declare-fun b!10553 () Bool)

(declare-fun kvs!4 () List!316)

(assert (=> b!10553 (= e!6126 (= kvs!4 Nil!313))))

(declare-fun b!10554 () Bool)

(declare-fun tp_is_empty!511 () Bool)

(declare-fun tp!1569 () Bool)

(assert (=> b!10554 (= e!6127 (and tp_is_empty!511 tp!1569))))

(declare-fun b!10555 () Bool)

(declare-fun res!8961 () Bool)

(assert (=> b!10555 (=> (not res!8961) (not e!6126))))

(assert (=> b!10555 (= res!8961 (forall!38 kvs!4 p!216))))

(declare-fun b!10556 () Bool)

(declare-fun res!8960 () Bool)

(assert (=> b!10556 (=> (not res!8960) (not e!6126))))

(declare-fun isEmpty!48 (List!316) Bool)

(assert (=> b!10556 (= res!8960 (not (isEmpty!48 kvs!4)))))

(assert (= (and start!1278 res!8962) b!10555))

(assert (= (and b!10555 res!8961) b!10556))

(assert (= (and b!10556 res!8960) b!10553))

(assert (= start!1278 b!10552))

(assert (= (and start!1278 (is-Cons!312 kvs!4)) b!10554))

(declare-fun m!6797 () Bool)

(assert (=> start!1278 m!6797))

(declare-fun m!6799 () Bool)

(assert (=> start!1278 m!6799))

(declare-fun m!6801 () Bool)

(assert (=> b!10555 m!6801))

(declare-fun m!6803 () Bool)

(assert (=> b!10556 m!6803))

(push 1)

(assert (not b_next!397))

(assert (not b!10555))

(assert (not b!10556))

(assert b_and!567)

(assert tp_is_empty!511)

(assert (not b!10552))

(assert (not start!1278))

(assert (not b!10554))

(check-sat)

(pop 1)

(push 1)

(assert b_and!567)

(assert (not b_next!397))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1139 () Bool)

(declare-fun res!8985 () Bool)

(declare-fun e!6151 () Bool)

(assert (=> d!1139 (=> res!8985 e!6151)))

(assert (=> d!1139 (= res!8985 (is-Nil!313 kvs!4))))

(assert (=> d!1139 (= (forall!38 kvs!4 p!216) e!6151)))

(declare-fun b!10591 () Bool)

(declare-fun e!6152 () Bool)

(assert (=> b!10591 (= e!6151 e!6152)))

(declare-fun res!8986 () Bool)

(assert (=> b!10591 (=> (not res!8986) (not e!6152))))

(declare-fun dynLambda!52 (Int tuple2!328) Bool)

(assert (=> b!10591 (= res!8986 (dynLambda!52 p!216 (h!878 kvs!4)))))

(declare-fun b!10592 () Bool)

(assert (=> b!10592 (= e!6152 (forall!38 (t!2475 kvs!4) p!216))))

(assert (= (and d!1139 (not res!8985)) b!10591))

(assert (= (and b!10591 res!8986) b!10592))

(declare-fun b_lambda!383 () Bool)

(assert (=> (not b_lambda!383) (not b!10591)))

(declare-fun t!2479 () Bool)

(declare-fun tb!159 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2479) tb!159))

(declare-fun result!291 () Bool)

(assert (=> tb!159 (= result!291 true)))

(assert (=> b!10591 t!2479))

(declare-fun b_and!573 () Bool)

(assert (= b_and!567 (and (=> t!2479 result!291) b_and!573)))

(declare-fun m!6821 () Bool)

(assert (=> b!10591 m!6821))

(declare-fun m!6823 () Bool)

(assert (=> b!10592 m!6823))

(assert (=> b!10555 d!1139))

(declare-fun d!1147 () Bool)

(assert (=> d!1147 (= (isEmpty!48 kvs!4) (is-Nil!313 kvs!4))))

(assert (=> b!10556 d!1147))

(declare-fun d!1149 () Bool)

(declare-fun res!8989 () Bool)

(declare-fun e!6155 () Bool)

(assert (=> d!1149 (=> res!8989 e!6155)))

(assert (=> d!1149 (= res!8989 (is-Nil!313 (toList!170 lm!227)))))

(assert (=> d!1149 (= (forall!38 (toList!170 lm!227) p!216) e!6155)))

(declare-fun b!10593 () Bool)

(declare-fun e!6156 () Bool)

(assert (=> b!10593 (= e!6155 e!6156)))

(declare-fun res!8990 () Bool)

(assert (=> b!10593 (=> (not res!8990) (not e!6156))))

(assert (=> b!10593 (= res!8990 (dynLambda!52 p!216 (h!878 (toList!170 lm!227))))))

(declare-fun b!10594 () Bool)

(assert (=> b!10594 (= e!6156 (forall!38 (t!2475 (toList!170 lm!227)) p!216))))

(assert (= (and d!1149 (not res!8989)) b!10593))

(assert (= (and b!10593 res!8990) b!10594))

(declare-fun b_lambda!385 () Bool)

(assert (=> (not b_lambda!385) (not b!10593)))

(declare-fun t!2481 () Bool)

(declare-fun tb!161 () Bool)

(assert (=> (and start!1278 (= p!216 p!216) t!2481) tb!161))

(declare-fun result!293 () Bool)

(assert (=> tb!161 (= result!293 true)))

(assert (=> b!10593 t!2481))

(declare-fun b_and!575 () Bool)

(assert (= b_and!573 (and (=> t!2481 result!293) b_and!575)))

(declare-fun m!6825 () Bool)

(assert (=> b!10593 m!6825))

(declare-fun m!6827 () Bool)

(assert (=> b!10594 m!6827))

(assert (=> start!1278 d!1149))

(declare-fun d!1151 () Bool)

(declare-fun isStrictlySorted!27 (List!316) Bool)

(assert (=> d!1151 (= (inv!494 lm!227) (isStrictlySorted!27 (toList!170 lm!227)))))

(declare-fun bs!390 () Bool)

(assert (= bs!390 d!1151))

(declare-fun m!6829 () Bool)

(assert (=> bs!390 m!6829))

(assert (=> start!1278 d!1151))

(declare-fun b!10613 () Bool)

(declare-fun e!6171 () Bool)

(declare-fun tp!1592 () Bool)

(assert (=> b!10613 (= e!6171 (and tp_is_empty!511 tp!1592))))

(assert (=> b!10552 (= tp!1571 e!6171)))

(assert (= (and b!10552 (is-Cons!312 (toList!170 lm!227))) b!10613))

(declare-fun b!10614 () Bool)

(declare-fun e!6172 () Bool)

(declare-fun tp!1593 () Bool)

(assert (=> b!10614 (= e!6172 (and tp_is_empty!511 tp!1593))))

(assert (=> b!10554 (= tp!1569 e!6172)))

(assert (= (and b!10554 (is-Cons!312 (t!2475 kvs!4))) b!10614))

(declare-fun b_lambda!393 () Bool)

(assert (= b_lambda!385 (or (and start!1278 b_free!397) b_lambda!393)))

(declare-fun b_lambda!395 () Bool)

(assert (= b_lambda!383 (or (and start!1278 b_free!397) b_lambda!395)))

(push 1)

(assert (not b!10613))

(assert (not b!10614))

(assert (not b_lambda!395))

(assert (not b_lambda!393))

(assert (not b!10592))

(assert tp_is_empty!511)

(assert b_and!575)

(assert (not d!1151))

(assert (not b!10594))

(assert (not b_next!397))

(check-sat)

(pop 1)

(push 1)

(assert b_and!575)

(assert (not b_next!397))

(check-sat)

(pop 1)

