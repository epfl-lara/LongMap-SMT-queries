; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40028 () Bool)

(assert start!40028)

(declare-fun b_free!10295 () Bool)

(declare-fun b_next!10295 () Bool)

(assert (=> start!40028 (= b_free!10295 (not b_next!10295))))

(declare-fun tp!36413 () Bool)

(declare-fun b_and!18249 () Bool)

(assert (=> start!40028 (= tp!36413 b_and!18249)))

(declare-fun b!436346 () Bool)

(declare-fun e!257684 () Bool)

(declare-fun tp_is_empty!11447 () Bool)

(assert (=> b!436346 (= e!257684 tp_is_empty!11447)))

(declare-fun b!436347 () Bool)

(declare-datatypes ((Unit!12976 0))(
  ( (Unit!12977) )
))
(declare-fun e!257691 () Unit!12976)

(declare-fun Unit!12978 () Unit!12976)

(assert (=> b!436347 (= e!257691 Unit!12978)))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26719 0))(
  ( (array!26720 (arr!12809 (Array (_ BitVec 32) (_ BitVec 64))) (size!13161 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26719)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!201154 () Unit!12976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26719 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12976)

(assert (=> b!436347 (= lt!201154 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436347 false))

(declare-fun b!436348 () Bool)

(declare-fun e!257683 () Bool)

(declare-fun e!257688 () Bool)

(assert (=> b!436348 (= e!257683 (not e!257688))))

(declare-fun res!257206 () Bool)

(assert (=> b!436348 (=> res!257206 e!257688)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436348 (= res!257206 (not (validKeyInArray!0 (select (arr!12809 _keys!709) from!863))))))

(declare-datatypes ((V!16367 0))(
  ( (V!16368 (val!5768 Int)) )
))
(declare-datatypes ((tuple2!7642 0))(
  ( (tuple2!7643 (_1!3832 (_ BitVec 64)) (_2!3832 V!16367)) )
))
(declare-datatypes ((List!7643 0))(
  ( (Nil!7640) (Cons!7639 (h!8495 tuple2!7642) (t!13387 List!7643)) )
))
(declare-datatypes ((ListLongMap!6555 0))(
  ( (ListLongMap!6556 (toList!3293 List!7643)) )
))
(declare-fun lt!201145 () ListLongMap!6555)

(declare-fun lt!201152 () ListLongMap!6555)

(assert (=> b!436348 (= lt!201145 lt!201152)))

(declare-fun lt!201142 () ListLongMap!6555)

(declare-fun lt!201149 () tuple2!7642)

(declare-fun +!1441 (ListLongMap!6555 tuple2!7642) ListLongMap!6555)

(assert (=> b!436348 (= lt!201152 (+!1441 lt!201142 lt!201149))))

(declare-fun minValue!515 () V!16367)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201151 () array!26719)

(declare-fun zeroValue!515 () V!16367)

(declare-datatypes ((ValueCell!5380 0))(
  ( (ValueCellFull!5380 (v!8015 V!16367)) (EmptyCell!5380) )
))
(declare-datatypes ((array!26721 0))(
  ( (array!26722 (arr!12810 (Array (_ BitVec 32) ValueCell!5380)) (size!13162 (_ BitVec 32))) )
))
(declare-fun lt!201153 () array!26721)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1483 (array!26719 array!26721 (_ BitVec 32) (_ BitVec 32) V!16367 V!16367 (_ BitVec 32) Int) ListLongMap!6555)

(assert (=> b!436348 (= lt!201145 (getCurrentListMapNoExtraKeys!1483 lt!201151 lt!201153 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16367)

(assert (=> b!436348 (= lt!201149 (tuple2!7643 k!794 v!412))))

(declare-fun _values!549 () array!26721)

(assert (=> b!436348 (= lt!201142 (getCurrentListMapNoExtraKeys!1483 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!201141 () Unit!12976)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!612 (array!26719 array!26721 (_ BitVec 32) (_ BitVec 32) V!16367 V!16367 (_ BitVec 32) (_ BitVec 64) V!16367 (_ BitVec 32) Int) Unit!12976)

(assert (=> b!436348 (= lt!201141 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!612 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436349 () Bool)

(declare-fun res!257214 () Bool)

(declare-fun e!257689 () Bool)

(assert (=> b!436349 (=> (not res!257214) (not e!257689))))

(declare-fun arrayContainsKey!0 (array!26719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436349 (= res!257214 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18792 () Bool)

(declare-fun mapRes!18792 () Bool)

(assert (=> mapIsEmpty!18792 mapRes!18792))

(declare-fun b!436350 () Bool)

(declare-fun e!257685 () Bool)

(assert (=> b!436350 (= e!257685 e!257683)))

(declare-fun res!257210 () Bool)

(assert (=> b!436350 (=> (not res!257210) (not e!257683))))

(assert (=> b!436350 (= res!257210 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201143 () ListLongMap!6555)

(assert (=> b!436350 (= lt!201143 (getCurrentListMapNoExtraKeys!1483 lt!201151 lt!201153 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436350 (= lt!201153 (array!26722 (store (arr!12810 _values!549) i!563 (ValueCellFull!5380 v!412)) (size!13162 _values!549)))))

(declare-fun lt!201147 () ListLongMap!6555)

(assert (=> b!436350 (= lt!201147 (getCurrentListMapNoExtraKeys!1483 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436351 () Bool)

(declare-fun res!257216 () Bool)

(assert (=> b!436351 (=> (not res!257216) (not e!257689))))

(assert (=> b!436351 (= res!257216 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!18792 () Bool)

(declare-fun tp!36414 () Bool)

(assert (=> mapNonEmpty!18792 (= mapRes!18792 (and tp!36414 e!257684))))

(declare-fun mapRest!18792 () (Array (_ BitVec 32) ValueCell!5380))

(declare-fun mapKey!18792 () (_ BitVec 32))

(declare-fun mapValue!18792 () ValueCell!5380)

(assert (=> mapNonEmpty!18792 (= (arr!12810 _values!549) (store mapRest!18792 mapKey!18792 mapValue!18792))))

(declare-fun b!436352 () Bool)

(declare-fun res!257211 () Bool)

(assert (=> b!436352 (=> (not res!257211) (not e!257689))))

(assert (=> b!436352 (= res!257211 (or (= (select (arr!12809 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12809 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436353 () Bool)

(declare-fun e!257687 () Bool)

(assert (=> b!436353 (= e!257687 tp_is_empty!11447)))

(declare-fun b!436354 () Bool)

(declare-fun e!257682 () Bool)

(assert (=> b!436354 (= e!257682 (and e!257687 mapRes!18792))))

(declare-fun condMapEmpty!18792 () Bool)

(declare-fun mapDefault!18792 () ValueCell!5380)

