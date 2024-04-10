; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80048 () Bool)

(assert start!80048)

(declare-fun b!941177 () Bool)

(declare-fun b_free!17903 () Bool)

(declare-fun b_next!17903 () Bool)

(assert (=> b!941177 (= b_free!17903 (not b_next!17903))))

(declare-fun tp!62184 () Bool)

(declare-fun b_and!29315 () Bool)

(assert (=> b!941177 (= tp!62184 b_and!29315)))

(declare-fun b!941176 () Bool)

(declare-fun e!529103 () Bool)

(declare-fun tp_is_empty!20411 () Bool)

(assert (=> b!941176 (= e!529103 tp_is_empty!20411)))

(declare-fun mapNonEmpty!32407 () Bool)

(declare-fun mapRes!32407 () Bool)

(declare-fun tp!62183 () Bool)

(assert (=> mapNonEmpty!32407 (= mapRes!32407 (and tp!62183 e!529103))))

(declare-datatypes ((V!32179 0))(
  ( (V!32180 (val!10256 Int)) )
))
(declare-datatypes ((ValueCell!9724 0))(
  ( (ValueCellFull!9724 (v!12787 V!32179)) (EmptyCell!9724) )
))
(declare-fun mapRest!32407 () (Array (_ BitVec 32) ValueCell!9724))

(declare-datatypes ((array!56770 0))(
  ( (array!56771 (arr!27320 (Array (_ BitVec 32) ValueCell!9724)) (size!27781 (_ BitVec 32))) )
))
(declare-datatypes ((array!56772 0))(
  ( (array!56773 (arr!27321 (Array (_ BitVec 32) (_ BitVec 64))) (size!27782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4598 0))(
  ( (LongMapFixedSize!4599 (defaultEntry!5590 Int) (mask!27147 (_ BitVec 32)) (extraKeys!5322 (_ BitVec 32)) (zeroValue!5426 V!32179) (minValue!5426 V!32179) (_size!2354 (_ BitVec 32)) (_keys!10440 array!56772) (_values!5613 array!56770) (_vacant!2354 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4598)

(declare-fun mapKey!32407 () (_ BitVec 32))

(declare-fun mapValue!32407 () ValueCell!9724)

(assert (=> mapNonEmpty!32407 (= (arr!27320 (_values!5613 thiss!1141)) (store mapRest!32407 mapKey!32407 mapValue!32407))))

(declare-fun e!529105 () Bool)

(declare-fun e!529104 () Bool)

(declare-fun array_inv!21232 (array!56772) Bool)

(declare-fun array_inv!21233 (array!56770) Bool)

(assert (=> b!941177 (= e!529105 (and tp!62184 tp_is_empty!20411 (array_inv!21232 (_keys!10440 thiss!1141)) (array_inv!21233 (_values!5613 thiss!1141)) e!529104))))

(declare-fun mapIsEmpty!32407 () Bool)

(assert (=> mapIsEmpty!32407 mapRes!32407))

(declare-fun b!941178 () Bool)

(declare-fun res!632772 () Bool)

(declare-fun e!529100 () Bool)

(assert (=> b!941178 (=> (not res!632772) (not e!529100))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941178 (= res!632772 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941179 () Bool)

(declare-fun e!529101 () Bool)

(assert (=> b!941179 (= e!529101 tp_is_empty!20411)))

(declare-fun b!941180 () Bool)

(declare-fun res!632773 () Bool)

(assert (=> b!941180 (=> (not res!632773) (not e!529100))))

(declare-datatypes ((SeekEntryResult!9019 0))(
  ( (MissingZero!9019 (index!38447 (_ BitVec 32))) (Found!9019 (index!38448 (_ BitVec 32))) (Intermediate!9019 (undefined!9831 Bool) (index!38449 (_ BitVec 32)) (x!80744 (_ BitVec 32))) (Undefined!9019) (MissingVacant!9019 (index!38450 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56772 (_ BitVec 32)) SeekEntryResult!9019)

(assert (=> b!941180 (= res!632773 (not (is-Found!9019 (seekEntry!0 key!756 (_keys!10440 thiss!1141) (mask!27147 thiss!1141)))))))

(declare-fun b!941181 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941181 (= e!529100 (not (validMask!0 (mask!27147 thiss!1141))))))

(declare-fun res!632771 () Bool)

(assert (=> start!80048 (=> (not res!632771) (not e!529100))))

(declare-fun valid!1761 (LongMapFixedSize!4598) Bool)

(assert (=> start!80048 (= res!632771 (valid!1761 thiss!1141))))

(assert (=> start!80048 e!529100))

(assert (=> start!80048 e!529105))

(assert (=> start!80048 true))

(declare-fun b!941175 () Bool)

(assert (=> b!941175 (= e!529104 (and e!529101 mapRes!32407))))

(declare-fun condMapEmpty!32407 () Bool)

(declare-fun mapDefault!32407 () ValueCell!9724)

