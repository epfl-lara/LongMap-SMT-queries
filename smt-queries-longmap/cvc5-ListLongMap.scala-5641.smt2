; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73630 () Bool)

(assert start!73630)

(declare-fun b_free!14545 () Bool)

(declare-fun b_next!14545 () Bool)

(assert (=> start!73630 (= b_free!14545 (not b_next!14545))))

(declare-fun tp!51139 () Bool)

(declare-fun b_and!24069 () Bool)

(assert (=> start!73630 (= tp!51139 b_and!24069)))

(declare-fun b!861891 () Bool)

(declare-datatypes ((Unit!29409 0))(
  ( (Unit!29410) )
))
(declare-fun e!480201 () Unit!29409)

(declare-fun Unit!29411 () Unit!29409)

(assert (=> b!861891 (= e!480201 Unit!29411)))

(declare-fun mapIsEmpty!26621 () Bool)

(declare-fun mapRes!26621 () Bool)

(assert (=> mapIsEmpty!26621 mapRes!26621))

(declare-fun b!861892 () Bool)

(declare-fun res!585713 () Bool)

(declare-fun e!480204 () Bool)

(assert (=> b!861892 (=> (not res!585713) (not e!480204))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861892 (= res!585713 (validKeyInArray!0 k!854))))

(declare-fun b!861893 () Bool)

(declare-fun res!585707 () Bool)

(assert (=> b!861893 (=> (not res!585707) (not e!480204))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49526 0))(
  ( (array!49527 (arr!23794 (Array (_ BitVec 32) (_ BitVec 64))) (size!24234 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49526)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861893 (= res!585707 (and (= (select (arr!23794 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861894 () Bool)

(declare-fun e!480203 () Bool)

(declare-fun e!480202 () Bool)

(assert (=> b!861894 (= e!480203 (not e!480202))))

(declare-fun res!585711 () Bool)

(assert (=> b!861894 (=> res!585711 e!480202)))

(assert (=> b!861894 (= res!585711 (not (validKeyInArray!0 (select (arr!23794 _keys!868) from!1053))))))

(declare-datatypes ((V!27289 0))(
  ( (V!27290 (val!8388 Int)) )
))
(declare-datatypes ((tuple2!11088 0))(
  ( (tuple2!11089 (_1!5555 (_ BitVec 64)) (_2!5555 V!27289)) )
))
(declare-datatypes ((List!16897 0))(
  ( (Nil!16894) (Cons!16893 (h!18024 tuple2!11088) (t!23708 List!16897)) )
))
(declare-datatypes ((ListLongMap!9857 0))(
  ( (ListLongMap!9858 (toList!4944 List!16897)) )
))
(declare-fun lt!388811 () ListLongMap!9857)

(declare-fun lt!388812 () ListLongMap!9857)

(assert (=> b!861894 (= lt!388811 lt!388812)))

(declare-fun v!557 () V!27289)

(declare-fun lt!388818 () ListLongMap!9857)

(declare-fun +!2294 (ListLongMap!9857 tuple2!11088) ListLongMap!9857)

(assert (=> b!861894 (= lt!388812 (+!2294 lt!388818 (tuple2!11089 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27289)

(declare-fun zeroValue!654 () V!27289)

(declare-datatypes ((ValueCell!7901 0))(
  ( (ValueCellFull!7901 (v!10813 V!27289)) (EmptyCell!7901) )
))
(declare-datatypes ((array!49528 0))(
  ( (array!49529 (arr!23795 (Array (_ BitVec 32) ValueCell!7901)) (size!24235 (_ BitVec 32))) )
))
(declare-fun lt!388819 () array!49528)

(declare-fun getCurrentListMapNoExtraKeys!2920 (array!49526 array!49528 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) Int) ListLongMap!9857)

(assert (=> b!861894 (= lt!388811 (getCurrentListMapNoExtraKeys!2920 _keys!868 lt!388819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49528)

(assert (=> b!861894 (= lt!388818 (getCurrentListMapNoExtraKeys!2920 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388810 () Unit!29409)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 (array!49526 array!49528 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) (_ BitVec 64) V!27289 (_ BitVec 32) Int) Unit!29409)

(assert (=> b!861894 (= lt!388810 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861895 () Bool)

(declare-fun Unit!29412 () Unit!29409)

(assert (=> b!861895 (= e!480201 Unit!29412)))

(declare-fun lt!388809 () Unit!29409)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49526 (_ BitVec 32) (_ BitVec 32)) Unit!29409)

(assert (=> b!861895 (= lt!388809 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16898 0))(
  ( (Nil!16895) (Cons!16894 (h!18025 (_ BitVec 64)) (t!23709 List!16898)) )
))
(declare-fun arrayNoDuplicates!0 (array!49526 (_ BitVec 32) List!16898) Bool)

(assert (=> b!861895 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16895)))

(declare-fun lt!388814 () Unit!29409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29409)

(assert (=> b!861895 (= lt!388814 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861895 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388817 () Unit!29409)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49526 (_ BitVec 64) (_ BitVec 32) List!16898) Unit!29409)

(assert (=> b!861895 (= lt!388817 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16895))))

(assert (=> b!861895 false))

(declare-fun b!861896 () Bool)

(declare-fun res!585714 () Bool)

(assert (=> b!861896 (=> (not res!585714) (not e!480204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861896 (= res!585714 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26621 () Bool)

(declare-fun tp!51138 () Bool)

(declare-fun e!480198 () Bool)

(assert (=> mapNonEmpty!26621 (= mapRes!26621 (and tp!51138 e!480198))))

(declare-fun mapKey!26621 () (_ BitVec 32))

(declare-fun mapRest!26621 () (Array (_ BitVec 32) ValueCell!7901))

(declare-fun mapValue!26621 () ValueCell!7901)

(assert (=> mapNonEmpty!26621 (= (arr!23795 _values!688) (store mapRest!26621 mapKey!26621 mapValue!26621))))

(declare-fun b!861897 () Bool)

(assert (=> b!861897 (= e!480202 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24234 _keys!868))))))

(assert (=> b!861897 (not (= (select (arr!23794 _keys!868) from!1053) k!854))))

(declare-fun lt!388815 () Unit!29409)

(assert (=> b!861897 (= lt!388815 e!480201)))

(declare-fun c!92038 () Bool)

(assert (=> b!861897 (= c!92038 (= (select (arr!23794 _keys!868) from!1053) k!854))))

(declare-fun lt!388816 () ListLongMap!9857)

(declare-fun get!12556 (ValueCell!7901 V!27289) V!27289)

(declare-fun dynLambda!1130 (Int (_ BitVec 64)) V!27289)

(assert (=> b!861897 (= lt!388816 (+!2294 lt!388812 (tuple2!11089 (select (arr!23794 _keys!868) from!1053) (get!12556 (select (arr!23795 _values!688) from!1053) (dynLambda!1130 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861898 () Bool)

(assert (=> b!861898 (= e!480204 e!480203)))

(declare-fun res!585708 () Bool)

(assert (=> b!861898 (=> (not res!585708) (not e!480203))))

(assert (=> b!861898 (= res!585708 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861898 (= lt!388816 (getCurrentListMapNoExtraKeys!2920 _keys!868 lt!388819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861898 (= lt!388819 (array!49529 (store (arr!23795 _values!688) i!612 (ValueCellFull!7901 v!557)) (size!24235 _values!688)))))

(declare-fun lt!388813 () ListLongMap!9857)

(assert (=> b!861898 (= lt!388813 (getCurrentListMapNoExtraKeys!2920 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861899 () Bool)

(declare-fun res!585712 () Bool)

(assert (=> b!861899 (=> (not res!585712) (not e!480204))))

(assert (=> b!861899 (= res!585712 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16895))))

(declare-fun b!861900 () Bool)

(declare-fun e!480199 () Bool)

(declare-fun e!480205 () Bool)

(assert (=> b!861900 (= e!480199 (and e!480205 mapRes!26621))))

(declare-fun condMapEmpty!26621 () Bool)

(declare-fun mapDefault!26621 () ValueCell!7901)

