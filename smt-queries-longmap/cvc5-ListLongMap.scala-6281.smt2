; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80308 () Bool)

(assert start!80308)

(declare-fun b!943495 () Bool)

(declare-fun b_free!18007 () Bool)

(declare-fun b_next!18007 () Bool)

(assert (=> b!943495 (= b_free!18007 (not b_next!18007))))

(declare-fun tp!62527 () Bool)

(declare-fun b_and!29419 () Bool)

(assert (=> b!943495 (= tp!62527 b_and!29419)))

(declare-fun b!943492 () Bool)

(declare-fun res!633956 () Bool)

(declare-fun e!530474 () Bool)

(assert (=> b!943492 (=> (not res!633956) (not e!530474))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32319 0))(
  ( (V!32320 (val!10308 Int)) )
))
(declare-datatypes ((ValueCell!9776 0))(
  ( (ValueCellFull!9776 (v!12839 V!32319)) (EmptyCell!9776) )
))
(declare-datatypes ((array!56996 0))(
  ( (array!56997 (arr!27424 (Array (_ BitVec 32) ValueCell!9776)) (size!27889 (_ BitVec 32))) )
))
(declare-datatypes ((array!56998 0))(
  ( (array!56999 (arr!27425 (Array (_ BitVec 32) (_ BitVec 64))) (size!27890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4702 0))(
  ( (LongMapFixedSize!4703 (defaultEntry!5642 Int) (mask!27272 (_ BitVec 32)) (extraKeys!5374 (_ BitVec 32)) (zeroValue!5478 V!32319) (minValue!5478 V!32319) (_size!2406 (_ BitVec 32)) (_keys!10516 array!56998) (_values!5665 array!56996) (_vacant!2406 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4702)

(declare-datatypes ((SeekEntryResult!9053 0))(
  ( (MissingZero!9053 (index!38583 (_ BitVec 32))) (Found!9053 (index!38584 (_ BitVec 32))) (Intermediate!9053 (undefined!9865 Bool) (index!38585 (_ BitVec 32)) (x!81030 (_ BitVec 32))) (Undefined!9053) (MissingVacant!9053 (index!38586 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56998 (_ BitVec 32)) SeekEntryResult!9053)

(assert (=> b!943492 (= res!633956 (not (is-Found!9053 (seekEntry!0 key!756 (_keys!10516 thiss!1141) (mask!27272 thiss!1141)))))))

(declare-fun res!633958 () Bool)

(assert (=> start!80308 (=> (not res!633958) (not e!530474))))

(declare-fun valid!1798 (LongMapFixedSize!4702) Bool)

(assert (=> start!80308 (= res!633958 (valid!1798 thiss!1141))))

(assert (=> start!80308 e!530474))

(declare-fun e!530478 () Bool)

(assert (=> start!80308 e!530478))

(assert (=> start!80308 true))

(declare-fun b!943493 () Bool)

(declare-fun e!530476 () Bool)

(declare-fun tp_is_empty!20515 () Bool)

(assert (=> b!943493 (= e!530476 tp_is_empty!20515)))

(declare-fun b!943494 () Bool)

(assert (=> b!943494 (= e!530474 (not (and (bvslt #b00000000000000000000000000000000 (size!27890 (_keys!10516 thiss!1141))) (bvslt (size!27890 (_keys!10516 thiss!1141)) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!56998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943494 (arrayContainsKey!0 (_keys!10516 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31814 0))(
  ( (Unit!31815) )
))
(declare-fun lt!425260 () Unit!31814)

(declare-fun lemmaKeyInListMapIsInArray!290 (array!56998 array!56996 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 64) Int) Unit!31814)

(assert (=> b!943494 (= lt!425260 (lemmaKeyInListMapIsInArray!290 (_keys!10516 thiss!1141) (_values!5665 thiss!1141) (mask!27272 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)))))

(declare-fun e!530473 () Bool)

(declare-fun array_inv!21310 (array!56998) Bool)

(declare-fun array_inv!21311 (array!56996) Bool)

(assert (=> b!943495 (= e!530478 (and tp!62527 tp_is_empty!20515 (array_inv!21310 (_keys!10516 thiss!1141)) (array_inv!21311 (_values!5665 thiss!1141)) e!530473))))

(declare-fun b!943496 () Bool)

(declare-fun e!530475 () Bool)

(assert (=> b!943496 (= e!530475 tp_is_empty!20515)))

(declare-fun b!943497 () Bool)

(declare-fun mapRes!32594 () Bool)

(assert (=> b!943497 (= e!530473 (and e!530476 mapRes!32594))))

(declare-fun condMapEmpty!32594 () Bool)

(declare-fun mapDefault!32594 () ValueCell!9776)

