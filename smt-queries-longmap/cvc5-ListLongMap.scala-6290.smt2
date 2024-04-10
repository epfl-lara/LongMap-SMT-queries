; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80418 () Bool)

(assert start!80418)

(declare-fun b!944638 () Bool)

(declare-fun b_free!18061 () Bool)

(declare-fun b_next!18061 () Bool)

(assert (=> b!944638 (= b_free!18061 (not b_next!18061))))

(declare-fun tp!62693 () Bool)

(declare-fun b_and!29479 () Bool)

(assert (=> b!944638 (= tp!62693 b_and!29479)))

(declare-fun b!944635 () Bool)

(declare-fun res!634584 () Bool)

(declare-fun e!531222 () Bool)

(assert (=> b!944635 (=> res!634584 e!531222)))

(declare-datatypes ((V!32391 0))(
  ( (V!32392 (val!10335 Int)) )
))
(declare-datatypes ((ValueCell!9803 0))(
  ( (ValueCellFull!9803 (v!12867 V!32391)) (EmptyCell!9803) )
))
(declare-datatypes ((array!57106 0))(
  ( (array!57107 (arr!27478 (Array (_ BitVec 32) ValueCell!9803)) (size!27944 (_ BitVec 32))) )
))
(declare-datatypes ((array!57108 0))(
  ( (array!57109 (arr!27479 (Array (_ BitVec 32) (_ BitVec 64))) (size!27945 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4756 0))(
  ( (LongMapFixedSize!4757 (defaultEntry!5673 Int) (mask!27327 (_ BitVec 32)) (extraKeys!5405 (_ BitVec 32)) (zeroValue!5509 V!32391) (minValue!5509 V!32391) (_size!2433 (_ BitVec 32)) (_keys!10551 array!57108) (_values!5696 array!57106) (_vacant!2433 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4756)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57108 (_ BitVec 32)) Bool)

(assert (=> b!944635 (= res!634584 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10551 thiss!1141) (mask!27327 thiss!1141))))))

(declare-fun mapNonEmpty!32679 () Bool)

(declare-fun mapRes!32679 () Bool)

(declare-fun tp!62692 () Bool)

(declare-fun e!531218 () Bool)

(assert (=> mapNonEmpty!32679 (= mapRes!32679 (and tp!62692 e!531218))))

(declare-fun mapRest!32679 () (Array (_ BitVec 32) ValueCell!9803))

(declare-fun mapValue!32679 () ValueCell!9803)

(declare-fun mapKey!32679 () (_ BitVec 32))

(assert (=> mapNonEmpty!32679 (= (arr!27478 (_values!5696 thiss!1141)) (store mapRest!32679 mapKey!32679 mapValue!32679))))

(declare-fun res!634583 () Bool)

(declare-fun e!531219 () Bool)

(assert (=> start!80418 (=> (not res!634583) (not e!531219))))

(declare-fun valid!1819 (LongMapFixedSize!4756) Bool)

(assert (=> start!80418 (= res!634583 (valid!1819 thiss!1141))))

(assert (=> start!80418 e!531219))

(declare-fun e!531221 () Bool)

(assert (=> start!80418 e!531221))

(assert (=> start!80418 true))

(declare-fun mapIsEmpty!32679 () Bool)

(assert (=> mapIsEmpty!32679 mapRes!32679))

(declare-fun b!944636 () Bool)

(declare-fun res!634582 () Bool)

(assert (=> b!944636 (=> (not res!634582) (not e!531219))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9072 0))(
  ( (MissingZero!9072 (index!38659 (_ BitVec 32))) (Found!9072 (index!38660 (_ BitVec 32))) (Intermediate!9072 (undefined!9884 Bool) (index!38661 (_ BitVec 32)) (x!81139 (_ BitVec 32))) (Undefined!9072) (MissingVacant!9072 (index!38662 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57108 (_ BitVec 32)) SeekEntryResult!9072)

(assert (=> b!944636 (= res!634582 (not (is-Found!9072 (seekEntry!0 key!756 (_keys!10551 thiss!1141) (mask!27327 thiss!1141)))))))

(declare-fun b!944637 () Bool)

(declare-fun tp_is_empty!20569 () Bool)

(assert (=> b!944637 (= e!531218 tp_is_empty!20569)))

(declare-fun e!531217 () Bool)

(declare-fun array_inv!21348 (array!57108) Bool)

(declare-fun array_inv!21349 (array!57106) Bool)

(assert (=> b!944638 (= e!531221 (and tp!62693 tp_is_empty!20569 (array_inv!21348 (_keys!10551 thiss!1141)) (array_inv!21349 (_values!5696 thiss!1141)) e!531217))))

(declare-fun b!944639 () Bool)

(declare-fun res!634580 () Bool)

(assert (=> b!944639 (=> (not res!634580) (not e!531219))))

(declare-datatypes ((tuple2!13488 0))(
  ( (tuple2!13489 (_1!6755 (_ BitVec 64)) (_2!6755 V!32391)) )
))
(declare-datatypes ((List!19278 0))(
  ( (Nil!19275) (Cons!19274 (h!20425 tuple2!13488) (t!27595 List!19278)) )
))
(declare-datatypes ((ListLongMap!12185 0))(
  ( (ListLongMap!12186 (toList!6108 List!19278)) )
))
(declare-fun contains!5180 (ListLongMap!12185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3342 (array!57108 array!57106 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 32) Int) ListLongMap!12185)

(assert (=> b!944639 (= res!634580 (contains!5180 (getCurrentListMap!3342 (_keys!10551 thiss!1141) (_values!5696 thiss!1141) (mask!27327 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5673 thiss!1141)) key!756))))

(declare-fun b!944640 () Bool)

(declare-fun res!634585 () Bool)

(assert (=> b!944640 (=> res!634585 e!531222)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944640 (= res!634585 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944641 () Bool)

(declare-fun res!634587 () Bool)

(assert (=> b!944641 (=> (not res!634587) (not e!531219))))

(assert (=> b!944641 (= res!634587 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944642 () Bool)

(assert (=> b!944642 (= e!531222 true)))

(declare-fun lt!425697 () SeekEntryResult!9072)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57108 (_ BitVec 32)) SeekEntryResult!9072)

(assert (=> b!944642 (= lt!425697 (seekEntryOrOpen!0 key!756 (_keys!10551 thiss!1141) (mask!27327 thiss!1141)))))

(declare-fun b!944643 () Bool)

(declare-fun res!634581 () Bool)

(assert (=> b!944643 (=> res!634581 e!531222)))

(assert (=> b!944643 (= res!634581 (not (= (size!27945 (_keys!10551 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27327 thiss!1141)))))))

(declare-fun b!944644 () Bool)

(assert (=> b!944644 (= e!531219 (not e!531222))))

(declare-fun res!634586 () Bool)

(assert (=> b!944644 (=> res!634586 e!531222)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944644 (= res!634586 (not (validMask!0 (mask!27327 thiss!1141))))))

(declare-fun lt!425694 () (_ BitVec 32))

(assert (=> b!944644 (arrayForallSeekEntryOrOpenFound!0 lt!425694 (_keys!10551 thiss!1141) (mask!27327 thiss!1141))))

(declare-datatypes ((Unit!31860 0))(
  ( (Unit!31861) )
))
(declare-fun lt!425695 () Unit!31860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31860)

(assert (=> b!944644 (= lt!425695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10551 thiss!1141) (mask!27327 thiss!1141) #b00000000000000000000000000000000 lt!425694))))

(declare-fun arrayScanForKey!0 (array!57108 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944644 (= lt!425694 (arrayScanForKey!0 (_keys!10551 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944644 (arrayContainsKey!0 (_keys!10551 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425696 () Unit!31860)

(declare-fun lemmaKeyInListMapIsInArray!310 (array!57108 array!57106 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 64) Int) Unit!31860)

(assert (=> b!944644 (= lt!425696 (lemmaKeyInListMapIsInArray!310 (_keys!10551 thiss!1141) (_values!5696 thiss!1141) (mask!27327 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) key!756 (defaultEntry!5673 thiss!1141)))))

(declare-fun b!944645 () Bool)

(declare-fun e!531223 () Bool)

(assert (=> b!944645 (= e!531223 tp_is_empty!20569)))

(declare-fun b!944646 () Bool)

(assert (=> b!944646 (= e!531217 (and e!531223 mapRes!32679))))

(declare-fun condMapEmpty!32679 () Bool)

(declare-fun mapDefault!32679 () ValueCell!9803)

