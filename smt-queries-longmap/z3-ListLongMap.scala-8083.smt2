; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99358 () Bool)

(assert start!99358)

(declare-fun b_free!24943 () Bool)

(declare-fun b_next!24943 () Bool)

(assert (=> start!99358 (= b_free!24943 (not b_next!24943))))

(declare-fun tp!87542 () Bool)

(declare-fun b_and!40731 () Bool)

(assert (=> start!99358 (= tp!87542 b_and!40731)))

(declare-fun b!1172003 () Bool)

(declare-fun e!666152 () Bool)

(declare-fun e!666157 () Bool)

(assert (=> b!1172003 (= e!666152 e!666157)))

(declare-fun res!778117 () Bool)

(assert (=> b!1172003 (=> res!778117 e!666157)))

(declare-datatypes ((array!75688 0))(
  ( (array!75689 (arr!36494 (Array (_ BitVec 32) (_ BitVec 64))) (size!37032 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75688)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172003 (= res!778117 (not (validKeyInArray!0 (select (arr!36494 _keys!1208) from!1455))))))

(declare-datatypes ((V!44425 0))(
  ( (V!44426 (val!14793 Int)) )
))
(declare-datatypes ((tuple2!18990 0))(
  ( (tuple2!18991 (_1!9506 (_ BitVec 64)) (_2!9506 V!44425)) )
))
(declare-datatypes ((List!25704 0))(
  ( (Nil!25701) (Cons!25700 (h!26909 tuple2!18990) (t!37630 List!25704)) )
))
(declare-datatypes ((ListLongMap!16959 0))(
  ( (ListLongMap!16960 (toList!8495 List!25704)) )
))
(declare-fun lt!527916 () ListLongMap!16959)

(declare-fun lt!527908 () ListLongMap!16959)

(assert (=> b!1172003 (= lt!527916 lt!527908)))

(declare-fun lt!527912 () ListLongMap!16959)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1488 (ListLongMap!16959 (_ BitVec 64)) ListLongMap!16959)

(assert (=> b!1172003 (= lt!527908 (-!1488 lt!527912 k0!934))))

(declare-fun zeroValue!944 () V!44425)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14027 0))(
  ( (ValueCellFull!14027 (v!17430 V!44425)) (EmptyCell!14027) )
))
(declare-datatypes ((array!75690 0))(
  ( (array!75691 (arr!36495 (Array (_ BitVec 32) ValueCell!14027)) (size!37033 (_ BitVec 32))) )
))
(declare-fun lt!527914 () array!75690)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44425)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!527913 () array!75688)

(declare-fun getCurrentListMapNoExtraKeys!4969 (array!75688 array!75690 (_ BitVec 32) (_ BitVec 32) V!44425 V!44425 (_ BitVec 32) Int) ListLongMap!16959)

(assert (=> b!1172003 (= lt!527916 (getCurrentListMapNoExtraKeys!4969 lt!527913 lt!527914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75690)

(assert (=> b!1172003 (= lt!527912 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38469 0))(
  ( (Unit!38470) )
))
(declare-fun lt!527906 () Unit!38469)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!752 (array!75688 array!75690 (_ BitVec 32) (_ BitVec 32) V!44425 V!44425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38469)

(assert (=> b!1172003 (= lt!527906 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!752 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172004 () Bool)

(declare-fun e!666158 () Bool)

(declare-fun tp_is_empty!29473 () Bool)

(assert (=> b!1172004 (= e!666158 tp_is_empty!29473)))

(declare-fun b!1172005 () Bool)

(declare-fun e!666160 () Bool)

(declare-fun e!666150 () Bool)

(assert (=> b!1172005 (= e!666160 e!666150)))

(declare-fun res!778119 () Bool)

(assert (=> b!1172005 (=> res!778119 e!666150)))

(assert (=> b!1172005 (= res!778119 (or (bvsge (size!37032 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37032 _keys!1208)) (bvsge from!1455 (size!37032 _keys!1208))))))

(declare-datatypes ((List!25705 0))(
  ( (Nil!25702) (Cons!25701 (h!26910 (_ BitVec 64)) (t!37631 List!25705)) )
))
(declare-fun arrayNoDuplicates!0 (array!75688 (_ BitVec 32) List!25705) Bool)

(assert (=> b!1172005 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25702)))

(declare-fun lt!527910 () Unit!38469)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75688 (_ BitVec 32) (_ BitVec 32)) Unit!38469)

(assert (=> b!1172005 (= lt!527910 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172005 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527915 () Unit!38469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38469)

(assert (=> b!1172005 (= lt!527915 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172006 () Bool)

(declare-fun res!778112 () Bool)

(assert (=> b!1172006 (=> res!778112 e!666150)))

(declare-fun noDuplicate!1631 (List!25705) Bool)

(assert (=> b!1172006 (= res!778112 (not (noDuplicate!1631 Nil!25702)))))

(declare-fun b!1172007 () Bool)

(declare-fun res!778118 () Bool)

(declare-fun e!666156 () Bool)

(assert (=> b!1172007 (=> (not res!778118) (not e!666156))))

(assert (=> b!1172007 (= res!778118 (arrayNoDuplicates!0 lt!527913 #b00000000000000000000000000000000 Nil!25702))))

(declare-fun b!1172008 () Bool)

(declare-fun res!778113 () Bool)

(declare-fun e!666159 () Bool)

(assert (=> b!1172008 (=> (not res!778113) (not e!666159))))

(assert (=> b!1172008 (= res!778113 (and (= (size!37033 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37032 _keys!1208) (size!37033 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!778111 () Bool)

(assert (=> start!99358 (=> (not res!778111) (not e!666159))))

(assert (=> start!99358 (= res!778111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37032 _keys!1208))))))

(assert (=> start!99358 e!666159))

(assert (=> start!99358 tp_is_empty!29473))

(declare-fun array_inv!27992 (array!75688) Bool)

(assert (=> start!99358 (array_inv!27992 _keys!1208)))

(assert (=> start!99358 true))

(assert (=> start!99358 tp!87542))

(declare-fun e!666148 () Bool)

(declare-fun array_inv!27993 (array!75690) Bool)

(assert (=> start!99358 (and (array_inv!27993 _values!996) e!666148)))

(declare-fun b!1172009 () Bool)

(declare-fun e!666154 () Bool)

(assert (=> b!1172009 (= e!666154 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46037 () Bool)

(declare-fun mapRes!46037 () Bool)

(declare-fun tp!87543 () Bool)

(declare-fun e!666153 () Bool)

(assert (=> mapNonEmpty!46037 (= mapRes!46037 (and tp!87543 e!666153))))

(declare-fun mapValue!46037 () ValueCell!14027)

(declare-fun mapKey!46037 () (_ BitVec 32))

(declare-fun mapRest!46037 () (Array (_ BitVec 32) ValueCell!14027))

(assert (=> mapNonEmpty!46037 (= (arr!36495 _values!996) (store mapRest!46037 mapKey!46037 mapValue!46037))))

(declare-fun b!1172010 () Bool)

(assert (=> b!1172010 (= e!666157 e!666160)))

(declare-fun res!778123 () Bool)

(assert (=> b!1172010 (=> res!778123 e!666160)))

(assert (=> b!1172010 (= res!778123 (not (= (select (arr!36494 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666151 () Bool)

(assert (=> b!1172010 e!666151))

(declare-fun res!778124 () Bool)

(assert (=> b!1172010 (=> (not res!778124) (not e!666151))))

(declare-fun lt!527907 () V!44425)

(declare-fun lt!527911 () ListLongMap!16959)

(declare-fun +!3812 (ListLongMap!16959 tuple2!18990) ListLongMap!16959)

(declare-fun get!18626 (ValueCell!14027 V!44425) V!44425)

(assert (=> b!1172010 (= res!778124 (= lt!527911 (+!3812 lt!527908 (tuple2!18991 (select (arr!36494 _keys!1208) from!1455) (get!18626 (select (arr!36495 _values!996) from!1455) lt!527907)))))))

(declare-fun b!1172011 () Bool)

(assert (=> b!1172011 (= e!666151 e!666154)))

(declare-fun res!778116 () Bool)

(assert (=> b!1172011 (=> res!778116 e!666154)))

(assert (=> b!1172011 (= res!778116 (not (= (select (arr!36494 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172012 () Bool)

(assert (=> b!1172012 (= e!666153 tp_is_empty!29473)))

(declare-fun b!1172013 () Bool)

(declare-fun res!778115 () Bool)

(assert (=> b!1172013 (=> (not res!778115) (not e!666159))))

(assert (=> b!1172013 (= res!778115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25702))))

(declare-fun b!1172014 () Bool)

(assert (=> b!1172014 (= e!666150 true)))

(declare-fun lt!527904 () Bool)

(declare-fun contains!6835 (List!25705 (_ BitVec 64)) Bool)

(assert (=> b!1172014 (= lt!527904 (contains!6835 Nil!25702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172015 () Bool)

(declare-fun res!778129 () Bool)

(assert (=> b!1172015 (=> (not res!778129) (not e!666159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75688 (_ BitVec 32)) Bool)

(assert (=> b!1172015 (= res!778129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172016 () Bool)

(declare-fun res!778128 () Bool)

(assert (=> b!1172016 (=> (not res!778128) (not e!666159))))

(assert (=> b!1172016 (= res!778128 (validKeyInArray!0 k0!934))))

(declare-fun b!1172017 () Bool)

(declare-fun e!666149 () Bool)

(assert (=> b!1172017 (= e!666156 (not e!666149))))

(declare-fun res!778114 () Bool)

(assert (=> b!1172017 (=> res!778114 e!666149)))

(assert (=> b!1172017 (= res!778114 (bvsgt from!1455 i!673))))

(assert (=> b!1172017 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527909 () Unit!38469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75688 (_ BitVec 64) (_ BitVec 32)) Unit!38469)

(assert (=> b!1172017 (= lt!527909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172018 () Bool)

(declare-fun res!778121 () Bool)

(assert (=> b!1172018 (=> res!778121 e!666150)))

(assert (=> b!1172018 (= res!778121 (contains!6835 Nil!25702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!46037 () Bool)

(assert (=> mapIsEmpty!46037 mapRes!46037))

(declare-fun b!1172019 () Bool)

(declare-fun res!778120 () Bool)

(assert (=> b!1172019 (=> (not res!778120) (not e!666159))))

(assert (=> b!1172019 (= res!778120 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37032 _keys!1208))))))

(declare-fun b!1172020 () Bool)

(declare-fun res!778127 () Bool)

(assert (=> b!1172020 (=> (not res!778127) (not e!666159))))

(assert (=> b!1172020 (= res!778127 (= (select (arr!36494 _keys!1208) i!673) k0!934))))

(declare-fun b!1172021 () Bool)

(assert (=> b!1172021 (= e!666149 e!666152)))

(declare-fun res!778122 () Bool)

(assert (=> b!1172021 (=> res!778122 e!666152)))

(assert (=> b!1172021 (= res!778122 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172021 (= lt!527911 (getCurrentListMapNoExtraKeys!4969 lt!527913 lt!527914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172021 (= lt!527914 (array!75691 (store (arr!36495 _values!996) i!673 (ValueCellFull!14027 lt!527907)) (size!37033 _values!996)))))

(declare-fun dynLambda!2894 (Int (_ BitVec 64)) V!44425)

(assert (=> b!1172021 (= lt!527907 (dynLambda!2894 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527905 () ListLongMap!16959)

(assert (=> b!1172021 (= lt!527905 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172022 () Bool)

(assert (=> b!1172022 (= e!666159 e!666156)))

(declare-fun res!778125 () Bool)

(assert (=> b!1172022 (=> (not res!778125) (not e!666156))))

(assert (=> b!1172022 (= res!778125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527913 mask!1564))))

(assert (=> b!1172022 (= lt!527913 (array!75689 (store (arr!36494 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37032 _keys!1208)))))

(declare-fun b!1172023 () Bool)

(assert (=> b!1172023 (= e!666148 (and e!666158 mapRes!46037))))

(declare-fun condMapEmpty!46037 () Bool)

(declare-fun mapDefault!46037 () ValueCell!14027)

(assert (=> b!1172023 (= condMapEmpty!46037 (= (arr!36495 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14027)) mapDefault!46037)))))

(declare-fun b!1172024 () Bool)

(declare-fun res!778126 () Bool)

(assert (=> b!1172024 (=> (not res!778126) (not e!666159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172024 (= res!778126 (validMask!0 mask!1564))))

(assert (= (and start!99358 res!778111) b!1172024))

(assert (= (and b!1172024 res!778126) b!1172008))

(assert (= (and b!1172008 res!778113) b!1172015))

(assert (= (and b!1172015 res!778129) b!1172013))

(assert (= (and b!1172013 res!778115) b!1172019))

(assert (= (and b!1172019 res!778120) b!1172016))

(assert (= (and b!1172016 res!778128) b!1172020))

(assert (= (and b!1172020 res!778127) b!1172022))

(assert (= (and b!1172022 res!778125) b!1172007))

(assert (= (and b!1172007 res!778118) b!1172017))

(assert (= (and b!1172017 (not res!778114)) b!1172021))

(assert (= (and b!1172021 (not res!778122)) b!1172003))

(assert (= (and b!1172003 (not res!778117)) b!1172010))

(assert (= (and b!1172010 res!778124) b!1172011))

(assert (= (and b!1172011 (not res!778116)) b!1172009))

(assert (= (and b!1172010 (not res!778123)) b!1172005))

(assert (= (and b!1172005 (not res!778119)) b!1172006))

(assert (= (and b!1172006 (not res!778112)) b!1172018))

(assert (= (and b!1172018 (not res!778121)) b!1172014))

(assert (= (and b!1172023 condMapEmpty!46037) mapIsEmpty!46037))

(assert (= (and b!1172023 (not condMapEmpty!46037)) mapNonEmpty!46037))

(get-info :version)

(assert (= (and mapNonEmpty!46037 ((_ is ValueCellFull!14027) mapValue!46037)) b!1172012))

(assert (= (and b!1172023 ((_ is ValueCellFull!14027) mapDefault!46037)) b!1172004))

(assert (= start!99358 b!1172023))

(declare-fun b_lambda!20069 () Bool)

(assert (=> (not b_lambda!20069) (not b!1172021)))

(declare-fun t!37629 () Bool)

(declare-fun tb!9747 () Bool)

(assert (=> (and start!99358 (= defaultEntry!1004 defaultEntry!1004) t!37629) tb!9747))

(declare-fun result!20069 () Bool)

(assert (=> tb!9747 (= result!20069 tp_is_empty!29473)))

(assert (=> b!1172021 t!37629))

(declare-fun b_and!40733 () Bool)

(assert (= b_and!40731 (and (=> t!37629 result!20069) b_and!40733)))

(declare-fun m!1079333 () Bool)

(assert (=> b!1172022 m!1079333))

(declare-fun m!1079335 () Bool)

(assert (=> b!1172022 m!1079335))

(declare-fun m!1079337 () Bool)

(assert (=> b!1172011 m!1079337))

(declare-fun m!1079339 () Bool)

(assert (=> b!1172017 m!1079339))

(declare-fun m!1079341 () Bool)

(assert (=> b!1172017 m!1079341))

(declare-fun m!1079343 () Bool)

(assert (=> b!1172006 m!1079343))

(assert (=> b!1172010 m!1079337))

(declare-fun m!1079345 () Bool)

(assert (=> b!1172010 m!1079345))

(assert (=> b!1172010 m!1079345))

(declare-fun m!1079347 () Bool)

(assert (=> b!1172010 m!1079347))

(declare-fun m!1079349 () Bool)

(assert (=> b!1172010 m!1079349))

(declare-fun m!1079351 () Bool)

(assert (=> start!99358 m!1079351))

(declare-fun m!1079353 () Bool)

(assert (=> start!99358 m!1079353))

(declare-fun m!1079355 () Bool)

(assert (=> b!1172020 m!1079355))

(declare-fun m!1079357 () Bool)

(assert (=> mapNonEmpty!46037 m!1079357))

(declare-fun m!1079359 () Bool)

(assert (=> b!1172014 m!1079359))

(declare-fun m!1079361 () Bool)

(assert (=> b!1172009 m!1079361))

(declare-fun m!1079363 () Bool)

(assert (=> b!1172024 m!1079363))

(declare-fun m!1079365 () Bool)

(assert (=> b!1172007 m!1079365))

(declare-fun m!1079367 () Bool)

(assert (=> b!1172005 m!1079367))

(declare-fun m!1079369 () Bool)

(assert (=> b!1172005 m!1079369))

(declare-fun m!1079371 () Bool)

(assert (=> b!1172005 m!1079371))

(declare-fun m!1079373 () Bool)

(assert (=> b!1172005 m!1079373))

(declare-fun m!1079375 () Bool)

(assert (=> b!1172003 m!1079375))

(declare-fun m!1079377 () Bool)

(assert (=> b!1172003 m!1079377))

(declare-fun m!1079379 () Bool)

(assert (=> b!1172003 m!1079379))

(declare-fun m!1079381 () Bool)

(assert (=> b!1172003 m!1079381))

(assert (=> b!1172003 m!1079337))

(declare-fun m!1079383 () Bool)

(assert (=> b!1172003 m!1079383))

(assert (=> b!1172003 m!1079337))

(declare-fun m!1079385 () Bool)

(assert (=> b!1172016 m!1079385))

(declare-fun m!1079387 () Bool)

(assert (=> b!1172013 m!1079387))

(declare-fun m!1079389 () Bool)

(assert (=> b!1172018 m!1079389))

(declare-fun m!1079391 () Bool)

(assert (=> b!1172021 m!1079391))

(declare-fun m!1079393 () Bool)

(assert (=> b!1172021 m!1079393))

(declare-fun m!1079395 () Bool)

(assert (=> b!1172021 m!1079395))

(declare-fun m!1079397 () Bool)

(assert (=> b!1172021 m!1079397))

(declare-fun m!1079399 () Bool)

(assert (=> b!1172015 m!1079399))

(check-sat (not b_next!24943) (not b!1172022) (not b!1172021) (not b!1172018) b_and!40733 tp_is_empty!29473 (not mapNonEmpty!46037) (not b!1172017) (not b!1172013) (not b!1172009) (not start!99358) (not b!1172024) (not b_lambda!20069) (not b!1172006) (not b!1172015) (not b!1172010) (not b!1172014) (not b!1172003) (not b!1172016) (not b!1172005) (not b!1172007))
(check-sat b_and!40733 (not b_next!24943))
