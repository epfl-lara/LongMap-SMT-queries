; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21728 () Bool)

(assert start!21728)

(declare-fun b!218518 () Bool)

(declare-fun b_free!5877 () Bool)

(declare-fun b_next!5877 () Bool)

(assert (=> b!218518 (= b_free!5877 (not b_next!5877))))

(declare-fun tp!20766 () Bool)

(declare-fun b_and!12767 () Bool)

(assert (=> b!218518 (= tp!20766 b_and!12767)))

(declare-fun call!20393 () Bool)

(declare-fun c!36345 () Bool)

(declare-datatypes ((V!7299 0))(
  ( (V!7300 (val!2914 Int)) )
))
(declare-datatypes ((ValueCell!2526 0))(
  ( (ValueCellFull!2526 (v!4932 V!7299)) (EmptyCell!2526) )
))
(declare-datatypes ((array!10717 0))(
  ( (array!10718 (arr!5080 (Array (_ BitVec 32) ValueCell!2526)) (size!5412 (_ BitVec 32))) )
))
(declare-datatypes ((array!10719 0))(
  ( (array!10720 (arr!5081 (Array (_ BitVec 32) (_ BitVec 64))) (size!5413 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2952 0))(
  ( (LongMapFixedSize!2953 (defaultEntry!4126 Int) (mask!9903 (_ BitVec 32)) (extraKeys!3863 (_ BitVec 32)) (zeroValue!3967 V!7299) (minValue!3967 V!7299) (_size!1525 (_ BitVec 32)) (_keys!6175 array!10719) (_values!4109 array!10717) (_vacant!1525 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2952)

(declare-datatypes ((SeekEntryResult!789 0))(
  ( (MissingZero!789 (index!5326 (_ BitVec 32))) (Found!789 (index!5327 (_ BitVec 32))) (Intermediate!789 (undefined!1601 Bool) (index!5328 (_ BitVec 32)) (x!22845 (_ BitVec 32))) (Undefined!789) (MissingVacant!789 (index!5329 (_ BitVec 32))) )
))
(declare-fun lt!111547 () SeekEntryResult!789)

(declare-fun bm!20390 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20390 (= call!20393 (inRange!0 (ite c!36345 (index!5326 lt!111547) (index!5329 lt!111547)) (mask!9903 thiss!1504)))))

(declare-fun b!218512 () Bool)

(declare-datatypes ((Unit!6510 0))(
  ( (Unit!6511) )
))
(declare-fun e!142143 () Unit!6510)

(declare-fun lt!111549 () Unit!6510)

(assert (=> b!218512 (= e!142143 lt!111549)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7299 V!7299 (_ BitVec 64) Int) Unit!6510)

(assert (=> b!218512 (= lt!111549 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (_keys!6175 thiss!1504) (_values!4109 thiss!1504) (mask!9903 thiss!1504) (extraKeys!3863 thiss!1504) (zeroValue!3967 thiss!1504) (minValue!3967 thiss!1504) key!932 (defaultEntry!4126 thiss!1504)))))

(get-info :version)

(assert (=> b!218512 (= c!36345 ((_ is MissingZero!789) lt!111547))))

(declare-fun e!142146 () Bool)

(assert (=> b!218512 e!142146))

(declare-fun b!218513 () Bool)

(declare-fun res!107139 () Bool)

(declare-fun e!142149 () Bool)

(assert (=> b!218513 (=> (not res!107139) (not e!142149))))

(assert (=> b!218513 (= res!107139 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9771 () Bool)

(declare-fun mapRes!9771 () Bool)

(declare-fun tp!20765 () Bool)

(declare-fun e!142147 () Bool)

(assert (=> mapNonEmpty!9771 (= mapRes!9771 (and tp!20765 e!142147))))

(declare-fun mapValue!9771 () ValueCell!2526)

(declare-fun mapRest!9771 () (Array (_ BitVec 32) ValueCell!2526))

(declare-fun mapKey!9771 () (_ BitVec 32))

(assert (=> mapNonEmpty!9771 (= (arr!5080 (_values!4109 thiss!1504)) (store mapRest!9771 mapKey!9771 mapValue!9771))))

(declare-fun mapIsEmpty!9771 () Bool)

(assert (=> mapIsEmpty!9771 mapRes!9771))

(declare-fun b!218515 () Bool)

(declare-fun res!107134 () Bool)

(declare-fun e!142142 () Bool)

(assert (=> b!218515 (=> (not res!107134) (not e!142142))))

(assert (=> b!218515 (= res!107134 call!20393)))

(assert (=> b!218515 (= e!142146 e!142142)))

(declare-fun b!218516 () Bool)

(declare-fun e!142152 () Bool)

(assert (=> b!218516 (= e!142149 e!142152)))

(declare-fun res!107133 () Bool)

(assert (=> b!218516 (=> (not res!107133) (not e!142152))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218516 (= res!107133 (or (= lt!111547 (MissingZero!789 index!297)) (= lt!111547 (MissingVacant!789 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10719 (_ BitVec 32)) SeekEntryResult!789)

(assert (=> b!218516 (= lt!111547 (seekEntryOrOpen!0 key!932 (_keys!6175 thiss!1504) (mask!9903 thiss!1504)))))

(declare-fun b!218517 () Bool)

(declare-fun c!36347 () Bool)

(assert (=> b!218517 (= c!36347 ((_ is MissingVacant!789) lt!111547))))

(declare-fun e!142145 () Bool)

(assert (=> b!218517 (= e!142146 e!142145)))

(declare-fun tp_is_empty!5739 () Bool)

(declare-fun e!142148 () Bool)

(declare-fun e!142151 () Bool)

(declare-fun array_inv!3363 (array!10719) Bool)

(declare-fun array_inv!3364 (array!10717) Bool)

(assert (=> b!218518 (= e!142148 (and tp!20766 tp_is_empty!5739 (array_inv!3363 (_keys!6175 thiss!1504)) (array_inv!3364 (_values!4109 thiss!1504)) e!142151))))

(declare-fun b!218519 () Bool)

(declare-fun Unit!6512 () Unit!6510)

(assert (=> b!218519 (= e!142143 Unit!6512)))

(declare-fun lt!111546 () Unit!6510)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!187 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7299 V!7299 (_ BitVec 64) Int) Unit!6510)

(assert (=> b!218519 (= lt!111546 (lemmaInListMapThenSeekEntryOrOpenFindsIt!187 (_keys!6175 thiss!1504) (_values!4109 thiss!1504) (mask!9903 thiss!1504) (extraKeys!3863 thiss!1504) (zeroValue!3967 thiss!1504) (minValue!3967 thiss!1504) key!932 (defaultEntry!4126 thiss!1504)))))

(assert (=> b!218519 false))

(declare-fun b!218520 () Bool)

(assert (=> b!218520 (= e!142152 false)))

(declare-fun lt!111548 () Unit!6510)

(assert (=> b!218520 (= lt!111548 e!142143)))

(declare-fun c!36346 () Bool)

(declare-datatypes ((tuple2!4328 0))(
  ( (tuple2!4329 (_1!2175 (_ BitVec 64)) (_2!2175 V!7299)) )
))
(declare-datatypes ((List!3233 0))(
  ( (Nil!3230) (Cons!3229 (h!3876 tuple2!4328) (t!8188 List!3233)) )
))
(declare-datatypes ((ListLongMap!3241 0))(
  ( (ListLongMap!3242 (toList!1636 List!3233)) )
))
(declare-fun contains!1477 (ListLongMap!3241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1164 (array!10719 array!10717 (_ BitVec 32) (_ BitVec 32) V!7299 V!7299 (_ BitVec 32) Int) ListLongMap!3241)

(assert (=> b!218520 (= c!36346 (contains!1477 (getCurrentListMap!1164 (_keys!6175 thiss!1504) (_values!4109 thiss!1504) (mask!9903 thiss!1504) (extraKeys!3863 thiss!1504) (zeroValue!3967 thiss!1504) (minValue!3967 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4126 thiss!1504)) key!932))))

(declare-fun b!218521 () Bool)

(declare-fun e!142150 () Bool)

(assert (=> b!218521 (= e!142150 tp_is_empty!5739)))

(declare-fun b!218522 () Bool)

(assert (=> b!218522 (= e!142147 tp_is_empty!5739)))

(declare-fun bm!20391 () Bool)

(declare-fun call!20394 () Bool)

(declare-fun arrayContainsKey!0 (array!10719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20391 (= call!20394 (arrayContainsKey!0 (_keys!6175 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218523 () Bool)

(declare-fun e!142153 () Bool)

(assert (=> b!218523 (= e!142145 e!142153)))

(declare-fun res!107135 () Bool)

(assert (=> b!218523 (= res!107135 call!20393)))

(assert (=> b!218523 (=> (not res!107135) (not e!142153))))

(declare-fun b!218524 () Bool)

(assert (=> b!218524 (= e!142153 (not call!20394))))

(declare-fun b!218525 () Bool)

(declare-fun res!107138 () Bool)

(assert (=> b!218525 (=> (not res!107138) (not e!142142))))

(assert (=> b!218525 (= res!107138 (= (select (arr!5081 (_keys!6175 thiss!1504)) (index!5326 lt!111547)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218526 () Bool)

(assert (=> b!218526 (= e!142142 (not call!20394))))

(declare-fun b!218527 () Bool)

(assert (=> b!218527 (= e!142151 (and e!142150 mapRes!9771))))

(declare-fun condMapEmpty!9771 () Bool)

(declare-fun mapDefault!9771 () ValueCell!2526)

(assert (=> b!218527 (= condMapEmpty!9771 (= (arr!5080 (_values!4109 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2526)) mapDefault!9771)))))

(declare-fun b!218528 () Bool)

(declare-fun res!107137 () Bool)

(assert (=> b!218528 (= res!107137 (= (select (arr!5081 (_keys!6175 thiss!1504)) (index!5329 lt!111547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218528 (=> (not res!107137) (not e!142153))))

(declare-fun b!218514 () Bool)

(assert (=> b!218514 (= e!142145 ((_ is Undefined!789) lt!111547))))

(declare-fun res!107136 () Bool)

(assert (=> start!21728 (=> (not res!107136) (not e!142149))))

(declare-fun valid!1195 (LongMapFixedSize!2952) Bool)

(assert (=> start!21728 (= res!107136 (valid!1195 thiss!1504))))

(assert (=> start!21728 e!142149))

(assert (=> start!21728 e!142148))

(assert (=> start!21728 true))

(assert (= (and start!21728 res!107136) b!218513))

(assert (= (and b!218513 res!107139) b!218516))

(assert (= (and b!218516 res!107133) b!218520))

(assert (= (and b!218520 c!36346) b!218519))

(assert (= (and b!218520 (not c!36346)) b!218512))

(assert (= (and b!218512 c!36345) b!218515))

(assert (= (and b!218512 (not c!36345)) b!218517))

(assert (= (and b!218515 res!107134) b!218525))

(assert (= (and b!218525 res!107138) b!218526))

(assert (= (and b!218517 c!36347) b!218523))

(assert (= (and b!218517 (not c!36347)) b!218514))

(assert (= (and b!218523 res!107135) b!218528))

(assert (= (and b!218528 res!107137) b!218524))

(assert (= (or b!218515 b!218523) bm!20390))

(assert (= (or b!218526 b!218524) bm!20391))

(assert (= (and b!218527 condMapEmpty!9771) mapIsEmpty!9771))

(assert (= (and b!218527 (not condMapEmpty!9771)) mapNonEmpty!9771))

(assert (= (and mapNonEmpty!9771 ((_ is ValueCellFull!2526) mapValue!9771)) b!218522))

(assert (= (and b!218527 ((_ is ValueCellFull!2526) mapDefault!9771)) b!218521))

(assert (= b!218518 b!218527))

(assert (= start!21728 b!218518))

(declare-fun m!244395 () Bool)

(assert (=> b!218528 m!244395))

(declare-fun m!244397 () Bool)

(assert (=> b!218516 m!244397))

(declare-fun m!244399 () Bool)

(assert (=> bm!20391 m!244399))

(declare-fun m!244401 () Bool)

(assert (=> bm!20390 m!244401))

(declare-fun m!244403 () Bool)

(assert (=> b!218518 m!244403))

(declare-fun m!244405 () Bool)

(assert (=> b!218518 m!244405))

(declare-fun m!244407 () Bool)

(assert (=> start!21728 m!244407))

(declare-fun m!244409 () Bool)

(assert (=> b!218525 m!244409))

(declare-fun m!244411 () Bool)

(assert (=> b!218519 m!244411))

(declare-fun m!244413 () Bool)

(assert (=> b!218520 m!244413))

(assert (=> b!218520 m!244413))

(declare-fun m!244415 () Bool)

(assert (=> b!218520 m!244415))

(declare-fun m!244417 () Bool)

(assert (=> b!218512 m!244417))

(declare-fun m!244419 () Bool)

(assert (=> mapNonEmpty!9771 m!244419))

(check-sat tp_is_empty!5739 (not bm!20391) (not b!218519) (not b_next!5877) (not start!21728) (not b!218512) (not b!218518) (not b!218520) (not bm!20390) b_and!12767 (not mapNonEmpty!9771) (not b!218516))
(check-sat b_and!12767 (not b_next!5877))
