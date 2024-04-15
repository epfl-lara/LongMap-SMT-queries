; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98090 () Bool)

(assert start!98090)

(declare-fun b_free!23797 () Bool)

(declare-fun b_next!23797 () Bool)

(assert (=> start!98090 (= b_free!23797 (not b_next!23797))))

(declare-fun tp!84095 () Bool)

(declare-fun b_and!38355 () Bool)

(assert (=> start!98090 (= tp!84095 b_and!38355)))

(declare-fun b!1126779 () Bool)

(declare-fun res!752980 () Bool)

(declare-fun e!641339 () Bool)

(assert (=> b!1126779 (=> res!752980 e!641339)))

(declare-datatypes ((V!42897 0))(
  ( (V!42898 (val!14220 Int)) )
))
(declare-fun zeroValue!944 () V!42897)

(declare-datatypes ((array!73442 0))(
  ( (array!73443 (arr!35374 (Array (_ BitVec 32) (_ BitVec 64))) (size!35912 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73442)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13454 0))(
  ( (ValueCellFull!13454 (v!16852 V!42897)) (EmptyCell!13454) )
))
(declare-datatypes ((array!73444 0))(
  ( (array!73445 (arr!35375 (Array (_ BitVec 32) ValueCell!13454)) (size!35913 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73444)

(declare-fun minValue!944 () V!42897)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17976 0))(
  ( (tuple2!17977 (_1!8999 (_ BitVec 64)) (_2!8999 V!42897)) )
))
(declare-datatypes ((List!24734 0))(
  ( (Nil!24731) (Cons!24730 (h!25939 tuple2!17976) (t!35514 List!24734)) )
))
(declare-datatypes ((ListLongMap!15945 0))(
  ( (ListLongMap!15946 (toList!7988 List!24734)) )
))
(declare-fun contains!6450 (ListLongMap!15945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4489 (array!73442 array!73444 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) Int) ListLongMap!15945)

(assert (=> b!1126779 (= res!752980 (not (contains!6450 (getCurrentListMapNoExtraKeys!4489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1126780 () Bool)

(declare-fun res!752983 () Bool)

(declare-fun e!641341 () Bool)

(assert (=> b!1126780 (=> (not res!752983) (not e!641341))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126780 (= res!752983 (= (select (arr!35374 _keys!1208) i!673) k0!934))))

(declare-fun b!1126781 () Bool)

(declare-fun e!641340 () Bool)

(assert (=> b!1126781 (= e!641340 e!641339)))

(declare-fun res!752989 () Bool)

(assert (=> b!1126781 (=> res!752989 e!641339)))

(assert (=> b!1126781 (= res!752989 (not (= (select (arr!35374 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641346 () Bool)

(assert (=> b!1126781 e!641346))

(declare-fun c!109659 () Bool)

(assert (=> b!1126781 (= c!109659 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36779 0))(
  ( (Unit!36780) )
))
(declare-fun lt!500202 () Unit!36779)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!394 (array!73442 array!73444 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36779)

(assert (=> b!1126781 (= lt!500202 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44308 () Bool)

(declare-fun mapRes!44308 () Bool)

(assert (=> mapIsEmpty!44308 mapRes!44308))

(declare-fun b!1126782 () Bool)

(declare-fun e!641345 () Bool)

(declare-fun tp_is_empty!28327 () Bool)

(assert (=> b!1126782 (= e!641345 tp_is_empty!28327)))

(declare-fun b!1126783 () Bool)

(declare-fun e!641338 () Bool)

(assert (=> b!1126783 (= e!641338 tp_is_empty!28327)))

(declare-fun b!1126784 () Bool)

(declare-fun res!752988 () Bool)

(declare-fun e!641342 () Bool)

(assert (=> b!1126784 (=> (not res!752988) (not e!641342))))

(declare-fun lt!500200 () array!73442)

(declare-datatypes ((List!24735 0))(
  ( (Nil!24732) (Cons!24731 (h!25940 (_ BitVec 64)) (t!35515 List!24735)) )
))
(declare-fun arrayNoDuplicates!0 (array!73442 (_ BitVec 32) List!24735) Bool)

(assert (=> b!1126784 (= res!752988 (arrayNoDuplicates!0 lt!500200 #b00000000000000000000000000000000 Nil!24732))))

(declare-fun b!1126785 () Bool)

(declare-fun e!641343 () Bool)

(assert (=> b!1126785 (= e!641343 (and e!641338 mapRes!44308))))

(declare-fun condMapEmpty!44308 () Bool)

(declare-fun mapDefault!44308 () ValueCell!13454)

(assert (=> b!1126785 (= condMapEmpty!44308 (= (arr!35375 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13454)) mapDefault!44308)))))

(declare-fun b!1126786 () Bool)

(declare-fun res!752977 () Bool)

(assert (=> b!1126786 (=> (not res!752977) (not e!641341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73442 (_ BitVec 32)) Bool)

(assert (=> b!1126786 (= res!752977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!44308 () Bool)

(declare-fun tp!84094 () Bool)

(assert (=> mapNonEmpty!44308 (= mapRes!44308 (and tp!84094 e!641345))))

(declare-fun mapKey!44308 () (_ BitVec 32))

(declare-fun mapValue!44308 () ValueCell!13454)

(declare-fun mapRest!44308 () (Array (_ BitVec 32) ValueCell!13454))

(assert (=> mapNonEmpty!44308 (= (arr!35375 _values!996) (store mapRest!44308 mapKey!44308 mapValue!44308))))

(declare-fun b!1126787 () Bool)

(declare-fun e!641337 () Bool)

(assert (=> b!1126787 (= e!641337 e!641340)))

(declare-fun res!752979 () Bool)

(assert (=> b!1126787 (=> res!752979 e!641340)))

(assert (=> b!1126787 (= res!752979 (not (= from!1455 i!673)))))

(declare-fun lt!500198 () ListLongMap!15945)

(declare-fun lt!500199 () array!73444)

(assert (=> b!1126787 (= lt!500198 (getCurrentListMapNoExtraKeys!4489 lt!500200 lt!500199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2503 (Int (_ BitVec 64)) V!42897)

(assert (=> b!1126787 (= lt!500199 (array!73445 (store (arr!35375 _values!996) i!673 (ValueCellFull!13454 (dynLambda!2503 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35913 _values!996)))))

(declare-fun lt!500197 () ListLongMap!15945)

(assert (=> b!1126787 (= lt!500197 (getCurrentListMapNoExtraKeys!4489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47651 () ListLongMap!15945)

(declare-fun call!47650 () ListLongMap!15945)

(declare-fun b!1126788 () Bool)

(declare-fun -!1114 (ListLongMap!15945 (_ BitVec 64)) ListLongMap!15945)

(assert (=> b!1126788 (= e!641346 (= call!47650 (-!1114 call!47651 k0!934)))))

(declare-fun bm!47647 () Bool)

(assert (=> bm!47647 (= call!47651 (getCurrentListMapNoExtraKeys!4489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126790 () Bool)

(assert (=> b!1126790 (= e!641346 (= call!47650 call!47651))))

(declare-fun b!1126791 () Bool)

(assert (=> b!1126791 (= e!641339 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35912 _keys!1208)))))))

(declare-fun b!1126792 () Bool)

(declare-fun res!752985 () Bool)

(assert (=> b!1126792 (=> (not res!752985) (not e!641341))))

(assert (=> b!1126792 (= res!752985 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24732))))

(declare-fun b!1126793 () Bool)

(declare-fun res!752986 () Bool)

(assert (=> b!1126793 (=> (not res!752986) (not e!641341))))

(assert (=> b!1126793 (= res!752986 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35912 _keys!1208))))))

(declare-fun b!1126794 () Bool)

(declare-fun res!752987 () Bool)

(assert (=> b!1126794 (=> (not res!752987) (not e!641341))))

(assert (=> b!1126794 (= res!752987 (and (= (size!35913 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35912 _keys!1208) (size!35913 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126795 () Bool)

(assert (=> b!1126795 (= e!641341 e!641342)))

(declare-fun res!752976 () Bool)

(assert (=> b!1126795 (=> (not res!752976) (not e!641342))))

(assert (=> b!1126795 (= res!752976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500200 mask!1564))))

(assert (=> b!1126795 (= lt!500200 (array!73443 (store (arr!35374 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35912 _keys!1208)))))

(declare-fun b!1126796 () Bool)

(declare-fun res!752984 () Bool)

(assert (=> b!1126796 (=> (not res!752984) (not e!641341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126796 (= res!752984 (validMask!0 mask!1564))))

(declare-fun b!1126797 () Bool)

(declare-fun res!752978 () Bool)

(assert (=> b!1126797 (=> (not res!752978) (not e!641341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126797 (= res!752978 (validKeyInArray!0 k0!934))))

(declare-fun bm!47648 () Bool)

(assert (=> bm!47648 (= call!47650 (getCurrentListMapNoExtraKeys!4489 lt!500200 lt!500199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126789 () Bool)

(assert (=> b!1126789 (= e!641342 (not e!641337))))

(declare-fun res!752981 () Bool)

(assert (=> b!1126789 (=> res!752981 e!641337)))

(assert (=> b!1126789 (= res!752981 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126789 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500201 () Unit!36779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73442 (_ BitVec 64) (_ BitVec 32)) Unit!36779)

(assert (=> b!1126789 (= lt!500201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!752982 () Bool)

(assert (=> start!98090 (=> (not res!752982) (not e!641341))))

(assert (=> start!98090 (= res!752982 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35912 _keys!1208))))))

(assert (=> start!98090 e!641341))

(assert (=> start!98090 tp_is_empty!28327))

(declare-fun array_inv!27224 (array!73442) Bool)

(assert (=> start!98090 (array_inv!27224 _keys!1208)))

(assert (=> start!98090 true))

(assert (=> start!98090 tp!84095))

(declare-fun array_inv!27225 (array!73444) Bool)

(assert (=> start!98090 (and (array_inv!27225 _values!996) e!641343)))

(assert (= (and start!98090 res!752982) b!1126796))

(assert (= (and b!1126796 res!752984) b!1126794))

(assert (= (and b!1126794 res!752987) b!1126786))

(assert (= (and b!1126786 res!752977) b!1126792))

(assert (= (and b!1126792 res!752985) b!1126793))

(assert (= (and b!1126793 res!752986) b!1126797))

(assert (= (and b!1126797 res!752978) b!1126780))

(assert (= (and b!1126780 res!752983) b!1126795))

(assert (= (and b!1126795 res!752976) b!1126784))

(assert (= (and b!1126784 res!752988) b!1126789))

(assert (= (and b!1126789 (not res!752981)) b!1126787))

(assert (= (and b!1126787 (not res!752979)) b!1126781))

(assert (= (and b!1126781 c!109659) b!1126788))

(assert (= (and b!1126781 (not c!109659)) b!1126790))

(assert (= (or b!1126788 b!1126790) bm!47648))

(assert (= (or b!1126788 b!1126790) bm!47647))

(assert (= (and b!1126781 (not res!752989)) b!1126779))

(assert (= (and b!1126779 (not res!752980)) b!1126791))

(assert (= (and b!1126785 condMapEmpty!44308) mapIsEmpty!44308))

(assert (= (and b!1126785 (not condMapEmpty!44308)) mapNonEmpty!44308))

(get-info :version)

(assert (= (and mapNonEmpty!44308 ((_ is ValueCellFull!13454) mapValue!44308)) b!1126782))

(assert (= (and b!1126785 ((_ is ValueCellFull!13454) mapDefault!44308)) b!1126783))

(assert (= start!98090 b!1126785))

(declare-fun b_lambda!18749 () Bool)

(assert (=> (not b_lambda!18749) (not b!1126787)))

(declare-fun t!35513 () Bool)

(declare-fun tb!8601 () Bool)

(assert (=> (and start!98090 (= defaultEntry!1004 defaultEntry!1004) t!35513) tb!8601))

(declare-fun result!17771 () Bool)

(assert (=> tb!8601 (= result!17771 tp_is_empty!28327)))

(assert (=> b!1126787 t!35513))

(declare-fun b_and!38357 () Bool)

(assert (= b_and!38355 (and (=> t!35513 result!17771) b_and!38357)))

(declare-fun m!1040157 () Bool)

(assert (=> b!1126787 m!1040157))

(declare-fun m!1040159 () Bool)

(assert (=> b!1126787 m!1040159))

(declare-fun m!1040161 () Bool)

(assert (=> b!1126787 m!1040161))

(declare-fun m!1040163 () Bool)

(assert (=> b!1126787 m!1040163))

(declare-fun m!1040165 () Bool)

(assert (=> b!1126795 m!1040165))

(declare-fun m!1040167 () Bool)

(assert (=> b!1126795 m!1040167))

(declare-fun m!1040169 () Bool)

(assert (=> b!1126784 m!1040169))

(declare-fun m!1040171 () Bool)

(assert (=> b!1126786 m!1040171))

(declare-fun m!1040173 () Bool)

(assert (=> b!1126788 m!1040173))

(declare-fun m!1040175 () Bool)

(assert (=> b!1126789 m!1040175))

(declare-fun m!1040177 () Bool)

(assert (=> b!1126789 m!1040177))

(declare-fun m!1040179 () Bool)

(assert (=> bm!47648 m!1040179))

(declare-fun m!1040181 () Bool)

(assert (=> mapNonEmpty!44308 m!1040181))

(declare-fun m!1040183 () Bool)

(assert (=> b!1126779 m!1040183))

(assert (=> b!1126779 m!1040183))

(declare-fun m!1040185 () Bool)

(assert (=> b!1126779 m!1040185))

(declare-fun m!1040187 () Bool)

(assert (=> b!1126796 m!1040187))

(declare-fun m!1040189 () Bool)

(assert (=> start!98090 m!1040189))

(declare-fun m!1040191 () Bool)

(assert (=> start!98090 m!1040191))

(declare-fun m!1040193 () Bool)

(assert (=> b!1126780 m!1040193))

(declare-fun m!1040195 () Bool)

(assert (=> b!1126797 m!1040195))

(declare-fun m!1040197 () Bool)

(assert (=> b!1126792 m!1040197))

(assert (=> bm!47647 m!1040183))

(declare-fun m!1040199 () Bool)

(assert (=> b!1126781 m!1040199))

(declare-fun m!1040201 () Bool)

(assert (=> b!1126781 m!1040201))

(check-sat (not b!1126787) (not b!1126795) tp_is_empty!28327 (not b!1126796) (not mapNonEmpty!44308) (not b!1126792) (not b!1126789) (not start!98090) (not b_lambda!18749) (not b!1126786) b_and!38357 (not b!1126797) (not b_next!23797) (not b!1126784) (not bm!47647) (not b!1126781) (not b!1126788) (not b!1126779) (not bm!47648))
(check-sat b_and!38357 (not b_next!23797))
