; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99906 () Bool)

(assert start!99906)

(declare-fun b_free!25249 () Bool)

(declare-fun b_next!25249 () Bool)

(assert (=> start!99906 (= b_free!25249 (not b_next!25249))))

(declare-fun tp!88461 () Bool)

(declare-fun b_and!41367 () Bool)

(assert (=> start!99906 (= tp!88461 b_and!41367)))

(declare-fun b!1183294 () Bool)

(declare-datatypes ((Unit!39093 0))(
  ( (Unit!39094) )
))
(declare-fun e!672851 () Unit!39093)

(declare-fun Unit!39095 () Unit!39093)

(assert (=> b!1183294 (= e!672851 Unit!39095)))

(declare-datatypes ((array!76409 0))(
  ( (array!76410 (arr!36848 (Array (_ BitVec 32) (_ BitVec 64))) (size!37385 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76409)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535341 () Unit!39093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76409 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39093)

(assert (=> b!1183294 (= lt!535341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183294 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535334 () Unit!39093)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76409 (_ BitVec 32) (_ BitVec 32)) Unit!39093)

(assert (=> b!1183294 (= lt!535334 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25926 0))(
  ( (Nil!25923) (Cons!25922 (h!27140 (_ BitVec 64)) (t!38159 List!25926)) )
))
(declare-fun arrayNoDuplicates!0 (array!76409 (_ BitVec 32) List!25926) Bool)

(assert (=> b!1183294 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25923)))

(declare-fun lt!535339 () Unit!39093)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76409 (_ BitVec 64) (_ BitVec 32) List!25926) Unit!39093)

(assert (=> b!1183294 (= lt!535339 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25923))))

(assert (=> b!1183294 false))

(declare-fun b!1183296 () Bool)

(declare-fun e!672854 () Bool)

(declare-fun e!672843 () Bool)

(declare-fun mapRes!46496 () Bool)

(assert (=> b!1183296 (= e!672854 (and e!672843 mapRes!46496))))

(declare-fun condMapEmpty!46496 () Bool)

(declare-datatypes ((V!44833 0))(
  ( (V!44834 (val!14946 Int)) )
))
(declare-datatypes ((ValueCell!14180 0))(
  ( (ValueCellFull!14180 (v!17580 V!44833)) (EmptyCell!14180) )
))
(declare-datatypes ((array!76411 0))(
  ( (array!76412 (arr!36849 (Array (_ BitVec 32) ValueCell!14180)) (size!37386 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76411)

(declare-fun mapDefault!46496 () ValueCell!14180)

(assert (=> b!1183296 (= condMapEmpty!46496 (= (arr!36849 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14180)) mapDefault!46496)))))

(declare-fun b!1183297 () Bool)

(declare-fun res!786022 () Bool)

(declare-fun e!672848 () Bool)

(assert (=> b!1183297 (=> (not res!786022) (not e!672848))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76409 (_ BitVec 32)) Bool)

(assert (=> b!1183297 (= res!786022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183298 () Bool)

(declare-fun res!786013 () Bool)

(assert (=> b!1183298 (=> (not res!786013) (not e!672848))))

(assert (=> b!1183298 (= res!786013 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25923))))

(declare-fun b!1183299 () Bool)

(declare-fun res!786023 () Bool)

(assert (=> b!1183299 (=> (not res!786023) (not e!672848))))

(assert (=> b!1183299 (= res!786023 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37385 _keys!1208))))))

(declare-fun mapIsEmpty!46496 () Bool)

(assert (=> mapIsEmpty!46496 mapRes!46496))

(declare-fun b!1183300 () Bool)

(declare-fun res!786024 () Bool)

(assert (=> b!1183300 (=> (not res!786024) (not e!672848))))

(assert (=> b!1183300 (= res!786024 (= (select (arr!36848 _keys!1208) i!673) k0!934))))

(declare-fun b!1183301 () Bool)

(declare-fun e!672853 () Bool)

(declare-fun e!672846 () Bool)

(assert (=> b!1183301 (= e!672853 e!672846)))

(declare-fun res!786016 () Bool)

(assert (=> b!1183301 (=> res!786016 e!672846)))

(assert (=> b!1183301 (= res!786016 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44833)

(declare-fun lt!535333 () array!76409)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!535340 () array!76411)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19196 0))(
  ( (tuple2!19197 (_1!9609 (_ BitVec 64)) (_2!9609 V!44833)) )
))
(declare-datatypes ((List!25927 0))(
  ( (Nil!25924) (Cons!25923 (h!27141 tuple2!19196) (t!38160 List!25927)) )
))
(declare-datatypes ((ListLongMap!17173 0))(
  ( (ListLongMap!17174 (toList!8602 List!25927)) )
))
(declare-fun lt!535350 () ListLongMap!17173)

(declare-fun minValue!944 () V!44833)

(declare-fun getCurrentListMapNoExtraKeys!5075 (array!76409 array!76411 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) Int) ListLongMap!17173)

(assert (=> b!1183301 (= lt!535350 (getCurrentListMapNoExtraKeys!5075 lt!535333 lt!535340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535348 () V!44833)

(assert (=> b!1183301 (= lt!535340 (array!76412 (store (arr!36849 _values!996) i!673 (ValueCellFull!14180 lt!535348)) (size!37386 _values!996)))))

(declare-fun dynLambda!3041 (Int (_ BitVec 64)) V!44833)

(assert (=> b!1183301 (= lt!535348 (dynLambda!3041 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535344 () ListLongMap!17173)

(assert (=> b!1183301 (= lt!535344 (getCurrentListMapNoExtraKeys!5075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183302 () Bool)

(declare-fun res!786021 () Bool)

(assert (=> b!1183302 (=> (not res!786021) (not e!672848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183302 (= res!786021 (validKeyInArray!0 k0!934))))

(declare-fun b!1183303 () Bool)

(declare-fun e!672852 () Bool)

(declare-fun e!672845 () Bool)

(assert (=> b!1183303 (= e!672852 e!672845)))

(declare-fun res!786020 () Bool)

(assert (=> b!1183303 (=> res!786020 e!672845)))

(assert (=> b!1183303 (= res!786020 (not (= (select (arr!36848 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183304 () Bool)

(declare-fun e!672850 () Bool)

(declare-fun tp_is_empty!29779 () Bool)

(assert (=> b!1183304 (= e!672850 tp_is_empty!29779)))

(declare-fun b!1183305 () Bool)

(assert (=> b!1183305 (= e!672845 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183306 () Bool)

(declare-fun Unit!39096 () Unit!39093)

(assert (=> b!1183306 (= e!672851 Unit!39096)))

(declare-fun res!786014 () Bool)

(assert (=> start!99906 (=> (not res!786014) (not e!672848))))

(assert (=> start!99906 (= res!786014 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37385 _keys!1208))))))

(assert (=> start!99906 e!672848))

(assert (=> start!99906 tp_is_empty!29779))

(declare-fun array_inv!28204 (array!76409) Bool)

(assert (=> start!99906 (array_inv!28204 _keys!1208)))

(assert (=> start!99906 true))

(assert (=> start!99906 tp!88461))

(declare-fun array_inv!28205 (array!76411) Bool)

(assert (=> start!99906 (and (array_inv!28205 _values!996) e!672854)))

(declare-fun b!1183295 () Bool)

(declare-fun res!786012 () Bool)

(assert (=> b!1183295 (=> (not res!786012) (not e!672848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183295 (= res!786012 (validMask!0 mask!1564))))

(declare-fun b!1183307 () Bool)

(declare-fun e!672847 () Bool)

(assert (=> b!1183307 (= e!672847 (not e!672853))))

(declare-fun res!786017 () Bool)

(assert (=> b!1183307 (=> res!786017 e!672853)))

(assert (=> b!1183307 (= res!786017 (bvsgt from!1455 i!673))))

(assert (=> b!1183307 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535351 () Unit!39093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76409 (_ BitVec 64) (_ BitVec 32)) Unit!39093)

(assert (=> b!1183307 (= lt!535351 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183308 () Bool)

(assert (=> b!1183308 (= e!672848 e!672847)))

(declare-fun res!786025 () Bool)

(assert (=> b!1183308 (=> (not res!786025) (not e!672847))))

(assert (=> b!1183308 (= res!786025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535333 mask!1564))))

(assert (=> b!1183308 (= lt!535333 (array!76410 (store (arr!36848 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37385 _keys!1208)))))

(declare-fun b!1183309 () Bool)

(declare-fun e!672849 () Bool)

(assert (=> b!1183309 (= e!672849 true)))

(declare-fun lt!535347 () ListLongMap!17173)

(declare-fun lt!535346 () ListLongMap!17173)

(declare-fun -!1625 (ListLongMap!17173 (_ BitVec 64)) ListLongMap!17173)

(assert (=> b!1183309 (= (-!1625 lt!535347 k0!934) lt!535346)))

(declare-fun lt!535343 () ListLongMap!17173)

(declare-fun lt!535349 () Unit!39093)

(declare-fun lt!535337 () V!44833)

(declare-fun addRemoveCommutativeForDiffKeys!140 (ListLongMap!17173 (_ BitVec 64) V!44833 (_ BitVec 64)) Unit!39093)

(assert (=> b!1183309 (= lt!535349 (addRemoveCommutativeForDiffKeys!140 lt!535343 (select (arr!36848 _keys!1208) from!1455) lt!535337 k0!934))))

(declare-fun lt!535335 () ListLongMap!17173)

(declare-fun lt!535338 () ListLongMap!17173)

(assert (=> b!1183309 (and (= lt!535344 lt!535347) (= lt!535335 lt!535338))))

(declare-fun lt!535342 () tuple2!19196)

(declare-fun +!3924 (ListLongMap!17173 tuple2!19196) ListLongMap!17173)

(assert (=> b!1183309 (= lt!535347 (+!3924 lt!535343 lt!535342))))

(assert (=> b!1183309 (not (= (select (arr!36848 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535345 () Unit!39093)

(assert (=> b!1183309 (= lt!535345 e!672851)))

(declare-fun c!117395 () Bool)

(assert (=> b!1183309 (= c!117395 (= (select (arr!36848 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183309 e!672852))

(declare-fun res!786026 () Bool)

(assert (=> b!1183309 (=> (not res!786026) (not e!672852))))

(assert (=> b!1183309 (= res!786026 (= lt!535350 lt!535346))))

(assert (=> b!1183309 (= lt!535346 (+!3924 lt!535335 lt!535342))))

(assert (=> b!1183309 (= lt!535342 (tuple2!19197 (select (arr!36848 _keys!1208) from!1455) lt!535337))))

(declare-fun get!18885 (ValueCell!14180 V!44833) V!44833)

(assert (=> b!1183309 (= lt!535337 (get!18885 (select (arr!36849 _values!996) from!1455) lt!535348))))

(declare-fun b!1183310 () Bool)

(assert (=> b!1183310 (= e!672846 e!672849)))

(declare-fun res!786015 () Bool)

(assert (=> b!1183310 (=> res!786015 e!672849)))

(assert (=> b!1183310 (= res!786015 (not (validKeyInArray!0 (select (arr!36848 _keys!1208) from!1455))))))

(assert (=> b!1183310 (= lt!535338 lt!535335)))

(assert (=> b!1183310 (= lt!535335 (-!1625 lt!535343 k0!934))))

(assert (=> b!1183310 (= lt!535338 (getCurrentListMapNoExtraKeys!5075 lt!535333 lt!535340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183310 (= lt!535343 (getCurrentListMapNoExtraKeys!5075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535336 () Unit!39093)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!849 (array!76409 array!76411 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39093)

(assert (=> b!1183310 (= lt!535336 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183311 () Bool)

(declare-fun res!786019 () Bool)

(assert (=> b!1183311 (=> (not res!786019) (not e!672847))))

(assert (=> b!1183311 (= res!786019 (arrayNoDuplicates!0 lt!535333 #b00000000000000000000000000000000 Nil!25923))))

(declare-fun b!1183312 () Bool)

(declare-fun res!786018 () Bool)

(assert (=> b!1183312 (=> (not res!786018) (not e!672848))))

(assert (=> b!1183312 (= res!786018 (and (= (size!37386 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37385 _keys!1208) (size!37386 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46496 () Bool)

(declare-fun tp!88460 () Bool)

(assert (=> mapNonEmpty!46496 (= mapRes!46496 (and tp!88460 e!672850))))

(declare-fun mapRest!46496 () (Array (_ BitVec 32) ValueCell!14180))

(declare-fun mapKey!46496 () (_ BitVec 32))

(declare-fun mapValue!46496 () ValueCell!14180)

(assert (=> mapNonEmpty!46496 (= (arr!36849 _values!996) (store mapRest!46496 mapKey!46496 mapValue!46496))))

(declare-fun b!1183313 () Bool)

(assert (=> b!1183313 (= e!672843 tp_is_empty!29779)))

(assert (= (and start!99906 res!786014) b!1183295))

(assert (= (and b!1183295 res!786012) b!1183312))

(assert (= (and b!1183312 res!786018) b!1183297))

(assert (= (and b!1183297 res!786022) b!1183298))

(assert (= (and b!1183298 res!786013) b!1183299))

(assert (= (and b!1183299 res!786023) b!1183302))

(assert (= (and b!1183302 res!786021) b!1183300))

(assert (= (and b!1183300 res!786024) b!1183308))

(assert (= (and b!1183308 res!786025) b!1183311))

(assert (= (and b!1183311 res!786019) b!1183307))

(assert (= (and b!1183307 (not res!786017)) b!1183301))

(assert (= (and b!1183301 (not res!786016)) b!1183310))

(assert (= (and b!1183310 (not res!786015)) b!1183309))

(assert (= (and b!1183309 res!786026) b!1183303))

(assert (= (and b!1183303 (not res!786020)) b!1183305))

(assert (= (and b!1183309 c!117395) b!1183294))

(assert (= (and b!1183309 (not c!117395)) b!1183306))

(assert (= (and b!1183296 condMapEmpty!46496) mapIsEmpty!46496))

(assert (= (and b!1183296 (not condMapEmpty!46496)) mapNonEmpty!46496))

(get-info :version)

(assert (= (and mapNonEmpty!46496 ((_ is ValueCellFull!14180) mapValue!46496)) b!1183304))

(assert (= (and b!1183296 ((_ is ValueCellFull!14180) mapDefault!46496)) b!1183313))

(assert (= start!99906 b!1183296))

(declare-fun b_lambda!20387 () Bool)

(assert (=> (not b_lambda!20387) (not b!1183301)))

(declare-fun t!38158 () Bool)

(declare-fun tb!10053 () Bool)

(assert (=> (and start!99906 (= defaultEntry!1004 defaultEntry!1004) t!38158) tb!10053))

(declare-fun result!20681 () Bool)

(assert (=> tb!10053 (= result!20681 tp_is_empty!29779)))

(assert (=> b!1183301 t!38158))

(declare-fun b_and!41369 () Bool)

(assert (= b_and!41367 (and (=> t!38158 result!20681) b_and!41369)))

(declare-fun m!1091547 () Bool)

(assert (=> b!1183294 m!1091547))

(declare-fun m!1091549 () Bool)

(assert (=> b!1183294 m!1091549))

(declare-fun m!1091551 () Bool)

(assert (=> b!1183294 m!1091551))

(declare-fun m!1091553 () Bool)

(assert (=> b!1183294 m!1091553))

(declare-fun m!1091555 () Bool)

(assert (=> b!1183294 m!1091555))

(declare-fun m!1091557 () Bool)

(assert (=> b!1183303 m!1091557))

(declare-fun m!1091559 () Bool)

(assert (=> b!1183309 m!1091559))

(assert (=> b!1183309 m!1091557))

(declare-fun m!1091561 () Bool)

(assert (=> b!1183309 m!1091561))

(declare-fun m!1091563 () Bool)

(assert (=> b!1183309 m!1091563))

(declare-fun m!1091565 () Bool)

(assert (=> b!1183309 m!1091565))

(assert (=> b!1183309 m!1091559))

(declare-fun m!1091567 () Bool)

(assert (=> b!1183309 m!1091567))

(declare-fun m!1091569 () Bool)

(assert (=> b!1183309 m!1091569))

(assert (=> b!1183309 m!1091557))

(declare-fun m!1091571 () Bool)

(assert (=> start!99906 m!1091571))

(declare-fun m!1091573 () Bool)

(assert (=> start!99906 m!1091573))

(declare-fun m!1091575 () Bool)

(assert (=> b!1183298 m!1091575))

(declare-fun m!1091577 () Bool)

(assert (=> b!1183311 m!1091577))

(declare-fun m!1091579 () Bool)

(assert (=> b!1183302 m!1091579))

(declare-fun m!1091581 () Bool)

(assert (=> mapNonEmpty!46496 m!1091581))

(declare-fun m!1091583 () Bool)

(assert (=> b!1183301 m!1091583))

(declare-fun m!1091585 () Bool)

(assert (=> b!1183301 m!1091585))

(declare-fun m!1091587 () Bool)

(assert (=> b!1183301 m!1091587))

(declare-fun m!1091589 () Bool)

(assert (=> b!1183301 m!1091589))

(declare-fun m!1091591 () Bool)

(assert (=> b!1183305 m!1091591))

(declare-fun m!1091593 () Bool)

(assert (=> b!1183307 m!1091593))

(declare-fun m!1091595 () Bool)

(assert (=> b!1183307 m!1091595))

(declare-fun m!1091597 () Bool)

(assert (=> b!1183297 m!1091597))

(declare-fun m!1091599 () Bool)

(assert (=> b!1183308 m!1091599))

(declare-fun m!1091601 () Bool)

(assert (=> b!1183308 m!1091601))

(declare-fun m!1091603 () Bool)

(assert (=> b!1183295 m!1091603))

(declare-fun m!1091605 () Bool)

(assert (=> b!1183310 m!1091605))

(declare-fun m!1091607 () Bool)

(assert (=> b!1183310 m!1091607))

(declare-fun m!1091609 () Bool)

(assert (=> b!1183310 m!1091609))

(declare-fun m!1091611 () Bool)

(assert (=> b!1183310 m!1091611))

(assert (=> b!1183310 m!1091557))

(declare-fun m!1091613 () Bool)

(assert (=> b!1183310 m!1091613))

(assert (=> b!1183310 m!1091557))

(declare-fun m!1091615 () Bool)

(assert (=> b!1183300 m!1091615))

(check-sat (not b!1183305) (not b_next!25249) tp_is_empty!29779 (not b!1183308) (not b!1183298) b_and!41369 (not b!1183310) (not b!1183309) (not b!1183301) (not start!99906) (not b!1183294) (not b!1183302) (not b!1183297) (not b!1183295) (not b!1183307) (not b_lambda!20387) (not mapNonEmpty!46496) (not b!1183311))
(check-sat b_and!41369 (not b_next!25249))
