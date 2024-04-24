; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80562 () Bool)

(assert start!80562)

(declare-fun b!945140 () Bool)

(declare-fun b_free!18037 () Bool)

(declare-fun b_next!18037 () Bool)

(assert (=> b!945140 (= b_free!18037 (not b_next!18037))))

(declare-fun tp!62622 () Bool)

(declare-fun b_and!29465 () Bool)

(assert (=> b!945140 (= tp!62622 b_and!29465)))

(declare-fun b!945138 () Bool)

(declare-fun e!531549 () Bool)

(declare-fun tp_is_empty!20545 () Bool)

(assert (=> b!945138 (= e!531549 tp_is_empty!20545)))

(declare-fun b!945139 () Bool)

(declare-fun res!634671 () Bool)

(declare-fun e!531552 () Bool)

(assert (=> b!945139 (=> res!634671 e!531552)))

(declare-datatypes ((V!32359 0))(
  ( (V!32360 (val!10323 Int)) )
))
(declare-datatypes ((ValueCell!9791 0))(
  ( (ValueCellFull!9791 (v!12852 V!32359)) (EmptyCell!9791) )
))
(declare-datatypes ((array!57109 0))(
  ( (array!57110 (arr!27475 (Array (_ BitVec 32) ValueCell!9791)) (size!27942 (_ BitVec 32))) )
))
(declare-datatypes ((array!57111 0))(
  ( (array!57112 (arr!27476 (Array (_ BitVec 32) (_ BitVec 64))) (size!27943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4732 0))(
  ( (LongMapFixedSize!4733 (defaultEntry!5661 Int) (mask!27350 (_ BitVec 32)) (extraKeys!5393 (_ BitVec 32)) (zeroValue!5497 V!32359) (minValue!5497 V!32359) (_size!2421 (_ BitVec 32)) (_keys!10567 array!57111) (_values!5684 array!57109) (_vacant!2421 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4732)

(declare-fun lt!425929 () (_ BitVec 32))

(assert (=> b!945139 (= res!634671 (or (not (= (size!27943 (_keys!10567 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27350 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27943 (_keys!10567 thiss!1141))) (bvslt lt!425929 #b00000000000000000000000000000000) (bvsgt lt!425929 (size!27943 (_keys!10567 thiss!1141)))))))

(declare-fun res!634670 () Bool)

(declare-fun e!531551 () Bool)

(assert (=> start!80562 (=> (not res!634670) (not e!531551))))

(declare-fun valid!1817 (LongMapFixedSize!4732) Bool)

(assert (=> start!80562 (= res!634670 (valid!1817 thiss!1141))))

(assert (=> start!80562 e!531551))

(declare-fun e!531553 () Bool)

(assert (=> start!80562 e!531553))

(assert (=> start!80562 true))

(declare-fun e!531547 () Bool)

(declare-fun array_inv!21432 (array!57111) Bool)

(declare-fun array_inv!21433 (array!57109) Bool)

(assert (=> b!945140 (= e!531553 (and tp!62622 tp_is_empty!20545 (array_inv!21432 (_keys!10567 thiss!1141)) (array_inv!21433 (_values!5684 thiss!1141)) e!531547))))

(declare-fun b!945141 () Bool)

(declare-fun res!634669 () Bool)

(assert (=> b!945141 (=> (not res!634669) (not e!531551))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13454 0))(
  ( (tuple2!13455 (_1!6738 (_ BitVec 64)) (_2!6738 V!32359)) )
))
(declare-datatypes ((List!19256 0))(
  ( (Nil!19253) (Cons!19252 (h!20409 tuple2!13454) (t!27565 List!19256)) )
))
(declare-datatypes ((ListLongMap!12153 0))(
  ( (ListLongMap!12154 (toList!6092 List!19256)) )
))
(declare-fun contains!5175 (ListLongMap!12153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3326 (array!57111 array!57109 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 32) Int) ListLongMap!12153)

(assert (=> b!945141 (= res!634669 (contains!5175 (getCurrentListMap!3326 (_keys!10567 thiss!1141) (_values!5684 thiss!1141) (mask!27350 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5661 thiss!1141)) key!756))))

(declare-fun b!945142 () Bool)

(declare-fun res!634668 () Bool)

(assert (=> b!945142 (=> (not res!634668) (not e!531551))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9024 0))(
  ( (MissingZero!9024 (index!38467 (_ BitVec 32))) (Found!9024 (index!38468 (_ BitVec 32))) (Intermediate!9024 (undefined!9836 Bool) (index!38469 (_ BitVec 32)) (x!81073 (_ BitVec 32))) (Undefined!9024) (MissingVacant!9024 (index!38470 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57111 (_ BitVec 32)) SeekEntryResult!9024)

(assert (=> b!945142 (= res!634668 (not ((_ is Found!9024) (seekEntry!0 key!756 (_keys!10567 thiss!1141) (mask!27350 thiss!1141)))))))

(declare-fun mapIsEmpty!32643 () Bool)

(declare-fun mapRes!32643 () Bool)

(assert (=> mapIsEmpty!32643 mapRes!32643))

(declare-fun b!945143 () Bool)

(declare-fun e!531548 () Bool)

(assert (=> b!945143 (= e!531548 tp_is_empty!20545)))

(declare-fun b!945144 () Bool)

(declare-fun res!634672 () Bool)

(assert (=> b!945144 (=> (not res!634672) (not e!531551))))

(assert (=> b!945144 (= res!634672 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945145 () Bool)

(assert (=> b!945145 (= e!531551 (not e!531552))))

(declare-fun res!634673 () Bool)

(assert (=> b!945145 (=> res!634673 e!531552)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945145 (= res!634673 (not (validMask!0 (mask!27350 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57111 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945145 (= lt!425929 (arrayScanForKey!0 (_keys!10567 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945145 (arrayContainsKey!0 (_keys!10567 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31818 0))(
  ( (Unit!31819) )
))
(declare-fun lt!425927 () Unit!31818)

(declare-fun lemmaKeyInListMapIsInArray!300 (array!57111 array!57109 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 64) Int) Unit!31818)

(assert (=> b!945145 (= lt!425927 (lemmaKeyInListMapIsInArray!300 (_keys!10567 thiss!1141) (_values!5684 thiss!1141) (mask!27350 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) key!756 (defaultEntry!5661 thiss!1141)))))

(declare-fun b!945146 () Bool)

(assert (=> b!945146 (= e!531547 (and e!531548 mapRes!32643))))

(declare-fun condMapEmpty!32643 () Bool)

(declare-fun mapDefault!32643 () ValueCell!9791)

(assert (=> b!945146 (= condMapEmpty!32643 (= (arr!27475 (_values!5684 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9791)) mapDefault!32643)))))

(declare-fun b!945147 () Bool)

(assert (=> b!945147 (= e!531552 true)))

(declare-fun lt!425928 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57111 (_ BitVec 32)) Bool)

(assert (=> b!945147 (= lt!425928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10567 thiss!1141) (mask!27350 thiss!1141)))))

(declare-fun mapNonEmpty!32643 () Bool)

(declare-fun tp!62621 () Bool)

(assert (=> mapNonEmpty!32643 (= mapRes!32643 (and tp!62621 e!531549))))

(declare-fun mapKey!32643 () (_ BitVec 32))

(declare-fun mapRest!32643 () (Array (_ BitVec 32) ValueCell!9791))

(declare-fun mapValue!32643 () ValueCell!9791)

(assert (=> mapNonEmpty!32643 (= (arr!27475 (_values!5684 thiss!1141)) (store mapRest!32643 mapKey!32643 mapValue!32643))))

(assert (= (and start!80562 res!634670) b!945144))

(assert (= (and b!945144 res!634672) b!945142))

(assert (= (and b!945142 res!634668) b!945141))

(assert (= (and b!945141 res!634669) b!945145))

(assert (= (and b!945145 (not res!634673)) b!945139))

(assert (= (and b!945139 (not res!634671)) b!945147))

(assert (= (and b!945146 condMapEmpty!32643) mapIsEmpty!32643))

(assert (= (and b!945146 (not condMapEmpty!32643)) mapNonEmpty!32643))

(assert (= (and mapNonEmpty!32643 ((_ is ValueCellFull!9791) mapValue!32643)) b!945138))

(assert (= (and b!945146 ((_ is ValueCellFull!9791) mapDefault!32643)) b!945143))

(assert (= b!945140 b!945146))

(assert (= start!80562 b!945140))

(declare-fun m!879571 () Bool)

(assert (=> b!945147 m!879571))

(declare-fun m!879573 () Bool)

(assert (=> b!945140 m!879573))

(declare-fun m!879575 () Bool)

(assert (=> b!945140 m!879575))

(declare-fun m!879577 () Bool)

(assert (=> b!945145 m!879577))

(declare-fun m!879579 () Bool)

(assert (=> b!945145 m!879579))

(declare-fun m!879581 () Bool)

(assert (=> b!945145 m!879581))

(declare-fun m!879583 () Bool)

(assert (=> b!945145 m!879583))

(declare-fun m!879585 () Bool)

(assert (=> start!80562 m!879585))

(declare-fun m!879587 () Bool)

(assert (=> b!945142 m!879587))

(declare-fun m!879589 () Bool)

(assert (=> b!945141 m!879589))

(assert (=> b!945141 m!879589))

(declare-fun m!879591 () Bool)

(assert (=> b!945141 m!879591))

(declare-fun m!879593 () Bool)

(assert (=> mapNonEmpty!32643 m!879593))

(check-sat (not b!945147) (not mapNonEmpty!32643) b_and!29465 tp_is_empty!20545 (not b_next!18037) (not b!945140) (not b!945141) (not start!80562) (not b!945145) (not b!945142))
(check-sat b_and!29465 (not b_next!18037))
