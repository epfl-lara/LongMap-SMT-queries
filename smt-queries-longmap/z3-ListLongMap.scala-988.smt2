; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21320 () Bool)

(assert start!21320)

(declare-fun b!214516 () Bool)

(declare-fun b_free!5677 () Bool)

(declare-fun b_next!5677 () Bool)

(assert (=> b!214516 (= b_free!5677 (not b_next!5677))))

(declare-fun tp!20121 () Bool)

(declare-fun b_and!12581 () Bool)

(assert (=> b!214516 (= tp!20121 b_and!12581)))

(declare-fun e!139514 () Bool)

(declare-datatypes ((V!7033 0))(
  ( (V!7034 (val!2814 Int)) )
))
(declare-datatypes ((ValueCell!2426 0))(
  ( (ValueCellFull!2426 (v!4833 V!7033)) (EmptyCell!2426) )
))
(declare-datatypes ((array!10289 0))(
  ( (array!10290 (arr!4879 (Array (_ BitVec 32) ValueCell!2426)) (size!5206 (_ BitVec 32))) )
))
(declare-datatypes ((array!10291 0))(
  ( (array!10292 (arr!4880 (Array (_ BitVec 32) (_ BitVec 64))) (size!5207 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2752 0))(
  ( (LongMapFixedSize!2753 (defaultEntry!4026 Int) (mask!9688 (_ BitVec 32)) (extraKeys!3763 (_ BitVec 32)) (zeroValue!3867 V!7033) (minValue!3867 V!7033) (_size!1425 (_ BitVec 32)) (_keys!6044 array!10291) (_values!4009 array!10289) (_vacant!1425 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2752)

(declare-fun tp_is_empty!5539 () Bool)

(declare-fun e!139513 () Bool)

(declare-fun array_inv!3205 (array!10291) Bool)

(declare-fun array_inv!3206 (array!10289) Bool)

(assert (=> b!214516 (= e!139514 (and tp!20121 tp_is_empty!5539 (array_inv!3205 (_keys!6044 thiss!1504)) (array_inv!3206 (_values!4009 thiss!1504)) e!139513))))

(declare-fun res!105015 () Bool)

(declare-fun e!139510 () Bool)

(assert (=> start!21320 (=> (not res!105015) (not e!139510))))

(declare-fun valid!1146 (LongMapFixedSize!2752) Bool)

(assert (=> start!21320 (= res!105015 (valid!1146 thiss!1504))))

(assert (=> start!21320 e!139510))

(assert (=> start!21320 e!139514))

(assert (=> start!21320 true))

(declare-fun mapNonEmpty!9427 () Bool)

(declare-fun mapRes!9427 () Bool)

(declare-fun tp!20122 () Bool)

(declare-fun e!139512 () Bool)

(assert (=> mapNonEmpty!9427 (= mapRes!9427 (and tp!20122 e!139512))))

(declare-fun mapKey!9427 () (_ BitVec 32))

(declare-fun mapRest!9427 () (Array (_ BitVec 32) ValueCell!2426))

(declare-fun mapValue!9427 () ValueCell!2426)

(assert (=> mapNonEmpty!9427 (= (arr!4879 (_values!4009 thiss!1504)) (store mapRest!9427 mapKey!9427 mapValue!9427))))

(declare-fun b!214517 () Bool)

(declare-fun res!105014 () Bool)

(assert (=> b!214517 (=> (not res!105014) (not e!139510))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214517 (= res!105014 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214518 () Bool)

(assert (=> b!214518 (= e!139512 tp_is_empty!5539)))

(declare-fun b!214519 () Bool)

(declare-fun res!105016 () Bool)

(assert (=> b!214519 (=> (not res!105016) (not e!139510))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!707 0))(
  ( (MissingZero!707 (index!4998 (_ BitVec 32))) (Found!707 (index!4999 (_ BitVec 32))) (Intermediate!707 (undefined!1519 Bool) (index!5000 (_ BitVec 32)) (x!22350 (_ BitVec 32))) (Undefined!707) (MissingVacant!707 (index!5001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10291 (_ BitVec 32)) SeekEntryResult!707)

(assert (=> b!214519 (= res!105016 (not (= (seekEntryOrOpen!0 key!932 (_keys!6044 thiss!1504) (mask!9688 thiss!1504)) (MissingZero!707 index!297))))))

(declare-fun b!214520 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214520 (= e!139510 (not (validMask!0 (mask!9688 thiss!1504))))))

(declare-fun b!214521 () Bool)

(declare-fun e!139515 () Bool)

(assert (=> b!214521 (= e!139513 (and e!139515 mapRes!9427))))

(declare-fun condMapEmpty!9427 () Bool)

(declare-fun mapDefault!9427 () ValueCell!2426)

(assert (=> b!214521 (= condMapEmpty!9427 (= (arr!4879 (_values!4009 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2426)) mapDefault!9427)))))

(declare-fun b!214522 () Bool)

(assert (=> b!214522 (= e!139515 tp_is_empty!5539)))

(declare-fun mapIsEmpty!9427 () Bool)

(assert (=> mapIsEmpty!9427 mapRes!9427))

(assert (= (and start!21320 res!105015) b!214517))

(assert (= (and b!214517 res!105014) b!214519))

(assert (= (and b!214519 res!105016) b!214520))

(assert (= (and b!214521 condMapEmpty!9427) mapIsEmpty!9427))

(assert (= (and b!214521 (not condMapEmpty!9427)) mapNonEmpty!9427))

(get-info :version)

(assert (= (and mapNonEmpty!9427 ((_ is ValueCellFull!2426) mapValue!9427)) b!214518))

(assert (= (and b!214521 ((_ is ValueCellFull!2426) mapDefault!9427)) b!214522))

(assert (= b!214516 b!214521))

(assert (= start!21320 b!214516))

(declare-fun m!242311 () Bool)

(assert (=> b!214516 m!242311))

(declare-fun m!242313 () Bool)

(assert (=> b!214516 m!242313))

(declare-fun m!242315 () Bool)

(assert (=> start!21320 m!242315))

(declare-fun m!242317 () Bool)

(assert (=> b!214519 m!242317))

(declare-fun m!242319 () Bool)

(assert (=> b!214520 m!242319))

(declare-fun m!242321 () Bool)

(assert (=> mapNonEmpty!9427 m!242321))

(check-sat (not b_next!5677) tp_is_empty!5539 (not b!214520) (not start!21320) (not b!214516) b_and!12581 (not b!214519) (not mapNonEmpty!9427))
(check-sat b_and!12581 (not b_next!5677))
(get-model)

(declare-fun d!58393 () Bool)

(declare-fun res!105041 () Bool)

(declare-fun e!139554 () Bool)

(assert (=> d!58393 (=> (not res!105041) (not e!139554))))

(declare-fun simpleValid!211 (LongMapFixedSize!2752) Bool)

(assert (=> d!58393 (= res!105041 (simpleValid!211 thiss!1504))))

(assert (=> d!58393 (= (valid!1146 thiss!1504) e!139554)))

(declare-fun b!214571 () Bool)

(declare-fun res!105042 () Bool)

(assert (=> b!214571 (=> (not res!105042) (not e!139554))))

(declare-fun arrayCountValidKeys!0 (array!10291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214571 (= res!105042 (= (arrayCountValidKeys!0 (_keys!6044 thiss!1504) #b00000000000000000000000000000000 (size!5207 (_keys!6044 thiss!1504))) (_size!1425 thiss!1504)))))

(declare-fun b!214572 () Bool)

(declare-fun res!105043 () Bool)

(assert (=> b!214572 (=> (not res!105043) (not e!139554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10291 (_ BitVec 32)) Bool)

(assert (=> b!214572 (= res!105043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6044 thiss!1504) (mask!9688 thiss!1504)))))

(declare-fun b!214573 () Bool)

(declare-datatypes ((List!3065 0))(
  ( (Nil!3062) (Cons!3061 (h!3703 (_ BitVec 64)) (t!8012 List!3065)) )
))
(declare-fun arrayNoDuplicates!0 (array!10291 (_ BitVec 32) List!3065) Bool)

(assert (=> b!214573 (= e!139554 (arrayNoDuplicates!0 (_keys!6044 thiss!1504) #b00000000000000000000000000000000 Nil!3062))))

(assert (= (and d!58393 res!105041) b!214571))

(assert (= (and b!214571 res!105042) b!214572))

(assert (= (and b!214572 res!105043) b!214573))

(declare-fun m!242347 () Bool)

(assert (=> d!58393 m!242347))

(declare-fun m!242349 () Bool)

(assert (=> b!214571 m!242349))

(declare-fun m!242351 () Bool)

(assert (=> b!214572 m!242351))

(declare-fun m!242353 () Bool)

(assert (=> b!214573 m!242353))

(assert (=> start!21320 d!58393))

(declare-fun d!58395 () Bool)

(declare-fun lt!110856 () SeekEntryResult!707)

(assert (=> d!58395 (and (or ((_ is Undefined!707) lt!110856) (not ((_ is Found!707) lt!110856)) (and (bvsge (index!4999 lt!110856) #b00000000000000000000000000000000) (bvslt (index!4999 lt!110856) (size!5207 (_keys!6044 thiss!1504))))) (or ((_ is Undefined!707) lt!110856) ((_ is Found!707) lt!110856) (not ((_ is MissingZero!707) lt!110856)) (and (bvsge (index!4998 lt!110856) #b00000000000000000000000000000000) (bvslt (index!4998 lt!110856) (size!5207 (_keys!6044 thiss!1504))))) (or ((_ is Undefined!707) lt!110856) ((_ is Found!707) lt!110856) ((_ is MissingZero!707) lt!110856) (not ((_ is MissingVacant!707) lt!110856)) (and (bvsge (index!5001 lt!110856) #b00000000000000000000000000000000) (bvslt (index!5001 lt!110856) (size!5207 (_keys!6044 thiss!1504))))) (or ((_ is Undefined!707) lt!110856) (ite ((_ is Found!707) lt!110856) (= (select (arr!4880 (_keys!6044 thiss!1504)) (index!4999 lt!110856)) key!932) (ite ((_ is MissingZero!707) lt!110856) (= (select (arr!4880 (_keys!6044 thiss!1504)) (index!4998 lt!110856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!707) lt!110856) (= (select (arr!4880 (_keys!6044 thiss!1504)) (index!5001 lt!110856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139562 () SeekEntryResult!707)

(assert (=> d!58395 (= lt!110856 e!139562)))

(declare-fun c!36068 () Bool)

(declare-fun lt!110858 () SeekEntryResult!707)

(assert (=> d!58395 (= c!36068 (and ((_ is Intermediate!707) lt!110858) (undefined!1519 lt!110858)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10291 (_ BitVec 32)) SeekEntryResult!707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58395 (= lt!110858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9688 thiss!1504)) key!932 (_keys!6044 thiss!1504) (mask!9688 thiss!1504)))))

(assert (=> d!58395 (validMask!0 (mask!9688 thiss!1504))))

(assert (=> d!58395 (= (seekEntryOrOpen!0 key!932 (_keys!6044 thiss!1504) (mask!9688 thiss!1504)) lt!110856)))

(declare-fun b!214586 () Bool)

(declare-fun c!36067 () Bool)

(declare-fun lt!110857 () (_ BitVec 64))

(assert (=> b!214586 (= c!36067 (= lt!110857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139563 () SeekEntryResult!707)

(declare-fun e!139561 () SeekEntryResult!707)

(assert (=> b!214586 (= e!139563 e!139561)))

(declare-fun b!214587 () Bool)

(assert (=> b!214587 (= e!139563 (Found!707 (index!5000 lt!110858)))))

(declare-fun b!214588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10291 (_ BitVec 32)) SeekEntryResult!707)

(assert (=> b!214588 (= e!139561 (seekKeyOrZeroReturnVacant!0 (x!22350 lt!110858) (index!5000 lt!110858) (index!5000 lt!110858) key!932 (_keys!6044 thiss!1504) (mask!9688 thiss!1504)))))

(declare-fun b!214589 () Bool)

(assert (=> b!214589 (= e!139562 Undefined!707)))

(declare-fun b!214590 () Bool)

(assert (=> b!214590 (= e!139562 e!139563)))

(assert (=> b!214590 (= lt!110857 (select (arr!4880 (_keys!6044 thiss!1504)) (index!5000 lt!110858)))))

(declare-fun c!36069 () Bool)

(assert (=> b!214590 (= c!36069 (= lt!110857 key!932))))

(declare-fun b!214591 () Bool)

(assert (=> b!214591 (= e!139561 (MissingZero!707 (index!5000 lt!110858)))))

(assert (= (and d!58395 c!36068) b!214589))

(assert (= (and d!58395 (not c!36068)) b!214590))

(assert (= (and b!214590 c!36069) b!214587))

(assert (= (and b!214590 (not c!36069)) b!214586))

(assert (= (and b!214586 c!36067) b!214591))

(assert (= (and b!214586 (not c!36067)) b!214588))

(declare-fun m!242355 () Bool)

(assert (=> d!58395 m!242355))

(assert (=> d!58395 m!242319))

(declare-fun m!242357 () Bool)

(assert (=> d!58395 m!242357))

(declare-fun m!242359 () Bool)

(assert (=> d!58395 m!242359))

(declare-fun m!242361 () Bool)

(assert (=> d!58395 m!242361))

(declare-fun m!242363 () Bool)

(assert (=> d!58395 m!242363))

(assert (=> d!58395 m!242361))

(declare-fun m!242365 () Bool)

(assert (=> b!214588 m!242365))

(declare-fun m!242367 () Bool)

(assert (=> b!214590 m!242367))

(assert (=> b!214519 d!58395))

(declare-fun d!58397 () Bool)

(assert (=> d!58397 (= (validMask!0 (mask!9688 thiss!1504)) (and (or (= (mask!9688 thiss!1504) #b00000000000000000000000000000111) (= (mask!9688 thiss!1504) #b00000000000000000000000000001111) (= (mask!9688 thiss!1504) #b00000000000000000000000000011111) (= (mask!9688 thiss!1504) #b00000000000000000000000000111111) (= (mask!9688 thiss!1504) #b00000000000000000000000001111111) (= (mask!9688 thiss!1504) #b00000000000000000000000011111111) (= (mask!9688 thiss!1504) #b00000000000000000000000111111111) (= (mask!9688 thiss!1504) #b00000000000000000000001111111111) (= (mask!9688 thiss!1504) #b00000000000000000000011111111111) (= (mask!9688 thiss!1504) #b00000000000000000000111111111111) (= (mask!9688 thiss!1504) #b00000000000000000001111111111111) (= (mask!9688 thiss!1504) #b00000000000000000011111111111111) (= (mask!9688 thiss!1504) #b00000000000000000111111111111111) (= (mask!9688 thiss!1504) #b00000000000000001111111111111111) (= (mask!9688 thiss!1504) #b00000000000000011111111111111111) (= (mask!9688 thiss!1504) #b00000000000000111111111111111111) (= (mask!9688 thiss!1504) #b00000000000001111111111111111111) (= (mask!9688 thiss!1504) #b00000000000011111111111111111111) (= (mask!9688 thiss!1504) #b00000000000111111111111111111111) (= (mask!9688 thiss!1504) #b00000000001111111111111111111111) (= (mask!9688 thiss!1504) #b00000000011111111111111111111111) (= (mask!9688 thiss!1504) #b00000000111111111111111111111111) (= (mask!9688 thiss!1504) #b00000001111111111111111111111111) (= (mask!9688 thiss!1504) #b00000011111111111111111111111111) (= (mask!9688 thiss!1504) #b00000111111111111111111111111111) (= (mask!9688 thiss!1504) #b00001111111111111111111111111111) (= (mask!9688 thiss!1504) #b00011111111111111111111111111111) (= (mask!9688 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9688 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214520 d!58397))

(declare-fun d!58399 () Bool)

(assert (=> d!58399 (= (array_inv!3205 (_keys!6044 thiss!1504)) (bvsge (size!5207 (_keys!6044 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214516 d!58399))

(declare-fun d!58401 () Bool)

(assert (=> d!58401 (= (array_inv!3206 (_values!4009 thiss!1504)) (bvsge (size!5206 (_values!4009 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214516 d!58401))

(declare-fun b!214599 () Bool)

(declare-fun e!139568 () Bool)

(assert (=> b!214599 (= e!139568 tp_is_empty!5539)))

(declare-fun mapIsEmpty!9436 () Bool)

(declare-fun mapRes!9436 () Bool)

(assert (=> mapIsEmpty!9436 mapRes!9436))

(declare-fun condMapEmpty!9436 () Bool)

(declare-fun mapDefault!9436 () ValueCell!2426)

(assert (=> mapNonEmpty!9427 (= condMapEmpty!9436 (= mapRest!9427 ((as const (Array (_ BitVec 32) ValueCell!2426)) mapDefault!9436)))))

(assert (=> mapNonEmpty!9427 (= tp!20122 (and e!139568 mapRes!9436))))

(declare-fun b!214598 () Bool)

(declare-fun e!139569 () Bool)

(assert (=> b!214598 (= e!139569 tp_is_empty!5539)))

(declare-fun mapNonEmpty!9436 () Bool)

(declare-fun tp!20137 () Bool)

(assert (=> mapNonEmpty!9436 (= mapRes!9436 (and tp!20137 e!139569))))

(declare-fun mapValue!9436 () ValueCell!2426)

(declare-fun mapKey!9436 () (_ BitVec 32))

(declare-fun mapRest!9436 () (Array (_ BitVec 32) ValueCell!2426))

(assert (=> mapNonEmpty!9436 (= mapRest!9427 (store mapRest!9436 mapKey!9436 mapValue!9436))))

(assert (= (and mapNonEmpty!9427 condMapEmpty!9436) mapIsEmpty!9436))

(assert (= (and mapNonEmpty!9427 (not condMapEmpty!9436)) mapNonEmpty!9436))

(assert (= (and mapNonEmpty!9436 ((_ is ValueCellFull!2426) mapValue!9436)) b!214598))

(assert (= (and mapNonEmpty!9427 ((_ is ValueCellFull!2426) mapDefault!9436)) b!214599))

(declare-fun m!242369 () Bool)

(assert (=> mapNonEmpty!9436 m!242369))

(check-sat (not b_next!5677) (not b!214572) (not d!58393) (not b!214573) (not b!214588) b_and!12581 (not d!58395) (not mapNonEmpty!9436) tp_is_empty!5539 (not b!214571))
(check-sat b_and!12581 (not b_next!5677))
