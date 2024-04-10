; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22098 () Bool)

(assert start!22098)

(declare-fun b!229611 () Bool)

(declare-fun b_free!6165 () Bool)

(declare-fun b_next!6165 () Bool)

(assert (=> b!229611 (= b_free!6165 (not b_next!6165))))

(declare-fun tp!21636 () Bool)

(declare-fun b_and!13063 () Bool)

(assert (=> b!229611 (= tp!21636 b_and!13063)))

(declare-fun b!229608 () Bool)

(declare-fun e!148966 () Bool)

(declare-fun call!21329 () Bool)

(assert (=> b!229608 (= e!148966 (not call!21329))))

(declare-fun b!229609 () Bool)

(declare-fun e!148973 () Bool)

(declare-fun tp_is_empty!6027 () Bool)

(assert (=> b!229609 (= e!148973 tp_is_empty!6027)))

(declare-fun b!229610 () Bool)

(declare-fun res!113006 () Bool)

(declare-fun e!148974 () Bool)

(assert (=> b!229610 (=> (not res!113006) (not e!148974))))

(declare-fun call!21330 () Bool)

(assert (=> b!229610 (= res!113006 call!21330)))

(declare-fun e!148970 () Bool)

(assert (=> b!229610 (= e!148970 e!148974)))

(declare-fun e!148978 () Bool)

(declare-fun e!148979 () Bool)

(declare-datatypes ((V!7683 0))(
  ( (V!7684 (val!3058 Int)) )
))
(declare-datatypes ((ValueCell!2670 0))(
  ( (ValueCellFull!2670 (v!5078 V!7683)) (EmptyCell!2670) )
))
(declare-datatypes ((array!11297 0))(
  ( (array!11298 (arr!5368 (Array (_ BitVec 32) ValueCell!2670)) (size!5701 (_ BitVec 32))) )
))
(declare-datatypes ((array!11299 0))(
  ( (array!11300 (arr!5369 (Array (_ BitVec 32) (_ BitVec 64))) (size!5702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3240 0))(
  ( (LongMapFixedSize!3241 (defaultEntry!4279 Int) (mask!10161 (_ BitVec 32)) (extraKeys!4016 (_ BitVec 32)) (zeroValue!4120 V!7683) (minValue!4120 V!7683) (_size!1669 (_ BitVec 32)) (_keys!6333 array!11299) (_values!4262 array!11297) (_vacant!1669 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3240)

(declare-fun array_inv!3543 (array!11299) Bool)

(declare-fun array_inv!3544 (array!11297) Bool)

(assert (=> b!229611 (= e!148979 (and tp!21636 tp_is_empty!6027 (array_inv!3543 (_keys!6333 thiss!1504)) (array_inv!3544 (_values!4262 thiss!1504)) e!148978))))

(declare-fun b!229612 () Bool)

(declare-datatypes ((Unit!7005 0))(
  ( (Unit!7006) )
))
(declare-fun e!148967 () Unit!7005)

(declare-fun lt!115486 () Unit!7005)

(assert (=> b!229612 (= e!148967 lt!115486)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!299 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7683 V!7683 (_ BitVec 64) Int) Unit!7005)

(assert (=> b!229612 (= lt!115486 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!299 (_keys!6333 thiss!1504) (_values!4262 thiss!1504) (mask!10161 thiss!1504) (extraKeys!4016 thiss!1504) (zeroValue!4120 thiss!1504) (minValue!4120 thiss!1504) key!932 (defaultEntry!4279 thiss!1504)))))

(declare-fun c!38087 () Bool)

(declare-datatypes ((SeekEntryResult!924 0))(
  ( (MissingZero!924 (index!5866 (_ BitVec 32))) (Found!924 (index!5867 (_ BitVec 32))) (Intermediate!924 (undefined!1736 Bool) (index!5868 (_ BitVec 32)) (x!23392 (_ BitVec 32))) (Undefined!924) (MissingVacant!924 (index!5869 (_ BitVec 32))) )
))
(declare-fun lt!115492 () SeekEntryResult!924)

(get-info :version)

(assert (=> b!229612 (= c!38087 ((_ is MissingZero!924) lt!115492))))

(assert (=> b!229612 e!148970))

(declare-fun b!229613 () Bool)

(declare-fun c!38086 () Bool)

(assert (=> b!229613 (= c!38086 ((_ is MissingVacant!924) lt!115492))))

(declare-fun e!148971 () Bool)

(assert (=> b!229613 (= e!148970 e!148971)))

(declare-fun b!229614 () Bool)

(declare-fun res!112998 () Bool)

(declare-fun e!148975 () Bool)

(assert (=> b!229614 (=> (not res!112998) (not e!148975))))

(assert (=> b!229614 (= res!112998 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229615 () Bool)

(declare-fun e!148965 () Unit!7005)

(declare-fun Unit!7007 () Unit!7005)

(assert (=> b!229615 (= e!148965 Unit!7007)))

(declare-fun lt!115487 () Unit!7005)

(declare-fun lemmaArrayContainsKeyThenInListMap!117 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7683 V!7683 (_ BitVec 64) (_ BitVec 32) Int) Unit!7005)

(assert (=> b!229615 (= lt!115487 (lemmaArrayContainsKeyThenInListMap!117 (_keys!6333 thiss!1504) (_values!4262 thiss!1504) (mask!10161 thiss!1504) (extraKeys!4016 thiss!1504) (zeroValue!4120 thiss!1504) (minValue!4120 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4279 thiss!1504)))))

(assert (=> b!229615 false))

(declare-fun bm!21326 () Bool)

(declare-fun arrayContainsKey!0 (array!11299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21326 (= call!21329 (arrayContainsKey!0 (_keys!6333 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229616 () Bool)

(declare-fun e!148972 () Bool)

(assert (=> b!229616 (= e!148975 e!148972)))

(declare-fun res!113008 () Bool)

(assert (=> b!229616 (=> (not res!113008) (not e!148972))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229616 (= res!113008 (or (= lt!115492 (MissingZero!924 index!297)) (= lt!115492 (MissingVacant!924 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11299 (_ BitVec 32)) SeekEntryResult!924)

(assert (=> b!229616 (= lt!115492 (seekEntryOrOpen!0 key!932 (_keys!6333 thiss!1504) (mask!10161 thiss!1504)))))

(declare-fun b!229617 () Bool)

(declare-fun res!113001 () Bool)

(declare-fun e!148968 () Bool)

(assert (=> b!229617 (=> res!113001 e!148968)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11299 (_ BitVec 32)) Bool)

(assert (=> b!229617 (= res!113001 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6333 thiss!1504) (mask!10161 thiss!1504))))))

(declare-fun b!229618 () Bool)

(declare-fun e!148976 () Bool)

(assert (=> b!229618 (= e!148976 tp_is_empty!6027)))

(declare-fun b!229619 () Bool)

(declare-fun e!148977 () Bool)

(assert (=> b!229619 (= e!148977 (not e!148968))))

(declare-fun res!113002 () Bool)

(assert (=> b!229619 (=> res!113002 e!148968)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229619 (= res!113002 (not (validMask!0 (mask!10161 thiss!1504))))))

(declare-fun lt!115488 () array!11299)

(assert (=> b!229619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115488 (mask!10161 thiss!1504))))

(declare-fun lt!115489 () Unit!7005)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11299 (_ BitVec 32) (_ BitVec 32)) Unit!7005)

(assert (=> b!229619 (= lt!115489 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6333 thiss!1504) index!297 (mask!10161 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229619 (= (arrayCountValidKeys!0 lt!115488 #b00000000000000000000000000000000 (size!5702 (_keys!6333 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6333 thiss!1504) #b00000000000000000000000000000000 (size!5702 (_keys!6333 thiss!1504)))))))

(declare-fun lt!115493 () Unit!7005)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11299 (_ BitVec 32) (_ BitVec 64)) Unit!7005)

(assert (=> b!229619 (= lt!115493 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6333 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3435 0))(
  ( (Nil!3432) (Cons!3431 (h!4079 (_ BitVec 64)) (t!8394 List!3435)) )
))
(declare-fun arrayNoDuplicates!0 (array!11299 (_ BitVec 32) List!3435) Bool)

(assert (=> b!229619 (arrayNoDuplicates!0 lt!115488 #b00000000000000000000000000000000 Nil!3432)))

(assert (=> b!229619 (= lt!115488 (array!11300 (store (arr!5369 (_keys!6333 thiss!1504)) index!297 key!932) (size!5702 (_keys!6333 thiss!1504))))))

(declare-fun lt!115496 () Unit!7005)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11299 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3435) Unit!7005)

(assert (=> b!229619 (= lt!115496 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6333 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3432))))

(declare-fun lt!115495 () Unit!7005)

(assert (=> b!229619 (= lt!115495 e!148965)))

(declare-fun c!38085 () Bool)

(assert (=> b!229619 (= c!38085 (arrayContainsKey!0 (_keys!6333 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229620 () Bool)

(assert (=> b!229620 (= e!148971 ((_ is Undefined!924) lt!115492))))

(declare-fun b!229621 () Bool)

(assert (=> b!229621 (= e!148968 true)))

(declare-fun lt!115494 () Bool)

(assert (=> b!229621 (= lt!115494 (arrayNoDuplicates!0 (_keys!6333 thiss!1504) #b00000000000000000000000000000000 Nil!3432))))

(declare-fun mapNonEmpty!10210 () Bool)

(declare-fun mapRes!10210 () Bool)

(declare-fun tp!21637 () Bool)

(assert (=> mapNonEmpty!10210 (= mapRes!10210 (and tp!21637 e!148976))))

(declare-fun mapRest!10210 () (Array (_ BitVec 32) ValueCell!2670))

(declare-fun mapKey!10210 () (_ BitVec 32))

(declare-fun mapValue!10210 () ValueCell!2670)

(assert (=> mapNonEmpty!10210 (= (arr!5368 (_values!4262 thiss!1504)) (store mapRest!10210 mapKey!10210 mapValue!10210))))

(declare-fun res!113003 () Bool)

(assert (=> start!22098 (=> (not res!113003) (not e!148975))))

(declare-fun valid!1292 (LongMapFixedSize!3240) Bool)

(assert (=> start!22098 (= res!113003 (valid!1292 thiss!1504))))

(assert (=> start!22098 e!148975))

(assert (=> start!22098 e!148979))

(assert (=> start!22098 true))

(declare-fun b!229622 () Bool)

(assert (=> b!229622 (= e!148971 e!148966)))

(declare-fun res!113005 () Bool)

(assert (=> b!229622 (= res!113005 call!21330)))

(assert (=> b!229622 (=> (not res!113005) (not e!148966))))

(declare-fun b!229623 () Bool)

(declare-fun res!113004 () Bool)

(assert (=> b!229623 (=> (not res!113004) (not e!148974))))

(assert (=> b!229623 (= res!113004 (= (select (arr!5369 (_keys!6333 thiss!1504)) (index!5866 lt!115492)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229624 () Bool)

(assert (=> b!229624 (= e!148972 e!148977)))

(declare-fun res!113000 () Bool)

(assert (=> b!229624 (=> (not res!113000) (not e!148977))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229624 (= res!113000 (inRange!0 index!297 (mask!10161 thiss!1504)))))

(declare-fun lt!115490 () Unit!7005)

(assert (=> b!229624 (= lt!115490 e!148967)))

(declare-fun c!38088 () Bool)

(declare-datatypes ((tuple2!4510 0))(
  ( (tuple2!4511 (_1!2266 (_ BitVec 64)) (_2!2266 V!7683)) )
))
(declare-datatypes ((List!3436 0))(
  ( (Nil!3433) (Cons!3432 (h!4080 tuple2!4510) (t!8395 List!3436)) )
))
(declare-datatypes ((ListLongMap!3423 0))(
  ( (ListLongMap!3424 (toList!1727 List!3436)) )
))
(declare-fun contains!1601 (ListLongMap!3423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1255 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7683 V!7683 (_ BitVec 32) Int) ListLongMap!3423)

(assert (=> b!229624 (= c!38088 (contains!1601 (getCurrentListMap!1255 (_keys!6333 thiss!1504) (_values!4262 thiss!1504) (mask!10161 thiss!1504) (extraKeys!4016 thiss!1504) (zeroValue!4120 thiss!1504) (minValue!4120 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4279 thiss!1504)) key!932))))

(declare-fun b!229625 () Bool)

(declare-fun res!112999 () Bool)

(assert (=> b!229625 (=> res!112999 e!148968)))

(assert (=> b!229625 (= res!112999 (or (not (= (size!5701 (_values!4262 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10161 thiss!1504)))) (not (= (size!5702 (_keys!6333 thiss!1504)) (size!5701 (_values!4262 thiss!1504)))) (bvslt (mask!10161 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4016 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4016 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229626 () Bool)

(declare-fun res!113007 () Bool)

(assert (=> b!229626 (= res!113007 (= (select (arr!5369 (_keys!6333 thiss!1504)) (index!5869 lt!115492)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229626 (=> (not res!113007) (not e!148966))))

(declare-fun b!229627 () Bool)

(assert (=> b!229627 (= e!148974 (not call!21329))))

(declare-fun bm!21327 () Bool)

(assert (=> bm!21327 (= call!21330 (inRange!0 (ite c!38087 (index!5866 lt!115492) (index!5869 lt!115492)) (mask!10161 thiss!1504)))))

(declare-fun mapIsEmpty!10210 () Bool)

(assert (=> mapIsEmpty!10210 mapRes!10210))

(declare-fun b!229628 () Bool)

(declare-fun Unit!7008 () Unit!7005)

(assert (=> b!229628 (= e!148965 Unit!7008)))

(declare-fun b!229629 () Bool)

(declare-fun Unit!7009 () Unit!7005)

(assert (=> b!229629 (= e!148967 Unit!7009)))

(declare-fun lt!115491 () Unit!7005)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!282 (array!11299 array!11297 (_ BitVec 32) (_ BitVec 32) V!7683 V!7683 (_ BitVec 64) Int) Unit!7005)

(assert (=> b!229629 (= lt!115491 (lemmaInListMapThenSeekEntryOrOpenFindsIt!282 (_keys!6333 thiss!1504) (_values!4262 thiss!1504) (mask!10161 thiss!1504) (extraKeys!4016 thiss!1504) (zeroValue!4120 thiss!1504) (minValue!4120 thiss!1504) key!932 (defaultEntry!4279 thiss!1504)))))

(assert (=> b!229629 false))

(declare-fun b!229630 () Bool)

(assert (=> b!229630 (= e!148978 (and e!148973 mapRes!10210))))

(declare-fun condMapEmpty!10210 () Bool)

(declare-fun mapDefault!10210 () ValueCell!2670)

(assert (=> b!229630 (= condMapEmpty!10210 (= (arr!5368 (_values!4262 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2670)) mapDefault!10210)))))

(assert (= (and start!22098 res!113003) b!229614))

(assert (= (and b!229614 res!112998) b!229616))

(assert (= (and b!229616 res!113008) b!229624))

(assert (= (and b!229624 c!38088) b!229629))

(assert (= (and b!229624 (not c!38088)) b!229612))

(assert (= (and b!229612 c!38087) b!229610))

(assert (= (and b!229612 (not c!38087)) b!229613))

(assert (= (and b!229610 res!113006) b!229623))

(assert (= (and b!229623 res!113004) b!229627))

(assert (= (and b!229613 c!38086) b!229622))

(assert (= (and b!229613 (not c!38086)) b!229620))

(assert (= (and b!229622 res!113005) b!229626))

(assert (= (and b!229626 res!113007) b!229608))

(assert (= (or b!229610 b!229622) bm!21327))

(assert (= (or b!229627 b!229608) bm!21326))

(assert (= (and b!229624 res!113000) b!229619))

(assert (= (and b!229619 c!38085) b!229615))

(assert (= (and b!229619 (not c!38085)) b!229628))

(assert (= (and b!229619 (not res!113002)) b!229625))

(assert (= (and b!229625 (not res!112999)) b!229617))

(assert (= (and b!229617 (not res!113001)) b!229621))

(assert (= (and b!229630 condMapEmpty!10210) mapIsEmpty!10210))

(assert (= (and b!229630 (not condMapEmpty!10210)) mapNonEmpty!10210))

(assert (= (and mapNonEmpty!10210 ((_ is ValueCellFull!2670) mapValue!10210)) b!229618))

(assert (= (and b!229630 ((_ is ValueCellFull!2670) mapDefault!10210)) b!229609))

(assert (= b!229611 b!229630))

(assert (= start!22098 b!229611))

(declare-fun m!251079 () Bool)

(assert (=> b!229612 m!251079))

(declare-fun m!251081 () Bool)

(assert (=> bm!21327 m!251081))

(declare-fun m!251083 () Bool)

(assert (=> mapNonEmpty!10210 m!251083))

(declare-fun m!251085 () Bool)

(assert (=> b!229616 m!251085))

(declare-fun m!251087 () Bool)

(assert (=> start!22098 m!251087))

(declare-fun m!251089 () Bool)

(assert (=> b!229629 m!251089))

(declare-fun m!251091 () Bool)

(assert (=> b!229611 m!251091))

(declare-fun m!251093 () Bool)

(assert (=> b!229611 m!251093))

(declare-fun m!251095 () Bool)

(assert (=> b!229619 m!251095))

(declare-fun m!251097 () Bool)

(assert (=> b!229619 m!251097))

(declare-fun m!251099 () Bool)

(assert (=> b!229619 m!251099))

(declare-fun m!251101 () Bool)

(assert (=> b!229619 m!251101))

(declare-fun m!251103 () Bool)

(assert (=> b!229619 m!251103))

(declare-fun m!251105 () Bool)

(assert (=> b!229619 m!251105))

(declare-fun m!251107 () Bool)

(assert (=> b!229619 m!251107))

(declare-fun m!251109 () Bool)

(assert (=> b!229619 m!251109))

(declare-fun m!251111 () Bool)

(assert (=> b!229619 m!251111))

(declare-fun m!251113 () Bool)

(assert (=> b!229619 m!251113))

(declare-fun m!251115 () Bool)

(assert (=> b!229626 m!251115))

(assert (=> bm!21326 m!251095))

(declare-fun m!251117 () Bool)

(assert (=> b!229615 m!251117))

(declare-fun m!251119 () Bool)

(assert (=> b!229617 m!251119))

(declare-fun m!251121 () Bool)

(assert (=> b!229624 m!251121))

(declare-fun m!251123 () Bool)

(assert (=> b!229624 m!251123))

(assert (=> b!229624 m!251123))

(declare-fun m!251125 () Bool)

(assert (=> b!229624 m!251125))

(declare-fun m!251127 () Bool)

(assert (=> b!229621 m!251127))

(declare-fun m!251129 () Bool)

(assert (=> b!229623 m!251129))

(check-sat (not bm!21326) (not b_next!6165) (not b!229629) (not b!229612) tp_is_empty!6027 (not b!229616) (not b!229621) (not b!229611) (not mapNonEmpty!10210) (not b!229617) (not b!229619) (not start!22098) (not b!229624) (not bm!21327) b_and!13063 (not b!229615))
(check-sat b_and!13063 (not b_next!6165))
