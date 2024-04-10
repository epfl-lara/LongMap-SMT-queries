; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81326 () Bool)

(assert start!81326)

(declare-fun b!951169 () Bool)

(declare-fun b_free!18263 () Bool)

(declare-fun b_next!18263 () Bool)

(assert (=> b!951169 (= b_free!18263 (not b_next!18263))))

(declare-fun tp!63394 () Bool)

(declare-fun b_and!29729 () Bool)

(assert (=> b!951169 (= tp!63394 b_and!29729)))

(declare-fun mapIsEmpty!33078 () Bool)

(declare-fun mapRes!33078 () Bool)

(assert (=> mapIsEmpty!33078 mapRes!33078))

(declare-fun b!951164 () Bool)

(declare-fun e!535587 () Bool)

(declare-fun tp_is_empty!20771 () Bool)

(assert (=> b!951164 (= e!535587 tp_is_empty!20771)))

(declare-fun b!951165 () Bool)

(declare-fun res!637521 () Bool)

(declare-fun e!535584 () Bool)

(assert (=> b!951165 (=> (not res!637521) (not e!535584))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!951165 (= res!637521 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951166 () Bool)

(declare-fun e!535585 () Bool)

(declare-datatypes ((V!32659 0))(
  ( (V!32660 (val!10436 Int)) )
))
(declare-datatypes ((ValueCell!9904 0))(
  ( (ValueCellFull!9904 (v!12982 V!32659)) (EmptyCell!9904) )
))
(declare-datatypes ((array!57566 0))(
  ( (array!57567 (arr!27680 (Array (_ BitVec 32) ValueCell!9904)) (size!28158 (_ BitVec 32))) )
))
(declare-datatypes ((array!57568 0))(
  ( (array!57569 (arr!27681 (Array (_ BitVec 32) (_ BitVec 64))) (size!28159 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4958 0))(
  ( (LongMapFixedSize!4959 (defaultEntry!5798 Int) (mask!27614 (_ BitVec 32)) (extraKeys!5530 (_ BitVec 32)) (zeroValue!5634 V!32659) (minValue!5634 V!32659) (_size!2534 (_ BitVec 32)) (_keys!10740 array!57568) (_values!5821 array!57566) (_vacant!2534 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4958)

(declare-fun lt!428409 () (_ BitVec 32))

(assert (=> b!951166 (= e!535585 (or (not (= (size!28159 (_keys!10740 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27614 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28159 (_keys!10740 thiss!1141))) (and (bvsge lt!428409 #b00000000000000000000000000000000) (bvsle lt!428409 (size!28159 (_keys!10740 thiss!1141))))))))

(declare-fun b!951167 () Bool)

(assert (=> b!951167 (= e!535584 (not e!535585))))

(declare-fun res!637522 () Bool)

(assert (=> b!951167 (=> res!637522 e!535585)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951167 (= res!637522 (not (validMask!0 (mask!27614 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57568 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951167 (= lt!428409 (arrayScanForKey!0 (_keys!10740 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951167 (arrayContainsKey!0 (_keys!10740 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32011 0))(
  ( (Unit!32012) )
))
(declare-fun lt!428408 () Unit!32011)

(declare-fun lemmaKeyInListMapIsInArray!325 (array!57568 array!57566 (_ BitVec 32) (_ BitVec 32) V!32659 V!32659 (_ BitVec 64) Int) Unit!32011)

(assert (=> b!951167 (= lt!428408 (lemmaKeyInListMapIsInArray!325 (_keys!10740 thiss!1141) (_values!5821 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5530 thiss!1141) (zeroValue!5634 thiss!1141) (minValue!5634 thiss!1141) key!756 (defaultEntry!5798 thiss!1141)))))

(declare-fun mapNonEmpty!33078 () Bool)

(declare-fun tp!63395 () Bool)

(assert (=> mapNonEmpty!33078 (= mapRes!33078 (and tp!63395 e!535587))))

(declare-fun mapRest!33078 () (Array (_ BitVec 32) ValueCell!9904))

(declare-fun mapKey!33078 () (_ BitVec 32))

(declare-fun mapValue!33078 () ValueCell!9904)

(assert (=> mapNonEmpty!33078 (= (arr!27680 (_values!5821 thiss!1141)) (store mapRest!33078 mapKey!33078 mapValue!33078))))

(declare-fun e!535588 () Bool)

(declare-fun e!535586 () Bool)

(declare-fun array_inv!21486 (array!57568) Bool)

(declare-fun array_inv!21487 (array!57566) Bool)

(assert (=> b!951169 (= e!535586 (and tp!63394 tp_is_empty!20771 (array_inv!21486 (_keys!10740 thiss!1141)) (array_inv!21487 (_values!5821 thiss!1141)) e!535588))))

(declare-fun b!951170 () Bool)

(declare-fun res!637520 () Bool)

(assert (=> b!951170 (=> (not res!637520) (not e!535584))))

(declare-datatypes ((SeekEntryResult!9150 0))(
  ( (MissingZero!9150 (index!38971 (_ BitVec 32))) (Found!9150 (index!38972 (_ BitVec 32))) (Intermediate!9150 (undefined!9962 Bool) (index!38973 (_ BitVec 32)) (x!81830 (_ BitVec 32))) (Undefined!9150) (MissingVacant!9150 (index!38974 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57568 (_ BitVec 32)) SeekEntryResult!9150)

(assert (=> b!951170 (= res!637520 (not (is-Found!9150 (seekEntry!0 key!756 (_keys!10740 thiss!1141) (mask!27614 thiss!1141)))))))

(declare-fun b!951171 () Bool)

(declare-fun res!637523 () Bool)

(assert (=> b!951171 (=> (not res!637523) (not e!535584))))

(declare-datatypes ((tuple2!13564 0))(
  ( (tuple2!13565 (_1!6793 (_ BitVec 64)) (_2!6793 V!32659)) )
))
(declare-datatypes ((List!19350 0))(
  ( (Nil!19347) (Cons!19346 (h!20507 tuple2!13564) (t!27695 List!19350)) )
))
(declare-datatypes ((ListLongMap!12261 0))(
  ( (ListLongMap!12262 (toList!6146 List!19350)) )
))
(declare-fun contains!5239 (ListLongMap!12261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3379 (array!57568 array!57566 (_ BitVec 32) (_ BitVec 32) V!32659 V!32659 (_ BitVec 32) Int) ListLongMap!12261)

(assert (=> b!951171 (= res!637523 (contains!5239 (getCurrentListMap!3379 (_keys!10740 thiss!1141) (_values!5821 thiss!1141) (mask!27614 thiss!1141) (extraKeys!5530 thiss!1141) (zeroValue!5634 thiss!1141) (minValue!5634 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5798 thiss!1141)) key!756))))

(declare-fun b!951172 () Bool)

(declare-fun e!535583 () Bool)

(assert (=> b!951172 (= e!535588 (and e!535583 mapRes!33078))))

(declare-fun condMapEmpty!33078 () Bool)

(declare-fun mapDefault!33078 () ValueCell!9904)

