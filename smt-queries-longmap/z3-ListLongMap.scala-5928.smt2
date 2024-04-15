; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77210 () Bool)

(assert start!77210)

(declare-fun b!900868 () Bool)

(declare-fun b_free!16069 () Bool)

(declare-fun b_next!16069 () Bool)

(assert (=> b!900868 (= b_free!16069 (not b_next!16069))))

(declare-fun tp!56305 () Bool)

(declare-fun b_and!26369 () Bool)

(assert (=> b!900868 (= tp!56305 b_and!26369)))

(declare-fun mapNonEmpty!29278 () Bool)

(declare-fun mapRes!29278 () Bool)

(declare-fun tp!56304 () Bool)

(declare-fun e!504287 () Bool)

(assert (=> mapNonEmpty!29278 (= mapRes!29278 (and tp!56304 e!504287))))

(declare-datatypes ((V!29495 0))(
  ( (V!29496 (val!9249 Int)) )
))
(declare-datatypes ((ValueCell!8717 0))(
  ( (ValueCellFull!8717 (v!11745 V!29495)) (EmptyCell!8717) )
))
(declare-fun mapRest!29278 () (Array (_ BitVec 32) ValueCell!8717))

(declare-datatypes ((array!52831 0))(
  ( (array!52832 (arr!25385 (Array (_ BitVec 32) (_ BitVec 64))) (size!25846 (_ BitVec 32))) )
))
(declare-datatypes ((array!52833 0))(
  ( (array!52834 (arr!25386 (Array (_ BitVec 32) ValueCell!8717)) (size!25847 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4450 0))(
  ( (LongMapFixedSize!4451 (defaultEntry!5463 Int) (mask!26259 (_ BitVec 32)) (extraKeys!5191 (_ BitVec 32)) (zeroValue!5295 V!29495) (minValue!5295 V!29495) (_size!2280 (_ BitVec 32)) (_keys!10268 array!52831) (_values!5482 array!52833) (_vacant!2280 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4450)

(declare-fun mapValue!29278 () ValueCell!8717)

(declare-fun mapKey!29278 () (_ BitVec 32))

(assert (=> mapNonEmpty!29278 (= (arr!25386 (_values!5482 thiss!1181)) (store mapRest!29278 mapKey!29278 mapValue!29278))))

(declare-fun b!900863 () Bool)

(declare-fun e!504288 () Bool)

(declare-fun e!504289 () Bool)

(assert (=> b!900863 (= e!504288 e!504289)))

(declare-fun res!608343 () Bool)

(assert (=> b!900863 (=> res!608343 e!504289)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900863 (= res!608343 (not (validMask!0 (mask!26259 thiss!1181))))))

(declare-datatypes ((tuple2!12092 0))(
  ( (tuple2!12093 (_1!6057 (_ BitVec 64)) (_2!6057 V!29495)) )
))
(declare-datatypes ((List!17880 0))(
  ( (Nil!17877) (Cons!17876 (h!19022 tuple2!12092) (t!25228 List!17880)) )
))
(declare-datatypes ((ListLongMap!10779 0))(
  ( (ListLongMap!10780 (toList!5405 List!17880)) )
))
(declare-fun lt!407003 () ListLongMap!10779)

(declare-datatypes ((SeekEntryResult!8947 0))(
  ( (MissingZero!8947 (index!38159 (_ BitVec 32))) (Found!8947 (index!38160 (_ BitVec 32))) (Intermediate!8947 (undefined!9759 Bool) (index!38161 (_ BitVec 32)) (x!76773 (_ BitVec 32))) (Undefined!8947) (MissingVacant!8947 (index!38162 (_ BitVec 32))) )
))
(declare-fun lt!407002 () SeekEntryResult!8947)

(declare-fun contains!4410 (ListLongMap!10779 (_ BitVec 64)) Bool)

(assert (=> b!900863 (contains!4410 lt!407003 (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002)))))

(declare-fun getCurrentListMap!2623 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) ListLongMap!10779)

(assert (=> b!900863 (= lt!407003 (getCurrentListMap!2623 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-datatypes ((Unit!30549 0))(
  ( (Unit!30550) )
))
(declare-fun lt!407001 () Unit!30549)

(declare-fun lemmaValidKeyInArrayIsInListMap!259 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) Unit!30549)

(assert (=> b!900863 (= lt!407001 (lemmaValidKeyInArrayIsInListMap!259 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!38160 lt!407002) (defaultEntry!5463 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900863 (arrayContainsKey!0 (_keys!10268 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407000 () Unit!30549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52831 (_ BitVec 64) (_ BitVec 32)) Unit!30549)

(assert (=> b!900863 (= lt!407000 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10268 thiss!1181) key!785 (index!38160 lt!407002)))))

(declare-fun b!900864 () Bool)

(declare-fun e!504285 () Bool)

(declare-fun tp_is_empty!18397 () Bool)

(assert (=> b!900864 (= e!504285 tp_is_empty!18397)))

(declare-fun b!900865 () Bool)

(assert (=> b!900865 (= e!504287 tp_is_empty!18397)))

(declare-fun b!900866 () Bool)

(declare-fun e!504286 () Bool)

(assert (=> b!900866 (= e!504286 (not e!504288))))

(declare-fun res!608341 () Bool)

(assert (=> b!900866 (=> res!608341 e!504288)))

(get-info :version)

(assert (=> b!900866 (= res!608341 (not ((_ is Found!8947) lt!407002)))))

(declare-fun e!504291 () Bool)

(assert (=> b!900866 e!504291))

(declare-fun res!608348 () Bool)

(assert (=> b!900866 (=> res!608348 e!504291)))

(assert (=> b!900866 (= res!608348 (not ((_ is Found!8947) lt!407002)))))

(declare-fun lt!406999 () Unit!30549)

(declare-fun lemmaSeekEntryGivesInRangeIndex!110 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 64)) Unit!30549)

(assert (=> b!900866 (= lt!406999 (lemmaSeekEntryGivesInRangeIndex!110 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52831 (_ BitVec 32)) SeekEntryResult!8947)

(assert (=> b!900866 (= lt!407002 (seekEntry!0 key!785 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(declare-fun b!900867 () Bool)

(declare-fun res!608345 () Bool)

(assert (=> b!900867 (=> res!608345 e!504289)))

(assert (=> b!900867 (= res!608345 (not (contains!4410 lt!407003 key!785)))))

(declare-fun res!608349 () Bool)

(assert (=> start!77210 (=> (not res!608349) (not e!504286))))

(declare-fun valid!1717 (LongMapFixedSize!4450) Bool)

(assert (=> start!77210 (= res!608349 (valid!1717 thiss!1181))))

(assert (=> start!77210 e!504286))

(declare-fun e!504290 () Bool)

(assert (=> start!77210 e!504290))

(assert (=> start!77210 true))

(declare-fun e!504292 () Bool)

(declare-fun array_inv!19964 (array!52831) Bool)

(declare-fun array_inv!19965 (array!52833) Bool)

(assert (=> b!900868 (= e!504290 (and tp!56305 tp_is_empty!18397 (array_inv!19964 (_keys!10268 thiss!1181)) (array_inv!19965 (_values!5482 thiss!1181)) e!504292))))

(declare-fun b!900869 () Bool)

(declare-fun res!608344 () Bool)

(assert (=> b!900869 (=> res!608344 e!504289)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52831 (_ BitVec 32)) Bool)

(assert (=> b!900869 (= res!608344 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10268 thiss!1181) (mask!26259 thiss!1181))))))

(declare-fun b!900870 () Bool)

(declare-fun res!608346 () Bool)

(assert (=> b!900870 (=> (not res!608346) (not e!504286))))

(assert (=> b!900870 (= res!608346 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29278 () Bool)

(assert (=> mapIsEmpty!29278 mapRes!29278))

(declare-fun b!900871 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900871 (= e!504291 (inRange!0 (index!38160 lt!407002) (mask!26259 thiss!1181)))))

(declare-fun b!900872 () Bool)

(assert (=> b!900872 (= e!504289 (= (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002)) key!785))))

(declare-fun b!900873 () Bool)

(assert (=> b!900873 (= e!504292 (and e!504285 mapRes!29278))))

(declare-fun condMapEmpty!29278 () Bool)

(declare-fun mapDefault!29278 () ValueCell!8717)

(assert (=> b!900873 (= condMapEmpty!29278 (= (arr!25386 (_values!5482 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8717)) mapDefault!29278)))))

(declare-fun b!900874 () Bool)

(declare-fun res!608342 () Bool)

(assert (=> b!900874 (=> res!608342 e!504289)))

(declare-datatypes ((List!17881 0))(
  ( (Nil!17878) (Cons!17877 (h!19023 (_ BitVec 64)) (t!25229 List!17881)) )
))
(declare-fun arrayNoDuplicates!0 (array!52831 (_ BitVec 32) List!17881) Bool)

(assert (=> b!900874 (= res!608342 (not (arrayNoDuplicates!0 (_keys!10268 thiss!1181) #b00000000000000000000000000000000 Nil!17878)))))

(declare-fun b!900875 () Bool)

(declare-fun res!608347 () Bool)

(assert (=> b!900875 (=> res!608347 e!504289)))

(assert (=> b!900875 (= res!608347 (not (inRange!0 (index!38160 lt!407002) (mask!26259 thiss!1181))))))

(declare-fun b!900876 () Bool)

(declare-fun res!608340 () Bool)

(assert (=> b!900876 (=> res!608340 e!504289)))

(assert (=> b!900876 (= res!608340 (or (not (= (size!25847 (_values!5482 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26259 thiss!1181)))) (not (= (size!25846 (_keys!10268 thiss!1181)) (size!25847 (_values!5482 thiss!1181)))) (bvslt (mask!26259 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5191 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5191 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!77210 res!608349) b!900870))

(assert (= (and b!900870 res!608346) b!900866))

(assert (= (and b!900866 (not res!608348)) b!900871))

(assert (= (and b!900866 (not res!608341)) b!900863))

(assert (= (and b!900863 (not res!608343)) b!900876))

(assert (= (and b!900876 (not res!608340)) b!900869))

(assert (= (and b!900869 (not res!608344)) b!900874))

(assert (= (and b!900874 (not res!608342)) b!900867))

(assert (= (and b!900867 (not res!608345)) b!900875))

(assert (= (and b!900875 (not res!608347)) b!900872))

(assert (= (and b!900873 condMapEmpty!29278) mapIsEmpty!29278))

(assert (= (and b!900873 (not condMapEmpty!29278)) mapNonEmpty!29278))

(assert (= (and mapNonEmpty!29278 ((_ is ValueCellFull!8717) mapValue!29278)) b!900865))

(assert (= (and b!900873 ((_ is ValueCellFull!8717) mapDefault!29278)) b!900864))

(assert (= b!900868 b!900873))

(assert (= start!77210 b!900868))

(declare-fun m!836677 () Bool)

(assert (=> mapNonEmpty!29278 m!836677))

(declare-fun m!836679 () Bool)

(assert (=> b!900874 m!836679))

(declare-fun m!836681 () Bool)

(assert (=> b!900867 m!836681))

(declare-fun m!836683 () Bool)

(assert (=> b!900871 m!836683))

(assert (=> b!900875 m!836683))

(declare-fun m!836685 () Bool)

(assert (=> b!900868 m!836685))

(declare-fun m!836687 () Bool)

(assert (=> b!900868 m!836687))

(declare-fun m!836689 () Bool)

(assert (=> b!900866 m!836689))

(declare-fun m!836691 () Bool)

(assert (=> b!900866 m!836691))

(declare-fun m!836693 () Bool)

(assert (=> b!900872 m!836693))

(declare-fun m!836695 () Bool)

(assert (=> b!900869 m!836695))

(declare-fun m!836697 () Bool)

(assert (=> b!900863 m!836697))

(declare-fun m!836699 () Bool)

(assert (=> b!900863 m!836699))

(declare-fun m!836701 () Bool)

(assert (=> b!900863 m!836701))

(assert (=> b!900863 m!836693))

(declare-fun m!836703 () Bool)

(assert (=> b!900863 m!836703))

(declare-fun m!836705 () Bool)

(assert (=> b!900863 m!836705))

(assert (=> b!900863 m!836693))

(declare-fun m!836707 () Bool)

(assert (=> b!900863 m!836707))

(declare-fun m!836709 () Bool)

(assert (=> start!77210 m!836709))

(check-sat (not mapNonEmpty!29278) (not b_next!16069) (not b!900863) (not b!900866) (not start!77210) tp_is_empty!18397 b_and!26369 (not b!900874) (not b!900867) (not b!900869) (not b!900871) (not b!900868) (not b!900875))
(check-sat b_and!26369 (not b_next!16069))
(get-model)

(declare-fun d!111599 () Bool)

(declare-fun e!504352 () Bool)

(assert (=> d!111599 e!504352))

(declare-fun res!608412 () Bool)

(assert (=> d!111599 (=> res!608412 e!504352)))

(declare-fun lt!407045 () Bool)

(assert (=> d!111599 (= res!608412 (not lt!407045))))

(declare-fun lt!407044 () Bool)

(assert (=> d!111599 (= lt!407045 lt!407044)))

(declare-fun lt!407043 () Unit!30549)

(declare-fun e!504351 () Unit!30549)

(assert (=> d!111599 (= lt!407043 e!504351)))

(declare-fun c!95357 () Bool)

(assert (=> d!111599 (= c!95357 lt!407044)))

(declare-fun containsKey!433 (List!17880 (_ BitVec 64)) Bool)

(assert (=> d!111599 (= lt!407044 (containsKey!433 (toList!5405 lt!407003) key!785))))

(assert (=> d!111599 (= (contains!4410 lt!407003 key!785) lt!407045)))

(declare-fun b!900967 () Bool)

(declare-fun lt!407042 () Unit!30549)

(assert (=> b!900967 (= e!504351 lt!407042)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!328 (List!17880 (_ BitVec 64)) Unit!30549)

(assert (=> b!900967 (= lt!407042 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5405 lt!407003) key!785))))

(declare-datatypes ((Option!471 0))(
  ( (Some!470 (v!11748 V!29495)) (None!469) )
))
(declare-fun isDefined!341 (Option!471) Bool)

(declare-fun getValueByKey!465 (List!17880 (_ BitVec 64)) Option!471)

(assert (=> b!900967 (isDefined!341 (getValueByKey!465 (toList!5405 lt!407003) key!785))))

(declare-fun b!900968 () Bool)

(declare-fun Unit!30553 () Unit!30549)

(assert (=> b!900968 (= e!504351 Unit!30553)))

(declare-fun b!900969 () Bool)

(assert (=> b!900969 (= e!504352 (isDefined!341 (getValueByKey!465 (toList!5405 lt!407003) key!785)))))

(assert (= (and d!111599 c!95357) b!900967))

(assert (= (and d!111599 (not c!95357)) b!900968))

(assert (= (and d!111599 (not res!608412)) b!900969))

(declare-fun m!836779 () Bool)

(assert (=> d!111599 m!836779))

(declare-fun m!836781 () Bool)

(assert (=> b!900967 m!836781))

(declare-fun m!836783 () Bool)

(assert (=> b!900967 m!836783))

(assert (=> b!900967 m!836783))

(declare-fun m!836785 () Bool)

(assert (=> b!900967 m!836785))

(assert (=> b!900969 m!836783))

(assert (=> b!900969 m!836783))

(assert (=> b!900969 m!836785))

(assert (=> b!900867 d!111599))

(declare-fun d!111601 () Bool)

(assert (=> d!111601 (= (inRange!0 (index!38160 lt!407002) (mask!26259 thiss!1181)) (and (bvsge (index!38160 lt!407002) #b00000000000000000000000000000000) (bvslt (index!38160 lt!407002) (bvadd (mask!26259 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900871 d!111601))

(declare-fun d!111603 () Bool)

(declare-fun e!504354 () Bool)

(assert (=> d!111603 e!504354))

(declare-fun res!608413 () Bool)

(assert (=> d!111603 (=> res!608413 e!504354)))

(declare-fun lt!407049 () Bool)

(assert (=> d!111603 (= res!608413 (not lt!407049))))

(declare-fun lt!407048 () Bool)

(assert (=> d!111603 (= lt!407049 lt!407048)))

(declare-fun lt!407047 () Unit!30549)

(declare-fun e!504353 () Unit!30549)

(assert (=> d!111603 (= lt!407047 e!504353)))

(declare-fun c!95358 () Bool)

(assert (=> d!111603 (= c!95358 lt!407048)))

(assert (=> d!111603 (= lt!407048 (containsKey!433 (toList!5405 lt!407003) (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002))))))

(assert (=> d!111603 (= (contains!4410 lt!407003 (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002))) lt!407049)))

(declare-fun b!900970 () Bool)

(declare-fun lt!407046 () Unit!30549)

(assert (=> b!900970 (= e!504353 lt!407046)))

(assert (=> b!900970 (= lt!407046 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5405 lt!407003) (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002))))))

(assert (=> b!900970 (isDefined!341 (getValueByKey!465 (toList!5405 lt!407003) (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002))))))

(declare-fun b!900971 () Bool)

(declare-fun Unit!30554 () Unit!30549)

(assert (=> b!900971 (= e!504353 Unit!30554)))

(declare-fun b!900972 () Bool)

(assert (=> b!900972 (= e!504354 (isDefined!341 (getValueByKey!465 (toList!5405 lt!407003) (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002)))))))

(assert (= (and d!111603 c!95358) b!900970))

(assert (= (and d!111603 (not c!95358)) b!900971))

(assert (= (and d!111603 (not res!608413)) b!900972))

(assert (=> d!111603 m!836693))

(declare-fun m!836787 () Bool)

(assert (=> d!111603 m!836787))

(assert (=> b!900970 m!836693))

(declare-fun m!836789 () Bool)

(assert (=> b!900970 m!836789))

(assert (=> b!900970 m!836693))

(declare-fun m!836791 () Bool)

(assert (=> b!900970 m!836791))

(assert (=> b!900970 m!836791))

(declare-fun m!836793 () Bool)

(assert (=> b!900970 m!836793))

(assert (=> b!900972 m!836693))

(assert (=> b!900972 m!836791))

(assert (=> b!900972 m!836791))

(assert (=> b!900972 m!836793))

(assert (=> b!900863 d!111603))

(declare-fun d!111605 () Bool)

(assert (=> d!111605 (= (validMask!0 (mask!26259 thiss!1181)) (and (or (= (mask!26259 thiss!1181) #b00000000000000000000000000000111) (= (mask!26259 thiss!1181) #b00000000000000000000000000001111) (= (mask!26259 thiss!1181) #b00000000000000000000000000011111) (= (mask!26259 thiss!1181) #b00000000000000000000000000111111) (= (mask!26259 thiss!1181) #b00000000000000000000000001111111) (= (mask!26259 thiss!1181) #b00000000000000000000000011111111) (= (mask!26259 thiss!1181) #b00000000000000000000000111111111) (= (mask!26259 thiss!1181) #b00000000000000000000001111111111) (= (mask!26259 thiss!1181) #b00000000000000000000011111111111) (= (mask!26259 thiss!1181) #b00000000000000000000111111111111) (= (mask!26259 thiss!1181) #b00000000000000000001111111111111) (= (mask!26259 thiss!1181) #b00000000000000000011111111111111) (= (mask!26259 thiss!1181) #b00000000000000000111111111111111) (= (mask!26259 thiss!1181) #b00000000000000001111111111111111) (= (mask!26259 thiss!1181) #b00000000000000011111111111111111) (= (mask!26259 thiss!1181) #b00000000000000111111111111111111) (= (mask!26259 thiss!1181) #b00000000000001111111111111111111) (= (mask!26259 thiss!1181) #b00000000000011111111111111111111) (= (mask!26259 thiss!1181) #b00000000000111111111111111111111) (= (mask!26259 thiss!1181) #b00000000001111111111111111111111) (= (mask!26259 thiss!1181) #b00000000011111111111111111111111) (= (mask!26259 thiss!1181) #b00000000111111111111111111111111) (= (mask!26259 thiss!1181) #b00000001111111111111111111111111) (= (mask!26259 thiss!1181) #b00000011111111111111111111111111) (= (mask!26259 thiss!1181) #b00000111111111111111111111111111) (= (mask!26259 thiss!1181) #b00001111111111111111111111111111) (= (mask!26259 thiss!1181) #b00011111111111111111111111111111) (= (mask!26259 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26259 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900863 d!111605))

(declare-fun d!111607 () Bool)

(assert (=> d!111607 (arrayContainsKey!0 (_keys!10268 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407052 () Unit!30549)

(declare-fun choose!13 (array!52831 (_ BitVec 64) (_ BitVec 32)) Unit!30549)

(assert (=> d!111607 (= lt!407052 (choose!13 (_keys!10268 thiss!1181) key!785 (index!38160 lt!407002)))))

(assert (=> d!111607 (bvsge (index!38160 lt!407002) #b00000000000000000000000000000000)))

(assert (=> d!111607 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10268 thiss!1181) key!785 (index!38160 lt!407002)) lt!407052)))

(declare-fun bs!25268 () Bool)

(assert (= bs!25268 d!111607))

(assert (=> bs!25268 m!836697))

(declare-fun m!836795 () Bool)

(assert (=> bs!25268 m!836795))

(assert (=> b!900863 d!111607))

(declare-fun d!111609 () Bool)

(declare-fun res!608418 () Bool)

(declare-fun e!504359 () Bool)

(assert (=> d!111609 (=> res!608418 e!504359)))

(assert (=> d!111609 (= res!608418 (= (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111609 (= (arrayContainsKey!0 (_keys!10268 thiss!1181) key!785 #b00000000000000000000000000000000) e!504359)))

(declare-fun b!900977 () Bool)

(declare-fun e!504360 () Bool)

(assert (=> b!900977 (= e!504359 e!504360)))

(declare-fun res!608419 () Bool)

(assert (=> b!900977 (=> (not res!608419) (not e!504360))))

(assert (=> b!900977 (= res!608419 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25846 (_keys!10268 thiss!1181))))))

(declare-fun b!900978 () Bool)

(assert (=> b!900978 (= e!504360 (arrayContainsKey!0 (_keys!10268 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111609 (not res!608418)) b!900977))

(assert (= (and b!900977 res!608419) b!900978))

(declare-fun m!836797 () Bool)

(assert (=> d!111609 m!836797))

(declare-fun m!836799 () Bool)

(assert (=> b!900978 m!836799))

(assert (=> b!900863 d!111609))

(declare-fun d!111611 () Bool)

(declare-fun e!504363 () Bool)

(assert (=> d!111611 e!504363))

(declare-fun res!608422 () Bool)

(assert (=> d!111611 (=> (not res!608422) (not e!504363))))

(assert (=> d!111611 (= res!608422 (and (bvsge (index!38160 lt!407002) #b00000000000000000000000000000000) (bvslt (index!38160 lt!407002) (size!25846 (_keys!10268 thiss!1181)))))))

(declare-fun lt!407055 () Unit!30549)

(declare-fun choose!1527 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) Unit!30549)

(assert (=> d!111611 (= lt!407055 (choose!1527 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!38160 lt!407002) (defaultEntry!5463 thiss!1181)))))

(assert (=> d!111611 (validMask!0 (mask!26259 thiss!1181))))

(assert (=> d!111611 (= (lemmaValidKeyInArrayIsInListMap!259 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) (index!38160 lt!407002) (defaultEntry!5463 thiss!1181)) lt!407055)))

(declare-fun b!900981 () Bool)

(assert (=> b!900981 (= e!504363 (contains!4410 (getCurrentListMap!2623 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)) (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407002))))))

(assert (= (and d!111611 res!608422) b!900981))

(declare-fun m!836801 () Bool)

(assert (=> d!111611 m!836801))

(assert (=> d!111611 m!836699))

(assert (=> b!900981 m!836705))

(assert (=> b!900981 m!836693))

(assert (=> b!900981 m!836705))

(assert (=> b!900981 m!836693))

(declare-fun m!836803 () Bool)

(assert (=> b!900981 m!836803))

(assert (=> b!900863 d!111611))

(declare-fun b!901024 () Bool)

(declare-fun e!504390 () ListLongMap!10779)

(declare-fun e!504391 () ListLongMap!10779)

(assert (=> b!901024 (= e!504390 e!504391)))

(declare-fun c!95373 () Bool)

(assert (=> b!901024 (= c!95373 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901025 () Bool)

(declare-fun e!504399 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901025 (= e!504399 (validKeyInArray!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901026 () Bool)

(declare-fun e!504394 () Bool)

(declare-fun lt!407108 () ListLongMap!10779)

(declare-fun apply!414 (ListLongMap!10779 (_ BitVec 64)) V!29495)

(declare-fun get!13359 (ValueCell!8717 V!29495) V!29495)

(declare-fun dynLambda!1308 (Int (_ BitVec 64)) V!29495)

(assert (=> b!901026 (= e!504394 (= (apply!414 lt!407108 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)) (get!13359 (select (arr!25386 (_values!5482 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1308 (defaultEntry!5463 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25847 (_values!5482 thiss!1181))))))

(assert (=> b!901026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(declare-fun b!901027 () Bool)

(declare-fun e!504395 () Unit!30549)

(declare-fun lt!407116 () Unit!30549)

(assert (=> b!901027 (= e!504395 lt!407116)))

(declare-fun lt!407114 () ListLongMap!10779)

(declare-fun getCurrentListMapNoExtraKeys!3322 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 32) Int) ListLongMap!10779)

(assert (=> b!901027 (= lt!407114 (getCurrentListMapNoExtraKeys!3322 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407100 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407101 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407101 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407111 () Unit!30549)

(declare-fun addStillContains!340 (ListLongMap!10779 (_ BitVec 64) V!29495 (_ BitVec 64)) Unit!30549)

(assert (=> b!901027 (= lt!407111 (addStillContains!340 lt!407114 lt!407100 (zeroValue!5295 thiss!1181) lt!407101))))

(declare-fun +!2625 (ListLongMap!10779 tuple2!12092) ListLongMap!10779)

(assert (=> b!901027 (contains!4410 (+!2625 lt!407114 (tuple2!12093 lt!407100 (zeroValue!5295 thiss!1181))) lt!407101)))

(declare-fun lt!407109 () Unit!30549)

(assert (=> b!901027 (= lt!407109 lt!407111)))

(declare-fun lt!407102 () ListLongMap!10779)

(assert (=> b!901027 (= lt!407102 (getCurrentListMapNoExtraKeys!3322 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407117 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407110 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407110 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407112 () Unit!30549)

(declare-fun addApplyDifferent!340 (ListLongMap!10779 (_ BitVec 64) V!29495 (_ BitVec 64)) Unit!30549)

(assert (=> b!901027 (= lt!407112 (addApplyDifferent!340 lt!407102 lt!407117 (minValue!5295 thiss!1181) lt!407110))))

(assert (=> b!901027 (= (apply!414 (+!2625 lt!407102 (tuple2!12093 lt!407117 (minValue!5295 thiss!1181))) lt!407110) (apply!414 lt!407102 lt!407110))))

(declare-fun lt!407105 () Unit!30549)

(assert (=> b!901027 (= lt!407105 lt!407112)))

(declare-fun lt!407104 () ListLongMap!10779)

(assert (=> b!901027 (= lt!407104 (getCurrentListMapNoExtraKeys!3322 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407121 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407113 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407113 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407118 () Unit!30549)

(assert (=> b!901027 (= lt!407118 (addApplyDifferent!340 lt!407104 lt!407121 (zeroValue!5295 thiss!1181) lt!407113))))

(assert (=> b!901027 (= (apply!414 (+!2625 lt!407104 (tuple2!12093 lt!407121 (zeroValue!5295 thiss!1181))) lt!407113) (apply!414 lt!407104 lt!407113))))

(declare-fun lt!407120 () Unit!30549)

(assert (=> b!901027 (= lt!407120 lt!407118)))

(declare-fun lt!407107 () ListLongMap!10779)

(assert (=> b!901027 (= lt!407107 (getCurrentListMapNoExtraKeys!3322 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun lt!407103 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407103 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407115 () (_ BitVec 64))

(assert (=> b!901027 (= lt!407115 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901027 (= lt!407116 (addApplyDifferent!340 lt!407107 lt!407103 (minValue!5295 thiss!1181) lt!407115))))

(assert (=> b!901027 (= (apply!414 (+!2625 lt!407107 (tuple2!12093 lt!407103 (minValue!5295 thiss!1181))) lt!407115) (apply!414 lt!407107 lt!407115))))

(declare-fun b!901028 () Bool)

(declare-fun e!504396 () Bool)

(declare-fun call!40079 () Bool)

(assert (=> b!901028 (= e!504396 (not call!40079))))

(declare-fun b!901029 () Bool)

(declare-fun e!504392 () ListLongMap!10779)

(declare-fun call!40076 () ListLongMap!10779)

(assert (=> b!901029 (= e!504392 call!40076)))

(declare-fun b!901030 () Bool)

(assert (=> b!901030 (= e!504391 call!40076)))

(declare-fun b!901031 () Bool)

(declare-fun e!504400 () Bool)

(assert (=> b!901031 (= e!504400 (= (apply!414 lt!407108 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5295 thiss!1181)))))

(declare-fun bm!40073 () Bool)

(declare-fun call!40082 () ListLongMap!10779)

(declare-fun call!40078 () ListLongMap!10779)

(assert (=> bm!40073 (= call!40082 call!40078)))

(declare-fun d!111613 () Bool)

(declare-fun e!504401 () Bool)

(assert (=> d!111613 e!504401))

(declare-fun res!608449 () Bool)

(assert (=> d!111613 (=> (not res!608449) (not e!504401))))

(assert (=> d!111613 (= res!608449 (or (bvsge #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))))

(declare-fun lt!407119 () ListLongMap!10779)

(assert (=> d!111613 (= lt!407108 lt!407119)))

(declare-fun lt!407106 () Unit!30549)

(assert (=> d!111613 (= lt!407106 e!504395)))

(declare-fun c!95372 () Bool)

(declare-fun e!504393 () Bool)

(assert (=> d!111613 (= c!95372 e!504393)))

(declare-fun res!608443 () Bool)

(assert (=> d!111613 (=> (not res!608443) (not e!504393))))

(assert (=> d!111613 (= res!608443 (bvslt #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(assert (=> d!111613 (= lt!407119 e!504390)))

(declare-fun c!95376 () Bool)

(assert (=> d!111613 (= c!95376 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111613 (validMask!0 (mask!26259 thiss!1181))))

(assert (=> d!111613 (= (getCurrentListMap!2623 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)) lt!407108)))

(declare-fun b!901032 () Bool)

(declare-fun e!504398 () Bool)

(assert (=> b!901032 (= e!504398 (= (apply!414 lt!407108 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5295 thiss!1181)))))

(declare-fun b!901033 () Bool)

(assert (=> b!901033 (= e!504393 (validKeyInArray!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40074 () Bool)

(declare-fun call!40077 () ListLongMap!10779)

(assert (=> bm!40074 (= call!40078 call!40077)))

(declare-fun b!901034 () Bool)

(assert (=> b!901034 (= e!504401 e!504396)))

(declare-fun c!95371 () Bool)

(assert (=> b!901034 (= c!95371 (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901035 () Bool)

(declare-fun call!40081 () ListLongMap!10779)

(assert (=> b!901035 (= e!504390 (+!2625 call!40081 (tuple2!12093 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5295 thiss!1181))))))

(declare-fun b!901036 () Bool)

(declare-fun e!504402 () Bool)

(assert (=> b!901036 (= e!504402 e!504400)))

(declare-fun res!608444 () Bool)

(declare-fun call!40080 () Bool)

(assert (=> b!901036 (= res!608444 call!40080)))

(assert (=> b!901036 (=> (not res!608444) (not e!504400))))

(declare-fun bm!40075 () Bool)

(assert (=> bm!40075 (= call!40080 (contains!4410 lt!407108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901037 () Bool)

(declare-fun res!608442 () Bool)

(assert (=> b!901037 (=> (not res!608442) (not e!504401))))

(assert (=> b!901037 (= res!608442 e!504402)))

(declare-fun c!95375 () Bool)

(assert (=> b!901037 (= c!95375 (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901038 () Bool)

(assert (=> b!901038 (= e!504396 e!504398)))

(declare-fun res!608446 () Bool)

(assert (=> b!901038 (= res!608446 call!40079)))

(assert (=> b!901038 (=> (not res!608446) (not e!504398))))

(declare-fun b!901039 () Bool)

(declare-fun e!504397 () Bool)

(assert (=> b!901039 (= e!504397 e!504394)))

(declare-fun res!608447 () Bool)

(assert (=> b!901039 (=> (not res!608447) (not e!504394))))

(assert (=> b!901039 (= res!608447 (contains!4410 lt!407108 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(declare-fun b!901040 () Bool)

(assert (=> b!901040 (= e!504402 (not call!40080))))

(declare-fun b!901041 () Bool)

(declare-fun Unit!30555 () Unit!30549)

(assert (=> b!901041 (= e!504395 Unit!30555)))

(declare-fun bm!40076 () Bool)

(assert (=> bm!40076 (= call!40076 call!40081)))

(declare-fun b!901042 () Bool)

(declare-fun res!608441 () Bool)

(assert (=> b!901042 (=> (not res!608441) (not e!504401))))

(assert (=> b!901042 (= res!608441 e!504397)))

(declare-fun res!608448 () Bool)

(assert (=> b!901042 (=> res!608448 e!504397)))

(assert (=> b!901042 (= res!608448 (not e!504399))))

(declare-fun res!608445 () Bool)

(assert (=> b!901042 (=> (not res!608445) (not e!504399))))

(assert (=> b!901042 (= res!608445 (bvslt #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(declare-fun bm!40077 () Bool)

(assert (=> bm!40077 (= call!40077 (getCurrentListMapNoExtraKeys!3322 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5463 thiss!1181)))))

(declare-fun bm!40078 () Bool)

(assert (=> bm!40078 (= call!40079 (contains!4410 lt!407108 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901043 () Bool)

(declare-fun c!95374 () Bool)

(assert (=> b!901043 (= c!95374 (and (not (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5191 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901043 (= e!504391 e!504392)))

(declare-fun b!901044 () Bool)

(assert (=> b!901044 (= e!504392 call!40082)))

(declare-fun bm!40079 () Bool)

(assert (=> bm!40079 (= call!40081 (+!2625 (ite c!95376 call!40077 (ite c!95373 call!40078 call!40082)) (ite (or c!95376 c!95373) (tuple2!12093 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5295 thiss!1181)) (tuple2!12093 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5295 thiss!1181)))))))

(assert (= (and d!111613 c!95376) b!901035))

(assert (= (and d!111613 (not c!95376)) b!901024))

(assert (= (and b!901024 c!95373) b!901030))

(assert (= (and b!901024 (not c!95373)) b!901043))

(assert (= (and b!901043 c!95374) b!901029))

(assert (= (and b!901043 (not c!95374)) b!901044))

(assert (= (or b!901029 b!901044) bm!40073))

(assert (= (or b!901030 bm!40073) bm!40074))

(assert (= (or b!901030 b!901029) bm!40076))

(assert (= (or b!901035 bm!40074) bm!40077))

(assert (= (or b!901035 bm!40076) bm!40079))

(assert (= (and d!111613 res!608443) b!901033))

(assert (= (and d!111613 c!95372) b!901027))

(assert (= (and d!111613 (not c!95372)) b!901041))

(assert (= (and d!111613 res!608449) b!901042))

(assert (= (and b!901042 res!608445) b!901025))

(assert (= (and b!901042 (not res!608448)) b!901039))

(assert (= (and b!901039 res!608447) b!901026))

(assert (= (and b!901042 res!608441) b!901037))

(assert (= (and b!901037 c!95375) b!901036))

(assert (= (and b!901037 (not c!95375)) b!901040))

(assert (= (and b!901036 res!608444) b!901031))

(assert (= (or b!901036 b!901040) bm!40075))

(assert (= (and b!901037 res!608442) b!901034))

(assert (= (and b!901034 c!95371) b!901038))

(assert (= (and b!901034 (not c!95371)) b!901028))

(assert (= (and b!901038 res!608446) b!901032))

(assert (= (or b!901038 b!901028) bm!40078))

(declare-fun b_lambda!13009 () Bool)

(assert (=> (not b_lambda!13009) (not b!901026)))

(declare-fun t!25234 () Bool)

(declare-fun tb!5201 () Bool)

(assert (=> (and b!900868 (= (defaultEntry!5463 thiss!1181) (defaultEntry!5463 thiss!1181)) t!25234) tb!5201))

(declare-fun result!10191 () Bool)

(assert (=> tb!5201 (= result!10191 tp_is_empty!18397)))

(assert (=> b!901026 t!25234))

(declare-fun b_and!26375 () Bool)

(assert (= b_and!26369 (and (=> t!25234 result!10191) b_and!26375)))

(assert (=> d!111613 m!836699))

(assert (=> b!901039 m!836797))

(assert (=> b!901039 m!836797))

(declare-fun m!836805 () Bool)

(assert (=> b!901039 m!836805))

(declare-fun m!836807 () Bool)

(assert (=> b!901031 m!836807))

(declare-fun m!836809 () Bool)

(assert (=> bm!40075 m!836809))

(declare-fun m!836811 () Bool)

(assert (=> bm!40077 m!836811))

(declare-fun m!836813 () Bool)

(assert (=> b!901035 m!836813))

(declare-fun m!836815 () Bool)

(assert (=> bm!40078 m!836815))

(declare-fun m!836817 () Bool)

(assert (=> b!901032 m!836817))

(assert (=> b!901033 m!836797))

(assert (=> b!901033 m!836797))

(declare-fun m!836819 () Bool)

(assert (=> b!901033 m!836819))

(declare-fun m!836821 () Bool)

(assert (=> b!901026 m!836821))

(declare-fun m!836823 () Bool)

(assert (=> b!901026 m!836823))

(assert (=> b!901026 m!836821))

(assert (=> b!901026 m!836823))

(declare-fun m!836825 () Bool)

(assert (=> b!901026 m!836825))

(assert (=> b!901026 m!836797))

(assert (=> b!901026 m!836797))

(declare-fun m!836827 () Bool)

(assert (=> b!901026 m!836827))

(declare-fun m!836829 () Bool)

(assert (=> bm!40079 m!836829))

(declare-fun m!836831 () Bool)

(assert (=> b!901027 m!836831))

(declare-fun m!836833 () Bool)

(assert (=> b!901027 m!836833))

(assert (=> b!901027 m!836811))

(declare-fun m!836835 () Bool)

(assert (=> b!901027 m!836835))

(declare-fun m!836837 () Bool)

(assert (=> b!901027 m!836837))

(declare-fun m!836839 () Bool)

(assert (=> b!901027 m!836839))

(assert (=> b!901027 m!836839))

(declare-fun m!836841 () Bool)

(assert (=> b!901027 m!836841))

(declare-fun m!836843 () Bool)

(assert (=> b!901027 m!836843))

(declare-fun m!836845 () Bool)

(assert (=> b!901027 m!836845))

(declare-fun m!836847 () Bool)

(assert (=> b!901027 m!836847))

(assert (=> b!901027 m!836843))

(assert (=> b!901027 m!836797))

(declare-fun m!836849 () Bool)

(assert (=> b!901027 m!836849))

(declare-fun m!836851 () Bool)

(assert (=> b!901027 m!836851))

(declare-fun m!836853 () Bool)

(assert (=> b!901027 m!836853))

(assert (=> b!901027 m!836835))

(declare-fun m!836855 () Bool)

(assert (=> b!901027 m!836855))

(declare-fun m!836857 () Bool)

(assert (=> b!901027 m!836857))

(declare-fun m!836859 () Bool)

(assert (=> b!901027 m!836859))

(assert (=> b!901027 m!836831))

(assert (=> b!901025 m!836797))

(assert (=> b!901025 m!836797))

(assert (=> b!901025 m!836819))

(assert (=> b!900863 d!111613))

(declare-fun d!111615 () Bool)

(assert (=> d!111615 (= (array_inv!19964 (_keys!10268 thiss!1181)) (bvsge (size!25846 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900868 d!111615))

(declare-fun d!111617 () Bool)

(assert (=> d!111617 (= (array_inv!19965 (_values!5482 thiss!1181)) (bvsge (size!25847 (_values!5482 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900868 d!111617))

(declare-fun b!901057 () Bool)

(declare-fun e!504414 () Bool)

(declare-fun contains!4412 (List!17881 (_ BitVec 64)) Bool)

(assert (=> b!901057 (= e!504414 (contains!4412 Nil!17878 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901058 () Bool)

(declare-fun e!504412 () Bool)

(declare-fun call!40085 () Bool)

(assert (=> b!901058 (= e!504412 call!40085)))

(declare-fun b!901059 () Bool)

(assert (=> b!901059 (= e!504412 call!40085)))

(declare-fun b!901060 () Bool)

(declare-fun e!504413 () Bool)

(declare-fun e!504411 () Bool)

(assert (=> b!901060 (= e!504413 e!504411)))

(declare-fun res!608458 () Bool)

(assert (=> b!901060 (=> (not res!608458) (not e!504411))))

(assert (=> b!901060 (= res!608458 (not e!504414))))

(declare-fun res!608457 () Bool)

(assert (=> b!901060 (=> (not res!608457) (not e!504414))))

(assert (=> b!901060 (= res!608457 (validKeyInArray!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901061 () Bool)

(assert (=> b!901061 (= e!504411 e!504412)))

(declare-fun c!95379 () Bool)

(assert (=> b!901061 (= c!95379 (validKeyInArray!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40082 () Bool)

(assert (=> bm!40082 (= call!40085 (arrayNoDuplicates!0 (_keys!10268 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95379 (Cons!17877 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000) Nil!17878) Nil!17878)))))

(declare-fun d!111619 () Bool)

(declare-fun res!608456 () Bool)

(assert (=> d!111619 (=> res!608456 e!504413)))

(assert (=> d!111619 (= res!608456 (bvsge #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(assert (=> d!111619 (= (arrayNoDuplicates!0 (_keys!10268 thiss!1181) #b00000000000000000000000000000000 Nil!17878) e!504413)))

(assert (= (and d!111619 (not res!608456)) b!901060))

(assert (= (and b!901060 res!608457) b!901057))

(assert (= (and b!901060 res!608458) b!901061))

(assert (= (and b!901061 c!95379) b!901059))

(assert (= (and b!901061 (not c!95379)) b!901058))

(assert (= (or b!901059 b!901058) bm!40082))

(assert (=> b!901057 m!836797))

(assert (=> b!901057 m!836797))

(declare-fun m!836861 () Bool)

(assert (=> b!901057 m!836861))

(assert (=> b!901060 m!836797))

(assert (=> b!901060 m!836797))

(assert (=> b!901060 m!836819))

(assert (=> b!901061 m!836797))

(assert (=> b!901061 m!836797))

(assert (=> b!901061 m!836819))

(assert (=> bm!40082 m!836797))

(declare-fun m!836863 () Bool)

(assert (=> bm!40082 m!836863))

(assert (=> b!900874 d!111619))

(declare-fun b!901070 () Bool)

(declare-fun e!504422 () Bool)

(declare-fun e!504421 () Bool)

(assert (=> b!901070 (= e!504422 e!504421)))

(declare-fun lt!407128 () (_ BitVec 64))

(assert (=> b!901070 (= lt!407128 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407130 () Unit!30549)

(assert (=> b!901070 (= lt!407130 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10268 thiss!1181) lt!407128 #b00000000000000000000000000000000))))

(assert (=> b!901070 (arrayContainsKey!0 (_keys!10268 thiss!1181) lt!407128 #b00000000000000000000000000000000)))

(declare-fun lt!407129 () Unit!30549)

(assert (=> b!901070 (= lt!407129 lt!407130)))

(declare-fun res!608464 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52831 (_ BitVec 32)) SeekEntryResult!8947)

(assert (=> b!901070 (= res!608464 (= (seekEntryOrOpen!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000) (_keys!10268 thiss!1181) (mask!26259 thiss!1181)) (Found!8947 #b00000000000000000000000000000000)))))

(assert (=> b!901070 (=> (not res!608464) (not e!504421))))

(declare-fun b!901071 () Bool)

(declare-fun call!40088 () Bool)

(assert (=> b!901071 (= e!504421 call!40088)))

(declare-fun bm!40085 () Bool)

(assert (=> bm!40085 (= call!40088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(declare-fun d!111621 () Bool)

(declare-fun res!608463 () Bool)

(declare-fun e!504423 () Bool)

(assert (=> d!111621 (=> res!608463 e!504423)))

(assert (=> d!111621 (= res!608463 (bvsge #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))))))

(assert (=> d!111621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)) e!504423)))

(declare-fun b!901072 () Bool)

(assert (=> b!901072 (= e!504422 call!40088)))

(declare-fun b!901073 () Bool)

(assert (=> b!901073 (= e!504423 e!504422)))

(declare-fun c!95382 () Bool)

(assert (=> b!901073 (= c!95382 (validKeyInArray!0 (select (arr!25385 (_keys!10268 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111621 (not res!608463)) b!901073))

(assert (= (and b!901073 c!95382) b!901070))

(assert (= (and b!901073 (not c!95382)) b!901072))

(assert (= (and b!901070 res!608464) b!901071))

(assert (= (or b!901071 b!901072) bm!40085))

(assert (=> b!901070 m!836797))

(declare-fun m!836865 () Bool)

(assert (=> b!901070 m!836865))

(declare-fun m!836867 () Bool)

(assert (=> b!901070 m!836867))

(assert (=> b!901070 m!836797))

(declare-fun m!836869 () Bool)

(assert (=> b!901070 m!836869))

(declare-fun m!836871 () Bool)

(assert (=> bm!40085 m!836871))

(assert (=> b!901073 m!836797))

(assert (=> b!901073 m!836797))

(assert (=> b!901073 m!836819))

(assert (=> b!900869 d!111621))

(declare-fun d!111623 () Bool)

(declare-fun e!504426 () Bool)

(assert (=> d!111623 e!504426))

(declare-fun res!608467 () Bool)

(assert (=> d!111623 (=> res!608467 e!504426)))

(declare-fun lt!407136 () SeekEntryResult!8947)

(assert (=> d!111623 (= res!608467 (not ((_ is Found!8947) lt!407136)))))

(assert (=> d!111623 (= lt!407136 (seekEntry!0 key!785 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(declare-fun lt!407135 () Unit!30549)

(declare-fun choose!1528 (array!52831 array!52833 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 64)) Unit!30549)

(assert (=> d!111623 (= lt!407135 (choose!1528 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785))))

(assert (=> d!111623 (validMask!0 (mask!26259 thiss!1181))))

(assert (=> d!111623 (= (lemmaSeekEntryGivesInRangeIndex!110 (_keys!10268 thiss!1181) (_values!5482 thiss!1181) (mask!26259 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785) lt!407135)))

(declare-fun b!901076 () Bool)

(assert (=> b!901076 (= e!504426 (inRange!0 (index!38160 lt!407136) (mask!26259 thiss!1181)))))

(assert (= (and d!111623 (not res!608467)) b!901076))

(assert (=> d!111623 m!836691))

(declare-fun m!836873 () Bool)

(assert (=> d!111623 m!836873))

(assert (=> d!111623 m!836699))

(declare-fun m!836875 () Bool)

(assert (=> b!901076 m!836875))

(assert (=> b!900866 d!111623))

(declare-fun b!901089 () Bool)

(declare-fun e!504433 () SeekEntryResult!8947)

(declare-fun e!504435 () SeekEntryResult!8947)

(assert (=> b!901089 (= e!504433 e!504435)))

(declare-fun lt!407145 () (_ BitVec 64))

(declare-fun lt!407147 () SeekEntryResult!8947)

(assert (=> b!901089 (= lt!407145 (select (arr!25385 (_keys!10268 thiss!1181)) (index!38161 lt!407147)))))

(declare-fun c!95390 () Bool)

(assert (=> b!901089 (= c!95390 (= lt!407145 key!785))))

(declare-fun b!901090 () Bool)

(declare-fun c!95391 () Bool)

(assert (=> b!901090 (= c!95391 (= lt!407145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504434 () SeekEntryResult!8947)

(assert (=> b!901090 (= e!504435 e!504434)))

(declare-fun b!901091 () Bool)

(assert (=> b!901091 (= e!504435 (Found!8947 (index!38161 lt!407147)))))

(declare-fun b!901092 () Bool)

(declare-fun lt!407146 () SeekEntryResult!8947)

(assert (=> b!901092 (= e!504434 (ite ((_ is MissingVacant!8947) lt!407146) (MissingZero!8947 (index!38162 lt!407146)) lt!407146))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52831 (_ BitVec 32)) SeekEntryResult!8947)

(assert (=> b!901092 (= lt!407146 (seekKeyOrZeroReturnVacant!0 (x!76773 lt!407147) (index!38161 lt!407147) (index!38161 lt!407147) key!785 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(declare-fun d!111625 () Bool)

(declare-fun lt!407148 () SeekEntryResult!8947)

(assert (=> d!111625 (and (or ((_ is MissingVacant!8947) lt!407148) (not ((_ is Found!8947) lt!407148)) (and (bvsge (index!38160 lt!407148) #b00000000000000000000000000000000) (bvslt (index!38160 lt!407148) (size!25846 (_keys!10268 thiss!1181))))) (not ((_ is MissingVacant!8947) lt!407148)) (or (not ((_ is Found!8947) lt!407148)) (= (select (arr!25385 (_keys!10268 thiss!1181)) (index!38160 lt!407148)) key!785)))))

(assert (=> d!111625 (= lt!407148 e!504433)))

(declare-fun c!95389 () Bool)

(assert (=> d!111625 (= c!95389 (and ((_ is Intermediate!8947) lt!407147) (undefined!9759 lt!407147)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52831 (_ BitVec 32)) SeekEntryResult!8947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111625 (= lt!407147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26259 thiss!1181)) key!785 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(assert (=> d!111625 (validMask!0 (mask!26259 thiss!1181))))

(assert (=> d!111625 (= (seekEntry!0 key!785 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)) lt!407148)))

(declare-fun b!901093 () Bool)

(assert (=> b!901093 (= e!504434 (MissingZero!8947 (index!38161 lt!407147)))))

(declare-fun b!901094 () Bool)

(assert (=> b!901094 (= e!504433 Undefined!8947)))

(assert (= (and d!111625 c!95389) b!901094))

(assert (= (and d!111625 (not c!95389)) b!901089))

(assert (= (and b!901089 c!95390) b!901091))

(assert (= (and b!901089 (not c!95390)) b!901090))

(assert (= (and b!901090 c!95391) b!901093))

(assert (= (and b!901090 (not c!95391)) b!901092))

(declare-fun m!836877 () Bool)

(assert (=> b!901089 m!836877))

(declare-fun m!836879 () Bool)

(assert (=> b!901092 m!836879))

(declare-fun m!836881 () Bool)

(assert (=> d!111625 m!836881))

(declare-fun m!836883 () Bool)

(assert (=> d!111625 m!836883))

(assert (=> d!111625 m!836883))

(declare-fun m!836885 () Bool)

(assert (=> d!111625 m!836885))

(assert (=> d!111625 m!836699))

(assert (=> b!900866 d!111625))

(declare-fun d!111627 () Bool)

(declare-fun res!608474 () Bool)

(declare-fun e!504438 () Bool)

(assert (=> d!111627 (=> (not res!608474) (not e!504438))))

(declare-fun simpleValid!332 (LongMapFixedSize!4450) Bool)

(assert (=> d!111627 (= res!608474 (simpleValid!332 thiss!1181))))

(assert (=> d!111627 (= (valid!1717 thiss!1181) e!504438)))

(declare-fun b!901101 () Bool)

(declare-fun res!608475 () Bool)

(assert (=> b!901101 (=> (not res!608475) (not e!504438))))

(declare-fun arrayCountValidKeys!0 (array!52831 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901101 (= res!608475 (= (arrayCountValidKeys!0 (_keys!10268 thiss!1181) #b00000000000000000000000000000000 (size!25846 (_keys!10268 thiss!1181))) (_size!2280 thiss!1181)))))

(declare-fun b!901102 () Bool)

(declare-fun res!608476 () Bool)

(assert (=> b!901102 (=> (not res!608476) (not e!504438))))

(assert (=> b!901102 (= res!608476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10268 thiss!1181) (mask!26259 thiss!1181)))))

(declare-fun b!901103 () Bool)

(assert (=> b!901103 (= e!504438 (arrayNoDuplicates!0 (_keys!10268 thiss!1181) #b00000000000000000000000000000000 Nil!17878))))

(assert (= (and d!111627 res!608474) b!901101))

(assert (= (and b!901101 res!608475) b!901102))

(assert (= (and b!901102 res!608476) b!901103))

(declare-fun m!836887 () Bool)

(assert (=> d!111627 m!836887))

(declare-fun m!836889 () Bool)

(assert (=> b!901101 m!836889))

(assert (=> b!901102 m!836695))

(assert (=> b!901103 m!836679))

(assert (=> start!77210 d!111627))

(assert (=> b!900875 d!111601))

(declare-fun mapNonEmpty!29287 () Bool)

(declare-fun mapRes!29287 () Bool)

(declare-fun tp!56320 () Bool)

(declare-fun e!504443 () Bool)

(assert (=> mapNonEmpty!29287 (= mapRes!29287 (and tp!56320 e!504443))))

(declare-fun mapValue!29287 () ValueCell!8717)

(declare-fun mapKey!29287 () (_ BitVec 32))

(declare-fun mapRest!29287 () (Array (_ BitVec 32) ValueCell!8717))

(assert (=> mapNonEmpty!29287 (= mapRest!29278 (store mapRest!29287 mapKey!29287 mapValue!29287))))

(declare-fun condMapEmpty!29287 () Bool)

(declare-fun mapDefault!29287 () ValueCell!8717)

(assert (=> mapNonEmpty!29278 (= condMapEmpty!29287 (= mapRest!29278 ((as const (Array (_ BitVec 32) ValueCell!8717)) mapDefault!29287)))))

(declare-fun e!504444 () Bool)

(assert (=> mapNonEmpty!29278 (= tp!56304 (and e!504444 mapRes!29287))))

(declare-fun b!901110 () Bool)

(assert (=> b!901110 (= e!504443 tp_is_empty!18397)))

(declare-fun mapIsEmpty!29287 () Bool)

(assert (=> mapIsEmpty!29287 mapRes!29287))

(declare-fun b!901111 () Bool)

(assert (=> b!901111 (= e!504444 tp_is_empty!18397)))

(assert (= (and mapNonEmpty!29278 condMapEmpty!29287) mapIsEmpty!29287))

(assert (= (and mapNonEmpty!29278 (not condMapEmpty!29287)) mapNonEmpty!29287))

(assert (= (and mapNonEmpty!29287 ((_ is ValueCellFull!8717) mapValue!29287)) b!901110))

(assert (= (and mapNonEmpty!29278 ((_ is ValueCellFull!8717) mapDefault!29287)) b!901111))

(declare-fun m!836891 () Bool)

(assert (=> mapNonEmpty!29287 m!836891))

(declare-fun b_lambda!13011 () Bool)

(assert (= b_lambda!13009 (or (and b!900868 b_free!16069) b_lambda!13011)))

(check-sat (not bm!40078) (not b!901057) (not d!111613) (not bm!40079) (not b!901035) (not b!901039) (not b!901076) (not b!901061) (not b!901060) (not b!900969) b_and!26375 (not bm!40077) (not bm!40082) (not b_next!16069) (not mapNonEmpty!29287) (not b!900978) (not b!900970) (not b!901102) (not b!901031) (not d!111625) (not b!900981) (not d!111627) (not bm!40085) (not d!111603) (not b!901026) (not b!901027) (not d!111611) (not d!111623) tp_is_empty!18397 (not b!901103) (not b!901073) (not b!901070) (not d!111607) (not b!901101) (not b!901025) (not bm!40075) (not b!900972) (not b!901033) (not b_lambda!13011) (not b!901032) (not d!111599) (not b!900967) (not b!901092))
(check-sat b_and!26375 (not b_next!16069))
