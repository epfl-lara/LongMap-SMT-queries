; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73226 () Bool)

(assert start!73226)

(declare-fun b_free!14141 () Bool)

(declare-fun b_next!14141 () Bool)

(assert (=> start!73226 (= b_free!14141 (not b_next!14141))))

(declare-fun tp!49927 () Bool)

(declare-fun b_and!23441 () Bool)

(assert (=> start!73226 (= tp!49927 b_and!23441)))

(declare-fun b!853468 () Bool)

(declare-fun e!475957 () Bool)

(declare-fun tp_is_empty!16277 () Bool)

(assert (=> b!853468 (= e!475957 tp_is_empty!16277)))

(declare-fun b!853469 () Bool)

(declare-fun e!475959 () Bool)

(declare-datatypes ((V!26749 0))(
  ( (V!26750 (val!8186 Int)) )
))
(declare-datatypes ((tuple2!10762 0))(
  ( (tuple2!10763 (_1!5392 (_ BitVec 64)) (_2!5392 V!26749)) )
))
(declare-datatypes ((List!16588 0))(
  ( (Nil!16585) (Cons!16584 (h!17715 tuple2!10762) (t!23175 List!16588)) )
))
(declare-datatypes ((ListLongMap!9531 0))(
  ( (ListLongMap!9532 (toList!4781 List!16588)) )
))
(declare-fun call!38278 () ListLongMap!9531)

(declare-fun call!38279 () ListLongMap!9531)

(assert (=> b!853469 (= e!475959 (= call!38278 call!38279))))

(declare-datatypes ((ValueCell!7699 0))(
  ( (ValueCellFull!7699 (v!10611 V!26749)) (EmptyCell!7699) )
))
(declare-datatypes ((array!48752 0))(
  ( (array!48753 (arr!23407 (Array (_ BitVec 32) ValueCell!7699)) (size!23847 (_ BitVec 32))) )
))
(declare-fun lt!384755 () array!48752)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38275 () Bool)

(declare-datatypes ((array!48754 0))(
  ( (array!48755 (arr!23408 (Array (_ BitVec 32) (_ BitVec 64))) (size!23848 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48754)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26749)

(declare-fun zeroValue!654 () V!26749)

(declare-fun getCurrentListMapNoExtraKeys!2762 (array!48754 array!48752 (_ BitVec 32) (_ BitVec 32) V!26749 V!26749 (_ BitVec 32) Int) ListLongMap!9531)

(assert (=> bm!38275 (= call!38278 (getCurrentListMapNoExtraKeys!2762 _keys!868 lt!384755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26015 () Bool)

(declare-fun mapRes!26015 () Bool)

(assert (=> mapIsEmpty!26015 mapRes!26015))

(declare-fun b!853470 () Bool)

(declare-fun e!475960 () Bool)

(assert (=> b!853470 (= e!475960 true)))

(declare-fun lt!384761 () ListLongMap!9531)

(declare-fun lt!384760 () V!26749)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!384763 () tuple2!10762)

(declare-fun +!2173 (ListLongMap!9531 tuple2!10762) ListLongMap!9531)

(assert (=> b!853470 (= (+!2173 lt!384761 lt!384763) (+!2173 (+!2173 lt!384761 (tuple2!10763 k!854 lt!384760)) lt!384763))))

(declare-fun lt!384756 () V!26749)

(assert (=> b!853470 (= lt!384763 (tuple2!10763 k!854 lt!384756))))

(declare-datatypes ((Unit!29129 0))(
  ( (Unit!29130) )
))
(declare-fun lt!384762 () Unit!29129)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!300 (ListLongMap!9531 (_ BitVec 64) V!26749 V!26749) Unit!29129)

(assert (=> b!853470 (= lt!384762 (addSameAsAddTwiceSameKeyDiffValues!300 lt!384761 k!854 lt!384760 lt!384756))))

(declare-fun lt!384758 () V!26749)

(declare-fun _values!688 () array!48752)

(declare-fun get!12344 (ValueCell!7699 V!26749) V!26749)

(assert (=> b!853470 (= lt!384760 (get!12344 (select (arr!23407 _values!688) from!1053) lt!384758))))

(declare-fun lt!384759 () ListLongMap!9531)

(assert (=> b!853470 (= lt!384759 (+!2173 lt!384761 (tuple2!10763 (select (arr!23408 _keys!868) from!1053) lt!384756)))))

(declare-fun v!557 () V!26749)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853470 (= lt!384756 (get!12344 (select (store (arr!23407 _values!688) i!612 (ValueCellFull!7699 v!557)) from!1053) lt!384758))))

(declare-fun dynLambda!1054 (Int (_ BitVec 64)) V!26749)

(assert (=> b!853470 (= lt!384758 (dynLambda!1054 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853470 (= lt!384761 (getCurrentListMapNoExtraKeys!2762 _keys!868 lt!384755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853471 () Bool)

(declare-fun res!579640 () Bool)

(declare-fun e!475954 () Bool)

(assert (=> b!853471 (=> (not res!579640) (not e!475954))))

(assert (=> b!853471 (= res!579640 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23848 _keys!868))))))

(declare-fun b!853473 () Bool)

(declare-fun res!579647 () Bool)

(assert (=> b!853473 (=> (not res!579647) (not e!475954))))

(assert (=> b!853473 (= res!579647 (and (= (size!23847 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23848 _keys!868) (size!23847 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853474 () Bool)

(declare-fun res!579642 () Bool)

(assert (=> b!853474 (=> (not res!579642) (not e!475954))))

(assert (=> b!853474 (= res!579642 (and (= (select (arr!23408 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853475 () Bool)

(declare-fun e!475953 () Bool)

(assert (=> b!853475 (= e!475953 (and e!475957 mapRes!26015))))

(declare-fun condMapEmpty!26015 () Bool)

(declare-fun mapDefault!26015 () ValueCell!7699)

