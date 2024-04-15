; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80376 () Bool)

(assert start!80376)

(declare-fun b!944002 () Bool)

(declare-fun b_free!18037 () Bool)

(declare-fun b_next!18037 () Bool)

(assert (=> b!944002 (= b_free!18037 (not b_next!18037))))

(declare-fun tp!62621 () Bool)

(declare-fun b_and!29429 () Bool)

(assert (=> b!944002 (= tp!62621 b_and!29429)))

(declare-fun b!943996 () Bool)

(declare-fun res!634219 () Bool)

(declare-fun e!530821 () Bool)

(assert (=> b!943996 (=> (not res!634219) (not e!530821))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32359 0))(
  ( (V!32360 (val!10323 Int)) )
))
(declare-datatypes ((ValueCell!9791 0))(
  ( (ValueCellFull!9791 (v!12854 V!32359)) (EmptyCell!9791) )
))
(declare-datatypes ((array!57023 0))(
  ( (array!57024 (arr!27437 (Array (_ BitVec 32) ValueCell!9791)) (size!27905 (_ BitVec 32))) )
))
(declare-datatypes ((array!57025 0))(
  ( (array!57026 (arr!27438 (Array (_ BitVec 32) (_ BitVec 64))) (size!27906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4732 0))(
  ( (LongMapFixedSize!4733 (defaultEntry!5661 Int) (mask!27300 (_ BitVec 32)) (extraKeys!5393 (_ BitVec 32)) (zeroValue!5497 V!32359) (minValue!5497 V!32359) (_size!2421 (_ BitVec 32)) (_keys!10534 array!57025) (_values!5684 array!57023) (_vacant!2421 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4732)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9062 0))(
  ( (MissingZero!9062 (index!38619 (_ BitVec 32))) (Found!9062 (index!38620 (_ BitVec 32))) (Intermediate!9062 (undefined!9874 Bool) (index!38621 (_ BitVec 32)) (x!81092 (_ BitVec 32))) (Undefined!9062) (MissingVacant!9062 (index!38622 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57025 (_ BitVec 32)) SeekEntryResult!9062)

(assert (=> b!943996 (= res!634219 (not ((_ is Found!9062) (seekEntry!0 key!756 (_keys!10534 thiss!1141) (mask!27300 thiss!1141)))))))

(declare-fun b!943997 () Bool)

(declare-fun e!530818 () Bool)

(assert (=> b!943997 (= e!530821 (not e!530818))))

(declare-fun res!634218 () Bool)

(assert (=> b!943997 (=> res!634218 e!530818)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943997 (= res!634218 (not (validMask!0 (mask!27300 thiss!1141))))))

(declare-fun lt!425332 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57025 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943997 (= lt!425332 (arrayScanForKey!0 (_keys!10534 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943997 (arrayContainsKey!0 (_keys!10534 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31721 0))(
  ( (Unit!31722) )
))
(declare-fun lt!425330 () Unit!31721)

(declare-fun lemmaKeyInListMapIsInArray!289 (array!57025 array!57023 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 64) Int) Unit!31721)

(assert (=> b!943997 (= lt!425330 (lemmaKeyInListMapIsInArray!289 (_keys!10534 thiss!1141) (_values!5684 thiss!1141) (mask!27300 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) key!756 (defaultEntry!5661 thiss!1141)))))

(declare-fun b!943998 () Bool)

(declare-fun res!634215 () Bool)

(assert (=> b!943998 (=> (not res!634215) (not e!530821))))

(declare-datatypes ((tuple2!13518 0))(
  ( (tuple2!13519 (_1!6770 (_ BitVec 64)) (_2!6770 V!32359)) )
))
(declare-datatypes ((List!19274 0))(
  ( (Nil!19271) (Cons!19270 (h!20421 tuple2!13518) (t!27582 List!19274)) )
))
(declare-datatypes ((ListLongMap!12205 0))(
  ( (ListLongMap!12206 (toList!6118 List!19274)) )
))
(declare-fun contains!5133 (ListLongMap!12205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3281 (array!57025 array!57023 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 32) Int) ListLongMap!12205)

(assert (=> b!943998 (= res!634215 (contains!5133 (getCurrentListMap!3281 (_keys!10534 thiss!1141) (_values!5684 thiss!1141) (mask!27300 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5661 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32643 () Bool)

(declare-fun mapRes!32643 () Bool)

(declare-fun tp!62622 () Bool)

(declare-fun e!530819 () Bool)

(assert (=> mapNonEmpty!32643 (= mapRes!32643 (and tp!62622 e!530819))))

(declare-fun mapRest!32643 () (Array (_ BitVec 32) ValueCell!9791))

(declare-fun mapValue!32643 () ValueCell!9791)

(declare-fun mapKey!32643 () (_ BitVec 32))

(assert (=> mapNonEmpty!32643 (= (arr!27437 (_values!5684 thiss!1141)) (store mapRest!32643 mapKey!32643 mapValue!32643))))

(declare-fun b!943999 () Bool)

(declare-fun res!634214 () Bool)

(assert (=> b!943999 (=> res!634214 e!530818)))

(assert (=> b!943999 (= res!634214 (or (not (= (size!27906 (_keys!10534 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27300 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27906 (_keys!10534 thiss!1141))) (bvslt lt!425332 #b00000000000000000000000000000000) (bvsgt lt!425332 (size!27906 (_keys!10534 thiss!1141)))))))

(declare-fun res!634216 () Bool)

(assert (=> start!80376 (=> (not res!634216) (not e!530821))))

(declare-fun valid!1811 (LongMapFixedSize!4732) Bool)

(assert (=> start!80376 (= res!634216 (valid!1811 thiss!1141))))

(assert (=> start!80376 e!530821))

(declare-fun e!530823 () Bool)

(assert (=> start!80376 e!530823))

(assert (=> start!80376 true))

(declare-fun mapIsEmpty!32643 () Bool)

(assert (=> mapIsEmpty!32643 mapRes!32643))

(declare-fun b!944000 () Bool)

(declare-fun res!634217 () Bool)

(assert (=> b!944000 (=> (not res!634217) (not e!530821))))

(assert (=> b!944000 (= res!634217 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944001 () Bool)

(declare-fun e!530820 () Bool)

(declare-fun tp_is_empty!20545 () Bool)

(assert (=> b!944001 (= e!530820 tp_is_empty!20545)))

(declare-fun e!530822 () Bool)

(declare-fun array_inv!21372 (array!57025) Bool)

(declare-fun array_inv!21373 (array!57023) Bool)

(assert (=> b!944002 (= e!530823 (and tp!62621 tp_is_empty!20545 (array_inv!21372 (_keys!10534 thiss!1141)) (array_inv!21373 (_values!5684 thiss!1141)) e!530822))))

(declare-fun b!944003 () Bool)

(assert (=> b!944003 (= e!530819 tp_is_empty!20545)))

(declare-fun b!944004 () Bool)

(assert (=> b!944004 (= e!530818 true)))

(declare-fun lt!425331 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57025 (_ BitVec 32)) Bool)

(assert (=> b!944004 (= lt!425331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10534 thiss!1141) (mask!27300 thiss!1141)))))

(declare-fun b!944005 () Bool)

(assert (=> b!944005 (= e!530822 (and e!530820 mapRes!32643))))

(declare-fun condMapEmpty!32643 () Bool)

(declare-fun mapDefault!32643 () ValueCell!9791)

(assert (=> b!944005 (= condMapEmpty!32643 (= (arr!27437 (_values!5684 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9791)) mapDefault!32643)))))

(assert (= (and start!80376 res!634216) b!944000))

(assert (= (and b!944000 res!634217) b!943996))

(assert (= (and b!943996 res!634219) b!943998))

(assert (= (and b!943998 res!634215) b!943997))

(assert (= (and b!943997 (not res!634218)) b!943999))

(assert (= (and b!943999 (not res!634214)) b!944004))

(assert (= (and b!944005 condMapEmpty!32643) mapIsEmpty!32643))

(assert (= (and b!944005 (not condMapEmpty!32643)) mapNonEmpty!32643))

(assert (= (and mapNonEmpty!32643 ((_ is ValueCellFull!9791) mapValue!32643)) b!944003))

(assert (= (and b!944005 ((_ is ValueCellFull!9791) mapDefault!32643)) b!944001))

(assert (= b!944002 b!944005))

(assert (= start!80376 b!944002))

(declare-fun m!877519 () Bool)

(assert (=> start!80376 m!877519))

(declare-fun m!877521 () Bool)

(assert (=> b!943998 m!877521))

(assert (=> b!943998 m!877521))

(declare-fun m!877523 () Bool)

(assert (=> b!943998 m!877523))

(declare-fun m!877525 () Bool)

(assert (=> b!944004 m!877525))

(declare-fun m!877527 () Bool)

(assert (=> mapNonEmpty!32643 m!877527))

(declare-fun m!877529 () Bool)

(assert (=> b!943996 m!877529))

(declare-fun m!877531 () Bool)

(assert (=> b!943997 m!877531))

(declare-fun m!877533 () Bool)

(assert (=> b!943997 m!877533))

(declare-fun m!877535 () Bool)

(assert (=> b!943997 m!877535))

(declare-fun m!877537 () Bool)

(assert (=> b!943997 m!877537))

(declare-fun m!877539 () Bool)

(assert (=> b!944002 m!877539))

(declare-fun m!877541 () Bool)

(assert (=> b!944002 m!877541))

(check-sat (not b!943996) (not b!944004) (not mapNonEmpty!32643) (not b!944002) (not start!80376) tp_is_empty!20545 (not b_next!18037) b_and!29429 (not b!943997) (not b!943998))
(check-sat b_and!29429 (not b_next!18037))
