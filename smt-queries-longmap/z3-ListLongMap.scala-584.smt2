; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15650 () Bool)

(assert start!15650)

(declare-fun b!155952 () Bool)

(declare-fun b_free!3313 () Bool)

(declare-fun b_next!3313 () Bool)

(assert (=> b!155952 (= b_free!3313 (not b_next!3313))))

(declare-fun tp!12464 () Bool)

(declare-fun b_and!9741 () Bool)

(assert (=> b!155952 (= tp!12464 b_and!9741)))

(declare-fun b!155947 () Bool)

(declare-fun e!101927 () Bool)

(declare-fun e!101925 () Bool)

(declare-fun mapRes!5315 () Bool)

(assert (=> b!155947 (= e!101927 (and e!101925 mapRes!5315))))

(declare-fun condMapEmpty!5315 () Bool)

(declare-datatypes ((V!3801 0))(
  ( (V!3802 (val!1602 Int)) )
))
(declare-datatypes ((ValueCell!1214 0))(
  ( (ValueCellFull!1214 (v!3468 V!3801)) (EmptyCell!1214) )
))
(declare-datatypes ((array!5269 0))(
  ( (array!5270 (arr!2492 (Array (_ BitVec 32) (_ BitVec 64))) (size!2770 (_ BitVec 32))) )
))
(declare-datatypes ((array!5271 0))(
  ( (array!5272 (arr!2493 (Array (_ BitVec 32) ValueCell!1214)) (size!2771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1336 0))(
  ( (LongMapFixedSize!1337 (defaultEntry!3110 Int) (mask!7547 (_ BitVec 32)) (extraKeys!2851 (_ BitVec 32)) (zeroValue!2953 V!3801) (minValue!2953 V!3801) (_size!717 (_ BitVec 32)) (_keys!4885 array!5269) (_values!3093 array!5271) (_vacant!717 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1336)

(declare-fun mapDefault!5315 () ValueCell!1214)

(assert (=> b!155947 (= condMapEmpty!5315 (= (arr!2493 (_values!3093 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1214)) mapDefault!5315)))))

(declare-fun b!155948 () Bool)

(declare-fun e!101926 () Bool)

(assert (=> b!155948 (= e!101926 true)))

(declare-fun lt!81512 () Bool)

(declare-fun lt!81511 () LongMapFixedSize!1336)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2776 0))(
  ( (tuple2!2777 (_1!1399 (_ BitVec 64)) (_2!1399 V!3801)) )
))
(declare-datatypes ((List!1823 0))(
  ( (Nil!1820) (Cons!1819 (h!2428 tuple2!2776) (t!6617 List!1823)) )
))
(declare-datatypes ((ListLongMap!1775 0))(
  ( (ListLongMap!1776 (toList!903 List!1823)) )
))
(declare-fun contains!953 (ListLongMap!1775 (_ BitVec 64)) Bool)

(declare-fun map!1530 (LongMapFixedSize!1336) ListLongMap!1775)

(assert (=> b!155948 (= lt!81512 (contains!953 (map!1530 lt!81511) key!828))))

(declare-fun b!155949 () Bool)

(declare-fun tp_is_empty!3115 () Bool)

(assert (=> b!155949 (= e!101925 tp_is_empty!3115)))

(declare-fun b!155950 () Bool)

(declare-fun e!101929 () Bool)

(assert (=> b!155950 (= e!101929 tp_is_empty!3115)))

(declare-fun b!155951 () Bool)

(declare-fun e!101931 () Bool)

(assert (=> b!155951 (= e!101931 (not e!101926))))

(declare-fun res!73668 () Bool)

(assert (=> b!155951 (=> res!73668 e!101926)))

(declare-fun valid!665 (LongMapFixedSize!1336) Bool)

(assert (=> b!155951 (= res!73668 (not (valid!665 lt!81511)))))

(declare-fun v!309 () V!3801)

(assert (=> b!155951 (= lt!81511 (LongMapFixedSize!1337 (defaultEntry!3110 thiss!1248) (mask!7547 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2953 thiss!1248) (_size!717 thiss!1248) (_keys!4885 thiss!1248) (_values!3093 thiss!1248) (_vacant!717 thiss!1248)))))

(declare-fun +!195 (ListLongMap!1775 tuple2!2776) ListLongMap!1775)

(declare-fun getCurrentListMap!570 (array!5269 array!5271 (_ BitVec 32) (_ BitVec 32) V!3801 V!3801 (_ BitVec 32) Int) ListLongMap!1775)

(assert (=> b!155951 (= (+!195 (getCurrentListMap!570 (_keys!4885 thiss!1248) (_values!3093 thiss!1248) (mask!7547 thiss!1248) (extraKeys!2851 thiss!1248) (zeroValue!2953 thiss!1248) (minValue!2953 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3110 thiss!1248)) (tuple2!2777 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!570 (_keys!4885 thiss!1248) (_values!3093 thiss!1248) (mask!7547 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2953 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3110 thiss!1248)))))

(declare-datatypes ((Unit!4945 0))(
  ( (Unit!4946) )
))
(declare-fun lt!81513 () Unit!4945)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!77 (array!5269 array!5271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3801 V!3801 V!3801 Int) Unit!4945)

(assert (=> b!155951 (= lt!81513 (lemmaChangeZeroKeyThenAddPairToListMap!77 (_keys!4885 thiss!1248) (_values!3093 thiss!1248) (mask!7547 thiss!1248) (extraKeys!2851 thiss!1248) (bvor (extraKeys!2851 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2953 thiss!1248) v!309 (minValue!2953 thiss!1248) (defaultEntry!3110 thiss!1248)))))

(declare-fun e!101928 () Bool)

(declare-fun array_inv!1575 (array!5269) Bool)

(declare-fun array_inv!1576 (array!5271) Bool)

(assert (=> b!155952 (= e!101928 (and tp!12464 tp_is_empty!3115 (array_inv!1575 (_keys!4885 thiss!1248)) (array_inv!1576 (_values!3093 thiss!1248)) e!101927))))

(declare-fun mapNonEmpty!5315 () Bool)

(declare-fun tp!12463 () Bool)

(assert (=> mapNonEmpty!5315 (= mapRes!5315 (and tp!12463 e!101929))))

(declare-fun mapRest!5315 () (Array (_ BitVec 32) ValueCell!1214))

(declare-fun mapValue!5315 () ValueCell!1214)

(declare-fun mapKey!5315 () (_ BitVec 32))

(assert (=> mapNonEmpty!5315 (= (arr!2493 (_values!3093 thiss!1248)) (store mapRest!5315 mapKey!5315 mapValue!5315))))

(declare-fun res!73667 () Bool)

(assert (=> start!15650 (=> (not res!73667) (not e!101931))))

(assert (=> start!15650 (= res!73667 (valid!665 thiss!1248))))

(assert (=> start!15650 e!101931))

(assert (=> start!15650 e!101928))

(assert (=> start!15650 true))

(assert (=> start!15650 tp_is_empty!3115))

(declare-fun b!155953 () Bool)

(declare-fun res!73669 () Bool)

(assert (=> b!155953 (=> (not res!73669) (not e!101931))))

(assert (=> b!155953 (= res!73669 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5315 () Bool)

(assert (=> mapIsEmpty!5315 mapRes!5315))

(assert (= (and start!15650 res!73667) b!155953))

(assert (= (and b!155953 res!73669) b!155951))

(assert (= (and b!155951 (not res!73668)) b!155948))

(assert (= (and b!155947 condMapEmpty!5315) mapIsEmpty!5315))

(assert (= (and b!155947 (not condMapEmpty!5315)) mapNonEmpty!5315))

(get-info :version)

(assert (= (and mapNonEmpty!5315 ((_ is ValueCellFull!1214) mapValue!5315)) b!155950))

(assert (= (and b!155947 ((_ is ValueCellFull!1214) mapDefault!5315)) b!155949))

(assert (= b!155952 b!155947))

(assert (= start!15650 b!155952))

(declare-fun m!189821 () Bool)

(assert (=> mapNonEmpty!5315 m!189821))

(declare-fun m!189823 () Bool)

(assert (=> b!155952 m!189823))

(declare-fun m!189825 () Bool)

(assert (=> b!155952 m!189825))

(declare-fun m!189827 () Bool)

(assert (=> start!15650 m!189827))

(declare-fun m!189829 () Bool)

(assert (=> b!155948 m!189829))

(assert (=> b!155948 m!189829))

(declare-fun m!189831 () Bool)

(assert (=> b!155948 m!189831))

(declare-fun m!189833 () Bool)

(assert (=> b!155951 m!189833))

(declare-fun m!189835 () Bool)

(assert (=> b!155951 m!189835))

(declare-fun m!189837 () Bool)

(assert (=> b!155951 m!189837))

(declare-fun m!189839 () Bool)

(assert (=> b!155951 m!189839))

(assert (=> b!155951 m!189833))

(declare-fun m!189841 () Bool)

(assert (=> b!155951 m!189841))

(check-sat b_and!9741 (not b!155951) (not start!15650) (not b_next!3313) (not b!155952) (not b!155948) tp_is_empty!3115 (not mapNonEmpty!5315))
(check-sat b_and!9741 (not b_next!3313))
