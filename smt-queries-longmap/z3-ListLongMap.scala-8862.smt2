; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107544 () Bool)

(assert start!107544)

(declare-fun b!1273299 () Bool)

(declare-fun b_free!27715 () Bool)

(declare-fun b_next!27715 () Bool)

(assert (=> b!1273299 (= b_free!27715 (not b_next!27715))))

(declare-fun tp!97690 () Bool)

(declare-fun b_and!45753 () Bool)

(assert (=> b!1273299 (= tp!97690 b_and!45753)))

(declare-fun b!1273298 () Bool)

(declare-fun e!726441 () Bool)

(declare-fun tp_is_empty!33085 () Bool)

(assert (=> b!1273298 (= e!726441 tp_is_empty!33085)))

(declare-fun e!726442 () Bool)

(declare-fun e!726444 () Bool)

(declare-datatypes ((V!49307 0))(
  ( (V!49308 (val!16617 Int)) )
))
(declare-datatypes ((ValueCell!15689 0))(
  ( (ValueCellFull!15689 (v!19253 V!49307)) (EmptyCell!15689) )
))
(declare-datatypes ((array!83339 0))(
  ( (array!83340 (arr!40196 (Array (_ BitVec 32) ValueCell!15689)) (size!40739 (_ BitVec 32))) )
))
(declare-datatypes ((array!83341 0))(
  ( (array!83342 (arr!40197 (Array (_ BitVec 32) (_ BitVec 64))) (size!40740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6142 0))(
  ( (LongMapFixedSize!6143 (defaultEntry!6717 Int) (mask!34491 (_ BitVec 32)) (extraKeys!6396 (_ BitVec 32)) (zeroValue!6502 V!49307) (minValue!6502 V!49307) (_size!3126 (_ BitVec 32)) (_keys!12127 array!83341) (_values!6740 array!83339) (_vacant!3126 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6142)

(declare-fun array_inv!30717 (array!83341) Bool)

(declare-fun array_inv!30718 (array!83339) Bool)

(assert (=> b!1273299 (= e!726444 (and tp!97690 tp_is_empty!33085 (array_inv!30717 (_keys!12127 thiss!1551)) (array_inv!30718 (_values!6740 thiss!1551)) e!726442))))

(declare-fun b!1273300 () Bool)

(declare-fun e!726439 () Bool)

(assert (=> b!1273300 (= e!726439 tp_is_empty!33085)))

(declare-fun b!1273301 () Bool)

(declare-fun e!726443 () Bool)

(assert (=> b!1273301 (= e!726443 (bvsgt #b00000000000000000000000000000000 (size!40740 (_keys!12127 thiss!1551))))))

(declare-fun mapNonEmpty!51246 () Bool)

(declare-fun mapRes!51246 () Bool)

(declare-fun tp!97689 () Bool)

(assert (=> mapNonEmpty!51246 (= mapRes!51246 (and tp!97689 e!726439))))

(declare-fun mapRest!51246 () (Array (_ BitVec 32) ValueCell!15689))

(declare-fun mapKey!51246 () (_ BitVec 32))

(declare-fun mapValue!51246 () ValueCell!15689)

(assert (=> mapNonEmpty!51246 (= (arr!40196 (_values!6740 thiss!1551)) (store mapRest!51246 mapKey!51246 mapValue!51246))))

(declare-fun b!1273302 () Bool)

(assert (=> b!1273302 (= e!726442 (and e!726441 mapRes!51246))))

(declare-fun condMapEmpty!51246 () Bool)

(declare-fun mapDefault!51246 () ValueCell!15689)

(assert (=> b!1273302 (= condMapEmpty!51246 (= (arr!40196 (_values!6740 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15689)) mapDefault!51246)))))

(declare-fun res!846795 () Bool)

(assert (=> start!107544 (=> (not res!846795) (not e!726443))))

(declare-fun simpleValid!464 (LongMapFixedSize!6142) Bool)

(assert (=> start!107544 (= res!846795 (simpleValid!464 thiss!1551))))

(assert (=> start!107544 e!726443))

(assert (=> start!107544 e!726444))

(declare-fun mapIsEmpty!51246 () Bool)

(assert (=> mapIsEmpty!51246 mapRes!51246))

(assert (= (and start!107544 res!846795) b!1273301))

(assert (= (and b!1273302 condMapEmpty!51246) mapIsEmpty!51246))

(assert (= (and b!1273302 (not condMapEmpty!51246)) mapNonEmpty!51246))

(get-info :version)

(assert (= (and mapNonEmpty!51246 ((_ is ValueCellFull!15689) mapValue!51246)) b!1273300))

(assert (= (and b!1273302 ((_ is ValueCellFull!15689) mapDefault!51246)) b!1273298))

(assert (= b!1273299 b!1273302))

(assert (= start!107544 b!1273299))

(declare-fun m!1170093 () Bool)

(assert (=> b!1273299 m!1170093))

(declare-fun m!1170095 () Bool)

(assert (=> b!1273299 m!1170095))

(declare-fun m!1170097 () Bool)

(assert (=> mapNonEmpty!51246 m!1170097))

(declare-fun m!1170099 () Bool)

(assert (=> start!107544 m!1170099))

(check-sat (not b_next!27715) b_and!45753 tp_is_empty!33085 (not mapNonEmpty!51246) (not start!107544) (not b!1273299))
(check-sat b_and!45753 (not b_next!27715))
(get-model)

(declare-fun b!1273341 () Bool)

(declare-fun res!846811 () Bool)

(declare-fun e!726483 () Bool)

(assert (=> b!1273341 (=> (not res!846811) (not e!726483))))

(assert (=> b!1273341 (= res!846811 (and (= (size!40739 (_values!6740 thiss!1551)) (bvadd (mask!34491 thiss!1551) #b00000000000000000000000000000001)) (= (size!40740 (_keys!12127 thiss!1551)) (size!40739 (_values!6740 thiss!1551))) (bvsge (_size!3126 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3126 thiss!1551) (bvadd (mask!34491 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun d!139873 () Bool)

(declare-fun res!846810 () Bool)

(assert (=> d!139873 (=> (not res!846810) (not e!726483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139873 (= res!846810 (validMask!0 (mask!34491 thiss!1551)))))

(assert (=> d!139873 (= (simpleValid!464 thiss!1551) e!726483)))

(declare-fun b!1273344 () Bool)

(assert (=> b!1273344 (= e!726483 (and (bvsge (extraKeys!6396 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6396 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3126 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273342 () Bool)

(declare-fun res!846812 () Bool)

(assert (=> b!1273342 (=> (not res!846812) (not e!726483))))

(declare-fun size!40745 (LongMapFixedSize!6142) (_ BitVec 32))

(assert (=> b!1273342 (= res!846812 (bvsge (size!40745 thiss!1551) (_size!3126 thiss!1551)))))

(declare-fun b!1273343 () Bool)

(declare-fun res!846813 () Bool)

(assert (=> b!1273343 (=> (not res!846813) (not e!726483))))

(assert (=> b!1273343 (= res!846813 (= (size!40745 thiss!1551) (bvadd (_size!3126 thiss!1551) (bvsdiv (bvadd (extraKeys!6396 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!139873 res!846810) b!1273341))

(assert (= (and b!1273341 res!846811) b!1273342))

(assert (= (and b!1273342 res!846812) b!1273343))

(assert (= (and b!1273343 res!846813) b!1273344))

(declare-fun m!1170117 () Bool)

(assert (=> d!139873 m!1170117))

(declare-fun m!1170119 () Bool)

(assert (=> b!1273342 m!1170119))

(assert (=> b!1273343 m!1170119))

(assert (=> start!107544 d!139873))

(declare-fun d!139875 () Bool)

(assert (=> d!139875 (= (array_inv!30717 (_keys!12127 thiss!1551)) (bvsge (size!40740 (_keys!12127 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273299 d!139875))

(declare-fun d!139877 () Bool)

(assert (=> d!139877 (= (array_inv!30718 (_values!6740 thiss!1551)) (bvsge (size!40739 (_values!6740 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273299 d!139877))

(declare-fun b!1273352 () Bool)

(declare-fun e!726488 () Bool)

(assert (=> b!1273352 (= e!726488 tp_is_empty!33085)))

(declare-fun mapNonEmpty!51255 () Bool)

(declare-fun mapRes!51255 () Bool)

(declare-fun tp!97705 () Bool)

(declare-fun e!726489 () Bool)

(assert (=> mapNonEmpty!51255 (= mapRes!51255 (and tp!97705 e!726489))))

(declare-fun mapKey!51255 () (_ BitVec 32))

(declare-fun mapValue!51255 () ValueCell!15689)

(declare-fun mapRest!51255 () (Array (_ BitVec 32) ValueCell!15689))

(assert (=> mapNonEmpty!51255 (= mapRest!51246 (store mapRest!51255 mapKey!51255 mapValue!51255))))

(declare-fun condMapEmpty!51255 () Bool)

(declare-fun mapDefault!51255 () ValueCell!15689)

(assert (=> mapNonEmpty!51246 (= condMapEmpty!51255 (= mapRest!51246 ((as const (Array (_ BitVec 32) ValueCell!15689)) mapDefault!51255)))))

(assert (=> mapNonEmpty!51246 (= tp!97689 (and e!726488 mapRes!51255))))

(declare-fun b!1273351 () Bool)

(assert (=> b!1273351 (= e!726489 tp_is_empty!33085)))

(declare-fun mapIsEmpty!51255 () Bool)

(assert (=> mapIsEmpty!51255 mapRes!51255))

(assert (= (and mapNonEmpty!51246 condMapEmpty!51255) mapIsEmpty!51255))

(assert (= (and mapNonEmpty!51246 (not condMapEmpty!51255)) mapNonEmpty!51255))

(assert (= (and mapNonEmpty!51255 ((_ is ValueCellFull!15689) mapValue!51255)) b!1273351))

(assert (= (and mapNonEmpty!51246 ((_ is ValueCellFull!15689) mapDefault!51255)) b!1273352))

(declare-fun m!1170121 () Bool)

(assert (=> mapNonEmpty!51255 m!1170121))

(check-sat (not b_next!27715) (not b!1273342) b_and!45753 tp_is_empty!33085 (not mapNonEmpty!51255) (not b!1273343) (not d!139873))
(check-sat b_and!45753 (not b_next!27715))
