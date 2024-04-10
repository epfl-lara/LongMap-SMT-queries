; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73264 () Bool)

(assert start!73264)

(declare-fun b_free!14179 () Bool)

(declare-fun b_next!14179 () Bool)

(assert (=> start!73264 (= b_free!14179 (not b_next!14179))))

(declare-fun tp!50040 () Bool)

(declare-fun b_and!23517 () Bool)

(assert (=> start!73264 (= tp!50040 b_and!23517)))

(declare-fun b!854361 () Bool)

(declare-fun res!580208 () Bool)

(declare-fun e!476411 () Bool)

(assert (=> b!854361 (=> (not res!580208) (not e!476411))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48828 0))(
  ( (array!48829 (arr!23445 (Array (_ BitVec 32) (_ BitVec 64))) (size!23885 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48828)

(declare-datatypes ((V!26801 0))(
  ( (V!26802 (val!8205 Int)) )
))
(declare-datatypes ((ValueCell!7718 0))(
  ( (ValueCellFull!7718 (v!10630 V!26801)) (EmptyCell!7718) )
))
(declare-datatypes ((array!48830 0))(
  ( (array!48831 (arr!23446 (Array (_ BitVec 32) ValueCell!7718)) (size!23886 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48830)

(assert (=> b!854361 (= res!580208 (and (= (size!23886 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23885 _keys!868) (size!23886 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854362 () Bool)

(declare-fun res!580211 () Bool)

(assert (=> b!854362 (=> (not res!580211) (not e!476411))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854362 (= res!580211 (and (= (select (arr!23445 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854363 () Bool)

(declare-fun res!580217 () Bool)

(assert (=> b!854363 (=> (not res!580217) (not e!476411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48828 (_ BitVec 32)) Bool)

(assert (=> b!854363 (= res!580217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854364 () Bool)

(declare-fun e!476415 () Bool)

(declare-fun tp_is_empty!16315 () Bool)

(assert (=> b!854364 (= e!476415 tp_is_empty!16315)))

(declare-fun v!557 () V!26801)

(declare-fun e!476409 () Bool)

(declare-datatypes ((tuple2!10800 0))(
  ( (tuple2!10801 (_1!5411 (_ BitVec 64)) (_2!5411 V!26801)) )
))
(declare-datatypes ((List!16617 0))(
  ( (Nil!16614) (Cons!16613 (h!17744 tuple2!10800) (t!23242 List!16617)) )
))
(declare-datatypes ((ListLongMap!9569 0))(
  ( (ListLongMap!9570 (toList!4800 List!16617)) )
))
(declare-fun call!38392 () ListLongMap!9569)

(declare-fun call!38393 () ListLongMap!9569)

(declare-fun b!854365 () Bool)

(declare-fun +!2189 (ListLongMap!9569 tuple2!10800) ListLongMap!9569)

(assert (=> b!854365 (= e!476409 (= call!38392 (+!2189 call!38393 (tuple2!10801 k!854 v!557))))))

(declare-fun b!854366 () Bool)

(declare-fun res!580214 () Bool)

(assert (=> b!854366 (=> (not res!580214) (not e!476411))))

(declare-datatypes ((List!16618 0))(
  ( (Nil!16615) (Cons!16614 (h!17745 (_ BitVec 64)) (t!23243 List!16618)) )
))
(declare-fun arrayNoDuplicates!0 (array!48828 (_ BitVec 32) List!16618) Bool)

(assert (=> b!854366 (= res!580214 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16615))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26801)

(declare-fun zeroValue!654 () V!26801)

(declare-fun bm!38389 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2781 (array!48828 array!48830 (_ BitVec 32) (_ BitVec 32) V!26801 V!26801 (_ BitVec 32) Int) ListLongMap!9569)

(assert (=> bm!38389 (= call!38393 (getCurrentListMapNoExtraKeys!2781 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26072 () Bool)

(declare-fun mapRes!26072 () Bool)

(assert (=> mapIsEmpty!26072 mapRes!26072))

(declare-fun lt!385327 () array!48830)

(declare-fun bm!38390 () Bool)

(assert (=> bm!38390 (= call!38392 (getCurrentListMapNoExtraKeys!2781 _keys!868 lt!385327 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854367 () Bool)

(declare-fun res!580216 () Bool)

(assert (=> b!854367 (=> (not res!580216) (not e!476411))))

(assert (=> b!854367 (= res!580216 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23885 _keys!868))))))

(declare-fun b!854368 () Bool)

(declare-fun res!580210 () Bool)

(assert (=> b!854368 (=> (not res!580210) (not e!476411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854368 (= res!580210 (validKeyInArray!0 k!854))))

(declare-fun b!854369 () Bool)

(declare-fun e!476410 () Bool)

(assert (=> b!854369 (= e!476410 tp_is_empty!16315)))

(declare-fun res!580209 () Bool)

(assert (=> start!73264 (=> (not res!580209) (not e!476411))))

(assert (=> start!73264 (= res!580209 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23885 _keys!868))))))

(assert (=> start!73264 e!476411))

(assert (=> start!73264 tp_is_empty!16315))

(assert (=> start!73264 true))

(assert (=> start!73264 tp!50040))

(declare-fun array_inv!18582 (array!48828) Bool)

(assert (=> start!73264 (array_inv!18582 _keys!868)))

(declare-fun e!476416 () Bool)

(declare-fun array_inv!18583 (array!48830) Bool)

(assert (=> start!73264 (and (array_inv!18583 _values!688) e!476416)))

(declare-fun b!854370 () Bool)

(declare-fun e!476412 () Bool)

(assert (=> b!854370 (= e!476412 true)))

(declare-fun lt!385324 () tuple2!10800)

(declare-fun lt!385325 () ListLongMap!9569)

(declare-fun lt!385330 () V!26801)

(assert (=> b!854370 (= (+!2189 lt!385325 lt!385324) (+!2189 (+!2189 lt!385325 (tuple2!10801 k!854 lt!385330)) lt!385324))))

(declare-fun lt!385332 () V!26801)

(assert (=> b!854370 (= lt!385324 (tuple2!10801 k!854 lt!385332))))

(declare-datatypes ((Unit!29163 0))(
  ( (Unit!29164) )
))
(declare-fun lt!385328 () Unit!29163)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!314 (ListLongMap!9569 (_ BitVec 64) V!26801 V!26801) Unit!29163)

(assert (=> b!854370 (= lt!385328 (addSameAsAddTwiceSameKeyDiffValues!314 lt!385325 k!854 lt!385330 lt!385332))))

(declare-fun lt!385326 () V!26801)

(declare-fun get!12372 (ValueCell!7718 V!26801) V!26801)

(assert (=> b!854370 (= lt!385330 (get!12372 (select (arr!23446 _values!688) from!1053) lt!385326))))

(declare-fun lt!385333 () ListLongMap!9569)

(assert (=> b!854370 (= lt!385333 (+!2189 lt!385325 (tuple2!10801 (select (arr!23445 _keys!868) from!1053) lt!385332)))))

(assert (=> b!854370 (= lt!385332 (get!12372 (select (store (arr!23446 _values!688) i!612 (ValueCellFull!7718 v!557)) from!1053) lt!385326))))

(declare-fun dynLambda!1068 (Int (_ BitVec 64)) V!26801)

(assert (=> b!854370 (= lt!385326 (dynLambda!1068 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854370 (= lt!385325 (getCurrentListMapNoExtraKeys!2781 _keys!868 lt!385327 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854371 () Bool)

(assert (=> b!854371 (= e!476416 (and e!476410 mapRes!26072))))

(declare-fun condMapEmpty!26072 () Bool)

(declare-fun mapDefault!26072 () ValueCell!7718)

