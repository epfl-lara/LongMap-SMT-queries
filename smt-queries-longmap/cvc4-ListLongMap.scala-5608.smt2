; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73436 () Bool)

(assert start!73436)

(declare-fun b_free!14351 () Bool)

(declare-fun b_next!14351 () Bool)

(assert (=> start!73436 (= b_free!14351 (not b_next!14351))))

(declare-fun tp!50557 () Bool)

(declare-fun b_and!23707 () Bool)

(assert (=> start!73436 (= tp!50557 b_and!23707)))

(declare-fun mapIsEmpty!26330 () Bool)

(declare-fun mapRes!26330 () Bool)

(assert (=> mapIsEmpty!26330 mapRes!26330))

(declare-fun b!857442 () Bool)

(declare-fun e!477904 () Bool)

(declare-fun e!477903 () Bool)

(assert (=> b!857442 (= e!477904 e!477903)))

(declare-fun res!582449 () Bool)

(assert (=> b!857442 (=> (not res!582449) (not e!477903))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857442 (= res!582449 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27029 0))(
  ( (V!27030 (val!8291 Int)) )
))
(declare-datatypes ((tuple2!10940 0))(
  ( (tuple2!10941 (_1!5481 (_ BitVec 64)) (_2!5481 V!27029)) )
))
(declare-datatypes ((List!16747 0))(
  ( (Nil!16744) (Cons!16743 (h!17874 tuple2!10940) (t!23388 List!16747)) )
))
(declare-datatypes ((ListLongMap!9709 0))(
  ( (ListLongMap!9710 (toList!4870 List!16747)) )
))
(declare-fun lt!386292 () ListLongMap!9709)

(declare-datatypes ((array!49164 0))(
  ( (array!49165 (arr!23613 (Array (_ BitVec 32) (_ BitVec 64))) (size!24053 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49164)

(declare-fun minValue!654 () V!27029)

(declare-fun zeroValue!654 () V!27029)

(declare-datatypes ((ValueCell!7804 0))(
  ( (ValueCellFull!7804 (v!10716 V!27029)) (EmptyCell!7804) )
))
(declare-datatypes ((array!49166 0))(
  ( (array!49167 (arr!23614 (Array (_ BitVec 32) ValueCell!7804)) (size!24054 (_ BitVec 32))) )
))
(declare-fun lt!386293 () array!49166)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2851 (array!49164 array!49166 (_ BitVec 32) (_ BitVec 32) V!27029 V!27029 (_ BitVec 32) Int) ListLongMap!9709)

(assert (=> b!857442 (= lt!386292 (getCurrentListMapNoExtraKeys!2851 _keys!868 lt!386293 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27029)

(declare-fun _values!688 () array!49166)

(assert (=> b!857442 (= lt!386293 (array!49167 (store (arr!23614 _values!688) i!612 (ValueCellFull!7804 v!557)) (size!24054 _values!688)))))

(declare-fun lt!386290 () ListLongMap!9709)

(assert (=> b!857442 (= lt!386290 (getCurrentListMapNoExtraKeys!2851 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857443 () Bool)

(declare-fun res!582452 () Bool)

(assert (=> b!857443 (=> (not res!582452) (not e!477904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49164 (_ BitVec 32)) Bool)

(assert (=> b!857443 (= res!582452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857444 () Bool)

(assert (=> b!857444 (= e!477903 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2224 (ListLongMap!9709 tuple2!10940) ListLongMap!9709)

(assert (=> b!857444 (= (getCurrentListMapNoExtraKeys!2851 _keys!868 lt!386293 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2224 (getCurrentListMapNoExtraKeys!2851 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10941 k!854 v!557)))))

(declare-datatypes ((Unit!29235 0))(
  ( (Unit!29236) )
))
(declare-fun lt!386291 () Unit!29235)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!445 (array!49164 array!49166 (_ BitVec 32) (_ BitVec 32) V!27029 V!27029 (_ BitVec 32) (_ BitVec 64) V!27029 (_ BitVec 32) Int) Unit!29235)

(assert (=> b!857444 (= lt!386291 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!445 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857445 () Bool)

(declare-fun res!582450 () Bool)

(assert (=> b!857445 (=> (not res!582450) (not e!477904))))

(assert (=> b!857445 (= res!582450 (and (= (select (arr!23613 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857446 () Bool)

(declare-fun res!582448 () Bool)

(assert (=> b!857446 (=> (not res!582448) (not e!477904))))

(assert (=> b!857446 (= res!582448 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24053 _keys!868))))))

(declare-fun b!857447 () Bool)

(declare-fun res!582454 () Bool)

(assert (=> b!857447 (=> (not res!582454) (not e!477904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857447 (= res!582454 (validMask!0 mask!1196))))

(declare-fun res!582451 () Bool)

(assert (=> start!73436 (=> (not res!582451) (not e!477904))))

(assert (=> start!73436 (= res!582451 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24053 _keys!868))))))

(assert (=> start!73436 e!477904))

(declare-fun tp_is_empty!16487 () Bool)

(assert (=> start!73436 tp_is_empty!16487))

(assert (=> start!73436 true))

(assert (=> start!73436 tp!50557))

(declare-fun array_inv!18700 (array!49164) Bool)

(assert (=> start!73436 (array_inv!18700 _keys!868)))

(declare-fun e!477900 () Bool)

(declare-fun array_inv!18701 (array!49166) Bool)

(assert (=> start!73436 (and (array_inv!18701 _values!688) e!477900)))

(declare-fun b!857448 () Bool)

(declare-fun e!477902 () Bool)

(assert (=> b!857448 (= e!477902 tp_is_empty!16487)))

(declare-fun b!857449 () Bool)

(declare-fun e!477899 () Bool)

(assert (=> b!857449 (= e!477899 tp_is_empty!16487)))

(declare-fun b!857450 () Bool)

(declare-fun res!582453 () Bool)

(assert (=> b!857450 (=> (not res!582453) (not e!477904))))

(declare-datatypes ((List!16748 0))(
  ( (Nil!16745) (Cons!16744 (h!17875 (_ BitVec 64)) (t!23389 List!16748)) )
))
(declare-fun arrayNoDuplicates!0 (array!49164 (_ BitVec 32) List!16748) Bool)

(assert (=> b!857450 (= res!582453 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16745))))

(declare-fun b!857451 () Bool)

(declare-fun res!582447 () Bool)

(assert (=> b!857451 (=> (not res!582447) (not e!477904))))

(assert (=> b!857451 (= res!582447 (and (= (size!24054 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24053 _keys!868) (size!24054 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26330 () Bool)

(declare-fun tp!50556 () Bool)

(assert (=> mapNonEmpty!26330 (= mapRes!26330 (and tp!50556 e!477902))))

(declare-fun mapValue!26330 () ValueCell!7804)

(declare-fun mapRest!26330 () (Array (_ BitVec 32) ValueCell!7804))

(declare-fun mapKey!26330 () (_ BitVec 32))

(assert (=> mapNonEmpty!26330 (= (arr!23614 _values!688) (store mapRest!26330 mapKey!26330 mapValue!26330))))

(declare-fun b!857452 () Bool)

(declare-fun res!582455 () Bool)

(assert (=> b!857452 (=> (not res!582455) (not e!477904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857452 (= res!582455 (validKeyInArray!0 k!854))))

(declare-fun b!857453 () Bool)

(assert (=> b!857453 (= e!477900 (and e!477899 mapRes!26330))))

(declare-fun condMapEmpty!26330 () Bool)

(declare-fun mapDefault!26330 () ValueCell!7804)

