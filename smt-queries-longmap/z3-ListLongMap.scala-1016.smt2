; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21700 () Bool)

(assert start!21700)

(declare-fun b!217813 () Bool)

(declare-fun b_free!5845 () Bool)

(declare-fun b_next!5845 () Bool)

(assert (=> b!217813 (= b_free!5845 (not b_next!5845))))

(declare-fun tp!20669 () Bool)

(declare-fun b_and!12709 () Bool)

(assert (=> b!217813 (= tp!20669 b_and!12709)))

(declare-fun b!217807 () Bool)

(declare-fun res!106703 () Bool)

(declare-fun e!141684 () Bool)

(assert (=> b!217807 (=> (not res!106703) (not e!141684))))

(declare-datatypes ((V!7257 0))(
  ( (V!7258 (val!2898 Int)) )
))
(declare-datatypes ((ValueCell!2510 0))(
  ( (ValueCellFull!2510 (v!4910 V!7257)) (EmptyCell!2510) )
))
(declare-datatypes ((array!10645 0))(
  ( (array!10646 (arr!5043 (Array (_ BitVec 32) ValueCell!2510)) (size!5376 (_ BitVec 32))) )
))
(declare-datatypes ((array!10647 0))(
  ( (array!10648 (arr!5044 (Array (_ BitVec 32) (_ BitVec 64))) (size!5377 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2920 0))(
  ( (LongMapFixedSize!2921 (defaultEntry!4110 Int) (mask!9876 (_ BitVec 32)) (extraKeys!3847 (_ BitVec 32)) (zeroValue!3951 V!7257) (minValue!3951 V!7257) (_size!1509 (_ BitVec 32)) (_keys!6158 array!10647) (_values!4093 array!10645) (_vacant!1509 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2920)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10647 (_ BitVec 32)) Bool)

(assert (=> b!217807 (= res!106703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6158 thiss!1504) (mask!9876 thiss!1504)))))

(declare-fun mapIsEmpty!9723 () Bool)

(declare-fun mapRes!9723 () Bool)

(assert (=> mapIsEmpty!9723 mapRes!9723))

(declare-fun b!217808 () Bool)

(assert (=> b!217808 (= e!141684 false)))

(declare-fun lt!111259 () Bool)

(declare-datatypes ((List!3197 0))(
  ( (Nil!3194) (Cons!3193 (h!3840 (_ BitVec 64)) (t!8143 List!3197)) )
))
(declare-fun arrayNoDuplicates!0 (array!10647 (_ BitVec 32) List!3197) Bool)

(assert (=> b!217808 (= lt!111259 (arrayNoDuplicates!0 (_keys!6158 thiss!1504) #b00000000000000000000000000000000 Nil!3194))))

(declare-fun b!217809 () Bool)

(declare-fun res!106705 () Bool)

(assert (=> b!217809 (=> (not res!106705) (not e!141684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217809 (= res!106705 (validMask!0 (mask!9876 thiss!1504)))))

(declare-fun mapNonEmpty!9723 () Bool)

(declare-fun tp!20670 () Bool)

(declare-fun e!141683 () Bool)

(assert (=> mapNonEmpty!9723 (= mapRes!9723 (and tp!20670 e!141683))))

(declare-fun mapKey!9723 () (_ BitVec 32))

(declare-fun mapValue!9723 () ValueCell!2510)

(declare-fun mapRest!9723 () (Array (_ BitVec 32) ValueCell!2510))

(assert (=> mapNonEmpty!9723 (= (arr!5043 (_values!4093 thiss!1504)) (store mapRest!9723 mapKey!9723 mapValue!9723))))

(declare-fun b!217810 () Bool)

(declare-fun res!106707 () Bool)

(assert (=> b!217810 (=> (not res!106707) (not e!141684))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4274 0))(
  ( (tuple2!4275 (_1!2148 (_ BitVec 64)) (_2!2148 V!7257)) )
))
(declare-datatypes ((List!3198 0))(
  ( (Nil!3195) (Cons!3194 (h!3841 tuple2!4274) (t!8144 List!3198)) )
))
(declare-datatypes ((ListLongMap!3177 0))(
  ( (ListLongMap!3178 (toList!1604 List!3198)) )
))
(declare-fun contains!1445 (ListLongMap!3177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1113 (array!10647 array!10645 (_ BitVec 32) (_ BitVec 32) V!7257 V!7257 (_ BitVec 32) Int) ListLongMap!3177)

(assert (=> b!217810 (= res!106707 (not (contains!1445 (getCurrentListMap!1113 (_keys!6158 thiss!1504) (_values!4093 thiss!1504) (mask!9876 thiss!1504) (extraKeys!3847 thiss!1504) (zeroValue!3951 thiss!1504) (minValue!3951 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4110 thiss!1504)) key!932)))))

(declare-fun b!217811 () Bool)

(declare-fun res!106706 () Bool)

(assert (=> b!217811 (=> (not res!106706) (not e!141684))))

(assert (=> b!217811 (= res!106706 (and (= (size!5376 (_values!4093 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9876 thiss!1504))) (= (size!5377 (_keys!6158 thiss!1504)) (size!5376 (_values!4093 thiss!1504))) (bvsge (mask!9876 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3847 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3847 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217812 () Bool)

(declare-fun tp_is_empty!5707 () Bool)

(assert (=> b!217812 (= e!141683 tp_is_empty!5707)))

(declare-fun e!141682 () Bool)

(declare-fun e!141686 () Bool)

(declare-fun array_inv!3325 (array!10647) Bool)

(declare-fun array_inv!3326 (array!10645) Bool)

(assert (=> b!217813 (= e!141686 (and tp!20669 tp_is_empty!5707 (array_inv!3325 (_keys!6158 thiss!1504)) (array_inv!3326 (_values!4093 thiss!1504)) e!141682))))

(declare-fun res!106702 () Bool)

(declare-fun e!141680 () Bool)

(assert (=> start!21700 (=> (not res!106702) (not e!141680))))

(declare-fun valid!1200 (LongMapFixedSize!2920) Bool)

(assert (=> start!21700 (= res!106702 (valid!1200 thiss!1504))))

(assert (=> start!21700 e!141680))

(assert (=> start!21700 e!141686))

(assert (=> start!21700 true))

(declare-fun b!217814 () Bool)

(declare-fun e!141685 () Bool)

(assert (=> b!217814 (= e!141682 (and e!141685 mapRes!9723))))

(declare-fun condMapEmpty!9723 () Bool)

(declare-fun mapDefault!9723 () ValueCell!2510)

(assert (=> b!217814 (= condMapEmpty!9723 (= (arr!5043 (_values!4093 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2510)) mapDefault!9723)))))

(declare-fun b!217815 () Bool)

(assert (=> b!217815 (= e!141685 tp_is_empty!5707)))

(declare-fun b!217816 () Bool)

(assert (=> b!217816 (= e!141680 e!141684)))

(declare-fun res!106708 () Bool)

(assert (=> b!217816 (=> (not res!106708) (not e!141684))))

(declare-datatypes ((SeekEntryResult!775 0))(
  ( (MissingZero!775 (index!5270 (_ BitVec 32))) (Found!775 (index!5271 (_ BitVec 32))) (Intermediate!775 (undefined!1587 Bool) (index!5272 (_ BitVec 32)) (x!22790 (_ BitVec 32))) (Undefined!775) (MissingVacant!775 (index!5273 (_ BitVec 32))) )
))
(declare-fun lt!111260 () SeekEntryResult!775)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217816 (= res!106708 (or (= lt!111260 (MissingZero!775 index!297)) (= lt!111260 (MissingVacant!775 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10647 (_ BitVec 32)) SeekEntryResult!775)

(assert (=> b!217816 (= lt!111260 (seekEntryOrOpen!0 key!932 (_keys!6158 thiss!1504) (mask!9876 thiss!1504)))))

(declare-fun b!217817 () Bool)

(declare-fun res!106704 () Bool)

(assert (=> b!217817 (=> (not res!106704) (not e!141680))))

(assert (=> b!217817 (= res!106704 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21700 res!106702) b!217817))

(assert (= (and b!217817 res!106704) b!217816))

(assert (= (and b!217816 res!106708) b!217810))

(assert (= (and b!217810 res!106707) b!217809))

(assert (= (and b!217809 res!106705) b!217811))

(assert (= (and b!217811 res!106706) b!217807))

(assert (= (and b!217807 res!106703) b!217808))

(assert (= (and b!217814 condMapEmpty!9723) mapIsEmpty!9723))

(assert (= (and b!217814 (not condMapEmpty!9723)) mapNonEmpty!9723))

(get-info :version)

(assert (= (and mapNonEmpty!9723 ((_ is ValueCellFull!2510) mapValue!9723)) b!217812))

(assert (= (and b!217814 ((_ is ValueCellFull!2510) mapDefault!9723)) b!217815))

(assert (= b!217813 b!217814))

(assert (= start!21700 b!217813))

(declare-fun m!243453 () Bool)

(assert (=> b!217807 m!243453))

(declare-fun m!243455 () Bool)

(assert (=> b!217810 m!243455))

(assert (=> b!217810 m!243455))

(declare-fun m!243457 () Bool)

(assert (=> b!217810 m!243457))

(declare-fun m!243459 () Bool)

(assert (=> start!21700 m!243459))

(declare-fun m!243461 () Bool)

(assert (=> b!217813 m!243461))

(declare-fun m!243463 () Bool)

(assert (=> b!217813 m!243463))

(declare-fun m!243465 () Bool)

(assert (=> b!217816 m!243465))

(declare-fun m!243467 () Bool)

(assert (=> b!217809 m!243467))

(declare-fun m!243469 () Bool)

(assert (=> b!217808 m!243469))

(declare-fun m!243471 () Bool)

(assert (=> mapNonEmpty!9723 m!243471))

(check-sat (not start!21700) (not b!217807) (not b!217808) (not b!217813) tp_is_empty!5707 (not b!217810) b_and!12709 (not b!217809) (not mapNonEmpty!9723) (not b_next!5845) (not b!217816))
(check-sat b_and!12709 (not b_next!5845))
