; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73718 () Bool)

(assert start!73718)

(declare-fun b_free!14633 () Bool)

(declare-fun b_next!14633 () Bool)

(assert (=> start!73718 (= b_free!14633 (not b_next!14633))))

(declare-fun tp!51402 () Bool)

(declare-fun b_and!24245 () Bool)

(assert (=> start!73718 (= tp!51402 b_and!24245)))

(declare-fun b!864075 () Bool)

(declare-datatypes ((Unit!29553 0))(
  ( (Unit!29554) )
))
(declare-fun e!481371 () Unit!29553)

(declare-fun Unit!29555 () Unit!29553)

(assert (=> b!864075 (= e!481371 Unit!29555)))

(declare-fun lt!390845 () Unit!29553)

(declare-datatypes ((array!49700 0))(
  ( (array!49701 (arr!23881 (Array (_ BitVec 32) (_ BitVec 64))) (size!24321 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49700)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49700 (_ BitVec 32) (_ BitVec 32)) Unit!29553)

(assert (=> b!864075 (= lt!390845 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16971 0))(
  ( (Nil!16968) (Cons!16967 (h!18098 (_ BitVec 64)) (t!23870 List!16971)) )
))
(declare-fun arrayNoDuplicates!0 (array!49700 (_ BitVec 32) List!16971) Bool)

(assert (=> b!864075 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16968)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390841 () Unit!29553)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29553)

(assert (=> b!864075 (= lt!390841 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864075 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390850 () Unit!29553)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49700 (_ BitVec 64) (_ BitVec 32) List!16971) Unit!29553)

(assert (=> b!864075 (= lt!390850 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16968))))

(assert (=> b!864075 false))

(declare-fun b!864076 () Bool)

(declare-fun res!587151 () Bool)

(declare-fun e!481372 () Bool)

(assert (=> b!864076 (=> (not res!587151) (not e!481372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864076 (= res!587151 (validKeyInArray!0 k!854))))

(declare-fun b!864077 () Bool)

(declare-fun e!481370 () Bool)

(declare-fun e!481376 () Bool)

(assert (=> b!864077 (= e!481370 (not e!481376))))

(declare-fun res!587152 () Bool)

(assert (=> b!864077 (=> res!587152 e!481376)))

(assert (=> b!864077 (= res!587152 (not (validKeyInArray!0 (select (arr!23881 _keys!868) from!1053))))))

(declare-datatypes ((V!27405 0))(
  ( (V!27406 (val!8432 Int)) )
))
(declare-datatypes ((tuple2!11166 0))(
  ( (tuple2!11167 (_1!5594 (_ BitVec 64)) (_2!5594 V!27405)) )
))
(declare-datatypes ((List!16972 0))(
  ( (Nil!16969) (Cons!16968 (h!18099 tuple2!11166) (t!23871 List!16972)) )
))
(declare-datatypes ((ListLongMap!9935 0))(
  ( (ListLongMap!9936 (toList!4983 List!16972)) )
))
(declare-fun lt!390843 () ListLongMap!9935)

(declare-fun lt!390848 () ListLongMap!9935)

(assert (=> b!864077 (= lt!390843 lt!390848)))

(declare-fun lt!390846 () ListLongMap!9935)

(declare-fun lt!390854 () tuple2!11166)

(declare-fun +!2332 (ListLongMap!9935 tuple2!11166) ListLongMap!9935)

(assert (=> b!864077 (= lt!390848 (+!2332 lt!390846 lt!390854))))

(declare-datatypes ((ValueCell!7945 0))(
  ( (ValueCellFull!7945 (v!10857 V!27405)) (EmptyCell!7945) )
))
(declare-datatypes ((array!49702 0))(
  ( (array!49703 (arr!23882 (Array (_ BitVec 32) ValueCell!7945)) (size!24322 (_ BitVec 32))) )
))
(declare-fun lt!390855 () array!49702)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27405)

(declare-fun zeroValue!654 () V!27405)

(declare-fun getCurrentListMapNoExtraKeys!2956 (array!49700 array!49702 (_ BitVec 32) (_ BitVec 32) V!27405 V!27405 (_ BitVec 32) Int) ListLongMap!9935)

(assert (=> b!864077 (= lt!390843 (getCurrentListMapNoExtraKeys!2956 _keys!868 lt!390855 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27405)

(assert (=> b!864077 (= lt!390854 (tuple2!11167 k!854 v!557))))

(declare-fun _values!688 () array!49702)

(assert (=> b!864077 (= lt!390846 (getCurrentListMapNoExtraKeys!2956 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390847 () Unit!29553)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!536 (array!49700 array!49702 (_ BitVec 32) (_ BitVec 32) V!27405 V!27405 (_ BitVec 32) (_ BitVec 64) V!27405 (_ BitVec 32) Int) Unit!29553)

(assert (=> b!864077 (= lt!390847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!536 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864078 () Bool)

(declare-fun res!587150 () Bool)

(assert (=> b!864078 (=> (not res!587150) (not e!481372))))

(assert (=> b!864078 (= res!587150 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16968))))

(declare-fun mapIsEmpty!26753 () Bool)

(declare-fun mapRes!26753 () Bool)

(assert (=> mapIsEmpty!26753 mapRes!26753))

(declare-fun b!864079 () Bool)

(declare-fun res!587143 () Bool)

(assert (=> b!864079 (=> (not res!587143) (not e!481372))))

(assert (=> b!864079 (= res!587143 (and (= (size!24322 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24321 _keys!868) (size!24322 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26753 () Bool)

(declare-fun tp!51403 () Bool)

(declare-fun e!481378 () Bool)

(assert (=> mapNonEmpty!26753 (= mapRes!26753 (and tp!51403 e!481378))))

(declare-fun mapValue!26753 () ValueCell!7945)

(declare-fun mapRest!26753 () (Array (_ BitVec 32) ValueCell!7945))

(declare-fun mapKey!26753 () (_ BitVec 32))

(assert (=> mapNonEmpty!26753 (= (arr!23882 _values!688) (store mapRest!26753 mapKey!26753 mapValue!26753))))

(declare-fun b!864080 () Bool)

(declare-fun tp_is_empty!16769 () Bool)

(assert (=> b!864080 (= e!481378 tp_is_empty!16769)))

(declare-fun b!864081 () Bool)

(declare-fun res!587148 () Bool)

(assert (=> b!864081 (=> (not res!587148) (not e!481372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864081 (= res!587148 (validMask!0 mask!1196))))

(declare-fun res!587153 () Bool)

(assert (=> start!73718 (=> (not res!587153) (not e!481372))))

(assert (=> start!73718 (= res!587153 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24321 _keys!868))))))

(assert (=> start!73718 e!481372))

(assert (=> start!73718 tp_is_empty!16769))

(assert (=> start!73718 true))

(assert (=> start!73718 tp!51402))

(declare-fun array_inv!18888 (array!49700) Bool)

(assert (=> start!73718 (array_inv!18888 _keys!868)))

(declare-fun e!481374 () Bool)

(declare-fun array_inv!18889 (array!49702) Bool)

(assert (=> start!73718 (and (array_inv!18889 _values!688) e!481374)))

(declare-fun b!864082 () Bool)

(declare-fun e!481373 () Bool)

(assert (=> b!864082 (= e!481373 tp_is_empty!16769)))

(declare-fun b!864083 () Bool)

(declare-fun e!481375 () Bool)

(assert (=> b!864083 (= e!481376 e!481375)))

(declare-fun res!587144 () Bool)

(assert (=> b!864083 (=> res!587144 e!481375)))

(assert (=> b!864083 (= res!587144 (= k!854 (select (arr!23881 _keys!868) from!1053)))))

(assert (=> b!864083 (not (= (select (arr!23881 _keys!868) from!1053) k!854))))

(declare-fun lt!390851 () Unit!29553)

(assert (=> b!864083 (= lt!390851 e!481371)))

(declare-fun c!92170 () Bool)

(assert (=> b!864083 (= c!92170 (= (select (arr!23881 _keys!868) from!1053) k!854))))

(declare-fun lt!390849 () ListLongMap!9935)

(declare-fun lt!390856 () ListLongMap!9935)

(assert (=> b!864083 (= lt!390849 lt!390856)))

(declare-fun lt!390844 () tuple2!11166)

(assert (=> b!864083 (= lt!390856 (+!2332 lt!390848 lt!390844))))

(declare-fun lt!390852 () V!27405)

(assert (=> b!864083 (= lt!390844 (tuple2!11167 (select (arr!23881 _keys!868) from!1053) lt!390852))))

(declare-fun get!12612 (ValueCell!7945 V!27405) V!27405)

(declare-fun dynLambda!1158 (Int (_ BitVec 64)) V!27405)

(assert (=> b!864083 (= lt!390852 (get!12612 (select (arr!23882 _values!688) from!1053) (dynLambda!1158 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864084 () Bool)

(declare-fun Unit!29556 () Unit!29553)

(assert (=> b!864084 (= e!481371 Unit!29556)))

(declare-fun b!864085 () Bool)

(declare-fun res!587149 () Bool)

(assert (=> b!864085 (=> (not res!587149) (not e!481372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49700 (_ BitVec 32)) Bool)

(assert (=> b!864085 (= res!587149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864086 () Bool)

(declare-fun res!587146 () Bool)

(assert (=> b!864086 (=> (not res!587146) (not e!481372))))

(assert (=> b!864086 (= res!587146 (and (= (select (arr!23881 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864087 () Bool)

(assert (=> b!864087 (= e!481375 true)))

(assert (=> b!864087 (= lt!390856 (+!2332 (+!2332 lt!390846 lt!390844) lt!390854))))

(declare-fun lt!390853 () Unit!29553)

(declare-fun addCommutativeForDiffKeys!505 (ListLongMap!9935 (_ BitVec 64) V!27405 (_ BitVec 64) V!27405) Unit!29553)

(assert (=> b!864087 (= lt!390853 (addCommutativeForDiffKeys!505 lt!390846 k!854 v!557 (select (arr!23881 _keys!868) from!1053) lt!390852))))

(declare-fun b!864088 () Bool)

(declare-fun res!587147 () Bool)

(assert (=> b!864088 (=> (not res!587147) (not e!481372))))

(assert (=> b!864088 (= res!587147 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24321 _keys!868))))))

(declare-fun b!864089 () Bool)

(assert (=> b!864089 (= e!481374 (and e!481373 mapRes!26753))))

(declare-fun condMapEmpty!26753 () Bool)

(declare-fun mapDefault!26753 () ValueCell!7945)

