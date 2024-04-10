; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80140 () Bool)

(assert start!80140)

(declare-fun b!941802 () Bool)

(declare-fun b_free!17927 () Bool)

(declare-fun b_next!17927 () Bool)

(assert (=> b!941802 (= b_free!17927 (not b_next!17927))))

(declare-fun tp!62269 () Bool)

(declare-fun b_and!29339 () Bool)

(assert (=> b!941802 (= tp!62269 b_and!29339)))

(declare-fun b!941798 () Bool)

(declare-fun res!633024 () Bool)

(declare-fun e!529500 () Bool)

(assert (=> b!941798 (=> (not res!633024) (not e!529500))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941798 (= res!633024 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941799 () Bool)

(declare-datatypes ((V!32211 0))(
  ( (V!32212 (val!10268 Int)) )
))
(declare-datatypes ((ValueCell!9736 0))(
  ( (ValueCellFull!9736 (v!12799 V!32211)) (EmptyCell!9736) )
))
(declare-datatypes ((array!56826 0))(
  ( (array!56827 (arr!27344 (Array (_ BitVec 32) ValueCell!9736)) (size!27807 (_ BitVec 32))) )
))
(declare-datatypes ((array!56828 0))(
  ( (array!56829 (arr!27345 (Array (_ BitVec 32) (_ BitVec 64))) (size!27808 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4622 0))(
  ( (LongMapFixedSize!4623 (defaultEntry!5602 Int) (mask!27183 (_ BitVec 32)) (extraKeys!5334 (_ BitVec 32)) (zeroValue!5438 V!32211) (minValue!5438 V!32211) (_size!2366 (_ BitVec 32)) (_keys!10462 array!56828) (_values!5625 array!56826) (_vacant!2366 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4622)

(assert (=> b!941799 (= e!529500 (and (= (size!27807 (_values!5625 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27183 thiss!1141))) (= (size!27808 (_keys!10462 thiss!1141)) (size!27807 (_values!5625 thiss!1141))) (bvsge (mask!27183 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5334 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!941800 () Bool)

(declare-fun res!633026 () Bool)

(assert (=> b!941800 (=> (not res!633026) (not e!529500))))

(declare-datatypes ((SeekEntryResult!9025 0))(
  ( (MissingZero!9025 (index!38471 (_ BitVec 32))) (Found!9025 (index!38472 (_ BitVec 32))) (Intermediate!9025 (undefined!9837 Bool) (index!38473 (_ BitVec 32)) (x!80832 (_ BitVec 32))) (Undefined!9025) (MissingVacant!9025 (index!38474 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56828 (_ BitVec 32)) SeekEntryResult!9025)

(assert (=> b!941800 (= res!633026 (not (is-Found!9025 (seekEntry!0 key!756 (_keys!10462 thiss!1141) (mask!27183 thiss!1141)))))))

(declare-fun b!941801 () Bool)

(declare-fun e!529505 () Bool)

(declare-fun tp_is_empty!20435 () Bool)

(assert (=> b!941801 (= e!529505 tp_is_empty!20435)))

(declare-fun res!633027 () Bool)

(assert (=> start!80140 (=> (not res!633027) (not e!529500))))

(declare-fun valid!1769 (LongMapFixedSize!4622) Bool)

(assert (=> start!80140 (= res!633027 (valid!1769 thiss!1141))))

(assert (=> start!80140 e!529500))

(declare-fun e!529501 () Bool)

(assert (=> start!80140 e!529501))

(assert (=> start!80140 true))

(declare-fun e!529503 () Bool)

(declare-fun array_inv!21246 (array!56828) Bool)

(declare-fun array_inv!21247 (array!56826) Bool)

(assert (=> b!941802 (= e!529501 (and tp!62269 tp_is_empty!20435 (array_inv!21246 (_keys!10462 thiss!1141)) (array_inv!21247 (_values!5625 thiss!1141)) e!529503))))

(declare-fun b!941803 () Bool)

(declare-fun res!633025 () Bool)

(assert (=> b!941803 (=> (not res!633025) (not e!529500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941803 (= res!633025 (validMask!0 (mask!27183 thiss!1141)))))

(declare-fun mapNonEmpty!32457 () Bool)

(declare-fun mapRes!32457 () Bool)

(declare-fun tp!62270 () Bool)

(declare-fun e!529502 () Bool)

(assert (=> mapNonEmpty!32457 (= mapRes!32457 (and tp!62270 e!529502))))

(declare-fun mapKey!32457 () (_ BitVec 32))

(declare-fun mapValue!32457 () ValueCell!9736)

(declare-fun mapRest!32457 () (Array (_ BitVec 32) ValueCell!9736))

(assert (=> mapNonEmpty!32457 (= (arr!27344 (_values!5625 thiss!1141)) (store mapRest!32457 mapKey!32457 mapValue!32457))))

(declare-fun mapIsEmpty!32457 () Bool)

(assert (=> mapIsEmpty!32457 mapRes!32457))

(declare-fun b!941804 () Bool)

(assert (=> b!941804 (= e!529502 tp_is_empty!20435)))

(declare-fun b!941805 () Bool)

(assert (=> b!941805 (= e!529503 (and e!529505 mapRes!32457))))

(declare-fun condMapEmpty!32457 () Bool)

(declare-fun mapDefault!32457 () ValueCell!9736)

