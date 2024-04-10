; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99846 () Bool)

(assert start!99846)

(declare-fun b_free!25425 () Bool)

(declare-fun b_next!25425 () Bool)

(assert (=> start!99846 (= b_free!25425 (not b_next!25425))))

(declare-fun tp!88988 () Bool)

(declare-fun b_and!41717 () Bool)

(assert (=> start!99846 (= tp!88988 b_and!41717)))

(declare-fun b!1187461 () Bool)

(declare-fun e!675190 () Bool)

(declare-fun e!675186 () Bool)

(assert (=> b!1187461 (= e!675190 e!675186)))

(declare-fun res!789472 () Bool)

(assert (=> b!1187461 (=> res!789472 e!675186)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187461 (= res!789472 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45067 0))(
  ( (V!45068 (val!15034 Int)) )
))
(declare-fun zeroValue!944 () V!45067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19300 0))(
  ( (tuple2!19301 (_1!9661 (_ BitVec 64)) (_2!9661 V!45067)) )
))
(declare-datatypes ((List!26039 0))(
  ( (Nil!26036) (Cons!26035 (h!27244 tuple2!19300) (t!38456 List!26039)) )
))
(declare-datatypes ((ListLongMap!17269 0))(
  ( (ListLongMap!17270 (toList!8650 List!26039)) )
))
(declare-fun lt!539874 () ListLongMap!17269)

(declare-datatypes ((ValueCell!14268 0))(
  ( (ValueCellFull!14268 (v!17672 V!45067)) (EmptyCell!14268) )
))
(declare-datatypes ((array!76705 0))(
  ( (array!76706 (arr!37002 (Array (_ BitVec 32) ValueCell!14268)) (size!37538 (_ BitVec 32))) )
))
(declare-fun lt!539872 () array!76705)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45067)

(declare-datatypes ((array!76707 0))(
  ( (array!76708 (arr!37003 (Array (_ BitVec 32) (_ BitVec 64))) (size!37539 (_ BitVec 32))) )
))
(declare-fun lt!539880 () array!76707)

(declare-fun getCurrentListMapNoExtraKeys!5092 (array!76707 array!76705 (_ BitVec 32) (_ BitVec 32) V!45067 V!45067 (_ BitVec 32) Int) ListLongMap!17269)

(assert (=> b!1187461 (= lt!539874 (getCurrentListMapNoExtraKeys!5092 lt!539880 lt!539872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539883 () V!45067)

(declare-fun _values!996 () array!76705)

(assert (=> b!1187461 (= lt!539872 (array!76706 (store (arr!37002 _values!996) i!673 (ValueCellFull!14268 lt!539883)) (size!37538 _values!996)))))

(declare-fun dynLambda!3038 (Int (_ BitVec 64)) V!45067)

(assert (=> b!1187461 (= lt!539883 (dynLambda!3038 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76707)

(declare-fun lt!539879 () ListLongMap!17269)

(assert (=> b!1187461 (= lt!539879 (getCurrentListMapNoExtraKeys!5092 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187462 () Bool)

(declare-fun e!675184 () Bool)

(assert (=> b!1187462 (= e!675184 (not e!675190))))

(declare-fun res!789465 () Bool)

(assert (=> b!1187462 (=> res!789465 e!675190)))

(assert (=> b!1187462 (= res!789465 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187462 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39376 0))(
  ( (Unit!39377) )
))
(declare-fun lt!539869 () Unit!39376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76707 (_ BitVec 64) (_ BitVec 32)) Unit!39376)

(assert (=> b!1187462 (= lt!539869 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187463 () Bool)

(declare-fun e!675181 () Bool)

(assert (=> b!1187463 (= e!675181 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187464 () Bool)

(declare-fun e!675183 () Bool)

(assert (=> b!1187464 (= e!675186 e!675183)))

(declare-fun res!789468 () Bool)

(assert (=> b!1187464 (=> res!789468 e!675183)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187464 (= res!789468 (not (validKeyInArray!0 (select (arr!37003 _keys!1208) from!1455))))))

(declare-fun lt!539875 () ListLongMap!17269)

(declare-fun lt!539868 () ListLongMap!17269)

(assert (=> b!1187464 (= lt!539875 lt!539868)))

(declare-fun lt!539882 () ListLongMap!17269)

(declare-fun -!1681 (ListLongMap!17269 (_ BitVec 64)) ListLongMap!17269)

(assert (=> b!1187464 (= lt!539868 (-!1681 lt!539882 k0!934))))

(assert (=> b!1187464 (= lt!539875 (getCurrentListMapNoExtraKeys!5092 lt!539880 lt!539872 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187464 (= lt!539882 (getCurrentListMapNoExtraKeys!5092 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539871 () Unit!39376)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 (array!76707 array!76705 (_ BitVec 32) (_ BitVec 32) V!45067 V!45067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39376)

(assert (=> b!1187464 (= lt!539871 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46760 () Bool)

(declare-fun mapRes!46760 () Bool)

(declare-fun tp!88989 () Bool)

(declare-fun e!675179 () Bool)

(assert (=> mapNonEmpty!46760 (= mapRes!46760 (and tp!88989 e!675179))))

(declare-fun mapKey!46760 () (_ BitVec 32))

(declare-fun mapRest!46760 () (Array (_ BitVec 32) ValueCell!14268))

(declare-fun mapValue!46760 () ValueCell!14268)

(assert (=> mapNonEmpty!46760 (= (arr!37002 _values!996) (store mapRest!46760 mapKey!46760 mapValue!46760))))

(declare-fun b!1187465 () Bool)

(declare-fun e!675185 () Bool)

(assert (=> b!1187465 (= e!675185 e!675181)))

(declare-fun res!789469 () Bool)

(assert (=> b!1187465 (=> res!789469 e!675181)))

(assert (=> b!1187465 (= res!789469 (not (= (select (arr!37003 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187466 () Bool)

(declare-fun e!675187 () Unit!39376)

(declare-fun Unit!39378 () Unit!39376)

(assert (=> b!1187466 (= e!675187 Unit!39378)))

(declare-fun b!1187467 () Bool)

(declare-fun res!789464 () Bool)

(declare-fun e!675180 () Bool)

(assert (=> b!1187467 (=> (not res!789464) (not e!675180))))

(declare-datatypes ((List!26040 0))(
  ( (Nil!26037) (Cons!26036 (h!27245 (_ BitVec 64)) (t!38457 List!26040)) )
))
(declare-fun arrayNoDuplicates!0 (array!76707 (_ BitVec 32) List!26040) Bool)

(assert (=> b!1187467 (= res!789464 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26037))))

(declare-fun b!1187468 () Bool)

(declare-fun res!789475 () Bool)

(assert (=> b!1187468 (=> (not res!789475) (not e!675180))))

(assert (=> b!1187468 (= res!789475 (and (= (size!37538 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37539 _keys!1208) (size!37538 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187469 () Bool)

(declare-fun res!789466 () Bool)

(assert (=> b!1187469 (=> (not res!789466) (not e!675180))))

(assert (=> b!1187469 (= res!789466 (= (select (arr!37003 _keys!1208) i!673) k0!934))))

(declare-fun b!1187470 () Bool)

(declare-fun res!789477 () Bool)

(assert (=> b!1187470 (=> (not res!789477) (not e!675180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187470 (= res!789477 (validMask!0 mask!1564))))

(declare-fun res!789467 () Bool)

(assert (=> start!99846 (=> (not res!789467) (not e!675180))))

(assert (=> start!99846 (= res!789467 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37539 _keys!1208))))))

(assert (=> start!99846 e!675180))

(declare-fun tp_is_empty!29955 () Bool)

(assert (=> start!99846 tp_is_empty!29955))

(declare-fun array_inv!28232 (array!76707) Bool)

(assert (=> start!99846 (array_inv!28232 _keys!1208)))

(assert (=> start!99846 true))

(assert (=> start!99846 tp!88988))

(declare-fun e!675182 () Bool)

(declare-fun array_inv!28233 (array!76705) Bool)

(assert (=> start!99846 (and (array_inv!28233 _values!996) e!675182)))

(declare-fun b!1187471 () Bool)

(declare-fun e!675189 () Bool)

(assert (=> b!1187471 (= e!675182 (and e!675189 mapRes!46760))))

(declare-fun condMapEmpty!46760 () Bool)

(declare-fun mapDefault!46760 () ValueCell!14268)

(assert (=> b!1187471 (= condMapEmpty!46760 (= (arr!37002 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14268)) mapDefault!46760)))))

(declare-fun b!1187472 () Bool)

(declare-fun res!789471 () Bool)

(assert (=> b!1187472 (=> (not res!789471) (not e!675180))))

(assert (=> b!1187472 (= res!789471 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37539 _keys!1208))))))

(declare-fun b!1187473 () Bool)

(assert (=> b!1187473 (= e!675189 tp_is_empty!29955)))

(declare-fun b!1187474 () Bool)

(declare-fun res!789474 () Bool)

(assert (=> b!1187474 (=> (not res!789474) (not e!675184))))

(assert (=> b!1187474 (= res!789474 (arrayNoDuplicates!0 lt!539880 #b00000000000000000000000000000000 Nil!26037))))

(declare-fun b!1187475 () Bool)

(declare-fun Unit!39379 () Unit!39376)

(assert (=> b!1187475 (= e!675187 Unit!39379)))

(declare-fun lt!539866 () Unit!39376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39376)

(assert (=> b!1187475 (= lt!539866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187475 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539881 () Unit!39376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76707 (_ BitVec 32) (_ BitVec 32)) Unit!39376)

(assert (=> b!1187475 (= lt!539881 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187475 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26037)))

(declare-fun lt!539867 () Unit!39376)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76707 (_ BitVec 64) (_ BitVec 32) List!26040) Unit!39376)

(assert (=> b!1187475 (= lt!539867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26037))))

(assert (=> b!1187475 false))

(declare-fun b!1187476 () Bool)

(declare-fun res!789476 () Bool)

(assert (=> b!1187476 (=> (not res!789476) (not e!675180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76707 (_ BitVec 32)) Bool)

(assert (=> b!1187476 (= res!789476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187477 () Bool)

(assert (=> b!1187477 (= e!675179 tp_is_empty!29955)))

(declare-fun mapIsEmpty!46760 () Bool)

(assert (=> mapIsEmpty!46760 mapRes!46760))

(declare-fun b!1187478 () Bool)

(assert (=> b!1187478 (= e!675183 true)))

(declare-fun lt!539876 () ListLongMap!17269)

(declare-fun lt!539865 () ListLongMap!17269)

(assert (=> b!1187478 (= (-!1681 lt!539876 k0!934) lt!539865)))

(declare-fun lt!539878 () Unit!39376)

(declare-fun lt!539873 () V!45067)

(declare-fun addRemoveCommutativeForDiffKeys!200 (ListLongMap!17269 (_ BitVec 64) V!45067 (_ BitVec 64)) Unit!39376)

(assert (=> b!1187478 (= lt!539878 (addRemoveCommutativeForDiffKeys!200 lt!539882 (select (arr!37003 _keys!1208) from!1455) lt!539873 k0!934))))

(assert (=> b!1187478 (and (= lt!539879 lt!539876) (= lt!539868 lt!539875))))

(declare-fun lt!539870 () tuple2!19300)

(declare-fun +!3937 (ListLongMap!17269 tuple2!19300) ListLongMap!17269)

(assert (=> b!1187478 (= lt!539876 (+!3937 lt!539882 lt!539870))))

(assert (=> b!1187478 (not (= (select (arr!37003 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539877 () Unit!39376)

(assert (=> b!1187478 (= lt!539877 e!675187)))

(declare-fun c!117261 () Bool)

(assert (=> b!1187478 (= c!117261 (= (select (arr!37003 _keys!1208) from!1455) k0!934))))

(assert (=> b!1187478 e!675185))

(declare-fun res!789470 () Bool)

(assert (=> b!1187478 (=> (not res!789470) (not e!675185))))

(assert (=> b!1187478 (= res!789470 (= lt!539874 lt!539865))))

(assert (=> b!1187478 (= lt!539865 (+!3937 lt!539868 lt!539870))))

(assert (=> b!1187478 (= lt!539870 (tuple2!19301 (select (arr!37003 _keys!1208) from!1455) lt!539873))))

(declare-fun get!18952 (ValueCell!14268 V!45067) V!45067)

(assert (=> b!1187478 (= lt!539873 (get!18952 (select (arr!37002 _values!996) from!1455) lt!539883))))

(declare-fun b!1187479 () Bool)

(declare-fun res!789478 () Bool)

(assert (=> b!1187479 (=> (not res!789478) (not e!675180))))

(assert (=> b!1187479 (= res!789478 (validKeyInArray!0 k0!934))))

(declare-fun b!1187480 () Bool)

(assert (=> b!1187480 (= e!675180 e!675184)))

(declare-fun res!789473 () Bool)

(assert (=> b!1187480 (=> (not res!789473) (not e!675184))))

(assert (=> b!1187480 (= res!789473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539880 mask!1564))))

(assert (=> b!1187480 (= lt!539880 (array!76708 (store (arr!37003 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37539 _keys!1208)))))

(assert (= (and start!99846 res!789467) b!1187470))

(assert (= (and b!1187470 res!789477) b!1187468))

(assert (= (and b!1187468 res!789475) b!1187476))

(assert (= (and b!1187476 res!789476) b!1187467))

(assert (= (and b!1187467 res!789464) b!1187472))

(assert (= (and b!1187472 res!789471) b!1187479))

(assert (= (and b!1187479 res!789478) b!1187469))

(assert (= (and b!1187469 res!789466) b!1187480))

(assert (= (and b!1187480 res!789473) b!1187474))

(assert (= (and b!1187474 res!789474) b!1187462))

(assert (= (and b!1187462 (not res!789465)) b!1187461))

(assert (= (and b!1187461 (not res!789472)) b!1187464))

(assert (= (and b!1187464 (not res!789468)) b!1187478))

(assert (= (and b!1187478 res!789470) b!1187465))

(assert (= (and b!1187465 (not res!789469)) b!1187463))

(assert (= (and b!1187478 c!117261) b!1187475))

(assert (= (and b!1187478 (not c!117261)) b!1187466))

(assert (= (and b!1187471 condMapEmpty!46760) mapIsEmpty!46760))

(assert (= (and b!1187471 (not condMapEmpty!46760)) mapNonEmpty!46760))

(get-info :version)

(assert (= (and mapNonEmpty!46760 ((_ is ValueCellFull!14268) mapValue!46760)) b!1187477))

(assert (= (and b!1187471 ((_ is ValueCellFull!14268) mapDefault!46760)) b!1187473))

(assert (= start!99846 b!1187471))

(declare-fun b_lambda!20569 () Bool)

(assert (=> (not b_lambda!20569) (not b!1187461)))

(declare-fun t!38455 () Bool)

(declare-fun tb!10237 () Bool)

(assert (=> (and start!99846 (= defaultEntry!1004 defaultEntry!1004) t!38455) tb!10237))

(declare-fun result!21041 () Bool)

(assert (=> tb!10237 (= result!21041 tp_is_empty!29955)))

(assert (=> b!1187461 t!38455))

(declare-fun b_and!41719 () Bool)

(assert (= b_and!41717 (and (=> t!38455 result!21041) b_and!41719)))

(declare-fun m!1096135 () Bool)

(assert (=> b!1187467 m!1096135))

(declare-fun m!1096137 () Bool)

(assert (=> b!1187474 m!1096137))

(declare-fun m!1096139 () Bool)

(assert (=> b!1187479 m!1096139))

(declare-fun m!1096141 () Bool)

(assert (=> b!1187475 m!1096141))

(declare-fun m!1096143 () Bool)

(assert (=> b!1187475 m!1096143))

(declare-fun m!1096145 () Bool)

(assert (=> b!1187475 m!1096145))

(declare-fun m!1096147 () Bool)

(assert (=> b!1187475 m!1096147))

(declare-fun m!1096149 () Bool)

(assert (=> b!1187475 m!1096149))

(declare-fun m!1096151 () Bool)

(assert (=> mapNonEmpty!46760 m!1096151))

(declare-fun m!1096153 () Bool)

(assert (=> b!1187462 m!1096153))

(declare-fun m!1096155 () Bool)

(assert (=> b!1187462 m!1096155))

(declare-fun m!1096157 () Bool)

(assert (=> b!1187464 m!1096157))

(declare-fun m!1096159 () Bool)

(assert (=> b!1187464 m!1096159))

(declare-fun m!1096161 () Bool)

(assert (=> b!1187464 m!1096161))

(declare-fun m!1096163 () Bool)

(assert (=> b!1187464 m!1096163))

(declare-fun m!1096165 () Bool)

(assert (=> b!1187464 m!1096165))

(declare-fun m!1096167 () Bool)

(assert (=> b!1187464 m!1096167))

(assert (=> b!1187464 m!1096163))

(declare-fun m!1096169 () Bool)

(assert (=> b!1187461 m!1096169))

(declare-fun m!1096171 () Bool)

(assert (=> b!1187461 m!1096171))

(declare-fun m!1096173 () Bool)

(assert (=> b!1187461 m!1096173))

(declare-fun m!1096175 () Bool)

(assert (=> b!1187461 m!1096175))

(declare-fun m!1096177 () Bool)

(assert (=> start!99846 m!1096177))

(declare-fun m!1096179 () Bool)

(assert (=> start!99846 m!1096179))

(declare-fun m!1096181 () Bool)

(assert (=> b!1187469 m!1096181))

(declare-fun m!1096183 () Bool)

(assert (=> b!1187476 m!1096183))

(declare-fun m!1096185 () Bool)

(assert (=> b!1187463 m!1096185))

(assert (=> b!1187465 m!1096163))

(declare-fun m!1096187 () Bool)

(assert (=> b!1187470 m!1096187))

(declare-fun m!1096189 () Bool)

(assert (=> b!1187478 m!1096189))

(assert (=> b!1187478 m!1096163))

(declare-fun m!1096191 () Bool)

(assert (=> b!1187478 m!1096191))

(declare-fun m!1096193 () Bool)

(assert (=> b!1187478 m!1096193))

(declare-fun m!1096195 () Bool)

(assert (=> b!1187478 m!1096195))

(assert (=> b!1187478 m!1096163))

(declare-fun m!1096197 () Bool)

(assert (=> b!1187478 m!1096197))

(assert (=> b!1187478 m!1096197))

(declare-fun m!1096199 () Bool)

(assert (=> b!1187478 m!1096199))

(declare-fun m!1096201 () Bool)

(assert (=> b!1187480 m!1096201))

(declare-fun m!1096203 () Bool)

(assert (=> b!1187480 m!1096203))

(check-sat (not b!1187475) (not mapNonEmpty!46760) (not b_next!25425) (not b!1187474) (not b!1187467) (not b!1187464) (not b!1187478) (not start!99846) b_and!41719 (not b_lambda!20569) (not b!1187480) (not b!1187461) tp_is_empty!29955 (not b!1187479) (not b!1187476) (not b!1187463) (not b!1187462) (not b!1187470))
(check-sat b_and!41719 (not b_next!25425))
