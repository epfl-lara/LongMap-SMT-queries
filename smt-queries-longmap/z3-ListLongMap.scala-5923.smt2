; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77032 () Bool)

(assert start!77032)

(declare-fun b!899611 () Bool)

(declare-fun b_free!16039 () Bool)

(declare-fun b_next!16039 () Bool)

(assert (=> b!899611 (= b_free!16039 (not b_next!16039))))

(declare-fun tp!56202 () Bool)

(declare-fun b_and!26327 () Bool)

(assert (=> b!899611 (= tp!56202 b_and!26327)))

(declare-fun b!899604 () Bool)

(declare-fun e!503412 () Bool)

(declare-datatypes ((SeekEntryResult!8935 0))(
  ( (MissingZero!8935 (index!38111 (_ BitVec 32))) (Found!8935 (index!38112 (_ BitVec 32))) (Intermediate!8935 (undefined!9747 Bool) (index!38113 (_ BitVec 32)) (x!76673 (_ BitVec 32))) (Undefined!8935) (MissingVacant!8935 (index!38114 (_ BitVec 32))) )
))
(declare-fun lt!406248 () SeekEntryResult!8935)

(declare-datatypes ((array!52763 0))(
  ( (array!52764 (arr!25355 (Array (_ BitVec 32) (_ BitVec 64))) (size!25815 (_ BitVec 32))) )
))
(declare-datatypes ((V!29455 0))(
  ( (V!29456 (val!9234 Int)) )
))
(declare-datatypes ((ValueCell!8702 0))(
  ( (ValueCellFull!8702 (v!11726 V!29455)) (EmptyCell!8702) )
))
(declare-datatypes ((array!52765 0))(
  ( (array!52766 (arr!25356 (Array (_ BitVec 32) ValueCell!8702)) (size!25816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4420 0))(
  ( (LongMapFixedSize!4421 (defaultEntry!5438 Int) (mask!26200 (_ BitVec 32)) (extraKeys!5161 (_ BitVec 32)) (zeroValue!5265 V!29455) (minValue!5265 V!29455) (_size!2265 (_ BitVec 32)) (_keys!10228 array!52763) (_values!5452 array!52765) (_vacant!2265 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4420)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899604 (= e!503412 (inRange!0 (index!38112 lt!406248) (mask!26200 thiss!1181)))))

(declare-fun b!899605 () Bool)

(declare-fun e!503413 () Bool)

(assert (=> b!899605 (= e!503413 (or (not (= (size!25816 (_values!5452 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26200 thiss!1181)))) (not (= (size!25815 (_keys!10228 thiss!1181)) (size!25816 (_values!5452 thiss!1181)))) (bvslt (mask!26200 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5161 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5161 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!899606 () Bool)

(declare-fun e!503405 () Bool)

(declare-fun tp_is_empty!18367 () Bool)

(assert (=> b!899606 (= e!503405 tp_is_empty!18367)))

(declare-fun b!899607 () Bool)

(declare-fun e!503409 () Bool)

(assert (=> b!899607 (= e!503409 tp_is_empty!18367)))

(declare-fun b!899608 () Bool)

(declare-fun e!503408 () Bool)

(declare-fun e!503410 () Bool)

(assert (=> b!899608 (= e!503408 (not e!503410))))

(declare-fun res!607687 () Bool)

(assert (=> b!899608 (=> res!607687 e!503410)))

(get-info :version)

(assert (=> b!899608 (= res!607687 (not ((_ is Found!8935) lt!406248)))))

(assert (=> b!899608 e!503412))

(declare-fun res!607690 () Bool)

(assert (=> b!899608 (=> res!607690 e!503412)))

(assert (=> b!899608 (= res!607690 (not ((_ is Found!8935) lt!406248)))))

(declare-datatypes ((Unit!30512 0))(
  ( (Unit!30513) )
))
(declare-fun lt!406250 () Unit!30512)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!100 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> b!899608 (= lt!406250 (lemmaSeekEntryGivesInRangeIndex!100 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!899608 (= lt!406248 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun res!607689 () Bool)

(assert (=> start!77032 (=> (not res!607689) (not e!503408))))

(declare-fun valid!1707 (LongMapFixedSize!4420) Bool)

(assert (=> start!77032 (= res!607689 (valid!1707 thiss!1181))))

(assert (=> start!77032 e!503408))

(declare-fun e!503411 () Bool)

(assert (=> start!77032 e!503411))

(assert (=> start!77032 true))

(declare-fun mapNonEmpty!29220 () Bool)

(declare-fun mapRes!29220 () Bool)

(declare-fun tp!56201 () Bool)

(assert (=> mapNonEmpty!29220 (= mapRes!29220 (and tp!56201 e!503405))))

(declare-fun mapValue!29220 () ValueCell!8702)

(declare-fun mapRest!29220 () (Array (_ BitVec 32) ValueCell!8702))

(declare-fun mapKey!29220 () (_ BitVec 32))

(assert (=> mapNonEmpty!29220 (= (arr!25356 (_values!5452 thiss!1181)) (store mapRest!29220 mapKey!29220 mapValue!29220))))

(declare-fun b!899609 () Bool)

(assert (=> b!899609 (= e!503410 e!503413)))

(declare-fun res!607686 () Bool)

(assert (=> b!899609 (=> res!607686 e!503413)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899609 (= res!607686 (not (validMask!0 (mask!26200 thiss!1181))))))

(declare-datatypes ((tuple2!12070 0))(
  ( (tuple2!12071 (_1!6046 (_ BitVec 64)) (_2!6046 V!29455)) )
))
(declare-datatypes ((List!17860 0))(
  ( (Nil!17857) (Cons!17856 (h!19001 tuple2!12070) (t!25200 List!17860)) )
))
(declare-datatypes ((ListLongMap!10757 0))(
  ( (ListLongMap!10758 (toList!5394 List!17860)) )
))
(declare-fun contains!4395 (ListLongMap!10757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2613 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) ListLongMap!10757)

(assert (=> b!899609 (contains!4395 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))

(declare-fun lt!406249 () Unit!30512)

(declare-fun lemmaValidKeyInArrayIsInListMap!249 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) Unit!30512)

(assert (=> b!899609 (= lt!406249 (lemmaValidKeyInArrayIsInListMap!249 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!38112 lt!406248) (defaultEntry!5438 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899609 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406247 () Unit!30512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52763 (_ BitVec 64) (_ BitVec 32)) Unit!30512)

(assert (=> b!899609 (= lt!406247 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) key!785 (index!38112 lt!406248)))))

(declare-fun b!899610 () Bool)

(declare-fun res!607688 () Bool)

(assert (=> b!899610 (=> (not res!607688) (not e!503408))))

(assert (=> b!899610 (= res!607688 (not (= key!785 (bvneg key!785))))))

(declare-fun e!503406 () Bool)

(declare-fun array_inv!19946 (array!52763) Bool)

(declare-fun array_inv!19947 (array!52765) Bool)

(assert (=> b!899611 (= e!503411 (and tp!56202 tp_is_empty!18367 (array_inv!19946 (_keys!10228 thiss!1181)) (array_inv!19947 (_values!5452 thiss!1181)) e!503406))))

(declare-fun mapIsEmpty!29220 () Bool)

(assert (=> mapIsEmpty!29220 mapRes!29220))

(declare-fun b!899612 () Bool)

(assert (=> b!899612 (= e!503406 (and e!503409 mapRes!29220))))

(declare-fun condMapEmpty!29220 () Bool)

(declare-fun mapDefault!29220 () ValueCell!8702)

(assert (=> b!899612 (= condMapEmpty!29220 (= (arr!25356 (_values!5452 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29220)))))

(assert (= (and start!77032 res!607689) b!899610))

(assert (= (and b!899610 res!607688) b!899608))

(assert (= (and b!899608 (not res!607690)) b!899604))

(assert (= (and b!899608 (not res!607687)) b!899609))

(assert (= (and b!899609 (not res!607686)) b!899605))

(assert (= (and b!899612 condMapEmpty!29220) mapIsEmpty!29220))

(assert (= (and b!899612 (not condMapEmpty!29220)) mapNonEmpty!29220))

(assert (= (and mapNonEmpty!29220 ((_ is ValueCellFull!8702) mapValue!29220)) b!899606))

(assert (= (and b!899612 ((_ is ValueCellFull!8702) mapDefault!29220)) b!899607))

(assert (= b!899611 b!899612))

(assert (= start!77032 b!899611))

(declare-fun m!835563 () Bool)

(assert (=> start!77032 m!835563))

(declare-fun m!835565 () Bool)

(assert (=> b!899609 m!835565))

(declare-fun m!835567 () Bool)

(assert (=> b!899609 m!835567))

(declare-fun m!835569 () Bool)

(assert (=> b!899609 m!835569))

(assert (=> b!899609 m!835567))

(declare-fun m!835571 () Bool)

(assert (=> b!899609 m!835571))

(declare-fun m!835573 () Bool)

(assert (=> b!899609 m!835573))

(declare-fun m!835575 () Bool)

(assert (=> b!899609 m!835575))

(assert (=> b!899609 m!835569))

(declare-fun m!835577 () Bool)

(assert (=> b!899609 m!835577))

(declare-fun m!835579 () Bool)

(assert (=> mapNonEmpty!29220 m!835579))

(declare-fun m!835581 () Bool)

(assert (=> b!899608 m!835581))

(declare-fun m!835583 () Bool)

(assert (=> b!899608 m!835583))

(declare-fun m!835585 () Bool)

(assert (=> b!899604 m!835585))

(declare-fun m!835587 () Bool)

(assert (=> b!899611 m!835587))

(declare-fun m!835589 () Bool)

(assert (=> b!899611 m!835589))

(check-sat (not start!77032) (not b!899611) tp_is_empty!18367 (not b!899604) (not b_next!16039) (not mapNonEmpty!29220) (not b!899609) b_and!26327 (not b!899608))
(check-sat b_and!26327 (not b_next!16039))
(get-model)

(declare-fun d!111397 () Bool)

(assert (=> d!111397 (= (validMask!0 (mask!26200 thiss!1181)) (and (or (= (mask!26200 thiss!1181) #b00000000000000000000000000000111) (= (mask!26200 thiss!1181) #b00000000000000000000000000001111) (= (mask!26200 thiss!1181) #b00000000000000000000000000011111) (= (mask!26200 thiss!1181) #b00000000000000000000000000111111) (= (mask!26200 thiss!1181) #b00000000000000000000000001111111) (= (mask!26200 thiss!1181) #b00000000000000000000000011111111) (= (mask!26200 thiss!1181) #b00000000000000000000000111111111) (= (mask!26200 thiss!1181) #b00000000000000000000001111111111) (= (mask!26200 thiss!1181) #b00000000000000000000011111111111) (= (mask!26200 thiss!1181) #b00000000000000000000111111111111) (= (mask!26200 thiss!1181) #b00000000000000000001111111111111) (= (mask!26200 thiss!1181) #b00000000000000000011111111111111) (= (mask!26200 thiss!1181) #b00000000000000000111111111111111) (= (mask!26200 thiss!1181) #b00000000000000001111111111111111) (= (mask!26200 thiss!1181) #b00000000000000011111111111111111) (= (mask!26200 thiss!1181) #b00000000000000111111111111111111) (= (mask!26200 thiss!1181) #b00000000000001111111111111111111) (= (mask!26200 thiss!1181) #b00000000000011111111111111111111) (= (mask!26200 thiss!1181) #b00000000000111111111111111111111) (= (mask!26200 thiss!1181) #b00000000001111111111111111111111) (= (mask!26200 thiss!1181) #b00000000011111111111111111111111) (= (mask!26200 thiss!1181) #b00000000111111111111111111111111) (= (mask!26200 thiss!1181) #b00000001111111111111111111111111) (= (mask!26200 thiss!1181) #b00000011111111111111111111111111) (= (mask!26200 thiss!1181) #b00000111111111111111111111111111) (= (mask!26200 thiss!1181) #b00001111111111111111111111111111) (= (mask!26200 thiss!1181) #b00011111111111111111111111111111) (= (mask!26200 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26200 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899609 d!111397))

(declare-fun d!111399 () Bool)

(declare-fun e!503470 () Bool)

(assert (=> d!111399 e!503470))

(declare-fun res!607723 () Bool)

(assert (=> d!111399 (=> (not res!607723) (not e!503470))))

(assert (=> d!111399 (= res!607723 (and (bvsge (index!38112 lt!406248) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406248) (size!25815 (_keys!10228 thiss!1181)))))))

(declare-fun lt!406277 () Unit!30512)

(declare-fun choose!1516 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) Unit!30512)

(assert (=> d!111399 (= lt!406277 (choose!1516 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!38112 lt!406248) (defaultEntry!5438 thiss!1181)))))

(assert (=> d!111399 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111399 (= (lemmaValidKeyInArrayIsInListMap!249 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!38112 lt!406248) (defaultEntry!5438 thiss!1181)) lt!406277)))

(declare-fun b!899669 () Bool)

(assert (=> b!899669 (= e!503470 (contains!4395 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(assert (= (and d!111399 res!607723) b!899669))

(declare-fun m!835647 () Bool)

(assert (=> d!111399 m!835647))

(assert (=> d!111399 m!835575))

(assert (=> b!899669 m!835569))

(assert (=> b!899669 m!835567))

(assert (=> b!899669 m!835569))

(assert (=> b!899669 m!835567))

(assert (=> b!899669 m!835571))

(assert (=> b!899609 d!111399))

(declare-fun d!111401 () Bool)

(declare-fun res!607728 () Bool)

(declare-fun e!503475 () Bool)

(assert (=> d!111401 (=> res!607728 e!503475)))

(assert (=> d!111401 (= res!607728 (= (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111401 (= (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000) e!503475)))

(declare-fun b!899674 () Bool)

(declare-fun e!503476 () Bool)

(assert (=> b!899674 (= e!503475 e!503476)))

(declare-fun res!607729 () Bool)

(assert (=> b!899674 (=> (not res!607729) (not e!503476))))

(assert (=> b!899674 (= res!607729 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899675 () Bool)

(assert (=> b!899675 (= e!503476 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111401 (not res!607728)) b!899674))

(assert (= (and b!899674 res!607729) b!899675))

(declare-fun m!835649 () Bool)

(assert (=> d!111401 m!835649))

(declare-fun m!835651 () Bool)

(assert (=> b!899675 m!835651))

(assert (=> b!899609 d!111401))

(declare-fun d!111403 () Bool)

(assert (=> d!111403 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406280 () Unit!30512)

(declare-fun choose!13 (array!52763 (_ BitVec 64) (_ BitVec 32)) Unit!30512)

(assert (=> d!111403 (= lt!406280 (choose!13 (_keys!10228 thiss!1181) key!785 (index!38112 lt!406248)))))

(assert (=> d!111403 (bvsge (index!38112 lt!406248) #b00000000000000000000000000000000)))

(assert (=> d!111403 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) key!785 (index!38112 lt!406248)) lt!406280)))

(declare-fun bs!25236 () Bool)

(assert (= bs!25236 d!111403))

(assert (=> bs!25236 m!835573))

(declare-fun m!835653 () Bool)

(assert (=> bs!25236 m!835653))

(assert (=> b!899609 d!111403))

(declare-fun b!899718 () Bool)

(declare-fun e!503514 () Unit!30512)

(declare-fun Unit!30518 () Unit!30512)

(assert (=> b!899718 (= e!503514 Unit!30518)))

(declare-fun b!899719 () Bool)

(declare-fun c!95181 () Bool)

(assert (=> b!899719 (= c!95181 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503513 () ListLongMap!10757)

(declare-fun e!503506 () ListLongMap!10757)

(assert (=> b!899719 (= e!503513 e!503506)))

(declare-fun b!899720 () Bool)

(declare-fun e!503515 () ListLongMap!10757)

(assert (=> b!899720 (= e!503515 e!503513)))

(declare-fun c!95178 () Bool)

(assert (=> b!899720 (= c!95178 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39962 () Bool)

(declare-fun call!39971 () ListLongMap!10757)

(declare-fun call!39970 () ListLongMap!10757)

(assert (=> bm!39962 (= call!39971 call!39970)))

(declare-fun bm!39963 () Bool)

(declare-fun call!39966 () ListLongMap!10757)

(declare-fun call!39967 () ListLongMap!10757)

(assert (=> bm!39963 (= call!39966 call!39967)))

(declare-fun b!899722 () Bool)

(declare-fun e!503508 () Bool)

(declare-fun e!503505 () Bool)

(assert (=> b!899722 (= e!503508 e!503505)))

(declare-fun res!607755 () Bool)

(declare-fun call!39969 () Bool)

(assert (=> b!899722 (= res!607755 call!39969)))

(assert (=> b!899722 (=> (not res!607755) (not e!503505))))

(declare-fun b!899723 () Bool)

(declare-fun res!607748 () Bool)

(declare-fun e!503507 () Bool)

(assert (=> b!899723 (=> (not res!607748) (not e!503507))))

(assert (=> b!899723 (= res!607748 e!503508)))

(declare-fun c!95180 () Bool)

(assert (=> b!899723 (= c!95180 (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899724 () Bool)

(declare-fun +!2621 (ListLongMap!10757 tuple2!12070) ListLongMap!10757)

(assert (=> b!899724 (= e!503515 (+!2621 call!39970 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))

(declare-fun b!899725 () Bool)

(assert (=> b!899725 (= e!503513 call!39971)))

(declare-fun b!899726 () Bool)

(assert (=> b!899726 (= e!503506 call!39966)))

(declare-fun bm!39964 () Bool)

(declare-fun call!39968 () ListLongMap!10757)

(declare-fun getCurrentListMapNoExtraKeys!3318 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) ListLongMap!10757)

(assert (=> bm!39964 (= call!39968 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun b!899727 () Bool)

(declare-fun e!503510 () Bool)

(declare-fun lt!406338 () ListLongMap!10757)

(declare-fun apply!410 (ListLongMap!10757 (_ BitVec 64)) V!29455)

(declare-fun get!13342 (ValueCell!8702 V!29455) V!29455)

(declare-fun dynLambda!1304 (Int (_ BitVec 64)) V!29455)

(assert (=> b!899727 (= e!503510 (= (apply!410 lt!406338 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13342 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_values!5452 thiss!1181))))))

(assert (=> b!899727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899728 () Bool)

(declare-fun e!503512 () Bool)

(declare-fun call!39965 () Bool)

(assert (=> b!899728 (= e!503512 (not call!39965))))

(declare-fun b!899729 () Bool)

(declare-fun res!607749 () Bool)

(assert (=> b!899729 (=> (not res!607749) (not e!503507))))

(declare-fun e!503503 () Bool)

(assert (=> b!899729 (= res!607749 e!503503)))

(declare-fun res!607750 () Bool)

(assert (=> b!899729 (=> res!607750 e!503503)))

(declare-fun e!503504 () Bool)

(assert (=> b!899729 (= res!607750 (not e!503504))))

(declare-fun res!607756 () Bool)

(assert (=> b!899729 (=> (not res!607756) (not e!503504))))

(assert (=> b!899729 (= res!607756 (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899730 () Bool)

(assert (=> b!899730 (= e!503505 (= (apply!410 lt!406338 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5265 thiss!1181)))))

(declare-fun b!899731 () Bool)

(assert (=> b!899731 (= e!503508 (not call!39969))))

(declare-fun b!899732 () Bool)

(assert (=> b!899732 (= e!503507 e!503512)))

(declare-fun c!95179 () Bool)

(assert (=> b!899732 (= c!95179 (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899733 () Bool)

(declare-fun e!503511 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899733 (= e!503511 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899734 () Bool)

(assert (=> b!899734 (= e!503504 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899735 () Bool)

(declare-fun e!503509 () Bool)

(assert (=> b!899735 (= e!503512 e!503509)))

(declare-fun res!607752 () Bool)

(assert (=> b!899735 (= res!607752 call!39965)))

(assert (=> b!899735 (=> (not res!607752) (not e!503509))))

(declare-fun d!111405 () Bool)

(assert (=> d!111405 e!503507))

(declare-fun res!607754 () Bool)

(assert (=> d!111405 (=> (not res!607754) (not e!503507))))

(assert (=> d!111405 (= res!607754 (or (bvsge #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))))

(declare-fun lt!406341 () ListLongMap!10757)

(assert (=> d!111405 (= lt!406338 lt!406341)))

(declare-fun lt!406329 () Unit!30512)

(assert (=> d!111405 (= lt!406329 e!503514)))

(declare-fun c!95177 () Bool)

(assert (=> d!111405 (= c!95177 e!503511)))

(declare-fun res!607751 () Bool)

(assert (=> d!111405 (=> (not res!607751) (not e!503511))))

(assert (=> d!111405 (= res!607751 (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111405 (= lt!406341 e!503515)))

(declare-fun c!95176 () Bool)

(assert (=> d!111405 (= c!95176 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111405 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111405 (= (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) lt!406338)))

(declare-fun b!899721 () Bool)

(declare-fun lt!406334 () Unit!30512)

(assert (=> b!899721 (= e!503514 lt!406334)))

(declare-fun lt!406331 () ListLongMap!10757)

(assert (=> b!899721 (= lt!406331 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406339 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406340 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406340 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406336 () Unit!30512)

(declare-fun addStillContains!336 (ListLongMap!10757 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> b!899721 (= lt!406336 (addStillContains!336 lt!406331 lt!406339 (zeroValue!5265 thiss!1181) lt!406340))))

(assert (=> b!899721 (contains!4395 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) lt!406340)))

(declare-fun lt!406335 () Unit!30512)

(assert (=> b!899721 (= lt!406335 lt!406336)))

(declare-fun lt!406343 () ListLongMap!10757)

(assert (=> b!899721 (= lt!406343 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406332 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406330 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406330 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406328 () Unit!30512)

(declare-fun addApplyDifferent!336 (ListLongMap!10757 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> b!899721 (= lt!406328 (addApplyDifferent!336 lt!406343 lt!406332 (minValue!5265 thiss!1181) lt!406330))))

(assert (=> b!899721 (= (apply!410 (+!2621 lt!406343 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) lt!406330) (apply!410 lt!406343 lt!406330))))

(declare-fun lt!406344 () Unit!30512)

(assert (=> b!899721 (= lt!406344 lt!406328)))

(declare-fun lt!406326 () ListLongMap!10757)

(assert (=> b!899721 (= lt!406326 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406346 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406342 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406342 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406327 () Unit!30512)

(assert (=> b!899721 (= lt!406327 (addApplyDifferent!336 lt!406326 lt!406346 (zeroValue!5265 thiss!1181) lt!406342))))

(assert (=> b!899721 (= (apply!410 (+!2621 lt!406326 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) lt!406342) (apply!410 lt!406326 lt!406342))))

(declare-fun lt!406337 () Unit!30512)

(assert (=> b!899721 (= lt!406337 lt!406327)))

(declare-fun lt!406333 () ListLongMap!10757)

(assert (=> b!899721 (= lt!406333 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406325 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406325 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406345 () (_ BitVec 64))

(assert (=> b!899721 (= lt!406345 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899721 (= lt!406334 (addApplyDifferent!336 lt!406333 lt!406325 (minValue!5265 thiss!1181) lt!406345))))

(assert (=> b!899721 (= (apply!410 (+!2621 lt!406333 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) lt!406345) (apply!410 lt!406333 lt!406345))))

(declare-fun bm!39965 () Bool)

(assert (=> bm!39965 (= call!39965 (contains!4395 lt!406338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39966 () Bool)

(assert (=> bm!39966 (= call!39970 (+!2621 (ite c!95176 call!39968 (ite c!95178 call!39967 call!39966)) (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(declare-fun b!899736 () Bool)

(assert (=> b!899736 (= e!503509 (= (apply!410 lt!406338 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5265 thiss!1181)))))

(declare-fun bm!39967 () Bool)

(assert (=> bm!39967 (= call!39969 (contains!4395 lt!406338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899737 () Bool)

(assert (=> b!899737 (= e!503506 call!39971)))

(declare-fun b!899738 () Bool)

(assert (=> b!899738 (= e!503503 e!503510)))

(declare-fun res!607753 () Bool)

(assert (=> b!899738 (=> (not res!607753) (not e!503510))))

(assert (=> b!899738 (= res!607753 (contains!4395 lt!406338 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun bm!39968 () Bool)

(assert (=> bm!39968 (= call!39967 call!39968)))

(assert (= (and d!111405 c!95176) b!899724))

(assert (= (and d!111405 (not c!95176)) b!899720))

(assert (= (and b!899720 c!95178) b!899725))

(assert (= (and b!899720 (not c!95178)) b!899719))

(assert (= (and b!899719 c!95181) b!899737))

(assert (= (and b!899719 (not c!95181)) b!899726))

(assert (= (or b!899737 b!899726) bm!39963))

(assert (= (or b!899725 bm!39963) bm!39968))

(assert (= (or b!899725 b!899737) bm!39962))

(assert (= (or b!899724 bm!39968) bm!39964))

(assert (= (or b!899724 bm!39962) bm!39966))

(assert (= (and d!111405 res!607751) b!899733))

(assert (= (and d!111405 c!95177) b!899721))

(assert (= (and d!111405 (not c!95177)) b!899718))

(assert (= (and d!111405 res!607754) b!899729))

(assert (= (and b!899729 res!607756) b!899734))

(assert (= (and b!899729 (not res!607750)) b!899738))

(assert (= (and b!899738 res!607753) b!899727))

(assert (= (and b!899729 res!607749) b!899723))

(assert (= (and b!899723 c!95180) b!899722))

(assert (= (and b!899723 (not c!95180)) b!899731))

(assert (= (and b!899722 res!607755) b!899730))

(assert (= (or b!899722 b!899731) bm!39967))

(assert (= (and b!899723 res!607748) b!899732))

(assert (= (and b!899732 c!95179) b!899735))

(assert (= (and b!899732 (not c!95179)) b!899728))

(assert (= (and b!899735 res!607752) b!899736))

(assert (= (or b!899735 b!899728) bm!39965))

(declare-fun b_lambda!12985 () Bool)

(assert (=> (not b_lambda!12985) (not b!899727)))

(declare-fun t!25203 () Bool)

(declare-fun tb!5193 () Bool)

(assert (=> (and b!899611 (= (defaultEntry!5438 thiss!1181) (defaultEntry!5438 thiss!1181)) t!25203) tb!5193))

(declare-fun result!10167 () Bool)

(assert (=> tb!5193 (= result!10167 tp_is_empty!18367)))

(assert (=> b!899727 t!25203))

(declare-fun b_and!26333 () Bool)

(assert (= b_and!26327 (and (=> t!25203 result!10167) b_and!26333)))

(declare-fun m!835655 () Bool)

(assert (=> b!899736 m!835655))

(declare-fun m!835657 () Bool)

(assert (=> b!899724 m!835657))

(assert (=> d!111405 m!835575))

(declare-fun m!835659 () Bool)

(assert (=> b!899721 m!835659))

(declare-fun m!835661 () Bool)

(assert (=> b!899721 m!835661))

(declare-fun m!835663 () Bool)

(assert (=> b!899721 m!835663))

(declare-fun m!835665 () Bool)

(assert (=> b!899721 m!835665))

(declare-fun m!835667 () Bool)

(assert (=> b!899721 m!835667))

(assert (=> b!899721 m!835649))

(declare-fun m!835669 () Bool)

(assert (=> b!899721 m!835669))

(declare-fun m!835671 () Bool)

(assert (=> b!899721 m!835671))

(declare-fun m!835673 () Bool)

(assert (=> b!899721 m!835673))

(declare-fun m!835675 () Bool)

(assert (=> b!899721 m!835675))

(declare-fun m!835677 () Bool)

(assert (=> b!899721 m!835677))

(declare-fun m!835679 () Bool)

(assert (=> b!899721 m!835679))

(declare-fun m!835681 () Bool)

(assert (=> b!899721 m!835681))

(declare-fun m!835683 () Bool)

(assert (=> b!899721 m!835683))

(assert (=> b!899721 m!835669))

(assert (=> b!899721 m!835675))

(declare-fun m!835685 () Bool)

(assert (=> b!899721 m!835685))

(assert (=> b!899721 m!835659))

(declare-fun m!835687 () Bool)

(assert (=> b!899721 m!835687))

(declare-fun m!835689 () Bool)

(assert (=> b!899721 m!835689))

(assert (=> b!899721 m!835679))

(declare-fun m!835691 () Bool)

(assert (=> bm!39966 m!835691))

(declare-fun m!835693 () Bool)

(assert (=> bm!39965 m!835693))

(assert (=> b!899733 m!835649))

(assert (=> b!899733 m!835649))

(declare-fun m!835695 () Bool)

(assert (=> b!899733 m!835695))

(assert (=> b!899734 m!835649))

(assert (=> b!899734 m!835649))

(assert (=> b!899734 m!835695))

(declare-fun m!835697 () Bool)

(assert (=> b!899730 m!835697))

(assert (=> bm!39964 m!835665))

(declare-fun m!835699 () Bool)

(assert (=> b!899727 m!835699))

(assert (=> b!899727 m!835649))

(declare-fun m!835701 () Bool)

(assert (=> b!899727 m!835701))

(declare-fun m!835703 () Bool)

(assert (=> b!899727 m!835703))

(assert (=> b!899727 m!835649))

(assert (=> b!899727 m!835699))

(assert (=> b!899727 m!835703))

(declare-fun m!835705 () Bool)

(assert (=> b!899727 m!835705))

(declare-fun m!835707 () Bool)

(assert (=> bm!39967 m!835707))

(assert (=> b!899738 m!835649))

(assert (=> b!899738 m!835649))

(declare-fun m!835709 () Bool)

(assert (=> b!899738 m!835709))

(assert (=> b!899609 d!111405))

(declare-fun d!111407 () Bool)

(declare-fun e!503521 () Bool)

(assert (=> d!111407 e!503521))

(declare-fun res!607759 () Bool)

(assert (=> d!111407 (=> res!607759 e!503521)))

(declare-fun lt!406355 () Bool)

(assert (=> d!111407 (= res!607759 (not lt!406355))))

(declare-fun lt!406356 () Bool)

(assert (=> d!111407 (= lt!406355 lt!406356)))

(declare-fun lt!406358 () Unit!30512)

(declare-fun e!503520 () Unit!30512)

(assert (=> d!111407 (= lt!406358 e!503520)))

(declare-fun c!95184 () Bool)

(assert (=> d!111407 (= c!95184 lt!406356)))

(declare-fun containsKey!429 (List!17860 (_ BitVec 64)) Bool)

(assert (=> d!111407 (= lt!406356 (containsKey!429 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(assert (=> d!111407 (= (contains!4395 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))) lt!406355)))

(declare-fun b!899747 () Bool)

(declare-fun lt!406357 () Unit!30512)

(assert (=> b!899747 (= e!503520 lt!406357)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!324 (List!17860 (_ BitVec 64)) Unit!30512)

(assert (=> b!899747 (= lt!406357 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(declare-datatypes ((Option!467 0))(
  ( (Some!466 (v!11729 V!29455)) (None!465) )
))
(declare-fun isDefined!337 (Option!467) Bool)

(declare-fun getValueByKey!461 (List!17860 (_ BitVec 64)) Option!467)

(assert (=> b!899747 (isDefined!337 (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(declare-fun b!899748 () Bool)

(declare-fun Unit!30519 () Unit!30512)

(assert (=> b!899748 (= e!503520 Unit!30519)))

(declare-fun b!899749 () Bool)

(assert (=> b!899749 (= e!503521 (isDefined!337 (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))))

(assert (= (and d!111407 c!95184) b!899747))

(assert (= (and d!111407 (not c!95184)) b!899748))

(assert (= (and d!111407 (not res!607759)) b!899749))

(assert (=> d!111407 m!835567))

(declare-fun m!835711 () Bool)

(assert (=> d!111407 m!835711))

(assert (=> b!899747 m!835567))

(declare-fun m!835713 () Bool)

(assert (=> b!899747 m!835713))

(assert (=> b!899747 m!835567))

(declare-fun m!835715 () Bool)

(assert (=> b!899747 m!835715))

(assert (=> b!899747 m!835715))

(declare-fun m!835717 () Bool)

(assert (=> b!899747 m!835717))

(assert (=> b!899749 m!835567))

(assert (=> b!899749 m!835715))

(assert (=> b!899749 m!835715))

(assert (=> b!899749 m!835717))

(assert (=> b!899609 d!111407))

(declare-fun d!111409 () Bool)

(assert (=> d!111409 (= (inRange!0 (index!38112 lt!406248) (mask!26200 thiss!1181)) (and (bvsge (index!38112 lt!406248) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406248) (bvadd (mask!26200 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899604 d!111409))

(declare-fun d!111411 () Bool)

(declare-fun res!607766 () Bool)

(declare-fun e!503524 () Bool)

(assert (=> d!111411 (=> (not res!607766) (not e!503524))))

(declare-fun simpleValid!328 (LongMapFixedSize!4420) Bool)

(assert (=> d!111411 (= res!607766 (simpleValid!328 thiss!1181))))

(assert (=> d!111411 (= (valid!1707 thiss!1181) e!503524)))

(declare-fun b!899756 () Bool)

(declare-fun res!607767 () Bool)

(assert (=> b!899756 (=> (not res!607767) (not e!503524))))

(declare-fun arrayCountValidKeys!0 (array!52763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899756 (= res!607767 (= (arrayCountValidKeys!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))) (_size!2265 thiss!1181)))))

(declare-fun b!899757 () Bool)

(declare-fun res!607768 () Bool)

(assert (=> b!899757 (=> (not res!607768) (not e!503524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52763 (_ BitVec 32)) Bool)

(assert (=> b!899757 (= res!607768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun b!899758 () Bool)

(declare-datatypes ((List!17862 0))(
  ( (Nil!17859) (Cons!17858 (h!19003 (_ BitVec 64)) (t!25204 List!17862)) )
))
(declare-fun arrayNoDuplicates!0 (array!52763 (_ BitVec 32) List!17862) Bool)

(assert (=> b!899758 (= e!503524 (arrayNoDuplicates!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 Nil!17859))))

(assert (= (and d!111411 res!607766) b!899756))

(assert (= (and b!899756 res!607767) b!899757))

(assert (= (and b!899757 res!607768) b!899758))

(declare-fun m!835719 () Bool)

(assert (=> d!111411 m!835719))

(declare-fun m!835721 () Bool)

(assert (=> b!899756 m!835721))

(declare-fun m!835723 () Bool)

(assert (=> b!899757 m!835723))

(declare-fun m!835725 () Bool)

(assert (=> b!899758 m!835725))

(assert (=> start!77032 d!111411))

(declare-fun d!111413 () Bool)

(assert (=> d!111413 (= (array_inv!19946 (_keys!10228 thiss!1181)) (bvsge (size!25815 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899611 d!111413))

(declare-fun d!111415 () Bool)

(assert (=> d!111415 (= (array_inv!19947 (_values!5452 thiss!1181)) (bvsge (size!25816 (_values!5452 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899611 d!111415))

(declare-fun d!111417 () Bool)

(declare-fun e!503527 () Bool)

(assert (=> d!111417 e!503527))

(declare-fun res!607771 () Bool)

(assert (=> d!111417 (=> res!607771 e!503527)))

(declare-fun lt!406364 () SeekEntryResult!8935)

(assert (=> d!111417 (= res!607771 (not ((_ is Found!8935) lt!406364)))))

(assert (=> d!111417 (= lt!406364 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun lt!406363 () Unit!30512)

(declare-fun choose!1517 (array!52763 array!52765 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> d!111417 (= lt!406363 (choose!1517 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785))))

(assert (=> d!111417 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111417 (= (lemmaSeekEntryGivesInRangeIndex!100 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785) lt!406363)))

(declare-fun b!899761 () Bool)

(assert (=> b!899761 (= e!503527 (inRange!0 (index!38112 lt!406364) (mask!26200 thiss!1181)))))

(assert (= (and d!111417 (not res!607771)) b!899761))

(assert (=> d!111417 m!835583))

(declare-fun m!835727 () Bool)

(assert (=> d!111417 m!835727))

(assert (=> d!111417 m!835575))

(declare-fun m!835729 () Bool)

(assert (=> b!899761 m!835729))

(assert (=> b!899608 d!111417))

(declare-fun b!899774 () Bool)

(declare-fun e!503535 () SeekEntryResult!8935)

(declare-fun lt!406376 () SeekEntryResult!8935)

(assert (=> b!899774 (= e!503535 (MissingZero!8935 (index!38113 lt!406376)))))

(declare-fun b!899775 () Bool)

(declare-fun lt!406375 () SeekEntryResult!8935)

(assert (=> b!899775 (= e!503535 (ite ((_ is MissingVacant!8935) lt!406375) (MissingZero!8935 (index!38114 lt!406375)) lt!406375))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!899775 (= lt!406375 (seekKeyOrZeroReturnVacant!0 (x!76673 lt!406376) (index!38113 lt!406376) (index!38113 lt!406376) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun b!899776 () Bool)

(declare-fun e!503536 () SeekEntryResult!8935)

(declare-fun e!503534 () SeekEntryResult!8935)

(assert (=> b!899776 (= e!503536 e!503534)))

(declare-fun lt!406374 () (_ BitVec 64))

(assert (=> b!899776 (= lt!406374 (select (arr!25355 (_keys!10228 thiss!1181)) (index!38113 lt!406376)))))

(declare-fun c!95191 () Bool)

(assert (=> b!899776 (= c!95191 (= lt!406374 key!785))))

(declare-fun b!899777 () Bool)

(assert (=> b!899777 (= e!503534 (Found!8935 (index!38113 lt!406376)))))

(declare-fun b!899778 () Bool)

(assert (=> b!899778 (= e!503536 Undefined!8935)))

(declare-fun d!111419 () Bool)

(declare-fun lt!406373 () SeekEntryResult!8935)

(assert (=> d!111419 (and (or ((_ is MissingVacant!8935) lt!406373) (not ((_ is Found!8935) lt!406373)) (and (bvsge (index!38112 lt!406373) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406373) (size!25815 (_keys!10228 thiss!1181))))) (not ((_ is MissingVacant!8935) lt!406373)) (or (not ((_ is Found!8935) lt!406373)) (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406373)) key!785)))))

(assert (=> d!111419 (= lt!406373 e!503536)))

(declare-fun c!95192 () Bool)

(assert (=> d!111419 (= c!95192 (and ((_ is Intermediate!8935) lt!406376) (undefined!9747 lt!406376)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111419 (= lt!406376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26200 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(assert (=> d!111419 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111419 (= (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)) lt!406373)))

(declare-fun b!899779 () Bool)

(declare-fun c!95193 () Bool)

(assert (=> b!899779 (= c!95193 (= lt!406374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899779 (= e!503534 e!503535)))

(assert (= (and d!111419 c!95192) b!899778))

(assert (= (and d!111419 (not c!95192)) b!899776))

(assert (= (and b!899776 c!95191) b!899777))

(assert (= (and b!899776 (not c!95191)) b!899779))

(assert (= (and b!899779 c!95193) b!899774))

(assert (= (and b!899779 (not c!95193)) b!899775))

(declare-fun m!835731 () Bool)

(assert (=> b!899775 m!835731))

(declare-fun m!835733 () Bool)

(assert (=> b!899776 m!835733))

(declare-fun m!835735 () Bool)

(assert (=> d!111419 m!835735))

(declare-fun m!835737 () Bool)

(assert (=> d!111419 m!835737))

(assert (=> d!111419 m!835737))

(declare-fun m!835739 () Bool)

(assert (=> d!111419 m!835739))

(assert (=> d!111419 m!835575))

(assert (=> b!899608 d!111419))

(declare-fun b!899786 () Bool)

(declare-fun e!503542 () Bool)

(assert (=> b!899786 (= e!503542 tp_is_empty!18367)))

(declare-fun b!899787 () Bool)

(declare-fun e!503541 () Bool)

(assert (=> b!899787 (= e!503541 tp_is_empty!18367)))

(declare-fun mapNonEmpty!29229 () Bool)

(declare-fun mapRes!29229 () Bool)

(declare-fun tp!56217 () Bool)

(assert (=> mapNonEmpty!29229 (= mapRes!29229 (and tp!56217 e!503542))))

(declare-fun mapValue!29229 () ValueCell!8702)

(declare-fun mapRest!29229 () (Array (_ BitVec 32) ValueCell!8702))

(declare-fun mapKey!29229 () (_ BitVec 32))

(assert (=> mapNonEmpty!29229 (= mapRest!29220 (store mapRest!29229 mapKey!29229 mapValue!29229))))

(declare-fun condMapEmpty!29229 () Bool)

(declare-fun mapDefault!29229 () ValueCell!8702)

(assert (=> mapNonEmpty!29220 (= condMapEmpty!29229 (= mapRest!29220 ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29229)))))

(assert (=> mapNonEmpty!29220 (= tp!56201 (and e!503541 mapRes!29229))))

(declare-fun mapIsEmpty!29229 () Bool)

(assert (=> mapIsEmpty!29229 mapRes!29229))

(assert (= (and mapNonEmpty!29220 condMapEmpty!29229) mapIsEmpty!29229))

(assert (= (and mapNonEmpty!29220 (not condMapEmpty!29229)) mapNonEmpty!29229))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8702) mapValue!29229)) b!899786))

(assert (= (and mapNonEmpty!29220 ((_ is ValueCellFull!8702) mapDefault!29229)) b!899787))

(declare-fun m!835741 () Bool)

(assert (=> mapNonEmpty!29229 m!835741))

(declare-fun b_lambda!12987 () Bool)

(assert (= b_lambda!12985 (or (and b!899611 b_free!16039) b_lambda!12987)))

(check-sat (not b!899675) (not d!111407) (not b!899733) (not d!111405) (not mapNonEmpty!29229) (not b!899724) (not d!111419) (not b!899775) (not b!899721) (not bm!39967) (not b!899738) (not d!111417) (not b!899747) (not d!111411) (not b!899756) (not bm!39964) (not bm!39965) tp_is_empty!18367 (not b!899761) (not b!899749) (not bm!39966) (not b!899734) b_and!26333 (not b!899727) (not b_next!16039) (not b!899757) (not b_lambda!12987) (not d!111399) (not b!899736) (not b!899669) (not d!111403) (not b!899730) (not b!899758))
(check-sat b_and!26333 (not b_next!16039))
(get-model)

(declare-fun b!899798 () Bool)

(declare-fun res!607782 () Bool)

(declare-fun e!503545 () Bool)

(assert (=> b!899798 (=> (not res!607782) (not e!503545))))

(declare-fun size!25821 (LongMapFixedSize!4420) (_ BitVec 32))

(assert (=> b!899798 (= res!607782 (= (size!25821 thiss!1181) (bvadd (_size!2265 thiss!1181) (bvsdiv (bvadd (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!899799 () Bool)

(assert (=> b!899799 (= e!503545 (and (bvsge (extraKeys!5161 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5161 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2265 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111421 () Bool)

(declare-fun res!607780 () Bool)

(assert (=> d!111421 (=> (not res!607780) (not e!503545))))

(assert (=> d!111421 (= res!607780 (validMask!0 (mask!26200 thiss!1181)))))

(assert (=> d!111421 (= (simpleValid!328 thiss!1181) e!503545)))

(declare-fun b!899796 () Bool)

(declare-fun res!607783 () Bool)

(assert (=> b!899796 (=> (not res!607783) (not e!503545))))

(assert (=> b!899796 (= res!607783 (and (= (size!25816 (_values!5452 thiss!1181)) (bvadd (mask!26200 thiss!1181) #b00000000000000000000000000000001)) (= (size!25815 (_keys!10228 thiss!1181)) (size!25816 (_values!5452 thiss!1181))) (bvsge (_size!2265 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2265 thiss!1181) (bvadd (mask!26200 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!899797 () Bool)

(declare-fun res!607781 () Bool)

(assert (=> b!899797 (=> (not res!607781) (not e!503545))))

(assert (=> b!899797 (= res!607781 (bvsge (size!25821 thiss!1181) (_size!2265 thiss!1181)))))

(assert (= (and d!111421 res!607780) b!899796))

(assert (= (and b!899796 res!607783) b!899797))

(assert (= (and b!899797 res!607781) b!899798))

(assert (= (and b!899798 res!607782) b!899799))

(declare-fun m!835743 () Bool)

(assert (=> b!899798 m!835743))

(assert (=> d!111421 m!835575))

(assert (=> b!899797 m!835743))

(assert (=> d!111411 d!111421))

(declare-fun d!111423 () Bool)

(declare-fun e!503547 () Bool)

(assert (=> d!111423 e!503547))

(declare-fun res!607784 () Bool)

(assert (=> d!111423 (=> res!607784 e!503547)))

(declare-fun lt!406377 () Bool)

(assert (=> d!111423 (= res!607784 (not lt!406377))))

(declare-fun lt!406378 () Bool)

(assert (=> d!111423 (= lt!406377 lt!406378)))

(declare-fun lt!406380 () Unit!30512)

(declare-fun e!503546 () Unit!30512)

(assert (=> d!111423 (= lt!406380 e!503546)))

(declare-fun c!95194 () Bool)

(assert (=> d!111423 (= c!95194 lt!406378)))

(assert (=> d!111423 (= lt!406378 (containsKey!429 (toList!5394 lt!406338) (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111423 (= (contains!4395 lt!406338 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) lt!406377)))

(declare-fun b!899800 () Bool)

(declare-fun lt!406379 () Unit!30512)

(assert (=> b!899800 (= e!503546 lt!406379)))

(assert (=> b!899800 (= lt!406379 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 lt!406338) (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899800 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899801 () Bool)

(declare-fun Unit!30520 () Unit!30512)

(assert (=> b!899801 (= e!503546 Unit!30520)))

(declare-fun b!899802 () Bool)

(assert (=> b!899802 (= e!503547 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111423 c!95194) b!899800))

(assert (= (and d!111423 (not c!95194)) b!899801))

(assert (= (and d!111423 (not res!607784)) b!899802))

(assert (=> d!111423 m!835649))

(declare-fun m!835745 () Bool)

(assert (=> d!111423 m!835745))

(assert (=> b!899800 m!835649))

(declare-fun m!835747 () Bool)

(assert (=> b!899800 m!835747))

(assert (=> b!899800 m!835649))

(declare-fun m!835749 () Bool)

(assert (=> b!899800 m!835749))

(assert (=> b!899800 m!835749))

(declare-fun m!835751 () Bool)

(assert (=> b!899800 m!835751))

(assert (=> b!899802 m!835649))

(assert (=> b!899802 m!835749))

(assert (=> b!899802 m!835749))

(assert (=> b!899802 m!835751))

(assert (=> b!899738 d!111423))

(declare-fun d!111425 () Bool)

(declare-fun get!13343 (Option!467) V!29455)

(assert (=> d!111425 (= (apply!410 (+!2621 lt!406333 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) lt!406345) (get!13343 (getValueByKey!461 (toList!5394 (+!2621 lt!406333 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))) lt!406345)))))

(declare-fun bs!25237 () Bool)

(assert (= bs!25237 d!111425))

(declare-fun m!835753 () Bool)

(assert (=> bs!25237 m!835753))

(assert (=> bs!25237 m!835753))

(declare-fun m!835755 () Bool)

(assert (=> bs!25237 m!835755))

(assert (=> b!899721 d!111425))

(declare-fun d!111427 () Bool)

(declare-fun e!503549 () Bool)

(assert (=> d!111427 e!503549))

(declare-fun res!607785 () Bool)

(assert (=> d!111427 (=> res!607785 e!503549)))

(declare-fun lt!406381 () Bool)

(assert (=> d!111427 (= res!607785 (not lt!406381))))

(declare-fun lt!406382 () Bool)

(assert (=> d!111427 (= lt!406381 lt!406382)))

(declare-fun lt!406384 () Unit!30512)

(declare-fun e!503548 () Unit!30512)

(assert (=> d!111427 (= lt!406384 e!503548)))

(declare-fun c!95195 () Bool)

(assert (=> d!111427 (= c!95195 lt!406382)))

(assert (=> d!111427 (= lt!406382 (containsKey!429 (toList!5394 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) lt!406340))))

(assert (=> d!111427 (= (contains!4395 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) lt!406340) lt!406381)))

(declare-fun b!899803 () Bool)

(declare-fun lt!406383 () Unit!30512)

(assert (=> b!899803 (= e!503548 lt!406383)))

(assert (=> b!899803 (= lt!406383 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) lt!406340))))

(assert (=> b!899803 (isDefined!337 (getValueByKey!461 (toList!5394 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) lt!406340))))

(declare-fun b!899804 () Bool)

(declare-fun Unit!30521 () Unit!30512)

(assert (=> b!899804 (= e!503548 Unit!30521)))

(declare-fun b!899805 () Bool)

(assert (=> b!899805 (= e!503549 (isDefined!337 (getValueByKey!461 (toList!5394 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) lt!406340)))))

(assert (= (and d!111427 c!95195) b!899803))

(assert (= (and d!111427 (not c!95195)) b!899804))

(assert (= (and d!111427 (not res!607785)) b!899805))

(declare-fun m!835757 () Bool)

(assert (=> d!111427 m!835757))

(declare-fun m!835759 () Bool)

(assert (=> b!899803 m!835759))

(declare-fun m!835761 () Bool)

(assert (=> b!899803 m!835761))

(assert (=> b!899803 m!835761))

(declare-fun m!835763 () Bool)

(assert (=> b!899803 m!835763))

(assert (=> b!899805 m!835761))

(assert (=> b!899805 m!835761))

(assert (=> b!899805 m!835763))

(assert (=> b!899721 d!111427))

(declare-fun d!111429 () Bool)

(assert (=> d!111429 (= (apply!410 lt!406343 lt!406330) (get!13343 (getValueByKey!461 (toList!5394 lt!406343) lt!406330)))))

(declare-fun bs!25238 () Bool)

(assert (= bs!25238 d!111429))

(declare-fun m!835765 () Bool)

(assert (=> bs!25238 m!835765))

(assert (=> bs!25238 m!835765))

(declare-fun m!835767 () Bool)

(assert (=> bs!25238 m!835767))

(assert (=> b!899721 d!111429))

(declare-fun d!111431 () Bool)

(assert (=> d!111431 (= (apply!410 lt!406333 lt!406345) (get!13343 (getValueByKey!461 (toList!5394 lt!406333) lt!406345)))))

(declare-fun bs!25239 () Bool)

(assert (= bs!25239 d!111431))

(declare-fun m!835769 () Bool)

(assert (=> bs!25239 m!835769))

(assert (=> bs!25239 m!835769))

(declare-fun m!835771 () Bool)

(assert (=> bs!25239 m!835771))

(assert (=> b!899721 d!111431))

(declare-fun d!111433 () Bool)

(assert (=> d!111433 (= (apply!410 (+!2621 lt!406333 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) lt!406345) (apply!410 lt!406333 lt!406345))))

(declare-fun lt!406387 () Unit!30512)

(declare-fun choose!1518 (ListLongMap!10757 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> d!111433 (= lt!406387 (choose!1518 lt!406333 lt!406325 (minValue!5265 thiss!1181) lt!406345))))

(declare-fun e!503552 () Bool)

(assert (=> d!111433 e!503552))

(declare-fun res!607788 () Bool)

(assert (=> d!111433 (=> (not res!607788) (not e!503552))))

(assert (=> d!111433 (= res!607788 (contains!4395 lt!406333 lt!406345))))

(assert (=> d!111433 (= (addApplyDifferent!336 lt!406333 lt!406325 (minValue!5265 thiss!1181) lt!406345) lt!406387)))

(declare-fun b!899809 () Bool)

(assert (=> b!899809 (= e!503552 (not (= lt!406345 lt!406325)))))

(assert (= (and d!111433 res!607788) b!899809))

(declare-fun m!835773 () Bool)

(assert (=> d!111433 m!835773))

(declare-fun m!835775 () Bool)

(assert (=> d!111433 m!835775))

(assert (=> d!111433 m!835679))

(assert (=> d!111433 m!835681))

(assert (=> d!111433 m!835679))

(assert (=> d!111433 m!835689))

(assert (=> b!899721 d!111433))

(declare-fun d!111435 () Bool)

(assert (=> d!111435 (= (apply!410 (+!2621 lt!406343 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) lt!406330) (get!13343 (getValueByKey!461 (toList!5394 (+!2621 lt!406343 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))) lt!406330)))))

(declare-fun bs!25240 () Bool)

(assert (= bs!25240 d!111435))

(declare-fun m!835777 () Bool)

(assert (=> bs!25240 m!835777))

(assert (=> bs!25240 m!835777))

(declare-fun m!835779 () Bool)

(assert (=> bs!25240 m!835779))

(assert (=> b!899721 d!111435))

(declare-fun d!111437 () Bool)

(assert (=> d!111437 (= (apply!410 (+!2621 lt!406326 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) lt!406342) (apply!410 lt!406326 lt!406342))))

(declare-fun lt!406388 () Unit!30512)

(assert (=> d!111437 (= lt!406388 (choose!1518 lt!406326 lt!406346 (zeroValue!5265 thiss!1181) lt!406342))))

(declare-fun e!503553 () Bool)

(assert (=> d!111437 e!503553))

(declare-fun res!607789 () Bool)

(assert (=> d!111437 (=> (not res!607789) (not e!503553))))

(assert (=> d!111437 (= res!607789 (contains!4395 lt!406326 lt!406342))))

(assert (=> d!111437 (= (addApplyDifferent!336 lt!406326 lt!406346 (zeroValue!5265 thiss!1181) lt!406342) lt!406388)))

(declare-fun b!899810 () Bool)

(assert (=> b!899810 (= e!503553 (not (= lt!406342 lt!406346)))))

(assert (= (and d!111437 res!607789) b!899810))

(declare-fun m!835781 () Bool)

(assert (=> d!111437 m!835781))

(declare-fun m!835783 () Bool)

(assert (=> d!111437 m!835783))

(assert (=> d!111437 m!835675))

(assert (=> d!111437 m!835685))

(assert (=> d!111437 m!835675))

(assert (=> d!111437 m!835683))

(assert (=> b!899721 d!111437))

(declare-fun d!111439 () Bool)

(declare-fun e!503556 () Bool)

(assert (=> d!111439 e!503556))

(declare-fun res!607794 () Bool)

(assert (=> d!111439 (=> (not res!607794) (not e!503556))))

(declare-fun lt!406400 () ListLongMap!10757)

(assert (=> d!111439 (= res!607794 (contains!4395 lt!406400 (_1!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))))))

(declare-fun lt!406399 () List!17860)

(assert (=> d!111439 (= lt!406400 (ListLongMap!10758 lt!406399))))

(declare-fun lt!406397 () Unit!30512)

(declare-fun lt!406398 () Unit!30512)

(assert (=> d!111439 (= lt!406397 lt!406398)))

(assert (=> d!111439 (= (getValueByKey!461 lt!406399 (_1!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!252 (List!17860 (_ BitVec 64) V!29455) Unit!30512)

(assert (=> d!111439 (= lt!406398 (lemmaContainsTupThenGetReturnValue!252 lt!406399 (_1!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))))))

(declare-fun insertStrictlySorted!309 (List!17860 (_ BitVec 64) V!29455) List!17860)

(assert (=> d!111439 (= lt!406399 (insertStrictlySorted!309 (toList!5394 lt!406343) (_1!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))))))

(assert (=> d!111439 (= (+!2621 lt!406343 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) lt!406400)))

(declare-fun b!899815 () Bool)

(declare-fun res!607795 () Bool)

(assert (=> b!899815 (=> (not res!607795) (not e!503556))))

(assert (=> b!899815 (= res!607795 (= (getValueByKey!461 (toList!5394 lt!406400) (_1!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))))))))

(declare-fun b!899816 () Bool)

(declare-fun contains!4397 (List!17860 tuple2!12070) Bool)

(assert (=> b!899816 (= e!503556 (contains!4397 (toList!5394 lt!406400) (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))))))

(assert (= (and d!111439 res!607794) b!899815))

(assert (= (and b!899815 res!607795) b!899816))

(declare-fun m!835785 () Bool)

(assert (=> d!111439 m!835785))

(declare-fun m!835787 () Bool)

(assert (=> d!111439 m!835787))

(declare-fun m!835789 () Bool)

(assert (=> d!111439 m!835789))

(declare-fun m!835791 () Bool)

(assert (=> d!111439 m!835791))

(declare-fun m!835793 () Bool)

(assert (=> b!899815 m!835793))

(declare-fun m!835795 () Bool)

(assert (=> b!899816 m!835795))

(assert (=> b!899721 d!111439))

(declare-fun d!111441 () Bool)

(declare-fun e!503557 () Bool)

(assert (=> d!111441 e!503557))

(declare-fun res!607796 () Bool)

(assert (=> d!111441 (=> (not res!607796) (not e!503557))))

(declare-fun lt!406404 () ListLongMap!10757)

(assert (=> d!111441 (= res!607796 (contains!4395 lt!406404 (_1!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))))))

(declare-fun lt!406403 () List!17860)

(assert (=> d!111441 (= lt!406404 (ListLongMap!10758 lt!406403))))

(declare-fun lt!406401 () Unit!30512)

(declare-fun lt!406402 () Unit!30512)

(assert (=> d!111441 (= lt!406401 lt!406402)))

(assert (=> d!111441 (= (getValueByKey!461 lt!406403 (_1!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111441 (= lt!406402 (lemmaContainsTupThenGetReturnValue!252 lt!406403 (_1!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111441 (= lt!406403 (insertStrictlySorted!309 (toList!5394 lt!406331) (_1!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111441 (= (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) lt!406404)))

(declare-fun b!899817 () Bool)

(declare-fun res!607797 () Bool)

(assert (=> b!899817 (=> (not res!607797) (not e!503557))))

(assert (=> b!899817 (= res!607797 (= (getValueByKey!461 (toList!5394 lt!406404) (_1!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))))))))

(declare-fun b!899818 () Bool)

(assert (=> b!899818 (= e!503557 (contains!4397 (toList!5394 lt!406404) (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))))))

(assert (= (and d!111441 res!607796) b!899817))

(assert (= (and b!899817 res!607797) b!899818))

(declare-fun m!835797 () Bool)

(assert (=> d!111441 m!835797))

(declare-fun m!835799 () Bool)

(assert (=> d!111441 m!835799))

(declare-fun m!835801 () Bool)

(assert (=> d!111441 m!835801))

(declare-fun m!835803 () Bool)

(assert (=> d!111441 m!835803))

(declare-fun m!835805 () Bool)

(assert (=> b!899817 m!835805))

(declare-fun m!835807 () Bool)

(assert (=> b!899818 m!835807))

(assert (=> b!899721 d!111441))

(declare-fun b!899844 () Bool)

(declare-fun e!503576 () Bool)

(declare-fun e!503578 () Bool)

(assert (=> b!899844 (= e!503576 e!503578)))

(declare-fun c!95207 () Bool)

(declare-fun e!503573 () Bool)

(assert (=> b!899844 (= c!95207 e!503573)))

(declare-fun res!607807 () Bool)

(assert (=> b!899844 (=> (not res!607807) (not e!503573))))

(assert (=> b!899844 (= res!607807 (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899845 () Bool)

(declare-fun e!503572 () Bool)

(declare-fun lt!406420 () ListLongMap!10757)

(declare-fun isEmpty!695 (ListLongMap!10757) Bool)

(assert (=> b!899845 (= e!503572 (isEmpty!695 lt!406420))))

(declare-fun b!899846 () Bool)

(declare-fun e!503577 () ListLongMap!10757)

(declare-fun call!39974 () ListLongMap!10757)

(assert (=> b!899846 (= e!503577 call!39974)))

(declare-fun b!899847 () Bool)

(assert (=> b!899847 (= e!503572 (= lt!406420 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5438 thiss!1181))))))

(declare-fun b!899848 () Bool)

(assert (=> b!899848 (= e!503573 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899848 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!899849 () Bool)

(assert (=> b!899849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> b!899849 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_values!5452 thiss!1181))))))

(declare-fun e!503575 () Bool)

(assert (=> b!899849 (= e!503575 (= (apply!410 lt!406420 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13342 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!899850 () Bool)

(declare-fun e!503574 () ListLongMap!10757)

(assert (=> b!899850 (= e!503574 e!503577)))

(declare-fun c!95205 () Bool)

(assert (=> b!899850 (= c!95205 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899851 () Bool)

(declare-fun lt!406422 () Unit!30512)

(declare-fun lt!406423 () Unit!30512)

(assert (=> b!899851 (= lt!406422 lt!406423)))

(declare-fun lt!406425 () (_ BitVec 64))

(declare-fun lt!406421 () V!29455)

(declare-fun lt!406419 () (_ BitVec 64))

(declare-fun lt!406424 () ListLongMap!10757)

(assert (=> b!899851 (not (contains!4395 (+!2621 lt!406424 (tuple2!12071 lt!406419 lt!406421)) lt!406425))))

(declare-fun addStillNotContains!218 (ListLongMap!10757 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> b!899851 (= lt!406423 (addStillNotContains!218 lt!406424 lt!406419 lt!406421 lt!406425))))

(assert (=> b!899851 (= lt!406425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899851 (= lt!406421 (get!13342 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899851 (= lt!406419 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899851 (= lt!406424 call!39974)))

(assert (=> b!899851 (= e!503577 (+!2621 call!39974 (tuple2!12071 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) (get!13342 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!899843 () Bool)

(assert (=> b!899843 (= e!503578 e!503575)))

(assert (=> b!899843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun res!607808 () Bool)

(assert (=> b!899843 (= res!607808 (contains!4395 lt!406420 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899843 (=> (not res!607808) (not e!503575))))

(declare-fun d!111443 () Bool)

(assert (=> d!111443 e!503576))

(declare-fun res!607806 () Bool)

(assert (=> d!111443 (=> (not res!607806) (not e!503576))))

(assert (=> d!111443 (= res!607806 (not (contains!4395 lt!406420 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111443 (= lt!406420 e!503574)))

(declare-fun c!95204 () Bool)

(assert (=> d!111443 (= c!95204 (bvsge #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111443 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111443 (= (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) lt!406420)))

(declare-fun b!899852 () Bool)

(assert (=> b!899852 (= e!503578 e!503572)))

(declare-fun c!95206 () Bool)

(assert (=> b!899852 (= c!95206 (bvslt #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun bm!39971 () Bool)

(assert (=> bm!39971 (= call!39974 (getCurrentListMapNoExtraKeys!3318 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5438 thiss!1181)))))

(declare-fun b!899853 () Bool)

(declare-fun res!607809 () Bool)

(assert (=> b!899853 (=> (not res!607809) (not e!503576))))

(assert (=> b!899853 (= res!607809 (not (contains!4395 lt!406420 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899854 () Bool)

(assert (=> b!899854 (= e!503574 (ListLongMap!10758 Nil!17857))))

(assert (= (and d!111443 c!95204) b!899854))

(assert (= (and d!111443 (not c!95204)) b!899850))

(assert (= (and b!899850 c!95205) b!899851))

(assert (= (and b!899850 (not c!95205)) b!899846))

(assert (= (or b!899851 b!899846) bm!39971))

(assert (= (and d!111443 res!607806) b!899853))

(assert (= (and b!899853 res!607809) b!899844))

(assert (= (and b!899844 res!607807) b!899848))

(assert (= (and b!899844 c!95207) b!899843))

(assert (= (and b!899844 (not c!95207)) b!899852))

(assert (= (and b!899843 res!607808) b!899849))

(assert (= (and b!899852 c!95206) b!899847))

(assert (= (and b!899852 (not c!95206)) b!899845))

(declare-fun b_lambda!12989 () Bool)

(assert (=> (not b_lambda!12989) (not b!899849)))

(assert (=> b!899849 t!25203))

(declare-fun b_and!26335 () Bool)

(assert (= b_and!26333 (and (=> t!25203 result!10167) b_and!26335)))

(declare-fun b_lambda!12991 () Bool)

(assert (=> (not b_lambda!12991) (not b!899851)))

(assert (=> b!899851 t!25203))

(declare-fun b_and!26337 () Bool)

(assert (= b_and!26335 (and (=> t!25203 result!10167) b_and!26337)))

(assert (=> b!899848 m!835649))

(assert (=> b!899848 m!835649))

(assert (=> b!899848 m!835695))

(assert (=> b!899849 m!835649))

(assert (=> b!899849 m!835703))

(assert (=> b!899849 m!835699))

(assert (=> b!899849 m!835703))

(assert (=> b!899849 m!835705))

(assert (=> b!899849 m!835649))

(declare-fun m!835809 () Bool)

(assert (=> b!899849 m!835809))

(assert (=> b!899849 m!835699))

(declare-fun m!835811 () Bool)

(assert (=> d!111443 m!835811))

(assert (=> d!111443 m!835575))

(declare-fun m!835813 () Bool)

(assert (=> b!899847 m!835813))

(assert (=> b!899851 m!835649))

(assert (=> b!899851 m!835703))

(assert (=> b!899851 m!835699))

(assert (=> b!899851 m!835703))

(assert (=> b!899851 m!835705))

(declare-fun m!835815 () Bool)

(assert (=> b!899851 m!835815))

(declare-fun m!835817 () Bool)

(assert (=> b!899851 m!835817))

(declare-fun m!835819 () Bool)

(assert (=> b!899851 m!835819))

(declare-fun m!835821 () Bool)

(assert (=> b!899851 m!835821))

(assert (=> b!899851 m!835817))

(assert (=> b!899851 m!835699))

(declare-fun m!835823 () Bool)

(assert (=> b!899853 m!835823))

(declare-fun m!835825 () Bool)

(assert (=> b!899845 m!835825))

(assert (=> b!899850 m!835649))

(assert (=> b!899850 m!835649))

(assert (=> b!899850 m!835695))

(assert (=> bm!39971 m!835813))

(assert (=> b!899843 m!835649))

(assert (=> b!899843 m!835649))

(declare-fun m!835827 () Bool)

(assert (=> b!899843 m!835827))

(assert (=> b!899721 d!111443))

(declare-fun d!111445 () Bool)

(assert (=> d!111445 (= (apply!410 lt!406326 lt!406342) (get!13343 (getValueByKey!461 (toList!5394 lt!406326) lt!406342)))))

(declare-fun bs!25241 () Bool)

(assert (= bs!25241 d!111445))

(declare-fun m!835829 () Bool)

(assert (=> bs!25241 m!835829))

(assert (=> bs!25241 m!835829))

(declare-fun m!835831 () Bool)

(assert (=> bs!25241 m!835831))

(assert (=> b!899721 d!111445))

(declare-fun d!111447 () Bool)

(declare-fun e!503579 () Bool)

(assert (=> d!111447 e!503579))

(declare-fun res!607810 () Bool)

(assert (=> d!111447 (=> (not res!607810) (not e!503579))))

(declare-fun lt!406429 () ListLongMap!10757)

(assert (=> d!111447 (= res!607810 (contains!4395 lt!406429 (_1!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))))))

(declare-fun lt!406428 () List!17860)

(assert (=> d!111447 (= lt!406429 (ListLongMap!10758 lt!406428))))

(declare-fun lt!406426 () Unit!30512)

(declare-fun lt!406427 () Unit!30512)

(assert (=> d!111447 (= lt!406426 lt!406427)))

(assert (=> d!111447 (= (getValueByKey!461 lt!406428 (_1!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111447 (= lt!406427 (lemmaContainsTupThenGetReturnValue!252 lt!406428 (_1!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111447 (= lt!406428 (insertStrictlySorted!309 (toList!5394 lt!406326) (_1!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111447 (= (+!2621 lt!406326 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) lt!406429)))

(declare-fun b!899855 () Bool)

(declare-fun res!607811 () Bool)

(assert (=> b!899855 (=> (not res!607811) (not e!503579))))

(assert (=> b!899855 (= res!607811 (= (getValueByKey!461 (toList!5394 lt!406429) (_1!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))))))))

(declare-fun b!899856 () Bool)

(assert (=> b!899856 (= e!503579 (contains!4397 (toList!5394 lt!406429) (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))))))

(assert (= (and d!111447 res!607810) b!899855))

(assert (= (and b!899855 res!607811) b!899856))

(declare-fun m!835833 () Bool)

(assert (=> d!111447 m!835833))

(declare-fun m!835835 () Bool)

(assert (=> d!111447 m!835835))

(declare-fun m!835837 () Bool)

(assert (=> d!111447 m!835837))

(declare-fun m!835839 () Bool)

(assert (=> d!111447 m!835839))

(declare-fun m!835841 () Bool)

(assert (=> b!899855 m!835841))

(declare-fun m!835843 () Bool)

(assert (=> b!899856 m!835843))

(assert (=> b!899721 d!111447))

(declare-fun d!111449 () Bool)

(assert (=> d!111449 (= (apply!410 (+!2621 lt!406326 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181))) lt!406342) (get!13343 (getValueByKey!461 (toList!5394 (+!2621 lt!406326 (tuple2!12071 lt!406346 (zeroValue!5265 thiss!1181)))) lt!406342)))))

(declare-fun bs!25242 () Bool)

(assert (= bs!25242 d!111449))

(declare-fun m!835845 () Bool)

(assert (=> bs!25242 m!835845))

(assert (=> bs!25242 m!835845))

(declare-fun m!835847 () Bool)

(assert (=> bs!25242 m!835847))

(assert (=> b!899721 d!111449))

(declare-fun d!111451 () Bool)

(assert (=> d!111451 (= (apply!410 (+!2621 lt!406343 (tuple2!12071 lt!406332 (minValue!5265 thiss!1181))) lt!406330) (apply!410 lt!406343 lt!406330))))

(declare-fun lt!406430 () Unit!30512)

(assert (=> d!111451 (= lt!406430 (choose!1518 lt!406343 lt!406332 (minValue!5265 thiss!1181) lt!406330))))

(declare-fun e!503580 () Bool)

(assert (=> d!111451 e!503580))

(declare-fun res!607812 () Bool)

(assert (=> d!111451 (=> (not res!607812) (not e!503580))))

(assert (=> d!111451 (= res!607812 (contains!4395 lt!406343 lt!406330))))

(assert (=> d!111451 (= (addApplyDifferent!336 lt!406343 lt!406332 (minValue!5265 thiss!1181) lt!406330) lt!406430)))

(declare-fun b!899857 () Bool)

(assert (=> b!899857 (= e!503580 (not (= lt!406330 lt!406332)))))

(assert (= (and d!111451 res!607812) b!899857))

(declare-fun m!835849 () Bool)

(assert (=> d!111451 m!835849))

(declare-fun m!835851 () Bool)

(assert (=> d!111451 m!835851))

(assert (=> d!111451 m!835669))

(assert (=> d!111451 m!835671))

(assert (=> d!111451 m!835669))

(assert (=> d!111451 m!835677))

(assert (=> b!899721 d!111451))

(declare-fun d!111453 () Bool)

(declare-fun e!503581 () Bool)

(assert (=> d!111453 e!503581))

(declare-fun res!607813 () Bool)

(assert (=> d!111453 (=> (not res!607813) (not e!503581))))

(declare-fun lt!406434 () ListLongMap!10757)

(assert (=> d!111453 (= res!607813 (contains!4395 lt!406434 (_1!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))))))

(declare-fun lt!406433 () List!17860)

(assert (=> d!111453 (= lt!406434 (ListLongMap!10758 lt!406433))))

(declare-fun lt!406431 () Unit!30512)

(declare-fun lt!406432 () Unit!30512)

(assert (=> d!111453 (= lt!406431 lt!406432)))

(assert (=> d!111453 (= (getValueByKey!461 lt!406433 (_1!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))))))

(assert (=> d!111453 (= lt!406432 (lemmaContainsTupThenGetReturnValue!252 lt!406433 (_1!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))))))

(assert (=> d!111453 (= lt!406433 (insertStrictlySorted!309 (toList!5394 lt!406333) (_1!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))))))

(assert (=> d!111453 (= (+!2621 lt!406333 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))) lt!406434)))

(declare-fun b!899858 () Bool)

(declare-fun res!607814 () Bool)

(assert (=> b!899858 (=> (not res!607814) (not e!503581))))

(assert (=> b!899858 (= res!607814 (= (getValueByKey!461 (toList!5394 lt!406434) (_1!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))))))))

(declare-fun b!899859 () Bool)

(assert (=> b!899859 (= e!503581 (contains!4397 (toList!5394 lt!406434) (tuple2!12071 lt!406325 (minValue!5265 thiss!1181))))))

(assert (= (and d!111453 res!607813) b!899858))

(assert (= (and b!899858 res!607814) b!899859))

(declare-fun m!835853 () Bool)

(assert (=> d!111453 m!835853))

(declare-fun m!835855 () Bool)

(assert (=> d!111453 m!835855))

(declare-fun m!835857 () Bool)

(assert (=> d!111453 m!835857))

(declare-fun m!835859 () Bool)

(assert (=> d!111453 m!835859))

(declare-fun m!835861 () Bool)

(assert (=> b!899858 m!835861))

(declare-fun m!835863 () Bool)

(assert (=> b!899859 m!835863))

(assert (=> b!899721 d!111453))

(declare-fun d!111455 () Bool)

(assert (=> d!111455 (contains!4395 (+!2621 lt!406331 (tuple2!12071 lt!406339 (zeroValue!5265 thiss!1181))) lt!406340)))

(declare-fun lt!406437 () Unit!30512)

(declare-fun choose!1519 (ListLongMap!10757 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30512)

(assert (=> d!111455 (= lt!406437 (choose!1519 lt!406331 lt!406339 (zeroValue!5265 thiss!1181) lt!406340))))

(assert (=> d!111455 (contains!4395 lt!406331 lt!406340)))

(assert (=> d!111455 (= (addStillContains!336 lt!406331 lt!406339 (zeroValue!5265 thiss!1181) lt!406340) lt!406437)))

(declare-fun bs!25243 () Bool)

(assert (= bs!25243 d!111455))

(assert (=> bs!25243 m!835659))

(assert (=> bs!25243 m!835659))

(assert (=> bs!25243 m!835687))

(declare-fun m!835865 () Bool)

(assert (=> bs!25243 m!835865))

(declare-fun m!835867 () Bool)

(assert (=> bs!25243 m!835867))

(assert (=> b!899721 d!111455))

(assert (=> d!111417 d!111419))

(declare-fun d!111457 () Bool)

(declare-fun e!503584 () Bool)

(assert (=> d!111457 e!503584))

(declare-fun res!607817 () Bool)

(assert (=> d!111457 (=> res!607817 e!503584)))

(declare-fun lt!406440 () SeekEntryResult!8935)

(assert (=> d!111457 (= res!607817 (not ((_ is Found!8935) lt!406440)))))

(assert (=> d!111457 (= lt!406440 (seekEntry!0 key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(assert (=> d!111457 true))

(declare-fun _$36!375 () Unit!30512)

(assert (=> d!111457 (= (choose!1517 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785) _$36!375)))

(declare-fun b!899863 () Bool)

(assert (=> b!899863 (= e!503584 (inRange!0 (index!38112 lt!406440) (mask!26200 thiss!1181)))))

(assert (= (and d!111457 (not res!607817)) b!899863))

(assert (=> d!111457 m!835583))

(declare-fun m!835869 () Bool)

(assert (=> b!899863 m!835869))

(assert (=> d!111417 d!111457))

(assert (=> d!111417 d!111397))

(assert (=> d!111403 d!111401))

(declare-fun d!111459 () Bool)

(assert (=> d!111459 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111459 true))

(declare-fun _$60!424 () Unit!30512)

(assert (=> d!111459 (= (choose!13 (_keys!10228 thiss!1181) key!785 (index!38112 lt!406248)) _$60!424)))

(declare-fun bs!25244 () Bool)

(assert (= bs!25244 d!111459))

(assert (=> bs!25244 m!835573))

(assert (=> d!111403 d!111459))

(declare-fun d!111461 () Bool)

(declare-fun lt!406443 () (_ BitVec 32))

(assert (=> d!111461 (and (bvsge lt!406443 #b00000000000000000000000000000000) (bvsle lt!406443 (bvsub (size!25815 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503589 () (_ BitVec 32))

(assert (=> d!111461 (= lt!406443 e!503589)))

(declare-fun c!95212 () Bool)

(assert (=> d!111461 (= c!95212 (bvsge #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111461 (and (bvsle #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25815 (_keys!10228 thiss!1181)) (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111461 (= (arrayCountValidKeys!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))) lt!406443)))

(declare-fun b!899872 () Bool)

(declare-fun e!503590 () (_ BitVec 32))

(declare-fun call!39977 () (_ BitVec 32))

(assert (=> b!899872 (= e!503590 call!39977)))

(declare-fun b!899873 () Bool)

(assert (=> b!899873 (= e!503589 #b00000000000000000000000000000000)))

(declare-fun bm!39974 () Bool)

(assert (=> bm!39974 (= call!39977 (arrayCountValidKeys!0 (_keys!10228 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899874 () Bool)

(assert (=> b!899874 (= e!503590 (bvadd #b00000000000000000000000000000001 call!39977))))

(declare-fun b!899875 () Bool)

(assert (=> b!899875 (= e!503589 e!503590)))

(declare-fun c!95213 () Bool)

(assert (=> b!899875 (= c!95213 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111461 c!95212) b!899873))

(assert (= (and d!111461 (not c!95212)) b!899875))

(assert (= (and b!899875 c!95213) b!899874))

(assert (= (and b!899875 (not c!95213)) b!899872))

(assert (= (or b!899874 b!899872) bm!39974))

(declare-fun m!835871 () Bool)

(assert (=> bm!39974 m!835871))

(assert (=> b!899875 m!835649))

(assert (=> b!899875 m!835649))

(assert (=> b!899875 m!835695))

(assert (=> b!899756 d!111461))

(declare-fun d!111463 () Bool)

(assert (=> d!111463 (= (apply!410 lt!406338 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13343 (getValueByKey!461 (toList!5394 lt!406338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25245 () Bool)

(assert (= bs!25245 d!111463))

(declare-fun m!835873 () Bool)

(assert (=> bs!25245 m!835873))

(assert (=> bs!25245 m!835873))

(declare-fun m!835875 () Bool)

(assert (=> bs!25245 m!835875))

(assert (=> b!899736 d!111463))

(declare-fun d!111465 () Bool)

(declare-fun e!503592 () Bool)

(assert (=> d!111465 e!503592))

(declare-fun res!607818 () Bool)

(assert (=> d!111465 (=> res!607818 e!503592)))

(declare-fun lt!406444 () Bool)

(assert (=> d!111465 (= res!607818 (not lt!406444))))

(declare-fun lt!406445 () Bool)

(assert (=> d!111465 (= lt!406444 lt!406445)))

(declare-fun lt!406447 () Unit!30512)

(declare-fun e!503591 () Unit!30512)

(assert (=> d!111465 (= lt!406447 e!503591)))

(declare-fun c!95214 () Bool)

(assert (=> d!111465 (= c!95214 lt!406445)))

(assert (=> d!111465 (= lt!406445 (containsKey!429 (toList!5394 lt!406338) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111465 (= (contains!4395 lt!406338 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406444)))

(declare-fun b!899876 () Bool)

(declare-fun lt!406446 () Unit!30512)

(assert (=> b!899876 (= e!503591 lt!406446)))

(assert (=> b!899876 (= lt!406446 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 lt!406338) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899876 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899877 () Bool)

(declare-fun Unit!30522 () Unit!30512)

(assert (=> b!899877 (= e!503591 Unit!30522)))

(declare-fun b!899878 () Bool)

(assert (=> b!899878 (= e!503592 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111465 c!95214) b!899876))

(assert (= (and d!111465 (not c!95214)) b!899877))

(assert (= (and d!111465 (not res!607818)) b!899878))

(declare-fun m!835877 () Bool)

(assert (=> d!111465 m!835877))

(declare-fun m!835879 () Bool)

(assert (=> b!899876 m!835879))

(declare-fun m!835881 () Bool)

(assert (=> b!899876 m!835881))

(assert (=> b!899876 m!835881))

(declare-fun m!835883 () Bool)

(assert (=> b!899876 m!835883))

(assert (=> b!899878 m!835881))

(assert (=> b!899878 m!835881))

(assert (=> b!899878 m!835883))

(assert (=> bm!39967 d!111465))

(declare-fun d!111467 () Bool)

(declare-fun res!607819 () Bool)

(declare-fun e!503593 () Bool)

(assert (=> d!111467 (=> res!607819 e!503593)))

(assert (=> d!111467 (= res!607819 (= (select (arr!25355 (_keys!10228 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111467 (= (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503593)))

(declare-fun b!899879 () Bool)

(declare-fun e!503594 () Bool)

(assert (=> b!899879 (= e!503593 e!503594)))

(declare-fun res!607820 () Bool)

(assert (=> b!899879 (=> (not res!607820) (not e!503594))))

(assert (=> b!899879 (= res!607820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun b!899880 () Bool)

(assert (=> b!899880 (= e!503594 (arrayContainsKey!0 (_keys!10228 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111467 (not res!607819)) b!899879))

(assert (= (and b!899879 res!607820) b!899880))

(declare-fun m!835885 () Bool)

(assert (=> d!111467 m!835885))

(declare-fun m!835887 () Bool)

(assert (=> b!899880 m!835887))

(assert (=> b!899675 d!111467))

(declare-fun b!899893 () Bool)

(declare-fun c!95222 () Bool)

(declare-fun lt!406452 () (_ BitVec 64))

(assert (=> b!899893 (= c!95222 (= lt!406452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503601 () SeekEntryResult!8935)

(declare-fun e!503602 () SeekEntryResult!8935)

(assert (=> b!899893 (= e!503601 e!503602)))

(declare-fun b!899894 () Bool)

(declare-fun e!503603 () SeekEntryResult!8935)

(assert (=> b!899894 (= e!503603 Undefined!8935)))

(declare-fun d!111469 () Bool)

(declare-fun lt!406453 () SeekEntryResult!8935)

(assert (=> d!111469 (and (or ((_ is Undefined!8935) lt!406453) (not ((_ is Found!8935) lt!406453)) (and (bvsge (index!38112 lt!406453) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406453) (size!25815 (_keys!10228 thiss!1181))))) (or ((_ is Undefined!8935) lt!406453) ((_ is Found!8935) lt!406453) (not ((_ is MissingVacant!8935) lt!406453)) (not (= (index!38114 lt!406453) (index!38113 lt!406376))) (and (bvsge (index!38114 lt!406453) #b00000000000000000000000000000000) (bvslt (index!38114 lt!406453) (size!25815 (_keys!10228 thiss!1181))))) (or ((_ is Undefined!8935) lt!406453) (ite ((_ is Found!8935) lt!406453) (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406453)) key!785) (and ((_ is MissingVacant!8935) lt!406453) (= (index!38114 lt!406453) (index!38113 lt!406376)) (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38114 lt!406453)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111469 (= lt!406453 e!503603)))

(declare-fun c!95223 () Bool)

(assert (=> d!111469 (= c!95223 (bvsge (x!76673 lt!406376) #b01111111111111111111111111111110))))

(assert (=> d!111469 (= lt!406452 (select (arr!25355 (_keys!10228 thiss!1181)) (index!38113 lt!406376)))))

(assert (=> d!111469 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111469 (= (seekKeyOrZeroReturnVacant!0 (x!76673 lt!406376) (index!38113 lt!406376) (index!38113 lt!406376) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)) lt!406453)))

(declare-fun b!899895 () Bool)

(assert (=> b!899895 (= e!503602 (MissingVacant!8935 (index!38113 lt!406376)))))

(declare-fun b!899896 () Bool)

(assert (=> b!899896 (= e!503601 (Found!8935 (index!38113 lt!406376)))))

(declare-fun b!899897 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899897 (= e!503602 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76673 lt!406376) #b00000000000000000000000000000001) (nextIndex!0 (index!38113 lt!406376) (x!76673 lt!406376) (mask!26200 thiss!1181)) (index!38113 lt!406376) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun b!899898 () Bool)

(assert (=> b!899898 (= e!503603 e!503601)))

(declare-fun c!95221 () Bool)

(assert (=> b!899898 (= c!95221 (= lt!406452 key!785))))

(assert (= (and d!111469 c!95223) b!899894))

(assert (= (and d!111469 (not c!95223)) b!899898))

(assert (= (and b!899898 c!95221) b!899896))

(assert (= (and b!899898 (not c!95221)) b!899893))

(assert (= (and b!899893 c!95222) b!899895))

(assert (= (and b!899893 (not c!95222)) b!899897))

(declare-fun m!835889 () Bool)

(assert (=> d!111469 m!835889))

(declare-fun m!835891 () Bool)

(assert (=> d!111469 m!835891))

(assert (=> d!111469 m!835733))

(assert (=> d!111469 m!835575))

(declare-fun m!835893 () Bool)

(assert (=> b!899897 m!835893))

(assert (=> b!899897 m!835893))

(declare-fun m!835895 () Bool)

(assert (=> b!899897 m!835895))

(assert (=> b!899775 d!111469))

(declare-fun d!111471 () Bool)

(declare-fun e!503604 () Bool)

(assert (=> d!111471 e!503604))

(declare-fun res!607821 () Bool)

(assert (=> d!111471 (=> (not res!607821) (not e!503604))))

(declare-fun lt!406457 () ListLongMap!10757)

(assert (=> d!111471 (= res!607821 (contains!4395 lt!406457 (_1!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun lt!406456 () List!17860)

(assert (=> d!111471 (= lt!406457 (ListLongMap!10758 lt!406456))))

(declare-fun lt!406454 () Unit!30512)

(declare-fun lt!406455 () Unit!30512)

(assert (=> d!111471 (= lt!406454 lt!406455)))

(assert (=> d!111471 (= (getValueByKey!461 lt!406456 (_1!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))) (Some!466 (_2!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(assert (=> d!111471 (= lt!406455 (lemmaContainsTupThenGetReturnValue!252 lt!406456 (_1!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (_2!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(assert (=> d!111471 (= lt!406456 (insertStrictlySorted!309 (toList!5394 (ite c!95176 call!39968 (ite c!95178 call!39967 call!39966))) (_1!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (_2!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(assert (=> d!111471 (= (+!2621 (ite c!95176 call!39968 (ite c!95178 call!39967 call!39966)) (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) lt!406457)))

(declare-fun b!899899 () Bool)

(declare-fun res!607822 () Bool)

(assert (=> b!899899 (=> (not res!607822) (not e!503604))))

(assert (=> b!899899 (= res!607822 (= (getValueByKey!461 (toList!5394 lt!406457) (_1!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))) (Some!466 (_2!6046 (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))))

(declare-fun b!899900 () Bool)

(assert (=> b!899900 (= e!503604 (contains!4397 (toList!5394 lt!406457) (ite (or c!95176 c!95178) (tuple2!12071 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (= (and d!111471 res!607821) b!899899))

(assert (= (and b!899899 res!607822) b!899900))

(declare-fun m!835897 () Bool)

(assert (=> d!111471 m!835897))

(declare-fun m!835899 () Bool)

(assert (=> d!111471 m!835899))

(declare-fun m!835901 () Bool)

(assert (=> d!111471 m!835901))

(declare-fun m!835903 () Bool)

(assert (=> d!111471 m!835903))

(declare-fun m!835905 () Bool)

(assert (=> b!899899 m!835905))

(declare-fun m!835907 () Bool)

(assert (=> b!899900 m!835907))

(assert (=> bm!39966 d!111471))

(declare-fun d!111473 () Bool)

(declare-fun e!503606 () Bool)

(assert (=> d!111473 e!503606))

(declare-fun res!607823 () Bool)

(assert (=> d!111473 (=> res!607823 e!503606)))

(declare-fun lt!406458 () Bool)

(assert (=> d!111473 (= res!607823 (not lt!406458))))

(declare-fun lt!406459 () Bool)

(assert (=> d!111473 (= lt!406458 lt!406459)))

(declare-fun lt!406461 () Unit!30512)

(declare-fun e!503605 () Unit!30512)

(assert (=> d!111473 (= lt!406461 e!503605)))

(declare-fun c!95224 () Bool)

(assert (=> d!111473 (= c!95224 lt!406459)))

(assert (=> d!111473 (= lt!406459 (containsKey!429 (toList!5394 lt!406338) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111473 (= (contains!4395 lt!406338 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406458)))

(declare-fun b!899901 () Bool)

(declare-fun lt!406460 () Unit!30512)

(assert (=> b!899901 (= e!503605 lt!406460)))

(assert (=> b!899901 (= lt!406460 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 lt!406338) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899901 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899902 () Bool)

(declare-fun Unit!30523 () Unit!30512)

(assert (=> b!899902 (= e!503605 Unit!30523)))

(declare-fun b!899903 () Bool)

(assert (=> b!899903 (= e!503606 (isDefined!337 (getValueByKey!461 (toList!5394 lt!406338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111473 c!95224) b!899901))

(assert (= (and d!111473 (not c!95224)) b!899902))

(assert (= (and d!111473 (not res!607823)) b!899903))

(declare-fun m!835909 () Bool)

(assert (=> d!111473 m!835909))

(declare-fun m!835911 () Bool)

(assert (=> b!899901 m!835911))

(assert (=> b!899901 m!835873))

(assert (=> b!899901 m!835873))

(declare-fun m!835913 () Bool)

(assert (=> b!899901 m!835913))

(assert (=> b!899903 m!835873))

(assert (=> b!899903 m!835873))

(assert (=> b!899903 m!835913))

(assert (=> bm!39965 d!111473))

(declare-fun d!111475 () Bool)

(assert (=> d!111475 (= (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899733 d!111475))

(assert (=> d!111405 d!111397))

(assert (=> b!899734 d!111475))

(declare-fun d!111477 () Bool)

(assert (=> d!111477 (= (apply!410 lt!406338 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13343 (getValueByKey!461 (toList!5394 lt!406338) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25246 () Bool)

(assert (= bs!25246 d!111477))

(assert (=> bs!25246 m!835881))

(assert (=> bs!25246 m!835881))

(declare-fun m!835915 () Bool)

(assert (=> bs!25246 m!835915))

(assert (=> b!899730 d!111477))

(assert (=> b!899669 d!111407))

(assert (=> b!899669 d!111405))

(declare-fun b!899922 () Bool)

(declare-fun lt!406467 () SeekEntryResult!8935)

(assert (=> b!899922 (and (bvsge (index!38113 lt!406467) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406467) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun e!503618 () Bool)

(assert (=> b!899922 (= e!503618 (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38113 lt!406467)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899923 () Bool)

(declare-fun e!503620 () SeekEntryResult!8935)

(assert (=> b!899923 (= e!503620 (Intermediate!8935 false (toIndex!0 key!785 (mask!26200 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899924 () Bool)

(assert (=> b!899924 (and (bvsge (index!38113 lt!406467) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406467) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun res!607832 () Bool)

(assert (=> b!899924 (= res!607832 (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38113 lt!406467)) key!785))))

(assert (=> b!899924 (=> res!607832 e!503618)))

(declare-fun e!503621 () Bool)

(assert (=> b!899924 (= e!503621 e!503618)))

(declare-fun b!899925 () Bool)

(declare-fun e!503617 () Bool)

(assert (=> b!899925 (= e!503617 (bvsge (x!76673 lt!406467) #b01111111111111111111111111111110))))

(declare-fun b!899926 () Bool)

(declare-fun e!503619 () SeekEntryResult!8935)

(assert (=> b!899926 (= e!503619 (Intermediate!8935 true (toIndex!0 key!785 (mask!26200 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899927 () Bool)

(assert (=> b!899927 (and (bvsge (index!38113 lt!406467) #b00000000000000000000000000000000) (bvslt (index!38113 lt!406467) (size!25815 (_keys!10228 thiss!1181))))))

(declare-fun res!607831 () Bool)

(assert (=> b!899927 (= res!607831 (= (select (arr!25355 (_keys!10228 thiss!1181)) (index!38113 lt!406467)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899927 (=> res!607831 e!503618)))

(declare-fun d!111479 () Bool)

(assert (=> d!111479 e!503617))

(declare-fun c!95232 () Bool)

(assert (=> d!111479 (= c!95232 (and ((_ is Intermediate!8935) lt!406467) (undefined!9747 lt!406467)))))

(assert (=> d!111479 (= lt!406467 e!503619)))

(declare-fun c!95231 () Bool)

(assert (=> d!111479 (= c!95231 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!406466 () (_ BitVec 64))

(assert (=> d!111479 (= lt!406466 (select (arr!25355 (_keys!10228 thiss!1181)) (toIndex!0 key!785 (mask!26200 thiss!1181))))))

(assert (=> d!111479 (validMask!0 (mask!26200 thiss!1181))))

(assert (=> d!111479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26200 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)) lt!406467)))

(declare-fun b!899928 () Bool)

(assert (=> b!899928 (= e!503619 e!503620)))

(declare-fun c!95233 () Bool)

(assert (=> b!899928 (= c!95233 (or (= lt!406466 key!785) (= (bvadd lt!406466 lt!406466) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899929 () Bool)

(assert (=> b!899929 (= e!503620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26200 thiss!1181)) #b00000000000000000000000000000000 (mask!26200 thiss!1181)) key!785 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(declare-fun b!899930 () Bool)

(assert (=> b!899930 (= e!503617 e!503621)))

(declare-fun res!607830 () Bool)

(assert (=> b!899930 (= res!607830 (and ((_ is Intermediate!8935) lt!406467) (not (undefined!9747 lt!406467)) (bvslt (x!76673 lt!406467) #b01111111111111111111111111111110) (bvsge (x!76673 lt!406467) #b00000000000000000000000000000000) (bvsge (x!76673 lt!406467) #b00000000000000000000000000000000)))))

(assert (=> b!899930 (=> (not res!607830) (not e!503621))))

(assert (= (and d!111479 c!95231) b!899926))

(assert (= (and d!111479 (not c!95231)) b!899928))

(assert (= (and b!899928 c!95233) b!899923))

(assert (= (and b!899928 (not c!95233)) b!899929))

(assert (= (and d!111479 c!95232) b!899925))

(assert (= (and d!111479 (not c!95232)) b!899930))

(assert (= (and b!899930 res!607830) b!899924))

(assert (= (and b!899924 (not res!607832)) b!899927))

(assert (= (and b!899927 (not res!607831)) b!899922))

(assert (=> d!111479 m!835737))

(declare-fun m!835917 () Bool)

(assert (=> d!111479 m!835917))

(assert (=> d!111479 m!835575))

(declare-fun m!835919 () Bool)

(assert (=> b!899922 m!835919))

(assert (=> b!899924 m!835919))

(assert (=> b!899927 m!835919))

(assert (=> b!899929 m!835737))

(declare-fun m!835921 () Bool)

(assert (=> b!899929 m!835921))

(assert (=> b!899929 m!835921))

(declare-fun m!835923 () Bool)

(assert (=> b!899929 m!835923))

(assert (=> d!111419 d!111479))

(declare-fun d!111481 () Bool)

(declare-fun lt!406473 () (_ BitVec 32))

(declare-fun lt!406472 () (_ BitVec 32))

(assert (=> d!111481 (= lt!406473 (bvmul (bvxor lt!406472 (bvlshr lt!406472 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111481 (= lt!406472 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111481 (and (bvsge (mask!26200 thiss!1181) #b00000000000000000000000000000000) (let ((res!607833 (let ((h!19004 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76693 (bvmul (bvxor h!19004 (bvlshr h!19004 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76693 (bvlshr x!76693 #b00000000000000000000000000001101)) (mask!26200 thiss!1181)))))) (and (bvslt res!607833 (bvadd (mask!26200 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607833 #b00000000000000000000000000000000))))))

(assert (=> d!111481 (= (toIndex!0 key!785 (mask!26200 thiss!1181)) (bvand (bvxor lt!406473 (bvlshr lt!406473 #b00000000000000000000000000001101)) (mask!26200 thiss!1181)))))

(assert (=> d!111419 d!111481))

(assert (=> d!111419 d!111397))

(declare-fun d!111483 () Bool)

(declare-fun res!607838 () Bool)

(declare-fun e!503626 () Bool)

(assert (=> d!111483 (=> res!607838 e!503626)))

(assert (=> d!111483 (= res!607838 (and ((_ is Cons!17856) (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (= (_1!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))))

(assert (=> d!111483 (= (containsKey!429 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))) e!503626)))

(declare-fun b!899935 () Bool)

(declare-fun e!503627 () Bool)

(assert (=> b!899935 (= e!503626 e!503627)))

(declare-fun res!607839 () Bool)

(assert (=> b!899935 (=> (not res!607839) (not e!503627))))

(assert (=> b!899935 (= res!607839 (and (or (not ((_ is Cons!17856) (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (bvsle (_1!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))) ((_ is Cons!17856) (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (bvslt (_1!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))))

(declare-fun b!899936 () Bool)

(assert (=> b!899936 (= e!503627 (containsKey!429 (t!25200 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(assert (= (and d!111483 (not res!607838)) b!899935))

(assert (= (and b!899935 res!607839) b!899936))

(assert (=> b!899936 m!835567))

(declare-fun m!835925 () Bool)

(assert (=> b!899936 m!835925))

(assert (=> d!111407 d!111483))

(declare-fun d!111485 () Bool)

(assert (=> d!111485 (= (apply!410 lt!406338 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)) (get!13343 (getValueByKey!461 (toList!5394 lt!406338) (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25247 () Bool)

(assert (= bs!25247 d!111485))

(assert (=> bs!25247 m!835649))

(assert (=> bs!25247 m!835749))

(assert (=> bs!25247 m!835749))

(declare-fun m!835927 () Bool)

(assert (=> bs!25247 m!835927))

(assert (=> b!899727 d!111485))

(declare-fun d!111487 () Bool)

(declare-fun c!95236 () Bool)

(assert (=> d!111487 (= c!95236 ((_ is ValueCellFull!8702) (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503630 () V!29455)

(assert (=> d!111487 (= (get!13342 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503630)))

(declare-fun b!899941 () Bool)

(declare-fun get!13344 (ValueCell!8702 V!29455) V!29455)

(assert (=> b!899941 (= e!503630 (get!13344 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899942 () Bool)

(declare-fun get!13345 (ValueCell!8702 V!29455) V!29455)

(assert (=> b!899942 (= e!503630 (get!13345 (select (arr!25356 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1304 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111487 c!95236) b!899941))

(assert (= (and d!111487 (not c!95236)) b!899942))

(assert (=> b!899941 m!835699))

(assert (=> b!899941 m!835703))

(declare-fun m!835929 () Bool)

(assert (=> b!899941 m!835929))

(assert (=> b!899942 m!835699))

(assert (=> b!899942 m!835703))

(declare-fun m!835931 () Bool)

(assert (=> b!899942 m!835931))

(assert (=> b!899727 d!111487))

(declare-fun d!111489 () Bool)

(assert (=> d!111489 (contains!4395 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))

(assert (=> d!111489 true))

(declare-fun _$16!187 () Unit!30512)

(assert (=> d!111489 (= (choose!1516 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!38112 lt!406248) (defaultEntry!5438 thiss!1181)) _$16!187)))

(declare-fun bs!25248 () Bool)

(assert (= bs!25248 d!111489))

(assert (=> bs!25248 m!835569))

(assert (=> bs!25248 m!835567))

(assert (=> bs!25248 m!835569))

(assert (=> bs!25248 m!835567))

(assert (=> bs!25248 m!835571))

(assert (=> d!111399 d!111489))

(assert (=> d!111399 d!111397))

(declare-fun d!111491 () Bool)

(declare-fun isEmpty!696 (Option!467) Bool)

(assert (=> d!111491 (= (isDefined!337 (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))) (not (isEmpty!696 (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))))

(declare-fun bs!25249 () Bool)

(assert (= bs!25249 d!111491))

(assert (=> bs!25249 m!835715))

(declare-fun m!835933 () Bool)

(assert (=> bs!25249 m!835933))

(assert (=> b!899749 d!111491))

(declare-fun b!899951 () Bool)

(declare-fun e!503635 () Option!467)

(assert (=> b!899951 (= e!503635 (Some!466 (_2!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))))))

(declare-fun b!899954 () Bool)

(declare-fun e!503636 () Option!467)

(assert (=> b!899954 (= e!503636 None!465)))

(declare-fun b!899952 () Bool)

(assert (=> b!899952 (= e!503635 e!503636)))

(declare-fun c!95242 () Bool)

(assert (=> b!899952 (= c!95242 (and ((_ is Cons!17856) (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (not (= (_1!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))))

(declare-fun d!111493 () Bool)

(declare-fun c!95241 () Bool)

(assert (=> d!111493 (= c!95241 (and ((_ is Cons!17856) (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (= (_1!6046 (h!19001 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248)))))))

(assert (=> d!111493 (= (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))) e!503635)))

(declare-fun b!899953 () Bool)

(assert (=> b!899953 (= e!503636 (getValueByKey!461 (t!25200 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(assert (= (and d!111493 c!95241) b!899951))

(assert (= (and d!111493 (not c!95241)) b!899952))

(assert (= (and b!899952 c!95242) b!899953))

(assert (= (and b!899952 (not c!95242)) b!899954))

(assert (=> b!899953 m!835567))

(declare-fun m!835935 () Bool)

(assert (=> b!899953 m!835935))

(assert (=> b!899749 d!111493))

(assert (=> bm!39964 d!111443))

(declare-fun b!899965 () Bool)

(declare-fun e!503646 () Bool)

(declare-fun e!503645 () Bool)

(assert (=> b!899965 (= e!503646 e!503645)))

(declare-fun res!607847 () Bool)

(assert (=> b!899965 (=> (not res!607847) (not e!503645))))

(declare-fun e!503647 () Bool)

(assert (=> b!899965 (= res!607847 (not e!503647))))

(declare-fun res!607846 () Bool)

(assert (=> b!899965 (=> (not res!607846) (not e!503647))))

(assert (=> b!899965 (= res!607846 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899966 () Bool)

(declare-fun e!503648 () Bool)

(declare-fun call!39980 () Bool)

(assert (=> b!899966 (= e!503648 call!39980)))

(declare-fun b!899967 () Bool)

(declare-fun contains!4398 (List!17862 (_ BitVec 64)) Bool)

(assert (=> b!899967 (= e!503647 (contains!4398 Nil!17859 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111495 () Bool)

(declare-fun res!607848 () Bool)

(assert (=> d!111495 (=> res!607848 e!503646)))

(assert (=> d!111495 (= res!607848 (bvsge #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111495 (= (arrayNoDuplicates!0 (_keys!10228 thiss!1181) #b00000000000000000000000000000000 Nil!17859) e!503646)))

(declare-fun b!899968 () Bool)

(assert (=> b!899968 (= e!503645 e!503648)))

(declare-fun c!95245 () Bool)

(assert (=> b!899968 (= c!95245 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39977 () Bool)

(assert (=> bm!39977 (= call!39980 (arrayNoDuplicates!0 (_keys!10228 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95245 (Cons!17858 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) Nil!17859) Nil!17859)))))

(declare-fun b!899969 () Bool)

(assert (=> b!899969 (= e!503648 call!39980)))

(assert (= (and d!111495 (not res!607848)) b!899965))

(assert (= (and b!899965 res!607846) b!899967))

(assert (= (and b!899965 res!607847) b!899968))

(assert (= (and b!899968 c!95245) b!899969))

(assert (= (and b!899968 (not c!95245)) b!899966))

(assert (= (or b!899969 b!899966) bm!39977))

(assert (=> b!899965 m!835649))

(assert (=> b!899965 m!835649))

(assert (=> b!899965 m!835695))

(assert (=> b!899967 m!835649))

(assert (=> b!899967 m!835649))

(declare-fun m!835937 () Bool)

(assert (=> b!899967 m!835937))

(assert (=> b!899968 m!835649))

(assert (=> b!899968 m!835649))

(assert (=> b!899968 m!835695))

(assert (=> bm!39977 m!835649))

(declare-fun m!835939 () Bool)

(assert (=> bm!39977 m!835939))

(assert (=> b!899758 d!111495))

(declare-fun d!111497 () Bool)

(declare-fun res!607854 () Bool)

(declare-fun e!503656 () Bool)

(assert (=> d!111497 (=> res!607854 e!503656)))

(assert (=> d!111497 (= res!607854 (bvsge #b00000000000000000000000000000000 (size!25815 (_keys!10228 thiss!1181))))))

(assert (=> d!111497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10228 thiss!1181) (mask!26200 thiss!1181)) e!503656)))

(declare-fun b!899978 () Bool)

(declare-fun e!503657 () Bool)

(declare-fun e!503655 () Bool)

(assert (=> b!899978 (= e!503657 e!503655)))

(declare-fun lt!406481 () (_ BitVec 64))

(assert (=> b!899978 (= lt!406481 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406482 () Unit!30512)

(assert (=> b!899978 (= lt!406482 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10228 thiss!1181) lt!406481 #b00000000000000000000000000000000))))

(assert (=> b!899978 (arrayContainsKey!0 (_keys!10228 thiss!1181) lt!406481 #b00000000000000000000000000000000)))

(declare-fun lt!406480 () Unit!30512)

(assert (=> b!899978 (= lt!406480 lt!406482)))

(declare-fun res!607853 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52763 (_ BitVec 32)) SeekEntryResult!8935)

(assert (=> b!899978 (= res!607853 (= (seekEntryOrOpen!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000) (_keys!10228 thiss!1181) (mask!26200 thiss!1181)) (Found!8935 #b00000000000000000000000000000000)))))

(assert (=> b!899978 (=> (not res!607853) (not e!503655))))

(declare-fun b!899979 () Bool)

(assert (=> b!899979 (= e!503656 e!503657)))

(declare-fun c!95248 () Bool)

(assert (=> b!899979 (= c!95248 (validKeyInArray!0 (select (arr!25355 (_keys!10228 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899980 () Bool)

(declare-fun call!39983 () Bool)

(assert (=> b!899980 (= e!503657 call!39983)))

(declare-fun b!899981 () Bool)

(assert (=> b!899981 (= e!503655 call!39983)))

(declare-fun bm!39980 () Bool)

(assert (=> bm!39980 (= call!39983 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10228 thiss!1181) (mask!26200 thiss!1181)))))

(assert (= (and d!111497 (not res!607854)) b!899979))

(assert (= (and b!899979 c!95248) b!899978))

(assert (= (and b!899979 (not c!95248)) b!899980))

(assert (= (and b!899978 res!607853) b!899981))

(assert (= (or b!899981 b!899980) bm!39980))

(assert (=> b!899978 m!835649))

(declare-fun m!835941 () Bool)

(assert (=> b!899978 m!835941))

(declare-fun m!835943 () Bool)

(assert (=> b!899978 m!835943))

(assert (=> b!899978 m!835649))

(declare-fun m!835945 () Bool)

(assert (=> b!899978 m!835945))

(assert (=> b!899979 m!835649))

(assert (=> b!899979 m!835649))

(assert (=> b!899979 m!835695))

(declare-fun m!835947 () Bool)

(assert (=> bm!39980 m!835947))

(assert (=> b!899757 d!111497))

(declare-fun d!111499 () Bool)

(assert (=> d!111499 (= (inRange!0 (index!38112 lt!406364) (mask!26200 thiss!1181)) (and (bvsge (index!38112 lt!406364) #b00000000000000000000000000000000) (bvslt (index!38112 lt!406364) (bvadd (mask!26200 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899761 d!111499))

(declare-fun d!111501 () Bool)

(assert (=> d!111501 (isDefined!337 (getValueByKey!461 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(declare-fun lt!406485 () Unit!30512)

(declare-fun choose!1520 (List!17860 (_ BitVec 64)) Unit!30512)

(assert (=> d!111501 (= lt!406485 (choose!1520 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(declare-fun e!503660 () Bool)

(assert (=> d!111501 e!503660))

(declare-fun res!607857 () Bool)

(assert (=> d!111501 (=> (not res!607857) (not e!503660))))

(declare-fun isStrictlySorted!496 (List!17860) Bool)

(assert (=> d!111501 (= res!607857 (isStrictlySorted!496 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))))

(assert (=> d!111501 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))) lt!406485)))

(declare-fun b!899984 () Bool)

(assert (=> b!899984 (= e!503660 (containsKey!429 (toList!5394 (getCurrentListMap!2613 (_keys!10228 thiss!1181) (_values!5452 thiss!1181) (mask!26200 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25355 (_keys!10228 thiss!1181)) (index!38112 lt!406248))))))

(assert (= (and d!111501 res!607857) b!899984))

(assert (=> d!111501 m!835567))

(assert (=> d!111501 m!835715))

(assert (=> d!111501 m!835715))

(assert (=> d!111501 m!835717))

(assert (=> d!111501 m!835567))

(declare-fun m!835949 () Bool)

(assert (=> d!111501 m!835949))

(declare-fun m!835951 () Bool)

(assert (=> d!111501 m!835951))

(assert (=> b!899984 m!835567))

(assert (=> b!899984 m!835711))

(assert (=> b!899747 d!111501))

(assert (=> b!899747 d!111491))

(assert (=> b!899747 d!111493))

(declare-fun d!111503 () Bool)

(declare-fun e!503661 () Bool)

(assert (=> d!111503 e!503661))

(declare-fun res!607858 () Bool)

(assert (=> d!111503 (=> (not res!607858) (not e!503661))))

(declare-fun lt!406489 () ListLongMap!10757)

(assert (=> d!111503 (= res!607858 (contains!4395 lt!406489 (_1!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(declare-fun lt!406488 () List!17860)

(assert (=> d!111503 (= lt!406489 (ListLongMap!10758 lt!406488))))

(declare-fun lt!406486 () Unit!30512)

(declare-fun lt!406487 () Unit!30512)

(assert (=> d!111503 (= lt!406486 lt!406487)))

(assert (=> d!111503 (= (getValueByKey!461 lt!406488 (_1!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111503 (= lt!406487 (lemmaContainsTupThenGetReturnValue!252 lt!406488 (_1!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111503 (= lt!406488 (insertStrictlySorted!309 (toList!5394 call!39970) (_1!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) (_2!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111503 (= (+!2621 call!39970 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) lt!406489)))

(declare-fun b!899985 () Bool)

(declare-fun res!607859 () Bool)

(assert (=> b!899985 (=> (not res!607859) (not e!503661))))

(assert (=> b!899985 (= res!607859 (= (getValueByKey!461 (toList!5394 lt!406489) (_1!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (Some!466 (_2!6046 (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun b!899986 () Bool)

(assert (=> b!899986 (= e!503661 (contains!4397 (toList!5394 lt!406489) (tuple2!12071 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))

(assert (= (and d!111503 res!607858) b!899985))

(assert (= (and b!899985 res!607859) b!899986))

(declare-fun m!835953 () Bool)

(assert (=> d!111503 m!835953))

(declare-fun m!835955 () Bool)

(assert (=> d!111503 m!835955))

(declare-fun m!835957 () Bool)

(assert (=> d!111503 m!835957))

(declare-fun m!835959 () Bool)

(assert (=> d!111503 m!835959))

(declare-fun m!835961 () Bool)

(assert (=> b!899985 m!835961))

(declare-fun m!835963 () Bool)

(assert (=> b!899986 m!835963))

(assert (=> b!899724 d!111503))

(declare-fun b!899987 () Bool)

(declare-fun e!503663 () Bool)

(assert (=> b!899987 (= e!503663 tp_is_empty!18367)))

(declare-fun b!899988 () Bool)

(declare-fun e!503662 () Bool)

(assert (=> b!899988 (= e!503662 tp_is_empty!18367)))

(declare-fun mapNonEmpty!29230 () Bool)

(declare-fun mapRes!29230 () Bool)

(declare-fun tp!56218 () Bool)

(assert (=> mapNonEmpty!29230 (= mapRes!29230 (and tp!56218 e!503663))))

(declare-fun mapKey!29230 () (_ BitVec 32))

(declare-fun mapRest!29230 () (Array (_ BitVec 32) ValueCell!8702))

(declare-fun mapValue!29230 () ValueCell!8702)

(assert (=> mapNonEmpty!29230 (= mapRest!29229 (store mapRest!29230 mapKey!29230 mapValue!29230))))

(declare-fun condMapEmpty!29230 () Bool)

(declare-fun mapDefault!29230 () ValueCell!8702)

(assert (=> mapNonEmpty!29229 (= condMapEmpty!29230 (= mapRest!29229 ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29230)))))

(assert (=> mapNonEmpty!29229 (= tp!56217 (and e!503662 mapRes!29230))))

(declare-fun mapIsEmpty!29230 () Bool)

(assert (=> mapIsEmpty!29230 mapRes!29230))

(assert (= (and mapNonEmpty!29229 condMapEmpty!29230) mapIsEmpty!29230))

(assert (= (and mapNonEmpty!29229 (not condMapEmpty!29230)) mapNonEmpty!29230))

(assert (= (and mapNonEmpty!29230 ((_ is ValueCellFull!8702) mapValue!29230)) b!899987))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8702) mapDefault!29230)) b!899988))

(declare-fun m!835965 () Bool)

(assert (=> mapNonEmpty!29230 m!835965))

(declare-fun b_lambda!12993 () Bool)

(assert (= b_lambda!12991 (or (and b!899611 b_free!16039) b_lambda!12993)))

(declare-fun b_lambda!12995 () Bool)

(assert (= b_lambda!12989 (or (and b!899611 b_free!16039) b_lambda!12995)))

(check-sat (not mapNonEmpty!29230) (not b!899968) b_and!26337 (not d!111431) (not b!899936) (not b!899965) (not d!111457) (not b!899901) (not bm!39977) (not b!899900) (not d!111437) (not d!111471) (not b!899815) (not b!899802) (not d!111427) (not b!899848) (not d!111459) (not d!111449) (not d!111445) (not d!111479) (not bm!39971) (not b!899986) (not b!899903) (not b!899985) (not b!899875) (not d!111433) (not d!111489) (not b!899880) (not b!899941) tp_is_empty!18367 (not b!899855) (not b_lambda!12995) (not d!111451) (not d!111435) (not b!899897) (not d!111423) (not b!899858) (not b!899803) (not b_lambda!12993) (not b!899853) (not b!899847) (not d!111491) (not d!111469) (not b!899849) (not b_next!16039) (not b!899800) (not d!111443) (not b!899978) (not d!111465) (not b!899863) (not d!111473) (not b!899953) (not b!899843) (not d!111447) (not b_lambda!12987) (not b!899816) (not b!899929) (not b!899856) (not b!899845) (not b!899878) (not d!111463) (not d!111439) (not b!899876) (not b!899805) (not d!111455) (not d!111425) (not b!899798) (not b!899817) (not d!111453) (not b!899979) (not b!899967) (not d!111485) (not d!111501) (not d!111429) (not d!111441) (not b!899859) (not b!899942) (not bm!39980) (not b!899851) (not b!899818) (not b!899850) (not b!899797) (not b!899899) (not b!899984) (not d!111477) (not d!111421) (not bm!39974) (not d!111503))
(check-sat b_and!26337 (not b_next!16039))
