; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99136 () Bool)

(assert start!99136)

(declare-fun b_free!24741 () Bool)

(declare-fun b_next!24741 () Bool)

(assert (=> start!99136 (= b_free!24741 (not b_next!24741))))

(declare-fun tp!86933 () Bool)

(declare-fun b_and!40331 () Bool)

(assert (=> start!99136 (= tp!86933 b_and!40331)))

(declare-fun b!1166467 () Bool)

(declare-fun res!773722 () Bool)

(declare-fun e!663055 () Bool)

(assert (=> b!1166467 (=> (not res!773722) (not e!663055))))

(declare-datatypes ((array!75373 0))(
  ( (array!75374 (arr!36337 (Array (_ BitVec 32) (_ BitVec 64))) (size!36873 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75373)

(declare-datatypes ((List!25477 0))(
  ( (Nil!25474) (Cons!25473 (h!26682 (_ BitVec 64)) (t!37210 List!25477)) )
))
(declare-fun arrayNoDuplicates!0 (array!75373 (_ BitVec 32) List!25477) Bool)

(assert (=> b!1166467 (= res!773722 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25474))))

(declare-fun b!1166468 () Bool)

(declare-fun res!773716 () Bool)

(assert (=> b!1166468 (=> (not res!773716) (not e!663055))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166468 (= res!773716 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36873 _keys!1208))))))

(declare-fun b!1166469 () Bool)

(declare-fun e!663057 () Bool)

(declare-fun e!663056 () Bool)

(assert (=> b!1166469 (= e!663057 e!663056)))

(declare-fun res!773723 () Bool)

(assert (=> b!1166469 (=> res!773723 e!663056)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166469 (= res!773723 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44155 0))(
  ( (V!44156 (val!14692 Int)) )
))
(declare-fun zeroValue!944 () V!44155)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13926 0))(
  ( (ValueCellFull!13926 (v!17329 V!44155)) (EmptyCell!13926) )
))
(declare-datatypes ((array!75375 0))(
  ( (array!75376 (arr!36338 (Array (_ BitVec 32) ValueCell!13926)) (size!36874 (_ BitVec 32))) )
))
(declare-fun lt!525266 () array!75375)

(declare-fun lt!525262 () array!75373)

(declare-fun minValue!944 () V!44155)

(declare-datatypes ((tuple2!18736 0))(
  ( (tuple2!18737 (_1!9379 (_ BitVec 64)) (_2!9379 V!44155)) )
))
(declare-datatypes ((List!25478 0))(
  ( (Nil!25475) (Cons!25474 (h!26683 tuple2!18736) (t!37211 List!25478)) )
))
(declare-datatypes ((ListLongMap!16705 0))(
  ( (ListLongMap!16706 (toList!8368 List!25478)) )
))
(declare-fun lt!525264 () ListLongMap!16705)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4832 (array!75373 array!75375 (_ BitVec 32) (_ BitVec 32) V!44155 V!44155 (_ BitVec 32) Int) ListLongMap!16705)

(assert (=> b!1166469 (= lt!525264 (getCurrentListMapNoExtraKeys!4832 lt!525262 lt!525266 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75375)

(declare-fun dynLambda!2821 (Int (_ BitVec 64)) V!44155)

(assert (=> b!1166469 (= lt!525266 (array!75376 (store (arr!36338 _values!996) i!673 (ValueCellFull!13926 (dynLambda!2821 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36874 _values!996)))))

(declare-fun lt!525263 () ListLongMap!16705)

(assert (=> b!1166469 (= lt!525263 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166470 () Bool)

(declare-fun e!663050 () Bool)

(assert (=> b!1166470 (= e!663050 (not e!663057))))

(declare-fun res!773719 () Bool)

(assert (=> b!1166470 (=> res!773719 e!663057)))

(assert (=> b!1166470 (= res!773719 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166470 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38490 0))(
  ( (Unit!38491) )
))
(declare-fun lt!525267 () Unit!38490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75373 (_ BitVec 64) (_ BitVec 32)) Unit!38490)

(assert (=> b!1166470 (= lt!525267 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166471 () Bool)

(declare-fun res!773715 () Bool)

(assert (=> b!1166471 (=> (not res!773715) (not e!663055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75373 (_ BitVec 32)) Bool)

(assert (=> b!1166471 (= res!773715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166472 () Bool)

(declare-fun res!773718 () Bool)

(assert (=> b!1166472 (=> (not res!773718) (not e!663050))))

(assert (=> b!1166472 (= res!773718 (arrayNoDuplicates!0 lt!525262 #b00000000000000000000000000000000 Nil!25474))))

(declare-fun b!1166473 () Bool)

(declare-fun e!663053 () Bool)

(declare-fun e!663054 () Bool)

(declare-fun mapRes!45731 () Bool)

(assert (=> b!1166473 (= e!663053 (and e!663054 mapRes!45731))))

(declare-fun condMapEmpty!45731 () Bool)

(declare-fun mapDefault!45731 () ValueCell!13926)

(assert (=> b!1166473 (= condMapEmpty!45731 (= (arr!36338 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13926)) mapDefault!45731)))))

(declare-fun mapNonEmpty!45731 () Bool)

(declare-fun tp!86934 () Bool)

(declare-fun e!663052 () Bool)

(assert (=> mapNonEmpty!45731 (= mapRes!45731 (and tp!86934 e!663052))))

(declare-fun mapValue!45731 () ValueCell!13926)

(declare-fun mapKey!45731 () (_ BitVec 32))

(declare-fun mapRest!45731 () (Array (_ BitVec 32) ValueCell!13926))

(assert (=> mapNonEmpty!45731 (= (arr!36338 _values!996) (store mapRest!45731 mapKey!45731 mapValue!45731))))

(declare-fun b!1166474 () Bool)

(declare-fun res!773713 () Bool)

(assert (=> b!1166474 (=> (not res!773713) (not e!663055))))

(assert (=> b!1166474 (= res!773713 (and (= (size!36874 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36873 _keys!1208) (size!36874 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166475 () Bool)

(assert (=> b!1166475 (= e!663055 e!663050)))

(declare-fun res!773720 () Bool)

(assert (=> b!1166475 (=> (not res!773720) (not e!663050))))

(assert (=> b!1166475 (= res!773720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525262 mask!1564))))

(assert (=> b!1166475 (= lt!525262 (array!75374 (store (arr!36337 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36873 _keys!1208)))))

(declare-fun b!1166477 () Bool)

(declare-fun tp_is_empty!29271 () Bool)

(assert (=> b!1166477 (= e!663052 tp_is_empty!29271)))

(declare-fun b!1166478 () Bool)

(assert (=> b!1166478 (= e!663054 tp_is_empty!29271)))

(declare-fun b!1166479 () Bool)

(assert (=> b!1166479 (= e!663056 true)))

(declare-fun -!1445 (ListLongMap!16705 (_ BitVec 64)) ListLongMap!16705)

(assert (=> b!1166479 (= (getCurrentListMapNoExtraKeys!4832 lt!525262 lt!525266 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1445 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525265 () Unit!38490)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!672 (array!75373 array!75375 (_ BitVec 32) (_ BitVec 32) V!44155 V!44155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38490)

(assert (=> b!1166479 (= lt!525265 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!672 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166480 () Bool)

(declare-fun res!773714 () Bool)

(assert (=> b!1166480 (=> (not res!773714) (not e!663055))))

(assert (=> b!1166480 (= res!773714 (= (select (arr!36337 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45731 () Bool)

(assert (=> mapIsEmpty!45731 mapRes!45731))

(declare-fun b!1166481 () Bool)

(declare-fun res!773721 () Bool)

(assert (=> b!1166481 (=> (not res!773721) (not e!663055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166481 (= res!773721 (validKeyInArray!0 k0!934))))

(declare-fun b!1166476 () Bool)

(declare-fun res!773712 () Bool)

(assert (=> b!1166476 (=> (not res!773712) (not e!663055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166476 (= res!773712 (validMask!0 mask!1564))))

(declare-fun res!773717 () Bool)

(assert (=> start!99136 (=> (not res!773717) (not e!663055))))

(assert (=> start!99136 (= res!773717 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36873 _keys!1208))))))

(assert (=> start!99136 e!663055))

(assert (=> start!99136 tp_is_empty!29271))

(declare-fun array_inv!27790 (array!75373) Bool)

(assert (=> start!99136 (array_inv!27790 _keys!1208)))

(assert (=> start!99136 true))

(assert (=> start!99136 tp!86933))

(declare-fun array_inv!27791 (array!75375) Bool)

(assert (=> start!99136 (and (array_inv!27791 _values!996) e!663053)))

(assert (= (and start!99136 res!773717) b!1166476))

(assert (= (and b!1166476 res!773712) b!1166474))

(assert (= (and b!1166474 res!773713) b!1166471))

(assert (= (and b!1166471 res!773715) b!1166467))

(assert (= (and b!1166467 res!773722) b!1166468))

(assert (= (and b!1166468 res!773716) b!1166481))

(assert (= (and b!1166481 res!773721) b!1166480))

(assert (= (and b!1166480 res!773714) b!1166475))

(assert (= (and b!1166475 res!773720) b!1166472))

(assert (= (and b!1166472 res!773718) b!1166470))

(assert (= (and b!1166470 (not res!773719)) b!1166469))

(assert (= (and b!1166469 (not res!773723)) b!1166479))

(assert (= (and b!1166473 condMapEmpty!45731) mapIsEmpty!45731))

(assert (= (and b!1166473 (not condMapEmpty!45731)) mapNonEmpty!45731))

(get-info :version)

(assert (= (and mapNonEmpty!45731 ((_ is ValueCellFull!13926) mapValue!45731)) b!1166477))

(assert (= (and b!1166473 ((_ is ValueCellFull!13926) mapDefault!45731)) b!1166478))

(assert (= start!99136 b!1166473))

(declare-fun b_lambda!19847 () Bool)

(assert (=> (not b_lambda!19847) (not b!1166469)))

(declare-fun t!37209 () Bool)

(declare-fun tb!9553 () Bool)

(assert (=> (and start!99136 (= defaultEntry!1004 defaultEntry!1004) t!37209) tb!9553))

(declare-fun result!19671 () Bool)

(assert (=> tb!9553 (= result!19671 tp_is_empty!29271)))

(assert (=> b!1166469 t!37209))

(declare-fun b_and!40333 () Bool)

(assert (= b_and!40331 (and (=> t!37209 result!19671) b_and!40333)))

(declare-fun m!1074503 () Bool)

(assert (=> b!1166475 m!1074503))

(declare-fun m!1074505 () Bool)

(assert (=> b!1166475 m!1074505))

(declare-fun m!1074507 () Bool)

(assert (=> b!1166481 m!1074507))

(declare-fun m!1074509 () Bool)

(assert (=> b!1166479 m!1074509))

(declare-fun m!1074511 () Bool)

(assert (=> b!1166479 m!1074511))

(assert (=> b!1166479 m!1074511))

(declare-fun m!1074513 () Bool)

(assert (=> b!1166479 m!1074513))

(declare-fun m!1074515 () Bool)

(assert (=> b!1166479 m!1074515))

(declare-fun m!1074517 () Bool)

(assert (=> b!1166470 m!1074517))

(declare-fun m!1074519 () Bool)

(assert (=> b!1166470 m!1074519))

(declare-fun m!1074521 () Bool)

(assert (=> b!1166467 m!1074521))

(declare-fun m!1074523 () Bool)

(assert (=> b!1166469 m!1074523))

(declare-fun m!1074525 () Bool)

(assert (=> b!1166469 m!1074525))

(declare-fun m!1074527 () Bool)

(assert (=> b!1166469 m!1074527))

(declare-fun m!1074529 () Bool)

(assert (=> b!1166469 m!1074529))

(declare-fun m!1074531 () Bool)

(assert (=> b!1166480 m!1074531))

(declare-fun m!1074533 () Bool)

(assert (=> b!1166476 m!1074533))

(declare-fun m!1074535 () Bool)

(assert (=> b!1166472 m!1074535))

(declare-fun m!1074537 () Bool)

(assert (=> start!99136 m!1074537))

(declare-fun m!1074539 () Bool)

(assert (=> start!99136 m!1074539))

(declare-fun m!1074541 () Bool)

(assert (=> b!1166471 m!1074541))

(declare-fun m!1074543 () Bool)

(assert (=> mapNonEmpty!45731 m!1074543))

(check-sat (not b_next!24741) (not b!1166467) (not b_lambda!19847) (not b!1166472) (not b!1166470) (not b!1166481) (not b!1166469) (not b!1166479) b_and!40333 (not mapNonEmpty!45731) (not b!1166471) (not start!99136) (not b!1166475) tp_is_empty!29271 (not b!1166476))
(check-sat b_and!40333 (not b_next!24741))
