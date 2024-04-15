; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15746 () Bool)

(assert start!15746)

(declare-fun b!156950 () Bool)

(declare-fun b_free!3409 () Bool)

(declare-fun b_next!3409 () Bool)

(assert (=> b!156950 (= b_free!3409 (not b_next!3409))))

(declare-fun tp!12751 () Bool)

(declare-fun b_and!9797 () Bool)

(assert (=> b!156950 (= tp!12751 b_and!9797)))

(declare-fun e!102674 () Bool)

(declare-fun tp_is_empty!3211 () Bool)

(declare-fun e!102676 () Bool)

(declare-datatypes ((V!3929 0))(
  ( (V!3930 (val!1650 Int)) )
))
(declare-datatypes ((ValueCell!1262 0))(
  ( (ValueCellFull!1262 (v!3509 V!3929)) (EmptyCell!1262) )
))
(declare-datatypes ((array!5455 0))(
  ( (array!5456 (arr!2584 (Array (_ BitVec 32) (_ BitVec 64))) (size!2863 (_ BitVec 32))) )
))
(declare-datatypes ((array!5457 0))(
  ( (array!5458 (arr!2585 (Array (_ BitVec 32) ValueCell!1262)) (size!2864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1432 0))(
  ( (LongMapFixedSize!1433 (defaultEntry!3158 Int) (mask!7626 (_ BitVec 32)) (extraKeys!2899 (_ BitVec 32)) (zeroValue!3001 V!3929) (minValue!3001 V!3929) (_size!765 (_ BitVec 32)) (_keys!4932 array!5455) (_values!3141 array!5457) (_vacant!765 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1432)

(declare-fun array_inv!1665 (array!5455) Bool)

(declare-fun array_inv!1666 (array!5457) Bool)

(assert (=> b!156950 (= e!102676 (and tp!12751 tp_is_empty!3211 (array_inv!1665 (_keys!4932 thiss!1248)) (array_inv!1666 (_values!3141 thiss!1248)) e!102674))))

(declare-fun res!74172 () Bool)

(declare-fun e!102677 () Bool)

(assert (=> start!15746 (=> (not res!74172) (not e!102677))))

(declare-fun valid!689 (LongMapFixedSize!1432) Bool)

(assert (=> start!15746 (= res!74172 (valid!689 thiss!1248))))

(assert (=> start!15746 e!102677))

(assert (=> start!15746 e!102676))

(assert (=> start!15746 true))

(assert (=> start!15746 tp_is_empty!3211))

(declare-fun mapIsEmpty!5459 () Bool)

(declare-fun mapRes!5459 () Bool)

(assert (=> mapIsEmpty!5459 mapRes!5459))

(declare-fun b!156951 () Bool)

(declare-fun e!102678 () Bool)

(assert (=> b!156951 (= e!102677 (not e!102678))))

(declare-fun res!74174 () Bool)

(assert (=> b!156951 (=> res!74174 e!102678)))

(declare-fun lt!81460 () LongMapFixedSize!1432)

(assert (=> b!156951 (= res!74174 (not (valid!689 lt!81460)))))

(declare-fun v!309 () V!3929)

(assert (=> b!156951 (= lt!81460 (LongMapFixedSize!1433 (defaultEntry!3158 thiss!1248) (mask!7626 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 (_size!765 thiss!1248) (_keys!4932 thiss!1248) (_values!3141 thiss!1248) (_vacant!765 thiss!1248)))))

(declare-datatypes ((tuple2!2830 0))(
  ( (tuple2!2831 (_1!1426 (_ BitVec 64)) (_2!1426 V!3929)) )
))
(declare-datatypes ((List!1872 0))(
  ( (Nil!1869) (Cons!1868 (h!2477 tuple2!2830) (t!6665 List!1872)) )
))
(declare-datatypes ((ListLongMap!1817 0))(
  ( (ListLongMap!1818 (toList!924 List!1872)) )
))
(declare-fun +!193 (ListLongMap!1817 tuple2!2830) ListLongMap!1817)

(declare-fun getCurrentListMap!574 (array!5455 array!5457 (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 (_ BitVec 32) Int) ListLongMap!1817)

(assert (=> b!156951 (= (+!193 (getCurrentListMap!574 (_keys!4932 thiss!1248) (_values!3141 thiss!1248) (mask!7626 thiss!1248) (extraKeys!2899 thiss!1248) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!574 (_keys!4932 thiss!1248) (_values!3141 thiss!1248) (mask!7626 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)))))

(declare-datatypes ((Unit!4940 0))(
  ( (Unit!4941) )
))
(declare-fun lt!81462 () Unit!4940)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (array!5455 array!5457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 V!3929 Int) Unit!4940)

(assert (=> b!156951 (= lt!81462 (lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (_keys!4932 thiss!1248) (_values!3141 thiss!1248) (mask!7626 thiss!1248) (extraKeys!2899 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) v!309 (defaultEntry!3158 thiss!1248)))))

(declare-fun b!156952 () Bool)

(declare-fun res!74173 () Bool)

(assert (=> b!156952 (=> (not res!74173) (not e!102677))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156952 (= res!74173 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156953 () Bool)

(declare-fun e!102673 () Bool)

(assert (=> b!156953 (= e!102673 tp_is_empty!3211)))

(declare-fun b!156954 () Bool)

(declare-fun e!102675 () Bool)

(assert (=> b!156954 (= e!102674 (and e!102675 mapRes!5459))))

(declare-fun condMapEmpty!5459 () Bool)

(declare-fun mapDefault!5459 () ValueCell!1262)

(assert (=> b!156954 (= condMapEmpty!5459 (= (arr!2585 (_values!3141 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1262)) mapDefault!5459)))))

(declare-fun b!156955 () Bool)

(assert (=> b!156955 (= e!102678 true)))

(declare-fun lt!81461 () Bool)

(declare-fun contains!959 (ListLongMap!1817 (_ BitVec 64)) Bool)

(declare-fun map!1553 (LongMapFixedSize!1432) ListLongMap!1817)

(assert (=> b!156955 (= lt!81461 (contains!959 (map!1553 lt!81460) key!828))))

(declare-fun b!156956 () Bool)

(assert (=> b!156956 (= e!102675 tp_is_empty!3211)))

(declare-fun mapNonEmpty!5459 () Bool)

(declare-fun tp!12752 () Bool)

(assert (=> mapNonEmpty!5459 (= mapRes!5459 (and tp!12752 e!102673))))

(declare-fun mapValue!5459 () ValueCell!1262)

(declare-fun mapKey!5459 () (_ BitVec 32))

(declare-fun mapRest!5459 () (Array (_ BitVec 32) ValueCell!1262))

(assert (=> mapNonEmpty!5459 (= (arr!2585 (_values!3141 thiss!1248)) (store mapRest!5459 mapKey!5459 mapValue!5459))))

(assert (= (and start!15746 res!74172) b!156952))

(assert (= (and b!156952 res!74173) b!156951))

(assert (= (and b!156951 (not res!74174)) b!156955))

(assert (= (and b!156954 condMapEmpty!5459) mapIsEmpty!5459))

(assert (= (and b!156954 (not condMapEmpty!5459)) mapNonEmpty!5459))

(get-info :version)

(assert (= (and mapNonEmpty!5459 ((_ is ValueCellFull!1262) mapValue!5459)) b!156953))

(assert (= (and b!156954 ((_ is ValueCellFull!1262) mapDefault!5459)) b!156956))

(assert (= b!156950 b!156954))

(assert (= start!15746 b!156950))

(declare-fun m!189751 () Bool)

(assert (=> start!15746 m!189751))

(declare-fun m!189753 () Bool)

(assert (=> mapNonEmpty!5459 m!189753))

(declare-fun m!189755 () Bool)

(assert (=> b!156951 m!189755))

(declare-fun m!189757 () Bool)

(assert (=> b!156951 m!189757))

(declare-fun m!189759 () Bool)

(assert (=> b!156951 m!189759))

(declare-fun m!189761 () Bool)

(assert (=> b!156951 m!189761))

(declare-fun m!189763 () Bool)

(assert (=> b!156951 m!189763))

(assert (=> b!156951 m!189755))

(declare-fun m!189765 () Bool)

(assert (=> b!156950 m!189765))

(declare-fun m!189767 () Bool)

(assert (=> b!156950 m!189767))

(declare-fun m!189769 () Bool)

(assert (=> b!156955 m!189769))

(assert (=> b!156955 m!189769))

(declare-fun m!189771 () Bool)

(assert (=> b!156955 m!189771))

(check-sat (not b!156950) tp_is_empty!3211 (not b!156955) b_and!9797 (not mapNonEmpty!5459) (not b!156951) (not start!15746) (not b_next!3409))
(check-sat b_and!9797 (not b_next!3409))
