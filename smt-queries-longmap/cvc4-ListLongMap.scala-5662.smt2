; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73760 () Bool)

(assert start!73760)

(declare-fun b_free!14675 () Bool)

(declare-fun b_next!14675 () Bool)

(assert (=> start!73760 (= b_free!14675 (not b_next!14675))))

(declare-fun tp!51529 () Bool)

(declare-fun b_and!24329 () Bool)

(assert (=> start!73760 (= tp!51529 b_and!24329)))

(declare-fun b!865125 () Bool)

(declare-fun res!587836 () Bool)

(declare-fun e!481939 () Bool)

(assert (=> b!865125 (=> (not res!587836) (not e!481939))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865125 (= res!587836 (validKeyInArray!0 k!854))))

(declare-fun b!865126 () Bool)

(declare-fun res!587844 () Bool)

(assert (=> b!865126 (=> (not res!587844) (not e!481939))))

(declare-datatypes ((array!49782 0))(
  ( (array!49783 (arr!23922 (Array (_ BitVec 32) (_ BitVec 64))) (size!24362 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49782)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49782 (_ BitVec 32)) Bool)

(assert (=> b!865126 (= res!587844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865127 () Bool)

(declare-fun res!587843 () Bool)

(assert (=> b!865127 (=> (not res!587843) (not e!481939))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865127 (= res!587843 (and (= (select (arr!23922 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!865128 () Bool)

(declare-datatypes ((Unit!29621 0))(
  ( (Unit!29622) )
))
(declare-fun e!481942 () Unit!29621)

(declare-fun Unit!29623 () Unit!29621)

(assert (=> b!865128 (= e!481942 Unit!29623)))

(declare-fun b!865129 () Bool)

(declare-fun res!587842 () Bool)

(assert (=> b!865129 (=> (not res!587842) (not e!481939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865129 (= res!587842 (validMask!0 mask!1196))))

(declare-fun b!865130 () Bool)

(declare-fun e!481937 () Bool)

(declare-fun e!481940 () Bool)

(assert (=> b!865130 (= e!481937 (not e!481940))))

(declare-fun res!587846 () Bool)

(assert (=> b!865130 (=> res!587846 e!481940)))

(assert (=> b!865130 (= res!587846 (not (validKeyInArray!0 (select (arr!23922 _keys!868) from!1053))))))

(declare-datatypes ((V!27461 0))(
  ( (V!27462 (val!8453 Int)) )
))
(declare-datatypes ((tuple2!11202 0))(
  ( (tuple2!11203 (_1!5612 (_ BitVec 64)) (_2!5612 V!27461)) )
))
(declare-datatypes ((List!17005 0))(
  ( (Nil!17002) (Cons!17001 (h!18132 tuple2!11202) (t!23946 List!17005)) )
))
(declare-datatypes ((ListLongMap!9971 0))(
  ( (ListLongMap!9972 (toList!5001 List!17005)) )
))
(declare-fun lt!391852 () ListLongMap!9971)

(declare-fun lt!391855 () ListLongMap!9971)

(assert (=> b!865130 (= lt!391852 lt!391855)))

(declare-fun lt!391854 () ListLongMap!9971)

(declare-fun lt!391851 () tuple2!11202)

(declare-fun +!2350 (ListLongMap!9971 tuple2!11202) ListLongMap!9971)

(assert (=> b!865130 (= lt!391855 (+!2350 lt!391854 lt!391851))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27461)

(declare-fun zeroValue!654 () V!27461)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7966 0))(
  ( (ValueCellFull!7966 (v!10878 V!27461)) (EmptyCell!7966) )
))
(declare-datatypes ((array!49784 0))(
  ( (array!49785 (arr!23923 (Array (_ BitVec 32) ValueCell!7966)) (size!24363 (_ BitVec 32))) )
))
(declare-fun lt!391863 () array!49784)

(declare-fun getCurrentListMapNoExtraKeys!2972 (array!49782 array!49784 (_ BitVec 32) (_ BitVec 32) V!27461 V!27461 (_ BitVec 32) Int) ListLongMap!9971)

(assert (=> b!865130 (= lt!391852 (getCurrentListMapNoExtraKeys!2972 _keys!868 lt!391863 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27461)

(assert (=> b!865130 (= lt!391851 (tuple2!11203 k!854 v!557))))

(declare-fun _values!688 () array!49784)

(assert (=> b!865130 (= lt!391854 (getCurrentListMapNoExtraKeys!2972 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391859 () Unit!29621)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!552 (array!49782 array!49784 (_ BitVec 32) (_ BitVec 32) V!27461 V!27461 (_ BitVec 32) (_ BitVec 64) V!27461 (_ BitVec 32) Int) Unit!29621)

(assert (=> b!865130 (= lt!391859 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!552 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865131 () Bool)

(declare-fun res!587837 () Bool)

(assert (=> b!865131 (=> (not res!587837) (not e!481939))))

(assert (=> b!865131 (= res!587837 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24362 _keys!868))))))

(declare-fun mapNonEmpty!26816 () Bool)

(declare-fun mapRes!26816 () Bool)

(declare-fun tp!51528 () Bool)

(declare-fun e!481943 () Bool)

(assert (=> mapNonEmpty!26816 (= mapRes!26816 (and tp!51528 e!481943))))

(declare-fun mapKey!26816 () (_ BitVec 32))

(declare-fun mapRest!26816 () (Array (_ BitVec 32) ValueCell!7966))

(declare-fun mapValue!26816 () ValueCell!7966)

(assert (=> mapNonEmpty!26816 (= (arr!23923 _values!688) (store mapRest!26816 mapKey!26816 mapValue!26816))))

(declare-fun b!865132 () Bool)

(declare-fun e!481938 () Bool)

(declare-fun tp_is_empty!16811 () Bool)

(assert (=> b!865132 (= e!481938 tp_is_empty!16811)))

(declare-fun b!865133 () Bool)

(assert (=> b!865133 (= e!481943 tp_is_empty!16811)))

(declare-fun b!865134 () Bool)

(declare-fun res!587845 () Bool)

(assert (=> b!865134 (=> (not res!587845) (not e!481939))))

(assert (=> b!865134 (= res!587845 (and (= (size!24363 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24362 _keys!868) (size!24363 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865135 () Bool)

(declare-fun Unit!29624 () Unit!29621)

(assert (=> b!865135 (= e!481942 Unit!29624)))

(declare-fun lt!391860 () Unit!29621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49782 (_ BitVec 32) (_ BitVec 32)) Unit!29621)

(assert (=> b!865135 (= lt!391860 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17006 0))(
  ( (Nil!17003) (Cons!17002 (h!18133 (_ BitVec 64)) (t!23947 List!17006)) )
))
(declare-fun arrayNoDuplicates!0 (array!49782 (_ BitVec 32) List!17006) Bool)

(assert (=> b!865135 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17003)))

(declare-fun lt!391853 () Unit!29621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49782 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29621)

(assert (=> b!865135 (= lt!391853 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865135 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391856 () Unit!29621)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49782 (_ BitVec 64) (_ BitVec 32) List!17006) Unit!29621)

(assert (=> b!865135 (= lt!391856 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17003))))

(assert (=> b!865135 false))

(declare-fun b!865136 () Bool)

(assert (=> b!865136 (= e!481939 e!481937)))

(declare-fun res!587840 () Bool)

(assert (=> b!865136 (=> (not res!587840) (not e!481937))))

(assert (=> b!865136 (= res!587840 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391849 () ListLongMap!9971)

(assert (=> b!865136 (= lt!391849 (getCurrentListMapNoExtraKeys!2972 _keys!868 lt!391863 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865136 (= lt!391863 (array!49785 (store (arr!23923 _values!688) i!612 (ValueCellFull!7966 v!557)) (size!24363 _values!688)))))

(declare-fun lt!391862 () ListLongMap!9971)

(assert (=> b!865136 (= lt!391862 (getCurrentListMapNoExtraKeys!2972 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26816 () Bool)

(assert (=> mapIsEmpty!26816 mapRes!26816))

(declare-fun res!587839 () Bool)

(assert (=> start!73760 (=> (not res!587839) (not e!481939))))

(assert (=> start!73760 (= res!587839 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24362 _keys!868))))))

(assert (=> start!73760 e!481939))

(assert (=> start!73760 tp_is_empty!16811))

(assert (=> start!73760 true))

(assert (=> start!73760 tp!51529))

(declare-fun array_inv!18914 (array!49782) Bool)

(assert (=> start!73760 (array_inv!18914 _keys!868)))

(declare-fun e!481945 () Bool)

(declare-fun array_inv!18915 (array!49784) Bool)

(assert (=> start!73760 (and (array_inv!18915 _values!688) e!481945)))

(declare-fun b!865137 () Bool)

(declare-fun e!481944 () Bool)

(assert (=> b!865137 (= e!481944 true)))

(declare-fun lt!391864 () tuple2!11202)

(declare-fun lt!391850 () ListLongMap!9971)

(assert (=> b!865137 (= lt!391850 (+!2350 (+!2350 lt!391854 lt!391864) lt!391851))))

(declare-fun lt!391861 () V!27461)

(declare-fun lt!391857 () Unit!29621)

(declare-fun addCommutativeForDiffKeys!519 (ListLongMap!9971 (_ BitVec 64) V!27461 (_ BitVec 64) V!27461) Unit!29621)

(assert (=> b!865137 (= lt!391857 (addCommutativeForDiffKeys!519 lt!391854 k!854 v!557 (select (arr!23922 _keys!868) from!1053) lt!391861))))

(declare-fun b!865138 () Bool)

(declare-fun res!587841 () Bool)

(assert (=> b!865138 (=> (not res!587841) (not e!481939))))

(assert (=> b!865138 (= res!587841 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17003))))

(declare-fun b!865139 () Bool)

(assert (=> b!865139 (= e!481940 e!481944)))

(declare-fun res!587838 () Bool)

(assert (=> b!865139 (=> res!587838 e!481944)))

(assert (=> b!865139 (= res!587838 (= k!854 (select (arr!23922 _keys!868) from!1053)))))

(assert (=> b!865139 (not (= (select (arr!23922 _keys!868) from!1053) k!854))))

(declare-fun lt!391858 () Unit!29621)

(assert (=> b!865139 (= lt!391858 e!481942)))

(declare-fun c!92233 () Bool)

(assert (=> b!865139 (= c!92233 (= (select (arr!23922 _keys!868) from!1053) k!854))))

(assert (=> b!865139 (= lt!391849 lt!391850)))

(assert (=> b!865139 (= lt!391850 (+!2350 lt!391855 lt!391864))))

(assert (=> b!865139 (= lt!391864 (tuple2!11203 (select (arr!23922 _keys!868) from!1053) lt!391861))))

(declare-fun get!12642 (ValueCell!7966 V!27461) V!27461)

(declare-fun dynLambda!1174 (Int (_ BitVec 64)) V!27461)

(assert (=> b!865139 (= lt!391861 (get!12642 (select (arr!23923 _values!688) from!1053) (dynLambda!1174 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865140 () Bool)

(assert (=> b!865140 (= e!481945 (and e!481938 mapRes!26816))))

(declare-fun condMapEmpty!26816 () Bool)

(declare-fun mapDefault!26816 () ValueCell!7966)

