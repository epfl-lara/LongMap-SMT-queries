; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99948 () Bool)

(assert start!99948)

(declare-fun b_free!25291 () Bool)

(declare-fun b_next!25291 () Bool)

(assert (=> start!99948 (= b_free!25291 (not b_next!25291))))

(declare-fun tp!88586 () Bool)

(declare-fun b_and!41451 () Bool)

(assert (=> start!99948 (= tp!88586 b_and!41451)))

(declare-fun b!1184596 () Bool)

(declare-fun e!673610 () Bool)

(declare-fun e!673604 () Bool)

(assert (=> b!1184596 (= e!673610 e!673604)))

(declare-fun res!786963 () Bool)

(assert (=> b!1184596 (=> res!786963 e!673604)))

(declare-datatypes ((array!76489 0))(
  ( (array!76490 (arr!36888 (Array (_ BitVec 32) (_ BitVec 64))) (size!37425 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76489)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184596 (= res!786963 (not (= (select (arr!36888 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184597 () Bool)

(declare-fun e!673599 () Bool)

(declare-fun e!673605 () Bool)

(assert (=> b!1184597 (= e!673599 e!673605)))

(declare-fun res!786969 () Bool)

(assert (=> b!1184597 (=> res!786969 e!673605)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184597 (= res!786969 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44889 0))(
  ( (V!44890 (val!14967 Int)) )
))
(declare-fun zeroValue!944 () V!44889)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19230 0))(
  ( (tuple2!19231 (_1!9626 (_ BitVec 64)) (_2!9626 V!44889)) )
))
(declare-datatypes ((List!25962 0))(
  ( (Nil!25959) (Cons!25958 (h!27176 tuple2!19230) (t!38237 List!25962)) )
))
(declare-datatypes ((ListLongMap!17207 0))(
  ( (ListLongMap!17208 (toList!8619 List!25962)) )
))
(declare-fun lt!536539 () ListLongMap!17207)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536535 () array!76489)

(declare-fun minValue!944 () V!44889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14201 0))(
  ( (ValueCellFull!14201 (v!17601 V!44889)) (EmptyCell!14201) )
))
(declare-datatypes ((array!76491 0))(
  ( (array!76492 (arr!36889 (Array (_ BitVec 32) ValueCell!14201)) (size!37426 (_ BitVec 32))) )
))
(declare-fun lt!536533 () array!76491)

(declare-fun getCurrentListMapNoExtraKeys!5091 (array!76489 array!76491 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) Int) ListLongMap!17207)

(assert (=> b!1184597 (= lt!536539 (getCurrentListMapNoExtraKeys!5091 lt!536535 lt!536533 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536538 () V!44889)

(declare-fun _values!996 () array!76491)

(assert (=> b!1184597 (= lt!536533 (array!76492 (store (arr!36889 _values!996) i!673 (ValueCellFull!14201 lt!536538)) (size!37426 _values!996)))))

(declare-fun dynLambda!3055 (Int (_ BitVec 64)) V!44889)

(assert (=> b!1184597 (= lt!536538 (dynLambda!3055 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536532 () ListLongMap!17207)

(assert (=> b!1184597 (= lt!536532 (getCurrentListMapNoExtraKeys!5091 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184598 () Bool)

(declare-datatypes ((Unit!39164 0))(
  ( (Unit!39165) )
))
(declare-fun e!673600 () Unit!39164)

(declare-fun Unit!39166 () Unit!39164)

(assert (=> b!1184598 (= e!673600 Unit!39166)))

(declare-fun mapIsEmpty!46559 () Bool)

(declare-fun mapRes!46559 () Bool)

(assert (=> mapIsEmpty!46559 mapRes!46559))

(declare-fun b!1184599 () Bool)

(declare-fun e!673606 () Bool)

(declare-fun tp_is_empty!29821 () Bool)

(assert (=> b!1184599 (= e!673606 tp_is_empty!29821)))

(declare-fun b!1184600 () Bool)

(declare-fun res!786957 () Bool)

(declare-fun e!673607 () Bool)

(assert (=> b!1184600 (=> (not res!786957) (not e!673607))))

(assert (=> b!1184600 (= res!786957 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37425 _keys!1208))))))

(declare-fun b!1184601 () Bool)

(declare-fun arrayContainsKey!0 (array!76489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184601 (= e!673604 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184602 () Bool)

(declare-fun e!673601 () Bool)

(assert (=> b!1184602 (= e!673605 e!673601)))

(declare-fun res!786962 () Bool)

(assert (=> b!1184602 (=> res!786962 e!673601)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184602 (= res!786962 (not (validKeyInArray!0 (select (arr!36888 _keys!1208) from!1455))))))

(declare-fun lt!536542 () ListLongMap!17207)

(declare-fun lt!536536 () ListLongMap!17207)

(assert (=> b!1184602 (= lt!536542 lt!536536)))

(declare-fun lt!536548 () ListLongMap!17207)

(declare-fun -!1640 (ListLongMap!17207 (_ BitVec 64)) ListLongMap!17207)

(assert (=> b!1184602 (= lt!536536 (-!1640 lt!536548 k0!934))))

(assert (=> b!1184602 (= lt!536542 (getCurrentListMapNoExtraKeys!5091 lt!536535 lt!536533 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184602 (= lt!536548 (getCurrentListMapNoExtraKeys!5091 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536537 () Unit!39164)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!863 (array!76489 array!76491 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39164)

(assert (=> b!1184602 (= lt!536537 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!863 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184603 () Bool)

(declare-fun e!673603 () Bool)

(assert (=> b!1184603 (= e!673603 (and e!673606 mapRes!46559))))

(declare-fun condMapEmpty!46559 () Bool)

(declare-fun mapDefault!46559 () ValueCell!14201)

(assert (=> b!1184603 (= condMapEmpty!46559 (= (arr!36889 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14201)) mapDefault!46559)))))

(declare-fun b!1184604 () Bool)

(declare-fun res!786965 () Bool)

(assert (=> b!1184604 (=> (not res!786965) (not e!673607))))

(assert (=> b!1184604 (= res!786965 (validKeyInArray!0 k0!934))))

(declare-fun b!1184606 () Bool)

(declare-fun e!673609 () Bool)

(assert (=> b!1184606 (= e!673609 tp_is_empty!29821)))

(declare-fun b!1184607 () Bool)

(declare-fun res!786970 () Bool)

(assert (=> b!1184607 (=> (not res!786970) (not e!673607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76489 (_ BitVec 32)) Bool)

(assert (=> b!1184607 (= res!786970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184608 () Bool)

(declare-fun res!786961 () Bool)

(assert (=> b!1184608 (=> (not res!786961) (not e!673607))))

(declare-datatypes ((List!25963 0))(
  ( (Nil!25960) (Cons!25959 (h!27177 (_ BitVec 64)) (t!38238 List!25963)) )
))
(declare-fun arrayNoDuplicates!0 (array!76489 (_ BitVec 32) List!25963) Bool)

(assert (=> b!1184608 (= res!786961 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25960))))

(declare-fun mapNonEmpty!46559 () Bool)

(declare-fun tp!88587 () Bool)

(assert (=> mapNonEmpty!46559 (= mapRes!46559 (and tp!88587 e!673609))))

(declare-fun mapValue!46559 () ValueCell!14201)

(declare-fun mapRest!46559 () (Array (_ BitVec 32) ValueCell!14201))

(declare-fun mapKey!46559 () (_ BitVec 32))

(assert (=> mapNonEmpty!46559 (= (arr!36889 _values!996) (store mapRest!46559 mapKey!46559 mapValue!46559))))

(declare-fun b!1184609 () Bool)

(assert (=> b!1184609 (= e!673601 true)))

(declare-fun lt!536530 () ListLongMap!17207)

(declare-fun lt!536547 () ListLongMap!17207)

(assert (=> b!1184609 (= (-!1640 lt!536530 k0!934) lt!536547)))

(declare-fun lt!536546 () V!44889)

(declare-fun lt!536544 () Unit!39164)

(declare-fun addRemoveCommutativeForDiffKeys!154 (ListLongMap!17207 (_ BitVec 64) V!44889 (_ BitVec 64)) Unit!39164)

(assert (=> b!1184609 (= lt!536544 (addRemoveCommutativeForDiffKeys!154 lt!536548 (select (arr!36888 _keys!1208) from!1455) lt!536546 k0!934))))

(assert (=> b!1184609 (and (= lt!536532 lt!536530) (= lt!536536 lt!536542))))

(declare-fun lt!536534 () tuple2!19230)

(declare-fun +!3938 (ListLongMap!17207 tuple2!19230) ListLongMap!17207)

(assert (=> b!1184609 (= lt!536530 (+!3938 lt!536548 lt!536534))))

(assert (=> b!1184609 (not (= (select (arr!36888 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536540 () Unit!39164)

(assert (=> b!1184609 (= lt!536540 e!673600)))

(declare-fun c!117458 () Bool)

(assert (=> b!1184609 (= c!117458 (= (select (arr!36888 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184609 e!673610))

(declare-fun res!786959 () Bool)

(assert (=> b!1184609 (=> (not res!786959) (not e!673610))))

(assert (=> b!1184609 (= res!786959 (= lt!536539 lt!536547))))

(assert (=> b!1184609 (= lt!536547 (+!3938 lt!536536 lt!536534))))

(assert (=> b!1184609 (= lt!536534 (tuple2!19231 (select (arr!36888 _keys!1208) from!1455) lt!536546))))

(declare-fun get!18913 (ValueCell!14201 V!44889) V!44889)

(assert (=> b!1184609 (= lt!536546 (get!18913 (select (arr!36889 _values!996) from!1455) lt!536538))))

(declare-fun b!1184610 () Bool)

(declare-fun res!786968 () Bool)

(assert (=> b!1184610 (=> (not res!786968) (not e!673607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184610 (= res!786968 (validMask!0 mask!1564))))

(declare-fun b!1184611 () Bool)

(declare-fun e!673602 () Bool)

(assert (=> b!1184611 (= e!673607 e!673602)))

(declare-fun res!786958 () Bool)

(assert (=> b!1184611 (=> (not res!786958) (not e!673602))))

(assert (=> b!1184611 (= res!786958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536535 mask!1564))))

(assert (=> b!1184611 (= lt!536535 (array!76490 (store (arr!36888 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37425 _keys!1208)))))

(declare-fun b!1184612 () Bool)

(declare-fun Unit!39167 () Unit!39164)

(assert (=> b!1184612 (= e!673600 Unit!39167)))

(declare-fun lt!536541 () Unit!39164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76489 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39164)

(assert (=> b!1184612 (= lt!536541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184612 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536531 () Unit!39164)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76489 (_ BitVec 32) (_ BitVec 32)) Unit!39164)

(assert (=> b!1184612 (= lt!536531 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184612 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25960)))

(declare-fun lt!536545 () Unit!39164)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76489 (_ BitVec 64) (_ BitVec 32) List!25963) Unit!39164)

(assert (=> b!1184612 (= lt!536545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25960))))

(assert (=> b!1184612 false))

(declare-fun b!1184613 () Bool)

(declare-fun res!786964 () Bool)

(assert (=> b!1184613 (=> (not res!786964) (not e!673607))))

(assert (=> b!1184613 (= res!786964 (= (select (arr!36888 _keys!1208) i!673) k0!934))))

(declare-fun b!1184614 () Bool)

(declare-fun res!786967 () Bool)

(assert (=> b!1184614 (=> (not res!786967) (not e!673602))))

(assert (=> b!1184614 (= res!786967 (arrayNoDuplicates!0 lt!536535 #b00000000000000000000000000000000 Nil!25960))))

(declare-fun b!1184615 () Bool)

(declare-fun res!786971 () Bool)

(assert (=> b!1184615 (=> (not res!786971) (not e!673607))))

(assert (=> b!1184615 (= res!786971 (and (= (size!37426 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37425 _keys!1208) (size!37426 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184605 () Bool)

(assert (=> b!1184605 (= e!673602 (not e!673599))))

(declare-fun res!786966 () Bool)

(assert (=> b!1184605 (=> res!786966 e!673599)))

(assert (=> b!1184605 (= res!786966 (bvsgt from!1455 i!673))))

(assert (=> b!1184605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536543 () Unit!39164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76489 (_ BitVec 64) (_ BitVec 32)) Unit!39164)

(assert (=> b!1184605 (= lt!536543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!786960 () Bool)

(assert (=> start!99948 (=> (not res!786960) (not e!673607))))

(assert (=> start!99948 (= res!786960 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37425 _keys!1208))))))

(assert (=> start!99948 e!673607))

(assert (=> start!99948 tp_is_empty!29821))

(declare-fun array_inv!28234 (array!76489) Bool)

(assert (=> start!99948 (array_inv!28234 _keys!1208)))

(assert (=> start!99948 true))

(assert (=> start!99948 tp!88586))

(declare-fun array_inv!28235 (array!76491) Bool)

(assert (=> start!99948 (and (array_inv!28235 _values!996) e!673603)))

(assert (= (and start!99948 res!786960) b!1184610))

(assert (= (and b!1184610 res!786968) b!1184615))

(assert (= (and b!1184615 res!786971) b!1184607))

(assert (= (and b!1184607 res!786970) b!1184608))

(assert (= (and b!1184608 res!786961) b!1184600))

(assert (= (and b!1184600 res!786957) b!1184604))

(assert (= (and b!1184604 res!786965) b!1184613))

(assert (= (and b!1184613 res!786964) b!1184611))

(assert (= (and b!1184611 res!786958) b!1184614))

(assert (= (and b!1184614 res!786967) b!1184605))

(assert (= (and b!1184605 (not res!786966)) b!1184597))

(assert (= (and b!1184597 (not res!786969)) b!1184602))

(assert (= (and b!1184602 (not res!786962)) b!1184609))

(assert (= (and b!1184609 res!786959) b!1184596))

(assert (= (and b!1184596 (not res!786963)) b!1184601))

(assert (= (and b!1184609 c!117458) b!1184612))

(assert (= (and b!1184609 (not c!117458)) b!1184598))

(assert (= (and b!1184603 condMapEmpty!46559) mapIsEmpty!46559))

(assert (= (and b!1184603 (not condMapEmpty!46559)) mapNonEmpty!46559))

(get-info :version)

(assert (= (and mapNonEmpty!46559 ((_ is ValueCellFull!14201) mapValue!46559)) b!1184606))

(assert (= (and b!1184603 ((_ is ValueCellFull!14201) mapDefault!46559)) b!1184599))

(assert (= start!99948 b!1184603))

(declare-fun b_lambda!20429 () Bool)

(assert (=> (not b_lambda!20429) (not b!1184597)))

(declare-fun t!38236 () Bool)

(declare-fun tb!10095 () Bool)

(assert (=> (and start!99948 (= defaultEntry!1004 defaultEntry!1004) t!38236) tb!10095))

(declare-fun result!20765 () Bool)

(assert (=> tb!10095 (= result!20765 tp_is_empty!29821)))

(assert (=> b!1184597 t!38236))

(declare-fun b_and!41453 () Bool)

(assert (= b_and!41451 (and (=> t!38236 result!20765) b_and!41453)))

(declare-fun m!1093017 () Bool)

(assert (=> b!1184607 m!1093017))

(declare-fun m!1093019 () Bool)

(assert (=> b!1184597 m!1093019))

(declare-fun m!1093021 () Bool)

(assert (=> b!1184597 m!1093021))

(declare-fun m!1093023 () Bool)

(assert (=> b!1184597 m!1093023))

(declare-fun m!1093025 () Bool)

(assert (=> b!1184597 m!1093025))

(declare-fun m!1093027 () Bool)

(assert (=> b!1184609 m!1093027))

(declare-fun m!1093029 () Bool)

(assert (=> b!1184609 m!1093029))

(declare-fun m!1093031 () Bool)

(assert (=> b!1184609 m!1093031))

(declare-fun m!1093033 () Bool)

(assert (=> b!1184609 m!1093033))

(assert (=> b!1184609 m!1093027))

(declare-fun m!1093035 () Bool)

(assert (=> b!1184609 m!1093035))

(declare-fun m!1093037 () Bool)

(assert (=> b!1184609 m!1093037))

(assert (=> b!1184609 m!1093029))

(declare-fun m!1093039 () Bool)

(assert (=> b!1184609 m!1093039))

(declare-fun m!1093041 () Bool)

(assert (=> b!1184612 m!1093041))

(declare-fun m!1093043 () Bool)

(assert (=> b!1184612 m!1093043))

(declare-fun m!1093045 () Bool)

(assert (=> b!1184612 m!1093045))

(declare-fun m!1093047 () Bool)

(assert (=> b!1184612 m!1093047))

(declare-fun m!1093049 () Bool)

(assert (=> b!1184612 m!1093049))

(declare-fun m!1093051 () Bool)

(assert (=> start!99948 m!1093051))

(declare-fun m!1093053 () Bool)

(assert (=> start!99948 m!1093053))

(declare-fun m!1093055 () Bool)

(assert (=> b!1184604 m!1093055))

(declare-fun m!1093057 () Bool)

(assert (=> b!1184614 m!1093057))

(assert (=> b!1184596 m!1093029))

(declare-fun m!1093059 () Bool)

(assert (=> b!1184602 m!1093059))

(declare-fun m!1093061 () Bool)

(assert (=> b!1184602 m!1093061))

(declare-fun m!1093063 () Bool)

(assert (=> b!1184602 m!1093063))

(assert (=> b!1184602 m!1093029))

(declare-fun m!1093065 () Bool)

(assert (=> b!1184602 m!1093065))

(declare-fun m!1093067 () Bool)

(assert (=> b!1184602 m!1093067))

(assert (=> b!1184602 m!1093029))

(declare-fun m!1093069 () Bool)

(assert (=> b!1184613 m!1093069))

(declare-fun m!1093071 () Bool)

(assert (=> b!1184601 m!1093071))

(declare-fun m!1093073 () Bool)

(assert (=> b!1184611 m!1093073))

(declare-fun m!1093075 () Bool)

(assert (=> b!1184611 m!1093075))

(declare-fun m!1093077 () Bool)

(assert (=> mapNonEmpty!46559 m!1093077))

(declare-fun m!1093079 () Bool)

(assert (=> b!1184608 m!1093079))

(declare-fun m!1093081 () Bool)

(assert (=> b!1184605 m!1093081))

(declare-fun m!1093083 () Bool)

(assert (=> b!1184605 m!1093083))

(declare-fun m!1093085 () Bool)

(assert (=> b!1184610 m!1093085))

(check-sat (not b!1184607) (not b!1184612) (not b!1184605) (not b!1184601) (not b_lambda!20429) (not b!1184614) (not b!1184604) (not b!1184610) (not mapNonEmpty!46559) (not b!1184608) (not b!1184609) b_and!41453 (not b!1184597) (not b!1184602) tp_is_empty!29821 (not b_next!25291) (not b!1184611) (not start!99948))
(check-sat b_and!41453 (not b_next!25291))
