; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79882 () Bool)

(assert start!79882)

(declare-fun b!939531 () Bool)

(declare-fun b_free!17779 () Bool)

(declare-fun b_next!17779 () Bool)

(assert (=> b!939531 (= b_free!17779 (not b_next!17779))))

(declare-fun tp!61800 () Bool)

(declare-fun b_and!29191 () Bool)

(assert (=> b!939531 (= tp!61800 b_and!29191)))

(declare-fun b!939530 () Bool)

(declare-fun e!527724 () Bool)

(declare-fun tp_is_empty!20287 () Bool)

(assert (=> b!939530 (= e!527724 tp_is_empty!20287)))

(declare-fun e!527721 () Bool)

(declare-fun e!527720 () Bool)

(declare-datatypes ((V!32015 0))(
  ( (V!32016 (val!10194 Int)) )
))
(declare-datatypes ((ValueCell!9662 0))(
  ( (ValueCellFull!9662 (v!12725 V!32015)) (EmptyCell!9662) )
))
(declare-datatypes ((array!56516 0))(
  ( (array!56517 (arr!27196 (Array (_ BitVec 32) ValueCell!9662)) (size!27655 (_ BitVec 32))) )
))
(declare-datatypes ((array!56518 0))(
  ( (array!56519 (arr!27197 (Array (_ BitVec 32) (_ BitVec 64))) (size!27656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4474 0))(
  ( (LongMapFixedSize!4475 (defaultEntry!5528 Int) (mask!27040 (_ BitVec 32)) (extraKeys!5260 (_ BitVec 32)) (zeroValue!5364 V!32015) (minValue!5364 V!32015) (_size!2292 (_ BitVec 32)) (_keys!10376 array!56518) (_values!5551 array!56516) (_vacant!2292 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4474)

(declare-fun array_inv!21152 (array!56518) Bool)

(declare-fun array_inv!21153 (array!56516) Bool)

(assert (=> b!939531 (= e!527721 (and tp!61800 tp_is_empty!20287 (array_inv!21152 (_keys!10376 thiss!1141)) (array_inv!21153 (_values!5551 thiss!1141)) e!527720))))

(declare-fun mapNonEmpty!32210 () Bool)

(declare-fun mapRes!32210 () Bool)

(declare-fun tp!61801 () Bool)

(assert (=> mapNonEmpty!32210 (= mapRes!32210 (and tp!61801 e!527724))))

(declare-fun mapRest!32210 () (Array (_ BitVec 32) ValueCell!9662))

(declare-fun mapValue!32210 () ValueCell!9662)

(declare-fun mapKey!32210 () (_ BitVec 32))

(assert (=> mapNonEmpty!32210 (= (arr!27196 (_values!5551 thiss!1141)) (store mapRest!32210 mapKey!32210 mapValue!32210))))

(declare-fun mapIsEmpty!32210 () Bool)

(assert (=> mapIsEmpty!32210 mapRes!32210))

(declare-fun lt!424549 () Bool)

(declare-fun valid!1719 (LongMapFixedSize!4474) Bool)

(assert (=> start!79882 (= lt!424549 (valid!1719 thiss!1141))))

(assert (=> start!79882 false))

(assert (=> start!79882 e!527721))

(declare-fun b!939532 () Bool)

(declare-fun e!527722 () Bool)

(assert (=> b!939532 (= e!527720 (and e!527722 mapRes!32210))))

(declare-fun condMapEmpty!32210 () Bool)

(declare-fun mapDefault!32210 () ValueCell!9662)

