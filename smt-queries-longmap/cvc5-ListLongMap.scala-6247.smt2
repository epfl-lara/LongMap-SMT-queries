; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79938 () Bool)

(assert start!79938)

(declare-fun b!939871 () Bool)

(declare-fun b_free!17803 () Bool)

(declare-fun b_next!17803 () Bool)

(assert (=> b!939871 (= b_free!17803 (not b_next!17803))))

(declare-fun tp!61880 () Bool)

(declare-fun b_and!29215 () Bool)

(assert (=> b!939871 (= tp!61880 b_and!29215)))

(declare-fun mapIsEmpty!32254 () Bool)

(declare-fun mapRes!32254 () Bool)

(assert (=> mapIsEmpty!32254 mapRes!32254))

(declare-fun b!939867 () Bool)

(declare-fun e!528007 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939867 (= e!528007 (not (validKeyInArray!0 key!756)))))

(declare-fun b!939868 () Bool)

(declare-fun res!632073 () Bool)

(assert (=> b!939868 (=> (not res!632073) (not e!528007))))

(assert (=> b!939868 (= res!632073 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939869 () Bool)

(declare-fun e!528003 () Bool)

(declare-fun e!528002 () Bool)

(assert (=> b!939869 (= e!528003 (and e!528002 mapRes!32254))))

(declare-fun condMapEmpty!32254 () Bool)

(declare-datatypes ((V!32047 0))(
  ( (V!32048 (val!10206 Int)) )
))
(declare-datatypes ((ValueCell!9674 0))(
  ( (ValueCellFull!9674 (v!12737 V!32047)) (EmptyCell!9674) )
))
(declare-datatypes ((array!56568 0))(
  ( (array!56569 (arr!27220 (Array (_ BitVec 32) ValueCell!9674)) (size!27681 (_ BitVec 32))) )
))
(declare-datatypes ((array!56570 0))(
  ( (array!56571 (arr!27221 (Array (_ BitVec 32) (_ BitVec 64))) (size!27682 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4498 0))(
  ( (LongMapFixedSize!4499 (defaultEntry!5540 Int) (mask!27064 (_ BitVec 32)) (extraKeys!5272 (_ BitVec 32)) (zeroValue!5376 V!32047) (minValue!5376 V!32047) (_size!2304 (_ BitVec 32)) (_keys!10390 array!56570) (_values!5563 array!56568) (_vacant!2304 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4498)

(declare-fun mapDefault!32254 () ValueCell!9674)

