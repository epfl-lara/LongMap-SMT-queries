; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99370 () Bool)

(assert start!99370)

(declare-fun b_free!24739 () Bool)

(declare-fun b_next!24739 () Bool)

(assert (=> start!99370 (= b_free!24739 (not b_next!24739))))

(declare-fun tp!86928 () Bool)

(declare-fun b_and!40329 () Bool)

(assert (=> start!99370 (= tp!86928 b_and!40329)))

(declare-fun b!1167709 () Bool)

(declare-fun res!774186 () Bool)

(declare-fun e!663864 () Bool)

(assert (=> b!1167709 (=> (not res!774186) (not e!663864))))

(declare-datatypes ((array!75417 0))(
  ( (array!75418 (arr!36353 (Array (_ BitVec 32) (_ BitVec 64))) (size!36890 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75417)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1167709 (= res!774186 (= (select (arr!36353 _keys!1208) i!673) k0!934))))

(declare-fun b!1167710 () Bool)

(declare-fun e!663863 () Bool)

(assert (=> b!1167710 (= e!663863 true)))

(declare-datatypes ((V!44153 0))(
  ( (V!44154 (val!14691 Int)) )
))
(declare-fun zeroValue!944 () V!44153)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13925 0))(
  ( (ValueCellFull!13925 (v!17324 V!44153)) (EmptyCell!13925) )
))
(declare-datatypes ((array!75419 0))(
  ( (array!75420 (arr!36354 (Array (_ BitVec 32) ValueCell!13925)) (size!36891 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75419)

(declare-fun minValue!944 () V!44153)

(declare-fun lt!525733 () array!75419)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525731 () array!75417)

(declare-datatypes ((tuple2!18772 0))(
  ( (tuple2!18773 (_1!9397 (_ BitVec 64)) (_2!9397 V!44153)) )
))
(declare-datatypes ((List!25511 0))(
  ( (Nil!25508) (Cons!25507 (h!26725 tuple2!18772) (t!37234 List!25511)) )
))
(declare-datatypes ((ListLongMap!16749 0))(
  ( (ListLongMap!16750 (toList!8390 List!25511)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4881 (array!75417 array!75419 (_ BitVec 32) (_ BitVec 32) V!44153 V!44153 (_ BitVec 32) Int) ListLongMap!16749)

(declare-fun -!1453 (ListLongMap!16749 (_ BitVec 64)) ListLongMap!16749)

(assert (=> b!1167710 (= (getCurrentListMapNoExtraKeys!4881 lt!525731 lt!525733 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1453 (getCurrentListMapNoExtraKeys!4881 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38477 0))(
  ( (Unit!38478) )
))
(declare-fun lt!525729 () Unit!38477)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 (array!75417 array!75419 (_ BitVec 32) (_ BitVec 32) V!44153 V!44153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38477)

(assert (=> b!1167710 (= lt!525729 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!774188 () Bool)

(assert (=> start!99370 (=> (not res!774188) (not e!663864))))

(assert (=> start!99370 (= res!774188 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36890 _keys!1208))))))

(assert (=> start!99370 e!663864))

(declare-fun tp_is_empty!29269 () Bool)

(assert (=> start!99370 tp_is_empty!29269))

(declare-fun array_inv!27870 (array!75417) Bool)

(assert (=> start!99370 (array_inv!27870 _keys!1208)))

(assert (=> start!99370 true))

(assert (=> start!99370 tp!86928))

(declare-fun e!663859 () Bool)

(declare-fun array_inv!27871 (array!75419) Bool)

(assert (=> start!99370 (and (array_inv!27871 _values!996) e!663859)))

(declare-fun b!1167711 () Bool)

(declare-fun e!663860 () Bool)

(assert (=> b!1167711 (= e!663860 e!663863)))

(declare-fun res!774191 () Bool)

(assert (=> b!1167711 (=> res!774191 e!663863)))

(assert (=> b!1167711 (= res!774191 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525730 () ListLongMap!16749)

(assert (=> b!1167711 (= lt!525730 (getCurrentListMapNoExtraKeys!4881 lt!525731 lt!525733 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2870 (Int (_ BitVec 64)) V!44153)

(assert (=> b!1167711 (= lt!525733 (array!75420 (store (arr!36354 _values!996) i!673 (ValueCellFull!13925 (dynLambda!2870 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36891 _values!996)))))

(declare-fun lt!525732 () ListLongMap!16749)

(assert (=> b!1167711 (= lt!525732 (getCurrentListMapNoExtraKeys!4881 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167712 () Bool)

(declare-fun res!774189 () Bool)

(assert (=> b!1167712 (=> (not res!774189) (not e!663864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167712 (= res!774189 (validMask!0 mask!1564))))

(declare-fun b!1167713 () Bool)

(declare-fun e!663858 () Bool)

(assert (=> b!1167713 (= e!663858 tp_is_empty!29269)))

(declare-fun b!1167714 () Bool)

(declare-fun res!774190 () Bool)

(assert (=> b!1167714 (=> (not res!774190) (not e!663864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167714 (= res!774190 (validKeyInArray!0 k0!934))))

(declare-fun b!1167715 () Bool)

(declare-fun e!663861 () Bool)

(declare-fun mapRes!45728 () Bool)

(assert (=> b!1167715 (= e!663859 (and e!663861 mapRes!45728))))

(declare-fun condMapEmpty!45728 () Bool)

(declare-fun mapDefault!45728 () ValueCell!13925)

(assert (=> b!1167715 (= condMapEmpty!45728 (= (arr!36354 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13925)) mapDefault!45728)))))

(declare-fun b!1167716 () Bool)

(declare-fun res!774185 () Bool)

(assert (=> b!1167716 (=> (not res!774185) (not e!663864))))

(declare-datatypes ((List!25512 0))(
  ( (Nil!25509) (Cons!25508 (h!26726 (_ BitVec 64)) (t!37235 List!25512)) )
))
(declare-fun arrayNoDuplicates!0 (array!75417 (_ BitVec 32) List!25512) Bool)

(assert (=> b!1167716 (= res!774185 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25509))))

(declare-fun b!1167717 () Bool)

(declare-fun res!774195 () Bool)

(assert (=> b!1167717 (=> (not res!774195) (not e!663864))))

(assert (=> b!1167717 (= res!774195 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36890 _keys!1208))))))

(declare-fun b!1167718 () Bool)

(declare-fun res!774194 () Bool)

(assert (=> b!1167718 (=> (not res!774194) (not e!663864))))

(assert (=> b!1167718 (= res!774194 (and (= (size!36891 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36890 _keys!1208) (size!36891 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167719 () Bool)

(declare-fun res!774193 () Bool)

(declare-fun e!663862 () Bool)

(assert (=> b!1167719 (=> (not res!774193) (not e!663862))))

(assert (=> b!1167719 (= res!774193 (arrayNoDuplicates!0 lt!525731 #b00000000000000000000000000000000 Nil!25509))))

(declare-fun b!1167720 () Bool)

(assert (=> b!1167720 (= e!663861 tp_is_empty!29269)))

(declare-fun b!1167721 () Bool)

(assert (=> b!1167721 (= e!663862 (not e!663860))))

(declare-fun res!774184 () Bool)

(assert (=> b!1167721 (=> res!774184 e!663860)))

(assert (=> b!1167721 (= res!774184 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167721 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525728 () Unit!38477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75417 (_ BitVec 64) (_ BitVec 32)) Unit!38477)

(assert (=> b!1167721 (= lt!525728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167722 () Bool)

(assert (=> b!1167722 (= e!663864 e!663862)))

(declare-fun res!774192 () Bool)

(assert (=> b!1167722 (=> (not res!774192) (not e!663862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75417 (_ BitVec 32)) Bool)

(assert (=> b!1167722 (= res!774192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525731 mask!1564))))

(assert (=> b!1167722 (= lt!525731 (array!75418 (store (arr!36353 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36890 _keys!1208)))))

(declare-fun mapIsEmpty!45728 () Bool)

(assert (=> mapIsEmpty!45728 mapRes!45728))

(declare-fun mapNonEmpty!45728 () Bool)

(declare-fun tp!86927 () Bool)

(assert (=> mapNonEmpty!45728 (= mapRes!45728 (and tp!86927 e!663858))))

(declare-fun mapRest!45728 () (Array (_ BitVec 32) ValueCell!13925))

(declare-fun mapValue!45728 () ValueCell!13925)

(declare-fun mapKey!45728 () (_ BitVec 32))

(assert (=> mapNonEmpty!45728 (= (arr!36354 _values!996) (store mapRest!45728 mapKey!45728 mapValue!45728))))

(declare-fun b!1167723 () Bool)

(declare-fun res!774187 () Bool)

(assert (=> b!1167723 (=> (not res!774187) (not e!663864))))

(assert (=> b!1167723 (= res!774187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99370 res!774188) b!1167712))

(assert (= (and b!1167712 res!774189) b!1167718))

(assert (= (and b!1167718 res!774194) b!1167723))

(assert (= (and b!1167723 res!774187) b!1167716))

(assert (= (and b!1167716 res!774185) b!1167717))

(assert (= (and b!1167717 res!774195) b!1167714))

(assert (= (and b!1167714 res!774190) b!1167709))

(assert (= (and b!1167709 res!774186) b!1167722))

(assert (= (and b!1167722 res!774192) b!1167719))

(assert (= (and b!1167719 res!774193) b!1167721))

(assert (= (and b!1167721 (not res!774184)) b!1167711))

(assert (= (and b!1167711 (not res!774191)) b!1167710))

(assert (= (and b!1167715 condMapEmpty!45728) mapIsEmpty!45728))

(assert (= (and b!1167715 (not condMapEmpty!45728)) mapNonEmpty!45728))

(get-info :version)

(assert (= (and mapNonEmpty!45728 ((_ is ValueCellFull!13925) mapValue!45728)) b!1167713))

(assert (= (and b!1167715 ((_ is ValueCellFull!13925) mapDefault!45728)) b!1167720))

(assert (= start!99370 b!1167715))

(declare-fun b_lambda!19839 () Bool)

(assert (=> (not b_lambda!19839) (not b!1167711)))

(declare-fun t!37233 () Bool)

(declare-fun tb!9543 () Bool)

(assert (=> (and start!99370 (= defaultEntry!1004 defaultEntry!1004) t!37233) tb!9543))

(declare-fun result!19659 () Bool)

(assert (=> tb!9543 (= result!19659 tp_is_empty!29269)))

(assert (=> b!1167711 t!37233))

(declare-fun b_and!40331 () Bool)

(assert (= b_and!40329 (and (=> t!37233 result!19659) b_and!40331)))

(declare-fun m!1076033 () Bool)

(assert (=> b!1167716 m!1076033))

(declare-fun m!1076035 () Bool)

(assert (=> b!1167722 m!1076035))

(declare-fun m!1076037 () Bool)

(assert (=> b!1167722 m!1076037))

(declare-fun m!1076039 () Bool)

(assert (=> b!1167709 m!1076039))

(declare-fun m!1076041 () Bool)

(assert (=> mapNonEmpty!45728 m!1076041))

(declare-fun m!1076043 () Bool)

(assert (=> b!1167719 m!1076043))

(declare-fun m!1076045 () Bool)

(assert (=> b!1167712 m!1076045))

(declare-fun m!1076047 () Bool)

(assert (=> b!1167710 m!1076047))

(declare-fun m!1076049 () Bool)

(assert (=> b!1167710 m!1076049))

(assert (=> b!1167710 m!1076049))

(declare-fun m!1076051 () Bool)

(assert (=> b!1167710 m!1076051))

(declare-fun m!1076053 () Bool)

(assert (=> b!1167710 m!1076053))

(declare-fun m!1076055 () Bool)

(assert (=> start!99370 m!1076055))

(declare-fun m!1076057 () Bool)

(assert (=> start!99370 m!1076057))

(declare-fun m!1076059 () Bool)

(assert (=> b!1167714 m!1076059))

(declare-fun m!1076061 () Bool)

(assert (=> b!1167711 m!1076061))

(declare-fun m!1076063 () Bool)

(assert (=> b!1167711 m!1076063))

(declare-fun m!1076065 () Bool)

(assert (=> b!1167711 m!1076065))

(declare-fun m!1076067 () Bool)

(assert (=> b!1167711 m!1076067))

(declare-fun m!1076069 () Bool)

(assert (=> b!1167723 m!1076069))

(declare-fun m!1076071 () Bool)

(assert (=> b!1167721 m!1076071))

(declare-fun m!1076073 () Bool)

(assert (=> b!1167721 m!1076073))

(check-sat (not b_next!24739) (not mapNonEmpty!45728) b_and!40331 tp_is_empty!29269 (not b!1167716) (not b!1167723) (not b!1167719) (not start!99370) (not b!1167710) (not b!1167722) (not b!1167714) (not b_lambda!19839) (not b!1167712) (not b!1167721) (not b!1167711))
(check-sat b_and!40331 (not b_next!24739))
