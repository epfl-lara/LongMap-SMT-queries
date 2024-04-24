; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15746 () Bool)

(assert start!15746)

(declare-fun b!157147 () Bool)

(declare-fun b_free!3409 () Bool)

(declare-fun b_next!3409 () Bool)

(assert (=> b!157147 (= b_free!3409 (not b_next!3409))))

(declare-fun tp!12751 () Bool)

(declare-fun b_and!9837 () Bool)

(assert (=> b!157147 (= tp!12751 b_and!9837)))

(declare-fun b!157144 () Bool)

(declare-fun e!102802 () Bool)

(declare-fun e!102798 () Bool)

(assert (=> b!157144 (= e!102802 (not e!102798))))

(declare-fun res!74289 () Bool)

(assert (=> b!157144 (=> res!74289 e!102798)))

(declare-datatypes ((V!3929 0))(
  ( (V!3930 (val!1650 Int)) )
))
(declare-datatypes ((ValueCell!1262 0))(
  ( (ValueCellFull!1262 (v!3516 V!3929)) (EmptyCell!1262) )
))
(declare-datatypes ((array!5461 0))(
  ( (array!5462 (arr!2588 (Array (_ BitVec 32) (_ BitVec 64))) (size!2866 (_ BitVec 32))) )
))
(declare-datatypes ((array!5463 0))(
  ( (array!5464 (arr!2589 (Array (_ BitVec 32) ValueCell!1262)) (size!2867 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1432 0))(
  ( (LongMapFixedSize!1433 (defaultEntry!3158 Int) (mask!7627 (_ BitVec 32)) (extraKeys!2899 (_ BitVec 32)) (zeroValue!3001 V!3929) (minValue!3001 V!3929) (_size!765 (_ BitVec 32)) (_keys!4933 array!5461) (_values!3141 array!5463) (_vacant!765 (_ BitVec 32))) )
))
(declare-fun lt!81702 () LongMapFixedSize!1432)

(declare-fun valid!701 (LongMapFixedSize!1432) Bool)

(assert (=> b!157144 (= res!74289 (not (valid!701 lt!81702)))))

(declare-fun thiss!1248 () LongMapFixedSize!1432)

(declare-fun v!309 () V!3929)

(assert (=> b!157144 (= lt!81702 (LongMapFixedSize!1433 (defaultEntry!3158 thiss!1248) (mask!7627 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 (_size!765 thiss!1248) (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (_vacant!765 thiss!1248)))))

(declare-datatypes ((tuple2!2796 0))(
  ( (tuple2!2797 (_1!1409 (_ BitVec 64)) (_2!1409 V!3929)) )
))
(declare-datatypes ((List!1857 0))(
  ( (Nil!1854) (Cons!1853 (h!2462 tuple2!2796) (t!6651 List!1857)) )
))
(declare-datatypes ((ListLongMap!1795 0))(
  ( (ListLongMap!1796 (toList!913 List!1857)) )
))
(declare-fun +!205 (ListLongMap!1795 tuple2!2796) ListLongMap!1795)

(declare-fun getCurrentListMap!580 (array!5461 array!5463 (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 (_ BitVec 32) Int) ListLongMap!1795)

(assert (=> b!157144 (= (+!205 (getCurrentListMap!580 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (extraKeys!2899 thiss!1248) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)) (tuple2!2797 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!580 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)))))

(declare-datatypes ((Unit!4965 0))(
  ( (Unit!4966) )
))
(declare-fun lt!81701 () Unit!4965)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (array!5461 array!5463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 V!3929 Int) Unit!4965)

(assert (=> b!157144 (= lt!81701 (lemmaChangeLongMinValueKeyThenAddPairToListMap!74 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (extraKeys!2899 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) v!309 (defaultEntry!3158 thiss!1248)))))

(declare-fun b!157145 () Bool)

(declare-fun res!74290 () Bool)

(assert (=> b!157145 (=> (not res!74290) (not e!102802))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157145 (= res!74290 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157146 () Bool)

(declare-fun e!102800 () Bool)

(declare-fun e!102799 () Bool)

(declare-fun mapRes!5459 () Bool)

(assert (=> b!157146 (= e!102800 (and e!102799 mapRes!5459))))

(declare-fun condMapEmpty!5459 () Bool)

(declare-fun mapDefault!5459 () ValueCell!1262)

(assert (=> b!157146 (= condMapEmpty!5459 (= (arr!2589 (_values!3141 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1262)) mapDefault!5459)))))

(declare-fun e!102804 () Bool)

(declare-fun tp_is_empty!3211 () Bool)

(declare-fun array_inv!1643 (array!5461) Bool)

(declare-fun array_inv!1644 (array!5463) Bool)

(assert (=> b!157147 (= e!102804 (and tp!12751 tp_is_empty!3211 (array_inv!1643 (_keys!4933 thiss!1248)) (array_inv!1644 (_values!3141 thiss!1248)) e!102800))))

(declare-fun mapIsEmpty!5459 () Bool)

(assert (=> mapIsEmpty!5459 mapRes!5459))

(declare-fun b!157148 () Bool)

(assert (=> b!157148 (= e!102798 true)))

(declare-fun lt!81700 () Bool)

(declare-fun contains!956 (ListLongMap!1795 (_ BitVec 64)) Bool)

(declare-fun map!1565 (LongMapFixedSize!1432) ListLongMap!1795)

(assert (=> b!157148 (= lt!81700 (contains!956 (map!1565 lt!81702) key!828))))

(declare-fun res!74288 () Bool)

(assert (=> start!15746 (=> (not res!74288) (not e!102802))))

(assert (=> start!15746 (= res!74288 (valid!701 thiss!1248))))

(assert (=> start!15746 e!102802))

(assert (=> start!15746 e!102804))

(assert (=> start!15746 true))

(assert (=> start!15746 tp_is_empty!3211))

(declare-fun b!157149 () Bool)

(assert (=> b!157149 (= e!102799 tp_is_empty!3211)))

(declare-fun b!157150 () Bool)

(declare-fun e!102803 () Bool)

(assert (=> b!157150 (= e!102803 tp_is_empty!3211)))

(declare-fun mapNonEmpty!5459 () Bool)

(declare-fun tp!12752 () Bool)

(assert (=> mapNonEmpty!5459 (= mapRes!5459 (and tp!12752 e!102803))))

(declare-fun mapValue!5459 () ValueCell!1262)

(declare-fun mapRest!5459 () (Array (_ BitVec 32) ValueCell!1262))

(declare-fun mapKey!5459 () (_ BitVec 32))

(assert (=> mapNonEmpty!5459 (= (arr!2589 (_values!3141 thiss!1248)) (store mapRest!5459 mapKey!5459 mapValue!5459))))

(assert (= (and start!15746 res!74288) b!157145))

(assert (= (and b!157145 res!74290) b!157144))

(assert (= (and b!157144 (not res!74289)) b!157148))

(assert (= (and b!157146 condMapEmpty!5459) mapIsEmpty!5459))

(assert (= (and b!157146 (not condMapEmpty!5459)) mapNonEmpty!5459))

(get-info :version)

(assert (= (and mapNonEmpty!5459 ((_ is ValueCellFull!1262) mapValue!5459)) b!157150))

(assert (= (and b!157146 ((_ is ValueCellFull!1262) mapDefault!5459)) b!157149))

(assert (= b!157147 b!157146))

(assert (= start!15746 b!157147))

(declare-fun m!190553 () Bool)

(assert (=> b!157147 m!190553))

(declare-fun m!190555 () Bool)

(assert (=> b!157147 m!190555))

(declare-fun m!190557 () Bool)

(assert (=> b!157148 m!190557))

(assert (=> b!157148 m!190557))

(declare-fun m!190559 () Bool)

(assert (=> b!157148 m!190559))

(declare-fun m!190561 () Bool)

(assert (=> start!15746 m!190561))

(declare-fun m!190563 () Bool)

(assert (=> b!157144 m!190563))

(declare-fun m!190565 () Bool)

(assert (=> b!157144 m!190565))

(declare-fun m!190567 () Bool)

(assert (=> b!157144 m!190567))

(declare-fun m!190569 () Bool)

(assert (=> b!157144 m!190569))

(assert (=> b!157144 m!190563))

(declare-fun m!190571 () Bool)

(assert (=> b!157144 m!190571))

(declare-fun m!190573 () Bool)

(assert (=> mapNonEmpty!5459 m!190573))

(check-sat (not b!157148) tp_is_empty!3211 (not b!157147) (not start!15746) b_and!9837 (not b!157144) (not b_next!3409) (not mapNonEmpty!5459))
(check-sat b_and!9837 (not b_next!3409))
