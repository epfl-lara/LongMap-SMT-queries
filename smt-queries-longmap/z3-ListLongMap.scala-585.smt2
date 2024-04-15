; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15656 () Bool)

(assert start!15656)

(declare-fun b!155818 () Bool)

(declare-fun b_free!3319 () Bool)

(declare-fun b_next!3319 () Bool)

(assert (=> b!155818 (= b_free!3319 (not b_next!3319))))

(declare-fun tp!12481 () Bool)

(declare-fun b_and!9707 () Bool)

(assert (=> b!155818 (= tp!12481 b_and!9707)))

(declare-fun mapIsEmpty!5324 () Bool)

(declare-fun mapRes!5324 () Bool)

(assert (=> mapIsEmpty!5324 mapRes!5324))

(declare-fun b!155814 () Bool)

(declare-fun e!101861 () Bool)

(declare-fun e!101862 () Bool)

(assert (=> b!155814 (= e!101861 (and e!101862 mapRes!5324))))

(declare-fun condMapEmpty!5324 () Bool)

(declare-datatypes ((V!3809 0))(
  ( (V!3810 (val!1605 Int)) )
))
(declare-datatypes ((ValueCell!1217 0))(
  ( (ValueCellFull!1217 (v!3464 V!3809)) (EmptyCell!1217) )
))
(declare-datatypes ((array!5275 0))(
  ( (array!5276 (arr!2494 (Array (_ BitVec 32) (_ BitVec 64))) (size!2773 (_ BitVec 32))) )
))
(declare-datatypes ((array!5277 0))(
  ( (array!5278 (arr!2495 (Array (_ BitVec 32) ValueCell!1217)) (size!2774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1342 0))(
  ( (LongMapFixedSize!1343 (defaultEntry!3113 Int) (mask!7551 (_ BitVec 32)) (extraKeys!2854 (_ BitVec 32)) (zeroValue!2956 V!3809) (minValue!2956 V!3809) (_size!720 (_ BitVec 32)) (_keys!4887 array!5275) (_values!3096 array!5277) (_vacant!720 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1342)

(declare-fun mapDefault!5324 () ValueCell!1217)

(assert (=> b!155814 (= condMapEmpty!5324 (= (arr!2495 (_values!3096 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1217)) mapDefault!5324)))))

(declare-fun b!155815 () Bool)

(declare-fun tp_is_empty!3121 () Bool)

(assert (=> b!155815 (= e!101862 tp_is_empty!3121)))

(declare-fun mapNonEmpty!5324 () Bool)

(declare-fun tp!12482 () Bool)

(declare-fun e!101863 () Bool)

(assert (=> mapNonEmpty!5324 (= mapRes!5324 (and tp!12482 e!101863))))

(declare-fun mapKey!5324 () (_ BitVec 32))

(declare-fun mapValue!5324 () ValueCell!1217)

(declare-fun mapRest!5324 () (Array (_ BitVec 32) ValueCell!1217))

(assert (=> mapNonEmpty!5324 (= (arr!2495 (_values!3096 thiss!1248)) (store mapRest!5324 mapKey!5324 mapValue!5324))))

(declare-fun b!155816 () Bool)

(declare-fun e!101866 () Bool)

(assert (=> b!155816 (= e!101866 (not true))))

(declare-fun lt!81297 () Bool)

(declare-fun v!309 () V!3809)

(declare-fun valid!656 (LongMapFixedSize!1342) Bool)

(assert (=> b!155816 (= lt!81297 (valid!656 (LongMapFixedSize!1343 (defaultEntry!3113 thiss!1248) (mask!7551 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) (_size!720 thiss!1248) (_keys!4887 thiss!1248) (_values!3096 thiss!1248) (_vacant!720 thiss!1248))))))

(declare-datatypes ((tuple2!2818 0))(
  ( (tuple2!2819 (_1!1420 (_ BitVec 64)) (_2!1420 V!3809)) )
))
(declare-datatypes ((List!1840 0))(
  ( (Nil!1837) (Cons!1836 (h!2445 tuple2!2818) (t!6633 List!1840)) )
))
(declare-datatypes ((ListLongMap!1805 0))(
  ( (ListLongMap!1806 (toList!918 List!1840)) )
))
(declare-fun +!187 (ListLongMap!1805 tuple2!2818) ListLongMap!1805)

(declare-fun getCurrentListMap!568 (array!5275 array!5277 (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 (_ BitVec 32) Int) ListLongMap!1805)

(assert (=> b!155816 (= (+!187 (getCurrentListMap!568 (_keys!4887 thiss!1248) (_values!3096 thiss!1248) (mask!7551 thiss!1248) (extraKeys!2854 thiss!1248) (zeroValue!2956 thiss!1248) (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)) (tuple2!2819 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!568 (_keys!4887 thiss!1248) (_values!3096 thiss!1248) (mask!7551 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)))))

(declare-datatypes ((Unit!4928 0))(
  ( (Unit!4929) )
))
(declare-fun lt!81296 () Unit!4928)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!77 (array!5275 array!5277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 V!3809 Int) Unit!4928)

(assert (=> b!155816 (= lt!81296 (lemmaChangeZeroKeyThenAddPairToListMap!77 (_keys!4887 thiss!1248) (_values!3096 thiss!1248) (mask!7551 thiss!1248) (extraKeys!2854 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2956 thiss!1248) v!309 (minValue!2956 thiss!1248) (defaultEntry!3113 thiss!1248)))))

(declare-fun e!101864 () Bool)

(declare-fun array_inv!1603 (array!5275) Bool)

(declare-fun array_inv!1604 (array!5277) Bool)

(assert (=> b!155818 (= e!101864 (and tp!12481 tp_is_empty!3121 (array_inv!1603 (_keys!4887 thiss!1248)) (array_inv!1604 (_values!3096 thiss!1248)) e!101861))))

(declare-fun b!155819 () Bool)

(assert (=> b!155819 (= e!101863 tp_is_empty!3121)))

(declare-fun b!155817 () Bool)

(declare-fun res!73577 () Bool)

(assert (=> b!155817 (=> (not res!73577) (not e!101866))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155817 (= res!73577 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!73576 () Bool)

(assert (=> start!15656 (=> (not res!73576) (not e!101866))))

(assert (=> start!15656 (= res!73576 (valid!656 thiss!1248))))

(assert (=> start!15656 e!101866))

(assert (=> start!15656 e!101864))

(assert (=> start!15656 true))

(assert (=> start!15656 tp_is_empty!3121))

(assert (= (and start!15656 res!73576) b!155817))

(assert (= (and b!155817 res!73577) b!155816))

(assert (= (and b!155814 condMapEmpty!5324) mapIsEmpty!5324))

(assert (= (and b!155814 (not condMapEmpty!5324)) mapNonEmpty!5324))

(get-info :version)

(assert (= (and mapNonEmpty!5324 ((_ is ValueCellFull!1217) mapValue!5324)) b!155819))

(assert (= (and b!155814 ((_ is ValueCellFull!1217) mapDefault!5324)) b!155815))

(assert (= b!155818 b!155814))

(assert (= start!15656 b!155818))

(declare-fun m!189085 () Bool)

(assert (=> mapNonEmpty!5324 m!189085))

(declare-fun m!189087 () Bool)

(assert (=> b!155816 m!189087))

(declare-fun m!189089 () Bool)

(assert (=> b!155816 m!189089))

(assert (=> b!155816 m!189087))

(declare-fun m!189091 () Bool)

(assert (=> b!155816 m!189091))

(declare-fun m!189093 () Bool)

(assert (=> b!155816 m!189093))

(declare-fun m!189095 () Bool)

(assert (=> b!155816 m!189095))

(declare-fun m!189097 () Bool)

(assert (=> b!155818 m!189097))

(declare-fun m!189099 () Bool)

(assert (=> b!155818 m!189099))

(declare-fun m!189101 () Bool)

(assert (=> start!15656 m!189101))

(check-sat (not b!155818) (not b!155816) tp_is_empty!3121 (not b_next!3319) (not start!15656) (not mapNonEmpty!5324) b_and!9707)
(check-sat b_and!9707 (not b_next!3319))
