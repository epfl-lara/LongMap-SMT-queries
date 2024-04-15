; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16234 () Bool)

(assert start!16234)

(declare-fun b!161751 () Bool)

(declare-fun b_free!3691 () Bool)

(declare-fun b_next!3691 () Bool)

(assert (=> b!161751 (= b_free!3691 (not b_next!3691))))

(declare-fun tp!13643 () Bool)

(declare-fun b_and!10079 () Bool)

(assert (=> b!161751 (= tp!13643 b_and!10079)))

(declare-fun b!161744 () Bool)

(declare-fun e!105823 () Bool)

(declare-fun tp_is_empty!3493 () Bool)

(assert (=> b!161744 (= e!105823 tp_is_empty!3493)))

(declare-fun b!161745 () Bool)

(declare-fun res!76592 () Bool)

(declare-fun e!105827 () Bool)

(assert (=> b!161745 (=> (not res!76592) (not e!105827))))

(declare-datatypes ((V!4305 0))(
  ( (V!4306 (val!1791 Int)) )
))
(declare-datatypes ((ValueCell!1403 0))(
  ( (ValueCellFull!1403 (v!3650 V!4305)) (EmptyCell!1403) )
))
(declare-datatypes ((array!6045 0))(
  ( (array!6046 (arr!2866 (Array (_ BitVec 32) (_ BitVec 64))) (size!3151 (_ BitVec 32))) )
))
(declare-datatypes ((array!6047 0))(
  ( (array!6048 (arr!2867 (Array (_ BitVec 32) ValueCell!1403)) (size!3152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1714 0))(
  ( (LongMapFixedSize!1715 (defaultEntry!3299 Int) (mask!7904 (_ BitVec 32)) (extraKeys!3040 (_ BitVec 32)) (zeroValue!3142 V!4305) (minValue!3142 V!4305) (_size!906 (_ BitVec 32)) (_keys!5099 array!6045) (_values!3282 array!6047) (_vacant!906 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2948 0))(
  ( (tuple2!2949 (_1!1485 Bool) (_2!1485 LongMapFixedSize!1714)) )
))
(declare-fun lt!82126 () tuple2!2948)

(assert (=> b!161745 (= res!76592 (_1!1485 lt!82126))))

(declare-fun b!161746 () Bool)

(declare-fun res!76595 () Bool)

(declare-fun e!105828 () Bool)

(assert (=> b!161746 (=> (not res!76595) (not e!105828))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161746 (= res!76595 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161747 () Bool)

(declare-fun e!105829 () Bool)

(assert (=> b!161747 (= e!105829 tp_is_empty!3493)))

(declare-fun b!161748 () Bool)

(declare-fun e!105825 () Bool)

(assert (=> b!161748 (= e!105828 e!105825)))

(declare-fun res!76596 () Bool)

(assert (=> b!161748 (=> (not res!76596) (not e!105825))))

(declare-datatypes ((SeekEntryResult!375 0))(
  ( (MissingZero!375 (index!3668 (_ BitVec 32))) (Found!375 (index!3669 (_ BitVec 32))) (Intermediate!375 (undefined!1187 Bool) (index!3670 (_ BitVec 32)) (x!17894 (_ BitVec 32))) (Undefined!375) (MissingVacant!375 (index!3671 (_ BitVec 32))) )
))
(declare-fun lt!82128 () SeekEntryResult!375)

(get-info :version)

(assert (=> b!161748 (= res!76596 (and (not ((_ is Undefined!375) lt!82128)) ((_ is MissingVacant!375) lt!82128)))))

(declare-fun thiss!1248 () LongMapFixedSize!1714)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6045 (_ BitVec 32)) SeekEntryResult!375)

(assert (=> b!161748 (= lt!82128 (seekEntryOrOpen!0 key!828 (_keys!5099 thiss!1248) (mask!7904 thiss!1248)))))

(declare-fun b!161749 () Bool)

(declare-fun e!105826 () Bool)

(declare-fun mapRes!5927 () Bool)

(assert (=> b!161749 (= e!105826 (and e!105829 mapRes!5927))))

(declare-fun condMapEmpty!5927 () Bool)

(declare-fun mapDefault!5927 () ValueCell!1403)

(assert (=> b!161749 (= condMapEmpty!5927 (= (arr!2867 (_values!3282 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1403)) mapDefault!5927)))))

(declare-fun b!161750 () Bool)

(assert (=> b!161750 (= e!105827 false)))

(declare-fun lt!82127 () Bool)

(declare-datatypes ((tuple2!2950 0))(
  ( (tuple2!2951 (_1!1486 (_ BitVec 64)) (_2!1486 V!4305)) )
))
(declare-datatypes ((List!1985 0))(
  ( (Nil!1982) (Cons!1981 (h!2594 tuple2!2950) (t!6778 List!1985)) )
))
(declare-datatypes ((ListLongMap!1931 0))(
  ( (ListLongMap!1932 (toList!981 List!1985)) )
))
(declare-fun contains!1020 (ListLongMap!1931 (_ BitVec 64)) Bool)

(declare-fun map!1650 (LongMapFixedSize!1714) ListLongMap!1931)

(assert (=> b!161750 (= lt!82127 (contains!1020 (map!1650 (_2!1485 lt!82126)) key!828))))

(declare-fun res!76593 () Bool)

(assert (=> start!16234 (=> (not res!76593) (not e!105828))))

(declare-fun valid!781 (LongMapFixedSize!1714) Bool)

(assert (=> start!16234 (= res!76593 (valid!781 thiss!1248))))

(assert (=> start!16234 e!105828))

(declare-fun e!105822 () Bool)

(assert (=> start!16234 e!105822))

(assert (=> start!16234 true))

(assert (=> start!16234 tp_is_empty!3493))

(declare-fun array_inv!1855 (array!6045) Bool)

(declare-fun array_inv!1856 (array!6047) Bool)

(assert (=> b!161751 (= e!105822 (and tp!13643 tp_is_empty!3493 (array_inv!1855 (_keys!5099 thiss!1248)) (array_inv!1856 (_values!3282 thiss!1248)) e!105826))))

(declare-fun mapIsEmpty!5927 () Bool)

(assert (=> mapIsEmpty!5927 mapRes!5927))

(declare-fun b!161752 () Bool)

(assert (=> b!161752 (= e!105825 e!105827)))

(declare-fun res!76594 () Bool)

(assert (=> b!161752 (=> (not res!76594) (not e!105827))))

(assert (=> b!161752 (= res!76594 (valid!781 (_2!1485 lt!82126)))))

(declare-fun v!309 () V!4305)

(declare-fun updateHelperNewKey!74 (LongMapFixedSize!1714 (_ BitVec 64) V!4305 (_ BitVec 32)) tuple2!2948)

(assert (=> b!161752 (= lt!82126 (updateHelperNewKey!74 thiss!1248 key!828 v!309 (index!3671 lt!82128)))))

(declare-fun mapNonEmpty!5927 () Bool)

(declare-fun tp!13642 () Bool)

(assert (=> mapNonEmpty!5927 (= mapRes!5927 (and tp!13642 e!105823))))

(declare-fun mapKey!5927 () (_ BitVec 32))

(declare-fun mapRest!5927 () (Array (_ BitVec 32) ValueCell!1403))

(declare-fun mapValue!5927 () ValueCell!1403)

(assert (=> mapNonEmpty!5927 (= (arr!2867 (_values!3282 thiss!1248)) (store mapRest!5927 mapKey!5927 mapValue!5927))))

(assert (= (and start!16234 res!76593) b!161746))

(assert (= (and b!161746 res!76595) b!161748))

(assert (= (and b!161748 res!76596) b!161752))

(assert (= (and b!161752 res!76594) b!161745))

(assert (= (and b!161745 res!76592) b!161750))

(assert (= (and b!161749 condMapEmpty!5927) mapIsEmpty!5927))

(assert (= (and b!161749 (not condMapEmpty!5927)) mapNonEmpty!5927))

(assert (= (and mapNonEmpty!5927 ((_ is ValueCellFull!1403) mapValue!5927)) b!161744))

(assert (= (and b!161749 ((_ is ValueCellFull!1403) mapDefault!5927)) b!161747))

(assert (= b!161751 b!161749))

(assert (= start!16234 b!161751))

(declare-fun m!192589 () Bool)

(assert (=> mapNonEmpty!5927 m!192589))

(declare-fun m!192591 () Bool)

(assert (=> b!161752 m!192591))

(declare-fun m!192593 () Bool)

(assert (=> b!161752 m!192593))

(declare-fun m!192595 () Bool)

(assert (=> b!161748 m!192595))

(declare-fun m!192597 () Bool)

(assert (=> start!16234 m!192597))

(declare-fun m!192599 () Bool)

(assert (=> b!161751 m!192599))

(declare-fun m!192601 () Bool)

(assert (=> b!161751 m!192601))

(declare-fun m!192603 () Bool)

(assert (=> b!161750 m!192603))

(assert (=> b!161750 m!192603))

(declare-fun m!192605 () Bool)

(assert (=> b!161750 m!192605))

(check-sat (not mapNonEmpty!5927) (not b!161750) (not start!16234) (not b!161752) tp_is_empty!3493 (not b!161748) (not b_next!3691) b_and!10079 (not b!161751))
(check-sat b_and!10079 (not b_next!3691))
