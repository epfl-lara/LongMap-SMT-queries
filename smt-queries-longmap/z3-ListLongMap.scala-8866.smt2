; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107606 () Bool)

(assert start!107606)

(declare-fun b!1273692 () Bool)

(declare-fun b_free!27741 () Bool)

(declare-fun b_next!27741 () Bool)

(assert (=> b!1273692 (= b_free!27741 (not b_next!27741))))

(declare-fun tp!97779 () Bool)

(declare-fun b_and!45797 () Bool)

(assert (=> b!1273692 (= tp!97779 b_and!45797)))

(declare-fun b!1273690 () Bool)

(declare-fun e!726752 () Bool)

(declare-fun e!726755 () Bool)

(declare-fun mapRes!51298 () Bool)

(assert (=> b!1273690 (= e!726752 (and e!726755 mapRes!51298))))

(declare-fun condMapEmpty!51298 () Bool)

(declare-datatypes ((V!49341 0))(
  ( (V!49342 (val!16630 Int)) )
))
(declare-datatypes ((ValueCell!15702 0))(
  ( (ValueCellFull!15702 (v!19267 V!49341)) (EmptyCell!15702) )
))
(declare-datatypes ((array!83500 0))(
  ( (array!83501 (arr!40272 (Array (_ BitVec 32) ValueCell!15702)) (size!40817 (_ BitVec 32))) )
))
(declare-datatypes ((array!83502 0))(
  ( (array!83503 (arr!40273 (Array (_ BitVec 32) (_ BitVec 64))) (size!40818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6168 0))(
  ( (LongMapFixedSize!6169 (defaultEntry!6730 Int) (mask!34520 (_ BitVec 32)) (extraKeys!6409 (_ BitVec 32)) (zeroValue!6515 V!49341) (minValue!6515 V!49341) (_size!3139 (_ BitVec 32)) (_keys!12144 array!83502) (_values!6753 array!83500) (_vacant!3139 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6168)

(declare-fun mapDefault!51298 () ValueCell!15702)

(assert (=> b!1273690 (= condMapEmpty!51298 (= (arr!40272 (_values!6753 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15702)) mapDefault!51298)))))

(declare-fun b!1273691 () Bool)

(declare-fun tp_is_empty!33111 () Bool)

(assert (=> b!1273691 (= e!726755 tp_is_empty!33111)))

(declare-fun mapIsEmpty!51298 () Bool)

(assert (=> mapIsEmpty!51298 mapRes!51298))

(declare-fun e!726756 () Bool)

(declare-fun array_inv!30617 (array!83502) Bool)

(declare-fun array_inv!30618 (array!83500) Bool)

(assert (=> b!1273692 (= e!726756 (and tp!97779 tp_is_empty!33111 (array_inv!30617 (_keys!12144 thiss!1551)) (array_inv!30618 (_values!6753 thiss!1551)) e!726752))))

(declare-fun b!1273693 () Bool)

(declare-fun e!726754 () Bool)

(assert (=> b!1273693 (= e!726754 false)))

(declare-fun lt!575143 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!83502 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273693 (= lt!575143 (arrayCountValidKeys!0 (_keys!12144 thiss!1551) #b00000000000000000000000000000000 (size!40818 (_keys!12144 thiss!1551))))))

(declare-fun mapNonEmpty!51298 () Bool)

(declare-fun tp!97780 () Bool)

(declare-fun e!726753 () Bool)

(assert (=> mapNonEmpty!51298 (= mapRes!51298 (and tp!97780 e!726753))))

(declare-fun mapKey!51298 () (_ BitVec 32))

(declare-fun mapValue!51298 () ValueCell!15702)

(declare-fun mapRest!51298 () (Array (_ BitVec 32) ValueCell!15702))

(assert (=> mapNonEmpty!51298 (= (arr!40272 (_values!6753 thiss!1551)) (store mapRest!51298 mapKey!51298 mapValue!51298))))

(declare-fun b!1273694 () Bool)

(assert (=> b!1273694 (= e!726753 tp_is_empty!33111)))

(declare-fun res!846936 () Bool)

(assert (=> start!107606 (=> (not res!846936) (not e!726754))))

(declare-fun simpleValid!473 (LongMapFixedSize!6168) Bool)

(assert (=> start!107606 (= res!846936 (simpleValid!473 thiss!1551))))

(assert (=> start!107606 e!726754))

(assert (=> start!107606 e!726756))

(assert (= (and start!107606 res!846936) b!1273693))

(assert (= (and b!1273690 condMapEmpty!51298) mapIsEmpty!51298))

(assert (= (and b!1273690 (not condMapEmpty!51298)) mapNonEmpty!51298))

(get-info :version)

(assert (= (and mapNonEmpty!51298 ((_ is ValueCellFull!15702) mapValue!51298)) b!1273694))

(assert (= (and b!1273690 ((_ is ValueCellFull!15702) mapDefault!51298)) b!1273691))

(assert (= b!1273692 b!1273690))

(assert (= start!107606 b!1273692))

(declare-fun m!1170757 () Bool)

(assert (=> b!1273692 m!1170757))

(declare-fun m!1170759 () Bool)

(assert (=> b!1273692 m!1170759))

(declare-fun m!1170761 () Bool)

(assert (=> b!1273693 m!1170761))

(declare-fun m!1170763 () Bool)

(assert (=> mapNonEmpty!51298 m!1170763))

(declare-fun m!1170765 () Bool)

(assert (=> start!107606 m!1170765))

(check-sat (not start!107606) (not b!1273692) b_and!45797 (not b!1273693) tp_is_empty!33111 (not b_next!27741) (not mapNonEmpty!51298))
(check-sat b_and!45797 (not b_next!27741))
