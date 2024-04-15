; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15644 () Bool)

(assert start!15644)

(declare-fun b!155692 () Bool)

(declare-fun b_free!3307 () Bool)

(declare-fun b_next!3307 () Bool)

(assert (=> b!155692 (= b_free!3307 (not b_next!3307))))

(declare-fun tp!12445 () Bool)

(declare-fun b_and!9695 () Bool)

(assert (=> b!155692 (= tp!12445 b_and!9695)))

(declare-fun mapIsEmpty!5306 () Bool)

(declare-fun mapRes!5306 () Bool)

(assert (=> mapIsEmpty!5306 mapRes!5306))

(declare-fun b!155690 () Bool)

(declare-fun res!73526 () Bool)

(declare-fun e!101740 () Bool)

(assert (=> b!155690 (=> (not res!73526) (not e!101740))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155690 (= res!73526 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!101741 () Bool)

(declare-fun tp_is_empty!3109 () Bool)

(declare-datatypes ((V!3793 0))(
  ( (V!3794 (val!1599 Int)) )
))
(declare-datatypes ((ValueCell!1211 0))(
  ( (ValueCellFull!1211 (v!3458 V!3793)) (EmptyCell!1211) )
))
(declare-datatypes ((array!5251 0))(
  ( (array!5252 (arr!2482 (Array (_ BitVec 32) (_ BitVec 64))) (size!2761 (_ BitVec 32))) )
))
(declare-datatypes ((array!5253 0))(
  ( (array!5254 (arr!2483 (Array (_ BitVec 32) ValueCell!1211)) (size!2762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1330 0))(
  ( (LongMapFixedSize!1331 (defaultEntry!3107 Int) (mask!7541 (_ BitVec 32)) (extraKeys!2848 (_ BitVec 32)) (zeroValue!2950 V!3793) (minValue!2950 V!3793) (_size!714 (_ BitVec 32)) (_keys!4881 array!5251) (_values!3090 array!5253) (_vacant!714 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1330)

(declare-fun e!101739 () Bool)

(declare-fun array_inv!1593 (array!5251) Bool)

(declare-fun array_inv!1594 (array!5253) Bool)

(assert (=> b!155692 (= e!101739 (and tp!12445 tp_is_empty!3109 (array_inv!1593 (_keys!4881 thiss!1248)) (array_inv!1594 (_values!3090 thiss!1248)) e!101741))))

(declare-fun b!155693 () Bool)

(declare-fun e!101737 () Bool)

(assert (=> b!155693 (= e!101740 (not e!101737))))

(declare-fun res!73525 () Bool)

(assert (=> b!155693 (=> res!73525 e!101737)))

(declare-fun lt!81246 () LongMapFixedSize!1330)

(declare-fun valid!651 (LongMapFixedSize!1330) Bool)

(assert (=> b!155693 (= res!73525 (not (valid!651 lt!81246)))))

(declare-fun v!309 () V!3793)

(assert (=> b!155693 (= lt!81246 (LongMapFixedSize!1331 (defaultEntry!3107 thiss!1248) (mask!7541 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2950 thiss!1248) (_size!714 thiss!1248) (_keys!4881 thiss!1248) (_values!3090 thiss!1248) (_vacant!714 thiss!1248)))))

(declare-datatypes ((tuple2!2808 0))(
  ( (tuple2!2809 (_1!1415 (_ BitVec 64)) (_2!1415 V!3793)) )
))
(declare-datatypes ((List!1835 0))(
  ( (Nil!1832) (Cons!1831 (h!2440 tuple2!2808) (t!6628 List!1835)) )
))
(declare-datatypes ((ListLongMap!1795 0))(
  ( (ListLongMap!1796 (toList!913 List!1835)) )
))
(declare-fun +!183 (ListLongMap!1795 tuple2!2808) ListLongMap!1795)

(declare-fun getCurrentListMap!564 (array!5251 array!5253 (_ BitVec 32) (_ BitVec 32) V!3793 V!3793 (_ BitVec 32) Int) ListLongMap!1795)

(assert (=> b!155693 (= (+!183 (getCurrentListMap!564 (_keys!4881 thiss!1248) (_values!3090 thiss!1248) (mask!7541 thiss!1248) (extraKeys!2848 thiss!1248) (zeroValue!2950 thiss!1248) (minValue!2950 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3107 thiss!1248)) (tuple2!2809 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!564 (_keys!4881 thiss!1248) (_values!3090 thiss!1248) (mask!7541 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2950 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3107 thiss!1248)))))

(declare-datatypes ((Unit!4920 0))(
  ( (Unit!4921) )
))
(declare-fun lt!81245 () Unit!4920)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!73 (array!5251 array!5253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3793 V!3793 V!3793 Int) Unit!4920)

(assert (=> b!155693 (= lt!81245 (lemmaChangeZeroKeyThenAddPairToListMap!73 (_keys!4881 thiss!1248) (_values!3090 thiss!1248) (mask!7541 thiss!1248) (extraKeys!2848 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2950 thiss!1248) v!309 (minValue!2950 thiss!1248) (defaultEntry!3107 thiss!1248)))))

(declare-fun res!73524 () Bool)

(assert (=> start!15644 (=> (not res!73524) (not e!101740))))

(assert (=> start!15644 (= res!73524 (valid!651 thiss!1248))))

(assert (=> start!15644 e!101740))

(assert (=> start!15644 e!101739))

(assert (=> start!15644 true))

(assert (=> start!15644 tp_is_empty!3109))

(declare-fun b!155691 () Bool)

(declare-fun e!101743 () Bool)

(assert (=> b!155691 (= e!101741 (and e!101743 mapRes!5306))))

(declare-fun condMapEmpty!5306 () Bool)

(declare-fun mapDefault!5306 () ValueCell!1211)

(assert (=> b!155691 (= condMapEmpty!5306 (= (arr!2483 (_values!3090 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1211)) mapDefault!5306)))))

(declare-fun b!155694 () Bool)

(declare-fun e!101738 () Bool)

(assert (=> b!155694 (= e!101738 tp_is_empty!3109)))

(declare-fun b!155695 () Bool)

(assert (=> b!155695 (= e!101743 tp_is_empty!3109)))

(declare-fun mapNonEmpty!5306 () Bool)

(declare-fun tp!12446 () Bool)

(assert (=> mapNonEmpty!5306 (= mapRes!5306 (and tp!12446 e!101738))))

(declare-fun mapValue!5306 () ValueCell!1211)

(declare-fun mapKey!5306 () (_ BitVec 32))

(declare-fun mapRest!5306 () (Array (_ BitVec 32) ValueCell!1211))

(assert (=> mapNonEmpty!5306 (= (arr!2483 (_values!3090 thiss!1248)) (store mapRest!5306 mapKey!5306 mapValue!5306))))

(declare-fun b!155696 () Bool)

(assert (=> b!155696 (= e!101737 true)))

(declare-fun lt!81244 () Bool)

(declare-fun contains!956 (ListLongMap!1795 (_ BitVec 64)) Bool)

(declare-fun map!1516 (LongMapFixedSize!1330) ListLongMap!1795)

(assert (=> b!155696 (= lt!81244 (contains!956 (map!1516 lt!81246) key!828))))

(assert (= (and start!15644 res!73524) b!155690))

(assert (= (and b!155690 res!73526) b!155693))

(assert (= (and b!155693 (not res!73525)) b!155696))

(assert (= (and b!155691 condMapEmpty!5306) mapIsEmpty!5306))

(assert (= (and b!155691 (not condMapEmpty!5306)) mapNonEmpty!5306))

(get-info :version)

(assert (= (and mapNonEmpty!5306 ((_ is ValueCellFull!1211) mapValue!5306)) b!155694))

(assert (= (and b!155691 ((_ is ValueCellFull!1211) mapDefault!5306)) b!155695))

(assert (= b!155692 b!155691))

(assert (= start!15644 b!155692))

(declare-fun m!188953 () Bool)

(assert (=> b!155692 m!188953))

(declare-fun m!188955 () Bool)

(assert (=> b!155692 m!188955))

(declare-fun m!188957 () Bool)

(assert (=> b!155696 m!188957))

(assert (=> b!155696 m!188957))

(declare-fun m!188959 () Bool)

(assert (=> b!155696 m!188959))

(declare-fun m!188961 () Bool)

(assert (=> mapNonEmpty!5306 m!188961))

(declare-fun m!188963 () Bool)

(assert (=> b!155693 m!188963))

(declare-fun m!188965 () Bool)

(assert (=> b!155693 m!188965))

(declare-fun m!188967 () Bool)

(assert (=> b!155693 m!188967))

(declare-fun m!188969 () Bool)

(assert (=> b!155693 m!188969))

(assert (=> b!155693 m!188965))

(declare-fun m!188971 () Bool)

(assert (=> b!155693 m!188971))

(declare-fun m!188973 () Bool)

(assert (=> start!15644 m!188973))

(check-sat (not b!155692) (not mapNonEmpty!5306) b_and!9695 (not start!15644) tp_is_empty!3109 (not b_next!3307) (not b!155693) (not b!155696))
(check-sat b_and!9695 (not b_next!3307))
