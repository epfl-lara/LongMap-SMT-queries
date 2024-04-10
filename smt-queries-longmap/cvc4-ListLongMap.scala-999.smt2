; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21570 () Bool)

(assert start!21570)

(declare-fun b!216215 () Bool)

(declare-fun b_free!5747 () Bool)

(declare-fun b_next!5747 () Bool)

(assert (=> b!216215 (= b_free!5747 (not b_next!5747))))

(declare-fun tp!20369 () Bool)

(declare-fun b_and!12637 () Bool)

(assert (=> b!216215 (= tp!20369 b_and!12637)))

(declare-fun b!216214 () Bool)

(declare-fun res!105726 () Bool)

(declare-fun e!140677 () Bool)

(assert (=> b!216214 (=> (not res!105726) (not e!140677))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216214 (= res!105726 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9570 () Bool)

(declare-fun mapRes!9570 () Bool)

(assert (=> mapIsEmpty!9570 mapRes!9570))

(declare-fun e!140680 () Bool)

(declare-fun tp_is_empty!5609 () Bool)

(declare-datatypes ((V!7125 0))(
  ( (V!7126 (val!2849 Int)) )
))
(declare-datatypes ((ValueCell!2461 0))(
  ( (ValueCellFull!2461 (v!4867 V!7125)) (EmptyCell!2461) )
))
(declare-datatypes ((array!10453 0))(
  ( (array!10454 (arr!4950 (Array (_ BitVec 32) ValueCell!2461)) (size!5282 (_ BitVec 32))) )
))
(declare-datatypes ((array!10455 0))(
  ( (array!10456 (arr!4951 (Array (_ BitVec 32) (_ BitVec 64))) (size!5283 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2822 0))(
  ( (LongMapFixedSize!2823 (defaultEntry!4061 Int) (mask!9788 (_ BitVec 32)) (extraKeys!3798 (_ BitVec 32)) (zeroValue!3902 V!7125) (minValue!3902 V!7125) (_size!1460 (_ BitVec 32)) (_keys!6106 array!10455) (_values!4044 array!10453) (_vacant!1460 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2822)

(declare-fun e!140679 () Bool)

(declare-fun array_inv!3275 (array!10455) Bool)

(declare-fun array_inv!3276 (array!10453) Bool)

(assert (=> b!216215 (= e!140680 (and tp!20369 tp_is_empty!5609 (array_inv!3275 (_keys!6106 thiss!1504)) (array_inv!3276 (_values!4044 thiss!1504)) e!140679))))

(declare-fun b!216216 () Bool)

(declare-fun res!105724 () Bool)

(declare-fun e!140675 () Bool)

(assert (=> b!216216 (=> (not res!105724) (not e!140675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216216 (= res!105724 (validMask!0 (mask!9788 thiss!1504)))))

(declare-fun b!216217 () Bool)

(declare-fun e!140678 () Bool)

(assert (=> b!216217 (= e!140678 tp_is_empty!5609)))

(declare-fun b!216218 () Bool)

(declare-fun res!105722 () Bool)

(assert (=> b!216218 (=> (not res!105722) (not e!140675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10455 (_ BitVec 32)) Bool)

(assert (=> b!216218 (= res!105722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6106 thiss!1504) (mask!9788 thiss!1504)))))

(declare-fun b!216219 () Bool)

(declare-datatypes ((List!3143 0))(
  ( (Nil!3140) (Cons!3139 (h!3786 (_ BitVec 64)) (t!8098 List!3143)) )
))
(declare-fun arrayNoDuplicates!0 (array!10455 (_ BitVec 32) List!3143) Bool)

(assert (=> b!216219 (= e!140675 (not (arrayNoDuplicates!0 (_keys!6106 thiss!1504) #b00000000000000000000000000000000 Nil!3140)))))

(declare-fun mapNonEmpty!9570 () Bool)

(declare-fun tp!20370 () Bool)

(assert (=> mapNonEmpty!9570 (= mapRes!9570 (and tp!20370 e!140678))))

(declare-fun mapKey!9570 () (_ BitVec 32))

(declare-fun mapValue!9570 () ValueCell!2461)

(declare-fun mapRest!9570 () (Array (_ BitVec 32) ValueCell!2461))

(assert (=> mapNonEmpty!9570 (= (arr!4950 (_values!4044 thiss!1504)) (store mapRest!9570 mapKey!9570 mapValue!9570))))

(declare-fun b!216220 () Bool)

(declare-fun e!140674 () Bool)

(assert (=> b!216220 (= e!140679 (and e!140674 mapRes!9570))))

(declare-fun condMapEmpty!9570 () Bool)

(declare-fun mapDefault!9570 () ValueCell!2461)

