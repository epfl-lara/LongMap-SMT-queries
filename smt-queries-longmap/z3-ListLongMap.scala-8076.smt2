; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99558 () Bool)

(assert start!99558)

(declare-fun b_free!24901 () Bool)

(declare-fun b_next!24901 () Bool)

(assert (=> start!99558 (= b_free!24901 (not b_next!24901))))

(declare-fun tp!87416 () Bool)

(declare-fun b_and!40671 () Bool)

(assert (=> start!99558 (= tp!87416 b_and!40671)))

(declare-fun b!1172009 () Bool)

(declare-fun e!666248 () Bool)

(declare-fun e!666250 () Bool)

(declare-fun mapRes!45974 () Bool)

(assert (=> b!1172009 (= e!666248 (and e!666250 mapRes!45974))))

(declare-fun condMapEmpty!45974 () Bool)

(declare-datatypes ((V!44369 0))(
  ( (V!44370 (val!14772 Int)) )
))
(declare-datatypes ((ValueCell!14006 0))(
  ( (ValueCellFull!14006 (v!17406 V!44369)) (EmptyCell!14006) )
))
(declare-datatypes ((array!75731 0))(
  ( (array!75732 (arr!36509 (Array (_ BitVec 32) ValueCell!14006)) (size!37046 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75731)

(declare-fun mapDefault!45974 () ValueCell!14006)

(assert (=> b!1172009 (= condMapEmpty!45974 (= (arr!36509 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14006)) mapDefault!45974)))))

(declare-fun b!1172010 () Bool)

(declare-fun e!666246 () Bool)

(declare-fun e!666255 () Bool)

(assert (=> b!1172010 (= e!666246 e!666255)))

(declare-fun res!777517 () Bool)

(assert (=> b!1172010 (=> res!777517 e!666255)))

(declare-datatypes ((array!75733 0))(
  ( (array!75734 (arr!36510 (Array (_ BitVec 32) (_ BitVec 64))) (size!37047 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75733)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172010 (= res!777517 (not (validKeyInArray!0 (select (arr!36510 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18896 0))(
  ( (tuple2!18897 (_1!9459 (_ BitVec 64)) (_2!9459 V!44369)) )
))
(declare-datatypes ((List!25630 0))(
  ( (Nil!25627) (Cons!25626 (h!26844 tuple2!18896) (t!37515 List!25630)) )
))
(declare-datatypes ((ListLongMap!16873 0))(
  ( (ListLongMap!16874 (toList!8452 List!25630)) )
))
(declare-fun lt!527780 () ListLongMap!16873)

(declare-fun lt!527776 () ListLongMap!16873)

(assert (=> b!1172010 (= lt!527780 lt!527776)))

(declare-fun lt!527781 () ListLongMap!16873)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1507 (ListLongMap!16873 (_ BitVec 64)) ListLongMap!16873)

(assert (=> b!1172010 (= lt!527776 (-!1507 lt!527781 k0!934))))

(declare-fun zeroValue!944 () V!44369)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527775 () array!75731)

(declare-fun minValue!944 () V!44369)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!527779 () array!75733)

(declare-fun getCurrentListMapNoExtraKeys!4939 (array!75733 array!75731 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) Int) ListLongMap!16873)

(assert (=> b!1172010 (= lt!527780 (getCurrentListMapNoExtraKeys!4939 lt!527779 lt!527775 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172010 (= lt!527781 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38593 0))(
  ( (Unit!38594) )
))
(declare-fun lt!527778 () Unit!38593)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!732 (array!75733 array!75731 (_ BitVec 32) (_ BitVec 32) V!44369 V!44369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38593)

(assert (=> b!1172010 (= lt!527778 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!732 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172011 () Bool)

(declare-fun res!777510 () Bool)

(declare-fun e!666251 () Bool)

(assert (=> b!1172011 (=> (not res!777510) (not e!666251))))

(declare-datatypes ((List!25631 0))(
  ( (Nil!25628) (Cons!25627 (h!26845 (_ BitVec 64)) (t!37516 List!25631)) )
))
(declare-fun arrayNoDuplicates!0 (array!75733 (_ BitVec 32) List!25631) Bool)

(assert (=> b!1172011 (= res!777510 (arrayNoDuplicates!0 lt!527779 #b00000000000000000000000000000000 Nil!25628))))

(declare-fun mapIsEmpty!45974 () Bool)

(assert (=> mapIsEmpty!45974 mapRes!45974))

(declare-fun b!1172012 () Bool)

(declare-fun e!666254 () Bool)

(assert (=> b!1172012 (= e!666254 e!666246)))

(declare-fun res!777519 () Bool)

(assert (=> b!1172012 (=> res!777519 e!666246)))

(assert (=> b!1172012 (= res!777519 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527782 () ListLongMap!16873)

(assert (=> b!1172012 (= lt!527782 (getCurrentListMapNoExtraKeys!4939 lt!527779 lt!527775 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527784 () V!44369)

(assert (=> b!1172012 (= lt!527775 (array!75732 (store (arr!36509 _values!996) i!673 (ValueCellFull!14006 lt!527784)) (size!37046 _values!996)))))

(declare-fun dynLambda!2920 (Int (_ BitVec 64)) V!44369)

(assert (=> b!1172012 (= lt!527784 (dynLambda!2920 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527785 () ListLongMap!16873)

(assert (=> b!1172012 (= lt!527785 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172013 () Bool)

(declare-fun res!777509 () Bool)

(declare-fun e!666257 () Bool)

(assert (=> b!1172013 (=> (not res!777509) (not e!666257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172013 (= res!777509 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45974 () Bool)

(declare-fun tp!87417 () Bool)

(declare-fun e!666247 () Bool)

(assert (=> mapNonEmpty!45974 (= mapRes!45974 (and tp!87417 e!666247))))

(declare-fun mapValue!45974 () ValueCell!14006)

(declare-fun mapRest!45974 () (Array (_ BitVec 32) ValueCell!14006))

(declare-fun mapKey!45974 () (_ BitVec 32))

(assert (=> mapNonEmpty!45974 (= (arr!36509 _values!996) (store mapRest!45974 mapKey!45974 mapValue!45974))))

(declare-fun res!777511 () Bool)

(assert (=> start!99558 (=> (not res!777511) (not e!666257))))

(assert (=> start!99558 (= res!777511 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37047 _keys!1208))))))

(assert (=> start!99558 e!666257))

(declare-fun tp_is_empty!29431 () Bool)

(assert (=> start!99558 tp_is_empty!29431))

(declare-fun array_inv!27974 (array!75733) Bool)

(assert (=> start!99558 (array_inv!27974 _keys!1208)))

(assert (=> start!99558 true))

(assert (=> start!99558 tp!87416))

(declare-fun array_inv!27975 (array!75731) Bool)

(assert (=> start!99558 (and (array_inv!27975 _values!996) e!666248)))

(declare-fun b!1172014 () Bool)

(assert (=> b!1172014 (= e!666251 (not e!666254))))

(declare-fun res!777520 () Bool)

(assert (=> b!1172014 (=> res!777520 e!666254)))

(assert (=> b!1172014 (= res!777520 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172014 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527777 () Unit!38593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75733 (_ BitVec 64) (_ BitVec 32)) Unit!38593)

(assert (=> b!1172014 (= lt!527777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172015 () Bool)

(assert (=> b!1172015 (= e!666247 tp_is_empty!29431)))

(declare-fun b!1172016 () Bool)

(declare-fun res!777516 () Bool)

(assert (=> b!1172016 (=> (not res!777516) (not e!666257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75733 (_ BitVec 32)) Bool)

(assert (=> b!1172016 (= res!777516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172017 () Bool)

(declare-fun e!666253 () Bool)

(assert (=> b!1172017 (= e!666253 true)))

(assert (=> b!1172017 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527783 () Unit!38593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38593)

(assert (=> b!1172017 (= lt!527783 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172018 () Bool)

(declare-fun res!777514 () Bool)

(assert (=> b!1172018 (=> (not res!777514) (not e!666257))))

(assert (=> b!1172018 (= res!777514 (and (= (size!37046 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37047 _keys!1208) (size!37046 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172019 () Bool)

(declare-fun res!777524 () Bool)

(assert (=> b!1172019 (=> (not res!777524) (not e!666257))))

(assert (=> b!1172019 (= res!777524 (= (select (arr!36510 _keys!1208) i!673) k0!934))))

(declare-fun b!1172020 () Bool)

(assert (=> b!1172020 (= e!666250 tp_is_empty!29431)))

(declare-fun b!1172021 () Bool)

(declare-fun res!777512 () Bool)

(assert (=> b!1172021 (=> (not res!777512) (not e!666257))))

(assert (=> b!1172021 (= res!777512 (validKeyInArray!0 k0!934))))

(declare-fun b!1172022 () Bool)

(assert (=> b!1172022 (= e!666255 e!666253)))

(declare-fun res!777521 () Bool)

(assert (=> b!1172022 (=> res!777521 e!666253)))

(assert (=> b!1172022 (= res!777521 (not (= (select (arr!36510 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666249 () Bool)

(assert (=> b!1172022 e!666249))

(declare-fun res!777515 () Bool)

(assert (=> b!1172022 (=> (not res!777515) (not e!666249))))

(declare-fun +!3791 (ListLongMap!16873 tuple2!18896) ListLongMap!16873)

(declare-fun get!18643 (ValueCell!14006 V!44369) V!44369)

(assert (=> b!1172022 (= res!777515 (= lt!527782 (+!3791 lt!527776 (tuple2!18897 (select (arr!36510 _keys!1208) from!1455) (get!18643 (select (arr!36509 _values!996) from!1455) lt!527784)))))))

(declare-fun b!1172023 () Bool)

(declare-fun res!777518 () Bool)

(assert (=> b!1172023 (=> (not res!777518) (not e!666257))))

(assert (=> b!1172023 (= res!777518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37047 _keys!1208))))))

(declare-fun b!1172024 () Bool)

(declare-fun res!777513 () Bool)

(assert (=> b!1172024 (=> (not res!777513) (not e!666257))))

(assert (=> b!1172024 (= res!777513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25628))))

(declare-fun b!1172025 () Bool)

(declare-fun e!666252 () Bool)

(assert (=> b!1172025 (= e!666249 e!666252)))

(declare-fun res!777523 () Bool)

(assert (=> b!1172025 (=> res!777523 e!666252)))

(assert (=> b!1172025 (= res!777523 (not (= (select (arr!36510 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172026 () Bool)

(assert (=> b!1172026 (= e!666257 e!666251)))

(declare-fun res!777522 () Bool)

(assert (=> b!1172026 (=> (not res!777522) (not e!666251))))

(assert (=> b!1172026 (= res!777522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527779 mask!1564))))

(assert (=> b!1172026 (= lt!527779 (array!75734 (store (arr!36510 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37047 _keys!1208)))))

(declare-fun b!1172027 () Bool)

(assert (=> b!1172027 (= e!666252 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99558 res!777511) b!1172013))

(assert (= (and b!1172013 res!777509) b!1172018))

(assert (= (and b!1172018 res!777514) b!1172016))

(assert (= (and b!1172016 res!777516) b!1172024))

(assert (= (and b!1172024 res!777513) b!1172023))

(assert (= (and b!1172023 res!777518) b!1172021))

(assert (= (and b!1172021 res!777512) b!1172019))

(assert (= (and b!1172019 res!777524) b!1172026))

(assert (= (and b!1172026 res!777522) b!1172011))

(assert (= (and b!1172011 res!777510) b!1172014))

(assert (= (and b!1172014 (not res!777520)) b!1172012))

(assert (= (and b!1172012 (not res!777519)) b!1172010))

(assert (= (and b!1172010 (not res!777517)) b!1172022))

(assert (= (and b!1172022 res!777515) b!1172025))

(assert (= (and b!1172025 (not res!777523)) b!1172027))

(assert (= (and b!1172022 (not res!777521)) b!1172017))

(assert (= (and b!1172009 condMapEmpty!45974) mapIsEmpty!45974))

(assert (= (and b!1172009 (not condMapEmpty!45974)) mapNonEmpty!45974))

(get-info :version)

(assert (= (and mapNonEmpty!45974 ((_ is ValueCellFull!14006) mapValue!45974)) b!1172015))

(assert (= (and b!1172009 ((_ is ValueCellFull!14006) mapDefault!45974)) b!1172020))

(assert (= start!99558 b!1172009))

(declare-fun b_lambda!20039 () Bool)

(assert (=> (not b_lambda!20039) (not b!1172012)))

(declare-fun t!37514 () Bool)

(declare-fun tb!9705 () Bool)

(assert (=> (and start!99558 (= defaultEntry!1004 defaultEntry!1004) t!37514) tb!9705))

(declare-fun result!19985 () Bool)

(assert (=> tb!9705 (= result!19985 tp_is_empty!29431)))

(assert (=> b!1172012 t!37514))

(declare-fun b_and!40673 () Bool)

(assert (= b_and!40671 (and (=> t!37514 result!19985) b_and!40673)))

(declare-fun m!1080117 () Bool)

(assert (=> b!1172026 m!1080117))

(declare-fun m!1080119 () Bool)

(assert (=> b!1172026 m!1080119))

(declare-fun m!1080121 () Bool)

(assert (=> b!1172010 m!1080121))

(declare-fun m!1080123 () Bool)

(assert (=> b!1172010 m!1080123))

(declare-fun m!1080125 () Bool)

(assert (=> b!1172010 m!1080125))

(declare-fun m!1080127 () Bool)

(assert (=> b!1172010 m!1080127))

(declare-fun m!1080129 () Bool)

(assert (=> b!1172010 m!1080129))

(assert (=> b!1172010 m!1080127))

(declare-fun m!1080131 () Bool)

(assert (=> b!1172010 m!1080131))

(declare-fun m!1080133 () Bool)

(assert (=> b!1172011 m!1080133))

(declare-fun m!1080135 () Bool)

(assert (=> b!1172013 m!1080135))

(assert (=> b!1172025 m!1080127))

(declare-fun m!1080137 () Bool)

(assert (=> b!1172016 m!1080137))

(declare-fun m!1080139 () Bool)

(assert (=> mapNonEmpty!45974 m!1080139))

(declare-fun m!1080141 () Bool)

(assert (=> b!1172024 m!1080141))

(assert (=> b!1172022 m!1080127))

(declare-fun m!1080143 () Bool)

(assert (=> b!1172022 m!1080143))

(assert (=> b!1172022 m!1080143))

(declare-fun m!1080145 () Bool)

(assert (=> b!1172022 m!1080145))

(declare-fun m!1080147 () Bool)

(assert (=> b!1172022 m!1080147))

(declare-fun m!1080149 () Bool)

(assert (=> b!1172027 m!1080149))

(declare-fun m!1080151 () Bool)

(assert (=> b!1172014 m!1080151))

(declare-fun m!1080153 () Bool)

(assert (=> b!1172014 m!1080153))

(declare-fun m!1080155 () Bool)

(assert (=> b!1172019 m!1080155))

(declare-fun m!1080157 () Bool)

(assert (=> start!99558 m!1080157))

(declare-fun m!1080159 () Bool)

(assert (=> start!99558 m!1080159))

(declare-fun m!1080161 () Bool)

(assert (=> b!1172012 m!1080161))

(declare-fun m!1080163 () Bool)

(assert (=> b!1172012 m!1080163))

(declare-fun m!1080165 () Bool)

(assert (=> b!1172012 m!1080165))

(declare-fun m!1080167 () Bool)

(assert (=> b!1172012 m!1080167))

(declare-fun m!1080169 () Bool)

(assert (=> b!1172017 m!1080169))

(declare-fun m!1080171 () Bool)

(assert (=> b!1172017 m!1080171))

(declare-fun m!1080173 () Bool)

(assert (=> b!1172021 m!1080173))

(check-sat b_and!40673 (not b!1172022) (not b!1172017) (not b!1172021) (not b!1172024) (not b!1172027) (not b_next!24901) (not b!1172014) (not b!1172016) tp_is_empty!29431 (not b!1172011) (not mapNonEmpty!45974) (not b!1172012) (not b!1172010) (not start!99558) (not b!1172026) (not b_lambda!20039) (not b!1172013))
(check-sat b_and!40673 (not b_next!24901))
