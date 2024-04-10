; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89360 () Bool)

(assert start!89360)

(declare-fun b!1024302 () Bool)

(declare-fun b_free!20359 () Bool)

(declare-fun b_next!20359 () Bool)

(assert (=> b!1024302 (= b_free!20359 (not b_next!20359))))

(declare-fun tp!72122 () Bool)

(declare-fun b_and!32605 () Bool)

(assert (=> b!1024302 (= tp!72122 b_and!32605)))

(declare-fun b!1024297 () Bool)

(declare-fun e!577359 () Bool)

(declare-fun e!577361 () Bool)

(declare-fun mapRes!37547 () Bool)

(assert (=> b!1024297 (= e!577359 (and e!577361 mapRes!37547))))

(declare-fun condMapEmpty!37547 () Bool)

(declare-datatypes ((V!36979 0))(
  ( (V!36980 (val!12090 Int)) )
))
(declare-datatypes ((ValueCell!11336 0))(
  ( (ValueCellFull!11336 (v!14659 V!36979)) (EmptyCell!11336) )
))
(declare-datatypes ((array!64208 0))(
  ( (array!64209 (arr!30913 (Array (_ BitVec 32) (_ BitVec 64))) (size!31426 (_ BitVec 32))) )
))
(declare-datatypes ((array!64210 0))(
  ( (array!64211 (arr!30914 (Array (_ BitVec 32) ValueCell!11336)) (size!31427 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5266 0))(
  ( (LongMapFixedSize!5267 (defaultEntry!5985 Int) (mask!29633 (_ BitVec 32)) (extraKeys!5717 (_ BitVec 32)) (zeroValue!5821 V!36979) (minValue!5821 V!36979) (_size!2688 (_ BitVec 32)) (_keys!11132 array!64208) (_values!6008 array!64210) (_vacant!2688 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5266)

(declare-fun mapDefault!37547 () ValueCell!11336)

