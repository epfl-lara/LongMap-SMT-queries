; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22484 () Bool)

(assert start!22484)

(declare-fun b!235110 () Bool)

(declare-fun b_free!6323 () Bool)

(declare-fun b_next!6323 () Bool)

(assert (=> b!235110 (= b_free!6323 (not b_next!6323))))

(declare-fun tp!22133 () Bool)

(declare-fun b_and!13249 () Bool)

(assert (=> b!235110 (= tp!22133 b_and!13249)))

(declare-fun b!235106 () Bool)

(declare-fun res!115297 () Bool)

(declare-fun e!152699 () Bool)

(assert (=> b!235106 (=> (not res!115297) (not e!152699))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235106 (= res!115297 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!115298 () Bool)

(assert (=> start!22484 (=> (not res!115298) (not e!152699))))

(declare-datatypes ((V!7893 0))(
  ( (V!7894 (val!3137 Int)) )
))
(declare-datatypes ((ValueCell!2749 0))(
  ( (ValueCellFull!2749 (v!5163 V!7893)) (EmptyCell!2749) )
))
(declare-datatypes ((array!11625 0))(
  ( (array!11626 (arr!5526 (Array (_ BitVec 32) ValueCell!2749)) (size!5863 (_ BitVec 32))) )
))
(declare-datatypes ((array!11627 0))(
  ( (array!11628 (arr!5527 (Array (_ BitVec 32) (_ BitVec 64))) (size!5864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3398 0))(
  ( (LongMapFixedSize!3399 (defaultEntry!4368 Int) (mask!10330 (_ BitVec 32)) (extraKeys!4105 (_ BitVec 32)) (zeroValue!4209 V!7893) (minValue!4209 V!7893) (_size!1748 (_ BitVec 32)) (_keys!6440 array!11627) (_values!4351 array!11625) (_vacant!1748 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3398)

(declare-fun valid!1341 (LongMapFixedSize!3398) Bool)

(assert (=> start!22484 (= res!115298 (valid!1341 thiss!1504))))

(assert (=> start!22484 e!152699))

(declare-fun e!152700 () Bool)

(assert (=> start!22484 e!152700))

(assert (=> start!22484 true))

(declare-fun b!235107 () Bool)

(declare-fun e!152696 () Bool)

(assert (=> b!235107 (= e!152699 e!152696)))

(declare-fun res!115295 () Bool)

(assert (=> b!235107 (=> (not res!115295) (not e!152696))))

(declare-datatypes ((SeekEntryResult!985 0))(
  ( (MissingZero!985 (index!6110 (_ BitVec 32))) (Found!985 (index!6111 (_ BitVec 32))) (Intermediate!985 (undefined!1797 Bool) (index!6112 (_ BitVec 32)) (x!23753 (_ BitVec 32))) (Undefined!985) (MissingVacant!985 (index!6113 (_ BitVec 32))) )
))
(declare-fun lt!118930 () SeekEntryResult!985)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235107 (= res!115295 (or (= lt!118930 (MissingZero!985 index!297)) (= lt!118930 (MissingVacant!985 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11627 (_ BitVec 32)) SeekEntryResult!985)

(assert (=> b!235107 (= lt!118930 (seekEntryOrOpen!0 key!932 (_keys!6440 thiss!1504) (mask!10330 thiss!1504)))))

(declare-fun b!235108 () Bool)

(declare-fun e!152701 () Bool)

(declare-fun tp_is_empty!6185 () Bool)

(assert (=> b!235108 (= e!152701 tp_is_empty!6185)))

(declare-fun b!235109 () Bool)

(declare-fun res!115294 () Bool)

(assert (=> b!235109 (=> (not res!115294) (not e!152696))))

(assert (=> b!235109 (= res!115294 (and (= (size!5863 (_values!4351 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10330 thiss!1504))) (= (size!5864 (_keys!6440 thiss!1504)) (size!5863 (_values!4351 thiss!1504))) (bvsge (mask!10330 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4105 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4105 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!152697 () Bool)

(declare-fun array_inv!3643 (array!11627) Bool)

(declare-fun array_inv!3644 (array!11625) Bool)

(assert (=> b!235110 (= e!152700 (and tp!22133 tp_is_empty!6185 (array_inv!3643 (_keys!6440 thiss!1504)) (array_inv!3644 (_values!4351 thiss!1504)) e!152697))))

(declare-fun mapIsEmpty!10469 () Bool)

(declare-fun mapRes!10469 () Bool)

(assert (=> mapIsEmpty!10469 mapRes!10469))

(declare-fun b!235111 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11627 (_ BitVec 32)) Bool)

(assert (=> b!235111 (= e!152696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6440 thiss!1504) (mask!10330 thiss!1504))))))

(declare-fun mapNonEmpty!10469 () Bool)

(declare-fun tp!22132 () Bool)

(declare-fun e!152698 () Bool)

(assert (=> mapNonEmpty!10469 (= mapRes!10469 (and tp!22132 e!152698))))

(declare-fun mapRest!10469 () (Array (_ BitVec 32) ValueCell!2749))

(declare-fun mapValue!10469 () ValueCell!2749)

(declare-fun mapKey!10469 () (_ BitVec 32))

(assert (=> mapNonEmpty!10469 (= (arr!5526 (_values!4351 thiss!1504)) (store mapRest!10469 mapKey!10469 mapValue!10469))))

(declare-fun b!235112 () Bool)

(assert (=> b!235112 (= e!152697 (and e!152701 mapRes!10469))))

(declare-fun condMapEmpty!10469 () Bool)

(declare-fun mapDefault!10469 () ValueCell!2749)

