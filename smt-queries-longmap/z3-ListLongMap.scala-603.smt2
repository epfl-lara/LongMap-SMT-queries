; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15764 () Bool)

(assert start!15764)

(declare-fun b!157129 () Bool)

(declare-fun b_free!3427 () Bool)

(declare-fun b_next!3427 () Bool)

(assert (=> b!157129 (= b_free!3427 (not b_next!3427))))

(declare-fun tp!12805 () Bool)

(declare-fun b_and!9815 () Bool)

(assert (=> b!157129 (= tp!12805 b_and!9815)))

(declare-fun b!157128 () Bool)

(declare-fun e!102852 () Bool)

(declare-fun tp_is_empty!3229 () Bool)

(assert (=> b!157128 (= e!102852 tp_is_empty!3229)))

(declare-fun res!74242 () Bool)

(declare-fun e!102854 () Bool)

(assert (=> start!15764 (=> (not res!74242) (not e!102854))))

(declare-datatypes ((V!3953 0))(
  ( (V!3954 (val!1659 Int)) )
))
(declare-datatypes ((ValueCell!1271 0))(
  ( (ValueCellFull!1271 (v!3518 V!3953)) (EmptyCell!1271) )
))
(declare-datatypes ((array!5491 0))(
  ( (array!5492 (arr!2602 (Array (_ BitVec 32) (_ BitVec 64))) (size!2881 (_ BitVec 32))) )
))
(declare-datatypes ((array!5493 0))(
  ( (array!5494 (arr!2603 (Array (_ BitVec 32) ValueCell!1271)) (size!2882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1450 0))(
  ( (LongMapFixedSize!1451 (defaultEntry!3167 Int) (mask!7641 (_ BitVec 32)) (extraKeys!2908 (_ BitVec 32)) (zeroValue!3010 V!3953) (minValue!3010 V!3953) (_size!774 (_ BitVec 32)) (_keys!4941 array!5491) (_values!3150 array!5493) (_vacant!774 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1450)

(declare-fun valid!696 (LongMapFixedSize!1450) Bool)

(assert (=> start!15764 (= res!74242 (valid!696 thiss!1248))))

(assert (=> start!15764 e!102854))

(declare-fun e!102851 () Bool)

(assert (=> start!15764 e!102851))

(assert (=> start!15764 true))

(assert (=> start!15764 tp_is_empty!3229))

(declare-fun e!102853 () Bool)

(declare-fun array_inv!1675 (array!5491) Bool)

(declare-fun array_inv!1676 (array!5493) Bool)

(assert (=> b!157129 (= e!102851 (and tp!12805 tp_is_empty!3229 (array_inv!1675 (_keys!4941 thiss!1248)) (array_inv!1676 (_values!3150 thiss!1248)) e!102853))))

(declare-fun b!157130 () Bool)

(assert (=> b!157130 (= e!102854 (not true))))

(declare-fun lt!81530 () Bool)

(declare-fun v!309 () V!3953)

(assert (=> b!157130 (= lt!81530 (valid!696 (LongMapFixedSize!1451 (defaultEntry!3167 thiss!1248) (mask!7641 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) v!309 (_size!774 thiss!1248) (_keys!4941 thiss!1248) (_values!3150 thiss!1248) (_vacant!774 thiss!1248))))))

(declare-datatypes ((tuple2!2840 0))(
  ( (tuple2!2841 (_1!1431 (_ BitVec 64)) (_2!1431 V!3953)) )
))
(declare-datatypes ((List!1877 0))(
  ( (Nil!1874) (Cons!1873 (h!2482 tuple2!2840) (t!6670 List!1877)) )
))
(declare-datatypes ((ListLongMap!1827 0))(
  ( (ListLongMap!1828 (toList!929 List!1877)) )
))
(declare-fun +!198 (ListLongMap!1827 tuple2!2840) ListLongMap!1827)

(declare-fun getCurrentListMap!579 (array!5491 array!5493 (_ BitVec 32) (_ BitVec 32) V!3953 V!3953 (_ BitVec 32) Int) ListLongMap!1827)

(assert (=> b!157130 (= (+!198 (getCurrentListMap!579 (_keys!4941 thiss!1248) (_values!3150 thiss!1248) (mask!7641 thiss!1248) (extraKeys!2908 thiss!1248) (zeroValue!3010 thiss!1248) (minValue!3010 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3167 thiss!1248)) (tuple2!2841 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!579 (_keys!4941 thiss!1248) (_values!3150 thiss!1248) (mask!7641 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3167 thiss!1248)))))

(declare-datatypes ((Unit!4950 0))(
  ( (Unit!4951) )
))
(declare-fun lt!81531 () Unit!4950)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!79 (array!5491 array!5493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3953 V!3953 V!3953 Int) Unit!4950)

(assert (=> b!157130 (= lt!81531 (lemmaChangeLongMinValueKeyThenAddPairToListMap!79 (_keys!4941 thiss!1248) (_values!3150 thiss!1248) (mask!7641 thiss!1248) (extraKeys!2908 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) (minValue!3010 thiss!1248) v!309 (defaultEntry!3167 thiss!1248)))))

(declare-fun b!157131 () Bool)

(declare-fun res!74243 () Bool)

(assert (=> b!157131 (=> (not res!74243) (not e!102854))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157131 (= res!74243 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5486 () Bool)

(declare-fun mapRes!5486 () Bool)

(declare-fun tp!12806 () Bool)

(declare-fun e!102856 () Bool)

(assert (=> mapNonEmpty!5486 (= mapRes!5486 (and tp!12806 e!102856))))

(declare-fun mapKey!5486 () (_ BitVec 32))

(declare-fun mapValue!5486 () ValueCell!1271)

(declare-fun mapRest!5486 () (Array (_ BitVec 32) ValueCell!1271))

(assert (=> mapNonEmpty!5486 (= (arr!2603 (_values!3150 thiss!1248)) (store mapRest!5486 mapKey!5486 mapValue!5486))))

(declare-fun b!157132 () Bool)

(assert (=> b!157132 (= e!102853 (and e!102852 mapRes!5486))))

(declare-fun condMapEmpty!5486 () Bool)

(declare-fun mapDefault!5486 () ValueCell!1271)

(assert (=> b!157132 (= condMapEmpty!5486 (= (arr!2603 (_values!3150 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1271)) mapDefault!5486)))))

(declare-fun mapIsEmpty!5486 () Bool)

(assert (=> mapIsEmpty!5486 mapRes!5486))

(declare-fun b!157133 () Bool)

(assert (=> b!157133 (= e!102856 tp_is_empty!3229)))

(assert (= (and start!15764 res!74242) b!157131))

(assert (= (and b!157131 res!74243) b!157130))

(assert (= (and b!157132 condMapEmpty!5486) mapIsEmpty!5486))

(assert (= (and b!157132 (not condMapEmpty!5486)) mapNonEmpty!5486))

(get-info :version)

(assert (= (and mapNonEmpty!5486 ((_ is ValueCellFull!1271) mapValue!5486)) b!157133))

(assert (= (and b!157132 ((_ is ValueCellFull!1271) mapDefault!5486)) b!157128))

(assert (= b!157129 b!157132))

(assert (= start!15764 b!157129))

(declare-fun m!189937 () Bool)

(assert (=> start!15764 m!189937))

(declare-fun m!189939 () Bool)

(assert (=> b!157129 m!189939))

(declare-fun m!189941 () Bool)

(assert (=> b!157129 m!189941))

(declare-fun m!189943 () Bool)

(assert (=> b!157130 m!189943))

(declare-fun m!189945 () Bool)

(assert (=> b!157130 m!189945))

(declare-fun m!189947 () Bool)

(assert (=> b!157130 m!189947))

(declare-fun m!189949 () Bool)

(assert (=> b!157130 m!189949))

(assert (=> b!157130 m!189943))

(declare-fun m!189951 () Bool)

(assert (=> b!157130 m!189951))

(declare-fun m!189953 () Bool)

(assert (=> mapNonEmpty!5486 m!189953))

(check-sat (not mapNonEmpty!5486) (not start!15764) (not b_next!3427) tp_is_empty!3229 (not b!157129) b_and!9815 (not b!157130))
(check-sat b_and!9815 (not b_next!3427))
