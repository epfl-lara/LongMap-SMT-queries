; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73840 () Bool)

(assert start!73840)

(declare-fun b_free!14755 () Bool)

(declare-fun b_next!14755 () Bool)

(assert (=> start!73840 (= b_free!14755 (not b_next!14755))))

(declare-fun tp!51769 () Bool)

(declare-fun b_and!24489 () Bool)

(assert (=> start!73840 (= tp!51769 b_and!24489)))

(declare-fun b!867125 () Bool)

(declare-fun res!589165 () Bool)

(declare-fun e!483018 () Bool)

(assert (=> b!867125 (=> (not res!589165) (not e!483018))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867125 (= res!589165 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26936 () Bool)

(declare-fun mapRes!26936 () Bool)

(declare-fun tp!51768 () Bool)

(declare-fun e!483017 () Bool)

(assert (=> mapNonEmpty!26936 (= mapRes!26936 (and tp!51768 e!483017))))

(declare-fun mapKey!26936 () (_ BitVec 32))

(declare-datatypes ((V!27569 0))(
  ( (V!27570 (val!8493 Int)) )
))
(declare-datatypes ((ValueCell!8006 0))(
  ( (ValueCellFull!8006 (v!10918 V!27569)) (EmptyCell!8006) )
))
(declare-fun mapRest!26936 () (Array (_ BitVec 32) ValueCell!8006))

(declare-datatypes ((array!49942 0))(
  ( (array!49943 (arr!24002 (Array (_ BitVec 32) ValueCell!8006)) (size!24442 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49942)

(declare-fun mapValue!26936 () ValueCell!8006)

(assert (=> mapNonEmpty!26936 (= (arr!24002 _values!688) (store mapRest!26936 mapKey!26936 mapValue!26936))))

(declare-fun b!867126 () Bool)

(declare-datatypes ((Unit!29736 0))(
  ( (Unit!29737) )
))
(declare-fun e!483022 () Unit!29736)

(declare-fun Unit!29738 () Unit!29736)

(assert (=> b!867126 (= e!483022 Unit!29738)))

(declare-fun lt!393774 () Unit!29736)

(declare-datatypes ((array!49944 0))(
  ( (array!49945 (arr!24003 (Array (_ BitVec 32) (_ BitVec 64))) (size!24443 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49944)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49944 (_ BitVec 32) (_ BitVec 32)) Unit!29736)

(assert (=> b!867126 (= lt!393774 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17064 0))(
  ( (Nil!17061) (Cons!17060 (h!18191 (_ BitVec 64)) (t!24085 List!17064)) )
))
(declare-fun arrayNoDuplicates!0 (array!49944 (_ BitVec 32) List!17064) Bool)

(assert (=> b!867126 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17061)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393776 () Unit!29736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49944 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29736)

(assert (=> b!867126 (= lt!393776 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867126 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393779 () Unit!29736)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49944 (_ BitVec 64) (_ BitVec 32) List!17064) Unit!29736)

(assert (=> b!867126 (= lt!393779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17061))))

(assert (=> b!867126 false))

(declare-fun b!867127 () Bool)

(declare-fun tp_is_empty!16891 () Bool)

(assert (=> b!867127 (= e!483017 tp_is_empty!16891)))

(declare-fun mapIsEmpty!26936 () Bool)

(assert (=> mapIsEmpty!26936 mapRes!26936))

(declare-fun b!867128 () Bool)

(declare-fun res!589164 () Bool)

(assert (=> b!867128 (=> (not res!589164) (not e!483018))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867128 (= res!589164 (validMask!0 mask!1196))))

(declare-fun b!867129 () Bool)

(declare-fun e!483025 () Bool)

(assert (=> b!867129 (= e!483018 e!483025)))

(declare-fun res!589163 () Bool)

(assert (=> b!867129 (=> (not res!589163) (not e!483025))))

(assert (=> b!867129 (= res!589163 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11266 0))(
  ( (tuple2!11267 (_1!5644 (_ BitVec 64)) (_2!5644 V!27569)) )
))
(declare-datatypes ((List!17065 0))(
  ( (Nil!17062) (Cons!17061 (h!18192 tuple2!11266) (t!24086 List!17065)) )
))
(declare-datatypes ((ListLongMap!10035 0))(
  ( (ListLongMap!10036 (toList!5033 List!17065)) )
))
(declare-fun lt!393781 () ListLongMap!10035)

(declare-fun lt!393775 () array!49942)

(declare-fun minValue!654 () V!27569)

(declare-fun zeroValue!654 () V!27569)

(declare-fun getCurrentListMapNoExtraKeys!3003 (array!49944 array!49942 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) Int) ListLongMap!10035)

(assert (=> b!867129 (= lt!393781 (getCurrentListMapNoExtraKeys!3003 _keys!868 lt!393775 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27569)

(assert (=> b!867129 (= lt!393775 (array!49943 (store (arr!24002 _values!688) i!612 (ValueCellFull!8006 v!557)) (size!24442 _values!688)))))

(declare-fun lt!393772 () ListLongMap!10035)

(assert (=> b!867129 (= lt!393772 (getCurrentListMapNoExtraKeys!3003 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867130 () Bool)

(declare-fun res!589159 () Bool)

(assert (=> b!867130 (=> (not res!589159) (not e!483018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49944 (_ BitVec 32)) Bool)

(assert (=> b!867130 (= res!589159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867131 () Bool)

(declare-fun res!589162 () Bool)

(assert (=> b!867131 (=> (not res!589162) (not e!483018))))

(assert (=> b!867131 (= res!589162 (and (= (size!24442 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24443 _keys!868) (size!24442 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867132 () Bool)

(declare-fun e!483019 () Bool)

(assert (=> b!867132 (= e!483025 (not e!483019))))

(declare-fun res!589161 () Bool)

(assert (=> b!867132 (=> res!589161 e!483019)))

(assert (=> b!867132 (= res!589161 (not (validKeyInArray!0 (select (arr!24003 _keys!868) from!1053))))))

(declare-fun lt!393778 () ListLongMap!10035)

(declare-fun lt!393782 () ListLongMap!10035)

(assert (=> b!867132 (= lt!393778 lt!393782)))

(declare-fun lt!393773 () ListLongMap!10035)

(declare-fun lt!393784 () tuple2!11266)

(declare-fun +!2379 (ListLongMap!10035 tuple2!11266) ListLongMap!10035)

(assert (=> b!867132 (= lt!393782 (+!2379 lt!393773 lt!393784))))

(assert (=> b!867132 (= lt!393778 (getCurrentListMapNoExtraKeys!3003 _keys!868 lt!393775 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867132 (= lt!393784 (tuple2!11267 k!854 v!557))))

(assert (=> b!867132 (= lt!393773 (getCurrentListMapNoExtraKeys!3003 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393769 () Unit!29736)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!575 (array!49944 array!49942 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) (_ BitVec 64) V!27569 (_ BitVec 32) Int) Unit!29736)

(assert (=> b!867132 (= lt!393769 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!575 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867134 () Bool)

(declare-fun res!589156 () Bool)

(assert (=> b!867134 (=> (not res!589156) (not e!483018))))

(assert (=> b!867134 (= res!589156 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17061))))

(declare-fun b!867135 () Bool)

(declare-fun e!483021 () Bool)

(assert (=> b!867135 (= e!483019 e!483021)))

(declare-fun res!589157 () Bool)

(assert (=> b!867135 (=> res!589157 e!483021)))

(assert (=> b!867135 (= res!589157 (= k!854 (select (arr!24003 _keys!868) from!1053)))))

(assert (=> b!867135 (not (= (select (arr!24003 _keys!868) from!1053) k!854))))

(declare-fun lt!393780 () Unit!29736)

(assert (=> b!867135 (= lt!393780 e!483022)))

(declare-fun c!92353 () Bool)

(assert (=> b!867135 (= c!92353 (= (select (arr!24003 _keys!868) from!1053) k!854))))

(declare-fun lt!393770 () ListLongMap!10035)

(assert (=> b!867135 (= lt!393781 lt!393770)))

(declare-fun lt!393783 () tuple2!11266)

(assert (=> b!867135 (= lt!393770 (+!2379 lt!393782 lt!393783))))

(declare-fun lt!393777 () V!27569)

(assert (=> b!867135 (= lt!393783 (tuple2!11267 (select (arr!24003 _keys!868) from!1053) lt!393777))))

(declare-fun get!12693 (ValueCell!8006 V!27569) V!27569)

(declare-fun dynLambda!1197 (Int (_ BitVec 64)) V!27569)

(assert (=> b!867135 (= lt!393777 (get!12693 (select (arr!24002 _values!688) from!1053) (dynLambda!1197 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867136 () Bool)

(declare-fun e!483023 () Bool)

(declare-fun e!483024 () Bool)

(assert (=> b!867136 (= e!483023 (and e!483024 mapRes!26936))))

(declare-fun condMapEmpty!26936 () Bool)

(declare-fun mapDefault!26936 () ValueCell!8006)

