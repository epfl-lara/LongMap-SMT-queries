; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97372 () Bool)

(assert start!97372)

(declare-fun b_free!23343 () Bool)

(declare-fun b_next!23343 () Bool)

(assert (=> start!97372 (= b_free!23343 (not b_next!23343))))

(declare-fun tp!82327 () Bool)

(declare-fun b_and!37521 () Bool)

(assert (=> start!97372 (= tp!82327 b_and!37521)))

(declare-datatypes ((V!41931 0))(
  ( (V!41932 (val!13858 Int)) )
))
(declare-fun zeroValue!944 () V!41931)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46722 () Bool)

(declare-datatypes ((ValueCell!13092 0))(
  ( (ValueCellFull!13092 (v!16491 V!41931)) (EmptyCell!13092) )
))
(declare-datatypes ((array!72123 0))(
  ( (array!72124 (arr!34714 (Array (_ BitVec 32) ValueCell!13092)) (size!35250 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72123)

(declare-fun minValue!944 () V!41931)

(declare-datatypes ((array!72125 0))(
  ( (array!72126 (arr!34715 (Array (_ BitVec 32) (_ BitVec 64))) (size!35251 (_ BitVec 32))) )
))
(declare-fun lt!496081 () array!72125)

(declare-datatypes ((tuple2!17522 0))(
  ( (tuple2!17523 (_1!8772 (_ BitVec 64)) (_2!8772 V!41931)) )
))
(declare-datatypes ((List!24206 0))(
  ( (Nil!24203) (Cons!24202 (h!25411 tuple2!17522) (t!34595 List!24206)) )
))
(declare-datatypes ((ListLongMap!15491 0))(
  ( (ListLongMap!15492 (toList!7761 List!24206)) )
))
(declare-fun call!46726 () ListLongMap!15491)

(declare-fun getCurrentListMapNoExtraKeys!4255 (array!72125 array!72123 (_ BitVec 32) (_ BitVec 32) V!41931 V!41931 (_ BitVec 32) Int) ListLongMap!15491)

(declare-fun dynLambda!2383 (Int (_ BitVec 64)) V!41931)

(assert (=> bm!46722 (= call!46726 (getCurrentListMapNoExtraKeys!4255 lt!496081 (array!72124 (store (arr!34714 _values!996) i!673 (ValueCellFull!13092 (dynLambda!2383 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35250 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109969 () Bool)

(declare-fun e!633068 () Bool)

(declare-fun e!633066 () Bool)

(assert (=> b!1109969 (= e!633068 (not e!633066))))

(declare-fun res!740726 () Bool)

(assert (=> b!1109969 (=> res!740726 e!633066)))

(declare-fun _keys!1208 () array!72125)

(assert (=> b!1109969 (= res!740726 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35251 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109969 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36428 0))(
  ( (Unit!36429) )
))
(declare-fun lt!496082 () Unit!36428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72125 (_ BitVec 64) (_ BitVec 32)) Unit!36428)

(assert (=> b!1109969 (= lt!496082 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109970 () Bool)

(declare-fun e!633067 () Bool)

(declare-fun call!46725 () ListLongMap!15491)

(declare-fun -!1035 (ListLongMap!15491 (_ BitVec 64)) ListLongMap!15491)

(assert (=> b!1109970 (= e!633067 (= call!46726 (-!1035 call!46725 k0!934)))))

(declare-fun b!1109971 () Bool)

(declare-fun res!740725 () Bool)

(declare-fun e!633063 () Bool)

(assert (=> b!1109971 (=> (not res!740725) (not e!633063))))

(declare-datatypes ((List!24207 0))(
  ( (Nil!24204) (Cons!24203 (h!25412 (_ BitVec 64)) (t!34596 List!24207)) )
))
(declare-fun arrayNoDuplicates!0 (array!72125 (_ BitVec 32) List!24207) Bool)

(assert (=> b!1109971 (= res!740725 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24204))))

(declare-fun b!1109972 () Bool)

(declare-fun e!633064 () Bool)

(declare-fun tp_is_empty!27603 () Bool)

(assert (=> b!1109972 (= e!633064 tp_is_empty!27603)))

(declare-fun bm!46723 () Bool)

(assert (=> bm!46723 (= call!46725 (getCurrentListMapNoExtraKeys!4255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109973 () Bool)

(declare-fun res!740733 () Bool)

(assert (=> b!1109973 (=> (not res!740733) (not e!633063))))

(assert (=> b!1109973 (= res!740733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35251 _keys!1208))))))

(declare-fun b!1109974 () Bool)

(assert (=> b!1109974 (= e!633063 e!633068)))

(declare-fun res!740729 () Bool)

(assert (=> b!1109974 (=> (not res!740729) (not e!633068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72125 (_ BitVec 32)) Bool)

(assert (=> b!1109974 (= res!740729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496081 mask!1564))))

(assert (=> b!1109974 (= lt!496081 (array!72126 (store (arr!34715 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35251 _keys!1208)))))

(declare-fun b!1109975 () Bool)

(declare-fun res!740732 () Bool)

(assert (=> b!1109975 (=> (not res!740732) (not e!633063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109975 (= res!740732 (validMask!0 mask!1564))))

(declare-fun b!1109976 () Bool)

(declare-fun res!740731 () Bool)

(assert (=> b!1109976 (=> (not res!740731) (not e!633063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109976 (= res!740731 (validKeyInArray!0 k0!934))))

(declare-fun b!1109977 () Bool)

(declare-fun res!740728 () Bool)

(assert (=> b!1109977 (=> (not res!740728) (not e!633063))))

(assert (=> b!1109977 (= res!740728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!740727 () Bool)

(assert (=> start!97372 (=> (not res!740727) (not e!633063))))

(assert (=> start!97372 (= res!740727 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35251 _keys!1208))))))

(assert (=> start!97372 e!633063))

(assert (=> start!97372 tp_is_empty!27603))

(declare-fun array_inv!26712 (array!72125) Bool)

(assert (=> start!97372 (array_inv!26712 _keys!1208)))

(assert (=> start!97372 true))

(assert (=> start!97372 tp!82327))

(declare-fun e!633069 () Bool)

(declare-fun array_inv!26713 (array!72123) Bool)

(assert (=> start!97372 (and (array_inv!26713 _values!996) e!633069)))

(declare-fun mapNonEmpty!43222 () Bool)

(declare-fun mapRes!43222 () Bool)

(declare-fun tp!82328 () Bool)

(declare-fun e!633065 () Bool)

(assert (=> mapNonEmpty!43222 (= mapRes!43222 (and tp!82328 e!633065))))

(declare-fun mapValue!43222 () ValueCell!13092)

(declare-fun mapKey!43222 () (_ BitVec 32))

(declare-fun mapRest!43222 () (Array (_ BitVec 32) ValueCell!13092))

(assert (=> mapNonEmpty!43222 (= (arr!34714 _values!996) (store mapRest!43222 mapKey!43222 mapValue!43222))))

(declare-fun b!1109978 () Bool)

(declare-fun res!740730 () Bool)

(assert (=> b!1109978 (=> (not res!740730) (not e!633063))))

(assert (=> b!1109978 (= res!740730 (= (select (arr!34715 _keys!1208) i!673) k0!934))))

(declare-fun b!1109979 () Bool)

(assert (=> b!1109979 (= e!633065 tp_is_empty!27603)))

(declare-fun b!1109980 () Bool)

(declare-fun res!740724 () Bool)

(assert (=> b!1109980 (=> (not res!740724) (not e!633068))))

(assert (=> b!1109980 (= res!740724 (arrayNoDuplicates!0 lt!496081 #b00000000000000000000000000000000 Nil!24204))))

(declare-fun b!1109981 () Bool)

(assert (=> b!1109981 (= e!633066 true)))

(assert (=> b!1109981 e!633067))

(declare-fun c!109206 () Bool)

(assert (=> b!1109981 (= c!109206 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496080 () Unit!36428)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!283 (array!72125 array!72123 (_ BitVec 32) (_ BitVec 32) V!41931 V!41931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36428)

(assert (=> b!1109981 (= lt!496080 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109982 () Bool)

(assert (=> b!1109982 (= e!633067 (= call!46726 call!46725))))

(declare-fun b!1109983 () Bool)

(declare-fun res!740734 () Bool)

(assert (=> b!1109983 (=> (not res!740734) (not e!633063))))

(assert (=> b!1109983 (= res!740734 (and (= (size!35250 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35251 _keys!1208) (size!35250 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43222 () Bool)

(assert (=> mapIsEmpty!43222 mapRes!43222))

(declare-fun b!1109984 () Bool)

(assert (=> b!1109984 (= e!633069 (and e!633064 mapRes!43222))))

(declare-fun condMapEmpty!43222 () Bool)

(declare-fun mapDefault!43222 () ValueCell!13092)

(assert (=> b!1109984 (= condMapEmpty!43222 (= (arr!34714 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13092)) mapDefault!43222)))))

(assert (= (and start!97372 res!740727) b!1109975))

(assert (= (and b!1109975 res!740732) b!1109983))

(assert (= (and b!1109983 res!740734) b!1109977))

(assert (= (and b!1109977 res!740728) b!1109971))

(assert (= (and b!1109971 res!740725) b!1109973))

(assert (= (and b!1109973 res!740733) b!1109976))

(assert (= (and b!1109976 res!740731) b!1109978))

(assert (= (and b!1109978 res!740730) b!1109974))

(assert (= (and b!1109974 res!740729) b!1109980))

(assert (= (and b!1109980 res!740724) b!1109969))

(assert (= (and b!1109969 (not res!740726)) b!1109981))

(assert (= (and b!1109981 c!109206) b!1109970))

(assert (= (and b!1109981 (not c!109206)) b!1109982))

(assert (= (or b!1109970 b!1109982) bm!46722))

(assert (= (or b!1109970 b!1109982) bm!46723))

(assert (= (and b!1109984 condMapEmpty!43222) mapIsEmpty!43222))

(assert (= (and b!1109984 (not condMapEmpty!43222)) mapNonEmpty!43222))

(get-info :version)

(assert (= (and mapNonEmpty!43222 ((_ is ValueCellFull!13092) mapValue!43222)) b!1109979))

(assert (= (and b!1109984 ((_ is ValueCellFull!13092) mapDefault!43222)) b!1109972))

(assert (= start!97372 b!1109984))

(declare-fun b_lambda!18365 () Bool)

(assert (=> (not b_lambda!18365) (not bm!46722)))

(declare-fun t!34594 () Bool)

(declare-fun tb!8209 () Bool)

(assert (=> (and start!97372 (= defaultEntry!1004 defaultEntry!1004) t!34594) tb!8209))

(declare-fun result!16979 () Bool)

(assert (=> tb!8209 (= result!16979 tp_is_empty!27603)))

(assert (=> bm!46722 t!34594))

(declare-fun b_and!37523 () Bool)

(assert (= b_and!37521 (and (=> t!34594 result!16979) b_and!37523)))

(declare-fun m!1028119 () Bool)

(assert (=> mapNonEmpty!43222 m!1028119))

(declare-fun m!1028121 () Bool)

(assert (=> b!1109971 m!1028121))

(declare-fun m!1028123 () Bool)

(assert (=> b!1109980 m!1028123))

(declare-fun m!1028125 () Bool)

(assert (=> b!1109978 m!1028125))

(declare-fun m!1028127 () Bool)

(assert (=> b!1109975 m!1028127))

(declare-fun m!1028129 () Bool)

(assert (=> start!97372 m!1028129))

(declare-fun m!1028131 () Bool)

(assert (=> start!97372 m!1028131))

(declare-fun m!1028133 () Bool)

(assert (=> bm!46722 m!1028133))

(declare-fun m!1028135 () Bool)

(assert (=> bm!46722 m!1028135))

(declare-fun m!1028137 () Bool)

(assert (=> bm!46722 m!1028137))

(declare-fun m!1028139 () Bool)

(assert (=> bm!46723 m!1028139))

(declare-fun m!1028141 () Bool)

(assert (=> b!1109977 m!1028141))

(declare-fun m!1028143 () Bool)

(assert (=> b!1109976 m!1028143))

(declare-fun m!1028145 () Bool)

(assert (=> b!1109969 m!1028145))

(declare-fun m!1028147 () Bool)

(assert (=> b!1109969 m!1028147))

(declare-fun m!1028149 () Bool)

(assert (=> b!1109974 m!1028149))

(declare-fun m!1028151 () Bool)

(assert (=> b!1109974 m!1028151))

(declare-fun m!1028153 () Bool)

(assert (=> b!1109981 m!1028153))

(declare-fun m!1028155 () Bool)

(assert (=> b!1109970 m!1028155))

(check-sat tp_is_empty!27603 (not b!1109980) (not b_lambda!18365) (not b!1109974) (not b!1109970) (not b!1109975) (not b!1109976) (not mapNonEmpty!43222) (not start!97372) b_and!37523 (not bm!46723) (not b!1109971) (not b_next!23343) (not b!1109981) (not b!1109977) (not bm!46722) (not b!1109969))
(check-sat b_and!37523 (not b_next!23343))
