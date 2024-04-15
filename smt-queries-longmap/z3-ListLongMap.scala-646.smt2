; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16228 () Bool)

(assert start!16228)

(declare-fun b!161679 () Bool)

(declare-fun b_free!3685 () Bool)

(declare-fun b_next!3685 () Bool)

(assert (=> b!161679 (= b_free!3685 (not b_next!3685))))

(declare-fun tp!13624 () Bool)

(declare-fun b_and!10073 () Bool)

(assert (=> b!161679 (= tp!13624 b_and!10073)))

(declare-fun res!76561 () Bool)

(declare-fun e!105761 () Bool)

(assert (=> start!16228 (=> (not res!76561) (not e!105761))))

(declare-datatypes ((V!4297 0))(
  ( (V!4298 (val!1788 Int)) )
))
(declare-datatypes ((ValueCell!1400 0))(
  ( (ValueCellFull!1400 (v!3647 V!4297)) (EmptyCell!1400) )
))
(declare-datatypes ((array!6033 0))(
  ( (array!6034 (arr!2860 (Array (_ BitVec 32) (_ BitVec 64))) (size!3145 (_ BitVec 32))) )
))
(declare-datatypes ((array!6035 0))(
  ( (array!6036 (arr!2861 (Array (_ BitVec 32) ValueCell!1400)) (size!3146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1708 0))(
  ( (LongMapFixedSize!1709 (defaultEntry!3296 Int) (mask!7899 (_ BitVec 32)) (extraKeys!3037 (_ BitVec 32)) (zeroValue!3139 V!4297) (minValue!3139 V!4297) (_size!903 (_ BitVec 32)) (_keys!5096 array!6033) (_values!3279 array!6035) (_vacant!903 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1708)

(declare-fun valid!778 (LongMapFixedSize!1708) Bool)

(assert (=> start!16228 (= res!76561 (valid!778 thiss!1248))))

(assert (=> start!16228 e!105761))

(declare-fun e!105758 () Bool)

(assert (=> start!16228 e!105758))

(assert (=> start!16228 true))

(declare-fun tp_is_empty!3487 () Bool)

(assert (=> start!16228 tp_is_empty!3487))

(declare-fun mapIsEmpty!5918 () Bool)

(declare-fun mapRes!5918 () Bool)

(assert (=> mapIsEmpty!5918 mapRes!5918))

(declare-fun b!161677 () Bool)

(declare-fun e!105762 () Bool)

(assert (=> b!161677 (= e!105762 tp_is_empty!3487)))

(declare-fun mapNonEmpty!5918 () Bool)

(declare-fun tp!13625 () Bool)

(assert (=> mapNonEmpty!5918 (= mapRes!5918 (and tp!13625 e!105762))))

(declare-fun mapKey!5918 () (_ BitVec 32))

(declare-fun mapRest!5918 () (Array (_ BitVec 32) ValueCell!1400))

(declare-fun mapValue!5918 () ValueCell!1400)

(assert (=> mapNonEmpty!5918 (= (arr!2861 (_values!3279 thiss!1248)) (store mapRest!5918 mapKey!5918 mapValue!5918))))

(declare-fun b!161678 () Bool)

(declare-fun e!105763 () Bool)

(assert (=> b!161678 (= e!105763 tp_is_empty!3487)))

(declare-fun e!105757 () Bool)

(declare-fun array_inv!1849 (array!6033) Bool)

(declare-fun array_inv!1850 (array!6035) Bool)

(assert (=> b!161679 (= e!105758 (and tp!13624 tp_is_empty!3487 (array_inv!1849 (_keys!5096 thiss!1248)) (array_inv!1850 (_values!3279 thiss!1248)) e!105757))))

(declare-fun b!161680 () Bool)

(declare-fun e!105759 () Bool)

(assert (=> b!161680 (= e!105761 e!105759)))

(declare-fun res!76562 () Bool)

(assert (=> b!161680 (=> (not res!76562) (not e!105759))))

(declare-datatypes ((SeekEntryResult!372 0))(
  ( (MissingZero!372 (index!3656 (_ BitVec 32))) (Found!372 (index!3657 (_ BitVec 32))) (Intermediate!372 (undefined!1184 Bool) (index!3658 (_ BitVec 32)) (x!17883 (_ BitVec 32))) (Undefined!372) (MissingVacant!372 (index!3659 (_ BitVec 32))) )
))
(declare-fun lt!82107 () SeekEntryResult!372)

(get-info :version)

(assert (=> b!161680 (= res!76562 (and (not ((_ is Undefined!372) lt!82107)) ((_ is MissingVacant!372) lt!82107)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6033 (_ BitVec 32)) SeekEntryResult!372)

(assert (=> b!161680 (= lt!82107 (seekEntryOrOpen!0 key!828 (_keys!5096 thiss!1248) (mask!7899 thiss!1248)))))

(declare-fun b!161681 () Bool)

(declare-fun res!76563 () Bool)

(assert (=> b!161681 (=> (not res!76563) (not e!105761))))

(assert (=> b!161681 (= res!76563 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161682 () Bool)

(assert (=> b!161682 (= e!105759 false)))

(declare-fun v!309 () V!4297)

(declare-fun lt!82106 () Bool)

(declare-datatypes ((tuple2!2944 0))(
  ( (tuple2!2945 (_1!1483 Bool) (_2!1483 LongMapFixedSize!1708)) )
))
(declare-fun updateHelperNewKey!72 (LongMapFixedSize!1708 (_ BitVec 64) V!4297 (_ BitVec 32)) tuple2!2944)

(assert (=> b!161682 (= lt!82106 (valid!778 (_2!1483 (updateHelperNewKey!72 thiss!1248 key!828 v!309 (index!3659 lt!82107)))))))

(declare-fun b!161683 () Bool)

(assert (=> b!161683 (= e!105757 (and e!105763 mapRes!5918))))

(declare-fun condMapEmpty!5918 () Bool)

(declare-fun mapDefault!5918 () ValueCell!1400)

(assert (=> b!161683 (= condMapEmpty!5918 (= (arr!2861 (_values!3279 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1400)) mapDefault!5918)))))

(assert (= (and start!16228 res!76561) b!161681))

(assert (= (and b!161681 res!76563) b!161680))

(assert (= (and b!161680 res!76562) b!161682))

(assert (= (and b!161683 condMapEmpty!5918) mapIsEmpty!5918))

(assert (= (and b!161683 (not condMapEmpty!5918)) mapNonEmpty!5918))

(assert (= (and mapNonEmpty!5918 ((_ is ValueCellFull!1400) mapValue!5918)) b!161677))

(assert (= (and b!161683 ((_ is ValueCellFull!1400) mapDefault!5918)) b!161678))

(assert (= b!161679 b!161683))

(assert (= start!16228 b!161679))

(declare-fun m!192547 () Bool)

(assert (=> b!161680 m!192547))

(declare-fun m!192549 () Bool)

(assert (=> b!161682 m!192549))

(declare-fun m!192551 () Bool)

(assert (=> b!161682 m!192551))

(declare-fun m!192553 () Bool)

(assert (=> b!161679 m!192553))

(declare-fun m!192555 () Bool)

(assert (=> b!161679 m!192555))

(declare-fun m!192557 () Bool)

(assert (=> mapNonEmpty!5918 m!192557))

(declare-fun m!192559 () Bool)

(assert (=> start!16228 m!192559))

(check-sat tp_is_empty!3487 (not b_next!3685) (not b!161682) (not b!161680) b_and!10073 (not b!161679) (not start!16228) (not mapNonEmpty!5918))
(check-sat b_and!10073 (not b_next!3685))
