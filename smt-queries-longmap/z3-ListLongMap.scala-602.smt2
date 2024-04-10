; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15756 () Bool)

(assert start!15756)

(declare-fun b!157243 () Bool)

(declare-fun b_free!3423 () Bool)

(declare-fun b_next!3423 () Bool)

(assert (=> b!157243 (= b_free!3423 (not b_next!3423))))

(declare-fun tp!12794 () Bool)

(declare-fun b_and!9837 () Bool)

(assert (=> b!157243 (= tp!12794 b_and!9837)))

(declare-fun res!74326 () Bool)

(declare-fun e!102920 () Bool)

(assert (=> start!15756 (=> (not res!74326) (not e!102920))))

(declare-datatypes ((V!3947 0))(
  ( (V!3948 (val!1657 Int)) )
))
(declare-datatypes ((ValueCell!1269 0))(
  ( (ValueCellFull!1269 (v!3522 V!3947)) (EmptyCell!1269) )
))
(declare-datatypes ((array!5503 0))(
  ( (array!5504 (arr!2609 (Array (_ BitVec 32) (_ BitVec 64))) (size!2887 (_ BitVec 32))) )
))
(declare-datatypes ((array!5505 0))(
  ( (array!5506 (arr!2610 (Array (_ BitVec 32) ValueCell!1269)) (size!2888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1446 0))(
  ( (LongMapFixedSize!1447 (defaultEntry!3165 Int) (mask!7638 (_ BitVec 32)) (extraKeys!2906 (_ BitVec 32)) (zeroValue!3008 V!3947) (minValue!3008 V!3947) (_size!772 (_ BitVec 32)) (_keys!4940 array!5503) (_values!3148 array!5505) (_vacant!772 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1446)

(declare-fun valid!689 (LongMapFixedSize!1446) Bool)

(assert (=> start!15756 (= res!74326 (valid!689 thiss!1248))))

(assert (=> start!15756 e!102920))

(declare-fun e!102919 () Bool)

(assert (=> start!15756 e!102919))

(assert (=> start!15756 true))

(declare-fun tp_is_empty!3225 () Bool)

(assert (=> start!15756 tp_is_empty!3225))

(declare-fun b!157239 () Bool)

(assert (=> b!157239 (= e!102920 (not true))))

(declare-fun lt!81700 () Bool)

(declare-fun v!309 () V!3947)

(assert (=> b!157239 (= lt!81700 (valid!689 (LongMapFixedSize!1447 (defaultEntry!3165 thiss!1248) (mask!7638 thiss!1248) (bvor (extraKeys!2906 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3008 thiss!1248) v!309 (_size!772 thiss!1248) (_keys!4940 thiss!1248) (_values!3148 thiss!1248) (_vacant!772 thiss!1248))))))

(declare-datatypes ((tuple2!2874 0))(
  ( (tuple2!2875 (_1!1448 (_ BitVec 64)) (_2!1448 V!3947)) )
))
(declare-datatypes ((List!1879 0))(
  ( (Nil!1876) (Cons!1875 (h!2484 tuple2!2874) (t!6681 List!1879)) )
))
(declare-datatypes ((ListLongMap!1861 0))(
  ( (ListLongMap!1862 (toList!946 List!1879)) )
))
(declare-fun +!214 (ListLongMap!1861 tuple2!2874) ListLongMap!1861)

(declare-fun getCurrentListMap!610 (array!5503 array!5505 (_ BitVec 32) (_ BitVec 32) V!3947 V!3947 (_ BitVec 32) Int) ListLongMap!1861)

(assert (=> b!157239 (= (+!214 (getCurrentListMap!610 (_keys!4940 thiss!1248) (_values!3148 thiss!1248) (mask!7638 thiss!1248) (extraKeys!2906 thiss!1248) (zeroValue!3008 thiss!1248) (minValue!3008 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3165 thiss!1248)) (tuple2!2875 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!610 (_keys!4940 thiss!1248) (_values!3148 thiss!1248) (mask!7638 thiss!1248) (bvor (extraKeys!2906 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3008 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3165 thiss!1248)))))

(declare-datatypes ((Unit!4972 0))(
  ( (Unit!4973) )
))
(declare-fun lt!81699 () Unit!4972)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!82 (array!5503 array!5505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3947 V!3947 V!3947 Int) Unit!4972)

(assert (=> b!157239 (= lt!81699 (lemmaChangeLongMinValueKeyThenAddPairToListMap!82 (_keys!4940 thiss!1248) (_values!3148 thiss!1248) (mask!7638 thiss!1248) (extraKeys!2906 thiss!1248) (bvor (extraKeys!2906 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3008 thiss!1248) (minValue!3008 thiss!1248) v!309 (defaultEntry!3165 thiss!1248)))))

(declare-fun mapIsEmpty!5480 () Bool)

(declare-fun mapRes!5480 () Bool)

(assert (=> mapIsEmpty!5480 mapRes!5480))

(declare-fun b!157240 () Bool)

(declare-fun e!102916 () Bool)

(assert (=> b!157240 (= e!102916 tp_is_empty!3225)))

(declare-fun b!157241 () Bool)

(declare-fun e!102918 () Bool)

(assert (=> b!157241 (= e!102918 tp_is_empty!3225)))

(declare-fun mapNonEmpty!5480 () Bool)

(declare-fun tp!12793 () Bool)

(assert (=> mapNonEmpty!5480 (= mapRes!5480 (and tp!12793 e!102918))))

(declare-fun mapRest!5480 () (Array (_ BitVec 32) ValueCell!1269))

(declare-fun mapKey!5480 () (_ BitVec 32))

(declare-fun mapValue!5480 () ValueCell!1269)

(assert (=> mapNonEmpty!5480 (= (arr!2610 (_values!3148 thiss!1248)) (store mapRest!5480 mapKey!5480 mapValue!5480))))

(declare-fun b!157242 () Bool)

(declare-fun res!74325 () Bool)

(assert (=> b!157242 (=> (not res!74325) (not e!102920))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157242 (= res!74325 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!102921 () Bool)

(declare-fun array_inv!1653 (array!5503) Bool)

(declare-fun array_inv!1654 (array!5505) Bool)

(assert (=> b!157243 (= e!102919 (and tp!12794 tp_is_empty!3225 (array_inv!1653 (_keys!4940 thiss!1248)) (array_inv!1654 (_values!3148 thiss!1248)) e!102921))))

(declare-fun b!157244 () Bool)

(assert (=> b!157244 (= e!102921 (and e!102916 mapRes!5480))))

(declare-fun condMapEmpty!5480 () Bool)

(declare-fun mapDefault!5480 () ValueCell!1269)

(assert (=> b!157244 (= condMapEmpty!5480 (= (arr!2610 (_values!3148 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1269)) mapDefault!5480)))))

(assert (= (and start!15756 res!74326) b!157242))

(assert (= (and b!157242 res!74325) b!157239))

(assert (= (and b!157244 condMapEmpty!5480) mapIsEmpty!5480))

(assert (= (and b!157244 (not condMapEmpty!5480)) mapNonEmpty!5480))

(get-info :version)

(assert (= (and mapNonEmpty!5480 ((_ is ValueCellFull!1269) mapValue!5480)) b!157241))

(assert (= (and b!157244 ((_ is ValueCellFull!1269) mapDefault!5480)) b!157240))

(assert (= b!157243 b!157244))

(assert (= start!15756 b!157243))

(declare-fun m!190521 () Bool)

(assert (=> start!15756 m!190521))

(declare-fun m!190523 () Bool)

(assert (=> b!157239 m!190523))

(declare-fun m!190525 () Bool)

(assert (=> b!157239 m!190525))

(declare-fun m!190527 () Bool)

(assert (=> b!157239 m!190527))

(declare-fun m!190529 () Bool)

(assert (=> b!157239 m!190529))

(assert (=> b!157239 m!190523))

(declare-fun m!190531 () Bool)

(assert (=> b!157239 m!190531))

(declare-fun m!190533 () Bool)

(assert (=> mapNonEmpty!5480 m!190533))

(declare-fun m!190535 () Bool)

(assert (=> b!157243 m!190535))

(declare-fun m!190537 () Bool)

(assert (=> b!157243 m!190537))

(check-sat tp_is_empty!3225 (not b_next!3423) (not b!157243) (not start!15756) (not mapNonEmpty!5480) (not b!157239) b_and!9837)
(check-sat b_and!9837 (not b_next!3423))
