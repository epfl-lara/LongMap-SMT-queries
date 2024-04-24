; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80550 () Bool)

(assert start!80550)

(declare-fun b!944965 () Bool)

(declare-fun b_free!18025 () Bool)

(declare-fun b_next!18025 () Bool)

(assert (=> b!944965 (= b_free!18025 (not b_next!18025))))

(declare-fun tp!62586 () Bool)

(declare-fun b_and!29453 () Bool)

(assert (=> b!944965 (= tp!62586 b_and!29453)))

(declare-fun b!944958 () Bool)

(declare-fun res!634560 () Bool)

(declare-fun e!531426 () Bool)

(assert (=> b!944958 (=> res!634560 e!531426)))

(declare-datatypes ((V!32343 0))(
  ( (V!32344 (val!10317 Int)) )
))
(declare-datatypes ((ValueCell!9785 0))(
  ( (ValueCellFull!9785 (v!12846 V!32343)) (EmptyCell!9785) )
))
(declare-datatypes ((array!57085 0))(
  ( (array!57086 (arr!27463 (Array (_ BitVec 32) ValueCell!9785)) (size!27930 (_ BitVec 32))) )
))
(declare-datatypes ((array!57087 0))(
  ( (array!57088 (arr!27464 (Array (_ BitVec 32) (_ BitVec 64))) (size!27931 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4720 0))(
  ( (LongMapFixedSize!4721 (defaultEntry!5655 Int) (mask!27340 (_ BitVec 32)) (extraKeys!5387 (_ BitVec 32)) (zeroValue!5491 V!32343) (minValue!5491 V!32343) (_size!2415 (_ BitVec 32)) (_keys!10561 array!57087) (_values!5678 array!57085) (_vacant!2415 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4720)

(declare-fun lt!425874 () (_ BitVec 32))

(assert (=> b!944958 (= res!634560 (or (not (= (size!27931 (_keys!10561 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27340 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27931 (_keys!10561 thiss!1141))) (bvslt lt!425874 #b00000000000000000000000000000000) (bvsgt lt!425874 (size!27931 (_keys!10561 thiss!1141)))))))

(declare-fun mapIsEmpty!32625 () Bool)

(declare-fun mapRes!32625 () Bool)

(assert (=> mapIsEmpty!32625 mapRes!32625))

(declare-fun b!944959 () Bool)

(declare-fun e!531427 () Bool)

(declare-fun tp_is_empty!20533 () Bool)

(assert (=> b!944959 (= e!531427 tp_is_empty!20533)))

(declare-fun b!944960 () Bool)

(assert (=> b!944960 (= e!531426 true)))

(declare-fun lt!425873 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57087 (_ BitVec 32)) Bool)

(assert (=> b!944960 (= lt!425873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10561 thiss!1141) (mask!27340 thiss!1141)))))

(declare-fun res!634563 () Bool)

(declare-fun e!531422 () Bool)

(assert (=> start!80550 (=> (not res!634563) (not e!531422))))

(declare-fun valid!1813 (LongMapFixedSize!4720) Bool)

(assert (=> start!80550 (= res!634563 (valid!1813 thiss!1141))))

(assert (=> start!80550 e!531422))

(declare-fun e!531425 () Bool)

(assert (=> start!80550 e!531425))

(assert (=> start!80550 true))

(declare-fun b!944961 () Bool)

(declare-fun e!531424 () Bool)

(assert (=> b!944961 (= e!531424 tp_is_empty!20533)))

(declare-fun b!944962 () Bool)

(declare-fun res!634564 () Bool)

(assert (=> b!944962 (=> (not res!634564) (not e!531422))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9019 0))(
  ( (MissingZero!9019 (index!38447 (_ BitVec 32))) (Found!9019 (index!38448 (_ BitVec 32))) (Intermediate!9019 (undefined!9831 Bool) (index!38449 (_ BitVec 32)) (x!81052 (_ BitVec 32))) (Undefined!9019) (MissingVacant!9019 (index!38450 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57087 (_ BitVec 32)) SeekEntryResult!9019)

(assert (=> b!944962 (= res!634564 (not ((_ is Found!9019) (seekEntry!0 key!756 (_keys!10561 thiss!1141) (mask!27340 thiss!1141)))))))

(declare-fun b!944963 () Bool)

(assert (=> b!944963 (= e!531422 (not e!531426))))

(declare-fun res!634561 () Bool)

(assert (=> b!944963 (=> res!634561 e!531426)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944963 (= res!634561 (not (validMask!0 (mask!27340 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57087 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944963 (= lt!425874 (arrayScanForKey!0 (_keys!10561 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944963 (arrayContainsKey!0 (_keys!10561 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31810 0))(
  ( (Unit!31811) )
))
(declare-fun lt!425875 () Unit!31810)

(declare-fun lemmaKeyInListMapIsInArray!296 (array!57087 array!57085 (_ BitVec 32) (_ BitVec 32) V!32343 V!32343 (_ BitVec 64) Int) Unit!31810)

(assert (=> b!944963 (= lt!425875 (lemmaKeyInListMapIsInArray!296 (_keys!10561 thiss!1141) (_values!5678 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5387 thiss!1141) (zeroValue!5491 thiss!1141) (minValue!5491 thiss!1141) key!756 (defaultEntry!5655 thiss!1141)))))

(declare-fun mapNonEmpty!32625 () Bool)

(declare-fun tp!62585 () Bool)

(assert (=> mapNonEmpty!32625 (= mapRes!32625 (and tp!62585 e!531424))))

(declare-fun mapRest!32625 () (Array (_ BitVec 32) ValueCell!9785))

(declare-fun mapValue!32625 () ValueCell!9785)

(declare-fun mapKey!32625 () (_ BitVec 32))

(assert (=> mapNonEmpty!32625 (= (arr!27463 (_values!5678 thiss!1141)) (store mapRest!32625 mapKey!32625 mapValue!32625))))

(declare-fun b!944964 () Bool)

(declare-fun res!634562 () Bool)

(assert (=> b!944964 (=> (not res!634562) (not e!531422))))

(assert (=> b!944964 (= res!634562 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!531421 () Bool)

(declare-fun array_inv!21422 (array!57087) Bool)

(declare-fun array_inv!21423 (array!57085) Bool)

(assert (=> b!944965 (= e!531425 (and tp!62586 tp_is_empty!20533 (array_inv!21422 (_keys!10561 thiss!1141)) (array_inv!21423 (_values!5678 thiss!1141)) e!531421))))

(declare-fun b!944966 () Bool)

(assert (=> b!944966 (= e!531421 (and e!531427 mapRes!32625))))

(declare-fun condMapEmpty!32625 () Bool)

(declare-fun mapDefault!32625 () ValueCell!9785)

(assert (=> b!944966 (= condMapEmpty!32625 (= (arr!27463 (_values!5678 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9785)) mapDefault!32625)))))

(declare-fun b!944967 () Bool)

(declare-fun res!634565 () Bool)

(assert (=> b!944967 (=> (not res!634565) (not e!531422))))

(declare-datatypes ((tuple2!13446 0))(
  ( (tuple2!13447 (_1!6734 (_ BitVec 64)) (_2!6734 V!32343)) )
))
(declare-datatypes ((List!19252 0))(
  ( (Nil!19249) (Cons!19248 (h!20405 tuple2!13446) (t!27561 List!19252)) )
))
(declare-datatypes ((ListLongMap!12145 0))(
  ( (ListLongMap!12146 (toList!6088 List!19252)) )
))
(declare-fun contains!5171 (ListLongMap!12145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3322 (array!57087 array!57085 (_ BitVec 32) (_ BitVec 32) V!32343 V!32343 (_ BitVec 32) Int) ListLongMap!12145)

(assert (=> b!944967 (= res!634565 (contains!5171 (getCurrentListMap!3322 (_keys!10561 thiss!1141) (_values!5678 thiss!1141) (mask!27340 thiss!1141) (extraKeys!5387 thiss!1141) (zeroValue!5491 thiss!1141) (minValue!5491 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5655 thiss!1141)) key!756))))

(assert (= (and start!80550 res!634563) b!944964))

(assert (= (and b!944964 res!634562) b!944962))

(assert (= (and b!944962 res!634564) b!944967))

(assert (= (and b!944967 res!634565) b!944963))

(assert (= (and b!944963 (not res!634561)) b!944958))

(assert (= (and b!944958 (not res!634560)) b!944960))

(assert (= (and b!944966 condMapEmpty!32625) mapIsEmpty!32625))

(assert (= (and b!944966 (not condMapEmpty!32625)) mapNonEmpty!32625))

(assert (= (and mapNonEmpty!32625 ((_ is ValueCellFull!9785) mapValue!32625)) b!944961))

(assert (= (and b!944966 ((_ is ValueCellFull!9785) mapDefault!32625)) b!944959))

(assert (= b!944965 b!944966))

(assert (= start!80550 b!944965))

(declare-fun m!879427 () Bool)

(assert (=> b!944967 m!879427))

(assert (=> b!944967 m!879427))

(declare-fun m!879429 () Bool)

(assert (=> b!944967 m!879429))

(declare-fun m!879431 () Bool)

(assert (=> b!944960 m!879431))

(declare-fun m!879433 () Bool)

(assert (=> b!944963 m!879433))

(declare-fun m!879435 () Bool)

(assert (=> b!944963 m!879435))

(declare-fun m!879437 () Bool)

(assert (=> b!944963 m!879437))

(declare-fun m!879439 () Bool)

(assert (=> b!944963 m!879439))

(declare-fun m!879441 () Bool)

(assert (=> mapNonEmpty!32625 m!879441))

(declare-fun m!879443 () Bool)

(assert (=> b!944965 m!879443))

(declare-fun m!879445 () Bool)

(assert (=> b!944965 m!879445))

(declare-fun m!879447 () Bool)

(assert (=> start!80550 m!879447))

(declare-fun m!879449 () Bool)

(assert (=> b!944962 m!879449))

(check-sat (not b_next!18025) (not b!944962) (not b!944967) b_and!29453 (not mapNonEmpty!32625) tp_is_empty!20533 (not start!80550) (not b!944960) (not b!944963) (not b!944965))
(check-sat b_and!29453 (not b_next!18025))
