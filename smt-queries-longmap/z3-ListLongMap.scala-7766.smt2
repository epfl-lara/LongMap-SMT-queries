; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97334 () Bool)

(assert start!97334)

(declare-fun b_free!23311 () Bool)

(declare-fun b_next!23311 () Bool)

(assert (=> start!97334 (= b_free!23311 (not b_next!23311))))

(declare-fun tp!82231 () Bool)

(declare-fun b_and!37433 () Bool)

(assert (=> start!97334 (= tp!82231 b_and!37433)))

(declare-fun b!1109028 () Bool)

(declare-fun res!740135 () Bool)

(declare-fun e!632593 () Bool)

(assert (=> b!1109028 (=> (not res!740135) (not e!632593))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109028 (= res!740135 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43174 () Bool)

(declare-fun mapRes!43174 () Bool)

(declare-fun tp!82232 () Bool)

(declare-fun e!632591 () Bool)

(assert (=> mapNonEmpty!43174 (= mapRes!43174 (and tp!82232 e!632591))))

(declare-fun mapKey!43174 () (_ BitVec 32))

(declare-datatypes ((V!41889 0))(
  ( (V!41890 (val!13842 Int)) )
))
(declare-datatypes ((ValueCell!13076 0))(
  ( (ValueCellFull!13076 (v!16474 V!41889)) (EmptyCell!13076) )
))
(declare-fun mapRest!43174 () (Array (_ BitVec 32) ValueCell!13076))

(declare-datatypes ((array!71954 0))(
  ( (array!71955 (arr!34630 (Array (_ BitVec 32) ValueCell!13076)) (size!35168 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71954)

(declare-fun mapValue!43174 () ValueCell!13076)

(assert (=> mapNonEmpty!43174 (= (arr!34630 _values!996) (store mapRest!43174 mapKey!43174 mapValue!43174))))

(declare-fun b!1109029 () Bool)

(declare-fun e!632596 () Bool)

(assert (=> b!1109029 (= e!632596 true)))

(declare-fun e!632594 () Bool)

(assert (=> b!1109029 e!632594))

(declare-fun c!109125 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109029 (= c!109125 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41889)

(declare-datatypes ((array!71956 0))(
  ( (array!71957 (arr!34631 (Array (_ BitVec 32) (_ BitVec 64))) (size!35169 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71956)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36209 0))(
  ( (Unit!36210) )
))
(declare-fun lt!495738 () Unit!36209)

(declare-fun minValue!944 () V!41889)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!266 (array!71956 array!71954 (_ BitVec 32) (_ BitVec 32) V!41889 V!41889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36209)

(assert (=> b!1109029 (= lt!495738 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!266 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109030 () Bool)

(declare-fun res!740129 () Bool)

(declare-fun e!632592 () Bool)

(assert (=> b!1109030 (=> (not res!740129) (not e!632592))))

(declare-fun lt!495736 () array!71956)

(declare-datatypes ((List!24208 0))(
  ( (Nil!24205) (Cons!24204 (h!25413 (_ BitVec 64)) (t!34556 List!24208)) )
))
(declare-fun arrayNoDuplicates!0 (array!71956 (_ BitVec 32) List!24208) Bool)

(assert (=> b!1109030 (= res!740129 (arrayNoDuplicates!0 lt!495736 #b00000000000000000000000000000000 Nil!24205))))

(declare-fun b!1109031 () Bool)

(declare-fun res!740128 () Bool)

(assert (=> b!1109031 (=> (not res!740128) (not e!632593))))

(assert (=> b!1109031 (= res!740128 (= (select (arr!34631 _keys!1208) i!673) k0!934))))

(declare-fun b!1109032 () Bool)

(declare-fun res!740134 () Bool)

(assert (=> b!1109032 (=> (not res!740134) (not e!632593))))

(assert (=> b!1109032 (= res!740134 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35169 _keys!1208))))))

(declare-fun mapIsEmpty!43174 () Bool)

(assert (=> mapIsEmpty!43174 mapRes!43174))

(declare-fun b!1109033 () Bool)

(declare-fun e!632597 () Bool)

(declare-fun e!632598 () Bool)

(assert (=> b!1109033 (= e!632597 (and e!632598 mapRes!43174))))

(declare-fun condMapEmpty!43174 () Bool)

(declare-fun mapDefault!43174 () ValueCell!13076)

(assert (=> b!1109033 (= condMapEmpty!43174 (= (arr!34630 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13076)) mapDefault!43174)))))

(declare-datatypes ((tuple2!17550 0))(
  ( (tuple2!17551 (_1!8786 (_ BitVec 64)) (_2!8786 V!41889)) )
))
(declare-datatypes ((List!24209 0))(
  ( (Nil!24206) (Cons!24205 (h!25414 tuple2!17550) (t!34557 List!24209)) )
))
(declare-datatypes ((ListLongMap!15519 0))(
  ( (ListLongMap!15520 (toList!7775 List!24209)) )
))
(declare-fun call!46607 () ListLongMap!15519)

(declare-fun bm!46603 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4291 (array!71956 array!71954 (_ BitVec 32) (_ BitVec 32) V!41889 V!41889 (_ BitVec 32) Int) ListLongMap!15519)

(declare-fun dynLambda!2357 (Int (_ BitVec 64)) V!41889)

(assert (=> bm!46603 (= call!46607 (getCurrentListMapNoExtraKeys!4291 lt!495736 (array!71955 (store (arr!34630 _values!996) i!673 (ValueCellFull!13076 (dynLambda!2357 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35168 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109034 () Bool)

(assert (=> b!1109034 (= e!632593 e!632592)))

(declare-fun res!740136 () Bool)

(assert (=> b!1109034 (=> (not res!740136) (not e!632592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71956 (_ BitVec 32)) Bool)

(assert (=> b!1109034 (= res!740136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495736 mask!1564))))

(assert (=> b!1109034 (= lt!495736 (array!71957 (store (arr!34631 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35169 _keys!1208)))))

(declare-fun b!1109035 () Bool)

(declare-fun res!740131 () Bool)

(assert (=> b!1109035 (=> (not res!740131) (not e!632593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109035 (= res!740131 (validKeyInArray!0 k0!934))))

(declare-fun res!740137 () Bool)

(assert (=> start!97334 (=> (not res!740137) (not e!632593))))

(assert (=> start!97334 (= res!740137 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35169 _keys!1208))))))

(assert (=> start!97334 e!632593))

(declare-fun tp_is_empty!27571 () Bool)

(assert (=> start!97334 tp_is_empty!27571))

(declare-fun array_inv!26702 (array!71956) Bool)

(assert (=> start!97334 (array_inv!26702 _keys!1208)))

(assert (=> start!97334 true))

(assert (=> start!97334 tp!82231))

(declare-fun array_inv!26703 (array!71954) Bool)

(assert (=> start!97334 (and (array_inv!26703 _values!996) e!632597)))

(declare-fun b!1109036 () Bool)

(declare-fun res!740130 () Bool)

(assert (=> b!1109036 (=> (not res!740130) (not e!632593))))

(assert (=> b!1109036 (= res!740130 (and (= (size!35168 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35169 _keys!1208) (size!35168 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109037 () Bool)

(assert (=> b!1109037 (= e!632591 tp_is_empty!27571)))

(declare-fun b!1109038 () Bool)

(declare-fun res!740133 () Bool)

(assert (=> b!1109038 (=> (not res!740133) (not e!632593))))

(assert (=> b!1109038 (= res!740133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109039 () Bool)

(assert (=> b!1109039 (= e!632598 tp_is_empty!27571)))

(declare-fun call!46606 () ListLongMap!15519)

(declare-fun b!1109040 () Bool)

(declare-fun -!995 (ListLongMap!15519 (_ BitVec 64)) ListLongMap!15519)

(assert (=> b!1109040 (= e!632594 (= call!46607 (-!995 call!46606 k0!934)))))

(declare-fun b!1109041 () Bool)

(declare-fun res!740127 () Bool)

(assert (=> b!1109041 (=> (not res!740127) (not e!632593))))

(assert (=> b!1109041 (= res!740127 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24205))))

(declare-fun bm!46604 () Bool)

(assert (=> bm!46604 (= call!46606 (getCurrentListMapNoExtraKeys!4291 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109042 () Bool)

(assert (=> b!1109042 (= e!632592 (not e!632596))))

(declare-fun res!740132 () Bool)

(assert (=> b!1109042 (=> res!740132 e!632596)))

(assert (=> b!1109042 (= res!740132 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35169 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109042 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495737 () Unit!36209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71956 (_ BitVec 64) (_ BitVec 32)) Unit!36209)

(assert (=> b!1109042 (= lt!495737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109043 () Bool)

(assert (=> b!1109043 (= e!632594 (= call!46607 call!46606))))

(assert (= (and start!97334 res!740137) b!1109028))

(assert (= (and b!1109028 res!740135) b!1109036))

(assert (= (and b!1109036 res!740130) b!1109038))

(assert (= (and b!1109038 res!740133) b!1109041))

(assert (= (and b!1109041 res!740127) b!1109032))

(assert (= (and b!1109032 res!740134) b!1109035))

(assert (= (and b!1109035 res!740131) b!1109031))

(assert (= (and b!1109031 res!740128) b!1109034))

(assert (= (and b!1109034 res!740136) b!1109030))

(assert (= (and b!1109030 res!740129) b!1109042))

(assert (= (and b!1109042 (not res!740132)) b!1109029))

(assert (= (and b!1109029 c!109125) b!1109040))

(assert (= (and b!1109029 (not c!109125)) b!1109043))

(assert (= (or b!1109040 b!1109043) bm!46603))

(assert (= (or b!1109040 b!1109043) bm!46604))

(assert (= (and b!1109033 condMapEmpty!43174) mapIsEmpty!43174))

(assert (= (and b!1109033 (not condMapEmpty!43174)) mapNonEmpty!43174))

(get-info :version)

(assert (= (and mapNonEmpty!43174 ((_ is ValueCellFull!13076) mapValue!43174)) b!1109037))

(assert (= (and b!1109033 ((_ is ValueCellFull!13076) mapDefault!43174)) b!1109039))

(assert (= start!97334 b!1109033))

(declare-fun b_lambda!18313 () Bool)

(assert (=> (not b_lambda!18313) (not bm!46603)))

(declare-fun t!34555 () Bool)

(declare-fun tb!8169 () Bool)

(assert (=> (and start!97334 (= defaultEntry!1004 defaultEntry!1004) t!34555) tb!8169))

(declare-fun result!16907 () Bool)

(assert (=> tb!8169 (= result!16907 tp_is_empty!27571)))

(assert (=> bm!46603 t!34555))

(declare-fun b_and!37435 () Bool)

(assert (= b_and!37433 (and (=> t!34555 result!16907) b_and!37435)))

(declare-fun m!1026885 () Bool)

(assert (=> b!1109041 m!1026885))

(declare-fun m!1026887 () Bool)

(assert (=> b!1109038 m!1026887))

(declare-fun m!1026889 () Bool)

(assert (=> b!1109028 m!1026889))

(declare-fun m!1026891 () Bool)

(assert (=> start!97334 m!1026891))

(declare-fun m!1026893 () Bool)

(assert (=> start!97334 m!1026893))

(declare-fun m!1026895 () Bool)

(assert (=> b!1109034 m!1026895))

(declare-fun m!1026897 () Bool)

(assert (=> b!1109034 m!1026897))

(declare-fun m!1026899 () Bool)

(assert (=> b!1109035 m!1026899))

(declare-fun m!1026901 () Bool)

(assert (=> b!1109029 m!1026901))

(declare-fun m!1026903 () Bool)

(assert (=> bm!46604 m!1026903))

(declare-fun m!1026905 () Bool)

(assert (=> bm!46603 m!1026905))

(declare-fun m!1026907 () Bool)

(assert (=> bm!46603 m!1026907))

(declare-fun m!1026909 () Bool)

(assert (=> bm!46603 m!1026909))

(declare-fun m!1026911 () Bool)

(assert (=> b!1109042 m!1026911))

(declare-fun m!1026913 () Bool)

(assert (=> b!1109042 m!1026913))

(declare-fun m!1026915 () Bool)

(assert (=> b!1109030 m!1026915))

(declare-fun m!1026917 () Bool)

(assert (=> b!1109031 m!1026917))

(declare-fun m!1026919 () Bool)

(assert (=> mapNonEmpty!43174 m!1026919))

(declare-fun m!1026921 () Bool)

(assert (=> b!1109040 m!1026921))

(check-sat (not b!1109030) (not b_next!23311) tp_is_empty!27571 (not b!1109034) (not b!1109038) (not b!1109035) (not b!1109028) (not bm!46603) (not b!1109029) (not b_lambda!18313) (not b!1109041) (not b!1109042) (not start!97334) b_and!37435 (not b!1109040) (not mapNonEmpty!43174) (not bm!46604))
(check-sat b_and!37435 (not b_next!23311))
