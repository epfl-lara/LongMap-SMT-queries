; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80290 () Bool)

(assert start!80290)

(declare-fun b!943204 () Bool)

(declare-fun b_free!17989 () Bool)

(declare-fun b_next!17989 () Bool)

(assert (=> b!943204 (= b_free!17989 (not b_next!17989))))

(declare-fun tp!62472 () Bool)

(declare-fun b_and!29401 () Bool)

(assert (=> b!943204 (= tp!62472 b_and!29401)))

(declare-fun mapNonEmpty!32567 () Bool)

(declare-fun mapRes!32567 () Bool)

(declare-fun tp!62473 () Bool)

(declare-fun e!530311 () Bool)

(assert (=> mapNonEmpty!32567 (= mapRes!32567 (and tp!62473 e!530311))))

(declare-fun mapKey!32567 () (_ BitVec 32))

(declare-datatypes ((V!32295 0))(
  ( (V!32296 (val!10299 Int)) )
))
(declare-datatypes ((ValueCell!9767 0))(
  ( (ValueCellFull!9767 (v!12830 V!32295)) (EmptyCell!9767) )
))
(declare-datatypes ((array!56960 0))(
  ( (array!56961 (arr!27406 (Array (_ BitVec 32) ValueCell!9767)) (size!27871 (_ BitVec 32))) )
))
(declare-datatypes ((array!56962 0))(
  ( (array!56963 (arr!27407 (Array (_ BitVec 32) (_ BitVec 64))) (size!27872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4684 0))(
  ( (LongMapFixedSize!4685 (defaultEntry!5633 Int) (mask!27257 (_ BitVec 32)) (extraKeys!5365 (_ BitVec 32)) (zeroValue!5469 V!32295) (minValue!5469 V!32295) (_size!2397 (_ BitVec 32)) (_keys!10507 array!56962) (_values!5656 array!56960) (_vacant!2397 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4684)

(declare-fun mapValue!32567 () ValueCell!9767)

(declare-fun mapRest!32567 () (Array (_ BitVec 32) ValueCell!9767))

(assert (=> mapNonEmpty!32567 (= (arr!27406 (_values!5656 thiss!1141)) (store mapRest!32567 mapKey!32567 mapValue!32567))))

(declare-fun b!943201 () Bool)

(declare-fun tp_is_empty!20497 () Bool)

(assert (=> b!943201 (= e!530311 tp_is_empty!20497)))

(declare-fun b!943202 () Bool)

(declare-fun e!530314 () Bool)

(assert (=> b!943202 (= e!530314 tp_is_empty!20497)))

(declare-fun b!943203 () Bool)

(declare-fun res!633776 () Bool)

(declare-fun e!530315 () Bool)

(assert (=> b!943203 (=> (not res!633776) (not e!530315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56962 (_ BitVec 32)) Bool)

(assert (=> b!943203 (= res!633776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10507 thiss!1141) (mask!27257 thiss!1141)))))

(declare-fun e!530312 () Bool)

(declare-fun e!530316 () Bool)

(declare-fun array_inv!21294 (array!56962) Bool)

(declare-fun array_inv!21295 (array!56960) Bool)

(assert (=> b!943204 (= e!530312 (and tp!62472 tp_is_empty!20497 (array_inv!21294 (_keys!10507 thiss!1141)) (array_inv!21295 (_values!5656 thiss!1141)) e!530316))))

(declare-fun b!943205 () Bool)

(declare-fun res!633778 () Bool)

(assert (=> b!943205 (=> (not res!633778) (not e!530315))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13432 0))(
  ( (tuple2!13433 (_1!6727 (_ BitVec 64)) (_2!6727 V!32295)) )
))
(declare-datatypes ((List!19243 0))(
  ( (Nil!19240) (Cons!19239 (h!20389 tuple2!13432) (t!27558 List!19243)) )
))
(declare-datatypes ((ListLongMap!12129 0))(
  ( (ListLongMap!12130 (toList!6080 List!19243)) )
))
(declare-fun contains!5150 (ListLongMap!12129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3314 (array!56962 array!56960 (_ BitVec 32) (_ BitVec 32) V!32295 V!32295 (_ BitVec 32) Int) ListLongMap!12129)

(assert (=> b!943205 (= res!633778 (contains!5150 (getCurrentListMap!3314 (_keys!10507 thiss!1141) (_values!5656 thiss!1141) (mask!27257 thiss!1141) (extraKeys!5365 thiss!1141) (zeroValue!5469 thiss!1141) (minValue!5469 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5633 thiss!1141)) key!756))))

(declare-fun b!943206 () Bool)

(declare-fun res!633773 () Bool)

(assert (=> b!943206 (=> (not res!633773) (not e!530315))))

(assert (=> b!943206 (= res!633773 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943207 () Bool)

(declare-fun res!633779 () Bool)

(assert (=> b!943207 (=> (not res!633779) (not e!530315))))

(declare-datatypes ((SeekEntryResult!9047 0))(
  ( (MissingZero!9047 (index!38559 (_ BitVec 32))) (Found!9047 (index!38560 (_ BitVec 32))) (Intermediate!9047 (undefined!9859 Bool) (index!38561 (_ BitVec 32)) (x!81000 (_ BitVec 32))) (Undefined!9047) (MissingVacant!9047 (index!38562 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56962 (_ BitVec 32)) SeekEntryResult!9047)

(assert (=> b!943207 (= res!633779 (not (is-Found!9047 (seekEntry!0 key!756 (_keys!10507 thiss!1141) (mask!27257 thiss!1141)))))))

(declare-fun mapIsEmpty!32567 () Bool)

(assert (=> mapIsEmpty!32567 mapRes!32567))

(declare-fun b!943208 () Bool)

(declare-fun res!633777 () Bool)

(assert (=> b!943208 (=> (not res!633777) (not e!530315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943208 (= res!633777 (validMask!0 (mask!27257 thiss!1141)))))

(declare-fun res!633774 () Bool)

(assert (=> start!80290 (=> (not res!633774) (not e!530315))))

(declare-fun valid!1789 (LongMapFixedSize!4684) Bool)

(assert (=> start!80290 (= res!633774 (valid!1789 thiss!1141))))

(assert (=> start!80290 e!530315))

(assert (=> start!80290 e!530312))

(assert (=> start!80290 true))

(declare-fun b!943209 () Bool)

(assert (=> b!943209 (= e!530316 (and e!530314 mapRes!32567))))

(declare-fun condMapEmpty!32567 () Bool)

(declare-fun mapDefault!32567 () ValueCell!9767)

