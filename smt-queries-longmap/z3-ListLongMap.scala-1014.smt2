; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21686 () Bool)

(assert start!21686)

(declare-fun b!217789 () Bool)

(declare-fun b_free!5835 () Bool)

(declare-fun b_next!5835 () Bool)

(assert (=> b!217789 (= b_free!5835 (not b_next!5835))))

(declare-fun tp!20640 () Bool)

(declare-fun b_and!12725 () Bool)

(assert (=> b!217789 (= tp!20640 b_and!12725)))

(declare-fun tp_is_empty!5697 () Bool)

(declare-datatypes ((V!7243 0))(
  ( (V!7244 (val!2893 Int)) )
))
(declare-datatypes ((ValueCell!2505 0))(
  ( (ValueCellFull!2505 (v!4911 V!7243)) (EmptyCell!2505) )
))
(declare-datatypes ((array!10633 0))(
  ( (array!10634 (arr!5038 (Array (_ BitVec 32) ValueCell!2505)) (size!5370 (_ BitVec 32))) )
))
(declare-datatypes ((array!10635 0))(
  ( (array!10636 (arr!5039 (Array (_ BitVec 32) (_ BitVec 64))) (size!5371 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2910 0))(
  ( (LongMapFixedSize!2911 (defaultEntry!4105 Int) (mask!9868 (_ BitVec 32)) (extraKeys!3842 (_ BitVec 32)) (zeroValue!3946 V!7243) (minValue!3946 V!7243) (_size!1504 (_ BitVec 32)) (_keys!6154 array!10635) (_values!4088 array!10633) (_vacant!1504 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2910)

(declare-fun e!141680 () Bool)

(declare-fun e!141679 () Bool)

(declare-fun array_inv!3335 (array!10635) Bool)

(declare-fun array_inv!3336 (array!10633) Bool)

(assert (=> b!217789 (= e!141680 (and tp!20640 tp_is_empty!5697 (array_inv!3335 (_keys!6154 thiss!1504)) (array_inv!3336 (_values!4088 thiss!1504)) e!141679))))

(declare-fun b!217790 () Bool)

(declare-fun res!106693 () Bool)

(declare-fun e!141681 () Bool)

(assert (=> b!217790 (=> (not res!106693) (not e!141681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10635 (_ BitVec 32)) Bool)

(assert (=> b!217790 (= res!106693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6154 thiss!1504) (mask!9868 thiss!1504)))))

(declare-fun b!217791 () Bool)

(declare-fun res!106697 () Bool)

(assert (=> b!217791 (=> (not res!106697) (not e!141681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217791 (= res!106697 (validMask!0 (mask!9868 thiss!1504)))))

(declare-fun b!217792 () Bool)

(declare-fun res!106694 () Bool)

(declare-fun e!141678 () Bool)

(assert (=> b!217792 (=> (not res!106694) (not e!141678))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217792 (= res!106694 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9708 () Bool)

(declare-fun mapRes!9708 () Bool)

(assert (=> mapIsEmpty!9708 mapRes!9708))

(declare-fun b!217793 () Bool)

(assert (=> b!217793 (= e!141678 e!141681)))

(declare-fun res!106695 () Bool)

(assert (=> b!217793 (=> (not res!106695) (not e!141681))))

(declare-datatypes ((SeekEntryResult!773 0))(
  ( (MissingZero!773 (index!5262 (_ BitVec 32))) (Found!773 (index!5263 (_ BitVec 32))) (Intermediate!773 (undefined!1585 Bool) (index!5264 (_ BitVec 32)) (x!22773 (_ BitVec 32))) (Undefined!773) (MissingVacant!773 (index!5265 (_ BitVec 32))) )
))
(declare-fun lt!111410 () SeekEntryResult!773)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217793 (= res!106695 (or (= lt!111410 (MissingZero!773 index!297)) (= lt!111410 (MissingVacant!773 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10635 (_ BitVec 32)) SeekEntryResult!773)

(assert (=> b!217793 (= lt!111410 (seekEntryOrOpen!0 key!932 (_keys!6154 thiss!1504) (mask!9868 thiss!1504)))))

(declare-fun b!217794 () Bool)

(assert (=> b!217794 (= e!141681 false)))

(declare-fun lt!111411 () Bool)

(declare-datatypes ((List!3203 0))(
  ( (Nil!3200) (Cons!3199 (h!3846 (_ BitVec 64)) (t!8158 List!3203)) )
))
(declare-fun arrayNoDuplicates!0 (array!10635 (_ BitVec 32) List!3203) Bool)

(assert (=> b!217794 (= lt!111411 (arrayNoDuplicates!0 (_keys!6154 thiss!1504) #b00000000000000000000000000000000 Nil!3200))))

(declare-fun res!106698 () Bool)

(assert (=> start!21686 (=> (not res!106698) (not e!141678))))

(declare-fun valid!1180 (LongMapFixedSize!2910) Bool)

(assert (=> start!21686 (= res!106698 (valid!1180 thiss!1504))))

(assert (=> start!21686 e!141678))

(assert (=> start!21686 e!141680))

(assert (=> start!21686 true))

(declare-fun b!217795 () Bool)

(declare-fun e!141682 () Bool)

(assert (=> b!217795 (= e!141679 (and e!141682 mapRes!9708))))

(declare-fun condMapEmpty!9708 () Bool)

(declare-fun mapDefault!9708 () ValueCell!2505)

(assert (=> b!217795 (= condMapEmpty!9708 (= (arr!5038 (_values!4088 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2505)) mapDefault!9708)))))

(declare-fun b!217796 () Bool)

(assert (=> b!217796 (= e!141682 tp_is_empty!5697)))

(declare-fun b!217797 () Bool)

(declare-fun res!106692 () Bool)

(assert (=> b!217797 (=> (not res!106692) (not e!141681))))

(declare-datatypes ((tuple2!4298 0))(
  ( (tuple2!4299 (_1!2160 (_ BitVec 64)) (_2!2160 V!7243)) )
))
(declare-datatypes ((List!3204 0))(
  ( (Nil!3201) (Cons!3200 (h!3847 tuple2!4298) (t!8159 List!3204)) )
))
(declare-datatypes ((ListLongMap!3211 0))(
  ( (ListLongMap!3212 (toList!1621 List!3204)) )
))
(declare-fun contains!1462 (ListLongMap!3211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1149 (array!10635 array!10633 (_ BitVec 32) (_ BitVec 32) V!7243 V!7243 (_ BitVec 32) Int) ListLongMap!3211)

(assert (=> b!217797 (= res!106692 (not (contains!1462 (getCurrentListMap!1149 (_keys!6154 thiss!1504) (_values!4088 thiss!1504) (mask!9868 thiss!1504) (extraKeys!3842 thiss!1504) (zeroValue!3946 thiss!1504) (minValue!3946 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4105 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!9708 () Bool)

(declare-fun tp!20639 () Bool)

(declare-fun e!141677 () Bool)

(assert (=> mapNonEmpty!9708 (= mapRes!9708 (and tp!20639 e!141677))))

(declare-fun mapRest!9708 () (Array (_ BitVec 32) ValueCell!2505))

(declare-fun mapValue!9708 () ValueCell!2505)

(declare-fun mapKey!9708 () (_ BitVec 32))

(assert (=> mapNonEmpty!9708 (= (arr!5038 (_values!4088 thiss!1504)) (store mapRest!9708 mapKey!9708 mapValue!9708))))

(declare-fun b!217798 () Bool)

(assert (=> b!217798 (= e!141677 tp_is_empty!5697)))

(declare-fun b!217799 () Bool)

(declare-fun res!106696 () Bool)

(assert (=> b!217799 (=> (not res!106696) (not e!141681))))

(assert (=> b!217799 (= res!106696 (and (= (size!5370 (_values!4088 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9868 thiss!1504))) (= (size!5371 (_keys!6154 thiss!1504)) (size!5370 (_values!4088 thiss!1504))) (bvsge (mask!9868 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3842 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3842 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21686 res!106698) b!217792))

(assert (= (and b!217792 res!106694) b!217793))

(assert (= (and b!217793 res!106695) b!217797))

(assert (= (and b!217797 res!106692) b!217791))

(assert (= (and b!217791 res!106697) b!217799))

(assert (= (and b!217799 res!106696) b!217790))

(assert (= (and b!217790 res!106693) b!217794))

(assert (= (and b!217795 condMapEmpty!9708) mapIsEmpty!9708))

(assert (= (and b!217795 (not condMapEmpty!9708)) mapNonEmpty!9708))

(get-info :version)

(assert (= (and mapNonEmpty!9708 ((_ is ValueCellFull!2505) mapValue!9708)) b!217798))

(assert (= (and b!217795 ((_ is ValueCellFull!2505) mapDefault!9708)) b!217796))

(assert (= b!217789 b!217795))

(assert (= start!21686 b!217789))

(declare-fun m!243969 () Bool)

(assert (=> start!21686 m!243969))

(declare-fun m!243971 () Bool)

(assert (=> b!217797 m!243971))

(assert (=> b!217797 m!243971))

(declare-fun m!243973 () Bool)

(assert (=> b!217797 m!243973))

(declare-fun m!243975 () Bool)

(assert (=> b!217791 m!243975))

(declare-fun m!243977 () Bool)

(assert (=> b!217794 m!243977))

(declare-fun m!243979 () Bool)

(assert (=> mapNonEmpty!9708 m!243979))

(declare-fun m!243981 () Bool)

(assert (=> b!217793 m!243981))

(declare-fun m!243983 () Bool)

(assert (=> b!217789 m!243983))

(declare-fun m!243985 () Bool)

(assert (=> b!217789 m!243985))

(declare-fun m!243987 () Bool)

(assert (=> b!217790 m!243987))

(check-sat (not b_next!5835) tp_is_empty!5697 (not b!217791) (not b!217794) (not mapNonEmpty!9708) b_and!12725 (not b!217797) (not b!217793) (not b!217790) (not b!217789) (not start!21686))
(check-sat b_and!12725 (not b_next!5835))
