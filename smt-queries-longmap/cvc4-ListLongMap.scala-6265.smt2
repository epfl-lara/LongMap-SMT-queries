; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80094 () Bool)

(assert start!80094)

(declare-fun b!941493 () Bool)

(declare-fun b_free!17915 () Bool)

(declare-fun b_next!17915 () Bool)

(assert (=> b!941493 (= b_free!17915 (not b_next!17915))))

(declare-fun tp!62227 () Bool)

(declare-fun b_and!29327 () Bool)

(assert (=> b!941493 (= tp!62227 b_and!29327)))

(declare-fun b!941486 () Bool)

(declare-fun e!529302 () Bool)

(declare-fun e!529303 () Bool)

(declare-fun mapRes!32432 () Bool)

(assert (=> b!941486 (= e!529302 (and e!529303 mapRes!32432))))

(declare-fun condMapEmpty!32432 () Bool)

(declare-datatypes ((V!32195 0))(
  ( (V!32196 (val!10262 Int)) )
))
(declare-datatypes ((ValueCell!9730 0))(
  ( (ValueCellFull!9730 (v!12793 V!32195)) (EmptyCell!9730) )
))
(declare-datatypes ((array!56798 0))(
  ( (array!56799 (arr!27332 (Array (_ BitVec 32) ValueCell!9730)) (size!27794 (_ BitVec 32))) )
))
(declare-datatypes ((array!56800 0))(
  ( (array!56801 (arr!27333 (Array (_ BitVec 32) (_ BitVec 64))) (size!27795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4610 0))(
  ( (LongMapFixedSize!4611 (defaultEntry!5596 Int) (mask!27165 (_ BitVec 32)) (extraKeys!5328 (_ BitVec 32)) (zeroValue!5432 V!32195) (minValue!5432 V!32195) (_size!2360 (_ BitVec 32)) (_keys!10451 array!56800) (_values!5619 array!56798) (_vacant!2360 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4610)

(declare-fun mapDefault!32432 () ValueCell!9730)

