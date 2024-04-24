; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21860 () Bool)

(assert start!21860)

(declare-fun b!220507 () Bool)

(declare-fun b_free!5923 () Bool)

(declare-fun b_next!5923 () Bool)

(assert (=> b!220507 (= b_free!5923 (not b_next!5923))))

(declare-fun tp!20910 () Bool)

(declare-fun b_and!12835 () Bool)

(assert (=> b!220507 (= tp!20910 b_and!12835)))

(declare-fun b!220503 () Bool)

(declare-fun res!108123 () Bool)

(declare-datatypes ((V!7361 0))(
  ( (V!7362 (val!2937 Int)) )
))
(declare-datatypes ((ValueCell!2549 0))(
  ( (ValueCellFull!2549 (v!4958 V!7361)) (EmptyCell!2549) )
))
(declare-datatypes ((array!10811 0))(
  ( (array!10812 (arr!5125 (Array (_ BitVec 32) ValueCell!2549)) (size!5458 (_ BitVec 32))) )
))
(declare-datatypes ((array!10813 0))(
  ( (array!10814 (arr!5126 (Array (_ BitVec 32) (_ BitVec 64))) (size!5459 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2998 0))(
  ( (LongMapFixedSize!2999 (defaultEntry!4158 Int) (mask!9960 (_ BitVec 32)) (extraKeys!3895 (_ BitVec 32)) (zeroValue!3999 V!7361) (minValue!3999 V!7361) (_size!1548 (_ BitVec 32)) (_keys!6212 array!10813) (_values!4141 array!10811) (_vacant!1548 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2998)

(declare-datatypes ((SeekEntryResult!786 0))(
  ( (MissingZero!786 (index!5314 (_ BitVec 32))) (Found!786 (index!5315 (_ BitVec 32))) (Intermediate!786 (undefined!1598 Bool) (index!5316 (_ BitVec 32)) (x!22934 (_ BitVec 32))) (Undefined!786) (MissingVacant!786 (index!5317 (_ BitVec 32))) )
))
(declare-fun lt!112243 () SeekEntryResult!786)

(assert (=> b!220503 (= res!108123 (= (select (arr!5126 (_keys!6212 thiss!1504)) (index!5317 lt!112243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143361 () Bool)

(assert (=> b!220503 (=> (not res!108123) (not e!143361))))

(declare-fun b!220504 () Bool)

(declare-fun e!143370 () Bool)

(declare-fun call!20592 () Bool)

(assert (=> b!220504 (= e!143370 (not call!20592))))

(declare-fun b!220505 () Bool)

(declare-fun e!143365 () Bool)

(declare-fun tp_is_empty!5785 () Bool)

(assert (=> b!220505 (= e!143365 tp_is_empty!5785)))

(declare-fun e!143369 () Bool)

(declare-fun e!143372 () Bool)

(declare-fun array_inv!3365 (array!10813) Bool)

(declare-fun array_inv!3366 (array!10811) Bool)

(assert (=> b!220507 (= e!143372 (and tp!20910 tp_is_empty!5785 (array_inv!3365 (_keys!6212 thiss!1504)) (array_inv!3366 (_values!4141 thiss!1504)) e!143369))))

(declare-fun b!220508 () Bool)

(declare-fun e!143363 () Bool)

(declare-fun e!143364 () Bool)

(assert (=> b!220508 (= e!143363 e!143364)))

(declare-fun res!108129 () Bool)

(assert (=> b!220508 (=> (not res!108129) (not e!143364))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220508 (= res!108129 (or (= lt!112243 (MissingZero!786 index!297)) (= lt!112243 (MissingVacant!786 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10813 (_ BitVec 32)) SeekEntryResult!786)

(assert (=> b!220508 (= lt!112243 (seekEntryOrOpen!0 key!932 (_keys!6212 thiss!1504) (mask!9960 thiss!1504)))))

(declare-fun b!220509 () Bool)

(declare-datatypes ((Unit!6555 0))(
  ( (Unit!6556) )
))
(declare-fun e!143362 () Unit!6555)

(declare-fun Unit!6557 () Unit!6555)

(assert (=> b!220509 (= e!143362 Unit!6557)))

(declare-fun lt!112245 () Unit!6555)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (array!10813 array!10811 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 64) Int) Unit!6555)

(assert (=> b!220509 (= lt!112245 (lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (_keys!6212 thiss!1504) (_values!4141 thiss!1504) (mask!9960 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) key!932 (defaultEntry!4158 thiss!1504)))))

(assert (=> b!220509 false))

(declare-fun b!220510 () Bool)

(declare-fun res!108126 () Bool)

(declare-fun e!143367 () Bool)

(assert (=> b!220510 (=> (not res!108126) (not e!143367))))

(declare-fun arrayContainsKey!0 (array!10813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220510 (= res!108126 (arrayContainsKey!0 (_keys!6212 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220511 () Bool)

(assert (=> b!220511 (= e!143367 false)))

(declare-fun lt!112246 () Bool)

(declare-datatypes ((List!3174 0))(
  ( (Nil!3171) (Cons!3170 (h!3818 (_ BitVec 64)) (t!8125 List!3174)) )
))
(declare-fun arrayNoDuplicates!0 (array!10813 (_ BitVec 32) List!3174) Bool)

(assert (=> b!220511 (= lt!112246 (arrayNoDuplicates!0 (_keys!6212 thiss!1504) #b00000000000000000000000000000000 Nil!3171))))

(declare-fun b!220512 () Bool)

(declare-fun e!143371 () Bool)

(get-info :version)

(assert (=> b!220512 (= e!143371 ((_ is Undefined!786) lt!112243))))

(declare-fun b!220513 () Bool)

(declare-fun res!108121 () Bool)

(assert (=> b!220513 (=> (not res!108121) (not e!143363))))

(assert (=> b!220513 (= res!108121 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220514 () Bool)

(declare-fun res!108120 () Bool)

(assert (=> b!220514 (=> (not res!108120) (not e!143367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10813 (_ BitVec 32)) Bool)

(assert (=> b!220514 (= res!108120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6212 thiss!1504) (mask!9960 thiss!1504)))))

(declare-fun b!220515 () Bool)

(assert (=> b!220515 (= e!143371 e!143361)))

(declare-fun res!108124 () Bool)

(declare-fun call!20591 () Bool)

(assert (=> b!220515 (= res!108124 call!20591)))

(assert (=> b!220515 (=> (not res!108124) (not e!143361))))

(declare-fun b!220516 () Bool)

(declare-fun c!36700 () Bool)

(assert (=> b!220516 (= c!36700 ((_ is MissingVacant!786) lt!112243))))

(declare-fun e!143360 () Bool)

(assert (=> b!220516 (= e!143360 e!143371)))

(declare-fun b!220517 () Bool)

(declare-fun res!108127 () Bool)

(assert (=> b!220517 (=> (not res!108127) (not e!143367))))

(assert (=> b!220517 (= res!108127 (and (= (size!5458 (_values!4141 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9960 thiss!1504))) (= (size!5459 (_keys!6212 thiss!1504)) (size!5458 (_values!4141 thiss!1504))) (bvsge (mask!9960 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3895 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3895 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220518 () Bool)

(assert (=> b!220518 (= e!143364 e!143367)))

(declare-fun res!108122 () Bool)

(assert (=> b!220518 (=> (not res!108122) (not e!143367))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220518 (= res!108122 (inRange!0 index!297 (mask!9960 thiss!1504)))))

(declare-fun lt!112244 () Unit!6555)

(assert (=> b!220518 (= lt!112244 e!143362)))

(declare-fun c!36699 () Bool)

(declare-datatypes ((tuple2!4278 0))(
  ( (tuple2!4279 (_1!2150 (_ BitVec 64)) (_2!2150 V!7361)) )
))
(declare-datatypes ((List!3175 0))(
  ( (Nil!3172) (Cons!3171 (h!3819 tuple2!4278) (t!8126 List!3175)) )
))
(declare-datatypes ((ListLongMap!3193 0))(
  ( (ListLongMap!3194 (toList!1612 List!3175)) )
))
(declare-fun contains!1469 (ListLongMap!3193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1144 (array!10813 array!10811 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 32) Int) ListLongMap!3193)

(assert (=> b!220518 (= c!36699 (contains!1469 (getCurrentListMap!1144 (_keys!6212 thiss!1504) (_values!4141 thiss!1504) (mask!9960 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4158 thiss!1504)) key!932))))

(declare-fun b!220519 () Bool)

(declare-fun res!108125 () Bool)

(assert (=> b!220519 (=> (not res!108125) (not e!143370))))

(assert (=> b!220519 (= res!108125 (= (select (arr!5126 (_keys!6212 thiss!1504)) (index!5314 lt!112243)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20588 () Bool)

(declare-fun c!36698 () Bool)

(assert (=> bm!20588 (= call!20591 (inRange!0 (ite c!36698 (index!5314 lt!112243) (index!5317 lt!112243)) (mask!9960 thiss!1504)))))

(declare-fun b!220506 () Bool)

(declare-fun res!108128 () Bool)

(assert (=> b!220506 (=> (not res!108128) (not e!143370))))

(assert (=> b!220506 (= res!108128 call!20591)))

(assert (=> b!220506 (= e!143360 e!143370)))

(declare-fun res!108130 () Bool)

(assert (=> start!21860 (=> (not res!108130) (not e!143363))))

(declare-fun valid!1221 (LongMapFixedSize!2998) Bool)

(assert (=> start!21860 (= res!108130 (valid!1221 thiss!1504))))

(assert (=> start!21860 e!143363))

(assert (=> start!21860 e!143372))

(assert (=> start!21860 true))

(declare-fun b!220520 () Bool)

(assert (=> b!220520 (= e!143361 (not call!20592))))

(declare-fun bm!20589 () Bool)

(assert (=> bm!20589 (= call!20592 (arrayContainsKey!0 (_keys!6212 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220521 () Bool)

(declare-fun e!143366 () Bool)

(declare-fun mapRes!9847 () Bool)

(assert (=> b!220521 (= e!143369 (and e!143366 mapRes!9847))))

(declare-fun condMapEmpty!9847 () Bool)

(declare-fun mapDefault!9847 () ValueCell!2549)

(assert (=> b!220521 (= condMapEmpty!9847 (= (arr!5125 (_values!4141 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2549)) mapDefault!9847)))))

(declare-fun mapIsEmpty!9847 () Bool)

(assert (=> mapIsEmpty!9847 mapRes!9847))

(declare-fun mapNonEmpty!9847 () Bool)

(declare-fun tp!20911 () Bool)

(assert (=> mapNonEmpty!9847 (= mapRes!9847 (and tp!20911 e!143365))))

(declare-fun mapRest!9847 () (Array (_ BitVec 32) ValueCell!2549))

(declare-fun mapKey!9847 () (_ BitVec 32))

(declare-fun mapValue!9847 () ValueCell!2549)

(assert (=> mapNonEmpty!9847 (= (arr!5125 (_values!4141 thiss!1504)) (store mapRest!9847 mapKey!9847 mapValue!9847))))

(declare-fun b!220522 () Bool)

(declare-fun lt!112242 () Unit!6555)

(assert (=> b!220522 (= e!143362 lt!112242)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (array!10813 array!10811 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 64) Int) Unit!6555)

(assert (=> b!220522 (= lt!112242 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (_keys!6212 thiss!1504) (_values!4141 thiss!1504) (mask!9960 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) key!932 (defaultEntry!4158 thiss!1504)))))

(assert (=> b!220522 (= c!36698 ((_ is MissingZero!786) lt!112243))))

(assert (=> b!220522 e!143360))

(declare-fun b!220523 () Bool)

(declare-fun res!108119 () Bool)

(assert (=> b!220523 (=> (not res!108119) (not e!143367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220523 (= res!108119 (validMask!0 (mask!9960 thiss!1504)))))

(declare-fun b!220524 () Bool)

(assert (=> b!220524 (= e!143366 tp_is_empty!5785)))

(assert (= (and start!21860 res!108130) b!220513))

(assert (= (and b!220513 res!108121) b!220508))

(assert (= (and b!220508 res!108129) b!220518))

(assert (= (and b!220518 c!36699) b!220509))

(assert (= (and b!220518 (not c!36699)) b!220522))

(assert (= (and b!220522 c!36698) b!220506))

(assert (= (and b!220522 (not c!36698)) b!220516))

(assert (= (and b!220506 res!108128) b!220519))

(assert (= (and b!220519 res!108125) b!220504))

(assert (= (and b!220516 c!36700) b!220515))

(assert (= (and b!220516 (not c!36700)) b!220512))

(assert (= (and b!220515 res!108124) b!220503))

(assert (= (and b!220503 res!108123) b!220520))

(assert (= (or b!220506 b!220515) bm!20588))

(assert (= (or b!220504 b!220520) bm!20589))

(assert (= (and b!220518 res!108122) b!220510))

(assert (= (and b!220510 res!108126) b!220523))

(assert (= (and b!220523 res!108119) b!220517))

(assert (= (and b!220517 res!108127) b!220514))

(assert (= (and b!220514 res!108120) b!220511))

(assert (= (and b!220521 condMapEmpty!9847) mapIsEmpty!9847))

(assert (= (and b!220521 (not condMapEmpty!9847)) mapNonEmpty!9847))

(assert (= (and mapNonEmpty!9847 ((_ is ValueCellFull!2549) mapValue!9847)) b!220505))

(assert (= (and b!220521 ((_ is ValueCellFull!2549) mapDefault!9847)) b!220524))

(assert (= b!220507 b!220521))

(assert (= start!21860 b!220507))

(declare-fun m!245755 () Bool)

(assert (=> b!220518 m!245755))

(declare-fun m!245757 () Bool)

(assert (=> b!220518 m!245757))

(assert (=> b!220518 m!245757))

(declare-fun m!245759 () Bool)

(assert (=> b!220518 m!245759))

(declare-fun m!245761 () Bool)

(assert (=> b!220519 m!245761))

(declare-fun m!245763 () Bool)

(assert (=> start!21860 m!245763))

(declare-fun m!245765 () Bool)

(assert (=> b!220522 m!245765))

(declare-fun m!245767 () Bool)

(assert (=> bm!20588 m!245767))

(declare-fun m!245769 () Bool)

(assert (=> b!220509 m!245769))

(declare-fun m!245771 () Bool)

(assert (=> b!220508 m!245771))

(declare-fun m!245773 () Bool)

(assert (=> b!220514 m!245773))

(declare-fun m!245775 () Bool)

(assert (=> bm!20589 m!245775))

(declare-fun m!245777 () Bool)

(assert (=> b!220507 m!245777))

(declare-fun m!245779 () Bool)

(assert (=> b!220507 m!245779))

(assert (=> b!220510 m!245775))

(declare-fun m!245781 () Bool)

(assert (=> b!220523 m!245781))

(declare-fun m!245783 () Bool)

(assert (=> b!220503 m!245783))

(declare-fun m!245785 () Bool)

(assert (=> b!220511 m!245785))

(declare-fun m!245787 () Bool)

(assert (=> mapNonEmpty!9847 m!245787))

(check-sat (not b!220523) (not bm!20588) (not b!220508) (not b!220511) (not start!21860) (not bm!20589) (not b!220509) (not mapNonEmpty!9847) (not b!220522) (not b!220514) tp_is_empty!5785 (not b_next!5923) (not b!220507) b_and!12835 (not b!220518) (not b!220510))
(check-sat b_and!12835 (not b_next!5923))
