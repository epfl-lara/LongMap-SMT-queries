; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21648 () Bool)

(assert start!21648)

(declare-fun b!217169 () Bool)

(declare-fun b_free!5797 () Bool)

(declare-fun b_next!5797 () Bool)

(assert (=> b!217169 (= b_free!5797 (not b_next!5797))))

(declare-fun tp!20525 () Bool)

(declare-fun b_and!12687 () Bool)

(assert (=> b!217169 (= tp!20525 b_and!12687)))

(declare-fun b!217162 () Bool)

(declare-fun res!106296 () Bool)

(declare-fun e!141282 () Bool)

(assert (=> b!217162 (=> (not res!106296) (not e!141282))))

(declare-datatypes ((V!7193 0))(
  ( (V!7194 (val!2874 Int)) )
))
(declare-datatypes ((ValueCell!2486 0))(
  ( (ValueCellFull!2486 (v!4892 V!7193)) (EmptyCell!2486) )
))
(declare-datatypes ((array!10557 0))(
  ( (array!10558 (arr!5000 (Array (_ BitVec 32) ValueCell!2486)) (size!5332 (_ BitVec 32))) )
))
(declare-datatypes ((array!10559 0))(
  ( (array!10560 (arr!5001 (Array (_ BitVec 32) (_ BitVec 64))) (size!5333 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2872 0))(
  ( (LongMapFixedSize!2873 (defaultEntry!4086 Int) (mask!9837 (_ BitVec 32)) (extraKeys!3823 (_ BitVec 32)) (zeroValue!3927 V!7193) (minValue!3927 V!7193) (_size!1485 (_ BitVec 32)) (_keys!6135 array!10559) (_values!4069 array!10557) (_vacant!1485 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2872)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217162 (= res!106296 (validMask!0 (mask!9837 thiss!1504)))))

(declare-fun b!217163 () Bool)

(declare-fun e!141283 () Bool)

(declare-fun tp_is_empty!5659 () Bool)

(assert (=> b!217163 (= e!141283 tp_is_empty!5659)))

(declare-fun b!217164 () Bool)

(declare-fun res!106298 () Bool)

(declare-fun e!141279 () Bool)

(assert (=> b!217164 (=> (not res!106298) (not e!141279))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217164 (= res!106298 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217165 () Bool)

(declare-fun res!106294 () Bool)

(assert (=> b!217165 (=> (not res!106294) (not e!141282))))

(declare-datatypes ((tuple2!4276 0))(
  ( (tuple2!4277 (_1!2149 (_ BitVec 64)) (_2!2149 V!7193)) )
))
(declare-datatypes ((List!3179 0))(
  ( (Nil!3176) (Cons!3175 (h!3822 tuple2!4276) (t!8134 List!3179)) )
))
(declare-datatypes ((ListLongMap!3189 0))(
  ( (ListLongMap!3190 (toList!1610 List!3179)) )
))
(declare-fun contains!1451 (ListLongMap!3189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1138 (array!10559 array!10557 (_ BitVec 32) (_ BitVec 32) V!7193 V!7193 (_ BitVec 32) Int) ListLongMap!3189)

(assert (=> b!217165 (= res!106294 (contains!1451 (getCurrentListMap!1138 (_keys!6135 thiss!1504) (_values!4069 thiss!1504) (mask!9837 thiss!1504) (extraKeys!3823 thiss!1504) (zeroValue!3927 thiss!1504) (minValue!3927 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4086 thiss!1504)) key!932))))

(declare-fun b!217166 () Bool)

(assert (=> b!217166 (= e!141279 e!141282)))

(declare-fun res!106299 () Bool)

(assert (=> b!217166 (=> (not res!106299) (not e!141282))))

(declare-datatypes ((SeekEntryResult!762 0))(
  ( (MissingZero!762 (index!5218 (_ BitVec 32))) (Found!762 (index!5219 (_ BitVec 32))) (Intermediate!762 (undefined!1574 Bool) (index!5220 (_ BitVec 32)) (x!22714 (_ BitVec 32))) (Undefined!762) (MissingVacant!762 (index!5221 (_ BitVec 32))) )
))
(declare-fun lt!111296 () SeekEntryResult!762)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217166 (= res!106299 (or (= lt!111296 (MissingZero!762 index!297)) (= lt!111296 (MissingVacant!762 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10559 (_ BitVec 32)) SeekEntryResult!762)

(assert (=> b!217166 (= lt!111296 (seekEntryOrOpen!0 key!932 (_keys!6135 thiss!1504) (mask!9837 thiss!1504)))))

(declare-fun b!217167 () Bool)

(assert (=> b!217167 (= e!141282 false)))

(declare-fun lt!111297 () Bool)

(declare-datatypes ((List!3180 0))(
  ( (Nil!3177) (Cons!3176 (h!3823 (_ BitVec 64)) (t!8135 List!3180)) )
))
(declare-fun arrayNoDuplicates!0 (array!10559 (_ BitVec 32) List!3180) Bool)

(assert (=> b!217167 (= lt!111297 (arrayNoDuplicates!0 (_keys!6135 thiss!1504) #b00000000000000000000000000000000 Nil!3177))))

(declare-fun mapIsEmpty!9651 () Bool)

(declare-fun mapRes!9651 () Bool)

(assert (=> mapIsEmpty!9651 mapRes!9651))

(declare-fun b!217168 () Bool)

(declare-fun res!106293 () Bool)

(assert (=> b!217168 (=> (not res!106293) (not e!141282))))

(assert (=> b!217168 (= res!106293 (and (= (size!5332 (_values!4069 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9837 thiss!1504))) (= (size!5333 (_keys!6135 thiss!1504)) (size!5332 (_values!4069 thiss!1504))) (bvsge (mask!9837 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3823 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3823 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!141281 () Bool)

(declare-fun e!141278 () Bool)

(declare-fun array_inv!3311 (array!10559) Bool)

(declare-fun array_inv!3312 (array!10557) Bool)

(assert (=> b!217169 (= e!141281 (and tp!20525 tp_is_empty!5659 (array_inv!3311 (_keys!6135 thiss!1504)) (array_inv!3312 (_values!4069 thiss!1504)) e!141278))))

(declare-fun mapNonEmpty!9651 () Bool)

(declare-fun tp!20526 () Bool)

(declare-fun e!141280 () Bool)

(assert (=> mapNonEmpty!9651 (= mapRes!9651 (and tp!20526 e!141280))))

(declare-fun mapValue!9651 () ValueCell!2486)

(declare-fun mapKey!9651 () (_ BitVec 32))

(declare-fun mapRest!9651 () (Array (_ BitVec 32) ValueCell!2486))

(assert (=> mapNonEmpty!9651 (= (arr!5000 (_values!4069 thiss!1504)) (store mapRest!9651 mapKey!9651 mapValue!9651))))

(declare-fun b!217170 () Bool)

(declare-fun res!106297 () Bool)

(assert (=> b!217170 (=> (not res!106297) (not e!141282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10559 (_ BitVec 32)) Bool)

(assert (=> b!217170 (= res!106297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6135 thiss!1504) (mask!9837 thiss!1504)))))

(declare-fun res!106295 () Bool)

(assert (=> start!21648 (=> (not res!106295) (not e!141279))))

(declare-fun valid!1167 (LongMapFixedSize!2872) Bool)

(assert (=> start!21648 (= res!106295 (valid!1167 thiss!1504))))

(assert (=> start!21648 e!141279))

(assert (=> start!21648 e!141281))

(assert (=> start!21648 true))

(declare-fun b!217171 () Bool)

(assert (=> b!217171 (= e!141280 tp_is_empty!5659)))

(declare-fun b!217172 () Bool)

(assert (=> b!217172 (= e!141278 (and e!141283 mapRes!9651))))

(declare-fun condMapEmpty!9651 () Bool)

(declare-fun mapDefault!9651 () ValueCell!2486)

