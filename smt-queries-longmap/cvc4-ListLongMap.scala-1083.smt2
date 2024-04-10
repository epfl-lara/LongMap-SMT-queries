; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22184 () Bool)

(assert start!22184)

(declare-fun b!232204 () Bool)

(declare-fun b_free!6251 () Bool)

(declare-fun b_next!6251 () Bool)

(assert (=> b!232204 (= b_free!6251 (not b_next!6251))))

(declare-fun tp!21894 () Bool)

(declare-fun b_and!13149 () Bool)

(assert (=> b!232204 (= tp!21894 b_and!13149)))

(declare-fun b!232200 () Bool)

(declare-fun e!150782 () Bool)

(declare-fun tp_is_empty!6113 () Bool)

(assert (=> b!232200 (= e!150782 tp_is_empty!6113)))

(declare-fun b!232201 () Bool)

(declare-fun e!150784 () Bool)

(assert (=> b!232201 (= e!150784 tp_is_empty!6113)))

(declare-fun b!232202 () Bool)

(declare-datatypes ((Unit!7167 0))(
  ( (Unit!7168) )
))
(declare-fun e!150778 () Unit!7167)

(declare-fun lt!117202 () Unit!7167)

(assert (=> b!232202 (= e!150778 lt!117202)))

(declare-datatypes ((V!7797 0))(
  ( (V!7798 (val!3101 Int)) )
))
(declare-datatypes ((ValueCell!2713 0))(
  ( (ValueCellFull!2713 (v!5121 V!7797)) (EmptyCell!2713) )
))
(declare-datatypes ((array!11469 0))(
  ( (array!11470 (arr!5454 (Array (_ BitVec 32) ValueCell!2713)) (size!5787 (_ BitVec 32))) )
))
(declare-datatypes ((array!11471 0))(
  ( (array!11472 (arr!5455 (Array (_ BitVec 32) (_ BitVec 64))) (size!5788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3326 0))(
  ( (LongMapFixedSize!3327 (defaultEntry!4322 Int) (mask!10232 (_ BitVec 32)) (extraKeys!4059 (_ BitVec 32)) (zeroValue!4163 V!7797) (minValue!4163 V!7797) (_size!1712 (_ BitVec 32)) (_keys!6376 array!11471) (_values!4305 array!11469) (_vacant!1712 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3326)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!325 (array!11471 array!11469 (_ BitVec 32) (_ BitVec 32) V!7797 V!7797 (_ BitVec 64) Int) Unit!7167)

(assert (=> b!232202 (= lt!117202 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!325 (_keys!6376 thiss!1504) (_values!4305 thiss!1504) (mask!10232 thiss!1504) (extraKeys!4059 thiss!1504) (zeroValue!4163 thiss!1504) (minValue!4163 thiss!1504) key!932 (defaultEntry!4322 thiss!1504)))))

(declare-fun c!38601 () Bool)

(declare-datatypes ((SeekEntryResult!961 0))(
  ( (MissingZero!961 (index!6014 (_ BitVec 32))) (Found!961 (index!6015 (_ BitVec 32))) (Intermediate!961 (undefined!1773 Bool) (index!6016 (_ BitVec 32)) (x!23541 (_ BitVec 32))) (Undefined!961) (MissingVacant!961 (index!6017 (_ BitVec 32))) )
))
(declare-fun lt!117203 () SeekEntryResult!961)

(assert (=> b!232202 (= c!38601 (is-MissingZero!961 lt!117203))))

(declare-fun e!150777 () Bool)

(assert (=> b!232202 e!150777))

(declare-fun b!232203 () Bool)

(declare-fun e!150775 () Bool)

(declare-fun e!150781 () Bool)

(assert (=> b!232203 (= e!150775 e!150781)))

(declare-fun res!114047 () Bool)

(assert (=> b!232203 (=> (not res!114047) (not e!150781))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232203 (= res!114047 (inRange!0 index!297 (mask!10232 thiss!1504)))))

(declare-fun lt!117212 () Unit!7167)

(assert (=> b!232203 (= lt!117212 e!150778)))

(declare-fun c!38603 () Bool)

(declare-datatypes ((tuple2!4578 0))(
  ( (tuple2!4579 (_1!2300 (_ BitVec 64)) (_2!2300 V!7797)) )
))
(declare-datatypes ((List!3496 0))(
  ( (Nil!3493) (Cons!3492 (h!4140 tuple2!4578) (t!8455 List!3496)) )
))
(declare-datatypes ((ListLongMap!3491 0))(
  ( (ListLongMap!3492 (toList!1761 List!3496)) )
))
(declare-fun lt!117205 () ListLongMap!3491)

(declare-fun contains!1629 (ListLongMap!3491 (_ BitVec 64)) Bool)

(assert (=> b!232203 (= c!38603 (contains!1629 lt!117205 key!932))))

(declare-fun getCurrentListMap!1289 (array!11471 array!11469 (_ BitVec 32) (_ BitVec 32) V!7797 V!7797 (_ BitVec 32) Int) ListLongMap!3491)

(assert (=> b!232203 (= lt!117205 (getCurrentListMap!1289 (_keys!6376 thiss!1504) (_values!4305 thiss!1504) (mask!10232 thiss!1504) (extraKeys!4059 thiss!1504) (zeroValue!4163 thiss!1504) (minValue!4163 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4322 thiss!1504)))))

(declare-fun e!150787 () Bool)

(declare-fun e!150780 () Bool)

(declare-fun array_inv!3595 (array!11471) Bool)

(declare-fun array_inv!3596 (array!11469) Bool)

(assert (=> b!232204 (= e!150787 (and tp!21894 tp_is_empty!6113 (array_inv!3595 (_keys!6376 thiss!1504)) (array_inv!3596 (_values!4305 thiss!1504)) e!150780))))

(declare-fun b!232205 () Bool)

(declare-fun c!38604 () Bool)

(assert (=> b!232205 (= c!38604 (is-MissingVacant!961 lt!117203))))

(declare-fun e!150786 () Bool)

(assert (=> b!232205 (= e!150777 e!150786)))

(declare-fun b!232206 () Bool)

(declare-fun e!150788 () Unit!7167)

(declare-fun Unit!7169 () Unit!7167)

(assert (=> b!232206 (= e!150788 Unit!7169)))

(declare-fun b!232207 () Bool)

(declare-fun mapRes!10339 () Bool)

(assert (=> b!232207 (= e!150780 (and e!150782 mapRes!10339))))

(declare-fun condMapEmpty!10339 () Bool)

(declare-fun mapDefault!10339 () ValueCell!2713)

