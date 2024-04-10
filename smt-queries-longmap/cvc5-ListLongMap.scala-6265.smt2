; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80090 () Bool)

(assert start!80090)

(declare-fun b!941444 () Bool)

(declare-fun b_free!17911 () Bool)

(declare-fun b_next!17911 () Bool)

(assert (=> b!941444 (= b_free!17911 (not b_next!17911))))

(declare-fun tp!62215 () Bool)

(declare-fun b_and!29323 () Bool)

(assert (=> b!941444 (= tp!62215 b_and!29323)))

(declare-fun res!632875 () Bool)

(declare-fun e!529269 () Bool)

(assert (=> start!80090 (=> (not res!632875) (not e!529269))))

(declare-datatypes ((V!32191 0))(
  ( (V!32192 (val!10260 Int)) )
))
(declare-datatypes ((ValueCell!9728 0))(
  ( (ValueCellFull!9728 (v!12791 V!32191)) (EmptyCell!9728) )
))
(declare-datatypes ((array!56790 0))(
  ( (array!56791 (arr!27328 (Array (_ BitVec 32) ValueCell!9728)) (size!27790 (_ BitVec 32))) )
))
(declare-datatypes ((array!56792 0))(
  ( (array!56793 (arr!27329 (Array (_ BitVec 32) (_ BitVec 64))) (size!27791 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4606 0))(
  ( (LongMapFixedSize!4607 (defaultEntry!5594 Int) (mask!27163 (_ BitVec 32)) (extraKeys!5326 (_ BitVec 32)) (zeroValue!5430 V!32191) (minValue!5430 V!32191) (_size!2358 (_ BitVec 32)) (_keys!10449 array!56792) (_values!5617 array!56790) (_vacant!2358 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4606)

(declare-fun valid!1764 (LongMapFixedSize!4606) Bool)

(assert (=> start!80090 (= res!632875 (valid!1764 thiss!1141))))

(assert (=> start!80090 e!529269))

(declare-fun e!529268 () Bool)

(assert (=> start!80090 e!529268))

(assert (=> start!80090 true))

(declare-fun b!941438 () Bool)

(declare-fun e!529265 () Bool)

(declare-fun e!529267 () Bool)

(declare-fun mapRes!32426 () Bool)

(assert (=> b!941438 (= e!529265 (and e!529267 mapRes!32426))))

(declare-fun condMapEmpty!32426 () Bool)

(declare-fun mapDefault!32426 () ValueCell!9728)

