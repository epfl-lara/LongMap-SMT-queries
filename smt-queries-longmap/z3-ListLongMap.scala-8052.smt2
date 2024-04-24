; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99388 () Bool)

(assert start!99388)

(declare-fun b_free!24757 () Bool)

(declare-fun b_next!24757 () Bool)

(assert (=> start!99388 (= b_free!24757 (not b_next!24757))))

(declare-fun tp!86982 () Bool)

(declare-fun b_and!40365 () Bool)

(assert (=> start!99388 (= tp!86982 b_and!40365)))

(declare-fun b!1168132 () Bool)

(declare-fun e!664081 () Bool)

(assert (=> b!1168132 (= e!664081 true)))

(declare-datatypes ((V!44177 0))(
  ( (V!44178 (val!14700 Int)) )
))
(declare-fun zeroValue!944 () V!44177)

(declare-datatypes ((array!75453 0))(
  ( (array!75454 (arr!36371 (Array (_ BitVec 32) (_ BitVec 64))) (size!36908 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75453)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13934 0))(
  ( (ValueCellFull!13934 (v!17333 V!44177)) (EmptyCell!13934) )
))
(declare-datatypes ((array!75455 0))(
  ( (array!75456 (arr!36372 (Array (_ BitVec 32) ValueCell!13934)) (size!36909 (_ BitVec 32))) )
))
(declare-fun lt!525890 () array!75455)

(declare-fun _values!996 () array!75455)

(declare-fun minValue!944 () V!44177)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525895 () array!75453)

(declare-datatypes ((tuple2!18786 0))(
  ( (tuple2!18787 (_1!9404 (_ BitVec 64)) (_2!9404 V!44177)) )
))
(declare-datatypes ((List!25526 0))(
  ( (Nil!25523) (Cons!25522 (h!26740 tuple2!18786) (t!37267 List!25526)) )
))
(declare-datatypes ((ListLongMap!16763 0))(
  ( (ListLongMap!16764 (toList!8397 List!25526)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4888 (array!75453 array!75455 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) Int) ListLongMap!16763)

(declare-fun -!1460 (ListLongMap!16763 (_ BitVec 64)) ListLongMap!16763)

(assert (=> b!1168132 (= (getCurrentListMapNoExtraKeys!4888 lt!525895 lt!525890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1460 (getCurrentListMapNoExtraKeys!4888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38491 0))(
  ( (Unit!38492) )
))
(declare-fun lt!525892 () Unit!38491)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 (array!75453 array!75455 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38491)

(assert (=> b!1168132 (= lt!525892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!685 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168133 () Bool)

(declare-fun e!664078 () Bool)

(declare-fun e!664074 () Bool)

(declare-fun mapRes!45755 () Bool)

(assert (=> b!1168133 (= e!664078 (and e!664074 mapRes!45755))))

(declare-fun condMapEmpty!45755 () Bool)

(declare-fun mapDefault!45755 () ValueCell!13934)

(assert (=> b!1168133 (= condMapEmpty!45755 (= (arr!36372 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13934)) mapDefault!45755)))))

(declare-fun b!1168134 () Bool)

(declare-fun res!774513 () Bool)

(declare-fun e!664075 () Bool)

(assert (=> b!1168134 (=> (not res!774513) (not e!664075))))

(assert (=> b!1168134 (= res!774513 (and (= (size!36909 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36908 _keys!1208) (size!36909 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168135 () Bool)

(declare-fun e!664080 () Bool)

(declare-fun e!664077 () Bool)

(assert (=> b!1168135 (= e!664080 (not e!664077))))

(declare-fun res!774514 () Bool)

(assert (=> b!1168135 (=> res!774514 e!664077)))

(assert (=> b!1168135 (= res!774514 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168135 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525894 () Unit!38491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75453 (_ BitVec 64) (_ BitVec 32)) Unit!38491)

(assert (=> b!1168135 (= lt!525894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168136 () Bool)

(declare-fun res!774509 () Bool)

(assert (=> b!1168136 (=> (not res!774509) (not e!664075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168136 (= res!774509 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45755 () Bool)

(declare-fun tp!86981 () Bool)

(declare-fun e!664079 () Bool)

(assert (=> mapNonEmpty!45755 (= mapRes!45755 (and tp!86981 e!664079))))

(declare-fun mapKey!45755 () (_ BitVec 32))

(declare-fun mapValue!45755 () ValueCell!13934)

(declare-fun mapRest!45755 () (Array (_ BitVec 32) ValueCell!13934))

(assert (=> mapNonEmpty!45755 (= (arr!36372 _values!996) (store mapRest!45755 mapKey!45755 mapValue!45755))))

(declare-fun b!1168137 () Bool)

(declare-fun tp_is_empty!29287 () Bool)

(assert (=> b!1168137 (= e!664079 tp_is_empty!29287)))

(declare-fun b!1168138 () Bool)

(declare-fun res!774510 () Bool)

(assert (=> b!1168138 (=> (not res!774510) (not e!664075))))

(assert (=> b!1168138 (= res!774510 (= (select (arr!36371 _keys!1208) i!673) k0!934))))

(declare-fun b!1168139 () Bool)

(declare-fun res!774508 () Bool)

(assert (=> b!1168139 (=> (not res!774508) (not e!664075))))

(assert (=> b!1168139 (= res!774508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36908 _keys!1208))))))

(declare-fun b!1168140 () Bool)

(declare-fun res!774518 () Bool)

(assert (=> b!1168140 (=> (not res!774518) (not e!664080))))

(declare-datatypes ((List!25527 0))(
  ( (Nil!25524) (Cons!25523 (h!26741 (_ BitVec 64)) (t!37268 List!25527)) )
))
(declare-fun arrayNoDuplicates!0 (array!75453 (_ BitVec 32) List!25527) Bool)

(assert (=> b!1168140 (= res!774518 (arrayNoDuplicates!0 lt!525895 #b00000000000000000000000000000000 Nil!25524))))

(declare-fun b!1168141 () Bool)

(declare-fun res!774517 () Bool)

(assert (=> b!1168141 (=> (not res!774517) (not e!664075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75453 (_ BitVec 32)) Bool)

(assert (=> b!1168141 (= res!774517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!774519 () Bool)

(assert (=> start!99388 (=> (not res!774519) (not e!664075))))

(assert (=> start!99388 (= res!774519 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36908 _keys!1208))))))

(assert (=> start!99388 e!664075))

(assert (=> start!99388 tp_is_empty!29287))

(declare-fun array_inv!27884 (array!75453) Bool)

(assert (=> start!99388 (array_inv!27884 _keys!1208)))

(assert (=> start!99388 true))

(assert (=> start!99388 tp!86982))

(declare-fun array_inv!27885 (array!75455) Bool)

(assert (=> start!99388 (and (array_inv!27885 _values!996) e!664078)))

(declare-fun b!1168142 () Bool)

(assert (=> b!1168142 (= e!664077 e!664081)))

(declare-fun res!774512 () Bool)

(assert (=> b!1168142 (=> res!774512 e!664081)))

(assert (=> b!1168142 (= res!774512 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525891 () ListLongMap!16763)

(assert (=> b!1168142 (= lt!525891 (getCurrentListMapNoExtraKeys!4888 lt!525895 lt!525890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2877 (Int (_ BitVec 64)) V!44177)

(assert (=> b!1168142 (= lt!525890 (array!75456 (store (arr!36372 _values!996) i!673 (ValueCellFull!13934 (dynLambda!2877 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36909 _values!996)))))

(declare-fun lt!525893 () ListLongMap!16763)

(assert (=> b!1168142 (= lt!525893 (getCurrentListMapNoExtraKeys!4888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168143 () Bool)

(assert (=> b!1168143 (= e!664075 e!664080)))

(declare-fun res!774511 () Bool)

(assert (=> b!1168143 (=> (not res!774511) (not e!664080))))

(assert (=> b!1168143 (= res!774511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525895 mask!1564))))

(assert (=> b!1168143 (= lt!525895 (array!75454 (store (arr!36371 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36908 _keys!1208)))))

(declare-fun b!1168144 () Bool)

(assert (=> b!1168144 (= e!664074 tp_is_empty!29287)))

(declare-fun b!1168145 () Bool)

(declare-fun res!774516 () Bool)

(assert (=> b!1168145 (=> (not res!774516) (not e!664075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168145 (= res!774516 (validMask!0 mask!1564))))

(declare-fun b!1168146 () Bool)

(declare-fun res!774515 () Bool)

(assert (=> b!1168146 (=> (not res!774515) (not e!664075))))

(assert (=> b!1168146 (= res!774515 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25524))))

(declare-fun mapIsEmpty!45755 () Bool)

(assert (=> mapIsEmpty!45755 mapRes!45755))

(assert (= (and start!99388 res!774519) b!1168145))

(assert (= (and b!1168145 res!774516) b!1168134))

(assert (= (and b!1168134 res!774513) b!1168141))

(assert (= (and b!1168141 res!774517) b!1168146))

(assert (= (and b!1168146 res!774515) b!1168139))

(assert (= (and b!1168139 res!774508) b!1168136))

(assert (= (and b!1168136 res!774509) b!1168138))

(assert (= (and b!1168138 res!774510) b!1168143))

(assert (= (and b!1168143 res!774511) b!1168140))

(assert (= (and b!1168140 res!774518) b!1168135))

(assert (= (and b!1168135 (not res!774514)) b!1168142))

(assert (= (and b!1168142 (not res!774512)) b!1168132))

(assert (= (and b!1168133 condMapEmpty!45755) mapIsEmpty!45755))

(assert (= (and b!1168133 (not condMapEmpty!45755)) mapNonEmpty!45755))

(get-info :version)

(assert (= (and mapNonEmpty!45755 ((_ is ValueCellFull!13934) mapValue!45755)) b!1168137))

(assert (= (and b!1168133 ((_ is ValueCellFull!13934) mapDefault!45755)) b!1168144))

(assert (= start!99388 b!1168133))

(declare-fun b_lambda!19857 () Bool)

(assert (=> (not b_lambda!19857) (not b!1168142)))

(declare-fun t!37266 () Bool)

(declare-fun tb!9561 () Bool)

(assert (=> (and start!99388 (= defaultEntry!1004 defaultEntry!1004) t!37266) tb!9561))

(declare-fun result!19695 () Bool)

(assert (=> tb!9561 (= result!19695 tp_is_empty!29287)))

(assert (=> b!1168142 t!37266))

(declare-fun b_and!40367 () Bool)

(assert (= b_and!40365 (and (=> t!37266 result!19695) b_and!40367)))

(declare-fun m!1076411 () Bool)

(assert (=> start!99388 m!1076411))

(declare-fun m!1076413 () Bool)

(assert (=> start!99388 m!1076413))

(declare-fun m!1076415 () Bool)

(assert (=> b!1168135 m!1076415))

(declare-fun m!1076417 () Bool)

(assert (=> b!1168135 m!1076417))

(declare-fun m!1076419 () Bool)

(assert (=> b!1168132 m!1076419))

(declare-fun m!1076421 () Bool)

(assert (=> b!1168132 m!1076421))

(assert (=> b!1168132 m!1076421))

(declare-fun m!1076423 () Bool)

(assert (=> b!1168132 m!1076423))

(declare-fun m!1076425 () Bool)

(assert (=> b!1168132 m!1076425))

(declare-fun m!1076427 () Bool)

(assert (=> b!1168146 m!1076427))

(declare-fun m!1076429 () Bool)

(assert (=> mapNonEmpty!45755 m!1076429))

(declare-fun m!1076431 () Bool)

(assert (=> b!1168142 m!1076431))

(declare-fun m!1076433 () Bool)

(assert (=> b!1168142 m!1076433))

(declare-fun m!1076435 () Bool)

(assert (=> b!1168142 m!1076435))

(declare-fun m!1076437 () Bool)

(assert (=> b!1168142 m!1076437))

(declare-fun m!1076439 () Bool)

(assert (=> b!1168143 m!1076439))

(declare-fun m!1076441 () Bool)

(assert (=> b!1168143 m!1076441))

(declare-fun m!1076443 () Bool)

(assert (=> b!1168141 m!1076443))

(declare-fun m!1076445 () Bool)

(assert (=> b!1168136 m!1076445))

(declare-fun m!1076447 () Bool)

(assert (=> b!1168145 m!1076447))

(declare-fun m!1076449 () Bool)

(assert (=> b!1168140 m!1076449))

(declare-fun m!1076451 () Bool)

(assert (=> b!1168138 m!1076451))

(check-sat (not mapNonEmpty!45755) (not b!1168146) (not b!1168140) (not b!1168141) tp_is_empty!29287 (not b_next!24757) b_and!40367 (not b!1168143) (not start!99388) (not b!1168135) (not b!1168136) (not b!1168142) (not b!1168132) (not b_lambda!19857) (not b!1168145))
(check-sat b_and!40367 (not b_next!24757))
