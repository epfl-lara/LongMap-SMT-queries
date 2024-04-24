; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15644 () Bool)

(assert start!15644)

(declare-fun b!155886 () Bool)

(declare-fun b_free!3307 () Bool)

(declare-fun b_next!3307 () Bool)

(assert (=> b!155886 (= b_free!3307 (not b_next!3307))))

(declare-fun tp!12445 () Bool)

(declare-fun b_and!9735 () Bool)

(assert (=> b!155886 (= tp!12445 b_and!9735)))

(declare-fun b!155884 () Bool)

(declare-fun e!101868 () Bool)

(assert (=> b!155884 (= e!101868 true)))

(declare-fun lt!81485 () Bool)

(declare-datatypes ((V!3793 0))(
  ( (V!3794 (val!1599 Int)) )
))
(declare-datatypes ((ValueCell!1211 0))(
  ( (ValueCellFull!1211 (v!3465 V!3793)) (EmptyCell!1211) )
))
(declare-datatypes ((array!5257 0))(
  ( (array!5258 (arr!2486 (Array (_ BitVec 32) (_ BitVec 64))) (size!2764 (_ BitVec 32))) )
))
(declare-datatypes ((array!5259 0))(
  ( (array!5260 (arr!2487 (Array (_ BitVec 32) ValueCell!1211)) (size!2765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1330 0))(
  ( (LongMapFixedSize!1331 (defaultEntry!3107 Int) (mask!7542 (_ BitVec 32)) (extraKeys!2848 (_ BitVec 32)) (zeroValue!2950 V!3793) (minValue!2950 V!3793) (_size!714 (_ BitVec 32)) (_keys!4882 array!5257) (_values!3090 array!5259) (_vacant!714 (_ BitVec 32))) )
))
(declare-fun lt!81484 () LongMapFixedSize!1330)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2770 0))(
  ( (tuple2!2771 (_1!1396 (_ BitVec 64)) (_2!1396 V!3793)) )
))
(declare-datatypes ((List!1820 0))(
  ( (Nil!1817) (Cons!1816 (h!2425 tuple2!2770) (t!6614 List!1820)) )
))
(declare-datatypes ((ListLongMap!1769 0))(
  ( (ListLongMap!1770 (toList!900 List!1820)) )
))
(declare-fun contains!950 (ListLongMap!1769 (_ BitVec 64)) Bool)

(declare-fun map!1525 (LongMapFixedSize!1330) ListLongMap!1769)

(assert (=> b!155884 (= lt!81485 (contains!950 (map!1525 lt!81484) key!828))))

(declare-fun b!155885 () Bool)

(declare-fun e!101865 () Bool)

(declare-fun e!101863 () Bool)

(declare-fun mapRes!5306 () Bool)

(assert (=> b!155885 (= e!101865 (and e!101863 mapRes!5306))))

(declare-fun condMapEmpty!5306 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!1330)

(declare-fun mapDefault!5306 () ValueCell!1211)

(assert (=> b!155885 (= condMapEmpty!5306 (= (arr!2487 (_values!3090 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1211)) mapDefault!5306)))))

(declare-fun tp_is_empty!3109 () Bool)

(declare-fun e!101866 () Bool)

(declare-fun array_inv!1569 (array!5257) Bool)

(declare-fun array_inv!1570 (array!5259) Bool)

(assert (=> b!155886 (= e!101866 (and tp!12445 tp_is_empty!3109 (array_inv!1569 (_keys!4882 thiss!1248)) (array_inv!1570 (_values!3090 thiss!1248)) e!101865))))

(declare-fun res!73641 () Bool)

(declare-fun e!101867 () Bool)

(assert (=> start!15644 (=> (not res!73641) (not e!101867))))

(declare-fun valid!663 (LongMapFixedSize!1330) Bool)

(assert (=> start!15644 (= res!73641 (valid!663 thiss!1248))))

(assert (=> start!15644 e!101867))

(assert (=> start!15644 e!101866))

(assert (=> start!15644 true))

(assert (=> start!15644 tp_is_empty!3109))

(declare-fun mapNonEmpty!5306 () Bool)

(declare-fun tp!12446 () Bool)

(declare-fun e!101862 () Bool)

(assert (=> mapNonEmpty!5306 (= mapRes!5306 (and tp!12446 e!101862))))

(declare-fun mapRest!5306 () (Array (_ BitVec 32) ValueCell!1211))

(declare-fun mapValue!5306 () ValueCell!1211)

(declare-fun mapKey!5306 () (_ BitVec 32))

(assert (=> mapNonEmpty!5306 (= (arr!2487 (_values!3090 thiss!1248)) (store mapRest!5306 mapKey!5306 mapValue!5306))))

(declare-fun mapIsEmpty!5306 () Bool)

(assert (=> mapIsEmpty!5306 mapRes!5306))

(declare-fun b!155887 () Bool)

(assert (=> b!155887 (= e!101863 tp_is_empty!3109)))

(declare-fun b!155888 () Bool)

(declare-fun res!73642 () Bool)

(assert (=> b!155888 (=> (not res!73642) (not e!101867))))

(assert (=> b!155888 (= res!73642 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155889 () Bool)

(assert (=> b!155889 (= e!101862 tp_is_empty!3109)))

(declare-fun b!155890 () Bool)

(assert (=> b!155890 (= e!101867 (not e!101868))))

(declare-fun res!73640 () Bool)

(assert (=> b!155890 (=> res!73640 e!101868)))

(assert (=> b!155890 (= res!73640 (not (valid!663 lt!81484)))))

(declare-fun v!309 () V!3793)

(assert (=> b!155890 (= lt!81484 (LongMapFixedSize!1331 (defaultEntry!3107 thiss!1248) (mask!7542 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2950 thiss!1248) (_size!714 thiss!1248) (_keys!4882 thiss!1248) (_values!3090 thiss!1248) (_vacant!714 thiss!1248)))))

(declare-fun +!193 (ListLongMap!1769 tuple2!2770) ListLongMap!1769)

(declare-fun getCurrentListMap!568 (array!5257 array!5259 (_ BitVec 32) (_ BitVec 32) V!3793 V!3793 (_ BitVec 32) Int) ListLongMap!1769)

(assert (=> b!155890 (= (+!193 (getCurrentListMap!568 (_keys!4882 thiss!1248) (_values!3090 thiss!1248) (mask!7542 thiss!1248) (extraKeys!2848 thiss!1248) (zeroValue!2950 thiss!1248) (minValue!2950 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3107 thiss!1248)) (tuple2!2771 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!568 (_keys!4882 thiss!1248) (_values!3090 thiss!1248) (mask!7542 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2950 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3107 thiss!1248)))))

(declare-datatypes ((Unit!4941 0))(
  ( (Unit!4942) )
))
(declare-fun lt!81486 () Unit!4941)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!75 (array!5257 array!5259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3793 V!3793 V!3793 Int) Unit!4941)

(assert (=> b!155890 (= lt!81486 (lemmaChangeZeroKeyThenAddPairToListMap!75 (_keys!4882 thiss!1248) (_values!3090 thiss!1248) (mask!7542 thiss!1248) (extraKeys!2848 thiss!1248) (bvor (extraKeys!2848 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2950 thiss!1248) v!309 (minValue!2950 thiss!1248) (defaultEntry!3107 thiss!1248)))))

(assert (= (and start!15644 res!73641) b!155888))

(assert (= (and b!155888 res!73642) b!155890))

(assert (= (and b!155890 (not res!73640)) b!155884))

(assert (= (and b!155885 condMapEmpty!5306) mapIsEmpty!5306))

(assert (= (and b!155885 (not condMapEmpty!5306)) mapNonEmpty!5306))

(get-info :version)

(assert (= (and mapNonEmpty!5306 ((_ is ValueCellFull!1211) mapValue!5306)) b!155889))

(assert (= (and b!155885 ((_ is ValueCellFull!1211) mapDefault!5306)) b!155887))

(assert (= b!155886 b!155885))

(assert (= start!15644 b!155886))

(declare-fun m!189755 () Bool)

(assert (=> mapNonEmpty!5306 m!189755))

(declare-fun m!189757 () Bool)

(assert (=> start!15644 m!189757))

(declare-fun m!189759 () Bool)

(assert (=> b!155886 m!189759))

(declare-fun m!189761 () Bool)

(assert (=> b!155886 m!189761))

(declare-fun m!189763 () Bool)

(assert (=> b!155884 m!189763))

(assert (=> b!155884 m!189763))

(declare-fun m!189765 () Bool)

(assert (=> b!155884 m!189765))

(declare-fun m!189767 () Bool)

(assert (=> b!155890 m!189767))

(declare-fun m!189769 () Bool)

(assert (=> b!155890 m!189769))

(declare-fun m!189771 () Bool)

(assert (=> b!155890 m!189771))

(declare-fun m!189773 () Bool)

(assert (=> b!155890 m!189773))

(assert (=> b!155890 m!189771))

(declare-fun m!189775 () Bool)

(assert (=> b!155890 m!189775))

(check-sat (not b_next!3307) (not mapNonEmpty!5306) (not b!155884) (not b!155886) (not start!15644) tp_is_empty!3109 (not b!155890) b_and!9735)
(check-sat b_and!9735 (not b_next!3307))
