; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99916 () Bool)

(assert start!99916)

(declare-fun b_free!25501 () Bool)

(declare-fun b_next!25501 () Bool)

(assert (=> start!99916 (= b_free!25501 (not b_next!25501))))

(declare-fun tp!89216 () Bool)

(declare-fun b_and!41847 () Bool)

(assert (=> start!99916 (= tp!89216 b_and!41847)))

(declare-fun b!1189323 () Bool)

(declare-fun res!790887 () Bool)

(declare-fun e!676179 () Bool)

(assert (=> b!1189323 (=> (not res!790887) (not e!676179))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189323 (= res!790887 (validMask!0 mask!1564))))

(declare-fun b!1189324 () Bool)

(declare-fun res!790897 () Bool)

(assert (=> b!1189324 (=> (not res!790897) (not e!676179))))

(declare-datatypes ((array!76790 0))(
  ( (array!76791 (arr!37045 (Array (_ BitVec 32) (_ BitVec 64))) (size!37583 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76790)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45169 0))(
  ( (V!45170 (val!15072 Int)) )
))
(declare-datatypes ((ValueCell!14306 0))(
  ( (ValueCellFull!14306 (v!17709 V!45169)) (EmptyCell!14306) )
))
(declare-datatypes ((array!76792 0))(
  ( (array!76793 (arr!37046 (Array (_ BitVec 32) ValueCell!14306)) (size!37584 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76792)

(assert (=> b!1189324 (= res!790897 (and (= (size!37584 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37583 _keys!1208) (size!37584 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189325 () Bool)

(declare-fun res!790890 () Bool)

(assert (=> b!1189325 (=> (not res!790890) (not e!676179))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189325 (= res!790890 (validKeyInArray!0 k0!934))))

(declare-fun b!1189326 () Bool)

(declare-fun e!676180 () Bool)

(assert (=> b!1189326 (= e!676180 true)))

(declare-fun zeroValue!944 () V!45169)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540882 () array!76790)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45169)

(declare-fun lt!540878 () array!76792)

(declare-datatypes ((tuple2!19476 0))(
  ( (tuple2!19477 (_1!9749 (_ BitVec 64)) (_2!9749 V!45169)) )
))
(declare-datatypes ((List!26187 0))(
  ( (Nil!26184) (Cons!26183 (h!27392 tuple2!19476) (t!38671 List!26187)) )
))
(declare-datatypes ((ListLongMap!17445 0))(
  ( (ListLongMap!17446 (toList!8738 List!26187)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5188 (array!76790 array!76792 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) Int) ListLongMap!17445)

(declare-fun -!1684 (ListLongMap!17445 (_ BitVec 64)) ListLongMap!17445)

(assert (=> b!1189326 (= (getCurrentListMapNoExtraKeys!5188 lt!540882 lt!540878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1684 (getCurrentListMapNoExtraKeys!5188 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39335 0))(
  ( (Unit!39336) )
))
(declare-fun lt!540880 () Unit!39335)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 (array!76790 array!76792 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39335)

(assert (=> b!1189326 (= lt!540880 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189327 () Bool)

(declare-fun res!790893 () Bool)

(assert (=> b!1189327 (=> (not res!790893) (not e!676179))))

(assert (=> b!1189327 (= res!790893 (= (select (arr!37045 _keys!1208) i!673) k0!934))))

(declare-fun b!1189328 () Bool)

(declare-fun res!790886 () Bool)

(assert (=> b!1189328 (=> (not res!790886) (not e!676179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76790 (_ BitVec 32)) Bool)

(assert (=> b!1189328 (= res!790886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189329 () Bool)

(declare-fun e!676173 () Bool)

(declare-fun e!676174 () Bool)

(assert (=> b!1189329 (= e!676173 (not e!676174))))

(declare-fun res!790888 () Bool)

(assert (=> b!1189329 (=> res!790888 e!676174)))

(assert (=> b!1189329 (= res!790888 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189329 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540877 () Unit!39335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76790 (_ BitVec 64) (_ BitVec 32)) Unit!39335)

(assert (=> b!1189329 (= lt!540877 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46874 () Bool)

(declare-fun mapRes!46874 () Bool)

(assert (=> mapIsEmpty!46874 mapRes!46874))

(declare-fun b!1189331 () Bool)

(declare-fun res!790891 () Bool)

(assert (=> b!1189331 (=> (not res!790891) (not e!676179))))

(declare-datatypes ((List!26188 0))(
  ( (Nil!26185) (Cons!26184 (h!27393 (_ BitVec 64)) (t!38672 List!26188)) )
))
(declare-fun arrayNoDuplicates!0 (array!76790 (_ BitVec 32) List!26188) Bool)

(assert (=> b!1189331 (= res!790891 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26185))))

(declare-fun b!1189332 () Bool)

(declare-fun e!676177 () Bool)

(declare-fun e!676176 () Bool)

(assert (=> b!1189332 (= e!676177 (and e!676176 mapRes!46874))))

(declare-fun condMapEmpty!46874 () Bool)

(declare-fun mapDefault!46874 () ValueCell!14306)

(assert (=> b!1189332 (= condMapEmpty!46874 (= (arr!37046 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14306)) mapDefault!46874)))))

(declare-fun b!1189333 () Bool)

(assert (=> b!1189333 (= e!676179 e!676173)))

(declare-fun res!790896 () Bool)

(assert (=> b!1189333 (=> (not res!790896) (not e!676173))))

(assert (=> b!1189333 (= res!790896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540882 mask!1564))))

(assert (=> b!1189333 (= lt!540882 (array!76791 (store (arr!37045 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37583 _keys!1208)))))

(declare-fun b!1189334 () Bool)

(declare-fun tp_is_empty!30031 () Bool)

(assert (=> b!1189334 (= e!676176 tp_is_empty!30031)))

(declare-fun b!1189335 () Bool)

(assert (=> b!1189335 (= e!676174 e!676180)))

(declare-fun res!790892 () Bool)

(assert (=> b!1189335 (=> res!790892 e!676180)))

(assert (=> b!1189335 (= res!790892 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540881 () ListLongMap!17445)

(assert (=> b!1189335 (= lt!540881 (getCurrentListMapNoExtraKeys!5188 lt!540882 lt!540878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3083 (Int (_ BitVec 64)) V!45169)

(assert (=> b!1189335 (= lt!540878 (array!76793 (store (arr!37046 _values!996) i!673 (ValueCellFull!14306 (dynLambda!3083 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37584 _values!996)))))

(declare-fun lt!540879 () ListLongMap!17445)

(assert (=> b!1189335 (= lt!540879 (getCurrentListMapNoExtraKeys!5188 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189336 () Bool)

(declare-fun e!676178 () Bool)

(assert (=> b!1189336 (= e!676178 tp_is_empty!30031)))

(declare-fun res!790894 () Bool)

(assert (=> start!99916 (=> (not res!790894) (not e!676179))))

(assert (=> start!99916 (= res!790894 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37583 _keys!1208))))))

(assert (=> start!99916 e!676179))

(assert (=> start!99916 tp_is_empty!30031))

(declare-fun array_inv!28378 (array!76790) Bool)

(assert (=> start!99916 (array_inv!28378 _keys!1208)))

(assert (=> start!99916 true))

(assert (=> start!99916 tp!89216))

(declare-fun array_inv!28379 (array!76792) Bool)

(assert (=> start!99916 (and (array_inv!28379 _values!996) e!676177)))

(declare-fun b!1189330 () Bool)

(declare-fun res!790889 () Bool)

(assert (=> b!1189330 (=> (not res!790889) (not e!676179))))

(assert (=> b!1189330 (= res!790889 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37583 _keys!1208))))))

(declare-fun mapNonEmpty!46874 () Bool)

(declare-fun tp!89217 () Bool)

(assert (=> mapNonEmpty!46874 (= mapRes!46874 (and tp!89217 e!676178))))

(declare-fun mapKey!46874 () (_ BitVec 32))

(declare-fun mapValue!46874 () ValueCell!14306)

(declare-fun mapRest!46874 () (Array (_ BitVec 32) ValueCell!14306))

(assert (=> mapNonEmpty!46874 (= (arr!37046 _values!996) (store mapRest!46874 mapKey!46874 mapValue!46874))))

(declare-fun b!1189337 () Bool)

(declare-fun res!790895 () Bool)

(assert (=> b!1189337 (=> (not res!790895) (not e!676173))))

(assert (=> b!1189337 (= res!790895 (arrayNoDuplicates!0 lt!540882 #b00000000000000000000000000000000 Nil!26185))))

(assert (= (and start!99916 res!790894) b!1189323))

(assert (= (and b!1189323 res!790887) b!1189324))

(assert (= (and b!1189324 res!790897) b!1189328))

(assert (= (and b!1189328 res!790886) b!1189331))

(assert (= (and b!1189331 res!790891) b!1189330))

(assert (= (and b!1189330 res!790889) b!1189325))

(assert (= (and b!1189325 res!790890) b!1189327))

(assert (= (and b!1189327 res!790893) b!1189333))

(assert (= (and b!1189333 res!790896) b!1189337))

(assert (= (and b!1189337 res!790895) b!1189329))

(assert (= (and b!1189329 (not res!790888)) b!1189335))

(assert (= (and b!1189335 (not res!790892)) b!1189326))

(assert (= (and b!1189332 condMapEmpty!46874) mapIsEmpty!46874))

(assert (= (and b!1189332 (not condMapEmpty!46874)) mapNonEmpty!46874))

(get-info :version)

(assert (= (and mapNonEmpty!46874 ((_ is ValueCellFull!14306) mapValue!46874)) b!1189336))

(assert (= (and b!1189332 ((_ is ValueCellFull!14306) mapDefault!46874)) b!1189334))

(assert (= start!99916 b!1189332))

(declare-fun b_lambda!20627 () Bool)

(assert (=> (not b_lambda!20627) (not b!1189335)))

(declare-fun t!38670 () Bool)

(declare-fun tb!10305 () Bool)

(assert (=> (and start!99916 (= defaultEntry!1004 defaultEntry!1004) t!38670) tb!10305))

(declare-fun result!21185 () Bool)

(assert (=> tb!10305 (= result!21185 tp_is_empty!30031)))

(assert (=> b!1189335 t!38670))

(declare-fun b_and!41849 () Bool)

(assert (= b_and!41847 (and (=> t!38670 result!21185) b_and!41849)))

(declare-fun m!1097513 () Bool)

(assert (=> b!1189329 m!1097513))

(declare-fun m!1097515 () Bool)

(assert (=> b!1189329 m!1097515))

(declare-fun m!1097517 () Bool)

(assert (=> mapNonEmpty!46874 m!1097517))

(declare-fun m!1097519 () Bool)

(assert (=> b!1189325 m!1097519))

(declare-fun m!1097521 () Bool)

(assert (=> b!1189327 m!1097521))

(declare-fun m!1097523 () Bool)

(assert (=> b!1189331 m!1097523))

(declare-fun m!1097525 () Bool)

(assert (=> b!1189326 m!1097525))

(declare-fun m!1097527 () Bool)

(assert (=> b!1189326 m!1097527))

(assert (=> b!1189326 m!1097527))

(declare-fun m!1097529 () Bool)

(assert (=> b!1189326 m!1097529))

(declare-fun m!1097531 () Bool)

(assert (=> b!1189326 m!1097531))

(declare-fun m!1097533 () Bool)

(assert (=> start!99916 m!1097533))

(declare-fun m!1097535 () Bool)

(assert (=> start!99916 m!1097535))

(declare-fun m!1097537 () Bool)

(assert (=> b!1189328 m!1097537))

(declare-fun m!1097539 () Bool)

(assert (=> b!1189323 m!1097539))

(declare-fun m!1097541 () Bool)

(assert (=> b!1189335 m!1097541))

(declare-fun m!1097543 () Bool)

(assert (=> b!1189335 m!1097543))

(declare-fun m!1097545 () Bool)

(assert (=> b!1189335 m!1097545))

(declare-fun m!1097547 () Bool)

(assert (=> b!1189335 m!1097547))

(declare-fun m!1097549 () Bool)

(assert (=> b!1189333 m!1097549))

(declare-fun m!1097551 () Bool)

(assert (=> b!1189333 m!1097551))

(declare-fun m!1097553 () Bool)

(assert (=> b!1189337 m!1097553))

(check-sat (not b!1189335) tp_is_empty!30031 (not b!1189326) (not b_next!25501) (not b!1189329) (not b!1189333) (not b!1189323) (not b!1189337) (not b!1189331) (not b!1189328) (not start!99916) b_and!41849 (not b_lambda!20627) (not b!1189325) (not mapNonEmpty!46874))
(check-sat b_and!41849 (not b_next!25501))
