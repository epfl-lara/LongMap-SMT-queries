; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22212 () Bool)

(assert start!22212)

(declare-fun b!233044 () Bool)

(declare-fun b_free!6279 () Bool)

(declare-fun b_next!6279 () Bool)

(assert (=> b!233044 (= b_free!6279 (not b_next!6279))))

(declare-fun tp!21978 () Bool)

(declare-fun b_and!13177 () Bool)

(assert (=> b!233044 (= tp!21978 b_and!13177)))

(declare-fun b!233043 () Bool)

(declare-datatypes ((Unit!7205 0))(
  ( (Unit!7206) )
))
(declare-fun e!151382 () Unit!7205)

(declare-fun lt!117890 () Unit!7205)

(assert (=> b!233043 (= e!151382 lt!117890)))

(declare-datatypes ((V!7835 0))(
  ( (V!7836 (val!3115 Int)) )
))
(declare-datatypes ((ValueCell!2727 0))(
  ( (ValueCellFull!2727 (v!5135 V!7835)) (EmptyCell!2727) )
))
(declare-datatypes ((array!11525 0))(
  ( (array!11526 (arr!5482 (Array (_ BitVec 32) ValueCell!2727)) (size!5815 (_ BitVec 32))) )
))
(declare-datatypes ((array!11527 0))(
  ( (array!11528 (arr!5483 (Array (_ BitVec 32) (_ BitVec 64))) (size!5816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3354 0))(
  ( (LongMapFixedSize!3355 (defaultEntry!4336 Int) (mask!10256 (_ BitVec 32)) (extraKeys!4073 (_ BitVec 32)) (zeroValue!4177 V!7835) (minValue!4177 V!7835) (_size!1726 (_ BitVec 32)) (_keys!6390 array!11527) (_values!4319 array!11525) (_vacant!1726 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3354)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!331 (array!11527 array!11525 (_ BitVec 32) (_ BitVec 32) V!7835 V!7835 (_ BitVec 64) Int) Unit!7205)

(assert (=> b!233043 (= lt!117890 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!331 (_keys!6390 thiss!1504) (_values!4319 thiss!1504) (mask!10256 thiss!1504) (extraKeys!4073 thiss!1504) (zeroValue!4177 thiss!1504) (minValue!4177 thiss!1504) key!932 (defaultEntry!4336 thiss!1504)))))

(declare-fun c!38765 () Bool)

(declare-datatypes ((SeekEntryResult!972 0))(
  ( (MissingZero!972 (index!6058 (_ BitVec 32))) (Found!972 (index!6059 (_ BitVec 32))) (Intermediate!972 (undefined!1784 Bool) (index!6060 (_ BitVec 32)) (x!23592 (_ BitVec 32))) (Undefined!972) (MissingVacant!972 (index!6061 (_ BitVec 32))) )
))
(declare-fun lt!117892 () SeekEntryResult!972)

(get-info :version)

(assert (=> b!233043 (= c!38765 ((_ is MissingZero!972) lt!117892))))

(declare-fun e!151378 () Bool)

(assert (=> b!233043 e!151378))

(declare-fun e!151375 () Bool)

(declare-fun e!151373 () Bool)

(declare-fun tp_is_empty!6141 () Bool)

(declare-fun array_inv!3613 (array!11527) Bool)

(declare-fun array_inv!3614 (array!11525) Bool)

(assert (=> b!233044 (= e!151375 (and tp!21978 tp_is_empty!6141 (array_inv!3613 (_keys!6390 thiss!1504)) (array_inv!3614 (_values!4319 thiss!1504)) e!151373))))

(declare-fun b!233045 () Bool)

(declare-fun res!114397 () Bool)

(assert (=> b!233045 (= res!114397 (= (select (arr!5483 (_keys!6390 thiss!1504)) (index!6061 lt!117892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151376 () Bool)

(assert (=> b!233045 (=> (not res!114397) (not e!151376))))

(declare-fun b!233046 () Bool)

(declare-fun e!151377 () Bool)

(declare-fun call!21671 () Bool)

(assert (=> b!233046 (= e!151377 (not call!21671))))

(declare-fun b!233047 () Bool)

(declare-fun e!151379 () Bool)

(assert (=> b!233047 (= e!151379 ((_ is Undefined!972) lt!117892))))

(declare-fun b!233048 () Bool)

(declare-fun Unit!7207 () Unit!7205)

(assert (=> b!233048 (= e!151382 Unit!7207)))

(declare-fun lt!117891 () Unit!7205)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!314 (array!11527 array!11525 (_ BitVec 32) (_ BitVec 32) V!7835 V!7835 (_ BitVec 64) Int) Unit!7205)

(assert (=> b!233048 (= lt!117891 (lemmaInListMapThenSeekEntryOrOpenFindsIt!314 (_keys!6390 thiss!1504) (_values!4319 thiss!1504) (mask!10256 thiss!1504) (extraKeys!4073 thiss!1504) (zeroValue!4177 thiss!1504) (minValue!4177 thiss!1504) key!932 (defaultEntry!4336 thiss!1504)))))

(assert (=> b!233048 false))

(declare-fun b!233049 () Bool)

(declare-fun res!114391 () Bool)

(assert (=> b!233049 (=> (not res!114391) (not e!151377))))

(assert (=> b!233049 (= res!114391 (= (select (arr!5483 (_keys!6390 thiss!1504)) (index!6058 lt!117892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233050 () Bool)

(declare-fun e!151374 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!233050 (= e!151374 (not (inRange!0 index!297 (mask!10256 thiss!1504))))))

(declare-fun lt!117893 () Unit!7205)

(assert (=> b!233050 (= lt!117893 e!151382)))

(declare-fun c!38764 () Bool)

(declare-datatypes ((tuple2!4596 0))(
  ( (tuple2!4597 (_1!2309 (_ BitVec 64)) (_2!2309 V!7835)) )
))
(declare-datatypes ((List!3511 0))(
  ( (Nil!3508) (Cons!3507 (h!4155 tuple2!4596) (t!8470 List!3511)) )
))
(declare-datatypes ((ListLongMap!3509 0))(
  ( (ListLongMap!3510 (toList!1770 List!3511)) )
))
(declare-fun contains!1638 (ListLongMap!3509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1298 (array!11527 array!11525 (_ BitVec 32) (_ BitVec 32) V!7835 V!7835 (_ BitVec 32) Int) ListLongMap!3509)

(assert (=> b!233050 (= c!38764 (contains!1638 (getCurrentListMap!1298 (_keys!6390 thiss!1504) (_values!4319 thiss!1504) (mask!10256 thiss!1504) (extraKeys!4073 thiss!1504) (zeroValue!4177 thiss!1504) (minValue!4177 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4336 thiss!1504)) key!932))))

(declare-fun b!233051 () Bool)

(declare-fun e!151380 () Bool)

(declare-fun mapRes!10381 () Bool)

(assert (=> b!233051 (= e!151373 (and e!151380 mapRes!10381))))

(declare-fun condMapEmpty!10381 () Bool)

(declare-fun mapDefault!10381 () ValueCell!2727)

(assert (=> b!233051 (= condMapEmpty!10381 (= (arr!5482 (_values!4319 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2727)) mapDefault!10381)))))

(declare-fun b!233052 () Bool)

(declare-fun e!151371 () Bool)

(assert (=> b!233052 (= e!151371 e!151374)))

(declare-fun res!114393 () Bool)

(assert (=> b!233052 (=> (not res!114393) (not e!151374))))

(assert (=> b!233052 (= res!114393 (or (= lt!117892 (MissingZero!972 index!297)) (= lt!117892 (MissingVacant!972 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11527 (_ BitVec 32)) SeekEntryResult!972)

(assert (=> b!233052 (= lt!117892 (seekEntryOrOpen!0 key!932 (_keys!6390 thiss!1504) (mask!10256 thiss!1504)))))

(declare-fun b!233053 () Bool)

(declare-fun c!38766 () Bool)

(assert (=> b!233053 (= c!38766 ((_ is MissingVacant!972) lt!117892))))

(assert (=> b!233053 (= e!151378 e!151379)))

(declare-fun bm!21668 () Bool)

(declare-fun call!21672 () Bool)

(assert (=> bm!21668 (= call!21672 (inRange!0 (ite c!38765 (index!6058 lt!117892) (index!6061 lt!117892)) (mask!10256 thiss!1504)))))

(declare-fun b!233054 () Bool)

(declare-fun res!114394 () Bool)

(assert (=> b!233054 (=> (not res!114394) (not e!151377))))

(assert (=> b!233054 (= res!114394 call!21672)))

(assert (=> b!233054 (= e!151378 e!151377)))

(declare-fun bm!21669 () Bool)

(declare-fun arrayContainsKey!0 (array!11527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21669 (= call!21671 (arrayContainsKey!0 (_keys!6390 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!233055 () Bool)

(assert (=> b!233055 (= e!151376 (not call!21671))))

(declare-fun b!233056 () Bool)

(declare-fun res!114396 () Bool)

(assert (=> b!233056 (=> (not res!114396) (not e!151371))))

(assert (=> b!233056 (= res!114396 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233057 () Bool)

(assert (=> b!233057 (= e!151380 tp_is_empty!6141)))

(declare-fun mapIsEmpty!10381 () Bool)

(assert (=> mapIsEmpty!10381 mapRes!10381))

(declare-fun b!233058 () Bool)

(declare-fun e!151372 () Bool)

(assert (=> b!233058 (= e!151372 tp_is_empty!6141)))

(declare-fun b!233059 () Bool)

(assert (=> b!233059 (= e!151379 e!151376)))

(declare-fun res!114395 () Bool)

(assert (=> b!233059 (= res!114395 call!21672)))

(assert (=> b!233059 (=> (not res!114395) (not e!151376))))

(declare-fun res!114392 () Bool)

(assert (=> start!22212 (=> (not res!114392) (not e!151371))))

(declare-fun valid!1325 (LongMapFixedSize!3354) Bool)

(assert (=> start!22212 (= res!114392 (valid!1325 thiss!1504))))

(assert (=> start!22212 e!151371))

(assert (=> start!22212 e!151375))

(assert (=> start!22212 true))

(declare-fun mapNonEmpty!10381 () Bool)

(declare-fun tp!21979 () Bool)

(assert (=> mapNonEmpty!10381 (= mapRes!10381 (and tp!21979 e!151372))))

(declare-fun mapRest!10381 () (Array (_ BitVec 32) ValueCell!2727))

(declare-fun mapKey!10381 () (_ BitVec 32))

(declare-fun mapValue!10381 () ValueCell!2727)

(assert (=> mapNonEmpty!10381 (= (arr!5482 (_values!4319 thiss!1504)) (store mapRest!10381 mapKey!10381 mapValue!10381))))

(assert (= (and start!22212 res!114392) b!233056))

(assert (= (and b!233056 res!114396) b!233052))

(assert (= (and b!233052 res!114393) b!233050))

(assert (= (and b!233050 c!38764) b!233048))

(assert (= (and b!233050 (not c!38764)) b!233043))

(assert (= (and b!233043 c!38765) b!233054))

(assert (= (and b!233043 (not c!38765)) b!233053))

(assert (= (and b!233054 res!114394) b!233049))

(assert (= (and b!233049 res!114391) b!233046))

(assert (= (and b!233053 c!38766) b!233059))

(assert (= (and b!233053 (not c!38766)) b!233047))

(assert (= (and b!233059 res!114395) b!233045))

(assert (= (and b!233045 res!114397) b!233055))

(assert (= (or b!233054 b!233059) bm!21668))

(assert (= (or b!233046 b!233055) bm!21669))

(assert (= (and b!233051 condMapEmpty!10381) mapIsEmpty!10381))

(assert (= (and b!233051 (not condMapEmpty!10381)) mapNonEmpty!10381))

(assert (= (and mapNonEmpty!10381 ((_ is ValueCellFull!2727) mapValue!10381)) b!233058))

(assert (= (and b!233051 ((_ is ValueCellFull!2727) mapDefault!10381)) b!233057))

(assert (= b!233044 b!233051))

(assert (= start!22212 b!233044))

(declare-fun m!254529 () Bool)

(assert (=> b!233052 m!254529))

(declare-fun m!254531 () Bool)

(assert (=> b!233044 m!254531))

(declare-fun m!254533 () Bool)

(assert (=> b!233044 m!254533))

(declare-fun m!254535 () Bool)

(assert (=> bm!21668 m!254535))

(declare-fun m!254537 () Bool)

(assert (=> bm!21669 m!254537))

(declare-fun m!254539 () Bool)

(assert (=> b!233048 m!254539))

(declare-fun m!254541 () Bool)

(assert (=> b!233050 m!254541))

(declare-fun m!254543 () Bool)

(assert (=> b!233050 m!254543))

(assert (=> b!233050 m!254543))

(declare-fun m!254545 () Bool)

(assert (=> b!233050 m!254545))

(declare-fun m!254547 () Bool)

(assert (=> mapNonEmpty!10381 m!254547))

(declare-fun m!254549 () Bool)

(assert (=> b!233049 m!254549))

(declare-fun m!254551 () Bool)

(assert (=> b!233043 m!254551))

(declare-fun m!254553 () Bool)

(assert (=> b!233045 m!254553))

(declare-fun m!254555 () Bool)

(assert (=> start!22212 m!254555))

(check-sat (not mapNonEmpty!10381) (not start!22212) (not b!233043) (not b_next!6279) (not bm!21669) (not b!233044) (not b!233050) (not b!233048) (not b!233052) tp_is_empty!6141 (not bm!21668) b_and!13177)
(check-sat b_and!13177 (not b_next!6279))
