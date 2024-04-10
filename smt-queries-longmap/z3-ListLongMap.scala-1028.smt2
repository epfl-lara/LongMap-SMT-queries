; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21852 () Bool)

(assert start!21852)

(declare-fun b!220334 () Bool)

(declare-fun b_free!5919 () Bool)

(declare-fun b_next!5919 () Bool)

(assert (=> b!220334 (= b_free!5919 (not b_next!5919))))

(declare-fun tp!20899 () Bool)

(declare-fun b_and!12817 () Bool)

(assert (=> b!220334 (= tp!20899 b_and!12817)))

(declare-fun b!220324 () Bool)

(declare-fun e!143266 () Bool)

(declare-fun tp_is_empty!5781 () Bool)

(assert (=> b!220324 (= e!143266 tp_is_empty!5781)))

(declare-fun b!220325 () Bool)

(declare-fun res!108035 () Bool)

(declare-fun e!143262 () Bool)

(assert (=> b!220325 (=> (not res!108035) (not e!143262))))

(declare-datatypes ((V!7355 0))(
  ( (V!7356 (val!2935 Int)) )
))
(declare-datatypes ((ValueCell!2547 0))(
  ( (ValueCellFull!2547 (v!4955 V!7355)) (EmptyCell!2547) )
))
(declare-datatypes ((array!10805 0))(
  ( (array!10806 (arr!5122 (Array (_ BitVec 32) ValueCell!2547)) (size!5455 (_ BitVec 32))) )
))
(declare-datatypes ((array!10807 0))(
  ( (array!10808 (arr!5123 (Array (_ BitVec 32) (_ BitVec 64))) (size!5456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2994 0))(
  ( (LongMapFixedSize!2995 (defaultEntry!4156 Int) (mask!9956 (_ BitVec 32)) (extraKeys!3893 (_ BitVec 32)) (zeroValue!3997 V!7355) (minValue!3997 V!7355) (_size!1546 (_ BitVec 32)) (_keys!6210 array!10807) (_values!4139 array!10805) (_vacant!1546 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2994)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10807 (_ BitVec 32)) Bool)

(assert (=> b!220325 (= res!108035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6210 thiss!1504) (mask!9956 thiss!1504)))))

(declare-fun b!220326 () Bool)

(declare-fun res!108032 () Bool)

(assert (=> b!220326 (=> (not res!108032) (not e!143262))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220326 (= res!108032 (arrayContainsKey!0 (_keys!6210 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220327 () Bool)

(declare-fun e!143261 () Bool)

(declare-fun e!143260 () Bool)

(assert (=> b!220327 (= e!143261 e!143260)))

(declare-fun res!108028 () Bool)

(declare-fun call!20592 () Bool)

(assert (=> b!220327 (= res!108028 call!20592)))

(assert (=> b!220327 (=> (not res!108028) (not e!143260))))

(declare-fun b!220328 () Bool)

(declare-fun e!143270 () Bool)

(declare-fun e!143265 () Bool)

(declare-fun mapRes!9841 () Bool)

(assert (=> b!220328 (= e!143270 (and e!143265 mapRes!9841))))

(declare-fun condMapEmpty!9841 () Bool)

(declare-fun mapDefault!9841 () ValueCell!2547)

(assert (=> b!220328 (= condMapEmpty!9841 (= (arr!5122 (_values!4139 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2547)) mapDefault!9841)))))

(declare-fun b!220329 () Bool)

(declare-fun res!108030 () Bool)

(assert (=> b!220329 (=> (not res!108030) (not e!143262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220329 (= res!108030 (validMask!0 (mask!9956 thiss!1504)))))

(declare-fun b!220330 () Bool)

(declare-fun e!143263 () Bool)

(assert (=> b!220330 (= e!143263 e!143262)))

(declare-fun res!108026 () Bool)

(assert (=> b!220330 (=> (not res!108026) (not e!143262))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220330 (= res!108026 (inRange!0 index!297 (mask!9956 thiss!1504)))))

(declare-datatypes ((Unit!6571 0))(
  ( (Unit!6572) )
))
(declare-fun lt!112156 () Unit!6571)

(declare-fun e!143269 () Unit!6571)

(assert (=> b!220330 (= lt!112156 e!143269)))

(declare-fun c!36668 () Bool)

(declare-datatypes ((tuple2!4356 0))(
  ( (tuple2!4357 (_1!2189 (_ BitVec 64)) (_2!2189 V!7355)) )
))
(declare-datatypes ((List!3259 0))(
  ( (Nil!3256) (Cons!3255 (h!3903 tuple2!4356) (t!8218 List!3259)) )
))
(declare-datatypes ((ListLongMap!3269 0))(
  ( (ListLongMap!3270 (toList!1650 List!3259)) )
))
(declare-fun contains!1493 (ListLongMap!3269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1178 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7355 V!7355 (_ BitVec 32) Int) ListLongMap!3269)

(assert (=> b!220330 (= c!36668 (contains!1493 (getCurrentListMap!1178 (_keys!6210 thiss!1504) (_values!4139 thiss!1504) (mask!9956 thiss!1504) (extraKeys!3893 thiss!1504) (zeroValue!3997 thiss!1504) (minValue!3997 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4156 thiss!1504)) key!932))))

(declare-fun b!220331 () Bool)

(declare-fun res!108034 () Bool)

(declare-fun e!143268 () Bool)

(assert (=> b!220331 (=> (not res!108034) (not e!143268))))

(assert (=> b!220331 (= res!108034 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220332 () Bool)

(declare-fun res!108029 () Bool)

(declare-datatypes ((SeekEntryResult!810 0))(
  ( (MissingZero!810 (index!5410 (_ BitVec 32))) (Found!810 (index!5411 (_ BitVec 32))) (Intermediate!810 (undefined!1622 Bool) (index!5412 (_ BitVec 32)) (x!22950 (_ BitVec 32))) (Undefined!810) (MissingVacant!810 (index!5413 (_ BitVec 32))) )
))
(declare-fun lt!112155 () SeekEntryResult!810)

(assert (=> b!220332 (= res!108029 (= (select (arr!5123 (_keys!6210 thiss!1504)) (index!5413 lt!112155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220332 (=> (not res!108029) (not e!143260))))

(declare-fun b!220333 () Bool)

(declare-fun res!108033 () Bool)

(assert (=> b!220333 (=> (not res!108033) (not e!143262))))

(assert (=> b!220333 (= res!108033 (and (= (size!5455 (_values!4139 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9956 thiss!1504))) (= (size!5456 (_keys!6210 thiss!1504)) (size!5455 (_values!4139 thiss!1504))) (bvsge (mask!9956 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3893 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3893 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun c!36667 () Bool)

(declare-fun bm!20588 () Bool)

(assert (=> bm!20588 (= call!20592 (inRange!0 (ite c!36667 (index!5410 lt!112155) (index!5413 lt!112155)) (mask!9956 thiss!1504)))))

(declare-fun e!143259 () Bool)

(declare-fun array_inv!3391 (array!10807) Bool)

(declare-fun array_inv!3392 (array!10805) Bool)

(assert (=> b!220334 (= e!143259 (and tp!20899 tp_is_empty!5781 (array_inv!3391 (_keys!6210 thiss!1504)) (array_inv!3392 (_values!4139 thiss!1504)) e!143270))))

(declare-fun b!220335 () Bool)

(declare-fun e!143267 () Bool)

(declare-fun call!20591 () Bool)

(assert (=> b!220335 (= e!143267 (not call!20591))))

(declare-fun b!220336 () Bool)

(declare-fun res!108036 () Bool)

(assert (=> b!220336 (=> (not res!108036) (not e!143267))))

(assert (=> b!220336 (= res!108036 (= (select (arr!5123 (_keys!6210 thiss!1504)) (index!5410 lt!112155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220337 () Bool)

(assert (=> b!220337 (= e!143262 false)))

(declare-fun lt!112153 () Bool)

(declare-datatypes ((List!3260 0))(
  ( (Nil!3257) (Cons!3256 (h!3904 (_ BitVec 64)) (t!8219 List!3260)) )
))
(declare-fun arrayNoDuplicates!0 (array!10807 (_ BitVec 32) List!3260) Bool)

(assert (=> b!220337 (= lt!112153 (arrayNoDuplicates!0 (_keys!6210 thiss!1504) #b00000000000000000000000000000000 Nil!3257))))

(declare-fun b!220338 () Bool)

(assert (=> b!220338 (= e!143260 (not call!20591))))

(declare-fun b!220339 () Bool)

(get-info :version)

(assert (=> b!220339 (= e!143261 ((_ is Undefined!810) lt!112155))))

(declare-fun b!220340 () Bool)

(declare-fun Unit!6573 () Unit!6571)

(assert (=> b!220340 (= e!143269 Unit!6573)))

(declare-fun lt!112154 () Unit!6571)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!202 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7355 V!7355 (_ BitVec 64) Int) Unit!6571)

(assert (=> b!220340 (= lt!112154 (lemmaInListMapThenSeekEntryOrOpenFindsIt!202 (_keys!6210 thiss!1504) (_values!4139 thiss!1504) (mask!9956 thiss!1504) (extraKeys!3893 thiss!1504) (zeroValue!3997 thiss!1504) (minValue!3997 thiss!1504) key!932 (defaultEntry!4156 thiss!1504)))))

(assert (=> b!220340 false))

(declare-fun b!220341 () Bool)

(declare-fun c!36669 () Bool)

(assert (=> b!220341 (= c!36669 ((_ is MissingVacant!810) lt!112155))))

(declare-fun e!143258 () Bool)

(assert (=> b!220341 (= e!143258 e!143261)))

(declare-fun b!220342 () Bool)

(assert (=> b!220342 (= e!143268 e!143263)))

(declare-fun res!108037 () Bool)

(assert (=> b!220342 (=> (not res!108037) (not e!143263))))

(assert (=> b!220342 (= res!108037 (or (= lt!112155 (MissingZero!810 index!297)) (= lt!112155 (MissingVacant!810 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10807 (_ BitVec 32)) SeekEntryResult!810)

(assert (=> b!220342 (= lt!112155 (seekEntryOrOpen!0 key!932 (_keys!6210 thiss!1504) (mask!9956 thiss!1504)))))

(declare-fun b!220343 () Bool)

(assert (=> b!220343 (= e!143265 tp_is_empty!5781)))

(declare-fun mapIsEmpty!9841 () Bool)

(assert (=> mapIsEmpty!9841 mapRes!9841))

(declare-fun b!220344 () Bool)

(declare-fun res!108031 () Bool)

(assert (=> b!220344 (=> (not res!108031) (not e!143267))))

(assert (=> b!220344 (= res!108031 call!20592)))

(assert (=> b!220344 (= e!143258 e!143267)))

(declare-fun res!108027 () Bool)

(assert (=> start!21852 (=> (not res!108027) (not e!143268))))

(declare-fun valid!1209 (LongMapFixedSize!2994) Bool)

(assert (=> start!21852 (= res!108027 (valid!1209 thiss!1504))))

(assert (=> start!21852 e!143268))

(assert (=> start!21852 e!143259))

(assert (=> start!21852 true))

(declare-fun mapNonEmpty!9841 () Bool)

(declare-fun tp!20898 () Bool)

(assert (=> mapNonEmpty!9841 (= mapRes!9841 (and tp!20898 e!143266))))

(declare-fun mapRest!9841 () (Array (_ BitVec 32) ValueCell!2547))

(declare-fun mapValue!9841 () ValueCell!2547)

(declare-fun mapKey!9841 () (_ BitVec 32))

(assert (=> mapNonEmpty!9841 (= (arr!5122 (_values!4139 thiss!1504)) (store mapRest!9841 mapKey!9841 mapValue!9841))))

(declare-fun b!220345 () Bool)

(declare-fun lt!112157 () Unit!6571)

(assert (=> b!220345 (= e!143269 lt!112157)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!215 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7355 V!7355 (_ BitVec 64) Int) Unit!6571)

(assert (=> b!220345 (= lt!112157 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!215 (_keys!6210 thiss!1504) (_values!4139 thiss!1504) (mask!9956 thiss!1504) (extraKeys!3893 thiss!1504) (zeroValue!3997 thiss!1504) (minValue!3997 thiss!1504) key!932 (defaultEntry!4156 thiss!1504)))))

(assert (=> b!220345 (= c!36667 ((_ is MissingZero!810) lt!112155))))

(assert (=> b!220345 e!143258))

(declare-fun bm!20589 () Bool)

(assert (=> bm!20589 (= call!20591 (arrayContainsKey!0 (_keys!6210 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21852 res!108027) b!220331))

(assert (= (and b!220331 res!108034) b!220342))

(assert (= (and b!220342 res!108037) b!220330))

(assert (= (and b!220330 c!36668) b!220340))

(assert (= (and b!220330 (not c!36668)) b!220345))

(assert (= (and b!220345 c!36667) b!220344))

(assert (= (and b!220345 (not c!36667)) b!220341))

(assert (= (and b!220344 res!108031) b!220336))

(assert (= (and b!220336 res!108036) b!220335))

(assert (= (and b!220341 c!36669) b!220327))

(assert (= (and b!220341 (not c!36669)) b!220339))

(assert (= (and b!220327 res!108028) b!220332))

(assert (= (and b!220332 res!108029) b!220338))

(assert (= (or b!220344 b!220327) bm!20588))

(assert (= (or b!220335 b!220338) bm!20589))

(assert (= (and b!220330 res!108026) b!220326))

(assert (= (and b!220326 res!108032) b!220329))

(assert (= (and b!220329 res!108030) b!220333))

(assert (= (and b!220333 res!108033) b!220325))

(assert (= (and b!220325 res!108035) b!220337))

(assert (= (and b!220328 condMapEmpty!9841) mapIsEmpty!9841))

(assert (= (and b!220328 (not condMapEmpty!9841)) mapNonEmpty!9841))

(assert (= (and mapNonEmpty!9841 ((_ is ValueCellFull!2547) mapValue!9841)) b!220324))

(assert (= (and b!220328 ((_ is ValueCellFull!2547) mapDefault!9841)) b!220343))

(assert (= b!220334 b!220328))

(assert (= start!21852 b!220334))

(declare-fun m!245505 () Bool)

(assert (=> bm!20588 m!245505))

(declare-fun m!245507 () Bool)

(assert (=> b!220340 m!245507))

(declare-fun m!245509 () Bool)

(assert (=> mapNonEmpty!9841 m!245509))

(declare-fun m!245511 () Bool)

(assert (=> b!220334 m!245511))

(declare-fun m!245513 () Bool)

(assert (=> b!220334 m!245513))

(declare-fun m!245515 () Bool)

(assert (=> b!220336 m!245515))

(declare-fun m!245517 () Bool)

(assert (=> b!220342 m!245517))

(declare-fun m!245519 () Bool)

(assert (=> b!220326 m!245519))

(declare-fun m!245521 () Bool)

(assert (=> start!21852 m!245521))

(declare-fun m!245523 () Bool)

(assert (=> b!220332 m!245523))

(declare-fun m!245525 () Bool)

(assert (=> b!220330 m!245525))

(declare-fun m!245527 () Bool)

(assert (=> b!220330 m!245527))

(assert (=> b!220330 m!245527))

(declare-fun m!245529 () Bool)

(assert (=> b!220330 m!245529))

(declare-fun m!245531 () Bool)

(assert (=> b!220345 m!245531))

(declare-fun m!245533 () Bool)

(assert (=> b!220329 m!245533))

(declare-fun m!245535 () Bool)

(assert (=> b!220325 m!245535))

(assert (=> bm!20589 m!245519))

(declare-fun m!245537 () Bool)

(assert (=> b!220337 m!245537))

(check-sat (not start!21852) (not bm!20588) b_and!12817 (not b!220337) (not b!220340) (not b!220325) (not b!220326) (not b!220345) (not b!220342) (not bm!20589) (not mapNonEmpty!9841) (not b!220334) (not b_next!5919) (not b!220330) tp_is_empty!5781 (not b!220329))
(check-sat b_and!12817 (not b_next!5919))
