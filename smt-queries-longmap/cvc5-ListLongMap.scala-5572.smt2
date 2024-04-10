; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73216 () Bool)

(assert start!73216)

(declare-fun b_free!14131 () Bool)

(declare-fun b_next!14131 () Bool)

(assert (=> start!73216 (= b_free!14131 (not b_next!14131))))

(declare-fun tp!49896 () Bool)

(declare-fun b_and!23421 () Bool)

(assert (=> start!73216 (= tp!49896 b_and!23421)))

(declare-fun b!853233 () Bool)

(declare-fun res!579489 () Bool)

(declare-fun e!475836 () Bool)

(assert (=> b!853233 (=> (not res!579489) (not e!475836))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48732 0))(
  ( (array!48733 (arr!23397 (Array (_ BitVec 32) (_ BitVec 64))) (size!23837 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48732)

(declare-datatypes ((V!26737 0))(
  ( (V!26738 (val!8181 Int)) )
))
(declare-datatypes ((ValueCell!7694 0))(
  ( (ValueCellFull!7694 (v!10606 V!26737)) (EmptyCell!7694) )
))
(declare-datatypes ((array!48734 0))(
  ( (array!48735 (arr!23398 (Array (_ BitVec 32) ValueCell!7694)) (size!23838 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48734)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!853233 (= res!579489 (and (= (size!23838 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23837 _keys!868) (size!23838 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853234 () Bool)

(declare-fun e!475838 () Bool)

(assert (=> b!853234 (= e!475836 e!475838)))

(declare-fun res!579496 () Bool)

(assert (=> b!853234 (=> (not res!579496) (not e!475838))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853234 (= res!579496 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384610 () array!48734)

(declare-fun minValue!654 () V!26737)

(declare-fun zeroValue!654 () V!26737)

(declare-datatypes ((tuple2!10752 0))(
  ( (tuple2!10753 (_1!5387 (_ BitVec 64)) (_2!5387 V!26737)) )
))
(declare-datatypes ((List!16579 0))(
  ( (Nil!16576) (Cons!16575 (h!17706 tuple2!10752) (t!23156 List!16579)) )
))
(declare-datatypes ((ListLongMap!9521 0))(
  ( (ListLongMap!9522 (toList!4776 List!16579)) )
))
(declare-fun lt!384604 () ListLongMap!9521)

(declare-fun getCurrentListMapNoExtraKeys!2757 (array!48732 array!48734 (_ BitVec 32) (_ BitVec 32) V!26737 V!26737 (_ BitVec 32) Int) ListLongMap!9521)

(assert (=> b!853234 (= lt!384604 (getCurrentListMapNoExtraKeys!2757 _keys!868 lt!384610 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26737)

(assert (=> b!853234 (= lt!384610 (array!48735 (store (arr!23398 _values!688) i!612 (ValueCellFull!7694 v!557)) (size!23838 _values!688)))))

(declare-fun lt!384607 () ListLongMap!9521)

(assert (=> b!853234 (= lt!384607 (getCurrentListMapNoExtraKeys!2757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38245 () Bool)

(declare-fun call!38249 () ListLongMap!9521)

(assert (=> bm!38245 (= call!38249 (getCurrentListMapNoExtraKeys!2757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853235 () Bool)

(declare-fun res!579490 () Bool)

(assert (=> b!853235 (=> (not res!579490) (not e!475836))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!853235 (= res!579490 (and (= (select (arr!23397 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!853236 () Bool)

(declare-fun res!579493 () Bool)

(assert (=> b!853236 (=> (not res!579493) (not e!475836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853236 (= res!579493 (validMask!0 mask!1196))))

(declare-fun call!38248 () ListLongMap!9521)

(declare-fun bm!38246 () Bool)

(assert (=> bm!38246 (= call!38248 (getCurrentListMapNoExtraKeys!2757 _keys!868 lt!384610 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853237 () Bool)

(declare-fun e!475835 () Bool)

(declare-fun tp_is_empty!16267 () Bool)

(assert (=> b!853237 (= e!475835 tp_is_empty!16267)))

(declare-fun mapIsEmpty!26000 () Bool)

(declare-fun mapRes!26000 () Bool)

(assert (=> mapIsEmpty!26000 mapRes!26000))

(declare-fun b!853238 () Bool)

(declare-fun e!475839 () Bool)

(assert (=> b!853238 (= e!475839 (and e!475835 mapRes!26000))))

(declare-fun condMapEmpty!26000 () Bool)

(declare-fun mapDefault!26000 () ValueCell!7694)

