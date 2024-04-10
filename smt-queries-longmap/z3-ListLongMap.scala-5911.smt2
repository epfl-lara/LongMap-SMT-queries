; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76556 () Bool)

(assert start!76556)

(declare-fun b!897009 () Bool)

(declare-fun b_free!15969 () Bool)

(declare-fun b_next!15969 () Bool)

(assert (=> b!897009 (= b_free!15969 (not b_next!15969))))

(declare-fun tp!55949 () Bool)

(declare-fun b_and!26261 () Bool)

(assert (=> b!897009 (= tp!55949 b_and!26261)))

(declare-fun mapNonEmpty!29074 () Bool)

(declare-fun mapRes!29074 () Bool)

(declare-fun tp!55950 () Bool)

(declare-fun e!501500 () Bool)

(assert (=> mapNonEmpty!29074 (= mapRes!29074 (and tp!55950 e!501500))))

(declare-fun mapKey!29074 () (_ BitVec 32))

(declare-datatypes ((array!52616 0))(
  ( (array!52617 (arr!25293 (Array (_ BitVec 32) (_ BitVec 64))) (size!25746 (_ BitVec 32))) )
))
(declare-datatypes ((V!29361 0))(
  ( (V!29362 (val!9199 Int)) )
))
(declare-datatypes ((ValueCell!8667 0))(
  ( (ValueCellFull!8667 (v!11689 V!29361)) (EmptyCell!8667) )
))
(declare-datatypes ((array!52618 0))(
  ( (array!52619 (arr!25294 (Array (_ BitVec 32) ValueCell!8667)) (size!25747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4350 0))(
  ( (LongMapFixedSize!4351 (defaultEntry!5387 Int) (mask!26055 (_ BitVec 32)) (extraKeys!5093 (_ BitVec 32)) (zeroValue!5197 V!29361) (minValue!5197 V!29361) (_size!2230 (_ BitVec 32)) (_keys!10134 array!52616) (_values!5384 array!52618) (_vacant!2230 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4350)

(declare-fun mapValue!29074 () ValueCell!8667)

(declare-fun mapRest!29074 () (Array (_ BitVec 32) ValueCell!8667))

(assert (=> mapNonEmpty!29074 (= (arr!25294 (_values!5384 thiss!1181)) (store mapRest!29074 mapKey!29074 mapValue!29074))))

(declare-fun b!897002 () Bool)

(declare-fun e!501501 () Bool)

(declare-datatypes ((SeekEntryResult!8903 0))(
  ( (MissingZero!8903 (index!37983 (_ BitVec 32))) (Found!8903 (index!37984 (_ BitVec 32))) (Intermediate!8903 (undefined!9715 Bool) (index!37985 (_ BitVec 32)) (x!76402 (_ BitVec 32))) (Undefined!8903) (MissingVacant!8903 (index!37986 (_ BitVec 32))) )
))
(declare-fun lt!405023 () SeekEntryResult!8903)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897002 (= e!501501 (inRange!0 (index!37984 lt!405023) (mask!26055 thiss!1181)))))

(declare-fun b!897003 () Bool)

(declare-fun e!501502 () Bool)

(declare-fun e!501496 () Bool)

(assert (=> b!897003 (= e!501502 e!501496)))

(declare-fun res!606413 () Bool)

(assert (=> b!897003 (=> res!606413 e!501496)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897003 (= res!606413 (not (validMask!0 (mask!26055 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897003 (arrayContainsKey!0 (_keys!10134 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30496 0))(
  ( (Unit!30497) )
))
(declare-fun lt!405025 () Unit!30496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52616 (_ BitVec 64) (_ BitVec 32)) Unit!30496)

(assert (=> b!897003 (= lt!405025 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10134 thiss!1181) key!785 (index!37984 lt!405023)))))

(declare-fun res!606412 () Bool)

(declare-fun e!501499 () Bool)

(assert (=> start!76556 (=> (not res!606412) (not e!501499))))

(declare-fun valid!1677 (LongMapFixedSize!4350) Bool)

(assert (=> start!76556 (= res!606412 (valid!1677 thiss!1181))))

(assert (=> start!76556 e!501499))

(declare-fun e!501504 () Bool)

(assert (=> start!76556 e!501504))

(assert (=> start!76556 true))

(declare-fun b!897004 () Bool)

(declare-fun e!501497 () Bool)

(declare-fun tp_is_empty!18297 () Bool)

(assert (=> b!897004 (= e!501497 tp_is_empty!18297)))

(declare-fun b!897005 () Bool)

(assert (=> b!897005 (= e!501499 (not e!501502))))

(declare-fun res!606410 () Bool)

(assert (=> b!897005 (=> res!606410 e!501502)))

(get-info :version)

(assert (=> b!897005 (= res!606410 (not ((_ is Found!8903) lt!405023)))))

(assert (=> b!897005 e!501501))

(declare-fun res!606414 () Bool)

(assert (=> b!897005 (=> res!606414 e!501501)))

(assert (=> b!897005 (= res!606414 (not ((_ is Found!8903) lt!405023)))))

(declare-fun lt!405024 () Unit!30496)

(declare-fun lemmaSeekEntryGivesInRangeIndex!74 (array!52616 array!52618 (_ BitVec 32) (_ BitVec 32) V!29361 V!29361 (_ BitVec 64)) Unit!30496)

(assert (=> b!897005 (= lt!405024 (lemmaSeekEntryGivesInRangeIndex!74 (_keys!10134 thiss!1181) (_values!5384 thiss!1181) (mask!26055 thiss!1181) (extraKeys!5093 thiss!1181) (zeroValue!5197 thiss!1181) (minValue!5197 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52616 (_ BitVec 32)) SeekEntryResult!8903)

(assert (=> b!897005 (= lt!405023 (seekEntry!0 key!785 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)))))

(declare-fun b!897006 () Bool)

(declare-fun res!606411 () Bool)

(assert (=> b!897006 (=> (not res!606411) (not e!501499))))

(assert (=> b!897006 (= res!606411 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897007 () Bool)

(assert (=> b!897007 (= e!501496 (or (not (= (size!25747 (_values!5384 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26055 thiss!1181)))) (not (= (size!25746 (_keys!10134 thiss!1181)) (size!25747 (_values!5384 thiss!1181)))) (bvsge (mask!26055 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!897008 () Bool)

(assert (=> b!897008 (= e!501500 tp_is_empty!18297)))

(declare-fun e!501503 () Bool)

(declare-fun array_inv!19850 (array!52616) Bool)

(declare-fun array_inv!19851 (array!52618) Bool)

(assert (=> b!897009 (= e!501504 (and tp!55949 tp_is_empty!18297 (array_inv!19850 (_keys!10134 thiss!1181)) (array_inv!19851 (_values!5384 thiss!1181)) e!501503))))

(declare-fun b!897010 () Bool)

(assert (=> b!897010 (= e!501503 (and e!501497 mapRes!29074))))

(declare-fun condMapEmpty!29074 () Bool)

(declare-fun mapDefault!29074 () ValueCell!8667)

(assert (=> b!897010 (= condMapEmpty!29074 (= (arr!25294 (_values!5384 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8667)) mapDefault!29074)))))

(declare-fun mapIsEmpty!29074 () Bool)

(assert (=> mapIsEmpty!29074 mapRes!29074))

(assert (= (and start!76556 res!606412) b!897006))

(assert (= (and b!897006 res!606411) b!897005))

(assert (= (and b!897005 (not res!606414)) b!897002))

(assert (= (and b!897005 (not res!606410)) b!897003))

(assert (= (and b!897003 (not res!606413)) b!897007))

(assert (= (and b!897010 condMapEmpty!29074) mapIsEmpty!29074))

(assert (= (and b!897010 (not condMapEmpty!29074)) mapNonEmpty!29074))

(assert (= (and mapNonEmpty!29074 ((_ is ValueCellFull!8667) mapValue!29074)) b!897008))

(assert (= (and b!897010 ((_ is ValueCellFull!8667) mapDefault!29074)) b!897004))

(assert (= b!897009 b!897010))

(assert (= start!76556 b!897009))

(declare-fun m!833963 () Bool)

(assert (=> b!897002 m!833963))

(declare-fun m!833965 () Bool)

(assert (=> mapNonEmpty!29074 m!833965))

(declare-fun m!833967 () Bool)

(assert (=> b!897003 m!833967))

(declare-fun m!833969 () Bool)

(assert (=> b!897003 m!833969))

(declare-fun m!833971 () Bool)

(assert (=> b!897003 m!833971))

(declare-fun m!833973 () Bool)

(assert (=> b!897005 m!833973))

(declare-fun m!833975 () Bool)

(assert (=> b!897005 m!833975))

(declare-fun m!833977 () Bool)

(assert (=> start!76556 m!833977))

(declare-fun m!833979 () Bool)

(assert (=> b!897009 m!833979))

(declare-fun m!833981 () Bool)

(assert (=> b!897009 m!833981))

(check-sat (not b!897009) (not mapNonEmpty!29074) (not start!76556) (not b!897003) (not b!897002) (not b!897005) tp_is_empty!18297 b_and!26261 (not b_next!15969))
(check-sat b_and!26261 (not b_next!15969))
(get-model)

(declare-fun d!111013 () Bool)

(declare-fun e!501534 () Bool)

(assert (=> d!111013 e!501534))

(declare-fun res!606432 () Bool)

(assert (=> d!111013 (=> res!606432 e!501534)))

(declare-fun lt!405040 () SeekEntryResult!8903)

(assert (=> d!111013 (= res!606432 (not ((_ is Found!8903) lt!405040)))))

(assert (=> d!111013 (= lt!405040 (seekEntry!0 key!785 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)))))

(declare-fun lt!405039 () Unit!30496)

(declare-fun choose!1481 (array!52616 array!52618 (_ BitVec 32) (_ BitVec 32) V!29361 V!29361 (_ BitVec 64)) Unit!30496)

(assert (=> d!111013 (= lt!405039 (choose!1481 (_keys!10134 thiss!1181) (_values!5384 thiss!1181) (mask!26055 thiss!1181) (extraKeys!5093 thiss!1181) (zeroValue!5197 thiss!1181) (minValue!5197 thiss!1181) key!785))))

(assert (=> d!111013 (validMask!0 (mask!26055 thiss!1181))))

(assert (=> d!111013 (= (lemmaSeekEntryGivesInRangeIndex!74 (_keys!10134 thiss!1181) (_values!5384 thiss!1181) (mask!26055 thiss!1181) (extraKeys!5093 thiss!1181) (zeroValue!5197 thiss!1181) (minValue!5197 thiss!1181) key!785) lt!405039)))

(declare-fun b!897040 () Bool)

(assert (=> b!897040 (= e!501534 (inRange!0 (index!37984 lt!405040) (mask!26055 thiss!1181)))))

(assert (= (and d!111013 (not res!606432)) b!897040))

(assert (=> d!111013 m!833975))

(declare-fun m!834003 () Bool)

(assert (=> d!111013 m!834003))

(assert (=> d!111013 m!833967))

(declare-fun m!834005 () Bool)

(assert (=> b!897040 m!834005))

(assert (=> b!897005 d!111013))

(declare-fun b!897053 () Bool)

(declare-fun e!501541 () SeekEntryResult!8903)

(declare-fun lt!405050 () SeekEntryResult!8903)

(assert (=> b!897053 (= e!501541 (MissingZero!8903 (index!37985 lt!405050)))))

(declare-fun b!897054 () Bool)

(declare-fun c!94777 () Bool)

(declare-fun lt!405052 () (_ BitVec 64))

(assert (=> b!897054 (= c!94777 (= lt!405052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501542 () SeekEntryResult!8903)

(assert (=> b!897054 (= e!501542 e!501541)))

(declare-fun b!897055 () Bool)

(assert (=> b!897055 (= e!501542 (Found!8903 (index!37985 lt!405050)))))

(declare-fun d!111015 () Bool)

(declare-fun lt!405051 () SeekEntryResult!8903)

(assert (=> d!111015 (and (or ((_ is MissingVacant!8903) lt!405051) (not ((_ is Found!8903) lt!405051)) (and (bvsge (index!37984 lt!405051) #b00000000000000000000000000000000) (bvslt (index!37984 lt!405051) (size!25746 (_keys!10134 thiss!1181))))) (not ((_ is MissingVacant!8903) lt!405051)) (or (not ((_ is Found!8903) lt!405051)) (= (select (arr!25293 (_keys!10134 thiss!1181)) (index!37984 lt!405051)) key!785)))))

(declare-fun e!501543 () SeekEntryResult!8903)

(assert (=> d!111015 (= lt!405051 e!501543)))

(declare-fun c!94778 () Bool)

(assert (=> d!111015 (= c!94778 (and ((_ is Intermediate!8903) lt!405050) (undefined!9715 lt!405050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52616 (_ BitVec 32)) SeekEntryResult!8903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111015 (= lt!405050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26055 thiss!1181)) key!785 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)))))

(assert (=> d!111015 (validMask!0 (mask!26055 thiss!1181))))

(assert (=> d!111015 (= (seekEntry!0 key!785 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)) lt!405051)))

(declare-fun b!897056 () Bool)

(assert (=> b!897056 (= e!501543 e!501542)))

(assert (=> b!897056 (= lt!405052 (select (arr!25293 (_keys!10134 thiss!1181)) (index!37985 lt!405050)))))

(declare-fun c!94776 () Bool)

(assert (=> b!897056 (= c!94776 (= lt!405052 key!785))))

(declare-fun b!897057 () Bool)

(assert (=> b!897057 (= e!501543 Undefined!8903)))

(declare-fun b!897058 () Bool)

(declare-fun lt!405049 () SeekEntryResult!8903)

(assert (=> b!897058 (= e!501541 (ite ((_ is MissingVacant!8903) lt!405049) (MissingZero!8903 (index!37986 lt!405049)) lt!405049))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52616 (_ BitVec 32)) SeekEntryResult!8903)

(assert (=> b!897058 (= lt!405049 (seekKeyOrZeroReturnVacant!0 (x!76402 lt!405050) (index!37985 lt!405050) (index!37985 lt!405050) key!785 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)))))

(assert (= (and d!111015 c!94778) b!897057))

(assert (= (and d!111015 (not c!94778)) b!897056))

(assert (= (and b!897056 c!94776) b!897055))

(assert (= (and b!897056 (not c!94776)) b!897054))

(assert (= (and b!897054 c!94777) b!897053))

(assert (= (and b!897054 (not c!94777)) b!897058))

(declare-fun m!834007 () Bool)

(assert (=> d!111015 m!834007))

(declare-fun m!834009 () Bool)

(assert (=> d!111015 m!834009))

(assert (=> d!111015 m!834009))

(declare-fun m!834011 () Bool)

(assert (=> d!111015 m!834011))

(assert (=> d!111015 m!833967))

(declare-fun m!834013 () Bool)

(assert (=> b!897056 m!834013))

(declare-fun m!834015 () Bool)

(assert (=> b!897058 m!834015))

(assert (=> b!897005 d!111015))

(declare-fun d!111017 () Bool)

(assert (=> d!111017 (= (inRange!0 (index!37984 lt!405023) (mask!26055 thiss!1181)) (and (bvsge (index!37984 lt!405023) #b00000000000000000000000000000000) (bvslt (index!37984 lt!405023) (bvadd (mask!26055 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897002 d!111017))

(declare-fun d!111019 () Bool)

(assert (=> d!111019 (= (validMask!0 (mask!26055 thiss!1181)) (and (or (= (mask!26055 thiss!1181) #b00000000000000000000000000000111) (= (mask!26055 thiss!1181) #b00000000000000000000000000001111) (= (mask!26055 thiss!1181) #b00000000000000000000000000011111) (= (mask!26055 thiss!1181) #b00000000000000000000000000111111) (= (mask!26055 thiss!1181) #b00000000000000000000000001111111) (= (mask!26055 thiss!1181) #b00000000000000000000000011111111) (= (mask!26055 thiss!1181) #b00000000000000000000000111111111) (= (mask!26055 thiss!1181) #b00000000000000000000001111111111) (= (mask!26055 thiss!1181) #b00000000000000000000011111111111) (= (mask!26055 thiss!1181) #b00000000000000000000111111111111) (= (mask!26055 thiss!1181) #b00000000000000000001111111111111) (= (mask!26055 thiss!1181) #b00000000000000000011111111111111) (= (mask!26055 thiss!1181) #b00000000000000000111111111111111) (= (mask!26055 thiss!1181) #b00000000000000001111111111111111) (= (mask!26055 thiss!1181) #b00000000000000011111111111111111) (= (mask!26055 thiss!1181) #b00000000000000111111111111111111) (= (mask!26055 thiss!1181) #b00000000000001111111111111111111) (= (mask!26055 thiss!1181) #b00000000000011111111111111111111) (= (mask!26055 thiss!1181) #b00000000000111111111111111111111) (= (mask!26055 thiss!1181) #b00000000001111111111111111111111) (= (mask!26055 thiss!1181) #b00000000011111111111111111111111) (= (mask!26055 thiss!1181) #b00000000111111111111111111111111) (= (mask!26055 thiss!1181) #b00000001111111111111111111111111) (= (mask!26055 thiss!1181) #b00000011111111111111111111111111) (= (mask!26055 thiss!1181) #b00000111111111111111111111111111) (= (mask!26055 thiss!1181) #b00001111111111111111111111111111) (= (mask!26055 thiss!1181) #b00011111111111111111111111111111) (= (mask!26055 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26055 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897003 d!111019))

(declare-fun d!111021 () Bool)

(declare-fun res!606437 () Bool)

(declare-fun e!501548 () Bool)

(assert (=> d!111021 (=> res!606437 e!501548)))

(assert (=> d!111021 (= res!606437 (= (select (arr!25293 (_keys!10134 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111021 (= (arrayContainsKey!0 (_keys!10134 thiss!1181) key!785 #b00000000000000000000000000000000) e!501548)))

(declare-fun b!897063 () Bool)

(declare-fun e!501549 () Bool)

(assert (=> b!897063 (= e!501548 e!501549)))

(declare-fun res!606438 () Bool)

(assert (=> b!897063 (=> (not res!606438) (not e!501549))))

(assert (=> b!897063 (= res!606438 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25746 (_keys!10134 thiss!1181))))))

(declare-fun b!897064 () Bool)

(assert (=> b!897064 (= e!501549 (arrayContainsKey!0 (_keys!10134 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111021 (not res!606437)) b!897063))

(assert (= (and b!897063 res!606438) b!897064))

(declare-fun m!834017 () Bool)

(assert (=> d!111021 m!834017))

(declare-fun m!834019 () Bool)

(assert (=> b!897064 m!834019))

(assert (=> b!897003 d!111021))

(declare-fun d!111023 () Bool)

(assert (=> d!111023 (arrayContainsKey!0 (_keys!10134 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405055 () Unit!30496)

(declare-fun choose!13 (array!52616 (_ BitVec 64) (_ BitVec 32)) Unit!30496)

(assert (=> d!111023 (= lt!405055 (choose!13 (_keys!10134 thiss!1181) key!785 (index!37984 lt!405023)))))

(assert (=> d!111023 (bvsge (index!37984 lt!405023) #b00000000000000000000000000000000)))

(assert (=> d!111023 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10134 thiss!1181) key!785 (index!37984 lt!405023)) lt!405055)))

(declare-fun bs!25180 () Bool)

(assert (= bs!25180 d!111023))

(assert (=> bs!25180 m!833969))

(declare-fun m!834021 () Bool)

(assert (=> bs!25180 m!834021))

(assert (=> b!897003 d!111023))

(declare-fun d!111025 () Bool)

(declare-fun res!606445 () Bool)

(declare-fun e!501552 () Bool)

(assert (=> d!111025 (=> (not res!606445) (not e!501552))))

(declare-fun simpleValid!316 (LongMapFixedSize!4350) Bool)

(assert (=> d!111025 (= res!606445 (simpleValid!316 thiss!1181))))

(assert (=> d!111025 (= (valid!1677 thiss!1181) e!501552)))

(declare-fun b!897071 () Bool)

(declare-fun res!606446 () Bool)

(assert (=> b!897071 (=> (not res!606446) (not e!501552))))

(declare-fun arrayCountValidKeys!0 (array!52616 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897071 (= res!606446 (= (arrayCountValidKeys!0 (_keys!10134 thiss!1181) #b00000000000000000000000000000000 (size!25746 (_keys!10134 thiss!1181))) (_size!2230 thiss!1181)))))

(declare-fun b!897072 () Bool)

(declare-fun res!606447 () Bool)

(assert (=> b!897072 (=> (not res!606447) (not e!501552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52616 (_ BitVec 32)) Bool)

(assert (=> b!897072 (= res!606447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10134 thiss!1181) (mask!26055 thiss!1181)))))

(declare-fun b!897073 () Bool)

(declare-datatypes ((List!17826 0))(
  ( (Nil!17823) (Cons!17822 (h!18962 (_ BitVec 64)) (t!25165 List!17826)) )
))
(declare-fun arrayNoDuplicates!0 (array!52616 (_ BitVec 32) List!17826) Bool)

(assert (=> b!897073 (= e!501552 (arrayNoDuplicates!0 (_keys!10134 thiss!1181) #b00000000000000000000000000000000 Nil!17823))))

(assert (= (and d!111025 res!606445) b!897071))

(assert (= (and b!897071 res!606446) b!897072))

(assert (= (and b!897072 res!606447) b!897073))

(declare-fun m!834023 () Bool)

(assert (=> d!111025 m!834023))

(declare-fun m!834025 () Bool)

(assert (=> b!897071 m!834025))

(declare-fun m!834027 () Bool)

(assert (=> b!897072 m!834027))

(declare-fun m!834029 () Bool)

(assert (=> b!897073 m!834029))

(assert (=> start!76556 d!111025))

(declare-fun d!111027 () Bool)

(assert (=> d!111027 (= (array_inv!19850 (_keys!10134 thiss!1181)) (bvsge (size!25746 (_keys!10134 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897009 d!111027))

(declare-fun d!111029 () Bool)

(assert (=> d!111029 (= (array_inv!19851 (_values!5384 thiss!1181)) (bvsge (size!25747 (_values!5384 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897009 d!111029))

(declare-fun mapNonEmpty!29080 () Bool)

(declare-fun mapRes!29080 () Bool)

(declare-fun tp!55959 () Bool)

(declare-fun e!501558 () Bool)

(assert (=> mapNonEmpty!29080 (= mapRes!29080 (and tp!55959 e!501558))))

(declare-fun mapValue!29080 () ValueCell!8667)

(declare-fun mapRest!29080 () (Array (_ BitVec 32) ValueCell!8667))

(declare-fun mapKey!29080 () (_ BitVec 32))

(assert (=> mapNonEmpty!29080 (= mapRest!29074 (store mapRest!29080 mapKey!29080 mapValue!29080))))

(declare-fun condMapEmpty!29080 () Bool)

(declare-fun mapDefault!29080 () ValueCell!8667)

(assert (=> mapNonEmpty!29074 (= condMapEmpty!29080 (= mapRest!29074 ((as const (Array (_ BitVec 32) ValueCell!8667)) mapDefault!29080)))))

(declare-fun e!501557 () Bool)

(assert (=> mapNonEmpty!29074 (= tp!55950 (and e!501557 mapRes!29080))))

(declare-fun b!897080 () Bool)

(assert (=> b!897080 (= e!501558 tp_is_empty!18297)))

(declare-fun b!897081 () Bool)

(assert (=> b!897081 (= e!501557 tp_is_empty!18297)))

(declare-fun mapIsEmpty!29080 () Bool)

(assert (=> mapIsEmpty!29080 mapRes!29080))

(assert (= (and mapNonEmpty!29074 condMapEmpty!29080) mapIsEmpty!29080))

(assert (= (and mapNonEmpty!29074 (not condMapEmpty!29080)) mapNonEmpty!29080))

(assert (= (and mapNonEmpty!29080 ((_ is ValueCellFull!8667) mapValue!29080)) b!897080))

(assert (= (and mapNonEmpty!29074 ((_ is ValueCellFull!8667) mapDefault!29080)) b!897081))

(declare-fun m!834031 () Bool)

(assert (=> mapNonEmpty!29080 m!834031))

(check-sat (not d!111015) (not d!111025) (not d!111013) (not b!897073) (not b!897071) (not b!897072) (not b!897058) (not mapNonEmpty!29080) tp_is_empty!18297 b_and!26261 (not b!897040) (not b_next!15969) (not b!897064) (not d!111023))
(check-sat b_and!26261 (not b_next!15969))
