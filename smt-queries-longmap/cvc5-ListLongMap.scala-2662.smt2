; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39790 () Bool)

(assert start!39790)

(declare-fun b_free!10057 () Bool)

(declare-fun b_next!10057 () Bool)

(assert (=> start!39790 (= b_free!10057 (not b_next!10057))))

(declare-fun tp!35700 () Bool)

(declare-fun b_and!17773 () Bool)

(assert (=> start!39790 (= tp!35700 b_and!17773)))

(declare-fun mapNonEmpty!18435 () Bool)

(declare-fun mapRes!18435 () Bool)

(declare-fun tp!35699 () Bool)

(declare-fun e!254165 () Bool)

(assert (=> mapNonEmpty!18435 (= mapRes!18435 (and tp!35699 e!254165))))

(declare-datatypes ((V!16051 0))(
  ( (V!16052 (val!5649 Int)) )
))
(declare-datatypes ((ValueCell!5261 0))(
  ( (ValueCellFull!5261 (v!7896 V!16051)) (EmptyCell!5261) )
))
(declare-datatypes ((array!26255 0))(
  ( (array!26256 (arr!12577 (Array (_ BitVec 32) ValueCell!5261)) (size!12929 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26255)

(declare-fun mapValue!18435 () ValueCell!5261)

(declare-fun mapKey!18435 () (_ BitVec 32))

(declare-fun mapRest!18435 () (Array (_ BitVec 32) ValueCell!5261))

(assert (=> mapNonEmpty!18435 (= (arr!12577 _values!549) (store mapRest!18435 mapKey!18435 mapValue!18435))))

(declare-fun b!429020 () Bool)

(declare-fun res!251906 () Bool)

(declare-fun e!254168 () Bool)

(assert (=> b!429020 (=> (not res!251906) (not e!254168))))

(declare-datatypes ((array!26257 0))(
  ( (array!26258 (arr!12578 (Array (_ BitVec 32) (_ BitVec 64))) (size!12930 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26257)

(declare-datatypes ((List!7454 0))(
  ( (Nil!7451) (Cons!7450 (h!8306 (_ BitVec 64)) (t!12960 List!7454)) )
))
(declare-fun arrayNoDuplicates!0 (array!26257 (_ BitVec 32) List!7454) Bool)

(assert (=> b!429020 (= res!251906 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7451))))

(declare-fun b!429021 () Bool)

(declare-fun e!254166 () Bool)

(declare-fun e!254170 () Bool)

(assert (=> b!429021 (= e!254166 e!254170)))

(declare-fun res!251913 () Bool)

(assert (=> b!429021 (=> (not res!251913) (not e!254170))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429021 (= res!251913 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196051 () array!26257)

(declare-fun minValue!515 () V!16051)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16051)

(declare-fun lt!196048 () array!26255)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7440 0))(
  ( (tuple2!7441 (_1!3731 (_ BitVec 64)) (_2!3731 V!16051)) )
))
(declare-datatypes ((List!7455 0))(
  ( (Nil!7452) (Cons!7451 (h!8307 tuple2!7440) (t!12961 List!7455)) )
))
(declare-datatypes ((ListLongMap!6353 0))(
  ( (ListLongMap!6354 (toList!3192 List!7455)) )
))
(declare-fun lt!196054 () ListLongMap!6353)

(declare-fun getCurrentListMapNoExtraKeys!1394 (array!26257 array!26255 (_ BitVec 32) (_ BitVec 32) V!16051 V!16051 (_ BitVec 32) Int) ListLongMap!6353)

(assert (=> b!429021 (= lt!196054 (getCurrentListMapNoExtraKeys!1394 lt!196051 lt!196048 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16051)

(assert (=> b!429021 (= lt!196048 (array!26256 (store (arr!12577 _values!549) i!563 (ValueCellFull!5261 v!412)) (size!12929 _values!549)))))

(declare-fun lt!196046 () ListLongMap!6353)

(assert (=> b!429021 (= lt!196046 (getCurrentListMapNoExtraKeys!1394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429022 () Bool)

(declare-fun res!251907 () Bool)

(assert (=> b!429022 (=> (not res!251907) (not e!254166))))

(assert (=> b!429022 (= res!251907 (bvsle from!863 i!563))))

(declare-fun b!429023 () Bool)

(declare-fun tp_is_empty!11209 () Bool)

(assert (=> b!429023 (= e!254165 tp_is_empty!11209)))

(declare-fun b!429024 () Bool)

(declare-fun e!254167 () Bool)

(declare-fun e!254171 () Bool)

(assert (=> b!429024 (= e!254167 (and e!254171 mapRes!18435))))

(declare-fun condMapEmpty!18435 () Bool)

(declare-fun mapDefault!18435 () ValueCell!5261)

