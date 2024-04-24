; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99340 () Bool)

(assert start!99340)

(declare-fun b_free!24709 () Bool)

(declare-fun b_next!24709 () Bool)

(assert (=> start!99340 (= b_free!24709 (not b_next!24709))))

(declare-fun tp!86837 () Bool)

(declare-fun b_and!40269 () Bool)

(assert (=> start!99340 (= tp!86837 b_and!40269)))

(declare-fun mapNonEmpty!45683 () Bool)

(declare-fun mapRes!45683 () Bool)

(declare-fun tp!86838 () Bool)

(declare-fun e!663505 () Bool)

(assert (=> mapNonEmpty!45683 (= mapRes!45683 (and tp!86838 e!663505))))

(declare-fun mapKey!45683 () (_ BitVec 32))

(declare-datatypes ((V!44113 0))(
  ( (V!44114 (val!14676 Int)) )
))
(declare-datatypes ((ValueCell!13910 0))(
  ( (ValueCellFull!13910 (v!17309 V!44113)) (EmptyCell!13910) )
))
(declare-fun mapRest!45683 () (Array (_ BitVec 32) ValueCell!13910))

(declare-fun mapValue!45683 () ValueCell!13910)

(declare-datatypes ((array!75359 0))(
  ( (array!75360 (arr!36324 (Array (_ BitVec 32) ValueCell!13910)) (size!36861 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75359)

(assert (=> mapNonEmpty!45683 (= (arr!36324 _values!996) (store mapRest!45683 mapKey!45683 mapValue!45683))))

(declare-fun b!1167011 () Bool)

(declare-fun res!773653 () Bool)

(declare-fun e!663506 () Bool)

(assert (=> b!1167011 (=> (not res!773653) (not e!663506))))

(declare-datatypes ((array!75361 0))(
  ( (array!75362 (arr!36325 (Array (_ BitVec 32) (_ BitVec 64))) (size!36862 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75361)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1167011 (= res!773653 (and (= (size!36861 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36862 _keys!1208) (size!36861 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167012 () Bool)

(declare-fun e!663508 () Bool)

(declare-fun tp_is_empty!29239 () Bool)

(assert (=> b!1167012 (= e!663508 tp_is_empty!29239)))

(declare-fun res!773656 () Bool)

(assert (=> start!99340 (=> (not res!773656) (not e!663506))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99340 (= res!773656 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36862 _keys!1208))))))

(assert (=> start!99340 e!663506))

(assert (=> start!99340 tp_is_empty!29239))

(declare-fun array_inv!27850 (array!75361) Bool)

(assert (=> start!99340 (array_inv!27850 _keys!1208)))

(assert (=> start!99340 true))

(assert (=> start!99340 tp!86837))

(declare-fun e!663507 () Bool)

(declare-fun array_inv!27851 (array!75359) Bool)

(assert (=> start!99340 (and (array_inv!27851 _values!996) e!663507)))

(declare-fun mapIsEmpty!45683 () Bool)

(assert (=> mapIsEmpty!45683 mapRes!45683))

(declare-fun b!1167013 () Bool)

(declare-fun res!773658 () Bool)

(assert (=> b!1167013 (=> (not res!773658) (not e!663506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167013 (= res!773658 (validMask!0 mask!1564))))

(declare-fun b!1167014 () Bool)

(declare-fun e!663509 () Bool)

(assert (=> b!1167014 (= e!663509 true)))

(declare-fun zeroValue!944 () V!44113)

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((tuple2!18748 0))(
  ( (tuple2!18749 (_1!9385 (_ BitVec 64)) (_2!9385 V!44113)) )
))
(declare-datatypes ((List!25488 0))(
  ( (Nil!25485) (Cons!25484 (h!26702 tuple2!18748) (t!37181 List!25488)) )
))
(declare-datatypes ((ListLongMap!16725 0))(
  ( (ListLongMap!16726 (toList!8378 List!25488)) )
))
(declare-fun lt!525473 () ListLongMap!16725)

(declare-fun minValue!944 () V!44113)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525474 () array!75361)

(declare-fun getCurrentListMapNoExtraKeys!4869 (array!75361 array!75359 (_ BitVec 32) (_ BitVec 32) V!44113 V!44113 (_ BitVec 32) Int) ListLongMap!16725)

(declare-fun dynLambda!2858 (Int (_ BitVec 64)) V!44113)

(assert (=> b!1167014 (= lt!525473 (getCurrentListMapNoExtraKeys!4869 lt!525474 (array!75360 (store (arr!36324 _values!996) i!673 (ValueCellFull!13910 (dynLambda!2858 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36861 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525475 () ListLongMap!16725)

(assert (=> b!1167014 (= lt!525475 (getCurrentListMapNoExtraKeys!4869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167015 () Bool)

(declare-fun res!773659 () Bool)

(declare-fun e!663510 () Bool)

(assert (=> b!1167015 (=> (not res!773659) (not e!663510))))

(declare-datatypes ((List!25489 0))(
  ( (Nil!25486) (Cons!25485 (h!26703 (_ BitVec 64)) (t!37182 List!25489)) )
))
(declare-fun arrayNoDuplicates!0 (array!75361 (_ BitVec 32) List!25489) Bool)

(assert (=> b!1167015 (= res!773659 (arrayNoDuplicates!0 lt!525474 #b00000000000000000000000000000000 Nil!25486))))

(declare-fun b!1167016 () Bool)

(declare-fun res!773657 () Bool)

(assert (=> b!1167016 (=> (not res!773657) (not e!663506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75361 (_ BitVec 32)) Bool)

(assert (=> b!1167016 (= res!773657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167017 () Bool)

(assert (=> b!1167017 (= e!663506 e!663510)))

(declare-fun res!773660 () Bool)

(assert (=> b!1167017 (=> (not res!773660) (not e!663510))))

(assert (=> b!1167017 (= res!773660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525474 mask!1564))))

(assert (=> b!1167017 (= lt!525474 (array!75362 (store (arr!36325 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36862 _keys!1208)))))

(declare-fun b!1167018 () Bool)

(declare-fun res!773655 () Bool)

(assert (=> b!1167018 (=> (not res!773655) (not e!663506))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167018 (= res!773655 (validKeyInArray!0 k0!934))))

(declare-fun b!1167019 () Bool)

(assert (=> b!1167019 (= e!663510 (not e!663509))))

(declare-fun res!773661 () Bool)

(assert (=> b!1167019 (=> res!773661 e!663509)))

(assert (=> b!1167019 (= res!773661 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167019 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38461 0))(
  ( (Unit!38462) )
))
(declare-fun lt!525472 () Unit!38461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75361 (_ BitVec 64) (_ BitVec 32)) Unit!38461)

(assert (=> b!1167019 (= lt!525472 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167020 () Bool)

(declare-fun res!773652 () Bool)

(assert (=> b!1167020 (=> (not res!773652) (not e!663506))))

(assert (=> b!1167020 (= res!773652 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36862 _keys!1208))))))

(declare-fun b!1167021 () Bool)

(assert (=> b!1167021 (= e!663505 tp_is_empty!29239)))

(declare-fun b!1167022 () Bool)

(declare-fun res!773654 () Bool)

(assert (=> b!1167022 (=> (not res!773654) (not e!663506))))

(assert (=> b!1167022 (= res!773654 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25486))))

(declare-fun b!1167023 () Bool)

(assert (=> b!1167023 (= e!663507 (and e!663508 mapRes!45683))))

(declare-fun condMapEmpty!45683 () Bool)

(declare-fun mapDefault!45683 () ValueCell!13910)

(assert (=> b!1167023 (= condMapEmpty!45683 (= (arr!36324 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13910)) mapDefault!45683)))))

(declare-fun b!1167024 () Bool)

(declare-fun res!773651 () Bool)

(assert (=> b!1167024 (=> (not res!773651) (not e!663506))))

(assert (=> b!1167024 (= res!773651 (= (select (arr!36325 _keys!1208) i!673) k0!934))))

(assert (= (and start!99340 res!773656) b!1167013))

(assert (= (and b!1167013 res!773658) b!1167011))

(assert (= (and b!1167011 res!773653) b!1167016))

(assert (= (and b!1167016 res!773657) b!1167022))

(assert (= (and b!1167022 res!773654) b!1167020))

(assert (= (and b!1167020 res!773652) b!1167018))

(assert (= (and b!1167018 res!773655) b!1167024))

(assert (= (and b!1167024 res!773651) b!1167017))

(assert (= (and b!1167017 res!773660) b!1167015))

(assert (= (and b!1167015 res!773659) b!1167019))

(assert (= (and b!1167019 (not res!773661)) b!1167014))

(assert (= (and b!1167023 condMapEmpty!45683) mapIsEmpty!45683))

(assert (= (and b!1167023 (not condMapEmpty!45683)) mapNonEmpty!45683))

(get-info :version)

(assert (= (and mapNonEmpty!45683 ((_ is ValueCellFull!13910) mapValue!45683)) b!1167021))

(assert (= (and b!1167023 ((_ is ValueCellFull!13910) mapDefault!45683)) b!1167012))

(assert (= start!99340 b!1167023))

(declare-fun b_lambda!19809 () Bool)

(assert (=> (not b_lambda!19809) (not b!1167014)))

(declare-fun t!37180 () Bool)

(declare-fun tb!9513 () Bool)

(assert (=> (and start!99340 (= defaultEntry!1004 defaultEntry!1004) t!37180) tb!9513))

(declare-fun result!19599 () Bool)

(assert (=> tb!9513 (= result!19599 tp_is_empty!29239)))

(assert (=> b!1167014 t!37180))

(declare-fun b_and!40271 () Bool)

(assert (= b_and!40269 (and (=> t!37180 result!19599) b_and!40271)))

(declare-fun m!1075427 () Bool)

(assert (=> mapNonEmpty!45683 m!1075427))

(declare-fun m!1075429 () Bool)

(assert (=> b!1167014 m!1075429))

(declare-fun m!1075431 () Bool)

(assert (=> b!1167014 m!1075431))

(declare-fun m!1075433 () Bool)

(assert (=> b!1167014 m!1075433))

(declare-fun m!1075435 () Bool)

(assert (=> b!1167014 m!1075435))

(declare-fun m!1075437 () Bool)

(assert (=> b!1167024 m!1075437))

(declare-fun m!1075439 () Bool)

(assert (=> b!1167013 m!1075439))

(declare-fun m!1075441 () Bool)

(assert (=> b!1167016 m!1075441))

(declare-fun m!1075443 () Bool)

(assert (=> b!1167017 m!1075443))

(declare-fun m!1075445 () Bool)

(assert (=> b!1167017 m!1075445))

(declare-fun m!1075447 () Bool)

(assert (=> b!1167022 m!1075447))

(declare-fun m!1075449 () Bool)

(assert (=> b!1167019 m!1075449))

(declare-fun m!1075451 () Bool)

(assert (=> b!1167019 m!1075451))

(declare-fun m!1075453 () Bool)

(assert (=> b!1167018 m!1075453))

(declare-fun m!1075455 () Bool)

(assert (=> start!99340 m!1075455))

(declare-fun m!1075457 () Bool)

(assert (=> start!99340 m!1075457))

(declare-fun m!1075459 () Bool)

(assert (=> b!1167015 m!1075459))

(check-sat (not b!1167022) (not b!1167017) (not b!1167015) b_and!40271 (not b!1167014) (not b_lambda!19809) (not b!1167018) (not start!99340) (not b_next!24709) (not b!1167019) (not b!1167013) (not mapNonEmpty!45683) tp_is_empty!29239 (not b!1167016))
(check-sat b_and!40271 (not b_next!24709))
