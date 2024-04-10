; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73588 () Bool)

(assert start!73588)

(declare-fun b_free!14503 () Bool)

(declare-fun b_next!14503 () Bool)

(assert (=> start!73588 (= b_free!14503 (not b_next!14503))))

(declare-fun tp!51013 () Bool)

(declare-fun b_and!23985 () Bool)

(assert (=> start!73588 (= tp!51013 b_and!23985)))

(declare-fun b!860904 () Bool)

(declare-fun e!479694 () Bool)

(declare-fun tp_is_empty!16639 () Bool)

(assert (=> b!860904 (= e!479694 tp_is_empty!16639)))

(declare-fun b!860905 () Bool)

(declare-datatypes ((Unit!29351 0))(
  ( (Unit!29352) )
))
(declare-fun e!479696 () Unit!29351)

(declare-fun Unit!29353 () Unit!29351)

(assert (=> b!860905 (= e!479696 Unit!29353)))

(declare-fun lt!388118 () Unit!29351)

(declare-datatypes ((array!49450 0))(
  ( (array!49451 (arr!23756 (Array (_ BitVec 32) (_ BitVec 64))) (size!24196 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49450)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49450 (_ BitVec 32) (_ BitVec 32)) Unit!29351)

(assert (=> b!860905 (= lt!388118 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16867 0))(
  ( (Nil!16864) (Cons!16863 (h!17994 (_ BitVec 64)) (t!23636 List!16867)) )
))
(declare-fun arrayNoDuplicates!0 (array!49450 (_ BitVec 32) List!16867) Bool)

(assert (=> b!860905 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16864)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!388124 () Unit!29351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49450 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29351)

(assert (=> b!860905 (= lt!388124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860905 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388119 () Unit!29351)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49450 (_ BitVec 64) (_ BitVec 32) List!16867) Unit!29351)

(assert (=> b!860905 (= lt!388119 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16864))))

(assert (=> b!860905 false))

(declare-fun b!860906 () Bool)

(declare-fun e!479699 () Bool)

(assert (=> b!860906 (= e!479699 tp_is_empty!16639)))

(declare-fun mapNonEmpty!26558 () Bool)

(declare-fun mapRes!26558 () Bool)

(declare-fun tp!51012 () Bool)

(assert (=> mapNonEmpty!26558 (= mapRes!26558 (and tp!51012 e!479694))))

(declare-fun mapKey!26558 () (_ BitVec 32))

(declare-datatypes ((V!27233 0))(
  ( (V!27234 (val!8367 Int)) )
))
(declare-datatypes ((ValueCell!7880 0))(
  ( (ValueCellFull!7880 (v!10792 V!27233)) (EmptyCell!7880) )
))
(declare-fun mapValue!26558 () ValueCell!7880)

(declare-fun mapRest!26558 () (Array (_ BitVec 32) ValueCell!7880))

(declare-datatypes ((array!49452 0))(
  ( (array!49453 (arr!23757 (Array (_ BitVec 32) ValueCell!7880)) (size!24197 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49452)

(assert (=> mapNonEmpty!26558 (= (arr!23757 _values!688) (store mapRest!26558 mapKey!26558 mapValue!26558))))

(declare-fun b!860907 () Bool)

(declare-fun e!479697 () Bool)

(declare-fun e!479695 () Bool)

(assert (=> b!860907 (= e!479697 e!479695)))

(declare-fun res!585084 () Bool)

(assert (=> b!860907 (=> (not res!585084) (not e!479695))))

(assert (=> b!860907 (= res!585084 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11058 0))(
  ( (tuple2!11059 (_1!5540 (_ BitVec 64)) (_2!5540 V!27233)) )
))
(declare-datatypes ((List!16868 0))(
  ( (Nil!16865) (Cons!16864 (h!17995 tuple2!11058) (t!23637 List!16868)) )
))
(declare-datatypes ((ListLongMap!9827 0))(
  ( (ListLongMap!9828 (toList!4929 List!16868)) )
))
(declare-fun lt!388126 () ListLongMap!9827)

(declare-fun minValue!654 () V!27233)

(declare-fun zeroValue!654 () V!27233)

(declare-fun lt!388121 () array!49452)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2906 (array!49450 array!49452 (_ BitVec 32) (_ BitVec 32) V!27233 V!27233 (_ BitVec 32) Int) ListLongMap!9827)

(assert (=> b!860907 (= lt!388126 (getCurrentListMapNoExtraKeys!2906 _keys!868 lt!388121 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27233)

(assert (=> b!860907 (= lt!388121 (array!49453 (store (arr!23757 _values!688) i!612 (ValueCellFull!7880 v!557)) (size!24197 _values!688)))))

(declare-fun lt!388122 () ListLongMap!9827)

(assert (=> b!860907 (= lt!388122 (getCurrentListMapNoExtraKeys!2906 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860908 () Bool)

(declare-fun Unit!29354 () Unit!29351)

(assert (=> b!860908 (= e!479696 Unit!29354)))

(declare-fun b!860909 () Bool)

(declare-fun res!585085 () Bool)

(assert (=> b!860909 (=> (not res!585085) (not e!479697))))

(assert (=> b!860909 (= res!585085 (and (= (select (arr!23756 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!860910 () Bool)

(declare-fun e!479701 () Bool)

(assert (=> b!860910 (= e!479701 (and e!479699 mapRes!26558))))

(declare-fun condMapEmpty!26558 () Bool)

(declare-fun mapDefault!26558 () ValueCell!7880)

