; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22700 () Bool)

(assert start!22700)

(declare-fun b!236931 () Bool)

(declare-fun b_free!6371 () Bool)

(declare-fun b_next!6371 () Bool)

(assert (=> b!236931 (= b_free!6371 (not b_next!6371))))

(declare-fun tp!22297 () Bool)

(declare-fun b_and!13317 () Bool)

(assert (=> b!236931 (= tp!22297 b_and!13317)))

(declare-fun b!236930 () Bool)

(declare-fun res!116158 () Bool)

(declare-fun e!153871 () Bool)

(assert (=> b!236930 (=> (not res!116158) (not e!153871))))

(declare-datatypes ((V!7957 0))(
  ( (V!7958 (val!3161 Int)) )
))
(declare-datatypes ((ValueCell!2773 0))(
  ( (ValueCellFull!2773 (v!5193 V!7957)) (EmptyCell!2773) )
))
(declare-datatypes ((array!11733 0))(
  ( (array!11734 (arr!5574 (Array (_ BitVec 32) ValueCell!2773)) (size!5913 (_ BitVec 32))) )
))
(declare-datatypes ((array!11735 0))(
  ( (array!11736 (arr!5575 (Array (_ BitVec 32) (_ BitVec 64))) (size!5914 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3446 0))(
  ( (LongMapFixedSize!3447 (defaultEntry!4400 Int) (mask!10401 (_ BitVec 32)) (extraKeys!4137 (_ BitVec 32)) (zeroValue!4241 V!7957) (minValue!4241 V!7957) (_size!1772 (_ BitVec 32)) (_keys!6487 array!11735) (_values!4383 array!11733) (_vacant!1772 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3446)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4658 0))(
  ( (tuple2!4659 (_1!2340 (_ BitVec 64)) (_2!2340 V!7957)) )
))
(declare-datatypes ((List!3560 0))(
  ( (Nil!3557) (Cons!3556 (h!4210 tuple2!4658) (t!8543 List!3560)) )
))
(declare-datatypes ((ListLongMap!3571 0))(
  ( (ListLongMap!3572 (toList!1801 List!3560)) )
))
(declare-fun contains!1683 (ListLongMap!3571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1329 (array!11735 array!11733 (_ BitVec 32) (_ BitVec 32) V!7957 V!7957 (_ BitVec 32) Int) ListLongMap!3571)

(assert (=> b!236930 (= res!116158 (not (contains!1683 (getCurrentListMap!1329 (_keys!6487 thiss!1504) (_values!4383 thiss!1504) (mask!10401 thiss!1504) (extraKeys!4137 thiss!1504) (zeroValue!4241 thiss!1504) (minValue!4241 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4400 thiss!1504)) key!932)))))

(declare-fun e!153869 () Bool)

(declare-fun e!153872 () Bool)

(declare-fun tp_is_empty!6233 () Bool)

(declare-fun array_inv!3679 (array!11735) Bool)

(declare-fun array_inv!3680 (array!11733) Bool)

(assert (=> b!236931 (= e!153872 (and tp!22297 tp_is_empty!6233 (array_inv!3679 (_keys!6487 thiss!1504)) (array_inv!3680 (_values!4383 thiss!1504)) e!153869))))

(declare-fun b!236932 () Bool)

(declare-fun e!153870 () Bool)

(assert (=> b!236932 (= e!153870 e!153871)))

(declare-fun res!116154 () Bool)

(assert (=> b!236932 (=> (not res!116154) (not e!153871))))

(declare-datatypes ((SeekEntryResult!1006 0))(
  ( (MissingZero!1006 (index!6194 (_ BitVec 32))) (Found!1006 (index!6195 (_ BitVec 32))) (Intermediate!1006 (undefined!1818 Bool) (index!6196 (_ BitVec 32)) (x!23914 (_ BitVec 32))) (Undefined!1006) (MissingVacant!1006 (index!6197 (_ BitVec 32))) )
))
(declare-fun lt!119789 () SeekEntryResult!1006)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236932 (= res!116154 (or (= lt!119789 (MissingZero!1006 index!297)) (= lt!119789 (MissingVacant!1006 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11735 (_ BitVec 32)) SeekEntryResult!1006)

(assert (=> b!236932 (= lt!119789 (seekEntryOrOpen!0 key!932 (_keys!6487 thiss!1504) (mask!10401 thiss!1504)))))

(declare-fun res!116156 () Bool)

(assert (=> start!22700 (=> (not res!116156) (not e!153870))))

(declare-fun valid!1359 (LongMapFixedSize!3446) Bool)

(assert (=> start!22700 (= res!116156 (valid!1359 thiss!1504))))

(assert (=> start!22700 e!153870))

(assert (=> start!22700 e!153872))

(assert (=> start!22700 true))

(declare-fun mapIsEmpty!10561 () Bool)

(declare-fun mapRes!10561 () Bool)

(assert (=> mapIsEmpty!10561 mapRes!10561))

(declare-fun mapNonEmpty!10561 () Bool)

(declare-fun tp!22296 () Bool)

(declare-fun e!153873 () Bool)

(assert (=> mapNonEmpty!10561 (= mapRes!10561 (and tp!22296 e!153873))))

(declare-fun mapRest!10561 () (Array (_ BitVec 32) ValueCell!2773))

(declare-fun mapKey!10561 () (_ BitVec 32))

(declare-fun mapValue!10561 () ValueCell!2773)

(assert (=> mapNonEmpty!10561 (= (arr!5574 (_values!4383 thiss!1504)) (store mapRest!10561 mapKey!10561 mapValue!10561))))

(declare-fun b!236933 () Bool)

(assert (=> b!236933 (= e!153871 (and (= (size!5913 (_values!4383 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10401 thiss!1504))) (= (size!5914 (_keys!6487 thiss!1504)) (size!5913 (_values!4383 thiss!1504))) (bvslt (mask!10401 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236934 () Bool)

(declare-fun res!116157 () Bool)

(assert (=> b!236934 (=> (not res!116157) (not e!153871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236934 (= res!116157 (validMask!0 (mask!10401 thiss!1504)))))

(declare-fun b!236935 () Bool)

(assert (=> b!236935 (= e!153873 tp_is_empty!6233)))

(declare-fun b!236936 () Bool)

(declare-fun res!116155 () Bool)

(assert (=> b!236936 (=> (not res!116155) (not e!153870))))

(assert (=> b!236936 (= res!116155 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236937 () Bool)

(declare-fun e!153875 () Bool)

(assert (=> b!236937 (= e!153869 (and e!153875 mapRes!10561))))

(declare-fun condMapEmpty!10561 () Bool)

(declare-fun mapDefault!10561 () ValueCell!2773)

