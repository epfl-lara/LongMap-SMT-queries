; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73048 () Bool)

(assert start!73048)

(declare-fun b_free!13963 () Bool)

(declare-fun b_next!13963 () Bool)

(assert (=> start!73048 (= b_free!13963 (not b_next!13963))))

(declare-fun tp!49392 () Bool)

(declare-fun b_and!23085 () Bool)

(assert (=> start!73048 (= tp!49392 b_and!23085)))

(declare-fun b!849285 () Bool)

(declare-fun res!576969 () Bool)

(declare-fun e!473818 () Bool)

(assert (=> b!849285 (=> (not res!576969) (not e!473818))))

(declare-datatypes ((array!48404 0))(
  ( (array!48405 (arr!23233 (Array (_ BitVec 32) (_ BitVec 64))) (size!23673 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48404)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48404 (_ BitVec 32)) Bool)

(assert (=> b!849285 (= res!576969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!26513 0))(
  ( (V!26514 (val!8097 Int)) )
))
(declare-datatypes ((tuple2!10600 0))(
  ( (tuple2!10601 (_1!5311 (_ BitVec 64)) (_2!5311 V!26513)) )
))
(declare-datatypes ((List!16449 0))(
  ( (Nil!16446) (Cons!16445 (h!17576 tuple2!10600) (t!22858 List!16449)) )
))
(declare-datatypes ((ListLongMap!9369 0))(
  ( (ListLongMap!9370 (toList!4700 List!16449)) )
))
(declare-fun call!37744 () ListLongMap!9369)

(declare-fun v!557 () V!26513)

(declare-fun b!849286 () Bool)

(declare-fun e!473824 () Bool)

(declare-fun call!37745 () ListLongMap!9369)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2105 (ListLongMap!9369 tuple2!10600) ListLongMap!9369)

(assert (=> b!849286 (= e!473824 (= call!37745 (+!2105 call!37744 (tuple2!10601 k!854 v!557))))))

(declare-fun b!849287 () Bool)

(declare-fun res!576976 () Bool)

(assert (=> b!849287 (=> (not res!576976) (not e!473818))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7610 0))(
  ( (ValueCellFull!7610 (v!10522 V!26513)) (EmptyCell!7610) )
))
(declare-datatypes ((array!48406 0))(
  ( (array!48407 (arr!23234 (Array (_ BitVec 32) ValueCell!7610)) (size!23674 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48406)

(assert (=> b!849287 (= res!576976 (and (= (size!23674 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23673 _keys!868) (size!23674 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849288 () Bool)

(declare-fun e!473821 () Bool)

(declare-fun e!473823 () Bool)

(assert (=> b!849288 (= e!473821 (not e!473823))))

(declare-fun res!576977 () Bool)

(assert (=> b!849288 (=> res!576977 e!473823)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849288 (= res!576977 (not (validKeyInArray!0 (select (arr!23233 _keys!868) from!1053))))))

(assert (=> b!849288 e!473824))

(declare-fun c!91615 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849288 (= c!91615 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29001 0))(
  ( (Unit!29002) )
))
(declare-fun lt!382237 () Unit!29001)

(declare-fun minValue!654 () V!26513)

(declare-fun zeroValue!654 () V!26513)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!346 (array!48404 array!48406 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) (_ BitVec 64) V!26513 (_ BitVec 32) Int) Unit!29001)

(assert (=> b!849288 (= lt!382237 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!346 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576971 () Bool)

(assert (=> start!73048 (=> (not res!576971) (not e!473818))))

(assert (=> start!73048 (= res!576971 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23673 _keys!868))))))

(assert (=> start!73048 e!473818))

(declare-fun tp_is_empty!16099 () Bool)

(assert (=> start!73048 tp_is_empty!16099))

(assert (=> start!73048 true))

(assert (=> start!73048 tp!49392))

(declare-fun array_inv!18440 (array!48404) Bool)

(assert (=> start!73048 (array_inv!18440 _keys!868)))

(declare-fun e!473817 () Bool)

(declare-fun array_inv!18441 (array!48406) Bool)

(assert (=> start!73048 (and (array_inv!18441 _values!688) e!473817)))

(declare-fun mapIsEmpty!25748 () Bool)

(declare-fun mapRes!25748 () Bool)

(assert (=> mapIsEmpty!25748 mapRes!25748))

(declare-fun b!849289 () Bool)

(assert (=> b!849289 (= e!473824 (= call!37745 call!37744))))

(declare-fun b!849290 () Bool)

(assert (=> b!849290 (= e!473823 true)))

(declare-fun lt!382234 () array!48406)

(declare-fun lt!382235 () ListLongMap!9369)

(declare-fun getCurrentListMapNoExtraKeys!2682 (array!48404 array!48406 (_ BitVec 32) (_ BitVec 32) V!26513 V!26513 (_ BitVec 32) Int) ListLongMap!9369)

(declare-fun get!12228 (ValueCell!7610 V!26513) V!26513)

(declare-fun dynLambda!996 (Int (_ BitVec 64)) V!26513)

(assert (=> b!849290 (= lt!382235 (+!2105 (getCurrentListMapNoExtraKeys!2682 _keys!868 lt!382234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10601 (select (arr!23233 _keys!868) from!1053) (get!12228 (select (arr!23234 lt!382234) from!1053) (dynLambda!996 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849291 () Bool)

(declare-fun res!576968 () Bool)

(assert (=> b!849291 (=> (not res!576968) (not e!473818))))

(assert (=> b!849291 (= res!576968 (validKeyInArray!0 k!854))))

(declare-fun b!849292 () Bool)

(declare-fun e!473822 () Bool)

(assert (=> b!849292 (= e!473822 tp_is_empty!16099)))

(declare-fun mapNonEmpty!25748 () Bool)

(declare-fun tp!49393 () Bool)

(assert (=> mapNonEmpty!25748 (= mapRes!25748 (and tp!49393 e!473822))))

(declare-fun mapRest!25748 () (Array (_ BitVec 32) ValueCell!7610))

(declare-fun mapValue!25748 () ValueCell!7610)

(declare-fun mapKey!25748 () (_ BitVec 32))

(assert (=> mapNonEmpty!25748 (= (arr!23234 _values!688) (store mapRest!25748 mapKey!25748 mapValue!25748))))

(declare-fun b!849293 () Bool)

(declare-fun res!576975 () Bool)

(assert (=> b!849293 (=> (not res!576975) (not e!473818))))

(declare-datatypes ((List!16450 0))(
  ( (Nil!16447) (Cons!16446 (h!17577 (_ BitVec 64)) (t!22859 List!16450)) )
))
(declare-fun arrayNoDuplicates!0 (array!48404 (_ BitVec 32) List!16450) Bool)

(assert (=> b!849293 (= res!576975 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16447))))

(declare-fun b!849294 () Bool)

(assert (=> b!849294 (= e!473818 e!473821)))

(declare-fun res!576972 () Bool)

(assert (=> b!849294 (=> (not res!576972) (not e!473821))))

(assert (=> b!849294 (= res!576972 (= from!1053 i!612))))

(assert (=> b!849294 (= lt!382235 (getCurrentListMapNoExtraKeys!2682 _keys!868 lt!382234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849294 (= lt!382234 (array!48407 (store (arr!23234 _values!688) i!612 (ValueCellFull!7610 v!557)) (size!23674 _values!688)))))

(declare-fun lt!382236 () ListLongMap!9369)

(assert (=> b!849294 (= lt!382236 (getCurrentListMapNoExtraKeys!2682 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849295 () Bool)

(declare-fun e!473819 () Bool)

(assert (=> b!849295 (= e!473817 (and e!473819 mapRes!25748))))

(declare-fun condMapEmpty!25748 () Bool)

(declare-fun mapDefault!25748 () ValueCell!7610)

