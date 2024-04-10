; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77230 () Bool)

(assert start!77230)

(declare-fun b!901156 () Bool)

(declare-fun b_free!16071 () Bool)

(declare-fun b_next!16071 () Bool)

(assert (=> b!901156 (= b_free!16071 (not b_next!16071))))

(declare-fun tp!56309 () Bool)

(declare-fun b_and!26397 () Bool)

(assert (=> b!901156 (= tp!56309 b_and!26397)))

(declare-fun b!901144 () Bool)

(declare-fun res!608485 () Bool)

(declare-fun e!504466 () Bool)

(assert (=> b!901144 (=> res!608485 e!504466)))

(declare-datatypes ((array!52852 0))(
  ( (array!52853 (arr!25395 (Array (_ BitVec 32) (_ BitVec 64))) (size!25854 (_ BitVec 32))) )
))
(declare-datatypes ((V!29497 0))(
  ( (V!29498 (val!9250 Int)) )
))
(declare-datatypes ((ValueCell!8718 0))(
  ( (ValueCellFull!8718 (v!11749 V!29497)) (EmptyCell!8718) )
))
(declare-datatypes ((array!52854 0))(
  ( (array!52855 (arr!25396 (Array (_ BitVec 32) ValueCell!8718)) (size!25855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4452 0))(
  ( (LongMapFixedSize!4453 (defaultEntry!5464 Int) (mask!26267 (_ BitVec 32)) (extraKeys!5192 (_ BitVec 32)) (zeroValue!5296 V!29497) (minValue!5296 V!29497) (_size!2281 (_ BitVec 32)) (_keys!10274 array!52852) (_values!5483 array!52854) (_vacant!2281 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4452)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52852 (_ BitVec 32)) Bool)

(assert (=> b!901144 (= res!608485 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26267 thiss!1181))))))

(declare-fun res!608480 () Bool)

(declare-fun e!504465 () Bool)

(assert (=> start!77230 (=> (not res!608480) (not e!504465))))

(declare-fun valid!1708 (LongMapFixedSize!4452) Bool)

(assert (=> start!77230 (= res!608480 (valid!1708 thiss!1181))))

(assert (=> start!77230 e!504465))

(declare-fun e!504461 () Bool)

(assert (=> start!77230 e!504461))

(assert (=> start!77230 true))

(declare-fun b!901145 () Bool)

(declare-fun e!504464 () Bool)

(assert (=> b!901145 (= e!504465 (not e!504464))))

(declare-fun res!608489 () Bool)

(assert (=> b!901145 (=> res!608489 e!504464)))

(declare-datatypes ((SeekEntryResult!8948 0))(
  ( (MissingZero!8948 (index!38163 (_ BitVec 32))) (Found!8948 (index!38164 (_ BitVec 32))) (Intermediate!8948 (undefined!9760 Bool) (index!38165 (_ BitVec 32)) (x!76779 (_ BitVec 32))) (Undefined!8948) (MissingVacant!8948 (index!38166 (_ BitVec 32))) )
))
(declare-fun lt!407253 () SeekEntryResult!8948)

(get-info :version)

(assert (=> b!901145 (= res!608489 (not ((_ is Found!8948) lt!407253)))))

(declare-fun e!504460 () Bool)

(assert (=> b!901145 e!504460))

(declare-fun res!608488 () Bool)

(assert (=> b!901145 (=> res!608488 e!504460)))

(assert (=> b!901145 (= res!608488 (not ((_ is Found!8948) lt!407253)))))

(declare-datatypes ((Unit!30609 0))(
  ( (Unit!30610) )
))
(declare-fun lt!407250 () Unit!30609)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!109 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 64)) Unit!30609)

(assert (=> b!901145 (= lt!407250 (lemmaSeekEntryGivesInRangeIndex!109 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52852 (_ BitVec 32)) SeekEntryResult!8948)

(assert (=> b!901145 (= lt!407253 (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(declare-fun b!901146 () Bool)

(declare-fun res!608484 () Bool)

(assert (=> b!901146 (=> res!608484 e!504466)))

(declare-datatypes ((tuple2!12066 0))(
  ( (tuple2!12067 (_1!6044 (_ BitVec 64)) (_2!6044 V!29497)) )
))
(declare-datatypes ((List!17870 0))(
  ( (Nil!17867) (Cons!17866 (h!19012 tuple2!12066) (t!25227 List!17870)) )
))
(declare-datatypes ((ListLongMap!10763 0))(
  ( (ListLongMap!10764 (toList!5397 List!17870)) )
))
(declare-fun lt!407251 () ListLongMap!10763)

(declare-fun contains!4436 (ListLongMap!10763 (_ BitVec 64)) Bool)

(assert (=> b!901146 (= res!608484 (not (contains!4436 lt!407251 key!785)))))

(declare-fun mapIsEmpty!29281 () Bool)

(declare-fun mapRes!29281 () Bool)

(assert (=> mapIsEmpty!29281 mapRes!29281))

(declare-fun b!901147 () Bool)

(declare-fun res!608486 () Bool)

(assert (=> b!901147 (=> res!608486 e!504466)))

(assert (=> b!901147 (= res!608486 (or (not (= (size!25855 (_values!5483 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26267 thiss!1181)))) (not (= (size!25854 (_keys!10274 thiss!1181)) (size!25855 (_values!5483 thiss!1181)))) (bvslt (mask!26267 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5192 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5192 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!901148 () Bool)

(declare-fun e!504467 () Bool)

(declare-fun tp_is_empty!18399 () Bool)

(assert (=> b!901148 (= e!504467 tp_is_empty!18399)))

(declare-fun b!901149 () Bool)

(declare-fun res!608481 () Bool)

(assert (=> b!901149 (=> res!608481 e!504466)))

(declare-datatypes ((List!17871 0))(
  ( (Nil!17868) (Cons!17867 (h!19013 (_ BitVec 64)) (t!25228 List!17871)) )
))
(declare-fun arrayNoDuplicates!0 (array!52852 (_ BitVec 32) List!17871) Bool)

(assert (=> b!901149 (= res!608481 (not (arrayNoDuplicates!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 Nil!17868)))))

(declare-fun b!901150 () Bool)

(assert (=> b!901150 (= e!504466 (= (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253)) key!785))))

(declare-fun mapNonEmpty!29281 () Bool)

(declare-fun tp!56310 () Bool)

(assert (=> mapNonEmpty!29281 (= mapRes!29281 (and tp!56310 e!504467))))

(declare-fun mapValue!29281 () ValueCell!8718)

(declare-fun mapRest!29281 () (Array (_ BitVec 32) ValueCell!8718))

(declare-fun mapKey!29281 () (_ BitVec 32))

(assert (=> mapNonEmpty!29281 (= (arr!25396 (_values!5483 thiss!1181)) (store mapRest!29281 mapKey!29281 mapValue!29281))))

(declare-fun b!901151 () Bool)

(declare-fun e!504462 () Bool)

(declare-fun e!504459 () Bool)

(assert (=> b!901151 (= e!504462 (and e!504459 mapRes!29281))))

(declare-fun condMapEmpty!29281 () Bool)

(declare-fun mapDefault!29281 () ValueCell!8718)

(assert (=> b!901151 (= condMapEmpty!29281 (= (arr!25396 (_values!5483 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8718)) mapDefault!29281)))))

(declare-fun b!901152 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901152 (= e!504460 (inRange!0 (index!38164 lt!407253) (mask!26267 thiss!1181)))))

(declare-fun b!901153 () Bool)

(assert (=> b!901153 (= e!504464 e!504466)))

(declare-fun res!608482 () Bool)

(assert (=> b!901153 (=> res!608482 e!504466)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901153 (= res!608482 (not (validMask!0 (mask!26267 thiss!1181))))))

(assert (=> b!901153 (contains!4436 lt!407251 (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253)))))

(declare-fun getCurrentListMap!2668 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 32) Int) ListLongMap!10763)

(assert (=> b!901153 (= lt!407251 (getCurrentListMap!2668 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun lt!407254 () Unit!30609)

(declare-fun lemmaValidKeyInArrayIsInListMap!257 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 32) Int) Unit!30609)

(assert (=> b!901153 (= lt!407254 (lemmaValidKeyInArrayIsInListMap!257 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) (index!38164 lt!407253) (defaultEntry!5464 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901153 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407252 () Unit!30609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52852 (_ BitVec 64) (_ BitVec 32)) Unit!30609)

(assert (=> b!901153 (= lt!407252 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) key!785 (index!38164 lt!407253)))))

(declare-fun b!901154 () Bool)

(assert (=> b!901154 (= e!504459 tp_is_empty!18399)))

(declare-fun b!901155 () Bool)

(declare-fun res!608487 () Bool)

(assert (=> b!901155 (=> (not res!608487) (not e!504465))))

(assert (=> b!901155 (= res!608487 (not (= key!785 (bvneg key!785))))))

(declare-fun array_inv!19918 (array!52852) Bool)

(declare-fun array_inv!19919 (array!52854) Bool)

(assert (=> b!901156 (= e!504461 (and tp!56309 tp_is_empty!18399 (array_inv!19918 (_keys!10274 thiss!1181)) (array_inv!19919 (_values!5483 thiss!1181)) e!504462))))

(declare-fun b!901157 () Bool)

(declare-fun res!608483 () Bool)

(assert (=> b!901157 (=> res!608483 e!504466)))

(assert (=> b!901157 (= res!608483 (not (inRange!0 (index!38164 lt!407253) (mask!26267 thiss!1181))))))

(assert (= (and start!77230 res!608480) b!901155))

(assert (= (and b!901155 res!608487) b!901145))

(assert (= (and b!901145 (not res!608488)) b!901152))

(assert (= (and b!901145 (not res!608489)) b!901153))

(assert (= (and b!901153 (not res!608482)) b!901147))

(assert (= (and b!901147 (not res!608486)) b!901144))

(assert (= (and b!901144 (not res!608485)) b!901149))

(assert (= (and b!901149 (not res!608481)) b!901146))

(assert (= (and b!901146 (not res!608484)) b!901157))

(assert (= (and b!901157 (not res!608483)) b!901150))

(assert (= (and b!901151 condMapEmpty!29281) mapIsEmpty!29281))

(assert (= (and b!901151 (not condMapEmpty!29281)) mapNonEmpty!29281))

(assert (= (and mapNonEmpty!29281 ((_ is ValueCellFull!8718) mapValue!29281)) b!901148))

(assert (= (and b!901151 ((_ is ValueCellFull!8718) mapDefault!29281)) b!901154))

(assert (= b!901156 b!901151))

(assert (= start!77230 b!901156))

(declare-fun m!837469 () Bool)

(assert (=> start!77230 m!837469))

(declare-fun m!837471 () Bool)

(assert (=> b!901150 m!837471))

(declare-fun m!837473 () Bool)

(assert (=> b!901144 m!837473))

(declare-fun m!837475 () Bool)

(assert (=> b!901145 m!837475))

(declare-fun m!837477 () Bool)

(assert (=> b!901145 m!837477))

(declare-fun m!837479 () Bool)

(assert (=> b!901157 m!837479))

(declare-fun m!837481 () Bool)

(assert (=> b!901149 m!837481))

(declare-fun m!837483 () Bool)

(assert (=> mapNonEmpty!29281 m!837483))

(declare-fun m!837485 () Bool)

(assert (=> b!901156 m!837485))

(declare-fun m!837487 () Bool)

(assert (=> b!901156 m!837487))

(assert (=> b!901152 m!837479))

(declare-fun m!837489 () Bool)

(assert (=> b!901153 m!837489))

(declare-fun m!837491 () Bool)

(assert (=> b!901153 m!837491))

(assert (=> b!901153 m!837471))

(declare-fun m!837493 () Bool)

(assert (=> b!901153 m!837493))

(declare-fun m!837495 () Bool)

(assert (=> b!901153 m!837495))

(assert (=> b!901153 m!837471))

(declare-fun m!837497 () Bool)

(assert (=> b!901153 m!837497))

(declare-fun m!837499 () Bool)

(assert (=> b!901153 m!837499))

(declare-fun m!837501 () Bool)

(assert (=> b!901146 m!837501))

(check-sat (not b!901157) (not b!901152) (not b!901156) (not start!77230) (not b!901153) (not b!901149) (not b!901144) (not mapNonEmpty!29281) tp_is_empty!18399 (not b_next!16071) b_and!26397 (not b!901145) (not b!901146))
(check-sat b_and!26397 (not b_next!16071))
(get-model)

(declare-fun d!111797 () Bool)

(assert (=> d!111797 (= (inRange!0 (index!38164 lt!407253) (mask!26267 thiss!1181)) (and (bvsge (index!38164 lt!407253) #b00000000000000000000000000000000) (bvslt (index!38164 lt!407253) (bvadd (mask!26267 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901152 d!111797))

(assert (=> b!901157 d!111797))

(declare-fun bm!40087 () Bool)

(declare-fun call!40090 () Bool)

(assert (=> bm!40087 (= call!40090 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(declare-fun b!901208 () Bool)

(declare-fun e!504502 () Bool)

(assert (=> b!901208 (= e!504502 call!40090)))

(declare-fun b!901209 () Bool)

(declare-fun e!504501 () Bool)

(assert (=> b!901209 (= e!504501 call!40090)))

(declare-fun b!901210 () Bool)

(assert (=> b!901210 (= e!504501 e!504502)))

(declare-fun lt!407278 () (_ BitVec 64))

(assert (=> b!901210 (= lt!407278 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407276 () Unit!30609)

(assert (=> b!901210 (= lt!407276 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) lt!407278 #b00000000000000000000000000000000))))

(assert (=> b!901210 (arrayContainsKey!0 (_keys!10274 thiss!1181) lt!407278 #b00000000000000000000000000000000)))

(declare-fun lt!407277 () Unit!30609)

(assert (=> b!901210 (= lt!407277 lt!407276)))

(declare-fun res!608524 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52852 (_ BitVec 32)) SeekEntryResult!8948)

(assert (=> b!901210 (= res!608524 (= (seekEntryOrOpen!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000) (_keys!10274 thiss!1181) (mask!26267 thiss!1181)) (Found!8948 #b00000000000000000000000000000000)))))

(assert (=> b!901210 (=> (not res!608524) (not e!504502))))

(declare-fun b!901211 () Bool)

(declare-fun e!504503 () Bool)

(assert (=> b!901211 (= e!504503 e!504501)))

(declare-fun c!95422 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901211 (= c!95422 (validKeyInArray!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111799 () Bool)

(declare-fun res!608525 () Bool)

(assert (=> d!111799 (=> res!608525 e!504503)))

(assert (=> d!111799 (= res!608525 (bvsge #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(assert (=> d!111799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)) e!504503)))

(assert (= (and d!111799 (not res!608525)) b!901211))

(assert (= (and b!901211 c!95422) b!901210))

(assert (= (and b!901211 (not c!95422)) b!901209))

(assert (= (and b!901210 res!608524) b!901208))

(assert (= (or b!901208 b!901209) bm!40087))

(declare-fun m!837537 () Bool)

(assert (=> bm!40087 m!837537))

(declare-fun m!837539 () Bool)

(assert (=> b!901210 m!837539))

(declare-fun m!837541 () Bool)

(assert (=> b!901210 m!837541))

(declare-fun m!837543 () Bool)

(assert (=> b!901210 m!837543))

(assert (=> b!901210 m!837539))

(declare-fun m!837545 () Bool)

(assert (=> b!901210 m!837545))

(assert (=> b!901211 m!837539))

(assert (=> b!901211 m!837539))

(declare-fun m!837547 () Bool)

(assert (=> b!901211 m!837547))

(assert (=> b!901144 d!111799))

(declare-fun b!901222 () Bool)

(declare-fun e!504514 () Bool)

(declare-fun e!504512 () Bool)

(assert (=> b!901222 (= e!504514 e!504512)))

(declare-fun c!95425 () Bool)

(assert (=> b!901222 (= c!95425 (validKeyInArray!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901223 () Bool)

(declare-fun call!40093 () Bool)

(assert (=> b!901223 (= e!504512 call!40093)))

(declare-fun b!901224 () Bool)

(declare-fun e!504515 () Bool)

(declare-fun contains!4438 (List!17871 (_ BitVec 64)) Bool)

(assert (=> b!901224 (= e!504515 (contains!4438 Nil!17868 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901225 () Bool)

(assert (=> b!901225 (= e!504512 call!40093)))

(declare-fun bm!40090 () Bool)

(assert (=> bm!40090 (= call!40093 (arrayNoDuplicates!0 (_keys!10274 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95425 (Cons!17867 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000) Nil!17868) Nil!17868)))))

(declare-fun d!111801 () Bool)

(declare-fun res!608533 () Bool)

(declare-fun e!504513 () Bool)

(assert (=> d!111801 (=> res!608533 e!504513)))

(assert (=> d!111801 (= res!608533 (bvsge #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(assert (=> d!111801 (= (arrayNoDuplicates!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 Nil!17868) e!504513)))

(declare-fun b!901226 () Bool)

(assert (=> b!901226 (= e!504513 e!504514)))

(declare-fun res!608534 () Bool)

(assert (=> b!901226 (=> (not res!608534) (not e!504514))))

(assert (=> b!901226 (= res!608534 (not e!504515))))

(declare-fun res!608532 () Bool)

(assert (=> b!901226 (=> (not res!608532) (not e!504515))))

(assert (=> b!901226 (= res!608532 (validKeyInArray!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111801 (not res!608533)) b!901226))

(assert (= (and b!901226 res!608532) b!901224))

(assert (= (and b!901226 res!608534) b!901222))

(assert (= (and b!901222 c!95425) b!901225))

(assert (= (and b!901222 (not c!95425)) b!901223))

(assert (= (or b!901225 b!901223) bm!40090))

(assert (=> b!901222 m!837539))

(assert (=> b!901222 m!837539))

(assert (=> b!901222 m!837547))

(assert (=> b!901224 m!837539))

(assert (=> b!901224 m!837539))

(declare-fun m!837549 () Bool)

(assert (=> b!901224 m!837549))

(assert (=> bm!40090 m!837539))

(declare-fun m!837551 () Bool)

(assert (=> bm!40090 m!837551))

(assert (=> b!901226 m!837539))

(assert (=> b!901226 m!837539))

(assert (=> b!901226 m!837547))

(assert (=> b!901149 d!111801))

(declare-fun d!111803 () Bool)

(assert (=> d!111803 (= (validMask!0 (mask!26267 thiss!1181)) (and (or (= (mask!26267 thiss!1181) #b00000000000000000000000000000111) (= (mask!26267 thiss!1181) #b00000000000000000000000000001111) (= (mask!26267 thiss!1181) #b00000000000000000000000000011111) (= (mask!26267 thiss!1181) #b00000000000000000000000000111111) (= (mask!26267 thiss!1181) #b00000000000000000000000001111111) (= (mask!26267 thiss!1181) #b00000000000000000000000011111111) (= (mask!26267 thiss!1181) #b00000000000000000000000111111111) (= (mask!26267 thiss!1181) #b00000000000000000000001111111111) (= (mask!26267 thiss!1181) #b00000000000000000000011111111111) (= (mask!26267 thiss!1181) #b00000000000000000000111111111111) (= (mask!26267 thiss!1181) #b00000000000000000001111111111111) (= (mask!26267 thiss!1181) #b00000000000000000011111111111111) (= (mask!26267 thiss!1181) #b00000000000000000111111111111111) (= (mask!26267 thiss!1181) #b00000000000000001111111111111111) (= (mask!26267 thiss!1181) #b00000000000000011111111111111111) (= (mask!26267 thiss!1181) #b00000000000000111111111111111111) (= (mask!26267 thiss!1181) #b00000000000001111111111111111111) (= (mask!26267 thiss!1181) #b00000000000011111111111111111111) (= (mask!26267 thiss!1181) #b00000000000111111111111111111111) (= (mask!26267 thiss!1181) #b00000000001111111111111111111111) (= (mask!26267 thiss!1181) #b00000000011111111111111111111111) (= (mask!26267 thiss!1181) #b00000000111111111111111111111111) (= (mask!26267 thiss!1181) #b00000001111111111111111111111111) (= (mask!26267 thiss!1181) #b00000011111111111111111111111111) (= (mask!26267 thiss!1181) #b00000111111111111111111111111111) (= (mask!26267 thiss!1181) #b00001111111111111111111111111111) (= (mask!26267 thiss!1181) #b00011111111111111111111111111111) (= (mask!26267 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26267 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!901153 d!111803))

(declare-fun d!111805 () Bool)

(declare-fun res!608539 () Bool)

(declare-fun e!504520 () Bool)

(assert (=> d!111805 (=> res!608539 e!504520)))

(assert (=> d!111805 (= res!608539 (= (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111805 (= (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000) e!504520)))

(declare-fun b!901231 () Bool)

(declare-fun e!504521 () Bool)

(assert (=> b!901231 (= e!504520 e!504521)))

(declare-fun res!608540 () Bool)

(assert (=> b!901231 (=> (not res!608540) (not e!504521))))

(assert (=> b!901231 (= res!608540 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25854 (_keys!10274 thiss!1181))))))

(declare-fun b!901232 () Bool)

(assert (=> b!901232 (= e!504521 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111805 (not res!608539)) b!901231))

(assert (= (and b!901231 res!608540) b!901232))

(assert (=> d!111805 m!837539))

(declare-fun m!837553 () Bool)

(assert (=> b!901232 m!837553))

(assert (=> b!901153 d!111805))

(declare-fun d!111807 () Bool)

(declare-fun e!504524 () Bool)

(assert (=> d!111807 e!504524))

(declare-fun res!608543 () Bool)

(assert (=> d!111807 (=> (not res!608543) (not e!504524))))

(assert (=> d!111807 (= res!608543 (and (bvsge (index!38164 lt!407253) #b00000000000000000000000000000000) (bvslt (index!38164 lt!407253) (size!25854 (_keys!10274 thiss!1181)))))))

(declare-fun lt!407281 () Unit!30609)

(declare-fun choose!1518 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 32) Int) Unit!30609)

(assert (=> d!111807 (= lt!407281 (choose!1518 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) (index!38164 lt!407253) (defaultEntry!5464 thiss!1181)))))

(assert (=> d!111807 (validMask!0 (mask!26267 thiss!1181))))

(assert (=> d!111807 (= (lemmaValidKeyInArrayIsInListMap!257 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) (index!38164 lt!407253) (defaultEntry!5464 thiss!1181)) lt!407281)))

(declare-fun b!901235 () Bool)

(assert (=> b!901235 (= e!504524 (contains!4436 (getCurrentListMap!2668 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)) (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253))))))

(assert (= (and d!111807 res!608543) b!901235))

(declare-fun m!837555 () Bool)

(assert (=> d!111807 m!837555))

(assert (=> d!111807 m!837497))

(assert (=> b!901235 m!837499))

(assert (=> b!901235 m!837471))

(assert (=> b!901235 m!837499))

(assert (=> b!901235 m!837471))

(declare-fun m!837557 () Bool)

(assert (=> b!901235 m!837557))

(assert (=> b!901153 d!111807))

(declare-fun d!111809 () Bool)

(assert (=> d!111809 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407284 () Unit!30609)

(declare-fun choose!13 (array!52852 (_ BitVec 64) (_ BitVec 32)) Unit!30609)

(assert (=> d!111809 (= lt!407284 (choose!13 (_keys!10274 thiss!1181) key!785 (index!38164 lt!407253)))))

(assert (=> d!111809 (bvsge (index!38164 lt!407253) #b00000000000000000000000000000000)))

(assert (=> d!111809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) key!785 (index!38164 lt!407253)) lt!407284)))

(declare-fun bs!25301 () Bool)

(assert (= bs!25301 d!111809))

(assert (=> bs!25301 m!837495))

(declare-fun m!837559 () Bool)

(assert (=> bs!25301 m!837559))

(assert (=> b!901153 d!111809))

(declare-fun b!901278 () Bool)

(declare-fun res!608563 () Bool)

(declare-fun e!504557 () Bool)

(assert (=> b!901278 (=> (not res!608563) (not e!504557))))

(declare-fun e!504556 () Bool)

(assert (=> b!901278 (= res!608563 e!504556)))

(declare-fun res!608562 () Bool)

(assert (=> b!901278 (=> res!608562 e!504556)))

(declare-fun e!504554 () Bool)

(assert (=> b!901278 (= res!608562 (not e!504554))))

(declare-fun res!608569 () Bool)

(assert (=> b!901278 (=> (not res!608569) (not e!504554))))

(assert (=> b!901278 (= res!608569 (bvslt #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(declare-fun b!901279 () Bool)

(declare-fun e!504563 () ListLongMap!10763)

(declare-fun call!40114 () ListLongMap!10763)

(declare-fun +!2599 (ListLongMap!10763 tuple2!12066) ListLongMap!10763)

(assert (=> b!901279 (= e!504563 (+!2599 call!40114 (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5296 thiss!1181))))))

(declare-fun b!901280 () Bool)

(assert (=> b!901280 (= e!504554 (validKeyInArray!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40105 () Bool)

(declare-fun call!40112 () Bool)

(declare-fun lt!407350 () ListLongMap!10763)

(assert (=> bm!40105 (= call!40112 (contains!4436 lt!407350 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901281 () Bool)

(declare-fun e!504558 () Bool)

(declare-fun e!504553 () Bool)

(assert (=> b!901281 (= e!504558 e!504553)))

(declare-fun res!608564 () Bool)

(assert (=> b!901281 (= res!608564 call!40112)))

(assert (=> b!901281 (=> (not res!608564) (not e!504553))))

(declare-fun bm!40106 () Bool)

(declare-fun call!40110 () ListLongMap!10763)

(declare-fun getCurrentListMapNoExtraKeys!3286 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 32) Int) ListLongMap!10763)

(assert (=> bm!40106 (= call!40110 (getCurrentListMapNoExtraKeys!3286 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun b!901282 () Bool)

(declare-fun res!608566 () Bool)

(assert (=> b!901282 (=> (not res!608566) (not e!504557))))

(declare-fun e!504552 () Bool)

(assert (=> b!901282 (= res!608566 e!504552)))

(declare-fun c!95443 () Bool)

(assert (=> b!901282 (= c!95443 (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901284 () Bool)

(declare-fun e!504561 () Unit!30609)

(declare-fun Unit!30611 () Unit!30609)

(assert (=> b!901284 (= e!504561 Unit!30611)))

(declare-fun bm!40107 () Bool)

(declare-fun call!40108 () ListLongMap!10763)

(assert (=> bm!40107 (= call!40108 call!40114)))

(declare-fun b!901285 () Bool)

(declare-fun e!504551 () Bool)

(assert (=> b!901285 (= e!504556 e!504551)))

(declare-fun res!608567 () Bool)

(assert (=> b!901285 (=> (not res!608567) (not e!504551))))

(assert (=> b!901285 (= res!608567 (contains!4436 lt!407350 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901285 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(declare-fun b!901286 () Bool)

(declare-fun e!504560 () ListLongMap!10763)

(declare-fun call!40111 () ListLongMap!10763)

(assert (=> b!901286 (= e!504560 call!40111)))

(declare-fun b!901287 () Bool)

(declare-fun c!95438 () Bool)

(assert (=> b!901287 (= c!95438 (and (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!504555 () ListLongMap!10763)

(assert (=> b!901287 (= e!504555 e!504560)))

(declare-fun b!901288 () Bool)

(declare-fun apply!418 (ListLongMap!10763 (_ BitVec 64)) V!29497)

(assert (=> b!901288 (= e!504553 (= (apply!418 lt!407350 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5296 thiss!1181)))))

(declare-fun b!901289 () Bool)

(declare-fun call!40109 () Bool)

(assert (=> b!901289 (= e!504552 (not call!40109))))

(declare-fun b!901290 () Bool)

(declare-fun lt!407334 () Unit!30609)

(assert (=> b!901290 (= e!504561 lt!407334)))

(declare-fun lt!407332 () ListLongMap!10763)

(assert (=> b!901290 (= lt!407332 (getCurrentListMapNoExtraKeys!3286 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun lt!407348 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407348 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407343 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407343 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407346 () Unit!30609)

(declare-fun addStillContains!340 (ListLongMap!10763 (_ BitVec 64) V!29497 (_ BitVec 64)) Unit!30609)

(assert (=> b!901290 (= lt!407346 (addStillContains!340 lt!407332 lt!407348 (zeroValue!5296 thiss!1181) lt!407343))))

(assert (=> b!901290 (contains!4436 (+!2599 lt!407332 (tuple2!12067 lt!407348 (zeroValue!5296 thiss!1181))) lt!407343)))

(declare-fun lt!407344 () Unit!30609)

(assert (=> b!901290 (= lt!407344 lt!407346)))

(declare-fun lt!407331 () ListLongMap!10763)

(assert (=> b!901290 (= lt!407331 (getCurrentListMapNoExtraKeys!3286 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun lt!407333 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407333 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407341 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407341 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407342 () Unit!30609)

(declare-fun addApplyDifferent!340 (ListLongMap!10763 (_ BitVec 64) V!29497 (_ BitVec 64)) Unit!30609)

(assert (=> b!901290 (= lt!407342 (addApplyDifferent!340 lt!407331 lt!407333 (minValue!5296 thiss!1181) lt!407341))))

(assert (=> b!901290 (= (apply!418 (+!2599 lt!407331 (tuple2!12067 lt!407333 (minValue!5296 thiss!1181))) lt!407341) (apply!418 lt!407331 lt!407341))))

(declare-fun lt!407335 () Unit!30609)

(assert (=> b!901290 (= lt!407335 lt!407342)))

(declare-fun lt!407339 () ListLongMap!10763)

(assert (=> b!901290 (= lt!407339 (getCurrentListMapNoExtraKeys!3286 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun lt!407337 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407338 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407338 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407345 () Unit!30609)

(assert (=> b!901290 (= lt!407345 (addApplyDifferent!340 lt!407339 lt!407337 (zeroValue!5296 thiss!1181) lt!407338))))

(assert (=> b!901290 (= (apply!418 (+!2599 lt!407339 (tuple2!12067 lt!407337 (zeroValue!5296 thiss!1181))) lt!407338) (apply!418 lt!407339 lt!407338))))

(declare-fun lt!407349 () Unit!30609)

(assert (=> b!901290 (= lt!407349 lt!407345)))

(declare-fun lt!407347 () ListLongMap!10763)

(assert (=> b!901290 (= lt!407347 (getCurrentListMapNoExtraKeys!3286 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)))))

(declare-fun lt!407329 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407329 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407336 () (_ BitVec 64))

(assert (=> b!901290 (= lt!407336 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901290 (= lt!407334 (addApplyDifferent!340 lt!407347 lt!407329 (minValue!5296 thiss!1181) lt!407336))))

(assert (=> b!901290 (= (apply!418 (+!2599 lt!407347 (tuple2!12067 lt!407329 (minValue!5296 thiss!1181))) lt!407336) (apply!418 lt!407347 lt!407336))))

(declare-fun bm!40108 () Bool)

(declare-fun call!40113 () ListLongMap!10763)

(assert (=> bm!40108 (= call!40111 call!40113)))

(declare-fun b!901291 () Bool)

(declare-fun get!13360 (ValueCell!8718 V!29497) V!29497)

(declare-fun dynLambda!1312 (Int (_ BitVec 64)) V!29497)

(assert (=> b!901291 (= e!504551 (= (apply!418 lt!407350 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)) (get!13360 (select (arr!25396 (_values!5483 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1312 (defaultEntry!5464 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25855 (_values!5483 thiss!1181))))))

(assert (=> b!901291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(declare-fun b!901292 () Bool)

(declare-fun e!504562 () Bool)

(assert (=> b!901292 (= e!504562 (= (apply!418 lt!407350 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5296 thiss!1181)))))

(declare-fun b!901293 () Bool)

(declare-fun e!504559 () Bool)

(assert (=> b!901293 (= e!504559 (validKeyInArray!0 (select (arr!25395 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun c!95441 () Bool)

(declare-fun c!95440 () Bool)

(declare-fun bm!40109 () Bool)

(assert (=> bm!40109 (= call!40114 (+!2599 (ite c!95441 call!40110 (ite c!95440 call!40113 call!40111)) (ite (or c!95441 c!95440) (tuple2!12067 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5296 thiss!1181)) (tuple2!12067 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5296 thiss!1181)))))))

(declare-fun b!901294 () Bool)

(assert (=> b!901294 (= e!504552 e!504562)))

(declare-fun res!608565 () Bool)

(assert (=> b!901294 (= res!608565 call!40109)))

(assert (=> b!901294 (=> (not res!608565) (not e!504562))))

(declare-fun b!901295 () Bool)

(assert (=> b!901295 (= e!504560 call!40108)))

(declare-fun b!901283 () Bool)

(assert (=> b!901283 (= e!504558 (not call!40112))))

(declare-fun d!111811 () Bool)

(assert (=> d!111811 e!504557))

(declare-fun res!608570 () Bool)

(assert (=> d!111811 (=> (not res!608570) (not e!504557))))

(assert (=> d!111811 (= res!608570 (or (bvsge #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))))

(declare-fun lt!407330 () ListLongMap!10763)

(assert (=> d!111811 (= lt!407350 lt!407330)))

(declare-fun lt!407340 () Unit!30609)

(assert (=> d!111811 (= lt!407340 e!504561)))

(declare-fun c!95439 () Bool)

(assert (=> d!111811 (= c!95439 e!504559)))

(declare-fun res!608568 () Bool)

(assert (=> d!111811 (=> (not res!608568) (not e!504559))))

(assert (=> d!111811 (= res!608568 (bvslt #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))))))

(assert (=> d!111811 (= lt!407330 e!504563)))

(assert (=> d!111811 (= c!95441 (and (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111811 (validMask!0 (mask!26267 thiss!1181))))

(assert (=> d!111811 (= (getCurrentListMap!2668 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5464 thiss!1181)) lt!407350)))

(declare-fun bm!40110 () Bool)

(assert (=> bm!40110 (= call!40109 (contains!4436 lt!407350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901296 () Bool)

(assert (=> b!901296 (= e!504563 e!504555)))

(assert (=> b!901296 (= c!95440 (and (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901297 () Bool)

(assert (=> b!901297 (= e!504557 e!504558)))

(declare-fun c!95442 () Bool)

(assert (=> b!901297 (= c!95442 (not (= (bvand (extraKeys!5192 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901298 () Bool)

(assert (=> b!901298 (= e!504555 call!40108)))

(declare-fun bm!40111 () Bool)

(assert (=> bm!40111 (= call!40113 call!40110)))

(assert (= (and d!111811 c!95441) b!901279))

(assert (= (and d!111811 (not c!95441)) b!901296))

(assert (= (and b!901296 c!95440) b!901298))

(assert (= (and b!901296 (not c!95440)) b!901287))

(assert (= (and b!901287 c!95438) b!901295))

(assert (= (and b!901287 (not c!95438)) b!901286))

(assert (= (or b!901295 b!901286) bm!40108))

(assert (= (or b!901298 bm!40108) bm!40111))

(assert (= (or b!901298 b!901295) bm!40107))

(assert (= (or b!901279 bm!40111) bm!40106))

(assert (= (or b!901279 bm!40107) bm!40109))

(assert (= (and d!111811 res!608568) b!901293))

(assert (= (and d!111811 c!95439) b!901290))

(assert (= (and d!111811 (not c!95439)) b!901284))

(assert (= (and d!111811 res!608570) b!901278))

(assert (= (and b!901278 res!608569) b!901280))

(assert (= (and b!901278 (not res!608562)) b!901285))

(assert (= (and b!901285 res!608567) b!901291))

(assert (= (and b!901278 res!608563) b!901282))

(assert (= (and b!901282 c!95443) b!901294))

(assert (= (and b!901282 (not c!95443)) b!901289))

(assert (= (and b!901294 res!608565) b!901292))

(assert (= (or b!901294 b!901289) bm!40110))

(assert (= (and b!901282 res!608566) b!901297))

(assert (= (and b!901297 c!95442) b!901281))

(assert (= (and b!901297 (not c!95442)) b!901283))

(assert (= (and b!901281 res!608564) b!901288))

(assert (= (or b!901281 b!901283) bm!40105))

(declare-fun b_lambda!13027 () Bool)

(assert (=> (not b_lambda!13027) (not b!901291)))

(declare-fun t!25231 () Bool)

(declare-fun tb!5209 () Bool)

(assert (=> (and b!901156 (= (defaultEntry!5464 thiss!1181) (defaultEntry!5464 thiss!1181)) t!25231) tb!5209))

(declare-fun result!10199 () Bool)

(assert (=> tb!5209 (= result!10199 tp_is_empty!18399)))

(assert (=> b!901291 t!25231))

(declare-fun b_and!26401 () Bool)

(assert (= b_and!26397 (and (=> t!25231 result!10199) b_and!26401)))

(declare-fun m!837561 () Bool)

(assert (=> b!901290 m!837561))

(declare-fun m!837563 () Bool)

(assert (=> b!901290 m!837563))

(declare-fun m!837565 () Bool)

(assert (=> b!901290 m!837565))

(declare-fun m!837567 () Bool)

(assert (=> b!901290 m!837567))

(declare-fun m!837569 () Bool)

(assert (=> b!901290 m!837569))

(declare-fun m!837571 () Bool)

(assert (=> b!901290 m!837571))

(declare-fun m!837573 () Bool)

(assert (=> b!901290 m!837573))

(declare-fun m!837575 () Bool)

(assert (=> b!901290 m!837575))

(assert (=> b!901290 m!837565))

(assert (=> b!901290 m!837575))

(declare-fun m!837577 () Bool)

(assert (=> b!901290 m!837577))

(declare-fun m!837579 () Bool)

(assert (=> b!901290 m!837579))

(declare-fun m!837581 () Bool)

(assert (=> b!901290 m!837581))

(declare-fun m!837583 () Bool)

(assert (=> b!901290 m!837583))

(declare-fun m!837585 () Bool)

(assert (=> b!901290 m!837585))

(assert (=> b!901290 m!837539))

(assert (=> b!901290 m!837571))

(declare-fun m!837587 () Bool)

(assert (=> b!901290 m!837587))

(declare-fun m!837589 () Bool)

(assert (=> b!901290 m!837589))

(assert (=> b!901290 m!837581))

(declare-fun m!837591 () Bool)

(assert (=> b!901290 m!837591))

(assert (=> b!901291 m!837539))

(declare-fun m!837593 () Bool)

(assert (=> b!901291 m!837593))

(declare-fun m!837595 () Bool)

(assert (=> b!901291 m!837595))

(declare-fun m!837597 () Bool)

(assert (=> b!901291 m!837597))

(assert (=> b!901291 m!837595))

(assert (=> b!901291 m!837539))

(declare-fun m!837599 () Bool)

(assert (=> b!901291 m!837599))

(assert (=> b!901291 m!837593))

(assert (=> bm!40106 m!837589))

(declare-fun m!837601 () Bool)

(assert (=> b!901279 m!837601))

(assert (=> d!111811 m!837497))

(assert (=> b!901280 m!837539))

(assert (=> b!901280 m!837539))

(assert (=> b!901280 m!837547))

(declare-fun m!837603 () Bool)

(assert (=> bm!40109 m!837603))

(assert (=> b!901293 m!837539))

(assert (=> b!901293 m!837539))

(assert (=> b!901293 m!837547))

(declare-fun m!837605 () Bool)

(assert (=> b!901292 m!837605))

(declare-fun m!837607 () Bool)

(assert (=> bm!40105 m!837607))

(declare-fun m!837609 () Bool)

(assert (=> b!901288 m!837609))

(declare-fun m!837611 () Bool)

(assert (=> bm!40110 m!837611))

(assert (=> b!901285 m!837539))

(assert (=> b!901285 m!837539))

(declare-fun m!837613 () Bool)

(assert (=> b!901285 m!837613))

(assert (=> b!901153 d!111811))

(declare-fun d!111813 () Bool)

(declare-fun e!504568 () Bool)

(assert (=> d!111813 e!504568))

(declare-fun res!608573 () Bool)

(assert (=> d!111813 (=> res!608573 e!504568)))

(declare-fun lt!407360 () Bool)

(assert (=> d!111813 (= res!608573 (not lt!407360))))

(declare-fun lt!407359 () Bool)

(assert (=> d!111813 (= lt!407360 lt!407359)))

(declare-fun lt!407362 () Unit!30609)

(declare-fun e!504569 () Unit!30609)

(assert (=> d!111813 (= lt!407362 e!504569)))

(declare-fun c!95446 () Bool)

(assert (=> d!111813 (= c!95446 lt!407359)))

(declare-fun containsKey!433 (List!17870 (_ BitVec 64)) Bool)

(assert (=> d!111813 (= lt!407359 (containsKey!433 (toList!5397 lt!407251) (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253))))))

(assert (=> d!111813 (= (contains!4436 lt!407251 (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253))) lt!407360)))

(declare-fun b!901307 () Bool)

(declare-fun lt!407361 () Unit!30609)

(assert (=> b!901307 (= e!504569 lt!407361)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!329 (List!17870 (_ BitVec 64)) Unit!30609)

(assert (=> b!901307 (= lt!407361 (lemmaContainsKeyImpliesGetValueByKeyDefined!329 (toList!5397 lt!407251) (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253))))))

(declare-datatypes ((Option!470 0))(
  ( (Some!469 (v!11751 V!29497)) (None!468) )
))
(declare-fun isDefined!338 (Option!470) Bool)

(declare-fun getValueByKey!464 (List!17870 (_ BitVec 64)) Option!470)

(assert (=> b!901307 (isDefined!338 (getValueByKey!464 (toList!5397 lt!407251) (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253))))))

(declare-fun b!901308 () Bool)

(declare-fun Unit!30612 () Unit!30609)

(assert (=> b!901308 (= e!504569 Unit!30612)))

(declare-fun b!901309 () Bool)

(assert (=> b!901309 (= e!504568 (isDefined!338 (getValueByKey!464 (toList!5397 lt!407251) (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407253)))))))

(assert (= (and d!111813 c!95446) b!901307))

(assert (= (and d!111813 (not c!95446)) b!901308))

(assert (= (and d!111813 (not res!608573)) b!901309))

(assert (=> d!111813 m!837471))

(declare-fun m!837615 () Bool)

(assert (=> d!111813 m!837615))

(assert (=> b!901307 m!837471))

(declare-fun m!837617 () Bool)

(assert (=> b!901307 m!837617))

(assert (=> b!901307 m!837471))

(declare-fun m!837619 () Bool)

(assert (=> b!901307 m!837619))

(assert (=> b!901307 m!837619))

(declare-fun m!837621 () Bool)

(assert (=> b!901307 m!837621))

(assert (=> b!901309 m!837471))

(assert (=> b!901309 m!837619))

(assert (=> b!901309 m!837619))

(assert (=> b!901309 m!837621))

(assert (=> b!901153 d!111813))

(declare-fun d!111815 () Bool)

(declare-fun e!504572 () Bool)

(assert (=> d!111815 e!504572))

(declare-fun res!608576 () Bool)

(assert (=> d!111815 (=> res!608576 e!504572)))

(declare-fun lt!407368 () SeekEntryResult!8948)

(assert (=> d!111815 (= res!608576 (not ((_ is Found!8948) lt!407368)))))

(assert (=> d!111815 (= lt!407368 (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(declare-fun lt!407367 () Unit!30609)

(declare-fun choose!1519 (array!52852 array!52854 (_ BitVec 32) (_ BitVec 32) V!29497 V!29497 (_ BitVec 64)) Unit!30609)

(assert (=> d!111815 (= lt!407367 (choose!1519 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) key!785))))

(assert (=> d!111815 (validMask!0 (mask!26267 thiss!1181))))

(assert (=> d!111815 (= (lemmaSeekEntryGivesInRangeIndex!109 (_keys!10274 thiss!1181) (_values!5483 thiss!1181) (mask!26267 thiss!1181) (extraKeys!5192 thiss!1181) (zeroValue!5296 thiss!1181) (minValue!5296 thiss!1181) key!785) lt!407367)))

(declare-fun b!901312 () Bool)

(assert (=> b!901312 (= e!504572 (inRange!0 (index!38164 lt!407368) (mask!26267 thiss!1181)))))

(assert (= (and d!111815 (not res!608576)) b!901312))

(assert (=> d!111815 m!837477))

(declare-fun m!837623 () Bool)

(assert (=> d!111815 m!837623))

(assert (=> d!111815 m!837497))

(declare-fun m!837625 () Bool)

(assert (=> b!901312 m!837625))

(assert (=> b!901145 d!111815))

(declare-fun b!901325 () Bool)

(declare-fun e!504580 () SeekEntryResult!8948)

(assert (=> b!901325 (= e!504580 Undefined!8948)))

(declare-fun b!901326 () Bool)

(declare-fun e!504579 () SeekEntryResult!8948)

(declare-fun lt!407377 () SeekEntryResult!8948)

(assert (=> b!901326 (= e!504579 (MissingZero!8948 (index!38165 lt!407377)))))

(declare-fun b!901327 () Bool)

(declare-fun e!504581 () SeekEntryResult!8948)

(assert (=> b!901327 (= e!504581 (Found!8948 (index!38165 lt!407377)))))

(declare-fun d!111817 () Bool)

(declare-fun lt!407379 () SeekEntryResult!8948)

(assert (=> d!111817 (and (or ((_ is MissingVacant!8948) lt!407379) (not ((_ is Found!8948) lt!407379)) (and (bvsge (index!38164 lt!407379) #b00000000000000000000000000000000) (bvslt (index!38164 lt!407379) (size!25854 (_keys!10274 thiss!1181))))) (not ((_ is MissingVacant!8948) lt!407379)) (or (not ((_ is Found!8948) lt!407379)) (= (select (arr!25395 (_keys!10274 thiss!1181)) (index!38164 lt!407379)) key!785)))))

(assert (=> d!111817 (= lt!407379 e!504580)))

(declare-fun c!95455 () Bool)

(assert (=> d!111817 (= c!95455 (and ((_ is Intermediate!8948) lt!407377) (undefined!9760 lt!407377)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52852 (_ BitVec 32)) SeekEntryResult!8948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111817 (= lt!407377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26267 thiss!1181)) key!785 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(assert (=> d!111817 (validMask!0 (mask!26267 thiss!1181))))

(assert (=> d!111817 (= (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)) lt!407379)))

(declare-fun b!901328 () Bool)

(assert (=> b!901328 (= e!504580 e!504581)))

(declare-fun lt!407378 () (_ BitVec 64))

(assert (=> b!901328 (= lt!407378 (select (arr!25395 (_keys!10274 thiss!1181)) (index!38165 lt!407377)))))

(declare-fun c!95454 () Bool)

(assert (=> b!901328 (= c!95454 (= lt!407378 key!785))))

(declare-fun b!901329 () Bool)

(declare-fun c!95453 () Bool)

(assert (=> b!901329 (= c!95453 (= lt!407378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901329 (= e!504581 e!504579)))

(declare-fun b!901330 () Bool)

(declare-fun lt!407380 () SeekEntryResult!8948)

(assert (=> b!901330 (= e!504579 (ite ((_ is MissingVacant!8948) lt!407380) (MissingZero!8948 (index!38166 lt!407380)) lt!407380))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52852 (_ BitVec 32)) SeekEntryResult!8948)

(assert (=> b!901330 (= lt!407380 (seekKeyOrZeroReturnVacant!0 (x!76779 lt!407377) (index!38165 lt!407377) (index!38165 lt!407377) key!785 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(assert (= (and d!111817 c!95455) b!901325))

(assert (= (and d!111817 (not c!95455)) b!901328))

(assert (= (and b!901328 c!95454) b!901327))

(assert (= (and b!901328 (not c!95454)) b!901329))

(assert (= (and b!901329 c!95453) b!901326))

(assert (= (and b!901329 (not c!95453)) b!901330))

(declare-fun m!837627 () Bool)

(assert (=> d!111817 m!837627))

(declare-fun m!837629 () Bool)

(assert (=> d!111817 m!837629))

(assert (=> d!111817 m!837629))

(declare-fun m!837631 () Bool)

(assert (=> d!111817 m!837631))

(assert (=> d!111817 m!837497))

(declare-fun m!837633 () Bool)

(assert (=> b!901328 m!837633))

(declare-fun m!837635 () Bool)

(assert (=> b!901330 m!837635))

(assert (=> b!901145 d!111817))

(declare-fun d!111819 () Bool)

(declare-fun res!608583 () Bool)

(declare-fun e!504584 () Bool)

(assert (=> d!111819 (=> (not res!608583) (not e!504584))))

(declare-fun simpleValid!332 (LongMapFixedSize!4452) Bool)

(assert (=> d!111819 (= res!608583 (simpleValid!332 thiss!1181))))

(assert (=> d!111819 (= (valid!1708 thiss!1181) e!504584)))

(declare-fun b!901337 () Bool)

(declare-fun res!608584 () Bool)

(assert (=> b!901337 (=> (not res!608584) (not e!504584))))

(declare-fun arrayCountValidKeys!0 (array!52852 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901337 (= res!608584 (= (arrayCountValidKeys!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 (size!25854 (_keys!10274 thiss!1181))) (_size!2281 thiss!1181)))))

(declare-fun b!901338 () Bool)

(declare-fun res!608585 () Bool)

(assert (=> b!901338 (=> (not res!608585) (not e!504584))))

(assert (=> b!901338 (= res!608585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26267 thiss!1181)))))

(declare-fun b!901339 () Bool)

(assert (=> b!901339 (= e!504584 (arrayNoDuplicates!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 Nil!17868))))

(assert (= (and d!111819 res!608583) b!901337))

(assert (= (and b!901337 res!608584) b!901338))

(assert (= (and b!901338 res!608585) b!901339))

(declare-fun m!837637 () Bool)

(assert (=> d!111819 m!837637))

(declare-fun m!837639 () Bool)

(assert (=> b!901337 m!837639))

(assert (=> b!901338 m!837473))

(assert (=> b!901339 m!837481))

(assert (=> start!77230 d!111819))

(declare-fun d!111821 () Bool)

(declare-fun e!504585 () Bool)

(assert (=> d!111821 e!504585))

(declare-fun res!608586 () Bool)

(assert (=> d!111821 (=> res!608586 e!504585)))

(declare-fun lt!407382 () Bool)

(assert (=> d!111821 (= res!608586 (not lt!407382))))

(declare-fun lt!407381 () Bool)

(assert (=> d!111821 (= lt!407382 lt!407381)))

(declare-fun lt!407384 () Unit!30609)

(declare-fun e!504586 () Unit!30609)

(assert (=> d!111821 (= lt!407384 e!504586)))

(declare-fun c!95456 () Bool)

(assert (=> d!111821 (= c!95456 lt!407381)))

(assert (=> d!111821 (= lt!407381 (containsKey!433 (toList!5397 lt!407251) key!785))))

(assert (=> d!111821 (= (contains!4436 lt!407251 key!785) lt!407382)))

(declare-fun b!901340 () Bool)

(declare-fun lt!407383 () Unit!30609)

(assert (=> b!901340 (= e!504586 lt!407383)))

(assert (=> b!901340 (= lt!407383 (lemmaContainsKeyImpliesGetValueByKeyDefined!329 (toList!5397 lt!407251) key!785))))

(assert (=> b!901340 (isDefined!338 (getValueByKey!464 (toList!5397 lt!407251) key!785))))

(declare-fun b!901341 () Bool)

(declare-fun Unit!30613 () Unit!30609)

(assert (=> b!901341 (= e!504586 Unit!30613)))

(declare-fun b!901342 () Bool)

(assert (=> b!901342 (= e!504585 (isDefined!338 (getValueByKey!464 (toList!5397 lt!407251) key!785)))))

(assert (= (and d!111821 c!95456) b!901340))

(assert (= (and d!111821 (not c!95456)) b!901341))

(assert (= (and d!111821 (not res!608586)) b!901342))

(declare-fun m!837641 () Bool)

(assert (=> d!111821 m!837641))

(declare-fun m!837643 () Bool)

(assert (=> b!901340 m!837643))

(declare-fun m!837645 () Bool)

(assert (=> b!901340 m!837645))

(assert (=> b!901340 m!837645))

(declare-fun m!837647 () Bool)

(assert (=> b!901340 m!837647))

(assert (=> b!901342 m!837645))

(assert (=> b!901342 m!837645))

(assert (=> b!901342 m!837647))

(assert (=> b!901146 d!111821))

(declare-fun d!111823 () Bool)

(assert (=> d!111823 (= (array_inv!19918 (_keys!10274 thiss!1181)) (bvsge (size!25854 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901156 d!111823))

(declare-fun d!111825 () Bool)

(assert (=> d!111825 (= (array_inv!19919 (_values!5483 thiss!1181)) (bvsge (size!25855 (_values!5483 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901156 d!111825))

(declare-fun b!901350 () Bool)

(declare-fun e!504591 () Bool)

(assert (=> b!901350 (= e!504591 tp_is_empty!18399)))

(declare-fun b!901349 () Bool)

(declare-fun e!504592 () Bool)

(assert (=> b!901349 (= e!504592 tp_is_empty!18399)))

(declare-fun mapNonEmpty!29287 () Bool)

(declare-fun mapRes!29287 () Bool)

(declare-fun tp!56319 () Bool)

(assert (=> mapNonEmpty!29287 (= mapRes!29287 (and tp!56319 e!504592))))

(declare-fun mapValue!29287 () ValueCell!8718)

(declare-fun mapRest!29287 () (Array (_ BitVec 32) ValueCell!8718))

(declare-fun mapKey!29287 () (_ BitVec 32))

(assert (=> mapNonEmpty!29287 (= mapRest!29281 (store mapRest!29287 mapKey!29287 mapValue!29287))))

(declare-fun mapIsEmpty!29287 () Bool)

(assert (=> mapIsEmpty!29287 mapRes!29287))

(declare-fun condMapEmpty!29287 () Bool)

(declare-fun mapDefault!29287 () ValueCell!8718)

(assert (=> mapNonEmpty!29281 (= condMapEmpty!29287 (= mapRest!29281 ((as const (Array (_ BitVec 32) ValueCell!8718)) mapDefault!29287)))))

(assert (=> mapNonEmpty!29281 (= tp!56310 (and e!504591 mapRes!29287))))

(assert (= (and mapNonEmpty!29281 condMapEmpty!29287) mapIsEmpty!29287))

(assert (= (and mapNonEmpty!29281 (not condMapEmpty!29287)) mapNonEmpty!29287))

(assert (= (and mapNonEmpty!29287 ((_ is ValueCellFull!8718) mapValue!29287)) b!901349))

(assert (= (and mapNonEmpty!29281 ((_ is ValueCellFull!8718) mapDefault!29287)) b!901350))

(declare-fun m!837649 () Bool)

(assert (=> mapNonEmpty!29287 m!837649))

(declare-fun b_lambda!13029 () Bool)

(assert (= b_lambda!13027 (or (and b!901156 b_free!16071) b_lambda!13029)))

(check-sat (not bm!40090) (not b!901210) (not b!901291) (not b!901340) b_and!26401 (not b!901337) (not d!111813) (not bm!40109) (not d!111817) (not b!901222) (not b!901339) (not bm!40105) (not b!901224) (not b!901309) (not b_next!16071) (not b!901293) (not b!901211) (not d!111821) (not b!901342) (not bm!40106) (not b!901312) (not d!111815) (not b!901338) (not b!901226) (not b!901279) (not b!901330) (not d!111819) (not d!111809) (not b!901232) (not d!111811) (not b!901288) (not mapNonEmpty!29287) tp_is_empty!18399 (not bm!40087) (not b_lambda!13029) (not b!901292) (not b!901280) (not b!901235) (not b!901290) (not bm!40110) (not b!901285) (not d!111807) (not b!901307))
(check-sat b_and!26401 (not b_next!16071))
