; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12044 () Bool)

(assert start!12044)

(declare-fun b!101408 () Bool)

(declare-fun b_free!2461 () Bool)

(declare-fun b_next!2461 () Bool)

(assert (=> b!101408 (= b_free!2461 (not b_next!2461))))

(declare-fun tp!9690 () Bool)

(declare-fun b_and!6241 () Bool)

(assert (=> b!101408 (= tp!9690 b_and!6241)))

(declare-fun b!101403 () Bool)

(declare-fun b_free!2463 () Bool)

(declare-fun b_next!2463 () Bool)

(assert (=> b!101403 (= b_free!2463 (not b_next!2463))))

(declare-fun tp!9687 () Bool)

(declare-fun b_and!6243 () Bool)

(assert (=> b!101403 (= tp!9687 b_and!6243)))

(declare-fun b!101399 () Bool)

(declare-fun e!66017 () Bool)

(declare-fun e!66007 () Bool)

(declare-fun mapRes!3816 () Bool)

(assert (=> b!101399 (= e!66017 (and e!66007 mapRes!3816))))

(declare-fun condMapEmpty!3816 () Bool)

(declare-datatypes ((V!3177 0))(
  ( (V!3178 (val!1368 Int)) )
))
(declare-datatypes ((array!4265 0))(
  ( (array!4266 (arr!2024 (Array (_ BitVec 32) (_ BitVec 64))) (size!2277 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!980 0))(
  ( (ValueCellFull!980 (v!2844 V!3177)) (EmptyCell!980) )
))
(declare-datatypes ((array!4267 0))(
  ( (array!4268 (arr!2025 (Array (_ BitVec 32) ValueCell!980)) (size!2278 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!868 0))(
  ( (LongMapFixedSize!869 (defaultEntry!2535 Int) (mask!6658 (_ BitVec 32)) (extraKeys!2346 (_ BitVec 32)) (zeroValue!2413 V!3177) (minValue!2413 V!3177) (_size!483 (_ BitVec 32)) (_keys!4235 array!4265) (_values!2518 array!4267) (_vacant!483 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!868)

(declare-fun mapDefault!3816 () ValueCell!980)

(assert (=> b!101399 (= condMapEmpty!3816 (= (arr!2025 (_values!2518 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3816)))))

(declare-fun b!101400 () Bool)

(declare-fun e!66006 () Bool)

(declare-fun tp_is_empty!2647 () Bool)

(assert (=> b!101400 (= e!66006 tp_is_empty!2647)))

(declare-fun mapIsEmpty!3815 () Bool)

(assert (=> mapIsEmpty!3815 mapRes!3816))

(declare-fun mapIsEmpty!3816 () Bool)

(declare-fun mapRes!3815 () Bool)

(assert (=> mapIsEmpty!3816 mapRes!3815))

(declare-fun b!101401 () Bool)

(declare-datatypes ((Unit!3077 0))(
  ( (Unit!3078) )
))
(declare-fun e!66020 () Unit!3077)

(declare-fun Unit!3079 () Unit!3077)

(assert (=> b!101401 (= e!66020 Unit!3079)))

(declare-fun lt!51425 () Unit!3077)

(declare-datatypes ((Cell!672 0))(
  ( (Cell!673 (v!2845 LongMapFixedSize!868)) )
))
(declare-datatypes ((LongMap!672 0))(
  ( (LongMap!673 (underlying!347 Cell!672)) )
))
(declare-fun thiss!992 () LongMap!672)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!91 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3077)

(assert (=> b!101401 (= lt!51425 (lemmaListMapContainsThenArrayContainsFrom!91 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!101401 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51423 () Unit!3077)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4265 (_ BitVec 32) (_ BitVec 32)) Unit!3077)

(assert (=> b!101401 (= lt!51423 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1575 0))(
  ( (Nil!1572) (Cons!1571 (h!2167 (_ BitVec 64)) (t!5577 List!1575)) )
))
(declare-fun arrayNoDuplicates!0 (array!4265 (_ BitVec 32) List!1575) Bool)

(assert (=> b!101401 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) from!355 Nil!1572)))

(declare-fun lt!51426 () Unit!3077)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4265 (_ BitVec 32) (_ BitVec 64) List!1575) Unit!3077)

(assert (=> b!101401 (= lt!51426 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572)))))

(assert (=> b!101401 false))

(declare-fun e!66015 () Bool)

(declare-fun array_inv!1245 (array!4265) Bool)

(declare-fun array_inv!1246 (array!4267) Bool)

(assert (=> b!101403 (= e!66015 (and tp!9687 tp_is_empty!2647 (array_inv!1245 (_keys!4235 newMap!16)) (array_inv!1246 (_values!2518 newMap!16)) e!66017))))

(declare-fun b!101404 () Bool)

(declare-fun e!66009 () Bool)

(assert (=> b!101404 (= e!66009 tp_is_empty!2647)))

(declare-fun b!101405 () Bool)

(declare-fun e!66011 () Bool)

(declare-fun e!66016 () Bool)

(assert (=> b!101405 (= e!66011 e!66016)))

(declare-fun b!101406 () Bool)

(declare-fun e!66014 () Bool)

(assert (=> b!101406 (= e!66014 tp_is_empty!2647)))

(declare-fun b!101407 () Bool)

(declare-fun Unit!3080 () Unit!3077)

(assert (=> b!101407 (= e!66020 Unit!3080)))

(declare-fun e!66013 () Bool)

(declare-fun e!66012 () Bool)

(assert (=> b!101408 (= e!66013 (and tp!9690 tp_is_empty!2647 (array_inv!1245 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (array_inv!1246 (_values!2518 (v!2845 (underlying!347 thiss!992)))) e!66012))))

(declare-fun b!101409 () Bool)

(declare-fun e!66018 () Bool)

(assert (=> b!101409 (= e!66018 (not (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 Nil!1572)))))

(declare-fun b!101410 () Bool)

(declare-fun e!66008 () Bool)

(assert (=> b!101410 (= e!66008 e!66018)))

(declare-fun res!50799 () Bool)

(assert (=> b!101410 (=> (not res!50799) (not e!66018))))

(declare-datatypes ((tuple2!2322 0))(
  ( (tuple2!2323 (_1!1172 Bool) (_2!1172 LongMapFixedSize!868)) )
))
(declare-fun lt!51427 () tuple2!2322)

(assert (=> b!101410 (= res!50799 (and (_1!1172 lt!51427) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!51428 () Unit!3077)

(assert (=> b!101410 (= lt!51428 e!66020)))

(declare-datatypes ((tuple2!2324 0))(
  ( (tuple2!2325 (_1!1173 (_ BitVec 64)) (_2!1173 V!3177)) )
))
(declare-datatypes ((List!1576 0))(
  ( (Nil!1573) (Cons!1572 (h!2168 tuple2!2324) (t!5578 List!1576)) )
))
(declare-datatypes ((ListLongMap!1511 0))(
  ( (ListLongMap!1512 (toList!771 List!1576)) )
))
(declare-fun lt!51422 () ListLongMap!1511)

(declare-fun c!17450 () Bool)

(declare-fun contains!800 (ListLongMap!1511 (_ BitVec 64)) Bool)

(assert (=> b!101410 (= c!17450 (contains!800 lt!51422 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun update!151 (LongMapFixedSize!868 (_ BitVec 64) V!3177) tuple2!2322)

(declare-fun get!1309 (ValueCell!980 V!3177) V!3177)

(declare-fun dynLambda!376 (Int (_ BitVec 64)) V!3177)

(assert (=> b!101410 (= lt!51427 (update!151 newMap!16 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101411 () Bool)

(assert (=> b!101411 (= e!66016 e!66013)))

(declare-fun b!101412 () Bool)

(declare-fun res!50804 () Bool)

(declare-fun e!66005 () Bool)

(assert (=> b!101412 (=> (not res!50804) (not e!66005))))

(declare-fun valid!403 (LongMapFixedSize!868) Bool)

(assert (=> b!101412 (= res!50804 (valid!403 newMap!16))))

(declare-fun b!101413 () Bool)

(assert (=> b!101413 (= e!66012 (and e!66006 mapRes!3815))))

(declare-fun condMapEmpty!3815 () Bool)

(declare-fun mapDefault!3815 () ValueCell!980)

(assert (=> b!101413 (= condMapEmpty!3815 (= (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3815)))))

(declare-fun b!101414 () Bool)

(declare-fun res!50800 () Bool)

(assert (=> b!101414 (=> (not res!50800) (not e!66005))))

(assert (=> b!101414 (= res!50800 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun b!101415 () Bool)

(assert (=> b!101415 (= e!66005 e!66008)))

(declare-fun res!50801 () Bool)

(assert (=> b!101415 (=> (not res!50801) (not e!66008))))

(declare-fun lt!51424 () ListLongMap!1511)

(assert (=> b!101415 (= res!50801 (and (= lt!51424 lt!51422) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1263 (LongMapFixedSize!868) ListLongMap!1511)

(assert (=> b!101415 (= lt!51422 (map!1263 newMap!16))))

(declare-fun getCurrentListMap!459 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) ListLongMap!1511)

(assert (=> b!101415 (= lt!51424 (getCurrentListMap!459 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101416 () Bool)

(declare-fun res!50797 () Bool)

(assert (=> b!101416 (=> (not res!50797) (not e!66018))))

(assert (=> b!101416 (= res!50797 (and (= (size!2278 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6658 (v!2845 (underlying!347 thiss!992))))) (= (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (size!2278 (_values!2518 (v!2845 (underlying!347 thiss!992))))) (bvsge (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!101417 () Bool)

(declare-fun res!50803 () Bool)

(assert (=> b!101417 (=> (not res!50803) (not e!66005))))

(assert (=> b!101417 (= res!50803 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6658 newMap!16)) (_size!483 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun res!50805 () Bool)

(assert (=> start!12044 (=> (not res!50805) (not e!66005))))

(declare-fun valid!404 (LongMap!672) Bool)

(assert (=> start!12044 (= res!50805 (valid!404 thiss!992))))

(assert (=> start!12044 e!66005))

(assert (=> start!12044 e!66011))

(assert (=> start!12044 true))

(assert (=> start!12044 e!66015))

(declare-fun b!101402 () Bool)

(declare-fun res!50802 () Bool)

(assert (=> b!101402 (=> (not res!50802) (not e!66018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4265 (_ BitVec 32)) Bool)

(assert (=> b!101402 (= res!50802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101418 () Bool)

(declare-fun res!50798 () Bool)

(assert (=> b!101418 (=> (not res!50798) (not e!66018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!101418 (= res!50798 (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun mapNonEmpty!3815 () Bool)

(declare-fun tp!9688 () Bool)

(assert (=> mapNonEmpty!3815 (= mapRes!3815 (and tp!9688 e!66009))))

(declare-fun mapValue!3815 () ValueCell!980)

(declare-fun mapRest!3816 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapKey!3815 () (_ BitVec 32))

(assert (=> mapNonEmpty!3815 (= (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (store mapRest!3816 mapKey!3815 mapValue!3815))))

(declare-fun b!101419 () Bool)

(assert (=> b!101419 (= e!66007 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3816 () Bool)

(declare-fun tp!9689 () Bool)

(assert (=> mapNonEmpty!3816 (= mapRes!3816 (and tp!9689 e!66014))))

(declare-fun mapKey!3816 () (_ BitVec 32))

(declare-fun mapRest!3815 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapValue!3816 () ValueCell!980)

(assert (=> mapNonEmpty!3816 (= (arr!2025 (_values!2518 newMap!16)) (store mapRest!3815 mapKey!3816 mapValue!3816))))

(assert (= (and start!12044 res!50805) b!101414))

(assert (= (and b!101414 res!50800) b!101412))

(assert (= (and b!101412 res!50804) b!101417))

(assert (= (and b!101417 res!50803) b!101415))

(assert (= (and b!101415 res!50801) b!101410))

(assert (= (and b!101410 c!17450) b!101401))

(assert (= (and b!101410 (not c!17450)) b!101407))

(assert (= (and b!101410 res!50799) b!101418))

(assert (= (and b!101418 res!50798) b!101416))

(assert (= (and b!101416 res!50797) b!101402))

(assert (= (and b!101402 res!50802) b!101409))

(assert (= (and b!101413 condMapEmpty!3815) mapIsEmpty!3816))

(assert (= (and b!101413 (not condMapEmpty!3815)) mapNonEmpty!3815))

(get-info :version)

(assert (= (and mapNonEmpty!3815 ((_ is ValueCellFull!980) mapValue!3815)) b!101404))

(assert (= (and b!101413 ((_ is ValueCellFull!980) mapDefault!3815)) b!101400))

(assert (= b!101408 b!101413))

(assert (= b!101411 b!101408))

(assert (= b!101405 b!101411))

(assert (= start!12044 b!101405))

(assert (= (and b!101399 condMapEmpty!3816) mapIsEmpty!3815))

(assert (= (and b!101399 (not condMapEmpty!3816)) mapNonEmpty!3816))

(assert (= (and mapNonEmpty!3816 ((_ is ValueCellFull!980) mapValue!3816)) b!101406))

(assert (= (and b!101399 ((_ is ValueCellFull!980) mapDefault!3816)) b!101419))

(assert (= b!101403 b!101399))

(assert (= start!12044 b!101403))

(declare-fun b_lambda!4549 () Bool)

(assert (=> (not b_lambda!4549) (not b!101410)))

(declare-fun t!5574 () Bool)

(declare-fun tb!1969 () Bool)

(assert (=> (and b!101408 (= (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) t!5574) tb!1969))

(declare-fun result!3331 () Bool)

(assert (=> tb!1969 (= result!3331 tp_is_empty!2647)))

(assert (=> b!101410 t!5574))

(declare-fun b_and!6245 () Bool)

(assert (= b_and!6241 (and (=> t!5574 result!3331) b_and!6245)))

(declare-fun tb!1971 () Bool)

(declare-fun t!5576 () Bool)

(assert (=> (and b!101403 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) t!5576) tb!1971))

(declare-fun result!3335 () Bool)

(assert (= result!3335 result!3331))

(assert (=> b!101410 t!5576))

(declare-fun b_and!6247 () Bool)

(assert (= b_and!6243 (and (=> t!5576 result!3335) b_and!6247)))

(declare-fun m!112337 () Bool)

(assert (=> b!101415 m!112337))

(declare-fun m!112339 () Bool)

(assert (=> b!101415 m!112339))

(declare-fun m!112341 () Bool)

(assert (=> b!101415 m!112341))

(declare-fun m!112343 () Bool)

(assert (=> b!101403 m!112343))

(declare-fun m!112345 () Bool)

(assert (=> b!101403 m!112345))

(declare-fun m!112347 () Bool)

(assert (=> start!12044 m!112347))

(declare-fun m!112349 () Bool)

(assert (=> b!101410 m!112349))

(declare-fun m!112351 () Bool)

(assert (=> b!101410 m!112351))

(declare-fun m!112353 () Bool)

(assert (=> b!101410 m!112353))

(assert (=> b!101410 m!112351))

(assert (=> b!101410 m!112337))

(assert (=> b!101410 m!112353))

(declare-fun m!112355 () Bool)

(assert (=> b!101410 m!112355))

(assert (=> b!101410 m!112349))

(assert (=> b!101410 m!112337))

(assert (=> b!101410 m!112337))

(declare-fun m!112357 () Bool)

(assert (=> b!101410 m!112357))

(declare-fun m!112359 () Bool)

(assert (=> b!101401 m!112359))

(declare-fun m!112361 () Bool)

(assert (=> b!101401 m!112361))

(assert (=> b!101401 m!112337))

(declare-fun m!112363 () Bool)

(assert (=> b!101401 m!112363))

(assert (=> b!101401 m!112337))

(assert (=> b!101401 m!112337))

(declare-fun m!112365 () Bool)

(assert (=> b!101401 m!112365))

(assert (=> b!101401 m!112337))

(declare-fun m!112367 () Bool)

(assert (=> b!101401 m!112367))

(declare-fun m!112369 () Bool)

(assert (=> mapNonEmpty!3815 m!112369))

(declare-fun m!112371 () Bool)

(assert (=> mapNonEmpty!3816 m!112371))

(declare-fun m!112373 () Bool)

(assert (=> b!101412 m!112373))

(declare-fun m!112375 () Bool)

(assert (=> b!101402 m!112375))

(declare-fun m!112377 () Bool)

(assert (=> b!101409 m!112377))

(declare-fun m!112379 () Bool)

(assert (=> b!101408 m!112379))

(declare-fun m!112381 () Bool)

(assert (=> b!101408 m!112381))

(declare-fun m!112383 () Bool)

(assert (=> b!101418 m!112383))

(check-sat (not b_next!2463) (not b_lambda!4549) (not b!101401) (not b!101410) (not b!101403) (not b!101408) (not mapNonEmpty!3815) b_and!6245 (not b!101412) tp_is_empty!2647 (not b_next!2461) (not b!101415) (not mapNonEmpty!3816) b_and!6247 (not start!12044) (not b!101418) (not b!101409) (not b!101402))
(check-sat b_and!6245 b_and!6247 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun b_lambda!4555 () Bool)

(assert (= b_lambda!4549 (or (and b!101408 b_free!2461) (and b!101403 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))))) b_lambda!4555)))

(check-sat (not b!101401) (not b!101410) (not b!101403) (not b!101408) (not mapNonEmpty!3815) b_and!6245 (not b!101412) tp_is_empty!2647 (not b_next!2461) (not b!101415) (not mapNonEmpty!3816) (not b_next!2463) (not b_lambda!4555) b_and!6247 (not start!12044) (not b!101418) (not b!101409) (not b!101402))
(check-sat b_and!6245 b_and!6247 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun d!27519 () Bool)

(declare-fun e!66122 () Bool)

(assert (=> d!27519 e!66122))

(declare-fun res!50862 () Bool)

(assert (=> d!27519 (=> res!50862 e!66122)))

(declare-fun lt!51481 () Bool)

(assert (=> d!27519 (= res!50862 (not lt!51481))))

(declare-fun lt!51479 () Bool)

(assert (=> d!27519 (= lt!51481 lt!51479)))

(declare-fun lt!51482 () Unit!3077)

(declare-fun e!66121 () Unit!3077)

(assert (=> d!27519 (= lt!51482 e!66121)))

(declare-fun c!17459 () Bool)

(assert (=> d!27519 (= c!17459 lt!51479)))

(declare-fun containsKey!157 (List!1576 (_ BitVec 64)) Bool)

(assert (=> d!27519 (= lt!51479 (containsKey!157 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27519 (= (contains!800 lt!51422 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) lt!51481)))

(declare-fun b!101558 () Bool)

(declare-fun lt!51480 () Unit!3077)

(assert (=> b!101558 (= e!66121 lt!51480)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!105 (List!1576 (_ BitVec 64)) Unit!3077)

(assert (=> b!101558 (= lt!51480 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-datatypes ((Option!160 0))(
  ( (Some!159 (v!2851 V!3177)) (None!158) )
))
(declare-fun isDefined!106 (Option!160) Bool)

(declare-fun getValueByKey!154 (List!1576 (_ BitVec 64)) Option!160)

(assert (=> b!101558 (isDefined!106 (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101559 () Bool)

(declare-fun Unit!3084 () Unit!3077)

(assert (=> b!101559 (= e!66121 Unit!3084)))

(declare-fun b!101560 () Bool)

(assert (=> b!101560 (= e!66122 (isDefined!106 (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (= (and d!27519 c!17459) b!101558))

(assert (= (and d!27519 (not c!17459)) b!101559))

(assert (= (and d!27519 (not res!50862)) b!101560))

(assert (=> d!27519 m!112337))

(declare-fun m!112481 () Bool)

(assert (=> d!27519 m!112481))

(assert (=> b!101558 m!112337))

(declare-fun m!112483 () Bool)

(assert (=> b!101558 m!112483))

(assert (=> b!101558 m!112337))

(declare-fun m!112485 () Bool)

(assert (=> b!101558 m!112485))

(assert (=> b!101558 m!112485))

(declare-fun m!112487 () Bool)

(assert (=> b!101558 m!112487))

(assert (=> b!101560 m!112337))

(assert (=> b!101560 m!112485))

(assert (=> b!101560 m!112485))

(assert (=> b!101560 m!112487))

(assert (=> b!101410 d!27519))

(declare-fun bm!10543 () Bool)

(declare-fun call!10560 () ListLongMap!1511)

(assert (=> bm!10543 (= call!10560 (map!1263 newMap!16))))

(declare-fun b!101642 () Bool)

(declare-fun e!66180 () ListLongMap!1511)

(declare-fun call!10546 () ListLongMap!1511)

(assert (=> b!101642 (= e!66180 call!10546)))

(declare-datatypes ((SeekEntryResult!250 0))(
  ( (MissingZero!250 (index!3146 (_ BitVec 32))) (Found!250 (index!3147 (_ BitVec 32))) (Intermediate!250 (undefined!1062 Bool) (index!3148 (_ BitVec 32)) (x!13333 (_ BitVec 32))) (Undefined!250) (MissingVacant!250 (index!3149 (_ BitVec 32))) )
))
(declare-fun lt!51554 () SeekEntryResult!250)

(declare-fun b!101643 () Bool)

(declare-fun e!66168 () Bool)

(assert (=> b!101643 (= e!66168 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51554)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun bm!10544 () Bool)

(declare-fun call!10563 () SeekEntryResult!250)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4265 (_ BitVec 32)) SeekEntryResult!250)

(assert (=> bm!10544 (= call!10563 (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun bm!10545 () Bool)

(declare-fun call!10554 () ListLongMap!1511)

(assert (=> bm!10545 (= call!10546 call!10554)))

(declare-fun bm!10546 () Bool)

(declare-fun call!10557 () SeekEntryResult!250)

(assert (=> bm!10546 (= call!10557 call!10563)))

(declare-fun e!66181 () Bool)

(declare-fun b!101644 () Bool)

(declare-fun lt!51558 () SeekEntryResult!250)

(assert (=> b!101644 (= e!66181 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51558)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101645 () Bool)

(declare-fun e!66173 () tuple2!2322)

(declare-fun e!66182 () tuple2!2322)

(assert (=> b!101645 (= e!66173 e!66182)))

(declare-fun lt!51552 () SeekEntryResult!250)

(assert (=> b!101645 (= lt!51552 (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun c!17490 () Bool)

(assert (=> b!101645 (= c!17490 ((_ is Undefined!250) lt!51552))))

(declare-fun b!101646 () Bool)

(declare-fun e!66174 () Unit!3077)

(declare-fun lt!51539 () Unit!3077)

(assert (=> b!101646 (= e!66174 lt!51539)))

(declare-fun call!10562 () Unit!3077)

(assert (=> b!101646 (= lt!51539 call!10562)))

(declare-fun lt!51557 () SeekEntryResult!250)

(assert (=> b!101646 (= lt!51557 call!10557)))

(declare-fun c!17497 () Bool)

(assert (=> b!101646 (= c!17497 ((_ is MissingZero!250) lt!51557))))

(declare-fun e!66176 () Bool)

(assert (=> b!101646 e!66176))

(declare-fun b!101647 () Bool)

(declare-fun c!17488 () Bool)

(assert (=> b!101647 (= c!17488 ((_ is MissingVacant!250) lt!51552))))

(declare-fun e!66171 () tuple2!2322)

(assert (=> b!101647 (= e!66182 e!66171)))

(declare-fun bm!10547 () Bool)

(declare-fun call!10568 () SeekEntryResult!250)

(assert (=> bm!10547 (= call!10568 call!10563)))

(declare-fun b!101648 () Bool)

(declare-fun lt!51555 () array!4267)

(assert (=> b!101648 (= e!66180 (getCurrentListMap!459 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51544 () (_ BitVec 32))

(declare-fun c!17496 () Bool)

(declare-fun bm!10548 () Bool)

(declare-fun c!17487 () Bool)

(declare-fun lt!51551 () (_ BitVec 32))

(assert (=> bm!10548 (= call!10554 (getCurrentListMap!459 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun bm!10549 () Bool)

(declare-fun call!10552 () Bool)

(declare-fun call!10556 () Bool)

(assert (=> bm!10549 (= call!10552 call!10556)))

(declare-fun bm!10550 () Bool)

(declare-fun call!10547 () Bool)

(assert (=> bm!10550 (= call!10547 call!10556)))

(declare-fun e!66177 () Bool)

(declare-fun b!101649 () Bool)

(declare-fun call!10561 () ListLongMap!1511)

(declare-fun +!133 (ListLongMap!1511 tuple2!2324) ListLongMap!1511)

(assert (=> b!101649 (= e!66177 (= call!10561 (+!133 call!10560 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10551 () Bool)

(declare-fun lt!51549 () tuple2!2322)

(assert (=> bm!10551 (= call!10561 (map!1263 (_2!1172 lt!51549)))))

(declare-fun b!101650 () Bool)

(declare-fun e!66167 () Bool)

(declare-fun e!66170 () Bool)

(assert (=> b!101650 (= e!66167 e!66170)))

(declare-fun res!50895 () Bool)

(declare-fun call!10569 () Bool)

(assert (=> b!101650 (= res!50895 call!10569)))

(assert (=> b!101650 (=> (not res!50895) (not e!66170))))

(declare-fun b!101651 () Bool)

(declare-fun res!50898 () Bool)

(declare-fun e!66185 () Bool)

(assert (=> b!101651 (=> (not res!50898) (not e!66185))))

(declare-fun call!10564 () Bool)

(assert (=> b!101651 (= res!50898 call!10564)))

(assert (=> b!101651 (= e!66176 e!66185)))

(declare-fun b!101652 () Bool)

(declare-fun e!66172 () Bool)

(declare-fun e!66179 () Bool)

(assert (=> b!101652 (= e!66172 e!66179)))

(declare-fun c!17494 () Bool)

(assert (=> b!101652 (= c!17494 (_1!1172 lt!51549))))

(declare-fun bm!10552 () Bool)

(assert (=> bm!10552 (= call!10564 call!10547)))

(declare-fun b!101653 () Bool)

(declare-fun e!66178 () Unit!3077)

(declare-fun Unit!3085 () Unit!3077)

(assert (=> b!101653 (= e!66178 Unit!3085)))

(declare-fun lt!51542 () Unit!3077)

(assert (=> b!101653 (= lt!51542 call!10562)))

(declare-fun lt!51545 () SeekEntryResult!250)

(assert (=> b!101653 (= lt!51545 call!10568)))

(declare-fun c!17495 () Bool)

(assert (=> b!101653 (= c!17495 ((_ is MissingZero!250) lt!51545))))

(declare-fun e!66165 () Bool)

(assert (=> b!101653 e!66165))

(declare-fun lt!51562 () Unit!3077)

(assert (=> b!101653 (= lt!51562 lt!51542)))

(assert (=> b!101653 false))

(declare-fun b!101654 () Bool)

(declare-fun e!66184 () tuple2!2322)

(assert (=> b!101654 (= e!66173 e!66184)))

(assert (=> b!101654 (= c!17487 (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101655 () Bool)

(declare-fun call!10558 () Bool)

(assert (=> b!101655 (= e!66170 (not call!10558))))

(declare-fun b!101656 () Bool)

(declare-fun res!50894 () Bool)

(declare-fun e!66169 () Bool)

(assert (=> b!101656 (=> (not res!50894) (not e!66169))))

(assert (=> b!101656 (= res!50894 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3146 lt!51545)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10553 () Bool)

(declare-fun call!10548 () Bool)

(assert (=> bm!10553 (= call!10548 (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101657 () Bool)

(declare-fun res!50904 () Bool)

(assert (=> b!101657 (= res!50904 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3149 lt!51557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66175 () Bool)

(assert (=> b!101657 (=> (not res!50904) (not e!66175))))

(declare-fun b!101658 () Bool)

(declare-fun lt!51563 () Unit!3077)

(declare-fun lt!51541 () Unit!3077)

(assert (=> b!101658 (= lt!51563 lt!51541)))

(declare-fun call!10555 () Bool)

(assert (=> b!101658 call!10555))

(declare-fun lemmaValidKeyInArrayIsInListMap!104 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) Unit!3077)

(assert (=> b!101658 (= lt!51541 (lemmaValidKeyInArrayIsInListMap!104 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101658 (= lt!51555 (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))))))

(declare-fun lt!51543 () Unit!3077)

(declare-fun lt!51546 () Unit!3077)

(assert (=> b!101658 (= lt!51543 lt!51546)))

(declare-fun call!10565 () ListLongMap!1511)

(assert (=> b!101658 (= call!10565 call!10546)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3077)

(assert (=> b!101658 (= lt!51546 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51556 () Unit!3077)

(assert (=> b!101658 (= lt!51556 e!66178)))

(declare-fun call!10567 () ListLongMap!1511)

(declare-fun c!17493 () Bool)

(assert (=> b!101658 (= c!17493 (contains!800 call!10567 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun e!66183 () tuple2!2322)

(assert (=> b!101658 (= e!66183 (tuple2!2323 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (_size!483 newMap!16) (_keys!4235 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))) (_vacant!483 newMap!16))))))

(declare-fun b!101659 () Bool)

(declare-fun Unit!3086 () Unit!3077)

(assert (=> b!101659 (= e!66174 Unit!3086)))

(declare-fun lt!51560 () Unit!3077)

(declare-fun call!10553 () Unit!3077)

(assert (=> b!101659 (= lt!51560 call!10553)))

(assert (=> b!101659 (= lt!51558 call!10557)))

(declare-fun res!50901 () Bool)

(assert (=> b!101659 (= res!50901 ((_ is Found!250) lt!51558))))

(assert (=> b!101659 (=> (not res!50901) (not e!66181))))

(assert (=> b!101659 e!66181))

(declare-fun lt!51538 () Unit!3077)

(assert (=> b!101659 (= lt!51538 lt!51560)))

(assert (=> b!101659 false))

(declare-fun b!101660 () Bool)

(declare-fun lt!51548 () tuple2!2322)

(declare-fun call!10559 () tuple2!2322)

(assert (=> b!101660 (= lt!51548 call!10559)))

(assert (=> b!101660 (= e!66183 (tuple2!2323 (_1!1172 lt!51548) (_2!1172 lt!51548)))))

(declare-fun bm!10554 () Bool)

(declare-fun c!17498 () Bool)

(assert (=> bm!10554 (= c!17498 c!17490)))

(assert (=> bm!10554 (= call!10555 (contains!800 e!66180 (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552)))))))

(declare-fun b!101661 () Bool)

(assert (=> b!101661 (= e!66169 (not call!10558))))

(declare-fun bm!10555 () Bool)

(declare-fun call!10566 () ListLongMap!1511)

(assert (=> bm!10555 (= call!10566 call!10565)))

(declare-fun b!101641 () Bool)

(declare-fun res!50902 () Bool)

(assert (=> b!101641 (=> (not res!50902) (not e!66169))))

(assert (=> b!101641 (= res!50902 call!10569)))

(assert (=> b!101641 (= e!66165 e!66169)))

(declare-fun d!27521 () Bool)

(assert (=> d!27521 e!66172))

(declare-fun res!50896 () Bool)

(assert (=> d!27521 (=> (not res!50896) (not e!66172))))

(assert (=> d!27521 (= res!50896 (valid!403 (_2!1172 lt!51549)))))

(assert (=> d!27521 (= lt!51549 e!66173)))

(assert (=> d!27521 (= c!17496 (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvneg (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (=> d!27521 (valid!403 newMap!16)))

(assert (=> d!27521 (= (update!151 newMap!16 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!51549)))

(declare-fun b!101662 () Bool)

(declare-fun res!50891 () Bool)

(assert (=> b!101662 (=> (not res!50891) (not e!66185))))

(assert (=> b!101662 (= res!50891 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3146 lt!51557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101663 () Bool)

(declare-fun res!50903 () Bool)

(assert (=> b!101663 (= res!50903 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3149 lt!51545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101663 (=> (not res!50903) (not e!66170))))

(declare-fun b!101664 () Bool)

(assert (=> b!101664 (= e!66171 e!66183)))

(declare-fun c!17486 () Bool)

(assert (=> b!101664 (= c!17486 ((_ is MissingZero!250) lt!51552))))

(declare-fun bm!10556 () Bool)

(declare-fun c!17492 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10556 (= call!10556 (inRange!0 (ite c!17490 (ite c!17492 (index!3147 lt!51558) (ite c!17497 (index!3146 lt!51557) (index!3149 lt!51557))) (ite c!17493 (index!3147 lt!51554) (ite c!17495 (index!3146 lt!51545) (index!3149 lt!51545)))) (mask!6658 newMap!16)))))

(declare-fun b!101665 () Bool)

(declare-fun call!10551 () Bool)

(assert (=> b!101665 (= e!66175 (not call!10551))))

(declare-fun bm!10557 () Bool)

(assert (=> bm!10557 (= call!10558 call!10548)))

(declare-fun bm!10558 () Bool)

(assert (=> bm!10558 (= call!10551 call!10548)))

(declare-fun b!101666 () Bool)

(declare-fun e!66166 () Bool)

(assert (=> b!101666 (= e!66166 e!66175)))

(declare-fun res!50900 () Bool)

(assert (=> b!101666 (= res!50900 call!10564)))

(assert (=> b!101666 (=> (not res!50900) (not e!66175))))

(declare-fun b!101667 () Bool)

(assert (=> b!101667 (= e!66166 ((_ is Undefined!250) lt!51557))))

(declare-fun b!101668 () Bool)

(declare-fun res!50892 () Bool)

(assert (=> b!101668 (= res!50892 call!10547)))

(assert (=> b!101668 (=> (not res!50892) (not e!66181))))

(declare-fun b!101669 () Bool)

(assert (=> b!101669 (= e!66185 (not call!10551))))

(declare-fun b!101670 () Bool)

(declare-fun lt!51547 () Unit!3077)

(declare-fun lt!51561 () Unit!3077)

(assert (=> b!101670 (= lt!51547 lt!51561)))

(declare-fun call!10550 () ListLongMap!1511)

(assert (=> b!101670 (= call!10566 call!10550)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!44 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3077)

(assert (=> b!101670 (= lt!51561 (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51544 (zeroValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101670 (= lt!51544 (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!101670 (= e!66184 (tuple2!2323 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6658 newMap!16) (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (_size!483 newMap!16) (_keys!4235 newMap!16) (_values!2518 newMap!16) (_vacant!483 newMap!16))))))

(declare-fun bm!10559 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3077)

(assert (=> bm!10559 (= call!10562 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun b!101671 () Bool)

(declare-fun lt!51550 () Unit!3077)

(assert (=> b!101671 (= lt!51550 e!66174)))

(assert (=> b!101671 (= c!17492 call!10555)))

(assert (=> b!101671 (= e!66182 (tuple2!2323 false newMap!16))))

(declare-fun b!101672 () Bool)

(declare-fun c!17491 () Bool)

(assert (=> b!101672 (= c!17491 ((_ is MissingVacant!250) lt!51545))))

(assert (=> b!101672 (= e!66165 e!66167)))

(declare-fun b!101673 () Bool)

(assert (=> b!101673 (= e!66167 ((_ is Undefined!250) lt!51545))))

(declare-fun b!101674 () Bool)

(declare-fun lt!51537 () Unit!3077)

(assert (=> b!101674 (= e!66178 lt!51537)))

(assert (=> b!101674 (= lt!51537 call!10553)))

(assert (=> b!101674 (= lt!51554 call!10568)))

(declare-fun res!50897 () Bool)

(assert (=> b!101674 (= res!50897 ((_ is Found!250) lt!51554))))

(assert (=> b!101674 (=> (not res!50897) (not e!66168))))

(assert (=> b!101674 e!66168))

(declare-fun bm!10560 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3077)

(assert (=> bm!10560 (= call!10553 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun b!101675 () Bool)

(declare-fun lt!51559 () Unit!3077)

(declare-fun lt!51553 () Unit!3077)

(assert (=> b!101675 (= lt!51559 lt!51553)))

(assert (=> b!101675 (= call!10566 call!10550)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3077)

(assert (=> b!101675 (= lt!51553 (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51551 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> b!101675 (= lt!51551 (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!101675 (= e!66184 (tuple2!2323 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6658 newMap!16) (bvor (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) (zeroValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!483 newMap!16) (_keys!4235 newMap!16) (_values!2518 newMap!16) (_vacant!483 newMap!16))))))

(declare-fun bm!10561 () Bool)

(assert (=> bm!10561 (= call!10550 call!10554)))

(declare-fun b!101676 () Bool)

(declare-fun res!50893 () Bool)

(assert (=> b!101676 (= res!50893 call!10552)))

(assert (=> b!101676 (=> (not res!50893) (not e!66168))))

(declare-fun b!101677 () Bool)

(assert (=> b!101677 (= e!66179 (= call!10561 call!10560))))

(declare-fun b!101678 () Bool)

(declare-fun c!17489 () Bool)

(assert (=> b!101678 (= c!17489 ((_ is MissingVacant!250) lt!51557))))

(assert (=> b!101678 (= e!66176 e!66166)))

(declare-fun b!101679 () Bool)

(assert (=> b!101679 (= e!66179 e!66177)))

(declare-fun res!50899 () Bool)

(assert (=> b!101679 (= res!50899 (contains!800 call!10561 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> b!101679 (=> (not res!50899) (not e!66177))))

(declare-fun bm!10562 () Bool)

(declare-fun call!10549 () ListLongMap!1511)

(assert (=> bm!10562 (= call!10565 (+!133 (ite c!17496 call!10549 call!10567) (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10563 () Bool)

(assert (=> bm!10563 (= call!10549 call!10567)))

(declare-fun b!101680 () Bool)

(declare-fun lt!51540 () tuple2!2322)

(assert (=> b!101680 (= e!66171 (tuple2!2323 (_1!1172 lt!51540) (_2!1172 lt!51540)))))

(assert (=> b!101680 (= lt!51540 call!10559)))

(declare-fun bm!10564 () Bool)

(declare-fun updateHelperNewKey!44 (LongMapFixedSize!868 (_ BitVec 64) V!3177 (_ BitVec 32)) tuple2!2322)

(assert (=> bm!10564 (= call!10559 (updateHelperNewKey!44 newMap!16 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552))))))

(declare-fun bm!10565 () Bool)

(assert (=> bm!10565 (= call!10569 call!10552)))

(declare-fun bm!10566 () Bool)

(assert (=> bm!10566 (= call!10567 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(assert (= (and d!27521 c!17496) b!101654))

(assert (= (and d!27521 (not c!17496)) b!101645))

(assert (= (and b!101654 c!17487) b!101670))

(assert (= (and b!101654 (not c!17487)) b!101675))

(assert (= (or b!101670 b!101675) bm!10561))

(assert (= (or b!101670 b!101675) bm!10563))

(assert (= (or b!101670 b!101675) bm!10555))

(assert (= (and b!101645 c!17490) b!101671))

(assert (= (and b!101645 (not c!17490)) b!101647))

(assert (= (and b!101671 c!17492) b!101659))

(assert (= (and b!101671 (not c!17492)) b!101646))

(assert (= (and b!101659 res!50901) b!101668))

(assert (= (and b!101668 res!50892) b!101644))

(assert (= (and b!101646 c!17497) b!101651))

(assert (= (and b!101646 (not c!17497)) b!101678))

(assert (= (and b!101651 res!50898) b!101662))

(assert (= (and b!101662 res!50891) b!101669))

(assert (= (and b!101678 c!17489) b!101666))

(assert (= (and b!101678 (not c!17489)) b!101667))

(assert (= (and b!101666 res!50900) b!101657))

(assert (= (and b!101657 res!50904) b!101665))

(assert (= (or b!101651 b!101666) bm!10552))

(assert (= (or b!101669 b!101665) bm!10558))

(assert (= (or b!101668 bm!10552) bm!10550))

(assert (= (or b!101659 b!101646) bm!10546))

(assert (= (and b!101647 c!17488) b!101680))

(assert (= (and b!101647 (not c!17488)) b!101664))

(assert (= (and b!101664 c!17486) b!101660))

(assert (= (and b!101664 (not c!17486)) b!101658))

(assert (= (and b!101658 c!17493) b!101674))

(assert (= (and b!101658 (not c!17493)) b!101653))

(assert (= (and b!101674 res!50897) b!101676))

(assert (= (and b!101676 res!50893) b!101643))

(assert (= (and b!101653 c!17495) b!101641))

(assert (= (and b!101653 (not c!17495)) b!101672))

(assert (= (and b!101641 res!50902) b!101656))

(assert (= (and b!101656 res!50894) b!101661))

(assert (= (and b!101672 c!17491) b!101650))

(assert (= (and b!101672 (not c!17491)) b!101673))

(assert (= (and b!101650 res!50895) b!101663))

(assert (= (and b!101663 res!50903) b!101655))

(assert (= (or b!101641 b!101650) bm!10565))

(assert (= (or b!101661 b!101655) bm!10557))

(assert (= (or b!101676 bm!10565) bm!10549))

(assert (= (or b!101674 b!101653) bm!10547))

(assert (= (or b!101680 b!101660) bm!10564))

(assert (= (or bm!10550 bm!10549) bm!10556))

(assert (= (or bm!10546 bm!10547) bm!10544))

(assert (= (or b!101659 b!101674) bm!10560))

(assert (= (or b!101671 b!101658) bm!10545))

(assert (= (or b!101646 b!101653) bm!10559))

(assert (= (or bm!10558 bm!10557) bm!10553))

(assert (= (or b!101671 b!101658) bm!10554))

(assert (= (and bm!10554 c!17498) b!101642))

(assert (= (and bm!10554 (not c!17498)) b!101648))

(assert (= (or bm!10561 bm!10545) bm!10548))

(assert (= (or bm!10563 b!101658) bm!10566))

(assert (= (or bm!10555 b!101658) bm!10562))

(assert (= (and d!27521 res!50896) b!101652))

(assert (= (and b!101652 c!17494) b!101679))

(assert (= (and b!101652 (not c!17494)) b!101677))

(assert (= (and b!101679 res!50899) b!101649))

(assert (= (or b!101649 b!101677) bm!10543))

(assert (= (or b!101679 b!101649 b!101677) bm!10551))

(assert (=> bm!10544 m!112337))

(declare-fun m!112489 () Bool)

(assert (=> bm!10544 m!112489))

(declare-fun m!112491 () Bool)

(assert (=> d!27521 m!112491))

(assert (=> d!27521 m!112373))

(declare-fun m!112493 () Bool)

(assert (=> bm!10548 m!112493))

(declare-fun m!112495 () Bool)

(assert (=> bm!10548 m!112495))

(declare-fun m!112497 () Bool)

(assert (=> b!101656 m!112497))

(assert (=> bm!10559 m!112337))

(declare-fun m!112499 () Bool)

(assert (=> bm!10559 m!112499))

(declare-fun m!112501 () Bool)

(assert (=> b!101657 m!112501))

(declare-fun m!112503 () Bool)

(assert (=> b!101649 m!112503))

(assert (=> b!101679 m!112337))

(declare-fun m!112505 () Bool)

(assert (=> b!101679 m!112505))

(declare-fun m!112507 () Bool)

(assert (=> bm!10554 m!112507))

(declare-fun m!112509 () Bool)

(assert (=> bm!10554 m!112509))

(declare-fun m!112511 () Bool)

(assert (=> b!101644 m!112511))

(declare-fun m!112513 () Bool)

(assert (=> bm!10556 m!112513))

(declare-fun m!112515 () Bool)

(assert (=> b!101643 m!112515))

(declare-fun m!112517 () Bool)

(assert (=> b!101662 m!112517))

(declare-fun m!112519 () Bool)

(assert (=> bm!10566 m!112519))

(declare-fun m!112521 () Bool)

(assert (=> b!101658 m!112521))

(assert (=> b!101658 m!112493))

(assert (=> b!101658 m!112337))

(assert (=> b!101658 m!112353))

(declare-fun m!112523 () Bool)

(assert (=> b!101658 m!112523))

(assert (=> b!101658 m!112337))

(declare-fun m!112525 () Bool)

(assert (=> b!101658 m!112525))

(assert (=> b!101670 m!112353))

(declare-fun m!112527 () Bool)

(assert (=> b!101670 m!112527))

(assert (=> bm!10564 m!112337))

(assert (=> bm!10564 m!112353))

(declare-fun m!112529 () Bool)

(assert (=> bm!10564 m!112529))

(declare-fun m!112531 () Bool)

(assert (=> bm!10562 m!112531))

(declare-fun m!112533 () Bool)

(assert (=> b!101648 m!112533))

(declare-fun m!112535 () Bool)

(assert (=> bm!10551 m!112535))

(assert (=> bm!10560 m!112337))

(declare-fun m!112537 () Bool)

(assert (=> bm!10560 m!112537))

(assert (=> bm!10553 m!112337))

(declare-fun m!112539 () Bool)

(assert (=> bm!10553 m!112539))

(declare-fun m!112541 () Bool)

(assert (=> b!101663 m!112541))

(assert (=> b!101675 m!112353))

(declare-fun m!112543 () Bool)

(assert (=> b!101675 m!112543))

(assert (=> bm!10543 m!112339))

(assert (=> b!101645 m!112337))

(assert (=> b!101645 m!112489))

(assert (=> b!101410 d!27521))

(declare-fun d!27523 () Bool)

(declare-fun c!17501 () Bool)

(assert (=> d!27523 (= c!17501 ((_ is ValueCellFull!980) (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun e!66188 () V!3177)

(assert (=> d!27523 (= (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66188)))

(declare-fun b!101685 () Bool)

(declare-fun get!1310 (ValueCell!980 V!3177) V!3177)

(assert (=> b!101685 (= e!66188 (get!1310 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101686 () Bool)

(declare-fun get!1311 (ValueCell!980 V!3177) V!3177)

(assert (=> b!101686 (= e!66188 (get!1311 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27523 c!17501) b!101685))

(assert (= (and d!27523 (not c!17501)) b!101686))

(assert (=> b!101685 m!112349))

(assert (=> b!101685 m!112351))

(declare-fun m!112545 () Bool)

(assert (=> b!101685 m!112545))

(assert (=> b!101686 m!112349))

(assert (=> b!101686 m!112351))

(declare-fun m!112547 () Bool)

(assert (=> b!101686 m!112547))

(assert (=> b!101410 d!27523))

(declare-fun d!27525 () Bool)

(assert (=> d!27525 (= (map!1263 newMap!16) (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun bs!4205 () Bool)

(assert (= bs!4205 d!27525))

(assert (=> bs!4205 m!112519))

(assert (=> b!101415 d!27525))

(declare-fun b!101729 () Bool)

(declare-fun e!66224 () Bool)

(declare-fun e!66219 () Bool)

(assert (=> b!101729 (= e!66224 e!66219)))

(declare-fun res!50924 () Bool)

(declare-fun call!10587 () Bool)

(assert (=> b!101729 (= res!50924 call!10587)))

(assert (=> b!101729 (=> (not res!50924) (not e!66219))))

(declare-fun c!17516 () Bool)

(declare-fun call!10585 () ListLongMap!1511)

(declare-fun call!10586 () ListLongMap!1511)

(declare-fun c!17519 () Bool)

(declare-fun call!10588 () ListLongMap!1511)

(declare-fun call!10584 () ListLongMap!1511)

(declare-fun bm!10581 () Bool)

(assert (=> bm!10581 (= call!10584 (+!133 (ite c!17516 call!10585 (ite c!17519 call!10588 call!10586)) (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun bm!10582 () Bool)

(declare-fun call!10589 () Bool)

(declare-fun lt!51617 () ListLongMap!1511)

(assert (=> bm!10582 (= call!10589 (contains!800 lt!51617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!27527 () Bool)

(declare-fun e!66221 () Bool)

(assert (=> d!27527 e!66221))

(declare-fun res!50927 () Bool)

(assert (=> d!27527 (=> (not res!50927) (not e!66221))))

(assert (=> d!27527 (= res!50927 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun lt!51613 () ListLongMap!1511)

(assert (=> d!27527 (= lt!51617 lt!51613)))

(declare-fun lt!51611 () Unit!3077)

(declare-fun e!66217 () Unit!3077)

(assert (=> d!27527 (= lt!51611 e!66217)))

(declare-fun c!17515 () Bool)

(declare-fun e!66225 () Bool)

(assert (=> d!27527 (= c!17515 e!66225)))

(declare-fun res!50929 () Bool)

(assert (=> d!27527 (=> (not res!50929) (not e!66225))))

(assert (=> d!27527 (= res!50929 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun e!66216 () ListLongMap!1511)

(assert (=> d!27527 (= lt!51613 e!66216)))

(assert (=> d!27527 (= c!17516 (and (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27527 (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992))))))

(assert (=> d!27527 (= (getCurrentListMap!459 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) lt!51617)))

(declare-fun b!101730 () Bool)

(assert (=> b!101730 (= e!66224 (not call!10587))))

(declare-fun b!101731 () Bool)

(declare-fun res!50925 () Bool)

(assert (=> b!101731 (=> (not res!50925) (not e!66221))))

(declare-fun e!66222 () Bool)

(assert (=> b!101731 (= res!50925 e!66222)))

(declare-fun c!17517 () Bool)

(assert (=> b!101731 (= c!17517 (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101732 () Bool)

(declare-fun e!66226 () Bool)

(declare-fun e!66215 () Bool)

(assert (=> b!101732 (= e!66226 e!66215)))

(declare-fun res!50923 () Bool)

(assert (=> b!101732 (=> (not res!50923) (not e!66215))))

(assert (=> b!101732 (= res!50923 (contains!800 lt!51617 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101732 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101733 () Bool)

(declare-fun e!66220 () Bool)

(assert (=> b!101733 (= e!66222 e!66220)))

(declare-fun res!50931 () Bool)

(assert (=> b!101733 (= res!50931 call!10589)))

(assert (=> b!101733 (=> (not res!50931) (not e!66220))))

(declare-fun b!101734 () Bool)

(declare-fun e!66227 () ListLongMap!1511)

(assert (=> b!101734 (= e!66216 e!66227)))

(assert (=> b!101734 (= c!17519 (and (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101735 () Bool)

(declare-fun Unit!3087 () Unit!3077)

(assert (=> b!101735 (= e!66217 Unit!3087)))

(declare-fun b!101736 () Bool)

(declare-fun apply!95 (ListLongMap!1511 (_ BitVec 64)) V!3177)

(assert (=> b!101736 (= e!66219 (= (apply!95 lt!51617 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101737 () Bool)

(declare-fun e!66223 () ListLongMap!1511)

(assert (=> b!101737 (= e!66223 call!10586)))

(declare-fun b!101738 () Bool)

(assert (=> b!101738 (= e!66220 (= (apply!95 lt!51617 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun bm!10583 () Bool)

(declare-fun call!10590 () ListLongMap!1511)

(assert (=> bm!10583 (= call!10590 call!10584)))

(declare-fun bm!10584 () Bool)

(assert (=> bm!10584 (= call!10588 call!10585)))

(declare-fun b!101739 () Bool)

(assert (=> b!101739 (= e!66221 e!66224)))

(declare-fun c!17514 () Bool)

(assert (=> b!101739 (= c!17514 (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101740 () Bool)

(assert (=> b!101740 (= e!66216 (+!133 call!10584 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101741 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!101741 (= e!66225 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101742 () Bool)

(declare-fun e!66218 () Bool)

(assert (=> b!101742 (= e!66218 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!10585 () Bool)

(assert (=> bm!10585 (= call!10586 call!10588)))

(declare-fun b!101743 () Bool)

(declare-fun c!17518 () Bool)

(assert (=> b!101743 (= c!17518 (and (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101743 (= e!66227 e!66223)))

(declare-fun bm!10586 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!98 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) ListLongMap!1511)

(assert (=> bm!10586 (= call!10585 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101744 () Bool)

(assert (=> b!101744 (= e!66223 call!10590)))

(declare-fun b!101745 () Bool)

(assert (=> b!101745 (= e!66222 (not call!10589))))

(declare-fun bm!10587 () Bool)

(assert (=> bm!10587 (= call!10587 (contains!800 lt!51617 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101746 () Bool)

(assert (=> b!101746 (= e!66215 (= (apply!95 lt!51617 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101746 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2278 (_values!2518 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> b!101746 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101747 () Bool)

(declare-fun lt!51618 () Unit!3077)

(assert (=> b!101747 (= e!66217 lt!51618)))

(declare-fun lt!51610 () ListLongMap!1511)

(assert (=> b!101747 (= lt!51610 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun lt!51620 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51623 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51623 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51609 () Unit!3077)

(declare-fun addStillContains!71 (ListLongMap!1511 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3077)

(assert (=> b!101747 (= lt!51609 (addStillContains!71 lt!51610 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51623))))

(assert (=> b!101747 (contains!800 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51623)))

(declare-fun lt!51627 () Unit!3077)

(assert (=> b!101747 (= lt!51627 lt!51609)))

(declare-fun lt!51629 () ListLongMap!1511)

(assert (=> b!101747 (= lt!51629 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun lt!51628 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51616 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51616 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51612 () Unit!3077)

(declare-fun addApplyDifferent!71 (ListLongMap!1511 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3077)

(assert (=> b!101747 (= lt!51612 (addApplyDifferent!71 lt!51629 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51616))))

(assert (=> b!101747 (= (apply!95 (+!133 lt!51629 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51616) (apply!95 lt!51629 lt!51616))))

(declare-fun lt!51621 () Unit!3077)

(assert (=> b!101747 (= lt!51621 lt!51612)))

(declare-fun lt!51624 () ListLongMap!1511)

(assert (=> b!101747 (= lt!51624 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun lt!51625 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51619 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51619 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51615 () Unit!3077)

(assert (=> b!101747 (= lt!51615 (addApplyDifferent!71 lt!51624 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51619))))

(assert (=> b!101747 (= (apply!95 (+!133 lt!51624 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51619) (apply!95 lt!51624 lt!51619))))

(declare-fun lt!51608 () Unit!3077)

(assert (=> b!101747 (= lt!51608 lt!51615)))

(declare-fun lt!51626 () ListLongMap!1511)

(assert (=> b!101747 (= lt!51626 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun lt!51614 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51614 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51622 () (_ BitVec 64))

(assert (=> b!101747 (= lt!51622 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101747 (= lt!51618 (addApplyDifferent!71 lt!51626 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51622))))

(assert (=> b!101747 (= (apply!95 (+!133 lt!51626 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51622) (apply!95 lt!51626 lt!51622))))

(declare-fun b!101748 () Bool)

(declare-fun res!50928 () Bool)

(assert (=> b!101748 (=> (not res!50928) (not e!66221))))

(assert (=> b!101748 (= res!50928 e!66226)))

(declare-fun res!50930 () Bool)

(assert (=> b!101748 (=> res!50930 e!66226)))

(assert (=> b!101748 (= res!50930 (not e!66218))))

(declare-fun res!50926 () Bool)

(assert (=> b!101748 (=> (not res!50926) (not e!66218))))

(assert (=> b!101748 (= res!50926 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101749 () Bool)

(assert (=> b!101749 (= e!66227 call!10590)))

(assert (= (and d!27527 c!17516) b!101740))

(assert (= (and d!27527 (not c!17516)) b!101734))

(assert (= (and b!101734 c!17519) b!101749))

(assert (= (and b!101734 (not c!17519)) b!101743))

(assert (= (and b!101743 c!17518) b!101744))

(assert (= (and b!101743 (not c!17518)) b!101737))

(assert (= (or b!101744 b!101737) bm!10585))

(assert (= (or b!101749 bm!10585) bm!10584))

(assert (= (or b!101749 b!101744) bm!10583))

(assert (= (or b!101740 bm!10584) bm!10586))

(assert (= (or b!101740 bm!10583) bm!10581))

(assert (= (and d!27527 res!50929) b!101741))

(assert (= (and d!27527 c!17515) b!101747))

(assert (= (and d!27527 (not c!17515)) b!101735))

(assert (= (and d!27527 res!50927) b!101748))

(assert (= (and b!101748 res!50926) b!101742))

(assert (= (and b!101748 (not res!50930)) b!101732))

(assert (= (and b!101732 res!50923) b!101746))

(assert (= (and b!101748 res!50928) b!101731))

(assert (= (and b!101731 c!17517) b!101733))

(assert (= (and b!101731 (not c!17517)) b!101745))

(assert (= (and b!101733 res!50931) b!101738))

(assert (= (or b!101733 b!101745) bm!10582))

(assert (= (and b!101731 res!50925) b!101739))

(assert (= (and b!101739 c!17514) b!101729))

(assert (= (and b!101739 (not c!17514)) b!101730))

(assert (= (and b!101729 res!50924) b!101736))

(assert (= (or b!101729 b!101730) bm!10587))

(declare-fun b_lambda!4557 () Bool)

(assert (=> (not b_lambda!4557) (not b!101746)))

(assert (=> b!101746 t!5574))

(declare-fun b_and!6265 () Bool)

(assert (= b_and!6245 (and (=> t!5574 result!3331) b_and!6265)))

(assert (=> b!101746 t!5576))

(declare-fun b_and!6267 () Bool)

(assert (= b_and!6247 (and (=> t!5576 result!3335) b_and!6267)))

(declare-fun m!112549 () Bool)

(assert (=> b!101741 m!112549))

(assert (=> b!101741 m!112549))

(declare-fun m!112551 () Bool)

(assert (=> b!101741 m!112551))

(assert (=> b!101742 m!112549))

(assert (=> b!101742 m!112549))

(assert (=> b!101742 m!112551))

(assert (=> b!101732 m!112549))

(assert (=> b!101732 m!112549))

(declare-fun m!112553 () Bool)

(assert (=> b!101732 m!112553))

(declare-fun m!112555 () Bool)

(assert (=> b!101747 m!112555))

(declare-fun m!112557 () Bool)

(assert (=> b!101747 m!112557))

(declare-fun m!112559 () Bool)

(assert (=> b!101747 m!112559))

(declare-fun m!112561 () Bool)

(assert (=> b!101747 m!112561))

(declare-fun m!112563 () Bool)

(assert (=> b!101747 m!112563))

(declare-fun m!112565 () Bool)

(assert (=> b!101747 m!112565))

(declare-fun m!112567 () Bool)

(assert (=> b!101747 m!112567))

(declare-fun m!112569 () Bool)

(assert (=> b!101747 m!112569))

(assert (=> b!101747 m!112549))

(declare-fun m!112571 () Bool)

(assert (=> b!101747 m!112571))

(assert (=> b!101747 m!112557))

(declare-fun m!112573 () Bool)

(assert (=> b!101747 m!112573))

(assert (=> b!101747 m!112563))

(declare-fun m!112575 () Bool)

(assert (=> b!101747 m!112575))

(assert (=> b!101747 m!112555))

(declare-fun m!112577 () Bool)

(assert (=> b!101747 m!112577))

(declare-fun m!112579 () Bool)

(assert (=> b!101747 m!112579))

(declare-fun m!112581 () Bool)

(assert (=> b!101747 m!112581))

(declare-fun m!112583 () Bool)

(assert (=> b!101747 m!112583))

(declare-fun m!112585 () Bool)

(assert (=> b!101747 m!112585))

(assert (=> b!101747 m!112579))

(declare-fun m!112587 () Bool)

(assert (=> b!101736 m!112587))

(declare-fun m!112589 () Bool)

(assert (=> b!101740 m!112589))

(declare-fun m!112591 () Bool)

(assert (=> b!101738 m!112591))

(assert (=> d!27527 m!112383))

(declare-fun m!112593 () Bool)

(assert (=> bm!10582 m!112593))

(declare-fun m!112595 () Bool)

(assert (=> bm!10587 m!112595))

(assert (=> b!101746 m!112351))

(declare-fun m!112597 () Bool)

(assert (=> b!101746 m!112597))

(assert (=> b!101746 m!112549))

(declare-fun m!112599 () Bool)

(assert (=> b!101746 m!112599))

(assert (=> b!101746 m!112597))

(assert (=> b!101746 m!112351))

(declare-fun m!112601 () Bool)

(assert (=> b!101746 m!112601))

(assert (=> b!101746 m!112549))

(declare-fun m!112603 () Bool)

(assert (=> bm!10581 m!112603))

(assert (=> bm!10586 m!112571))

(assert (=> b!101415 d!27527))

(declare-fun d!27529 () Bool)

(assert (=> d!27529 (= (valid!404 thiss!992) (valid!403 (v!2845 (underlying!347 thiss!992))))))

(declare-fun bs!4206 () Bool)

(assert (= bs!4206 d!27529))

(declare-fun m!112605 () Bool)

(assert (=> bs!4206 m!112605))

(assert (=> start!12044 d!27529))

(declare-fun d!27531 () Bool)

(declare-fun res!50938 () Bool)

(declare-fun e!66230 () Bool)

(assert (=> d!27531 (=> (not res!50938) (not e!66230))))

(declare-fun simpleValid!71 (LongMapFixedSize!868) Bool)

(assert (=> d!27531 (= res!50938 (simpleValid!71 newMap!16))))

(assert (=> d!27531 (= (valid!403 newMap!16) e!66230)))

(declare-fun b!101756 () Bool)

(declare-fun res!50939 () Bool)

(assert (=> b!101756 (=> (not res!50939) (not e!66230))))

(declare-fun arrayCountValidKeys!0 (array!4265 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!101756 (= res!50939 (= (arrayCountValidKeys!0 (_keys!4235 newMap!16) #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (_size!483 newMap!16)))))

(declare-fun b!101757 () Bool)

(declare-fun res!50940 () Bool)

(assert (=> b!101757 (=> (not res!50940) (not e!66230))))

(assert (=> b!101757 (= res!50940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun b!101758 () Bool)

(assert (=> b!101758 (= e!66230 (arrayNoDuplicates!0 (_keys!4235 newMap!16) #b00000000000000000000000000000000 Nil!1572))))

(assert (= (and d!27531 res!50938) b!101756))

(assert (= (and b!101756 res!50939) b!101757))

(assert (= (and b!101757 res!50940) b!101758))

(declare-fun m!112607 () Bool)

(assert (=> d!27531 m!112607))

(declare-fun m!112609 () Bool)

(assert (=> b!101756 m!112609))

(declare-fun m!112611 () Bool)

(assert (=> b!101757 m!112611))

(declare-fun m!112613 () Bool)

(assert (=> b!101758 m!112613))

(assert (=> b!101412 d!27531))

(declare-fun d!27533 () Bool)

(assert (=> d!27533 (not (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51632 () Unit!3077)

(declare-fun choose!68 (array!4265 (_ BitVec 32) (_ BitVec 64) List!1575) Unit!3077)

(assert (=> d!27533 (= lt!51632 (choose!68 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572)))))

(assert (=> d!27533 (bvslt (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27533 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572)) lt!51632)))

(declare-fun bs!4207 () Bool)

(assert (= bs!4207 d!27533))

(assert (=> bs!4207 m!112337))

(assert (=> bs!4207 m!112365))

(assert (=> bs!4207 m!112337))

(declare-fun m!112615 () Bool)

(assert (=> bs!4207 m!112615))

(assert (=> b!101401 d!27533))

(declare-fun d!27535 () Bool)

(assert (=> d!27535 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) from!355 Nil!1572)))

(declare-fun lt!51635 () Unit!3077)

(declare-fun choose!39 (array!4265 (_ BitVec 32) (_ BitVec 32)) Unit!3077)

(assert (=> d!27535 (= lt!51635 (choose!39 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27535 (bvslt (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27535 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 from!355) lt!51635)))

(declare-fun bs!4208 () Bool)

(assert (= bs!4208 d!27535))

(assert (=> bs!4208 m!112361))

(declare-fun m!112617 () Bool)

(assert (=> bs!4208 m!112617))

(assert (=> b!101401 d!27535))

(declare-fun d!27537 () Bool)

(declare-fun res!50945 () Bool)

(declare-fun e!66235 () Bool)

(assert (=> d!27537 (=> res!50945 e!66235)))

(assert (=> d!27537 (= res!50945 (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27537 (= (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!66235)))

(declare-fun b!101763 () Bool)

(declare-fun e!66236 () Bool)

(assert (=> b!101763 (= e!66235 e!66236)))

(declare-fun res!50946 () Bool)

(assert (=> b!101763 (=> (not res!50946) (not e!66236))))

(assert (=> b!101763 (= res!50946 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101764 () Bool)

(assert (=> b!101764 (= e!66236 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27537 (not res!50945)) b!101763))

(assert (= (and b!101763 res!50946) b!101764))

(assert (=> d!27537 m!112549))

(assert (=> b!101764 m!112337))

(declare-fun m!112619 () Bool)

(assert (=> b!101764 m!112619))

(assert (=> b!101401 d!27537))

(declare-fun d!27539 () Bool)

(declare-fun e!66239 () Bool)

(assert (=> d!27539 e!66239))

(declare-fun c!17522 () Bool)

(assert (=> d!27539 (= c!17522 (and (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51638 () Unit!3077)

(declare-fun choose!632 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3077)

(assert (=> d!27539 (= lt!51638 (choose!632 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(assert (=> d!27539 (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992))))))

(assert (=> d!27539 (= (lemmaListMapContainsThenArrayContainsFrom!91 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) lt!51638)))

(declare-fun b!101769 () Bool)

(assert (=> b!101769 (= e!66239 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101770 () Bool)

(assert (=> b!101770 (= e!66239 (ite (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27539 c!17522) b!101769))

(assert (= (and d!27539 (not c!17522)) b!101770))

(assert (=> d!27539 m!112337))

(declare-fun m!112621 () Bool)

(assert (=> d!27539 m!112621))

(assert (=> d!27539 m!112383))

(assert (=> b!101769 m!112337))

(assert (=> b!101769 m!112365))

(assert (=> b!101401 d!27539))

(declare-fun c!17525 () Bool)

(declare-fun call!10593 () Bool)

(declare-fun bm!10590 () Bool)

(assert (=> bm!10590 (= call!10593 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17525 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572) Nil!1572)))))

(declare-fun b!101781 () Bool)

(declare-fun e!66250 () Bool)

(declare-fun e!66248 () Bool)

(assert (=> b!101781 (= e!66250 e!66248)))

(assert (=> b!101781 (= c!17525 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101782 () Bool)

(assert (=> b!101782 (= e!66248 call!10593)))

(declare-fun b!101783 () Bool)

(declare-fun e!66251 () Bool)

(assert (=> b!101783 (= e!66251 e!66250)))

(declare-fun res!50954 () Bool)

(assert (=> b!101783 (=> (not res!50954) (not e!66250))))

(declare-fun e!66249 () Bool)

(assert (=> b!101783 (= res!50954 (not e!66249))))

(declare-fun res!50955 () Bool)

(assert (=> b!101783 (=> (not res!50955) (not e!66249))))

(assert (=> b!101783 (= res!50955 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101784 () Bool)

(assert (=> b!101784 (= e!66248 call!10593)))

(declare-fun b!101785 () Bool)

(declare-fun contains!801 (List!1575 (_ BitVec 64)) Bool)

(assert (=> b!101785 (= e!66249 (contains!801 Nil!1572 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun d!27541 () Bool)

(declare-fun res!50953 () Bool)

(assert (=> d!27541 (=> res!50953 e!66251)))

(assert (=> d!27541 (= res!50953 (bvsge from!355 (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27541 (= (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) from!355 Nil!1572) e!66251)))

(assert (= (and d!27541 (not res!50953)) b!101783))

(assert (= (and b!101783 res!50955) b!101785))

(assert (= (and b!101783 res!50954) b!101781))

(assert (= (and b!101781 c!17525) b!101782))

(assert (= (and b!101781 (not c!17525)) b!101784))

(assert (= (or b!101782 b!101784) bm!10590))

(assert (=> bm!10590 m!112337))

(declare-fun m!112623 () Bool)

(assert (=> bm!10590 m!112623))

(assert (=> b!101781 m!112337))

(assert (=> b!101781 m!112337))

(declare-fun m!112625 () Bool)

(assert (=> b!101781 m!112625))

(assert (=> b!101783 m!112337))

(assert (=> b!101783 m!112337))

(assert (=> b!101783 m!112625))

(assert (=> b!101785 m!112337))

(assert (=> b!101785 m!112337))

(declare-fun m!112627 () Bool)

(assert (=> b!101785 m!112627))

(assert (=> b!101401 d!27541))

(declare-fun b!101794 () Bool)

(declare-fun e!66258 () Bool)

(declare-fun e!66259 () Bool)

(assert (=> b!101794 (= e!66258 e!66259)))

(declare-fun lt!51645 () (_ BitVec 64))

(assert (=> b!101794 (= lt!51645 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!51647 () Unit!3077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4265 (_ BitVec 64) (_ BitVec 32)) Unit!3077)

(assert (=> b!101794 (= lt!51647 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000))))

(assert (=> b!101794 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000)))

(declare-fun lt!51646 () Unit!3077)

(assert (=> b!101794 (= lt!51646 lt!51647)))

(declare-fun res!50961 () Bool)

(assert (=> b!101794 (= res!50961 (= (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))) (Found!250 #b00000000000000000000000000000000)))))

(assert (=> b!101794 (=> (not res!50961) (not e!66259))))

(declare-fun b!101795 () Bool)

(declare-fun call!10596 () Bool)

(assert (=> b!101795 (= e!66258 call!10596)))

(declare-fun b!101796 () Bool)

(declare-fun e!66260 () Bool)

(assert (=> b!101796 (= e!66260 e!66258)))

(declare-fun c!17528 () Bool)

(assert (=> b!101796 (= c!17528 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101797 () Bool)

(assert (=> b!101797 (= e!66259 call!10596)))

(declare-fun bm!10593 () Bool)

(assert (=> bm!10593 (= call!10596 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun d!27543 () Bool)

(declare-fun res!50960 () Bool)

(assert (=> d!27543 (=> res!50960 e!66260)))

(assert (=> d!27543 (= res!50960 (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))) e!66260)))

(assert (= (and d!27543 (not res!50960)) b!101796))

(assert (= (and b!101796 c!17528) b!101794))

(assert (= (and b!101796 (not c!17528)) b!101795))

(assert (= (and b!101794 res!50961) b!101797))

(assert (= (or b!101797 b!101795) bm!10593))

(declare-fun m!112629 () Bool)

(assert (=> b!101794 m!112629))

(declare-fun m!112631 () Bool)

(assert (=> b!101794 m!112631))

(declare-fun m!112633 () Bool)

(assert (=> b!101794 m!112633))

(assert (=> b!101794 m!112629))

(declare-fun m!112635 () Bool)

(assert (=> b!101794 m!112635))

(assert (=> b!101796 m!112629))

(assert (=> b!101796 m!112629))

(declare-fun m!112637 () Bool)

(assert (=> b!101796 m!112637))

(declare-fun m!112639 () Bool)

(assert (=> bm!10593 m!112639))

(assert (=> b!101402 d!27543))

(declare-fun d!27545 () Bool)

(assert (=> d!27545 (= (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992)))) (and (or (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000001111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000011111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000001111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000011111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000001111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000011111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000001111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000011111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000000111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000001111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000011111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000000111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000001111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000011111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000000111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000001111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000011111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000000111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000001111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000011111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00000111111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00001111111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00011111111111111111111111111111) (= (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6658 (v!2845 (underlying!347 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!101418 d!27545))

(declare-fun d!27547 () Bool)

(assert (=> d!27547 (= (array_inv!1245 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvsge (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101408 d!27547))

(declare-fun d!27549 () Bool)

(assert (=> d!27549 (= (array_inv!1246 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvsge (size!2278 (_values!2518 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!101408 d!27549))

(declare-fun d!27551 () Bool)

(assert (=> d!27551 (= (array_inv!1245 (_keys!4235 newMap!16)) (bvsge (size!2277 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101403 d!27551))

(declare-fun d!27553 () Bool)

(assert (=> d!27553 (= (array_inv!1246 (_values!2518 newMap!16)) (bvsge (size!2278 (_values!2518 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101403 d!27553))

(declare-fun bm!10594 () Bool)

(declare-fun call!10597 () Bool)

(declare-fun c!17529 () Bool)

(assert (=> bm!10594 (= call!10597 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17529 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) Nil!1572) Nil!1572)))))

(declare-fun b!101798 () Bool)

(declare-fun e!66263 () Bool)

(declare-fun e!66261 () Bool)

(assert (=> b!101798 (= e!66263 e!66261)))

(assert (=> b!101798 (= c!17529 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101799 () Bool)

(assert (=> b!101799 (= e!66261 call!10597)))

(declare-fun b!101800 () Bool)

(declare-fun e!66264 () Bool)

(assert (=> b!101800 (= e!66264 e!66263)))

(declare-fun res!50963 () Bool)

(assert (=> b!101800 (=> (not res!50963) (not e!66263))))

(declare-fun e!66262 () Bool)

(assert (=> b!101800 (= res!50963 (not e!66262))))

(declare-fun res!50964 () Bool)

(assert (=> b!101800 (=> (not res!50964) (not e!66262))))

(assert (=> b!101800 (= res!50964 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101801 () Bool)

(assert (=> b!101801 (= e!66261 call!10597)))

(declare-fun b!101802 () Bool)

(assert (=> b!101802 (= e!66262 (contains!801 Nil!1572 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!27555 () Bool)

(declare-fun res!50962 () Bool)

(assert (=> d!27555 (=> res!50962 e!66264)))

(assert (=> d!27555 (= res!50962 (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27555 (= (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 Nil!1572) e!66264)))

(assert (= (and d!27555 (not res!50962)) b!101800))

(assert (= (and b!101800 res!50964) b!101802))

(assert (= (and b!101800 res!50963) b!101798))

(assert (= (and b!101798 c!17529) b!101799))

(assert (= (and b!101798 (not c!17529)) b!101801))

(assert (= (or b!101799 b!101801) bm!10594))

(assert (=> bm!10594 m!112629))

(declare-fun m!112641 () Bool)

(assert (=> bm!10594 m!112641))

(assert (=> b!101798 m!112629))

(assert (=> b!101798 m!112629))

(assert (=> b!101798 m!112637))

(assert (=> b!101800 m!112629))

(assert (=> b!101800 m!112629))

(assert (=> b!101800 m!112637))

(assert (=> b!101802 m!112629))

(assert (=> b!101802 m!112629))

(declare-fun m!112643 () Bool)

(assert (=> b!101802 m!112643))

(assert (=> b!101409 d!27555))

(declare-fun mapIsEmpty!3831 () Bool)

(declare-fun mapRes!3831 () Bool)

(assert (=> mapIsEmpty!3831 mapRes!3831))

(declare-fun condMapEmpty!3831 () Bool)

(declare-fun mapDefault!3831 () ValueCell!980)

(assert (=> mapNonEmpty!3816 (= condMapEmpty!3831 (= mapRest!3815 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3831)))))

(declare-fun e!66269 () Bool)

(assert (=> mapNonEmpty!3816 (= tp!9689 (and e!66269 mapRes!3831))))

(declare-fun b!101809 () Bool)

(declare-fun e!66270 () Bool)

(assert (=> b!101809 (= e!66270 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3831 () Bool)

(declare-fun tp!9717 () Bool)

(assert (=> mapNonEmpty!3831 (= mapRes!3831 (and tp!9717 e!66270))))

(declare-fun mapKey!3831 () (_ BitVec 32))

(declare-fun mapValue!3831 () ValueCell!980)

(declare-fun mapRest!3831 () (Array (_ BitVec 32) ValueCell!980))

(assert (=> mapNonEmpty!3831 (= mapRest!3815 (store mapRest!3831 mapKey!3831 mapValue!3831))))

(declare-fun b!101810 () Bool)

(assert (=> b!101810 (= e!66269 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3816 condMapEmpty!3831) mapIsEmpty!3831))

(assert (= (and mapNonEmpty!3816 (not condMapEmpty!3831)) mapNonEmpty!3831))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!980) mapValue!3831)) b!101809))

(assert (= (and mapNonEmpty!3816 ((_ is ValueCellFull!980) mapDefault!3831)) b!101810))

(declare-fun m!112645 () Bool)

(assert (=> mapNonEmpty!3831 m!112645))

(declare-fun mapIsEmpty!3832 () Bool)

(declare-fun mapRes!3832 () Bool)

(assert (=> mapIsEmpty!3832 mapRes!3832))

(declare-fun condMapEmpty!3832 () Bool)

(declare-fun mapDefault!3832 () ValueCell!980)

(assert (=> mapNonEmpty!3815 (= condMapEmpty!3832 (= mapRest!3816 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3832)))))

(declare-fun e!66271 () Bool)

(assert (=> mapNonEmpty!3815 (= tp!9688 (and e!66271 mapRes!3832))))

(declare-fun b!101811 () Bool)

(declare-fun e!66272 () Bool)

(assert (=> b!101811 (= e!66272 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3832 () Bool)

(declare-fun tp!9718 () Bool)

(assert (=> mapNonEmpty!3832 (= mapRes!3832 (and tp!9718 e!66272))))

(declare-fun mapKey!3832 () (_ BitVec 32))

(declare-fun mapRest!3832 () (Array (_ BitVec 32) ValueCell!980))

(declare-fun mapValue!3832 () ValueCell!980)

(assert (=> mapNonEmpty!3832 (= mapRest!3816 (store mapRest!3832 mapKey!3832 mapValue!3832))))

(declare-fun b!101812 () Bool)

(assert (=> b!101812 (= e!66271 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3815 condMapEmpty!3832) mapIsEmpty!3832))

(assert (= (and mapNonEmpty!3815 (not condMapEmpty!3832)) mapNonEmpty!3832))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!980) mapValue!3832)) b!101811))

(assert (= (and mapNonEmpty!3815 ((_ is ValueCellFull!980) mapDefault!3832)) b!101812))

(declare-fun m!112647 () Bool)

(assert (=> mapNonEmpty!3832 m!112647))

(declare-fun b_lambda!4559 () Bool)

(assert (= b_lambda!4557 (or (and b!101408 b_free!2461) (and b!101403 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))))) b_lambda!4559)))

(check-sat (not bm!10562) (not bm!10587) (not b!101794) (not bm!10586) (not b!101758) (not b!101747) (not b!101686) (not d!27539) (not b_next!2461) (not b!101648) (not b!101781) (not bm!10543) (not bm!10590) (not b!101757) (not b_next!2463) (not bm!10593) (not b_lambda!4555) (not b!101783) b_and!6267 (not bm!10548) (not bm!10582) (not b!101756) (not b!101649) (not b!101800) (not b!101645) (not bm!10551) (not d!27525) (not d!27531) (not b!101796) (not d!27535) (not b!101558) (not b!101736) (not b!101738) (not mapNonEmpty!3832) (not b!101802) (not b!101740) (not b!101742) (not bm!10594) (not d!27519) (not b!101741) (not bm!10544) (not bm!10559) (not d!27529) (not b!101675) (not b!101798) (not bm!10553) (not d!27521) (not b!101679) (not b!101670) tp_is_empty!2647 (not b!101785) (not mapNonEmpty!3831) (not b!101769) (not bm!10560) b_and!6265 (not d!27527) (not bm!10554) (not b!101746) (not b!101658) (not b_lambda!4559) (not d!27533) (not b!101560) (not bm!10581) (not b!101764) (not bm!10564) (not b!101732) (not bm!10566) (not bm!10556) (not b!101685))
(check-sat b_and!6265 b_and!6267 (not b_next!2461) (not b_next!2463))
(get-model)

(declare-fun b!101829 () Bool)

(declare-fun res!50973 () Bool)

(declare-fun e!66284 () Bool)

(assert (=> b!101829 (=> (not res!50973) (not e!66284))))

(declare-fun call!10603 () Bool)

(assert (=> b!101829 (= res!50973 call!10603)))

(declare-fun e!66283 () Bool)

(assert (=> b!101829 (= e!66283 e!66284)))

(declare-fun d!27557 () Bool)

(declare-fun e!66281 () Bool)

(assert (=> d!27557 e!66281))

(declare-fun c!17535 () Bool)

(declare-fun lt!51653 () SeekEntryResult!250)

(assert (=> d!27557 (= c!17535 ((_ is MissingZero!250) lt!51653))))

(assert (=> d!27557 (= lt!51653 (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun lt!51652 () Unit!3077)

(declare-fun choose!633 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3077)

(assert (=> d!27557 (= lt!51652 (choose!633 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27557 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27557 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)) lt!51652)))

(declare-fun b!101830 () Bool)

(declare-fun e!66282 () Bool)

(declare-fun call!10602 () Bool)

(assert (=> b!101830 (= e!66282 (not call!10602))))

(declare-fun bm!10599 () Bool)

(assert (=> bm!10599 (= call!10603 (inRange!0 (ite c!17535 (index!3146 lt!51653) (index!3149 lt!51653)) (mask!6658 newMap!16)))))

(declare-fun b!101831 () Bool)

(declare-fun res!50974 () Bool)

(assert (=> b!101831 (=> (not res!50974) (not e!66284))))

(assert (=> b!101831 (= res!50974 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3149 lt!51653)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101831 (and (bvsge (index!3149 lt!51653) #b00000000000000000000000000000000) (bvslt (index!3149 lt!51653) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!101832 () Bool)

(assert (=> b!101832 (and (bvsge (index!3146 lt!51653) #b00000000000000000000000000000000) (bvslt (index!3146 lt!51653) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun res!50975 () Bool)

(assert (=> b!101832 (= res!50975 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3146 lt!51653)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101832 (=> (not res!50975) (not e!66282))))

(declare-fun b!101833 () Bool)

(assert (=> b!101833 (= e!66281 e!66283)))

(declare-fun c!17534 () Bool)

(assert (=> b!101833 (= c!17534 ((_ is MissingVacant!250) lt!51653))))

(declare-fun bm!10600 () Bool)

(assert (=> bm!10600 (= call!10602 (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101834 () Bool)

(assert (=> b!101834 (= e!66284 (not call!10602))))

(declare-fun b!101835 () Bool)

(assert (=> b!101835 (= e!66283 ((_ is Undefined!250) lt!51653))))

(declare-fun b!101836 () Bool)

(assert (=> b!101836 (= e!66281 e!66282)))

(declare-fun res!50976 () Bool)

(assert (=> b!101836 (= res!50976 call!10603)))

(assert (=> b!101836 (=> (not res!50976) (not e!66282))))

(assert (= (and d!27557 c!17535) b!101836))

(assert (= (and d!27557 (not c!17535)) b!101833))

(assert (= (and b!101836 res!50976) b!101832))

(assert (= (and b!101832 res!50975) b!101830))

(assert (= (and b!101833 c!17534) b!101829))

(assert (= (and b!101833 (not c!17534)) b!101835))

(assert (= (and b!101829 res!50973) b!101831))

(assert (= (and b!101831 res!50974) b!101834))

(assert (= (or b!101836 b!101829) bm!10599))

(assert (= (or b!101830 b!101834) bm!10600))

(declare-fun m!112649 () Bool)

(assert (=> b!101831 m!112649))

(declare-fun m!112651 () Bool)

(assert (=> bm!10599 m!112651))

(assert (=> d!27557 m!112337))

(assert (=> d!27557 m!112489))

(assert (=> d!27557 m!112337))

(declare-fun m!112653 () Bool)

(assert (=> d!27557 m!112653))

(declare-fun m!112655 () Bool)

(assert (=> d!27557 m!112655))

(declare-fun m!112657 () Bool)

(assert (=> b!101832 m!112657))

(assert (=> bm!10600 m!112337))

(assert (=> bm!10600 m!112539))

(assert (=> bm!10559 d!27557))

(declare-fun d!27559 () Bool)

(assert (=> d!27559 (isDefined!106 (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun lt!51656 () Unit!3077)

(declare-fun choose!634 (List!1576 (_ BitVec 64)) Unit!3077)

(assert (=> d!27559 (= lt!51656 (choose!634 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun e!66287 () Bool)

(assert (=> d!27559 e!66287))

(declare-fun res!50979 () Bool)

(assert (=> d!27559 (=> (not res!50979) (not e!66287))))

(declare-fun isStrictlySorted!294 (List!1576) Bool)

(assert (=> d!27559 (= res!50979 (isStrictlySorted!294 (toList!771 lt!51422)))))

(assert (=> d!27559 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) lt!51656)))

(declare-fun b!101839 () Bool)

(assert (=> b!101839 (= e!66287 (containsKey!157 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (= (and d!27559 res!50979) b!101839))

(assert (=> d!27559 m!112337))

(assert (=> d!27559 m!112485))

(assert (=> d!27559 m!112485))

(assert (=> d!27559 m!112487))

(assert (=> d!27559 m!112337))

(declare-fun m!112659 () Bool)

(assert (=> d!27559 m!112659))

(declare-fun m!112661 () Bool)

(assert (=> d!27559 m!112661))

(assert (=> b!101839 m!112337))

(assert (=> b!101839 m!112481))

(assert (=> b!101558 d!27559))

(declare-fun d!27561 () Bool)

(declare-fun isEmpty!370 (Option!160) Bool)

(assert (=> d!27561 (= (isDefined!106 (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))) (not (isEmpty!370 (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))))

(declare-fun bs!4209 () Bool)

(assert (= bs!4209 d!27561))

(assert (=> bs!4209 m!112485))

(declare-fun m!112663 () Bool)

(assert (=> bs!4209 m!112663))

(assert (=> b!101558 d!27561))

(declare-fun b!101851 () Bool)

(declare-fun e!66293 () Option!160)

(assert (=> b!101851 (= e!66293 None!158)))

(declare-fun b!101849 () Bool)

(declare-fun e!66292 () Option!160)

(assert (=> b!101849 (= e!66292 e!66293)))

(declare-fun c!17541 () Bool)

(assert (=> b!101849 (= c!17541 (and ((_ is Cons!1572) (toList!771 lt!51422)) (not (= (_1!1173 (h!2168 (toList!771 lt!51422))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))))

(declare-fun b!101850 () Bool)

(assert (=> b!101850 (= e!66293 (getValueByKey!154 (t!5578 (toList!771 lt!51422)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun c!17540 () Bool)

(declare-fun d!27563 () Bool)

(assert (=> d!27563 (= c!17540 (and ((_ is Cons!1572) (toList!771 lt!51422)) (= (_1!1173 (h!2168 (toList!771 lt!51422))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (=> d!27563 (= (getValueByKey!154 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) e!66292)))

(declare-fun b!101848 () Bool)

(assert (=> b!101848 (= e!66292 (Some!159 (_2!1173 (h!2168 (toList!771 lt!51422)))))))

(assert (= (and d!27563 c!17540) b!101848))

(assert (= (and d!27563 (not c!17540)) b!101849))

(assert (= (and b!101849 c!17541) b!101850))

(assert (= (and b!101849 (not c!17541)) b!101851))

(assert (=> b!101850 m!112337))

(declare-fun m!112665 () Bool)

(assert (=> b!101850 m!112665))

(assert (=> b!101558 d!27563))

(declare-fun bm!10603 () Bool)

(declare-fun call!10606 () ListLongMap!1511)

(assert (=> bm!10603 (= call!10606 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101876 () Bool)

(declare-fun e!66310 () ListLongMap!1511)

(assert (=> b!101876 (= e!66310 (ListLongMap!1512 Nil!1573))))

(declare-fun b!101877 () Bool)

(assert (=> b!101877 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> b!101877 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2278 (_values!2518 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun lt!51675 () ListLongMap!1511)

(declare-fun e!66314 () Bool)

(assert (=> b!101877 (= e!66314 (= (apply!95 lt!51675 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101878 () Bool)

(declare-fun e!66309 () Bool)

(assert (=> b!101878 (= e!66309 (= lt!51675 (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun d!27565 () Bool)

(declare-fun e!66311 () Bool)

(assert (=> d!27565 e!66311))

(declare-fun res!50990 () Bool)

(assert (=> d!27565 (=> (not res!50990) (not e!66311))))

(assert (=> d!27565 (= res!50990 (not (contains!800 lt!51675 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27565 (= lt!51675 e!66310)))

(declare-fun c!17553 () Bool)

(assert (=> d!27565 (= c!17553 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27565 (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992))))))

(assert (=> d!27565 (= (getCurrentListMapNoExtraKeys!98 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) lt!51675)))

(declare-fun b!101879 () Bool)

(declare-fun isEmpty!371 (ListLongMap!1511) Bool)

(assert (=> b!101879 (= e!66309 (isEmpty!371 lt!51675))))

(declare-fun b!101880 () Bool)

(declare-fun e!66308 () Bool)

(assert (=> b!101880 (= e!66308 e!66309)))

(declare-fun c!17552 () Bool)

(assert (=> b!101880 (= c!17552 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101881 () Bool)

(declare-fun lt!51676 () Unit!3077)

(declare-fun lt!51674 () Unit!3077)

(assert (=> b!101881 (= lt!51676 lt!51674)))

(declare-fun lt!51671 () (_ BitVec 64))

(declare-fun lt!51673 () (_ BitVec 64))

(declare-fun lt!51672 () ListLongMap!1511)

(declare-fun lt!51677 () V!3177)

(assert (=> b!101881 (not (contains!800 (+!133 lt!51672 (tuple2!2325 lt!51673 lt!51677)) lt!51671))))

(declare-fun addStillNotContains!45 (ListLongMap!1511 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3077)

(assert (=> b!101881 (= lt!51674 (addStillNotContains!45 lt!51672 lt!51673 lt!51677 lt!51671))))

(assert (=> b!101881 (= lt!51671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!101881 (= lt!51677 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101881 (= lt!51673 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101881 (= lt!51672 call!10606)))

(declare-fun e!66313 () ListLongMap!1511)

(assert (=> b!101881 (= e!66313 (+!133 call!10606 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!101882 () Bool)

(assert (=> b!101882 (= e!66310 e!66313)))

(declare-fun c!17550 () Bool)

(assert (=> b!101882 (= c!17550 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101883 () Bool)

(declare-fun e!66312 () Bool)

(assert (=> b!101883 (= e!66312 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101883 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!101884 () Bool)

(assert (=> b!101884 (= e!66313 call!10606)))

(declare-fun b!101885 () Bool)

(assert (=> b!101885 (= e!66311 e!66308)))

(declare-fun c!17551 () Bool)

(assert (=> b!101885 (= c!17551 e!66312)))

(declare-fun res!50991 () Bool)

(assert (=> b!101885 (=> (not res!50991) (not e!66312))))

(assert (=> b!101885 (= res!50991 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101886 () Bool)

(declare-fun res!50988 () Bool)

(assert (=> b!101886 (=> (not res!50988) (not e!66311))))

(assert (=> b!101886 (= res!50988 (not (contains!800 lt!51675 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101887 () Bool)

(assert (=> b!101887 (= e!66308 e!66314)))

(assert (=> b!101887 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun res!50989 () Bool)

(assert (=> b!101887 (= res!50989 (contains!800 lt!51675 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101887 (=> (not res!50989) (not e!66314))))

(assert (= (and d!27565 c!17553) b!101876))

(assert (= (and d!27565 (not c!17553)) b!101882))

(assert (= (and b!101882 c!17550) b!101881))

(assert (= (and b!101882 (not c!17550)) b!101884))

(assert (= (or b!101881 b!101884) bm!10603))

(assert (= (and d!27565 res!50990) b!101886))

(assert (= (and b!101886 res!50988) b!101885))

(assert (= (and b!101885 res!50991) b!101883))

(assert (= (and b!101885 c!17551) b!101887))

(assert (= (and b!101885 (not c!17551)) b!101880))

(assert (= (and b!101887 res!50989) b!101877))

(assert (= (and b!101880 c!17552) b!101878))

(assert (= (and b!101880 (not c!17552)) b!101879))

(declare-fun b_lambda!4561 () Bool)

(assert (=> (not b_lambda!4561) (not b!101877)))

(assert (=> b!101877 t!5574))

(declare-fun b_and!6269 () Bool)

(assert (= b_and!6265 (and (=> t!5574 result!3331) b_and!6269)))

(assert (=> b!101877 t!5576))

(declare-fun b_and!6271 () Bool)

(assert (= b_and!6267 (and (=> t!5576 result!3335) b_and!6271)))

(declare-fun b_lambda!4563 () Bool)

(assert (=> (not b_lambda!4563) (not b!101881)))

(assert (=> b!101881 t!5574))

(declare-fun b_and!6273 () Bool)

(assert (= b_and!6269 (and (=> t!5574 result!3331) b_and!6273)))

(assert (=> b!101881 t!5576))

(declare-fun b_and!6275 () Bool)

(assert (= b_and!6271 (and (=> t!5576 result!3335) b_and!6275)))

(declare-fun m!112667 () Bool)

(assert (=> d!27565 m!112667))

(assert (=> d!27565 m!112383))

(assert (=> b!101883 m!112549))

(assert (=> b!101883 m!112549))

(assert (=> b!101883 m!112551))

(declare-fun m!112669 () Bool)

(assert (=> bm!10603 m!112669))

(assert (=> b!101878 m!112669))

(declare-fun m!112671 () Bool)

(assert (=> b!101881 m!112671))

(assert (=> b!101881 m!112549))

(assert (=> b!101881 m!112351))

(assert (=> b!101881 m!112597))

(assert (=> b!101881 m!112597))

(assert (=> b!101881 m!112351))

(assert (=> b!101881 m!112601))

(declare-fun m!112673 () Bool)

(assert (=> b!101881 m!112673))

(assert (=> b!101881 m!112671))

(declare-fun m!112675 () Bool)

(assert (=> b!101881 m!112675))

(declare-fun m!112677 () Bool)

(assert (=> b!101881 m!112677))

(assert (=> b!101887 m!112549))

(assert (=> b!101887 m!112549))

(declare-fun m!112679 () Bool)

(assert (=> b!101887 m!112679))

(declare-fun m!112681 () Bool)

(assert (=> b!101879 m!112681))

(assert (=> b!101877 m!112549))

(assert (=> b!101877 m!112597))

(assert (=> b!101877 m!112597))

(assert (=> b!101877 m!112351))

(assert (=> b!101877 m!112601))

(assert (=> b!101877 m!112351))

(assert (=> b!101877 m!112549))

(declare-fun m!112683 () Bool)

(assert (=> b!101877 m!112683))

(assert (=> b!101882 m!112549))

(assert (=> b!101882 m!112549))

(assert (=> b!101882 m!112551))

(declare-fun m!112685 () Bool)

(assert (=> b!101886 m!112685))

(assert (=> bm!10586 d!27565))

(declare-fun d!27567 () Bool)

(declare-fun get!1312 (Option!160) V!3177)

(assert (=> d!27567 (= (apply!95 lt!51617 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1312 (getValueByKey!154 (toList!771 lt!51617) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4210 () Bool)

(assert (= bs!4210 d!27567))

(assert (=> bs!4210 m!112549))

(declare-fun m!112687 () Bool)

(assert (=> bs!4210 m!112687))

(assert (=> bs!4210 m!112687))

(declare-fun m!112689 () Bool)

(assert (=> bs!4210 m!112689))

(assert (=> b!101746 d!27567))

(declare-fun d!27569 () Bool)

(declare-fun c!17554 () Bool)

(assert (=> d!27569 (= c!17554 ((_ is ValueCellFull!980) (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!66315 () V!3177)

(assert (=> d!27569 (= (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!66315)))

(declare-fun b!101888 () Bool)

(assert (=> b!101888 (= e!66315 (get!1310 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101889 () Bool)

(assert (=> b!101889 (= e!66315 (get!1311 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27569 c!17554) b!101888))

(assert (= (and d!27569 (not c!17554)) b!101889))

(assert (=> b!101888 m!112597))

(assert (=> b!101888 m!112351))

(declare-fun m!112691 () Bool)

(assert (=> b!101888 m!112691))

(assert (=> b!101889 m!112597))

(assert (=> b!101889 m!112351))

(declare-fun m!112693 () Bool)

(assert (=> b!101889 m!112693))

(assert (=> b!101746 d!27569))

(declare-fun d!27571 () Bool)

(declare-fun e!66318 () Bool)

(assert (=> d!27571 e!66318))

(declare-fun res!50996 () Bool)

(assert (=> d!27571 (=> (not res!50996) (not e!66318))))

(declare-fun lt!51689 () ListLongMap!1511)

(assert (=> d!27571 (= res!50996 (contains!800 lt!51689 (_1!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun lt!51687 () List!1576)

(assert (=> d!27571 (= lt!51689 (ListLongMap!1512 lt!51687))))

(declare-fun lt!51688 () Unit!3077)

(declare-fun lt!51686 () Unit!3077)

(assert (=> d!27571 (= lt!51688 lt!51686)))

(assert (=> d!27571 (= (getValueByKey!154 lt!51687 (_1!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))) (Some!159 (_2!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!70 (List!1576 (_ BitVec 64) V!3177) Unit!3077)

(assert (=> d!27571 (= lt!51686 (lemmaContainsTupThenGetReturnValue!70 lt!51687 (_1!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (_2!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun insertStrictlySorted!73 (List!1576 (_ BitVec 64) V!3177) List!1576)

(assert (=> d!27571 (= lt!51687 (insertStrictlySorted!73 (toList!771 (ite c!17516 call!10585 (ite c!17519 call!10588 call!10586))) (_1!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (_2!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(assert (=> d!27571 (= (+!133 (ite c!17516 call!10585 (ite c!17519 call!10588 call!10586)) (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51689)))

(declare-fun b!101894 () Bool)

(declare-fun res!50997 () Bool)

(assert (=> b!101894 (=> (not res!50997) (not e!66318))))

(assert (=> b!101894 (= res!50997 (= (getValueByKey!154 (toList!771 lt!51689) (_1!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))) (Some!159 (_2!1173 (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))))

(declare-fun b!101895 () Bool)

(declare-fun contains!802 (List!1576 tuple2!2324) Bool)

(assert (=> b!101895 (= e!66318 (contains!802 (toList!771 lt!51689) (ite (or c!17516 c!17519) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (= (and d!27571 res!50996) b!101894))

(assert (= (and b!101894 res!50997) b!101895))

(declare-fun m!112695 () Bool)

(assert (=> d!27571 m!112695))

(declare-fun m!112697 () Bool)

(assert (=> d!27571 m!112697))

(declare-fun m!112699 () Bool)

(assert (=> d!27571 m!112699))

(declare-fun m!112701 () Bool)

(assert (=> d!27571 m!112701))

(declare-fun m!112703 () Bool)

(assert (=> b!101894 m!112703))

(declare-fun m!112705 () Bool)

(assert (=> b!101895 m!112705))

(assert (=> bm!10581 d!27571))

(declare-fun d!27573 () Bool)

(declare-fun lt!51698 () SeekEntryResult!250)

(assert (=> d!27573 (and (or ((_ is Undefined!250) lt!51698) (not ((_ is Found!250) lt!51698)) (and (bvsge (index!3147 lt!51698) #b00000000000000000000000000000000) (bvslt (index!3147 lt!51698) (size!2277 (_keys!4235 newMap!16))))) (or ((_ is Undefined!250) lt!51698) ((_ is Found!250) lt!51698) (not ((_ is MissingZero!250) lt!51698)) (and (bvsge (index!3146 lt!51698) #b00000000000000000000000000000000) (bvslt (index!3146 lt!51698) (size!2277 (_keys!4235 newMap!16))))) (or ((_ is Undefined!250) lt!51698) ((_ is Found!250) lt!51698) ((_ is MissingZero!250) lt!51698) (not ((_ is MissingVacant!250) lt!51698)) (and (bvsge (index!3149 lt!51698) #b00000000000000000000000000000000) (bvslt (index!3149 lt!51698) (size!2277 (_keys!4235 newMap!16))))) (or ((_ is Undefined!250) lt!51698) (ite ((_ is Found!250) lt!51698) (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51698)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (ite ((_ is MissingZero!250) lt!51698) (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3146 lt!51698)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!250) lt!51698) (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3149 lt!51698)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!66326 () SeekEntryResult!250)

(assert (=> d!27573 (= lt!51698 e!66326)))

(declare-fun c!17561 () Bool)

(declare-fun lt!51697 () SeekEntryResult!250)

(assert (=> d!27573 (= c!17561 (and ((_ is Intermediate!250) lt!51697) (undefined!1062 lt!51697)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4265 (_ BitVec 32)) SeekEntryResult!250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27573 (= lt!51697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (mask!6658 newMap!16)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(assert (=> d!27573 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27573 (= (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)) lt!51698)))

(declare-fun e!66327 () SeekEntryResult!250)

(declare-fun b!101908 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4265 (_ BitVec 32)) SeekEntryResult!250)

(assert (=> b!101908 (= e!66327 (seekKeyOrZeroReturnVacant!0 (x!13333 lt!51697) (index!3148 lt!51697) (index!3148 lt!51697) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun b!101909 () Bool)

(assert (=> b!101909 (= e!66327 (MissingZero!250 (index!3148 lt!51697)))))

(declare-fun b!101910 () Bool)

(declare-fun e!66325 () SeekEntryResult!250)

(assert (=> b!101910 (= e!66326 e!66325)))

(declare-fun lt!51696 () (_ BitVec 64))

(assert (=> b!101910 (= lt!51696 (select (arr!2024 (_keys!4235 newMap!16)) (index!3148 lt!51697)))))

(declare-fun c!17563 () Bool)

(assert (=> b!101910 (= c!17563 (= lt!51696 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101911 () Bool)

(declare-fun c!17562 () Bool)

(assert (=> b!101911 (= c!17562 (= lt!51696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101911 (= e!66325 e!66327)))

(declare-fun b!101912 () Bool)

(assert (=> b!101912 (= e!66325 (Found!250 (index!3148 lt!51697)))))

(declare-fun b!101913 () Bool)

(assert (=> b!101913 (= e!66326 Undefined!250)))

(assert (= (and d!27573 c!17561) b!101913))

(assert (= (and d!27573 (not c!17561)) b!101910))

(assert (= (and b!101910 c!17563) b!101912))

(assert (= (and b!101910 (not c!17563)) b!101911))

(assert (= (and b!101911 c!17562) b!101909))

(assert (= (and b!101911 (not c!17562)) b!101908))

(declare-fun m!112707 () Bool)

(assert (=> d!27573 m!112707))

(declare-fun m!112709 () Bool)

(assert (=> d!27573 m!112709))

(assert (=> d!27573 m!112337))

(declare-fun m!112711 () Bool)

(assert (=> d!27573 m!112711))

(declare-fun m!112713 () Bool)

(assert (=> d!27573 m!112713))

(assert (=> d!27573 m!112655))

(declare-fun m!112715 () Bool)

(assert (=> d!27573 m!112715))

(assert (=> d!27573 m!112337))

(assert (=> d!27573 m!112709))

(assert (=> b!101908 m!112337))

(declare-fun m!112717 () Bool)

(assert (=> b!101908 m!112717))

(declare-fun m!112719 () Bool)

(assert (=> b!101910 m!112719))

(assert (=> bm!10544 d!27573))

(declare-fun d!27575 () Bool)

(declare-fun res!50998 () Bool)

(declare-fun e!66328 () Bool)

(assert (=> d!27575 (=> (not res!50998) (not e!66328))))

(assert (=> d!27575 (= res!50998 (simpleValid!71 (v!2845 (underlying!347 thiss!992))))))

(assert (=> d!27575 (= (valid!403 (v!2845 (underlying!347 thiss!992))) e!66328)))

(declare-fun b!101914 () Bool)

(declare-fun res!50999 () Bool)

(assert (=> b!101914 (=> (not res!50999) (not e!66328))))

(assert (=> b!101914 (= res!50999 (= (arrayCountValidKeys!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))) (_size!483 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101915 () Bool)

(declare-fun res!51000 () Bool)

(assert (=> b!101915 (=> (not res!51000) (not e!66328))))

(assert (=> b!101915 (= res!51000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101916 () Bool)

(assert (=> b!101916 (= e!66328 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 Nil!1572))))

(assert (= (and d!27575 res!50998) b!101914))

(assert (= (and b!101914 res!50999) b!101915))

(assert (= (and b!101915 res!51000) b!101916))

(declare-fun m!112721 () Bool)

(assert (=> d!27575 m!112721))

(declare-fun m!112723 () Bool)

(assert (=> b!101914 m!112723))

(assert (=> b!101915 m!112375))

(assert (=> b!101916 m!112377))

(assert (=> d!27529 d!27575))

(declare-fun call!10607 () Bool)

(declare-fun c!17564 () Bool)

(declare-fun bm!10604 () Bool)

(assert (=> bm!10604 (= call!10607 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17564 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!17529 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) Nil!1572) Nil!1572)) (ite c!17529 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) Nil!1572) Nil!1572))))))

(declare-fun b!101917 () Bool)

(declare-fun e!66331 () Bool)

(declare-fun e!66329 () Bool)

(assert (=> b!101917 (= e!66331 e!66329)))

(assert (=> b!101917 (= c!17564 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101918 () Bool)

(assert (=> b!101918 (= e!66329 call!10607)))

(declare-fun b!101919 () Bool)

(declare-fun e!66332 () Bool)

(assert (=> b!101919 (= e!66332 e!66331)))

(declare-fun res!51002 () Bool)

(assert (=> b!101919 (=> (not res!51002) (not e!66331))))

(declare-fun e!66330 () Bool)

(assert (=> b!101919 (= res!51002 (not e!66330))))

(declare-fun res!51003 () Bool)

(assert (=> b!101919 (=> (not res!51003) (not e!66330))))

(assert (=> b!101919 (= res!51003 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101920 () Bool)

(assert (=> b!101920 (= e!66329 call!10607)))

(declare-fun b!101921 () Bool)

(assert (=> b!101921 (= e!66330 (contains!801 (ite c!17529 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) Nil!1572) Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!27577 () Bool)

(declare-fun res!51001 () Bool)

(assert (=> d!27577 (=> res!51001 e!66332)))

(assert (=> d!27577 (= res!51001 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27577 (= (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17529 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) Nil!1572) Nil!1572)) e!66332)))

(assert (= (and d!27577 (not res!51001)) b!101919))

(assert (= (and b!101919 res!51003) b!101921))

(assert (= (and b!101919 res!51002) b!101917))

(assert (= (and b!101917 c!17564) b!101918))

(assert (= (and b!101917 (not c!17564)) b!101920))

(assert (= (or b!101918 b!101920) bm!10604))

(declare-fun m!112725 () Bool)

(assert (=> bm!10604 m!112725))

(declare-fun m!112727 () Bool)

(assert (=> bm!10604 m!112727))

(assert (=> b!101917 m!112725))

(assert (=> b!101917 m!112725))

(declare-fun m!112729 () Bool)

(assert (=> b!101917 m!112729))

(assert (=> b!101919 m!112725))

(assert (=> b!101919 m!112725))

(assert (=> b!101919 m!112729))

(assert (=> b!101921 m!112725))

(assert (=> b!101921 m!112725))

(declare-fun m!112731 () Bool)

(assert (=> b!101921 m!112731))

(assert (=> bm!10594 d!27577))

(assert (=> d!27533 d!27537))

(declare-fun d!27579 () Bool)

(assert (=> d!27579 (not (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27579 true))

(declare-fun _$68!100 () Unit!3077)

(assert (=> d!27579 (= (choose!68 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572)) _$68!100)))

(declare-fun bs!4211 () Bool)

(assert (= bs!4211 d!27579))

(assert (=> bs!4211 m!112337))

(assert (=> bs!4211 m!112365))

(assert (=> d!27533 d!27579))

(declare-fun d!27581 () Bool)

(declare-fun e!66334 () Bool)

(assert (=> d!27581 e!66334))

(declare-fun res!51004 () Bool)

(assert (=> d!27581 (=> res!51004 e!66334)))

(declare-fun lt!51701 () Bool)

(assert (=> d!27581 (= res!51004 (not lt!51701))))

(declare-fun lt!51699 () Bool)

(assert (=> d!27581 (= lt!51701 lt!51699)))

(declare-fun lt!51702 () Unit!3077)

(declare-fun e!66333 () Unit!3077)

(assert (=> d!27581 (= lt!51702 e!66333)))

(declare-fun c!17565 () Bool)

(assert (=> d!27581 (= c!17565 lt!51699)))

(assert (=> d!27581 (= lt!51699 (containsKey!157 (toList!771 lt!51617) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27581 (= (contains!800 lt!51617 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51701)))

(declare-fun b!101922 () Bool)

(declare-fun lt!51700 () Unit!3077)

(assert (=> b!101922 (= e!66333 lt!51700)))

(assert (=> b!101922 (= lt!51700 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 lt!51617) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101922 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101923 () Bool)

(declare-fun Unit!3088 () Unit!3077)

(assert (=> b!101923 (= e!66333 Unit!3088)))

(declare-fun b!101924 () Bool)

(assert (=> b!101924 (= e!66334 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27581 c!17565) b!101922))

(assert (= (and d!27581 (not c!17565)) b!101923))

(assert (= (and d!27581 (not res!51004)) b!101924))

(assert (=> d!27581 m!112549))

(declare-fun m!112733 () Bool)

(assert (=> d!27581 m!112733))

(assert (=> b!101922 m!112549))

(declare-fun m!112735 () Bool)

(assert (=> b!101922 m!112735))

(assert (=> b!101922 m!112549))

(assert (=> b!101922 m!112687))

(assert (=> b!101922 m!112687))

(declare-fun m!112737 () Bool)

(assert (=> b!101922 m!112737))

(assert (=> b!101924 m!112549))

(assert (=> b!101924 m!112687))

(assert (=> b!101924 m!112687))

(assert (=> b!101924 m!112737))

(assert (=> b!101732 d!27581))

(declare-fun d!27583 () Bool)

(assert (=> d!27583 (= (get!1310 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2844 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> b!101685 d!27583))

(assert (=> b!101645 d!27573))

(assert (=> b!101560 d!27561))

(assert (=> b!101560 d!27563))

(declare-fun d!27585 () Bool)

(assert (=> d!27585 (= (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (and (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101781 d!27585))

(declare-fun d!27587 () Bool)

(declare-fun e!66336 () Bool)

(assert (=> d!27587 e!66336))

(declare-fun res!51005 () Bool)

(assert (=> d!27587 (=> res!51005 e!66336)))

(declare-fun lt!51705 () Bool)

(assert (=> d!27587 (= res!51005 (not lt!51705))))

(declare-fun lt!51703 () Bool)

(assert (=> d!27587 (= lt!51705 lt!51703)))

(declare-fun lt!51706 () Unit!3077)

(declare-fun e!66335 () Unit!3077)

(assert (=> d!27587 (= lt!51706 e!66335)))

(declare-fun c!17566 () Bool)

(assert (=> d!27587 (= c!17566 lt!51703)))

(assert (=> d!27587 (= lt!51703 (containsKey!157 (toList!771 e!66180) (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552)))))))

(assert (=> d!27587 (= (contains!800 e!66180 (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552)))) lt!51705)))

(declare-fun b!101925 () Bool)

(declare-fun lt!51704 () Unit!3077)

(assert (=> b!101925 (= e!66335 lt!51704)))

(assert (=> b!101925 (= lt!51704 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 e!66180) (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552)))))))

(assert (=> b!101925 (isDefined!106 (getValueByKey!154 (toList!771 e!66180) (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552)))))))

(declare-fun b!101926 () Bool)

(declare-fun Unit!3089 () Unit!3077)

(assert (=> b!101926 (= e!66335 Unit!3089)))

(declare-fun b!101927 () Bool)

(assert (=> b!101927 (= e!66336 (isDefined!106 (getValueByKey!154 (toList!771 e!66180) (ite c!17490 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552))))))))

(assert (= (and d!27587 c!17566) b!101925))

(assert (= (and d!27587 (not c!17566)) b!101926))

(assert (= (and d!27587 (not res!51005)) b!101927))

(declare-fun m!112739 () Bool)

(assert (=> d!27587 m!112739))

(declare-fun m!112741 () Bool)

(assert (=> b!101925 m!112741))

(declare-fun m!112743 () Bool)

(assert (=> b!101925 m!112743))

(assert (=> b!101925 m!112743))

(declare-fun m!112745 () Bool)

(assert (=> b!101925 m!112745))

(assert (=> b!101927 m!112743))

(assert (=> b!101927 m!112743))

(assert (=> b!101927 m!112745))

(assert (=> bm!10554 d!27587))

(declare-fun d!27589 () Bool)

(assert (=> d!27589 (= (+!133 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) lt!51551 (zeroValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51709 () Unit!3077)

(declare-fun choose!635 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3077)

(assert (=> d!27589 (= lt!51709 (choose!635 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51551 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27589 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27589 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51551 (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)) lt!51709)))

(declare-fun bs!4212 () Bool)

(assert (= bs!4212 d!27589))

(assert (=> bs!4212 m!112519))

(assert (=> bs!4212 m!112655))

(assert (=> bs!4212 m!112519))

(declare-fun m!112747 () Bool)

(assert (=> bs!4212 m!112747))

(assert (=> bs!4212 m!112353))

(declare-fun m!112749 () Bool)

(assert (=> bs!4212 m!112749))

(assert (=> bs!4212 m!112353))

(declare-fun m!112751 () Bool)

(assert (=> bs!4212 m!112751))

(assert (=> b!101675 d!27589))

(declare-fun d!27591 () Bool)

(declare-fun lt!51712 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!107 (List!1575) (InoxSet (_ BitVec 64)))

(assert (=> d!27591 (= lt!51712 (select (content!107 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun e!66342 () Bool)

(assert (=> d!27591 (= lt!51712 e!66342)))

(declare-fun res!51011 () Bool)

(assert (=> d!27591 (=> (not res!51011) (not e!66342))))

(assert (=> d!27591 (= res!51011 ((_ is Cons!1571) Nil!1572))))

(assert (=> d!27591 (= (contains!801 Nil!1572 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) lt!51712)))

(declare-fun b!101932 () Bool)

(declare-fun e!66341 () Bool)

(assert (=> b!101932 (= e!66342 e!66341)))

(declare-fun res!51010 () Bool)

(assert (=> b!101932 (=> res!51010 e!66341)))

(assert (=> b!101932 (= res!51010 (= (h!2167 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!101933 () Bool)

(assert (=> b!101933 (= e!66341 (contains!801 (t!5577 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (= (and d!27591 res!51011) b!101932))

(assert (= (and b!101932 (not res!51010)) b!101933))

(declare-fun m!112753 () Bool)

(assert (=> d!27591 m!112753))

(assert (=> d!27591 m!112337))

(declare-fun m!112755 () Bool)

(assert (=> d!27591 m!112755))

(assert (=> b!101933 m!112337))

(declare-fun m!112757 () Bool)

(assert (=> b!101933 m!112757))

(assert (=> b!101785 d!27591))

(declare-fun d!27593 () Bool)

(assert (=> d!27593 (= (apply!95 lt!51617 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1312 (getValueByKey!154 (toList!771 lt!51617) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4213 () Bool)

(assert (= bs!4213 d!27593))

(declare-fun m!112759 () Bool)

(assert (=> bs!4213 m!112759))

(assert (=> bs!4213 m!112759))

(declare-fun m!112761 () Bool)

(assert (=> bs!4213 m!112761))

(assert (=> b!101738 d!27593))

(declare-fun d!27595 () Bool)

(declare-fun res!51012 () Bool)

(declare-fun e!66343 () Bool)

(assert (=> d!27595 (=> (not res!51012) (not e!66343))))

(assert (=> d!27595 (= res!51012 (simpleValid!71 (_2!1172 lt!51549)))))

(assert (=> d!27595 (= (valid!403 (_2!1172 lt!51549)) e!66343)))

(declare-fun b!101934 () Bool)

(declare-fun res!51013 () Bool)

(assert (=> b!101934 (=> (not res!51013) (not e!66343))))

(assert (=> b!101934 (= res!51013 (= (arrayCountValidKeys!0 (_keys!4235 (_2!1172 lt!51549)) #b00000000000000000000000000000000 (size!2277 (_keys!4235 (_2!1172 lt!51549)))) (_size!483 (_2!1172 lt!51549))))))

(declare-fun b!101935 () Bool)

(declare-fun res!51014 () Bool)

(assert (=> b!101935 (=> (not res!51014) (not e!66343))))

(assert (=> b!101935 (= res!51014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 (_2!1172 lt!51549)) (mask!6658 (_2!1172 lt!51549))))))

(declare-fun b!101936 () Bool)

(assert (=> b!101936 (= e!66343 (arrayNoDuplicates!0 (_keys!4235 (_2!1172 lt!51549)) #b00000000000000000000000000000000 Nil!1572))))

(assert (= (and d!27595 res!51012) b!101934))

(assert (= (and b!101934 res!51013) b!101935))

(assert (= (and b!101935 res!51014) b!101936))

(declare-fun m!112763 () Bool)

(assert (=> d!27595 m!112763))

(declare-fun m!112765 () Bool)

(assert (=> b!101934 m!112765))

(declare-fun m!112767 () Bool)

(assert (=> b!101935 m!112767))

(declare-fun m!112769 () Bool)

(assert (=> b!101936 m!112769))

(assert (=> d!27521 d!27595))

(assert (=> d!27521 d!27531))

(assert (=> b!101783 d!27585))

(declare-fun d!27597 () Bool)

(assert (=> d!27597 (= (apply!95 lt!51617 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1312 (getValueByKey!154 (toList!771 lt!51617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4214 () Bool)

(assert (= bs!4214 d!27597))

(declare-fun m!112771 () Bool)

(assert (=> bs!4214 m!112771))

(assert (=> bs!4214 m!112771))

(declare-fun m!112773 () Bool)

(assert (=> bs!4214 m!112773))

(assert (=> b!101736 d!27597))

(declare-fun b!101937 () Bool)

(declare-fun e!66353 () Bool)

(declare-fun e!66348 () Bool)

(assert (=> b!101937 (= e!66353 e!66348)))

(declare-fun res!51016 () Bool)

(declare-fun call!10611 () Bool)

(assert (=> b!101937 (= res!51016 call!10611)))

(assert (=> b!101937 (=> (not res!51016) (not e!66348))))

(declare-fun call!10612 () ListLongMap!1511)

(declare-fun c!17569 () Bool)

(declare-fun call!10610 () ListLongMap!1511)

(declare-fun call!10608 () ListLongMap!1511)

(declare-fun bm!10605 () Bool)

(declare-fun call!10609 () ListLongMap!1511)

(declare-fun c!17572 () Bool)

(assert (=> bm!10605 (= call!10608 (+!133 (ite c!17569 call!10609 (ite c!17572 call!10612 call!10610)) (ite (or c!17569 c!17572) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 newMap!16)) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16)))))))

(declare-fun bm!10606 () Bool)

(declare-fun call!10613 () Bool)

(declare-fun lt!51722 () ListLongMap!1511)

(assert (=> bm!10606 (= call!10613 (contains!800 lt!51722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!27599 () Bool)

(declare-fun e!66350 () Bool)

(assert (=> d!27599 e!66350))

(declare-fun res!51019 () Bool)

(assert (=> d!27599 (=> (not res!51019) (not e!66350))))

(assert (=> d!27599 (= res!51019 (or (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))))

(declare-fun lt!51718 () ListLongMap!1511)

(assert (=> d!27599 (= lt!51722 lt!51718)))

(declare-fun lt!51716 () Unit!3077)

(declare-fun e!66346 () Unit!3077)

(assert (=> d!27599 (= lt!51716 e!66346)))

(declare-fun c!17568 () Bool)

(declare-fun e!66354 () Bool)

(assert (=> d!27599 (= c!17568 e!66354)))

(declare-fun res!51021 () Bool)

(assert (=> d!27599 (=> (not res!51021) (not e!66354))))

(assert (=> d!27599 (= res!51021 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun e!66345 () ListLongMap!1511)

(assert (=> d!27599 (= lt!51718 e!66345)))

(assert (=> d!27599 (= c!17569 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27599 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27599 (= (getCurrentListMap!459 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51722)))

(declare-fun b!101938 () Bool)

(assert (=> b!101938 (= e!66353 (not call!10611))))

(declare-fun b!101939 () Bool)

(declare-fun res!51017 () Bool)

(assert (=> b!101939 (=> (not res!51017) (not e!66350))))

(declare-fun e!66351 () Bool)

(assert (=> b!101939 (= res!51017 e!66351)))

(declare-fun c!17570 () Bool)

(assert (=> b!101939 (= c!17570 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101940 () Bool)

(declare-fun e!66355 () Bool)

(declare-fun e!66344 () Bool)

(assert (=> b!101940 (= e!66355 e!66344)))

(declare-fun res!51015 () Bool)

(assert (=> b!101940 (=> (not res!51015) (not e!66344))))

(assert (=> b!101940 (= res!51015 (contains!800 lt!51722 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!101941 () Bool)

(declare-fun e!66349 () Bool)

(assert (=> b!101941 (= e!66351 e!66349)))

(declare-fun res!51023 () Bool)

(assert (=> b!101941 (= res!51023 call!10613)))

(assert (=> b!101941 (=> (not res!51023) (not e!66349))))

(declare-fun b!101942 () Bool)

(declare-fun e!66356 () ListLongMap!1511)

(assert (=> b!101942 (= e!66345 e!66356)))

(assert (=> b!101942 (= c!17572 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101943 () Bool)

(declare-fun Unit!3090 () Unit!3077)

(assert (=> b!101943 (= e!66346 Unit!3090)))

(declare-fun b!101944 () Bool)

(assert (=> b!101944 (= e!66348 (= (apply!95 lt!51722 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 newMap!16)))))

(declare-fun b!101945 () Bool)

(declare-fun e!66352 () ListLongMap!1511)

(assert (=> b!101945 (= e!66352 call!10610)))

(declare-fun b!101946 () Bool)

(assert (=> b!101946 (= e!66349 (= (apply!95 lt!51722 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 newMap!16)))))

(declare-fun bm!10607 () Bool)

(declare-fun call!10614 () ListLongMap!1511)

(assert (=> bm!10607 (= call!10614 call!10608)))

(declare-fun bm!10608 () Bool)

(assert (=> bm!10608 (= call!10612 call!10609)))

(declare-fun b!101947 () Bool)

(assert (=> b!101947 (= e!66350 e!66353)))

(declare-fun c!17567 () Bool)

(assert (=> b!101947 (= c!17567 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101948 () Bool)

(assert (=> b!101948 (= e!66345 (+!133 call!10608 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16))))))

(declare-fun b!101949 () Bool)

(assert (=> b!101949 (= e!66354 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101950 () Bool)

(declare-fun e!66347 () Bool)

(assert (=> b!101950 (= e!66347 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10609 () Bool)

(assert (=> bm!10609 (= call!10610 call!10612)))

(declare-fun b!101951 () Bool)

(declare-fun c!17571 () Bool)

(assert (=> b!101951 (= c!17571 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!101951 (= e!66356 e!66352)))

(declare-fun bm!10610 () Bool)

(assert (=> bm!10610 (= call!10609 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!101952 () Bool)

(assert (=> b!101952 (= e!66352 call!10614)))

(declare-fun b!101953 () Bool)

(assert (=> b!101953 (= e!66351 (not call!10613))))

(declare-fun bm!10611 () Bool)

(assert (=> bm!10611 (= call!10611 (contains!800 lt!51722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101954 () Bool)

(assert (=> b!101954 (= e!66344 (= (apply!95 lt!51722 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)) (get!1309 (select (arr!2025 lt!51555) #b00000000000000000000000000000000) (dynLambda!376 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101954 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2278 lt!51555)))))

(assert (=> b!101954 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!101955 () Bool)

(declare-fun lt!51723 () Unit!3077)

(assert (=> b!101955 (= e!66346 lt!51723)))

(declare-fun lt!51715 () ListLongMap!1511)

(assert (=> b!101955 (= lt!51715 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51725 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51725 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51728 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51728 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51714 () Unit!3077)

(assert (=> b!101955 (= lt!51714 (addStillContains!71 lt!51715 lt!51725 (zeroValue!2413 newMap!16) lt!51728))))

(assert (=> b!101955 (contains!800 (+!133 lt!51715 (tuple2!2325 lt!51725 (zeroValue!2413 newMap!16))) lt!51728)))

(declare-fun lt!51732 () Unit!3077)

(assert (=> b!101955 (= lt!51732 lt!51714)))

(declare-fun lt!51734 () ListLongMap!1511)

(assert (=> b!101955 (= lt!51734 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51733 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51733 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51721 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51721 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51717 () Unit!3077)

(assert (=> b!101955 (= lt!51717 (addApplyDifferent!71 lt!51734 lt!51733 (minValue!2413 newMap!16) lt!51721))))

(assert (=> b!101955 (= (apply!95 (+!133 lt!51734 (tuple2!2325 lt!51733 (minValue!2413 newMap!16))) lt!51721) (apply!95 lt!51734 lt!51721))))

(declare-fun lt!51726 () Unit!3077)

(assert (=> b!101955 (= lt!51726 lt!51717)))

(declare-fun lt!51729 () ListLongMap!1511)

(assert (=> b!101955 (= lt!51729 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51730 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51724 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51724 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51720 () Unit!3077)

(assert (=> b!101955 (= lt!51720 (addApplyDifferent!71 lt!51729 lt!51730 (zeroValue!2413 newMap!16) lt!51724))))

(assert (=> b!101955 (= (apply!95 (+!133 lt!51729 (tuple2!2325 lt!51730 (zeroValue!2413 newMap!16))) lt!51724) (apply!95 lt!51729 lt!51724))))

(declare-fun lt!51713 () Unit!3077)

(assert (=> b!101955 (= lt!51713 lt!51720)))

(declare-fun lt!51731 () ListLongMap!1511)

(assert (=> b!101955 (= lt!51731 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51719 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51727 () (_ BitVec 64))

(assert (=> b!101955 (= lt!51727 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101955 (= lt!51723 (addApplyDifferent!71 lt!51731 lt!51719 (minValue!2413 newMap!16) lt!51727))))

(assert (=> b!101955 (= (apply!95 (+!133 lt!51731 (tuple2!2325 lt!51719 (minValue!2413 newMap!16))) lt!51727) (apply!95 lt!51731 lt!51727))))

(declare-fun b!101956 () Bool)

(declare-fun res!51020 () Bool)

(assert (=> b!101956 (=> (not res!51020) (not e!66350))))

(assert (=> b!101956 (= res!51020 e!66355)))

(declare-fun res!51022 () Bool)

(assert (=> b!101956 (=> res!51022 e!66355)))

(assert (=> b!101956 (= res!51022 (not e!66347))))

(declare-fun res!51018 () Bool)

(assert (=> b!101956 (=> (not res!51018) (not e!66347))))

(assert (=> b!101956 (= res!51018 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!101957 () Bool)

(assert (=> b!101957 (= e!66356 call!10614)))

(assert (= (and d!27599 c!17569) b!101948))

(assert (= (and d!27599 (not c!17569)) b!101942))

(assert (= (and b!101942 c!17572) b!101957))

(assert (= (and b!101942 (not c!17572)) b!101951))

(assert (= (and b!101951 c!17571) b!101952))

(assert (= (and b!101951 (not c!17571)) b!101945))

(assert (= (or b!101952 b!101945) bm!10609))

(assert (= (or b!101957 bm!10609) bm!10608))

(assert (= (or b!101957 b!101952) bm!10607))

(assert (= (or b!101948 bm!10608) bm!10610))

(assert (= (or b!101948 bm!10607) bm!10605))

(assert (= (and d!27599 res!51021) b!101949))

(assert (= (and d!27599 c!17568) b!101955))

(assert (= (and d!27599 (not c!17568)) b!101943))

(assert (= (and d!27599 res!51019) b!101956))

(assert (= (and b!101956 res!51018) b!101950))

(assert (= (and b!101956 (not res!51022)) b!101940))

(assert (= (and b!101940 res!51015) b!101954))

(assert (= (and b!101956 res!51020) b!101939))

(assert (= (and b!101939 c!17570) b!101941))

(assert (= (and b!101939 (not c!17570)) b!101953))

(assert (= (and b!101941 res!51023) b!101946))

(assert (= (or b!101941 b!101953) bm!10606))

(assert (= (and b!101939 res!51017) b!101947))

(assert (= (and b!101947 c!17567) b!101937))

(assert (= (and b!101947 (not c!17567)) b!101938))

(assert (= (and b!101937 res!51016) b!101944))

(assert (= (or b!101937 b!101938) bm!10611))

(declare-fun b_lambda!4565 () Bool)

(assert (=> (not b_lambda!4565) (not b!101954)))

(declare-fun t!5589 () Bool)

(declare-fun tb!1981 () Bool)

(assert (=> (and b!101408 (= (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) (defaultEntry!2535 newMap!16)) t!5589) tb!1981))

(declare-fun result!3351 () Bool)

(assert (=> tb!1981 (= result!3351 tp_is_empty!2647)))

(assert (=> b!101954 t!5589))

(declare-fun b_and!6277 () Bool)

(assert (= b_and!6273 (and (=> t!5589 result!3351) b_and!6277)))

(declare-fun t!5591 () Bool)

(declare-fun tb!1983 () Bool)

(assert (=> (and b!101403 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 newMap!16)) t!5591) tb!1983))

(declare-fun result!3353 () Bool)

(assert (= result!3353 result!3351))

(assert (=> b!101954 t!5591))

(declare-fun b_and!6279 () Bool)

(assert (= b_and!6275 (and (=> t!5591 result!3353) b_and!6279)))

(declare-fun m!112775 () Bool)

(assert (=> b!101949 m!112775))

(assert (=> b!101949 m!112775))

(declare-fun m!112777 () Bool)

(assert (=> b!101949 m!112777))

(assert (=> b!101950 m!112775))

(assert (=> b!101950 m!112775))

(assert (=> b!101950 m!112777))

(assert (=> b!101940 m!112775))

(assert (=> b!101940 m!112775))

(declare-fun m!112779 () Bool)

(assert (=> b!101940 m!112779))

(declare-fun m!112781 () Bool)

(assert (=> b!101955 m!112781))

(declare-fun m!112783 () Bool)

(assert (=> b!101955 m!112783))

(declare-fun m!112785 () Bool)

(assert (=> b!101955 m!112785))

(declare-fun m!112787 () Bool)

(assert (=> b!101955 m!112787))

(declare-fun m!112789 () Bool)

(assert (=> b!101955 m!112789))

(declare-fun m!112791 () Bool)

(assert (=> b!101955 m!112791))

(declare-fun m!112793 () Bool)

(assert (=> b!101955 m!112793))

(declare-fun m!112795 () Bool)

(assert (=> b!101955 m!112795))

(assert (=> b!101955 m!112775))

(declare-fun m!112797 () Bool)

(assert (=> b!101955 m!112797))

(assert (=> b!101955 m!112783))

(declare-fun m!112799 () Bool)

(assert (=> b!101955 m!112799))

(assert (=> b!101955 m!112789))

(declare-fun m!112801 () Bool)

(assert (=> b!101955 m!112801))

(assert (=> b!101955 m!112781))

(declare-fun m!112803 () Bool)

(assert (=> b!101955 m!112803))

(declare-fun m!112805 () Bool)

(assert (=> b!101955 m!112805))

(declare-fun m!112807 () Bool)

(assert (=> b!101955 m!112807))

(declare-fun m!112809 () Bool)

(assert (=> b!101955 m!112809))

(declare-fun m!112811 () Bool)

(assert (=> b!101955 m!112811))

(assert (=> b!101955 m!112805))

(declare-fun m!112813 () Bool)

(assert (=> b!101944 m!112813))

(declare-fun m!112815 () Bool)

(assert (=> b!101948 m!112815))

(declare-fun m!112817 () Bool)

(assert (=> b!101946 m!112817))

(assert (=> d!27599 m!112655))

(declare-fun m!112819 () Bool)

(assert (=> bm!10606 m!112819))

(declare-fun m!112821 () Bool)

(assert (=> bm!10611 m!112821))

(declare-fun m!112823 () Bool)

(assert (=> b!101954 m!112823))

(declare-fun m!112825 () Bool)

(assert (=> b!101954 m!112825))

(assert (=> b!101954 m!112775))

(declare-fun m!112827 () Bool)

(assert (=> b!101954 m!112827))

(assert (=> b!101954 m!112825))

(assert (=> b!101954 m!112823))

(declare-fun m!112829 () Bool)

(assert (=> b!101954 m!112829))

(assert (=> b!101954 m!112775))

(declare-fun m!112831 () Bool)

(assert (=> bm!10605 m!112831))

(assert (=> bm!10610 m!112797))

(assert (=> b!101648 d!27599))

(declare-fun b!101969 () Bool)

(declare-fun e!66359 () Bool)

(assert (=> b!101969 (= e!66359 (and (bvsge (extraKeys!2346 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2346 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!483 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!101966 () Bool)

(declare-fun res!51034 () Bool)

(assert (=> b!101966 (=> (not res!51034) (not e!66359))))

(assert (=> b!101966 (= res!51034 (and (= (size!2278 (_values!2518 newMap!16)) (bvadd (mask!6658 newMap!16) #b00000000000000000000000000000001)) (= (size!2277 (_keys!4235 newMap!16)) (size!2278 (_values!2518 newMap!16))) (bvsge (_size!483 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!483 newMap!16) (bvadd (mask!6658 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!27601 () Bool)

(declare-fun res!51033 () Bool)

(assert (=> d!27601 (=> (not res!51033) (not e!66359))))

(assert (=> d!27601 (= res!51033 (validMask!0 (mask!6658 newMap!16)))))

(assert (=> d!27601 (= (simpleValid!71 newMap!16) e!66359)))

(declare-fun b!101968 () Bool)

(declare-fun res!51032 () Bool)

(assert (=> b!101968 (=> (not res!51032) (not e!66359))))

(declare-fun size!2283 (LongMapFixedSize!868) (_ BitVec 32))

(assert (=> b!101968 (= res!51032 (= (size!2283 newMap!16) (bvadd (_size!483 newMap!16) (bvsdiv (bvadd (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!101967 () Bool)

(declare-fun res!51035 () Bool)

(assert (=> b!101967 (=> (not res!51035) (not e!66359))))

(assert (=> b!101967 (= res!51035 (bvsge (size!2283 newMap!16) (_size!483 newMap!16)))))

(assert (= (and d!27601 res!51033) b!101966))

(assert (= (and b!101966 res!51034) b!101967))

(assert (= (and b!101967 res!51035) b!101968))

(assert (= (and b!101968 res!51032) b!101969))

(assert (=> d!27601 m!112655))

(declare-fun m!112833 () Bool)

(assert (=> b!101968 m!112833))

(assert (=> b!101967 m!112833))

(assert (=> d!27531 d!27601))

(declare-fun d!27603 () Bool)

(declare-fun e!66360 () Bool)

(assert (=> d!27603 e!66360))

(declare-fun res!51036 () Bool)

(assert (=> d!27603 (=> (not res!51036) (not e!66360))))

(declare-fun lt!51738 () ListLongMap!1511)

(assert (=> d!27603 (= res!51036 (contains!800 lt!51738 (_1!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51736 () List!1576)

(assert (=> d!27603 (= lt!51738 (ListLongMap!1512 lt!51736))))

(declare-fun lt!51737 () Unit!3077)

(declare-fun lt!51735 () Unit!3077)

(assert (=> d!27603 (= lt!51737 lt!51735)))

(assert (=> d!27603 (= (getValueByKey!154 lt!51736 (_1!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!159 (_2!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27603 (= lt!51735 (lemmaContainsTupThenGetReturnValue!70 lt!51736 (_1!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27603 (= lt!51736 (insertStrictlySorted!73 (toList!771 call!10560) (_1!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27603 (= (+!133 call!10560 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51738)))

(declare-fun b!101970 () Bool)

(declare-fun res!51037 () Bool)

(assert (=> b!101970 (=> (not res!51037) (not e!66360))))

(assert (=> b!101970 (= res!51037 (= (getValueByKey!154 (toList!771 lt!51738) (_1!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!159 (_2!1173 (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!101971 () Bool)

(assert (=> b!101971 (= e!66360 (contains!802 (toList!771 lt!51738) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27603 res!51036) b!101970))

(assert (= (and b!101970 res!51037) b!101971))

(declare-fun m!112835 () Bool)

(assert (=> d!27603 m!112835))

(declare-fun m!112837 () Bool)

(assert (=> d!27603 m!112837))

(declare-fun m!112839 () Bool)

(assert (=> d!27603 m!112839))

(declare-fun m!112841 () Bool)

(assert (=> d!27603 m!112841))

(declare-fun m!112843 () Bool)

(assert (=> b!101970 m!112843))

(declare-fun m!112845 () Bool)

(assert (=> b!101971 m!112845))

(assert (=> b!101649 d!27603))

(declare-fun d!27605 () Bool)

(assert (=> d!27605 (= (inRange!0 (ite c!17490 (ite c!17492 (index!3147 lt!51558) (ite c!17497 (index!3146 lt!51557) (index!3149 lt!51557))) (ite c!17493 (index!3147 lt!51554) (ite c!17495 (index!3146 lt!51545) (index!3149 lt!51545)))) (mask!6658 newMap!16)) (and (bvsge (ite c!17490 (ite c!17492 (index!3147 lt!51558) (ite c!17497 (index!3146 lt!51557) (index!3149 lt!51557))) (ite c!17493 (index!3147 lt!51554) (ite c!17495 (index!3146 lt!51545) (index!3149 lt!51545)))) #b00000000000000000000000000000000) (bvslt (ite c!17490 (ite c!17492 (index!3147 lt!51558) (ite c!17497 (index!3146 lt!51557) (index!3149 lt!51557))) (ite c!17493 (index!3147 lt!51554) (ite c!17495 (index!3146 lt!51545) (index!3149 lt!51545)))) (bvadd (mask!6658 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10556 d!27605))

(declare-fun d!27607 () Bool)

(declare-fun res!51038 () Bool)

(declare-fun e!66361 () Bool)

(assert (=> d!27607 (=> res!51038 e!66361)))

(assert (=> d!27607 (= res!51038 (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27607 (= (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!66361)))

(declare-fun b!101972 () Bool)

(declare-fun e!66362 () Bool)

(assert (=> b!101972 (= e!66361 e!66362)))

(declare-fun res!51039 () Bool)

(assert (=> b!101972 (=> (not res!51039) (not e!66362))))

(assert (=> b!101972 (= res!51039 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101973 () Bool)

(assert (=> b!101973 (= e!66362 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27607 (not res!51038)) b!101972))

(assert (= (and b!101972 res!51039) b!101973))

(declare-fun m!112847 () Bool)

(assert (=> d!27607 m!112847))

(assert (=> b!101973 m!112337))

(declare-fun m!112849 () Bool)

(assert (=> b!101973 m!112849))

(assert (=> b!101764 d!27607))

(declare-fun d!27609 () Bool)

(declare-fun e!66363 () Bool)

(assert (=> d!27609 e!66363))

(declare-fun res!51040 () Bool)

(assert (=> d!27609 (=> (not res!51040) (not e!66363))))

(declare-fun lt!51742 () ListLongMap!1511)

(assert (=> d!27609 (= res!51040 (contains!800 lt!51742 (_1!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!51740 () List!1576)

(assert (=> d!27609 (= lt!51742 (ListLongMap!1512 lt!51740))))

(declare-fun lt!51741 () Unit!3077)

(declare-fun lt!51739 () Unit!3077)

(assert (=> d!27609 (= lt!51741 lt!51739)))

(assert (=> d!27609 (= (getValueByKey!154 lt!51740 (_1!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!159 (_2!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27609 (= lt!51739 (lemmaContainsTupThenGetReturnValue!70 lt!51740 (_1!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27609 (= lt!51740 (insertStrictlySorted!73 (toList!771 (ite c!17496 call!10549 call!10567)) (_1!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27609 (= (+!133 (ite c!17496 call!10549 call!10567) (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!51742)))

(declare-fun b!101974 () Bool)

(declare-fun res!51041 () Bool)

(assert (=> b!101974 (=> (not res!51041) (not e!66363))))

(assert (=> b!101974 (= res!51041 (= (getValueByKey!154 (toList!771 lt!51742) (_1!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!159 (_2!1173 (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!101975 () Bool)

(assert (=> b!101975 (= e!66363 (contains!802 (toList!771 lt!51742) (ite c!17496 (ite c!17487 (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27609 res!51040) b!101974))

(assert (= (and b!101974 res!51041) b!101975))

(declare-fun m!112851 () Bool)

(assert (=> d!27609 m!112851))

(declare-fun m!112853 () Bool)

(assert (=> d!27609 m!112853))

(declare-fun m!112855 () Bool)

(assert (=> d!27609 m!112855))

(declare-fun m!112857 () Bool)

(assert (=> d!27609 m!112857))

(declare-fun m!112859 () Bool)

(assert (=> b!101974 m!112859))

(declare-fun m!112861 () Bool)

(assert (=> b!101975 m!112861))

(assert (=> bm!10562 d!27609))

(declare-fun d!27611 () Bool)

(declare-fun e!66366 () Bool)

(assert (=> d!27611 e!66366))

(declare-fun c!17575 () Bool)

(assert (=> d!27611 (= c!17575 (and (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27611 true))

(declare-fun _$29!135 () Unit!3077)

(assert (=> d!27611 (= (choose!632 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (_values!2518 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992))) (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) (minValue!2413 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992)))) _$29!135)))

(declare-fun b!101980 () Bool)

(assert (=> b!101980 (= e!66366 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101981 () Bool)

(assert (=> b!101981 (= e!66366 (ite (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27611 c!17575) b!101980))

(assert (= (and d!27611 (not c!17575)) b!101981))

(assert (=> b!101980 m!112337))

(assert (=> b!101980 m!112365))

(assert (=> d!27539 d!27611))

(assert (=> d!27539 d!27545))

(declare-fun b!101982 () Bool)

(declare-fun e!66367 () Bool)

(declare-fun e!66368 () Bool)

(assert (=> b!101982 (= e!66367 e!66368)))

(declare-fun lt!51743 () (_ BitVec 64))

(assert (=> b!101982 (= lt!51743 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51745 () Unit!3077)

(assert (=> b!101982 (= lt!51745 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4235 newMap!16) lt!51743 #b00000000000000000000000000000000))))

(assert (=> b!101982 (arrayContainsKey!0 (_keys!4235 newMap!16) lt!51743 #b00000000000000000000000000000000)))

(declare-fun lt!51744 () Unit!3077)

(assert (=> b!101982 (= lt!51744 lt!51745)))

(declare-fun res!51043 () Bool)

(assert (=> b!101982 (= res!51043 (= (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000) (_keys!4235 newMap!16) (mask!6658 newMap!16)) (Found!250 #b00000000000000000000000000000000)))))

(assert (=> b!101982 (=> (not res!51043) (not e!66368))))

(declare-fun b!101983 () Bool)

(declare-fun call!10615 () Bool)

(assert (=> b!101983 (= e!66367 call!10615)))

(declare-fun b!101984 () Bool)

(declare-fun e!66369 () Bool)

(assert (=> b!101984 (= e!66369 e!66367)))

(declare-fun c!17576 () Bool)

(assert (=> b!101984 (= c!17576 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101985 () Bool)

(assert (=> b!101985 (= e!66368 call!10615)))

(declare-fun bm!10612 () Bool)

(assert (=> bm!10612 (= call!10615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun d!27613 () Bool)

(declare-fun res!51042 () Bool)

(assert (=> d!27613 (=> res!51042 e!66369)))

(assert (=> d!27613 (= res!51042 (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(assert (=> d!27613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4235 newMap!16) (mask!6658 newMap!16)) e!66369)))

(assert (= (and d!27613 (not res!51042)) b!101984))

(assert (= (and b!101984 c!17576) b!101982))

(assert (= (and b!101984 (not c!17576)) b!101983))

(assert (= (and b!101982 res!51043) b!101985))

(assert (= (or b!101985 b!101983) bm!10612))

(assert (=> b!101982 m!112775))

(declare-fun m!112863 () Bool)

(assert (=> b!101982 m!112863))

(declare-fun m!112865 () Bool)

(assert (=> b!101982 m!112865))

(assert (=> b!101982 m!112775))

(declare-fun m!112867 () Bool)

(assert (=> b!101982 m!112867))

(assert (=> b!101984 m!112775))

(assert (=> b!101984 m!112775))

(assert (=> b!101984 m!112777))

(declare-fun m!112869 () Bool)

(assert (=> bm!10612 m!112869))

(assert (=> b!101757 d!27613))

(declare-fun d!27615 () Bool)

(declare-fun e!66370 () Bool)

(assert (=> d!27615 e!66370))

(declare-fun res!51044 () Bool)

(assert (=> d!27615 (=> (not res!51044) (not e!66370))))

(declare-fun lt!51749 () ListLongMap!1511)

(assert (=> d!27615 (= res!51044 (contains!800 lt!51749 (_1!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun lt!51747 () List!1576)

(assert (=> d!27615 (= lt!51749 (ListLongMap!1512 lt!51747))))

(declare-fun lt!51748 () Unit!3077)

(declare-fun lt!51746 () Unit!3077)

(assert (=> d!27615 (= lt!51748 lt!51746)))

(assert (=> d!27615 (= (getValueByKey!154 lt!51747 (_1!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27615 (= lt!51746 (lemmaContainsTupThenGetReturnValue!70 lt!51747 (_1!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27615 (= lt!51747 (insertStrictlySorted!73 (toList!771 call!10584) (_1!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27615 (= (+!133 call!10584 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51749)))

(declare-fun b!101986 () Bool)

(declare-fun res!51045 () Bool)

(assert (=> b!101986 (=> (not res!51045) (not e!66370))))

(assert (=> b!101986 (= res!51045 (= (getValueByKey!154 (toList!771 lt!51749) (_1!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun b!101987 () Bool)

(assert (=> b!101987 (= e!66370 (contains!802 (toList!771 lt!51749) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(assert (= (and d!27615 res!51044) b!101986))

(assert (= (and b!101986 res!51045) b!101987))

(declare-fun m!112871 () Bool)

(assert (=> d!27615 m!112871))

(declare-fun m!112873 () Bool)

(assert (=> d!27615 m!112873))

(declare-fun m!112875 () Bool)

(assert (=> d!27615 m!112875))

(declare-fun m!112877 () Bool)

(assert (=> d!27615 m!112877))

(declare-fun m!112879 () Bool)

(assert (=> b!101986 m!112879))

(declare-fun m!112881 () Bool)

(assert (=> b!101987 m!112881))

(assert (=> b!101740 d!27615))

(assert (=> d!27535 d!27541))

(declare-fun d!27617 () Bool)

(assert (=> d!27617 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) from!355 Nil!1572)))

(assert (=> d!27617 true))

(declare-fun _$71!141 () Unit!3077)

(assert (=> d!27617 (= (choose!39 (_keys!4235 (v!2845 (underlying!347 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!141)))

(declare-fun bs!4215 () Bool)

(assert (= bs!4215 d!27617))

(assert (=> bs!4215 m!112361))

(assert (=> d!27535 d!27617))

(declare-fun d!27619 () Bool)

(assert (=> d!27619 (= (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101742 d!27619))

(declare-fun d!27621 () Bool)

(assert (=> d!27621 (= (+!133 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) lt!51544 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51752 () Unit!3077)

(declare-fun choose!636 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 V!3177 Int) Unit!3077)

(assert (=> d!27621 (= lt!51752 (choose!636 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51544 (zeroValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27621 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27621 (= (lemmaChangeZeroKeyThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) lt!51544 (zeroValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2413 newMap!16) (defaultEntry!2535 newMap!16)) lt!51752)))

(declare-fun bs!4216 () Bool)

(assert (= bs!4216 d!27621))

(assert (=> bs!4216 m!112519))

(assert (=> bs!4216 m!112353))

(declare-fun m!112883 () Bool)

(assert (=> bs!4216 m!112883))

(assert (=> bs!4216 m!112655))

(assert (=> bs!4216 m!112519))

(declare-fun m!112885 () Bool)

(assert (=> bs!4216 m!112885))

(assert (=> bs!4216 m!112353))

(declare-fun m!112887 () Bool)

(assert (=> bs!4216 m!112887))

(assert (=> b!101670 d!27621))

(assert (=> b!101769 d!27537))

(declare-fun d!27623 () Bool)

(assert (=> d!27623 (= (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101796 d!27623))

(declare-fun d!27625 () Bool)

(declare-fun e!66372 () Bool)

(assert (=> d!27625 e!66372))

(declare-fun res!51046 () Bool)

(assert (=> d!27625 (=> res!51046 e!66372)))

(declare-fun lt!51755 () Bool)

(assert (=> d!27625 (= res!51046 (not lt!51755))))

(declare-fun lt!51753 () Bool)

(assert (=> d!27625 (= lt!51755 lt!51753)))

(declare-fun lt!51756 () Unit!3077)

(declare-fun e!66371 () Unit!3077)

(assert (=> d!27625 (= lt!51756 e!66371)))

(declare-fun c!17577 () Bool)

(assert (=> d!27625 (= c!17577 lt!51753)))

(assert (=> d!27625 (= lt!51753 (containsKey!157 (toList!771 lt!51617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27625 (= (contains!800 lt!51617 #b0000000000000000000000000000000000000000000000000000000000000000) lt!51755)))

(declare-fun b!101988 () Bool)

(declare-fun lt!51754 () Unit!3077)

(assert (=> b!101988 (= e!66371 lt!51754)))

(assert (=> b!101988 (= lt!51754 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 lt!51617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101988 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101989 () Bool)

(declare-fun Unit!3091 () Unit!3077)

(assert (=> b!101989 (= e!66371 Unit!3091)))

(declare-fun b!101990 () Bool)

(assert (=> b!101990 (= e!66372 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27625 c!17577) b!101988))

(assert (= (and d!27625 (not c!17577)) b!101989))

(assert (= (and d!27625 (not res!51046)) b!101990))

(declare-fun m!112889 () Bool)

(assert (=> d!27625 m!112889))

(declare-fun m!112891 () Bool)

(assert (=> b!101988 m!112891))

(assert (=> b!101988 m!112759))

(assert (=> b!101988 m!112759))

(declare-fun m!112893 () Bool)

(assert (=> b!101988 m!112893))

(assert (=> b!101990 m!112759))

(assert (=> b!101990 m!112759))

(assert (=> b!101990 m!112893))

(assert (=> bm!10582 d!27625))

(declare-fun d!27627 () Bool)

(declare-fun e!66374 () Bool)

(assert (=> d!27627 e!66374))

(declare-fun res!51047 () Bool)

(assert (=> d!27627 (=> res!51047 e!66374)))

(declare-fun lt!51759 () Bool)

(assert (=> d!27627 (= res!51047 (not lt!51759))))

(declare-fun lt!51757 () Bool)

(assert (=> d!27627 (= lt!51759 lt!51757)))

(declare-fun lt!51760 () Unit!3077)

(declare-fun e!66373 () Unit!3077)

(assert (=> d!27627 (= lt!51760 e!66373)))

(declare-fun c!17578 () Bool)

(assert (=> d!27627 (= c!17578 lt!51757)))

(assert (=> d!27627 (= lt!51757 (containsKey!157 (toList!771 lt!51617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27627 (= (contains!800 lt!51617 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51759)))

(declare-fun b!101991 () Bool)

(declare-fun lt!51758 () Unit!3077)

(assert (=> b!101991 (= e!66373 lt!51758)))

(assert (=> b!101991 (= lt!51758 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 lt!51617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101991 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101992 () Bool)

(declare-fun Unit!3092 () Unit!3077)

(assert (=> b!101992 (= e!66373 Unit!3092)))

(declare-fun b!101993 () Bool)

(assert (=> b!101993 (= e!66374 (isDefined!106 (getValueByKey!154 (toList!771 lt!51617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27627 c!17578) b!101991))

(assert (= (and d!27627 (not c!17578)) b!101992))

(assert (= (and d!27627 (not res!51047)) b!101993))

(declare-fun m!112895 () Bool)

(assert (=> d!27627 m!112895))

(declare-fun m!112897 () Bool)

(assert (=> b!101991 m!112897))

(assert (=> b!101991 m!112771))

(assert (=> b!101991 m!112771))

(declare-fun m!112899 () Bool)

(assert (=> b!101991 m!112899))

(assert (=> b!101993 m!112771))

(assert (=> b!101993 m!112771))

(assert (=> b!101993 m!112899))

(assert (=> bm!10587 d!27627))

(declare-fun d!27629 () Bool)

(declare-fun res!51048 () Bool)

(declare-fun e!66375 () Bool)

(assert (=> d!27629 (=> res!51048 e!66375)))

(assert (=> d!27629 (= res!51048 (= (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27629 (= (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000) e!66375)))

(declare-fun b!101994 () Bool)

(declare-fun e!66376 () Bool)

(assert (=> b!101994 (= e!66375 e!66376)))

(declare-fun res!51049 () Bool)

(assert (=> b!101994 (=> (not res!51049) (not e!66376))))

(assert (=> b!101994 (= res!51049 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!101995 () Bool)

(assert (=> b!101995 (= e!66376 (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27629 (not res!51048)) b!101994))

(assert (= (and b!101994 res!51049) b!101995))

(assert (=> d!27629 m!112775))

(assert (=> b!101995 m!112337))

(declare-fun m!112901 () Bool)

(assert (=> b!101995 m!112901))

(assert (=> bm!10553 d!27629))

(declare-fun d!27631 () Bool)

(assert (=> d!27631 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000)))

(declare-fun lt!51763 () Unit!3077)

(declare-fun choose!13 (array!4265 (_ BitVec 64) (_ BitVec 32)) Unit!3077)

(assert (=> d!27631 (= lt!51763 (choose!13 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000))))

(assert (=> d!27631 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27631 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000) lt!51763)))

(declare-fun bs!4217 () Bool)

(assert (= bs!4217 d!27631))

(assert (=> bs!4217 m!112633))

(declare-fun m!112903 () Bool)

(assert (=> bs!4217 m!112903))

(assert (=> b!101794 d!27631))

(declare-fun d!27633 () Bool)

(declare-fun res!51050 () Bool)

(declare-fun e!66377 () Bool)

(assert (=> d!27633 (=> res!51050 e!66377)))

(assert (=> d!27633 (= res!51050 (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) lt!51645))))

(assert (=> d!27633 (= (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 #b00000000000000000000000000000000) e!66377)))

(declare-fun b!101996 () Bool)

(declare-fun e!66378 () Bool)

(assert (=> b!101996 (= e!66377 e!66378)))

(declare-fun res!51051 () Bool)

(assert (=> b!101996 (=> (not res!51051) (not e!66378))))

(assert (=> b!101996 (= res!51051 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(declare-fun b!101997 () Bool)

(assert (=> b!101997 (= e!66378 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51645 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27633 (not res!51050)) b!101996))

(assert (= (and b!101996 res!51051) b!101997))

(assert (=> d!27633 m!112629))

(declare-fun m!112905 () Bool)

(assert (=> b!101997 m!112905))

(assert (=> b!101794 d!27633))

(declare-fun d!27635 () Bool)

(declare-fun lt!51766 () SeekEntryResult!250)

(assert (=> d!27635 (and (or ((_ is Undefined!250) lt!51766) (not ((_ is Found!250) lt!51766)) (and (bvsge (index!3147 lt!51766) #b00000000000000000000000000000000) (bvslt (index!3147 lt!51766) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))) (or ((_ is Undefined!250) lt!51766) ((_ is Found!250) lt!51766) (not ((_ is MissingZero!250) lt!51766)) (and (bvsge (index!3146 lt!51766) #b00000000000000000000000000000000) (bvslt (index!3146 lt!51766) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))) (or ((_ is Undefined!250) lt!51766) ((_ is Found!250) lt!51766) ((_ is MissingZero!250) lt!51766) (not ((_ is MissingVacant!250) lt!51766)) (and (bvsge (index!3149 lt!51766) #b00000000000000000000000000000000) (bvslt (index!3149 lt!51766) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))) (or ((_ is Undefined!250) lt!51766) (ite ((_ is Found!250) lt!51766) (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (index!3147 lt!51766)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!250) lt!51766) (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (index!3146 lt!51766)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!250) lt!51766) (= (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (index!3149 lt!51766)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!66380 () SeekEntryResult!250)

(assert (=> d!27635 (= lt!51766 e!66380)))

(declare-fun c!17579 () Bool)

(declare-fun lt!51765 () SeekEntryResult!250)

(assert (=> d!27635 (= c!17579 (and ((_ is Intermediate!250) lt!51765) (undefined!1062 lt!51765)))))

(assert (=> d!27635 (= lt!51765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) (mask!6658 (v!2845 (underlying!347 thiss!992)))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(assert (=> d!27635 (validMask!0 (mask!6658 (v!2845 (underlying!347 thiss!992))))))

(assert (=> d!27635 (= (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))) lt!51766)))

(declare-fun b!101998 () Bool)

(declare-fun e!66381 () SeekEntryResult!250)

(assert (=> b!101998 (= e!66381 (seekKeyOrZeroReturnVacant!0 (x!13333 lt!51765) (index!3148 lt!51765) (index!3148 lt!51765) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun b!101999 () Bool)

(assert (=> b!101999 (= e!66381 (MissingZero!250 (index!3148 lt!51765)))))

(declare-fun b!102000 () Bool)

(declare-fun e!66379 () SeekEntryResult!250)

(assert (=> b!102000 (= e!66380 e!66379)))

(declare-fun lt!51764 () (_ BitVec 64))

(assert (=> b!102000 (= lt!51764 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (index!3148 lt!51765)))))

(declare-fun c!17581 () Bool)

(assert (=> b!102000 (= c!17581 (= lt!51764 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!102001 () Bool)

(declare-fun c!17580 () Bool)

(assert (=> b!102001 (= c!17580 (= lt!51764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!102001 (= e!66379 e!66381)))

(declare-fun b!102002 () Bool)

(assert (=> b!102002 (= e!66379 (Found!250 (index!3148 lt!51765)))))

(declare-fun b!102003 () Bool)

(assert (=> b!102003 (= e!66380 Undefined!250)))

(assert (= (and d!27635 c!17579) b!102003))

(assert (= (and d!27635 (not c!17579)) b!102000))

(assert (= (and b!102000 c!17581) b!102002))

(assert (= (and b!102000 (not c!17581)) b!102001))

(assert (= (and b!102001 c!17580) b!101999))

(assert (= (and b!102001 (not c!17580)) b!101998))

(declare-fun m!112907 () Bool)

(assert (=> d!27635 m!112907))

(declare-fun m!112909 () Bool)

(assert (=> d!27635 m!112909))

(assert (=> d!27635 m!112629))

(declare-fun m!112911 () Bool)

(assert (=> d!27635 m!112911))

(declare-fun m!112913 () Bool)

(assert (=> d!27635 m!112913))

(assert (=> d!27635 m!112383))

(declare-fun m!112915 () Bool)

(assert (=> d!27635 m!112915))

(assert (=> d!27635 m!112629))

(assert (=> d!27635 m!112909))

(assert (=> b!101998 m!112629))

(declare-fun m!112917 () Bool)

(assert (=> b!101998 m!112917))

(declare-fun m!112919 () Bool)

(assert (=> b!102000 m!112919))

(assert (=> b!101794 d!27635))

(declare-fun call!10616 () Bool)

(declare-fun c!17582 () Bool)

(declare-fun bm!10613 () Bool)

(assert (=> bm!10613 (= call!10616 (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17582 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17525 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572) Nil!1572)) (ite c!17525 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572) Nil!1572))))))

(declare-fun b!102004 () Bool)

(declare-fun e!66384 () Bool)

(declare-fun e!66382 () Bool)

(assert (=> b!102004 (= e!66384 e!66382)))

(assert (=> b!102004 (= c!17582 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!102005 () Bool)

(assert (=> b!102005 (= e!66382 call!10616)))

(declare-fun b!102006 () Bool)

(declare-fun e!66385 () Bool)

(assert (=> b!102006 (= e!66385 e!66384)))

(declare-fun res!51053 () Bool)

(assert (=> b!102006 (=> (not res!51053) (not e!66384))))

(declare-fun e!66383 () Bool)

(assert (=> b!102006 (= res!51053 (not e!66383))))

(declare-fun res!51054 () Bool)

(assert (=> b!102006 (=> (not res!51054) (not e!66383))))

(assert (=> b!102006 (= res!51054 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!102007 () Bool)

(assert (=> b!102007 (= e!66382 call!10616)))

(declare-fun b!102008 () Bool)

(assert (=> b!102008 (= e!66383 (contains!801 (ite c!17525 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572) Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!27637 () Bool)

(declare-fun res!51052 () Bool)

(assert (=> d!27637 (=> res!51052 e!66385)))

(assert (=> d!27637 (= res!51052 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27637 (= (arrayNoDuplicates!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17525 (Cons!1571 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) Nil!1572) Nil!1572)) e!66385)))

(assert (= (and d!27637 (not res!51052)) b!102006))

(assert (= (and b!102006 res!51054) b!102008))

(assert (= (and b!102006 res!51053) b!102004))

(assert (= (and b!102004 c!17582) b!102005))

(assert (= (and b!102004 (not c!17582)) b!102007))

(assert (= (or b!102005 b!102007) bm!10613))

(declare-fun m!112921 () Bool)

(assert (=> bm!10613 m!112921))

(declare-fun m!112923 () Bool)

(assert (=> bm!10613 m!112923))

(assert (=> b!102004 m!112921))

(assert (=> b!102004 m!112921))

(declare-fun m!112925 () Bool)

(assert (=> b!102004 m!112925))

(assert (=> b!102006 m!112921))

(assert (=> b!102006 m!112921))

(assert (=> b!102006 m!112925))

(assert (=> b!102008 m!112921))

(assert (=> b!102008 m!112921))

(declare-fun m!112927 () Bool)

(assert (=> b!102008 m!112927))

(assert (=> bm!10590 d!27637))

(declare-fun d!27639 () Bool)

(assert (=> d!27639 (= (get!1311 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101686 d!27639))

(declare-fun d!27641 () Bool)

(declare-fun e!66388 () Bool)

(assert (=> d!27641 e!66388))

(declare-fun res!51059 () Bool)

(assert (=> d!27641 (=> (not res!51059) (not e!66388))))

(declare-fun lt!51772 () SeekEntryResult!250)

(assert (=> d!27641 (= res!51059 ((_ is Found!250) lt!51772))))

(assert (=> d!27641 (= lt!51772 (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun lt!51771 () Unit!3077)

(declare-fun choose!637 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) Int) Unit!3077)

(assert (=> d!27641 (= lt!51771 (choose!637 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27641 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27641 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)) lt!51771)))

(declare-fun b!102013 () Bool)

(declare-fun res!51060 () Bool)

(assert (=> b!102013 (=> (not res!51060) (not e!66388))))

(assert (=> b!102013 (= res!51060 (inRange!0 (index!3147 lt!51772) (mask!6658 newMap!16)))))

(declare-fun b!102014 () Bool)

(assert (=> b!102014 (= e!66388 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51772)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> b!102014 (and (bvsge (index!3147 lt!51772) #b00000000000000000000000000000000) (bvslt (index!3147 lt!51772) (size!2277 (_keys!4235 newMap!16))))))

(assert (= (and d!27641 res!51059) b!102013))

(assert (= (and b!102013 res!51060) b!102014))

(assert (=> d!27641 m!112337))

(assert (=> d!27641 m!112489))

(assert (=> d!27641 m!112337))

(declare-fun m!112929 () Bool)

(assert (=> d!27641 m!112929))

(assert (=> d!27641 m!112655))

(declare-fun m!112931 () Bool)

(assert (=> b!102013 m!112931))

(declare-fun m!112933 () Bool)

(assert (=> b!102014 m!112933))

(assert (=> bm!10560 d!27641))

(declare-fun b!102015 () Bool)

(declare-fun e!66389 () Bool)

(declare-fun e!66390 () Bool)

(assert (=> b!102015 (= e!66389 e!66390)))

(declare-fun lt!51773 () (_ BitVec 64))

(assert (=> b!102015 (= lt!51773 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51775 () Unit!3077)

(assert (=> b!102015 (= lt!51775 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51773 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!102015 (arrayContainsKey!0 (_keys!4235 (v!2845 (underlying!347 thiss!992))) lt!51773 #b00000000000000000000000000000000)))

(declare-fun lt!51774 () Unit!3077)

(assert (=> b!102015 (= lt!51774 lt!51775)))

(declare-fun res!51062 () Bool)

(assert (=> b!102015 (= res!51062 (= (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))) (Found!250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!102015 (=> (not res!51062) (not e!66390))))

(declare-fun b!102016 () Bool)

(declare-fun call!10617 () Bool)

(assert (=> b!102016 (= e!66389 call!10617)))

(declare-fun b!102017 () Bool)

(declare-fun e!66391 () Bool)

(assert (=> b!102017 (= e!66391 e!66389)))

(declare-fun c!17583 () Bool)

(assert (=> b!102017 (= c!17583 (validKeyInArray!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!102018 () Bool)

(assert (=> b!102018 (= e!66390 call!10617)))

(declare-fun bm!10614 () Bool)

(assert (=> bm!10614 (= call!10617 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))))))

(declare-fun d!27643 () Bool)

(declare-fun res!51061 () Bool)

(assert (=> d!27643 (=> res!51061 e!66391)))

(assert (=> d!27643 (= res!51061 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2277 (_keys!4235 (v!2845 (underlying!347 thiss!992))))))))

(assert (=> d!27643 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4235 (v!2845 (underlying!347 thiss!992))) (mask!6658 (v!2845 (underlying!347 thiss!992)))) e!66391)))

(assert (= (and d!27643 (not res!51061)) b!102017))

(assert (= (and b!102017 c!17583) b!102015))

(assert (= (and b!102017 (not c!17583)) b!102016))

(assert (= (and b!102015 res!51062) b!102018))

(assert (= (or b!102018 b!102016) bm!10614))

(assert (=> b!102015 m!112725))

(declare-fun m!112935 () Bool)

(assert (=> b!102015 m!112935))

(declare-fun m!112937 () Bool)

(assert (=> b!102015 m!112937))

(assert (=> b!102015 m!112725))

(declare-fun m!112939 () Bool)

(assert (=> b!102015 m!112939))

(assert (=> b!102017 m!112725))

(assert (=> b!102017 m!112725))

(assert (=> b!102017 m!112729))

(declare-fun m!112941 () Bool)

(assert (=> bm!10614 m!112941))

(assert (=> bm!10593 d!27643))

(declare-fun d!27645 () Bool)

(assert (=> d!27645 (= (apply!95 (+!133 lt!51629 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51616) (apply!95 lt!51629 lt!51616))))

(declare-fun lt!51778 () Unit!3077)

(declare-fun choose!638 (ListLongMap!1511 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3077)

(assert (=> d!27645 (= lt!51778 (choose!638 lt!51629 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51616))))

(declare-fun e!66394 () Bool)

(assert (=> d!27645 e!66394))

(declare-fun res!51065 () Bool)

(assert (=> d!27645 (=> (not res!51065) (not e!66394))))

(assert (=> d!27645 (= res!51065 (contains!800 lt!51629 lt!51616))))

(assert (=> d!27645 (= (addApplyDifferent!71 lt!51629 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51616) lt!51778)))

(declare-fun b!102022 () Bool)

(assert (=> b!102022 (= e!66394 (not (= lt!51616 lt!51628)))))

(assert (= (and d!27645 res!51065) b!102022))

(declare-fun m!112943 () Bool)

(assert (=> d!27645 m!112943))

(declare-fun m!112945 () Bool)

(assert (=> d!27645 m!112945))

(assert (=> d!27645 m!112555))

(assert (=> d!27645 m!112555))

(assert (=> d!27645 m!112577))

(assert (=> d!27645 m!112585))

(assert (=> b!101747 d!27645))

(declare-fun d!27647 () Bool)

(assert (=> d!27647 (= (apply!95 (+!133 lt!51626 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51622) (get!1312 (getValueByKey!154 (toList!771 (+!133 lt!51626 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51622)))))

(declare-fun bs!4218 () Bool)

(assert (= bs!4218 d!27647))

(declare-fun m!112947 () Bool)

(assert (=> bs!4218 m!112947))

(assert (=> bs!4218 m!112947))

(declare-fun m!112949 () Bool)

(assert (=> bs!4218 m!112949))

(assert (=> b!101747 d!27647))

(assert (=> b!101747 d!27565))

(declare-fun d!27649 () Bool)

(assert (=> d!27649 (contains!800 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51623)))

(declare-fun lt!51781 () Unit!3077)

(declare-fun choose!639 (ListLongMap!1511 (_ BitVec 64) V!3177 (_ BitVec 64)) Unit!3077)

(assert (=> d!27649 (= lt!51781 (choose!639 lt!51610 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51623))))

(assert (=> d!27649 (contains!800 lt!51610 lt!51623)))

(assert (=> d!27649 (= (addStillContains!71 lt!51610 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51623) lt!51781)))

(declare-fun bs!4219 () Bool)

(assert (= bs!4219 d!27649))

(assert (=> bs!4219 m!112563))

(assert (=> bs!4219 m!112563))

(assert (=> bs!4219 m!112565))

(declare-fun m!112951 () Bool)

(assert (=> bs!4219 m!112951))

(declare-fun m!112953 () Bool)

(assert (=> bs!4219 m!112953))

(assert (=> b!101747 d!27649))

(declare-fun d!27651 () Bool)

(declare-fun e!66395 () Bool)

(assert (=> d!27651 e!66395))

(declare-fun res!51066 () Bool)

(assert (=> d!27651 (=> (not res!51066) (not e!66395))))

(declare-fun lt!51785 () ListLongMap!1511)

(assert (=> d!27651 (= res!51066 (contains!800 lt!51785 (_1!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun lt!51783 () List!1576)

(assert (=> d!27651 (= lt!51785 (ListLongMap!1512 lt!51783))))

(declare-fun lt!51784 () Unit!3077)

(declare-fun lt!51782 () Unit!3077)

(assert (=> d!27651 (= lt!51784 lt!51782)))

(assert (=> d!27651 (= (getValueByKey!154 lt!51783 (_1!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27651 (= lt!51782 (lemmaContainsTupThenGetReturnValue!70 lt!51783 (_1!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27651 (= lt!51783 (insertStrictlySorted!73 (toList!771 lt!51610) (_1!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27651 (= (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51785)))

(declare-fun b!102024 () Bool)

(declare-fun res!51067 () Bool)

(assert (=> b!102024 (=> (not res!51067) (not e!66395))))

(assert (=> b!102024 (= res!51067 (= (getValueByKey!154 (toList!771 lt!51785) (_1!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun b!102025 () Bool)

(assert (=> b!102025 (= e!66395 (contains!802 (toList!771 lt!51785) (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(assert (= (and d!27651 res!51066) b!102024))

(assert (= (and b!102024 res!51067) b!102025))

(declare-fun m!112955 () Bool)

(assert (=> d!27651 m!112955))

(declare-fun m!112957 () Bool)

(assert (=> d!27651 m!112957))

(declare-fun m!112959 () Bool)

(assert (=> d!27651 m!112959))

(declare-fun m!112961 () Bool)

(assert (=> d!27651 m!112961))

(declare-fun m!112963 () Bool)

(assert (=> b!102024 m!112963))

(declare-fun m!112965 () Bool)

(assert (=> b!102025 m!112965))

(assert (=> b!101747 d!27651))

(declare-fun d!27653 () Bool)

(assert (=> d!27653 (= (apply!95 lt!51624 lt!51619) (get!1312 (getValueByKey!154 (toList!771 lt!51624) lt!51619)))))

(declare-fun bs!4220 () Bool)

(assert (= bs!4220 d!27653))

(declare-fun m!112967 () Bool)

(assert (=> bs!4220 m!112967))

(assert (=> bs!4220 m!112967))

(declare-fun m!112969 () Bool)

(assert (=> bs!4220 m!112969))

(assert (=> b!101747 d!27653))

(declare-fun d!27655 () Bool)

(assert (=> d!27655 (= (apply!95 lt!51626 lt!51622) (get!1312 (getValueByKey!154 (toList!771 lt!51626) lt!51622)))))

(declare-fun bs!4221 () Bool)

(assert (= bs!4221 d!27655))

(declare-fun m!112971 () Bool)

(assert (=> bs!4221 m!112971))

(assert (=> bs!4221 m!112971))

(declare-fun m!112973 () Bool)

(assert (=> bs!4221 m!112973))

(assert (=> b!101747 d!27655))

(declare-fun d!27657 () Bool)

(declare-fun e!66397 () Bool)

(assert (=> d!27657 e!66397))

(declare-fun res!51068 () Bool)

(assert (=> d!27657 (=> res!51068 e!66397)))

(declare-fun lt!51788 () Bool)

(assert (=> d!27657 (= res!51068 (not lt!51788))))

(declare-fun lt!51786 () Bool)

(assert (=> d!27657 (= lt!51788 lt!51786)))

(declare-fun lt!51789 () Unit!3077)

(declare-fun e!66396 () Unit!3077)

(assert (=> d!27657 (= lt!51789 e!66396)))

(declare-fun c!17584 () Bool)

(assert (=> d!27657 (= c!17584 lt!51786)))

(assert (=> d!27657 (= lt!51786 (containsKey!157 (toList!771 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51623))))

(assert (=> d!27657 (= (contains!800 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51623) lt!51788)))

(declare-fun b!102026 () Bool)

(declare-fun lt!51787 () Unit!3077)

(assert (=> b!102026 (= e!66396 lt!51787)))

(assert (=> b!102026 (= lt!51787 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51623))))

(assert (=> b!102026 (isDefined!106 (getValueByKey!154 (toList!771 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51623))))

(declare-fun b!102027 () Bool)

(declare-fun Unit!3093 () Unit!3077)

(assert (=> b!102027 (= e!66396 Unit!3093)))

(declare-fun b!102028 () Bool)

(assert (=> b!102028 (= e!66397 (isDefined!106 (getValueByKey!154 (toList!771 (+!133 lt!51610 (tuple2!2325 lt!51620 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51623)))))

(assert (= (and d!27657 c!17584) b!102026))

(assert (= (and d!27657 (not c!17584)) b!102027))

(assert (= (and d!27657 (not res!51068)) b!102028))

(declare-fun m!112975 () Bool)

(assert (=> d!27657 m!112975))

(declare-fun m!112977 () Bool)

(assert (=> b!102026 m!112977))

(declare-fun m!112979 () Bool)

(assert (=> b!102026 m!112979))

(assert (=> b!102026 m!112979))

(declare-fun m!112981 () Bool)

(assert (=> b!102026 m!112981))

(assert (=> b!102028 m!112979))

(assert (=> b!102028 m!112979))

(assert (=> b!102028 m!112981))

(assert (=> b!101747 d!27657))

(declare-fun d!27659 () Bool)

(declare-fun e!66398 () Bool)

(assert (=> d!27659 e!66398))

(declare-fun res!51069 () Bool)

(assert (=> d!27659 (=> (not res!51069) (not e!66398))))

(declare-fun lt!51793 () ListLongMap!1511)

(assert (=> d!27659 (= res!51069 (contains!800 lt!51793 (_1!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun lt!51791 () List!1576)

(assert (=> d!27659 (= lt!51793 (ListLongMap!1512 lt!51791))))

(declare-fun lt!51792 () Unit!3077)

(declare-fun lt!51790 () Unit!3077)

(assert (=> d!27659 (= lt!51792 lt!51790)))

(assert (=> d!27659 (= (getValueByKey!154 lt!51791 (_1!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27659 (= lt!51790 (lemmaContainsTupThenGetReturnValue!70 lt!51791 (_1!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27659 (= lt!51791 (insertStrictlySorted!73 (toList!771 lt!51624) (_1!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27659 (= (+!133 lt!51624 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51793)))

(declare-fun b!102029 () Bool)

(declare-fun res!51070 () Bool)

(assert (=> b!102029 (=> (not res!51070) (not e!66398))))

(assert (=> b!102029 (= res!51070 (= (getValueByKey!154 (toList!771 lt!51793) (_1!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun b!102030 () Bool)

(assert (=> b!102030 (= e!66398 (contains!802 (toList!771 lt!51793) (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(assert (= (and d!27659 res!51069) b!102029))

(assert (= (and b!102029 res!51070) b!102030))

(declare-fun m!112983 () Bool)

(assert (=> d!27659 m!112983))

(declare-fun m!112985 () Bool)

(assert (=> d!27659 m!112985))

(declare-fun m!112987 () Bool)

(assert (=> d!27659 m!112987))

(declare-fun m!112989 () Bool)

(assert (=> d!27659 m!112989))

(declare-fun m!112991 () Bool)

(assert (=> b!102029 m!112991))

(declare-fun m!112993 () Bool)

(assert (=> b!102030 m!112993))

(assert (=> b!101747 d!27659))

(declare-fun d!27661 () Bool)

(assert (=> d!27661 (= (apply!95 (+!133 lt!51624 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51619) (get!1312 (getValueByKey!154 (toList!771 (+!133 lt!51624 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51619)))))

(declare-fun bs!4222 () Bool)

(assert (= bs!4222 d!27661))

(declare-fun m!112995 () Bool)

(assert (=> bs!4222 m!112995))

(assert (=> bs!4222 m!112995))

(declare-fun m!112997 () Bool)

(assert (=> bs!4222 m!112997))

(assert (=> b!101747 d!27661))

(declare-fun d!27663 () Bool)

(assert (=> d!27663 (= (apply!95 (+!133 lt!51624 (tuple2!2325 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51619) (apply!95 lt!51624 lt!51619))))

(declare-fun lt!51794 () Unit!3077)

(assert (=> d!27663 (= lt!51794 (choose!638 lt!51624 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51619))))

(declare-fun e!66399 () Bool)

(assert (=> d!27663 e!66399))

(declare-fun res!51071 () Bool)

(assert (=> d!27663 (=> (not res!51071) (not e!66399))))

(assert (=> d!27663 (= res!51071 (contains!800 lt!51624 lt!51619))))

(assert (=> d!27663 (= (addApplyDifferent!71 lt!51624 lt!51625 (zeroValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51619) lt!51794)))

(declare-fun b!102031 () Bool)

(assert (=> b!102031 (= e!66399 (not (= lt!51619 lt!51625)))))

(assert (= (and d!27663 res!51071) b!102031))

(declare-fun m!112999 () Bool)

(assert (=> d!27663 m!112999))

(declare-fun m!113001 () Bool)

(assert (=> d!27663 m!113001))

(assert (=> d!27663 m!112557))

(assert (=> d!27663 m!112557))

(assert (=> d!27663 m!112573))

(assert (=> d!27663 m!112561))

(assert (=> b!101747 d!27663))

(declare-fun d!27665 () Bool)

(declare-fun e!66400 () Bool)

(assert (=> d!27665 e!66400))

(declare-fun res!51072 () Bool)

(assert (=> d!27665 (=> (not res!51072) (not e!66400))))

(declare-fun lt!51798 () ListLongMap!1511)

(assert (=> d!27665 (= res!51072 (contains!800 lt!51798 (_1!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun lt!51796 () List!1576)

(assert (=> d!27665 (= lt!51798 (ListLongMap!1512 lt!51796))))

(declare-fun lt!51797 () Unit!3077)

(declare-fun lt!51795 () Unit!3077)

(assert (=> d!27665 (= lt!51797 lt!51795)))

(assert (=> d!27665 (= (getValueByKey!154 lt!51796 (_1!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27665 (= lt!51795 (lemmaContainsTupThenGetReturnValue!70 lt!51796 (_1!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27665 (= lt!51796 (insertStrictlySorted!73 (toList!771 lt!51626) (_1!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27665 (= (+!133 lt!51626 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51798)))

(declare-fun b!102032 () Bool)

(declare-fun res!51073 () Bool)

(assert (=> b!102032 (=> (not res!51073) (not e!66400))))

(assert (=> b!102032 (= res!51073 (= (getValueByKey!154 (toList!771 lt!51798) (_1!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun b!102033 () Bool)

(assert (=> b!102033 (= e!66400 (contains!802 (toList!771 lt!51798) (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(assert (= (and d!27665 res!51072) b!102032))

(assert (= (and b!102032 res!51073) b!102033))

(declare-fun m!113003 () Bool)

(assert (=> d!27665 m!113003))

(declare-fun m!113005 () Bool)

(assert (=> d!27665 m!113005))

(declare-fun m!113007 () Bool)

(assert (=> d!27665 m!113007))

(declare-fun m!113009 () Bool)

(assert (=> d!27665 m!113009))

(declare-fun m!113011 () Bool)

(assert (=> b!102032 m!113011))

(declare-fun m!113013 () Bool)

(assert (=> b!102033 m!113013))

(assert (=> b!101747 d!27665))

(declare-fun d!27667 () Bool)

(assert (=> d!27667 (= (apply!95 (+!133 lt!51626 (tuple2!2325 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51622) (apply!95 lt!51626 lt!51622))))

(declare-fun lt!51799 () Unit!3077)

(assert (=> d!27667 (= lt!51799 (choose!638 lt!51626 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51622))))

(declare-fun e!66401 () Bool)

(assert (=> d!27667 e!66401))

(declare-fun res!51074 () Bool)

(assert (=> d!27667 (=> (not res!51074) (not e!66401))))

(assert (=> d!27667 (= res!51074 (contains!800 lt!51626 lt!51622))))

(assert (=> d!27667 (= (addApplyDifferent!71 lt!51626 lt!51614 (minValue!2413 (v!2845 (underlying!347 thiss!992))) lt!51622) lt!51799)))

(declare-fun b!102034 () Bool)

(assert (=> b!102034 (= e!66401 (not (= lt!51622 lt!51614)))))

(assert (= (and d!27667 res!51074) b!102034))

(declare-fun m!113015 () Bool)

(assert (=> d!27667 m!113015))

(declare-fun m!113017 () Bool)

(assert (=> d!27667 m!113017))

(assert (=> d!27667 m!112579))

(assert (=> d!27667 m!112579))

(assert (=> d!27667 m!112581))

(assert (=> d!27667 m!112575))

(assert (=> b!101747 d!27667))

(declare-fun d!27669 () Bool)

(assert (=> d!27669 (= (apply!95 lt!51629 lt!51616) (get!1312 (getValueByKey!154 (toList!771 lt!51629) lt!51616)))))

(declare-fun bs!4223 () Bool)

(assert (= bs!4223 d!27669))

(declare-fun m!113019 () Bool)

(assert (=> bs!4223 m!113019))

(assert (=> bs!4223 m!113019))

(declare-fun m!113021 () Bool)

(assert (=> bs!4223 m!113021))

(assert (=> b!101747 d!27669))

(declare-fun d!27671 () Bool)

(declare-fun e!66402 () Bool)

(assert (=> d!27671 e!66402))

(declare-fun res!51075 () Bool)

(assert (=> d!27671 (=> (not res!51075) (not e!66402))))

(declare-fun lt!51803 () ListLongMap!1511)

(assert (=> d!27671 (= res!51075 (contains!800 lt!51803 (_1!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(declare-fun lt!51801 () List!1576)

(assert (=> d!27671 (= lt!51803 (ListLongMap!1512 lt!51801))))

(declare-fun lt!51802 () Unit!3077)

(declare-fun lt!51800 () Unit!3077)

(assert (=> d!27671 (= lt!51802 lt!51800)))

(assert (=> d!27671 (= (getValueByKey!154 lt!51801 (_1!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27671 (= lt!51800 (lemmaContainsTupThenGetReturnValue!70 lt!51801 (_1!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27671 (= lt!51801 (insertStrictlySorted!73 (toList!771 lt!51629) (_1!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) (_2!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))))))

(assert (=> d!27671 (= (+!133 lt!51629 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51803)))

(declare-fun b!102035 () Bool)

(declare-fun res!51076 () Bool)

(assert (=> b!102035 (=> (not res!51076) (not e!66402))))

(assert (=> b!102035 (= res!51076 (= (getValueByKey!154 (toList!771 lt!51803) (_1!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) (Some!159 (_2!1173 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))))

(declare-fun b!102036 () Bool)

(assert (=> b!102036 (= e!66402 (contains!802 (toList!771 lt!51803) (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))))))

(assert (= (and d!27671 res!51075) b!102035))

(assert (= (and b!102035 res!51076) b!102036))

(declare-fun m!113023 () Bool)

(assert (=> d!27671 m!113023))

(declare-fun m!113025 () Bool)

(assert (=> d!27671 m!113025))

(declare-fun m!113027 () Bool)

(assert (=> d!27671 m!113027))

(declare-fun m!113029 () Bool)

(assert (=> d!27671 m!113029))

(declare-fun m!113031 () Bool)

(assert (=> b!102035 m!113031))

(declare-fun m!113033 () Bool)

(assert (=> b!102036 m!113033))

(assert (=> b!101747 d!27671))

(declare-fun d!27673 () Bool)

(assert (=> d!27673 (= (apply!95 (+!133 lt!51629 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992))))) lt!51616) (get!1312 (getValueByKey!154 (toList!771 (+!133 lt!51629 (tuple2!2325 lt!51628 (minValue!2413 (v!2845 (underlying!347 thiss!992)))))) lt!51616)))))

(declare-fun bs!4224 () Bool)

(assert (= bs!4224 d!27673))

(declare-fun m!113035 () Bool)

(assert (=> bs!4224 m!113035))

(assert (=> bs!4224 m!113035))

(declare-fun m!113037 () Bool)

(assert (=> bs!4224 m!113037))

(assert (=> b!101747 d!27673))

(declare-fun d!27675 () Bool)

(declare-fun e!66405 () Bool)

(assert (=> d!27675 e!66405))

(declare-fun res!51079 () Bool)

(assert (=> d!27675 (=> (not res!51079) (not e!66405))))

(assert (=> d!27675 (= res!51079 (and (bvsge (index!3147 lt!51552) #b00000000000000000000000000000000) (bvslt (index!3147 lt!51552) (size!2277 (_keys!4235 newMap!16)))))))

(declare-fun lt!51806 () Unit!3077)

(declare-fun choose!640 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) Int) Unit!3077)

(assert (=> d!27675 (= lt!51806 (choose!640 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27675 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27675 (= (lemmaValidKeyInArrayIsInListMap!104 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (defaultEntry!2535 newMap!16)) lt!51806)))

(declare-fun b!102039 () Bool)

(assert (=> b!102039 (= e!66405 (contains!800 (getCurrentListMap!459 (_keys!4235 newMap!16) lt!51555 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51552))))))

(assert (= (and d!27675 res!51079) b!102039))

(declare-fun m!113039 () Bool)

(assert (=> d!27675 m!113039))

(assert (=> d!27675 m!112655))

(assert (=> b!102039 m!112533))

(assert (=> b!102039 m!112507))

(assert (=> b!102039 m!112533))

(assert (=> b!102039 m!112507))

(declare-fun m!113041 () Bool)

(assert (=> b!102039 m!113041))

(assert (=> b!101658 d!27675))

(declare-fun d!27677 () Bool)

(declare-fun e!66408 () Bool)

(assert (=> d!27677 e!66408))

(declare-fun res!51082 () Bool)

(assert (=> d!27677 (=> (not res!51082) (not e!66408))))

(assert (=> d!27677 (= res!51082 (and (bvsge (index!3147 lt!51552) #b00000000000000000000000000000000) (bvslt (index!3147 lt!51552) (size!2278 (_values!2518 newMap!16)))))))

(declare-fun lt!51809 () Unit!3077)

(declare-fun choose!641 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3077)

(assert (=> d!27677 (= lt!51809 (choose!641 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27677 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27677 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (index!3147 lt!51552) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)) lt!51809)))

(declare-fun b!102042 () Bool)

(assert (=> b!102042 (= e!66408 (= (+!133 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!459 (_keys!4235 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16))))))

(assert (= (and d!27677 res!51082) b!102042))

(assert (=> d!27677 m!112337))

(assert (=> d!27677 m!112353))

(declare-fun m!113043 () Bool)

(assert (=> d!27677 m!113043))

(assert (=> d!27677 m!112655))

(assert (=> b!102042 m!112519))

(assert (=> b!102042 m!112519))

(declare-fun m!113045 () Bool)

(assert (=> b!102042 m!113045))

(assert (=> b!102042 m!112493))

(declare-fun m!113047 () Bool)

(assert (=> b!102042 m!113047))

(assert (=> b!101658 d!27677))

(declare-fun d!27679 () Bool)

(declare-fun e!66410 () Bool)

(assert (=> d!27679 e!66410))

(declare-fun res!51083 () Bool)

(assert (=> d!27679 (=> res!51083 e!66410)))

(declare-fun lt!51812 () Bool)

(assert (=> d!27679 (= res!51083 (not lt!51812))))

(declare-fun lt!51810 () Bool)

(assert (=> d!27679 (= lt!51812 lt!51810)))

(declare-fun lt!51813 () Unit!3077)

(declare-fun e!66409 () Unit!3077)

(assert (=> d!27679 (= lt!51813 e!66409)))

(declare-fun c!17585 () Bool)

(assert (=> d!27679 (= c!17585 lt!51810)))

(assert (=> d!27679 (= lt!51810 (containsKey!157 (toList!771 call!10567) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27679 (= (contains!800 call!10567 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) lt!51812)))

(declare-fun b!102043 () Bool)

(declare-fun lt!51811 () Unit!3077)

(assert (=> b!102043 (= e!66409 lt!51811)))

(assert (=> b!102043 (= lt!51811 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 call!10567) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> b!102043 (isDefined!106 (getValueByKey!154 (toList!771 call!10567) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!102044 () Bool)

(declare-fun Unit!3094 () Unit!3077)

(assert (=> b!102044 (= e!66409 Unit!3094)))

(declare-fun b!102045 () Bool)

(assert (=> b!102045 (= e!66410 (isDefined!106 (getValueByKey!154 (toList!771 call!10567) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (= (and d!27679 c!17585) b!102043))

(assert (= (and d!27679 (not c!17585)) b!102044))

(assert (= (and d!27679 (not res!51083)) b!102045))

(assert (=> d!27679 m!112337))

(declare-fun m!113049 () Bool)

(assert (=> d!27679 m!113049))

(assert (=> b!102043 m!112337))

(declare-fun m!113051 () Bool)

(assert (=> b!102043 m!113051))

(assert (=> b!102043 m!112337))

(declare-fun m!113053 () Bool)

(assert (=> b!102043 m!113053))

(assert (=> b!102043 m!113053))

(declare-fun m!113055 () Bool)

(assert (=> b!102043 m!113055))

(assert (=> b!102045 m!112337))

(assert (=> b!102045 m!113053))

(assert (=> b!102045 m!113053))

(assert (=> b!102045 m!113055))

(assert (=> b!101658 d!27679))

(assert (=> b!101800 d!27623))

(assert (=> b!101798 d!27623))

(declare-fun d!27681 () Bool)

(declare-fun e!66412 () Bool)

(assert (=> d!27681 e!66412))

(declare-fun res!51084 () Bool)

(assert (=> d!27681 (=> res!51084 e!66412)))

(declare-fun lt!51816 () Bool)

(assert (=> d!27681 (= res!51084 (not lt!51816))))

(declare-fun lt!51814 () Bool)

(assert (=> d!27681 (= lt!51816 lt!51814)))

(declare-fun lt!51817 () Unit!3077)

(declare-fun e!66411 () Unit!3077)

(assert (=> d!27681 (= lt!51817 e!66411)))

(declare-fun c!17586 () Bool)

(assert (=> d!27681 (= c!17586 lt!51814)))

(assert (=> d!27681 (= lt!51814 (containsKey!157 (toList!771 call!10561) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27681 (= (contains!800 call!10561 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) lt!51816)))

(declare-fun b!102046 () Bool)

(declare-fun lt!51815 () Unit!3077)

(assert (=> b!102046 (= e!66411 lt!51815)))

(assert (=> b!102046 (= lt!51815 (lemmaContainsKeyImpliesGetValueByKeyDefined!105 (toList!771 call!10561) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> b!102046 (isDefined!106 (getValueByKey!154 (toList!771 call!10561) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!102047 () Bool)

(declare-fun Unit!3095 () Unit!3077)

(assert (=> b!102047 (= e!66411 Unit!3095)))

(declare-fun b!102048 () Bool)

(assert (=> b!102048 (= e!66412 (isDefined!106 (getValueByKey!154 (toList!771 call!10561) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (= (and d!27681 c!17586) b!102046))

(assert (= (and d!27681 (not c!17586)) b!102047))

(assert (= (and d!27681 (not res!51084)) b!102048))

(assert (=> d!27681 m!112337))

(declare-fun m!113057 () Bool)

(assert (=> d!27681 m!113057))

(assert (=> b!102046 m!112337))

(declare-fun m!113059 () Bool)

(assert (=> b!102046 m!113059))

(assert (=> b!102046 m!112337))

(declare-fun m!113061 () Bool)

(assert (=> b!102046 m!113061))

(assert (=> b!102046 m!113061))

(declare-fun m!113063 () Bool)

(assert (=> b!102046 m!113063))

(assert (=> b!102048 m!112337))

(assert (=> b!102048 m!113061))

(assert (=> b!102048 m!113061))

(assert (=> b!102048 m!113063))

(assert (=> b!101679 d!27681))

(declare-fun d!27683 () Bool)

(declare-fun lt!51818 () Bool)

(assert (=> d!27683 (= lt!51818 (select (content!107 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!66414 () Bool)

(assert (=> d!27683 (= lt!51818 e!66414)))

(declare-fun res!51086 () Bool)

(assert (=> d!27683 (=> (not res!51086) (not e!66414))))

(assert (=> d!27683 (= res!51086 ((_ is Cons!1571) Nil!1572))))

(assert (=> d!27683 (= (contains!801 Nil!1572 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)) lt!51818)))

(declare-fun b!102049 () Bool)

(declare-fun e!66413 () Bool)

(assert (=> b!102049 (= e!66414 e!66413)))

(declare-fun res!51085 () Bool)

(assert (=> b!102049 (=> res!51085 e!66413)))

(assert (=> b!102049 (= res!51085 (= (h!2167 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!102050 () Bool)

(assert (=> b!102050 (= e!66413 (contains!801 (t!5577 Nil!1572) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!27683 res!51086) b!102049))

(assert (= (and b!102049 (not res!51085)) b!102050))

(assert (=> d!27683 m!112753))

(assert (=> d!27683 m!112629))

(declare-fun m!113065 () Bool)

(assert (=> d!27683 m!113065))

(assert (=> b!102050 m!112629))

(declare-fun m!113067 () Bool)

(assert (=> b!102050 m!113067))

(assert (=> b!101802 d!27683))

(declare-fun b!102051 () Bool)

(declare-fun e!66424 () Bool)

(declare-fun e!66419 () Bool)

(assert (=> b!102051 (= e!66424 e!66419)))

(declare-fun res!51088 () Bool)

(declare-fun call!10621 () Bool)

(assert (=> b!102051 (= res!51088 call!10621)))

(assert (=> b!102051 (=> (not res!51088) (not e!66419))))

(declare-fun call!10618 () ListLongMap!1511)

(declare-fun c!17592 () Bool)

(declare-fun call!10622 () ListLongMap!1511)

(declare-fun call!10619 () ListLongMap!1511)

(declare-fun bm!10615 () Bool)

(declare-fun c!17589 () Bool)

(declare-fun call!10620 () ListLongMap!1511)

(assert (=> bm!10615 (= call!10618 (+!133 (ite c!17589 call!10619 (ite c!17592 call!10622 call!10620)) (ite (or c!17589 c!17592) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16))) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16))))))))

(declare-fun bm!10616 () Bool)

(declare-fun call!10623 () Bool)

(declare-fun lt!51828 () ListLongMap!1511)

(assert (=> bm!10616 (= call!10623 (contains!800 lt!51828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!27685 () Bool)

(declare-fun e!66421 () Bool)

(assert (=> d!27685 e!66421))

(declare-fun res!51091 () Bool)

(assert (=> d!27685 (=> (not res!51091) (not e!66421))))

(assert (=> d!27685 (= res!51091 (or (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))))

(declare-fun lt!51824 () ListLongMap!1511)

(assert (=> d!27685 (= lt!51828 lt!51824)))

(declare-fun lt!51822 () Unit!3077)

(declare-fun e!66417 () Unit!3077)

(assert (=> d!27685 (= lt!51822 e!66417)))

(declare-fun c!17588 () Bool)

(declare-fun e!66425 () Bool)

(assert (=> d!27685 (= c!17588 e!66425)))

(declare-fun res!51093 () Bool)

(assert (=> d!27685 (=> (not res!51093) (not e!66425))))

(assert (=> d!27685 (= res!51093 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun e!66416 () ListLongMap!1511)

(assert (=> d!27685 (= lt!51824 e!66416)))

(assert (=> d!27685 (= c!17589 (and (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27685 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27685 (= (getCurrentListMap!459 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51828)))

(declare-fun b!102052 () Bool)

(assert (=> b!102052 (= e!66424 (not call!10621))))

(declare-fun b!102053 () Bool)

(declare-fun res!51089 () Bool)

(assert (=> b!102053 (=> (not res!51089) (not e!66421))))

(declare-fun e!66422 () Bool)

(assert (=> b!102053 (= res!51089 e!66422)))

(declare-fun c!17590 () Bool)

(assert (=> b!102053 (= c!17590 (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!102054 () Bool)

(declare-fun e!66426 () Bool)

(declare-fun e!66415 () Bool)

(assert (=> b!102054 (= e!66426 e!66415)))

(declare-fun res!51087 () Bool)

(assert (=> b!102054 (=> (not res!51087) (not e!66415))))

(assert (=> b!102054 (= res!51087 (contains!800 lt!51828 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!102054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102055 () Bool)

(declare-fun e!66420 () Bool)

(assert (=> b!102055 (= e!66422 e!66420)))

(declare-fun res!51095 () Bool)

(assert (=> b!102055 (= res!51095 call!10623)))

(assert (=> b!102055 (=> (not res!51095) (not e!66420))))

(declare-fun b!102056 () Bool)

(declare-fun e!66427 () ListLongMap!1511)

(assert (=> b!102056 (= e!66416 e!66427)))

(assert (=> b!102056 (= c!17592 (and (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102057 () Bool)

(declare-fun Unit!3096 () Unit!3077)

(assert (=> b!102057 (= e!66417 Unit!3096)))

(declare-fun b!102058 () Bool)

(assert (=> b!102058 (= e!66419 (= (apply!95 lt!51828 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16))))))

(declare-fun b!102059 () Bool)

(declare-fun e!66423 () ListLongMap!1511)

(assert (=> b!102059 (= e!66423 call!10620)))

(declare-fun b!102060 () Bool)

(assert (=> b!102060 (= e!66420 (= (apply!95 lt!51828 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16))))))

(declare-fun bm!10617 () Bool)

(declare-fun call!10624 () ListLongMap!1511)

(assert (=> bm!10617 (= call!10624 call!10618)))

(declare-fun bm!10618 () Bool)

(assert (=> bm!10618 (= call!10622 call!10619)))

(declare-fun b!102061 () Bool)

(assert (=> b!102061 (= e!66421 e!66424)))

(declare-fun c!17587 () Bool)

(assert (=> b!102061 (= c!17587 (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102062 () Bool)

(assert (=> b!102062 (= e!66416 (+!133 call!10618 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))))))

(declare-fun b!102063 () Bool)

(assert (=> b!102063 (= e!66425 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102064 () Bool)

(declare-fun e!66418 () Bool)

(assert (=> b!102064 (= e!66418 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10619 () Bool)

(assert (=> bm!10619 (= call!10620 call!10622)))

(declare-fun b!102065 () Bool)

(declare-fun c!17591 () Bool)

(assert (=> b!102065 (= c!17591 (and (not (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!102065 (= e!66427 e!66423)))

(declare-fun bm!10620 () Bool)

(assert (=> bm!10620 (= call!10619 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!102066 () Bool)

(assert (=> b!102066 (= e!66423 call!10624)))

(declare-fun b!102067 () Bool)

(assert (=> b!102067 (= e!66422 (not call!10623))))

(declare-fun bm!10621 () Bool)

(assert (=> bm!10621 (= call!10621 (contains!800 lt!51828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102068 () Bool)

(assert (=> b!102068 (= e!66415 (= (apply!95 lt!51828 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)) (get!1309 (select (arr!2025 (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!376 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2278 (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))))))))

(assert (=> b!102068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102069 () Bool)

(declare-fun lt!51829 () Unit!3077)

(assert (=> b!102069 (= e!66417 lt!51829)))

(declare-fun lt!51821 () ListLongMap!1511)

(assert (=> b!102069 (= lt!51821 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51831 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51834 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51834 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51820 () Unit!3077)

(assert (=> b!102069 (= lt!51820 (addStillContains!71 lt!51821 lt!51831 (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) lt!51834))))

(assert (=> b!102069 (contains!800 (+!133 lt!51821 (tuple2!2325 lt!51831 (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)))) lt!51834)))

(declare-fun lt!51838 () Unit!3077)

(assert (=> b!102069 (= lt!51838 lt!51820)))

(declare-fun lt!51840 () ListLongMap!1511)

(assert (=> b!102069 (= lt!51840 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51839 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51827 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51827 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51823 () Unit!3077)

(assert (=> b!102069 (= lt!51823 (addApplyDifferent!71 lt!51840 lt!51839 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) lt!51827))))

(assert (=> b!102069 (= (apply!95 (+!133 lt!51840 (tuple2!2325 lt!51839 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))) lt!51827) (apply!95 lt!51840 lt!51827))))

(declare-fun lt!51832 () Unit!3077)

(assert (=> b!102069 (= lt!51832 lt!51823)))

(declare-fun lt!51835 () ListLongMap!1511)

(assert (=> b!102069 (= lt!51835 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51836 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51830 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51830 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51826 () Unit!3077)

(assert (=> b!102069 (= lt!51826 (addApplyDifferent!71 lt!51835 lt!51836 (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) lt!51830))))

(assert (=> b!102069 (= (apply!95 (+!133 lt!51835 (tuple2!2325 lt!51836 (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)))) lt!51830) (apply!95 lt!51835 lt!51830))))

(declare-fun lt!51819 () Unit!3077)

(assert (=> b!102069 (= lt!51819 lt!51826)))

(declare-fun lt!51837 () ListLongMap!1511)

(assert (=> b!102069 (= lt!51837 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (ite (or c!17496 c!17490) (_values!2518 newMap!16) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (index!3147 lt!51552) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16)))) (mask!6658 newMap!16) (ite c!17496 (ite c!17487 lt!51544 lt!51551) (extraKeys!2346 newMap!16)) (ite (and c!17496 c!17487) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2413 newMap!16)) (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51825 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51825 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51833 () (_ BitVec 64))

(assert (=> b!102069 (= lt!51833 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102069 (= lt!51829 (addApplyDifferent!71 lt!51837 lt!51825 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)) lt!51833))))

(assert (=> b!102069 (= (apply!95 (+!133 lt!51837 (tuple2!2325 lt!51825 (ite c!17496 (ite c!17487 (minValue!2413 newMap!16) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2413 newMap!16)))) lt!51833) (apply!95 lt!51837 lt!51833))))

(declare-fun b!102070 () Bool)

(declare-fun res!51092 () Bool)

(assert (=> b!102070 (=> (not res!51092) (not e!66421))))

(assert (=> b!102070 (= res!51092 e!66426)))

(declare-fun res!51094 () Bool)

(assert (=> b!102070 (=> res!51094 e!66426)))

(assert (=> b!102070 (= res!51094 (not e!66418))))

(declare-fun res!51090 () Bool)

(assert (=> b!102070 (=> (not res!51090) (not e!66418))))

(assert (=> b!102070 (= res!51090 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102071 () Bool)

(assert (=> b!102071 (= e!66427 call!10624)))

(assert (= (and d!27685 c!17589) b!102062))

(assert (= (and d!27685 (not c!17589)) b!102056))

(assert (= (and b!102056 c!17592) b!102071))

(assert (= (and b!102056 (not c!17592)) b!102065))

(assert (= (and b!102065 c!17591) b!102066))

(assert (= (and b!102065 (not c!17591)) b!102059))

(assert (= (or b!102066 b!102059) bm!10619))

(assert (= (or b!102071 bm!10619) bm!10618))

(assert (= (or b!102071 b!102066) bm!10617))

(assert (= (or b!102062 bm!10618) bm!10620))

(assert (= (or b!102062 bm!10617) bm!10615))

(assert (= (and d!27685 res!51093) b!102063))

(assert (= (and d!27685 c!17588) b!102069))

(assert (= (and d!27685 (not c!17588)) b!102057))

(assert (= (and d!27685 res!51091) b!102070))

(assert (= (and b!102070 res!51090) b!102064))

(assert (= (and b!102070 (not res!51094)) b!102054))

(assert (= (and b!102054 res!51087) b!102068))

(assert (= (and b!102070 res!51092) b!102053))

(assert (= (and b!102053 c!17590) b!102055))

(assert (= (and b!102053 (not c!17590)) b!102067))

(assert (= (and b!102055 res!51095) b!102060))

(assert (= (or b!102055 b!102067) bm!10616))

(assert (= (and b!102053 res!51089) b!102061))

(assert (= (and b!102061 c!17587) b!102051))

(assert (= (and b!102061 (not c!17587)) b!102052))

(assert (= (and b!102051 res!51088) b!102058))

(assert (= (or b!102051 b!102052) bm!10621))

(declare-fun b_lambda!4567 () Bool)

(assert (=> (not b_lambda!4567) (not b!102068)))

(assert (=> b!102068 t!5589))

(declare-fun b_and!6281 () Bool)

(assert (= b_and!6277 (and (=> t!5589 result!3351) b_and!6281)))

(assert (=> b!102068 t!5591))

(declare-fun b_and!6283 () Bool)

(assert (= b_and!6279 (and (=> t!5591 result!3353) b_and!6283)))

(assert (=> b!102063 m!112775))

(assert (=> b!102063 m!112775))

(assert (=> b!102063 m!112777))

(assert (=> b!102064 m!112775))

(assert (=> b!102064 m!112775))

(assert (=> b!102064 m!112777))

(assert (=> b!102054 m!112775))

(assert (=> b!102054 m!112775))

(declare-fun m!113069 () Bool)

(assert (=> b!102054 m!113069))

(declare-fun m!113071 () Bool)

(assert (=> b!102069 m!113071))

(declare-fun m!113073 () Bool)

(assert (=> b!102069 m!113073))

(declare-fun m!113075 () Bool)

(assert (=> b!102069 m!113075))

(declare-fun m!113077 () Bool)

(assert (=> b!102069 m!113077))

(declare-fun m!113079 () Bool)

(assert (=> b!102069 m!113079))

(declare-fun m!113081 () Bool)

(assert (=> b!102069 m!113081))

(declare-fun m!113083 () Bool)

(assert (=> b!102069 m!113083))

(declare-fun m!113085 () Bool)

(assert (=> b!102069 m!113085))

(assert (=> b!102069 m!112775))

(declare-fun m!113087 () Bool)

(assert (=> b!102069 m!113087))

(assert (=> b!102069 m!113073))

(declare-fun m!113089 () Bool)

(assert (=> b!102069 m!113089))

(assert (=> b!102069 m!113079))

(declare-fun m!113091 () Bool)

(assert (=> b!102069 m!113091))

(assert (=> b!102069 m!113071))

(declare-fun m!113093 () Bool)

(assert (=> b!102069 m!113093))

(declare-fun m!113095 () Bool)

(assert (=> b!102069 m!113095))

(declare-fun m!113097 () Bool)

(assert (=> b!102069 m!113097))

(declare-fun m!113099 () Bool)

(assert (=> b!102069 m!113099))

(declare-fun m!113101 () Bool)

(assert (=> b!102069 m!113101))

(assert (=> b!102069 m!113095))

(declare-fun m!113103 () Bool)

(assert (=> b!102058 m!113103))

(declare-fun m!113105 () Bool)

(assert (=> b!102062 m!113105))

(declare-fun m!113107 () Bool)

(assert (=> b!102060 m!113107))

(assert (=> d!27685 m!112655))

(declare-fun m!113109 () Bool)

(assert (=> bm!10616 m!113109))

(declare-fun m!113111 () Bool)

(assert (=> bm!10621 m!113111))

(assert (=> b!102068 m!112823))

(declare-fun m!113113 () Bool)

(assert (=> b!102068 m!113113))

(assert (=> b!102068 m!112775))

(declare-fun m!113115 () Bool)

(assert (=> b!102068 m!113115))

(assert (=> b!102068 m!113113))

(assert (=> b!102068 m!112823))

(declare-fun m!113117 () Bool)

(assert (=> b!102068 m!113117))

(assert (=> b!102068 m!112775))

(declare-fun m!113119 () Bool)

(assert (=> bm!10615 m!113119))

(assert (=> bm!10620 m!113087))

(assert (=> bm!10548 d!27685))

(declare-fun d!27687 () Bool)

(assert (=> d!27687 (= (map!1263 (_2!1172 lt!51549)) (getCurrentListMap!459 (_keys!4235 (_2!1172 lt!51549)) (_values!2518 (_2!1172 lt!51549)) (mask!6658 (_2!1172 lt!51549)) (extraKeys!2346 (_2!1172 lt!51549)) (zeroValue!2413 (_2!1172 lt!51549)) (minValue!2413 (_2!1172 lt!51549)) #b00000000000000000000000000000000 (defaultEntry!2535 (_2!1172 lt!51549))))))

(declare-fun bs!4225 () Bool)

(assert (= bs!4225 d!27687))

(declare-fun m!113121 () Bool)

(assert (=> bs!4225 m!113121))

(assert (=> bm!10551 d!27687))

(declare-fun d!27689 () Bool)

(declare-fun res!51100 () Bool)

(declare-fun e!66432 () Bool)

(assert (=> d!27689 (=> res!51100 e!66432)))

(assert (=> d!27689 (= res!51100 (and ((_ is Cons!1572) (toList!771 lt!51422)) (= (_1!1173 (h!2168 (toList!771 lt!51422))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(assert (=> d!27689 (= (containsKey!157 (toList!771 lt!51422) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) e!66432)))

(declare-fun b!102076 () Bool)

(declare-fun e!66433 () Bool)

(assert (=> b!102076 (= e!66432 e!66433)))

(declare-fun res!51101 () Bool)

(assert (=> b!102076 (=> (not res!51101) (not e!66433))))

(assert (=> b!102076 (= res!51101 (and (or (not ((_ is Cons!1572) (toList!771 lt!51422))) (bvsle (_1!1173 (h!2168 (toList!771 lt!51422))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))) ((_ is Cons!1572) (toList!771 lt!51422)) (bvslt (_1!1173 (h!2168 (toList!771 lt!51422))) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))))

(declare-fun b!102077 () Bool)

(assert (=> b!102077 (= e!66433 (containsKey!157 (t!5578 (toList!771 lt!51422)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (= (and d!27689 (not res!51100)) b!102076))

(assert (= (and b!102076 res!51101) b!102077))

(assert (=> b!102077 m!112337))

(declare-fun m!113123 () Bool)

(assert (=> b!102077 m!113123))

(assert (=> d!27519 d!27689))

(declare-fun b!102078 () Bool)

(declare-fun e!66443 () Bool)

(declare-fun e!66438 () Bool)

(assert (=> b!102078 (= e!66443 e!66438)))

(declare-fun res!51103 () Bool)

(declare-fun call!10628 () Bool)

(assert (=> b!102078 (= res!51103 call!10628)))

(assert (=> b!102078 (=> (not res!51103) (not e!66438))))

(declare-fun call!10627 () ListLongMap!1511)

(declare-fun c!17598 () Bool)

(declare-fun c!17595 () Bool)

(declare-fun call!10629 () ListLongMap!1511)

(declare-fun bm!10622 () Bool)

(declare-fun call!10626 () ListLongMap!1511)

(declare-fun call!10625 () ListLongMap!1511)

(assert (=> bm!10622 (= call!10625 (+!133 (ite c!17595 call!10626 (ite c!17598 call!10629 call!10627)) (ite (or c!17595 c!17598) (tuple2!2325 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2413 newMap!16)) (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16)))))))

(declare-fun bm!10623 () Bool)

(declare-fun call!10630 () Bool)

(declare-fun lt!51850 () ListLongMap!1511)

(assert (=> bm!10623 (= call!10630 (contains!800 lt!51850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!27691 () Bool)

(declare-fun e!66440 () Bool)

(assert (=> d!27691 e!66440))

(declare-fun res!51106 () Bool)

(assert (=> d!27691 (=> (not res!51106) (not e!66440))))

(assert (=> d!27691 (= res!51106 (or (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))))

(declare-fun lt!51846 () ListLongMap!1511)

(assert (=> d!27691 (= lt!51850 lt!51846)))

(declare-fun lt!51844 () Unit!3077)

(declare-fun e!66436 () Unit!3077)

(assert (=> d!27691 (= lt!51844 e!66436)))

(declare-fun c!17594 () Bool)

(declare-fun e!66444 () Bool)

(assert (=> d!27691 (= c!17594 e!66444)))

(declare-fun res!51108 () Bool)

(assert (=> d!27691 (=> (not res!51108) (not e!66444))))

(assert (=> d!27691 (= res!51108 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun e!66435 () ListLongMap!1511)

(assert (=> d!27691 (= lt!51846 e!66435)))

(assert (=> d!27691 (= c!17595 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27691 (validMask!0 (mask!6658 newMap!16))))

(assert (=> d!27691 (= (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) lt!51850)))

(declare-fun b!102079 () Bool)

(assert (=> b!102079 (= e!66443 (not call!10628))))

(declare-fun b!102080 () Bool)

(declare-fun res!51104 () Bool)

(assert (=> b!102080 (=> (not res!51104) (not e!66440))))

(declare-fun e!66441 () Bool)

(assert (=> b!102080 (= res!51104 e!66441)))

(declare-fun c!17596 () Bool)

(assert (=> b!102080 (= c!17596 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!102081 () Bool)

(declare-fun e!66445 () Bool)

(declare-fun e!66434 () Bool)

(assert (=> b!102081 (= e!66445 e!66434)))

(declare-fun res!51102 () Bool)

(assert (=> b!102081 (=> (not res!51102) (not e!66434))))

(assert (=> b!102081 (= res!51102 (contains!800 lt!51850 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!102081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102082 () Bool)

(declare-fun e!66439 () Bool)

(assert (=> b!102082 (= e!66441 e!66439)))

(declare-fun res!51110 () Bool)

(assert (=> b!102082 (= res!51110 call!10630)))

(assert (=> b!102082 (=> (not res!51110) (not e!66439))))

(declare-fun b!102083 () Bool)

(declare-fun e!66446 () ListLongMap!1511)

(assert (=> b!102083 (= e!66435 e!66446)))

(assert (=> b!102083 (= c!17598 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102084 () Bool)

(declare-fun Unit!3097 () Unit!3077)

(assert (=> b!102084 (= e!66436 Unit!3097)))

(declare-fun b!102085 () Bool)

(assert (=> b!102085 (= e!66438 (= (apply!95 lt!51850 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2413 newMap!16)))))

(declare-fun b!102086 () Bool)

(declare-fun e!66442 () ListLongMap!1511)

(assert (=> b!102086 (= e!66442 call!10627)))

(declare-fun b!102087 () Bool)

(assert (=> b!102087 (= e!66439 (= (apply!95 lt!51850 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2413 newMap!16)))))

(declare-fun bm!10624 () Bool)

(declare-fun call!10631 () ListLongMap!1511)

(assert (=> bm!10624 (= call!10631 call!10625)))

(declare-fun bm!10625 () Bool)

(assert (=> bm!10625 (= call!10629 call!10626)))

(declare-fun b!102088 () Bool)

(assert (=> b!102088 (= e!66440 e!66443)))

(declare-fun c!17593 () Bool)

(assert (=> b!102088 (= c!17593 (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102089 () Bool)

(assert (=> b!102089 (= e!66435 (+!133 call!10625 (tuple2!2325 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2413 newMap!16))))))

(declare-fun b!102090 () Bool)

(assert (=> b!102090 (= e!66444 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102091 () Bool)

(declare-fun e!66437 () Bool)

(assert (=> b!102091 (= e!66437 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!10626 () Bool)

(assert (=> bm!10626 (= call!10627 call!10629)))

(declare-fun b!102092 () Bool)

(declare-fun c!17597 () Bool)

(assert (=> b!102092 (= c!17597 (and (not (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2346 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!102092 (= e!66446 e!66442)))

(declare-fun bm!10627 () Bool)

(assert (=> bm!10627 (= call!10626 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun b!102093 () Bool)

(assert (=> b!102093 (= e!66442 call!10631)))

(declare-fun b!102094 () Bool)

(assert (=> b!102094 (= e!66441 (not call!10630))))

(declare-fun bm!10628 () Bool)

(assert (=> bm!10628 (= call!10628 (contains!800 lt!51850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102095 () Bool)

(assert (=> b!102095 (= e!66434 (= (apply!95 lt!51850 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)) (get!1309 (select (arr!2025 (_values!2518 newMap!16)) #b00000000000000000000000000000000) (dynLambda!376 (defaultEntry!2535 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2278 (_values!2518 newMap!16))))))

(assert (=> b!102095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102096 () Bool)

(declare-fun lt!51851 () Unit!3077)

(assert (=> b!102096 (= e!66436 lt!51851)))

(declare-fun lt!51843 () ListLongMap!1511)

(assert (=> b!102096 (= lt!51843 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51853 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51856 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51856 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51842 () Unit!3077)

(assert (=> b!102096 (= lt!51842 (addStillContains!71 lt!51843 lt!51853 (zeroValue!2413 newMap!16) lt!51856))))

(assert (=> b!102096 (contains!800 (+!133 lt!51843 (tuple2!2325 lt!51853 (zeroValue!2413 newMap!16))) lt!51856)))

(declare-fun lt!51860 () Unit!3077)

(assert (=> b!102096 (= lt!51860 lt!51842)))

(declare-fun lt!51862 () ListLongMap!1511)

(assert (=> b!102096 (= lt!51862 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51861 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51849 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51849 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51845 () Unit!3077)

(assert (=> b!102096 (= lt!51845 (addApplyDifferent!71 lt!51862 lt!51861 (minValue!2413 newMap!16) lt!51849))))

(assert (=> b!102096 (= (apply!95 (+!133 lt!51862 (tuple2!2325 lt!51861 (minValue!2413 newMap!16))) lt!51849) (apply!95 lt!51862 lt!51849))))

(declare-fun lt!51854 () Unit!3077)

(assert (=> b!102096 (= lt!51854 lt!51845)))

(declare-fun lt!51857 () ListLongMap!1511)

(assert (=> b!102096 (= lt!51857 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51858 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51852 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51852 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51848 () Unit!3077)

(assert (=> b!102096 (= lt!51848 (addApplyDifferent!71 lt!51857 lt!51858 (zeroValue!2413 newMap!16) lt!51852))))

(assert (=> b!102096 (= (apply!95 (+!133 lt!51857 (tuple2!2325 lt!51858 (zeroValue!2413 newMap!16))) lt!51852) (apply!95 lt!51857 lt!51852))))

(declare-fun lt!51841 () Unit!3077)

(assert (=> b!102096 (= lt!51841 lt!51848)))

(declare-fun lt!51859 () ListLongMap!1511)

(assert (=> b!102096 (= lt!51859 (getCurrentListMapNoExtraKeys!98 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51847 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51847 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51855 () (_ BitVec 64))

(assert (=> b!102096 (= lt!51855 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102096 (= lt!51851 (addApplyDifferent!71 lt!51859 lt!51847 (minValue!2413 newMap!16) lt!51855))))

(assert (=> b!102096 (= (apply!95 (+!133 lt!51859 (tuple2!2325 lt!51847 (minValue!2413 newMap!16))) lt!51855) (apply!95 lt!51859 lt!51855))))

(declare-fun b!102097 () Bool)

(declare-fun res!51107 () Bool)

(assert (=> b!102097 (=> (not res!51107) (not e!66440))))

(assert (=> b!102097 (= res!51107 e!66445)))

(declare-fun res!51109 () Bool)

(assert (=> b!102097 (=> res!51109 e!66445)))

(assert (=> b!102097 (= res!51109 (not e!66437))))

(declare-fun res!51105 () Bool)

(assert (=> b!102097 (=> (not res!51105) (not e!66437))))

(assert (=> b!102097 (= res!51105 (bvslt #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(declare-fun b!102098 () Bool)

(assert (=> b!102098 (= e!66446 call!10631)))

(assert (= (and d!27691 c!17595) b!102089))

(assert (= (and d!27691 (not c!17595)) b!102083))

(assert (= (and b!102083 c!17598) b!102098))

(assert (= (and b!102083 (not c!17598)) b!102092))

(assert (= (and b!102092 c!17597) b!102093))

(assert (= (and b!102092 (not c!17597)) b!102086))

(assert (= (or b!102093 b!102086) bm!10626))

(assert (= (or b!102098 bm!10626) bm!10625))

(assert (= (or b!102098 b!102093) bm!10624))

(assert (= (or b!102089 bm!10625) bm!10627))

(assert (= (or b!102089 bm!10624) bm!10622))

(assert (= (and d!27691 res!51108) b!102090))

(assert (= (and d!27691 c!17594) b!102096))

(assert (= (and d!27691 (not c!17594)) b!102084))

(assert (= (and d!27691 res!51106) b!102097))

(assert (= (and b!102097 res!51105) b!102091))

(assert (= (and b!102097 (not res!51109)) b!102081))

(assert (= (and b!102081 res!51102) b!102095))

(assert (= (and b!102097 res!51107) b!102080))

(assert (= (and b!102080 c!17596) b!102082))

(assert (= (and b!102080 (not c!17596)) b!102094))

(assert (= (and b!102082 res!51110) b!102087))

(assert (= (or b!102082 b!102094) bm!10623))

(assert (= (and b!102080 res!51104) b!102088))

(assert (= (and b!102088 c!17593) b!102078))

(assert (= (and b!102088 (not c!17593)) b!102079))

(assert (= (and b!102078 res!51103) b!102085))

(assert (= (or b!102078 b!102079) bm!10628))

(declare-fun b_lambda!4569 () Bool)

(assert (=> (not b_lambda!4569) (not b!102095)))

(assert (=> b!102095 t!5589))

(declare-fun b_and!6285 () Bool)

(assert (= b_and!6281 (and (=> t!5589 result!3351) b_and!6285)))

(assert (=> b!102095 t!5591))

(declare-fun b_and!6287 () Bool)

(assert (= b_and!6283 (and (=> t!5591 result!3353) b_and!6287)))

(assert (=> b!102090 m!112775))

(assert (=> b!102090 m!112775))

(assert (=> b!102090 m!112777))

(assert (=> b!102091 m!112775))

(assert (=> b!102091 m!112775))

(assert (=> b!102091 m!112777))

(assert (=> b!102081 m!112775))

(assert (=> b!102081 m!112775))

(declare-fun m!113125 () Bool)

(assert (=> b!102081 m!113125))

(declare-fun m!113127 () Bool)

(assert (=> b!102096 m!113127))

(declare-fun m!113129 () Bool)

(assert (=> b!102096 m!113129))

(declare-fun m!113131 () Bool)

(assert (=> b!102096 m!113131))

(declare-fun m!113133 () Bool)

(assert (=> b!102096 m!113133))

(declare-fun m!113135 () Bool)

(assert (=> b!102096 m!113135))

(declare-fun m!113137 () Bool)

(assert (=> b!102096 m!113137))

(declare-fun m!113139 () Bool)

(assert (=> b!102096 m!113139))

(declare-fun m!113141 () Bool)

(assert (=> b!102096 m!113141))

(assert (=> b!102096 m!112775))

(declare-fun m!113143 () Bool)

(assert (=> b!102096 m!113143))

(assert (=> b!102096 m!113129))

(declare-fun m!113145 () Bool)

(assert (=> b!102096 m!113145))

(assert (=> b!102096 m!113135))

(declare-fun m!113147 () Bool)

(assert (=> b!102096 m!113147))

(assert (=> b!102096 m!113127))

(declare-fun m!113149 () Bool)

(assert (=> b!102096 m!113149))

(declare-fun m!113151 () Bool)

(assert (=> b!102096 m!113151))

(declare-fun m!113153 () Bool)

(assert (=> b!102096 m!113153))

(declare-fun m!113155 () Bool)

(assert (=> b!102096 m!113155))

(declare-fun m!113157 () Bool)

(assert (=> b!102096 m!113157))

(assert (=> b!102096 m!113151))

(declare-fun m!113159 () Bool)

(assert (=> b!102085 m!113159))

(declare-fun m!113161 () Bool)

(assert (=> b!102089 m!113161))

(declare-fun m!113163 () Bool)

(assert (=> b!102087 m!113163))

(assert (=> d!27691 m!112655))

(declare-fun m!113165 () Bool)

(assert (=> bm!10623 m!113165))

(declare-fun m!113167 () Bool)

(assert (=> bm!10628 m!113167))

(assert (=> b!102095 m!112823))

(declare-fun m!113169 () Bool)

(assert (=> b!102095 m!113169))

(assert (=> b!102095 m!112775))

(declare-fun m!113171 () Bool)

(assert (=> b!102095 m!113171))

(assert (=> b!102095 m!113169))

(assert (=> b!102095 m!112823))

(declare-fun m!113173 () Bool)

(assert (=> b!102095 m!113173))

(assert (=> b!102095 m!112775))

(declare-fun m!113175 () Bool)

(assert (=> bm!10622 m!113175))

(assert (=> bm!10627 m!113143))

(assert (=> d!27525 d!27691))

(declare-fun bm!10629 () Bool)

(declare-fun call!10632 () Bool)

(declare-fun c!17599 () Bool)

(assert (=> bm!10629 (= call!10632 (arrayNoDuplicates!0 (_keys!4235 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17599 (Cons!1571 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000) Nil!1572) Nil!1572)))))

(declare-fun b!102099 () Bool)

(declare-fun e!66449 () Bool)

(declare-fun e!66447 () Bool)

(assert (=> b!102099 (= e!66449 e!66447)))

(assert (=> b!102099 (= c!17599 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102100 () Bool)

(assert (=> b!102100 (= e!66447 call!10632)))

(declare-fun b!102101 () Bool)

(declare-fun e!66450 () Bool)

(assert (=> b!102101 (= e!66450 e!66449)))

(declare-fun res!51112 () Bool)

(assert (=> b!102101 (=> (not res!51112) (not e!66449))))

(declare-fun e!66448 () Bool)

(assert (=> b!102101 (= res!51112 (not e!66448))))

(declare-fun res!51113 () Bool)

(assert (=> b!102101 (=> (not res!51113) (not e!66448))))

(assert (=> b!102101 (= res!51113 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102102 () Bool)

(assert (=> b!102102 (= e!66447 call!10632)))

(declare-fun b!102103 () Bool)

(assert (=> b!102103 (= e!66448 (contains!801 Nil!1572 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!27693 () Bool)

(declare-fun res!51111 () Bool)

(assert (=> d!27693 (=> res!51111 e!66450)))

(assert (=> d!27693 (= res!51111 (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(assert (=> d!27693 (= (arrayNoDuplicates!0 (_keys!4235 newMap!16) #b00000000000000000000000000000000 Nil!1572) e!66450)))

(assert (= (and d!27693 (not res!51111)) b!102101))

(assert (= (and b!102101 res!51113) b!102103))

(assert (= (and b!102101 res!51112) b!102099))

(assert (= (and b!102099 c!17599) b!102100))

(assert (= (and b!102099 (not c!17599)) b!102102))

(assert (= (or b!102100 b!102102) bm!10629))

(assert (=> bm!10629 m!112775))

(declare-fun m!113177 () Bool)

(assert (=> bm!10629 m!113177))

(assert (=> b!102099 m!112775))

(assert (=> b!102099 m!112775))

(assert (=> b!102099 m!112777))

(assert (=> b!102101 m!112775))

(assert (=> b!102101 m!112775))

(assert (=> b!102101 m!112777))

(assert (=> b!102103 m!112775))

(assert (=> b!102103 m!112775))

(declare-fun m!113179 () Bool)

(assert (=> b!102103 m!113179))

(assert (=> b!101758 d!27693))

(assert (=> b!101741 d!27619))

(declare-fun b!102138 () Bool)

(declare-fun res!51139 () Bool)

(declare-fun e!66467 () Bool)

(assert (=> b!102138 (=> (not res!51139) (not e!66467))))

(declare-fun lt!51942 () tuple2!2322)

(assert (=> b!102138 (= res!51139 (contains!800 (map!1263 (_2!1172 lt!51942)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun bm!10638 () Bool)

(declare-fun call!10641 () SeekEntryResult!250)

(assert (=> bm!10638 (= call!10641 (seekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (mask!6658 newMap!16)))))

(declare-fun e!66468 () Bool)

(declare-fun lt!51938 () SeekEntryResult!250)

(declare-fun b!102139 () Bool)

(assert (=> b!102139 (= e!66468 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3147 lt!51938)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun b!102140 () Bool)

(declare-fun e!66470 () Unit!3077)

(declare-fun lt!51931 () Unit!3077)

(assert (=> b!102140 (= e!66470 lt!51931)))

(assert (=> b!102140 (= lt!51931 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51940 () SeekEntryResult!250)

(assert (=> b!102140 (= lt!51940 call!10641)))

(declare-fun c!17610 () Bool)

(assert (=> b!102140 (= c!17610 ((_ is MissingZero!250) lt!51940))))

(declare-fun e!66474 () Bool)

(assert (=> b!102140 e!66474))

(declare-fun b!102141 () Bool)

(declare-fun e!66472 () Unit!3077)

(declare-fun Unit!3098 () Unit!3077)

(assert (=> b!102141 (= e!66472 Unit!3098)))

(declare-fun lt!51927 () Unit!3077)

(declare-fun lemmaArrayContainsKeyThenInListMap!28 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 64) (_ BitVec 32) Int) Unit!3077)

(assert (=> b!102141 (= lt!51927 (lemmaArrayContainsKeyThenInListMap!28 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(assert (=> b!102141 (contains!800 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355))))

(declare-fun lt!51929 () Unit!3077)

(assert (=> b!102141 (= lt!51929 lt!51927)))

(assert (=> b!102141 false))

(declare-fun b!102142 () Bool)

(declare-fun Unit!3099 () Unit!3077)

(assert (=> b!102142 (= e!66470 Unit!3099)))

(declare-fun lt!51926 () Unit!3077)

(assert (=> b!102142 (= lt!51926 (lemmaInListMapThenSeekEntryOrOpenFindsIt!44 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (defaultEntry!2535 newMap!16)))))

(assert (=> b!102142 (= lt!51938 call!10641)))

(declare-fun res!51138 () Bool)

(assert (=> b!102142 (= res!51138 ((_ is Found!250) lt!51938))))

(assert (=> b!102142 (=> (not res!51138) (not e!66468))))

(assert (=> b!102142 e!66468))

(declare-fun lt!51925 () Unit!3077)

(assert (=> b!102142 (= lt!51925 lt!51926)))

(assert (=> b!102142 false))

(declare-fun b!102143 () Bool)

(declare-fun res!51134 () Bool)

(declare-fun e!66471 () Bool)

(assert (=> b!102143 (=> (not res!51134) (not e!66471))))

(declare-fun call!10643 () Bool)

(assert (=> b!102143 (= res!51134 call!10643)))

(assert (=> b!102143 (= e!66474 e!66471)))

(declare-fun b!102144 () Bool)

(declare-fun c!17608 () Bool)

(assert (=> b!102144 (= c!17608 ((_ is MissingVacant!250) lt!51940))))

(declare-fun e!66473 () Bool)

(assert (=> b!102144 (= e!66474 e!66473)))

(declare-fun b!102145 () Bool)

(declare-fun res!51136 () Bool)

(assert (=> b!102145 (=> (not res!51136) (not e!66467))))

(assert (=> b!102145 (= res!51136 (valid!403 (_2!1172 lt!51942)))))

(declare-fun b!102146 () Bool)

(declare-fun res!51133 () Bool)

(declare-fun call!10642 () Bool)

(assert (=> b!102146 (= res!51133 call!10642)))

(assert (=> b!102146 (=> (not res!51133) (not e!66468))))

(declare-fun b!102148 () Bool)

(declare-fun res!51137 () Bool)

(assert (=> b!102148 (= res!51137 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3149 lt!51940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!66469 () Bool)

(assert (=> b!102148 (=> (not res!51137) (not e!66469))))

(declare-fun b!102149 () Bool)

(declare-fun Unit!3100 () Unit!3077)

(assert (=> b!102149 (= e!66472 Unit!3100)))

(declare-fun b!102150 () Bool)

(assert (=> b!102150 (= e!66473 e!66469)))

(declare-fun res!51132 () Bool)

(assert (=> b!102150 (= res!51132 call!10643)))

(assert (=> b!102150 (=> (not res!51132) (not e!66469))))

(declare-fun b!102151 () Bool)

(declare-fun res!51140 () Bool)

(assert (=> b!102151 (=> (not res!51140) (not e!66471))))

(assert (=> b!102151 (= res!51140 (= (select (arr!2024 (_keys!4235 newMap!16)) (index!3146 lt!51940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!10644 () Bool)

(declare-fun bm!10639 () Bool)

(assert (=> bm!10639 (= call!10644 (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!102152 () Bool)

(assert (=> b!102152 (= e!66473 ((_ is Undefined!250) lt!51940))))

(declare-fun b!102153 () Bool)

(assert (=> b!102153 (= e!66471 (not call!10644))))

(declare-fun c!17611 () Bool)

(declare-fun bm!10640 () Bool)

(assert (=> bm!10640 (= call!10642 (inRange!0 (ite c!17611 (index!3147 lt!51938) (ite c!17610 (index!3146 lt!51940) (index!3149 lt!51940))) (mask!6658 newMap!16)))))

(declare-fun b!102154 () Bool)

(assert (=> b!102154 (= e!66467 (= (map!1263 (_2!1172 lt!51942)) (+!133 (map!1263 newMap!16) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10641 () Bool)

(assert (=> bm!10641 (= call!10643 call!10642)))

(declare-fun b!102147 () Bool)

(assert (=> b!102147 (= e!66469 (not call!10644))))

(declare-fun d!27695 () Bool)

(assert (=> d!27695 e!66467))

(declare-fun res!51135 () Bool)

(assert (=> d!27695 (=> (not res!51135) (not e!66467))))

(assert (=> d!27695 (= res!51135 (_1!1172 lt!51942))))

(assert (=> d!27695 (= lt!51942 (tuple2!2323 true (LongMapFixedSize!869 (defaultEntry!2535 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (bvadd (_size!483 newMap!16) #b00000000000000000000000000000001) (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))) (_vacant!483 newMap!16))))))

(declare-fun lt!51936 () Unit!3077)

(declare-fun lt!51949 () Unit!3077)

(assert (=> d!27695 (= lt!51936 lt!51949)))

(declare-fun lt!51930 () array!4265)

(declare-fun lt!51937 () array!4267)

(assert (=> d!27695 (contains!800 (getCurrentListMap!459 lt!51930 lt!51937 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552))))))

(assert (=> d!27695 (= lt!51949 (lemmaValidKeyInArrayIsInListMap!104 lt!51930 lt!51937 (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (defaultEntry!2535 newMap!16)))))

(assert (=> d!27695 (= lt!51937 (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))))))

(assert (=> d!27695 (= lt!51930 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun lt!51923 () Unit!3077)

(declare-fun lt!51941 () Unit!3077)

(assert (=> d!27695 (= lt!51923 lt!51941)))

(declare-fun lt!51948 () array!4265)

(assert (=> d!27695 (= (arrayCountValidKeys!0 lt!51948 (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (bvadd (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4265 (_ BitVec 32)) Unit!3077)

(assert (=> d!27695 (= lt!51941 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51948 (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552))))))

(assert (=> d!27695 (= lt!51948 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun lt!51924 () Unit!3077)

(declare-fun lt!51944 () Unit!3077)

(assert (=> d!27695 (= lt!51924 lt!51944)))

(declare-fun lt!51933 () array!4265)

(assert (=> d!27695 (arrayContainsKey!0 lt!51933 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27695 (= lt!51944 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!51933 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552))))))

(assert (=> d!27695 (= lt!51933 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))))))

(declare-fun lt!51943 () Unit!3077)

(declare-fun lt!51945 () Unit!3077)

(assert (=> d!27695 (= lt!51943 lt!51945)))

(assert (=> d!27695 (= (+!133 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (tuple2!2325 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!459 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))) (array!4268 (store (arr!2025 (_values!2518 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (ValueCellFull!980 (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2278 (_values!2518 newMap!16))) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!28 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3177 V!3177 (_ BitVec 32) (_ BitVec 64) V!3177 Int) Unit!3077)

(assert (=> d!27695 (= lt!51945 (lemmaAddValidKeyToArrayThenAddPairToListMap!28 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2535 newMap!16)))))

(declare-fun lt!51932 () Unit!3077)

(declare-fun lt!51934 () Unit!3077)

(assert (=> d!27695 (= lt!51932 lt!51934)))

(assert (=> d!27695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))) (mask!6658 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4265 (_ BitVec 32) (_ BitVec 32)) Unit!3077)

(assert (=> d!27695 (= lt!51934 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (_keys!4235 newMap!16) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (mask!6658 newMap!16)))))

(declare-fun lt!51952 () Unit!3077)

(declare-fun lt!51947 () Unit!3077)

(assert (=> d!27695 (= lt!51952 lt!51947)))

(assert (=> d!27695 (= (arrayCountValidKeys!0 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))) #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4235 newMap!16) #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4265 (_ BitVec 32) (_ BitVec 64)) Unit!3077)

(assert (=> d!27695 (= lt!51947 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4235 newMap!16) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(declare-fun lt!51935 () Unit!3077)

(declare-fun lt!51946 () Unit!3077)

(assert (=> d!27695 (= lt!51935 lt!51946)))

(declare-fun lt!51950 () (_ BitVec 32))

(declare-fun lt!51951 () List!1575)

(assert (=> d!27695 (arrayNoDuplicates!0 (array!4266 (store (arr!2024 (_keys!4235 newMap!16)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)) (size!2277 (_keys!4235 newMap!16))) lt!51950 lt!51951)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1575) Unit!3077)

(assert (=> d!27695 (= lt!51946 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552)) lt!51950 lt!51951))))

(assert (=> d!27695 (= lt!51951 Nil!1572)))

(assert (=> d!27695 (= lt!51950 #b00000000000000000000000000000000)))

(declare-fun lt!51939 () Unit!3077)

(assert (=> d!27695 (= lt!51939 e!66472)))

(declare-fun c!17609 () Bool)

(assert (=> d!27695 (= c!17609 (arrayContainsKey!0 (_keys!4235 newMap!16) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51928 () Unit!3077)

(assert (=> d!27695 (= lt!51928 e!66470)))

(assert (=> d!27695 (= c!17611 (contains!800 (getCurrentListMap!459 (_keys!4235 newMap!16) (_values!2518 newMap!16) (mask!6658 newMap!16) (extraKeys!2346 newMap!16) (zeroValue!2413 newMap!16) (minValue!2413 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2535 newMap!16)) (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355)))))

(assert (=> d!27695 (valid!403 newMap!16)))

(assert (=> d!27695 (= (updateHelperNewKey!44 newMap!16 (select (arr!2024 (_keys!4235 (v!2845 (underlying!347 thiss!992)))) from!355) (get!1309 (select (arr!2025 (_values!2518 (v!2845 (underlying!347 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17488 (index!3149 lt!51552) (index!3146 lt!51552))) lt!51942)))

(assert (= (and d!27695 c!17611) b!102142))

(assert (= (and d!27695 (not c!17611)) b!102140))

(assert (= (and b!102142 res!51138) b!102146))

(assert (= (and b!102146 res!51133) b!102139))

(assert (= (and b!102140 c!17610) b!102143))

(assert (= (and b!102140 (not c!17610)) b!102144))

(assert (= (and b!102143 res!51134) b!102151))

(assert (= (and b!102151 res!51140) b!102153))

(assert (= (and b!102144 c!17608) b!102150))

(assert (= (and b!102144 (not c!17608)) b!102152))

(assert (= (and b!102150 res!51132) b!102148))

(assert (= (and b!102148 res!51137) b!102147))

(assert (= (or b!102143 b!102150) bm!10641))

(assert (= (or b!102153 b!102147) bm!10639))

(assert (= (or b!102146 bm!10641) bm!10640))

(assert (= (or b!102142 b!102140) bm!10638))

(assert (= (and d!27695 c!17609) b!102141))

(assert (= (and d!27695 (not c!17609)) b!102149))

(assert (= (and d!27695 res!51135) b!102145))

(assert (= (and b!102145 res!51136) b!102138))

(assert (= (and b!102138 res!51139) b!102154))

(assert (=> b!102141 m!112337))

(declare-fun m!113181 () Bool)

(assert (=> b!102141 m!113181))

(assert (=> b!102141 m!112519))

(assert (=> b!102141 m!112519))

(assert (=> b!102141 m!112337))

(declare-fun m!113183 () Bool)

(assert (=> b!102141 m!113183))

(declare-fun m!113185 () Bool)

(assert (=> b!102145 m!113185))

(declare-fun m!113187 () Bool)

(assert (=> b!102139 m!113187))

(assert (=> b!102140 m!112337))

(assert (=> b!102140 m!112499))

(assert (=> b!102142 m!112337))

(assert (=> b!102142 m!112537))

(declare-fun m!113189 () Bool)

(assert (=> b!102154 m!113189))

(assert (=> b!102154 m!112339))

(assert (=> b!102154 m!112339))

(declare-fun m!113191 () Bool)

(assert (=> b!102154 m!113191))

(declare-fun m!113193 () Bool)

(assert (=> bm!10640 m!113193))

(assert (=> bm!10638 m!112337))

(assert (=> bm!10638 m!112489))

(assert (=> bm!10639 m!112337))

(assert (=> bm!10639 m!112539))

(declare-fun m!113195 () Bool)

(assert (=> b!102151 m!113195))

(assert (=> b!102138 m!113189))

(assert (=> b!102138 m!113189))

(assert (=> b!102138 m!112337))

(declare-fun m!113197 () Bool)

(assert (=> b!102138 m!113197))

(declare-fun m!113199 () Bool)

(assert (=> d!27695 m!113199))

(declare-fun m!113201 () Bool)

(assert (=> d!27695 m!113201))

(declare-fun m!113203 () Bool)

(assert (=> d!27695 m!113203))

(declare-fun m!113205 () Bool)

(assert (=> d!27695 m!113205))

(assert (=> d!27695 m!112337))

(declare-fun m!113207 () Bool)

(assert (=> d!27695 m!113207))

(assert (=> d!27695 m!112337))

(assert (=> d!27695 m!112539))

(assert (=> d!27695 m!112609))

(assert (=> d!27695 m!112519))

(assert (=> d!27695 m!113045))

(declare-fun m!113209 () Bool)

(assert (=> d!27695 m!113209))

(assert (=> d!27695 m!112337))

(declare-fun m!113211 () Bool)

(assert (=> d!27695 m!113211))

(declare-fun m!113213 () Bool)

(assert (=> d!27695 m!113213))

(assert (=> d!27695 m!113205))

(declare-fun m!113215 () Bool)

(assert (=> d!27695 m!113215))

(declare-fun m!113217 () Bool)

(assert (=> d!27695 m!113217))

(assert (=> d!27695 m!112519))

(assert (=> d!27695 m!112337))

(assert (=> d!27695 m!113183))

(assert (=> d!27695 m!112337))

(declare-fun m!113219 () Bool)

(assert (=> d!27695 m!113219))

(assert (=> d!27695 m!112337))

(declare-fun m!113221 () Bool)

(assert (=> d!27695 m!113221))

(assert (=> d!27695 m!112337))

(assert (=> d!27695 m!112353))

(declare-fun m!113223 () Bool)

(assert (=> d!27695 m!113223))

(declare-fun m!113225 () Bool)

(assert (=> d!27695 m!113225))

(assert (=> d!27695 m!112337))

(declare-fun m!113227 () Bool)

(assert (=> d!27695 m!113227))

(declare-fun m!113229 () Bool)

(assert (=> d!27695 m!113229))

(declare-fun m!113231 () Bool)

(assert (=> d!27695 m!113231))

(assert (=> d!27695 m!112373))

(declare-fun m!113233 () Bool)

(assert (=> d!27695 m!113233))

(assert (=> d!27695 m!112519))

(assert (=> d!27695 m!113215))

(declare-fun m!113235 () Bool)

(assert (=> b!102148 m!113235))

(assert (=> bm!10564 d!27695))

(declare-fun b!102163 () Bool)

(declare-fun e!66479 () (_ BitVec 32))

(declare-fun e!66480 () (_ BitVec 32))

(assert (=> b!102163 (= e!66479 e!66480)))

(declare-fun c!17617 () Bool)

(assert (=> b!102163 (= c!17617 (validKeyInArray!0 (select (arr!2024 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!102164 () Bool)

(declare-fun call!10647 () (_ BitVec 32))

(assert (=> b!102164 (= e!66480 (bvadd #b00000000000000000000000000000001 call!10647))))

(declare-fun d!27697 () Bool)

(declare-fun lt!51955 () (_ BitVec 32))

(assert (=> d!27697 (and (bvsge lt!51955 #b00000000000000000000000000000000) (bvsle lt!51955 (bvsub (size!2277 (_keys!4235 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!27697 (= lt!51955 e!66479)))

(declare-fun c!17616 () Bool)

(assert (=> d!27697 (= c!17616 (bvsge #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))))))

(assert (=> d!27697 (and (bvsle #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2277 (_keys!4235 newMap!16)) (size!2277 (_keys!4235 newMap!16))))))

(assert (=> d!27697 (= (arrayCountValidKeys!0 (_keys!4235 newMap!16) #b00000000000000000000000000000000 (size!2277 (_keys!4235 newMap!16))) lt!51955)))

(declare-fun b!102165 () Bool)

(assert (=> b!102165 (= e!66479 #b00000000000000000000000000000000)))

(declare-fun b!102166 () Bool)

(assert (=> b!102166 (= e!66480 call!10647)))

(declare-fun bm!10644 () Bool)

(assert (=> bm!10644 (= call!10647 (arrayCountValidKeys!0 (_keys!4235 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2277 (_keys!4235 newMap!16))))))

(assert (= (and d!27697 c!17616) b!102165))

(assert (= (and d!27697 (not c!17616)) b!102163))

(assert (= (and b!102163 c!17617) b!102164))

(assert (= (and b!102163 (not c!17617)) b!102166))

(assert (= (or b!102164 b!102166) bm!10644))

(assert (=> b!102163 m!112775))

(assert (=> b!102163 m!112775))

(assert (=> b!102163 m!112777))

(declare-fun m!113237 () Bool)

(assert (=> bm!10644 m!113237))

(assert (=> b!101756 d!27697))

(assert (=> bm!10543 d!27525))

(assert (=> d!27527 d!27545))

(assert (=> bm!10566 d!27691))

(declare-fun mapIsEmpty!3833 () Bool)

(declare-fun mapRes!3833 () Bool)

(assert (=> mapIsEmpty!3833 mapRes!3833))

(declare-fun condMapEmpty!3833 () Bool)

(declare-fun mapDefault!3833 () ValueCell!980)

(assert (=> mapNonEmpty!3831 (= condMapEmpty!3833 (= mapRest!3831 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3833)))))

(declare-fun e!66481 () Bool)

(assert (=> mapNonEmpty!3831 (= tp!9717 (and e!66481 mapRes!3833))))

(declare-fun b!102167 () Bool)

(declare-fun e!66482 () Bool)

(assert (=> b!102167 (= e!66482 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3833 () Bool)

(declare-fun tp!9719 () Bool)

(assert (=> mapNonEmpty!3833 (= mapRes!3833 (and tp!9719 e!66482))))

(declare-fun mapValue!3833 () ValueCell!980)

(declare-fun mapKey!3833 () (_ BitVec 32))

(declare-fun mapRest!3833 () (Array (_ BitVec 32) ValueCell!980))

(assert (=> mapNonEmpty!3833 (= mapRest!3831 (store mapRest!3833 mapKey!3833 mapValue!3833))))

(declare-fun b!102168 () Bool)

(assert (=> b!102168 (= e!66481 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3831 condMapEmpty!3833) mapIsEmpty!3833))

(assert (= (and mapNonEmpty!3831 (not condMapEmpty!3833)) mapNonEmpty!3833))

(assert (= (and mapNonEmpty!3833 ((_ is ValueCellFull!980) mapValue!3833)) b!102167))

(assert (= (and mapNonEmpty!3831 ((_ is ValueCellFull!980) mapDefault!3833)) b!102168))

(declare-fun m!113239 () Bool)

(assert (=> mapNonEmpty!3833 m!113239))

(declare-fun mapIsEmpty!3834 () Bool)

(declare-fun mapRes!3834 () Bool)

(assert (=> mapIsEmpty!3834 mapRes!3834))

(declare-fun condMapEmpty!3834 () Bool)

(declare-fun mapDefault!3834 () ValueCell!980)

(assert (=> mapNonEmpty!3832 (= condMapEmpty!3834 (= mapRest!3832 ((as const (Array (_ BitVec 32) ValueCell!980)) mapDefault!3834)))))

(declare-fun e!66483 () Bool)

(assert (=> mapNonEmpty!3832 (= tp!9718 (and e!66483 mapRes!3834))))

(declare-fun b!102169 () Bool)

(declare-fun e!66484 () Bool)

(assert (=> b!102169 (= e!66484 tp_is_empty!2647)))

(declare-fun mapNonEmpty!3834 () Bool)

(declare-fun tp!9720 () Bool)

(assert (=> mapNonEmpty!3834 (= mapRes!3834 (and tp!9720 e!66484))))

(declare-fun mapKey!3834 () (_ BitVec 32))

(declare-fun mapValue!3834 () ValueCell!980)

(declare-fun mapRest!3834 () (Array (_ BitVec 32) ValueCell!980))

(assert (=> mapNonEmpty!3834 (= mapRest!3832 (store mapRest!3834 mapKey!3834 mapValue!3834))))

(declare-fun b!102170 () Bool)

(assert (=> b!102170 (= e!66483 tp_is_empty!2647)))

(assert (= (and mapNonEmpty!3832 condMapEmpty!3834) mapIsEmpty!3834))

(assert (= (and mapNonEmpty!3832 (not condMapEmpty!3834)) mapNonEmpty!3834))

(assert (= (and mapNonEmpty!3834 ((_ is ValueCellFull!980) mapValue!3834)) b!102169))

(assert (= (and mapNonEmpty!3832 ((_ is ValueCellFull!980) mapDefault!3834)) b!102170))

(declare-fun m!113241 () Bool)

(assert (=> mapNonEmpty!3834 m!113241))

(declare-fun b_lambda!4571 () Bool)

(assert (= b_lambda!4561 (or (and b!101408 b_free!2461) (and b!101403 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))))) b_lambda!4571)))

(declare-fun b_lambda!4573 () Bool)

(assert (= b_lambda!4565 (or (and b!101408 b_free!2461 (= (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101403 b_free!2463) b_lambda!4573)))

(declare-fun b_lambda!4575 () Bool)

(assert (= b_lambda!4563 (or (and b!101408 b_free!2461) (and b!101403 b_free!2463 (= (defaultEntry!2535 newMap!16) (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))))) b_lambda!4575)))

(declare-fun b_lambda!4577 () Bool)

(assert (= b_lambda!4567 (or (and b!101408 b_free!2461 (= (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101403 b_free!2463) b_lambda!4577)))

(declare-fun b_lambda!4579 () Bool)

(assert (= b_lambda!4569 (or (and b!101408 b_free!2461 (= (defaultEntry!2535 (v!2845 (underlying!347 thiss!992))) (defaultEntry!2535 newMap!16))) (and b!101403 b_free!2463) b_lambda!4579)))

(check-sat (not bm!10638) (not d!27651) (not b!102039) (not b!102036) (not b!102103) (not b!102140) (not bm!10599) (not b_lambda!4577) (not b!102058) (not d!27579) (not b!101894) (not d!27681) (not b!102141) (not b!101986) (not b!102054) (not b!101967) (not b!102095) (not b!102017) (not bm!10612) (not b!101895) (not b!102142) (not b_next!2463) (not b_lambda!4555) (not b!101908) (not b!101936) (not b!101975) (not bm!10628) (not d!27641) (not b!102030) (not b!101993) (not b_lambda!4571) (not b!101916) (not b!101925) (not b!101990) (not bm!10614) (not d!27653) (not b!101933) (not b!101934) (not b!101998) (not b!102069) (not b!102008) (not b!101915) (not b!101955) (not d!27595) (not d!27695) (not d!27601) (not bm!10615) (not d!27667) (not d!27627) (not b!101948) (not d!27565) (not b!101887) (not d!27559) (not b!102077) (not d!27657) (not b!101888) (not mapNonEmpty!3834) (not b!101982) (not b!101922) (not d!27691) (not b!102050) (not d!27673) (not b!102081) (not d!27573) (not d!27649) (not d!27589) (not b!101987) (not d!27591) (not b!101950) (not d!27663) (not b!101839) (not b!102099) (not b!101879) (not b!102026) (not d!27687) (not b!101988) (not b!102024) (not bm!10639) (not d!27593) (not bm!10644) (not bm!10627) (not d!27615) (not b!102032) (not d!27677) (not b!101889) (not b!102062) (not d!27671) (not b!102046) (not b!101995) (not b!102004) (not b!102063) (not d!27587) (not b!102085) (not b!101973) (not b!101971) (not d!27599) (not bm!10616) (not bm!10604) (not b!102035) (not b!102101) (not bm!10620) (not b_lambda!4573) (not b!101881) (not d!27603) (not d!27645) (not d!27647) (not b!102013) (not b!102043) (not b!102029) (not mapNonEmpty!3833) (not d!27665) (not d!27669) (not b!101878) (not d!27597) (not bm!10640) (not b!101921) (not b!101850) (not b!102060) (not b!101914) (not b!101949) (not d!27609) (not bm!10611) (not d!27675) (not d!27575) (not b!101924) (not b!102028) (not b!102096) (not b!102068) (not b!101991) (not b!101980) (not b!102145) (not b!101974) (not bm!10603) (not b!101997) (not d!27683) (not d!27661) (not b!102015) (not d!27685) (not b!101919) (not b!101882) (not bm!10605) (not b!102090) (not bm!10622) (not b!102006) (not d!27631) (not bm!10623) (not b!101944) (not b!102154) (not b!102045) tp_is_empty!2647 (not bm!10610) (not b!102138) (not d!27561) (not b!101883) b_and!6285 (not b_lambda!4559) (not b!101984) (not b!101917) (not b!101877) (not d!27679) (not d!27617) (not b!101935) (not d!27659) (not b!102163) (not b!102042) (not b_next!2461) (not d!27655) (not b!101927) (not b!102087) (not b!102091) (not bm!10600) (not d!27567) (not b!101970) (not b!101940) (not b!102064) (not d!27557) (not bm!10621) b_and!6287 (not b!101946) (not b!102048) (not d!27581) (not b_lambda!4579) (not bm!10629) (not b!102089) (not d!27625) (not b!102033) (not d!27635) (not bm!10606) (not b_lambda!4575) (not b!101886) (not bm!10613) (not b!101968) (not d!27571) (not b!101954) (not d!27621) (not b!102025))
(check-sat b_and!6285 b_and!6287 (not b_next!2461) (not b_next!2463))
