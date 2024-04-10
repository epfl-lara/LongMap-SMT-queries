; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75938 () Bool)

(assert start!75938)

(declare-fun b!893333 () Bool)

(declare-fun b_free!15853 () Bool)

(declare-fun b_next!15853 () Bool)

(assert (=> b!893333 (= b_free!15853 (not b_next!15853))))

(declare-fun tp!55534 () Bool)

(declare-fun b_and!26115 () Bool)

(assert (=> b!893333 (= tp!55534 b_and!26115)))

(declare-fun b!893328 () Bool)

(declare-fun e!498881 () Bool)

(declare-fun e!498880 () Bool)

(declare-fun mapRes!28832 () Bool)

(assert (=> b!893328 (= e!498881 (and e!498880 mapRes!28832))))

(declare-fun condMapEmpty!28832 () Bool)

(declare-datatypes ((array!52346 0))(
  ( (array!52347 (arr!25177 (Array (_ BitVec 32) (_ BitVec 64))) (size!25621 (_ BitVec 32))) )
))
(declare-datatypes ((V!29207 0))(
  ( (V!29208 (val!9141 Int)) )
))
(declare-datatypes ((ValueCell!8609 0))(
  ( (ValueCellFull!8609 (v!11622 V!29207)) (EmptyCell!8609) )
))
(declare-datatypes ((array!52348 0))(
  ( (array!52349 (arr!25178 (Array (_ BitVec 32) ValueCell!8609)) (size!25622 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4234 0))(
  ( (LongMapFixedSize!4235 (defaultEntry!5317 Int) (mask!25848 (_ BitVec 32)) (extraKeys!5013 (_ BitVec 32)) (zeroValue!5117 V!29207) (minValue!5117 V!29207) (_size!2172 (_ BitVec 32)) (_keys!10004 array!52346) (_values!5304 array!52348) (_vacant!2172 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4234)

(declare-fun mapDefault!28832 () ValueCell!8609)

