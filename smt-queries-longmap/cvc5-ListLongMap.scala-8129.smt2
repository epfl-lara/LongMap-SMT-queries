; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99640 () Bool)

(assert start!99640)

(declare-fun b_free!25219 () Bool)

(declare-fun b_next!25219 () Bool)

(assert (=> start!99640 (= b_free!25219 (not b_next!25219))))

(declare-fun tp!88370 () Bool)

(declare-fun b_and!41305 () Bool)

(assert (=> start!99640 (= tp!88370 b_and!41305)))

(declare-fun b!1181025 () Bool)

(declare-datatypes ((Unit!39048 0))(
  ( (Unit!39049) )
))
(declare-fun e!671449 () Unit!39048)

(declare-fun Unit!39050 () Unit!39048)

(assert (=> b!1181025 (= e!671449 Unit!39050)))

(declare-fun b!1181026 () Bool)

(declare-fun res!784788 () Bool)

(declare-fun e!671446 () Bool)

(assert (=> b!1181026 (=> (not res!784788) (not e!671446))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76301 0))(
  ( (array!76302 (arr!36800 (Array (_ BitVec 32) (_ BitVec 64))) (size!37336 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76301)

(assert (=> b!1181026 (= res!784788 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37336 _keys!1208))))))

(declare-fun mapIsEmpty!46451 () Bool)

(declare-fun mapRes!46451 () Bool)

(assert (=> mapIsEmpty!46451 mapRes!46451))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!671456 () Bool)

(declare-fun b!1181027 () Bool)

(declare-fun arrayContainsKey!0 (array!76301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181027 (= e!671456 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181028 () Bool)

(declare-fun res!784785 () Bool)

(assert (=> b!1181028 (=> (not res!784785) (not e!671446))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44793 0))(
  ( (V!44794 (val!14931 Int)) )
))
(declare-datatypes ((ValueCell!14165 0))(
  ( (ValueCellFull!14165 (v!17569 V!44793)) (EmptyCell!14165) )
))
(declare-datatypes ((array!76303 0))(
  ( (array!76304 (arr!36801 (Array (_ BitVec 32) ValueCell!14165)) (size!37337 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76303)

(assert (=> b!1181028 (= res!784785 (and (= (size!37337 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37336 _keys!1208) (size!37337 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181029 () Bool)

(declare-fun e!671452 () Bool)

(assert (=> b!1181029 (= e!671452 e!671456)))

(declare-fun res!784794 () Bool)

(assert (=> b!1181029 (=> res!784794 e!671456)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181029 (= res!784794 (not (= (select (arr!36800 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181030 () Bool)

(declare-fun res!784787 () Bool)

(assert (=> b!1181030 (=> (not res!784787) (not e!671446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181030 (= res!784787 (validKeyInArray!0 k!934))))

(declare-fun b!1181031 () Bool)

(declare-fun e!671450 () Bool)

(declare-fun e!671453 () Bool)

(assert (=> b!1181031 (= e!671450 (not e!671453))))

(declare-fun res!784783 () Bool)

(assert (=> b!1181031 (=> res!784783 e!671453)))

(assert (=> b!1181031 (= res!784783 (bvsgt from!1455 i!673))))

(assert (=> b!1181031 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534105 () Unit!39048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76301 (_ BitVec 64) (_ BitVec 32)) Unit!39048)

(assert (=> b!1181031 (= lt!534105 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46451 () Bool)

(declare-fun tp!88371 () Bool)

(declare-fun e!671448 () Bool)

(assert (=> mapNonEmpty!46451 (= mapRes!46451 (and tp!88371 e!671448))))

(declare-fun mapKey!46451 () (_ BitVec 32))

(declare-fun mapValue!46451 () ValueCell!14165)

(declare-fun mapRest!46451 () (Array (_ BitVec 32) ValueCell!14165))

(assert (=> mapNonEmpty!46451 (= (arr!36801 _values!996) (store mapRest!46451 mapKey!46451 mapValue!46451))))

(declare-fun b!1181032 () Bool)

(declare-fun res!784789 () Bool)

(assert (=> b!1181032 (=> (not res!784789) (not e!671446))))

(declare-datatypes ((List!25863 0))(
  ( (Nil!25860) (Cons!25859 (h!27068 (_ BitVec 64)) (t!38074 List!25863)) )
))
(declare-fun arrayNoDuplicates!0 (array!76301 (_ BitVec 32) List!25863) Bool)

(assert (=> b!1181032 (= res!784789 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25860))))

(declare-fun b!1181033 () Bool)

(assert (=> b!1181033 (= e!671446 e!671450)))

(declare-fun res!784782 () Bool)

(assert (=> b!1181033 (=> (not res!784782) (not e!671450))))

(declare-fun lt!534098 () array!76301)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76301 (_ BitVec 32)) Bool)

(assert (=> b!1181033 (= res!784782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534098 mask!1564))))

(assert (=> b!1181033 (= lt!534098 (array!76302 (store (arr!36800 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37336 _keys!1208)))))

(declare-fun res!784786 () Bool)

(assert (=> start!99640 (=> (not res!784786) (not e!671446))))

(assert (=> start!99640 (= res!784786 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37336 _keys!1208))))))

(assert (=> start!99640 e!671446))

(declare-fun tp_is_empty!29749 () Bool)

(assert (=> start!99640 tp_is_empty!29749))

(declare-fun array_inv!28098 (array!76301) Bool)

(assert (=> start!99640 (array_inv!28098 _keys!1208)))

(assert (=> start!99640 true))

(assert (=> start!99640 tp!88370))

(declare-fun e!671455 () Bool)

(declare-fun array_inv!28099 (array!76303) Bool)

(assert (=> start!99640 (and (array_inv!28099 _values!996) e!671455)))

(declare-fun b!1181034 () Bool)

(declare-fun res!784781 () Bool)

(assert (=> b!1181034 (=> (not res!784781) (not e!671450))))

(assert (=> b!1181034 (= res!784781 (arrayNoDuplicates!0 lt!534098 #b00000000000000000000000000000000 Nil!25860))))

(declare-fun b!1181035 () Bool)

(assert (=> b!1181035 (= e!671448 tp_is_empty!29749)))

(declare-fun b!1181036 () Bool)

(declare-fun e!671454 () Bool)

(assert (=> b!1181036 (= e!671453 e!671454)))

(declare-fun res!784791 () Bool)

(assert (=> b!1181036 (=> res!784791 e!671454)))

(assert (=> b!1181036 (= res!784791 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44793)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19122 0))(
  ( (tuple2!19123 (_1!9572 (_ BitVec 64)) (_2!9572 V!44793)) )
))
(declare-datatypes ((List!25864 0))(
  ( (Nil!25861) (Cons!25860 (h!27069 tuple2!19122) (t!38075 List!25864)) )
))
(declare-datatypes ((ListLongMap!17091 0))(
  ( (ListLongMap!17092 (toList!8561 List!25864)) )
))
(declare-fun lt!534106 () ListLongMap!17091)

(declare-fun minValue!944 () V!44793)

(declare-fun lt!534103 () array!76303)

(declare-fun getCurrentListMapNoExtraKeys!5015 (array!76301 array!76303 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) Int) ListLongMap!17091)

(assert (=> b!1181036 (= lt!534106 (getCurrentListMapNoExtraKeys!5015 lt!534098 lt!534103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534095 () V!44793)

(assert (=> b!1181036 (= lt!534103 (array!76304 (store (arr!36801 _values!996) i!673 (ValueCellFull!14165 lt!534095)) (size!37337 _values!996)))))

(declare-fun dynLambda!2972 (Int (_ BitVec 64)) V!44793)

(assert (=> b!1181036 (= lt!534095 (dynLambda!2972 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534094 () ListLongMap!17091)

(assert (=> b!1181036 (= lt!534094 (getCurrentListMapNoExtraKeys!5015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181037 () Bool)

(declare-fun e!671451 () Bool)

(declare-fun lt!534101 () ListLongMap!17091)

(declare-fun lt!534104 () ListLongMap!17091)

(assert (=> b!1181037 (= e!671451 (= lt!534101 lt!534104))))

(declare-fun b!1181038 () Bool)

(declare-fun e!671447 () Bool)

(assert (=> b!1181038 (= e!671454 e!671447)))

(declare-fun res!784779 () Bool)

(assert (=> b!1181038 (=> res!784779 e!671447)))

(assert (=> b!1181038 (= res!784779 (not (validKeyInArray!0 (select (arr!36800 _keys!1208) from!1455))))))

(assert (=> b!1181038 (= lt!534104 lt!534101)))

(declare-fun lt!534099 () ListLongMap!17091)

(declare-fun -!1602 (ListLongMap!17091 (_ BitVec 64)) ListLongMap!17091)

(assert (=> b!1181038 (= lt!534101 (-!1602 lt!534099 k!934))))

(assert (=> b!1181038 (= lt!534104 (getCurrentListMapNoExtraKeys!5015 lt!534098 lt!534103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181038 (= lt!534099 (getCurrentListMapNoExtraKeys!5015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534100 () Unit!39048)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!829 (array!76301 array!76303 (_ BitVec 32) (_ BitVec 32) V!44793 V!44793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39048)

(assert (=> b!1181038 (= lt!534100 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181039 () Bool)

(declare-fun res!784790 () Bool)

(assert (=> b!1181039 (=> (not res!784790) (not e!671446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181039 (= res!784790 (validMask!0 mask!1564))))

(declare-fun b!1181040 () Bool)

(declare-fun e!671458 () Bool)

(assert (=> b!1181040 (= e!671455 (and e!671458 mapRes!46451))))

(declare-fun condMapEmpty!46451 () Bool)

(declare-fun mapDefault!46451 () ValueCell!14165)

