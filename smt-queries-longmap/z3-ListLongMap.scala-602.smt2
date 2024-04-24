; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15758 () Bool)

(assert start!15758)

(declare-fun b!157272 () Bool)

(declare-fun b_free!3421 () Bool)

(declare-fun b_next!3421 () Bool)

(assert (=> b!157272 (= b_free!3421 (not b_next!3421))))

(declare-fun tp!12788 () Bool)

(declare-fun b_and!9849 () Bool)

(assert (=> b!157272 (= tp!12788 b_and!9849)))

(declare-fun b!157268 () Bool)

(declare-fun res!74341 () Bool)

(declare-fun e!102925 () Bool)

(assert (=> b!157268 (=> (not res!74341) (not e!102925))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157268 (= res!74341 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!74340 () Bool)

(assert (=> start!15758 (=> (not res!74340) (not e!102925))))

(declare-datatypes ((V!3945 0))(
  ( (V!3946 (val!1656 Int)) )
))
(declare-datatypes ((ValueCell!1268 0))(
  ( (ValueCellFull!1268 (v!3522 V!3945)) (EmptyCell!1268) )
))
(declare-datatypes ((array!5485 0))(
  ( (array!5486 (arr!2600 (Array (_ BitVec 32) (_ BitVec 64))) (size!2878 (_ BitVec 32))) )
))
(declare-datatypes ((array!5487 0))(
  ( (array!5488 (arr!2601 (Array (_ BitVec 32) ValueCell!1268)) (size!2879 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1444 0))(
  ( (LongMapFixedSize!1445 (defaultEntry!3164 Int) (mask!7637 (_ BitVec 32)) (extraKeys!2905 (_ BitVec 32)) (zeroValue!3007 V!3945) (minValue!3007 V!3945) (_size!771 (_ BitVec 32)) (_keys!4939 array!5485) (_values!3147 array!5487) (_vacant!771 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1444)

(declare-fun valid!706 (LongMapFixedSize!1444) Bool)

(assert (=> start!15758 (= res!74340 (valid!706 thiss!1248))))

(assert (=> start!15758 e!102925))

(declare-fun e!102924 () Bool)

(assert (=> start!15758 e!102924))

(assert (=> start!15758 true))

(declare-fun tp_is_empty!3223 () Bool)

(assert (=> start!15758 tp_is_empty!3223))

(declare-fun mapIsEmpty!5477 () Bool)

(declare-fun mapRes!5477 () Bool)

(assert (=> mapIsEmpty!5477 mapRes!5477))

(declare-fun b!157269 () Bool)

(declare-fun e!102927 () Bool)

(assert (=> b!157269 (= e!102927 tp_is_empty!3223)))

(declare-fun b!157270 () Bool)

(declare-fun e!102926 () Bool)

(assert (=> b!157270 (= e!102926 (and e!102927 mapRes!5477))))

(declare-fun condMapEmpty!5477 () Bool)

(declare-fun mapDefault!5477 () ValueCell!1268)

(assert (=> b!157270 (= condMapEmpty!5477 (= (arr!2601 (_values!3147 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1268)) mapDefault!5477)))))

(declare-fun b!157271 () Bool)

(assert (=> b!157271 (= e!102925 (not true))))

(declare-fun lt!81752 () Bool)

(declare-fun v!309 () V!3945)

(assert (=> b!157271 (= lt!81752 (valid!706 (LongMapFixedSize!1445 (defaultEntry!3164 thiss!1248) (mask!7637 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 (_size!771 thiss!1248) (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (_vacant!771 thiss!1248))))))

(declare-datatypes ((tuple2!2804 0))(
  ( (tuple2!2805 (_1!1413 (_ BitVec 64)) (_2!1413 V!3945)) )
))
(declare-datatypes ((List!1861 0))(
  ( (Nil!1858) (Cons!1857 (h!2466 tuple2!2804) (t!6655 List!1861)) )
))
(declare-datatypes ((ListLongMap!1803 0))(
  ( (ListLongMap!1804 (toList!917 List!1861)) )
))
(declare-fun +!209 (ListLongMap!1803 tuple2!2804) ListLongMap!1803)

(declare-fun getCurrentListMap!584 (array!5485 array!5487 (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 (_ BitVec 32) Int) ListLongMap!1803)

(assert (=> b!157271 (= (+!209 (getCurrentListMap!584 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (extraKeys!2905 thiss!1248) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)) (tuple2!2805 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!584 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)))))

(declare-datatypes ((Unit!4973 0))(
  ( (Unit!4974) )
))
(declare-fun lt!81753 () Unit!4973)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!78 (array!5485 array!5487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 V!3945 Int) Unit!4973)

(assert (=> b!157271 (= lt!81753 (lemmaChangeLongMinValueKeyThenAddPairToListMap!78 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (extraKeys!2905 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) v!309 (defaultEntry!3164 thiss!1248)))))

(declare-fun array_inv!1651 (array!5485) Bool)

(declare-fun array_inv!1652 (array!5487) Bool)

(assert (=> b!157272 (= e!102924 (and tp!12788 tp_is_empty!3223 (array_inv!1651 (_keys!4939 thiss!1248)) (array_inv!1652 (_values!3147 thiss!1248)) e!102926))))

(declare-fun mapNonEmpty!5477 () Bool)

(declare-fun tp!12787 () Bool)

(declare-fun e!102922 () Bool)

(assert (=> mapNonEmpty!5477 (= mapRes!5477 (and tp!12787 e!102922))))

(declare-fun mapRest!5477 () (Array (_ BitVec 32) ValueCell!1268))

(declare-fun mapValue!5477 () ValueCell!1268)

(declare-fun mapKey!5477 () (_ BitVec 32))

(assert (=> mapNonEmpty!5477 (= (arr!2601 (_values!3147 thiss!1248)) (store mapRest!5477 mapKey!5477 mapValue!5477))))

(declare-fun b!157273 () Bool)

(assert (=> b!157273 (= e!102922 tp_is_empty!3223)))

(assert (= (and start!15758 res!74340) b!157268))

(assert (= (and b!157268 res!74341) b!157271))

(assert (= (and b!157270 condMapEmpty!5477) mapIsEmpty!5477))

(assert (= (and b!157270 (not condMapEmpty!5477)) mapNonEmpty!5477))

(get-info :version)

(assert (= (and mapNonEmpty!5477 ((_ is ValueCellFull!1268) mapValue!5477)) b!157273))

(assert (= (and b!157270 ((_ is ValueCellFull!1268) mapDefault!5477)) b!157269))

(assert (= b!157272 b!157270))

(assert (= start!15758 b!157272))

(declare-fun m!190685 () Bool)

(assert (=> start!15758 m!190685))

(declare-fun m!190687 () Bool)

(assert (=> b!157271 m!190687))

(declare-fun m!190689 () Bool)

(assert (=> b!157271 m!190689))

(declare-fun m!190691 () Bool)

(assert (=> b!157271 m!190691))

(declare-fun m!190693 () Bool)

(assert (=> b!157271 m!190693))

(assert (=> b!157271 m!190687))

(declare-fun m!190695 () Bool)

(assert (=> b!157271 m!190695))

(declare-fun m!190697 () Bool)

(assert (=> b!157272 m!190697))

(declare-fun m!190699 () Bool)

(assert (=> b!157272 m!190699))

(declare-fun m!190701 () Bool)

(assert (=> mapNonEmpty!5477 m!190701))

(check-sat (not mapNonEmpty!5477) b_and!9849 (not b!157271) (not b_next!3421) (not start!15758) (not b!157272) tp_is_empty!3223)
(check-sat b_and!9849 (not b_next!3421))
