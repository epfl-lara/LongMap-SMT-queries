; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15762 () Bool)

(assert start!15762)

(declare-fun b!157296 () Bool)

(declare-fun b_free!3429 () Bool)

(declare-fun b_next!3429 () Bool)

(assert (=> b!157296 (= b_free!3429 (not b_next!3429))))

(declare-fun tp!12811 () Bool)

(declare-fun b_and!9843 () Bool)

(assert (=> b!157296 (= tp!12811 b_and!9843)))

(declare-fun b!157293 () Bool)

(declare-fun e!102973 () Bool)

(assert (=> b!157293 (= e!102973 (not true))))

(declare-fun lt!81718 () Bool)

(declare-datatypes ((V!3955 0))(
  ( (V!3956 (val!1660 Int)) )
))
(declare-datatypes ((ValueCell!1272 0))(
  ( (ValueCellFull!1272 (v!3525 V!3955)) (EmptyCell!1272) )
))
(declare-datatypes ((array!5515 0))(
  ( (array!5516 (arr!2615 (Array (_ BitVec 32) (_ BitVec 64))) (size!2893 (_ BitVec 32))) )
))
(declare-datatypes ((array!5517 0))(
  ( (array!5518 (arr!2616 (Array (_ BitVec 32) ValueCell!1272)) (size!2894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1452 0))(
  ( (LongMapFixedSize!1453 (defaultEntry!3168 Int) (mask!7643 (_ BitVec 32)) (extraKeys!2909 (_ BitVec 32)) (zeroValue!3011 V!3955) (minValue!3011 V!3955) (_size!775 (_ BitVec 32)) (_keys!4943 array!5515) (_values!3151 array!5517) (_vacant!775 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1452)

(declare-fun v!309 () V!3955)

(declare-fun valid!691 (LongMapFixedSize!1452) Bool)

(assert (=> b!157293 (= lt!81718 (valid!691 (LongMapFixedSize!1453 (defaultEntry!3168 thiss!1248) (mask!7643 thiss!1248) (bvor (extraKeys!2909 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3011 thiss!1248) v!309 (_size!775 thiss!1248) (_keys!4943 thiss!1248) (_values!3151 thiss!1248) (_vacant!775 thiss!1248))))))

(declare-datatypes ((tuple2!2878 0))(
  ( (tuple2!2879 (_1!1450 (_ BitVec 64)) (_2!1450 V!3955)) )
))
(declare-datatypes ((List!1881 0))(
  ( (Nil!1878) (Cons!1877 (h!2486 tuple2!2878) (t!6683 List!1881)) )
))
(declare-datatypes ((ListLongMap!1865 0))(
  ( (ListLongMap!1866 (toList!948 List!1881)) )
))
(declare-fun +!216 (ListLongMap!1865 tuple2!2878) ListLongMap!1865)

(declare-fun getCurrentListMap!612 (array!5515 array!5517 (_ BitVec 32) (_ BitVec 32) V!3955 V!3955 (_ BitVec 32) Int) ListLongMap!1865)

(assert (=> b!157293 (= (+!216 (getCurrentListMap!612 (_keys!4943 thiss!1248) (_values!3151 thiss!1248) (mask!7643 thiss!1248) (extraKeys!2909 thiss!1248) (zeroValue!3011 thiss!1248) (minValue!3011 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3168 thiss!1248)) (tuple2!2879 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!612 (_keys!4943 thiss!1248) (_values!3151 thiss!1248) (mask!7643 thiss!1248) (bvor (extraKeys!2909 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3011 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3168 thiss!1248)))))

(declare-datatypes ((Unit!4976 0))(
  ( (Unit!4977) )
))
(declare-fun lt!81717 () Unit!4976)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!84 (array!5515 array!5517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3955 V!3955 V!3955 Int) Unit!4976)

(assert (=> b!157293 (= lt!81717 (lemmaChangeLongMinValueKeyThenAddPairToListMap!84 (_keys!4943 thiss!1248) (_values!3151 thiss!1248) (mask!7643 thiss!1248) (extraKeys!2909 thiss!1248) (bvor (extraKeys!2909 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3011 thiss!1248) (minValue!3011 thiss!1248) v!309 (defaultEntry!3168 thiss!1248)))))

(declare-fun b!157294 () Bool)

(declare-fun e!102970 () Bool)

(declare-fun e!102974 () Bool)

(declare-fun mapRes!5489 () Bool)

(assert (=> b!157294 (= e!102970 (and e!102974 mapRes!5489))))

(declare-fun condMapEmpty!5489 () Bool)

(declare-fun mapDefault!5489 () ValueCell!1272)

(assert (=> b!157294 (= condMapEmpty!5489 (= (arr!2616 (_values!3151 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1272)) mapDefault!5489)))))

(declare-fun b!157295 () Bool)

(declare-fun tp_is_empty!3231 () Bool)

(assert (=> b!157295 (= e!102974 tp_is_empty!3231)))

(declare-fun res!74343 () Bool)

(assert (=> start!15762 (=> (not res!74343) (not e!102973))))

(assert (=> start!15762 (= res!74343 (valid!691 thiss!1248))))

(assert (=> start!15762 e!102973))

(declare-fun e!102971 () Bool)

(assert (=> start!15762 e!102971))

(assert (=> start!15762 true))

(assert (=> start!15762 tp_is_empty!3231))

(declare-fun mapNonEmpty!5489 () Bool)

(declare-fun tp!12812 () Bool)

(declare-fun e!102975 () Bool)

(assert (=> mapNonEmpty!5489 (= mapRes!5489 (and tp!12812 e!102975))))

(declare-fun mapKey!5489 () (_ BitVec 32))

(declare-fun mapValue!5489 () ValueCell!1272)

(declare-fun mapRest!5489 () (Array (_ BitVec 32) ValueCell!1272))

(assert (=> mapNonEmpty!5489 (= (arr!2616 (_values!3151 thiss!1248)) (store mapRest!5489 mapKey!5489 mapValue!5489))))

(declare-fun array_inv!1657 (array!5515) Bool)

(declare-fun array_inv!1658 (array!5517) Bool)

(assert (=> b!157296 (= e!102971 (and tp!12811 tp_is_empty!3231 (array_inv!1657 (_keys!4943 thiss!1248)) (array_inv!1658 (_values!3151 thiss!1248)) e!102970))))

(declare-fun mapIsEmpty!5489 () Bool)

(assert (=> mapIsEmpty!5489 mapRes!5489))

(declare-fun b!157297 () Bool)

(declare-fun res!74344 () Bool)

(assert (=> b!157297 (=> (not res!74344) (not e!102973))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157297 (= res!74344 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157298 () Bool)

(assert (=> b!157298 (= e!102975 tp_is_empty!3231)))

(assert (= (and start!15762 res!74343) b!157297))

(assert (= (and b!157297 res!74344) b!157293))

(assert (= (and b!157294 condMapEmpty!5489) mapIsEmpty!5489))

(assert (= (and b!157294 (not condMapEmpty!5489)) mapNonEmpty!5489))

(get-info :version)

(assert (= (and mapNonEmpty!5489 ((_ is ValueCellFull!1272) mapValue!5489)) b!157298))

(assert (= (and b!157294 ((_ is ValueCellFull!1272) mapDefault!5489)) b!157295))

(assert (= b!157296 b!157294))

(assert (= start!15762 b!157296))

(declare-fun m!190575 () Bool)

(assert (=> b!157293 m!190575))

(declare-fun m!190577 () Bool)

(assert (=> b!157293 m!190577))

(declare-fun m!190579 () Bool)

(assert (=> b!157293 m!190579))

(declare-fun m!190581 () Bool)

(assert (=> b!157293 m!190581))

(assert (=> b!157293 m!190575))

(declare-fun m!190583 () Bool)

(assert (=> b!157293 m!190583))

(declare-fun m!190585 () Bool)

(assert (=> start!15762 m!190585))

(declare-fun m!190587 () Bool)

(assert (=> mapNonEmpty!5489 m!190587))

(declare-fun m!190589 () Bool)

(assert (=> b!157296 m!190589))

(declare-fun m!190591 () Bool)

(assert (=> b!157296 m!190591))

(check-sat (not b!157296) (not mapNonEmpty!5489) tp_is_empty!3231 b_and!9843 (not start!15762) (not b_next!3429) (not b!157293))
(check-sat b_and!9843 (not b_next!3429))
