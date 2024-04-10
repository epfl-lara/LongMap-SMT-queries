; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15654 () Bool)

(assert start!15654)

(declare-fun b!155981 () Bool)

(declare-fun b_free!3321 () Bool)

(declare-fun b_next!3321 () Bool)

(assert (=> b!155981 (= b_free!3321 (not b_next!3321))))

(declare-fun tp!12488 () Bool)

(declare-fun b_and!9735 () Bool)

(assert (=> b!155981 (= tp!12488 b_and!9735)))

(declare-fun mapNonEmpty!5327 () Bool)

(declare-fun mapRes!5327 () Bool)

(declare-fun tp!12487 () Bool)

(declare-fun e!101982 () Bool)

(assert (=> mapNonEmpty!5327 (= mapRes!5327 (and tp!12487 e!101982))))

(declare-datatypes ((V!3811 0))(
  ( (V!3812 (val!1606 Int)) )
))
(declare-datatypes ((ValueCell!1218 0))(
  ( (ValueCellFull!1218 (v!3471 V!3811)) (EmptyCell!1218) )
))
(declare-fun mapValue!5327 () ValueCell!1218)

(declare-fun mapRest!5327 () (Array (_ BitVec 32) ValueCell!1218))

(declare-datatypes ((array!5299 0))(
  ( (array!5300 (arr!2507 (Array (_ BitVec 32) (_ BitVec 64))) (size!2785 (_ BitVec 32))) )
))
(declare-datatypes ((array!5301 0))(
  ( (array!5302 (arr!2508 (Array (_ BitVec 32) ValueCell!1218)) (size!2786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1344 0))(
  ( (LongMapFixedSize!1345 (defaultEntry!3114 Int) (mask!7553 (_ BitVec 32)) (extraKeys!2855 (_ BitVec 32)) (zeroValue!2957 V!3811) (minValue!2957 V!3811) (_size!721 (_ BitVec 32)) (_keys!4889 array!5299) (_values!3097 array!5301) (_vacant!721 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1344)

(declare-fun mapKey!5327 () (_ BitVec 32))

(assert (=> mapNonEmpty!5327 (= (arr!2508 (_values!3097 thiss!1248)) (store mapRest!5327 mapKey!5327 mapValue!5327))))

(declare-fun b!155979 () Bool)

(declare-fun e!101985 () Bool)

(assert (=> b!155979 (= e!101985 (not true))))

(declare-fun lt!81483 () Bool)

(declare-fun v!309 () V!3811)

(declare-fun valid!654 (LongMapFixedSize!1344) Bool)

(assert (=> b!155979 (= lt!81483 (valid!654 (LongMapFixedSize!1345 (defaultEntry!3114 thiss!1248) (mask!7553 thiss!1248) (bvor (extraKeys!2855 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2957 thiss!1248) (_size!721 thiss!1248) (_keys!4889 thiss!1248) (_values!3097 thiss!1248) (_vacant!721 thiss!1248))))))

(declare-datatypes ((tuple2!2846 0))(
  ( (tuple2!2847 (_1!1434 (_ BitVec 64)) (_2!1434 V!3811)) )
))
(declare-datatypes ((List!1841 0))(
  ( (Nil!1838) (Cons!1837 (h!2446 tuple2!2846) (t!6643 List!1841)) )
))
(declare-datatypes ((ListLongMap!1833 0))(
  ( (ListLongMap!1834 (toList!932 List!1841)) )
))
(declare-fun +!200 (ListLongMap!1833 tuple2!2846) ListLongMap!1833)

(declare-fun getCurrentListMap!596 (array!5299 array!5301 (_ BitVec 32) (_ BitVec 32) V!3811 V!3811 (_ BitVec 32) Int) ListLongMap!1833)

(assert (=> b!155979 (= (+!200 (getCurrentListMap!596 (_keys!4889 thiss!1248) (_values!3097 thiss!1248) (mask!7553 thiss!1248) (extraKeys!2855 thiss!1248) (zeroValue!2957 thiss!1248) (minValue!2957 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3114 thiss!1248)) (tuple2!2847 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!596 (_keys!4889 thiss!1248) (_values!3097 thiss!1248) (mask!7553 thiss!1248) (bvor (extraKeys!2855 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2957 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3114 thiss!1248)))))

(declare-datatypes ((Unit!4944 0))(
  ( (Unit!4945) )
))
(declare-fun lt!81484 () Unit!4944)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!79 (array!5299 array!5301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3811 V!3811 V!3811 Int) Unit!4944)

(assert (=> b!155979 (= lt!81484 (lemmaChangeZeroKeyThenAddPairToListMap!79 (_keys!4889 thiss!1248) (_values!3097 thiss!1248) (mask!7553 thiss!1248) (extraKeys!2855 thiss!1248) (bvor (extraKeys!2855 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2957 thiss!1248) v!309 (minValue!2957 thiss!1248) (defaultEntry!3114 thiss!1248)))))

(declare-fun res!73678 () Bool)

(assert (=> start!15654 (=> (not res!73678) (not e!101985))))

(assert (=> start!15654 (= res!73678 (valid!654 thiss!1248))))

(assert (=> start!15654 e!101985))

(declare-fun e!101980 () Bool)

(assert (=> start!15654 e!101980))

(assert (=> start!15654 true))

(declare-fun tp_is_empty!3123 () Bool)

(assert (=> start!15654 tp_is_empty!3123))

(declare-fun b!155980 () Bool)

(assert (=> b!155980 (= e!101982 tp_is_empty!3123)))

(declare-fun e!101984 () Bool)

(declare-fun array_inv!1581 (array!5299) Bool)

(declare-fun array_inv!1582 (array!5301) Bool)

(assert (=> b!155981 (= e!101980 (and tp!12488 tp_is_empty!3123 (array_inv!1581 (_keys!4889 thiss!1248)) (array_inv!1582 (_values!3097 thiss!1248)) e!101984))))

(declare-fun mapIsEmpty!5327 () Bool)

(assert (=> mapIsEmpty!5327 mapRes!5327))

(declare-fun b!155982 () Bool)

(declare-fun e!101983 () Bool)

(assert (=> b!155982 (= e!101984 (and e!101983 mapRes!5327))))

(declare-fun condMapEmpty!5327 () Bool)

(declare-fun mapDefault!5327 () ValueCell!1218)

(assert (=> b!155982 (= condMapEmpty!5327 (= (arr!2508 (_values!3097 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1218)) mapDefault!5327)))))

(declare-fun b!155983 () Bool)

(assert (=> b!155983 (= e!101983 tp_is_empty!3123)))

(declare-fun b!155984 () Bool)

(declare-fun res!73677 () Bool)

(assert (=> b!155984 (=> (not res!73677) (not e!101985))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155984 (= res!73677 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15654 res!73678) b!155984))

(assert (= (and b!155984 res!73677) b!155979))

(assert (= (and b!155982 condMapEmpty!5327) mapIsEmpty!5327))

(assert (= (and b!155982 (not condMapEmpty!5327)) mapNonEmpty!5327))

(get-info :version)

(assert (= (and mapNonEmpty!5327 ((_ is ValueCellFull!1218) mapValue!5327)) b!155980))

(assert (= (and b!155982 ((_ is ValueCellFull!1218) mapDefault!5327)) b!155983))

(assert (= b!155981 b!155982))

(assert (= start!15654 b!155981))

(declare-fun m!189723 () Bool)

(assert (=> mapNonEmpty!5327 m!189723))

(declare-fun m!189725 () Bool)

(assert (=> b!155979 m!189725))

(declare-fun m!189727 () Bool)

(assert (=> b!155979 m!189727))

(assert (=> b!155979 m!189725))

(declare-fun m!189729 () Bool)

(assert (=> b!155979 m!189729))

(declare-fun m!189731 () Bool)

(assert (=> b!155979 m!189731))

(declare-fun m!189733 () Bool)

(assert (=> b!155979 m!189733))

(declare-fun m!189735 () Bool)

(assert (=> start!15654 m!189735))

(declare-fun m!189737 () Bool)

(assert (=> b!155981 m!189737))

(declare-fun m!189739 () Bool)

(assert (=> b!155981 m!189739))

(check-sat (not b!155981) (not mapNonEmpty!5327) (not b_next!3321) tp_is_empty!3123 b_and!9735 (not start!15654) (not b!155979))
(check-sat b_and!9735 (not b_next!3321))
