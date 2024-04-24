; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16210 () Bool)

(assert start!16210)

(declare-fun b!161712 () Bool)

(declare-fun b_free!3667 () Bool)

(declare-fun b_next!3667 () Bool)

(assert (=> b!161712 (= b_free!3667 (not b_next!3667))))

(declare-fun tp!13571 () Bool)

(declare-fun b_and!10095 () Bool)

(assert (=> b!161712 (= tp!13571 b_and!10095)))

(declare-fun b!161707 () Bool)

(declare-fun e!105719 () Bool)

(declare-fun e!105722 () Bool)

(declare-fun mapRes!5891 () Bool)

(assert (=> b!161707 (= e!105719 (and e!105722 mapRes!5891))))

(declare-fun condMapEmpty!5891 () Bool)

(declare-datatypes ((V!4273 0))(
  ( (V!4274 (val!1779 Int)) )
))
(declare-datatypes ((ValueCell!1391 0))(
  ( (ValueCellFull!1391 (v!3645 V!4273)) (EmptyCell!1391) )
))
(declare-datatypes ((array!6003 0))(
  ( (array!6004 (arr!2846 (Array (_ BitVec 32) (_ BitVec 64))) (size!3130 (_ BitVec 32))) )
))
(declare-datatypes ((array!6005 0))(
  ( (array!6006 (arr!2847 (Array (_ BitVec 32) ValueCell!1391)) (size!3131 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1690 0))(
  ( (LongMapFixedSize!1691 (defaultEntry!3287 Int) (mask!7885 (_ BitVec 32)) (extraKeys!3028 (_ BitVec 32)) (zeroValue!3130 V!4273) (minValue!3130 V!4273) (_size!894 (_ BitVec 32)) (_keys!5088 array!6003) (_values!3270 array!6005) (_vacant!894 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1690)

(declare-fun mapDefault!5891 () ValueCell!1391)

(assert (=> b!161707 (= condMapEmpty!5891 (= (arr!2847 (_values!3270 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1391)) mapDefault!5891)))))

(declare-fun mapNonEmpty!5891 () Bool)

(declare-fun tp!13570 () Bool)

(declare-fun e!105720 () Bool)

(assert (=> mapNonEmpty!5891 (= mapRes!5891 (and tp!13570 e!105720))))

(declare-fun mapRest!5891 () (Array (_ BitVec 32) ValueCell!1391))

(declare-fun mapKey!5891 () (_ BitVec 32))

(declare-fun mapValue!5891 () ValueCell!1391)

(assert (=> mapNonEmpty!5891 (= (arr!2847 (_values!3270 thiss!1248)) (store mapRest!5891 mapKey!5891 mapValue!5891))))

(declare-fun b!161708 () Bool)

(declare-fun tp_is_empty!3469 () Bool)

(assert (=> b!161708 (= e!105720 tp_is_empty!3469)))

(declare-fun b!161709 () Bool)

(assert (=> b!161709 (= e!105722 tp_is_empty!3469)))

(declare-fun b!161710 () Bool)

(declare-fun e!105721 () Bool)

(declare-datatypes ((SeekEntryResult!354 0))(
  ( (MissingZero!354 (index!3584 (_ BitVec 32))) (Found!354 (index!3585 (_ BitVec 32))) (Intermediate!354 (undefined!1166 Bool) (index!3586 (_ BitVec 32)) (x!17842 (_ BitVec 32))) (Undefined!354) (MissingVacant!354 (index!3587 (_ BitVec 32))) )
))
(declare-fun lt!82317 () SeekEntryResult!354)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!161710 (= e!105721 (and (not ((_ is Undefined!354) lt!82317)) ((_ is MissingVacant!354) lt!82317) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6003 (_ BitVec 32)) SeekEntryResult!354)

(assert (=> b!161710 (= lt!82317 (seekEntryOrOpen!0 key!828 (_keys!5088 thiss!1248) (mask!7885 thiss!1248)))))

(declare-fun e!105718 () Bool)

(declare-fun array_inv!1825 (array!6003) Bool)

(declare-fun array_inv!1826 (array!6005) Bool)

(assert (=> b!161712 (= e!105718 (and tp!13571 tp_is_empty!3469 (array_inv!1825 (_keys!5088 thiss!1248)) (array_inv!1826 (_values!3270 thiss!1248)) e!105719))))

(declare-fun mapIsEmpty!5891 () Bool)

(assert (=> mapIsEmpty!5891 mapRes!5891))

(declare-fun b!161711 () Bool)

(declare-fun res!76621 () Bool)

(assert (=> b!161711 (=> (not res!76621) (not e!105721))))

(assert (=> b!161711 (= res!76621 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76622 () Bool)

(assert (=> start!16210 (=> (not res!76622) (not e!105721))))

(declare-fun valid!792 (LongMapFixedSize!1690) Bool)

(assert (=> start!16210 (= res!76622 (valid!792 thiss!1248))))

(assert (=> start!16210 e!105721))

(assert (=> start!16210 e!105718))

(assert (=> start!16210 true))

(assert (= (and start!16210 res!76622) b!161711))

(assert (= (and b!161711 res!76621) b!161710))

(assert (= (and b!161707 condMapEmpty!5891) mapIsEmpty!5891))

(assert (= (and b!161707 (not condMapEmpty!5891)) mapNonEmpty!5891))

(assert (= (and mapNonEmpty!5891 ((_ is ValueCellFull!1391) mapValue!5891)) b!161708))

(assert (= (and b!161707 ((_ is ValueCellFull!1391) mapDefault!5891)) b!161709))

(assert (= b!161712 b!161707))

(assert (= start!16210 b!161712))

(declare-fun m!193259 () Bool)

(assert (=> mapNonEmpty!5891 m!193259))

(declare-fun m!193261 () Bool)

(assert (=> b!161710 m!193261))

(declare-fun m!193263 () Bool)

(assert (=> b!161712 m!193263))

(declare-fun m!193265 () Bool)

(assert (=> b!161712 m!193265))

(declare-fun m!193267 () Bool)

(assert (=> start!16210 m!193267))

(check-sat tp_is_empty!3469 b_and!10095 (not b!161712) (not b_next!3667) (not b!161710) (not mapNonEmpty!5891) (not start!16210))
(check-sat b_and!10095 (not b_next!3667))
