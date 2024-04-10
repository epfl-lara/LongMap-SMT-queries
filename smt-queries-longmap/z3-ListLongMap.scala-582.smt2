; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15636 () Bool)

(assert start!15636)

(declare-fun b!155803 () Bool)

(declare-fun b_free!3303 () Bool)

(declare-fun b_next!3303 () Bool)

(assert (=> b!155803 (= b_free!3303 (not b_next!3303))))

(declare-fun tp!12433 () Bool)

(declare-fun b_and!9717 () Bool)

(assert (=> b!155803 (= tp!12433 b_and!9717)))

(declare-fun mapIsEmpty!5300 () Bool)

(declare-fun mapRes!5300 () Bool)

(assert (=> mapIsEmpty!5300 mapRes!5300))

(declare-fun res!73606 () Bool)

(declare-fun e!101804 () Bool)

(assert (=> start!15636 (=> (not res!73606) (not e!101804))))

(declare-datatypes ((V!3787 0))(
  ( (V!3788 (val!1597 Int)) )
))
(declare-datatypes ((ValueCell!1209 0))(
  ( (ValueCellFull!1209 (v!3462 V!3787)) (EmptyCell!1209) )
))
(declare-datatypes ((array!5263 0))(
  ( (array!5264 (arr!2489 (Array (_ BitVec 32) (_ BitVec 64))) (size!2767 (_ BitVec 32))) )
))
(declare-datatypes ((array!5265 0))(
  ( (array!5266 (arr!2490 (Array (_ BitVec 32) ValueCell!1209)) (size!2768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1326 0))(
  ( (LongMapFixedSize!1327 (defaultEntry!3105 Int) (mask!7538 (_ BitVec 32)) (extraKeys!2846 (_ BitVec 32)) (zeroValue!2948 V!3787) (minValue!2948 V!3787) (_size!712 (_ BitVec 32)) (_keys!4880 array!5263) (_values!3088 array!5265) (_vacant!712 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1326)

(declare-fun valid!648 (LongMapFixedSize!1326) Bool)

(assert (=> start!15636 (= res!73606 (valid!648 thiss!1248))))

(assert (=> start!15636 e!101804))

(declare-fun e!101800 () Bool)

(assert (=> start!15636 e!101800))

(assert (=> start!15636 true))

(declare-fun tp_is_empty!3105 () Bool)

(assert (=> start!15636 tp_is_empty!3105))

(declare-fun b!155799 () Bool)

(declare-fun e!101805 () Bool)

(assert (=> b!155799 (= e!101805 tp_is_empty!3105)))

(declare-fun b!155800 () Bool)

(declare-fun e!101802 () Bool)

(declare-fun e!101801 () Bool)

(assert (=> b!155800 (= e!101802 (and e!101801 mapRes!5300))))

(declare-fun condMapEmpty!5300 () Bool)

(declare-fun mapDefault!5300 () ValueCell!1209)

(assert (=> b!155800 (= condMapEmpty!5300 (= (arr!2490 (_values!3088 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1209)) mapDefault!5300)))))

(declare-fun mapNonEmpty!5300 () Bool)

(declare-fun tp!12434 () Bool)

(assert (=> mapNonEmpty!5300 (= mapRes!5300 (and tp!12434 e!101805))))

(declare-fun mapKey!5300 () (_ BitVec 32))

(declare-fun mapValue!5300 () ValueCell!1209)

(declare-fun mapRest!5300 () (Array (_ BitVec 32) ValueCell!1209))

(assert (=> mapNonEmpty!5300 (= (arr!2490 (_values!3088 thiss!1248)) (store mapRest!5300 mapKey!5300 mapValue!5300))))

(declare-fun b!155801 () Bool)

(declare-fun res!73605 () Bool)

(assert (=> b!155801 (=> (not res!73605) (not e!101804))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155801 (= res!73605 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155802 () Bool)

(assert (=> b!155802 (= e!101804 (not true))))

(declare-fun lt!81412 () Bool)

(declare-fun v!309 () V!3787)

(assert (=> b!155802 (= lt!81412 (valid!648 (LongMapFixedSize!1327 (defaultEntry!3105 thiss!1248) (mask!7538 thiss!1248) (bvor (extraKeys!2846 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2948 thiss!1248) (_size!712 thiss!1248) (_keys!4880 thiss!1248) (_values!3088 thiss!1248) (_vacant!712 thiss!1248))))))

(declare-datatypes ((tuple2!2834 0))(
  ( (tuple2!2835 (_1!1428 (_ BitVec 64)) (_2!1428 V!3787)) )
))
(declare-datatypes ((List!1835 0))(
  ( (Nil!1832) (Cons!1831 (h!2440 tuple2!2834) (t!6637 List!1835)) )
))
(declare-datatypes ((ListLongMap!1821 0))(
  ( (ListLongMap!1822 (toList!926 List!1835)) )
))
(declare-fun +!194 (ListLongMap!1821 tuple2!2834) ListLongMap!1821)

(declare-fun getCurrentListMap!590 (array!5263 array!5265 (_ BitVec 32) (_ BitVec 32) V!3787 V!3787 (_ BitVec 32) Int) ListLongMap!1821)

(assert (=> b!155802 (= (+!194 (getCurrentListMap!590 (_keys!4880 thiss!1248) (_values!3088 thiss!1248) (mask!7538 thiss!1248) (extraKeys!2846 thiss!1248) (zeroValue!2948 thiss!1248) (minValue!2948 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3105 thiss!1248)) (tuple2!2835 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!590 (_keys!4880 thiss!1248) (_values!3088 thiss!1248) (mask!7538 thiss!1248) (bvor (extraKeys!2846 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2948 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3105 thiss!1248)))))

(declare-datatypes ((Unit!4932 0))(
  ( (Unit!4933) )
))
(declare-fun lt!81411 () Unit!4932)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!73 (array!5263 array!5265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3787 V!3787 V!3787 Int) Unit!4932)

(assert (=> b!155802 (= lt!81411 (lemmaChangeZeroKeyThenAddPairToListMap!73 (_keys!4880 thiss!1248) (_values!3088 thiss!1248) (mask!7538 thiss!1248) (extraKeys!2846 thiss!1248) (bvor (extraKeys!2846 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2948 thiss!1248) v!309 (minValue!2948 thiss!1248) (defaultEntry!3105 thiss!1248)))))

(declare-fun array_inv!1571 (array!5263) Bool)

(declare-fun array_inv!1572 (array!5265) Bool)

(assert (=> b!155803 (= e!101800 (and tp!12433 tp_is_empty!3105 (array_inv!1571 (_keys!4880 thiss!1248)) (array_inv!1572 (_values!3088 thiss!1248)) e!101802))))

(declare-fun b!155804 () Bool)

(assert (=> b!155804 (= e!101801 tp_is_empty!3105)))

(assert (= (and start!15636 res!73606) b!155801))

(assert (= (and b!155801 res!73605) b!155802))

(assert (= (and b!155800 condMapEmpty!5300) mapIsEmpty!5300))

(assert (= (and b!155800 (not condMapEmpty!5300)) mapNonEmpty!5300))

(get-info :version)

(assert (= (and mapNonEmpty!5300 ((_ is ValueCellFull!1209) mapValue!5300)) b!155799))

(assert (= (and b!155800 ((_ is ValueCellFull!1209) mapDefault!5300)) b!155804))

(assert (= b!155803 b!155800))

(assert (= start!15636 b!155803))

(declare-fun m!189537 () Bool)

(assert (=> start!15636 m!189537))

(declare-fun m!189539 () Bool)

(assert (=> mapNonEmpty!5300 m!189539))

(declare-fun m!189541 () Bool)

(assert (=> b!155802 m!189541))

(declare-fun m!189543 () Bool)

(assert (=> b!155802 m!189543))

(assert (=> b!155802 m!189541))

(declare-fun m!189545 () Bool)

(assert (=> b!155802 m!189545))

(declare-fun m!189547 () Bool)

(assert (=> b!155802 m!189547))

(declare-fun m!189549 () Bool)

(assert (=> b!155802 m!189549))

(declare-fun m!189551 () Bool)

(assert (=> b!155803 m!189551))

(declare-fun m!189553 () Bool)

(assert (=> b!155803 m!189553))

(check-sat (not b!155803) tp_is_empty!3105 (not b!155802) b_and!9717 (not start!15636) (not mapNonEmpty!5300) (not b_next!3303))
(check-sat b_and!9717 (not b_next!3303))
