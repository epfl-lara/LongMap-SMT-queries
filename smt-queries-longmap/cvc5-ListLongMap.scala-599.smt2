; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15736 () Bool)

(assert start!15736)

(declare-fun b!157044 () Bool)

(declare-fun b_free!3403 () Bool)

(declare-fun b_next!3403 () Bool)

(assert (=> b!157044 (= b_free!3403 (not b_next!3403))))

(declare-fun tp!12734 () Bool)

(declare-fun b_and!9817 () Bool)

(assert (=> b!157044 (= tp!12734 b_and!9817)))

(declare-fun b!157041 () Bool)

(declare-fun e!102721 () Bool)

(declare-fun tp_is_empty!3205 () Bool)

(assert (=> b!157041 (= e!102721 tp_is_empty!3205)))

(declare-fun b!157042 () Bool)

(declare-fun e!102720 () Bool)

(assert (=> b!157042 (= e!102720 tp_is_empty!3205)))

(declare-fun mapIsEmpty!5450 () Bool)

(declare-fun mapRes!5450 () Bool)

(assert (=> mapIsEmpty!5450 mapRes!5450))

(declare-fun mapNonEmpty!5450 () Bool)

(declare-fun tp!12733 () Bool)

(assert (=> mapNonEmpty!5450 (= mapRes!5450 (and tp!12733 e!102721))))

(declare-fun mapKey!5450 () (_ BitVec 32))

(declare-datatypes ((V!3921 0))(
  ( (V!3922 (val!1647 Int)) )
))
(declare-datatypes ((ValueCell!1259 0))(
  ( (ValueCellFull!1259 (v!3512 V!3921)) (EmptyCell!1259) )
))
(declare-fun mapRest!5450 () (Array (_ BitVec 32) ValueCell!1259))

(declare-fun mapValue!5450 () ValueCell!1259)

(declare-datatypes ((array!5463 0))(
  ( (array!5464 (arr!2589 (Array (_ BitVec 32) (_ BitVec 64))) (size!2867 (_ BitVec 32))) )
))
(declare-datatypes ((array!5465 0))(
  ( (array!5466 (arr!2590 (Array (_ BitVec 32) ValueCell!1259)) (size!2868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1426 0))(
  ( (LongMapFixedSize!1427 (defaultEntry!3155 Int) (mask!7622 (_ BitVec 32)) (extraKeys!2896 (_ BitVec 32)) (zeroValue!2998 V!3921) (minValue!2998 V!3921) (_size!762 (_ BitVec 32)) (_keys!4930 array!5463) (_values!3138 array!5465) (_vacant!762 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1426)

(assert (=> mapNonEmpty!5450 (= (arr!2590 (_values!3138 thiss!1248)) (store mapRest!5450 mapKey!5450 mapValue!5450))))

(declare-fun e!102723 () Bool)

(declare-fun e!102719 () Bool)

(declare-fun array_inv!1637 (array!5463) Bool)

(declare-fun array_inv!1638 (array!5465) Bool)

(assert (=> b!157044 (= e!102719 (and tp!12734 tp_is_empty!3205 (array_inv!1637 (_keys!4930 thiss!1248)) (array_inv!1638 (_values!3138 thiss!1248)) e!102723))))

(declare-fun b!157045 () Bool)

(declare-fun e!102722 () Bool)

(assert (=> b!157045 (= e!102722 (not true))))

(declare-fun lt!81621 () Bool)

(declare-fun v!309 () V!3921)

(declare-fun valid!679 (LongMapFixedSize!1426) Bool)

(assert (=> b!157045 (= lt!81621 (valid!679 (LongMapFixedSize!1427 (defaultEntry!3155 thiss!1248) (mask!7622 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 (_size!762 thiss!1248) (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (_vacant!762 thiss!1248))))))

(declare-datatypes ((tuple2!2854 0))(
  ( (tuple2!2855 (_1!1438 (_ BitVec 64)) (_2!1438 V!3921)) )
))
(declare-datatypes ((List!1869 0))(
  ( (Nil!1866) (Cons!1865 (h!2474 tuple2!2854) (t!6671 List!1869)) )
))
(declare-datatypes ((ListLongMap!1841 0))(
  ( (ListLongMap!1842 (toList!936 List!1869)) )
))
(declare-fun +!204 (ListLongMap!1841 tuple2!2854) ListLongMap!1841)

(declare-fun getCurrentListMap!600 (array!5463 array!5465 (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 (_ BitVec 32) Int) ListLongMap!1841)

(assert (=> b!157045 (= (+!204 (getCurrentListMap!600 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (extraKeys!2896 thiss!1248) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)) (tuple2!2855 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!600 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)))))

(declare-datatypes ((Unit!4952 0))(
  ( (Unit!4953) )
))
(declare-fun lt!81622 () Unit!4952)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (array!5463 array!5465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 V!3921 Int) Unit!4952)

(assert (=> b!157045 (= lt!81622 (lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (extraKeys!2896 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) v!309 (defaultEntry!3155 thiss!1248)))))

(declare-fun b!157046 () Bool)

(declare-fun res!74248 () Bool)

(assert (=> b!157046 (=> (not res!74248) (not e!102722))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157046 (= res!74248 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157043 () Bool)

(assert (=> b!157043 (= e!102723 (and e!102720 mapRes!5450))))

(declare-fun condMapEmpty!5450 () Bool)

(declare-fun mapDefault!5450 () ValueCell!1259)

