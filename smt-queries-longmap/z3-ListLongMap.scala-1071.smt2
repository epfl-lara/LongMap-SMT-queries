; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22112 () Bool)

(assert start!22112)

(declare-fun b!229979 () Bool)

(declare-fun b_free!6175 () Bool)

(declare-fun b_next!6175 () Bool)

(assert (=> b!229979 (= b_free!6175 (not b_next!6175))))

(declare-fun tp!21667 () Bool)

(declare-fun b_and!13087 () Bool)

(assert (=> b!229979 (= tp!21667 b_and!13087)))

(declare-fun b!229967 () Bool)

(declare-fun e!149213 () Bool)

(declare-fun e!149205 () Bool)

(assert (=> b!229967 (= e!149213 e!149205)))

(declare-fun res!113158 () Bool)

(declare-fun call!21348 () Bool)

(assert (=> b!229967 (= res!113158 call!21348)))

(assert (=> b!229967 (=> (not res!113158) (not e!149205))))

(declare-fun b!229968 () Bool)

(declare-fun e!149215 () Bool)

(declare-fun e!149204 () Bool)

(assert (=> b!229968 (= e!149215 e!149204)))

(declare-fun res!113156 () Bool)

(assert (=> b!229968 (=> (not res!113156) (not e!149204))))

(declare-datatypes ((SeekEntryResult!895 0))(
  ( (MissingZero!895 (index!5750 (_ BitVec 32))) (Found!895 (index!5751 (_ BitVec 32))) (Intermediate!895 (undefined!1707 Bool) (index!5752 (_ BitVec 32)) (x!23379 (_ BitVec 32))) (Undefined!895) (MissingVacant!895 (index!5753 (_ BitVec 32))) )
))
(declare-fun lt!115729 () SeekEntryResult!895)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229968 (= res!113156 (or (= lt!115729 (MissingZero!895 index!297)) (= lt!115729 (MissingVacant!895 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7697 0))(
  ( (V!7698 (val!3063 Int)) )
))
(declare-datatypes ((ValueCell!2675 0))(
  ( (ValueCellFull!2675 (v!5084 V!7697)) (EmptyCell!2675) )
))
(declare-datatypes ((array!11315 0))(
  ( (array!11316 (arr!5377 (Array (_ BitVec 32) ValueCell!2675)) (size!5710 (_ BitVec 32))) )
))
(declare-datatypes ((array!11317 0))(
  ( (array!11318 (arr!5378 (Array (_ BitVec 32) (_ BitVec 64))) (size!5711 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3250 0))(
  ( (LongMapFixedSize!3251 (defaultEntry!4284 Int) (mask!10170 (_ BitVec 32)) (extraKeys!4021 (_ BitVec 32)) (zeroValue!4125 V!7697) (minValue!4125 V!7697) (_size!1674 (_ BitVec 32)) (_keys!6338 array!11317) (_values!4267 array!11315) (_vacant!1674 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3250)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11317 (_ BitVec 32)) SeekEntryResult!895)

(assert (=> b!229968 (= lt!115729 (seekEntryOrOpen!0 key!932 (_keys!6338 thiss!1504) (mask!10170 thiss!1504)))))

(declare-fun b!229969 () Bool)

(declare-datatypes ((Unit!7005 0))(
  ( (Unit!7006) )
))
(declare-fun e!149206 () Unit!7005)

(declare-fun Unit!7007 () Unit!7005)

(assert (=> b!229969 (= e!149206 Unit!7007)))

(declare-fun lt!115723 () Unit!7005)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (array!11317 array!11315 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!7005)

(assert (=> b!229969 (= lt!115723 (lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229969 false))

(declare-fun b!229970 () Bool)

(declare-fun e!149210 () Bool)

(declare-fun call!21347 () Bool)

(assert (=> b!229970 (= e!149210 (not call!21347))))

(declare-fun b!229971 () Bool)

(assert (=> b!229971 (= e!149205 (not call!21347))))

(declare-fun bm!21344 () Bool)

(declare-fun arrayContainsKey!0 (array!11317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21344 (= call!21347 (arrayContainsKey!0 (_keys!6338 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229972 () Bool)

(declare-fun e!149216 () Bool)

(declare-fun e!149208 () Bool)

(declare-fun mapRes!10225 () Bool)

(assert (=> b!229972 (= e!149216 (and e!149208 mapRes!10225))))

(declare-fun condMapEmpty!10225 () Bool)

(declare-fun mapDefault!10225 () ValueCell!2675)

(assert (=> b!229972 (= condMapEmpty!10225 (= (arr!5377 (_values!4267 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2675)) mapDefault!10225)))))

(declare-fun b!229973 () Bool)

(declare-fun e!149207 () Bool)

(assert (=> b!229973 (= e!149204 e!149207)))

(declare-fun res!113152 () Bool)

(assert (=> b!229973 (=> (not res!113152) (not e!149207))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229973 (= res!113152 (inRange!0 index!297 (mask!10170 thiss!1504)))))

(declare-fun lt!115724 () Unit!7005)

(assert (=> b!229973 (= lt!115724 e!149206)))

(declare-fun c!38158 () Bool)

(declare-datatypes ((tuple2!4444 0))(
  ( (tuple2!4445 (_1!2233 (_ BitVec 64)) (_2!2233 V!7697)) )
))
(declare-datatypes ((List!3358 0))(
  ( (Nil!3355) (Cons!3354 (h!4002 tuple2!4444) (t!8309 List!3358)) )
))
(declare-datatypes ((ListLongMap!3359 0))(
  ( (ListLongMap!3360 (toList!1695 List!3358)) )
))
(declare-fun lt!115722 () ListLongMap!3359)

(declare-fun contains!1584 (ListLongMap!3359 (_ BitVec 64)) Bool)

(assert (=> b!229973 (= c!38158 (contains!1584 lt!115722 key!932))))

(declare-fun getCurrentListMap!1227 (array!11317 array!11315 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) Int) ListLongMap!3359)

(assert (=> b!229973 (= lt!115722 (getCurrentListMap!1227 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun res!113155 () Bool)

(assert (=> start!22112 (=> (not res!113155) (not e!149215))))

(declare-fun valid!1306 (LongMapFixedSize!3250) Bool)

(assert (=> start!22112 (= res!113155 (valid!1306 thiss!1504))))

(assert (=> start!22112 e!149215))

(declare-fun e!149209 () Bool)

(assert (=> start!22112 e!149209))

(assert (=> start!22112 true))

(declare-fun tp_is_empty!6037 () Bool)

(assert (=> start!22112 tp_is_empty!6037))

(declare-fun b!229974 () Bool)

(declare-fun res!113157 () Bool)

(assert (=> b!229974 (= res!113157 (= (select (arr!5378 (_keys!6338 thiss!1504)) (index!5753 lt!115729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229974 (=> (not res!113157) (not e!149205))))

(declare-fun b!229975 () Bool)

(assert (=> b!229975 (= e!149207 (not true))))

(declare-fun v!346 () V!7697)

(declare-fun lt!115728 () array!11317)

(declare-fun +!595 (ListLongMap!3359 tuple2!4444) ListLongMap!3359)

(assert (=> b!229975 (= (+!595 lt!115722 (tuple2!4445 key!932 v!346)) (getCurrentListMap!1227 lt!115728 (array!11316 (store (arr!5377 (_values!4267 thiss!1504)) index!297 (ValueCellFull!2675 v!346)) (size!5710 (_values!4267 thiss!1504))) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun lt!115725 () Unit!7005)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!54 (array!11317 array!11315 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) (_ BitVec 64) V!7697 Int) Unit!7005)

(assert (=> b!229975 (= lt!115725 (lemmaAddValidKeyToArrayThenAddPairToListMap!54 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) index!297 key!932 v!346 (defaultEntry!4284 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11317 (_ BitVec 32)) Bool)

(assert (=> b!229975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115728 (mask!10170 thiss!1504))))

(declare-fun lt!115732 () Unit!7005)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11317 (_ BitVec 32) (_ BitVec 32)) Unit!7005)

(assert (=> b!229975 (= lt!115732 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6338 thiss!1504) index!297 (mask!10170 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11317 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229975 (= (arrayCountValidKeys!0 lt!115728 #b00000000000000000000000000000000 (size!5711 (_keys!6338 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6338 thiss!1504) #b00000000000000000000000000000000 (size!5711 (_keys!6338 thiss!1504)))))))

(declare-fun lt!115727 () Unit!7005)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11317 (_ BitVec 32) (_ BitVec 64)) Unit!7005)

(assert (=> b!229975 (= lt!115727 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6338 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3359 0))(
  ( (Nil!3356) (Cons!3355 (h!4003 (_ BitVec 64)) (t!8310 List!3359)) )
))
(declare-fun arrayNoDuplicates!0 (array!11317 (_ BitVec 32) List!3359) Bool)

(assert (=> b!229975 (arrayNoDuplicates!0 lt!115728 #b00000000000000000000000000000000 Nil!3356)))

(assert (=> b!229975 (= lt!115728 (array!11318 (store (arr!5378 (_keys!6338 thiss!1504)) index!297 key!932) (size!5711 (_keys!6338 thiss!1504))))))

(declare-fun lt!115731 () Unit!7005)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3359) Unit!7005)

(assert (=> b!229975 (= lt!115731 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6338 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3356))))

(declare-fun lt!115730 () Unit!7005)

(declare-fun e!149211 () Unit!7005)

(assert (=> b!229975 (= lt!115730 e!149211)))

(declare-fun c!38159 () Bool)

(assert (=> b!229975 (= c!38159 (arrayContainsKey!0 (_keys!6338 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229976 () Bool)

(declare-fun lt!115721 () Unit!7005)

(assert (=> b!229976 (= e!149206 lt!115721)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (array!11317 array!11315 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!7005)

(assert (=> b!229976 (= lt!115721 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!279 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(declare-fun c!38161 () Bool)

(get-info :version)

(assert (=> b!229976 (= c!38161 ((_ is MissingZero!895) lt!115729))))

(declare-fun e!149203 () Bool)

(assert (=> b!229976 e!149203))

(declare-fun b!229977 () Bool)

(declare-fun res!113151 () Bool)

(assert (=> b!229977 (=> (not res!113151) (not e!149215))))

(assert (=> b!229977 (= res!113151 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21345 () Bool)

(assert (=> bm!21345 (= call!21348 (inRange!0 (ite c!38161 (index!5750 lt!115729) (index!5753 lt!115729)) (mask!10170 thiss!1504)))))

(declare-fun mapNonEmpty!10225 () Bool)

(declare-fun tp!21666 () Bool)

(declare-fun e!149214 () Bool)

(assert (=> mapNonEmpty!10225 (= mapRes!10225 (and tp!21666 e!149214))))

(declare-fun mapRest!10225 () (Array (_ BitVec 32) ValueCell!2675))

(declare-fun mapKey!10225 () (_ BitVec 32))

(declare-fun mapValue!10225 () ValueCell!2675)

(assert (=> mapNonEmpty!10225 (= (arr!5377 (_values!4267 thiss!1504)) (store mapRest!10225 mapKey!10225 mapValue!10225))))

(declare-fun b!229978 () Bool)

(declare-fun Unit!7008 () Unit!7005)

(assert (=> b!229978 (= e!149211 Unit!7008)))

(declare-fun array_inv!3531 (array!11317) Bool)

(declare-fun array_inv!3532 (array!11315) Bool)

(assert (=> b!229979 (= e!149209 (and tp!21667 tp_is_empty!6037 (array_inv!3531 (_keys!6338 thiss!1504)) (array_inv!3532 (_values!4267 thiss!1504)) e!149216))))

(declare-fun b!229980 () Bool)

(assert (=> b!229980 (= e!149214 tp_is_empty!6037)))

(declare-fun b!229981 () Bool)

(assert (=> b!229981 (= e!149213 ((_ is Undefined!895) lt!115729))))

(declare-fun b!229982 () Bool)

(declare-fun Unit!7009 () Unit!7005)

(assert (=> b!229982 (= e!149211 Unit!7009)))

(declare-fun lt!115726 () Unit!7005)

(declare-fun lemmaArrayContainsKeyThenInListMap!125 (array!11317 array!11315 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) (_ BitVec 32) Int) Unit!7005)

(assert (=> b!229982 (= lt!115726 (lemmaArrayContainsKeyThenInListMap!125 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229982 false))

(declare-fun mapIsEmpty!10225 () Bool)

(assert (=> mapIsEmpty!10225 mapRes!10225))

(declare-fun b!229983 () Bool)

(assert (=> b!229983 (= e!149208 tp_is_empty!6037)))

(declare-fun b!229984 () Bool)

(declare-fun res!113153 () Bool)

(assert (=> b!229984 (=> (not res!113153) (not e!149210))))

(assert (=> b!229984 (= res!113153 call!21348)))

(assert (=> b!229984 (= e!149203 e!149210)))

(declare-fun b!229985 () Bool)

(declare-fun c!38160 () Bool)

(assert (=> b!229985 (= c!38160 ((_ is MissingVacant!895) lt!115729))))

(assert (=> b!229985 (= e!149203 e!149213)))

(declare-fun b!229986 () Bool)

(declare-fun res!113154 () Bool)

(assert (=> b!229986 (=> (not res!113154) (not e!149210))))

(assert (=> b!229986 (= res!113154 (= (select (arr!5378 (_keys!6338 thiss!1504)) (index!5750 lt!115729)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22112 res!113155) b!229977))

(assert (= (and b!229977 res!113151) b!229968))

(assert (= (and b!229968 res!113156) b!229973))

(assert (= (and b!229973 c!38158) b!229969))

(assert (= (and b!229973 (not c!38158)) b!229976))

(assert (= (and b!229976 c!38161) b!229984))

(assert (= (and b!229976 (not c!38161)) b!229985))

(assert (= (and b!229984 res!113153) b!229986))

(assert (= (and b!229986 res!113154) b!229970))

(assert (= (and b!229985 c!38160) b!229967))

(assert (= (and b!229985 (not c!38160)) b!229981))

(assert (= (and b!229967 res!113158) b!229974))

(assert (= (and b!229974 res!113157) b!229971))

(assert (= (or b!229984 b!229967) bm!21345))

(assert (= (or b!229970 b!229971) bm!21344))

(assert (= (and b!229973 res!113152) b!229975))

(assert (= (and b!229975 c!38159) b!229982))

(assert (= (and b!229975 (not c!38159)) b!229978))

(assert (= (and b!229972 condMapEmpty!10225) mapIsEmpty!10225))

(assert (= (and b!229972 (not condMapEmpty!10225)) mapNonEmpty!10225))

(assert (= (and mapNonEmpty!10225 ((_ is ValueCellFull!2675) mapValue!10225)) b!229980))

(assert (= (and b!229972 ((_ is ValueCellFull!2675) mapDefault!10225)) b!229983))

(assert (= b!229979 b!229972))

(assert (= start!22112 b!229979))

(declare-fun m!251527 () Bool)

(assert (=> b!229969 m!251527))

(declare-fun m!251529 () Bool)

(assert (=> b!229968 m!251529))

(declare-fun m!251531 () Bool)

(assert (=> b!229979 m!251531))

(declare-fun m!251533 () Bool)

(assert (=> b!229979 m!251533))

(declare-fun m!251535 () Bool)

(assert (=> b!229974 m!251535))

(declare-fun m!251537 () Bool)

(assert (=> b!229973 m!251537))

(declare-fun m!251539 () Bool)

(assert (=> b!229973 m!251539))

(declare-fun m!251541 () Bool)

(assert (=> b!229973 m!251541))

(declare-fun m!251543 () Bool)

(assert (=> mapNonEmpty!10225 m!251543))

(declare-fun m!251545 () Bool)

(assert (=> b!229986 m!251545))

(declare-fun m!251547 () Bool)

(assert (=> b!229982 m!251547))

(declare-fun m!251549 () Bool)

(assert (=> bm!21344 m!251549))

(assert (=> b!229975 m!251549))

(declare-fun m!251551 () Bool)

(assert (=> b!229975 m!251551))

(declare-fun m!251553 () Bool)

(assert (=> b!229975 m!251553))

(declare-fun m!251555 () Bool)

(assert (=> b!229975 m!251555))

(declare-fun m!251557 () Bool)

(assert (=> b!229975 m!251557))

(declare-fun m!251559 () Bool)

(assert (=> b!229975 m!251559))

(declare-fun m!251561 () Bool)

(assert (=> b!229975 m!251561))

(declare-fun m!251563 () Bool)

(assert (=> b!229975 m!251563))

(declare-fun m!251565 () Bool)

(assert (=> b!229975 m!251565))

(declare-fun m!251567 () Bool)

(assert (=> b!229975 m!251567))

(declare-fun m!251569 () Bool)

(assert (=> b!229975 m!251569))

(declare-fun m!251571 () Bool)

(assert (=> b!229975 m!251571))

(declare-fun m!251573 () Bool)

(assert (=> b!229975 m!251573))

(declare-fun m!251575 () Bool)

(assert (=> start!22112 m!251575))

(declare-fun m!251577 () Bool)

(assert (=> b!229976 m!251577))

(declare-fun m!251579 () Bool)

(assert (=> bm!21345 m!251579))

(check-sat (not start!22112) (not b_next!6175) (not b!229979) (not bm!21344) (not b!229982) (not mapNonEmpty!10225) (not b!229975) (not b!229976) (not b!229973) (not bm!21345) b_and!13087 (not b!229969) tp_is_empty!6037 (not b!229968))
(check-sat b_and!13087 (not b_next!6175))
