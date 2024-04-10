; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80278 () Bool)

(assert start!80278)

(declare-fun b!943003 () Bool)

(declare-fun b_free!17977 () Bool)

(declare-fun b_next!17977 () Bool)

(assert (=> b!943003 (= b_free!17977 (not b_next!17977))))

(declare-fun tp!62436 () Bool)

(declare-fun b_and!29389 () Bool)

(assert (=> b!943003 (= tp!62436 b_and!29389)))

(declare-fun e!530206 () Bool)

(declare-fun tp_is_empty!20485 () Bool)

(declare-datatypes ((V!32279 0))(
  ( (V!32280 (val!10293 Int)) )
))
(declare-datatypes ((ValueCell!9761 0))(
  ( (ValueCellFull!9761 (v!12824 V!32279)) (EmptyCell!9761) )
))
(declare-datatypes ((array!56936 0))(
  ( (array!56937 (arr!27394 (Array (_ BitVec 32) ValueCell!9761)) (size!27859 (_ BitVec 32))) )
))
(declare-datatypes ((array!56938 0))(
  ( (array!56939 (arr!27395 (Array (_ BitVec 32) (_ BitVec 64))) (size!27860 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4672 0))(
  ( (LongMapFixedSize!4673 (defaultEntry!5627 Int) (mask!27247 (_ BitVec 32)) (extraKeys!5359 (_ BitVec 32)) (zeroValue!5463 V!32279) (minValue!5463 V!32279) (_size!2391 (_ BitVec 32)) (_keys!10501 array!56938) (_values!5650 array!56936) (_vacant!2391 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4672)

(declare-fun e!530204 () Bool)

(declare-fun array_inv!21284 (array!56938) Bool)

(declare-fun array_inv!21285 (array!56936) Bool)

(assert (=> b!943003 (= e!530206 (and tp!62436 tp_is_empty!20485 (array_inv!21284 (_keys!10501 thiss!1141)) (array_inv!21285 (_values!5650 thiss!1141)) e!530204))))

(declare-fun b!943004 () Bool)

(declare-fun res!633647 () Bool)

(declare-fun e!530207 () Bool)

(assert (=> b!943004 (=> (not res!633647) (not e!530207))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9043 0))(
  ( (MissingZero!9043 (index!38543 (_ BitVec 32))) (Found!9043 (index!38544 (_ BitVec 32))) (Intermediate!9043 (undefined!9855 Bool) (index!38545 (_ BitVec 32)) (x!80980 (_ BitVec 32))) (Undefined!9043) (MissingVacant!9043 (index!38546 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56938 (_ BitVec 32)) SeekEntryResult!9043)

(assert (=> b!943004 (= res!633647 (not (is-Found!9043 (seekEntry!0 key!756 (_keys!10501 thiss!1141) (mask!27247 thiss!1141)))))))

(declare-fun b!943005 () Bool)

(declare-fun res!633649 () Bool)

(assert (=> b!943005 (=> (not res!633649) (not e!530207))))

(assert (=> b!943005 (= res!633649 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943006 () Bool)

(assert (=> b!943006 (= e!530207 false)))

(declare-fun lt!425215 () Bool)

(declare-datatypes ((List!19235 0))(
  ( (Nil!19232) (Cons!19231 (h!20381 (_ BitVec 64)) (t!27550 List!19235)) )
))
(declare-fun arrayNoDuplicates!0 (array!56938 (_ BitVec 32) List!19235) Bool)

(assert (=> b!943006 (= lt!425215 (arrayNoDuplicates!0 (_keys!10501 thiss!1141) #b00000000000000000000000000000000 Nil!19232))))

(declare-fun b!943007 () Bool)

(declare-fun res!633650 () Bool)

(assert (=> b!943007 (=> (not res!633650) (not e!530207))))

(declare-datatypes ((tuple2!13426 0))(
  ( (tuple2!13427 (_1!6724 (_ BitVec 64)) (_2!6724 V!32279)) )
))
(declare-datatypes ((List!19236 0))(
  ( (Nil!19233) (Cons!19232 (h!20382 tuple2!13426) (t!27551 List!19236)) )
))
(declare-datatypes ((ListLongMap!12123 0))(
  ( (ListLongMap!12124 (toList!6077 List!19236)) )
))
(declare-fun contains!5147 (ListLongMap!12123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3311 (array!56938 array!56936 (_ BitVec 32) (_ BitVec 32) V!32279 V!32279 (_ BitVec 32) Int) ListLongMap!12123)

(assert (=> b!943007 (= res!633650 (contains!5147 (getCurrentListMap!3311 (_keys!10501 thiss!1141) (_values!5650 thiss!1141) (mask!27247 thiss!1141) (extraKeys!5359 thiss!1141) (zeroValue!5463 thiss!1141) (minValue!5463 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5627 thiss!1141)) key!756))))

(declare-fun b!943008 () Bool)

(declare-fun e!530208 () Bool)

(declare-fun mapRes!32549 () Bool)

(assert (=> b!943008 (= e!530204 (and e!530208 mapRes!32549))))

(declare-fun condMapEmpty!32549 () Bool)

(declare-fun mapDefault!32549 () ValueCell!9761)

