; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79976 () Bool)

(assert start!79976)

(declare-fun b!940152 () Bool)

(declare-fun b_free!17831 () Bool)

(declare-fun b_next!17831 () Bool)

(assert (=> b!940152 (= b_free!17831 (not b_next!17831))))

(declare-fun tp!61967 () Bool)

(declare-fun b_and!29243 () Bool)

(assert (=> b!940152 (= tp!61967 b_and!29243)))

(declare-fun b!940150 () Bool)

(declare-fun e!528264 () Bool)

(declare-fun e!528263 () Bool)

(declare-fun mapRes!32299 () Bool)

(assert (=> b!940150 (= e!528264 (and e!528263 mapRes!32299))))

(declare-fun condMapEmpty!32299 () Bool)

(declare-datatypes ((V!32083 0))(
  ( (V!32084 (val!10220 Int)) )
))
(declare-datatypes ((ValueCell!9688 0))(
  ( (ValueCellFull!9688 (v!12751 V!32083)) (EmptyCell!9688) )
))
(declare-datatypes ((array!56626 0))(
  ( (array!56627 (arr!27248 (Array (_ BitVec 32) ValueCell!9688)) (size!27709 (_ BitVec 32))) )
))
(declare-datatypes ((array!56628 0))(
  ( (array!56629 (arr!27249 (Array (_ BitVec 32) (_ BitVec 64))) (size!27710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4526 0))(
  ( (LongMapFixedSize!4527 (defaultEntry!5554 Int) (mask!27087 (_ BitVec 32)) (extraKeys!5286 (_ BitVec 32)) (zeroValue!5390 V!32083) (minValue!5390 V!32083) (_size!2318 (_ BitVec 32)) (_keys!10404 array!56628) (_values!5577 array!56626) (_vacant!2318 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4526)

(declare-fun mapDefault!32299 () ValueCell!9688)

