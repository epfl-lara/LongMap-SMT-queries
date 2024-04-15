; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99652 () Bool)

(assert start!99652)

(declare-fun b_free!25237 () Bool)

(declare-fun b_next!25237 () Bool)

(assert (=> start!99652 (= b_free!25237 (not b_next!25237))))

(declare-fun tp!88424 () Bool)

(declare-fun b_and!41319 () Bool)

(assert (=> start!99652 (= tp!88424 b_and!41319)))

(declare-fun b!1181509 () Bool)

(declare-fun e!671725 () Bool)

(declare-fun e!671728 () Bool)

(assert (=> b!1181509 (= e!671725 (not e!671728))))

(declare-fun res!785176 () Bool)

(assert (=> b!1181509 (=> res!785176 e!671728)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181509 (= res!785176 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76268 0))(
  ( (array!76269 (arr!36784 (Array (_ BitVec 32) (_ BitVec 64))) (size!37322 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76268)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181509 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38918 0))(
  ( (Unit!38919) )
))
(declare-fun lt!534315 () Unit!38918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76268 (_ BitVec 64) (_ BitVec 32)) Unit!38918)

(assert (=> b!1181509 (= lt!534315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181510 () Bool)

(declare-fun res!785170 () Bool)

(declare-fun e!671720 () Bool)

(assert (=> b!1181510 (=> (not res!785170) (not e!671720))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181510 (= res!785170 (validMask!0 mask!1564))))

(declare-fun b!1181511 () Bool)

(declare-fun e!671719 () Bool)

(declare-fun tp_is_empty!29767 () Bool)

(assert (=> b!1181511 (= e!671719 tp_is_empty!29767)))

(declare-fun b!1181512 () Bool)

(declare-fun res!785179 () Bool)

(assert (=> b!1181512 (=> (not res!785179) (not e!671720))))

(assert (=> b!1181512 (= res!785179 (= (select (arr!36784 _keys!1208) i!673) k0!934))))

(declare-fun b!1181513 () Bool)

(declare-fun res!785173 () Bool)

(assert (=> b!1181513 (=> (not res!785173) (not e!671720))))

(declare-datatypes ((V!44817 0))(
  ( (V!44818 (val!14940 Int)) )
))
(declare-datatypes ((ValueCell!14174 0))(
  ( (ValueCellFull!14174 (v!17577 V!44817)) (EmptyCell!14174) )
))
(declare-datatypes ((array!76270 0))(
  ( (array!76271 (arr!36785 (Array (_ BitVec 32) ValueCell!14174)) (size!37323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76270)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1181513 (= res!785173 (and (= (size!37323 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37322 _keys!1208) (size!37323 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181514 () Bool)

(declare-fun res!785172 () Bool)

(assert (=> b!1181514 (=> (not res!785172) (not e!671725))))

(declare-fun lt!534323 () array!76268)

(declare-datatypes ((List!25954 0))(
  ( (Nil!25951) (Cons!25950 (h!27159 (_ BitVec 64)) (t!38174 List!25954)) )
))
(declare-fun arrayNoDuplicates!0 (array!76268 (_ BitVec 32) List!25954) Bool)

(assert (=> b!1181514 (= res!785172 (arrayNoDuplicates!0 lt!534323 #b00000000000000000000000000000000 Nil!25951))))

(declare-fun b!1181515 () Bool)

(declare-fun e!671724 () Bool)

(declare-fun e!671717 () Bool)

(assert (=> b!1181515 (= e!671724 e!671717)))

(declare-fun res!785182 () Bool)

(assert (=> b!1181515 (=> res!785182 e!671717)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181515 (= res!785182 (not (validKeyInArray!0 (select (arr!36784 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19250 0))(
  ( (tuple2!19251 (_1!9636 (_ BitVec 64)) (_2!9636 V!44817)) )
))
(declare-datatypes ((List!25955 0))(
  ( (Nil!25952) (Cons!25951 (h!27160 tuple2!19250) (t!38175 List!25955)) )
))
(declare-datatypes ((ListLongMap!17219 0))(
  ( (ListLongMap!17220 (toList!8625 List!25955)) )
))
(declare-fun lt!534332 () ListLongMap!17219)

(declare-fun lt!534320 () ListLongMap!17219)

(assert (=> b!1181515 (= lt!534332 lt!534320)))

(declare-fun lt!534316 () ListLongMap!17219)

(declare-fun -!1584 (ListLongMap!17219 (_ BitVec 64)) ListLongMap!17219)

(assert (=> b!1181515 (= lt!534320 (-!1584 lt!534316 k0!934))))

(declare-fun zeroValue!944 () V!44817)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534322 () array!76270)

(declare-fun minValue!944 () V!44817)

(declare-fun getCurrentListMapNoExtraKeys!5080 (array!76268 array!76270 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) Int) ListLongMap!17219)

(assert (=> b!1181515 (= lt!534332 (getCurrentListMapNoExtraKeys!5080 lt!534323 lt!534322 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181515 (= lt!534316 (getCurrentListMapNoExtraKeys!5080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534330 () Unit!38918)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!848 (array!76268 array!76270 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38918)

(assert (=> b!1181515 (= lt!534330 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!848 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46478 () Bool)

(declare-fun mapRes!46478 () Bool)

(assert (=> mapIsEmpty!46478 mapRes!46478))

(declare-fun b!1181516 () Bool)

(declare-fun res!785175 () Bool)

(assert (=> b!1181516 (=> (not res!785175) (not e!671720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76268 (_ BitVec 32)) Bool)

(assert (=> b!1181516 (= res!785175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!671726 () Bool)

(declare-fun b!1181517 () Bool)

(assert (=> b!1181517 (= e!671726 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181518 () Bool)

(declare-fun e!671727 () Unit!38918)

(declare-fun Unit!38920 () Unit!38918)

(assert (=> b!1181518 (= e!671727 Unit!38920)))

(declare-fun lt!534327 () Unit!38918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76268 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38918)

(assert (=> b!1181518 (= lt!534327 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181518 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534333 () Unit!38918)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76268 (_ BitVec 32) (_ BitVec 32)) Unit!38918)

(assert (=> b!1181518 (= lt!534333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181518 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25951)))

(declare-fun lt!534318 () Unit!38918)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76268 (_ BitVec 64) (_ BitVec 32) List!25954) Unit!38918)

(assert (=> b!1181518 (= lt!534318 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25951))))

(assert (=> b!1181518 false))

(declare-fun b!1181519 () Bool)

(declare-fun e!671722 () Bool)

(assert (=> b!1181519 (= e!671722 tp_is_empty!29767)))

(declare-fun b!1181520 () Bool)

(assert (=> b!1181520 (= e!671720 e!671725)))

(declare-fun res!785181 () Bool)

(assert (=> b!1181520 (=> (not res!785181) (not e!671725))))

(assert (=> b!1181520 (= res!785181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534323 mask!1564))))

(assert (=> b!1181520 (= lt!534323 (array!76269 (store (arr!36784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37322 _keys!1208)))))

(declare-fun b!1181521 () Bool)

(declare-fun Unit!38921 () Unit!38918)

(assert (=> b!1181521 (= e!671727 Unit!38921)))

(declare-fun b!1181522 () Bool)

(declare-fun res!785174 () Bool)

(assert (=> b!1181522 (=> (not res!785174) (not e!671720))))

(assert (=> b!1181522 (= res!785174 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37322 _keys!1208))))))

(declare-fun b!1181523 () Bool)

(declare-fun e!671721 () Bool)

(assert (=> b!1181523 (= e!671721 (and e!671722 mapRes!46478))))

(declare-fun condMapEmpty!46478 () Bool)

(declare-fun mapDefault!46478 () ValueCell!14174)

(assert (=> b!1181523 (= condMapEmpty!46478 (= (arr!36785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14174)) mapDefault!46478)))))

(declare-fun mapNonEmpty!46478 () Bool)

(declare-fun tp!88425 () Bool)

(assert (=> mapNonEmpty!46478 (= mapRes!46478 (and tp!88425 e!671719))))

(declare-fun mapValue!46478 () ValueCell!14174)

(declare-fun mapKey!46478 () (_ BitVec 32))

(declare-fun mapRest!46478 () (Array (_ BitVec 32) ValueCell!14174))

(assert (=> mapNonEmpty!46478 (= (arr!36785 _values!996) (store mapRest!46478 mapKey!46478 mapValue!46478))))

(declare-fun res!785177 () Bool)

(assert (=> start!99652 (=> (not res!785177) (not e!671720))))

(assert (=> start!99652 (= res!785177 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37322 _keys!1208))))))

(assert (=> start!99652 e!671720))

(assert (=> start!99652 tp_is_empty!29767))

(declare-fun array_inv!28194 (array!76268) Bool)

(assert (=> start!99652 (array_inv!28194 _keys!1208)))

(assert (=> start!99652 true))

(assert (=> start!99652 tp!88424))

(declare-fun array_inv!28195 (array!76270) Bool)

(assert (=> start!99652 (and (array_inv!28195 _values!996) e!671721)))

(declare-fun b!1181524 () Bool)

(declare-fun e!671723 () Bool)

(assert (=> b!1181524 (= e!671723 e!671726)))

(declare-fun res!785168 () Bool)

(assert (=> b!1181524 (=> res!785168 e!671726)))

(assert (=> b!1181524 (= res!785168 (not (= (select (arr!36784 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181525 () Bool)

(assert (=> b!1181525 (= e!671728 e!671724)))

(declare-fun res!785171 () Bool)

(assert (=> b!1181525 (=> res!785171 e!671724)))

(assert (=> b!1181525 (= res!785171 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!534331 () ListLongMap!17219)

(assert (=> b!1181525 (= lt!534331 (getCurrentListMapNoExtraKeys!5080 lt!534323 lt!534322 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534317 () V!44817)

(assert (=> b!1181525 (= lt!534322 (array!76271 (store (arr!36785 _values!996) i!673 (ValueCellFull!14174 lt!534317)) (size!37323 _values!996)))))

(declare-fun dynLambda!2988 (Int (_ BitVec 64)) V!44817)

(assert (=> b!1181525 (= lt!534317 (dynLambda!2988 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534326 () ListLongMap!17219)

(assert (=> b!1181525 (= lt!534326 (getCurrentListMapNoExtraKeys!5080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181526 () Bool)

(declare-fun res!785169 () Bool)

(assert (=> b!1181526 (=> (not res!785169) (not e!671720))))

(assert (=> b!1181526 (= res!785169 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25951))))

(declare-fun b!1181527 () Bool)

(assert (=> b!1181527 (= e!671717 true)))

(declare-fun lt!534321 () ListLongMap!17219)

(declare-fun lt!534319 () ListLongMap!17219)

(assert (=> b!1181527 (= (-!1584 lt!534321 k0!934) lt!534319)))

(declare-fun lt!534324 () V!44817)

(declare-fun lt!534329 () Unit!38918)

(declare-fun addRemoveCommutativeForDiffKeys!136 (ListLongMap!17219 (_ BitVec 64) V!44817 (_ BitVec 64)) Unit!38918)

(assert (=> b!1181527 (= lt!534329 (addRemoveCommutativeForDiffKeys!136 lt!534316 (select (arr!36784 _keys!1208) from!1455) lt!534324 k0!934))))

(assert (=> b!1181527 (and (= lt!534326 lt!534321) (= lt!534320 lt!534332))))

(declare-fun lt!534325 () tuple2!19250)

(declare-fun +!3922 (ListLongMap!17219 tuple2!19250) ListLongMap!17219)

(assert (=> b!1181527 (= lt!534321 (+!3922 lt!534316 lt!534325))))

(assert (=> b!1181527 (not (= (select (arr!36784 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534328 () Unit!38918)

(assert (=> b!1181527 (= lt!534328 e!671727)))

(declare-fun c!116953 () Bool)

(assert (=> b!1181527 (= c!116953 (= (select (arr!36784 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181527 e!671723))

(declare-fun res!785180 () Bool)

(assert (=> b!1181527 (=> (not res!785180) (not e!671723))))

(assert (=> b!1181527 (= res!785180 (= lt!534331 lt!534319))))

(assert (=> b!1181527 (= lt!534319 (+!3922 lt!534320 lt!534325))))

(assert (=> b!1181527 (= lt!534325 (tuple2!19251 (select (arr!36784 _keys!1208) from!1455) lt!534324))))

(declare-fun get!18823 (ValueCell!14174 V!44817) V!44817)

(assert (=> b!1181527 (= lt!534324 (get!18823 (select (arr!36785 _values!996) from!1455) lt!534317))))

(declare-fun b!1181528 () Bool)

(declare-fun res!785178 () Bool)

(assert (=> b!1181528 (=> (not res!785178) (not e!671720))))

(assert (=> b!1181528 (= res!785178 (validKeyInArray!0 k0!934))))

(assert (= (and start!99652 res!785177) b!1181510))

(assert (= (and b!1181510 res!785170) b!1181513))

(assert (= (and b!1181513 res!785173) b!1181516))

(assert (= (and b!1181516 res!785175) b!1181526))

(assert (= (and b!1181526 res!785169) b!1181522))

(assert (= (and b!1181522 res!785174) b!1181528))

(assert (= (and b!1181528 res!785178) b!1181512))

(assert (= (and b!1181512 res!785179) b!1181520))

(assert (= (and b!1181520 res!785181) b!1181514))

(assert (= (and b!1181514 res!785172) b!1181509))

(assert (= (and b!1181509 (not res!785176)) b!1181525))

(assert (= (and b!1181525 (not res!785171)) b!1181515))

(assert (= (and b!1181515 (not res!785182)) b!1181527))

(assert (= (and b!1181527 res!785180) b!1181524))

(assert (= (and b!1181524 (not res!785168)) b!1181517))

(assert (= (and b!1181527 c!116953) b!1181518))

(assert (= (and b!1181527 (not c!116953)) b!1181521))

(assert (= (and b!1181523 condMapEmpty!46478) mapIsEmpty!46478))

(assert (= (and b!1181523 (not condMapEmpty!46478)) mapNonEmpty!46478))

(get-info :version)

(assert (= (and mapNonEmpty!46478 ((_ is ValueCellFull!14174) mapValue!46478)) b!1181511))

(assert (= (and b!1181523 ((_ is ValueCellFull!14174) mapDefault!46478)) b!1181519))

(assert (= start!99652 b!1181523))

(declare-fun b_lambda!20363 () Bool)

(assert (=> (not b_lambda!20363) (not b!1181525)))

(declare-fun t!38173 () Bool)

(declare-fun tb!10041 () Bool)

(assert (=> (and start!99652 (= defaultEntry!1004 defaultEntry!1004) t!38173) tb!10041))

(declare-fun result!20657 () Bool)

(assert (=> tb!10041 (= result!20657 tp_is_empty!29767)))

(assert (=> b!1181525 t!38173))

(declare-fun b_and!41321 () Bool)

(assert (= b_and!41319 (and (=> t!38173 result!20657) b_and!41321)))

(declare-fun m!1088945 () Bool)

(assert (=> mapNonEmpty!46478 m!1088945))

(declare-fun m!1088947 () Bool)

(assert (=> b!1181515 m!1088947))

(declare-fun m!1088949 () Bool)

(assert (=> b!1181515 m!1088949))

(declare-fun m!1088951 () Bool)

(assert (=> b!1181515 m!1088951))

(declare-fun m!1088953 () Bool)

(assert (=> b!1181515 m!1088953))

(declare-fun m!1088955 () Bool)

(assert (=> b!1181515 m!1088955))

(declare-fun m!1088957 () Bool)

(assert (=> b!1181515 m!1088957))

(assert (=> b!1181515 m!1088953))

(declare-fun m!1088959 () Bool)

(assert (=> b!1181528 m!1088959))

(declare-fun m!1088961 () Bool)

(assert (=> b!1181514 m!1088961))

(declare-fun m!1088963 () Bool)

(assert (=> b!1181516 m!1088963))

(declare-fun m!1088965 () Bool)

(assert (=> b!1181526 m!1088965))

(declare-fun m!1088967 () Bool)

(assert (=> b!1181518 m!1088967))

(declare-fun m!1088969 () Bool)

(assert (=> b!1181518 m!1088969))

(declare-fun m!1088971 () Bool)

(assert (=> b!1181518 m!1088971))

(declare-fun m!1088973 () Bool)

(assert (=> b!1181518 m!1088973))

(declare-fun m!1088975 () Bool)

(assert (=> b!1181518 m!1088975))

(declare-fun m!1088977 () Bool)

(assert (=> b!1181517 m!1088977))

(declare-fun m!1088979 () Bool)

(assert (=> b!1181527 m!1088979))

(declare-fun m!1088981 () Bool)

(assert (=> b!1181527 m!1088981))

(assert (=> b!1181527 m!1088953))

(declare-fun m!1088983 () Bool)

(assert (=> b!1181527 m!1088983))

(declare-fun m!1088985 () Bool)

(assert (=> b!1181527 m!1088985))

(assert (=> b!1181527 m!1088953))

(assert (=> b!1181527 m!1088981))

(declare-fun m!1088987 () Bool)

(assert (=> b!1181527 m!1088987))

(declare-fun m!1088989 () Bool)

(assert (=> b!1181527 m!1088989))

(declare-fun m!1088991 () Bool)

(assert (=> start!99652 m!1088991))

(declare-fun m!1088993 () Bool)

(assert (=> start!99652 m!1088993))

(assert (=> b!1181524 m!1088953))

(declare-fun m!1088995 () Bool)

(assert (=> b!1181509 m!1088995))

(declare-fun m!1088997 () Bool)

(assert (=> b!1181509 m!1088997))

(declare-fun m!1088999 () Bool)

(assert (=> b!1181525 m!1088999))

(declare-fun m!1089001 () Bool)

(assert (=> b!1181525 m!1089001))

(declare-fun m!1089003 () Bool)

(assert (=> b!1181525 m!1089003))

(declare-fun m!1089005 () Bool)

(assert (=> b!1181525 m!1089005))

(declare-fun m!1089007 () Bool)

(assert (=> b!1181512 m!1089007))

(declare-fun m!1089009 () Bool)

(assert (=> b!1181510 m!1089009))

(declare-fun m!1089011 () Bool)

(assert (=> b!1181520 m!1089011))

(declare-fun m!1089013 () Bool)

(assert (=> b!1181520 m!1089013))

(check-sat b_and!41321 (not b!1181520) (not b_lambda!20363) (not b!1181527) (not b!1181518) (not b!1181509) (not b_next!25237) (not b!1181517) tp_is_empty!29767 (not b!1181528) (not b!1181514) (not b!1181525) (not start!99652) (not mapNonEmpty!46478) (not b!1181526) (not b!1181516) (not b!1181510) (not b!1181515))
(check-sat b_and!41321 (not b_next!25237))
