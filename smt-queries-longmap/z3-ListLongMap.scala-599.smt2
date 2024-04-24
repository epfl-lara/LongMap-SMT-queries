; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15740 () Bool)

(assert start!15740)

(declare-fun b!157092 () Bool)

(declare-fun b_free!3403 () Bool)

(declare-fun b_next!3403 () Bool)

(assert (=> b!157092 (= b_free!3403 (not b_next!3403))))

(declare-fun tp!12734 () Bool)

(declare-fun b_and!9831 () Bool)

(assert (=> b!157092 (= tp!12734 b_and!9831)))

(declare-fun mapIsEmpty!5450 () Bool)

(declare-fun mapRes!5450 () Bool)

(assert (=> mapIsEmpty!5450 mapRes!5450))

(declare-fun mapNonEmpty!5450 () Bool)

(declare-fun tp!12733 () Bool)

(declare-fun e!102744 () Bool)

(assert (=> mapNonEmpty!5450 (= mapRes!5450 (and tp!12733 e!102744))))

(declare-datatypes ((V!3921 0))(
  ( (V!3922 (val!1647 Int)) )
))
(declare-datatypes ((ValueCell!1259 0))(
  ( (ValueCellFull!1259 (v!3513 V!3921)) (EmptyCell!1259) )
))
(declare-fun mapValue!5450 () ValueCell!1259)

(declare-fun mapRest!5450 () (Array (_ BitVec 32) ValueCell!1259))

(declare-datatypes ((array!5449 0))(
  ( (array!5450 (arr!2582 (Array (_ BitVec 32) (_ BitVec 64))) (size!2860 (_ BitVec 32))) )
))
(declare-datatypes ((array!5451 0))(
  ( (array!5452 (arr!2583 (Array (_ BitVec 32) ValueCell!1259)) (size!2861 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1426 0))(
  ( (LongMapFixedSize!1427 (defaultEntry!3155 Int) (mask!7622 (_ BitVec 32)) (extraKeys!2896 (_ BitVec 32)) (zeroValue!2998 V!3921) (minValue!2998 V!3921) (_size!762 (_ BitVec 32)) (_keys!4930 array!5449) (_values!3138 array!5451) (_vacant!762 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1426)

(declare-fun mapKey!5450 () (_ BitVec 32))

(assert (=> mapNonEmpty!5450 (= (arr!2583 (_values!3138 thiss!1248)) (store mapRest!5450 mapKey!5450 mapValue!5450))))

(declare-fun res!74269 () Bool)

(declare-fun e!102742 () Bool)

(assert (=> start!15740 (=> (not res!74269) (not e!102742))))

(declare-fun valid!699 (LongMapFixedSize!1426) Bool)

(assert (=> start!15740 (= res!74269 (valid!699 thiss!1248))))

(assert (=> start!15740 e!102742))

(declare-fun e!102747 () Bool)

(assert (=> start!15740 e!102747))

(assert (=> start!15740 true))

(declare-fun tp_is_empty!3205 () Bool)

(assert (=> start!15740 tp_is_empty!3205))

(declare-fun b!157088 () Bool)

(assert (=> b!157088 (= e!102742 (not true))))

(declare-fun lt!81680 () Bool)

(declare-fun v!309 () V!3921)

(assert (=> b!157088 (= lt!81680 (valid!699 (LongMapFixedSize!1427 (defaultEntry!3155 thiss!1248) (mask!7622 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 (_size!762 thiss!1248) (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (_vacant!762 thiss!1248))))))

(declare-datatypes ((tuple2!2792 0))(
  ( (tuple2!2793 (_1!1407 (_ BitVec 64)) (_2!1407 V!3921)) )
))
(declare-datatypes ((List!1855 0))(
  ( (Nil!1852) (Cons!1851 (h!2460 tuple2!2792) (t!6649 List!1855)) )
))
(declare-datatypes ((ListLongMap!1791 0))(
  ( (ListLongMap!1792 (toList!911 List!1855)) )
))
(declare-fun +!203 (ListLongMap!1791 tuple2!2792) ListLongMap!1791)

(declare-fun getCurrentListMap!578 (array!5449 array!5451 (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 (_ BitVec 32) Int) ListLongMap!1791)

(assert (=> b!157088 (= (+!203 (getCurrentListMap!578 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (extraKeys!2896 thiss!1248) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)) (tuple2!2793 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!578 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)))))

(declare-datatypes ((Unit!4961 0))(
  ( (Unit!4962) )
))
(declare-fun lt!81681 () Unit!4961)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (array!5449 array!5451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 V!3921 Int) Unit!4961)

(assert (=> b!157088 (= lt!81681 (lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (_keys!4930 thiss!1248) (_values!3138 thiss!1248) (mask!7622 thiss!1248) (extraKeys!2896 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) v!309 (defaultEntry!3155 thiss!1248)))))

(declare-fun b!157089 () Bool)

(assert (=> b!157089 (= e!102744 tp_is_empty!3205)))

(declare-fun b!157090 () Bool)

(declare-fun e!102743 () Bool)

(assert (=> b!157090 (= e!102743 tp_is_empty!3205)))

(declare-fun b!157091 () Bool)

(declare-fun e!102746 () Bool)

(assert (=> b!157091 (= e!102746 (and e!102743 mapRes!5450))))

(declare-fun condMapEmpty!5450 () Bool)

(declare-fun mapDefault!5450 () ValueCell!1259)

(assert (=> b!157091 (= condMapEmpty!5450 (= (arr!2583 (_values!3138 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1259)) mapDefault!5450)))))

(declare-fun array_inv!1639 (array!5449) Bool)

(declare-fun array_inv!1640 (array!5451) Bool)

(assert (=> b!157092 (= e!102747 (and tp!12734 tp_is_empty!3205 (array_inv!1639 (_keys!4930 thiss!1248)) (array_inv!1640 (_values!3138 thiss!1248)) e!102746))))

(declare-fun b!157093 () Bool)

(declare-fun res!74268 () Bool)

(assert (=> b!157093 (=> (not res!74268) (not e!102742))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157093 (= res!74268 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!15740 res!74269) b!157093))

(assert (= (and b!157093 res!74268) b!157088))

(assert (= (and b!157091 condMapEmpty!5450) mapIsEmpty!5450))

(assert (= (and b!157091 (not condMapEmpty!5450)) mapNonEmpty!5450))

(get-info :version)

(assert (= (and mapNonEmpty!5450 ((_ is ValueCellFull!1259) mapValue!5450)) b!157089))

(assert (= (and b!157091 ((_ is ValueCellFull!1259) mapDefault!5450)) b!157090))

(assert (= b!157092 b!157091))

(assert (= start!15740 b!157092))

(declare-fun m!190499 () Bool)

(assert (=> mapNonEmpty!5450 m!190499))

(declare-fun m!190501 () Bool)

(assert (=> start!15740 m!190501))

(declare-fun m!190503 () Bool)

(assert (=> b!157088 m!190503))

(declare-fun m!190505 () Bool)

(assert (=> b!157088 m!190505))

(declare-fun m!190507 () Bool)

(assert (=> b!157088 m!190507))

(declare-fun m!190509 () Bool)

(assert (=> b!157088 m!190509))

(assert (=> b!157088 m!190503))

(declare-fun m!190511 () Bool)

(assert (=> b!157088 m!190511))

(declare-fun m!190513 () Bool)

(assert (=> b!157092 m!190513))

(declare-fun m!190515 () Bool)

(assert (=> b!157092 m!190515))

(check-sat (not b!157088) tp_is_empty!3205 (not mapNonEmpty!5450) b_and!9831 (not b!157092) (not start!15740) (not b_next!3403))
(check-sat b_and!9831 (not b_next!3403))
