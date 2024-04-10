; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99816 () Bool)

(assert start!99816)

(declare-fun b_free!25395 () Bool)

(declare-fun b_next!25395 () Bool)

(assert (=> start!99816 (= b_free!25395 (not b_next!25395))))

(declare-fun tp!88899 () Bool)

(declare-fun b_and!41657 () Bool)

(assert (=> start!99816 (= tp!88899 b_and!41657)))

(declare-fun b!1186531 () Bool)

(declare-fun res!788789 () Bool)

(declare-fun e!674646 () Bool)

(assert (=> b!1186531 (=> (not res!788789) (not e!674646))))

(declare-datatypes ((array!76645 0))(
  ( (array!76646 (arr!36972 (Array (_ BitVec 32) (_ BitVec 64))) (size!37508 (_ BitVec 32))) )
))
(declare-fun lt!539012 () array!76645)

(declare-datatypes ((List!26014 0))(
  ( (Nil!26011) (Cons!26010 (h!27219 (_ BitVec 64)) (t!38401 List!26014)) )
))
(declare-fun arrayNoDuplicates!0 (array!76645 (_ BitVec 32) List!26014) Bool)

(assert (=> b!1186531 (= res!788789 (arrayNoDuplicates!0 lt!539012 #b00000000000000000000000000000000 Nil!26011))))

(declare-fun b!1186532 () Bool)

(declare-fun e!674650 () Bool)

(assert (=> b!1186532 (= e!674646 (not e!674650))))

(declare-fun res!788803 () Bool)

(assert (=> b!1186532 (=> res!788803 e!674650)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186532 (= res!788803 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!76645)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186532 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39331 0))(
  ( (Unit!39332) )
))
(declare-fun lt!539028 () Unit!39331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76645 (_ BitVec 64) (_ BitVec 32)) Unit!39331)

(assert (=> b!1186532 (= lt!539028 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186533 () Bool)

(declare-fun e!674648 () Bool)

(assert (=> b!1186533 (= e!674648 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186534 () Bool)

(declare-fun res!788793 () Bool)

(declare-fun e!674640 () Bool)

(assert (=> b!1186534 (=> (not res!788793) (not e!674640))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45027 0))(
  ( (V!45028 (val!15019 Int)) )
))
(declare-datatypes ((ValueCell!14253 0))(
  ( (ValueCellFull!14253 (v!17657 V!45027)) (EmptyCell!14253) )
))
(declare-datatypes ((array!76647 0))(
  ( (array!76648 (arr!36973 (Array (_ BitVec 32) ValueCell!14253)) (size!37509 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76647)

(assert (=> b!1186534 (= res!788793 (and (= (size!37509 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37508 _keys!1208) (size!37509 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186535 () Bool)

(declare-fun res!788792 () Bool)

(assert (=> b!1186535 (=> (not res!788792) (not e!674640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186535 (= res!788792 (validKeyInArray!0 k0!934))))

(declare-fun b!1186536 () Bool)

(declare-fun e!674645 () Bool)

(assert (=> b!1186536 (= e!674645 true)))

(declare-datatypes ((tuple2!19274 0))(
  ( (tuple2!19275 (_1!9648 (_ BitVec 64)) (_2!9648 V!45027)) )
))
(declare-datatypes ((List!26015 0))(
  ( (Nil!26012) (Cons!26011 (h!27220 tuple2!19274) (t!38402 List!26015)) )
))
(declare-datatypes ((ListLongMap!17243 0))(
  ( (ListLongMap!17244 (toList!8637 List!26015)) )
))
(declare-fun lt!539010 () ListLongMap!17243)

(declare-fun lt!539027 () ListLongMap!17243)

(declare-fun -!1669 (ListLongMap!17243 (_ BitVec 64)) ListLongMap!17243)

(assert (=> b!1186536 (= (-!1669 lt!539010 k0!934) lt!539027)))

(declare-fun lt!539019 () ListLongMap!17243)

(declare-fun lt!539013 () V!45027)

(declare-fun lt!539026 () Unit!39331)

(declare-fun addRemoveCommutativeForDiffKeys!193 (ListLongMap!17243 (_ BitVec 64) V!45027 (_ BitVec 64)) Unit!39331)

(assert (=> b!1186536 (= lt!539026 (addRemoveCommutativeForDiffKeys!193 lt!539019 (select (arr!36972 _keys!1208) from!1455) lt!539013 k0!934))))

(declare-fun lt!539016 () ListLongMap!17243)

(declare-fun lt!539025 () ListLongMap!17243)

(declare-fun lt!539022 () ListLongMap!17243)

(assert (=> b!1186536 (and (= lt!539025 lt!539010) (= lt!539022 lt!539016))))

(declare-fun lt!539015 () tuple2!19274)

(declare-fun +!3930 (ListLongMap!17243 tuple2!19274) ListLongMap!17243)

(assert (=> b!1186536 (= lt!539010 (+!3930 lt!539019 lt!539015))))

(assert (=> b!1186536 (not (= (select (arr!36972 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539017 () Unit!39331)

(declare-fun e!674639 () Unit!39331)

(assert (=> b!1186536 (= lt!539017 e!674639)))

(declare-fun c!117216 () Bool)

(assert (=> b!1186536 (= c!117216 (= (select (arr!36972 _keys!1208) from!1455) k0!934))))

(declare-fun e!674643 () Bool)

(assert (=> b!1186536 e!674643))

(declare-fun res!788802 () Bool)

(assert (=> b!1186536 (=> (not res!788802) (not e!674643))))

(declare-fun lt!539014 () ListLongMap!17243)

(assert (=> b!1186536 (= res!788802 (= lt!539014 lt!539027))))

(assert (=> b!1186536 (= lt!539027 (+!3930 lt!539022 lt!539015))))

(assert (=> b!1186536 (= lt!539015 (tuple2!19275 (select (arr!36972 _keys!1208) from!1455) lt!539013))))

(declare-fun lt!539020 () V!45027)

(declare-fun get!18935 (ValueCell!14253 V!45027) V!45027)

(assert (=> b!1186536 (= lt!539013 (get!18935 (select (arr!36973 _values!996) from!1455) lt!539020))))

(declare-fun b!1186537 () Bool)

(assert (=> b!1186537 (= e!674640 e!674646)))

(declare-fun res!788796 () Bool)

(assert (=> b!1186537 (=> (not res!788796) (not e!674646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76645 (_ BitVec 32)) Bool)

(assert (=> b!1186537 (= res!788796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539012 mask!1564))))

(assert (=> b!1186537 (= lt!539012 (array!76646 (store (arr!36972 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37508 _keys!1208)))))

(declare-fun b!1186538 () Bool)

(declare-fun e!674642 () Bool)

(assert (=> b!1186538 (= e!674650 e!674642)))

(declare-fun res!788800 () Bool)

(assert (=> b!1186538 (=> res!788800 e!674642)))

(assert (=> b!1186538 (= res!788800 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45027)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45027)

(declare-fun lt!539024 () array!76647)

(declare-fun getCurrentListMapNoExtraKeys!5080 (array!76645 array!76647 (_ BitVec 32) (_ BitVec 32) V!45027 V!45027 (_ BitVec 32) Int) ListLongMap!17243)

(assert (=> b!1186538 (= lt!539014 (getCurrentListMapNoExtraKeys!5080 lt!539012 lt!539024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186538 (= lt!539024 (array!76648 (store (arr!36973 _values!996) i!673 (ValueCellFull!14253 lt!539020)) (size!37509 _values!996)))))

(declare-fun dynLambda!3029 (Int (_ BitVec 64)) V!45027)

(assert (=> b!1186538 (= lt!539020 (dynLambda!3029 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186538 (= lt!539025 (getCurrentListMapNoExtraKeys!5080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186539 () Bool)

(declare-fun e!674644 () Bool)

(declare-fun e!674641 () Bool)

(declare-fun mapRes!46715 () Bool)

(assert (=> b!1186539 (= e!674644 (and e!674641 mapRes!46715))))

(declare-fun condMapEmpty!46715 () Bool)

(declare-fun mapDefault!46715 () ValueCell!14253)

(assert (=> b!1186539 (= condMapEmpty!46715 (= (arr!36973 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14253)) mapDefault!46715)))))

(declare-fun b!1186540 () Bool)

(declare-fun res!788795 () Bool)

(assert (=> b!1186540 (=> (not res!788795) (not e!674640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186540 (= res!788795 (validMask!0 mask!1564))))

(declare-fun b!1186541 () Bool)

(declare-fun e!674647 () Bool)

(declare-fun tp_is_empty!29925 () Bool)

(assert (=> b!1186541 (= e!674647 tp_is_empty!29925)))

(declare-fun mapNonEmpty!46715 () Bool)

(declare-fun tp!88898 () Bool)

(assert (=> mapNonEmpty!46715 (= mapRes!46715 (and tp!88898 e!674647))))

(declare-fun mapValue!46715 () ValueCell!14253)

(declare-fun mapKey!46715 () (_ BitVec 32))

(declare-fun mapRest!46715 () (Array (_ BitVec 32) ValueCell!14253))

(assert (=> mapNonEmpty!46715 (= (arr!36973 _values!996) (store mapRest!46715 mapKey!46715 mapValue!46715))))

(declare-fun res!788801 () Bool)

(assert (=> start!99816 (=> (not res!788801) (not e!674640))))

(assert (=> start!99816 (= res!788801 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37508 _keys!1208))))))

(assert (=> start!99816 e!674640))

(assert (=> start!99816 tp_is_empty!29925))

(declare-fun array_inv!28214 (array!76645) Bool)

(assert (=> start!99816 (array_inv!28214 _keys!1208)))

(assert (=> start!99816 true))

(assert (=> start!99816 tp!88899))

(declare-fun array_inv!28215 (array!76647) Bool)

(assert (=> start!99816 (and (array_inv!28215 _values!996) e!674644)))

(declare-fun mapIsEmpty!46715 () Bool)

(assert (=> mapIsEmpty!46715 mapRes!46715))

(declare-fun b!1186542 () Bool)

(declare-fun res!788790 () Bool)

(assert (=> b!1186542 (=> (not res!788790) (not e!674640))))

(assert (=> b!1186542 (= res!788790 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37508 _keys!1208))))))

(declare-fun b!1186543 () Bool)

(declare-fun res!788794 () Bool)

(assert (=> b!1186543 (=> (not res!788794) (not e!674640))))

(assert (=> b!1186543 (= res!788794 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26011))))

(declare-fun b!1186544 () Bool)

(assert (=> b!1186544 (= e!674642 e!674645)))

(declare-fun res!788799 () Bool)

(assert (=> b!1186544 (=> res!788799 e!674645)))

(assert (=> b!1186544 (= res!788799 (not (validKeyInArray!0 (select (arr!36972 _keys!1208) from!1455))))))

(assert (=> b!1186544 (= lt!539016 lt!539022)))

(assert (=> b!1186544 (= lt!539022 (-!1669 lt!539019 k0!934))))

(assert (=> b!1186544 (= lt!539016 (getCurrentListMapNoExtraKeys!5080 lt!539012 lt!539024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186544 (= lt!539019 (getCurrentListMapNoExtraKeys!5080 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539018 () Unit!39331)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 (array!76645 array!76647 (_ BitVec 32) (_ BitVec 32) V!45027 V!45027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39331)

(assert (=> b!1186544 (= lt!539018 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186545 () Bool)

(declare-fun Unit!39333 () Unit!39331)

(assert (=> b!1186545 (= e!674639 Unit!39333)))

(declare-fun b!1186546 () Bool)

(declare-fun res!788791 () Bool)

(assert (=> b!1186546 (=> (not res!788791) (not e!674640))))

(assert (=> b!1186546 (= res!788791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186547 () Bool)

(declare-fun Unit!39334 () Unit!39331)

(assert (=> b!1186547 (= e!674639 Unit!39334)))

(declare-fun lt!539011 () Unit!39331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76645 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39331)

(assert (=> b!1186547 (= lt!539011 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186547 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539023 () Unit!39331)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76645 (_ BitVec 32) (_ BitVec 32)) Unit!39331)

(assert (=> b!1186547 (= lt!539023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186547 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26011)))

(declare-fun lt!539021 () Unit!39331)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76645 (_ BitVec 64) (_ BitVec 32) List!26014) Unit!39331)

(assert (=> b!1186547 (= lt!539021 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26011))))

(assert (=> b!1186547 false))

(declare-fun b!1186548 () Bool)

(declare-fun res!788798 () Bool)

(assert (=> b!1186548 (=> (not res!788798) (not e!674640))))

(assert (=> b!1186548 (= res!788798 (= (select (arr!36972 _keys!1208) i!673) k0!934))))

(declare-fun b!1186549 () Bool)

(assert (=> b!1186549 (= e!674643 e!674648)))

(declare-fun res!788797 () Bool)

(assert (=> b!1186549 (=> res!788797 e!674648)))

(assert (=> b!1186549 (= res!788797 (not (= (select (arr!36972 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186550 () Bool)

(assert (=> b!1186550 (= e!674641 tp_is_empty!29925)))

(assert (= (and start!99816 res!788801) b!1186540))

(assert (= (and b!1186540 res!788795) b!1186534))

(assert (= (and b!1186534 res!788793) b!1186546))

(assert (= (and b!1186546 res!788791) b!1186543))

(assert (= (and b!1186543 res!788794) b!1186542))

(assert (= (and b!1186542 res!788790) b!1186535))

(assert (= (and b!1186535 res!788792) b!1186548))

(assert (= (and b!1186548 res!788798) b!1186537))

(assert (= (and b!1186537 res!788796) b!1186531))

(assert (= (and b!1186531 res!788789) b!1186532))

(assert (= (and b!1186532 (not res!788803)) b!1186538))

(assert (= (and b!1186538 (not res!788800)) b!1186544))

(assert (= (and b!1186544 (not res!788799)) b!1186536))

(assert (= (and b!1186536 res!788802) b!1186549))

(assert (= (and b!1186549 (not res!788797)) b!1186533))

(assert (= (and b!1186536 c!117216) b!1186547))

(assert (= (and b!1186536 (not c!117216)) b!1186545))

(assert (= (and b!1186539 condMapEmpty!46715) mapIsEmpty!46715))

(assert (= (and b!1186539 (not condMapEmpty!46715)) mapNonEmpty!46715))

(get-info :version)

(assert (= (and mapNonEmpty!46715 ((_ is ValueCellFull!14253) mapValue!46715)) b!1186541))

(assert (= (and b!1186539 ((_ is ValueCellFull!14253) mapDefault!46715)) b!1186550))

(assert (= start!99816 b!1186539))

(declare-fun b_lambda!20539 () Bool)

(assert (=> (not b_lambda!20539) (not b!1186538)))

(declare-fun t!38400 () Bool)

(declare-fun tb!10207 () Bool)

(assert (=> (and start!99816 (= defaultEntry!1004 defaultEntry!1004) t!38400) tb!10207))

(declare-fun result!20981 () Bool)

(assert (=> tb!10207 (= result!20981 tp_is_empty!29925)))

(assert (=> b!1186538 t!38400))

(declare-fun b_and!41659 () Bool)

(assert (= b_and!41657 (and (=> t!38400 result!20981) b_and!41659)))

(declare-fun m!1095085 () Bool)

(assert (=> b!1186533 m!1095085))

(declare-fun m!1095087 () Bool)

(assert (=> b!1186538 m!1095087))

(declare-fun m!1095089 () Bool)

(assert (=> b!1186538 m!1095089))

(declare-fun m!1095091 () Bool)

(assert (=> b!1186538 m!1095091))

(declare-fun m!1095093 () Bool)

(assert (=> b!1186538 m!1095093))

(declare-fun m!1095095 () Bool)

(assert (=> b!1186546 m!1095095))

(declare-fun m!1095097 () Bool)

(assert (=> b!1186549 m!1095097))

(declare-fun m!1095099 () Bool)

(assert (=> b!1186531 m!1095099))

(declare-fun m!1095101 () Bool)

(assert (=> b!1186537 m!1095101))

(declare-fun m!1095103 () Bool)

(assert (=> b!1186537 m!1095103))

(declare-fun m!1095105 () Bool)

(assert (=> b!1186544 m!1095105))

(declare-fun m!1095107 () Bool)

(assert (=> b!1186544 m!1095107))

(assert (=> b!1186544 m!1095097))

(declare-fun m!1095109 () Bool)

(assert (=> b!1186544 m!1095109))

(assert (=> b!1186544 m!1095097))

(declare-fun m!1095111 () Bool)

(assert (=> b!1186544 m!1095111))

(declare-fun m!1095113 () Bool)

(assert (=> b!1186544 m!1095113))

(declare-fun m!1095115 () Bool)

(assert (=> b!1186540 m!1095115))

(declare-fun m!1095117 () Bool)

(assert (=> start!99816 m!1095117))

(declare-fun m!1095119 () Bool)

(assert (=> start!99816 m!1095119))

(declare-fun m!1095121 () Bool)

(assert (=> b!1186548 m!1095121))

(declare-fun m!1095123 () Bool)

(assert (=> b!1186532 m!1095123))

(declare-fun m!1095125 () Bool)

(assert (=> b!1186532 m!1095125))

(declare-fun m!1095127 () Bool)

(assert (=> b!1186535 m!1095127))

(declare-fun m!1095129 () Bool)

(assert (=> b!1186543 m!1095129))

(declare-fun m!1095131 () Bool)

(assert (=> b!1186536 m!1095131))

(declare-fun m!1095133 () Bool)

(assert (=> b!1186536 m!1095133))

(declare-fun m!1095135 () Bool)

(assert (=> b!1186536 m!1095135))

(assert (=> b!1186536 m!1095097))

(declare-fun m!1095137 () Bool)

(assert (=> b!1186536 m!1095137))

(declare-fun m!1095139 () Bool)

(assert (=> b!1186536 m!1095139))

(assert (=> b!1186536 m!1095133))

(declare-fun m!1095141 () Bool)

(assert (=> b!1186536 m!1095141))

(assert (=> b!1186536 m!1095097))

(declare-fun m!1095143 () Bool)

(assert (=> mapNonEmpty!46715 m!1095143))

(declare-fun m!1095145 () Bool)

(assert (=> b!1186547 m!1095145))

(declare-fun m!1095147 () Bool)

(assert (=> b!1186547 m!1095147))

(declare-fun m!1095149 () Bool)

(assert (=> b!1186547 m!1095149))

(declare-fun m!1095151 () Bool)

(assert (=> b!1186547 m!1095151))

(declare-fun m!1095153 () Bool)

(assert (=> b!1186547 m!1095153))

(check-sat (not b!1186536) (not b!1186546) tp_is_empty!29925 (not b!1186537) (not b!1186547) (not b!1186538) (not b!1186533) (not b!1186531) b_and!41659 (not b!1186535) (not mapNonEmpty!46715) (not b!1186532) (not b!1186540) (not b_lambda!20539) (not b_next!25395) (not b!1186543) (not b!1186544) (not start!99816))
(check-sat b_and!41659 (not b_next!25395))
