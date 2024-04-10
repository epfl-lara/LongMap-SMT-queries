; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73756 () Bool)

(assert start!73756)

(declare-fun b_free!14671 () Bool)

(declare-fun b_next!14671 () Bool)

(assert (=> start!73756 (= b_free!14671 (not b_next!14671))))

(declare-fun tp!51516 () Bool)

(declare-fun b_and!24321 () Bool)

(assert (=> start!73756 (= tp!51516 b_and!24321)))

(declare-fun b!865026 () Bool)

(declare-fun res!587775 () Bool)

(declare-fun e!481884 () Bool)

(assert (=> b!865026 (=> (not res!587775) (not e!481884))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49774 0))(
  ( (array!49775 (arr!23918 (Array (_ BitVec 32) (_ BitVec 64))) (size!24358 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49774)

(declare-datatypes ((V!27457 0))(
  ( (V!27458 (val!8451 Int)) )
))
(declare-datatypes ((ValueCell!7964 0))(
  ( (ValueCellFull!7964 (v!10876 V!27457)) (EmptyCell!7964) )
))
(declare-datatypes ((array!49776 0))(
  ( (array!49777 (arr!23919 (Array (_ BitVec 32) ValueCell!7964)) (size!24359 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49776)

(assert (=> b!865026 (= res!587775 (and (= (size!24359 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24358 _keys!868) (size!24359 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26810 () Bool)

(declare-fun mapRes!26810 () Bool)

(assert (=> mapIsEmpty!26810 mapRes!26810))

(declare-fun b!865027 () Bool)

(declare-fun e!481883 () Bool)

(declare-fun tp_is_empty!16807 () Bool)

(assert (=> b!865027 (= e!481883 tp_is_empty!16807)))

(declare-fun b!865028 () Bool)

(declare-fun res!587774 () Bool)

(assert (=> b!865028 (=> (not res!587774) (not e!481884))))

(declare-datatypes ((List!17001 0))(
  ( (Nil!16998) (Cons!16997 (h!18128 (_ BitVec 64)) (t!23938 List!17001)) )
))
(declare-fun arrayNoDuplicates!0 (array!49774 (_ BitVec 32) List!17001) Bool)

(assert (=> b!865028 (= res!587774 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16998))))

(declare-fun b!865029 () Bool)

(declare-datatypes ((Unit!29613 0))(
  ( (Unit!29614) )
))
(declare-fun e!481889 () Unit!29613)

(declare-fun Unit!29615 () Unit!29613)

(assert (=> b!865029 (= e!481889 Unit!29615)))

(declare-fun mapNonEmpty!26810 () Bool)

(declare-fun tp!51517 () Bool)

(declare-fun e!481891 () Bool)

(assert (=> mapNonEmpty!26810 (= mapRes!26810 (and tp!51517 e!481891))))

(declare-fun mapRest!26810 () (Array (_ BitVec 32) ValueCell!7964))

(declare-fun mapValue!26810 () ValueCell!7964)

(declare-fun mapKey!26810 () (_ BitVec 32))

(assert (=> mapNonEmpty!26810 (= (arr!23919 _values!688) (store mapRest!26810 mapKey!26810 mapValue!26810))))

(declare-fun b!865030 () Bool)

(declare-fun e!481888 () Bool)

(declare-fun e!481887 () Bool)

(assert (=> b!865030 (= e!481888 e!481887)))

(declare-fun res!587771 () Bool)

(assert (=> b!865030 (=> res!587771 e!481887)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865030 (= res!587771 (= k!854 (select (arr!23918 _keys!868) from!1053)))))

(assert (=> b!865030 (not (= (select (arr!23918 _keys!868) from!1053) k!854))))

(declare-fun lt!391754 () Unit!29613)

(assert (=> b!865030 (= lt!391754 e!481889)))

(declare-fun c!92227 () Bool)

(assert (=> b!865030 (= c!92227 (= (select (arr!23918 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11198 0))(
  ( (tuple2!11199 (_1!5610 (_ BitVec 64)) (_2!5610 V!27457)) )
))
(declare-datatypes ((List!17002 0))(
  ( (Nil!16999) (Cons!16998 (h!18129 tuple2!11198) (t!23939 List!17002)) )
))
(declare-datatypes ((ListLongMap!9967 0))(
  ( (ListLongMap!9968 (toList!4999 List!17002)) )
))
(declare-fun lt!391768 () ListLongMap!9967)

(declare-fun lt!391761 () ListLongMap!9967)

(assert (=> b!865030 (= lt!391768 lt!391761)))

(declare-fun lt!391759 () ListLongMap!9967)

(declare-fun lt!391763 () tuple2!11198)

(declare-fun +!2348 (ListLongMap!9967 tuple2!11198) ListLongMap!9967)

(assert (=> b!865030 (= lt!391761 (+!2348 lt!391759 lt!391763))))

(declare-fun lt!391765 () V!27457)

(assert (=> b!865030 (= lt!391763 (tuple2!11199 (select (arr!23918 _keys!868) from!1053) lt!391765))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12640 (ValueCell!7964 V!27457) V!27457)

(declare-fun dynLambda!1172 (Int (_ BitVec 64)) V!27457)

(assert (=> b!865030 (= lt!391765 (get!12640 (select (arr!23919 _values!688) from!1053) (dynLambda!1172 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865031 () Bool)

(declare-fun e!481890 () Bool)

(assert (=> b!865031 (= e!481890 (not e!481888))))

(declare-fun res!587778 () Bool)

(assert (=> b!865031 (=> res!587778 e!481888)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865031 (= res!587778 (not (validKeyInArray!0 (select (arr!23918 _keys!868) from!1053))))))

(declare-fun lt!391764 () ListLongMap!9967)

(assert (=> b!865031 (= lt!391764 lt!391759)))

(declare-fun lt!391758 () ListLongMap!9967)

(declare-fun lt!391760 () tuple2!11198)

(assert (=> b!865031 (= lt!391759 (+!2348 lt!391758 lt!391760))))

(declare-fun lt!391757 () array!49776)

(declare-fun minValue!654 () V!27457)

(declare-fun zeroValue!654 () V!27457)

(declare-fun getCurrentListMapNoExtraKeys!2970 (array!49774 array!49776 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) Int) ListLongMap!9967)

(assert (=> b!865031 (= lt!391764 (getCurrentListMapNoExtraKeys!2970 _keys!868 lt!391757 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27457)

(assert (=> b!865031 (= lt!391760 (tuple2!11199 k!854 v!557))))

(assert (=> b!865031 (= lt!391758 (getCurrentListMapNoExtraKeys!2970 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391753 () Unit!29613)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 (array!49774 array!49776 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) (_ BitVec 64) V!27457 (_ BitVec 32) Int) Unit!29613)

(assert (=> b!865031 (= lt!391753 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865032 () Bool)

(declare-fun res!587779 () Bool)

(assert (=> b!865032 (=> (not res!587779) (not e!481884))))

(assert (=> b!865032 (= res!587779 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24358 _keys!868))))))

(declare-fun b!865033 () Bool)

(assert (=> b!865033 (= e!481891 tp_is_empty!16807)))

(declare-fun b!865034 () Bool)

(assert (=> b!865034 (= e!481887 true)))

(assert (=> b!865034 (= lt!391761 (+!2348 (+!2348 lt!391758 lt!391763) lt!391760))))

(declare-fun lt!391762 () Unit!29613)

(declare-fun addCommutativeForDiffKeys!517 (ListLongMap!9967 (_ BitVec 64) V!27457 (_ BitVec 64) V!27457) Unit!29613)

(assert (=> b!865034 (= lt!391762 (addCommutativeForDiffKeys!517 lt!391758 k!854 v!557 (select (arr!23918 _keys!868) from!1053) lt!391765))))

(declare-fun b!865025 () Bool)

(declare-fun res!587773 () Bool)

(assert (=> b!865025 (=> (not res!587773) (not e!481884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865025 (= res!587773 (validMask!0 mask!1196))))

(declare-fun res!587772 () Bool)

(assert (=> start!73756 (=> (not res!587772) (not e!481884))))

(assert (=> start!73756 (= res!587772 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24358 _keys!868))))))

(assert (=> start!73756 e!481884))

(assert (=> start!73756 tp_is_empty!16807))

(assert (=> start!73756 true))

(assert (=> start!73756 tp!51516))

(declare-fun array_inv!18910 (array!49774) Bool)

(assert (=> start!73756 (array_inv!18910 _keys!868)))

(declare-fun e!481886 () Bool)

(declare-fun array_inv!18911 (array!49776) Bool)

(assert (=> start!73756 (and (array_inv!18911 _values!688) e!481886)))

(declare-fun b!865035 () Bool)

(declare-fun Unit!29616 () Unit!29613)

(assert (=> b!865035 (= e!481889 Unit!29616)))

(declare-fun lt!391767 () Unit!29613)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49774 (_ BitVec 32) (_ BitVec 32)) Unit!29613)

(assert (=> b!865035 (= lt!391767 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865035 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16998)))

(declare-fun lt!391755 () Unit!29613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49774 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29613)

(assert (=> b!865035 (= lt!391755 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865035 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391756 () Unit!29613)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49774 (_ BitVec 64) (_ BitVec 32) List!17001) Unit!29613)

(assert (=> b!865035 (= lt!391756 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16998))))

(assert (=> b!865035 false))

(declare-fun b!865036 () Bool)

(assert (=> b!865036 (= e!481886 (and e!481883 mapRes!26810))))

(declare-fun condMapEmpty!26810 () Bool)

(declare-fun mapDefault!26810 () ValueCell!7964)

