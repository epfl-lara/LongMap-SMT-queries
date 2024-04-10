; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79942 () Bool)

(assert start!79942)

(declare-fun b!939916 () Bool)

(declare-fun b_free!17807 () Bool)

(declare-fun b_next!17807 () Bool)

(assert (=> b!939916 (= b_free!17807 (not b_next!17807))))

(declare-fun tp!61892 () Bool)

(declare-fun b_and!29219 () Bool)

(assert (=> b!939916 (= tp!61892 b_and!29219)))

(declare-fun b!939915 () Bool)

(declare-fun res!632097 () Bool)

(declare-fun e!528043 () Bool)

(assert (=> b!939915 (=> (not res!632097) (not e!528043))))

(declare-datatypes ((V!32051 0))(
  ( (V!32052 (val!10208 Int)) )
))
(declare-datatypes ((ValueCell!9676 0))(
  ( (ValueCellFull!9676 (v!12739 V!32051)) (EmptyCell!9676) )
))
(declare-datatypes ((array!56576 0))(
  ( (array!56577 (arr!27224 (Array (_ BitVec 32) ValueCell!9676)) (size!27685 (_ BitVec 32))) )
))
(declare-datatypes ((array!56578 0))(
  ( (array!56579 (arr!27225 (Array (_ BitVec 32) (_ BitVec 64))) (size!27686 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4502 0))(
  ( (LongMapFixedSize!4503 (defaultEntry!5542 Int) (mask!27066 (_ BitVec 32)) (extraKeys!5274 (_ BitVec 32)) (zeroValue!5378 V!32051) (minValue!5378 V!32051) (_size!2306 (_ BitVec 32)) (_keys!10392 array!56578) (_values!5565 array!56576) (_vacant!2306 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4502)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939915 (= res!632097 (validMask!0 (mask!27066 thiss!1141)))))

(declare-fun e!528042 () Bool)

(declare-fun e!528040 () Bool)

(declare-fun tp_is_empty!20315 () Bool)

(declare-fun array_inv!21172 (array!56578) Bool)

(declare-fun array_inv!21173 (array!56576) Bool)

(assert (=> b!939916 (= e!528042 (and tp!61892 tp_is_empty!20315 (array_inv!21172 (_keys!10392 thiss!1141)) (array_inv!21173 (_values!5565 thiss!1141)) e!528040))))

(declare-fun res!632096 () Bool)

(assert (=> start!79942 (=> (not res!632096) (not e!528043))))

(declare-fun valid!1729 (LongMapFixedSize!4502) Bool)

(assert (=> start!79942 (= res!632096 (valid!1729 thiss!1141))))

(assert (=> start!79942 e!528043))

(assert (=> start!79942 e!528042))

(assert (=> start!79942 true))

(declare-fun b!939917 () Bool)

(declare-fun res!632098 () Bool)

(assert (=> b!939917 (=> (not res!632098) (not e!528043))))

(assert (=> b!939917 (= res!632098 (= (size!27686 (_keys!10392 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27066 thiss!1141))))))

(declare-fun b!939918 () Bool)

(declare-fun e!528038 () Bool)

(assert (=> b!939918 (= e!528038 tp_is_empty!20315)))

(declare-fun b!939919 () Bool)

(declare-fun res!632095 () Bool)

(assert (=> b!939919 (=> (not res!632095) (not e!528043))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939919 (= res!632095 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939920 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939920 (= e!528043 (not (validKeyInArray!0 key!756)))))

(declare-fun mapIsEmpty!32260 () Bool)

(declare-fun mapRes!32260 () Bool)

(assert (=> mapIsEmpty!32260 mapRes!32260))

(declare-fun mapNonEmpty!32260 () Bool)

(declare-fun tp!61893 () Bool)

(declare-fun e!528039 () Bool)

(assert (=> mapNonEmpty!32260 (= mapRes!32260 (and tp!61893 e!528039))))

(declare-fun mapKey!32260 () (_ BitVec 32))

(declare-fun mapRest!32260 () (Array (_ BitVec 32) ValueCell!9676))

(declare-fun mapValue!32260 () ValueCell!9676)

(assert (=> mapNonEmpty!32260 (= (arr!27224 (_values!5565 thiss!1141)) (store mapRest!32260 mapKey!32260 mapValue!32260))))

(declare-fun b!939921 () Bool)

(assert (=> b!939921 (= e!528040 (and e!528038 mapRes!32260))))

(declare-fun condMapEmpty!32260 () Bool)

(declare-fun mapDefault!32260 () ValueCell!9676)

