; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15758 () Bool)

(assert start!15758)

(declare-fun b!157074 () Bool)

(declare-fun b_free!3421 () Bool)

(declare-fun b_next!3421 () Bool)

(assert (=> b!157074 (= b_free!3421 (not b_next!3421))))

(declare-fun tp!12788 () Bool)

(declare-fun b_and!9809 () Bool)

(assert (=> b!157074 (= tp!12788 b_and!9809)))

(declare-fun e!102800 () Bool)

(declare-datatypes ((V!3945 0))(
  ( (V!3946 (val!1656 Int)) )
))
(declare-datatypes ((ValueCell!1268 0))(
  ( (ValueCellFull!1268 (v!3515 V!3945)) (EmptyCell!1268) )
))
(declare-datatypes ((array!5479 0))(
  ( (array!5480 (arr!2596 (Array (_ BitVec 32) (_ BitVec 64))) (size!2875 (_ BitVec 32))) )
))
(declare-datatypes ((array!5481 0))(
  ( (array!5482 (arr!2597 (Array (_ BitVec 32) ValueCell!1268)) (size!2876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1444 0))(
  ( (LongMapFixedSize!1445 (defaultEntry!3164 Int) (mask!7636 (_ BitVec 32)) (extraKeys!2905 (_ BitVec 32)) (zeroValue!3007 V!3945) (minValue!3007 V!3945) (_size!771 (_ BitVec 32)) (_keys!4938 array!5479) (_values!3147 array!5481) (_vacant!771 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1444)

(declare-fun e!102799 () Bool)

(declare-fun tp_is_empty!3223 () Bool)

(declare-fun array_inv!1673 (array!5479) Bool)

(declare-fun array_inv!1674 (array!5481) Bool)

(assert (=> b!157074 (= e!102800 (and tp!12788 tp_is_empty!3223 (array_inv!1673 (_keys!4938 thiss!1248)) (array_inv!1674 (_values!3147 thiss!1248)) e!102799))))

(declare-fun mapIsEmpty!5477 () Bool)

(declare-fun mapRes!5477 () Bool)

(assert (=> mapIsEmpty!5477 mapRes!5477))

(declare-fun b!157075 () Bool)

(declare-fun e!102798 () Bool)

(assert (=> b!157075 (= e!102798 tp_is_empty!3223)))

(declare-fun b!157076 () Bool)

(declare-fun res!74224 () Bool)

(declare-fun e!102802 () Bool)

(assert (=> b!157076 (=> (not res!74224) (not e!102802))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157076 (= res!74224 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!74225 () Bool)

(assert (=> start!15758 (=> (not res!74225) (not e!102802))))

(declare-fun valid!693 (LongMapFixedSize!1444) Bool)

(assert (=> start!15758 (= res!74225 (valid!693 thiss!1248))))

(assert (=> start!15758 e!102802))

(assert (=> start!15758 e!102800))

(assert (=> start!15758 true))

(assert (=> start!15758 tp_is_empty!3223))

(declare-fun b!157077 () Bool)

(assert (=> b!157077 (= e!102799 (and e!102798 mapRes!5477))))

(declare-fun condMapEmpty!5477 () Bool)

(declare-fun mapDefault!5477 () ValueCell!1268)

(assert (=> b!157077 (= condMapEmpty!5477 (= (arr!2597 (_values!3147 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1268)) mapDefault!5477)))))

(declare-fun mapNonEmpty!5477 () Bool)

(declare-fun tp!12787 () Bool)

(declare-fun e!102797 () Bool)

(assert (=> mapNonEmpty!5477 (= mapRes!5477 (and tp!12787 e!102797))))

(declare-fun mapRest!5477 () (Array (_ BitVec 32) ValueCell!1268))

(declare-fun mapKey!5477 () (_ BitVec 32))

(declare-fun mapValue!5477 () ValueCell!1268)

(assert (=> mapNonEmpty!5477 (= (arr!2597 (_values!3147 thiss!1248)) (store mapRest!5477 mapKey!5477 mapValue!5477))))

(declare-fun b!157078 () Bool)

(assert (=> b!157078 (= e!102802 (not true))))

(declare-fun lt!81512 () Bool)

(declare-fun v!309 () V!3945)

(assert (=> b!157078 (= lt!81512 (valid!693 (LongMapFixedSize!1445 (defaultEntry!3164 thiss!1248) (mask!7636 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 (_size!771 thiss!1248) (_keys!4938 thiss!1248) (_values!3147 thiss!1248) (_vacant!771 thiss!1248))))))

(declare-datatypes ((tuple2!2836 0))(
  ( (tuple2!2837 (_1!1429 (_ BitVec 64)) (_2!1429 V!3945)) )
))
(declare-datatypes ((List!1875 0))(
  ( (Nil!1872) (Cons!1871 (h!2480 tuple2!2836) (t!6668 List!1875)) )
))
(declare-datatypes ((ListLongMap!1823 0))(
  ( (ListLongMap!1824 (toList!927 List!1875)) )
))
(declare-fun +!196 (ListLongMap!1823 tuple2!2836) ListLongMap!1823)

(declare-fun getCurrentListMap!577 (array!5479 array!5481 (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 (_ BitVec 32) Int) ListLongMap!1823)

(assert (=> b!157078 (= (+!196 (getCurrentListMap!577 (_keys!4938 thiss!1248) (_values!3147 thiss!1248) (mask!7636 thiss!1248) (extraKeys!2905 thiss!1248) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)) (tuple2!2837 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!577 (_keys!4938 thiss!1248) (_values!3147 thiss!1248) (mask!7636 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)))))

(declare-datatypes ((Unit!4946 0))(
  ( (Unit!4947) )
))
(declare-fun lt!81513 () Unit!4946)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!77 (array!5479 array!5481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 V!3945 Int) Unit!4946)

(assert (=> b!157078 (= lt!81513 (lemmaChangeLongMinValueKeyThenAddPairToListMap!77 (_keys!4938 thiss!1248) (_values!3147 thiss!1248) (mask!7636 thiss!1248) (extraKeys!2905 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) v!309 (defaultEntry!3164 thiss!1248)))))

(declare-fun b!157079 () Bool)

(assert (=> b!157079 (= e!102797 tp_is_empty!3223)))

(assert (= (and start!15758 res!74225) b!157076))

(assert (= (and b!157076 res!74224) b!157078))

(assert (= (and b!157077 condMapEmpty!5477) mapIsEmpty!5477))

(assert (= (and b!157077 (not condMapEmpty!5477)) mapNonEmpty!5477))

(get-info :version)

(assert (= (and mapNonEmpty!5477 ((_ is ValueCellFull!1268) mapValue!5477)) b!157079))

(assert (= (and b!157077 ((_ is ValueCellFull!1268) mapDefault!5477)) b!157075))

(assert (= b!157074 b!157077))

(assert (= start!15758 b!157074))

(declare-fun m!189883 () Bool)

(assert (=> b!157074 m!189883))

(declare-fun m!189885 () Bool)

(assert (=> b!157074 m!189885))

(declare-fun m!189887 () Bool)

(assert (=> start!15758 m!189887))

(declare-fun m!189889 () Bool)

(assert (=> mapNonEmpty!5477 m!189889))

(declare-fun m!189891 () Bool)

(assert (=> b!157078 m!189891))

(declare-fun m!189893 () Bool)

(assert (=> b!157078 m!189893))

(declare-fun m!189895 () Bool)

(assert (=> b!157078 m!189895))

(declare-fun m!189897 () Bool)

(assert (=> b!157078 m!189897))

(assert (=> b!157078 m!189891))

(declare-fun m!189899 () Bool)

(assert (=> b!157078 m!189899))

(check-sat (not b_next!3421) b_and!9809 (not b!157078) (not mapNonEmpty!5477) tp_is_empty!3223 (not start!15758) (not b!157074))
(check-sat b_and!9809 (not b_next!3421))
