; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79978 () Bool)

(assert start!79978)

(declare-fun b!940183 () Bool)

(declare-fun b_free!17833 () Bool)

(declare-fun b_next!17833 () Bool)

(assert (=> b!940183 (= b_free!17833 (not b_next!17833))))

(declare-fun tp!61973 () Bool)

(declare-fun b_and!29245 () Bool)

(assert (=> b!940183 (= tp!61973 b_and!29245)))

(declare-fun mapIsEmpty!32302 () Bool)

(declare-fun mapRes!32302 () Bool)

(assert (=> mapIsEmpty!32302 mapRes!32302))

(declare-fun b!940176 () Bool)

(declare-fun e!528287 () Bool)

(declare-fun tp_is_empty!20341 () Bool)

(assert (=> b!940176 (= e!528287 tp_is_empty!20341)))

(declare-fun b!940177 () Bool)

(declare-fun e!528290 () Bool)

(assert (=> b!940177 (= e!528290 (and e!528287 mapRes!32302))))

(declare-fun condMapEmpty!32302 () Bool)

(declare-datatypes ((V!32087 0))(
  ( (V!32088 (val!10221 Int)) )
))
(declare-datatypes ((ValueCell!9689 0))(
  ( (ValueCellFull!9689 (v!12752 V!32087)) (EmptyCell!9689) )
))
(declare-datatypes ((array!56630 0))(
  ( (array!56631 (arr!27250 (Array (_ BitVec 32) ValueCell!9689)) (size!27711 (_ BitVec 32))) )
))
(declare-datatypes ((array!56632 0))(
  ( (array!56633 (arr!27251 (Array (_ BitVec 32) (_ BitVec 64))) (size!27712 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4528 0))(
  ( (LongMapFixedSize!4529 (defaultEntry!5555 Int) (mask!27090 (_ BitVec 32)) (extraKeys!5287 (_ BitVec 32)) (zeroValue!5391 V!32087) (minValue!5391 V!32087) (_size!2319 (_ BitVec 32)) (_keys!10405 array!56632) (_values!5578 array!56630) (_vacant!2319 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4528)

(declare-fun mapDefault!32302 () ValueCell!9689)

