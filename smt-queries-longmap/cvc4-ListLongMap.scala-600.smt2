; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15746 () Bool)

(assert start!15746)

(declare-fun b!157141 () Bool)

(declare-fun b_free!3413 () Bool)

(declare-fun b_next!3413 () Bool)

(assert (=> b!157141 (= b_free!3413 (not b_next!3413))))

(declare-fun tp!12763 () Bool)

(declare-fun b_and!9827 () Bool)

(assert (=> b!157141 (= tp!12763 b_and!9827)))

(declare-fun mapNonEmpty!5465 () Bool)

(declare-fun mapRes!5465 () Bool)

(declare-fun tp!12764 () Bool)

(declare-fun e!102817 () Bool)

(assert (=> mapNonEmpty!5465 (= mapRes!5465 (and tp!12764 e!102817))))

(declare-datatypes ((V!3933 0))(
  ( (V!3934 (val!1652 Int)) )
))
(declare-datatypes ((ValueCell!1264 0))(
  ( (ValueCellFull!1264 (v!3517 V!3933)) (EmptyCell!1264) )
))
(declare-fun mapValue!5465 () ValueCell!1264)

(declare-fun mapKey!5465 () (_ BitVec 32))

(declare-datatypes ((array!5483 0))(
  ( (array!5484 (arr!2599 (Array (_ BitVec 32) (_ BitVec 64))) (size!2877 (_ BitVec 32))) )
))
(declare-datatypes ((array!5485 0))(
  ( (array!5486 (arr!2600 (Array (_ BitVec 32) ValueCell!1264)) (size!2878 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1436 0))(
  ( (LongMapFixedSize!1437 (defaultEntry!3160 Int) (mask!7629 (_ BitVec 32)) (extraKeys!2901 (_ BitVec 32)) (zeroValue!3003 V!3933) (minValue!3003 V!3933) (_size!767 (_ BitVec 32)) (_keys!4935 array!5483) (_values!3143 array!5485) (_vacant!767 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1436)

(declare-fun mapRest!5465 () (Array (_ BitVec 32) ValueCell!1264))

(assert (=> mapNonEmpty!5465 (= (arr!2600 (_values!3143 thiss!1248)) (store mapRest!5465 mapKey!5465 mapValue!5465))))

(declare-fun res!74286 () Bool)

(declare-fun e!102819 () Bool)

(assert (=> start!15746 (=> (not res!74286) (not e!102819))))

(declare-fun valid!684 (LongMapFixedSize!1436) Bool)

(assert (=> start!15746 (= res!74286 (valid!684 thiss!1248))))

(assert (=> start!15746 e!102819))

(declare-fun e!102821 () Bool)

(assert (=> start!15746 e!102821))

(assert (=> start!15746 true))

(declare-fun tp_is_empty!3215 () Bool)

(assert (=> start!15746 tp_is_empty!3215))

(declare-fun mapIsEmpty!5465 () Bool)

(assert (=> mapIsEmpty!5465 mapRes!5465))

(declare-fun b!157139 () Bool)

(declare-fun res!74287 () Bool)

(assert (=> b!157139 (=> (not res!74287) (not e!102819))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157139 (= res!74287 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157140 () Bool)

(declare-fun e!102818 () Bool)

(assert (=> b!157140 (= e!102819 (not e!102818))))

(declare-fun res!74285 () Bool)

(assert (=> b!157140 (=> res!74285 e!102818)))

(declare-fun lt!81661 () LongMapFixedSize!1436)

(assert (=> b!157140 (= res!74285 (not (valid!684 lt!81661)))))

(declare-fun v!309 () V!3933)

(assert (=> b!157140 (= lt!81661 (LongMapFixedSize!1437 (defaultEntry!3160 thiss!1248) (mask!7629 thiss!1248) (bvor (extraKeys!2901 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3003 thiss!1248) v!309 (_size!767 thiss!1248) (_keys!4935 thiss!1248) (_values!3143 thiss!1248) (_vacant!767 thiss!1248)))))

(declare-datatypes ((tuple2!2864 0))(
  ( (tuple2!2865 (_1!1443 (_ BitVec 64)) (_2!1443 V!3933)) )
))
(declare-datatypes ((List!1874 0))(
  ( (Nil!1871) (Cons!1870 (h!2479 tuple2!2864) (t!6676 List!1874)) )
))
(declare-datatypes ((ListLongMap!1851 0))(
  ( (ListLongMap!1852 (toList!941 List!1874)) )
))
(declare-fun +!209 (ListLongMap!1851 tuple2!2864) ListLongMap!1851)

(declare-fun getCurrentListMap!605 (array!5483 array!5485 (_ BitVec 32) (_ BitVec 32) V!3933 V!3933 (_ BitVec 32) Int) ListLongMap!1851)

(assert (=> b!157140 (= (+!209 (getCurrentListMap!605 (_keys!4935 thiss!1248) (_values!3143 thiss!1248) (mask!7629 thiss!1248) (extraKeys!2901 thiss!1248) (zeroValue!3003 thiss!1248) (minValue!3003 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3160 thiss!1248)) (tuple2!2865 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!605 (_keys!4935 thiss!1248) (_values!3143 thiss!1248) (mask!7629 thiss!1248) (bvor (extraKeys!2901 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3003 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3160 thiss!1248)))))

(declare-datatypes ((Unit!4962 0))(
  ( (Unit!4963) )
))
(declare-fun lt!81660 () Unit!4962)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!77 (array!5483 array!5485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3933 V!3933 V!3933 Int) Unit!4962)

(assert (=> b!157140 (= lt!81660 (lemmaChangeLongMinValueKeyThenAddPairToListMap!77 (_keys!4935 thiss!1248) (_values!3143 thiss!1248) (mask!7629 thiss!1248) (extraKeys!2901 thiss!1248) (bvor (extraKeys!2901 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3003 thiss!1248) (minValue!3003 thiss!1248) v!309 (defaultEntry!3160 thiss!1248)))))

(declare-fun e!102820 () Bool)

(declare-fun array_inv!1647 (array!5483) Bool)

(declare-fun array_inv!1648 (array!5485) Bool)

(assert (=> b!157141 (= e!102821 (and tp!12763 tp_is_empty!3215 (array_inv!1647 (_keys!4935 thiss!1248)) (array_inv!1648 (_values!3143 thiss!1248)) e!102820))))

(declare-fun b!157142 () Bool)

(declare-fun e!102816 () Bool)

(assert (=> b!157142 (= e!102816 tp_is_empty!3215)))

(declare-fun b!157143 () Bool)

(assert (=> b!157143 (= e!102817 tp_is_empty!3215)))

(declare-fun b!157144 () Bool)

(assert (=> b!157144 (= e!102820 (and e!102816 mapRes!5465))))

(declare-fun condMapEmpty!5465 () Bool)

(declare-fun mapDefault!5465 () ValueCell!1264)

