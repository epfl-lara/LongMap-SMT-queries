; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1400 () Bool)

(assert start!1400)

(declare-fun b_free!429 () Bool)

(declare-fun b_next!429 () Bool)

(assert (=> start!1400 (= b_free!429 (not b_next!429))))

(declare-fun tp!1749 () Bool)

(declare-fun b_and!659 () Bool)

(assert (=> start!1400 (= tp!1749 b_and!659)))

(declare-fun b!10974 () Bool)

(declare-fun e!6429 () Bool)

(declare-datatypes ((B!370 0))(
  ( (B!371 (val!280 Int)) )
))
(declare-datatypes ((tuple2!360 0))(
  ( (tuple2!361 (_1!180 (_ BitVec 64)) (_2!180 B!370)) )
))
(declare-datatypes ((List!332 0))(
  ( (Nil!329) (Cons!328 (h!894 tuple2!360) (t!2551 List!332)) )
))
(declare-fun kvs!4 () List!332)

(declare-fun ListPrimitiveSize!8 (List!332) Int)

(assert (=> b!10974 (= e!6429 (< (ListPrimitiveSize!8 kvs!4) 0))))

(declare-fun b!10973 () Bool)

(declare-fun res!9226 () Bool)

(assert (=> b!10973 (=> (not res!9226) (not e!6429))))

(declare-fun p!216 () Int)

(declare-fun forall!51 (List!332 Int) Bool)

(assert (=> b!10973 (= res!9226 (forall!51 kvs!4 p!216))))

(declare-fun res!9225 () Bool)

(assert (=> start!1400 (=> (not res!9225) (not e!6429))))

(declare-datatypes ((ListLongMap!341 0))(
  ( (ListLongMap!342 (toList!186 List!332)) )
))
(declare-fun lm!227 () ListLongMap!341)

(assert (=> start!1400 (= res!9225 (forall!51 (toList!186 lm!227) p!216))))

(assert (=> start!1400 e!6429))

(declare-fun e!6430 () Bool)

(declare-fun inv!535 (ListLongMap!341) Bool)

(assert (=> start!1400 (and (inv!535 lm!227) e!6430)))

(assert (=> start!1400 tp!1749))

(declare-fun e!6431 () Bool)

(assert (=> start!1400 e!6431))

(declare-fun b!10975 () Bool)

(declare-fun tp!1750 () Bool)

(assert (=> b!10975 (= e!6430 tp!1750)))

(declare-fun b!10976 () Bool)

(declare-fun tp_is_empty!543 () Bool)

(declare-fun tp!1751 () Bool)

(assert (=> b!10976 (= e!6431 (and tp_is_empty!543 tp!1751))))

(assert (= (and start!1400 res!9225) b!10973))

(assert (= (and b!10973 res!9226) b!10974))

(assert (= start!1400 b!10975))

(get-info :version)

(assert (= (and start!1400 ((_ is Cons!328) kvs!4)) b!10976))

(declare-fun m!7243 () Bool)

(assert (=> b!10974 m!7243))

(declare-fun m!7245 () Bool)

(assert (=> b!10973 m!7245))

(declare-fun m!7247 () Bool)

(assert (=> start!1400 m!7247))

(declare-fun m!7249 () Bool)

(assert (=> start!1400 m!7249))

(check-sat (not start!1400) b_and!659 (not b_next!429) (not b!10975) (not b!10973) (not b!10974) tp_is_empty!543 (not b!10976))
(check-sat b_and!659 (not b_next!429))
(get-model)

(declare-fun d!1279 () Bool)

(declare-fun lt!2754 () Int)

(assert (=> d!1279 (>= lt!2754 0)))

(declare-fun e!6455 () Int)

(assert (=> d!1279 (= lt!2754 e!6455)))

(declare-fun c!947 () Bool)

(assert (=> d!1279 (= c!947 ((_ is Nil!329) kvs!4))))

(assert (=> d!1279 (= (ListPrimitiveSize!8 kvs!4) lt!2754)))

(declare-fun b!11005 () Bool)

(assert (=> b!11005 (= e!6455 0)))

(declare-fun b!11006 () Bool)

(assert (=> b!11006 (= e!6455 (+ 1 (ListPrimitiveSize!8 (t!2551 kvs!4))))))

(assert (= (and d!1279 c!947) b!11005))

(assert (= (and d!1279 (not c!947)) b!11006))

(declare-fun m!7267 () Bool)

(assert (=> b!11006 m!7267))

(assert (=> b!10974 d!1279))

(declare-fun d!1285 () Bool)

(declare-fun res!9249 () Bool)

(declare-fun e!6466 () Bool)

(assert (=> d!1285 (=> res!9249 e!6466)))

(assert (=> d!1285 (= res!9249 ((_ is Nil!329) (toList!186 lm!227)))))

(assert (=> d!1285 (= (forall!51 (toList!186 lm!227) p!216) e!6466)))

(declare-fun b!11023 () Bool)

(declare-fun e!6467 () Bool)

(assert (=> b!11023 (= e!6466 e!6467)))

(declare-fun res!9250 () Bool)

(assert (=> b!11023 (=> (not res!9250) (not e!6467))))

(declare-fun dynLambda!63 (Int tuple2!360) Bool)

(assert (=> b!11023 (= res!9250 (dynLambda!63 p!216 (h!894 (toList!186 lm!227))))))

(declare-fun b!11024 () Bool)

(assert (=> b!11024 (= e!6467 (forall!51 (t!2551 (toList!186 lm!227)) p!216))))

(assert (= (and d!1285 (not res!9249)) b!11023))

(assert (= (and b!11023 res!9250) b!11024))

(declare-fun b_lambda!507 () Bool)

(assert (=> (not b_lambda!507) (not b!11023)))

(declare-fun t!2558 () Bool)

(declare-fun tb!223 () Bool)

(assert (=> (and start!1400 (= p!216 p!216) t!2558) tb!223))

(declare-fun result!373 () Bool)

(assert (=> tb!223 (= result!373 true)))

(assert (=> b!11023 t!2558))

(declare-fun b_and!667 () Bool)

(assert (= b_and!659 (and (=> t!2558 result!373) b_and!667)))

(declare-fun m!7273 () Bool)

(assert (=> b!11023 m!7273))

(declare-fun m!7275 () Bool)

(assert (=> b!11024 m!7275))

(assert (=> start!1400 d!1285))

(declare-fun d!1291 () Bool)

(declare-fun isStrictlySorted!34 (List!332) Bool)

(assert (=> d!1291 (= (inv!535 lm!227) (isStrictlySorted!34 (toList!186 lm!227)))))

(declare-fun bs!414 () Bool)

(assert (= bs!414 d!1291))

(declare-fun m!7285 () Bool)

(assert (=> bs!414 m!7285))

(assert (=> start!1400 d!1291))

(declare-fun d!1297 () Bool)

(declare-fun res!9255 () Bool)

(declare-fun e!6472 () Bool)

(assert (=> d!1297 (=> res!9255 e!6472)))

(assert (=> d!1297 (= res!9255 ((_ is Nil!329) kvs!4))))

(assert (=> d!1297 (= (forall!51 kvs!4 p!216) e!6472)))

(declare-fun b!11029 () Bool)

(declare-fun e!6473 () Bool)

(assert (=> b!11029 (= e!6472 e!6473)))

(declare-fun res!9256 () Bool)

(assert (=> b!11029 (=> (not res!9256) (not e!6473))))

(assert (=> b!11029 (= res!9256 (dynLambda!63 p!216 (h!894 kvs!4)))))

(declare-fun b!11030 () Bool)

(assert (=> b!11030 (= e!6473 (forall!51 (t!2551 kvs!4) p!216))))

(assert (= (and d!1297 (not res!9255)) b!11029))

(assert (= (and b!11029 res!9256) b!11030))

(declare-fun b_lambda!513 () Bool)

(assert (=> (not b_lambda!513) (not b!11029)))

(declare-fun t!2564 () Bool)

(declare-fun tb!229 () Bool)

(assert (=> (and start!1400 (= p!216 p!216) t!2564) tb!229))

(declare-fun result!383 () Bool)

(assert (=> tb!229 (= result!383 true)))

(assert (=> b!11029 t!2564))

(declare-fun b_and!673 () Bool)

(assert (= b_and!667 (and (=> t!2564 result!383) b_and!673)))

(declare-fun m!7291 () Bool)

(assert (=> b!11029 m!7291))

(declare-fun m!7293 () Bool)

(assert (=> b!11030 m!7293))

(assert (=> b!10973 d!1297))

(declare-fun b!11047 () Bool)

(declare-fun e!6484 () Bool)

(declare-fun tp!1771 () Bool)

(assert (=> b!11047 (= e!6484 (and tp_is_empty!543 tp!1771))))

(assert (=> b!10975 (= tp!1750 e!6484)))

(assert (= (and b!10975 ((_ is Cons!328) (toList!186 lm!227))) b!11047))

(declare-fun b!11048 () Bool)

(declare-fun e!6485 () Bool)

(declare-fun tp!1772 () Bool)

(assert (=> b!11048 (= e!6485 (and tp_is_empty!543 tp!1772))))

(assert (=> b!10976 (= tp!1751 e!6485)))

(assert (= (and b!10976 ((_ is Cons!328) (t!2551 kvs!4))) b!11048))

(declare-fun b_lambda!523 () Bool)

(assert (= b_lambda!513 (or (and start!1400 b_free!429) b_lambda!523)))

(declare-fun b_lambda!525 () Bool)

(assert (= b_lambda!507 (or (and start!1400 b_free!429) b_lambda!525)))

(check-sat (not b_lambda!525) (not b!11024) (not b_next!429) (not b!11006) b_and!673 (not b!11048) (not b_lambda!523) (not b!11030) tp_is_empty!543 (not d!1291) (not b!11047))
(check-sat b_and!673 (not b_next!429))
