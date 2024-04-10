; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16208 () Bool)

(assert start!16208)

(declare-fun b!161681 () Bool)

(declare-fun b_free!3669 () Bool)

(declare-fun b_next!3669 () Bool)

(assert (=> b!161681 (= b_free!3669 (not b_next!3669))))

(declare-fun tp!13576 () Bool)

(declare-fun b_and!10083 () Bool)

(assert (=> b!161681 (= tp!13576 b_and!10083)))

(declare-fun b!161678 () Bool)

(declare-fun res!76606 () Bool)

(declare-fun e!105717 () Bool)

(assert (=> b!161678 (=> (not res!76606) (not e!105717))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161678 (= res!76606 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161679 () Bool)

(declare-fun e!105714 () Bool)

(declare-fun tp_is_empty!3471 () Bool)

(assert (=> b!161679 (= e!105714 tp_is_empty!3471)))

(declare-fun b!161680 () Bool)

(declare-datatypes ((SeekEntryResult!359 0))(
  ( (MissingZero!359 (index!3604 (_ BitVec 32))) (Found!359 (index!3605 (_ BitVec 32))) (Intermediate!359 (undefined!1171 Bool) (index!3606 (_ BitVec 32)) (x!17847 (_ BitVec 32))) (Undefined!359) (MissingVacant!359 (index!3607 (_ BitVec 32))) )
))
(declare-fun lt!82261 () SeekEntryResult!359)

(get-info :version)

(assert (=> b!161680 (= e!105717 (and (not ((_ is Undefined!359) lt!82261)) ((_ is MissingVacant!359) lt!82261) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!4275 0))(
  ( (V!4276 (val!1780 Int)) )
))
(declare-datatypes ((ValueCell!1392 0))(
  ( (ValueCellFull!1392 (v!3645 V!4275)) (EmptyCell!1392) )
))
(declare-datatypes ((array!6021 0))(
  ( (array!6022 (arr!2855 (Array (_ BitVec 32) (_ BitVec 64))) (size!3139 (_ BitVec 32))) )
))
(declare-datatypes ((array!6023 0))(
  ( (array!6024 (arr!2856 (Array (_ BitVec 32) ValueCell!1392)) (size!3140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1692 0))(
  ( (LongMapFixedSize!1693 (defaultEntry!3288 Int) (mask!7886 (_ BitVec 32)) (extraKeys!3029 (_ BitVec 32)) (zeroValue!3131 V!4275) (minValue!3131 V!4275) (_size!895 (_ BitVec 32)) (_keys!5089 array!6021) (_values!3271 array!6023) (_vacant!895 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1692)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6021 (_ BitVec 32)) SeekEntryResult!359)

(assert (=> b!161680 (= lt!82261 (seekEntryOrOpen!0 key!828 (_keys!5089 thiss!1248) (mask!7886 thiss!1248)))))

(declare-fun e!105713 () Bool)

(declare-fun e!105712 () Bool)

(declare-fun array_inv!1823 (array!6021) Bool)

(declare-fun array_inv!1824 (array!6023) Bool)

(assert (=> b!161681 (= e!105712 (and tp!13576 tp_is_empty!3471 (array_inv!1823 (_keys!5089 thiss!1248)) (array_inv!1824 (_values!3271 thiss!1248)) e!105713))))

(declare-fun res!76607 () Bool)

(assert (=> start!16208 (=> (not res!76607) (not e!105717))))

(declare-fun valid!773 (LongMapFixedSize!1692) Bool)

(assert (=> start!16208 (= res!76607 (valid!773 thiss!1248))))

(assert (=> start!16208 e!105717))

(assert (=> start!16208 e!105712))

(assert (=> start!16208 true))

(declare-fun mapIsEmpty!5894 () Bool)

(declare-fun mapRes!5894 () Bool)

(assert (=> mapIsEmpty!5894 mapRes!5894))

(declare-fun mapNonEmpty!5894 () Bool)

(declare-fun tp!13577 () Bool)

(declare-fun e!105716 () Bool)

(assert (=> mapNonEmpty!5894 (= mapRes!5894 (and tp!13577 e!105716))))

(declare-fun mapRest!5894 () (Array (_ BitVec 32) ValueCell!1392))

(declare-fun mapValue!5894 () ValueCell!1392)

(declare-fun mapKey!5894 () (_ BitVec 32))

(assert (=> mapNonEmpty!5894 (= (arr!2856 (_values!3271 thiss!1248)) (store mapRest!5894 mapKey!5894 mapValue!5894))))

(declare-fun b!161682 () Bool)

(assert (=> b!161682 (= e!105716 tp_is_empty!3471)))

(declare-fun b!161683 () Bool)

(assert (=> b!161683 (= e!105713 (and e!105714 mapRes!5894))))

(declare-fun condMapEmpty!5894 () Bool)

(declare-fun mapDefault!5894 () ValueCell!1392)

(assert (=> b!161683 (= condMapEmpty!5894 (= (arr!2856 (_values!3271 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1392)) mapDefault!5894)))))

(assert (= (and start!16208 res!76607) b!161678))

(assert (= (and b!161678 res!76606) b!161680))

(assert (= (and b!161683 condMapEmpty!5894) mapIsEmpty!5894))

(assert (= (and b!161683 (not condMapEmpty!5894)) mapNonEmpty!5894))

(assert (= (and mapNonEmpty!5894 ((_ is ValueCellFull!1392) mapValue!5894)) b!161682))

(assert (= (and b!161683 ((_ is ValueCellFull!1392) mapDefault!5894)) b!161679))

(assert (= b!161681 b!161683))

(assert (= start!16208 b!161681))

(declare-fun m!193087 () Bool)

(assert (=> b!161680 m!193087))

(declare-fun m!193089 () Bool)

(assert (=> b!161681 m!193089))

(declare-fun m!193091 () Bool)

(assert (=> b!161681 m!193091))

(declare-fun m!193093 () Bool)

(assert (=> start!16208 m!193093))

(declare-fun m!193095 () Bool)

(assert (=> mapNonEmpty!5894 m!193095))

(check-sat tp_is_empty!3471 (not b_next!3669) (not start!16208) b_and!10083 (not b!161680) (not b!161681) (not mapNonEmpty!5894))
(check-sat b_and!10083 (not b_next!3669))
