; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15752 () Bool)

(assert start!15752)

(declare-fun b!157014 () Bool)

(declare-fun b_free!3415 () Bool)

(declare-fun b_next!3415 () Bool)

(assert (=> b!157014 (= b_free!3415 (not b_next!3415))))

(declare-fun tp!12770 () Bool)

(declare-fun b_and!9803 () Bool)

(assert (=> b!157014 (= tp!12770 b_and!9803)))

(declare-fun res!74199 () Bool)

(declare-fun e!102736 () Bool)

(assert (=> start!15752 (=> (not res!74199) (not e!102736))))

(declare-datatypes ((V!3937 0))(
  ( (V!3938 (val!1653 Int)) )
))
(declare-datatypes ((ValueCell!1265 0))(
  ( (ValueCellFull!1265 (v!3512 V!3937)) (EmptyCell!1265) )
))
(declare-datatypes ((array!5467 0))(
  ( (array!5468 (arr!2590 (Array (_ BitVec 32) (_ BitVec 64))) (size!2869 (_ BitVec 32))) )
))
(declare-datatypes ((array!5469 0))(
  ( (array!5470 (arr!2591 (Array (_ BitVec 32) ValueCell!1265)) (size!2870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1438 0))(
  ( (LongMapFixedSize!1439 (defaultEntry!3161 Int) (mask!7631 (_ BitVec 32)) (extraKeys!2902 (_ BitVec 32)) (zeroValue!3004 V!3937) (minValue!3004 V!3937) (_size!768 (_ BitVec 32)) (_keys!4935 array!5467) (_values!3144 array!5469) (_vacant!768 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1438)

(declare-fun valid!691 (LongMapFixedSize!1438) Bool)

(assert (=> start!15752 (= res!74199 (valid!691 thiss!1248))))

(assert (=> start!15752 e!102736))

(declare-fun e!102742 () Bool)

(assert (=> start!15752 e!102742))

(assert (=> start!15752 true))

(declare-fun tp_is_empty!3217 () Bool)

(assert (=> start!15752 tp_is_empty!3217))

(declare-fun b!157013 () Bool)

(declare-fun e!102739 () Bool)

(assert (=> b!157013 (= e!102736 (not e!102739))))

(declare-fun res!74201 () Bool)

(assert (=> b!157013 (=> res!74201 e!102739)))

(declare-fun lt!81487 () LongMapFixedSize!1438)

(assert (=> b!157013 (= res!74201 (not (valid!691 lt!81487)))))

(declare-fun v!309 () V!3937)

(assert (=> b!157013 (= lt!81487 (LongMapFixedSize!1439 (defaultEntry!3161 thiss!1248) (mask!7631 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 (_size!768 thiss!1248) (_keys!4935 thiss!1248) (_values!3144 thiss!1248) (_vacant!768 thiss!1248)))))

(declare-datatypes ((tuple2!2834 0))(
  ( (tuple2!2835 (_1!1428 (_ BitVec 64)) (_2!1428 V!3937)) )
))
(declare-datatypes ((List!1874 0))(
  ( (Nil!1871) (Cons!1870 (h!2479 tuple2!2834) (t!6667 List!1874)) )
))
(declare-datatypes ((ListLongMap!1821 0))(
  ( (ListLongMap!1822 (toList!926 List!1874)) )
))
(declare-fun +!195 (ListLongMap!1821 tuple2!2834) ListLongMap!1821)

(declare-fun getCurrentListMap!576 (array!5467 array!5469 (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 (_ BitVec 32) Int) ListLongMap!1821)

(assert (=> b!157013 (= (+!195 (getCurrentListMap!576 (_keys!4935 thiss!1248) (_values!3144 thiss!1248) (mask!7631 thiss!1248) (extraKeys!2902 thiss!1248) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)) (tuple2!2835 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!576 (_keys!4935 thiss!1248) (_values!3144 thiss!1248) (mask!7631 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3161 thiss!1248)))))

(declare-datatypes ((Unit!4944 0))(
  ( (Unit!4945) )
))
(declare-fun lt!81488 () Unit!4944)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (array!5467 array!5469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3937 V!3937 V!3937 Int) Unit!4944)

(assert (=> b!157013 (= lt!81488 (lemmaChangeLongMinValueKeyThenAddPairToListMap!76 (_keys!4935 thiss!1248) (_values!3144 thiss!1248) (mask!7631 thiss!1248) (extraKeys!2902 thiss!1248) (bvor (extraKeys!2902 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3004 thiss!1248) (minValue!3004 thiss!1248) v!309 (defaultEntry!3161 thiss!1248)))))

(declare-fun e!102737 () Bool)

(declare-fun array_inv!1667 (array!5467) Bool)

(declare-fun array_inv!1668 (array!5469) Bool)

(assert (=> b!157014 (= e!102742 (and tp!12770 tp_is_empty!3217 (array_inv!1667 (_keys!4935 thiss!1248)) (array_inv!1668 (_values!3144 thiss!1248)) e!102737))))

(declare-fun mapIsEmpty!5468 () Bool)

(declare-fun mapRes!5468 () Bool)

(assert (=> mapIsEmpty!5468 mapRes!5468))

(declare-fun b!157015 () Bool)

(declare-fun e!102738 () Bool)

(assert (=> b!157015 (= e!102738 tp_is_empty!3217)))

(declare-fun b!157016 () Bool)

(assert (=> b!157016 (= e!102737 (and e!102738 mapRes!5468))))

(declare-fun condMapEmpty!5468 () Bool)

(declare-fun mapDefault!5468 () ValueCell!1265)

(assert (=> b!157016 (= condMapEmpty!5468 (= (arr!2591 (_values!3144 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1265)) mapDefault!5468)))))

(declare-fun mapNonEmpty!5468 () Bool)

(declare-fun tp!12769 () Bool)

(declare-fun e!102741 () Bool)

(assert (=> mapNonEmpty!5468 (= mapRes!5468 (and tp!12769 e!102741))))

(declare-fun mapValue!5468 () ValueCell!1265)

(declare-fun mapKey!5468 () (_ BitVec 32))

(declare-fun mapRest!5468 () (Array (_ BitVec 32) ValueCell!1265))

(assert (=> mapNonEmpty!5468 (= (arr!2591 (_values!3144 thiss!1248)) (store mapRest!5468 mapKey!5468 mapValue!5468))))

(declare-fun b!157017 () Bool)

(assert (=> b!157017 (= e!102741 tp_is_empty!3217)))

(declare-fun b!157018 () Bool)

(declare-fun res!74200 () Bool)

(assert (=> b!157018 (=> (not res!74200) (not e!102736))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157018 (= res!74200 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157019 () Bool)

(assert (=> b!157019 (= e!102739 true)))

(declare-fun lt!81489 () Bool)

(declare-fun contains!961 (ListLongMap!1821 (_ BitVec 64)) Bool)

(declare-fun map!1557 (LongMapFixedSize!1438) ListLongMap!1821)

(assert (=> b!157019 (= lt!81489 (contains!961 (map!1557 lt!81487) key!828))))

(assert (= (and start!15752 res!74199) b!157018))

(assert (= (and b!157018 res!74200) b!157013))

(assert (= (and b!157013 (not res!74201)) b!157019))

(assert (= (and b!157016 condMapEmpty!5468) mapIsEmpty!5468))

(assert (= (and b!157016 (not condMapEmpty!5468)) mapNonEmpty!5468))

(get-info :version)

(assert (= (and mapNonEmpty!5468 ((_ is ValueCellFull!1265) mapValue!5468)) b!157017))

(assert (= (and b!157016 ((_ is ValueCellFull!1265) mapDefault!5468)) b!157015))

(assert (= b!157014 b!157016))

(assert (= start!15752 b!157014))

(declare-fun m!189817 () Bool)

(assert (=> b!157019 m!189817))

(assert (=> b!157019 m!189817))

(declare-fun m!189819 () Bool)

(assert (=> b!157019 m!189819))

(declare-fun m!189821 () Bool)

(assert (=> b!157014 m!189821))

(declare-fun m!189823 () Bool)

(assert (=> b!157014 m!189823))

(declare-fun m!189825 () Bool)

(assert (=> mapNonEmpty!5468 m!189825))

(declare-fun m!189827 () Bool)

(assert (=> start!15752 m!189827))

(declare-fun m!189829 () Bool)

(assert (=> b!157013 m!189829))

(declare-fun m!189831 () Bool)

(assert (=> b!157013 m!189831))

(declare-fun m!189833 () Bool)

(assert (=> b!157013 m!189833))

(declare-fun m!189835 () Bool)

(assert (=> b!157013 m!189835))

(assert (=> b!157013 m!189829))

(declare-fun m!189837 () Bool)

(assert (=> b!157013 m!189837))

(check-sat b_and!9803 (not start!15752) (not b!157013) tp_is_empty!3217 (not mapNonEmpty!5468) (not b!157014) (not b_next!3415) (not b!157019))
(check-sat b_and!9803 (not b_next!3415))
