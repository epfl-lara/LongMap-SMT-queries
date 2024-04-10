; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15750 () Bool)

(assert start!15750)

(declare-fun b!157186 () Bool)

(declare-fun b_free!3417 () Bool)

(declare-fun b_next!3417 () Bool)

(assert (=> b!157186 (= b_free!3417 (not b_next!3417))))

(declare-fun tp!12776 () Bool)

(declare-fun b_and!9831 () Bool)

(assert (=> b!157186 (= tp!12776 b_and!9831)))

(declare-fun res!74305 () Bool)

(declare-fun e!102859 () Bool)

(assert (=> start!15750 (=> (not res!74305) (not e!102859))))

(declare-datatypes ((V!3939 0))(
  ( (V!3940 (val!1654 Int)) )
))
(declare-datatypes ((ValueCell!1266 0))(
  ( (ValueCellFull!1266 (v!3519 V!3939)) (EmptyCell!1266) )
))
(declare-datatypes ((array!5491 0))(
  ( (array!5492 (arr!2603 (Array (_ BitVec 32) (_ BitVec 64))) (size!2881 (_ BitVec 32))) )
))
(declare-datatypes ((array!5493 0))(
  ( (array!5494 (arr!2604 (Array (_ BitVec 32) ValueCell!1266)) (size!2882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1440 0))(
  ( (LongMapFixedSize!1441 (defaultEntry!3162 Int) (mask!7633 (_ BitVec 32)) (extraKeys!2903 (_ BitVec 32)) (zeroValue!3005 V!3939) (minValue!3005 V!3939) (_size!769 (_ BitVec 32)) (_keys!4937 array!5491) (_values!3145 array!5493) (_vacant!769 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1440)

(declare-fun valid!686 (LongMapFixedSize!1440) Bool)

(assert (=> start!15750 (= res!74305 (valid!686 thiss!1248))))

(assert (=> start!15750 e!102859))

(declare-fun e!102860 () Bool)

(assert (=> start!15750 e!102860))

(assert (=> start!15750 true))

(declare-fun tp_is_empty!3219 () Bool)

(assert (=> start!15750 tp_is_empty!3219))

(declare-fun b!157181 () Bool)

(declare-fun e!102861 () Bool)

(assert (=> b!157181 (= e!102861 tp_is_empty!3219)))

(declare-fun b!157182 () Bool)

(declare-fun e!102863 () Bool)

(declare-fun mapRes!5471 () Bool)

(assert (=> b!157182 (= e!102863 (and e!102861 mapRes!5471))))

(declare-fun condMapEmpty!5471 () Bool)

(declare-fun mapDefault!5471 () ValueCell!1266)

(assert (=> b!157182 (= condMapEmpty!5471 (= (arr!2604 (_values!3145 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1266)) mapDefault!5471)))))

(declare-fun b!157183 () Bool)

(declare-fun res!74304 () Bool)

(assert (=> b!157183 (=> (not res!74304) (not e!102859))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157183 (= res!74304 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157184 () Bool)

(declare-fun e!102858 () Bool)

(assert (=> b!157184 (= e!102858 true)))

(declare-fun lt!81677 () Bool)

(declare-fun lt!81678 () LongMapFixedSize!1440)

(declare-datatypes ((tuple2!2868 0))(
  ( (tuple2!2869 (_1!1445 (_ BitVec 64)) (_2!1445 V!3939)) )
))
(declare-datatypes ((List!1876 0))(
  ( (Nil!1873) (Cons!1872 (h!2481 tuple2!2868) (t!6678 List!1876)) )
))
(declare-datatypes ((ListLongMap!1855 0))(
  ( (ListLongMap!1856 (toList!943 List!1876)) )
))
(declare-fun contains!976 (ListLongMap!1855 (_ BitVec 64)) Bool)

(declare-fun map!1573 (LongMapFixedSize!1440) ListLongMap!1855)

(assert (=> b!157184 (= lt!81677 (contains!976 (map!1573 lt!81678) key!828))))

(declare-fun b!157185 () Bool)

(declare-fun e!102862 () Bool)

(assert (=> b!157185 (= e!102862 tp_is_empty!3219)))

(declare-fun array_inv!1649 (array!5491) Bool)

(declare-fun array_inv!1650 (array!5493) Bool)

(assert (=> b!157186 (= e!102860 (and tp!12776 tp_is_empty!3219 (array_inv!1649 (_keys!4937 thiss!1248)) (array_inv!1650 (_values!3145 thiss!1248)) e!102863))))

(declare-fun mapNonEmpty!5471 () Bool)

(declare-fun tp!12775 () Bool)

(assert (=> mapNonEmpty!5471 (= mapRes!5471 (and tp!12775 e!102862))))

(declare-fun mapKey!5471 () (_ BitVec 32))

(declare-fun mapValue!5471 () ValueCell!1266)

(declare-fun mapRest!5471 () (Array (_ BitVec 32) ValueCell!1266))

(assert (=> mapNonEmpty!5471 (= (arr!2604 (_values!3145 thiss!1248)) (store mapRest!5471 mapKey!5471 mapValue!5471))))

(declare-fun mapIsEmpty!5471 () Bool)

(assert (=> mapIsEmpty!5471 mapRes!5471))

(declare-fun b!157187 () Bool)

(assert (=> b!157187 (= e!102859 (not e!102858))))

(declare-fun res!74303 () Bool)

(assert (=> b!157187 (=> res!74303 e!102858)))

(assert (=> b!157187 (= res!74303 (not (valid!686 lt!81678)))))

(declare-fun v!309 () V!3939)

(assert (=> b!157187 (= lt!81678 (LongMapFixedSize!1441 (defaultEntry!3162 thiss!1248) (mask!7633 thiss!1248) (bvor (extraKeys!2903 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3005 thiss!1248) v!309 (_size!769 thiss!1248) (_keys!4937 thiss!1248) (_values!3145 thiss!1248) (_vacant!769 thiss!1248)))))

(declare-fun +!211 (ListLongMap!1855 tuple2!2868) ListLongMap!1855)

(declare-fun getCurrentListMap!607 (array!5491 array!5493 (_ BitVec 32) (_ BitVec 32) V!3939 V!3939 (_ BitVec 32) Int) ListLongMap!1855)

(assert (=> b!157187 (= (+!211 (getCurrentListMap!607 (_keys!4937 thiss!1248) (_values!3145 thiss!1248) (mask!7633 thiss!1248) (extraKeys!2903 thiss!1248) (zeroValue!3005 thiss!1248) (minValue!3005 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3162 thiss!1248)) (tuple2!2869 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!607 (_keys!4937 thiss!1248) (_values!3145 thiss!1248) (mask!7633 thiss!1248) (bvor (extraKeys!2903 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3005 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3162 thiss!1248)))))

(declare-datatypes ((Unit!4966 0))(
  ( (Unit!4967) )
))
(declare-fun lt!81679 () Unit!4966)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!79 (array!5491 array!5493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3939 V!3939 V!3939 Int) Unit!4966)

(assert (=> b!157187 (= lt!81679 (lemmaChangeLongMinValueKeyThenAddPairToListMap!79 (_keys!4937 thiss!1248) (_values!3145 thiss!1248) (mask!7633 thiss!1248) (extraKeys!2903 thiss!1248) (bvor (extraKeys!2903 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3005 thiss!1248) (minValue!3005 thiss!1248) v!309 (defaultEntry!3162 thiss!1248)))))

(assert (= (and start!15750 res!74305) b!157183))

(assert (= (and b!157183 res!74304) b!157187))

(assert (= (and b!157187 (not res!74303)) b!157184))

(assert (= (and b!157182 condMapEmpty!5471) mapIsEmpty!5471))

(assert (= (and b!157182 (not condMapEmpty!5471)) mapNonEmpty!5471))

(get-info :version)

(assert (= (and mapNonEmpty!5471 ((_ is ValueCellFull!1266) mapValue!5471)) b!157185))

(assert (= (and b!157182 ((_ is ValueCellFull!1266) mapDefault!5471)) b!157181))

(assert (= b!157186 b!157182))

(assert (= start!15750 b!157186))

(declare-fun m!190459 () Bool)

(assert (=> start!15750 m!190459))

(declare-fun m!190461 () Bool)

(assert (=> b!157186 m!190461))

(declare-fun m!190463 () Bool)

(assert (=> b!157186 m!190463))

(declare-fun m!190465 () Bool)

(assert (=> b!157184 m!190465))

(assert (=> b!157184 m!190465))

(declare-fun m!190467 () Bool)

(assert (=> b!157184 m!190467))

(declare-fun m!190469 () Bool)

(assert (=> mapNonEmpty!5471 m!190469))

(declare-fun m!190471 () Bool)

(assert (=> b!157187 m!190471))

(declare-fun m!190473 () Bool)

(assert (=> b!157187 m!190473))

(declare-fun m!190475 () Bool)

(assert (=> b!157187 m!190475))

(declare-fun m!190477 () Bool)

(assert (=> b!157187 m!190477))

(assert (=> b!157187 m!190471))

(declare-fun m!190479 () Bool)

(assert (=> b!157187 m!190479))

(check-sat b_and!9831 (not mapNonEmpty!5471) (not b_next!3417) (not b!157186) (not start!15750) (not b!157184) (not b!157187) tp_is_empty!3219)
(check-sat b_and!9831 (not b_next!3417))
