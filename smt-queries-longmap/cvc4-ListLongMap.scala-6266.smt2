; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80124 () Bool)

(assert start!80124)

(declare-fun b!941693 () Bool)

(declare-fun b_free!17921 () Bool)

(declare-fun b_next!17921 () Bool)

(assert (=> b!941693 (= b_free!17921 (not b_next!17921))))

(declare-fun tp!62248 () Bool)

(declare-fun b_and!29333 () Bool)

(assert (=> b!941693 (= tp!62248 b_and!29333)))

(declare-fun b!941691 () Bool)

(declare-fun res!632979 () Bool)

(declare-fun e!529432 () Bool)

(assert (=> b!941691 (=> (not res!632979) (not e!529432))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941691 (= res!632979 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941692 () Bool)

(declare-fun e!529428 () Bool)

(declare-fun e!529433 () Bool)

(declare-fun mapRes!32445 () Bool)

(assert (=> b!941692 (= e!529428 (and e!529433 mapRes!32445))))

(declare-fun condMapEmpty!32445 () Bool)

(declare-datatypes ((V!32203 0))(
  ( (V!32204 (val!10265 Int)) )
))
(declare-datatypes ((ValueCell!9733 0))(
  ( (ValueCellFull!9733 (v!12796 V!32203)) (EmptyCell!9733) )
))
(declare-datatypes ((array!56812 0))(
  ( (array!56813 (arr!27338 (Array (_ BitVec 32) ValueCell!9733)) (size!27801 (_ BitVec 32))) )
))
(declare-datatypes ((array!56814 0))(
  ( (array!56815 (arr!27339 (Array (_ BitVec 32) (_ BitVec 64))) (size!27802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4616 0))(
  ( (LongMapFixedSize!4617 (defaultEntry!5599 Int) (mask!27176 (_ BitVec 32)) (extraKeys!5331 (_ BitVec 32)) (zeroValue!5435 V!32203) (minValue!5435 V!32203) (_size!2363 (_ BitVec 32)) (_keys!10458 array!56814) (_values!5622 array!56812) (_vacant!2363 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4616)

(declare-fun mapDefault!32445 () ValueCell!9733)

