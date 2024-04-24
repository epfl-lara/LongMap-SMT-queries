; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99924 () Bool)

(assert start!99924)

(declare-fun b_free!25267 () Bool)

(declare-fun b_next!25267 () Bool)

(assert (=> start!99924 (= b_free!25267 (not b_next!25267))))

(declare-fun tp!88515 () Bool)

(declare-fun b_and!41403 () Bool)

(assert (=> start!99924 (= tp!88515 b_and!41403)))

(declare-fun b!1183852 () Bool)

(declare-fun res!786425 () Bool)

(declare-fun e!673174 () Bool)

(assert (=> b!1183852 (=> (not res!786425) (not e!673174))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76443 0))(
  ( (array!76444 (arr!36865 (Array (_ BitVec 32) (_ BitVec 64))) (size!37402 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76443)

(assert (=> b!1183852 (= res!786425 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37402 _keys!1208))))))

(declare-fun b!1183853 () Bool)

(declare-fun e!673167 () Bool)

(declare-fun tp_is_empty!29797 () Bool)

(assert (=> b!1183853 (= e!673167 tp_is_empty!29797)))

(declare-fun b!1183854 () Bool)

(declare-fun e!673168 () Bool)

(declare-fun e!673177 () Bool)

(assert (=> b!1183854 (= e!673168 e!673177)))

(declare-fun res!786419 () Bool)

(assert (=> b!1183854 (=> res!786419 e!673177)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183854 (= res!786419 (not (validKeyInArray!0 (select (arr!36865 _keys!1208) from!1455))))))

(declare-datatypes ((V!44857 0))(
  ( (V!44858 (val!14955 Int)) )
))
(declare-datatypes ((tuple2!19210 0))(
  ( (tuple2!19211 (_1!9616 (_ BitVec 64)) (_2!9616 V!44857)) )
))
(declare-datatypes ((List!25941 0))(
  ( (Nil!25938) (Cons!25937 (h!27155 tuple2!19210) (t!38192 List!25941)) )
))
(declare-datatypes ((ListLongMap!17187 0))(
  ( (ListLongMap!17188 (toList!8609 List!25941)) )
))
(declare-fun lt!535856 () ListLongMap!17187)

(declare-fun lt!535851 () ListLongMap!17187)

(assert (=> b!1183854 (= lt!535856 lt!535851)))

(declare-fun lt!535859 () ListLongMap!17187)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1631 (ListLongMap!17187 (_ BitVec 64)) ListLongMap!17187)

(assert (=> b!1183854 (= lt!535851 (-!1631 lt!535859 k0!934))))

(declare-fun zeroValue!944 () V!44857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44857)

(declare-fun lt!535862 () array!76443)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14189 0))(
  ( (ValueCellFull!14189 (v!17589 V!44857)) (EmptyCell!14189) )
))
(declare-datatypes ((array!76445 0))(
  ( (array!76446 (arr!36866 (Array (_ BitVec 32) ValueCell!14189)) (size!37403 (_ BitVec 32))) )
))
(declare-fun lt!535860 () array!76445)

(declare-fun getCurrentListMapNoExtraKeys!5081 (array!76443 array!76445 (_ BitVec 32) (_ BitVec 32) V!44857 V!44857 (_ BitVec 32) Int) ListLongMap!17187)

(assert (=> b!1183854 (= lt!535856 (getCurrentListMapNoExtraKeys!5081 lt!535862 lt!535860 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76445)

(assert (=> b!1183854 (= lt!535859 (getCurrentListMapNoExtraKeys!5081 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39121 0))(
  ( (Unit!39122) )
))
(declare-fun lt!535852 () Unit!39121)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 (array!76443 array!76445 (_ BitVec 32) (_ BitVec 32) V!44857 V!44857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39121)

(assert (=> b!1183854 (= lt!535852 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183855 () Bool)

(declare-fun e!673176 () Bool)

(assert (=> b!1183855 (= e!673176 tp_is_empty!29797)))

(declare-fun b!1183856 () Bool)

(declare-fun e!673169 () Bool)

(declare-fun e!673175 () Bool)

(assert (=> b!1183856 (= e!673169 e!673175)))

(declare-fun res!786421 () Bool)

(assert (=> b!1183856 (=> res!786421 e!673175)))

(assert (=> b!1183856 (= res!786421 (not (= (select (arr!36865 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183857 () Bool)

(declare-fun res!786423 () Bool)

(assert (=> b!1183857 (=> (not res!786423) (not e!673174))))

(assert (=> b!1183857 (= res!786423 (validKeyInArray!0 k0!934))))

(declare-fun b!1183858 () Bool)

(declare-fun e!673172 () Bool)

(declare-fun mapRes!46523 () Bool)

(assert (=> b!1183858 (= e!673172 (and e!673176 mapRes!46523))))

(declare-fun condMapEmpty!46523 () Bool)

(declare-fun mapDefault!46523 () ValueCell!14189)

(assert (=> b!1183858 (= condMapEmpty!46523 (= (arr!36866 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14189)) mapDefault!46523)))))

(declare-fun b!1183859 () Bool)

(declare-fun res!786431 () Bool)

(declare-fun e!673170 () Bool)

(assert (=> b!1183859 (=> (not res!786431) (not e!673170))))

(declare-datatypes ((List!25942 0))(
  ( (Nil!25939) (Cons!25938 (h!27156 (_ BitVec 64)) (t!38193 List!25942)) )
))
(declare-fun arrayNoDuplicates!0 (array!76443 (_ BitVec 32) List!25942) Bool)

(assert (=> b!1183859 (= res!786431 (arrayNoDuplicates!0 lt!535862 #b00000000000000000000000000000000 Nil!25939))))

(declare-fun b!1183860 () Bool)

(declare-fun res!786422 () Bool)

(assert (=> b!1183860 (=> (not res!786422) (not e!673174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183860 (= res!786422 (validMask!0 mask!1564))))

(declare-fun b!1183861 () Bool)

(declare-fun res!786420 () Bool)

(assert (=> b!1183861 (=> (not res!786420) (not e!673174))))

(assert (=> b!1183861 (= res!786420 (and (= (size!37403 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37402 _keys!1208) (size!37403 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!786428 () Bool)

(assert (=> start!99924 (=> (not res!786428) (not e!673174))))

(assert (=> start!99924 (= res!786428 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37402 _keys!1208))))))

(assert (=> start!99924 e!673174))

(assert (=> start!99924 tp_is_empty!29797))

(declare-fun array_inv!28214 (array!76443) Bool)

(assert (=> start!99924 (array_inv!28214 _keys!1208)))

(assert (=> start!99924 true))

(assert (=> start!99924 tp!88515))

(declare-fun array_inv!28215 (array!76445) Bool)

(assert (=> start!99924 (and (array_inv!28215 _values!996) e!673172)))

(declare-fun b!1183862 () Bool)

(declare-fun e!673173 () Bool)

(assert (=> b!1183862 (= e!673170 (not e!673173))))

(declare-fun res!786424 () Bool)

(assert (=> b!1183862 (=> res!786424 e!673173)))

(assert (=> b!1183862 (= res!786424 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183862 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535846 () Unit!39121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76443 (_ BitVec 64) (_ BitVec 32)) Unit!39121)

(assert (=> b!1183862 (= lt!535846 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183863 () Bool)

(assert (=> b!1183863 (= e!673175 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183864 () Bool)

(assert (=> b!1183864 (= e!673177 true)))

(declare-fun lt!535863 () ListLongMap!17187)

(declare-fun lt!535864 () ListLongMap!17187)

(assert (=> b!1183864 (= (-!1631 lt!535863 k0!934) lt!535864)))

(declare-fun lt!535853 () V!44857)

(declare-fun lt!535861 () Unit!39121)

(declare-fun addRemoveCommutativeForDiffKeys!145 (ListLongMap!17187 (_ BitVec 64) V!44857 (_ BitVec 64)) Unit!39121)

(assert (=> b!1183864 (= lt!535861 (addRemoveCommutativeForDiffKeys!145 lt!535859 (select (arr!36865 _keys!1208) from!1455) lt!535853 k0!934))))

(declare-fun lt!535849 () ListLongMap!17187)

(assert (=> b!1183864 (and (= lt!535849 lt!535863) (= lt!535851 lt!535856))))

(declare-fun lt!535857 () tuple2!19210)

(declare-fun +!3929 (ListLongMap!17187 tuple2!19210) ListLongMap!17187)

(assert (=> b!1183864 (= lt!535863 (+!3929 lt!535859 lt!535857))))

(assert (=> b!1183864 (not (= (select (arr!36865 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535847 () Unit!39121)

(declare-fun e!673178 () Unit!39121)

(assert (=> b!1183864 (= lt!535847 e!673178)))

(declare-fun c!117422 () Bool)

(assert (=> b!1183864 (= c!117422 (= (select (arr!36865 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183864 e!673169))

(declare-fun res!786429 () Bool)

(assert (=> b!1183864 (=> (not res!786429) (not e!673169))))

(declare-fun lt!535854 () ListLongMap!17187)

(assert (=> b!1183864 (= res!786429 (= lt!535854 lt!535864))))

(assert (=> b!1183864 (= lt!535864 (+!3929 lt!535851 lt!535857))))

(assert (=> b!1183864 (= lt!535857 (tuple2!19211 (select (arr!36865 _keys!1208) from!1455) lt!535853))))

(declare-fun lt!535858 () V!44857)

(declare-fun get!18896 (ValueCell!14189 V!44857) V!44857)

(assert (=> b!1183864 (= lt!535853 (get!18896 (select (arr!36866 _values!996) from!1455) lt!535858))))

(declare-fun b!1183865 () Bool)

(assert (=> b!1183865 (= e!673174 e!673170)))

(declare-fun res!786426 () Bool)

(assert (=> b!1183865 (=> (not res!786426) (not e!673170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76443 (_ BitVec 32)) Bool)

(assert (=> b!1183865 (= res!786426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535862 mask!1564))))

(assert (=> b!1183865 (= lt!535862 (array!76444 (store (arr!36865 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37402 _keys!1208)))))

(declare-fun b!1183866 () Bool)

(declare-fun Unit!39123 () Unit!39121)

(assert (=> b!1183866 (= e!673178 Unit!39123)))

(declare-fun b!1183867 () Bool)

(declare-fun res!786417 () Bool)

(assert (=> b!1183867 (=> (not res!786417) (not e!673174))))

(assert (=> b!1183867 (= res!786417 (= (select (arr!36865 _keys!1208) i!673) k0!934))))

(declare-fun b!1183868 () Bool)

(declare-fun Unit!39124 () Unit!39121)

(assert (=> b!1183868 (= e!673178 Unit!39124)))

(declare-fun lt!535855 () Unit!39121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39121)

(assert (=> b!1183868 (= lt!535855 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183868 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535850 () Unit!39121)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76443 (_ BitVec 32) (_ BitVec 32)) Unit!39121)

(assert (=> b!1183868 (= lt!535850 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183868 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25939)))

(declare-fun lt!535848 () Unit!39121)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76443 (_ BitVec 64) (_ BitVec 32) List!25942) Unit!39121)

(assert (=> b!1183868 (= lt!535848 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25939))))

(assert (=> b!1183868 false))

(declare-fun b!1183869 () Bool)

(declare-fun res!786427 () Bool)

(assert (=> b!1183869 (=> (not res!786427) (not e!673174))))

(assert (=> b!1183869 (= res!786427 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25939))))

(declare-fun mapNonEmpty!46523 () Bool)

(declare-fun tp!88514 () Bool)

(assert (=> mapNonEmpty!46523 (= mapRes!46523 (and tp!88514 e!673167))))

(declare-fun mapValue!46523 () ValueCell!14189)

(declare-fun mapKey!46523 () (_ BitVec 32))

(declare-fun mapRest!46523 () (Array (_ BitVec 32) ValueCell!14189))

(assert (=> mapNonEmpty!46523 (= (arr!36866 _values!996) (store mapRest!46523 mapKey!46523 mapValue!46523))))

(declare-fun b!1183870 () Bool)

(assert (=> b!1183870 (= e!673173 e!673168)))

(declare-fun res!786418 () Bool)

(assert (=> b!1183870 (=> res!786418 e!673168)))

(assert (=> b!1183870 (= res!786418 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183870 (= lt!535854 (getCurrentListMapNoExtraKeys!5081 lt!535862 lt!535860 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183870 (= lt!535860 (array!76446 (store (arr!36866 _values!996) i!673 (ValueCellFull!14189 lt!535858)) (size!37403 _values!996)))))

(declare-fun dynLambda!3045 (Int (_ BitVec 64)) V!44857)

(assert (=> b!1183870 (= lt!535858 (dynLambda!3045 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183870 (= lt!535849 (getCurrentListMapNoExtraKeys!5081 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183871 () Bool)

(declare-fun res!786430 () Bool)

(assert (=> b!1183871 (=> (not res!786430) (not e!673174))))

(assert (=> b!1183871 (= res!786430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46523 () Bool)

(assert (=> mapIsEmpty!46523 mapRes!46523))

(assert (= (and start!99924 res!786428) b!1183860))

(assert (= (and b!1183860 res!786422) b!1183861))

(assert (= (and b!1183861 res!786420) b!1183871))

(assert (= (and b!1183871 res!786430) b!1183869))

(assert (= (and b!1183869 res!786427) b!1183852))

(assert (= (and b!1183852 res!786425) b!1183857))

(assert (= (and b!1183857 res!786423) b!1183867))

(assert (= (and b!1183867 res!786417) b!1183865))

(assert (= (and b!1183865 res!786426) b!1183859))

(assert (= (and b!1183859 res!786431) b!1183862))

(assert (= (and b!1183862 (not res!786424)) b!1183870))

(assert (= (and b!1183870 (not res!786418)) b!1183854))

(assert (= (and b!1183854 (not res!786419)) b!1183864))

(assert (= (and b!1183864 res!786429) b!1183856))

(assert (= (and b!1183856 (not res!786421)) b!1183863))

(assert (= (and b!1183864 c!117422) b!1183868))

(assert (= (and b!1183864 (not c!117422)) b!1183866))

(assert (= (and b!1183858 condMapEmpty!46523) mapIsEmpty!46523))

(assert (= (and b!1183858 (not condMapEmpty!46523)) mapNonEmpty!46523))

(get-info :version)

(assert (= (and mapNonEmpty!46523 ((_ is ValueCellFull!14189) mapValue!46523)) b!1183853))

(assert (= (and b!1183858 ((_ is ValueCellFull!14189) mapDefault!46523)) b!1183855))

(assert (= start!99924 b!1183858))

(declare-fun b_lambda!20405 () Bool)

(assert (=> (not b_lambda!20405) (not b!1183870)))

(declare-fun t!38191 () Bool)

(declare-fun tb!10071 () Bool)

(assert (=> (and start!99924 (= defaultEntry!1004 defaultEntry!1004) t!38191) tb!10071))

(declare-fun result!20717 () Bool)

(assert (=> tb!10071 (= result!20717 tp_is_empty!29797)))

(assert (=> b!1183870 t!38191))

(declare-fun b_and!41405 () Bool)

(assert (= b_and!41403 (and (=> t!38191 result!20717) b_and!41405)))

(declare-fun m!1092177 () Bool)

(assert (=> b!1183869 m!1092177))

(declare-fun m!1092179 () Bool)

(assert (=> b!1183863 m!1092179))

(declare-fun m!1092181 () Bool)

(assert (=> start!99924 m!1092181))

(declare-fun m!1092183 () Bool)

(assert (=> start!99924 m!1092183))

(declare-fun m!1092185 () Bool)

(assert (=> b!1183857 m!1092185))

(declare-fun m!1092187 () Bool)

(assert (=> b!1183870 m!1092187))

(declare-fun m!1092189 () Bool)

(assert (=> b!1183870 m!1092189))

(declare-fun m!1092191 () Bool)

(assert (=> b!1183870 m!1092191))

(declare-fun m!1092193 () Bool)

(assert (=> b!1183870 m!1092193))

(declare-fun m!1092195 () Bool)

(assert (=> b!1183862 m!1092195))

(declare-fun m!1092197 () Bool)

(assert (=> b!1183862 m!1092197))

(declare-fun m!1092199 () Bool)

(assert (=> b!1183868 m!1092199))

(declare-fun m!1092201 () Bool)

(assert (=> b!1183868 m!1092201))

(declare-fun m!1092203 () Bool)

(assert (=> b!1183868 m!1092203))

(declare-fun m!1092205 () Bool)

(assert (=> b!1183868 m!1092205))

(declare-fun m!1092207 () Bool)

(assert (=> b!1183868 m!1092207))

(declare-fun m!1092209 () Bool)

(assert (=> b!1183859 m!1092209))

(declare-fun m!1092211 () Bool)

(assert (=> b!1183865 m!1092211))

(declare-fun m!1092213 () Bool)

(assert (=> b!1183865 m!1092213))

(declare-fun m!1092215 () Bool)

(assert (=> mapNonEmpty!46523 m!1092215))

(declare-fun m!1092217 () Bool)

(assert (=> b!1183860 m!1092217))

(declare-fun m!1092219 () Bool)

(assert (=> b!1183871 m!1092219))

(declare-fun m!1092221 () Bool)

(assert (=> b!1183864 m!1092221))

(declare-fun m!1092223 () Bool)

(assert (=> b!1183864 m!1092223))

(declare-fun m!1092225 () Bool)

(assert (=> b!1183864 m!1092225))

(declare-fun m!1092227 () Bool)

(assert (=> b!1183864 m!1092227))

(declare-fun m!1092229 () Bool)

(assert (=> b!1183864 m!1092229))

(declare-fun m!1092231 () Bool)

(assert (=> b!1183864 m!1092231))

(assert (=> b!1183864 m!1092223))

(declare-fun m!1092233 () Bool)

(assert (=> b!1183864 m!1092233))

(assert (=> b!1183864 m!1092225))

(assert (=> b!1183856 m!1092225))

(declare-fun m!1092235 () Bool)

(assert (=> b!1183854 m!1092235))

(declare-fun m!1092237 () Bool)

(assert (=> b!1183854 m!1092237))

(declare-fun m!1092239 () Bool)

(assert (=> b!1183854 m!1092239))

(assert (=> b!1183854 m!1092225))

(declare-fun m!1092241 () Bool)

(assert (=> b!1183854 m!1092241))

(declare-fun m!1092243 () Bool)

(assert (=> b!1183854 m!1092243))

(assert (=> b!1183854 m!1092225))

(declare-fun m!1092245 () Bool)

(assert (=> b!1183867 m!1092245))

(check-sat (not b!1183862) (not b_lambda!20405) tp_is_empty!29797 (not b!1183868) (not b!1183865) (not mapNonEmpty!46523) (not b!1183869) (not b!1183870) (not b!1183864) (not start!99924) (not b!1183854) (not b!1183860) (not b!1183871) (not b!1183857) (not b!1183859) (not b!1183863) (not b_next!25267) b_and!41405)
(check-sat b_and!41405 (not b_next!25267))
