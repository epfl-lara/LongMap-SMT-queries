; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79894 () Bool)

(assert start!79894)

(declare-fun b!939606 () Bool)

(declare-fun b_free!17791 () Bool)

(declare-fun b_next!17791 () Bool)

(assert (=> b!939606 (= b_free!17791 (not b_next!17791))))

(declare-fun tp!61837 () Bool)

(declare-fun b_and!29203 () Bool)

(assert (=> b!939606 (= tp!61837 b_and!29203)))

(declare-fun e!527814 () Bool)

(declare-datatypes ((V!32031 0))(
  ( (V!32032 (val!10200 Int)) )
))
(declare-datatypes ((ValueCell!9668 0))(
  ( (ValueCellFull!9668 (v!12731 V!32031)) (EmptyCell!9668) )
))
(declare-datatypes ((array!56540 0))(
  ( (array!56541 (arr!27208 (Array (_ BitVec 32) ValueCell!9668)) (size!27667 (_ BitVec 32))) )
))
(declare-datatypes ((array!56542 0))(
  ( (array!56543 (arr!27209 (Array (_ BitVec 32) (_ BitVec 64))) (size!27668 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4486 0))(
  ( (LongMapFixedSize!4487 (defaultEntry!5534 Int) (mask!27050 (_ BitVec 32)) (extraKeys!5266 (_ BitVec 32)) (zeroValue!5370 V!32031) (minValue!5370 V!32031) (_size!2298 (_ BitVec 32)) (_keys!10382 array!56542) (_values!5557 array!56540) (_vacant!2298 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4486)

(declare-fun e!527816 () Bool)

(declare-fun tp_is_empty!20299 () Bool)

(declare-fun array_inv!21160 (array!56542) Bool)

(declare-fun array_inv!21161 (array!56540) Bool)

(assert (=> b!939606 (= e!527814 (and tp!61837 tp_is_empty!20299 (array_inv!21160 (_keys!10382 thiss!1141)) (array_inv!21161 (_values!5557 thiss!1141)) e!527816))))

(declare-fun b!939607 () Bool)

(declare-fun e!527813 () Bool)

(assert (=> b!939607 (= e!527813 tp_is_empty!20299)))

(declare-fun mapIsEmpty!32228 () Bool)

(declare-fun mapRes!32228 () Bool)

(assert (=> mapIsEmpty!32228 mapRes!32228))

(declare-fun res!631950 () Bool)

(declare-fun e!527817 () Bool)

(assert (=> start!79894 (=> (not res!631950) (not e!527817))))

(declare-fun valid!1724 (LongMapFixedSize!4486) Bool)

(assert (=> start!79894 (= res!631950 (valid!1724 thiss!1141))))

(assert (=> start!79894 e!527817))

(assert (=> start!79894 e!527814))

(assert (=> start!79894 true))

(declare-fun b!939608 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939608 (= e!527817 (not (validMask!0 (mask!27050 thiss!1141))))))

(declare-fun b!939609 () Bool)

(declare-fun e!527815 () Bool)

(assert (=> b!939609 (= e!527815 tp_is_empty!20299)))

(declare-fun b!939610 () Bool)

(declare-fun res!631951 () Bool)

(assert (=> b!939610 (=> (not res!631951) (not e!527817))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939610 (= res!631951 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939611 () Bool)

(assert (=> b!939611 (= e!527816 (and e!527815 mapRes!32228))))

(declare-fun condMapEmpty!32228 () Bool)

(declare-fun mapDefault!32228 () ValueCell!9668)

