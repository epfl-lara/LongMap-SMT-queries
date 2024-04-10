; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73682 () Bool)

(assert start!73682)

(declare-fun b_free!14597 () Bool)

(declare-fun b_next!14597 () Bool)

(assert (=> start!73682 (= b_free!14597 (not b_next!14597))))

(declare-fun tp!51294 () Bool)

(declare-fun b_and!24173 () Bool)

(assert (=> start!73682 (= tp!51294 b_and!24173)))

(declare-fun b!863175 () Bool)

(declare-fun res!586552 () Bool)

(declare-fun e!480892 () Bool)

(assert (=> b!863175 (=> (not res!586552) (not e!480892))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49628 0))(
  ( (array!49629 (arr!23845 (Array (_ BitVec 32) (_ BitVec 64))) (size!24285 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49628)

(assert (=> b!863175 (= res!586552 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24285 _keys!868))))))

(declare-fun b!863176 () Bool)

(declare-fun e!480890 () Bool)

(assert (=> b!863176 (= e!480892 e!480890)))

(declare-fun res!586555 () Bool)

(assert (=> b!863176 (=> (not res!586555) (not e!480890))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863176 (= res!586555 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27357 0))(
  ( (V!27358 (val!8414 Int)) )
))
(declare-datatypes ((ValueCell!7927 0))(
  ( (ValueCellFull!7927 (v!10839 V!27357)) (EmptyCell!7927) )
))
(declare-datatypes ((array!49630 0))(
  ( (array!49631 (arr!23846 (Array (_ BitVec 32) ValueCell!7927)) (size!24286 (_ BitVec 32))) )
))
(declare-fun lt!389992 () array!49630)

(declare-datatypes ((tuple2!11132 0))(
  ( (tuple2!11133 (_1!5577 (_ BitVec 64)) (_2!5577 V!27357)) )
))
(declare-datatypes ((List!16941 0))(
  ( (Nil!16938) (Cons!16937 (h!18068 tuple2!11132) (t!23804 List!16941)) )
))
(declare-datatypes ((ListLongMap!9901 0))(
  ( (ListLongMap!9902 (toList!4966 List!16941)) )
))
(declare-fun lt!389987 () ListLongMap!9901)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27357)

(declare-fun zeroValue!654 () V!27357)

(declare-fun getCurrentListMapNoExtraKeys!2941 (array!49628 array!49630 (_ BitVec 32) (_ BitVec 32) V!27357 V!27357 (_ BitVec 32) Int) ListLongMap!9901)

(assert (=> b!863176 (= lt!389987 (getCurrentListMapNoExtraKeys!2941 _keys!868 lt!389992 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27357)

(declare-fun _values!688 () array!49630)

(assert (=> b!863176 (= lt!389992 (array!49631 (store (arr!23846 _values!688) i!612 (ValueCellFull!7927 v!557)) (size!24286 _values!688)))))

(declare-fun lt!389977 () ListLongMap!9901)

(assert (=> b!863176 (= lt!389977 (getCurrentListMapNoExtraKeys!2941 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863177 () Bool)

(declare-fun res!586550 () Bool)

(assert (=> b!863177 (=> (not res!586550) (not e!480892))))

(declare-datatypes ((List!16942 0))(
  ( (Nil!16939) (Cons!16938 (h!18069 (_ BitVec 64)) (t!23805 List!16942)) )
))
(declare-fun arrayNoDuplicates!0 (array!49628 (_ BitVec 32) List!16942) Bool)

(assert (=> b!863177 (= res!586550 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16939))))

(declare-fun res!586558 () Bool)

(assert (=> start!73682 (=> (not res!586558) (not e!480892))))

(assert (=> start!73682 (= res!586558 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24285 _keys!868))))))

(assert (=> start!73682 e!480892))

(declare-fun tp_is_empty!16733 () Bool)

(assert (=> start!73682 tp_is_empty!16733))

(assert (=> start!73682 true))

(assert (=> start!73682 tp!51294))

(declare-fun array_inv!18864 (array!49628) Bool)

(assert (=> start!73682 (array_inv!18864 _keys!868)))

(declare-fun e!480888 () Bool)

(declare-fun array_inv!18865 (array!49630) Bool)

(assert (=> start!73682 (and (array_inv!18865 _values!688) e!480888)))

(declare-fun b!863178 () Bool)

(declare-datatypes ((Unit!29495 0))(
  ( (Unit!29496) )
))
(declare-fun e!480884 () Unit!29495)

(declare-fun Unit!29497 () Unit!29495)

(assert (=> b!863178 (= e!480884 Unit!29497)))

(declare-fun lt!389986 () Unit!29495)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49628 (_ BitVec 32) (_ BitVec 32)) Unit!29495)

(assert (=> b!863178 (= lt!389986 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863178 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16939)))

(declare-fun lt!389981 () Unit!29495)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29495)

(assert (=> b!863178 (= lt!389981 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863178 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389991 () Unit!29495)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49628 (_ BitVec 64) (_ BitVec 32) List!16942) Unit!29495)

(assert (=> b!863178 (= lt!389991 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16939))))

(assert (=> b!863178 false))

(declare-fun b!863179 () Bool)

(declare-fun res!586559 () Bool)

(assert (=> b!863179 (=> (not res!586559) (not e!480892))))

(assert (=> b!863179 (= res!586559 (and (= (size!24286 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24285 _keys!868) (size!24286 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26699 () Bool)

(declare-fun mapRes!26699 () Bool)

(assert (=> mapIsEmpty!26699 mapRes!26699))

(declare-fun b!863180 () Bool)

(declare-fun Unit!29498 () Unit!29495)

(assert (=> b!863180 (= e!480884 Unit!29498)))

(declare-fun b!863181 () Bool)

(declare-fun e!480885 () Bool)

(assert (=> b!863181 (= e!480890 (not e!480885))))

(declare-fun res!586556 () Bool)

(assert (=> b!863181 (=> res!586556 e!480885)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863181 (= res!586556 (not (validKeyInArray!0 (select (arr!23845 _keys!868) from!1053))))))

(declare-fun lt!389983 () ListLongMap!9901)

(declare-fun lt!389988 () ListLongMap!9901)

(assert (=> b!863181 (= lt!389983 lt!389988)))

(declare-fun lt!389978 () ListLongMap!9901)

(declare-fun lt!389985 () tuple2!11132)

(declare-fun +!2315 (ListLongMap!9901 tuple2!11132) ListLongMap!9901)

(assert (=> b!863181 (= lt!389988 (+!2315 lt!389978 lt!389985))))

(assert (=> b!863181 (= lt!389983 (getCurrentListMapNoExtraKeys!2941 _keys!868 lt!389992 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863181 (= lt!389985 (tuple2!11133 k!854 v!557))))

(assert (=> b!863181 (= lt!389978 (getCurrentListMapNoExtraKeys!2941 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389989 () Unit!29495)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!523 (array!49628 array!49630 (_ BitVec 32) (_ BitVec 32) V!27357 V!27357 (_ BitVec 32) (_ BitVec 64) V!27357 (_ BitVec 32) Int) Unit!29495)

(assert (=> b!863181 (= lt!389989 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!523 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863182 () Bool)

(declare-fun res!586554 () Bool)

(assert (=> b!863182 (=> (not res!586554) (not e!480892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49628 (_ BitVec 32)) Bool)

(assert (=> b!863182 (= res!586554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863183 () Bool)

(declare-fun res!586549 () Bool)

(assert (=> b!863183 (=> (not res!586549) (not e!480892))))

(assert (=> b!863183 (= res!586549 (validKeyInArray!0 k!854))))

(declare-fun b!863184 () Bool)

(declare-fun e!480891 () Bool)

(assert (=> b!863184 (= e!480891 true)))

(declare-fun lt!389979 () ListLongMap!9901)

(declare-fun lt!389984 () tuple2!11132)

(assert (=> b!863184 (= lt!389979 (+!2315 (+!2315 lt!389978 lt!389984) lt!389985))))

(declare-fun lt!389980 () V!27357)

(declare-fun lt!389990 () Unit!29495)

(declare-fun addCommutativeForDiffKeys!489 (ListLongMap!9901 (_ BitVec 64) V!27357 (_ BitVec 64) V!27357) Unit!29495)

(assert (=> b!863184 (= lt!389990 (addCommutativeForDiffKeys!489 lt!389978 k!854 v!557 (select (arr!23845 _keys!868) from!1053) lt!389980))))

(declare-fun b!863185 () Bool)

(declare-fun res!586553 () Bool)

(assert (=> b!863185 (=> (not res!586553) (not e!480892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863185 (= res!586553 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26699 () Bool)

(declare-fun tp!51295 () Bool)

(declare-fun e!480886 () Bool)

(assert (=> mapNonEmpty!26699 (= mapRes!26699 (and tp!51295 e!480886))))

(declare-fun mapValue!26699 () ValueCell!7927)

(declare-fun mapKey!26699 () (_ BitVec 32))

(declare-fun mapRest!26699 () (Array (_ BitVec 32) ValueCell!7927))

(assert (=> mapNonEmpty!26699 (= (arr!23846 _values!688) (store mapRest!26699 mapKey!26699 mapValue!26699))))

(declare-fun b!863186 () Bool)

(declare-fun e!480889 () Bool)

(assert (=> b!863186 (= e!480889 tp_is_empty!16733)))

(declare-fun b!863187 () Bool)

(declare-fun res!586551 () Bool)

(assert (=> b!863187 (=> (not res!586551) (not e!480892))))

(assert (=> b!863187 (= res!586551 (and (= (select (arr!23845 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863188 () Bool)

(assert (=> b!863188 (= e!480885 e!480891)))

(declare-fun res!586557 () Bool)

(assert (=> b!863188 (=> res!586557 e!480891)))

(assert (=> b!863188 (= res!586557 (= k!854 (select (arr!23845 _keys!868) from!1053)))))

(assert (=> b!863188 (not (= (select (arr!23845 _keys!868) from!1053) k!854))))

(declare-fun lt!389982 () Unit!29495)

(assert (=> b!863188 (= lt!389982 e!480884)))

(declare-fun c!92116 () Bool)

(assert (=> b!863188 (= c!92116 (= (select (arr!23845 _keys!868) from!1053) k!854))))

(assert (=> b!863188 (= lt!389987 lt!389979)))

(assert (=> b!863188 (= lt!389979 (+!2315 lt!389988 lt!389984))))

(assert (=> b!863188 (= lt!389984 (tuple2!11133 (select (arr!23845 _keys!868) from!1053) lt!389980))))

(declare-fun get!12588 (ValueCell!7927 V!27357) V!27357)

(declare-fun dynLambda!1146 (Int (_ BitVec 64)) V!27357)

(assert (=> b!863188 (= lt!389980 (get!12588 (select (arr!23846 _values!688) from!1053) (dynLambda!1146 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863189 () Bool)

(assert (=> b!863189 (= e!480886 tp_is_empty!16733)))

(declare-fun b!863190 () Bool)

(assert (=> b!863190 (= e!480888 (and e!480889 mapRes!26699))))

(declare-fun condMapEmpty!26699 () Bool)

(declare-fun mapDefault!26699 () ValueCell!7927)

