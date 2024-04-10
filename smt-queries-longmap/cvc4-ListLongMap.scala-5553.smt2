; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73106 () Bool)

(assert start!73106)

(declare-fun b_free!14021 () Bool)

(declare-fun b_next!14021 () Bool)

(assert (=> start!73106 (= b_free!14021 (not b_next!14021))))

(declare-fun tp!49567 () Bool)

(declare-fun b_and!23201 () Bool)

(assert (=> start!73106 (= tp!49567 b_and!23201)))

(declare-fun b!850649 () Bool)

(declare-fun res!577839 () Bool)

(declare-fun e!474514 () Bool)

(assert (=> b!850649 (=> (not res!577839) (not e!474514))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48518 0))(
  ( (array!48519 (arr!23290 (Array (_ BitVec 32) (_ BitVec 64))) (size!23730 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48518)

(assert (=> b!850649 (= res!577839 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23730 _keys!868))))))

(declare-fun b!850650 () Bool)

(declare-fun e!474518 () Bool)

(declare-fun tp_is_empty!16157 () Bool)

(assert (=> b!850650 (= e!474518 tp_is_empty!16157)))

(declare-fun b!850651 () Bool)

(declare-fun e!474519 () Bool)

(assert (=> b!850651 (= e!474514 e!474519)))

(declare-fun res!577843 () Bool)

(assert (=> b!850651 (=> (not res!577843) (not e!474519))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850651 (= res!577843 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26589 0))(
  ( (V!26590 (val!8126 Int)) )
))
(declare-datatypes ((ValueCell!7639 0))(
  ( (ValueCellFull!7639 (v!10551 V!26589)) (EmptyCell!7639) )
))
(declare-datatypes ((array!48520 0))(
  ( (array!48521 (arr!23291 (Array (_ BitVec 32) ValueCell!7639)) (size!23731 (_ BitVec 32))) )
))
(declare-fun lt!382959 () array!48520)

(declare-datatypes ((tuple2!10654 0))(
  ( (tuple2!10655 (_1!5338 (_ BitVec 64)) (_2!5338 V!26589)) )
))
(declare-datatypes ((List!16497 0))(
  ( (Nil!16494) (Cons!16493 (h!17624 tuple2!10654) (t!22964 List!16497)) )
))
(declare-datatypes ((ListLongMap!9423 0))(
  ( (ListLongMap!9424 (toList!4727 List!16497)) )
))
(declare-fun lt!382954 () ListLongMap!9423)

(declare-fun minValue!654 () V!26589)

(declare-fun zeroValue!654 () V!26589)

(declare-fun getCurrentListMapNoExtraKeys!2709 (array!48518 array!48520 (_ BitVec 32) (_ BitVec 32) V!26589 V!26589 (_ BitVec 32) Int) ListLongMap!9423)

(assert (=> b!850651 (= lt!382954 (getCurrentListMapNoExtraKeys!2709 _keys!868 lt!382959 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26589)

(declare-fun _values!688 () array!48520)

(assert (=> b!850651 (= lt!382959 (array!48521 (store (arr!23291 _values!688) i!612 (ValueCellFull!7639 v!557)) (size!23731 _values!688)))))

(declare-fun lt!382963 () ListLongMap!9423)

(assert (=> b!850651 (= lt!382963 (getCurrentListMapNoExtraKeys!2709 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850652 () Bool)

(declare-fun res!577847 () Bool)

(assert (=> b!850652 (=> (not res!577847) (not e!474514))))

(assert (=> b!850652 (= res!577847 (and (= (size!23731 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23730 _keys!868) (size!23731 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850653 () Bool)

(declare-fun res!577840 () Bool)

(assert (=> b!850653 (=> (not res!577840) (not e!474514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48518 (_ BitVec 32)) Bool)

(assert (=> b!850653 (= res!577840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850654 () Bool)

(declare-fun e!474513 () Bool)

(assert (=> b!850654 (= e!474513 true)))

(declare-fun lt!382957 () ListLongMap!9423)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!382961 () V!26589)

(declare-fun lt!382960 () tuple2!10654)

(declare-fun +!2128 (ListLongMap!9423 tuple2!10654) ListLongMap!9423)

(assert (=> b!850654 (= (+!2128 lt!382957 lt!382960) (+!2128 (+!2128 lt!382957 (tuple2!10655 k!854 lt!382961)) lt!382960))))

(declare-fun lt!382955 () V!26589)

(assert (=> b!850654 (= lt!382960 (tuple2!10655 k!854 lt!382955))))

(declare-datatypes ((Unit!29047 0))(
  ( (Unit!29048) )
))
(declare-fun lt!382958 () Unit!29047)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!263 (ListLongMap!9423 (_ BitVec 64) V!26589 V!26589) Unit!29047)

(assert (=> b!850654 (= lt!382958 (addSameAsAddTwiceSameKeyDiffValues!263 lt!382957 k!854 lt!382961 lt!382955))))

(declare-fun lt!382956 () V!26589)

(declare-fun get!12267 (ValueCell!7639 V!26589) V!26589)

(assert (=> b!850654 (= lt!382961 (get!12267 (select (arr!23291 _values!688) from!1053) lt!382956))))

(assert (=> b!850654 (= lt!382954 (+!2128 lt!382957 (tuple2!10655 (select (arr!23290 _keys!868) from!1053) lt!382955)))))

(assert (=> b!850654 (= lt!382955 (get!12267 (select (store (arr!23291 _values!688) i!612 (ValueCellFull!7639 v!557)) from!1053) lt!382956))))

(declare-fun dynLambda!1017 (Int (_ BitVec 64)) V!26589)

(assert (=> b!850654 (= lt!382956 (dynLambda!1017 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850654 (= lt!382957 (getCurrentListMapNoExtraKeys!2709 _keys!868 lt!382959 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850655 () Bool)

(declare-fun e!474517 () Bool)

(declare-fun e!474520 () Bool)

(declare-fun mapRes!25835 () Bool)

(assert (=> b!850655 (= e!474517 (and e!474520 mapRes!25835))))

(declare-fun condMapEmpty!25835 () Bool)

(declare-fun mapDefault!25835 () ValueCell!7639)

