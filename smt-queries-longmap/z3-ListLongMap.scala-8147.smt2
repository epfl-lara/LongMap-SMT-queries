; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99750 () Bool)

(assert start!99750)

(declare-fun b_free!25329 () Bool)

(declare-fun b_next!25329 () Bool)

(assert (=> start!99750 (= b_free!25329 (not b_next!25329))))

(declare-fun tp!88700 () Bool)

(declare-fun b_and!41525 () Bool)

(assert (=> start!99750 (= tp!88700 b_and!41525)))

(declare-fun b!1184485 () Bool)

(declare-fun res!787315 () Bool)

(declare-fun e!673458 () Bool)

(assert (=> b!1184485 (=> (not res!787315) (not e!673458))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184485 (= res!787315 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46616 () Bool)

(declare-fun mapRes!46616 () Bool)

(declare-fun tp!88701 () Bool)

(declare-fun e!673462 () Bool)

(assert (=> mapNonEmpty!46616 (= mapRes!46616 (and tp!88701 e!673462))))

(declare-fun mapKey!46616 () (_ BitVec 32))

(declare-datatypes ((V!44939 0))(
  ( (V!44940 (val!14986 Int)) )
))
(declare-datatypes ((ValueCell!14220 0))(
  ( (ValueCellFull!14220 (v!17624 V!44939)) (EmptyCell!14220) )
))
(declare-datatypes ((array!76517 0))(
  ( (array!76518 (arr!36908 (Array (_ BitVec 32) ValueCell!14220)) (size!37444 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76517)

(declare-fun mapValue!46616 () ValueCell!14220)

(declare-fun mapRest!46616 () (Array (_ BitVec 32) ValueCell!14220))

(assert (=> mapNonEmpty!46616 (= (arr!36908 _values!996) (store mapRest!46616 mapKey!46616 mapValue!46616))))

(declare-fun b!1184487 () Bool)

(declare-fun e!673455 () Bool)

(declare-fun e!673456 () Bool)

(assert (=> b!1184487 (= e!673455 e!673456)))

(declare-fun res!787304 () Bool)

(assert (=> b!1184487 (=> res!787304 e!673456)))

(declare-datatypes ((array!76519 0))(
  ( (array!76520 (arr!36909 (Array (_ BitVec 32) (_ BitVec 64))) (size!37445 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76519)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184487 (= res!787304 (not (validKeyInArray!0 (select (arr!36909 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19216 0))(
  ( (tuple2!19217 (_1!9619 (_ BitVec 64)) (_2!9619 V!44939)) )
))
(declare-datatypes ((List!25956 0))(
  ( (Nil!25953) (Cons!25952 (h!27161 tuple2!19216) (t!38277 List!25956)) )
))
(declare-datatypes ((ListLongMap!17185 0))(
  ( (ListLongMap!17186 (toList!8608 List!25956)) )
))
(declare-fun lt!537137 () ListLongMap!17185)

(declare-fun lt!537140 () ListLongMap!17185)

(assert (=> b!1184487 (= lt!537137 lt!537140)))

(declare-fun lt!537129 () ListLongMap!17185)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1643 (ListLongMap!17185 (_ BitVec 64)) ListLongMap!17185)

(assert (=> b!1184487 (= lt!537140 (-!1643 lt!537129 k0!934))))

(declare-fun zeroValue!944 () V!44939)

(declare-fun lt!537141 () array!76519)

(declare-fun minValue!944 () V!44939)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!537142 () array!76517)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5058 (array!76519 array!76517 (_ BitVec 32) (_ BitVec 32) V!44939 V!44939 (_ BitVec 32) Int) ListLongMap!17185)

(assert (=> b!1184487 (= lt!537137 (getCurrentListMapNoExtraKeys!5058 lt!537141 lt!537142 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184487 (= lt!537129 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39219 0))(
  ( (Unit!39220) )
))
(declare-fun lt!537135 () Unit!39219)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!863 (array!76519 array!76517 (_ BitVec 32) (_ BitVec 32) V!44939 V!44939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39219)

(assert (=> b!1184487 (= lt!537135 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!863 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184488 () Bool)

(declare-fun e!673453 () Unit!39219)

(declare-fun Unit!39221 () Unit!39219)

(assert (=> b!1184488 (= e!673453 Unit!39221)))

(declare-fun lt!537146 () Unit!39219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76519 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39219)

(assert (=> b!1184488 (= lt!537146 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184488 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537134 () Unit!39219)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76519 (_ BitVec 32) (_ BitVec 32)) Unit!39219)

(assert (=> b!1184488 (= lt!537134 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25957 0))(
  ( (Nil!25954) (Cons!25953 (h!27162 (_ BitVec 64)) (t!38278 List!25957)) )
))
(declare-fun arrayNoDuplicates!0 (array!76519 (_ BitVec 32) List!25957) Bool)

(assert (=> b!1184488 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25954)))

(declare-fun lt!537144 () Unit!39219)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76519 (_ BitVec 64) (_ BitVec 32) List!25957) Unit!39219)

(assert (=> b!1184488 (= lt!537144 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25954))))

(assert (=> b!1184488 false))

(declare-fun b!1184489 () Bool)

(declare-fun res!787318 () Bool)

(assert (=> b!1184489 (=> (not res!787318) (not e!673458))))

(assert (=> b!1184489 (= res!787318 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37445 _keys!1208))))))

(declare-fun b!1184490 () Bool)

(declare-fun res!787310 () Bool)

(assert (=> b!1184490 (=> (not res!787310) (not e!673458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76519 (_ BitVec 32)) Bool)

(assert (=> b!1184490 (= res!787310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184491 () Bool)

(declare-fun tp_is_empty!29859 () Bool)

(assert (=> b!1184491 (= e!673462 tp_is_empty!29859)))

(declare-fun b!1184492 () Bool)

(declare-fun e!673452 () Bool)

(declare-fun e!673454 () Bool)

(assert (=> b!1184492 (= e!673452 (and e!673454 mapRes!46616))))

(declare-fun condMapEmpty!46616 () Bool)

(declare-fun mapDefault!46616 () ValueCell!14220)

(assert (=> b!1184492 (= condMapEmpty!46616 (= (arr!36908 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14220)) mapDefault!46616)))))

(declare-fun b!1184493 () Bool)

(declare-fun e!673451 () Bool)

(assert (=> b!1184493 (= e!673458 e!673451)))

(declare-fun res!787317 () Bool)

(assert (=> b!1184493 (=> (not res!787317) (not e!673451))))

(assert (=> b!1184493 (= res!787317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537141 mask!1564))))

(assert (=> b!1184493 (= lt!537141 (array!76520 (store (arr!36909 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37445 _keys!1208)))))

(declare-fun mapIsEmpty!46616 () Bool)

(assert (=> mapIsEmpty!46616 mapRes!46616))

(declare-fun b!1184494 () Bool)

(declare-fun res!787305 () Bool)

(assert (=> b!1184494 (=> (not res!787305) (not e!673458))))

(assert (=> b!1184494 (= res!787305 (validKeyInArray!0 k0!934))))

(declare-fun b!1184495 () Bool)

(declare-fun res!787307 () Bool)

(assert (=> b!1184495 (=> (not res!787307) (not e!673458))))

(assert (=> b!1184495 (= res!787307 (= (select (arr!36909 _keys!1208) i!673) k0!934))))

(declare-fun b!1184496 () Bool)

(declare-fun e!673457 () Bool)

(assert (=> b!1184496 (= e!673457 e!673455)))

(declare-fun res!787312 () Bool)

(assert (=> b!1184496 (=> res!787312 e!673455)))

(assert (=> b!1184496 (= res!787312 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!537143 () ListLongMap!17185)

(assert (=> b!1184496 (= lt!537143 (getCurrentListMapNoExtraKeys!5058 lt!537141 lt!537142 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537136 () V!44939)

(assert (=> b!1184496 (= lt!537142 (array!76518 (store (arr!36908 _values!996) i!673 (ValueCellFull!14220 lt!537136)) (size!37444 _values!996)))))

(declare-fun dynLambda!3009 (Int (_ BitVec 64)) V!44939)

(assert (=> b!1184496 (= lt!537136 (dynLambda!3009 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537130 () ListLongMap!17185)

(assert (=> b!1184496 (= lt!537130 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184486 () Bool)

(declare-fun Unit!39222 () Unit!39219)

(assert (=> b!1184486 (= e!673453 Unit!39222)))

(declare-fun res!787309 () Bool)

(assert (=> start!99750 (=> (not res!787309) (not e!673458))))

(assert (=> start!99750 (= res!787309 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37445 _keys!1208))))))

(assert (=> start!99750 e!673458))

(assert (=> start!99750 tp_is_empty!29859))

(declare-fun array_inv!28170 (array!76519) Bool)

(assert (=> start!99750 (array_inv!28170 _keys!1208)))

(assert (=> start!99750 true))

(assert (=> start!99750 tp!88700))

(declare-fun array_inv!28171 (array!76517) Bool)

(assert (=> start!99750 (and (array_inv!28171 _values!996) e!673452)))

(declare-fun b!1184497 () Bool)

(declare-fun e!673459 () Bool)

(declare-fun e!673461 () Bool)

(assert (=> b!1184497 (= e!673459 e!673461)))

(declare-fun res!787313 () Bool)

(assert (=> b!1184497 (=> res!787313 e!673461)))

(assert (=> b!1184497 (= res!787313 (not (= (select (arr!36909 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184498 () Bool)

(declare-fun res!787314 () Bool)

(assert (=> b!1184498 (=> (not res!787314) (not e!673458))))

(assert (=> b!1184498 (= res!787314 (and (= (size!37444 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37445 _keys!1208) (size!37444 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184499 () Bool)

(declare-fun res!787311 () Bool)

(assert (=> b!1184499 (=> (not res!787311) (not e!673451))))

(assert (=> b!1184499 (= res!787311 (arrayNoDuplicates!0 lt!537141 #b00000000000000000000000000000000 Nil!25954))))

(declare-fun b!1184500 () Bool)

(assert (=> b!1184500 (= e!673461 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184501 () Bool)

(assert (=> b!1184501 (= e!673451 (not e!673457))))

(declare-fun res!787316 () Bool)

(assert (=> b!1184501 (=> res!787316 e!673457)))

(assert (=> b!1184501 (= res!787316 (bvsgt from!1455 i!673))))

(assert (=> b!1184501 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537133 () Unit!39219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76519 (_ BitVec 64) (_ BitVec 32)) Unit!39219)

(assert (=> b!1184501 (= lt!537133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184502 () Bool)

(declare-fun res!787306 () Bool)

(assert (=> b!1184502 (=> (not res!787306) (not e!673458))))

(assert (=> b!1184502 (= res!787306 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25954))))

(declare-fun b!1184503 () Bool)

(assert (=> b!1184503 (= e!673456 true)))

(declare-fun lt!537138 () ListLongMap!17185)

(declare-fun lt!537145 () ListLongMap!17185)

(assert (=> b!1184503 (= (-!1643 lt!537138 k0!934) lt!537145)))

(declare-fun lt!537139 () V!44939)

(declare-fun lt!537147 () Unit!39219)

(declare-fun addRemoveCommutativeForDiffKeys!168 (ListLongMap!17185 (_ BitVec 64) V!44939 (_ BitVec 64)) Unit!39219)

(assert (=> b!1184503 (= lt!537147 (addRemoveCommutativeForDiffKeys!168 lt!537129 (select (arr!36909 _keys!1208) from!1455) lt!537139 k0!934))))

(assert (=> b!1184503 (and (= lt!537130 lt!537138) (= lt!537140 lt!537137))))

(declare-fun lt!537131 () tuple2!19216)

(declare-fun +!3905 (ListLongMap!17185 tuple2!19216) ListLongMap!17185)

(assert (=> b!1184503 (= lt!537138 (+!3905 lt!537129 lt!537131))))

(assert (=> b!1184503 (not (= (select (arr!36909 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537132 () Unit!39219)

(assert (=> b!1184503 (= lt!537132 e!673453)))

(declare-fun c!117117 () Bool)

(assert (=> b!1184503 (= c!117117 (= (select (arr!36909 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184503 e!673459))

(declare-fun res!787308 () Bool)

(assert (=> b!1184503 (=> (not res!787308) (not e!673459))))

(assert (=> b!1184503 (= res!787308 (= lt!537143 lt!537145))))

(assert (=> b!1184503 (= lt!537145 (+!3905 lt!537140 lt!537131))))

(assert (=> b!1184503 (= lt!537131 (tuple2!19217 (select (arr!36909 _keys!1208) from!1455) lt!537139))))

(declare-fun get!18888 (ValueCell!14220 V!44939) V!44939)

(assert (=> b!1184503 (= lt!537139 (get!18888 (select (arr!36908 _values!996) from!1455) lt!537136))))

(declare-fun b!1184504 () Bool)

(assert (=> b!1184504 (= e!673454 tp_is_empty!29859)))

(assert (= (and start!99750 res!787309) b!1184485))

(assert (= (and b!1184485 res!787315) b!1184498))

(assert (= (and b!1184498 res!787314) b!1184490))

(assert (= (and b!1184490 res!787310) b!1184502))

(assert (= (and b!1184502 res!787306) b!1184489))

(assert (= (and b!1184489 res!787318) b!1184494))

(assert (= (and b!1184494 res!787305) b!1184495))

(assert (= (and b!1184495 res!787307) b!1184493))

(assert (= (and b!1184493 res!787317) b!1184499))

(assert (= (and b!1184499 res!787311) b!1184501))

(assert (= (and b!1184501 (not res!787316)) b!1184496))

(assert (= (and b!1184496 (not res!787312)) b!1184487))

(assert (= (and b!1184487 (not res!787304)) b!1184503))

(assert (= (and b!1184503 res!787308) b!1184497))

(assert (= (and b!1184497 (not res!787313)) b!1184500))

(assert (= (and b!1184503 c!117117) b!1184488))

(assert (= (and b!1184503 (not c!117117)) b!1184486))

(assert (= (and b!1184492 condMapEmpty!46616) mapIsEmpty!46616))

(assert (= (and b!1184492 (not condMapEmpty!46616)) mapNonEmpty!46616))

(get-info :version)

(assert (= (and mapNonEmpty!46616 ((_ is ValueCellFull!14220) mapValue!46616)) b!1184491))

(assert (= (and b!1184492 ((_ is ValueCellFull!14220) mapDefault!46616)) b!1184504))

(assert (= start!99750 b!1184492))

(declare-fun b_lambda!20473 () Bool)

(assert (=> (not b_lambda!20473) (not b!1184496)))

(declare-fun t!38276 () Bool)

(declare-fun tb!10141 () Bool)

(assert (=> (and start!99750 (= defaultEntry!1004 defaultEntry!1004) t!38276) tb!10141))

(declare-fun result!20849 () Bool)

(assert (=> tb!10141 (= result!20849 tp_is_empty!29859)))

(assert (=> b!1184496 t!38276))

(declare-fun b_and!41527 () Bool)

(assert (= b_and!41525 (and (=> t!38276 result!20849) b_and!41527)))

(declare-fun m!1092775 () Bool)

(assert (=> b!1184487 m!1092775))

(declare-fun m!1092777 () Bool)

(assert (=> b!1184487 m!1092777))

(declare-fun m!1092779 () Bool)

(assert (=> b!1184487 m!1092779))

(declare-fun m!1092781 () Bool)

(assert (=> b!1184487 m!1092781))

(declare-fun m!1092783 () Bool)

(assert (=> b!1184487 m!1092783))

(declare-fun m!1092785 () Bool)

(assert (=> b!1184487 m!1092785))

(assert (=> b!1184487 m!1092783))

(declare-fun m!1092787 () Bool)

(assert (=> b!1184493 m!1092787))

(declare-fun m!1092789 () Bool)

(assert (=> b!1184493 m!1092789))

(declare-fun m!1092791 () Bool)

(assert (=> b!1184503 m!1092791))

(declare-fun m!1092793 () Bool)

(assert (=> b!1184503 m!1092793))

(assert (=> b!1184503 m!1092791))

(declare-fun m!1092795 () Bool)

(assert (=> b!1184503 m!1092795))

(declare-fun m!1092797 () Bool)

(assert (=> b!1184503 m!1092797))

(assert (=> b!1184503 m!1092783))

(declare-fun m!1092799 () Bool)

(assert (=> b!1184503 m!1092799))

(assert (=> b!1184503 m!1092783))

(declare-fun m!1092801 () Bool)

(assert (=> b!1184503 m!1092801))

(declare-fun m!1092803 () Bool)

(assert (=> b!1184500 m!1092803))

(declare-fun m!1092805 () Bool)

(assert (=> b!1184495 m!1092805))

(assert (=> b!1184497 m!1092783))

(declare-fun m!1092807 () Bool)

(assert (=> b!1184485 m!1092807))

(declare-fun m!1092809 () Bool)

(assert (=> mapNonEmpty!46616 m!1092809))

(declare-fun m!1092811 () Bool)

(assert (=> b!1184499 m!1092811))

(declare-fun m!1092813 () Bool)

(assert (=> b!1184494 m!1092813))

(declare-fun m!1092815 () Bool)

(assert (=> start!99750 m!1092815))

(declare-fun m!1092817 () Bool)

(assert (=> start!99750 m!1092817))

(declare-fun m!1092819 () Bool)

(assert (=> b!1184496 m!1092819))

(declare-fun m!1092821 () Bool)

(assert (=> b!1184496 m!1092821))

(declare-fun m!1092823 () Bool)

(assert (=> b!1184496 m!1092823))

(declare-fun m!1092825 () Bool)

(assert (=> b!1184496 m!1092825))

(declare-fun m!1092827 () Bool)

(assert (=> b!1184490 m!1092827))

(declare-fun m!1092829 () Bool)

(assert (=> b!1184502 m!1092829))

(declare-fun m!1092831 () Bool)

(assert (=> b!1184501 m!1092831))

(declare-fun m!1092833 () Bool)

(assert (=> b!1184501 m!1092833))

(declare-fun m!1092835 () Bool)

(assert (=> b!1184488 m!1092835))

(declare-fun m!1092837 () Bool)

(assert (=> b!1184488 m!1092837))

(declare-fun m!1092839 () Bool)

(assert (=> b!1184488 m!1092839))

(declare-fun m!1092841 () Bool)

(assert (=> b!1184488 m!1092841))

(declare-fun m!1092843 () Bool)

(assert (=> b!1184488 m!1092843))

(check-sat (not b_lambda!20473) (not b!1184500) (not b!1184502) (not b!1184503) (not b_next!25329) (not b!1184494) (not b!1184499) (not b!1184501) (not b!1184485) (not b!1184488) (not mapNonEmpty!46616) (not b!1184490) (not start!99750) (not b!1184496) (not b!1184487) b_and!41527 tp_is_empty!29859 (not b!1184493))
(check-sat b_and!41527 (not b_next!25329))
