; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15740 () Bool)

(assert start!15740)

(declare-fun b!157081 () Bool)

(declare-fun b_free!3407 () Bool)

(declare-fun b_next!3407 () Bool)

(assert (=> b!157081 (= b_free!3407 (not b_next!3407))))

(declare-fun tp!12745 () Bool)

(declare-fun b_and!9821 () Bool)

(assert (=> b!157081 (= tp!12745 b_and!9821)))

(declare-fun b!157077 () Bool)

(declare-fun e!102757 () Bool)

(assert (=> b!157077 (= e!102757 (not true))))

(declare-fun lt!81634 () Bool)

(declare-datatypes ((V!3925 0))(
  ( (V!3926 (val!1649 Int)) )
))
(declare-datatypes ((ValueCell!1261 0))(
  ( (ValueCellFull!1261 (v!3514 V!3925)) (EmptyCell!1261) )
))
(declare-datatypes ((array!5471 0))(
  ( (array!5472 (arr!2593 (Array (_ BitVec 32) (_ BitVec 64))) (size!2871 (_ BitVec 32))) )
))
(declare-datatypes ((array!5473 0))(
  ( (array!5474 (arr!2594 (Array (_ BitVec 32) ValueCell!1261)) (size!2872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1430 0))(
  ( (LongMapFixedSize!1431 (defaultEntry!3157 Int) (mask!7624 (_ BitVec 32)) (extraKeys!2898 (_ BitVec 32)) (zeroValue!3000 V!3925) (minValue!3000 V!3925) (_size!764 (_ BitVec 32)) (_keys!4932 array!5471) (_values!3140 array!5473) (_vacant!764 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1430)

(declare-fun v!309 () V!3925)

(declare-fun valid!681 (LongMapFixedSize!1430) Bool)

(assert (=> b!157077 (= lt!81634 (valid!681 (LongMapFixedSize!1431 (defaultEntry!3157 thiss!1248) (mask!7624 thiss!1248) (bvor (extraKeys!2898 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3000 thiss!1248) v!309 (_size!764 thiss!1248) (_keys!4932 thiss!1248) (_values!3140 thiss!1248) (_vacant!764 thiss!1248))))))

(declare-datatypes ((tuple2!2858 0))(
  ( (tuple2!2859 (_1!1440 (_ BitVec 64)) (_2!1440 V!3925)) )
))
(declare-datatypes ((List!1871 0))(
  ( (Nil!1868) (Cons!1867 (h!2476 tuple2!2858) (t!6673 List!1871)) )
))
(declare-datatypes ((ListLongMap!1845 0))(
  ( (ListLongMap!1846 (toList!938 List!1871)) )
))
(declare-fun +!206 (ListLongMap!1845 tuple2!2858) ListLongMap!1845)

(declare-fun getCurrentListMap!602 (array!5471 array!5473 (_ BitVec 32) (_ BitVec 32) V!3925 V!3925 (_ BitVec 32) Int) ListLongMap!1845)

(assert (=> b!157077 (= (+!206 (getCurrentListMap!602 (_keys!4932 thiss!1248) (_values!3140 thiss!1248) (mask!7624 thiss!1248) (extraKeys!2898 thiss!1248) (zeroValue!3000 thiss!1248) (minValue!3000 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3157 thiss!1248)) (tuple2!2859 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!602 (_keys!4932 thiss!1248) (_values!3140 thiss!1248) (mask!7624 thiss!1248) (bvor (extraKeys!2898 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3000 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3157 thiss!1248)))))

(declare-datatypes ((Unit!4956 0))(
  ( (Unit!4957) )
))
(declare-fun lt!81633 () Unit!4956)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (array!5471 array!5473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3925 V!3925 V!3925 Int) Unit!4956)

(assert (=> b!157077 (= lt!81633 (lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (_keys!4932 thiss!1248) (_values!3140 thiss!1248) (mask!7624 thiss!1248) (extraKeys!2898 thiss!1248) (bvor (extraKeys!2898 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3000 thiss!1248) (minValue!3000 thiss!1248) v!309 (defaultEntry!3157 thiss!1248)))))

(declare-fun mapNonEmpty!5456 () Bool)

(declare-fun mapRes!5456 () Bool)

(declare-fun tp!12746 () Bool)

(declare-fun e!102755 () Bool)

(assert (=> mapNonEmpty!5456 (= mapRes!5456 (and tp!12746 e!102755))))

(declare-fun mapRest!5456 () (Array (_ BitVec 32) ValueCell!1261))

(declare-fun mapKey!5456 () (_ BitVec 32))

(declare-fun mapValue!5456 () ValueCell!1261)

(assert (=> mapNonEmpty!5456 (= (arr!2594 (_values!3140 thiss!1248)) (store mapRest!5456 mapKey!5456 mapValue!5456))))

(declare-fun b!157078 () Bool)

(declare-fun e!102754 () Bool)

(declare-fun tp_is_empty!3209 () Bool)

(assert (=> b!157078 (= e!102754 tp_is_empty!3209)))

(declare-fun b!157079 () Bool)

(declare-fun res!74259 () Bool)

(assert (=> b!157079 (=> (not res!74259) (not e!102757))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157079 (= res!74259 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!102759 () Bool)

(declare-fun e!102758 () Bool)

(declare-fun array_inv!1641 (array!5471) Bool)

(declare-fun array_inv!1642 (array!5473) Bool)

(assert (=> b!157081 (= e!102758 (and tp!12745 tp_is_empty!3209 (array_inv!1641 (_keys!4932 thiss!1248)) (array_inv!1642 (_values!3140 thiss!1248)) e!102759))))

(declare-fun b!157082 () Bool)

(assert (=> b!157082 (= e!102755 tp_is_empty!3209)))

(declare-fun mapIsEmpty!5456 () Bool)

(assert (=> mapIsEmpty!5456 mapRes!5456))

(declare-fun b!157080 () Bool)

(assert (=> b!157080 (= e!102759 (and e!102754 mapRes!5456))))

(declare-fun condMapEmpty!5456 () Bool)

(declare-fun mapDefault!5456 () ValueCell!1261)

