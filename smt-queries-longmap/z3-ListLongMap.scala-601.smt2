; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15752 () Bool)

(assert start!15752)

(declare-fun b!157209 () Bool)

(declare-fun b_free!3415 () Bool)

(declare-fun b_next!3415 () Bool)

(assert (=> b!157209 (= b_free!3415 (not b_next!3415))))

(declare-fun tp!12770 () Bool)

(declare-fun b_and!9843 () Bool)

(assert (=> b!157209 (= tp!12770 b_and!9843)))

(declare-fun b!157207 () Bool)

(declare-fun e!102861 () Bool)

(declare-fun tp_is_empty!3217 () Bool)

(assert (=> b!157207 (= e!102861 tp_is_empty!3217)))

(declare-fun b!157208 () Bool)

(declare-fun e!102864 () Bool)

(declare-fun e!102867 () Bool)

(declare-fun mapRes!5468 () Bool)

(assert (=> b!157208 (= e!102864 (and e!102867 mapRes!5468))))

(declare-fun condMapEmpty!5468 () Bool)

(declare-datatypes ((V!3937 0))(
  ( (V!3938 (val!1653 Int)) )
))
(declare-datatypes ((ValueCell!1265 0))(
  ( (ValueCellFull!1265 (v!3519 V!3937)) (EmptyCell!1265) )
))
(declare-datatypes ((array!5473 0))(
  ( (array!5474 (arr!2594 (Array (_ BitVec 32) (_ BitVec 64))) (size!2872 (_ BitVec 32))) )
))
(declare-datatypes ((array!5475 0))(
  ( (array!5476 (arr!2595 (Array (_ BitVec 32) ValueCell!1265)) (size!2873 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1438 0))(
  ( (LongMapFixedSize!1439 (defaultEntry!3161 Int) (mask!7632 (_ BitVec 32)) (extraKeys!2902 (_ BitVec 32)) (zeroValue!3004 V!3937) (minValue!3004 V!3937) (_size!768 (_ BitVec 32)) (_keys!4936 array!5473) (_values!3144 array!5475) (_vacant!768 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1438)

(declare-fun mapDefault!5468 () ValueCell!1265)

(assert (=> b!157208 (= condMapEmpty!5468 (= (arr!2595 (_values!3144 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1265)) mapDefault!5468)))))

(declare-fun e!102866 () Bool)

(declare-fun array_inv!1647 (array!5473) Bool)

(declare-fun array_inv!1648 (array!5475) Bool)

(assert (=> b!157209 (= e!102866 (and tp!12770 tp_is_empty!3217 (array_inv!1647 (_keys!4936 thiss!1248)) (array_inv!1648 (_values!3144 thiss!1248)) e!102864))))

(declare-fun mapNonEmpty!5468 () Bool)

(declare-fun tp!12769 () Bool)

(assert (=> mapNonEmpty!5468 (= mapRes!5468 (and tp!12769 e!102861))))

(declare-fun mapValue!5468 () ValueCell!1265)

(declare-fun mapRest!5468 () (Array (_ BitVec 32) ValueCell!1265))

(declare-fun mapKey!5468 () (_ BitVec 32))

(assert (=> mapNonEmpty!5468 (= (arr!2595 (_values!3144 thiss!1248)) (store mapRest!5468 mapKey!5468 mapValue!5468))))

(declare-fun b!157210 () Bool)

(declare-fun res!74316 () Bool)

(declare-fun e!102863 () Bool)

(assert (=> b!157210 (=> (not res!74316) (not e!102863))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157210 (= res!74316 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157211 () Bool)

(assert (=> b!157211 (= e!102867 tp_is_empty!3217)))

(declare-fun b!157212 () Bool)

(declare-fun e!102862 () Bool)

(assert (=> b!157212 (= e!102862 true)))

(declare-fun lt!81729 () Bool)

(declare-fun lt!81727 () LongMapFixedSize!1438)

(declare-datatypes ((tuple2!2800 0))(
  ( (tuple2!2801 (_1!1411 (_ BitVec 64)) (_2!1411 V!3937)) )
))
(declare-datatypes ((List!1859 0))(
  ( (Nil!1856) (Cons!1855 (h!2464 tuple2!2800) (t!6653 List!1859)) )
))
(declare-datatypes ((ListLongMap!1799 0))(
  ( (ListLongMap!1800 (toList!915 List!1859)) )
))
(declare-fun contains!958 (ListLongMap!1799 (_ BitVec 64)) Bool)

(declare-fun map!1569 (LongMapFixedSize!1438) ListLongMap!1799)

(assert (=> b!157212 (= lt!81729 (contains!958 (map!1569 lt!81727) key!828))))

(declare-fun res!74315 () Bool)

(assert (=> start!15752 (=> (not res!74315) (not e!102863))))

(declare-fun valid!704 (LongMapFixedSize!1438) Bool)

(assert (=> start!15752 (= res!74315 (valid!704 thiss!1248))))

(assert (=> start!15752 e!102863))

(assert (=> start!15752 e!102866))

(assert (=> start!15752 true))

(assert (=> start!15752 tp_is_empty!3217))

(declare-fun mapIsEmpty!5468 () Bool)

(assert (=> mapIsEmpty!5468 mapRes!5468))

(declare-fun b!157213 () Bool)

(assert (=> b!157213 (= e!102863 (not e!102862))))

(declare-fun res!74317 () Bool)

(assert (=> b!157213 (=> res!74317 e!102862)))

(assert (=> b!157213 (= res!74317 (not (valid!704 lt!81727)))))

(declare-fun v!309 () V!3937)

(assert (=> b!157213 (= lt!81727 (LongMapFixedSize!1439 (defaultEntry!3161 thiss!1248) (mask!7632 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 (_size!768 thiss!1248) (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (_vacant!768 thiss!1248)))))

(declare-fun +!207 (ListLongMap!1799 tuple2!2800) ListLongMap!1799)

(declare-fun getCurrentListMap!582 (array!5473 array!5475 (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 (_ BitVec 32) Int) ListLongMap!1799)

(assert (=> b!157213 (= (+!207 (getCurrentListMap!582 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (extraKeys!2902 thiss!1248) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!582 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)))))

(declare-datatypes ((Unit!4969 0))(
  ( (Unit!4970) )
))
(declare-fun lt!81728 () Unit!4969)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (array!5473 array!5475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 V!3937 Int) Unit!4969)

(assert (=> b!157213 (= lt!81728 (lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (_keys!4936 thiss!1248) (_values!3144 thiss!1248) (mask!7632 thiss!1248) (extraKeys!2902 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) v!309 (defaultEntry!3161 thiss!1248)))))

(assert (= (and start!15752 res!74315) b!157210))

(assert (= (and b!157210 res!74316) b!157213))

(assert (= (and b!157213 (not res!74317)) b!157212))

(assert (= (and b!157208 condMapEmpty!5468) mapIsEmpty!5468))

(assert (= (and b!157208 (not condMapEmpty!5468)) mapNonEmpty!5468))

(get-info :version)

(assert (= (and mapNonEmpty!5468 ((_ is ValueCellFull!1265) mapValue!5468)) b!157207))

(assert (= (and b!157208 ((_ is ValueCellFull!1265) mapDefault!5468)) b!157211))

(assert (= b!157209 b!157208))

(assert (= start!15752 b!157209))

(declare-fun m!190619 () Bool)

(assert (=> start!15752 m!190619))

(declare-fun m!190621 () Bool)

(assert (=> b!157209 m!190621))

(declare-fun m!190623 () Bool)

(assert (=> b!157209 m!190623))

(declare-fun m!190625 () Bool)

(assert (=> mapNonEmpty!5468 m!190625))

(declare-fun m!190627 () Bool)

(assert (=> b!157212 m!190627))

(assert (=> b!157212 m!190627))

(declare-fun m!190629 () Bool)

(assert (=> b!157212 m!190629))

(declare-fun m!190631 () Bool)

(assert (=> b!157213 m!190631))

(declare-fun m!190633 () Bool)

(assert (=> b!157213 m!190633))

(declare-fun m!190635 () Bool)

(assert (=> b!157213 m!190635))

(declare-fun m!190637 () Bool)

(assert (=> b!157213 m!190637))

(assert (=> b!157213 m!190631))

(declare-fun m!190639 () Bool)

(assert (=> b!157213 m!190639))

(check-sat (not mapNonEmpty!5468) tp_is_empty!3217 (not start!15752) (not b!157209) (not b_next!3415) (not b!157212) b_and!9843 (not b!157213))
(check-sat b_and!9843 (not b_next!3415))
