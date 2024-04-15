; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99778 () Bool)

(assert start!99778)

(declare-fun b_free!25363 () Bool)

(declare-fun b_next!25363 () Bool)

(assert (=> start!99778 (= b_free!25363 (not b_next!25363))))

(declare-fun tp!88802 () Bool)

(declare-fun b_and!41571 () Bool)

(assert (=> start!99778 (= tp!88802 b_and!41571)))

(declare-fun b!1185415 () Bool)

(declare-fun e!673990 () Bool)

(declare-fun tp_is_empty!29893 () Bool)

(assert (=> b!1185415 (= e!673990 tp_is_empty!29893)))

(declare-fun b!1185416 () Bool)

(declare-fun e!673996 () Bool)

(declare-fun e!673991 () Bool)

(assert (=> b!1185416 (= e!673996 e!673991)))

(declare-fun res!788006 () Bool)

(assert (=> b!1185416 (=> (not res!788006) (not e!673991))))

(declare-datatypes ((array!76520 0))(
  ( (array!76521 (arr!36910 (Array (_ BitVec 32) (_ BitVec 64))) (size!37448 (_ BitVec 32))) )
))
(declare-fun lt!537919 () array!76520)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76520 (_ BitVec 32)) Bool)

(assert (=> b!1185416 (= res!788006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537919 mask!1564))))

(declare-fun _keys!1208 () array!76520)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185416 (= lt!537919 (array!76521 (store (arr!36910 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37448 _keys!1208)))))

(declare-fun b!1185417 () Bool)

(declare-fun e!673987 () Bool)

(assert (=> b!1185417 (= e!673987 true)))

(declare-datatypes ((V!44985 0))(
  ( (V!44986 (val!15003 Int)) )
))
(declare-datatypes ((tuple2!19358 0))(
  ( (tuple2!19359 (_1!9690 (_ BitVec 64)) (_2!9690 V!44985)) )
))
(declare-datatypes ((List!26071 0))(
  ( (Nil!26068) (Cons!26067 (h!27276 tuple2!19358) (t!38417 List!26071)) )
))
(declare-datatypes ((ListLongMap!17327 0))(
  ( (ListLongMap!17328 (toList!8679 List!26071)) )
))
(declare-fun lt!537913 () ListLongMap!17327)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!537912 () ListLongMap!17327)

(declare-fun -!1632 (ListLongMap!17327 (_ BitVec 64)) ListLongMap!17327)

(assert (=> b!1185417 (= (-!1632 lt!537913 k0!934) lt!537912)))

(declare-fun lt!537924 () ListLongMap!17327)

(declare-datatypes ((Unit!39146 0))(
  ( (Unit!39147) )
))
(declare-fun lt!537907 () Unit!39146)

(declare-fun lt!537910 () V!44985)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!175 (ListLongMap!17327 (_ BitVec 64) V!44985 (_ BitVec 64)) Unit!39146)

(assert (=> b!1185417 (= lt!537907 (addRemoveCommutativeForDiffKeys!175 lt!537924 (select (arr!36910 _keys!1208) from!1455) lt!537910 k0!934))))

(declare-fun lt!537916 () ListLongMap!17327)

(declare-fun lt!537921 () ListLongMap!17327)

(declare-fun lt!537911 () ListLongMap!17327)

(assert (=> b!1185417 (and (= lt!537911 lt!537913) (= lt!537921 lt!537916))))

(declare-fun lt!537909 () tuple2!19358)

(declare-fun +!3961 (ListLongMap!17327 tuple2!19358) ListLongMap!17327)

(assert (=> b!1185417 (= lt!537913 (+!3961 lt!537924 lt!537909))))

(assert (=> b!1185417 (not (= (select (arr!36910 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537906 () Unit!39146)

(declare-fun e!673994 () Unit!39146)

(assert (=> b!1185417 (= lt!537906 e!673994)))

(declare-fun c!117142 () Bool)

(assert (=> b!1185417 (= c!117142 (= (select (arr!36910 _keys!1208) from!1455) k0!934))))

(declare-fun e!673986 () Bool)

(assert (=> b!1185417 e!673986))

(declare-fun res!788009 () Bool)

(assert (=> b!1185417 (=> (not res!788009) (not e!673986))))

(declare-fun lt!537923 () ListLongMap!17327)

(assert (=> b!1185417 (= res!788009 (= lt!537923 lt!537912))))

(assert (=> b!1185417 (= lt!537912 (+!3961 lt!537921 lt!537909))))

(assert (=> b!1185417 (= lt!537909 (tuple2!19359 (select (arr!36910 _keys!1208) from!1455) lt!537910))))

(declare-datatypes ((ValueCell!14237 0))(
  ( (ValueCellFull!14237 (v!17640 V!44985)) (EmptyCell!14237) )
))
(declare-datatypes ((array!76522 0))(
  ( (array!76523 (arr!36911 (Array (_ BitVec 32) ValueCell!14237)) (size!37449 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76522)

(declare-fun lt!537918 () V!44985)

(declare-fun get!18904 (ValueCell!14237 V!44985) V!44985)

(assert (=> b!1185417 (= lt!537910 (get!18904 (select (arr!36911 _values!996) from!1455) lt!537918))))

(declare-fun b!1185418 () Bool)

(declare-fun res!788016 () Bool)

(assert (=> b!1185418 (=> (not res!788016) (not e!673996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185418 (= res!788016 (validMask!0 mask!1564))))

(declare-fun b!1185419 () Bool)

(declare-fun e!673993 () Bool)

(assert (=> b!1185419 (= e!673986 e!673993)))

(declare-fun res!788010 () Bool)

(assert (=> b!1185419 (=> res!788010 e!673993)))

(assert (=> b!1185419 (= res!788010 (not (= (select (arr!36910 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185420 () Bool)

(declare-fun e!673992 () Bool)

(declare-fun e!673988 () Bool)

(assert (=> b!1185420 (= e!673992 e!673988)))

(declare-fun res!788007 () Bool)

(assert (=> b!1185420 (=> res!788007 e!673988)))

(assert (=> b!1185420 (= res!788007 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44985)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44985)

(declare-fun lt!537914 () array!76522)

(declare-fun getCurrentListMapNoExtraKeys!5132 (array!76520 array!76522 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) Int) ListLongMap!17327)

(assert (=> b!1185420 (= lt!537923 (getCurrentListMapNoExtraKeys!5132 lt!537919 lt!537914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185420 (= lt!537914 (array!76523 (store (arr!36911 _values!996) i!673 (ValueCellFull!14237 lt!537918)) (size!37449 _values!996)))))

(declare-fun dynLambda!3033 (Int (_ BitVec 64)) V!44985)

(assert (=> b!1185420 (= lt!537918 (dynLambda!3033 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185420 (= lt!537911 (getCurrentListMapNoExtraKeys!5132 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185421 () Bool)

(declare-fun res!788011 () Bool)

(assert (=> b!1185421 (=> (not res!788011) (not e!673996))))

(assert (=> b!1185421 (= res!788011 (= (select (arr!36910 _keys!1208) i!673) k0!934))))

(declare-fun b!1185423 () Bool)

(assert (=> b!1185423 (= e!673991 (not e!673992))))

(declare-fun res!788004 () Bool)

(assert (=> b!1185423 (=> res!788004 e!673992)))

(assert (=> b!1185423 (= res!788004 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185423 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537908 () Unit!39146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76520 (_ BitVec 64) (_ BitVec 32)) Unit!39146)

(assert (=> b!1185423 (= lt!537908 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185424 () Bool)

(declare-fun Unit!39148 () Unit!39146)

(assert (=> b!1185424 (= e!673994 Unit!39148)))

(declare-fun lt!537915 () Unit!39146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39146)

(assert (=> b!1185424 (= lt!537915 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185424 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537922 () Unit!39146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76520 (_ BitVec 32) (_ BitVec 32)) Unit!39146)

(assert (=> b!1185424 (= lt!537922 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26072 0))(
  ( (Nil!26069) (Cons!26068 (h!27277 (_ BitVec 64)) (t!38418 List!26072)) )
))
(declare-fun arrayNoDuplicates!0 (array!76520 (_ BitVec 32) List!26072) Bool)

(assert (=> b!1185424 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26069)))

(declare-fun lt!537917 () Unit!39146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76520 (_ BitVec 64) (_ BitVec 32) List!26072) Unit!39146)

(assert (=> b!1185424 (= lt!537917 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26069))))

(assert (=> b!1185424 false))

(declare-fun b!1185425 () Bool)

(declare-fun e!673995 () Bool)

(assert (=> b!1185425 (= e!673995 tp_is_empty!29893)))

(declare-fun b!1185426 () Bool)

(declare-fun res!788015 () Bool)

(assert (=> b!1185426 (=> (not res!788015) (not e!673996))))

(assert (=> b!1185426 (= res!788015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185427 () Bool)

(declare-fun res!788017 () Bool)

(assert (=> b!1185427 (=> (not res!788017) (not e!673996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185427 (= res!788017 (validKeyInArray!0 k0!934))))

(declare-fun b!1185428 () Bool)

(assert (=> b!1185428 (= e!673993 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185429 () Bool)

(declare-fun res!788008 () Bool)

(assert (=> b!1185429 (=> (not res!788008) (not e!673996))))

(assert (=> b!1185429 (= res!788008 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26069))))

(declare-fun b!1185430 () Bool)

(declare-fun res!788014 () Bool)

(assert (=> b!1185430 (=> (not res!788014) (not e!673991))))

(assert (=> b!1185430 (= res!788014 (arrayNoDuplicates!0 lt!537919 #b00000000000000000000000000000000 Nil!26069))))

(declare-fun b!1185431 () Bool)

(declare-fun res!788013 () Bool)

(assert (=> b!1185431 (=> (not res!788013) (not e!673996))))

(assert (=> b!1185431 (= res!788013 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37448 _keys!1208))))))

(declare-fun mapNonEmpty!46667 () Bool)

(declare-fun mapRes!46667 () Bool)

(declare-fun tp!88803 () Bool)

(assert (=> mapNonEmpty!46667 (= mapRes!46667 (and tp!88803 e!673995))))

(declare-fun mapValue!46667 () ValueCell!14237)

(declare-fun mapRest!46667 () (Array (_ BitVec 32) ValueCell!14237))

(declare-fun mapKey!46667 () (_ BitVec 32))

(assert (=> mapNonEmpty!46667 (= (arr!36911 _values!996) (store mapRest!46667 mapKey!46667 mapValue!46667))))

(declare-fun res!788005 () Bool)

(assert (=> start!99778 (=> (not res!788005) (not e!673996))))

(assert (=> start!99778 (= res!788005 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37448 _keys!1208))))))

(assert (=> start!99778 e!673996))

(assert (=> start!99778 tp_is_empty!29893))

(declare-fun array_inv!28280 (array!76520) Bool)

(assert (=> start!99778 (array_inv!28280 _keys!1208)))

(assert (=> start!99778 true))

(assert (=> start!99778 tp!88802))

(declare-fun e!673989 () Bool)

(declare-fun array_inv!28281 (array!76522) Bool)

(assert (=> start!99778 (and (array_inv!28281 _values!996) e!673989)))

(declare-fun b!1185422 () Bool)

(assert (=> b!1185422 (= e!673988 e!673987)))

(declare-fun res!788003 () Bool)

(assert (=> b!1185422 (=> res!788003 e!673987)))

(assert (=> b!1185422 (= res!788003 (not (validKeyInArray!0 (select (arr!36910 _keys!1208) from!1455))))))

(assert (=> b!1185422 (= lt!537916 lt!537921)))

(assert (=> b!1185422 (= lt!537921 (-!1632 lt!537924 k0!934))))

(assert (=> b!1185422 (= lt!537916 (getCurrentListMapNoExtraKeys!5132 lt!537919 lt!537914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185422 (= lt!537924 (getCurrentListMapNoExtraKeys!5132 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537920 () Unit!39146)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 (array!76520 array!76522 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39146)

(assert (=> b!1185422 (= lt!537920 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!890 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185432 () Bool)

(declare-fun Unit!39149 () Unit!39146)

(assert (=> b!1185432 (= e!673994 Unit!39149)))

(declare-fun b!1185433 () Bool)

(assert (=> b!1185433 (= e!673989 (and e!673990 mapRes!46667))))

(declare-fun condMapEmpty!46667 () Bool)

(declare-fun mapDefault!46667 () ValueCell!14237)

(assert (=> b!1185433 (= condMapEmpty!46667 (= (arr!36911 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14237)) mapDefault!46667)))))

(declare-fun b!1185434 () Bool)

(declare-fun res!788012 () Bool)

(assert (=> b!1185434 (=> (not res!788012) (not e!673996))))

(assert (=> b!1185434 (= res!788012 (and (= (size!37449 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37448 _keys!1208) (size!37449 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46667 () Bool)

(assert (=> mapIsEmpty!46667 mapRes!46667))

(assert (= (and start!99778 res!788005) b!1185418))

(assert (= (and b!1185418 res!788016) b!1185434))

(assert (= (and b!1185434 res!788012) b!1185426))

(assert (= (and b!1185426 res!788015) b!1185429))

(assert (= (and b!1185429 res!788008) b!1185431))

(assert (= (and b!1185431 res!788013) b!1185427))

(assert (= (and b!1185427 res!788017) b!1185421))

(assert (= (and b!1185421 res!788011) b!1185416))

(assert (= (and b!1185416 res!788006) b!1185430))

(assert (= (and b!1185430 res!788014) b!1185423))

(assert (= (and b!1185423 (not res!788004)) b!1185420))

(assert (= (and b!1185420 (not res!788007)) b!1185422))

(assert (= (and b!1185422 (not res!788003)) b!1185417))

(assert (= (and b!1185417 res!788009) b!1185419))

(assert (= (and b!1185419 (not res!788010)) b!1185428))

(assert (= (and b!1185417 c!117142) b!1185424))

(assert (= (and b!1185417 (not c!117142)) b!1185432))

(assert (= (and b!1185433 condMapEmpty!46667) mapIsEmpty!46667))

(assert (= (and b!1185433 (not condMapEmpty!46667)) mapNonEmpty!46667))

(get-info :version)

(assert (= (and mapNonEmpty!46667 ((_ is ValueCellFull!14237) mapValue!46667)) b!1185425))

(assert (= (and b!1185433 ((_ is ValueCellFull!14237) mapDefault!46667)) b!1185415))

(assert (= start!99778 b!1185433))

(declare-fun b_lambda!20489 () Bool)

(assert (=> (not b_lambda!20489) (not b!1185420)))

(declare-fun t!38416 () Bool)

(declare-fun tb!10167 () Bool)

(assert (=> (and start!99778 (= defaultEntry!1004 defaultEntry!1004) t!38416) tb!10167))

(declare-fun result!20909 () Bool)

(assert (=> tb!10167 (= result!20909 tp_is_empty!29893)))

(assert (=> b!1185420 t!38416))

(declare-fun b_and!41573 () Bool)

(assert (= b_and!41571 (and (=> t!38416 result!20909) b_and!41573)))

(declare-fun m!1093355 () Bool)

(assert (=> b!1185430 m!1093355))

(declare-fun m!1093357 () Bool)

(assert (=> b!1185424 m!1093357))

(declare-fun m!1093359 () Bool)

(assert (=> b!1185424 m!1093359))

(declare-fun m!1093361 () Bool)

(assert (=> b!1185424 m!1093361))

(declare-fun m!1093363 () Bool)

(assert (=> b!1185424 m!1093363))

(declare-fun m!1093365 () Bool)

(assert (=> b!1185424 m!1093365))

(declare-fun m!1093367 () Bool)

(assert (=> start!99778 m!1093367))

(declare-fun m!1093369 () Bool)

(assert (=> start!99778 m!1093369))

(declare-fun m!1093371 () Bool)

(assert (=> b!1185426 m!1093371))

(declare-fun m!1093373 () Bool)

(assert (=> b!1185419 m!1093373))

(declare-fun m!1093375 () Bool)

(assert (=> b!1185418 m!1093375))

(declare-fun m!1093377 () Bool)

(assert (=> b!1185428 m!1093377))

(declare-fun m!1093379 () Bool)

(assert (=> b!1185423 m!1093379))

(declare-fun m!1093381 () Bool)

(assert (=> b!1185423 m!1093381))

(assert (=> b!1185417 m!1093373))

(declare-fun m!1093383 () Bool)

(assert (=> b!1185417 m!1093383))

(declare-fun m!1093385 () Bool)

(assert (=> b!1185417 m!1093385))

(declare-fun m!1093387 () Bool)

(assert (=> b!1185417 m!1093387))

(assert (=> b!1185417 m!1093385))

(declare-fun m!1093389 () Bool)

(assert (=> b!1185417 m!1093389))

(declare-fun m!1093391 () Bool)

(assert (=> b!1185417 m!1093391))

(declare-fun m!1093393 () Bool)

(assert (=> b!1185417 m!1093393))

(assert (=> b!1185417 m!1093373))

(declare-fun m!1093395 () Bool)

(assert (=> b!1185420 m!1093395))

(declare-fun m!1093397 () Bool)

(assert (=> b!1185420 m!1093397))

(declare-fun m!1093399 () Bool)

(assert (=> b!1185420 m!1093399))

(declare-fun m!1093401 () Bool)

(assert (=> b!1185420 m!1093401))

(declare-fun m!1093403 () Bool)

(assert (=> mapNonEmpty!46667 m!1093403))

(declare-fun m!1093405 () Bool)

(assert (=> b!1185429 m!1093405))

(declare-fun m!1093407 () Bool)

(assert (=> b!1185416 m!1093407))

(declare-fun m!1093409 () Bool)

(assert (=> b!1185416 m!1093409))

(declare-fun m!1093411 () Bool)

(assert (=> b!1185422 m!1093411))

(declare-fun m!1093413 () Bool)

(assert (=> b!1185422 m!1093413))

(declare-fun m!1093415 () Bool)

(assert (=> b!1185422 m!1093415))

(declare-fun m!1093417 () Bool)

(assert (=> b!1185422 m!1093417))

(assert (=> b!1185422 m!1093373))

(declare-fun m!1093419 () Bool)

(assert (=> b!1185422 m!1093419))

(assert (=> b!1185422 m!1093373))

(declare-fun m!1093421 () Bool)

(assert (=> b!1185427 m!1093421))

(declare-fun m!1093423 () Bool)

(assert (=> b!1185421 m!1093423))

(check-sat (not b!1185428) tp_is_empty!29893 b_and!41573 (not b!1185424) (not b!1185427) (not b!1185417) (not start!99778) (not b!1185420) (not b_lambda!20489) (not b!1185416) (not b!1185418) (not mapNonEmpty!46667) (not b!1185423) (not b!1185426) (not b!1185429) (not b_next!25363) (not b!1185422) (not b!1185430))
(check-sat b_and!41573 (not b_next!25363))
