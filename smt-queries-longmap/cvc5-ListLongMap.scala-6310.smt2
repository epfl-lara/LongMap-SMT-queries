; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80864 () Bool)

(assert start!80864)

(declare-fun b!947646 () Bool)

(declare-fun b_free!18181 () Bool)

(declare-fun b_next!18181 () Bool)

(assert (=> b!947646 (= b_free!18181 (not b_next!18181))))

(declare-fun tp!63108 () Bool)

(declare-fun b_and!29603 () Bool)

(assert (=> b!947646 (= tp!63108 b_and!29603)))

(declare-fun b!947641 () Bool)

(declare-fun e!533396 () Bool)

(declare-datatypes ((V!32551 0))(
  ( (V!32552 (val!10395 Int)) )
))
(declare-datatypes ((ValueCell!9863 0))(
  ( (ValueCellFull!9863 (v!12929 V!32551)) (EmptyCell!9863) )
))
(declare-datatypes ((array!57378 0))(
  ( (array!57379 (arr!27598 (Array (_ BitVec 32) ValueCell!9863)) (size!28071 (_ BitVec 32))) )
))
(declare-datatypes ((array!57380 0))(
  ( (array!57381 (arr!27599 (Array (_ BitVec 32) (_ BitVec 64))) (size!28072 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4876 0))(
  ( (LongMapFixedSize!4877 (defaultEntry!5735 Int) (mask!27480 (_ BitVec 32)) (extraKeys!5467 (_ BitVec 32)) (zeroValue!5571 V!32551) (minValue!5571 V!32551) (_size!2493 (_ BitVec 32)) (_keys!10648 array!57380) (_values!5758 array!57378) (_vacant!2493 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4876)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13510 0))(
  ( (tuple2!13511 (_1!6766 (_ BitVec 64)) (_2!6766 V!32551)) )
))
(declare-datatypes ((List!19308 0))(
  ( (Nil!19305) (Cons!19304 (h!20460 tuple2!13510) (t!27629 List!19308)) )
))
(declare-datatypes ((ListLongMap!12207 0))(
  ( (ListLongMap!12208 (toList!6119 List!19308)) )
))
(declare-fun contains!5201 (ListLongMap!12207 (_ BitVec 64)) Bool)

(declare-fun map!13064 (LongMapFixedSize!4876) ListLongMap!12207)

(assert (=> b!947641 (= e!533396 (not (contains!5201 (map!13064 thiss!1141) key!756)))))

(declare-datatypes ((SeekEntryResult!9118 0))(
  ( (MissingZero!9118 (index!38843 (_ BitVec 32))) (Found!9118 (index!38844 (_ BitVec 32))) (Intermediate!9118 (undefined!9930 Bool) (index!38845 (_ BitVec 32)) (x!81534 (_ BitVec 32))) (Undefined!9118) (MissingVacant!9118 (index!38846 (_ BitVec 32))) )
))
(declare-fun lt!426632 () SeekEntryResult!9118)

(declare-fun getCurrentListMap!3352 (array!57380 array!57378 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) ListLongMap!12207)

(assert (=> b!947641 (contains!5201 (getCurrentListMap!3352 (_keys!10648 thiss!1141) (_values!5758 thiss!1141) (mask!27480 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27599 (_keys!10648 thiss!1141)) (index!38844 lt!426632)))))

(declare-datatypes ((Unit!31932 0))(
  ( (Unit!31933) )
))
(declare-fun lt!426633 () Unit!31932)

(declare-fun lemmaValidKeyInArrayIsInListMap!266 (array!57380 array!57378 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) Unit!31932)

(assert (=> b!947641 (= lt!426633 (lemmaValidKeyInArrayIsInListMap!266 (_keys!10648 thiss!1141) (_values!5758 thiss!1141) (mask!27480 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38844 lt!426632) (defaultEntry!5735 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947641 (arrayContainsKey!0 (_keys!10648 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426631 () Unit!31932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57380 (_ BitVec 64) (_ BitVec 32)) Unit!31932)

(assert (=> b!947641 (= lt!426631 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10648 thiss!1141) key!756 (index!38844 lt!426632)))))

(declare-fun b!947642 () Bool)

(declare-fun e!533398 () Bool)

(declare-fun tp_is_empty!20689 () Bool)

(assert (=> b!947642 (= e!533398 tp_is_empty!20689)))

(declare-fun b!947643 () Bool)

(declare-fun e!533395 () Bool)

(assert (=> b!947643 (= e!533395 e!533396)))

(declare-fun res!635958 () Bool)

(assert (=> b!947643 (=> (not res!635958) (not e!533396))))

(assert (=> b!947643 (= res!635958 (is-Found!9118 lt!426632))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57380 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!947643 (= lt!426632 (seekEntry!0 key!756 (_keys!10648 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun b!947644 () Bool)

(declare-fun e!533399 () Bool)

(declare-fun e!533397 () Bool)

(declare-fun mapRes!32914 () Bool)

(assert (=> b!947644 (= e!533399 (and e!533397 mapRes!32914))))

(declare-fun condMapEmpty!32914 () Bool)

(declare-fun mapDefault!32914 () ValueCell!9863)

