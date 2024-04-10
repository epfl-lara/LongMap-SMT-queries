; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15642 () Bool)

(assert start!15642)

(declare-fun b!155861 () Bool)

(declare-fun b_free!3309 () Bool)

(declare-fun b_next!3309 () Bool)

(assert (=> b!155861 (= b_free!3309 (not b_next!3309))))

(declare-fun tp!12451 () Bool)

(declare-fun b_and!9723 () Bool)

(assert (=> b!155861 (= tp!12451 b_and!9723)))

(declare-fun b!155858 () Bool)

(declare-fun e!101864 () Bool)

(declare-fun tp_is_empty!3111 () Bool)

(assert (=> b!155858 (= e!101864 tp_is_empty!3111)))

(declare-fun b!155859 () Bool)

(declare-fun res!73628 () Bool)

(declare-fun e!101863 () Bool)

(assert (=> b!155859 (=> (not res!73628) (not e!101863))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155859 (= res!73628 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5309 () Bool)

(declare-fun mapRes!5309 () Bool)

(assert (=> mapIsEmpty!5309 mapRes!5309))

(declare-fun b!155860 () Bool)

(declare-fun e!101859 () Bool)

(assert (=> b!155860 (= e!101859 tp_is_empty!3111)))

(declare-fun mapNonEmpty!5309 () Bool)

(declare-fun tp!12452 () Bool)

(assert (=> mapNonEmpty!5309 (= mapRes!5309 (and tp!12452 e!101859))))

(declare-datatypes ((V!3795 0))(
  ( (V!3796 (val!1600 Int)) )
))
(declare-datatypes ((ValueCell!1212 0))(
  ( (ValueCellFull!1212 (v!3465 V!3795)) (EmptyCell!1212) )
))
(declare-fun mapValue!5309 () ValueCell!1212)

(declare-datatypes ((array!5275 0))(
  ( (array!5276 (arr!2495 (Array (_ BitVec 32) (_ BitVec 64))) (size!2773 (_ BitVec 32))) )
))
(declare-datatypes ((array!5277 0))(
  ( (array!5278 (arr!2496 (Array (_ BitVec 32) ValueCell!1212)) (size!2774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1332 0))(
  ( (LongMapFixedSize!1333 (defaultEntry!3108 Int) (mask!7543 (_ BitVec 32)) (extraKeys!2849 (_ BitVec 32)) (zeroValue!2951 V!3795) (minValue!2951 V!3795) (_size!715 (_ BitVec 32)) (_keys!4883 array!5275) (_values!3091 array!5277) (_vacant!715 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1332)

(declare-fun mapKey!5309 () (_ BitVec 32))

(declare-fun mapRest!5309 () (Array (_ BitVec 32) ValueCell!1212))

(assert (=> mapNonEmpty!5309 (= (arr!2496 (_values!3091 thiss!1248)) (store mapRest!5309 mapKey!5309 mapValue!5309))))

(declare-fun res!73629 () Bool)

(assert (=> start!15642 (=> (not res!73629) (not e!101863))))

(declare-fun valid!649 (LongMapFixedSize!1332) Bool)

(assert (=> start!15642 (= res!73629 (valid!649 thiss!1248))))

(assert (=> start!15642 e!101863))

(declare-fun e!101861 () Bool)

(assert (=> start!15642 e!101861))

(assert (=> start!15642 true))

(assert (=> start!15642 tp_is_empty!3111))

(declare-fun e!101865 () Bool)

(declare-fun array_inv!1575 (array!5275) Bool)

(declare-fun array_inv!1576 (array!5277) Bool)

(assert (=> b!155861 (= e!101861 (and tp!12451 tp_is_empty!3111 (array_inv!1575 (_keys!4883 thiss!1248)) (array_inv!1576 (_values!3091 thiss!1248)) e!101865))))

(declare-fun b!155862 () Bool)

(declare-fun e!101862 () Bool)

(assert (=> b!155862 (= e!101862 true)))

(declare-fun lt!81435 () Bool)

(declare-fun lt!81434 () LongMapFixedSize!1332)

(declare-datatypes ((tuple2!2836 0))(
  ( (tuple2!2837 (_1!1429 (_ BitVec 64)) (_2!1429 V!3795)) )
))
(declare-datatypes ((List!1836 0))(
  ( (Nil!1833) (Cons!1832 (h!2441 tuple2!2836) (t!6638 List!1836)) )
))
(declare-datatypes ((ListLongMap!1823 0))(
  ( (ListLongMap!1824 (toList!927 List!1836)) )
))
(declare-fun contains!971 (ListLongMap!1823 (_ BitVec 64)) Bool)

(declare-fun map!1532 (LongMapFixedSize!1332) ListLongMap!1823)

(assert (=> b!155862 (= lt!81435 (contains!971 (map!1532 lt!81434) key!828))))

(declare-fun b!155863 () Bool)

(assert (=> b!155863 (= e!101865 (and e!101864 mapRes!5309))))

(declare-fun condMapEmpty!5309 () Bool)

(declare-fun mapDefault!5309 () ValueCell!1212)

(assert (=> b!155863 (= condMapEmpty!5309 (= (arr!2496 (_values!3091 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1212)) mapDefault!5309)))))

(declare-fun b!155864 () Bool)

(assert (=> b!155864 (= e!101863 (not e!101862))))

(declare-fun res!73630 () Bool)

(assert (=> b!155864 (=> res!73630 e!101862)))

(assert (=> b!155864 (= res!73630 (not (valid!649 lt!81434)))))

(declare-fun v!309 () V!3795)

(assert (=> b!155864 (= lt!81434 (LongMapFixedSize!1333 (defaultEntry!3108 thiss!1248) (mask!7543 thiss!1248) (bvor (extraKeys!2849 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2951 thiss!1248) (_size!715 thiss!1248) (_keys!4883 thiss!1248) (_values!3091 thiss!1248) (_vacant!715 thiss!1248)))))

(declare-fun +!195 (ListLongMap!1823 tuple2!2836) ListLongMap!1823)

(declare-fun getCurrentListMap!591 (array!5275 array!5277 (_ BitVec 32) (_ BitVec 32) V!3795 V!3795 (_ BitVec 32) Int) ListLongMap!1823)

(assert (=> b!155864 (= (+!195 (getCurrentListMap!591 (_keys!4883 thiss!1248) (_values!3091 thiss!1248) (mask!7543 thiss!1248) (extraKeys!2849 thiss!1248) (zeroValue!2951 thiss!1248) (minValue!2951 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3108 thiss!1248)) (tuple2!2837 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!591 (_keys!4883 thiss!1248) (_values!3091 thiss!1248) (mask!7543 thiss!1248) (bvor (extraKeys!2849 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2951 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3108 thiss!1248)))))

(declare-datatypes ((Unit!4934 0))(
  ( (Unit!4935) )
))
(declare-fun lt!81436 () Unit!4934)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!74 (array!5275 array!5277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3795 V!3795 V!3795 Int) Unit!4934)

(assert (=> b!155864 (= lt!81436 (lemmaChangeZeroKeyThenAddPairToListMap!74 (_keys!4883 thiss!1248) (_values!3091 thiss!1248) (mask!7543 thiss!1248) (extraKeys!2849 thiss!1248) (bvor (extraKeys!2849 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2951 thiss!1248) v!309 (minValue!2951 thiss!1248) (defaultEntry!3108 thiss!1248)))))

(assert (= (and start!15642 res!73629) b!155859))

(assert (= (and b!155859 res!73628) b!155864))

(assert (= (and b!155864 (not res!73630)) b!155862))

(assert (= (and b!155863 condMapEmpty!5309) mapIsEmpty!5309))

(assert (= (and b!155863 (not condMapEmpty!5309)) mapNonEmpty!5309))

(get-info :version)

(assert (= (and mapNonEmpty!5309 ((_ is ValueCellFull!1212) mapValue!5309)) b!155860))

(assert (= (and b!155863 ((_ is ValueCellFull!1212) mapDefault!5309)) b!155858))

(assert (= b!155861 b!155863))

(assert (= start!15642 b!155861))

(declare-fun m!189595 () Bool)

(assert (=> start!15642 m!189595))

(declare-fun m!189597 () Bool)

(assert (=> b!155861 m!189597))

(declare-fun m!189599 () Bool)

(assert (=> b!155861 m!189599))

(declare-fun m!189601 () Bool)

(assert (=> mapNonEmpty!5309 m!189601))

(declare-fun m!189603 () Bool)

(assert (=> b!155864 m!189603))

(declare-fun m!189605 () Bool)

(assert (=> b!155864 m!189605))

(declare-fun m!189607 () Bool)

(assert (=> b!155864 m!189607))

(declare-fun m!189609 () Bool)

(assert (=> b!155864 m!189609))

(assert (=> b!155864 m!189603))

(declare-fun m!189611 () Bool)

(assert (=> b!155864 m!189611))

(declare-fun m!189613 () Bool)

(assert (=> b!155862 m!189613))

(assert (=> b!155862 m!189613))

(declare-fun m!189615 () Bool)

(assert (=> b!155862 m!189615))

(check-sat (not start!15642) (not b!155864) (not b!155861) (not b_next!3309) tp_is_empty!3111 (not b!155862) (not mapNonEmpty!5309) b_and!9723)
(check-sat b_and!9723 (not b_next!3309))
