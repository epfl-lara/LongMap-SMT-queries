; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100014 () Bool)

(assert start!100014)

(declare-fun b_free!25593 () Bool)

(declare-fun b_next!25593 () Bool)

(assert (=> start!100014 (= b_free!25593 (not b_next!25593))))

(declare-fun tp!89492 () Bool)

(declare-fun b_and!42053 () Bool)

(assert (=> start!100014 (= tp!89492 b_and!42053)))

(declare-fun b!1191609 () Bool)

(declare-fun res!792611 () Bool)

(declare-fun e!677361 () Bool)

(assert (=> b!1191609 (=> (not res!792611) (not e!677361))))

(declare-datatypes ((array!77037 0))(
  ( (array!77038 (arr!37168 (Array (_ BitVec 32) (_ BitVec 64))) (size!37704 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77037)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77037 (_ BitVec 32)) Bool)

(assert (=> b!1191609 (= res!792611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191610 () Bool)

(declare-fun res!792617 () Bool)

(declare-fun e!677360 () Bool)

(assert (=> b!1191610 (=> (not res!792617) (not e!677360))))

(declare-fun lt!541901 () array!77037)

(declare-datatypes ((List!26175 0))(
  ( (Nil!26172) (Cons!26171 (h!27380 (_ BitVec 64)) (t!38760 List!26175)) )
))
(declare-fun arrayNoDuplicates!0 (array!77037 (_ BitVec 32) List!26175) Bool)

(assert (=> b!1191610 (= res!792617 (arrayNoDuplicates!0 lt!541901 #b00000000000000000000000000000000 Nil!26172))))

(declare-fun b!1191611 () Bool)

(declare-fun res!792609 () Bool)

(assert (=> b!1191611 (=> (not res!792609) (not e!677361))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191611 (= res!792609 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37704 _keys!1208))))))

(declare-fun b!1191612 () Bool)

(declare-fun res!792616 () Bool)

(assert (=> b!1191612 (=> (not res!792616) (not e!677361))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191612 (= res!792616 (= (select (arr!37168 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47012 () Bool)

(declare-fun mapRes!47012 () Bool)

(assert (=> mapIsEmpty!47012 mapRes!47012))

(declare-fun b!1191613 () Bool)

(declare-fun res!792610 () Bool)

(assert (=> b!1191613 (=> (not res!792610) (not e!677361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191613 (= res!792610 (validKeyInArray!0 k0!934))))

(declare-fun res!792614 () Bool)

(assert (=> start!100014 (=> (not res!792614) (not e!677361))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100014 (= res!792614 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37704 _keys!1208))))))

(assert (=> start!100014 e!677361))

(declare-fun tp_is_empty!30123 () Bool)

(assert (=> start!100014 tp_is_empty!30123))

(declare-fun array_inv!28344 (array!77037) Bool)

(assert (=> start!100014 (array_inv!28344 _keys!1208)))

(assert (=> start!100014 true))

(assert (=> start!100014 tp!89492))

(declare-datatypes ((V!45291 0))(
  ( (V!45292 (val!15118 Int)) )
))
(declare-datatypes ((ValueCell!14352 0))(
  ( (ValueCellFull!14352 (v!17756 V!45291)) (EmptyCell!14352) )
))
(declare-datatypes ((array!77039 0))(
  ( (array!77040 (arr!37169 (Array (_ BitVec 32) ValueCell!14352)) (size!37705 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77039)

(declare-fun e!677359 () Bool)

(declare-fun array_inv!28345 (array!77039) Bool)

(assert (=> start!100014 (and (array_inv!28345 _values!996) e!677359)))

(declare-fun b!1191614 () Bool)

(declare-fun res!792618 () Bool)

(assert (=> b!1191614 (=> (not res!792618) (not e!677361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191614 (= res!792618 (validMask!0 mask!1564))))

(declare-fun b!1191615 () Bool)

(declare-fun res!792608 () Bool)

(assert (=> b!1191615 (=> (not res!792608) (not e!677361))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1191615 (= res!792608 (and (= (size!37705 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37704 _keys!1208) (size!37705 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191616 () Bool)

(declare-fun e!677357 () Bool)

(assert (=> b!1191616 (= e!677360 (not e!677357))))

(declare-fun res!792613 () Bool)

(assert (=> b!1191616 (=> res!792613 e!677357)))

(assert (=> b!1191616 (= res!792613 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191616 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39528 0))(
  ( (Unit!39529) )
))
(declare-fun lt!541898 () Unit!39528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77037 (_ BitVec 64) (_ BitVec 32)) Unit!39528)

(assert (=> b!1191616 (= lt!541898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191617 () Bool)

(declare-fun e!677355 () Bool)

(assert (=> b!1191617 (= e!677355 true)))

(declare-fun zeroValue!944 () V!45291)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541897 () array!77039)

(declare-fun minValue!944 () V!45291)

(declare-datatypes ((tuple2!19432 0))(
  ( (tuple2!19433 (_1!9727 (_ BitVec 64)) (_2!9727 V!45291)) )
))
(declare-datatypes ((List!26176 0))(
  ( (Nil!26173) (Cons!26172 (h!27381 tuple2!19432) (t!38761 List!26176)) )
))
(declare-datatypes ((ListLongMap!17401 0))(
  ( (ListLongMap!17402 (toList!8716 List!26176)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5157 (array!77037 array!77039 (_ BitVec 32) (_ BitVec 32) V!45291 V!45291 (_ BitVec 32) Int) ListLongMap!17401)

(declare-fun -!1741 (ListLongMap!17401 (_ BitVec 64)) ListLongMap!17401)

(assert (=> b!1191617 (= (getCurrentListMapNoExtraKeys!5157 lt!541901 lt!541897 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1741 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541900 () Unit!39528)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!950 (array!77037 array!77039 (_ BitVec 32) (_ BitVec 32) V!45291 V!45291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39528)

(assert (=> b!1191617 (= lt!541900 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191618 () Bool)

(declare-fun e!677362 () Bool)

(assert (=> b!1191618 (= e!677359 (and e!677362 mapRes!47012))))

(declare-fun condMapEmpty!47012 () Bool)

(declare-fun mapDefault!47012 () ValueCell!14352)

(assert (=> b!1191618 (= condMapEmpty!47012 (= (arr!37169 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14352)) mapDefault!47012)))))

(declare-fun mapNonEmpty!47012 () Bool)

(declare-fun tp!89493 () Bool)

(declare-fun e!677358 () Bool)

(assert (=> mapNonEmpty!47012 (= mapRes!47012 (and tp!89493 e!677358))))

(declare-fun mapValue!47012 () ValueCell!14352)

(declare-fun mapKey!47012 () (_ BitVec 32))

(declare-fun mapRest!47012 () (Array (_ BitVec 32) ValueCell!14352))

(assert (=> mapNonEmpty!47012 (= (arr!37169 _values!996) (store mapRest!47012 mapKey!47012 mapValue!47012))))

(declare-fun b!1191619 () Bool)

(assert (=> b!1191619 (= e!677358 tp_is_empty!30123)))

(declare-fun b!1191620 () Bool)

(assert (=> b!1191620 (= e!677362 tp_is_empty!30123)))

(declare-fun b!1191621 () Bool)

(assert (=> b!1191621 (= e!677361 e!677360)))

(declare-fun res!792619 () Bool)

(assert (=> b!1191621 (=> (not res!792619) (not e!677360))))

(assert (=> b!1191621 (= res!792619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541901 mask!1564))))

(assert (=> b!1191621 (= lt!541901 (array!77038 (store (arr!37168 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37704 _keys!1208)))))

(declare-fun b!1191622 () Bool)

(declare-fun res!792615 () Bool)

(assert (=> b!1191622 (=> (not res!792615) (not e!677361))))

(assert (=> b!1191622 (= res!792615 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26172))))

(declare-fun b!1191623 () Bool)

(assert (=> b!1191623 (= e!677357 e!677355)))

(declare-fun res!792612 () Bool)

(assert (=> b!1191623 (=> res!792612 e!677355)))

(assert (=> b!1191623 (= res!792612 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541902 () ListLongMap!17401)

(assert (=> b!1191623 (= lt!541902 (getCurrentListMapNoExtraKeys!5157 lt!541901 lt!541897 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3090 (Int (_ BitVec 64)) V!45291)

(assert (=> b!1191623 (= lt!541897 (array!77040 (store (arr!37169 _values!996) i!673 (ValueCellFull!14352 (dynLambda!3090 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37705 _values!996)))))

(declare-fun lt!541899 () ListLongMap!17401)

(assert (=> b!1191623 (= lt!541899 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100014 res!792614) b!1191614))

(assert (= (and b!1191614 res!792618) b!1191615))

(assert (= (and b!1191615 res!792608) b!1191609))

(assert (= (and b!1191609 res!792611) b!1191622))

(assert (= (and b!1191622 res!792615) b!1191611))

(assert (= (and b!1191611 res!792609) b!1191613))

(assert (= (and b!1191613 res!792610) b!1191612))

(assert (= (and b!1191612 res!792616) b!1191621))

(assert (= (and b!1191621 res!792619) b!1191610))

(assert (= (and b!1191610 res!792617) b!1191616))

(assert (= (and b!1191616 (not res!792613)) b!1191623))

(assert (= (and b!1191623 (not res!792612)) b!1191617))

(assert (= (and b!1191618 condMapEmpty!47012) mapIsEmpty!47012))

(assert (= (and b!1191618 (not condMapEmpty!47012)) mapNonEmpty!47012))

(get-info :version)

(assert (= (and mapNonEmpty!47012 ((_ is ValueCellFull!14352) mapValue!47012)) b!1191619))

(assert (= (and b!1191618 ((_ is ValueCellFull!14352) mapDefault!47012)) b!1191620))

(assert (= start!100014 b!1191618))

(declare-fun b_lambda!20737 () Bool)

(assert (=> (not b_lambda!20737) (not b!1191623)))

(declare-fun t!38759 () Bool)

(declare-fun tb!10405 () Bool)

(assert (=> (and start!100014 (= defaultEntry!1004 defaultEntry!1004) t!38759) tb!10405))

(declare-fun result!21377 () Bool)

(assert (=> tb!10405 (= result!21377 tp_is_empty!30123)))

(assert (=> b!1191623 t!38759))

(declare-fun b_and!42055 () Bool)

(assert (= b_and!42053 (and (=> t!38759 result!21377) b_and!42055)))

(declare-fun m!1100055 () Bool)

(assert (=> b!1191621 m!1100055))

(declare-fun m!1100057 () Bool)

(assert (=> b!1191621 m!1100057))

(declare-fun m!1100059 () Bool)

(assert (=> start!100014 m!1100059))

(declare-fun m!1100061 () Bool)

(assert (=> start!100014 m!1100061))

(declare-fun m!1100063 () Bool)

(assert (=> b!1191610 m!1100063))

(declare-fun m!1100065 () Bool)

(assert (=> b!1191616 m!1100065))

(declare-fun m!1100067 () Bool)

(assert (=> b!1191616 m!1100067))

(declare-fun m!1100069 () Bool)

(assert (=> b!1191614 m!1100069))

(declare-fun m!1100071 () Bool)

(assert (=> b!1191612 m!1100071))

(declare-fun m!1100073 () Bool)

(assert (=> b!1191609 m!1100073))

(declare-fun m!1100075 () Bool)

(assert (=> b!1191623 m!1100075))

(declare-fun m!1100077 () Bool)

(assert (=> b!1191623 m!1100077))

(declare-fun m!1100079 () Bool)

(assert (=> b!1191623 m!1100079))

(declare-fun m!1100081 () Bool)

(assert (=> b!1191623 m!1100081))

(declare-fun m!1100083 () Bool)

(assert (=> b!1191622 m!1100083))

(declare-fun m!1100085 () Bool)

(assert (=> mapNonEmpty!47012 m!1100085))

(declare-fun m!1100087 () Bool)

(assert (=> b!1191617 m!1100087))

(declare-fun m!1100089 () Bool)

(assert (=> b!1191617 m!1100089))

(assert (=> b!1191617 m!1100089))

(declare-fun m!1100091 () Bool)

(assert (=> b!1191617 m!1100091))

(declare-fun m!1100093 () Bool)

(assert (=> b!1191617 m!1100093))

(declare-fun m!1100095 () Bool)

(assert (=> b!1191613 m!1100095))

(check-sat tp_is_empty!30123 (not b!1191622) (not b!1191610) (not b_next!25593) (not b!1191623) (not b!1191617) (not b!1191609) (not start!100014) (not b_lambda!20737) (not mapNonEmpty!47012) (not b!1191613) (not b!1191621) (not b!1191614) (not b!1191616) b_and!42055)
(check-sat b_and!42055 (not b_next!25593))
