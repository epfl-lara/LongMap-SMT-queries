; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15744 () Bool)

(assert start!15744)

(declare-fun b!157119 () Bool)

(declare-fun b_free!3411 () Bool)

(declare-fun b_next!3411 () Bool)

(assert (=> b!157119 (= b_free!3411 (not b_next!3411))))

(declare-fun tp!12758 () Bool)

(declare-fun b_and!9825 () Bool)

(assert (=> b!157119 (= tp!12758 b_and!9825)))

(declare-fun b!157118 () Bool)

(declare-fun res!74278 () Bool)

(declare-fun e!102801 () Bool)

(assert (=> b!157118 (=> (not res!74278) (not e!102801))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157118 (= res!74278 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5462 () Bool)

(declare-fun mapRes!5462 () Bool)

(declare-fun tp!12757 () Bool)

(declare-fun e!102797 () Bool)

(assert (=> mapNonEmpty!5462 (= mapRes!5462 (and tp!12757 e!102797))))

(declare-fun mapKey!5462 () (_ BitVec 32))

(declare-datatypes ((V!3931 0))(
  ( (V!3932 (val!1651 Int)) )
))
(declare-datatypes ((ValueCell!1263 0))(
  ( (ValueCellFull!1263 (v!3516 V!3931)) (EmptyCell!1263) )
))
(declare-datatypes ((array!5479 0))(
  ( (array!5480 (arr!2597 (Array (_ BitVec 32) (_ BitVec 64))) (size!2875 (_ BitVec 32))) )
))
(declare-datatypes ((array!5481 0))(
  ( (array!5482 (arr!2598 (Array (_ BitVec 32) ValueCell!1263)) (size!2876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1434 0))(
  ( (LongMapFixedSize!1435 (defaultEntry!3159 Int) (mask!7628 (_ BitVec 32)) (extraKeys!2900 (_ BitVec 32)) (zeroValue!3002 V!3931) (minValue!3002 V!3931) (_size!766 (_ BitVec 32)) (_keys!4934 array!5479) (_values!3142 array!5481) (_vacant!766 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1434)

(declare-fun mapValue!5462 () ValueCell!1263)

(declare-fun mapRest!5462 () (Array (_ BitVec 32) ValueCell!1263))

(assert (=> mapNonEmpty!5462 (= (arr!2598 (_values!3142 thiss!1248)) (store mapRest!5462 mapKey!5462 mapValue!5462))))

(declare-fun e!102799 () Bool)

(declare-fun tp_is_empty!3213 () Bool)

(declare-fun e!102798 () Bool)

(declare-fun array_inv!1645 (array!5479) Bool)

(declare-fun array_inv!1646 (array!5481) Bool)

(assert (=> b!157119 (= e!102799 (and tp!12758 tp_is_empty!3213 (array_inv!1645 (_keys!4934 thiss!1248)) (array_inv!1646 (_values!3142 thiss!1248)) e!102798))))

(declare-fun b!157121 () Bool)

(declare-fun e!102796 () Bool)

(assert (=> b!157121 (= e!102796 tp_is_empty!3213)))

(declare-fun b!157122 () Bool)

(declare-fun e!102795 () Bool)

(assert (=> b!157122 (= e!102795 true)))

(declare-fun lt!81650 () Bool)

(declare-fun lt!81652 () LongMapFixedSize!1434)

(declare-datatypes ((tuple2!2862 0))(
  ( (tuple2!2863 (_1!1442 (_ BitVec 64)) (_2!1442 V!3931)) )
))
(declare-datatypes ((List!1873 0))(
  ( (Nil!1870) (Cons!1869 (h!2478 tuple2!2862) (t!6675 List!1873)) )
))
(declare-datatypes ((ListLongMap!1849 0))(
  ( (ListLongMap!1850 (toList!940 List!1873)) )
))
(declare-fun contains!975 (ListLongMap!1849 (_ BitVec 64)) Bool)

(declare-fun map!1570 (LongMapFixedSize!1434) ListLongMap!1849)

(assert (=> b!157122 (= lt!81650 (contains!975 (map!1570 lt!81652) key!828))))

(declare-fun mapIsEmpty!5462 () Bool)

(assert (=> mapIsEmpty!5462 mapRes!5462))

(declare-fun b!157120 () Bool)

(assert (=> b!157120 (= e!102797 tp_is_empty!3213)))

(declare-fun res!74277 () Bool)

(assert (=> start!15744 (=> (not res!74277) (not e!102801))))

(declare-fun valid!683 (LongMapFixedSize!1434) Bool)

(assert (=> start!15744 (= res!74277 (valid!683 thiss!1248))))

(assert (=> start!15744 e!102801))

(assert (=> start!15744 e!102799))

(assert (=> start!15744 true))

(assert (=> start!15744 tp_is_empty!3213))

(declare-fun b!157123 () Bool)

(assert (=> b!157123 (= e!102798 (and e!102796 mapRes!5462))))

(declare-fun condMapEmpty!5462 () Bool)

(declare-fun mapDefault!5462 () ValueCell!1263)

(assert (=> b!157123 (= condMapEmpty!5462 (= (arr!2598 (_values!3142 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1263)) mapDefault!5462)))))

(declare-fun b!157124 () Bool)

(assert (=> b!157124 (= e!102801 (not e!102795))))

(declare-fun res!74276 () Bool)

(assert (=> b!157124 (=> res!74276 e!102795)))

(assert (=> b!157124 (= res!74276 (not (valid!683 lt!81652)))))

(declare-fun v!309 () V!3931)

(assert (=> b!157124 (= lt!81652 (LongMapFixedSize!1435 (defaultEntry!3159 thiss!1248) (mask!7628 thiss!1248) (bvor (extraKeys!2900 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3002 thiss!1248) v!309 (_size!766 thiss!1248) (_keys!4934 thiss!1248) (_values!3142 thiss!1248) (_vacant!766 thiss!1248)))))

(declare-fun +!208 (ListLongMap!1849 tuple2!2862) ListLongMap!1849)

(declare-fun getCurrentListMap!604 (array!5479 array!5481 (_ BitVec 32) (_ BitVec 32) V!3931 V!3931 (_ BitVec 32) Int) ListLongMap!1849)

(assert (=> b!157124 (= (+!208 (getCurrentListMap!604 (_keys!4934 thiss!1248) (_values!3142 thiss!1248) (mask!7628 thiss!1248) (extraKeys!2900 thiss!1248) (zeroValue!3002 thiss!1248) (minValue!3002 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3159 thiss!1248)) (tuple2!2863 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!604 (_keys!4934 thiss!1248) (_values!3142 thiss!1248) (mask!7628 thiss!1248) (bvor (extraKeys!2900 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3002 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3159 thiss!1248)))))

(declare-datatypes ((Unit!4960 0))(
  ( (Unit!4961) )
))
(declare-fun lt!81651 () Unit!4960)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (array!5479 array!5481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3931 V!3931 V!3931 Int) Unit!4960)

(assert (=> b!157124 (= lt!81651 (lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (_keys!4934 thiss!1248) (_values!3142 thiss!1248) (mask!7628 thiss!1248) (extraKeys!2900 thiss!1248) (bvor (extraKeys!2900 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3002 thiss!1248) (minValue!3002 thiss!1248) v!309 (defaultEntry!3159 thiss!1248)))))

(assert (= (and start!15744 res!74277) b!157118))

(assert (= (and b!157118 res!74278) b!157124))

(assert (= (and b!157124 (not res!74276)) b!157122))

(assert (= (and b!157123 condMapEmpty!5462) mapIsEmpty!5462))

(assert (= (and b!157123 (not condMapEmpty!5462)) mapNonEmpty!5462))

(get-info :version)

(assert (= (and mapNonEmpty!5462 ((_ is ValueCellFull!1263) mapValue!5462)) b!157120))

(assert (= (and b!157123 ((_ is ValueCellFull!1263) mapDefault!5462)) b!157121))

(assert (= b!157119 b!157123))

(assert (= start!15744 b!157119))

(declare-fun m!190393 () Bool)

(assert (=> start!15744 m!190393))

(declare-fun m!190395 () Bool)

(assert (=> b!157119 m!190395))

(declare-fun m!190397 () Bool)

(assert (=> b!157119 m!190397))

(declare-fun m!190399 () Bool)

(assert (=> b!157122 m!190399))

(assert (=> b!157122 m!190399))

(declare-fun m!190401 () Bool)

(assert (=> b!157122 m!190401))

(declare-fun m!190403 () Bool)

(assert (=> b!157124 m!190403))

(declare-fun m!190405 () Bool)

(assert (=> b!157124 m!190405))

(declare-fun m!190407 () Bool)

(assert (=> b!157124 m!190407))

(declare-fun m!190409 () Bool)

(assert (=> b!157124 m!190409))

(assert (=> b!157124 m!190403))

(declare-fun m!190411 () Bool)

(assert (=> b!157124 m!190411))

(declare-fun m!190413 () Bool)

(assert (=> mapNonEmpty!5462 m!190413))

(check-sat (not b!157122) b_and!9825 (not b!157124) tp_is_empty!3213 (not b!157119) (not start!15744) (not mapNonEmpty!5462) (not b_next!3411))
(check-sat b_and!9825 (not b_next!3411))
