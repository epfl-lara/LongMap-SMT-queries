; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73636 () Bool)

(assert start!73636)

(declare-fun b_free!14551 () Bool)

(declare-fun b_next!14551 () Bool)

(assert (=> start!73636 (= b_free!14551 (not b_next!14551))))

(declare-fun tp!51156 () Bool)

(declare-fun b_and!24081 () Bool)

(assert (=> start!73636 (= tp!51156 b_and!24081)))

(declare-fun mapIsEmpty!26630 () Bool)

(declare-fun mapRes!26630 () Bool)

(assert (=> mapIsEmpty!26630 mapRes!26630))

(declare-fun b!862032 () Bool)

(declare-fun e!480271 () Bool)

(declare-fun e!480270 () Bool)

(assert (=> b!862032 (= e!480271 e!480270)))

(declare-fun res!585799 () Bool)

(assert (=> b!862032 (=> (not res!585799) (not e!480270))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862032 (= res!585799 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27297 0))(
  ( (V!27298 (val!8391 Int)) )
))
(declare-fun minValue!654 () V!27297)

(declare-fun zeroValue!654 () V!27297)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11094 0))(
  ( (tuple2!11095 (_1!5558 (_ BitVec 64)) (_2!5558 V!27297)) )
))
(declare-datatypes ((List!16903 0))(
  ( (Nil!16900) (Cons!16899 (h!18030 tuple2!11094) (t!23720 List!16903)) )
))
(declare-datatypes ((ListLongMap!9863 0))(
  ( (ListLongMap!9864 (toList!4947 List!16903)) )
))
(declare-fun lt!388916 () ListLongMap!9863)

(declare-datatypes ((array!49538 0))(
  ( (array!49539 (arr!23800 (Array (_ BitVec 32) (_ BitVec 64))) (size!24240 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49538)

(declare-datatypes ((ValueCell!7904 0))(
  ( (ValueCellFull!7904 (v!10816 V!27297)) (EmptyCell!7904) )
))
(declare-datatypes ((array!49540 0))(
  ( (array!49541 (arr!23801 (Array (_ BitVec 32) ValueCell!7904)) (size!24241 (_ BitVec 32))) )
))
(declare-fun lt!388918 () array!49540)

(declare-fun getCurrentListMapNoExtraKeys!2923 (array!49538 array!49540 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) Int) ListLongMap!9863)

(assert (=> b!862032 (= lt!388916 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!388918 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27297)

(declare-fun _values!688 () array!49540)

(assert (=> b!862032 (= lt!388918 (array!49541 (store (arr!23801 _values!688) i!612 (ValueCellFull!7904 v!557)) (size!24241 _values!688)))))

(declare-fun lt!388908 () ListLongMap!9863)

(assert (=> b!862032 (= lt!388908 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!585802 () Bool)

(assert (=> start!73636 (=> (not res!585802) (not e!480271))))

(assert (=> start!73636 (= res!585802 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24240 _keys!868))))))

(assert (=> start!73636 e!480271))

(declare-fun tp_is_empty!16687 () Bool)

(assert (=> start!73636 tp_is_empty!16687))

(assert (=> start!73636 true))

(assert (=> start!73636 tp!51156))

(declare-fun array_inv!18830 (array!49538) Bool)

(assert (=> start!73636 (array_inv!18830 _keys!868)))

(declare-fun e!480276 () Bool)

(declare-fun array_inv!18831 (array!49540) Bool)

(assert (=> start!73636 (and (array_inv!18831 _values!688) e!480276)))

(declare-fun b!862033 () Bool)

(declare-fun e!480272 () Bool)

(assert (=> b!862033 (= e!480270 (not e!480272))))

(declare-fun res!585806 () Bool)

(assert (=> b!862033 (=> res!585806 e!480272)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862033 (= res!585806 (not (validKeyInArray!0 (select (arr!23800 _keys!868) from!1053))))))

(declare-fun lt!388915 () ListLongMap!9863)

(declare-fun lt!388914 () ListLongMap!9863)

(assert (=> b!862033 (= lt!388915 lt!388914)))

(declare-fun lt!388912 () ListLongMap!9863)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2297 (ListLongMap!9863 tuple2!11094) ListLongMap!9863)

(assert (=> b!862033 (= lt!388914 (+!2297 lt!388912 (tuple2!11095 k!854 v!557)))))

(assert (=> b!862033 (= lt!388915 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!388918 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862033 (= lt!388912 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29421 0))(
  ( (Unit!29422) )
))
(declare-fun lt!388909 () Unit!29421)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!507 (array!49538 array!49540 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) (_ BitVec 64) V!27297 (_ BitVec 32) Int) Unit!29421)

(assert (=> b!862033 (= lt!388909 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!507 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862034 () Bool)

(declare-fun res!585797 () Bool)

(assert (=> b!862034 (=> (not res!585797) (not e!480271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862034 (= res!585797 (validMask!0 mask!1196))))

(declare-fun b!862035 () Bool)

(declare-fun res!585804 () Bool)

(assert (=> b!862035 (=> (not res!585804) (not e!480271))))

(declare-datatypes ((List!16904 0))(
  ( (Nil!16901) (Cons!16900 (h!18031 (_ BitVec 64)) (t!23721 List!16904)) )
))
(declare-fun arrayNoDuplicates!0 (array!49538 (_ BitVec 32) List!16904) Bool)

(assert (=> b!862035 (= res!585804 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16901))))

(declare-fun b!862036 () Bool)

(declare-fun e!480275 () Unit!29421)

(declare-fun Unit!29423 () Unit!29421)

(assert (=> b!862036 (= e!480275 Unit!29423)))

(declare-fun lt!388917 () Unit!29421)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49538 (_ BitVec 32) (_ BitVec 32)) Unit!29421)

(assert (=> b!862036 (= lt!388917 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862036 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16901)))

(declare-fun lt!388911 () Unit!29421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29421)

(assert (=> b!862036 (= lt!388911 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862036 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388913 () Unit!29421)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49538 (_ BitVec 64) (_ BitVec 32) List!16904) Unit!29421)

(assert (=> b!862036 (= lt!388913 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16901))))

(assert (=> b!862036 false))

(declare-fun b!862037 () Bool)

(declare-fun res!585803 () Bool)

(assert (=> b!862037 (=> (not res!585803) (not e!480271))))

(assert (=> b!862037 (= res!585803 (validKeyInArray!0 k!854))))

(declare-fun b!862038 () Bool)

(declare-fun Unit!29424 () Unit!29421)

(assert (=> b!862038 (= e!480275 Unit!29424)))

(declare-fun b!862039 () Bool)

(declare-fun e!480277 () Bool)

(assert (=> b!862039 (= e!480276 (and e!480277 mapRes!26630))))

(declare-fun condMapEmpty!26630 () Bool)

(declare-fun mapDefault!26630 () ValueCell!7904)

