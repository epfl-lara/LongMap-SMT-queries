; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73750 () Bool)

(assert start!73750)

(declare-fun b_free!14665 () Bool)

(declare-fun b_next!14665 () Bool)

(assert (=> start!73750 (= b_free!14665 (not b_next!14665))))

(declare-fun tp!51499 () Bool)

(declare-fun b_and!24309 () Bool)

(assert (=> start!73750 (= tp!51499 b_and!24309)))

(declare-fun b!864875 () Bool)

(declare-datatypes ((Unit!29602 0))(
  ( (Unit!29603) )
))
(declare-fun e!481810 () Unit!29602)

(declare-fun Unit!29604 () Unit!29602)

(assert (=> b!864875 (= e!481810 Unit!29604)))

(declare-fun res!587674 () Bool)

(declare-fun e!481804 () Bool)

(assert (=> start!73750 (=> (not res!587674) (not e!481804))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49762 0))(
  ( (array!49763 (arr!23912 (Array (_ BitVec 32) (_ BitVec 64))) (size!24352 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49762)

(assert (=> start!73750 (= res!587674 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24352 _keys!868))))))

(assert (=> start!73750 e!481804))

(declare-fun tp_is_empty!16801 () Bool)

(assert (=> start!73750 tp_is_empty!16801))

(assert (=> start!73750 true))

(assert (=> start!73750 tp!51499))

(declare-fun array_inv!18906 (array!49762) Bool)

(assert (=> start!73750 (array_inv!18906 _keys!868)))

(declare-datatypes ((V!27449 0))(
  ( (V!27450 (val!8448 Int)) )
))
(declare-datatypes ((ValueCell!7961 0))(
  ( (ValueCellFull!7961 (v!10873 V!27449)) (EmptyCell!7961) )
))
(declare-datatypes ((array!49764 0))(
  ( (array!49765 (arr!23913 (Array (_ BitVec 32) ValueCell!7961)) (size!24353 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49764)

(declare-fun e!481807 () Bool)

(declare-fun array_inv!18907 (array!49764) Bool)

(assert (=> start!73750 (and (array_inv!18907 _values!688) e!481807)))

(declare-fun b!864876 () Bool)

(declare-fun e!481808 () Bool)

(assert (=> b!864876 (= e!481808 tp_is_empty!16801)))

(declare-fun b!864877 () Bool)

(declare-fun Unit!29605 () Unit!29602)

(assert (=> b!864877 (= e!481810 Unit!29605)))

(declare-fun lt!391613 () Unit!29602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49762 (_ BitVec 32) (_ BitVec 32)) Unit!29602)

(assert (=> b!864877 (= lt!391613 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16995 0))(
  ( (Nil!16992) (Cons!16991 (h!18122 (_ BitVec 64)) (t!23926 List!16995)) )
))
(declare-fun arrayNoDuplicates!0 (array!49762 (_ BitVec 32) List!16995) Bool)

(assert (=> b!864877 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16992)))

(declare-fun lt!391610 () Unit!29602)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29602)

(assert (=> b!864877 (= lt!391610 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864877 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391623 () Unit!29602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49762 (_ BitVec 64) (_ BitVec 32) List!16995) Unit!29602)

(assert (=> b!864877 (= lt!391623 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16992))))

(assert (=> b!864877 false))

(declare-fun b!864878 () Bool)

(declare-fun res!587680 () Bool)

(assert (=> b!864878 (=> (not res!587680) (not e!481804))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864878 (= res!587680 (validMask!0 mask!1196))))

(declare-fun b!864879 () Bool)

(declare-fun res!587678 () Bool)

(assert (=> b!864879 (=> (not res!587678) (not e!481804))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!864879 (= res!587678 (and (= (size!24353 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24352 _keys!868) (size!24353 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864880 () Bool)

(declare-fun e!481803 () Bool)

(declare-fun e!481806 () Bool)

(assert (=> b!864880 (= e!481803 e!481806)))

(declare-fun res!587679 () Bool)

(assert (=> b!864880 (=> res!587679 e!481806)))

(assert (=> b!864880 (= res!587679 (= k!854 (select (arr!23912 _keys!868) from!1053)))))

(assert (=> b!864880 (not (= (select (arr!23912 _keys!868) from!1053) k!854))))

(declare-fun lt!391620 () Unit!29602)

(assert (=> b!864880 (= lt!391620 e!481810)))

(declare-fun c!92218 () Bool)

(assert (=> b!864880 (= c!92218 (= (select (arr!23912 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11192 0))(
  ( (tuple2!11193 (_1!5607 (_ BitVec 64)) (_2!5607 V!27449)) )
))
(declare-datatypes ((List!16996 0))(
  ( (Nil!16993) (Cons!16992 (h!18123 tuple2!11192) (t!23927 List!16996)) )
))
(declare-datatypes ((ListLongMap!9961 0))(
  ( (ListLongMap!9962 (toList!4996 List!16996)) )
))
(declare-fun lt!391612 () ListLongMap!9961)

(declare-fun lt!391614 () ListLongMap!9961)

(assert (=> b!864880 (= lt!391612 lt!391614)))

(declare-fun lt!391619 () ListLongMap!9961)

(declare-fun lt!391611 () tuple2!11192)

(declare-fun +!2345 (ListLongMap!9961 tuple2!11192) ListLongMap!9961)

(assert (=> b!864880 (= lt!391614 (+!2345 lt!391619 lt!391611))))

(declare-fun lt!391609 () V!27449)

(assert (=> b!864880 (= lt!391611 (tuple2!11193 (select (arr!23912 _keys!868) from!1053) lt!391609))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12635 (ValueCell!7961 V!27449) V!27449)

(declare-fun dynLambda!1169 (Int (_ BitVec 64)) V!27449)

(assert (=> b!864880 (= lt!391609 (get!12635 (select (arr!23913 _values!688) from!1053) (dynLambda!1169 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864881 () Bool)

(declare-fun res!587681 () Bool)

(assert (=> b!864881 (=> (not res!587681) (not e!481804))))

(assert (=> b!864881 (= res!587681 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16992))))

(declare-fun b!864882 () Bool)

(declare-fun res!587673 () Bool)

(assert (=> b!864882 (=> (not res!587673) (not e!481804))))

(assert (=> b!864882 (= res!587673 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24352 _keys!868))))))

(declare-fun b!864883 () Bool)

(declare-fun e!481805 () Bool)

(assert (=> b!864883 (= e!481805 (not e!481803))))

(declare-fun res!587672 () Bool)

(assert (=> b!864883 (=> res!587672 e!481803)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864883 (= res!587672 (not (validKeyInArray!0 (select (arr!23912 _keys!868) from!1053))))))

(declare-fun lt!391616 () ListLongMap!9961)

(assert (=> b!864883 (= lt!391616 lt!391619)))

(declare-fun lt!391624 () ListLongMap!9961)

(declare-fun lt!391621 () tuple2!11192)

(assert (=> b!864883 (= lt!391619 (+!2345 lt!391624 lt!391621))))

(declare-fun lt!391622 () array!49764)

(declare-fun minValue!654 () V!27449)

(declare-fun zeroValue!654 () V!27449)

(declare-fun getCurrentListMapNoExtraKeys!2967 (array!49762 array!49764 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) Int) ListLongMap!9961)

(assert (=> b!864883 (= lt!391616 (getCurrentListMapNoExtraKeys!2967 _keys!868 lt!391622 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27449)

(assert (=> b!864883 (= lt!391621 (tuple2!11193 k!854 v!557))))

(assert (=> b!864883 (= lt!391624 (getCurrentListMapNoExtraKeys!2967 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391617 () Unit!29602)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!547 (array!49762 array!49764 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) (_ BitVec 64) V!27449 (_ BitVec 32) Int) Unit!29602)

(assert (=> b!864883 (= lt!391617 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!547 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864884 () Bool)

(assert (=> b!864884 (= e!481806 true)))

(assert (=> b!864884 (= lt!391614 (+!2345 (+!2345 lt!391624 lt!391611) lt!391621))))

(declare-fun lt!391618 () Unit!29602)

(declare-fun addCommutativeForDiffKeys!515 (ListLongMap!9961 (_ BitVec 64) V!27449 (_ BitVec 64) V!27449) Unit!29602)

(assert (=> b!864884 (= lt!391618 (addCommutativeForDiffKeys!515 lt!391624 k!854 v!557 (select (arr!23912 _keys!868) from!1053) lt!391609))))

(declare-fun b!864885 () Bool)

(declare-fun mapRes!26801 () Bool)

(assert (=> b!864885 (= e!481807 (and e!481808 mapRes!26801))))

(declare-fun condMapEmpty!26801 () Bool)

(declare-fun mapDefault!26801 () ValueCell!7961)

