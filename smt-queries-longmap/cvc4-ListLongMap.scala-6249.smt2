; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79964 () Bool)

(assert start!79964)

(declare-fun b!940044 () Bool)

(declare-fun b_free!17819 () Bool)

(declare-fun b_next!17819 () Bool)

(assert (=> b!940044 (= b_free!17819 (not b_next!17819))))

(declare-fun tp!61932 () Bool)

(declare-fun b_and!29231 () Bool)

(assert (=> b!940044 (= tp!61932 b_and!29231)))

(declare-fun b!940042 () Bool)

(declare-fun e!528157 () Bool)

(declare-fun tp_is_empty!20327 () Bool)

(assert (=> b!940042 (= e!528157 tp_is_empty!20327)))

(declare-fun b!940043 () Bool)

(declare-fun res!632142 () Bool)

(declare-fun e!528155 () Bool)

(assert (=> b!940043 (=> (not res!632142) (not e!528155))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940043 (= res!632142 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32281 () Bool)

(declare-fun mapRes!32281 () Bool)

(declare-fun tp!61931 () Bool)

(declare-fun e!528158 () Bool)

(assert (=> mapNonEmpty!32281 (= mapRes!32281 (and tp!61931 e!528158))))

(declare-datatypes ((V!32067 0))(
  ( (V!32068 (val!10214 Int)) )
))
(declare-datatypes ((ValueCell!9682 0))(
  ( (ValueCellFull!9682 (v!12745 V!32067)) (EmptyCell!9682) )
))
(declare-datatypes ((array!56602 0))(
  ( (array!56603 (arr!27236 (Array (_ BitVec 32) ValueCell!9682)) (size!27697 (_ BitVec 32))) )
))
(declare-datatypes ((array!56604 0))(
  ( (array!56605 (arr!27237 (Array (_ BitVec 32) (_ BitVec 64))) (size!27698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4514 0))(
  ( (LongMapFixedSize!4515 (defaultEntry!5548 Int) (mask!27077 (_ BitVec 32)) (extraKeys!5280 (_ BitVec 32)) (zeroValue!5384 V!32067) (minValue!5384 V!32067) (_size!2312 (_ BitVec 32)) (_keys!10398 array!56604) (_values!5571 array!56602) (_vacant!2312 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4514)

(declare-fun mapValue!32281 () ValueCell!9682)

(declare-fun mapRest!32281 () (Array (_ BitVec 32) ValueCell!9682))

(declare-fun mapKey!32281 () (_ BitVec 32))

(assert (=> mapNonEmpty!32281 (= (arr!27236 (_values!5571 thiss!1141)) (store mapRest!32281 mapKey!32281 mapValue!32281))))

(declare-fun e!528160 () Bool)

(declare-fun e!528159 () Bool)

(declare-fun array_inv!21180 (array!56604) Bool)

(declare-fun array_inv!21181 (array!56602) Bool)

(assert (=> b!940044 (= e!528159 (and tp!61932 tp_is_empty!20327 (array_inv!21180 (_keys!10398 thiss!1141)) (array_inv!21181 (_values!5571 thiss!1141)) e!528160))))

(declare-fun res!632143 () Bool)

(assert (=> start!79964 (=> (not res!632143) (not e!528155))))

(declare-fun valid!1733 (LongMapFixedSize!4514) Bool)

(assert (=> start!79964 (= res!632143 (valid!1733 thiss!1141))))

(assert (=> start!79964 e!528155))

(assert (=> start!79964 e!528159))

(assert (=> start!79964 true))

(declare-fun mapIsEmpty!32281 () Bool)

(assert (=> mapIsEmpty!32281 mapRes!32281))

(declare-fun b!940045 () Bool)

(assert (=> b!940045 (= e!528160 (and e!528157 mapRes!32281))))

(declare-fun condMapEmpty!32281 () Bool)

(declare-fun mapDefault!32281 () ValueCell!9682)

