; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80270 () Bool)

(assert start!80270)

(declare-fun b!942874 () Bool)

(declare-fun b_free!17969 () Bool)

(declare-fun b_next!17969 () Bool)

(assert (=> b!942874 (= b_free!17969 (not b_next!17969))))

(declare-fun tp!62412 () Bool)

(declare-fun b_and!29381 () Bool)

(assert (=> b!942874 (= tp!62412 b_and!29381)))

(declare-fun b!942871 () Bool)

(declare-fun res!633569 () Bool)

(declare-fun e!530134 () Bool)

(assert (=> b!942871 (=> (not res!633569) (not e!530134))))

(declare-datatypes ((V!32267 0))(
  ( (V!32268 (val!10289 Int)) )
))
(declare-datatypes ((ValueCell!9757 0))(
  ( (ValueCellFull!9757 (v!12820 V!32267)) (EmptyCell!9757) )
))
(declare-datatypes ((array!56920 0))(
  ( (array!56921 (arr!27386 (Array (_ BitVec 32) ValueCell!9757)) (size!27851 (_ BitVec 32))) )
))
(declare-datatypes ((array!56922 0))(
  ( (array!56923 (arr!27387 (Array (_ BitVec 32) (_ BitVec 64))) (size!27852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4664 0))(
  ( (LongMapFixedSize!4665 (defaultEntry!5623 Int) (mask!27239 (_ BitVec 32)) (extraKeys!5355 (_ BitVec 32)) (zeroValue!5459 V!32267) (minValue!5459 V!32267) (_size!2387 (_ BitVec 32)) (_keys!10497 array!56922) (_values!5646 array!56920) (_vacant!2387 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4664)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13418 0))(
  ( (tuple2!13419 (_1!6720 (_ BitVec 64)) (_2!6720 V!32267)) )
))
(declare-datatypes ((List!19229 0))(
  ( (Nil!19226) (Cons!19225 (h!20375 tuple2!13418) (t!27544 List!19229)) )
))
(declare-datatypes ((ListLongMap!12115 0))(
  ( (ListLongMap!12116 (toList!6073 List!19229)) )
))
(declare-fun contains!5143 (ListLongMap!12115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3307 (array!56922 array!56920 (_ BitVec 32) (_ BitVec 32) V!32267 V!32267 (_ BitVec 32) Int) ListLongMap!12115)

(assert (=> b!942871 (= res!633569 (contains!5143 (getCurrentListMap!3307 (_keys!10497 thiss!1141) (_values!5646 thiss!1141) (mask!27239 thiss!1141) (extraKeys!5355 thiss!1141) (zeroValue!5459 thiss!1141) (minValue!5459 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5623 thiss!1141)) key!756))))

(declare-fun b!942873 () Bool)

(declare-fun res!633567 () Bool)

(assert (=> b!942873 (=> (not res!633567) (not e!530134))))

(declare-datatypes ((SeekEntryResult!9040 0))(
  ( (MissingZero!9040 (index!38531 (_ BitVec 32))) (Found!9040 (index!38532 (_ BitVec 32))) (Intermediate!9040 (undefined!9852 Bool) (index!38533 (_ BitVec 32)) (x!80961 (_ BitVec 32))) (Undefined!9040) (MissingVacant!9040 (index!38534 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56922 (_ BitVec 32)) SeekEntryResult!9040)

(assert (=> b!942873 (= res!633567 (not (is-Found!9040 (seekEntry!0 key!756 (_keys!10497 thiss!1141) (mask!27239 thiss!1141)))))))

(declare-fun mapNonEmpty!32537 () Bool)

(declare-fun mapRes!32537 () Bool)

(declare-fun tp!62413 () Bool)

(declare-fun e!530136 () Bool)

(assert (=> mapNonEmpty!32537 (= mapRes!32537 (and tp!62413 e!530136))))

(declare-fun mapValue!32537 () ValueCell!9757)

(declare-fun mapKey!32537 () (_ BitVec 32))

(declare-fun mapRest!32537 () (Array (_ BitVec 32) ValueCell!9757))

(assert (=> mapNonEmpty!32537 (= (arr!27386 (_values!5646 thiss!1141)) (store mapRest!32537 mapKey!32537 mapValue!32537))))

(declare-fun e!530135 () Bool)

(declare-fun e!530133 () Bool)

(declare-fun tp_is_empty!20477 () Bool)

(declare-fun array_inv!21276 (array!56922) Bool)

(declare-fun array_inv!21277 (array!56920) Bool)

(assert (=> b!942874 (= e!530135 (and tp!62412 tp_is_empty!20477 (array_inv!21276 (_keys!10497 thiss!1141)) (array_inv!21277 (_values!5646 thiss!1141)) e!530133))))

(declare-fun b!942875 () Bool)

(declare-fun e!530132 () Bool)

(assert (=> b!942875 (= e!530133 (and e!530132 mapRes!32537))))

(declare-fun condMapEmpty!32537 () Bool)

(declare-fun mapDefault!32537 () ValueCell!9757)

