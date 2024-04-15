; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99050 () Bool)

(assert start!99050)

(declare-fun b_free!24661 () Bool)

(declare-fun b_next!24661 () Bool)

(assert (=> start!99050 (= b_free!24661 (not b_next!24661))))

(declare-fun tp!86694 () Bool)

(declare-fun b_and!40149 () Bool)

(assert (=> start!99050 (= tp!86694 b_and!40149)))

(declare-fun b!1164542 () Bool)

(declare-fun res!772287 () Bool)

(declare-fun e!662096 () Bool)

(assert (=> b!1164542 (=> (not res!772287) (not e!662096))))

(declare-datatypes ((array!75138 0))(
  ( (array!75139 (arr!36220 (Array (_ BitVec 32) (_ BitVec 64))) (size!36758 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75138)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44049 0))(
  ( (V!44050 (val!14652 Int)) )
))
(declare-datatypes ((ValueCell!13886 0))(
  ( (ValueCellFull!13886 (v!17288 V!44049)) (EmptyCell!13886) )
))
(declare-datatypes ((array!75140 0))(
  ( (array!75141 (arr!36221 (Array (_ BitVec 32) ValueCell!13886)) (size!36759 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75140)

(assert (=> b!1164542 (= res!772287 (and (= (size!36759 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36758 _keys!1208) (size!36759 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164543 () Bool)

(declare-fun res!772295 () Bool)

(assert (=> b!1164543 (=> (not res!772295) (not e!662096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164543 (= res!772295 (validMask!0 mask!1564))))

(declare-fun res!772291 () Bool)

(assert (=> start!99050 (=> (not res!772291) (not e!662096))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99050 (= res!772291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36758 _keys!1208))))))

(assert (=> start!99050 e!662096))

(declare-fun tp_is_empty!29191 () Bool)

(assert (=> start!99050 tp_is_empty!29191))

(declare-fun array_inv!27812 (array!75138) Bool)

(assert (=> start!99050 (array_inv!27812 _keys!1208)))

(assert (=> start!99050 true))

(assert (=> start!99050 tp!86694))

(declare-fun e!662091 () Bool)

(declare-fun array_inv!27813 (array!75140) Bool)

(assert (=> start!99050 (and (array_inv!27813 _values!996) e!662091)))

(declare-fun b!1164544 () Bool)

(declare-fun res!772293 () Bool)

(assert (=> b!1164544 (=> (not res!772293) (not e!662096))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164544 (= res!772293 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45611 () Bool)

(declare-fun mapRes!45611 () Bool)

(declare-fun tp!86693 () Bool)

(declare-fun e!662094 () Bool)

(assert (=> mapNonEmpty!45611 (= mapRes!45611 (and tp!86693 e!662094))))

(declare-fun mapRest!45611 () (Array (_ BitVec 32) ValueCell!13886))

(declare-fun mapKey!45611 () (_ BitVec 32))

(declare-fun mapValue!45611 () ValueCell!13886)

(assert (=> mapNonEmpty!45611 (= (arr!36221 _values!996) (store mapRest!45611 mapKey!45611 mapValue!45611))))

(declare-fun b!1164545 () Bool)

(declare-fun e!662097 () Bool)

(assert (=> b!1164545 (= e!662091 (and e!662097 mapRes!45611))))

(declare-fun condMapEmpty!45611 () Bool)

(declare-fun mapDefault!45611 () ValueCell!13886)

(assert (=> b!1164545 (= condMapEmpty!45611 (= (arr!36221 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13886)) mapDefault!45611)))))

(declare-fun b!1164546 () Bool)

(declare-fun e!662095 () Bool)

(assert (=> b!1164546 (= e!662095 true)))

(declare-fun zeroValue!944 () V!44049)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18770 0))(
  ( (tuple2!18771 (_1!9396 (_ BitVec 64)) (_2!9396 V!44049)) )
))
(declare-datatypes ((List!25487 0))(
  ( (Nil!25484) (Cons!25483 (h!26692 tuple2!18770) (t!37131 List!25487)) )
))
(declare-datatypes ((ListLongMap!16739 0))(
  ( (ListLongMap!16740 (toList!8385 List!25487)) )
))
(declare-fun lt!524511 () ListLongMap!16739)

(declare-fun minValue!944 () V!44049)

(declare-fun lt!524510 () array!75138)

(declare-fun getCurrentListMapNoExtraKeys!4861 (array!75138 array!75140 (_ BitVec 32) (_ BitVec 32) V!44049 V!44049 (_ BitVec 32) Int) ListLongMap!16739)

(declare-fun dynLambda!2794 (Int (_ BitVec 64)) V!44049)

(assert (=> b!1164546 (= lt!524511 (getCurrentListMapNoExtraKeys!4861 lt!524510 (array!75141 (store (arr!36221 _values!996) i!673 (ValueCellFull!13886 (dynLambda!2794 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36759 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524508 () ListLongMap!16739)

(assert (=> b!1164546 (= lt!524508 (getCurrentListMapNoExtraKeys!4861 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45611 () Bool)

(assert (=> mapIsEmpty!45611 mapRes!45611))

(declare-fun b!1164547 () Bool)

(declare-fun e!662092 () Bool)

(assert (=> b!1164547 (= e!662092 (not e!662095))))

(declare-fun res!772288 () Bool)

(assert (=> b!1164547 (=> res!772288 e!662095)))

(assert (=> b!1164547 (= res!772288 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164547 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38267 0))(
  ( (Unit!38268) )
))
(declare-fun lt!524509 () Unit!38267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75138 (_ BitVec 64) (_ BitVec 32)) Unit!38267)

(assert (=> b!1164547 (= lt!524509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164548 () Bool)

(assert (=> b!1164548 (= e!662094 tp_is_empty!29191)))

(declare-fun b!1164549 () Bool)

(declare-fun res!772286 () Bool)

(assert (=> b!1164549 (=> (not res!772286) (not e!662092))))

(declare-datatypes ((List!25488 0))(
  ( (Nil!25485) (Cons!25484 (h!26693 (_ BitVec 64)) (t!37132 List!25488)) )
))
(declare-fun arrayNoDuplicates!0 (array!75138 (_ BitVec 32) List!25488) Bool)

(assert (=> b!1164549 (= res!772286 (arrayNoDuplicates!0 lt!524510 #b00000000000000000000000000000000 Nil!25485))))

(declare-fun b!1164550 () Bool)

(declare-fun res!772292 () Bool)

(assert (=> b!1164550 (=> (not res!772292) (not e!662096))))

(assert (=> b!1164550 (= res!772292 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25485))))

(declare-fun b!1164551 () Bool)

(assert (=> b!1164551 (= e!662096 e!662092)))

(declare-fun res!772289 () Bool)

(assert (=> b!1164551 (=> (not res!772289) (not e!662092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75138 (_ BitVec 32)) Bool)

(assert (=> b!1164551 (= res!772289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524510 mask!1564))))

(assert (=> b!1164551 (= lt!524510 (array!75139 (store (arr!36220 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36758 _keys!1208)))))

(declare-fun b!1164552 () Bool)

(assert (=> b!1164552 (= e!662097 tp_is_empty!29191)))

(declare-fun b!1164553 () Bool)

(declare-fun res!772290 () Bool)

(assert (=> b!1164553 (=> (not res!772290) (not e!662096))))

(assert (=> b!1164553 (= res!772290 (= (select (arr!36220 _keys!1208) i!673) k0!934))))

(declare-fun b!1164554 () Bool)

(declare-fun res!772294 () Bool)

(assert (=> b!1164554 (=> (not res!772294) (not e!662096))))

(assert (=> b!1164554 (= res!772294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164555 () Bool)

(declare-fun res!772285 () Bool)

(assert (=> b!1164555 (=> (not res!772285) (not e!662096))))

(assert (=> b!1164555 (= res!772285 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36758 _keys!1208))))))

(assert (= (and start!99050 res!772291) b!1164543))

(assert (= (and b!1164543 res!772295) b!1164542))

(assert (= (and b!1164542 res!772287) b!1164554))

(assert (= (and b!1164554 res!772294) b!1164550))

(assert (= (and b!1164550 res!772292) b!1164555))

(assert (= (and b!1164555 res!772285) b!1164544))

(assert (= (and b!1164544 res!772293) b!1164553))

(assert (= (and b!1164553 res!772290) b!1164551))

(assert (= (and b!1164551 res!772289) b!1164549))

(assert (= (and b!1164549 res!772286) b!1164547))

(assert (= (and b!1164547 (not res!772288)) b!1164546))

(assert (= (and b!1164545 condMapEmpty!45611) mapIsEmpty!45611))

(assert (= (and b!1164545 (not condMapEmpty!45611)) mapNonEmpty!45611))

(get-info :version)

(assert (= (and mapNonEmpty!45611 ((_ is ValueCellFull!13886) mapValue!45611)) b!1164548))

(assert (= (and b!1164545 ((_ is ValueCellFull!13886) mapDefault!45611)) b!1164552))

(assert (= start!99050 b!1164545))

(declare-fun b_lambda!19749 () Bool)

(assert (=> (not b_lambda!19749) (not b!1164546)))

(declare-fun t!37130 () Bool)

(declare-fun tb!9465 () Bool)

(assert (=> (and start!99050 (= defaultEntry!1004 defaultEntry!1004) t!37130) tb!9465))

(declare-fun result!19503 () Bool)

(assert (=> tb!9465 (= result!19503 tp_is_empty!29191)))

(assert (=> b!1164546 t!37130))

(declare-fun b_and!40151 () Bool)

(assert (= b_and!40149 (and (=> t!37130 result!19503) b_and!40151)))

(declare-fun m!1072429 () Bool)

(assert (=> start!99050 m!1072429))

(declare-fun m!1072431 () Bool)

(assert (=> start!99050 m!1072431))

(declare-fun m!1072433 () Bool)

(assert (=> mapNonEmpty!45611 m!1072433))

(declare-fun m!1072435 () Bool)

(assert (=> b!1164543 m!1072435))

(declare-fun m!1072437 () Bool)

(assert (=> b!1164546 m!1072437))

(declare-fun m!1072439 () Bool)

(assert (=> b!1164546 m!1072439))

(declare-fun m!1072441 () Bool)

(assert (=> b!1164546 m!1072441))

(declare-fun m!1072443 () Bool)

(assert (=> b!1164546 m!1072443))

(declare-fun m!1072445 () Bool)

(assert (=> b!1164554 m!1072445))

(declare-fun m!1072447 () Bool)

(assert (=> b!1164544 m!1072447))

(declare-fun m!1072449 () Bool)

(assert (=> b!1164553 m!1072449))

(declare-fun m!1072451 () Bool)

(assert (=> b!1164550 m!1072451))

(declare-fun m!1072453 () Bool)

(assert (=> b!1164547 m!1072453))

(declare-fun m!1072455 () Bool)

(assert (=> b!1164547 m!1072455))

(declare-fun m!1072457 () Bool)

(assert (=> b!1164551 m!1072457))

(declare-fun m!1072459 () Bool)

(assert (=> b!1164551 m!1072459))

(declare-fun m!1072461 () Bool)

(assert (=> b!1164549 m!1072461))

(check-sat (not b!1164554) (not b!1164549) (not mapNonEmpty!45611) (not b!1164550) (not b!1164543) (not b!1164544) (not b!1164551) tp_is_empty!29191 b_and!40151 (not b_next!24661) (not b!1164546) (not b!1164547) (not start!99050) (not b_lambda!19749))
(check-sat b_and!40151 (not b_next!24661))
