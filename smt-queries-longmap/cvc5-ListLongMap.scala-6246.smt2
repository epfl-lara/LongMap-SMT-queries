; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79916 () Bool)

(assert start!79916)

(declare-fun b!939736 () Bool)

(declare-fun b_free!17797 () Bool)

(declare-fun b_next!17797 () Bool)

(assert (=> b!939736 (= b_free!17797 (not b_next!17797))))

(declare-fun tp!61859 () Bool)

(declare-fun b_and!29209 () Bool)

(assert (=> b!939736 (= tp!61859 b_and!29209)))

(declare-fun b!939732 () Bool)

(declare-fun res!632006 () Bool)

(declare-fun e!527909 () Bool)

(assert (=> b!939732 (=> (not res!632006) (not e!527909))))

(declare-datatypes ((V!32039 0))(
  ( (V!32040 (val!10203 Int)) )
))
(declare-datatypes ((ValueCell!9671 0))(
  ( (ValueCellFull!9671 (v!12734 V!32039)) (EmptyCell!9671) )
))
(declare-datatypes ((array!56554 0))(
  ( (array!56555 (arr!27214 (Array (_ BitVec 32) ValueCell!9671)) (size!27674 (_ BitVec 32))) )
))
(declare-datatypes ((array!56556 0))(
  ( (array!56557 (arr!27215 (Array (_ BitVec 32) (_ BitVec 64))) (size!27675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4492 0))(
  ( (LongMapFixedSize!4493 (defaultEntry!5537 Int) (mask!27057 (_ BitVec 32)) (extraKeys!5269 (_ BitVec 32)) (zeroValue!5373 V!32039) (minValue!5373 V!32039) (_size!2301 (_ BitVec 32)) (_keys!10386 array!56556) (_values!5560 array!56554) (_vacant!2301 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4492)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939732 (= res!632006 (validMask!0 (mask!27057 thiss!1141)))))

(declare-fun b!939733 () Bool)

(declare-fun e!527912 () Bool)

(declare-fun e!527911 () Bool)

(declare-fun mapRes!32241 () Bool)

(assert (=> b!939733 (= e!527912 (and e!527911 mapRes!32241))))

(declare-fun condMapEmpty!32241 () Bool)

(declare-fun mapDefault!32241 () ValueCell!9671)

