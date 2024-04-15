; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15650 () Bool)

(assert start!15650)

(declare-fun b!155756 () Bool)

(declare-fun b_free!3313 () Bool)

(declare-fun b_next!3313 () Bool)

(assert (=> b!155756 (= b_free!3313 (not b_next!3313))))

(declare-fun tp!12463 () Bool)

(declare-fun b_and!9701 () Bool)

(assert (=> b!155756 (= tp!12463 b_and!9701)))

(declare-fun mapNonEmpty!5315 () Bool)

(declare-fun mapRes!5315 () Bool)

(declare-fun tp!12464 () Bool)

(declare-fun e!101806 () Bool)

(assert (=> mapNonEmpty!5315 (= mapRes!5315 (and tp!12464 e!101806))))

(declare-fun mapKey!5315 () (_ BitVec 32))

(declare-datatypes ((V!3801 0))(
  ( (V!3802 (val!1602 Int)) )
))
(declare-datatypes ((ValueCell!1214 0))(
  ( (ValueCellFull!1214 (v!3461 V!3801)) (EmptyCell!1214) )
))
(declare-datatypes ((array!5263 0))(
  ( (array!5264 (arr!2488 (Array (_ BitVec 32) (_ BitVec 64))) (size!2767 (_ BitVec 32))) )
))
(declare-datatypes ((array!5265 0))(
  ( (array!5266 (arr!2489 (Array (_ BitVec 32) ValueCell!1214)) (size!2768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1336 0))(
  ( (LongMapFixedSize!1337 (defaultEntry!3110 Int) (mask!7546 (_ BitVec 32)) (extraKeys!2851 (_ BitVec 32)) (zeroValue!2953 V!3801) (minValue!2953 V!3801) (_size!717 (_ BitVec 32)) (_keys!4884 array!5263) (_values!3093 array!5265) (_vacant!717 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1336)

(declare-fun mapValue!5315 () ValueCell!1214)

(declare-fun mapRest!5315 () (Array (_ BitVec 32) ValueCell!1214))

(assert (=> mapNonEmpty!5315 (= (arr!2489 (_values!3093 thiss!1248)) (store mapRest!5315 mapKey!5315 mapValue!5315))))

(declare-fun mapIsEmpty!5315 () Bool)

(assert (=> mapIsEmpty!5315 mapRes!5315))

(declare-fun res!73553 () Bool)

(declare-fun e!101800 () Bool)

(assert (=> start!15650 (=> (not res!73553) (not e!101800))))

(declare-fun valid!654 (LongMapFixedSize!1336) Bool)

(assert (=> start!15650 (= res!73553 (valid!654 thiss!1248))))

(assert (=> start!15650 e!101800))

(declare-fun e!101805 () Bool)

(assert (=> start!15650 e!101805))

(assert (=> start!15650 true))

(declare-fun tp_is_empty!3115 () Bool)

(assert (=> start!15650 tp_is_empty!3115))

(declare-fun b!155753 () Bool)

(declare-fun e!101804 () Bool)

(assert (=> b!155753 (= e!101804 true)))

(declare-fun lt!81271 () Bool)

(declare-fun lt!81272 () LongMapFixedSize!1336)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2814 0))(
  ( (tuple2!2815 (_1!1418 (_ BitVec 64)) (_2!1418 V!3801)) )
))
(declare-datatypes ((List!1838 0))(
  ( (Nil!1835) (Cons!1834 (h!2443 tuple2!2814) (t!6631 List!1838)) )
))
(declare-datatypes ((ListLongMap!1801 0))(
  ( (ListLongMap!1802 (toList!916 List!1838)) )
))
(declare-fun contains!958 (ListLongMap!1801 (_ BitVec 64)) Bool)

(declare-fun map!1520 (LongMapFixedSize!1336) ListLongMap!1801)

(assert (=> b!155753 (= lt!81271 (contains!958 (map!1520 lt!81272) key!828))))

(declare-fun b!155754 () Bool)

(declare-fun e!101802 () Bool)

(declare-fun e!101801 () Bool)

(assert (=> b!155754 (= e!101802 (and e!101801 mapRes!5315))))

(declare-fun condMapEmpty!5315 () Bool)

(declare-fun mapDefault!5315 () ValueCell!1214)

(assert (=> b!155754 (= condMapEmpty!5315 (= (arr!2489 (_values!3093 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1214)) mapDefault!5315)))))

(declare-fun b!155755 () Bool)

(declare-fun res!73552 () Bool)

(assert (=> b!155755 (=> (not res!73552) (not e!101800))))

(assert (=> b!155755 (= res!73552 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!1599 (array!5263) Bool)

(declare-fun array_inv!1600 (array!5265) Bool)

(assert (=> b!155756 (= e!101805 (and tp!12463 tp_is_empty!3115 (array_inv!1599 (_keys!4884 thiss!1248)) (array_inv!1600 (_values!3093 thiss!1248)) e!101802))))

(declare-fun b!155757 () Bool)

(assert (=> b!155757 (= e!101800 (not e!101804))))

(declare-fun res!73551 () Bool)

(assert (=> b!155757 (=> res!73551 e!101804)))

(assert (=> b!155757 (= res!73551 (not (valid!654 lt!81272)))))

(declare-fun v!309 () V!3801)

(assert (=> b!155757 (= lt!81272 (LongMapFixedSize!1337 (defaultEntry!3110 thiss!1248) (mask!7546 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2953 thiss!1248) (_size!717 thiss!1248) (_keys!4884 thiss!1248) (_values!3093 thiss!1248) (_vacant!717 thiss!1248)))))

(declare-fun +!185 (ListLongMap!1801 tuple2!2814) ListLongMap!1801)

(declare-fun getCurrentListMap!566 (array!5263 array!5265 (_ BitVec 32) (_ BitVec 32) V!3801 V!3801 (_ BitVec 32) Int) ListLongMap!1801)

(assert (=> b!155757 (= (+!185 (getCurrentListMap!566 (_keys!4884 thiss!1248) (_values!3093 thiss!1248) (mask!7546 thiss!1248) (extraKeys!2851 thiss!1248) (zeroValue!2953 thiss!1248) (minValue!2953 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3110 thiss!1248)) (tuple2!2815 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!566 (_keys!4884 thiss!1248) (_values!3093 thiss!1248) (mask!7546 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2953 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3110 thiss!1248)))))

(declare-datatypes ((Unit!4924 0))(
  ( (Unit!4925) )
))
(declare-fun lt!81273 () Unit!4924)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!75 (array!5263 array!5265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3801 V!3801 V!3801 Int) Unit!4924)

(assert (=> b!155757 (= lt!81273 (lemmaChangeZeroKeyThenAddPairToListMap!75 (_keys!4884 thiss!1248) (_values!3093 thiss!1248) (mask!7546 thiss!1248) (extraKeys!2851 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2953 thiss!1248) v!309 (minValue!2953 thiss!1248) (defaultEntry!3110 thiss!1248)))))

(declare-fun b!155758 () Bool)

(assert (=> b!155758 (= e!101801 tp_is_empty!3115)))

(declare-fun b!155759 () Bool)

(assert (=> b!155759 (= e!101806 tp_is_empty!3115)))

(assert (= (and start!15650 res!73553) b!155755))

(assert (= (and b!155755 res!73552) b!155757))

(assert (= (and b!155757 (not res!73551)) b!155753))

(assert (= (and b!155754 condMapEmpty!5315) mapIsEmpty!5315))

(assert (= (and b!155754 (not condMapEmpty!5315)) mapNonEmpty!5315))

(get-info :version)

(assert (= (and mapNonEmpty!5315 ((_ is ValueCellFull!1214) mapValue!5315)) b!155759))

(assert (= (and b!155754 ((_ is ValueCellFull!1214) mapDefault!5315)) b!155758))

(assert (= b!155756 b!155754))

(assert (= start!15650 b!155756))

(declare-fun m!189019 () Bool)

(assert (=> b!155753 m!189019))

(assert (=> b!155753 m!189019))

(declare-fun m!189021 () Bool)

(assert (=> b!155753 m!189021))

(declare-fun m!189023 () Bool)

(assert (=> b!155757 m!189023))

(declare-fun m!189025 () Bool)

(assert (=> b!155757 m!189025))

(declare-fun m!189027 () Bool)

(assert (=> b!155757 m!189027))

(declare-fun m!189029 () Bool)

(assert (=> b!155757 m!189029))

(declare-fun m!189031 () Bool)

(assert (=> b!155757 m!189031))

(assert (=> b!155757 m!189027))

(declare-fun m!189033 () Bool)

(assert (=> mapNonEmpty!5315 m!189033))

(declare-fun m!189035 () Bool)

(assert (=> b!155756 m!189035))

(declare-fun m!189037 () Bool)

(assert (=> b!155756 m!189037))

(declare-fun m!189039 () Bool)

(assert (=> start!15650 m!189039))

(check-sat (not start!15650) b_and!9701 (not b!155753) (not b!155756) (not b!155757) tp_is_empty!3115 (not mapNonEmpty!5315) (not b_next!3313))
(check-sat b_and!9701 (not b_next!3313))
