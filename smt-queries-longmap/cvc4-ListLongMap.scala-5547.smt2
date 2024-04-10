; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73070 () Bool)

(assert start!73070)

(declare-fun b_free!13985 () Bool)

(declare-fun b_next!13985 () Bool)

(assert (=> start!73070 (= b_free!13985 (not b_next!13985))))

(declare-fun tp!49458 () Bool)

(declare-fun b_and!23129 () Bool)

(assert (=> start!73070 (= tp!49458 b_and!23129)))

(declare-fun b!849802 () Bool)

(declare-fun res!577302 () Bool)

(declare-fun e!474085 () Bool)

(assert (=> b!849802 (=> (not res!577302) (not e!474085))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849802 (= res!577302 (validMask!0 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26541 0))(
  ( (V!26542 (val!8108 Int)) )
))
(declare-datatypes ((tuple2!10620 0))(
  ( (tuple2!10621 (_1!5321 (_ BitVec 64)) (_2!5321 V!26541)) )
))
(declare-datatypes ((List!16467 0))(
  ( (Nil!16464) (Cons!16463 (h!17594 tuple2!10620) (t!22898 List!16467)) )
))
(declare-datatypes ((ListLongMap!9389 0))(
  ( (ListLongMap!9390 (toList!4710 List!16467)) )
))
(declare-fun call!37811 () ListLongMap!9389)

(declare-fun bm!37807 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7621 0))(
  ( (ValueCellFull!7621 (v!10533 V!26541)) (EmptyCell!7621) )
))
(declare-datatypes ((array!48448 0))(
  ( (array!48449 (arr!23255 (Array (_ BitVec 32) ValueCell!7621)) (size!23695 (_ BitVec 32))) )
))
(declare-fun lt!382417 () array!48448)

(declare-datatypes ((array!48450 0))(
  ( (array!48451 (arr!23256 (Array (_ BitVec 32) (_ BitVec 64))) (size!23696 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48450)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26541)

(declare-fun zeroValue!654 () V!26541)

(declare-fun getCurrentListMapNoExtraKeys!2692 (array!48450 array!48448 (_ BitVec 32) (_ BitVec 32) V!26541 V!26541 (_ BitVec 32) Int) ListLongMap!9389)

(assert (=> bm!37807 (= call!37811 (getCurrentListMapNoExtraKeys!2692 _keys!868 lt!382417 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849803 () Bool)

(declare-fun e!474081 () Bool)

(assert (=> b!849803 (= e!474081 true)))

(declare-fun lt!382421 () V!26541)

(declare-fun lt!382422 () ListLongMap!9389)

(declare-fun lt!382423 () tuple2!10620)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2113 (ListLongMap!9389 tuple2!10620) ListLongMap!9389)

(assert (=> b!849803 (= (+!2113 lt!382422 lt!382423) (+!2113 (+!2113 lt!382422 (tuple2!10621 k!854 lt!382421)) lt!382423))))

(declare-fun lt!382416 () V!26541)

(assert (=> b!849803 (= lt!382423 (tuple2!10621 k!854 lt!382416))))

(declare-datatypes ((Unit!29015 0))(
  ( (Unit!29016) )
))
(declare-fun lt!382415 () Unit!29015)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!250 (ListLongMap!9389 (_ BitVec 64) V!26541 V!26541) Unit!29015)

(assert (=> b!849803 (= lt!382415 (addSameAsAddTwiceSameKeyDiffValues!250 lt!382422 k!854 lt!382421 lt!382416))))

(declare-fun lt!382419 () V!26541)

(declare-fun _values!688 () array!48448)

(declare-fun get!12242 (ValueCell!7621 V!26541) V!26541)

(assert (=> b!849803 (= lt!382421 (get!12242 (select (arr!23255 _values!688) from!1053) lt!382419))))

(declare-fun lt!382418 () ListLongMap!9389)

(assert (=> b!849803 (= lt!382418 (+!2113 lt!382422 (tuple2!10621 (select (arr!23256 _keys!868) from!1053) lt!382416)))))

(declare-fun v!557 () V!26541)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849803 (= lt!382416 (get!12242 (select (store (arr!23255 _values!688) i!612 (ValueCellFull!7621 v!557)) from!1053) lt!382419))))

(declare-fun dynLambda!1004 (Int (_ BitVec 64)) V!26541)

(assert (=> b!849803 (= lt!382419 (dynLambda!1004 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849803 (= lt!382422 (getCurrentListMapNoExtraKeys!2692 _keys!868 lt!382417 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849804 () Bool)

(declare-fun res!577303 () Bool)

(assert (=> b!849804 (=> (not res!577303) (not e!474085))))

(assert (=> b!849804 (= res!577303 (and (= (select (arr!23256 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37808 () Bool)

(declare-fun call!37810 () ListLongMap!9389)

(assert (=> bm!37808 (= call!37810 (getCurrentListMapNoExtraKeys!2692 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849805 () Bool)

(declare-fun e!474082 () Bool)

(declare-fun tp_is_empty!16121 () Bool)

(assert (=> b!849805 (= e!474082 tp_is_empty!16121)))

(declare-fun res!577300 () Bool)

(assert (=> start!73070 (=> (not res!577300) (not e!474085))))

(assert (=> start!73070 (= res!577300 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23696 _keys!868))))))

(assert (=> start!73070 e!474085))

(assert (=> start!73070 tp_is_empty!16121))

(assert (=> start!73070 true))

(assert (=> start!73070 tp!49458))

(declare-fun array_inv!18454 (array!48450) Bool)

(assert (=> start!73070 (array_inv!18454 _keys!868)))

(declare-fun e!474087 () Bool)

(declare-fun array_inv!18455 (array!48448) Bool)

(assert (=> start!73070 (and (array_inv!18455 _values!688) e!474087)))

(declare-fun mapNonEmpty!25781 () Bool)

(declare-fun mapRes!25781 () Bool)

(declare-fun tp!49459 () Bool)

(declare-fun e!474083 () Bool)

(assert (=> mapNonEmpty!25781 (= mapRes!25781 (and tp!49459 e!474083))))

(declare-fun mapRest!25781 () (Array (_ BitVec 32) ValueCell!7621))

(declare-fun mapValue!25781 () ValueCell!7621)

(declare-fun mapKey!25781 () (_ BitVec 32))

(assert (=> mapNonEmpty!25781 (= (arr!23255 _values!688) (store mapRest!25781 mapKey!25781 mapValue!25781))))

(declare-fun b!849806 () Bool)

(declare-fun res!577304 () Bool)

(assert (=> b!849806 (=> (not res!577304) (not e!474085))))

(declare-datatypes ((List!16468 0))(
  ( (Nil!16465) (Cons!16464 (h!17595 (_ BitVec 64)) (t!22899 List!16468)) )
))
(declare-fun arrayNoDuplicates!0 (array!48450 (_ BitVec 32) List!16468) Bool)

(assert (=> b!849806 (= res!577304 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16465))))

(declare-fun b!849807 () Bool)

(assert (=> b!849807 (= e!474083 tp_is_empty!16121)))

(declare-fun mapIsEmpty!25781 () Bool)

(assert (=> mapIsEmpty!25781 mapRes!25781))

(declare-fun e!474084 () Bool)

(declare-fun b!849808 () Bool)

(assert (=> b!849808 (= e!474084 (= call!37811 (+!2113 call!37810 (tuple2!10621 k!854 v!557))))))

(declare-fun b!849809 () Bool)

(declare-fun res!577307 () Bool)

(assert (=> b!849809 (=> (not res!577307) (not e!474085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48450 (_ BitVec 32)) Bool)

(assert (=> b!849809 (= res!577307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849810 () Bool)

(declare-fun e!474086 () Bool)

(assert (=> b!849810 (= e!474085 e!474086)))

(declare-fun res!577299 () Bool)

(assert (=> b!849810 (=> (not res!577299) (not e!474086))))

(assert (=> b!849810 (= res!577299 (= from!1053 i!612))))

(assert (=> b!849810 (= lt!382418 (getCurrentListMapNoExtraKeys!2692 _keys!868 lt!382417 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849810 (= lt!382417 (array!48449 (store (arr!23255 _values!688) i!612 (ValueCellFull!7621 v!557)) (size!23695 _values!688)))))

(declare-fun lt!382420 () ListLongMap!9389)

(assert (=> b!849810 (= lt!382420 (getCurrentListMapNoExtraKeys!2692 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849811 () Bool)

(declare-fun res!577298 () Bool)

(assert (=> b!849811 (=> (not res!577298) (not e!474085))))

(assert (=> b!849811 (= res!577298 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23696 _keys!868))))))

(declare-fun b!849812 () Bool)

(declare-fun res!577305 () Bool)

(assert (=> b!849812 (=> (not res!577305) (not e!474085))))

(assert (=> b!849812 (= res!577305 (and (= (size!23695 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23696 _keys!868) (size!23695 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849813 () Bool)

(declare-fun res!577306 () Bool)

(assert (=> b!849813 (=> (not res!577306) (not e!474085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849813 (= res!577306 (validKeyInArray!0 k!854))))

(declare-fun b!849814 () Bool)

(assert (=> b!849814 (= e!474087 (and e!474082 mapRes!25781))))

(declare-fun condMapEmpty!25781 () Bool)

(declare-fun mapDefault!25781 () ValueCell!7621)

