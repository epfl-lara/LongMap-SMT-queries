; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80794 () Bool)

(assert start!80794)

(declare-fun b!947207 () Bool)

(declare-fun b_free!18167 () Bool)

(declare-fun b_next!18167 () Bool)

(assert (=> b!947207 (= b_free!18167 (not b_next!18167))))

(declare-fun tp!63057 () Bool)

(declare-fun b_and!29589 () Bool)

(assert (=> b!947207 (= tp!63057 b_and!29589)))

(declare-fun res!635720 () Bool)

(declare-fun e!533099 () Bool)

(assert (=> start!80794 (=> (not res!635720) (not e!533099))))

(declare-datatypes ((V!32531 0))(
  ( (V!32532 (val!10388 Int)) )
))
(declare-datatypes ((ValueCell!9856 0))(
  ( (ValueCellFull!9856 (v!12922 V!32531)) (EmptyCell!9856) )
))
(declare-datatypes ((array!57344 0))(
  ( (array!57345 (arr!27584 (Array (_ BitVec 32) ValueCell!9856)) (size!28057 (_ BitVec 32))) )
))
(declare-datatypes ((array!57346 0))(
  ( (array!57347 (arr!27585 (Array (_ BitVec 32) (_ BitVec 64))) (size!28058 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4862 0))(
  ( (LongMapFixedSize!4863 (defaultEntry!5728 Int) (mask!27458 (_ BitVec 32)) (extraKeys!5460 (_ BitVec 32)) (zeroValue!5564 V!32531) (minValue!5564 V!32531) (_size!2486 (_ BitVec 32)) (_keys!10635 array!57346) (_values!5751 array!57344) (_vacant!2486 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4862)

(declare-fun valid!1852 (LongMapFixedSize!4862) Bool)

(assert (=> start!80794 (= res!635720 (valid!1852 thiss!1141))))

(assert (=> start!80794 e!533099))

(declare-fun e!533096 () Bool)

(assert (=> start!80794 e!533096))

(assert (=> start!80794 true))

(declare-fun b!947206 () Bool)

(declare-fun e!533094 () Bool)

(declare-fun e!533095 () Bool)

(assert (=> b!947206 (= e!533094 (not e!533095))))

(declare-fun res!635721 () Bool)

(assert (=> b!947206 (=> res!635721 e!533095)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947206 (= res!635721 (not (validMask!0 (mask!27458 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947206 (arrayContainsKey!0 (_keys!10635 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9111 0))(
  ( (MissingZero!9111 (index!38815 (_ BitVec 32))) (Found!9111 (index!38816 (_ BitVec 32))) (Intermediate!9111 (undefined!9923 Bool) (index!38817 (_ BitVec 32)) (x!81479 (_ BitVec 32))) (Undefined!9111) (MissingVacant!9111 (index!38818 (_ BitVec 32))) )
))
(declare-fun lt!426516 () SeekEntryResult!9111)

(declare-datatypes ((Unit!31918 0))(
  ( (Unit!31919) )
))
(declare-fun lt!426515 () Unit!31918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57346 (_ BitVec 64) (_ BitVec 32)) Unit!31918)

(assert (=> b!947206 (= lt!426515 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10635 thiss!1141) key!756 (index!38816 lt!426516)))))

(declare-fun e!533098 () Bool)

(declare-fun tp_is_empty!20675 () Bool)

(declare-fun array_inv!21412 (array!57346) Bool)

(declare-fun array_inv!21413 (array!57344) Bool)

(assert (=> b!947207 (= e!533096 (and tp!63057 tp_is_empty!20675 (array_inv!21412 (_keys!10635 thiss!1141)) (array_inv!21413 (_values!5751 thiss!1141)) e!533098))))

(declare-fun mapIsEmpty!32884 () Bool)

(declare-fun mapRes!32884 () Bool)

(assert (=> mapIsEmpty!32884 mapRes!32884))

(declare-fun mapNonEmpty!32884 () Bool)

(declare-fun tp!63056 () Bool)

(declare-fun e!533097 () Bool)

(assert (=> mapNonEmpty!32884 (= mapRes!32884 (and tp!63056 e!533097))))

(declare-fun mapValue!32884 () ValueCell!9856)

(declare-fun mapKey!32884 () (_ BitVec 32))

(declare-fun mapRest!32884 () (Array (_ BitVec 32) ValueCell!9856))

(assert (=> mapNonEmpty!32884 (= (arr!27584 (_values!5751 thiss!1141)) (store mapRest!32884 mapKey!32884 mapValue!32884))))

(declare-fun b!947208 () Bool)

(declare-fun res!635725 () Bool)

(assert (=> b!947208 (=> res!635725 e!533095)))

(assert (=> b!947208 (= res!635725 (or (not (= (size!28057 (_values!5751 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27458 thiss!1141)))) (not (= (size!28058 (_keys!10635 thiss!1141)) (size!28057 (_values!5751 thiss!1141)))) (bvslt (mask!27458 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5460 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5460 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947209 () Bool)

(declare-datatypes ((List!19303 0))(
  ( (Nil!19300) (Cons!19299 (h!20455 (_ BitVec 64)) (t!27624 List!19303)) )
))
(declare-fun arrayNoDuplicates!0 (array!57346 (_ BitVec 32) List!19303) Bool)

(assert (=> b!947209 (= e!533095 (arrayNoDuplicates!0 (_keys!10635 thiss!1141) #b00000000000000000000000000000000 Nil!19300))))

(declare-fun b!947210 () Bool)

(assert (=> b!947210 (= e!533099 e!533094)))

(declare-fun res!635723 () Bool)

(assert (=> b!947210 (=> (not res!635723) (not e!533094))))

(assert (=> b!947210 (= res!635723 (is-Found!9111 lt!426516))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57346 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!947210 (= lt!426516 (seekEntry!0 key!756 (_keys!10635 thiss!1141) (mask!27458 thiss!1141)))))

(declare-fun b!947211 () Bool)

(assert (=> b!947211 (= e!533097 tp_is_empty!20675)))

(declare-fun b!947212 () Bool)

(declare-fun e!533092 () Bool)

(assert (=> b!947212 (= e!533098 (and e!533092 mapRes!32884))))

(declare-fun condMapEmpty!32884 () Bool)

(declare-fun mapDefault!32884 () ValueCell!9856)

