; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19400 () Bool)

(assert start!19400)

(declare-fun b!190720 () Bool)

(declare-fun b_free!4673 () Bool)

(declare-fun b_next!4673 () Bool)

(assert (=> b!190720 (= b_free!4673 (not b_next!4673))))

(declare-fun tp!16862 () Bool)

(declare-fun b_and!11331 () Bool)

(assert (=> b!190720 (= tp!16862 b_and!11331)))

(declare-fun b!190711 () Bool)

(declare-fun e!125525 () Bool)

(declare-datatypes ((V!5573 0))(
  ( (V!5574 (val!2267 Int)) )
))
(declare-datatypes ((ValueCell!1879 0))(
  ( (ValueCellFull!1879 (v!4199 V!5573)) (EmptyCell!1879) )
))
(declare-datatypes ((array!8125 0))(
  ( (array!8126 (arr!3829 (Array (_ BitVec 32) (_ BitVec 64))) (size!4150 (_ BitVec 32))) )
))
(declare-datatypes ((array!8127 0))(
  ( (array!8128 (arr!3830 (Array (_ BitVec 32) ValueCell!1879)) (size!4151 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2666 0))(
  ( (LongMapFixedSize!2667 (defaultEntry!3893 Int) (mask!9100 (_ BitVec 32)) (extraKeys!3630 (_ BitVec 32)) (zeroValue!3734 V!5573) (minValue!3734 V!5573) (_size!1382 (_ BitVec 32)) (_keys!5866 array!8125) (_values!3876 array!8127) (_vacant!1382 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2666)

(assert (=> b!190711 (= e!125525 (or (not (= (size!4151 (_values!3876 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9100 thiss!1248)))) (= (size!4150 (_keys!5866 thiss!1248)) (size!4151 (_values!3876 thiss!1248)))))))

(declare-fun b!190712 () Bool)

(declare-fun e!125516 () Bool)

(declare-fun tp_is_empty!4445 () Bool)

(assert (=> b!190712 (= e!125516 tp_is_empty!4445)))

(declare-fun b!190713 () Bool)

(declare-fun res!90152 () Bool)

(declare-fun e!125519 () Bool)

(assert (=> b!190713 (=> (not res!90152) (not e!125519))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!190713 (= res!90152 (not (= key!828 (bvneg key!828))))))

(declare-fun b!190714 () Bool)

(declare-fun e!125517 () Bool)

(assert (=> b!190714 (= e!125517 (not e!125525))))

(declare-fun res!90150 () Bool)

(assert (=> b!190714 (=> res!90150 e!125525)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190714 (= res!90150 (not (validMask!0 (mask!9100 thiss!1248))))))

(declare-datatypes ((tuple2!3524 0))(
  ( (tuple2!3525 (_1!1773 (_ BitVec 64)) (_2!1773 V!5573)) )
))
(declare-datatypes ((List!2419 0))(
  ( (Nil!2416) (Cons!2415 (h!3053 tuple2!3524) (t!7329 List!2419)) )
))
(declare-datatypes ((ListLongMap!2441 0))(
  ( (ListLongMap!2442 (toList!1236 List!2419)) )
))
(declare-fun lt!94573 () ListLongMap!2441)

(declare-fun v!309 () V!5573)

(declare-datatypes ((SeekEntryResult!675 0))(
  ( (MissingZero!675 (index!4870 (_ BitVec 32))) (Found!675 (index!4871 (_ BitVec 32))) (Intermediate!675 (undefined!1487 Bool) (index!4872 (_ BitVec 32)) (x!20503 (_ BitVec 32))) (Undefined!675) (MissingVacant!675 (index!4873 (_ BitVec 32))) )
))
(declare-fun lt!94568 () SeekEntryResult!675)

(declare-fun +!304 (ListLongMap!2441 tuple2!3524) ListLongMap!2441)

(declare-fun getCurrentListMap!884 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5573 V!5573 (_ BitVec 32) Int) ListLongMap!2441)

(assert (=> b!190714 (= (+!304 lt!94573 (tuple2!3525 key!828 v!309)) (getCurrentListMap!884 (_keys!5866 thiss!1248) (array!8128 (store (arr!3830 (_values!3876 thiss!1248)) (index!4871 lt!94568) (ValueCellFull!1879 v!309)) (size!4151 (_values!3876 thiss!1248))) (mask!9100 thiss!1248) (extraKeys!3630 thiss!1248) (zeroValue!3734 thiss!1248) (minValue!3734 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3893 thiss!1248)))))

(declare-datatypes ((Unit!5767 0))(
  ( (Unit!5768) )
))
(declare-fun lt!94569 () Unit!5767)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!105 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5573 V!5573 (_ BitVec 32) (_ BitVec 64) V!5573 Int) Unit!5767)

(assert (=> b!190714 (= lt!94569 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!105 (_keys!5866 thiss!1248) (_values!3876 thiss!1248) (mask!9100 thiss!1248) (extraKeys!3630 thiss!1248) (zeroValue!3734 thiss!1248) (minValue!3734 thiss!1248) (index!4871 lt!94568) key!828 v!309 (defaultEntry!3893 thiss!1248)))))

(declare-fun lt!94572 () Unit!5767)

(declare-fun e!125522 () Unit!5767)

(assert (=> b!190714 (= lt!94572 e!125522)))

(declare-fun c!34295 () Bool)

(declare-fun contains!1347 (ListLongMap!2441 (_ BitVec 64)) Bool)

(assert (=> b!190714 (= c!34295 (contains!1347 lt!94573 key!828))))

(assert (=> b!190714 (= lt!94573 (getCurrentListMap!884 (_keys!5866 thiss!1248) (_values!3876 thiss!1248) (mask!9100 thiss!1248) (extraKeys!3630 thiss!1248) (zeroValue!3734 thiss!1248) (minValue!3734 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3893 thiss!1248)))))

(declare-fun b!190715 () Bool)

(declare-fun Unit!5769 () Unit!5767)

(assert (=> b!190715 (= e!125522 Unit!5769)))

(declare-fun lt!94571 () Unit!5767)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!178 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5573 V!5573 (_ BitVec 64) Int) Unit!5767)

(assert (=> b!190715 (= lt!94571 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!178 (_keys!5866 thiss!1248) (_values!3876 thiss!1248) (mask!9100 thiss!1248) (extraKeys!3630 thiss!1248) (zeroValue!3734 thiss!1248) (minValue!3734 thiss!1248) key!828 (defaultEntry!3893 thiss!1248)))))

(assert (=> b!190715 false))

(declare-fun e!125521 () Bool)

(declare-fun b!190716 () Bool)

(assert (=> b!190716 (= e!125521 (= (select (arr!3829 (_keys!5866 thiss!1248)) (index!4871 lt!94568)) key!828))))

(declare-fun b!190717 () Bool)

(declare-fun e!125523 () Bool)

(assert (=> b!190717 (= e!125523 tp_is_empty!4445)))

(declare-fun mapNonEmpty!7673 () Bool)

(declare-fun mapRes!7673 () Bool)

(declare-fun tp!16861 () Bool)

(assert (=> mapNonEmpty!7673 (= mapRes!7673 (and tp!16861 e!125516))))

(declare-fun mapKey!7673 () (_ BitVec 32))

(declare-fun mapRest!7673 () (Array (_ BitVec 32) ValueCell!1879))

(declare-fun mapValue!7673 () ValueCell!1879)

(assert (=> mapNonEmpty!7673 (= (arr!3830 (_values!3876 thiss!1248)) (store mapRest!7673 mapKey!7673 mapValue!7673))))

(declare-fun b!190718 () Bool)

(declare-fun e!125518 () Bool)

(assert (=> b!190718 (= e!125518 (and e!125523 mapRes!7673))))

(declare-fun condMapEmpty!7673 () Bool)

(declare-fun mapDefault!7673 () ValueCell!1879)

