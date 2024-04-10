; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73754 () Bool)

(assert start!73754)

(declare-fun b_free!14669 () Bool)

(declare-fun b_next!14669 () Bool)

(assert (=> start!73754 (= b_free!14669 (not b_next!14669))))

(declare-fun tp!51511 () Bool)

(declare-fun b_and!24317 () Bool)

(assert (=> start!73754 (= tp!51511 b_and!24317)))

(declare-fun b!864975 () Bool)

(declare-fun e!481862 () Bool)

(declare-fun tp_is_empty!16805 () Bool)

(assert (=> b!864975 (= e!481862 tp_is_empty!16805)))

(declare-fun b!864976 () Bool)

(declare-fun res!587737 () Bool)

(declare-fun e!481864 () Bool)

(assert (=> b!864976 (=> (not res!587737) (not e!481864))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864976 (= res!587737 (validKeyInArray!0 k!854))))

(declare-fun b!864977 () Bool)

(declare-datatypes ((Unit!29610 0))(
  ( (Unit!29611) )
))
(declare-fun e!481860 () Unit!29610)

(declare-fun Unit!29612 () Unit!29610)

(assert (=> b!864977 (= e!481860 Unit!29612)))

(declare-fun lt!391709 () Unit!29610)

(declare-datatypes ((array!49770 0))(
  ( (array!49771 (arr!23916 (Array (_ BitVec 32) (_ BitVec 64))) (size!24356 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49770)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49770 (_ BitVec 32) (_ BitVec 32)) Unit!29610)

(assert (=> b!864977 (= lt!391709 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16999 0))(
  ( (Nil!16996) (Cons!16995 (h!18126 (_ BitVec 64)) (t!23934 List!16999)) )
))
(declare-fun arrayNoDuplicates!0 (array!49770 (_ BitVec 32) List!16999) Bool)

(assert (=> b!864977 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16996)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391720 () Unit!29610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49770 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29610)

(assert (=> b!864977 (= lt!391720 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864977 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391707 () Unit!29610)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49770 (_ BitVec 64) (_ BitVec 32) List!16999) Unit!29610)

(assert (=> b!864977 (= lt!391707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16996))))

(assert (=> b!864977 false))

(declare-fun b!864978 () Bool)

(declare-fun e!481861 () Bool)

(assert (=> b!864978 (= e!481864 e!481861)))

(declare-fun res!587742 () Bool)

(assert (=> b!864978 (=> (not res!587742) (not e!481861))))

(assert (=> b!864978 (= res!587742 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27453 0))(
  ( (V!27454 (val!8450 Int)) )
))
(declare-datatypes ((ValueCell!7963 0))(
  ( (ValueCellFull!7963 (v!10875 V!27453)) (EmptyCell!7963) )
))
(declare-datatypes ((array!49772 0))(
  ( (array!49773 (arr!23917 (Array (_ BitVec 32) ValueCell!7963)) (size!24357 (_ BitVec 32))) )
))
(declare-fun lt!391718 () array!49772)

(declare-fun minValue!654 () V!27453)

(declare-fun zeroValue!654 () V!27453)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11196 0))(
  ( (tuple2!11197 (_1!5609 (_ BitVec 64)) (_2!5609 V!27453)) )
))
(declare-datatypes ((List!17000 0))(
  ( (Nil!16997) (Cons!16996 (h!18127 tuple2!11196) (t!23935 List!17000)) )
))
(declare-datatypes ((ListLongMap!9965 0))(
  ( (ListLongMap!9966 (toList!4998 List!17000)) )
))
(declare-fun lt!391713 () ListLongMap!9965)

(declare-fun getCurrentListMapNoExtraKeys!2969 (array!49770 array!49772 (_ BitVec 32) (_ BitVec 32) V!27453 V!27453 (_ BitVec 32) Int) ListLongMap!9965)

(assert (=> b!864978 (= lt!391713 (getCurrentListMapNoExtraKeys!2969 _keys!868 lt!391718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27453)

(declare-fun _values!688 () array!49772)

(assert (=> b!864978 (= lt!391718 (array!49773 (store (arr!23917 _values!688) i!612 (ValueCellFull!7963 v!557)) (size!24357 _values!688)))))

(declare-fun lt!391708 () ListLongMap!9965)

(assert (=> b!864978 (= lt!391708 (getCurrentListMapNoExtraKeys!2969 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864979 () Bool)

(declare-fun e!481863 () Bool)

(declare-fun e!481856 () Bool)

(assert (=> b!864979 (= e!481863 e!481856)))

(declare-fun res!587741 () Bool)

(assert (=> b!864979 (=> res!587741 e!481856)))

(assert (=> b!864979 (= res!587741 (= k!854 (select (arr!23916 _keys!868) from!1053)))))

(assert (=> b!864979 (not (= (select (arr!23916 _keys!868) from!1053) k!854))))

(declare-fun lt!391715 () Unit!29610)

(assert (=> b!864979 (= lt!391715 e!481860)))

(declare-fun c!92224 () Bool)

(assert (=> b!864979 (= c!92224 (= (select (arr!23916 _keys!868) from!1053) k!854))))

(declare-fun lt!391706 () ListLongMap!9965)

(assert (=> b!864979 (= lt!391713 lt!391706)))

(declare-fun lt!391717 () ListLongMap!9965)

(declare-fun lt!391719 () tuple2!11196)

(declare-fun +!2347 (ListLongMap!9965 tuple2!11196) ListLongMap!9965)

(assert (=> b!864979 (= lt!391706 (+!2347 lt!391717 lt!391719))))

(declare-fun lt!391714 () V!27453)

(assert (=> b!864979 (= lt!391719 (tuple2!11197 (select (arr!23916 _keys!868) from!1053) lt!391714))))

(declare-fun get!12637 (ValueCell!7963 V!27453) V!27453)

(declare-fun dynLambda!1171 (Int (_ BitVec 64)) V!27453)

(assert (=> b!864979 (= lt!391714 (get!12637 (select (arr!23917 _values!688) from!1053) (dynLambda!1171 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864980 () Bool)

(assert (=> b!864980 (= e!481861 (not e!481863))))

(declare-fun res!587738 () Bool)

(assert (=> b!864980 (=> res!587738 e!481863)))

(assert (=> b!864980 (= res!587738 (not (validKeyInArray!0 (select (arr!23916 _keys!868) from!1053))))))

(declare-fun lt!391705 () ListLongMap!9965)

(assert (=> b!864980 (= lt!391705 lt!391717)))

(declare-fun lt!391716 () ListLongMap!9965)

(declare-fun lt!391712 () tuple2!11196)

(assert (=> b!864980 (= lt!391717 (+!2347 lt!391716 lt!391712))))

(assert (=> b!864980 (= lt!391705 (getCurrentListMapNoExtraKeys!2969 _keys!868 lt!391718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864980 (= lt!391712 (tuple2!11197 k!854 v!557))))

(assert (=> b!864980 (= lt!391716 (getCurrentListMapNoExtraKeys!2969 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391711 () Unit!29610)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!549 (array!49770 array!49772 (_ BitVec 32) (_ BitVec 32) V!27453 V!27453 (_ BitVec 32) (_ BitVec 64) V!27453 (_ BitVec 32) Int) Unit!29610)

(assert (=> b!864980 (= lt!391711 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!549 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864981 () Bool)

(declare-fun res!587743 () Bool)

(assert (=> b!864981 (=> (not res!587743) (not e!481864))))

(assert (=> b!864981 (= res!587743 (and (= (size!24357 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24356 _keys!868) (size!24357 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864983 () Bool)

(declare-fun res!587746 () Bool)

(assert (=> b!864983 (=> (not res!587746) (not e!481864))))

(assert (=> b!864983 (= res!587746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16996))))

(declare-fun b!864984 () Bool)

(declare-fun res!587745 () Bool)

(assert (=> b!864984 (=> (not res!587745) (not e!481864))))

(assert (=> b!864984 (= res!587745 (and (= (select (arr!23916 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26807 () Bool)

(declare-fun mapRes!26807 () Bool)

(assert (=> mapIsEmpty!26807 mapRes!26807))

(declare-fun b!864985 () Bool)

(declare-fun res!587739 () Bool)

(assert (=> b!864985 (=> (not res!587739) (not e!481864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864985 (= res!587739 (validMask!0 mask!1196))))

(declare-fun b!864986 () Bool)

(declare-fun e!481859 () Bool)

(assert (=> b!864986 (= e!481859 (and e!481862 mapRes!26807))))

(declare-fun condMapEmpty!26807 () Bool)

(declare-fun mapDefault!26807 () ValueCell!7963)

