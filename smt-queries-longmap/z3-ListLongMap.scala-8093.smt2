; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99660 () Bool)

(assert start!99660)

(declare-fun b_free!25003 () Bool)

(declare-fun b_next!25003 () Bool)

(assert (=> start!99660 (= b_free!25003 (not b_next!25003))))

(declare-fun tp!87723 () Bool)

(declare-fun b_and!40875 () Bool)

(assert (=> start!99660 (= tp!87723 b_and!40875)))

(declare-fun b!1175326 () Bool)

(declare-fun e!668171 () Bool)

(declare-fun e!668172 () Bool)

(assert (=> b!1175326 (= e!668171 e!668172)))

(declare-fun res!780139 () Bool)

(assert (=> b!1175326 (=> res!780139 e!668172)))

(declare-datatypes ((array!75931 0))(
  ( (array!75932 (arr!36609 (Array (_ BitVec 32) (_ BitVec 64))) (size!37146 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75931)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175326 (= res!780139 (not (= (select (arr!36609 _keys!1208) from!1455) k0!934)))))

(declare-fun res!780137 () Bool)

(declare-fun e!668165 () Bool)

(assert (=> start!99660 (=> (not res!780137) (not e!668165))))

(assert (=> start!99660 (= res!780137 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37146 _keys!1208))))))

(assert (=> start!99660 e!668165))

(declare-fun tp_is_empty!29533 () Bool)

(assert (=> start!99660 tp_is_empty!29533))

(declare-fun array_inv!28046 (array!75931) Bool)

(assert (=> start!99660 (array_inv!28046 _keys!1208)))

(assert (=> start!99660 true))

(assert (=> start!99660 tp!87723))

(declare-datatypes ((V!44505 0))(
  ( (V!44506 (val!14823 Int)) )
))
(declare-datatypes ((ValueCell!14057 0))(
  ( (ValueCellFull!14057 (v!17457 V!44505)) (EmptyCell!14057) )
))
(declare-datatypes ((array!75933 0))(
  ( (array!75934 (arr!36610 (Array (_ BitVec 32) ValueCell!14057)) (size!37147 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75933)

(declare-fun e!668164 () Bool)

(declare-fun array_inv!28047 (array!75933) Bool)

(assert (=> start!99660 (and (array_inv!28047 _values!996) e!668164)))

(declare-fun b!1175327 () Bool)

(declare-fun e!668174 () Bool)

(assert (=> b!1175327 (= e!668165 e!668174)))

(declare-fun res!780138 () Bool)

(assert (=> b!1175327 (=> (not res!780138) (not e!668174))))

(declare-fun lt!529827 () array!75931)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75931 (_ BitVec 32)) Bool)

(assert (=> b!1175327 (= res!780138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529827 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175327 (= lt!529827 (array!75932 (store (arr!36609 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37146 _keys!1208)))))

(declare-fun b!1175328 () Bool)

(declare-fun res!780135 () Bool)

(assert (=> b!1175328 (=> (not res!780135) (not e!668165))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1175328 (= res!780135 (and (= (size!37147 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37146 _keys!1208) (size!37147 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175329 () Bool)

(declare-fun e!668166 () Bool)

(assert (=> b!1175329 (= e!668166 true)))

(assert (=> b!1175329 (not (= (select (arr!36609 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38714 0))(
  ( (Unit!38715) )
))
(declare-fun lt!529826 () Unit!38714)

(declare-fun e!668173 () Unit!38714)

(assert (=> b!1175329 (= lt!529826 e!668173)))

(declare-fun c!117026 () Bool)

(assert (=> b!1175329 (= c!117026 (= (select (arr!36609 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175329 e!668171))

(declare-fun res!780143 () Bool)

(assert (=> b!1175329 (=> (not res!780143) (not e!668171))))

(declare-datatypes ((tuple2!18984 0))(
  ( (tuple2!18985 (_1!9503 (_ BitVec 64)) (_2!9503 V!44505)) )
))
(declare-datatypes ((List!25722 0))(
  ( (Nil!25719) (Cons!25718 (h!26936 tuple2!18984) (t!37709 List!25722)) )
))
(declare-datatypes ((ListLongMap!16961 0))(
  ( (ListLongMap!16962 (toList!8496 List!25722)) )
))
(declare-fun lt!529825 () ListLongMap!16961)

(declare-fun lt!529823 () V!44505)

(declare-fun lt!529822 () ListLongMap!16961)

(declare-fun +!3828 (ListLongMap!16961 tuple2!18984) ListLongMap!16961)

(declare-fun get!18714 (ValueCell!14057 V!44505) V!44505)

(assert (=> b!1175329 (= res!780143 (= lt!529822 (+!3828 lt!529825 (tuple2!18985 (select (arr!36609 _keys!1208) from!1455) (get!18714 (select (arr!36610 _values!996) from!1455) lt!529823)))))))

(declare-fun b!1175330 () Bool)

(declare-fun e!668168 () Bool)

(assert (=> b!1175330 (= e!668168 e!668166)))

(declare-fun res!780142 () Bool)

(assert (=> b!1175330 (=> res!780142 e!668166)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175330 (= res!780142 (not (validKeyInArray!0 (select (arr!36609 _keys!1208) from!1455))))))

(declare-fun lt!529819 () ListLongMap!16961)

(assert (=> b!1175330 (= lt!529819 lt!529825)))

(declare-fun lt!529824 () ListLongMap!16961)

(declare-fun -!1541 (ListLongMap!16961 (_ BitVec 64)) ListLongMap!16961)

(assert (=> b!1175330 (= lt!529825 (-!1541 lt!529824 k0!934))))

(declare-fun zeroValue!944 () V!44505)

(declare-fun lt!529820 () array!75933)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44505)

(declare-fun getCurrentListMapNoExtraKeys!4981 (array!75931 array!75933 (_ BitVec 32) (_ BitVec 32) V!44505 V!44505 (_ BitVec 32) Int) ListLongMap!16961)

(assert (=> b!1175330 (= lt!529819 (getCurrentListMapNoExtraKeys!4981 lt!529827 lt!529820 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175330 (= lt!529824 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529818 () Unit!38714)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!766 (array!75931 array!75933 (_ BitVec 32) (_ BitVec 32) V!44505 V!44505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38714)

(assert (=> b!1175330 (= lt!529818 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!766 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175331 () Bool)

(declare-fun res!780141 () Bool)

(assert (=> b!1175331 (=> (not res!780141) (not e!668165))))

(assert (=> b!1175331 (= res!780141 (validKeyInArray!0 k0!934))))

(declare-fun b!1175332 () Bool)

(declare-fun res!780146 () Bool)

(assert (=> b!1175332 (=> (not res!780146) (not e!668165))))

(assert (=> b!1175332 (= res!780146 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37146 _keys!1208))))))

(declare-fun b!1175333 () Bool)

(declare-fun res!780144 () Bool)

(assert (=> b!1175333 (=> (not res!780144) (not e!668165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175333 (= res!780144 (validMask!0 mask!1564))))

(declare-fun b!1175334 () Bool)

(declare-fun Unit!38716 () Unit!38714)

(assert (=> b!1175334 (= e!668173 Unit!38716)))

(declare-fun b!1175335 () Bool)

(declare-fun res!780149 () Bool)

(assert (=> b!1175335 (=> (not res!780149) (not e!668165))))

(declare-datatypes ((List!25723 0))(
  ( (Nil!25720) (Cons!25719 (h!26937 (_ BitVec 64)) (t!37710 List!25723)) )
))
(declare-fun arrayNoDuplicates!0 (array!75931 (_ BitVec 32) List!25723) Bool)

(assert (=> b!1175335 (= res!780149 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25720))))

(declare-fun b!1175336 () Bool)

(declare-fun e!668167 () Bool)

(assert (=> b!1175336 (= e!668174 (not e!668167))))

(declare-fun res!780147 () Bool)

(assert (=> b!1175336 (=> res!780147 e!668167)))

(assert (=> b!1175336 (= res!780147 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175336 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529828 () Unit!38714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75931 (_ BitVec 64) (_ BitVec 32)) Unit!38714)

(assert (=> b!1175336 (= lt!529828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175337 () Bool)

(declare-fun e!668163 () Bool)

(declare-fun mapRes!46127 () Bool)

(assert (=> b!1175337 (= e!668164 (and e!668163 mapRes!46127))))

(declare-fun condMapEmpty!46127 () Bool)

(declare-fun mapDefault!46127 () ValueCell!14057)

(assert (=> b!1175337 (= condMapEmpty!46127 (= (arr!36610 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14057)) mapDefault!46127)))))

(declare-fun b!1175338 () Bool)

(assert (=> b!1175338 (= e!668163 tp_is_empty!29533)))

(declare-fun b!1175339 () Bool)

(assert (=> b!1175339 (= e!668167 e!668168)))

(declare-fun res!780136 () Bool)

(assert (=> b!1175339 (=> res!780136 e!668168)))

(assert (=> b!1175339 (= res!780136 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175339 (= lt!529822 (getCurrentListMapNoExtraKeys!4981 lt!529827 lt!529820 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175339 (= lt!529820 (array!75934 (store (arr!36610 _values!996) i!673 (ValueCellFull!14057 lt!529823)) (size!37147 _values!996)))))

(declare-fun dynLambda!2959 (Int (_ BitVec 64)) V!44505)

(assert (=> b!1175339 (= lt!529823 (dynLambda!2959 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529817 () ListLongMap!16961)

(assert (=> b!1175339 (= lt!529817 (getCurrentListMapNoExtraKeys!4981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175340 () Bool)

(declare-fun res!780145 () Bool)

(assert (=> b!1175340 (=> (not res!780145) (not e!668174))))

(assert (=> b!1175340 (= res!780145 (arrayNoDuplicates!0 lt!529827 #b00000000000000000000000000000000 Nil!25720))))

(declare-fun b!1175341 () Bool)

(declare-fun res!780148 () Bool)

(assert (=> b!1175341 (=> (not res!780148) (not e!668165))))

(assert (=> b!1175341 (= res!780148 (= (select (arr!36609 _keys!1208) i!673) k0!934))))

(declare-fun b!1175342 () Bool)

(declare-fun e!668170 () Bool)

(assert (=> b!1175342 (= e!668170 tp_is_empty!29533)))

(declare-fun mapNonEmpty!46127 () Bool)

(declare-fun tp!87722 () Bool)

(assert (=> mapNonEmpty!46127 (= mapRes!46127 (and tp!87722 e!668170))))

(declare-fun mapValue!46127 () ValueCell!14057)

(declare-fun mapRest!46127 () (Array (_ BitVec 32) ValueCell!14057))

(declare-fun mapKey!46127 () (_ BitVec 32))

(assert (=> mapNonEmpty!46127 (= (arr!36610 _values!996) (store mapRest!46127 mapKey!46127 mapValue!46127))))

(declare-fun b!1175343 () Bool)

(declare-fun res!780140 () Bool)

(assert (=> b!1175343 (=> (not res!780140) (not e!668165))))

(assert (=> b!1175343 (= res!780140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175344 () Bool)

(assert (=> b!1175344 (= e!668172 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175345 () Bool)

(declare-fun Unit!38717 () Unit!38714)

(assert (=> b!1175345 (= e!668173 Unit!38717)))

(declare-fun lt!529816 () Unit!38714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75931 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38714)

(assert (=> b!1175345 (= lt!529816 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175345 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529815 () Unit!38714)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75931 (_ BitVec 32) (_ BitVec 32)) Unit!38714)

(assert (=> b!1175345 (= lt!529815 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175345 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25720)))

(declare-fun lt!529821 () Unit!38714)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75931 (_ BitVec 64) (_ BitVec 32) List!25723) Unit!38714)

(assert (=> b!1175345 (= lt!529821 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25720))))

(assert (=> b!1175345 false))

(declare-fun mapIsEmpty!46127 () Bool)

(assert (=> mapIsEmpty!46127 mapRes!46127))

(assert (= (and start!99660 res!780137) b!1175333))

(assert (= (and b!1175333 res!780144) b!1175328))

(assert (= (and b!1175328 res!780135) b!1175343))

(assert (= (and b!1175343 res!780140) b!1175335))

(assert (= (and b!1175335 res!780149) b!1175332))

(assert (= (and b!1175332 res!780146) b!1175331))

(assert (= (and b!1175331 res!780141) b!1175341))

(assert (= (and b!1175341 res!780148) b!1175327))

(assert (= (and b!1175327 res!780138) b!1175340))

(assert (= (and b!1175340 res!780145) b!1175336))

(assert (= (and b!1175336 (not res!780147)) b!1175339))

(assert (= (and b!1175339 (not res!780136)) b!1175330))

(assert (= (and b!1175330 (not res!780142)) b!1175329))

(assert (= (and b!1175329 res!780143) b!1175326))

(assert (= (and b!1175326 (not res!780139)) b!1175344))

(assert (= (and b!1175329 c!117026) b!1175345))

(assert (= (and b!1175329 (not c!117026)) b!1175334))

(assert (= (and b!1175337 condMapEmpty!46127) mapIsEmpty!46127))

(assert (= (and b!1175337 (not condMapEmpty!46127)) mapNonEmpty!46127))

(get-info :version)

(assert (= (and mapNonEmpty!46127 ((_ is ValueCellFull!14057) mapValue!46127)) b!1175342))

(assert (= (and b!1175337 ((_ is ValueCellFull!14057) mapDefault!46127)) b!1175338))

(assert (= start!99660 b!1175337))

(declare-fun b_lambda!20141 () Bool)

(assert (=> (not b_lambda!20141) (not b!1175339)))

(declare-fun t!37708 () Bool)

(declare-fun tb!9807 () Bool)

(assert (=> (and start!99660 (= defaultEntry!1004 defaultEntry!1004) t!37708) tb!9807))

(declare-fun result!20189 () Bool)

(assert (=> tb!9807 (= result!20189 tp_is_empty!29533)))

(assert (=> b!1175339 t!37708))

(declare-fun b_and!40877 () Bool)

(assert (= b_and!40875 (and (=> t!37708 result!20189) b_and!40877)))

(declare-fun m!1083471 () Bool)

(assert (=> b!1175326 m!1083471))

(declare-fun m!1083473 () Bool)

(assert (=> b!1175330 m!1083473))

(declare-fun m!1083475 () Bool)

(assert (=> b!1175330 m!1083475))

(declare-fun m!1083477 () Bool)

(assert (=> b!1175330 m!1083477))

(declare-fun m!1083479 () Bool)

(assert (=> b!1175330 m!1083479))

(assert (=> b!1175330 m!1083471))

(declare-fun m!1083481 () Bool)

(assert (=> b!1175330 m!1083481))

(assert (=> b!1175330 m!1083471))

(declare-fun m!1083483 () Bool)

(assert (=> b!1175339 m!1083483))

(declare-fun m!1083485 () Bool)

(assert (=> b!1175339 m!1083485))

(declare-fun m!1083487 () Bool)

(assert (=> b!1175339 m!1083487))

(declare-fun m!1083489 () Bool)

(assert (=> b!1175339 m!1083489))

(declare-fun m!1083491 () Bool)

(assert (=> b!1175327 m!1083491))

(declare-fun m!1083493 () Bool)

(assert (=> b!1175327 m!1083493))

(declare-fun m!1083495 () Bool)

(assert (=> b!1175331 m!1083495))

(declare-fun m!1083497 () Bool)

(assert (=> b!1175335 m!1083497))

(declare-fun m!1083499 () Bool)

(assert (=> b!1175336 m!1083499))

(declare-fun m!1083501 () Bool)

(assert (=> b!1175336 m!1083501))

(declare-fun m!1083503 () Bool)

(assert (=> mapNonEmpty!46127 m!1083503))

(declare-fun m!1083505 () Bool)

(assert (=> b!1175345 m!1083505))

(declare-fun m!1083507 () Bool)

(assert (=> b!1175345 m!1083507))

(declare-fun m!1083509 () Bool)

(assert (=> b!1175345 m!1083509))

(declare-fun m!1083511 () Bool)

(assert (=> b!1175345 m!1083511))

(declare-fun m!1083513 () Bool)

(assert (=> b!1175345 m!1083513))

(declare-fun m!1083515 () Bool)

(assert (=> b!1175344 m!1083515))

(declare-fun m!1083517 () Bool)

(assert (=> b!1175340 m!1083517))

(declare-fun m!1083519 () Bool)

(assert (=> b!1175333 m!1083519))

(declare-fun m!1083521 () Bool)

(assert (=> b!1175343 m!1083521))

(assert (=> b!1175329 m!1083471))

(declare-fun m!1083523 () Bool)

(assert (=> b!1175329 m!1083523))

(assert (=> b!1175329 m!1083523))

(declare-fun m!1083525 () Bool)

(assert (=> b!1175329 m!1083525))

(declare-fun m!1083527 () Bool)

(assert (=> b!1175329 m!1083527))

(declare-fun m!1083529 () Bool)

(assert (=> start!99660 m!1083529))

(declare-fun m!1083531 () Bool)

(assert (=> start!99660 m!1083531))

(declare-fun m!1083533 () Bool)

(assert (=> b!1175341 m!1083533))

(check-sat (not b!1175329) (not b!1175335) (not b!1175340) (not b!1175345) (not b!1175327) (not b_next!25003) (not b!1175343) b_and!40877 (not b!1175333) (not b!1175339) (not b!1175344) (not b_lambda!20141) (not mapNonEmpty!46127) (not b!1175330) tp_is_empty!29533 (not start!99660) (not b!1175336) (not b!1175331))
(check-sat b_and!40877 (not b_next!25003))
