; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73820 () Bool)

(assert start!73820)

(declare-fun b_free!14735 () Bool)

(declare-fun b_next!14735 () Bool)

(assert (=> start!73820 (= b_free!14735 (not b_next!14735))))

(declare-fun tp!51709 () Bool)

(declare-fun b_and!24449 () Bool)

(assert (=> start!73820 (= tp!51709 b_and!24449)))

(declare-fun b!866625 () Bool)

(declare-fun res!588829 () Bool)

(declare-fun e!482752 () Bool)

(assert (=> b!866625 (=> (not res!588829) (not e!482752))))

(declare-datatypes ((array!49902 0))(
  ( (array!49903 (arr!23982 (Array (_ BitVec 32) (_ BitVec 64))) (size!24422 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49902)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49902 (_ BitVec 32)) Bool)

(assert (=> b!866625 (= res!588829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866626 () Bool)

(declare-fun res!588833 () Bool)

(assert (=> b!866626 (=> (not res!588833) (not e!482752))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866626 (= res!588833 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24422 _keys!868))))))

(declare-fun b!866627 () Bool)

(declare-fun e!482754 () Bool)

(declare-fun tp_is_empty!16871 () Bool)

(assert (=> b!866627 (= e!482754 tp_is_empty!16871)))

(declare-fun b!866628 () Bool)

(declare-fun e!482751 () Bool)

(declare-fun e!482749 () Bool)

(assert (=> b!866628 (= e!482751 (not e!482749))))

(declare-fun res!588831 () Bool)

(assert (=> b!866628 (=> res!588831 e!482749)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866628 (= res!588831 (not (validKeyInArray!0 (select (arr!23982 _keys!868) from!1053))))))

(declare-datatypes ((V!27541 0))(
  ( (V!27542 (val!8483 Int)) )
))
(declare-datatypes ((tuple2!11248 0))(
  ( (tuple2!11249 (_1!5635 (_ BitVec 64)) (_2!5635 V!27541)) )
))
(declare-datatypes ((List!17049 0))(
  ( (Nil!17046) (Cons!17045 (h!18176 tuple2!11248) (t!24050 List!17049)) )
))
(declare-datatypes ((ListLongMap!10017 0))(
  ( (ListLongMap!10018 (toList!5024 List!17049)) )
))
(declare-fun lt!393295 () ListLongMap!10017)

(declare-fun lt!393293 () ListLongMap!10017)

(assert (=> b!866628 (= lt!393295 lt!393293)))

(declare-fun lt!393297 () ListLongMap!10017)

(declare-fun lt!393302 () tuple2!11248)

(declare-fun +!2371 (ListLongMap!10017 tuple2!11248) ListLongMap!10017)

(assert (=> b!866628 (= lt!393293 (+!2371 lt!393297 lt!393302))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27541)

(declare-fun zeroValue!654 () V!27541)

(declare-datatypes ((ValueCell!7996 0))(
  ( (ValueCellFull!7996 (v!10908 V!27541)) (EmptyCell!7996) )
))
(declare-datatypes ((array!49904 0))(
  ( (array!49905 (arr!23983 (Array (_ BitVec 32) ValueCell!7996)) (size!24423 (_ BitVec 32))) )
))
(declare-fun lt!393292 () array!49904)

(declare-fun getCurrentListMapNoExtraKeys!2994 (array!49902 array!49904 (_ BitVec 32) (_ BitVec 32) V!27541 V!27541 (_ BitVec 32) Int) ListLongMap!10017)

(assert (=> b!866628 (= lt!393295 (getCurrentListMapNoExtraKeys!2994 _keys!868 lt!393292 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27541)

(assert (=> b!866628 (= lt!393302 (tuple2!11249 k!854 v!557))))

(declare-fun _values!688 () array!49904)

(assert (=> b!866628 (= lt!393297 (getCurrentListMapNoExtraKeys!2994 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29707 0))(
  ( (Unit!29708) )
))
(declare-fun lt!393291 () Unit!29707)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!569 (array!49902 array!49904 (_ BitVec 32) (_ BitVec 32) V!27541 V!27541 (_ BitVec 32) (_ BitVec 64) V!27541 (_ BitVec 32) Int) Unit!29707)

(assert (=> b!866628 (= lt!393291 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!569 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866629 () Bool)

(declare-fun res!588834 () Bool)

(assert (=> b!866629 (=> (not res!588834) (not e!482752))))

(assert (=> b!866629 (= res!588834 (and (= (size!24423 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24422 _keys!868) (size!24423 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866630 () Bool)

(declare-fun e!482750 () Bool)

(assert (=> b!866630 (= e!482750 tp_is_empty!16871)))

(declare-fun b!866631 () Bool)

(declare-fun res!588836 () Bool)

(assert (=> b!866631 (=> (not res!588836) (not e!482752))))

(declare-datatypes ((List!17050 0))(
  ( (Nil!17047) (Cons!17046 (h!18177 (_ BitVec 64)) (t!24051 List!17050)) )
))
(declare-fun arrayNoDuplicates!0 (array!49902 (_ BitVec 32) List!17050) Bool)

(assert (=> b!866631 (= res!588836 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17047))))

(declare-fun b!866632 () Bool)

(declare-fun res!588828 () Bool)

(assert (=> b!866632 (=> (not res!588828) (not e!482752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866632 (= res!588828 (validMask!0 mask!1196))))

(declare-fun res!588826 () Bool)

(assert (=> start!73820 (=> (not res!588826) (not e!482752))))

(assert (=> start!73820 (= res!588826 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24422 _keys!868))))))

(assert (=> start!73820 e!482752))

(assert (=> start!73820 tp_is_empty!16871))

(assert (=> start!73820 true))

(assert (=> start!73820 tp!51709))

(declare-fun array_inv!18952 (array!49902) Bool)

(assert (=> start!73820 (array_inv!18952 _keys!868)))

(declare-fun e!482755 () Bool)

(declare-fun array_inv!18953 (array!49904) Bool)

(assert (=> start!73820 (and (array_inv!18953 _values!688) e!482755)))

(declare-fun b!866633 () Bool)

(declare-fun res!588835 () Bool)

(assert (=> b!866633 (=> (not res!588835) (not e!482752))))

(assert (=> b!866633 (= res!588835 (and (= (select (arr!23982 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!866634 () Bool)

(declare-fun e!482748 () Bool)

(assert (=> b!866634 (= e!482749 e!482748)))

(declare-fun res!588827 () Bool)

(assert (=> b!866634 (=> res!588827 e!482748)))

(assert (=> b!866634 (= res!588827 (= k!854 (select (arr!23982 _keys!868) from!1053)))))

(assert (=> b!866634 (not (= (select (arr!23982 _keys!868) from!1053) k!854))))

(declare-fun lt!393303 () Unit!29707)

(declare-fun e!482747 () Unit!29707)

(assert (=> b!866634 (= lt!393303 e!482747)))

(declare-fun c!92323 () Bool)

(assert (=> b!866634 (= c!92323 (= (select (arr!23982 _keys!868) from!1053) k!854))))

(declare-fun lt!393301 () ListLongMap!10017)

(declare-fun lt!393304 () ListLongMap!10017)

(assert (=> b!866634 (= lt!393301 lt!393304)))

(declare-fun lt!393289 () tuple2!11248)

(assert (=> b!866634 (= lt!393304 (+!2371 lt!393293 lt!393289))))

(declare-fun lt!393300 () V!27541)

(assert (=> b!866634 (= lt!393289 (tuple2!11249 (select (arr!23982 _keys!868) from!1053) lt!393300))))

(declare-fun get!12679 (ValueCell!7996 V!27541) V!27541)

(declare-fun dynLambda!1191 (Int (_ BitVec 64)) V!27541)

(assert (=> b!866634 (= lt!393300 (get!12679 (select (arr!23983 _values!688) from!1053) (dynLambda!1191 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866635 () Bool)

(declare-fun Unit!29709 () Unit!29707)

(assert (=> b!866635 (= e!482747 Unit!29709)))

(declare-fun lt!393294 () Unit!29707)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49902 (_ BitVec 32) (_ BitVec 32)) Unit!29707)

(assert (=> b!866635 (= lt!393294 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866635 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17047)))

(declare-fun lt!393298 () Unit!29707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29707)

(assert (=> b!866635 (= lt!393298 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866635 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393290 () Unit!29707)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49902 (_ BitVec 64) (_ BitVec 32) List!17050) Unit!29707)

(assert (=> b!866635 (= lt!393290 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17047))))

(assert (=> b!866635 false))

(declare-fun b!866636 () Bool)

(assert (=> b!866636 (= e!482748 true)))

(assert (=> b!866636 (= lt!393304 (+!2371 (+!2371 lt!393297 lt!393289) lt!393302))))

(declare-fun lt!393299 () Unit!29707)

(declare-fun addCommutativeForDiffKeys!539 (ListLongMap!10017 (_ BitVec 64) V!27541 (_ BitVec 64) V!27541) Unit!29707)

(assert (=> b!866636 (= lt!393299 (addCommutativeForDiffKeys!539 lt!393297 k!854 v!557 (select (arr!23982 _keys!868) from!1053) lt!393300))))

(declare-fun b!866637 () Bool)

(assert (=> b!866637 (= e!482752 e!482751)))

(declare-fun res!588832 () Bool)

(assert (=> b!866637 (=> (not res!588832) (not e!482751))))

(assert (=> b!866637 (= res!588832 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866637 (= lt!393301 (getCurrentListMapNoExtraKeys!2994 _keys!868 lt!393292 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866637 (= lt!393292 (array!49905 (store (arr!23983 _values!688) i!612 (ValueCellFull!7996 v!557)) (size!24423 _values!688)))))

(declare-fun lt!393296 () ListLongMap!10017)

(assert (=> b!866637 (= lt!393296 (getCurrentListMapNoExtraKeys!2994 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866638 () Bool)

(declare-fun Unit!29710 () Unit!29707)

(assert (=> b!866638 (= e!482747 Unit!29710)))

(declare-fun mapIsEmpty!26906 () Bool)

(declare-fun mapRes!26906 () Bool)

(assert (=> mapIsEmpty!26906 mapRes!26906))

(declare-fun b!866639 () Bool)

(assert (=> b!866639 (= e!482755 (and e!482754 mapRes!26906))))

(declare-fun condMapEmpty!26906 () Bool)

(declare-fun mapDefault!26906 () ValueCell!7996)

