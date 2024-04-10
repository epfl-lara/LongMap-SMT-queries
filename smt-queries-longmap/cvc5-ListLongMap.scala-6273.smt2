; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80260 () Bool)

(assert start!80260)

(declare-fun b!942713 () Bool)

(declare-fun b_free!17959 () Bool)

(declare-fun b_next!17959 () Bool)

(assert (=> b!942713 (= b_free!17959 (not b_next!17959))))

(declare-fun tp!62383 () Bool)

(declare-fun b_and!29371 () Bool)

(assert (=> b!942713 (= tp!62383 b_and!29371)))

(declare-fun b!942706 () Bool)

(declare-fun res!633460 () Bool)

(declare-fun e!530044 () Bool)

(assert (=> b!942706 (=> (not res!633460) (not e!530044))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942706 (= res!633460 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942707 () Bool)

(declare-fun e!530046 () Bool)

(declare-fun e!530045 () Bool)

(declare-fun mapRes!32522 () Bool)

(assert (=> b!942707 (= e!530046 (and e!530045 mapRes!32522))))

(declare-fun condMapEmpty!32522 () Bool)

(declare-datatypes ((V!32255 0))(
  ( (V!32256 (val!10284 Int)) )
))
(declare-datatypes ((ValueCell!9752 0))(
  ( (ValueCellFull!9752 (v!12815 V!32255)) (EmptyCell!9752) )
))
(declare-datatypes ((array!56900 0))(
  ( (array!56901 (arr!27376 (Array (_ BitVec 32) ValueCell!9752)) (size!27841 (_ BitVec 32))) )
))
(declare-datatypes ((array!56902 0))(
  ( (array!56903 (arr!27377 (Array (_ BitVec 32) (_ BitVec 64))) (size!27842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4654 0))(
  ( (LongMapFixedSize!4655 (defaultEntry!5618 Int) (mask!27232 (_ BitVec 32)) (extraKeys!5350 (_ BitVec 32)) (zeroValue!5454 V!32255) (minValue!5454 V!32255) (_size!2382 (_ BitVec 32)) (_keys!10492 array!56902) (_values!5641 array!56900) (_vacant!2382 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4654)

(declare-fun mapDefault!32522 () ValueCell!9752)

