; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79970 () Bool)

(assert start!79970)

(declare-fun b!940101 () Bool)

(declare-fun b_free!17825 () Bool)

(declare-fun b_next!17825 () Bool)

(assert (=> b!940101 (= b_free!17825 (not b_next!17825))))

(declare-fun tp!61949 () Bool)

(declare-fun b_and!29237 () Bool)

(assert (=> b!940101 (= tp!61949 b_and!29237)))

(declare-fun mapIsEmpty!32290 () Bool)

(declare-fun mapRes!32290 () Bool)

(assert (=> mapIsEmpty!32290 mapRes!32290))

(declare-fun mapNonEmpty!32290 () Bool)

(declare-fun tp!61950 () Bool)

(declare-fun e!528209 () Bool)

(assert (=> mapNonEmpty!32290 (= mapRes!32290 (and tp!61950 e!528209))))

(declare-datatypes ((V!32075 0))(
  ( (V!32076 (val!10217 Int)) )
))
(declare-datatypes ((ValueCell!9685 0))(
  ( (ValueCellFull!9685 (v!12748 V!32075)) (EmptyCell!9685) )
))
(declare-fun mapRest!32290 () (Array (_ BitVec 32) ValueCell!9685))

(declare-fun mapKey!32290 () (_ BitVec 32))

(declare-datatypes ((array!56614 0))(
  ( (array!56615 (arr!27242 (Array (_ BitVec 32) ValueCell!9685)) (size!27703 (_ BitVec 32))) )
))
(declare-datatypes ((array!56616 0))(
  ( (array!56617 (arr!27243 (Array (_ BitVec 32) (_ BitVec 64))) (size!27704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4520 0))(
  ( (LongMapFixedSize!4521 (defaultEntry!5551 Int) (mask!27082 (_ BitVec 32)) (extraKeys!5283 (_ BitVec 32)) (zeroValue!5387 V!32075) (minValue!5387 V!32075) (_size!2315 (_ BitVec 32)) (_keys!10401 array!56616) (_values!5574 array!56614) (_vacant!2315 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4520)

(declare-fun mapValue!32290 () ValueCell!9685)

(assert (=> mapNonEmpty!32290 (= (arr!27242 (_values!5574 thiss!1141)) (store mapRest!32290 mapKey!32290 mapValue!32290))))

(declare-fun res!632160 () Bool)

(declare-fun e!528211 () Bool)

(assert (=> start!79970 (=> (not res!632160) (not e!528211))))

(declare-fun valid!1736 (LongMapFixedSize!4520) Bool)

(assert (=> start!79970 (= res!632160 (valid!1736 thiss!1141))))

(assert (=> start!79970 e!528211))

(declare-fun e!528213 () Bool)

(assert (=> start!79970 e!528213))

(assert (=> start!79970 true))

(declare-fun b!940096 () Bool)

(declare-fun e!528214 () Bool)

(declare-fun e!528210 () Bool)

(assert (=> b!940096 (= e!528214 (and e!528210 mapRes!32290))))

(declare-fun condMapEmpty!32290 () Bool)

(declare-fun mapDefault!32290 () ValueCell!9685)

