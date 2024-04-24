; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99588 () Bool)

(assert start!99588)

(declare-fun b_free!24931 () Bool)

(declare-fun b_next!24931 () Bool)

(assert (=> start!99588 (= b_free!24931 (not b_next!24931))))

(declare-fun tp!87507 () Bool)

(declare-fun b_and!40731 () Bool)

(assert (=> start!99588 (= tp!87507 b_and!40731)))

(declare-fun b!1173008 () Bool)

(declare-fun e!666825 () Bool)

(declare-fun tp_is_empty!29461 () Bool)

(assert (=> b!1173008 (= e!666825 tp_is_empty!29461)))

(declare-fun b!1173009 () Bool)

(declare-fun res!778344 () Bool)

(declare-fun e!666832 () Bool)

(assert (=> b!1173009 (=> (not res!778344) (not e!666832))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75791 0))(
  ( (array!75792 (arr!36539 (Array (_ BitVec 32) (_ BitVec 64))) (size!37076 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75791)

(assert (=> b!1173009 (= res!778344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37076 _keys!1208))))))

(declare-fun b!1173010 () Bool)

(declare-fun res!778357 () Bool)

(declare-fun e!666824 () Bool)

(assert (=> b!1173010 (=> (not res!778357) (not e!666824))))

(declare-fun lt!528352 () array!75791)

(declare-datatypes ((List!25658 0))(
  ( (Nil!25655) (Cons!25654 (h!26872 (_ BitVec 64)) (t!37573 List!25658)) )
))
(declare-fun arrayNoDuplicates!0 (array!75791 (_ BitVec 32) List!25658) Bool)

(assert (=> b!1173010 (= res!778357 (arrayNoDuplicates!0 lt!528352 #b00000000000000000000000000000000 Nil!25655))))

(declare-fun b!1173011 () Bool)

(declare-fun res!778351 () Bool)

(assert (=> b!1173011 (=> (not res!778351) (not e!666832))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75791 (_ BitVec 32)) Bool)

(assert (=> b!1173011 (= res!778351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173012 () Bool)

(declare-fun e!666827 () Bool)

(declare-fun e!666835 () Bool)

(assert (=> b!1173012 (= e!666827 e!666835)))

(declare-fun res!778345 () Bool)

(assert (=> b!1173012 (=> res!778345 e!666835)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173012 (= res!778345 (not (= (select (arr!36539 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173013 () Bool)

(declare-fun e!666828 () Bool)

(assert (=> b!1173013 (= e!666828 true)))

(declare-fun lt!528346 () Bool)

(declare-fun contains!6881 (List!25658 (_ BitVec 64)) Bool)

(assert (=> b!1173013 (= lt!528346 (contains!6881 Nil!25655 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173014 () Bool)

(declare-fun res!778354 () Bool)

(assert (=> b!1173014 (=> (not res!778354) (not e!666832))))

(assert (=> b!1173014 (= res!778354 (= (select (arr!36539 _keys!1208) i!673) k0!934))))

(declare-fun b!1173016 () Bool)

(declare-fun e!666833 () Bool)

(assert (=> b!1173016 (= e!666833 tp_is_empty!29461)))

(declare-fun b!1173017 () Bool)

(declare-fun res!778343 () Bool)

(assert (=> b!1173017 (=> (not res!778343) (not e!666832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173017 (= res!778343 (validMask!0 mask!1564))))

(declare-fun b!1173018 () Bool)

(assert (=> b!1173018 (= e!666832 e!666824)))

(declare-fun res!778350 () Bool)

(assert (=> b!1173018 (=> (not res!778350) (not e!666824))))

(assert (=> b!1173018 (= res!778350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528352 mask!1564))))

(assert (=> b!1173018 (= lt!528352 (array!75792 (store (arr!36539 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37076 _keys!1208)))))

(declare-fun b!1173019 () Bool)

(declare-fun res!778358 () Bool)

(assert (=> b!1173019 (=> (not res!778358) (not e!666832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173019 (= res!778358 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46019 () Bool)

(declare-fun mapRes!46019 () Bool)

(assert (=> mapIsEmpty!46019 mapRes!46019))

(declare-fun b!1173020 () Bool)

(declare-fun e!666836 () Bool)

(assert (=> b!1173020 (= e!666836 (and e!666833 mapRes!46019))))

(declare-fun condMapEmpty!46019 () Bool)

(declare-datatypes ((V!44409 0))(
  ( (V!44410 (val!14787 Int)) )
))
(declare-datatypes ((ValueCell!14021 0))(
  ( (ValueCellFull!14021 (v!17421 V!44409)) (EmptyCell!14021) )
))
(declare-datatypes ((array!75793 0))(
  ( (array!75794 (arr!36540 (Array (_ BitVec 32) ValueCell!14021)) (size!37077 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75793)

(declare-fun mapDefault!46019 () ValueCell!14021)

(assert (=> b!1173020 (= condMapEmpty!46019 (= (arr!36540 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14021)) mapDefault!46019)))))

(declare-fun b!1173021 () Bool)

(declare-fun res!778360 () Bool)

(assert (=> b!1173021 (=> res!778360 e!666828)))

(declare-fun noDuplicate!1629 (List!25658) Bool)

(assert (=> b!1173021 (= res!778360 (not (noDuplicate!1629 Nil!25655)))))

(declare-fun b!1173022 () Bool)

(declare-fun arrayContainsKey!0 (array!75791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173022 (= e!666835 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173023 () Bool)

(declare-fun e!666826 () Bool)

(declare-fun e!666831 () Bool)

(assert (=> b!1173023 (= e!666826 e!666831)))

(declare-fun res!778356 () Bool)

(assert (=> b!1173023 (=> res!778356 e!666831)))

(assert (=> b!1173023 (= res!778356 (not (= (select (arr!36539 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1173023 e!666827))

(declare-fun res!778349 () Bool)

(assert (=> b!1173023 (=> (not res!778349) (not e!666827))))

(declare-fun lt!528347 () V!44409)

(declare-datatypes ((tuple2!18922 0))(
  ( (tuple2!18923 (_1!9472 (_ BitVec 64)) (_2!9472 V!44409)) )
))
(declare-datatypes ((List!25659 0))(
  ( (Nil!25656) (Cons!25655 (h!26873 tuple2!18922) (t!37574 List!25659)) )
))
(declare-datatypes ((ListLongMap!16899 0))(
  ( (ListLongMap!16900 (toList!8465 List!25659)) )
))
(declare-fun lt!528354 () ListLongMap!16899)

(declare-fun lt!528348 () ListLongMap!16899)

(declare-fun +!3802 (ListLongMap!16899 tuple2!18922) ListLongMap!16899)

(declare-fun get!18664 (ValueCell!14021 V!44409) V!44409)

(assert (=> b!1173023 (= res!778349 (= lt!528354 (+!3802 lt!528348 (tuple2!18923 (select (arr!36539 _keys!1208) from!1455) (get!18664 (select (arr!36540 _values!996) from!1455) lt!528347)))))))

(declare-fun mapNonEmpty!46019 () Bool)

(declare-fun tp!87506 () Bool)

(assert (=> mapNonEmpty!46019 (= mapRes!46019 (and tp!87506 e!666825))))

(declare-fun mapValue!46019 () ValueCell!14021)

(declare-fun mapRest!46019 () (Array (_ BitVec 32) ValueCell!14021))

(declare-fun mapKey!46019 () (_ BitVec 32))

(assert (=> mapNonEmpty!46019 (= (arr!36540 _values!996) (store mapRest!46019 mapKey!46019 mapValue!46019))))

(declare-fun b!1173024 () Bool)

(declare-fun e!666830 () Bool)

(assert (=> b!1173024 (= e!666824 (not e!666830))))

(declare-fun res!778346 () Bool)

(assert (=> b!1173024 (=> res!778346 e!666830)))

(assert (=> b!1173024 (= res!778346 (bvsgt from!1455 i!673))))

(assert (=> b!1173024 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38621 0))(
  ( (Unit!38622) )
))
(declare-fun lt!528358 () Unit!38621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75791 (_ BitVec 64) (_ BitVec 32)) Unit!38621)

(assert (=> b!1173024 (= lt!528358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173025 () Bool)

(assert (=> b!1173025 (= e!666831 e!666828)))

(declare-fun res!778353 () Bool)

(assert (=> b!1173025 (=> res!778353 e!666828)))

(assert (=> b!1173025 (= res!778353 (or (bvsge (size!37076 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37076 _keys!1208)) (bvsge from!1455 (size!37076 _keys!1208))))))

(assert (=> b!1173025 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25655)))

(declare-fun lt!528356 () Unit!38621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75791 (_ BitVec 32) (_ BitVec 32)) Unit!38621)

(assert (=> b!1173025 (= lt!528356 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173025 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528350 () Unit!38621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38621)

(assert (=> b!1173025 (= lt!528350 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1173015 () Bool)

(declare-fun e!666829 () Bool)

(assert (=> b!1173015 (= e!666830 e!666829)))

(declare-fun res!778347 () Bool)

(assert (=> b!1173015 (=> res!778347 e!666829)))

(assert (=> b!1173015 (= res!778347 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44409)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528353 () array!75793)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44409)

(declare-fun getCurrentListMapNoExtraKeys!4952 (array!75791 array!75793 (_ BitVec 32) (_ BitVec 32) V!44409 V!44409 (_ BitVec 32) Int) ListLongMap!16899)

(assert (=> b!1173015 (= lt!528354 (getCurrentListMapNoExtraKeys!4952 lt!528352 lt!528353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173015 (= lt!528353 (array!75794 (store (arr!36540 _values!996) i!673 (ValueCellFull!14021 lt!528347)) (size!37077 _values!996)))))

(declare-fun dynLambda!2931 (Int (_ BitVec 64)) V!44409)

(assert (=> b!1173015 (= lt!528347 (dynLambda!2931 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528355 () ListLongMap!16899)

(assert (=> b!1173015 (= lt!528355 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!778355 () Bool)

(assert (=> start!99588 (=> (not res!778355) (not e!666832))))

(assert (=> start!99588 (= res!778355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37076 _keys!1208))))))

(assert (=> start!99588 e!666832))

(assert (=> start!99588 tp_is_empty!29461))

(declare-fun array_inv!27996 (array!75791) Bool)

(assert (=> start!99588 (array_inv!27996 _keys!1208)))

(assert (=> start!99588 true))

(assert (=> start!99588 tp!87507))

(declare-fun array_inv!27997 (array!75793) Bool)

(assert (=> start!99588 (and (array_inv!27997 _values!996) e!666836)))

(declare-fun b!1173026 () Bool)

(declare-fun res!778352 () Bool)

(assert (=> b!1173026 (=> (not res!778352) (not e!666832))))

(assert (=> b!1173026 (= res!778352 (and (= (size!37077 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37076 _keys!1208) (size!37077 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173027 () Bool)

(declare-fun res!778361 () Bool)

(assert (=> b!1173027 (=> res!778361 e!666828)))

(assert (=> b!1173027 (= res!778361 (contains!6881 Nil!25655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173028 () Bool)

(assert (=> b!1173028 (= e!666829 e!666826)))

(declare-fun res!778359 () Bool)

(assert (=> b!1173028 (=> res!778359 e!666826)))

(assert (=> b!1173028 (= res!778359 (not (validKeyInArray!0 (select (arr!36539 _keys!1208) from!1455))))))

(declare-fun lt!528357 () ListLongMap!16899)

(assert (=> b!1173028 (= lt!528357 lt!528348)))

(declare-fun lt!528351 () ListLongMap!16899)

(declare-fun -!1518 (ListLongMap!16899 (_ BitVec 64)) ListLongMap!16899)

(assert (=> b!1173028 (= lt!528348 (-!1518 lt!528351 k0!934))))

(assert (=> b!1173028 (= lt!528357 (getCurrentListMapNoExtraKeys!4952 lt!528352 lt!528353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173028 (= lt!528351 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528349 () Unit!38621)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 (array!75791 array!75793 (_ BitVec 32) (_ BitVec 32) V!44409 V!44409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38621)

(assert (=> b!1173028 (= lt!528349 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173029 () Bool)

(declare-fun res!778348 () Bool)

(assert (=> b!1173029 (=> (not res!778348) (not e!666832))))

(assert (=> b!1173029 (= res!778348 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25655))))

(assert (= (and start!99588 res!778355) b!1173017))

(assert (= (and b!1173017 res!778343) b!1173026))

(assert (= (and b!1173026 res!778352) b!1173011))

(assert (= (and b!1173011 res!778351) b!1173029))

(assert (= (and b!1173029 res!778348) b!1173009))

(assert (= (and b!1173009 res!778344) b!1173019))

(assert (= (and b!1173019 res!778358) b!1173014))

(assert (= (and b!1173014 res!778354) b!1173018))

(assert (= (and b!1173018 res!778350) b!1173010))

(assert (= (and b!1173010 res!778357) b!1173024))

(assert (= (and b!1173024 (not res!778346)) b!1173015))

(assert (= (and b!1173015 (not res!778347)) b!1173028))

(assert (= (and b!1173028 (not res!778359)) b!1173023))

(assert (= (and b!1173023 res!778349) b!1173012))

(assert (= (and b!1173012 (not res!778345)) b!1173022))

(assert (= (and b!1173023 (not res!778356)) b!1173025))

(assert (= (and b!1173025 (not res!778353)) b!1173021))

(assert (= (and b!1173021 (not res!778360)) b!1173027))

(assert (= (and b!1173027 (not res!778361)) b!1173013))

(assert (= (and b!1173020 condMapEmpty!46019) mapIsEmpty!46019))

(assert (= (and b!1173020 (not condMapEmpty!46019)) mapNonEmpty!46019))

(get-info :version)

(assert (= (and mapNonEmpty!46019 ((_ is ValueCellFull!14021) mapValue!46019)) b!1173008))

(assert (= (and b!1173020 ((_ is ValueCellFull!14021) mapDefault!46019)) b!1173016))

(assert (= start!99588 b!1173020))

(declare-fun b_lambda!20069 () Bool)

(assert (=> (not b_lambda!20069) (not b!1173015)))

(declare-fun t!37572 () Bool)

(declare-fun tb!9735 () Bool)

(assert (=> (and start!99588 (= defaultEntry!1004 defaultEntry!1004) t!37572) tb!9735))

(declare-fun result!20045 () Bool)

(assert (=> tb!9735 (= result!20045 tp_is_empty!29461)))

(assert (=> b!1173015 t!37572))

(declare-fun b_and!40733 () Bool)

(assert (= b_and!40731 (and (=> t!37572 result!20045) b_and!40733)))

(declare-fun m!1081107 () Bool)

(assert (=> b!1173010 m!1081107))

(declare-fun m!1081109 () Bool)

(assert (=> b!1173028 m!1081109))

(declare-fun m!1081111 () Bool)

(assert (=> b!1173028 m!1081111))

(declare-fun m!1081113 () Bool)

(assert (=> b!1173028 m!1081113))

(declare-fun m!1081115 () Bool)

(assert (=> b!1173028 m!1081115))

(declare-fun m!1081117 () Bool)

(assert (=> b!1173028 m!1081117))

(declare-fun m!1081119 () Bool)

(assert (=> b!1173028 m!1081119))

(assert (=> b!1173028 m!1081117))

(declare-fun m!1081121 () Bool)

(assert (=> b!1173013 m!1081121))

(declare-fun m!1081123 () Bool)

(assert (=> b!1173029 m!1081123))

(declare-fun m!1081125 () Bool)

(assert (=> b!1173018 m!1081125))

(declare-fun m!1081127 () Bool)

(assert (=> b!1173018 m!1081127))

(declare-fun m!1081129 () Bool)

(assert (=> b!1173011 m!1081129))

(declare-fun m!1081131 () Bool)

(assert (=> b!1173025 m!1081131))

(declare-fun m!1081133 () Bool)

(assert (=> b!1173025 m!1081133))

(declare-fun m!1081135 () Bool)

(assert (=> b!1173025 m!1081135))

(declare-fun m!1081137 () Bool)

(assert (=> b!1173025 m!1081137))

(declare-fun m!1081139 () Bool)

(assert (=> b!1173024 m!1081139))

(declare-fun m!1081141 () Bool)

(assert (=> b!1173024 m!1081141))

(declare-fun m!1081143 () Bool)

(assert (=> b!1173015 m!1081143))

(declare-fun m!1081145 () Bool)

(assert (=> b!1173015 m!1081145))

(declare-fun m!1081147 () Bool)

(assert (=> b!1173015 m!1081147))

(declare-fun m!1081149 () Bool)

(assert (=> b!1173015 m!1081149))

(assert (=> b!1173012 m!1081117))

(declare-fun m!1081151 () Bool)

(assert (=> b!1173027 m!1081151))

(declare-fun m!1081153 () Bool)

(assert (=> b!1173017 m!1081153))

(declare-fun m!1081155 () Bool)

(assert (=> b!1173014 m!1081155))

(declare-fun m!1081157 () Bool)

(assert (=> start!99588 m!1081157))

(declare-fun m!1081159 () Bool)

(assert (=> start!99588 m!1081159))

(declare-fun m!1081161 () Bool)

(assert (=> b!1173021 m!1081161))

(declare-fun m!1081163 () Bool)

(assert (=> mapNonEmpty!46019 m!1081163))

(declare-fun m!1081165 () Bool)

(assert (=> b!1173022 m!1081165))

(declare-fun m!1081167 () Bool)

(assert (=> b!1173019 m!1081167))

(assert (=> b!1173023 m!1081117))

(declare-fun m!1081169 () Bool)

(assert (=> b!1173023 m!1081169))

(assert (=> b!1173023 m!1081169))

(declare-fun m!1081171 () Bool)

(assert (=> b!1173023 m!1081171))

(declare-fun m!1081173 () Bool)

(assert (=> b!1173023 m!1081173))

(check-sat (not start!99588) (not b!1173027) (not b!1173019) (not b!1173029) b_and!40733 (not b!1173011) (not b!1173010) (not b!1173023) (not b_next!24931) tp_is_empty!29461 (not b!1173028) (not b!1173024) (not b!1173018) (not b_lambda!20069) (not b!1173015) (not b!1173022) (not mapNonEmpty!46019) (not b!1173021) (not b!1173017) (not b!1173013) (not b!1173025))
(check-sat b_and!40733 (not b_next!24931))
