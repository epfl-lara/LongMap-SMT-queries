; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73798 () Bool)

(assert start!73798)

(declare-fun b_free!14713 () Bool)

(declare-fun b_next!14713 () Bool)

(assert (=> start!73798 (= b_free!14713 (not b_next!14713))))

(declare-fun tp!51642 () Bool)

(declare-fun b_and!24405 () Bool)

(assert (=> start!73798 (= tp!51642 b_and!24405)))

(declare-fun b!866075 () Bool)

(declare-fun res!588468 () Bool)

(declare-fun e!482454 () Bool)

(assert (=> b!866075 (=> (not res!588468) (not e!482454))))

(declare-datatypes ((array!49858 0))(
  ( (array!49859 (arr!23960 (Array (_ BitVec 32) (_ BitVec 64))) (size!24400 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49858)

(declare-datatypes ((List!17034 0))(
  ( (Nil!17031) (Cons!17030 (h!18161 (_ BitVec 64)) (t!24013 List!17034)) )
))
(declare-fun arrayNoDuplicates!0 (array!49858 (_ BitVec 32) List!17034) Bool)

(assert (=> b!866075 (= res!588468 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17031))))

(declare-fun b!866076 () Bool)

(declare-fun e!482452 () Bool)

(declare-fun tp_is_empty!16849 () Bool)

(assert (=> b!866076 (= e!482452 tp_is_empty!16849)))

(declare-fun b!866077 () Bool)

(declare-fun e!482456 () Bool)

(declare-fun e!482455 () Bool)

(assert (=> b!866077 (= e!482456 (not e!482455))))

(declare-fun res!588467 () Bool)

(assert (=> b!866077 (=> res!588467 e!482455)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866077 (= res!588467 (not (validKeyInArray!0 (select (arr!23960 _keys!868) from!1053))))))

(declare-datatypes ((V!27513 0))(
  ( (V!27514 (val!8472 Int)) )
))
(declare-datatypes ((tuple2!11232 0))(
  ( (tuple2!11233 (_1!5627 (_ BitVec 64)) (_2!5627 V!27513)) )
))
(declare-datatypes ((List!17035 0))(
  ( (Nil!17032) (Cons!17031 (h!18162 tuple2!11232) (t!24014 List!17035)) )
))
(declare-datatypes ((ListLongMap!10001 0))(
  ( (ListLongMap!10002 (toList!5016 List!17035)) )
))
(declare-fun lt!392764 () ListLongMap!10001)

(declare-fun lt!392763 () ListLongMap!10001)

(assert (=> b!866077 (= lt!392764 lt!392763)))

(declare-fun lt!392773 () ListLongMap!10001)

(declare-fun lt!392762 () tuple2!11232)

(declare-fun +!2364 (ListLongMap!10001 tuple2!11232) ListLongMap!10001)

(assert (=> b!866077 (= lt!392763 (+!2364 lt!392773 lt!392762))))

(declare-datatypes ((ValueCell!7985 0))(
  ( (ValueCellFull!7985 (v!10897 V!27513)) (EmptyCell!7985) )
))
(declare-datatypes ((array!49860 0))(
  ( (array!49861 (arr!23961 (Array (_ BitVec 32) ValueCell!7985)) (size!24401 (_ BitVec 32))) )
))
(declare-fun lt!392774 () array!49860)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27513)

(declare-fun zeroValue!654 () V!27513)

(declare-fun getCurrentListMapNoExtraKeys!2987 (array!49858 array!49860 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) Int) ListLongMap!10001)

(assert (=> b!866077 (= lt!392764 (getCurrentListMapNoExtraKeys!2987 _keys!868 lt!392774 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27513)

(assert (=> b!866077 (= lt!392762 (tuple2!11233 k!854 v!557))))

(declare-fun _values!688 () array!49860)

(assert (=> b!866077 (= lt!392773 (getCurrentListMapNoExtraKeys!2987 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29681 0))(
  ( (Unit!29682) )
))
(declare-fun lt!392771 () Unit!29681)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!563 (array!49858 array!49860 (_ BitVec 32) (_ BitVec 32) V!27513 V!27513 (_ BitVec 32) (_ BitVec 64) V!27513 (_ BitVec 32) Int) Unit!29681)

(assert (=> b!866077 (= lt!392771 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!563 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866078 () Bool)

(declare-fun res!588473 () Bool)

(assert (=> b!866078 (=> (not res!588473) (not e!482454))))

(assert (=> b!866078 (= res!588473 (validKeyInArray!0 k!854))))

(declare-fun b!866079 () Bool)

(declare-fun e!482458 () Bool)

(assert (=> b!866079 (= e!482458 true)))

(declare-fun lt!392767 () tuple2!11232)

(declare-fun lt!392769 () ListLongMap!10001)

(assert (=> b!866079 (= lt!392769 (+!2364 (+!2364 lt!392773 lt!392767) lt!392762))))

(declare-fun lt!392761 () Unit!29681)

(declare-fun lt!392775 () V!27513)

(declare-fun addCommutativeForDiffKeys!532 (ListLongMap!10001 (_ BitVec 64) V!27513 (_ BitVec 64) V!27513) Unit!29681)

(assert (=> b!866079 (= lt!392761 (addCommutativeForDiffKeys!532 lt!392773 k!854 v!557 (select (arr!23960 _keys!868) from!1053) lt!392775))))

(declare-fun b!866080 () Bool)

(assert (=> b!866080 (= e!482454 e!482456)))

(declare-fun res!588470 () Bool)

(assert (=> b!866080 (=> (not res!588470) (not e!482456))))

(assert (=> b!866080 (= res!588470 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392766 () ListLongMap!10001)

(assert (=> b!866080 (= lt!392766 (getCurrentListMapNoExtraKeys!2987 _keys!868 lt!392774 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866080 (= lt!392774 (array!49861 (store (arr!23961 _values!688) i!612 (ValueCellFull!7985 v!557)) (size!24401 _values!688)))))

(declare-fun lt!392770 () ListLongMap!10001)

(assert (=> b!866080 (= lt!392770 (getCurrentListMapNoExtraKeys!2987 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866081 () Bool)

(declare-fun res!588469 () Bool)

(assert (=> b!866081 (=> (not res!588469) (not e!482454))))

(assert (=> b!866081 (= res!588469 (and (= (size!24401 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24400 _keys!868) (size!24401 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866082 () Bool)

(declare-fun e!482457 () Bool)

(assert (=> b!866082 (= e!482457 tp_is_empty!16849)))

(declare-fun b!866083 () Bool)

(declare-fun e!482450 () Bool)

(declare-fun mapRes!26873 () Bool)

(assert (=> b!866083 (= e!482450 (and e!482452 mapRes!26873))))

(declare-fun condMapEmpty!26873 () Bool)

(declare-fun mapDefault!26873 () ValueCell!7985)

