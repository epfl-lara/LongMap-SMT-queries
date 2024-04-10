; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99396 () Bool)

(assert start!99396)

(declare-fun b_free!24975 () Bool)

(declare-fun b_next!24975 () Bool)

(assert (=> start!99396 (= b_free!24975 (not b_next!24975))))

(declare-fun tp!87638 () Bool)

(declare-fun b_and!40817 () Bool)

(assert (=> start!99396 (= tp!87638 b_and!40817)))

(declare-fun b!1173169 () Bool)

(declare-fun res!779011 () Bool)

(declare-fun e!666838 () Bool)

(assert (=> b!1173169 (=> (not res!779011) (not e!666838))))

(declare-datatypes ((array!75821 0))(
  ( (array!75822 (arr!36560 (Array (_ BitVec 32) (_ BitVec 64))) (size!37096 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75821)

(declare-datatypes ((List!25662 0))(
  ( (Nil!25659) (Cons!25658 (h!26867 (_ BitVec 64)) (t!37629 List!25662)) )
))
(declare-fun arrayNoDuplicates!0 (array!75821 (_ BitVec 32) List!25662) Bool)

(assert (=> b!1173169 (= res!779011 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25659))))

(declare-fun b!1173170 () Bool)

(declare-fun e!666831 () Bool)

(declare-fun e!666829 () Bool)

(assert (=> b!1173170 (= e!666831 e!666829)))

(declare-fun res!778997 () Bool)

(assert (=> b!1173170 (=> res!778997 e!666829)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173170 (= res!778997 (not (= (select (arr!36560 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173171 () Bool)

(declare-fun e!666830 () Bool)

(declare-fun tp_is_empty!29505 () Bool)

(assert (=> b!1173171 (= e!666830 tp_is_empty!29505)))

(declare-fun b!1173172 () Bool)

(declare-fun e!666833 () Bool)

(declare-fun mapRes!46085 () Bool)

(assert (=> b!1173172 (= e!666833 (and e!666830 mapRes!46085))))

(declare-fun condMapEmpty!46085 () Bool)

(declare-datatypes ((V!44467 0))(
  ( (V!44468 (val!14809 Int)) )
))
(declare-datatypes ((ValueCell!14043 0))(
  ( (ValueCellFull!14043 (v!17447 V!44467)) (EmptyCell!14043) )
))
(declare-datatypes ((array!75823 0))(
  ( (array!75824 (arr!36561 (Array (_ BitVec 32) ValueCell!14043)) (size!37097 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75823)

(declare-fun mapDefault!46085 () ValueCell!14043)

(assert (=> b!1173172 (= condMapEmpty!46085 (= (arr!36561 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14043)) mapDefault!46085)))))

(declare-fun b!1173173 () Bool)

(declare-fun res!779005 () Bool)

(assert (=> b!1173173 (=> (not res!779005) (not e!666838))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173173 (= res!779005 (= (select (arr!36560 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46085 () Bool)

(declare-fun tp!87639 () Bool)

(declare-fun e!666832 () Bool)

(assert (=> mapNonEmpty!46085 (= mapRes!46085 (and tp!87639 e!666832))))

(declare-fun mapValue!46085 () ValueCell!14043)

(declare-fun mapRest!46085 () (Array (_ BitVec 32) ValueCell!14043))

(declare-fun mapKey!46085 () (_ BitVec 32))

(assert (=> mapNonEmpty!46085 (= (arr!36561 _values!996) (store mapRest!46085 mapKey!46085 mapValue!46085))))

(declare-fun b!1173174 () Bool)

(declare-fun res!779006 () Bool)

(assert (=> b!1173174 (=> (not res!779006) (not e!666838))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173174 (= res!779006 (validMask!0 mask!1564))))

(declare-fun b!1173175 () Bool)

(assert (=> b!1173175 (= e!666832 tp_is_empty!29505)))

(declare-fun b!1173176 () Bool)

(declare-fun e!666827 () Bool)

(assert (=> b!1173176 (= e!666827 true)))

(assert (=> b!1173176 (not (= (select (arr!36560 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38686 0))(
  ( (Unit!38687) )
))
(declare-fun lt!528756 () Unit!38686)

(declare-fun e!666835 () Unit!38686)

(assert (=> b!1173176 (= lt!528756 e!666835)))

(declare-fun c!116586 () Bool)

(assert (=> b!1173176 (= c!116586 (= (select (arr!36560 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173176 e!666831))

(declare-fun res!779001 () Bool)

(assert (=> b!1173176 (=> (not res!779001) (not e!666831))))

(declare-datatypes ((tuple2!18924 0))(
  ( (tuple2!18925 (_1!9473 (_ BitVec 64)) (_2!9473 V!44467)) )
))
(declare-datatypes ((List!25663 0))(
  ( (Nil!25660) (Cons!25659 (h!26868 tuple2!18924) (t!37630 List!25663)) )
))
(declare-datatypes ((ListLongMap!16893 0))(
  ( (ListLongMap!16894 (toList!8462 List!25663)) )
))
(declare-fun lt!528752 () ListLongMap!16893)

(declare-fun lt!528743 () V!44467)

(declare-fun lt!528751 () ListLongMap!16893)

(declare-fun +!3781 (ListLongMap!16893 tuple2!18924) ListLongMap!16893)

(declare-fun get!18653 (ValueCell!14043 V!44467) V!44467)

(assert (=> b!1173176 (= res!779001 (= lt!528752 (+!3781 lt!528751 (tuple2!18925 (select (arr!36560 _keys!1208) from!1455) (get!18653 (select (arr!36561 _values!996) from!1455) lt!528743)))))))

(declare-fun b!1173177 () Bool)

(declare-fun res!779000 () Bool)

(assert (=> b!1173177 (=> (not res!779000) (not e!666838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173177 (= res!779000 (validKeyInArray!0 k0!934))))

(declare-fun b!1173178 () Bool)

(declare-fun e!666834 () Bool)

(assert (=> b!1173178 (= e!666838 e!666834)))

(declare-fun res!779003 () Bool)

(assert (=> b!1173178 (=> (not res!779003) (not e!666834))))

(declare-fun lt!528748 () array!75821)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75821 (_ BitVec 32)) Bool)

(assert (=> b!1173178 (= res!779003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528748 mask!1564))))

(assert (=> b!1173178 (= lt!528748 (array!75822 (store (arr!36560 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37096 _keys!1208)))))

(declare-fun b!1173179 () Bool)

(declare-fun e!666837 () Bool)

(assert (=> b!1173179 (= e!666837 e!666827)))

(declare-fun res!778998 () Bool)

(assert (=> b!1173179 (=> res!778998 e!666827)))

(assert (=> b!1173179 (= res!778998 (not (validKeyInArray!0 (select (arr!36560 _keys!1208) from!1455))))))

(declare-fun lt!528746 () ListLongMap!16893)

(assert (=> b!1173179 (= lt!528746 lt!528751)))

(declare-fun lt!528747 () ListLongMap!16893)

(declare-fun -!1526 (ListLongMap!16893 (_ BitVec 64)) ListLongMap!16893)

(assert (=> b!1173179 (= lt!528751 (-!1526 lt!528747 k0!934))))

(declare-fun zeroValue!944 () V!44467)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44467)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528755 () array!75823)

(declare-fun getCurrentListMapNoExtraKeys!4925 (array!75821 array!75823 (_ BitVec 32) (_ BitVec 32) V!44467 V!44467 (_ BitVec 32) Int) ListLongMap!16893)

(assert (=> b!1173179 (= lt!528746 (getCurrentListMapNoExtraKeys!4925 lt!528748 lt!528755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173179 (= lt!528747 (getCurrentListMapNoExtraKeys!4925 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528745 () Unit!38686)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 (array!75821 array!75823 (_ BitVec 32) (_ BitVec 32) V!44467 V!44467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38686)

(assert (=> b!1173179 (= lt!528745 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173180 () Bool)

(declare-fun Unit!38688 () Unit!38686)

(assert (=> b!1173180 (= e!666835 Unit!38688)))

(declare-fun lt!528749 () Unit!38686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75821 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38686)

(assert (=> b!1173180 (= lt!528749 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173180 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528744 () Unit!38686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75821 (_ BitVec 32) (_ BitVec 32)) Unit!38686)

(assert (=> b!1173180 (= lt!528744 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173180 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25659)))

(declare-fun lt!528753 () Unit!38686)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75821 (_ BitVec 64) (_ BitVec 32) List!25662) Unit!38686)

(assert (=> b!1173180 (= lt!528753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25659))))

(assert (=> b!1173180 false))

(declare-fun b!1173181 () Bool)

(declare-fun res!779007 () Bool)

(assert (=> b!1173181 (=> (not res!779007) (not e!666838))))

(assert (=> b!1173181 (= res!779007 (and (= (size!37097 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37096 _keys!1208) (size!37097 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173182 () Bool)

(declare-fun e!666828 () Bool)

(assert (=> b!1173182 (= e!666834 (not e!666828))))

(declare-fun res!779008 () Bool)

(assert (=> b!1173182 (=> res!779008 e!666828)))

(assert (=> b!1173182 (= res!779008 (bvsgt from!1455 i!673))))

(assert (=> b!1173182 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528754 () Unit!38686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75821 (_ BitVec 64) (_ BitVec 32)) Unit!38686)

(assert (=> b!1173182 (= lt!528754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!779004 () Bool)

(assert (=> start!99396 (=> (not res!779004) (not e!666838))))

(assert (=> start!99396 (= res!779004 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37096 _keys!1208))))))

(assert (=> start!99396 e!666838))

(assert (=> start!99396 tp_is_empty!29505))

(declare-fun array_inv!27934 (array!75821) Bool)

(assert (=> start!99396 (array_inv!27934 _keys!1208)))

(assert (=> start!99396 true))

(assert (=> start!99396 tp!87638))

(declare-fun array_inv!27935 (array!75823) Bool)

(assert (=> start!99396 (and (array_inv!27935 _values!996) e!666833)))

(declare-fun mapIsEmpty!46085 () Bool)

(assert (=> mapIsEmpty!46085 mapRes!46085))

(declare-fun b!1173183 () Bool)

(declare-fun res!779010 () Bool)

(assert (=> b!1173183 (=> (not res!779010) (not e!666838))))

(assert (=> b!1173183 (= res!779010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173184 () Bool)

(declare-fun Unit!38689 () Unit!38686)

(assert (=> b!1173184 (= e!666835 Unit!38689)))

(declare-fun b!1173185 () Bool)

(declare-fun res!778999 () Bool)

(assert (=> b!1173185 (=> (not res!778999) (not e!666834))))

(assert (=> b!1173185 (= res!778999 (arrayNoDuplicates!0 lt!528748 #b00000000000000000000000000000000 Nil!25659))))

(declare-fun b!1173186 () Bool)

(declare-fun res!779009 () Bool)

(assert (=> b!1173186 (=> (not res!779009) (not e!666838))))

(assert (=> b!1173186 (= res!779009 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37096 _keys!1208))))))

(declare-fun b!1173187 () Bool)

(assert (=> b!1173187 (= e!666828 e!666837)))

(declare-fun res!779002 () Bool)

(assert (=> b!1173187 (=> res!779002 e!666837)))

(assert (=> b!1173187 (= res!779002 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173187 (= lt!528752 (getCurrentListMapNoExtraKeys!4925 lt!528748 lt!528755 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173187 (= lt!528755 (array!75824 (store (arr!36561 _values!996) i!673 (ValueCellFull!14043 lt!528743)) (size!37097 _values!996)))))

(declare-fun dynLambda!2896 (Int (_ BitVec 64)) V!44467)

(assert (=> b!1173187 (= lt!528743 (dynLambda!2896 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528750 () ListLongMap!16893)

(assert (=> b!1173187 (= lt!528750 (getCurrentListMapNoExtraKeys!4925 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173188 () Bool)

(assert (=> b!1173188 (= e!666829 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99396 res!779004) b!1173174))

(assert (= (and b!1173174 res!779006) b!1173181))

(assert (= (and b!1173181 res!779007) b!1173183))

(assert (= (and b!1173183 res!779010) b!1173169))

(assert (= (and b!1173169 res!779011) b!1173186))

(assert (= (and b!1173186 res!779009) b!1173177))

(assert (= (and b!1173177 res!779000) b!1173173))

(assert (= (and b!1173173 res!779005) b!1173178))

(assert (= (and b!1173178 res!779003) b!1173185))

(assert (= (and b!1173185 res!778999) b!1173182))

(assert (= (and b!1173182 (not res!779008)) b!1173187))

(assert (= (and b!1173187 (not res!779002)) b!1173179))

(assert (= (and b!1173179 (not res!778998)) b!1173176))

(assert (= (and b!1173176 res!779001) b!1173170))

(assert (= (and b!1173170 (not res!778997)) b!1173188))

(assert (= (and b!1173176 c!116586) b!1173180))

(assert (= (and b!1173176 (not c!116586)) b!1173184))

(assert (= (and b!1173172 condMapEmpty!46085) mapIsEmpty!46085))

(assert (= (and b!1173172 (not condMapEmpty!46085)) mapNonEmpty!46085))

(get-info :version)

(assert (= (and mapNonEmpty!46085 ((_ is ValueCellFull!14043) mapValue!46085)) b!1173175))

(assert (= (and b!1173172 ((_ is ValueCellFull!14043) mapDefault!46085)) b!1173171))

(assert (= start!99396 b!1173172))

(declare-fun b_lambda!20119 () Bool)

(assert (=> (not b_lambda!20119) (not b!1173187)))

(declare-fun t!37628 () Bool)

(declare-fun tb!9787 () Bool)

(assert (=> (and start!99396 (= defaultEntry!1004 defaultEntry!1004) t!37628) tb!9787))

(declare-fun result!20141 () Bool)

(assert (=> tb!9787 (= result!20141 tp_is_empty!29505)))

(assert (=> b!1173187 t!37628))

(declare-fun b_and!40819 () Bool)

(assert (= b_and!40817 (and (=> t!37628 result!20141) b_and!40819)))

(declare-fun m!1081003 () Bool)

(assert (=> b!1173178 m!1081003))

(declare-fun m!1081005 () Bool)

(assert (=> b!1173178 m!1081005))

(declare-fun m!1081007 () Bool)

(assert (=> b!1173176 m!1081007))

(declare-fun m!1081009 () Bool)

(assert (=> b!1173176 m!1081009))

(assert (=> b!1173176 m!1081009))

(declare-fun m!1081011 () Bool)

(assert (=> b!1173176 m!1081011))

(declare-fun m!1081013 () Bool)

(assert (=> b!1173176 m!1081013))

(declare-fun m!1081015 () Bool)

(assert (=> b!1173187 m!1081015))

(declare-fun m!1081017 () Bool)

(assert (=> b!1173187 m!1081017))

(declare-fun m!1081019 () Bool)

(assert (=> b!1173187 m!1081019))

(declare-fun m!1081021 () Bool)

(assert (=> b!1173187 m!1081021))

(declare-fun m!1081023 () Bool)

(assert (=> b!1173182 m!1081023))

(declare-fun m!1081025 () Bool)

(assert (=> b!1173182 m!1081025))

(assert (=> b!1173170 m!1081007))

(declare-fun m!1081027 () Bool)

(assert (=> b!1173183 m!1081027))

(declare-fun m!1081029 () Bool)

(assert (=> b!1173169 m!1081029))

(declare-fun m!1081031 () Bool)

(assert (=> start!99396 m!1081031))

(declare-fun m!1081033 () Bool)

(assert (=> start!99396 m!1081033))

(declare-fun m!1081035 () Bool)

(assert (=> mapNonEmpty!46085 m!1081035))

(declare-fun m!1081037 () Bool)

(assert (=> b!1173185 m!1081037))

(declare-fun m!1081039 () Bool)

(assert (=> b!1173180 m!1081039))

(declare-fun m!1081041 () Bool)

(assert (=> b!1173180 m!1081041))

(declare-fun m!1081043 () Bool)

(assert (=> b!1173180 m!1081043))

(declare-fun m!1081045 () Bool)

(assert (=> b!1173180 m!1081045))

(declare-fun m!1081047 () Bool)

(assert (=> b!1173180 m!1081047))

(declare-fun m!1081049 () Bool)

(assert (=> b!1173174 m!1081049))

(declare-fun m!1081051 () Bool)

(assert (=> b!1173179 m!1081051))

(declare-fun m!1081053 () Bool)

(assert (=> b!1173179 m!1081053))

(assert (=> b!1173179 m!1081007))

(declare-fun m!1081055 () Bool)

(assert (=> b!1173179 m!1081055))

(declare-fun m!1081057 () Bool)

(assert (=> b!1173179 m!1081057))

(declare-fun m!1081059 () Bool)

(assert (=> b!1173179 m!1081059))

(assert (=> b!1173179 m!1081007))

(declare-fun m!1081061 () Bool)

(assert (=> b!1173177 m!1081061))

(declare-fun m!1081063 () Bool)

(assert (=> b!1173173 m!1081063))

(declare-fun m!1081065 () Bool)

(assert (=> b!1173188 m!1081065))

(check-sat (not b!1173185) (not b!1173180) (not start!99396) (not b!1173179) (not b!1173169) (not b!1173183) tp_is_empty!29505 (not b_next!24975) b_and!40819 (not b!1173187) (not b!1173174) (not b!1173188) (not b!1173182) (not mapNonEmpty!46085) (not b!1173176) (not b!1173178) (not b_lambda!20119) (not b!1173177))
(check-sat b_and!40819 (not b_next!24975))
