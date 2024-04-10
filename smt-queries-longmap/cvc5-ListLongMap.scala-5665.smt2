; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73774 () Bool)

(assert start!73774)

(declare-fun b_free!14689 () Bool)

(declare-fun b_next!14689 () Bool)

(assert (=> start!73774 (= b_free!14689 (not b_next!14689))))

(declare-fun tp!51570 () Bool)

(declare-fun b_and!24357 () Bool)

(assert (=> start!73774 (= tp!51570 b_and!24357)))

(declare-fun b!865475 () Bool)

(declare-fun e!482127 () Bool)

(declare-fun tp_is_empty!16825 () Bool)

(assert (=> b!865475 (= e!482127 tp_is_empty!16825)))

(declare-fun b!865476 () Bool)

(declare-fun res!588069 () Bool)

(declare-fun e!482126 () Bool)

(assert (=> b!865476 (=> (not res!588069) (not e!482126))))

(declare-datatypes ((array!49810 0))(
  ( (array!49811 (arr!23936 (Array (_ BitVec 32) (_ BitVec 64))) (size!24376 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49810)

(declare-datatypes ((List!17015 0))(
  ( (Nil!17012) (Cons!17011 (h!18142 (_ BitVec 64)) (t!23970 List!17015)) )
))
(declare-fun arrayNoDuplicates!0 (array!49810 (_ BitVec 32) List!17015) Bool)

(assert (=> b!865476 (= res!588069 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17012))))

(declare-fun b!865477 () Bool)

(declare-fun res!588071 () Bool)

(assert (=> b!865477 (=> (not res!588071) (not e!482126))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27481 0))(
  ( (V!27482 (val!8460 Int)) )
))
(declare-datatypes ((ValueCell!7973 0))(
  ( (ValueCellFull!7973 (v!10885 V!27481)) (EmptyCell!7973) )
))
(declare-datatypes ((array!49812 0))(
  ( (array!49813 (arr!23937 (Array (_ BitVec 32) ValueCell!7973)) (size!24377 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49812)

(assert (=> b!865477 (= res!588071 (and (= (size!24377 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24376 _keys!868) (size!24377 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865478 () Bool)

(declare-fun e!482128 () Bool)

(assert (=> b!865478 (= e!482128 true)))

(declare-datatypes ((tuple2!11212 0))(
  ( (tuple2!11213 (_1!5617 (_ BitVec 64)) (_2!5617 V!27481)) )
))
(declare-fun lt!392189 () tuple2!11212)

(declare-datatypes ((List!17016 0))(
  ( (Nil!17013) (Cons!17012 (h!18143 tuple2!11212) (t!23971 List!17016)) )
))
(declare-datatypes ((ListLongMap!9981 0))(
  ( (ListLongMap!9982 (toList!5006 List!17016)) )
))
(declare-fun lt!392196 () ListLongMap!9981)

(declare-fun lt!392198 () ListLongMap!9981)

(declare-fun lt!392185 () tuple2!11212)

(declare-fun +!2355 (ListLongMap!9981 tuple2!11212) ListLongMap!9981)

(assert (=> b!865478 (= lt!392198 (+!2355 (+!2355 lt!392196 lt!392189) lt!392185))))

(declare-datatypes ((Unit!29642 0))(
  ( (Unit!29643) )
))
(declare-fun lt!392199 () Unit!29642)

(declare-fun v!557 () V!27481)

(declare-fun lt!392190 () V!27481)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!524 (ListLongMap!9981 (_ BitVec 64) V!27481 (_ BitVec 64) V!27481) Unit!29642)

(assert (=> b!865478 (= lt!392199 (addCommutativeForDiffKeys!524 lt!392196 k!854 v!557 (select (arr!23936 _keys!868) from!1053) lt!392190))))

(declare-fun mapNonEmpty!26837 () Bool)

(declare-fun mapRes!26837 () Bool)

(declare-fun tp!51571 () Bool)

(assert (=> mapNonEmpty!26837 (= mapRes!26837 (and tp!51571 e!482127))))

(declare-fun mapValue!26837 () ValueCell!7973)

(declare-fun mapKey!26837 () (_ BitVec 32))

(declare-fun mapRest!26837 () (Array (_ BitVec 32) ValueCell!7973))

(assert (=> mapNonEmpty!26837 (= (arr!23937 _values!688) (store mapRest!26837 mapKey!26837 mapValue!26837))))

(declare-fun mapIsEmpty!26837 () Bool)

(assert (=> mapIsEmpty!26837 mapRes!26837))

(declare-fun b!865479 () Bool)

(declare-fun e!482134 () Bool)

(assert (=> b!865479 (= e!482126 e!482134)))

(declare-fun res!588074 () Bool)

(assert (=> b!865479 (=> (not res!588074) (not e!482134))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865479 (= res!588074 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392195 () ListLongMap!9981)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!392188 () array!49812)

(declare-fun minValue!654 () V!27481)

(declare-fun zeroValue!654 () V!27481)

(declare-fun getCurrentListMapNoExtraKeys!2977 (array!49810 array!49812 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) Int) ListLongMap!9981)

(assert (=> b!865479 (= lt!392195 (getCurrentListMapNoExtraKeys!2977 _keys!868 lt!392188 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865479 (= lt!392188 (array!49813 (store (arr!23937 _values!688) i!612 (ValueCellFull!7973 v!557)) (size!24377 _values!688)))))

(declare-fun lt!392200 () ListLongMap!9981)

(assert (=> b!865479 (= lt!392200 (getCurrentListMapNoExtraKeys!2977 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588068 () Bool)

(assert (=> start!73774 (=> (not res!588068) (not e!482126))))

(assert (=> start!73774 (= res!588068 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24376 _keys!868))))))

(assert (=> start!73774 e!482126))

(assert (=> start!73774 tp_is_empty!16825))

(assert (=> start!73774 true))

(assert (=> start!73774 tp!51570))

(declare-fun array_inv!18922 (array!49810) Bool)

(assert (=> start!73774 (array_inv!18922 _keys!868)))

(declare-fun e!482131 () Bool)

(declare-fun array_inv!18923 (array!49812) Bool)

(assert (=> start!73774 (and (array_inv!18923 _values!688) e!482131)))

(declare-fun b!865480 () Bool)

(declare-fun e!482129 () Bool)

(assert (=> b!865480 (= e!482129 tp_is_empty!16825)))

(declare-fun b!865481 () Bool)

(declare-fun res!588070 () Bool)

(assert (=> b!865481 (=> (not res!588070) (not e!482126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49810 (_ BitVec 32)) Bool)

(assert (=> b!865481 (= res!588070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865482 () Bool)

(declare-fun res!588076 () Bool)

(assert (=> b!865482 (=> (not res!588076) (not e!482126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865482 (= res!588076 (validMask!0 mask!1196))))

(declare-fun b!865483 () Bool)

(declare-fun res!588073 () Bool)

(assert (=> b!865483 (=> (not res!588073) (not e!482126))))

(assert (=> b!865483 (= res!588073 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24376 _keys!868))))))

(declare-fun b!865484 () Bool)

(declare-fun e!482132 () Unit!29642)

(declare-fun Unit!29644 () Unit!29642)

(assert (=> b!865484 (= e!482132 Unit!29644)))

(declare-fun b!865485 () Bool)

(declare-fun Unit!29645 () Unit!29642)

(assert (=> b!865485 (= e!482132 Unit!29645)))

(declare-fun lt!392194 () Unit!29642)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49810 (_ BitVec 32) (_ BitVec 32)) Unit!29642)

(assert (=> b!865485 (= lt!392194 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865485 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17012)))

(declare-fun lt!392191 () Unit!29642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49810 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29642)

(assert (=> b!865485 (= lt!392191 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865485 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392187 () Unit!29642)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49810 (_ BitVec 64) (_ BitVec 32) List!17015) Unit!29642)

(assert (=> b!865485 (= lt!392187 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17012))))

(assert (=> b!865485 false))

(declare-fun b!865486 () Bool)

(declare-fun res!588077 () Bool)

(assert (=> b!865486 (=> (not res!588077) (not e!482126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865486 (= res!588077 (validKeyInArray!0 k!854))))

(declare-fun b!865487 () Bool)

(declare-fun res!588067 () Bool)

(assert (=> b!865487 (=> (not res!588067) (not e!482126))))

(assert (=> b!865487 (= res!588067 (and (= (select (arr!23936 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!865488 () Bool)

(declare-fun e!482133 () Bool)

(assert (=> b!865488 (= e!482133 e!482128)))

(declare-fun res!588075 () Bool)

(assert (=> b!865488 (=> res!588075 e!482128)))

(assert (=> b!865488 (= res!588075 (= k!854 (select (arr!23936 _keys!868) from!1053)))))

(assert (=> b!865488 (not (= (select (arr!23936 _keys!868) from!1053) k!854))))

(declare-fun lt!392192 () Unit!29642)

(assert (=> b!865488 (= lt!392192 e!482132)))

(declare-fun c!92254 () Bool)

(assert (=> b!865488 (= c!92254 (= (select (arr!23936 _keys!868) from!1053) k!854))))

(assert (=> b!865488 (= lt!392195 lt!392198)))

(declare-fun lt!392197 () ListLongMap!9981)

(assert (=> b!865488 (= lt!392198 (+!2355 lt!392197 lt!392189))))

(assert (=> b!865488 (= lt!392189 (tuple2!11213 (select (arr!23936 _keys!868) from!1053) lt!392190))))

(declare-fun get!12651 (ValueCell!7973 V!27481) V!27481)

(declare-fun dynLambda!1177 (Int (_ BitVec 64)) V!27481)

(assert (=> b!865488 (= lt!392190 (get!12651 (select (arr!23937 _values!688) from!1053) (dynLambda!1177 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865489 () Bool)

(assert (=> b!865489 (= e!482134 (not e!482133))))

(declare-fun res!588072 () Bool)

(assert (=> b!865489 (=> res!588072 e!482133)))

(assert (=> b!865489 (= res!588072 (not (validKeyInArray!0 (select (arr!23936 _keys!868) from!1053))))))

(declare-fun lt!392186 () ListLongMap!9981)

(assert (=> b!865489 (= lt!392186 lt!392197)))

(assert (=> b!865489 (= lt!392197 (+!2355 lt!392196 lt!392185))))

(assert (=> b!865489 (= lt!392186 (getCurrentListMapNoExtraKeys!2977 _keys!868 lt!392188 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865489 (= lt!392185 (tuple2!11213 k!854 v!557))))

(assert (=> b!865489 (= lt!392196 (getCurrentListMapNoExtraKeys!2977 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392193 () Unit!29642)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!555 (array!49810 array!49812 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) (_ BitVec 64) V!27481 (_ BitVec 32) Int) Unit!29642)

(assert (=> b!865489 (= lt!392193 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!555 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865490 () Bool)

(assert (=> b!865490 (= e!482131 (and e!482129 mapRes!26837))))

(declare-fun condMapEmpty!26837 () Bool)

(declare-fun mapDefault!26837 () ValueCell!7973)

