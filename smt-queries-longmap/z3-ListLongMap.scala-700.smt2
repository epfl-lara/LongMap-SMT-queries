; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16706 () Bool)

(assert start!16706)

(declare-fun b!167533 () Bool)

(declare-fun b_free!4011 () Bool)

(declare-fun b_next!4011 () Bool)

(assert (=> b!167533 (= b_free!4011 (not b_next!4011))))

(declare-fun tp!14633 () Bool)

(declare-fun b_and!10425 () Bool)

(assert (=> b!167533 (= tp!14633 b_and!10425)))

(declare-fun e!110033 () Bool)

(declare-datatypes ((SeekEntryResult!482 0))(
  ( (MissingZero!482 (index!4096 (_ BitVec 32))) (Found!482 (index!4097 (_ BitVec 32))) (Intermediate!482 (undefined!1294 Bool) (index!4098 (_ BitVec 32)) (x!18534 (_ BitVec 32))) (Undefined!482) (MissingVacant!482 (index!4099 (_ BitVec 32))) )
))
(declare-fun lt!83737 () SeekEntryResult!482)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4731 0))(
  ( (V!4732 (val!1951 Int)) )
))
(declare-datatypes ((ValueCell!1563 0))(
  ( (ValueCellFull!1563 (v!3816 V!4731)) (EmptyCell!1563) )
))
(declare-datatypes ((array!6723 0))(
  ( (array!6724 (arr!3197 (Array (_ BitVec 32) (_ BitVec 64))) (size!3485 (_ BitVec 32))) )
))
(declare-datatypes ((array!6725 0))(
  ( (array!6726 (arr!3198 (Array (_ BitVec 32) ValueCell!1563)) (size!3486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2034 0))(
  ( (LongMapFixedSize!2035 (defaultEntry!3459 Int) (mask!8208 (_ BitVec 32)) (extraKeys!3200 (_ BitVec 32)) (zeroValue!3302 V!4731) (minValue!3302 V!4731) (_size!1066 (_ BitVec 32)) (_keys!5284 array!6723) (_values!3442 array!6725) (_vacant!1066 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2034)

(declare-fun b!167526 () Bool)

(assert (=> b!167526 (= e!110033 (= (select (arr!3197 (_keys!5284 thiss!1248)) (index!4097 lt!83737)) key!828))))

(declare-fun b!167527 () Bool)

(declare-fun res!79690 () Bool)

(declare-fun e!110039 () Bool)

(assert (=> b!167527 (=> res!79690 e!110039)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6723 (_ BitVec 32)) Bool)

(assert (=> b!167527 (= res!79690 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5284 thiss!1248) (mask!8208 thiss!1248))))))

(declare-fun b!167528 () Bool)

(declare-fun e!110031 () Bool)

(declare-fun tp_is_empty!3813 () Bool)

(assert (=> b!167528 (= e!110031 tp_is_empty!3813)))

(declare-fun b!167529 () Bool)

(declare-fun e!110035 () Bool)

(assert (=> b!167529 (= e!110035 tp_is_empty!3813)))

(declare-fun mapIsEmpty!6438 () Bool)

(declare-fun mapRes!6438 () Bool)

(assert (=> mapIsEmpty!6438 mapRes!6438))

(declare-fun b!167530 () Bool)

(declare-datatypes ((Unit!5134 0))(
  ( (Unit!5135) )
))
(declare-fun e!110030 () Unit!5134)

(declare-fun Unit!5136 () Unit!5134)

(assert (=> b!167530 (= e!110030 Unit!5136)))

(declare-fun lt!83736 () Unit!5134)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!109 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4731 V!4731 (_ BitVec 64) Int) Unit!5134)

(assert (=> b!167530 (= lt!83736 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!109 (_keys!5284 thiss!1248) (_values!3442 thiss!1248) (mask!8208 thiss!1248) (extraKeys!3200 thiss!1248) (zeroValue!3302 thiss!1248) (minValue!3302 thiss!1248) key!828 (defaultEntry!3459 thiss!1248)))))

(assert (=> b!167530 false))

(declare-fun b!167531 () Bool)

(declare-fun e!110034 () Bool)

(assert (=> b!167531 (= e!110034 (not e!110039))))

(declare-fun res!79688 () Bool)

(assert (=> b!167531 (=> res!79688 e!110039)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167531 (= res!79688 (not (validMask!0 (mask!8208 thiss!1248))))))

(declare-fun v!309 () V!4731)

(declare-datatypes ((tuple2!3146 0))(
  ( (tuple2!3147 (_1!1584 (_ BitVec 64)) (_2!1584 V!4731)) )
))
(declare-datatypes ((List!2133 0))(
  ( (Nil!2130) (Cons!2129 (h!2746 tuple2!3146) (t!6935 List!2133)) )
))
(declare-datatypes ((ListLongMap!2101 0))(
  ( (ListLongMap!2102 (toList!1066 List!2133)) )
))
(declare-fun lt!83739 () ListLongMap!2101)

(declare-fun +!218 (ListLongMap!2101 tuple2!3146) ListLongMap!2101)

(declare-fun getCurrentListMap!724 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4731 V!4731 (_ BitVec 32) Int) ListLongMap!2101)

(assert (=> b!167531 (= (+!218 lt!83739 (tuple2!3147 key!828 v!309)) (getCurrentListMap!724 (_keys!5284 thiss!1248) (array!6726 (store (arr!3198 (_values!3442 thiss!1248)) (index!4097 lt!83737) (ValueCellFull!1563 v!309)) (size!3486 (_values!3442 thiss!1248))) (mask!8208 thiss!1248) (extraKeys!3200 thiss!1248) (zeroValue!3302 thiss!1248) (minValue!3302 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3459 thiss!1248)))))

(declare-fun lt!83740 () Unit!5134)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!73 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4731 V!4731 (_ BitVec 32) (_ BitVec 64) V!4731 Int) Unit!5134)

(assert (=> b!167531 (= lt!83740 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!73 (_keys!5284 thiss!1248) (_values!3442 thiss!1248) (mask!8208 thiss!1248) (extraKeys!3200 thiss!1248) (zeroValue!3302 thiss!1248) (minValue!3302 thiss!1248) (index!4097 lt!83737) key!828 v!309 (defaultEntry!3459 thiss!1248)))))

(declare-fun lt!83734 () Unit!5134)

(assert (=> b!167531 (= lt!83734 e!110030)))

(declare-fun c!30298 () Bool)

(declare-fun contains!1108 (ListLongMap!2101 (_ BitVec 64)) Bool)

(assert (=> b!167531 (= c!30298 (contains!1108 lt!83739 key!828))))

(assert (=> b!167531 (= lt!83739 (getCurrentListMap!724 (_keys!5284 thiss!1248) (_values!3442 thiss!1248) (mask!8208 thiss!1248) (extraKeys!3200 thiss!1248) (zeroValue!3302 thiss!1248) (minValue!3302 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3459 thiss!1248)))))

(declare-fun b!167532 () Bool)

(declare-fun e!110036 () Bool)

(assert (=> b!167532 (= e!110036 (and e!110031 mapRes!6438))))

(declare-fun condMapEmpty!6438 () Bool)

(declare-fun mapDefault!6438 () ValueCell!1563)

(assert (=> b!167532 (= condMapEmpty!6438 (= (arr!3198 (_values!3442 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1563)) mapDefault!6438)))))

(declare-fun e!110037 () Bool)

(declare-fun array_inv!2061 (array!6723) Bool)

(declare-fun array_inv!2062 (array!6725) Bool)

(assert (=> b!167533 (= e!110037 (and tp!14633 tp_is_empty!3813 (array_inv!2061 (_keys!5284 thiss!1248)) (array_inv!2062 (_values!3442 thiss!1248)) e!110036))))

(declare-fun b!167534 () Bool)

(declare-fun res!79691 () Bool)

(declare-fun e!110032 () Bool)

(assert (=> b!167534 (=> (not res!79691) (not e!110032))))

(assert (=> b!167534 (= res!79691 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167535 () Bool)

(declare-fun res!79687 () Bool)

(assert (=> b!167535 (=> res!79687 e!110039)))

(assert (=> b!167535 (= res!79687 (or (not (= (size!3486 (_values!3442 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8208 thiss!1248)))) (not (= (size!3485 (_keys!5284 thiss!1248)) (size!3486 (_values!3442 thiss!1248)))) (bvslt (mask!8208 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3200 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3200 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167536 () Bool)

(declare-fun lt!83738 () Unit!5134)

(assert (=> b!167536 (= e!110030 lt!83738)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!108 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4731 V!4731 (_ BitVec 64) Int) Unit!5134)

(assert (=> b!167536 (= lt!83738 (lemmaInListMapThenSeekEntryOrOpenFindsIt!108 (_keys!5284 thiss!1248) (_values!3442 thiss!1248) (mask!8208 thiss!1248) (extraKeys!3200 thiss!1248) (zeroValue!3302 thiss!1248) (minValue!3302 thiss!1248) key!828 (defaultEntry!3459 thiss!1248)))))

(declare-fun res!79686 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167536 (= res!79686 (inRange!0 (index!4097 lt!83737) (mask!8208 thiss!1248)))))

(assert (=> b!167536 (=> (not res!79686) (not e!110033))))

(assert (=> b!167536 e!110033))

(declare-fun b!167537 () Bool)

(assert (=> b!167537 (= e!110039 true)))

(declare-fun lt!83735 () Bool)

(declare-datatypes ((List!2134 0))(
  ( (Nil!2131) (Cons!2130 (h!2747 (_ BitVec 64)) (t!6936 List!2134)) )
))
(declare-fun arrayNoDuplicates!0 (array!6723 (_ BitVec 32) List!2134) Bool)

(assert (=> b!167537 (= lt!83735 (arrayNoDuplicates!0 (_keys!5284 thiss!1248) #b00000000000000000000000000000000 Nil!2131))))

(declare-fun b!167538 () Bool)

(assert (=> b!167538 (= e!110032 e!110034)))

(declare-fun res!79689 () Bool)

(assert (=> b!167538 (=> (not res!79689) (not e!110034))))

(get-info :version)

(assert (=> b!167538 (= res!79689 (and (not ((_ is Undefined!482) lt!83737)) (not ((_ is MissingVacant!482) lt!83737)) (not ((_ is MissingZero!482) lt!83737)) ((_ is Found!482) lt!83737)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6723 (_ BitVec 32)) SeekEntryResult!482)

(assert (=> b!167538 (= lt!83737 (seekEntryOrOpen!0 key!828 (_keys!5284 thiss!1248) (mask!8208 thiss!1248)))))

(declare-fun mapNonEmpty!6438 () Bool)

(declare-fun tp!14634 () Bool)

(assert (=> mapNonEmpty!6438 (= mapRes!6438 (and tp!14634 e!110035))))

(declare-fun mapKey!6438 () (_ BitVec 32))

(declare-fun mapRest!6438 () (Array (_ BitVec 32) ValueCell!1563))

(declare-fun mapValue!6438 () ValueCell!1563)

(assert (=> mapNonEmpty!6438 (= (arr!3198 (_values!3442 thiss!1248)) (store mapRest!6438 mapKey!6438 mapValue!6438))))

(declare-fun res!79692 () Bool)

(assert (=> start!16706 (=> (not res!79692) (not e!110032))))

(declare-fun valid!888 (LongMapFixedSize!2034) Bool)

(assert (=> start!16706 (= res!79692 (valid!888 thiss!1248))))

(assert (=> start!16706 e!110032))

(assert (=> start!16706 e!110037))

(assert (=> start!16706 true))

(assert (=> start!16706 tp_is_empty!3813))

(assert (= (and start!16706 res!79692) b!167534))

(assert (= (and b!167534 res!79691) b!167538))

(assert (= (and b!167538 res!79689) b!167531))

(assert (= (and b!167531 c!30298) b!167536))

(assert (= (and b!167531 (not c!30298)) b!167530))

(assert (= (and b!167536 res!79686) b!167526))

(assert (= (and b!167531 (not res!79688)) b!167535))

(assert (= (and b!167535 (not res!79687)) b!167527))

(assert (= (and b!167527 (not res!79690)) b!167537))

(assert (= (and b!167532 condMapEmpty!6438) mapIsEmpty!6438))

(assert (= (and b!167532 (not condMapEmpty!6438)) mapNonEmpty!6438))

(assert (= (and mapNonEmpty!6438 ((_ is ValueCellFull!1563) mapValue!6438)) b!167529))

(assert (= (and b!167532 ((_ is ValueCellFull!1563) mapDefault!6438)) b!167528))

(assert (= b!167533 b!167532))

(assert (= start!16706 b!167533))

(declare-fun m!196671 () Bool)

(assert (=> b!167526 m!196671))

(declare-fun m!196673 () Bool)

(assert (=> b!167538 m!196673))

(declare-fun m!196675 () Bool)

(assert (=> start!16706 m!196675))

(declare-fun m!196677 () Bool)

(assert (=> b!167530 m!196677))

(declare-fun m!196679 () Bool)

(assert (=> b!167533 m!196679))

(declare-fun m!196681 () Bool)

(assert (=> b!167533 m!196681))

(declare-fun m!196683 () Bool)

(assert (=> b!167527 m!196683))

(declare-fun m!196685 () Bool)

(assert (=> b!167531 m!196685))

(declare-fun m!196687 () Bool)

(assert (=> b!167531 m!196687))

(declare-fun m!196689 () Bool)

(assert (=> b!167531 m!196689))

(declare-fun m!196691 () Bool)

(assert (=> b!167531 m!196691))

(declare-fun m!196693 () Bool)

(assert (=> b!167531 m!196693))

(declare-fun m!196695 () Bool)

(assert (=> b!167531 m!196695))

(declare-fun m!196697 () Bool)

(assert (=> b!167531 m!196697))

(declare-fun m!196699 () Bool)

(assert (=> mapNonEmpty!6438 m!196699))

(declare-fun m!196701 () Bool)

(assert (=> b!167537 m!196701))

(declare-fun m!196703 () Bool)

(assert (=> b!167536 m!196703))

(declare-fun m!196705 () Bool)

(assert (=> b!167536 m!196705))

(check-sat (not b!167527) (not mapNonEmpty!6438) (not b!167538) (not b!167530) (not b!167531) (not b_next!4011) b_and!10425 (not b!167537) (not start!16706) (not b!167536) tp_is_empty!3813 (not b!167533))
(check-sat b_and!10425 (not b_next!4011))
