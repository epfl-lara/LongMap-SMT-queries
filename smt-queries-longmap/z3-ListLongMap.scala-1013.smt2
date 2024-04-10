; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21680 () Bool)

(assert start!21680)

(declare-fun b!217690 () Bool)

(declare-fun b_free!5829 () Bool)

(declare-fun b_next!5829 () Bool)

(assert (=> b!217690 (= b_free!5829 (not b_next!5829))))

(declare-fun tp!20622 () Bool)

(declare-fun b_and!12719 () Bool)

(assert (=> b!217690 (= tp!20622 b_and!12719)))

(declare-datatypes ((V!7235 0))(
  ( (V!7236 (val!2890 Int)) )
))
(declare-datatypes ((ValueCell!2502 0))(
  ( (ValueCellFull!2502 (v!4908 V!7235)) (EmptyCell!2502) )
))
(declare-datatypes ((array!10621 0))(
  ( (array!10622 (arr!5032 (Array (_ BitVec 32) ValueCell!2502)) (size!5364 (_ BitVec 32))) )
))
(declare-datatypes ((array!10623 0))(
  ( (array!10624 (arr!5033 (Array (_ BitVec 32) (_ BitVec 64))) (size!5365 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2904 0))(
  ( (LongMapFixedSize!2905 (defaultEntry!4102 Int) (mask!9863 (_ BitVec 32)) (extraKeys!3839 (_ BitVec 32)) (zeroValue!3943 V!7235) (minValue!3943 V!7235) (_size!1501 (_ BitVec 32)) (_keys!6151 array!10623) (_values!4085 array!10621) (_vacant!1501 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2904)

(declare-fun e!141619 () Bool)

(declare-fun e!141615 () Bool)

(declare-fun tp_is_empty!5691 () Bool)

(declare-fun array_inv!3333 (array!10623) Bool)

(declare-fun array_inv!3334 (array!10621) Bool)

(assert (=> b!217690 (= e!141619 (and tp!20622 tp_is_empty!5691 (array_inv!3333 (_keys!6151 thiss!1504)) (array_inv!3334 (_values!4085 thiss!1504)) e!141615))))

(declare-fun b!217691 () Bool)

(declare-fun res!106631 () Bool)

(declare-fun e!141618 () Bool)

(assert (=> b!217691 (=> (not res!106631) (not e!141618))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217691 (= res!106631 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9699 () Bool)

(declare-fun mapRes!9699 () Bool)

(declare-fun tp!20621 () Bool)

(declare-fun e!141614 () Bool)

(assert (=> mapNonEmpty!9699 (= mapRes!9699 (and tp!20621 e!141614))))

(declare-fun mapKey!9699 () (_ BitVec 32))

(declare-fun mapValue!9699 () ValueCell!2502)

(declare-fun mapRest!9699 () (Array (_ BitVec 32) ValueCell!2502))

(assert (=> mapNonEmpty!9699 (= (arr!5032 (_values!4085 thiss!1504)) (store mapRest!9699 mapKey!9699 mapValue!9699))))

(declare-fun b!217692 () Bool)

(assert (=> b!217692 (= e!141614 tp_is_empty!5691)))

(declare-fun b!217693 () Bool)

(declare-fun res!106632 () Bool)

(declare-fun e!141617 () Bool)

(assert (=> b!217693 (=> (not res!106632) (not e!141617))))

(declare-datatypes ((tuple2!4294 0))(
  ( (tuple2!4295 (_1!2158 (_ BitVec 64)) (_2!2158 V!7235)) )
))
(declare-datatypes ((List!3198 0))(
  ( (Nil!3195) (Cons!3194 (h!3841 tuple2!4294) (t!8153 List!3198)) )
))
(declare-datatypes ((ListLongMap!3207 0))(
  ( (ListLongMap!3208 (toList!1619 List!3198)) )
))
(declare-fun contains!1460 (ListLongMap!3207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1147 (array!10623 array!10621 (_ BitVec 32) (_ BitVec 32) V!7235 V!7235 (_ BitVec 32) Int) ListLongMap!3207)

(assert (=> b!217693 (= res!106632 (not (contains!1460 (getCurrentListMap!1147 (_keys!6151 thiss!1504) (_values!4085 thiss!1504) (mask!9863 thiss!1504) (extraKeys!3839 thiss!1504) (zeroValue!3943 thiss!1504) (minValue!3943 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4102 thiss!1504)) key!932)))))

(declare-fun b!217694 () Bool)

(declare-fun e!141616 () Bool)

(assert (=> b!217694 (= e!141615 (and e!141616 mapRes!9699))))

(declare-fun condMapEmpty!9699 () Bool)

(declare-fun mapDefault!9699 () ValueCell!2502)

(assert (=> b!217694 (= condMapEmpty!9699 (= (arr!5032 (_values!4085 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2502)) mapDefault!9699)))))

(declare-fun b!217695 () Bool)

(declare-fun res!106629 () Bool)

(assert (=> b!217695 (=> (not res!106629) (not e!141617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10623 (_ BitVec 32)) Bool)

(assert (=> b!217695 (= res!106629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6151 thiss!1504) (mask!9863 thiss!1504)))))

(declare-fun b!217696 () Bool)

(assert (=> b!217696 (= e!141616 tp_is_empty!5691)))

(declare-fun b!217697 () Bool)

(declare-fun res!106630 () Bool)

(assert (=> b!217697 (=> (not res!106630) (not e!141617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217697 (= res!106630 (validMask!0 (mask!9863 thiss!1504)))))

(declare-fun b!217698 () Bool)

(assert (=> b!217698 (= e!141618 e!141617)))

(declare-fun res!106635 () Bool)

(assert (=> b!217698 (=> (not res!106635) (not e!141617))))

(declare-datatypes ((SeekEntryResult!770 0))(
  ( (MissingZero!770 (index!5250 (_ BitVec 32))) (Found!770 (index!5251 (_ BitVec 32))) (Intermediate!770 (undefined!1582 Bool) (index!5252 (_ BitVec 32)) (x!22762 (_ BitVec 32))) (Undefined!770) (MissingVacant!770 (index!5253 (_ BitVec 32))) )
))
(declare-fun lt!111392 () SeekEntryResult!770)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217698 (= res!106635 (or (= lt!111392 (MissingZero!770 index!297)) (= lt!111392 (MissingVacant!770 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10623 (_ BitVec 32)) SeekEntryResult!770)

(assert (=> b!217698 (= lt!111392 (seekEntryOrOpen!0 key!932 (_keys!6151 thiss!1504) (mask!9863 thiss!1504)))))

(declare-fun b!217699 () Bool)

(declare-fun res!106633 () Bool)

(assert (=> b!217699 (=> (not res!106633) (not e!141617))))

(assert (=> b!217699 (= res!106633 (and (= (size!5364 (_values!4085 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9863 thiss!1504))) (= (size!5365 (_keys!6151 thiss!1504)) (size!5364 (_values!4085 thiss!1504))) (bvsge (mask!9863 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3839 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3839 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9699 () Bool)

(assert (=> mapIsEmpty!9699 mapRes!9699))

(declare-fun res!106634 () Bool)

(assert (=> start!21680 (=> (not res!106634) (not e!141618))))

(declare-fun valid!1178 (LongMapFixedSize!2904) Bool)

(assert (=> start!21680 (= res!106634 (valid!1178 thiss!1504))))

(assert (=> start!21680 e!141618))

(assert (=> start!21680 e!141619))

(assert (=> start!21680 true))

(declare-fun b!217700 () Bool)

(assert (=> b!217700 (= e!141617 false)))

(declare-fun lt!111393 () Bool)

(declare-datatypes ((List!3199 0))(
  ( (Nil!3196) (Cons!3195 (h!3842 (_ BitVec 64)) (t!8154 List!3199)) )
))
(declare-fun arrayNoDuplicates!0 (array!10623 (_ BitVec 32) List!3199) Bool)

(assert (=> b!217700 (= lt!111393 (arrayNoDuplicates!0 (_keys!6151 thiss!1504) #b00000000000000000000000000000000 Nil!3196))))

(assert (= (and start!21680 res!106634) b!217691))

(assert (= (and b!217691 res!106631) b!217698))

(assert (= (and b!217698 res!106635) b!217693))

(assert (= (and b!217693 res!106632) b!217697))

(assert (= (and b!217697 res!106630) b!217699))

(assert (= (and b!217699 res!106633) b!217695))

(assert (= (and b!217695 res!106629) b!217700))

(assert (= (and b!217694 condMapEmpty!9699) mapIsEmpty!9699))

(assert (= (and b!217694 (not condMapEmpty!9699)) mapNonEmpty!9699))

(get-info :version)

(assert (= (and mapNonEmpty!9699 ((_ is ValueCellFull!2502) mapValue!9699)) b!217692))

(assert (= (and b!217694 ((_ is ValueCellFull!2502) mapDefault!9699)) b!217696))

(assert (= b!217690 b!217694))

(assert (= start!21680 b!217690))

(declare-fun m!243909 () Bool)

(assert (=> mapNonEmpty!9699 m!243909))

(declare-fun m!243911 () Bool)

(assert (=> b!217695 m!243911))

(declare-fun m!243913 () Bool)

(assert (=> b!217690 m!243913))

(declare-fun m!243915 () Bool)

(assert (=> b!217690 m!243915))

(declare-fun m!243917 () Bool)

(assert (=> b!217698 m!243917))

(declare-fun m!243919 () Bool)

(assert (=> start!21680 m!243919))

(declare-fun m!243921 () Bool)

(assert (=> b!217693 m!243921))

(assert (=> b!217693 m!243921))

(declare-fun m!243923 () Bool)

(assert (=> b!217693 m!243923))

(declare-fun m!243925 () Bool)

(assert (=> b!217700 m!243925))

(declare-fun m!243927 () Bool)

(assert (=> b!217697 m!243927))

(check-sat (not start!21680) (not b!217693) (not b!217690) (not b!217695) (not b!217697) b_and!12719 (not b!217700) (not b_next!5829) tp_is_empty!5691 (not mapNonEmpty!9699) (not b!217698))
(check-sat b_and!12719 (not b_next!5829))
