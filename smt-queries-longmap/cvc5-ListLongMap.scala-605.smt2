; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15788 () Bool)

(assert start!15788)

(declare-fun b!157459 () Bool)

(declare-fun b_free!3439 () Bool)

(declare-fun b_next!3439 () Bool)

(assert (=> b!157459 (= b_free!3439 (not b_next!3439))))

(declare-fun tp!12846 () Bool)

(declare-fun b_and!9853 () Bool)

(assert (=> b!157459 (= tp!12846 b_and!9853)))

(declare-fun b!157455 () Bool)

(declare-fun res!74412 () Bool)

(declare-fun e!103101 () Bool)

(assert (=> b!157455 (=> (not res!74412) (not e!103101))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157455 (= res!74412 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157456 () Bool)

(declare-fun res!74411 () Bool)

(assert (=> b!157456 (=> (not res!74411) (not e!103101))))

(declare-datatypes ((V!3969 0))(
  ( (V!3970 (val!1665 Int)) )
))
(declare-datatypes ((ValueCell!1277 0))(
  ( (ValueCellFull!1277 (v!3530 V!3969)) (EmptyCell!1277) )
))
(declare-datatypes ((array!5537 0))(
  ( (array!5538 (arr!2625 (Array (_ BitVec 32) (_ BitVec 64))) (size!2904 (_ BitVec 32))) )
))
(declare-datatypes ((array!5539 0))(
  ( (array!5540 (arr!2626 (Array (_ BitVec 32) ValueCell!1277)) (size!2905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1462 0))(
  ( (LongMapFixedSize!1463 (defaultEntry!3173 Int) (mask!7654 (_ BitVec 32)) (extraKeys!2914 (_ BitVec 32)) (zeroValue!3016 V!3969) (minValue!3016 V!3969) (_size!780 (_ BitVec 32)) (_keys!4949 array!5537) (_values!3156 array!5539) (_vacant!780 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1462)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157456 (= res!74411 (validMask!0 (mask!7654 thiss!1248)))))

(declare-fun b!157457 () Bool)

(declare-fun e!103103 () Bool)

(declare-fun tp_is_empty!3241 () Bool)

(assert (=> b!157457 (= e!103103 tp_is_empty!3241)))

(declare-fun b!157458 () Bool)

(assert (=> b!157458 (= e!103101 (bvslt (mask!7654 thiss!1248) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!5508 () Bool)

(declare-fun mapRes!5508 () Bool)

(assert (=> mapIsEmpty!5508 mapRes!5508))

(declare-fun e!103102 () Bool)

(declare-fun e!103105 () Bool)

(declare-fun array_inv!1665 (array!5537) Bool)

(declare-fun array_inv!1666 (array!5539) Bool)

(assert (=> b!157459 (= e!103105 (and tp!12846 tp_is_empty!3241 (array_inv!1665 (_keys!4949 thiss!1248)) (array_inv!1666 (_values!3156 thiss!1248)) e!103102))))

(declare-fun res!74413 () Bool)

(assert (=> start!15788 (=> (not res!74413) (not e!103101))))

(declare-fun valid!694 (LongMapFixedSize!1462) Bool)

(assert (=> start!15788 (= res!74413 (valid!694 thiss!1248))))

(assert (=> start!15788 e!103101))

(assert (=> start!15788 e!103105))

(assert (=> start!15788 true))

(declare-fun mapNonEmpty!5508 () Bool)

(declare-fun tp!12845 () Bool)

(declare-fun e!103104 () Bool)

(assert (=> mapNonEmpty!5508 (= mapRes!5508 (and tp!12845 e!103104))))

(declare-fun mapValue!5508 () ValueCell!1277)

(declare-fun mapRest!5508 () (Array (_ BitVec 32) ValueCell!1277))

(declare-fun mapKey!5508 () (_ BitVec 32))

(assert (=> mapNonEmpty!5508 (= (arr!2626 (_values!3156 thiss!1248)) (store mapRest!5508 mapKey!5508 mapValue!5508))))

(declare-fun b!157460 () Bool)

(assert (=> b!157460 (= e!103104 tp_is_empty!3241)))

(declare-fun b!157461 () Bool)

(assert (=> b!157461 (= e!103102 (and e!103103 mapRes!5508))))

(declare-fun condMapEmpty!5508 () Bool)

(declare-fun mapDefault!5508 () ValueCell!1277)

