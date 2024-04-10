; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73570 () Bool)

(assert start!73570)

(declare-fun b_free!14485 () Bool)

(declare-fun b_next!14485 () Bool)

(assert (=> start!73570 (= b_free!14485 (not b_next!14485))))

(declare-fun tp!50958 () Bool)

(declare-fun b_and!23949 () Bool)

(assert (=> start!73570 (= tp!50958 b_and!23949)))

(declare-fun b!860449 () Bool)

(declare-fun res!584748 () Bool)

(declare-fun e!479470 () Bool)

(assert (=> b!860449 (=> (not res!584748) (not e!479470))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860449 (= res!584748 (validKeyInArray!0 k!854))))

(declare-fun b!860450 () Bool)

(declare-fun res!584753 () Bool)

(assert (=> b!860450 (=> (not res!584753) (not e!479470))))

(declare-datatypes ((array!49418 0))(
  ( (array!49419 (arr!23740 (Array (_ BitVec 32) (_ BitVec 64))) (size!24180 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49418)

(declare-datatypes ((List!16854 0))(
  ( (Nil!16851) (Cons!16850 (h!17981 (_ BitVec 64)) (t!23605 List!16854)) )
))
(declare-fun arrayNoDuplicates!0 (array!49418 (_ BitVec 32) List!16854) Bool)

(assert (=> b!860450 (= res!584753 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16851))))

(declare-fun b!860451 () Bool)

(declare-fun res!584756 () Bool)

(declare-fun e!479465 () Bool)

(assert (=> b!860451 (=> res!584756 e!479465)))

(declare-fun contains!4235 (List!16854 (_ BitVec 64)) Bool)

(assert (=> b!860451 (= res!584756 (contains!4235 Nil!16851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!584745 () Bool)

(assert (=> start!73570 (=> (not res!584745) (not e!479470))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73570 (= res!584745 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24180 _keys!868))))))

(assert (=> start!73570 e!479470))

(declare-fun tp_is_empty!16621 () Bool)

(assert (=> start!73570 tp_is_empty!16621))

(assert (=> start!73570 true))

(assert (=> start!73570 tp!50958))

(declare-fun array_inv!18794 (array!49418) Bool)

(assert (=> start!73570 (array_inv!18794 _keys!868)))

(declare-datatypes ((V!27209 0))(
  ( (V!27210 (val!8358 Int)) )
))
(declare-datatypes ((ValueCell!7871 0))(
  ( (ValueCellFull!7871 (v!10783 V!27209)) (EmptyCell!7871) )
))
(declare-datatypes ((array!49420 0))(
  ( (array!49421 (arr!23741 (Array (_ BitVec 32) ValueCell!7871)) (size!24181 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49420)

(declare-fun e!479468 () Bool)

(declare-fun array_inv!18795 (array!49420) Bool)

(assert (=> start!73570 (and (array_inv!18795 _values!688) e!479468)))

(declare-fun b!860452 () Bool)

(declare-fun res!584744 () Bool)

(assert (=> b!860452 (=> (not res!584744) (not e!479470))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860452 (= res!584744 (and (= (select (arr!23740 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26531 () Bool)

(declare-fun mapRes!26531 () Bool)

(assert (=> mapIsEmpty!26531 mapRes!26531))

(declare-fun b!860453 () Bool)

(declare-fun res!584749 () Bool)

(assert (=> b!860453 (=> (not res!584749) (not e!479470))))

(assert (=> b!860453 (= res!584749 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24180 _keys!868))))))

(declare-fun b!860454 () Bool)

(declare-fun e!479466 () Bool)

(assert (=> b!860454 (= e!479466 e!479465)))

(declare-fun res!584750 () Bool)

(assert (=> b!860454 (=> res!584750 e!479465)))

(assert (=> b!860454 (= res!584750 (or (bvsge (size!24180 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24180 _keys!868)) (bvsge from!1053 (size!24180 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860454 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29333 0))(
  ( (Unit!29334) )
))
(declare-fun lt!387843 () Unit!29333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49418 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29333)

(assert (=> b!860454 (= lt!387843 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860454 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16851)))

(declare-fun lt!387836 () Unit!29333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49418 (_ BitVec 32) (_ BitVec 32)) Unit!29333)

(assert (=> b!860454 (= lt!387836 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860455 () Bool)

(declare-fun e!479467 () Bool)

(assert (=> b!860455 (= e!479467 e!479466)))

(declare-fun res!584752 () Bool)

(assert (=> b!860455 (=> res!584752 e!479466)))

(assert (=> b!860455 (= res!584752 (not (= (select (arr!23740 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11046 0))(
  ( (tuple2!11047 (_1!5534 (_ BitVec 64)) (_2!5534 V!27209)) )
))
(declare-datatypes ((List!16855 0))(
  ( (Nil!16852) (Cons!16851 (h!17982 tuple2!11046) (t!23606 List!16855)) )
))
(declare-datatypes ((ListLongMap!9815 0))(
  ( (ListLongMap!9816 (toList!4923 List!16855)) )
))
(declare-fun lt!387844 () ListLongMap!9815)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387837 () ListLongMap!9815)

(declare-fun +!2275 (ListLongMap!9815 tuple2!11046) ListLongMap!9815)

(declare-fun get!12517 (ValueCell!7871 V!27209) V!27209)

(declare-fun dynLambda!1111 (Int (_ BitVec 64)) V!27209)

(assert (=> b!860455 (= lt!387837 (+!2275 lt!387844 (tuple2!11047 (select (arr!23740 _keys!868) from!1053) (get!12517 (select (arr!23741 _values!688) from!1053) (dynLambda!1111 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860456 () Bool)

(declare-fun e!479464 () Bool)

(assert (=> b!860456 (= e!479470 e!479464)))

(declare-fun res!584755 () Bool)

(assert (=> b!860456 (=> (not res!584755) (not e!479464))))

(assert (=> b!860456 (= res!584755 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387838 () array!49420)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27209)

(declare-fun zeroValue!654 () V!27209)

(declare-fun getCurrentListMapNoExtraKeys!2900 (array!49418 array!49420 (_ BitVec 32) (_ BitVec 32) V!27209 V!27209 (_ BitVec 32) Int) ListLongMap!9815)

(assert (=> b!860456 (= lt!387837 (getCurrentListMapNoExtraKeys!2900 _keys!868 lt!387838 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27209)

(assert (=> b!860456 (= lt!387838 (array!49421 (store (arr!23741 _values!688) i!612 (ValueCellFull!7871 v!557)) (size!24181 _values!688)))))

(declare-fun lt!387840 () ListLongMap!9815)

(assert (=> b!860456 (= lt!387840 (getCurrentListMapNoExtraKeys!2900 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860457 () Bool)

(declare-fun res!584751 () Bool)

(assert (=> b!860457 (=> (not res!584751) (not e!479470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860457 (= res!584751 (validMask!0 mask!1196))))

(declare-fun b!860458 () Bool)

(declare-fun e!479469 () Bool)

(assert (=> b!860458 (= e!479468 (and e!479469 mapRes!26531))))

(declare-fun condMapEmpty!26531 () Bool)

(declare-fun mapDefault!26531 () ValueCell!7871)

