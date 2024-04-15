; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99158 () Bool)

(assert start!99158)

(declare-fun b_free!24769 () Bool)

(declare-fun b_next!24769 () Bool)

(assert (=> start!99158 (= b_free!24769 (not b_next!24769))))

(declare-fun tp!87018 () Bool)

(declare-fun b_and!40365 () Bool)

(assert (=> start!99158 (= tp!87018 b_and!40365)))

(declare-fun b!1167001 () Bool)

(declare-fun res!774161 () Bool)

(declare-fun e!663312 () Bool)

(assert (=> b!1167001 (=> (not res!774161) (not e!663312))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167001 (= res!774161 (validKeyInArray!0 k0!934))))

(declare-fun b!1167002 () Bool)

(declare-fun res!774157 () Bool)

(assert (=> b!1167002 (=> (not res!774157) (not e!663312))))

(declare-datatypes ((array!75350 0))(
  ( (array!75351 (arr!36326 (Array (_ BitVec 32) (_ BitVec 64))) (size!36864 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75350)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167002 (= res!774157 (= (select (arr!36326 _keys!1208) i!673) k0!934))))

(declare-fun b!1167003 () Bool)

(declare-fun e!663308 () Bool)

(declare-fun e!663309 () Bool)

(declare-fun mapRes!45773 () Bool)

(assert (=> b!1167003 (= e!663308 (and e!663309 mapRes!45773))))

(declare-fun condMapEmpty!45773 () Bool)

(declare-datatypes ((V!44193 0))(
  ( (V!44194 (val!14706 Int)) )
))
(declare-datatypes ((ValueCell!13940 0))(
  ( (ValueCellFull!13940 (v!17342 V!44193)) (EmptyCell!13940) )
))
(declare-datatypes ((array!75352 0))(
  ( (array!75353 (arr!36327 (Array (_ BitVec 32) ValueCell!13940)) (size!36865 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75352)

(declare-fun mapDefault!45773 () ValueCell!13940)

(assert (=> b!1167003 (= condMapEmpty!45773 (= (arr!36327 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13940)) mapDefault!45773)))))

(declare-fun b!1167004 () Bool)

(declare-fun res!774159 () Bool)

(declare-fun e!663311 () Bool)

(assert (=> b!1167004 (=> (not res!774159) (not e!663311))))

(declare-fun lt!525324 () array!75350)

(declare-datatypes ((List!25569 0))(
  ( (Nil!25566) (Cons!25565 (h!26774 (_ BitVec 64)) (t!37321 List!25569)) )
))
(declare-fun arrayNoDuplicates!0 (array!75350 (_ BitVec 32) List!25569) Bool)

(assert (=> b!1167004 (= res!774159 (arrayNoDuplicates!0 lt!525324 #b00000000000000000000000000000000 Nil!25566))))

(declare-fun b!1167005 () Bool)

(declare-fun e!663315 () Bool)

(declare-fun e!663313 () Bool)

(assert (=> b!1167005 (= e!663315 e!663313)))

(declare-fun res!774160 () Bool)

(assert (=> b!1167005 (=> res!774160 e!663313)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167005 (= res!774160 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44193)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18852 0))(
  ( (tuple2!18853 (_1!9437 (_ BitVec 64)) (_2!9437 V!44193)) )
))
(declare-datatypes ((List!25570 0))(
  ( (Nil!25567) (Cons!25566 (h!26775 tuple2!18852) (t!37322 List!25570)) )
))
(declare-datatypes ((ListLongMap!16821 0))(
  ( (ListLongMap!16822 (toList!8426 List!25570)) )
))
(declare-fun lt!525323 () ListLongMap!16821)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525326 () array!75352)

(declare-fun minValue!944 () V!44193)

(declare-fun getCurrentListMapNoExtraKeys!4902 (array!75350 array!75352 (_ BitVec 32) (_ BitVec 32) V!44193 V!44193 (_ BitVec 32) Int) ListLongMap!16821)

(assert (=> b!1167005 (= lt!525323 (getCurrentListMapNoExtraKeys!4902 lt!525324 lt!525326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2835 (Int (_ BitVec 64)) V!44193)

(assert (=> b!1167005 (= lt!525326 (array!75353 (store (arr!36327 _values!996) i!673 (ValueCellFull!13940 (dynLambda!2835 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36865 _values!996)))))

(declare-fun lt!525325 () ListLongMap!16821)

(assert (=> b!1167005 (= lt!525325 (getCurrentListMapNoExtraKeys!4902 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167006 () Bool)

(declare-fun res!774152 () Bool)

(assert (=> b!1167006 (=> (not res!774152) (not e!663312))))

(assert (=> b!1167006 (= res!774152 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25566))))

(declare-fun b!1167007 () Bool)

(assert (=> b!1167007 (= e!663311 (not e!663315))))

(declare-fun res!774153 () Bool)

(assert (=> b!1167007 (=> res!774153 e!663315)))

(assert (=> b!1167007 (= res!774153 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167007 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38337 0))(
  ( (Unit!38338) )
))
(declare-fun lt!525322 () Unit!38337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75350 (_ BitVec 64) (_ BitVec 32)) Unit!38337)

(assert (=> b!1167007 (= lt!525322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167008 () Bool)

(declare-fun res!774154 () Bool)

(assert (=> b!1167008 (=> (not res!774154) (not e!663312))))

(assert (=> b!1167008 (= res!774154 (and (= (size!36865 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36864 _keys!1208) (size!36865 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167009 () Bool)

(declare-fun res!774156 () Bool)

(assert (=> b!1167009 (=> (not res!774156) (not e!663312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167009 (= res!774156 (validMask!0 mask!1564))))

(declare-fun b!1167010 () Bool)

(assert (=> b!1167010 (= e!663313 true)))

(declare-fun -!1436 (ListLongMap!16821 (_ BitVec 64)) ListLongMap!16821)

(assert (=> b!1167010 (= (getCurrentListMapNoExtraKeys!4902 lt!525324 lt!525326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1436 (getCurrentListMapNoExtraKeys!4902 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525327 () Unit!38337)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!700 (array!75350 array!75352 (_ BitVec 32) (_ BitVec 32) V!44193 V!44193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38337)

(assert (=> b!1167010 (= lt!525327 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!700 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167011 () Bool)

(declare-fun res!774151 () Bool)

(assert (=> b!1167011 (=> (not res!774151) (not e!663312))))

(assert (=> b!1167011 (= res!774151 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36864 _keys!1208))))))

(declare-fun mapIsEmpty!45773 () Bool)

(assert (=> mapIsEmpty!45773 mapRes!45773))

(declare-fun mapNonEmpty!45773 () Bool)

(declare-fun tp!87017 () Bool)

(declare-fun e!663310 () Bool)

(assert (=> mapNonEmpty!45773 (= mapRes!45773 (and tp!87017 e!663310))))

(declare-fun mapRest!45773 () (Array (_ BitVec 32) ValueCell!13940))

(declare-fun mapKey!45773 () (_ BitVec 32))

(declare-fun mapValue!45773 () ValueCell!13940)

(assert (=> mapNonEmpty!45773 (= (arr!36327 _values!996) (store mapRest!45773 mapKey!45773 mapValue!45773))))

(declare-fun res!774158 () Bool)

(assert (=> start!99158 (=> (not res!774158) (not e!663312))))

(assert (=> start!99158 (= res!774158 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36864 _keys!1208))))))

(assert (=> start!99158 e!663312))

(declare-fun tp_is_empty!29299 () Bool)

(assert (=> start!99158 tp_is_empty!29299))

(declare-fun array_inv!27876 (array!75350) Bool)

(assert (=> start!99158 (array_inv!27876 _keys!1208)))

(assert (=> start!99158 true))

(assert (=> start!99158 tp!87018))

(declare-fun array_inv!27877 (array!75352) Bool)

(assert (=> start!99158 (and (array_inv!27877 _values!996) e!663308)))

(declare-fun b!1167012 () Bool)

(declare-fun res!774150 () Bool)

(assert (=> b!1167012 (=> (not res!774150) (not e!663312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75350 (_ BitVec 32)) Bool)

(assert (=> b!1167012 (= res!774150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167013 () Bool)

(assert (=> b!1167013 (= e!663312 e!663311)))

(declare-fun res!774155 () Bool)

(assert (=> b!1167013 (=> (not res!774155) (not e!663311))))

(assert (=> b!1167013 (= res!774155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525324 mask!1564))))

(assert (=> b!1167013 (= lt!525324 (array!75351 (store (arr!36326 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36864 _keys!1208)))))

(declare-fun b!1167014 () Bool)

(assert (=> b!1167014 (= e!663309 tp_is_empty!29299)))

(declare-fun b!1167015 () Bool)

(assert (=> b!1167015 (= e!663310 tp_is_empty!29299)))

(assert (= (and start!99158 res!774158) b!1167009))

(assert (= (and b!1167009 res!774156) b!1167008))

(assert (= (and b!1167008 res!774154) b!1167012))

(assert (= (and b!1167012 res!774150) b!1167006))

(assert (= (and b!1167006 res!774152) b!1167011))

(assert (= (and b!1167011 res!774151) b!1167001))

(assert (= (and b!1167001 res!774161) b!1167002))

(assert (= (and b!1167002 res!774157) b!1167013))

(assert (= (and b!1167013 res!774155) b!1167004))

(assert (= (and b!1167004 res!774159) b!1167007))

(assert (= (and b!1167007 (not res!774153)) b!1167005))

(assert (= (and b!1167005 (not res!774160)) b!1167010))

(assert (= (and b!1167003 condMapEmpty!45773) mapIsEmpty!45773))

(assert (= (and b!1167003 (not condMapEmpty!45773)) mapNonEmpty!45773))

(get-info :version)

(assert (= (and mapNonEmpty!45773 ((_ is ValueCellFull!13940) mapValue!45773)) b!1167015))

(assert (= (and b!1167003 ((_ is ValueCellFull!13940) mapDefault!45773)) b!1167014))

(assert (= start!99158 b!1167003))

(declare-fun b_lambda!19857 () Bool)

(assert (=> (not b_lambda!19857) (not b!1167005)))

(declare-fun t!37320 () Bool)

(declare-fun tb!9573 () Bool)

(assert (=> (and start!99158 (= defaultEntry!1004 defaultEntry!1004) t!37320) tb!9573))

(declare-fun result!19719 () Bool)

(assert (=> tb!9573 (= result!19719 tp_is_empty!29299)))

(assert (=> b!1167005 t!37320))

(declare-fun b_and!40367 () Bool)

(assert (= b_and!40365 (and (=> t!37320 result!19719) b_and!40367)))

(declare-fun m!1074481 () Bool)

(assert (=> b!1167012 m!1074481))

(declare-fun m!1074483 () Bool)

(assert (=> b!1167013 m!1074483))

(declare-fun m!1074485 () Bool)

(assert (=> b!1167013 m!1074485))

(declare-fun m!1074487 () Bool)

(assert (=> b!1167009 m!1074487))

(declare-fun m!1074489 () Bool)

(assert (=> mapNonEmpty!45773 m!1074489))

(declare-fun m!1074491 () Bool)

(assert (=> b!1167004 m!1074491))

(declare-fun m!1074493 () Bool)

(assert (=> b!1167006 m!1074493))

(declare-fun m!1074495 () Bool)

(assert (=> b!1167010 m!1074495))

(declare-fun m!1074497 () Bool)

(assert (=> b!1167010 m!1074497))

(assert (=> b!1167010 m!1074497))

(declare-fun m!1074499 () Bool)

(assert (=> b!1167010 m!1074499))

(declare-fun m!1074501 () Bool)

(assert (=> b!1167010 m!1074501))

(declare-fun m!1074503 () Bool)

(assert (=> start!99158 m!1074503))

(declare-fun m!1074505 () Bool)

(assert (=> start!99158 m!1074505))

(declare-fun m!1074507 () Bool)

(assert (=> b!1167001 m!1074507))

(declare-fun m!1074509 () Bool)

(assert (=> b!1167002 m!1074509))

(declare-fun m!1074511 () Bool)

(assert (=> b!1167005 m!1074511))

(declare-fun m!1074513 () Bool)

(assert (=> b!1167005 m!1074513))

(declare-fun m!1074515 () Bool)

(assert (=> b!1167005 m!1074515))

(declare-fun m!1074517 () Bool)

(assert (=> b!1167005 m!1074517))

(declare-fun m!1074519 () Bool)

(assert (=> b!1167007 m!1074519))

(declare-fun m!1074521 () Bool)

(assert (=> b!1167007 m!1074521))

(check-sat (not b!1167012) (not b!1167001) (not b_next!24769) b_and!40367 (not b!1167004) (not start!99158) tp_is_empty!29299 (not b!1167006) (not mapNonEmpty!45773) (not b!1167013) (not b!1167009) (not b!1167010) (not b_lambda!19857) (not b!1167007) (not b!1167005))
(check-sat b_and!40367 (not b_next!24769))
