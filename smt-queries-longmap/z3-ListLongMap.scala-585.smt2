; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15656 () Bool)

(assert start!15656)

(declare-fun b!156008 () Bool)

(declare-fun b_free!3319 () Bool)

(declare-fun b_next!3319 () Bool)

(assert (=> b!156008 (= b_free!3319 (not b_next!3319))))

(declare-fun tp!12481 () Bool)

(declare-fun b_and!9747 () Bool)

(assert (=> b!156008 (= tp!12481 b_and!9747)))

(declare-fun b!156009 () Bool)

(declare-fun e!101989 () Bool)

(declare-fun tp_is_empty!3121 () Bool)

(assert (=> b!156009 (= e!101989 tp_is_empty!3121)))

(declare-fun mapNonEmpty!5324 () Bool)

(declare-fun mapRes!5324 () Bool)

(declare-fun tp!12482 () Bool)

(declare-fun e!101986 () Bool)

(assert (=> mapNonEmpty!5324 (= mapRes!5324 (and tp!12482 e!101986))))

(declare-fun mapKey!5324 () (_ BitVec 32))

(declare-datatypes ((V!3809 0))(
  ( (V!3810 (val!1605 Int)) )
))
(declare-datatypes ((ValueCell!1217 0))(
  ( (ValueCellFull!1217 (v!3471 V!3809)) (EmptyCell!1217) )
))
(declare-datatypes ((array!5281 0))(
  ( (array!5282 (arr!2498 (Array (_ BitVec 32) (_ BitVec 64))) (size!2776 (_ BitVec 32))) )
))
(declare-datatypes ((array!5283 0))(
  ( (array!5284 (arr!2499 (Array (_ BitVec 32) ValueCell!1217)) (size!2777 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1342 0))(
  ( (LongMapFixedSize!1343 (defaultEntry!3113 Int) (mask!7552 (_ BitVec 32)) (extraKeys!2854 (_ BitVec 32)) (zeroValue!2956 V!3809) (minValue!2956 V!3809) (_size!720 (_ BitVec 32)) (_keys!4888 array!5281) (_values!3096 array!5283) (_vacant!720 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1342)

(declare-fun mapValue!5324 () ValueCell!1217)

(declare-fun mapRest!5324 () (Array (_ BitVec 32) ValueCell!1217))

(assert (=> mapNonEmpty!5324 (= (arr!2499 (_values!3096 thiss!1248)) (store mapRest!5324 mapKey!5324 mapValue!5324))))

(declare-fun b!156010 () Bool)

(assert (=> b!156010 (= e!101986 tp_is_empty!3121)))

(declare-fun b!156011 () Bool)

(declare-fun e!101990 () Bool)

(assert (=> b!156011 (= e!101990 (and e!101989 mapRes!5324))))

(declare-fun condMapEmpty!5324 () Bool)

(declare-fun mapDefault!5324 () ValueCell!1217)

(assert (=> b!156011 (= condMapEmpty!5324 (= (arr!2499 (_values!3096 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1217)) mapDefault!5324)))))

(declare-fun b!156012 () Bool)

(declare-fun res!73692 () Bool)

(declare-fun e!101987 () Bool)

(assert (=> b!156012 (=> (not res!73692) (not e!101987))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156012 (= res!73692 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!156013 () Bool)

(assert (=> b!156013 (= e!101987 (not true))))

(declare-fun lt!81537 () Bool)

(declare-fun v!309 () V!3809)

(declare-fun valid!668 (LongMapFixedSize!1342) Bool)

(assert (=> b!156013 (= lt!81537 (valid!668 (LongMapFixedSize!1343 (defaultEntry!3113 thiss!1248) (mask!7552 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) (_size!720 thiss!1248) (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (_vacant!720 thiss!1248))))))

(declare-datatypes ((tuple2!2782 0))(
  ( (tuple2!2783 (_1!1402 (_ BitVec 64)) (_2!1402 V!3809)) )
))
(declare-datatypes ((List!1826 0))(
  ( (Nil!1823) (Cons!1822 (h!2431 tuple2!2782) (t!6620 List!1826)) )
))
(declare-datatypes ((ListLongMap!1781 0))(
  ( (ListLongMap!1782 (toList!906 List!1826)) )
))
(declare-fun +!198 (ListLongMap!1781 tuple2!2782) ListLongMap!1781)

(declare-fun getCurrentListMap!573 (array!5281 array!5283 (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 (_ BitVec 32) Int) ListLongMap!1781)

(assert (=> b!156013 (= (+!198 (getCurrentListMap!573 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (extraKeys!2854 thiss!1248) (zeroValue!2956 thiss!1248) (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)) (tuple2!2783 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!573 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)))))

(declare-datatypes ((Unit!4951 0))(
  ( (Unit!4952) )
))
(declare-fun lt!81536 () Unit!4951)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!80 (array!5281 array!5283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 V!3809 Int) Unit!4951)

(assert (=> b!156013 (= lt!81536 (lemmaChangeZeroKeyThenAddPairToListMap!80 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (extraKeys!2854 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2956 thiss!1248) v!309 (minValue!2956 thiss!1248) (defaultEntry!3113 thiss!1248)))))

(declare-fun mapIsEmpty!5324 () Bool)

(assert (=> mapIsEmpty!5324 mapRes!5324))

(declare-fun e!101988 () Bool)

(declare-fun array_inv!1577 (array!5281) Bool)

(declare-fun array_inv!1578 (array!5283) Bool)

(assert (=> b!156008 (= e!101988 (and tp!12481 tp_is_empty!3121 (array_inv!1577 (_keys!4888 thiss!1248)) (array_inv!1578 (_values!3096 thiss!1248)) e!101990))))

(declare-fun res!73693 () Bool)

(assert (=> start!15656 (=> (not res!73693) (not e!101987))))

(assert (=> start!15656 (= res!73693 (valid!668 thiss!1248))))

(assert (=> start!15656 e!101987))

(assert (=> start!15656 e!101988))

(assert (=> start!15656 true))

(assert (=> start!15656 tp_is_empty!3121))

(assert (= (and start!15656 res!73693) b!156012))

(assert (= (and b!156012 res!73692) b!156013))

(assert (= (and b!156011 condMapEmpty!5324) mapIsEmpty!5324))

(assert (= (and b!156011 (not condMapEmpty!5324)) mapNonEmpty!5324))

(get-info :version)

(assert (= (and mapNonEmpty!5324 ((_ is ValueCellFull!1217) mapValue!5324)) b!156010))

(assert (= (and b!156011 ((_ is ValueCellFull!1217) mapDefault!5324)) b!156009))

(assert (= b!156008 b!156011))

(assert (= start!15656 b!156008))

(declare-fun m!189887 () Bool)

(assert (=> mapNonEmpty!5324 m!189887))

(declare-fun m!189889 () Bool)

(assert (=> b!156013 m!189889))

(declare-fun m!189891 () Bool)

(assert (=> b!156013 m!189891))

(assert (=> b!156013 m!189889))

(declare-fun m!189893 () Bool)

(assert (=> b!156013 m!189893))

(declare-fun m!189895 () Bool)

(assert (=> b!156013 m!189895))

(declare-fun m!189897 () Bool)

(assert (=> b!156013 m!189897))

(declare-fun m!189899 () Bool)

(assert (=> b!156008 m!189899))

(declare-fun m!189901 () Bool)

(assert (=> b!156008 m!189901))

(declare-fun m!189903 () Bool)

(assert (=> start!15656 m!189903))

(check-sat b_and!9747 (not start!15656) (not b_next!3319) (not b!156013) tp_is_empty!3121 (not mapNonEmpty!5324) (not b!156008))
(check-sat b_and!9747 (not b_next!3319))
