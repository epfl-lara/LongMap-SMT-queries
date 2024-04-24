; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15764 () Bool)

(assert start!15764)

(declare-fun b!157327 () Bool)

(declare-fun b_free!3427 () Bool)

(declare-fun b_next!3427 () Bool)

(assert (=> b!157327 (= b_free!3427 (not b_next!3427))))

(declare-fun tp!12806 () Bool)

(declare-fun b_and!9855 () Bool)

(assert (=> b!157327 (= tp!12806 b_and!9855)))

(declare-fun b!157322 () Bool)

(declare-fun e!102979 () Bool)

(declare-fun e!102978 () Bool)

(declare-fun mapRes!5486 () Bool)

(assert (=> b!157322 (= e!102979 (and e!102978 mapRes!5486))))

(declare-fun condMapEmpty!5486 () Bool)

(declare-datatypes ((V!3953 0))(
  ( (V!3954 (val!1659 Int)) )
))
(declare-datatypes ((ValueCell!1271 0))(
  ( (ValueCellFull!1271 (v!3525 V!3953)) (EmptyCell!1271) )
))
(declare-datatypes ((array!5497 0))(
  ( (array!5498 (arr!2606 (Array (_ BitVec 32) (_ BitVec 64))) (size!2884 (_ BitVec 32))) )
))
(declare-datatypes ((array!5499 0))(
  ( (array!5500 (arr!2607 (Array (_ BitVec 32) ValueCell!1271)) (size!2885 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1450 0))(
  ( (LongMapFixedSize!1451 (defaultEntry!3167 Int) (mask!7642 (_ BitVec 32)) (extraKeys!2908 (_ BitVec 32)) (zeroValue!3010 V!3953) (minValue!3010 V!3953) (_size!774 (_ BitVec 32)) (_keys!4942 array!5497) (_values!3150 array!5499) (_vacant!774 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1450)

(declare-fun mapDefault!5486 () ValueCell!1271)

(assert (=> b!157322 (= condMapEmpty!5486 (= (arr!2607 (_values!3150 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1271)) mapDefault!5486)))))

(declare-fun mapNonEmpty!5486 () Bool)

(declare-fun tp!12805 () Bool)

(declare-fun e!102976 () Bool)

(assert (=> mapNonEmpty!5486 (= mapRes!5486 (and tp!12805 e!102976))))

(declare-fun mapRest!5486 () (Array (_ BitVec 32) ValueCell!1271))

(declare-fun mapValue!5486 () ValueCell!1271)

(declare-fun mapKey!5486 () (_ BitVec 32))

(assert (=> mapNonEmpty!5486 (= (arr!2607 (_values!3150 thiss!1248)) (store mapRest!5486 mapKey!5486 mapValue!5486))))

(declare-fun b!157323 () Bool)

(declare-fun tp_is_empty!3229 () Bool)

(assert (=> b!157323 (= e!102978 tp_is_empty!3229)))

(declare-fun res!74359 () Bool)

(declare-fun e!102980 () Bool)

(assert (=> start!15764 (=> (not res!74359) (not e!102980))))

(declare-fun valid!709 (LongMapFixedSize!1450) Bool)

(assert (=> start!15764 (= res!74359 (valid!709 thiss!1248))))

(assert (=> start!15764 e!102980))

(declare-fun e!102977 () Bool)

(assert (=> start!15764 e!102977))

(assert (=> start!15764 true))

(assert (=> start!15764 tp_is_empty!3229))

(declare-fun b!157324 () Bool)

(declare-fun res!74358 () Bool)

(assert (=> b!157324 (=> (not res!74358) (not e!102980))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157324 (= res!74358 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5486 () Bool)

(assert (=> mapIsEmpty!5486 mapRes!5486))

(declare-fun b!157325 () Bool)

(assert (=> b!157325 (= e!102976 tp_is_empty!3229)))

(declare-fun b!157326 () Bool)

(assert (=> b!157326 (= e!102980 (not true))))

(declare-fun lt!81770 () Bool)

(declare-fun v!309 () V!3953)

(assert (=> b!157326 (= lt!81770 (valid!709 (LongMapFixedSize!1451 (defaultEntry!3167 thiss!1248) (mask!7642 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) v!309 (_size!774 thiss!1248) (_keys!4942 thiss!1248) (_values!3150 thiss!1248) (_vacant!774 thiss!1248))))))

(declare-datatypes ((tuple2!2810 0))(
  ( (tuple2!2811 (_1!1416 (_ BitVec 64)) (_2!1416 V!3953)) )
))
(declare-datatypes ((List!1864 0))(
  ( (Nil!1861) (Cons!1860 (h!2469 tuple2!2810) (t!6658 List!1864)) )
))
(declare-datatypes ((ListLongMap!1809 0))(
  ( (ListLongMap!1810 (toList!920 List!1864)) )
))
(declare-fun +!212 (ListLongMap!1809 tuple2!2810) ListLongMap!1809)

(declare-fun getCurrentListMap!587 (array!5497 array!5499 (_ BitVec 32) (_ BitVec 32) V!3953 V!3953 (_ BitVec 32) Int) ListLongMap!1809)

(assert (=> b!157326 (= (+!212 (getCurrentListMap!587 (_keys!4942 thiss!1248) (_values!3150 thiss!1248) (mask!7642 thiss!1248) (extraKeys!2908 thiss!1248) (zeroValue!3010 thiss!1248) (minValue!3010 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3167 thiss!1248)) (tuple2!2811 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!587 (_keys!4942 thiss!1248) (_values!3150 thiss!1248) (mask!7642 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3167 thiss!1248)))))

(declare-datatypes ((Unit!4979 0))(
  ( (Unit!4980) )
))
(declare-fun lt!81771 () Unit!4979)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (array!5497 array!5499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3953 V!3953 V!3953 Int) Unit!4979)

(assert (=> b!157326 (= lt!81771 (lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (_keys!4942 thiss!1248) (_values!3150 thiss!1248) (mask!7642 thiss!1248) (extraKeys!2908 thiss!1248) (bvor (extraKeys!2908 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3010 thiss!1248) (minValue!3010 thiss!1248) v!309 (defaultEntry!3167 thiss!1248)))))

(declare-fun array_inv!1657 (array!5497) Bool)

(declare-fun array_inv!1658 (array!5499) Bool)

(assert (=> b!157327 (= e!102977 (and tp!12806 tp_is_empty!3229 (array_inv!1657 (_keys!4942 thiss!1248)) (array_inv!1658 (_values!3150 thiss!1248)) e!102979))))

(assert (= (and start!15764 res!74359) b!157324))

(assert (= (and b!157324 res!74358) b!157326))

(assert (= (and b!157322 condMapEmpty!5486) mapIsEmpty!5486))

(assert (= (and b!157322 (not condMapEmpty!5486)) mapNonEmpty!5486))

(get-info :version)

(assert (= (and mapNonEmpty!5486 ((_ is ValueCellFull!1271) mapValue!5486)) b!157325))

(assert (= (and b!157322 ((_ is ValueCellFull!1271) mapDefault!5486)) b!157323))

(assert (= b!157327 b!157322))

(assert (= start!15764 b!157327))

(declare-fun m!190739 () Bool)

(assert (=> mapNonEmpty!5486 m!190739))

(declare-fun m!190741 () Bool)

(assert (=> start!15764 m!190741))

(declare-fun m!190743 () Bool)

(assert (=> b!157326 m!190743))

(declare-fun m!190745 () Bool)

(assert (=> b!157326 m!190745))

(declare-fun m!190747 () Bool)

(assert (=> b!157326 m!190747))

(declare-fun m!190749 () Bool)

(assert (=> b!157326 m!190749))

(assert (=> b!157326 m!190743))

(declare-fun m!190751 () Bool)

(assert (=> b!157326 m!190751))

(declare-fun m!190753 () Bool)

(assert (=> b!157327 m!190753))

(declare-fun m!190755 () Bool)

(assert (=> b!157327 m!190755))

(check-sat (not b_next!3427) (not b!157326) b_and!9855 tp_is_empty!3229 (not mapNonEmpty!5486) (not b!157327) (not start!15764))
(check-sat b_and!9855 (not b_next!3427))
