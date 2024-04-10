; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79958 () Bool)

(assert start!79958)

(declare-fun b!939992 () Bool)

(declare-fun b_free!17813 () Bool)

(declare-fun b_next!17813 () Bool)

(assert (=> b!939992 (= b_free!17813 (not b_next!17813))))

(declare-fun tp!61913 () Bool)

(declare-fun b_and!29225 () Bool)

(assert (=> b!939992 (= tp!61913 b_and!29225)))

(declare-fun mapIsEmpty!32272 () Bool)

(declare-fun mapRes!32272 () Bool)

(assert (=> mapIsEmpty!32272 mapRes!32272))

(declare-fun b!939988 () Bool)

(declare-fun res!632124 () Bool)

(declare-fun e!528103 () Bool)

(assert (=> b!939988 (=> (not res!632124) (not e!528103))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939988 (= res!632124 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939989 () Bool)

(declare-fun e!528104 () Bool)

(declare-fun tp_is_empty!20321 () Bool)

(assert (=> b!939989 (= e!528104 tp_is_empty!20321)))

(declare-fun res!632125 () Bool)

(assert (=> start!79958 (=> (not res!632125) (not e!528103))))

(declare-datatypes ((V!32059 0))(
  ( (V!32060 (val!10211 Int)) )
))
(declare-datatypes ((ValueCell!9679 0))(
  ( (ValueCellFull!9679 (v!12742 V!32059)) (EmptyCell!9679) )
))
(declare-datatypes ((array!56590 0))(
  ( (array!56591 (arr!27230 (Array (_ BitVec 32) ValueCell!9679)) (size!27691 (_ BitVec 32))) )
))
(declare-datatypes ((array!56592 0))(
  ( (array!56593 (arr!27231 (Array (_ BitVec 32) (_ BitVec 64))) (size!27692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4508 0))(
  ( (LongMapFixedSize!4509 (defaultEntry!5545 Int) (mask!27072 (_ BitVec 32)) (extraKeys!5277 (_ BitVec 32)) (zeroValue!5381 V!32059) (minValue!5381 V!32059) (_size!2309 (_ BitVec 32)) (_keys!10395 array!56592) (_values!5568 array!56590) (_vacant!2309 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4508)

(declare-fun valid!1731 (LongMapFixedSize!4508) Bool)

(assert (=> start!79958 (= res!632125 (valid!1731 thiss!1141))))

(assert (=> start!79958 e!528103))

(declare-fun e!528102 () Bool)

(assert (=> start!79958 e!528102))

(assert (=> start!79958 true))

(declare-fun b!939990 () Bool)

(declare-fun e!528101 () Bool)

(assert (=> b!939990 (= e!528101 tp_is_empty!20321)))

(declare-fun b!939991 () Bool)

(assert (=> b!939991 (= e!528103 false)))

(declare-datatypes ((SeekEntryResult!8986 0))(
  ( (MissingZero!8986 (index!38315 (_ BitVec 32))) (Found!8986 (index!38316 (_ BitVec 32))) (Intermediate!8986 (undefined!9798 Bool) (index!38317 (_ BitVec 32)) (x!80591 (_ BitVec 32))) (Undefined!8986) (MissingVacant!8986 (index!38318 (_ BitVec 32))) )
))
(declare-fun lt!424597 () SeekEntryResult!8986)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56592 (_ BitVec 32)) SeekEntryResult!8986)

(assert (=> b!939991 (= lt!424597 (seekEntry!0 key!756 (_keys!10395 thiss!1141) (mask!27072 thiss!1141)))))

(declare-fun e!528106 () Bool)

(declare-fun array_inv!21176 (array!56592) Bool)

(declare-fun array_inv!21177 (array!56590) Bool)

(assert (=> b!939992 (= e!528102 (and tp!61913 tp_is_empty!20321 (array_inv!21176 (_keys!10395 thiss!1141)) (array_inv!21177 (_values!5568 thiss!1141)) e!528106))))

(declare-fun b!939993 () Bool)

(assert (=> b!939993 (= e!528106 (and e!528101 mapRes!32272))))

(declare-fun condMapEmpty!32272 () Bool)

(declare-fun mapDefault!32272 () ValueCell!9679)

