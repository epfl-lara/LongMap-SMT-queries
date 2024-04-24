; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99912 () Bool)

(assert start!99912)

(declare-fun b_free!25255 () Bool)

(declare-fun b_next!25255 () Bool)

(assert (=> start!99912 (= b_free!25255 (not b_next!25255))))

(declare-fun tp!88478 () Bool)

(declare-fun b_and!41379 () Bool)

(assert (=> start!99912 (= tp!88478 b_and!41379)))

(declare-datatypes ((array!76421 0))(
  ( (array!76422 (arr!36854 (Array (_ BitVec 32) (_ BitVec 64))) (size!37391 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76421)

(declare-fun b!1183480 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!672952 () Bool)

(declare-fun arrayContainsKey!0 (array!76421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183480 (= e!672952 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183481 () Bool)

(declare-datatypes ((Unit!39104 0))(
  ( (Unit!39105) )
))
(declare-fun e!672956 () Unit!39104)

(declare-fun Unit!39106 () Unit!39104)

(assert (=> b!1183481 (= e!672956 Unit!39106)))

(declare-fun b!1183482 () Bool)

(declare-fun e!672955 () Bool)

(declare-fun tp_is_empty!29785 () Bool)

(assert (=> b!1183482 (= e!672955 tp_is_empty!29785)))

(declare-fun b!1183483 () Bool)

(declare-fun e!672961 () Bool)

(assert (=> b!1183483 (= e!672961 true)))

(declare-datatypes ((V!44841 0))(
  ( (V!44842 (val!14949 Int)) )
))
(declare-datatypes ((tuple2!19200 0))(
  ( (tuple2!19201 (_1!9611 (_ BitVec 64)) (_2!9611 V!44841)) )
))
(declare-datatypes ((List!25931 0))(
  ( (Nil!25928) (Cons!25927 (h!27145 tuple2!19200) (t!38170 List!25931)) )
))
(declare-datatypes ((ListLongMap!17177 0))(
  ( (ListLongMap!17178 (toList!8604 List!25931)) )
))
(declare-fun lt!535508 () ListLongMap!17177)

(declare-fun lt!535514 () ListLongMap!17177)

(declare-fun -!1626 (ListLongMap!17177 (_ BitVec 64)) ListLongMap!17177)

(assert (=> b!1183483 (= (-!1626 lt!535508 k0!934) lt!535514)))

(declare-fun lt!535516 () Unit!39104)

(declare-fun lt!535512 () V!44841)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535521 () ListLongMap!17177)

(declare-fun addRemoveCommutativeForDiffKeys!141 (ListLongMap!17177 (_ BitVec 64) V!44841 (_ BitVec 64)) Unit!39104)

(assert (=> b!1183483 (= lt!535516 (addRemoveCommutativeForDiffKeys!141 lt!535521 (select (arr!36854 _keys!1208) from!1455) lt!535512 k0!934))))

(declare-fun lt!535515 () ListLongMap!17177)

(declare-fun lt!535520 () ListLongMap!17177)

(declare-fun lt!535513 () ListLongMap!17177)

(assert (=> b!1183483 (and (= lt!535513 lt!535508) (= lt!535520 lt!535515))))

(declare-fun lt!535511 () tuple2!19200)

(declare-fun +!3925 (ListLongMap!17177 tuple2!19200) ListLongMap!17177)

(assert (=> b!1183483 (= lt!535508 (+!3925 lt!535521 lt!535511))))

(assert (=> b!1183483 (not (= (select (arr!36854 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535506 () Unit!39104)

(assert (=> b!1183483 (= lt!535506 e!672956)))

(declare-fun c!117404 () Bool)

(assert (=> b!1183483 (= c!117404 (= (select (arr!36854 _keys!1208) from!1455) k0!934))))

(declare-fun e!672962 () Bool)

(assert (=> b!1183483 e!672962))

(declare-fun res!786161 () Bool)

(assert (=> b!1183483 (=> (not res!786161) (not e!672962))))

(declare-fun lt!535518 () ListLongMap!17177)

(assert (=> b!1183483 (= res!786161 (= lt!535518 lt!535514))))

(assert (=> b!1183483 (= lt!535514 (+!3925 lt!535520 lt!535511))))

(assert (=> b!1183483 (= lt!535511 (tuple2!19201 (select (arr!36854 _keys!1208) from!1455) lt!535512))))

(declare-datatypes ((ValueCell!14183 0))(
  ( (ValueCellFull!14183 (v!17583 V!44841)) (EmptyCell!14183) )
))
(declare-datatypes ((array!76423 0))(
  ( (array!76424 (arr!36855 (Array (_ BitVec 32) ValueCell!14183)) (size!37392 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76423)

(declare-fun lt!535519 () V!44841)

(declare-fun get!18888 (ValueCell!14183 V!44841) V!44841)

(assert (=> b!1183483 (= lt!535512 (get!18888 (select (arr!36855 _values!996) from!1455) lt!535519))))

(declare-fun b!1183484 () Bool)

(declare-fun res!786153 () Bool)

(declare-fun e!672957 () Bool)

(assert (=> b!1183484 (=> (not res!786153) (not e!672957))))

(assert (=> b!1183484 (= res!786153 (= (select (arr!36854 _keys!1208) i!673) k0!934))))

(declare-fun b!1183485 () Bool)

(declare-fun res!786151 () Bool)

(assert (=> b!1183485 (=> (not res!786151) (not e!672957))))

(declare-datatypes ((List!25932 0))(
  ( (Nil!25929) (Cons!25928 (h!27146 (_ BitVec 64)) (t!38171 List!25932)) )
))
(declare-fun arrayNoDuplicates!0 (array!76421 (_ BitVec 32) List!25932) Bool)

(assert (=> b!1183485 (= res!786151 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25929))))

(declare-fun b!1183486 () Bool)

(declare-fun res!786158 () Bool)

(assert (=> b!1183486 (=> (not res!786158) (not e!672957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183486 (= res!786158 (validKeyInArray!0 k0!934))))

(declare-fun b!1183487 () Bool)

(declare-fun res!786149 () Bool)

(assert (=> b!1183487 (=> (not res!786149) (not e!672957))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183487 (= res!786149 (validMask!0 mask!1564))))

(declare-fun b!1183488 () Bool)

(declare-fun res!786159 () Bool)

(declare-fun e!672951 () Bool)

(assert (=> b!1183488 (=> (not res!786159) (not e!672951))))

(declare-fun lt!535507 () array!76421)

(assert (=> b!1183488 (= res!786159 (arrayNoDuplicates!0 lt!535507 #b00000000000000000000000000000000 Nil!25929))))

(declare-fun b!1183489 () Bool)

(declare-fun Unit!39107 () Unit!39104)

(assert (=> b!1183489 (= e!672956 Unit!39107)))

(declare-fun lt!535517 () Unit!39104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39104)

(assert (=> b!1183489 (= lt!535517 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183489 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535505 () Unit!39104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76421 (_ BitVec 32) (_ BitVec 32)) Unit!39104)

(assert (=> b!1183489 (= lt!535505 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183489 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25929)))

(declare-fun lt!535509 () Unit!39104)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76421 (_ BitVec 64) (_ BitVec 32) List!25932) Unit!39104)

(assert (=> b!1183489 (= lt!535509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25929))))

(assert (=> b!1183489 false))

(declare-fun b!1183490 () Bool)

(declare-fun e!672958 () Bool)

(declare-fun mapRes!46505 () Bool)

(assert (=> b!1183490 (= e!672958 (and e!672955 mapRes!46505))))

(declare-fun condMapEmpty!46505 () Bool)

(declare-fun mapDefault!46505 () ValueCell!14183)

(assert (=> b!1183490 (= condMapEmpty!46505 (= (arr!36855 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14183)) mapDefault!46505)))))

(declare-fun mapNonEmpty!46505 () Bool)

(declare-fun tp!88479 () Bool)

(declare-fun e!672959 () Bool)

(assert (=> mapNonEmpty!46505 (= mapRes!46505 (and tp!88479 e!672959))))

(declare-fun mapKey!46505 () (_ BitVec 32))

(declare-fun mapValue!46505 () ValueCell!14183)

(declare-fun mapRest!46505 () (Array (_ BitVec 32) ValueCell!14183))

(assert (=> mapNonEmpty!46505 (= (arr!36855 _values!996) (store mapRest!46505 mapKey!46505 mapValue!46505))))

(declare-fun b!1183491 () Bool)

(assert (=> b!1183491 (= e!672957 e!672951)))

(declare-fun res!786154 () Bool)

(assert (=> b!1183491 (=> (not res!786154) (not e!672951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76421 (_ BitVec 32)) Bool)

(assert (=> b!1183491 (= res!786154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535507 mask!1564))))

(assert (=> b!1183491 (= lt!535507 (array!76422 (store (arr!36854 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37391 _keys!1208)))))

(declare-fun b!1183492 () Bool)

(declare-fun res!786160 () Bool)

(assert (=> b!1183492 (=> (not res!786160) (not e!672957))))

(assert (=> b!1183492 (= res!786160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183493 () Bool)

(declare-fun res!786152 () Bool)

(assert (=> b!1183493 (=> (not res!786152) (not e!672957))))

(assert (=> b!1183493 (= res!786152 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37391 _keys!1208))))))

(declare-fun b!1183495 () Bool)

(declare-fun e!672953 () Bool)

(declare-fun e!672954 () Bool)

(assert (=> b!1183495 (= e!672953 e!672954)))

(declare-fun res!786148 () Bool)

(assert (=> b!1183495 (=> res!786148 e!672954)))

(assert (=> b!1183495 (= res!786148 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44841)

(declare-fun lt!535510 () array!76423)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44841)

(declare-fun getCurrentListMapNoExtraKeys!5077 (array!76421 array!76423 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) Int) ListLongMap!17177)

(assert (=> b!1183495 (= lt!535518 (getCurrentListMapNoExtraKeys!5077 lt!535507 lt!535510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183495 (= lt!535510 (array!76424 (store (arr!36855 _values!996) i!673 (ValueCellFull!14183 lt!535519)) (size!37392 _values!996)))))

(declare-fun dynLambda!3043 (Int (_ BitVec 64)) V!44841)

(assert (=> b!1183495 (= lt!535519 (dynLambda!3043 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183495 (= lt!535513 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183496 () Bool)

(assert (=> b!1183496 (= e!672962 e!672952)))

(declare-fun res!786156 () Bool)

(assert (=> b!1183496 (=> res!786156 e!672952)))

(assert (=> b!1183496 (= res!786156 (not (= (select (arr!36854 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183497 () Bool)

(assert (=> b!1183497 (= e!672959 tp_is_empty!29785)))

(declare-fun mapIsEmpty!46505 () Bool)

(assert (=> mapIsEmpty!46505 mapRes!46505))

(declare-fun b!1183498 () Bool)

(declare-fun res!786150 () Bool)

(assert (=> b!1183498 (=> (not res!786150) (not e!672957))))

(assert (=> b!1183498 (= res!786150 (and (= (size!37392 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37391 _keys!1208) (size!37392 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183499 () Bool)

(assert (=> b!1183499 (= e!672954 e!672961)))

(declare-fun res!786147 () Bool)

(assert (=> b!1183499 (=> res!786147 e!672961)))

(assert (=> b!1183499 (= res!786147 (not (validKeyInArray!0 (select (arr!36854 _keys!1208) from!1455))))))

(assert (=> b!1183499 (= lt!535515 lt!535520)))

(assert (=> b!1183499 (= lt!535520 (-!1626 lt!535521 k0!934))))

(assert (=> b!1183499 (= lt!535515 (getCurrentListMapNoExtraKeys!5077 lt!535507 lt!535510 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183499 (= lt!535521 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535522 () Unit!39104)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 (array!76421 array!76423 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39104)

(assert (=> b!1183499 (= lt!535522 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183494 () Bool)

(assert (=> b!1183494 (= e!672951 (not e!672953))))

(declare-fun res!786155 () Bool)

(assert (=> b!1183494 (=> res!786155 e!672953)))

(assert (=> b!1183494 (= res!786155 (bvsgt from!1455 i!673))))

(assert (=> b!1183494 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535504 () Unit!39104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76421 (_ BitVec 64) (_ BitVec 32)) Unit!39104)

(assert (=> b!1183494 (= lt!535504 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!786157 () Bool)

(assert (=> start!99912 (=> (not res!786157) (not e!672957))))

(assert (=> start!99912 (= res!786157 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37391 _keys!1208))))))

(assert (=> start!99912 e!672957))

(assert (=> start!99912 tp_is_empty!29785))

(declare-fun array_inv!28206 (array!76421) Bool)

(assert (=> start!99912 (array_inv!28206 _keys!1208)))

(assert (=> start!99912 true))

(assert (=> start!99912 tp!88478))

(declare-fun array_inv!28207 (array!76423) Bool)

(assert (=> start!99912 (and (array_inv!28207 _values!996) e!672958)))

(assert (= (and start!99912 res!786157) b!1183487))

(assert (= (and b!1183487 res!786149) b!1183498))

(assert (= (and b!1183498 res!786150) b!1183492))

(assert (= (and b!1183492 res!786160) b!1183485))

(assert (= (and b!1183485 res!786151) b!1183493))

(assert (= (and b!1183493 res!786152) b!1183486))

(assert (= (and b!1183486 res!786158) b!1183484))

(assert (= (and b!1183484 res!786153) b!1183491))

(assert (= (and b!1183491 res!786154) b!1183488))

(assert (= (and b!1183488 res!786159) b!1183494))

(assert (= (and b!1183494 (not res!786155)) b!1183495))

(assert (= (and b!1183495 (not res!786148)) b!1183499))

(assert (= (and b!1183499 (not res!786147)) b!1183483))

(assert (= (and b!1183483 res!786161) b!1183496))

(assert (= (and b!1183496 (not res!786156)) b!1183480))

(assert (= (and b!1183483 c!117404) b!1183489))

(assert (= (and b!1183483 (not c!117404)) b!1183481))

(assert (= (and b!1183490 condMapEmpty!46505) mapIsEmpty!46505))

(assert (= (and b!1183490 (not condMapEmpty!46505)) mapNonEmpty!46505))

(get-info :version)

(assert (= (and mapNonEmpty!46505 ((_ is ValueCellFull!14183) mapValue!46505)) b!1183497))

(assert (= (and b!1183490 ((_ is ValueCellFull!14183) mapDefault!46505)) b!1183482))

(assert (= start!99912 b!1183490))

(declare-fun b_lambda!20393 () Bool)

(assert (=> (not b_lambda!20393) (not b!1183495)))

(declare-fun t!38169 () Bool)

(declare-fun tb!10059 () Bool)

(assert (=> (and start!99912 (= defaultEntry!1004 defaultEntry!1004) t!38169) tb!10059))

(declare-fun result!20693 () Bool)

(assert (=> tb!10059 (= result!20693 tp_is_empty!29785)))

(assert (=> b!1183495 t!38169))

(declare-fun b_and!41381 () Bool)

(assert (= b_and!41379 (and (=> t!38169 result!20693) b_and!41381)))

(declare-fun m!1091757 () Bool)

(assert (=> b!1183495 m!1091757))

(declare-fun m!1091759 () Bool)

(assert (=> b!1183495 m!1091759))

(declare-fun m!1091761 () Bool)

(assert (=> b!1183495 m!1091761))

(declare-fun m!1091763 () Bool)

(assert (=> b!1183495 m!1091763))

(declare-fun m!1091765 () Bool)

(assert (=> start!99912 m!1091765))

(declare-fun m!1091767 () Bool)

(assert (=> start!99912 m!1091767))

(declare-fun m!1091769 () Bool)

(assert (=> b!1183487 m!1091769))

(declare-fun m!1091771 () Bool)

(assert (=> b!1183480 m!1091771))

(declare-fun m!1091773 () Bool)

(assert (=> b!1183484 m!1091773))

(declare-fun m!1091775 () Bool)

(assert (=> b!1183488 m!1091775))

(declare-fun m!1091777 () Bool)

(assert (=> b!1183485 m!1091777))

(declare-fun m!1091779 () Bool)

(assert (=> b!1183483 m!1091779))

(declare-fun m!1091781 () Bool)

(assert (=> b!1183483 m!1091781))

(declare-fun m!1091783 () Bool)

(assert (=> b!1183483 m!1091783))

(declare-fun m!1091785 () Bool)

(assert (=> b!1183483 m!1091785))

(declare-fun m!1091787 () Bool)

(assert (=> b!1183483 m!1091787))

(declare-fun m!1091789 () Bool)

(assert (=> b!1183483 m!1091789))

(assert (=> b!1183483 m!1091779))

(assert (=> b!1183483 m!1091789))

(declare-fun m!1091791 () Bool)

(assert (=> b!1183483 m!1091791))

(declare-fun m!1091793 () Bool)

(assert (=> b!1183489 m!1091793))

(declare-fun m!1091795 () Bool)

(assert (=> b!1183489 m!1091795))

(declare-fun m!1091797 () Bool)

(assert (=> b!1183489 m!1091797))

(declare-fun m!1091799 () Bool)

(assert (=> b!1183489 m!1091799))

(declare-fun m!1091801 () Bool)

(assert (=> b!1183489 m!1091801))

(declare-fun m!1091803 () Bool)

(assert (=> mapNonEmpty!46505 m!1091803))

(declare-fun m!1091805 () Bool)

(assert (=> b!1183486 m!1091805))

(declare-fun m!1091807 () Bool)

(assert (=> b!1183499 m!1091807))

(declare-fun m!1091809 () Bool)

(assert (=> b!1183499 m!1091809))

(declare-fun m!1091811 () Bool)

(assert (=> b!1183499 m!1091811))

(declare-fun m!1091813 () Bool)

(assert (=> b!1183499 m!1091813))

(assert (=> b!1183499 m!1091789))

(declare-fun m!1091815 () Bool)

(assert (=> b!1183499 m!1091815))

(assert (=> b!1183499 m!1091789))

(declare-fun m!1091817 () Bool)

(assert (=> b!1183491 m!1091817))

(declare-fun m!1091819 () Bool)

(assert (=> b!1183491 m!1091819))

(declare-fun m!1091821 () Bool)

(assert (=> b!1183492 m!1091821))

(assert (=> b!1183496 m!1091789))

(declare-fun m!1091823 () Bool)

(assert (=> b!1183494 m!1091823))

(declare-fun m!1091825 () Bool)

(assert (=> b!1183494 m!1091825))

(check-sat (not b_next!25255) (not b!1183486) (not b!1183489) (not b!1183483) (not start!99912) (not b!1183480) (not b!1183488) (not mapNonEmpty!46505) (not b!1183495) (not b!1183491) (not b!1183499) tp_is_empty!29785 b_and!41381 (not b!1183487) (not b_lambda!20393) (not b!1183492) (not b!1183494) (not b!1183485))
(check-sat b_and!41381 (not b_next!25255))
