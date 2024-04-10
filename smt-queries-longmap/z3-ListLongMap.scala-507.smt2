; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12136 () Bool)

(assert start!12136)

(declare-fun b!102350 () Bool)

(declare-fun b_free!2477 () Bool)

(declare-fun b_next!2477 () Bool)

(assert (=> b!102350 (= b_free!2477 (not b_next!2477))))

(declare-fun tp!9744 () Bool)

(declare-fun b_and!6303 () Bool)

(assert (=> b!102350 (= tp!9744 b_and!6303)))

(declare-fun b!102342 () Bool)

(declare-fun b_free!2479 () Bool)

(declare-fun b_next!2479 () Bool)

(assert (=> b!102342 (= b_free!2479 (not b_next!2479))))

(declare-fun tp!9742 () Bool)

(declare-fun b_and!6305 () Bool)

(assert (=> b!102342 (= tp!9742 b_and!6305)))

(declare-fun b!102337 () Bool)

(declare-fun res!51225 () Bool)

(declare-fun e!66609 () Bool)

(assert (=> b!102337 (=> (not res!51225) (not e!66609))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3187 0))(
  ( (V!3188 (val!1372 Int)) )
))
(declare-datatypes ((array!4297 0))(
  ( (array!4298 (arr!2039 (Array (_ BitVec 32) (_ BitVec 64))) (size!2293 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!984 0))(
  ( (ValueCellFull!984 (v!2855 V!3187)) (EmptyCell!984) )
))
(declare-datatypes ((array!4299 0))(
  ( (array!4300 (arr!2040 (Array (_ BitVec 32) ValueCell!984)) (size!2294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!876 0))(
  ( (LongMapFixedSize!877 (defaultEntry!2549 Int) (mask!6678 (_ BitVec 32)) (extraKeys!2358 (_ BitVec 32)) (zeroValue!2426 V!3187) (minValue!2426 V!3187) (_size!487 (_ BitVec 32)) (_keys!4251 array!4297) (_values!2532 array!4299) (_vacant!487 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!676 0))(
  ( (Cell!677 (v!2856 LongMapFixedSize!876)) )
))
(declare-datatypes ((LongMap!676 0))(
  ( (LongMap!677 (underlying!349 Cell!676)) )
))
(declare-fun thiss!992 () LongMap!676)

(assert (=> b!102337 (= res!51225 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2293 (_keys!4251 (v!2856 (underlying!349 thiss!992)))))))))

(declare-fun b!102338 () Bool)

(declare-fun e!66617 () Bool)

(declare-fun e!66608 () Bool)

(assert (=> b!102338 (= e!66617 e!66608)))

(declare-fun res!51224 () Bool)

(assert (=> b!102338 (=> (not res!51224) (not e!66608))))

(declare-datatypes ((tuple2!2372 0))(
  ( (tuple2!2373 (_1!1197 Bool) (_2!1197 LongMapFixedSize!876)) )
))
(declare-fun lt!52052 () tuple2!2372)

(assert (=> b!102338 (= res!51224 (and (_1!1197 lt!52052) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3118 0))(
  ( (Unit!3119) )
))
(declare-fun lt!52048 () Unit!3118)

(declare-fun e!66603 () Unit!3118)

(assert (=> b!102338 (= lt!52048 e!66603)))

(declare-datatypes ((tuple2!2374 0))(
  ( (tuple2!2375 (_1!1198 (_ BitVec 64)) (_2!1198 V!3187)) )
))
(declare-datatypes ((List!1597 0))(
  ( (Nil!1594) (Cons!1593 (h!2189 tuple2!2374) (t!5623 List!1597)) )
))
(declare-datatypes ((ListLongMap!1553 0))(
  ( (ListLongMap!1554 (toList!792 List!1597)) )
))
(declare-fun lt!52051 () ListLongMap!1553)

(declare-fun c!17634 () Bool)

(declare-fun contains!816 (ListLongMap!1553 (_ BitVec 64)) Bool)

(assert (=> b!102338 (= c!17634 (contains!816 lt!52051 (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!876)

(declare-fun update!148 (LongMapFixedSize!876 (_ BitVec 64) V!3187) tuple2!2372)

(declare-fun get!1308 (ValueCell!984 V!3187) V!3187)

(declare-fun dynLambda!376 (Int (_ BitVec 64)) V!3187)

(assert (=> b!102338 (= lt!52052 (update!148 newMap!16 (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) (get!1308 (select (arr!2040 (_values!2532 (v!2856 (underlying!349 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2549 (v!2856 (underlying!349 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102339 () Bool)

(declare-fun Unit!3120 () Unit!3118)

(assert (=> b!102339 (= e!66603 Unit!3120)))

(declare-fun lt!52053 () Unit!3118)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!97 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3187 V!3187 (_ BitVec 64) (_ BitVec 32) Int) Unit!3118)

(assert (=> b!102339 (= lt!52053 (lemmaListMapContainsThenArrayContainsFrom!97 (_keys!4251 (v!2856 (underlying!349 thiss!992))) (_values!2532 (v!2856 (underlying!349 thiss!992))) (mask!6678 (v!2856 (underlying!349 thiss!992))) (extraKeys!2358 (v!2856 (underlying!349 thiss!992))) (zeroValue!2426 (v!2856 (underlying!349 thiss!992))) (minValue!2426 (v!2856 (underlying!349 thiss!992))) (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2549 (v!2856 (underlying!349 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102339 (arrayContainsKey!0 (_keys!4251 (v!2856 (underlying!349 thiss!992))) (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52049 () Unit!3118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4297 (_ BitVec 32) (_ BitVec 32)) Unit!3118)

(assert (=> b!102339 (= lt!52049 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4251 (v!2856 (underlying!349 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1598 0))(
  ( (Nil!1595) (Cons!1594 (h!2190 (_ BitVec 64)) (t!5624 List!1598)) )
))
(declare-fun arrayNoDuplicates!0 (array!4297 (_ BitVec 32) List!1598) Bool)

(assert (=> b!102339 (arrayNoDuplicates!0 (_keys!4251 (v!2856 (underlying!349 thiss!992))) from!355 Nil!1595)))

(declare-fun lt!52054 () Unit!3118)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4297 (_ BitVec 32) (_ BitVec 64) List!1598) Unit!3118)

(assert (=> b!102339 (= lt!52054 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4251 (v!2856 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) (Cons!1594 (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) Nil!1595)))))

(assert (=> b!102339 false))

(declare-fun b!102341 () Bool)

(declare-fun e!66604 () Bool)

(declare-fun tp_is_empty!2655 () Bool)

(assert (=> b!102341 (= e!66604 tp_is_empty!2655)))

(declare-fun mapIsEmpty!3845 () Bool)

(declare-fun mapRes!3846 () Bool)

(assert (=> mapIsEmpty!3845 mapRes!3846))

(declare-fun e!66607 () Bool)

(declare-fun e!66611 () Bool)

(declare-fun array_inv!1277 (array!4297) Bool)

(declare-fun array_inv!1278 (array!4299) Bool)

(assert (=> b!102342 (= e!66607 (and tp!9742 tp_is_empty!2655 (array_inv!1277 (_keys!4251 newMap!16)) (array_inv!1278 (_values!2532 newMap!16)) e!66611))))

(declare-fun b!102343 () Bool)

(declare-fun e!66613 () Bool)

(declare-fun e!66605 () Bool)

(assert (=> b!102343 (= e!66613 e!66605)))

(declare-fun b!102344 () Bool)

(declare-fun res!51227 () Bool)

(assert (=> b!102344 (=> (not res!51227) (not e!66609))))

(assert (=> b!102344 (= res!51227 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6678 newMap!16)) (_size!487 (v!2856 (underlying!349 thiss!992)))))))

(declare-fun b!102345 () Bool)

(declare-fun res!51223 () Bool)

(assert (=> b!102345 (=> (not res!51223) (not e!66608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102345 (= res!51223 (validMask!0 (mask!6678 (v!2856 (underlying!349 thiss!992)))))))

(declare-fun mapIsEmpty!3846 () Bool)

(declare-fun mapRes!3845 () Bool)

(assert (=> mapIsEmpty!3846 mapRes!3845))

(declare-fun b!102346 () Bool)

(declare-fun res!51226 () Bool)

(assert (=> b!102346 (=> (not res!51226) (not e!66608))))

(assert (=> b!102346 (= res!51226 (arrayNoDuplicates!0 (_keys!4251 (v!2856 (underlying!349 thiss!992))) #b00000000000000000000000000000000 Nil!1595))))

(declare-fun mapNonEmpty!3845 () Bool)

(declare-fun tp!9743 () Bool)

(assert (=> mapNonEmpty!3845 (= mapRes!3845 (and tp!9743 e!66604))))

(declare-fun mapRest!3846 () (Array (_ BitVec 32) ValueCell!984))

(declare-fun mapKey!3845 () (_ BitVec 32))

(declare-fun mapValue!3845 () ValueCell!984)

(assert (=> mapNonEmpty!3845 (= (arr!2040 (_values!2532 newMap!16)) (store mapRest!3846 mapKey!3845 mapValue!3845))))

(declare-fun b!102347 () Bool)

(declare-fun e!66612 () Bool)

(declare-fun e!66606 () Bool)

(assert (=> b!102347 (= e!66612 (and e!66606 mapRes!3846))))

(declare-fun condMapEmpty!3846 () Bool)

(declare-fun mapDefault!3845 () ValueCell!984)

(assert (=> b!102347 (= condMapEmpty!3846 (= (arr!2040 (_values!2532 (v!2856 (underlying!349 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!984)) mapDefault!3845)))))

(declare-fun b!102348 () Bool)

(declare-fun e!66616 () Bool)

(assert (=> b!102348 (= e!66616 tp_is_empty!2655)))

(declare-fun b!102349 () Bool)

(declare-fun e!66610 () Bool)

(assert (=> b!102349 (= e!66605 e!66610)))

(declare-fun b!102340 () Bool)

(declare-fun res!51230 () Bool)

(assert (=> b!102340 (=> (not res!51230) (not e!66608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4297 (_ BitVec 32)) Bool)

(assert (=> b!102340 (= res!51230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4251 (v!2856 (underlying!349 thiss!992))) (mask!6678 (v!2856 (underlying!349 thiss!992)))))))

(declare-fun res!51231 () Bool)

(assert (=> start!12136 (=> (not res!51231) (not e!66609))))

(declare-fun valid!402 (LongMap!676) Bool)

(assert (=> start!12136 (= res!51231 (valid!402 thiss!992))))

(assert (=> start!12136 e!66609))

(assert (=> start!12136 e!66613))

(assert (=> start!12136 true))

(assert (=> start!12136 e!66607))

(assert (=> b!102350 (= e!66610 (and tp!9744 tp_is_empty!2655 (array_inv!1277 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) (array_inv!1278 (_values!2532 (v!2856 (underlying!349 thiss!992)))) e!66612))))

(declare-fun mapNonEmpty!3846 () Bool)

(declare-fun tp!9741 () Bool)

(declare-fun e!66602 () Bool)

(assert (=> mapNonEmpty!3846 (= mapRes!3846 (and tp!9741 e!66602))))

(declare-fun mapKey!3846 () (_ BitVec 32))

(declare-fun mapRest!3845 () (Array (_ BitVec 32) ValueCell!984))

(declare-fun mapValue!3846 () ValueCell!984)

(assert (=> mapNonEmpty!3846 (= (arr!2040 (_values!2532 (v!2856 (underlying!349 thiss!992)))) (store mapRest!3845 mapKey!3846 mapValue!3846))))

(declare-fun b!102351 () Bool)

(assert (=> b!102351 (= e!66602 tp_is_empty!2655)))

(declare-fun b!102352 () Bool)

(assert (=> b!102352 (= e!66611 (and e!66616 mapRes!3845))))

(declare-fun condMapEmpty!3845 () Bool)

(declare-fun mapDefault!3846 () ValueCell!984)

(assert (=> b!102352 (= condMapEmpty!3845 (= (arr!2040 (_values!2532 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!984)) mapDefault!3846)))))

(declare-fun b!102353 () Bool)

(declare-fun res!51232 () Bool)

(assert (=> b!102353 (=> (not res!51232) (not e!66608))))

(assert (=> b!102353 (= res!51232 (and (= (size!2294 (_values!2532 (v!2856 (underlying!349 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6678 (v!2856 (underlying!349 thiss!992))))) (= (size!2293 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) (size!2294 (_values!2532 (v!2856 (underlying!349 thiss!992))))) (bvsge (mask!6678 (v!2856 (underlying!349 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2358 (v!2856 (underlying!349 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2358 (v!2856 (underlying!349 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!102354 () Bool)

(assert (=> b!102354 (= e!66609 e!66617)))

(declare-fun res!51228 () Bool)

(assert (=> b!102354 (=> (not res!51228) (not e!66617))))

(declare-fun lt!52050 () ListLongMap!1553)

(assert (=> b!102354 (= res!51228 (and (= lt!52050 lt!52051) (not (= (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2039 (_keys!4251 (v!2856 (underlying!349 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1271 (LongMapFixedSize!876) ListLongMap!1553)

(assert (=> b!102354 (= lt!52051 (map!1271 newMap!16))))

(declare-fun getCurrentListMap!482 (array!4297 array!4299 (_ BitVec 32) (_ BitVec 32) V!3187 V!3187 (_ BitVec 32) Int) ListLongMap!1553)

(assert (=> b!102354 (= lt!52050 (getCurrentListMap!482 (_keys!4251 (v!2856 (underlying!349 thiss!992))) (_values!2532 (v!2856 (underlying!349 thiss!992))) (mask!6678 (v!2856 (underlying!349 thiss!992))) (extraKeys!2358 (v!2856 (underlying!349 thiss!992))) (zeroValue!2426 (v!2856 (underlying!349 thiss!992))) (minValue!2426 (v!2856 (underlying!349 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2549 (v!2856 (underlying!349 thiss!992)))))))

(declare-fun b!102355 () Bool)

(assert (=> b!102355 (= e!66606 tp_is_empty!2655)))

(declare-fun b!102356 () Bool)

(declare-fun res!51229 () Bool)

(assert (=> b!102356 (=> (not res!51229) (not e!66609))))

(declare-fun valid!403 (LongMapFixedSize!876) Bool)

(assert (=> b!102356 (= res!51229 (valid!403 newMap!16))))

(declare-fun b!102357 () Bool)

(assert (=> b!102357 (= e!66608 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!102358 () Bool)

(declare-fun Unit!3121 () Unit!3118)

(assert (=> b!102358 (= e!66603 Unit!3121)))

(assert (= (and start!12136 res!51231) b!102337))

(assert (= (and b!102337 res!51225) b!102356))

(assert (= (and b!102356 res!51229) b!102344))

(assert (= (and b!102344 res!51227) b!102354))

(assert (= (and b!102354 res!51228) b!102338))

(assert (= (and b!102338 c!17634) b!102339))

(assert (= (and b!102338 (not c!17634)) b!102358))

(assert (= (and b!102338 res!51224) b!102345))

(assert (= (and b!102345 res!51223) b!102353))

(assert (= (and b!102353 res!51232) b!102340))

(assert (= (and b!102340 res!51230) b!102346))

(assert (= (and b!102346 res!51226) b!102357))

(assert (= (and b!102347 condMapEmpty!3846) mapIsEmpty!3845))

(assert (= (and b!102347 (not condMapEmpty!3846)) mapNonEmpty!3846))

(get-info :version)

(assert (= (and mapNonEmpty!3846 ((_ is ValueCellFull!984) mapValue!3846)) b!102351))

(assert (= (and b!102347 ((_ is ValueCellFull!984) mapDefault!3845)) b!102355))

(assert (= b!102350 b!102347))

(assert (= b!102349 b!102350))

(assert (= b!102343 b!102349))

(assert (= start!12136 b!102343))

(assert (= (and b!102352 condMapEmpty!3845) mapIsEmpty!3846))

(assert (= (and b!102352 (not condMapEmpty!3845)) mapNonEmpty!3845))

(assert (= (and mapNonEmpty!3845 ((_ is ValueCellFull!984) mapValue!3845)) b!102341))

(assert (= (and b!102352 ((_ is ValueCellFull!984) mapDefault!3846)) b!102348))

(assert (= b!102342 b!102352))

(assert (= start!12136 b!102342))

(declare-fun b_lambda!4585 () Bool)

(assert (=> (not b_lambda!4585) (not b!102338)))

(declare-fun t!5620 () Bool)

(declare-fun tb!1993 () Bool)

(assert (=> (and b!102350 (= (defaultEntry!2549 (v!2856 (underlying!349 thiss!992))) (defaultEntry!2549 (v!2856 (underlying!349 thiss!992)))) t!5620) tb!1993))

(declare-fun result!3365 () Bool)

(assert (=> tb!1993 (= result!3365 tp_is_empty!2655)))

(assert (=> b!102338 t!5620))

(declare-fun b_and!6307 () Bool)

(assert (= b_and!6303 (and (=> t!5620 result!3365) b_and!6307)))

(declare-fun t!5622 () Bool)

(declare-fun tb!1995 () Bool)

(assert (=> (and b!102342 (= (defaultEntry!2549 newMap!16) (defaultEntry!2549 (v!2856 (underlying!349 thiss!992)))) t!5622) tb!1995))

(declare-fun result!3369 () Bool)

(assert (= result!3369 result!3365))

(assert (=> b!102338 t!5622))

(declare-fun b_and!6309 () Bool)

(assert (= b_and!6305 (and (=> t!5622 result!3369) b_and!6309)))

(declare-fun m!113471 () Bool)

(assert (=> b!102340 m!113471))

(declare-fun m!113473 () Bool)

(assert (=> b!102338 m!113473))

(declare-fun m!113475 () Bool)

(assert (=> b!102338 m!113475))

(declare-fun m!113477 () Bool)

(assert (=> b!102338 m!113477))

(declare-fun m!113479 () Bool)

(assert (=> b!102338 m!113479))

(assert (=> b!102338 m!113475))

(assert (=> b!102338 m!113479))

(declare-fun m!113481 () Bool)

(assert (=> b!102338 m!113481))

(assert (=> b!102338 m!113479))

(assert (=> b!102338 m!113477))

(declare-fun m!113483 () Bool)

(assert (=> b!102338 m!113483))

(assert (=> b!102338 m!113473))

(declare-fun m!113485 () Bool)

(assert (=> b!102350 m!113485))

(declare-fun m!113487 () Bool)

(assert (=> b!102350 m!113487))

(assert (=> b!102354 m!113479))

(declare-fun m!113489 () Bool)

(assert (=> b!102354 m!113489))

(declare-fun m!113491 () Bool)

(assert (=> b!102354 m!113491))

(declare-fun m!113493 () Bool)

(assert (=> mapNonEmpty!3845 m!113493))

(declare-fun m!113495 () Bool)

(assert (=> b!102339 m!113495))

(declare-fun m!113497 () Bool)

(assert (=> b!102339 m!113497))

(assert (=> b!102339 m!113479))

(declare-fun m!113499 () Bool)

(assert (=> b!102339 m!113499))

(assert (=> b!102339 m!113479))

(assert (=> b!102339 m!113479))

(declare-fun m!113501 () Bool)

(assert (=> b!102339 m!113501))

(assert (=> b!102339 m!113479))

(declare-fun m!113503 () Bool)

(assert (=> b!102339 m!113503))

(declare-fun m!113505 () Bool)

(assert (=> b!102345 m!113505))

(declare-fun m!113507 () Bool)

(assert (=> start!12136 m!113507))

(declare-fun m!113509 () Bool)

(assert (=> b!102346 m!113509))

(declare-fun m!113511 () Bool)

(assert (=> b!102356 m!113511))

(declare-fun m!113513 () Bool)

(assert (=> mapNonEmpty!3846 m!113513))

(declare-fun m!113515 () Bool)

(assert (=> b!102342 m!113515))

(declare-fun m!113517 () Bool)

(assert (=> b!102342 m!113517))

(check-sat (not b!102338) b_and!6307 (not mapNonEmpty!3845) (not b!102340) (not mapNonEmpty!3846) (not b!102346) (not b!102354) b_and!6309 (not b_next!2479) (not b!102350) (not b_next!2477) (not b!102356) (not start!12136) (not b_lambda!4585) tp_is_empty!2655 (not b!102345) (not b!102339) (not b!102342))
(check-sat b_and!6307 b_and!6309 (not b_next!2477) (not b_next!2479))
