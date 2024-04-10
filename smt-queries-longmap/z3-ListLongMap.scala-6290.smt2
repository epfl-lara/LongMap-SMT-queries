; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80420 () Bool)

(assert start!80420)

(declare-fun b!944673 () Bool)

(declare-fun b_free!18063 () Bool)

(declare-fun b_next!18063 () Bool)

(assert (=> b!944673 (= b_free!18063 (not b_next!18063))))

(declare-fun tp!62699 () Bool)

(declare-fun b_and!29481 () Bool)

(assert (=> b!944673 (= tp!62699 b_and!29481)))

(declare-fun b!944671 () Bool)

(declare-fun e!531239 () Bool)

(assert (=> b!944671 (= e!531239 true)))

(declare-datatypes ((SeekEntryResult!9073 0))(
  ( (MissingZero!9073 (index!38663 (_ BitVec 32))) (Found!9073 (index!38664 (_ BitVec 32))) (Intermediate!9073 (undefined!9885 Bool) (index!38665 (_ BitVec 32)) (x!81140 (_ BitVec 32))) (Undefined!9073) (MissingVacant!9073 (index!38666 (_ BitVec 32))) )
))
(declare-fun lt!425708 () SeekEntryResult!9073)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32393 0))(
  ( (V!32394 (val!10336 Int)) )
))
(declare-datatypes ((ValueCell!9804 0))(
  ( (ValueCellFull!9804 (v!12868 V!32393)) (EmptyCell!9804) )
))
(declare-datatypes ((array!57110 0))(
  ( (array!57111 (arr!27480 (Array (_ BitVec 32) ValueCell!9804)) (size!27946 (_ BitVec 32))) )
))
(declare-datatypes ((array!57112 0))(
  ( (array!57113 (arr!27481 (Array (_ BitVec 32) (_ BitVec 64))) (size!27947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4758 0))(
  ( (LongMapFixedSize!4759 (defaultEntry!5674 Int) (mask!27328 (_ BitVec 32)) (extraKeys!5406 (_ BitVec 32)) (zeroValue!5510 V!32393) (minValue!5510 V!32393) (_size!2434 (_ BitVec 32)) (_keys!10552 array!57112) (_values!5697 array!57110) (_vacant!2434 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4758)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57112 (_ BitVec 32)) SeekEntryResult!9073)

(assert (=> b!944671 (= lt!425708 (seekEntryOrOpen!0 key!756 (_keys!10552 thiss!1141) (mask!27328 thiss!1141)))))

(declare-fun b!944672 () Bool)

(declare-fun res!634605 () Bool)

(declare-fun e!531240 () Bool)

(assert (=> b!944672 (=> (not res!634605) (not e!531240))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57112 (_ BitVec 32)) SeekEntryResult!9073)

(assert (=> b!944672 (= res!634605 (not ((_ is Found!9073) (seekEntry!0 key!756 (_keys!10552 thiss!1141) (mask!27328 thiss!1141)))))))

(declare-fun e!531244 () Bool)

(declare-fun tp_is_empty!20571 () Bool)

(declare-fun e!531243 () Bool)

(declare-fun array_inv!21350 (array!57112) Bool)

(declare-fun array_inv!21351 (array!57110) Bool)

(assert (=> b!944673 (= e!531244 (and tp!62699 tp_is_empty!20571 (array_inv!21350 (_keys!10552 thiss!1141)) (array_inv!21351 (_values!5697 thiss!1141)) e!531243))))

(declare-fun b!944674 () Bool)

(declare-fun res!634610 () Bool)

(assert (=> b!944674 (=> (not res!634610) (not e!531240))))

(assert (=> b!944674 (= res!634610 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944675 () Bool)

(declare-fun e!531241 () Bool)

(assert (=> b!944675 (= e!531241 tp_is_empty!20571)))

(declare-fun b!944676 () Bool)

(assert (=> b!944676 (= e!531240 (not e!531239))))

(declare-fun res!634604 () Bool)

(assert (=> b!944676 (=> res!634604 e!531239)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944676 (= res!634604 (not (validMask!0 (mask!27328 thiss!1141))))))

(declare-fun lt!425709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57112 (_ BitVec 32)) Bool)

(assert (=> b!944676 (arrayForallSeekEntryOrOpenFound!0 lt!425709 (_keys!10552 thiss!1141) (mask!27328 thiss!1141))))

(declare-datatypes ((Unit!31862 0))(
  ( (Unit!31863) )
))
(declare-fun lt!425706 () Unit!31862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31862)

(assert (=> b!944676 (= lt!425706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10552 thiss!1141) (mask!27328 thiss!1141) #b00000000000000000000000000000000 lt!425709))))

(declare-fun arrayScanForKey!0 (array!57112 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944676 (= lt!425709 (arrayScanForKey!0 (_keys!10552 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944676 (arrayContainsKey!0 (_keys!10552 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425707 () Unit!31862)

(declare-fun lemmaKeyInListMapIsInArray!311 (array!57112 array!57110 (_ BitVec 32) (_ BitVec 32) V!32393 V!32393 (_ BitVec 64) Int) Unit!31862)

(assert (=> b!944676 (= lt!425707 (lemmaKeyInListMapIsInArray!311 (_keys!10552 thiss!1141) (_values!5697 thiss!1141) (mask!27328 thiss!1141) (extraKeys!5406 thiss!1141) (zeroValue!5510 thiss!1141) (minValue!5510 thiss!1141) key!756 (defaultEntry!5674 thiss!1141)))))

(declare-fun b!944677 () Bool)

(declare-fun res!634611 () Bool)

(assert (=> b!944677 (=> res!634611 e!531239)))

(assert (=> b!944677 (= res!634611 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10552 thiss!1141) (mask!27328 thiss!1141))))))

(declare-fun b!944678 () Bool)

(declare-fun res!634606 () Bool)

(assert (=> b!944678 (=> res!634606 e!531239)))

(assert (=> b!944678 (= res!634606 (not (= (size!27947 (_keys!10552 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27328 thiss!1141)))))))

(declare-fun mapIsEmpty!32682 () Bool)

(declare-fun mapRes!32682 () Bool)

(assert (=> mapIsEmpty!32682 mapRes!32682))

(declare-fun b!944679 () Bool)

(declare-fun res!634609 () Bool)

(assert (=> b!944679 (=> (not res!634609) (not e!531240))))

(declare-datatypes ((tuple2!13490 0))(
  ( (tuple2!13491 (_1!6756 (_ BitVec 64)) (_2!6756 V!32393)) )
))
(declare-datatypes ((List!19279 0))(
  ( (Nil!19276) (Cons!19275 (h!20426 tuple2!13490) (t!27596 List!19279)) )
))
(declare-datatypes ((ListLongMap!12187 0))(
  ( (ListLongMap!12188 (toList!6109 List!19279)) )
))
(declare-fun contains!5181 (ListLongMap!12187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3343 (array!57112 array!57110 (_ BitVec 32) (_ BitVec 32) V!32393 V!32393 (_ BitVec 32) Int) ListLongMap!12187)

(assert (=> b!944679 (= res!634609 (contains!5181 (getCurrentListMap!3343 (_keys!10552 thiss!1141) (_values!5697 thiss!1141) (mask!27328 thiss!1141) (extraKeys!5406 thiss!1141) (zeroValue!5510 thiss!1141) (minValue!5510 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5674 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32682 () Bool)

(declare-fun tp!62698 () Bool)

(assert (=> mapNonEmpty!32682 (= mapRes!32682 (and tp!62698 e!531241))))

(declare-fun mapKey!32682 () (_ BitVec 32))

(declare-fun mapValue!32682 () ValueCell!9804)

(declare-fun mapRest!32682 () (Array (_ BitVec 32) ValueCell!9804))

(assert (=> mapNonEmpty!32682 (= (arr!27480 (_values!5697 thiss!1141)) (store mapRest!32682 mapKey!32682 mapValue!32682))))

(declare-fun res!634607 () Bool)

(assert (=> start!80420 (=> (not res!634607) (not e!531240))))

(declare-fun valid!1820 (LongMapFixedSize!4758) Bool)

(assert (=> start!80420 (= res!634607 (valid!1820 thiss!1141))))

(assert (=> start!80420 e!531240))

(assert (=> start!80420 e!531244))

(assert (=> start!80420 true))

(declare-fun b!944680 () Bool)

(declare-fun e!531242 () Bool)

(assert (=> b!944680 (= e!531242 tp_is_empty!20571)))

(declare-fun b!944681 () Bool)

(declare-fun res!634608 () Bool)

(assert (=> b!944681 (=> res!634608 e!531239)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944681 (= res!634608 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944682 () Bool)

(assert (=> b!944682 (= e!531243 (and e!531242 mapRes!32682))))

(declare-fun condMapEmpty!32682 () Bool)

(declare-fun mapDefault!32682 () ValueCell!9804)

(assert (=> b!944682 (= condMapEmpty!32682 (= (arr!27480 (_values!5697 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9804)) mapDefault!32682)))))

(assert (= (and start!80420 res!634607) b!944674))

(assert (= (and b!944674 res!634610) b!944672))

(assert (= (and b!944672 res!634605) b!944679))

(assert (= (and b!944679 res!634609) b!944676))

(assert (= (and b!944676 (not res!634604)) b!944678))

(assert (= (and b!944678 (not res!634606)) b!944677))

(assert (= (and b!944677 (not res!634611)) b!944681))

(assert (= (and b!944681 (not res!634608)) b!944671))

(assert (= (and b!944682 condMapEmpty!32682) mapIsEmpty!32682))

(assert (= (and b!944682 (not condMapEmpty!32682)) mapNonEmpty!32682))

(assert (= (and mapNonEmpty!32682 ((_ is ValueCellFull!9804) mapValue!32682)) b!944675))

(assert (= (and b!944682 ((_ is ValueCellFull!9804) mapDefault!32682)) b!944680))

(assert (= b!944673 b!944682))

(assert (= start!80420 b!944673))

(declare-fun m!878645 () Bool)

(assert (=> mapNonEmpty!32682 m!878645))

(declare-fun m!878647 () Bool)

(assert (=> b!944671 m!878647))

(declare-fun m!878649 () Bool)

(assert (=> b!944672 m!878649))

(declare-fun m!878651 () Bool)

(assert (=> b!944676 m!878651))

(declare-fun m!878653 () Bool)

(assert (=> b!944676 m!878653))

(declare-fun m!878655 () Bool)

(assert (=> b!944676 m!878655))

(declare-fun m!878657 () Bool)

(assert (=> b!944676 m!878657))

(declare-fun m!878659 () Bool)

(assert (=> b!944676 m!878659))

(declare-fun m!878661 () Bool)

(assert (=> b!944676 m!878661))

(declare-fun m!878663 () Bool)

(assert (=> b!944679 m!878663))

(assert (=> b!944679 m!878663))

(declare-fun m!878665 () Bool)

(assert (=> b!944679 m!878665))

(declare-fun m!878667 () Bool)

(assert (=> b!944673 m!878667))

(declare-fun m!878669 () Bool)

(assert (=> b!944673 m!878669))

(declare-fun m!878671 () Bool)

(assert (=> b!944677 m!878671))

(declare-fun m!878673 () Bool)

(assert (=> start!80420 m!878673))

(declare-fun m!878675 () Bool)

(assert (=> b!944681 m!878675))

(check-sat (not b!944677) (not start!80420) (not mapNonEmpty!32682) (not b!944673) (not b_next!18063) (not b!944676) b_and!29481 tp_is_empty!20571 (not b!944671) (not b!944672) (not b!944681) (not b!944679))
(check-sat b_and!29481 (not b_next!18063))
