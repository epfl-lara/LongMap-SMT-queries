; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80364 () Bool)

(assert start!80364)

(declare-fun b!943822 () Bool)

(declare-fun b_free!18025 () Bool)

(declare-fun b_next!18025 () Bool)

(assert (=> b!943822 (= b_free!18025 (not b_next!18025))))

(declare-fun tp!62586 () Bool)

(declare-fun b_and!29417 () Bool)

(assert (=> b!943822 (= tp!62586 b_and!29417)))

(declare-fun b!943816 () Bool)

(declare-fun res!634107 () Bool)

(declare-fun e!530694 () Bool)

(assert (=> b!943816 (=> (not res!634107) (not e!530694))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943816 (= res!634107 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943817 () Bool)

(declare-fun e!530697 () Bool)

(declare-fun e!530691 () Bool)

(declare-fun mapRes!32625 () Bool)

(assert (=> b!943817 (= e!530697 (and e!530691 mapRes!32625))))

(declare-fun condMapEmpty!32625 () Bool)

(declare-datatypes ((V!32343 0))(
  ( (V!32344 (val!10317 Int)) )
))
(declare-datatypes ((ValueCell!9785 0))(
  ( (ValueCellFull!9785 (v!12848 V!32343)) (EmptyCell!9785) )
))
(declare-datatypes ((array!56999 0))(
  ( (array!57000 (arr!27425 (Array (_ BitVec 32) ValueCell!9785)) (size!27893 (_ BitVec 32))) )
))
(declare-datatypes ((array!57001 0))(
  ( (array!57002 (arr!27426 (Array (_ BitVec 32) (_ BitVec 64))) (size!27894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4720 0))(
  ( (LongMapFixedSize!4721 (defaultEntry!5655 Int) (mask!27290 (_ BitVec 32)) (extraKeys!5387 (_ BitVec 32)) (zeroValue!5491 V!32343) (minValue!5491 V!32343) (_size!2415 (_ BitVec 32)) (_keys!10528 array!57001) (_values!5678 array!56999) (_vacant!2415 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4720)

(declare-fun mapDefault!32625 () ValueCell!9785)

(assert (=> b!943817 (= condMapEmpty!32625 (= (arr!27425 (_values!5678 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9785)) mapDefault!32625)))))

(declare-fun b!943818 () Bool)

(declare-fun e!530693 () Bool)

(assert (=> b!943818 (= e!530693 true)))

(declare-fun lt!425277 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57001 (_ BitVec 32)) Bool)

(assert (=> b!943818 (= lt!425277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10528 thiss!1141) (mask!27290 thiss!1141)))))

(declare-fun b!943819 () Bool)

(assert (=> b!943819 (= e!530694 (not e!530693))))

(declare-fun res!634110 () Bool)

(assert (=> b!943819 (=> res!634110 e!530693)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943819 (= res!634110 (not (validMask!0 (mask!27290 thiss!1141))))))

(declare-fun lt!425278 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57001 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943819 (= lt!425278 (arrayScanForKey!0 (_keys!10528 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943819 (arrayContainsKey!0 (_keys!10528 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31713 0))(
  ( (Unit!31714) )
))
(declare-fun lt!425276 () Unit!31713)

(declare-fun lemmaKeyInListMapIsInArray!285 (array!57001 array!56999 (_ BitVec 32) (_ BitVec 32) V!32343 V!32343 (_ BitVec 64) Int) Unit!31713)

(assert (=> b!943819 (= lt!425276 (lemmaKeyInListMapIsInArray!285 (_keys!10528 thiss!1141) (_values!5678 thiss!1141) (mask!27290 thiss!1141) (extraKeys!5387 thiss!1141) (zeroValue!5491 thiss!1141) (minValue!5491 thiss!1141) key!756 (defaultEntry!5655 thiss!1141)))))

(declare-fun b!943820 () Bool)

(declare-fun tp_is_empty!20533 () Bool)

(assert (=> b!943820 (= e!530691 tp_is_empty!20533)))

(declare-fun b!943821 () Bool)

(declare-fun res!634109 () Bool)

(assert (=> b!943821 (=> (not res!634109) (not e!530694))))

(declare-datatypes ((tuple2!13508 0))(
  ( (tuple2!13509 (_1!6765 (_ BitVec 64)) (_2!6765 V!32343)) )
))
(declare-datatypes ((List!19269 0))(
  ( (Nil!19266) (Cons!19265 (h!20416 tuple2!13508) (t!27577 List!19269)) )
))
(declare-datatypes ((ListLongMap!12195 0))(
  ( (ListLongMap!12196 (toList!6113 List!19269)) )
))
(declare-fun contains!5128 (ListLongMap!12195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3276 (array!57001 array!56999 (_ BitVec 32) (_ BitVec 32) V!32343 V!32343 (_ BitVec 32) Int) ListLongMap!12195)

(assert (=> b!943821 (= res!634109 (contains!5128 (getCurrentListMap!3276 (_keys!10528 thiss!1141) (_values!5678 thiss!1141) (mask!27290 thiss!1141) (extraKeys!5387 thiss!1141) (zeroValue!5491 thiss!1141) (minValue!5491 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5655 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32625 () Bool)

(assert (=> mapIsEmpty!32625 mapRes!32625))

(declare-fun res!634108 () Bool)

(assert (=> start!80364 (=> (not res!634108) (not e!530694))))

(declare-fun valid!1808 (LongMapFixedSize!4720) Bool)

(assert (=> start!80364 (= res!634108 (valid!1808 thiss!1141))))

(assert (=> start!80364 e!530694))

(declare-fun e!530692 () Bool)

(assert (=> start!80364 e!530692))

(assert (=> start!80364 true))

(declare-fun array_inv!21366 (array!57001) Bool)

(declare-fun array_inv!21367 (array!56999) Bool)

(assert (=> b!943822 (= e!530692 (and tp!62586 tp_is_empty!20533 (array_inv!21366 (_keys!10528 thiss!1141)) (array_inv!21367 (_values!5678 thiss!1141)) e!530697))))

(declare-fun b!943823 () Bool)

(declare-fun e!530695 () Bool)

(assert (=> b!943823 (= e!530695 tp_is_empty!20533)))

(declare-fun mapNonEmpty!32625 () Bool)

(declare-fun tp!62585 () Bool)

(assert (=> mapNonEmpty!32625 (= mapRes!32625 (and tp!62585 e!530695))))

(declare-fun mapRest!32625 () (Array (_ BitVec 32) ValueCell!9785))

(declare-fun mapKey!32625 () (_ BitVec 32))

(declare-fun mapValue!32625 () ValueCell!9785)

(assert (=> mapNonEmpty!32625 (= (arr!27425 (_values!5678 thiss!1141)) (store mapRest!32625 mapKey!32625 mapValue!32625))))

(declare-fun b!943824 () Bool)

(declare-fun res!634106 () Bool)

(assert (=> b!943824 (=> (not res!634106) (not e!530694))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9057 0))(
  ( (MissingZero!9057 (index!38599 (_ BitVec 32))) (Found!9057 (index!38600 (_ BitVec 32))) (Intermediate!9057 (undefined!9869 Bool) (index!38601 (_ BitVec 32)) (x!81071 (_ BitVec 32))) (Undefined!9057) (MissingVacant!9057 (index!38602 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57001 (_ BitVec 32)) SeekEntryResult!9057)

(assert (=> b!943824 (= res!634106 (not ((_ is Found!9057) (seekEntry!0 key!756 (_keys!10528 thiss!1141) (mask!27290 thiss!1141)))))))

(declare-fun b!943825 () Bool)

(declare-fun res!634111 () Bool)

(assert (=> b!943825 (=> res!634111 e!530693)))

(assert (=> b!943825 (= res!634111 (or (not (= (size!27894 (_keys!10528 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27290 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27894 (_keys!10528 thiss!1141))) (bvslt lt!425278 #b00000000000000000000000000000000) (bvsgt lt!425278 (size!27894 (_keys!10528 thiss!1141)))))))

(assert (= (and start!80364 res!634108) b!943816))

(assert (= (and b!943816 res!634107) b!943824))

(assert (= (and b!943824 res!634106) b!943821))

(assert (= (and b!943821 res!634109) b!943819))

(assert (= (and b!943819 (not res!634110)) b!943825))

(assert (= (and b!943825 (not res!634111)) b!943818))

(assert (= (and b!943817 condMapEmpty!32625) mapIsEmpty!32625))

(assert (= (and b!943817 (not condMapEmpty!32625)) mapNonEmpty!32625))

(assert (= (and mapNonEmpty!32625 ((_ is ValueCellFull!9785) mapValue!32625)) b!943823))

(assert (= (and b!943817 ((_ is ValueCellFull!9785) mapDefault!32625)) b!943820))

(assert (= b!943822 b!943817))

(assert (= start!80364 b!943822))

(declare-fun m!877375 () Bool)

(assert (=> b!943818 m!877375))

(declare-fun m!877377 () Bool)

(assert (=> start!80364 m!877377))

(declare-fun m!877379 () Bool)

(assert (=> b!943821 m!877379))

(assert (=> b!943821 m!877379))

(declare-fun m!877381 () Bool)

(assert (=> b!943821 m!877381))

(declare-fun m!877383 () Bool)

(assert (=> b!943822 m!877383))

(declare-fun m!877385 () Bool)

(assert (=> b!943822 m!877385))

(declare-fun m!877387 () Bool)

(assert (=> mapNonEmpty!32625 m!877387))

(declare-fun m!877389 () Bool)

(assert (=> b!943819 m!877389))

(declare-fun m!877391 () Bool)

(assert (=> b!943819 m!877391))

(declare-fun m!877393 () Bool)

(assert (=> b!943819 m!877393))

(declare-fun m!877395 () Bool)

(assert (=> b!943819 m!877395))

(declare-fun m!877397 () Bool)

(assert (=> b!943824 m!877397))

(check-sat (not b!943822) (not b_next!18025) tp_is_empty!20533 (not b!943821) (not b!943824) (not b!943819) (not start!80364) (not b!943818) (not mapNonEmpty!32625) b_and!29417)
(check-sat b_and!29417 (not b_next!18025))
