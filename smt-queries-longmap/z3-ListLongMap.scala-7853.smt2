; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97864 () Bool)

(assert start!97864)

(declare-fun b_free!23565 () Bool)

(declare-fun b_next!23565 () Bool)

(assert (=> start!97864 (= b_free!23565 (not b_next!23565))))

(declare-fun tp!83398 () Bool)

(declare-fun b_and!37913 () Bool)

(assert (=> start!97864 (= tp!83398 b_and!37913)))

(declare-fun b!1120354 () Bool)

(declare-fun res!748444 () Bool)

(declare-fun e!637970 () Bool)

(assert (=> b!1120354 (=> (not res!748444) (not e!637970))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120354 (= res!748444 (validKeyInArray!0 k0!934))))

(declare-fun b!1120355 () Bool)

(declare-fun res!748438 () Bool)

(declare-fun e!637971 () Bool)

(assert (=> b!1120355 (=> (not res!748438) (not e!637971))))

(declare-datatypes ((array!73071 0))(
  ( (array!73072 (arr!35188 (Array (_ BitVec 32) (_ BitVec 64))) (size!35724 (_ BitVec 32))) )
))
(declare-fun lt!498005 () array!73071)

(declare-datatypes ((List!24480 0))(
  ( (Nil!24477) (Cons!24476 (h!25685 (_ BitVec 64)) (t!35037 List!24480)) )
))
(declare-fun arrayNoDuplicates!0 (array!73071 (_ BitVec 32) List!24480) Bool)

(assert (=> b!1120355 (= res!748438 (arrayNoDuplicates!0 lt!498005 #b00000000000000000000000000000000 Nil!24477))))

(declare-fun b!1120356 () Bool)

(declare-fun e!637973 () Bool)

(declare-fun e!637969 () Bool)

(declare-fun mapRes!43960 () Bool)

(assert (=> b!1120356 (= e!637973 (and e!637969 mapRes!43960))))

(declare-fun condMapEmpty!43960 () Bool)

(declare-datatypes ((V!42587 0))(
  ( (V!42588 (val!14104 Int)) )
))
(declare-datatypes ((ValueCell!13338 0))(
  ( (ValueCellFull!13338 (v!16737 V!42587)) (EmptyCell!13338) )
))
(declare-datatypes ((array!73073 0))(
  ( (array!73074 (arr!35189 (Array (_ BitVec 32) ValueCell!13338)) (size!35725 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73073)

(declare-fun mapDefault!43960 () ValueCell!13338)

(assert (=> b!1120356 (= condMapEmpty!43960 (= (arr!35189 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13338)) mapDefault!43960)))))

(declare-fun b!1120357 () Bool)

(declare-fun tp_is_empty!28095 () Bool)

(assert (=> b!1120357 (= e!637969 tp_is_empty!28095)))

(declare-fun b!1120358 () Bool)

(declare-fun e!637972 () Bool)

(assert (=> b!1120358 (= e!637971 (not e!637972))))

(declare-fun res!748440 () Bool)

(assert (=> b!1120358 (=> res!748440 e!637972)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120358 (= res!748440 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!73071)

(declare-fun arrayContainsKey!0 (array!73071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120358 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36762 0))(
  ( (Unit!36763) )
))
(declare-fun lt!498003 () Unit!36762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73071 (_ BitVec 64) (_ BitVec 32)) Unit!36762)

(assert (=> b!1120358 (= lt!498003 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120359 () Bool)

(assert (=> b!1120359 (= e!637972 true)))

(declare-fun zeroValue!944 () V!42587)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42587)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17694 0))(
  ( (tuple2!17695 (_1!8858 (_ BitVec 64)) (_2!8858 V!42587)) )
))
(declare-datatypes ((List!24481 0))(
  ( (Nil!24478) (Cons!24477 (h!25686 tuple2!17694) (t!35038 List!24481)) )
))
(declare-datatypes ((ListLongMap!15663 0))(
  ( (ListLongMap!15664 (toList!7847 List!24481)) )
))
(declare-fun lt!498002 () ListLongMap!15663)

(declare-fun getCurrentListMapNoExtraKeys!4337 (array!73071 array!73073 (_ BitVec 32) (_ BitVec 32) V!42587 V!42587 (_ BitVec 32) Int) ListLongMap!15663)

(declare-fun dynLambda!2441 (Int (_ BitVec 64)) V!42587)

(assert (=> b!1120359 (= lt!498002 (getCurrentListMapNoExtraKeys!4337 lt!498005 (array!73074 (store (arr!35189 _values!996) i!673 (ValueCellFull!13338 (dynLambda!2441 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35725 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498004 () ListLongMap!15663)

(assert (=> b!1120359 (= lt!498004 (getCurrentListMapNoExtraKeys!4337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120360 () Bool)

(declare-fun res!748442 () Bool)

(assert (=> b!1120360 (=> (not res!748442) (not e!637970))))

(assert (=> b!1120360 (= res!748442 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24477))))

(declare-fun b!1120361 () Bool)

(declare-fun res!748439 () Bool)

(assert (=> b!1120361 (=> (not res!748439) (not e!637970))))

(assert (=> b!1120361 (= res!748439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35724 _keys!1208))))))

(declare-fun mapIsEmpty!43960 () Bool)

(assert (=> mapIsEmpty!43960 mapRes!43960))

(declare-fun b!1120362 () Bool)

(assert (=> b!1120362 (= e!637970 e!637971)))

(declare-fun res!748446 () Bool)

(assert (=> b!1120362 (=> (not res!748446) (not e!637971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73071 (_ BitVec 32)) Bool)

(assert (=> b!1120362 (= res!748446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498005 mask!1564))))

(assert (=> b!1120362 (= lt!498005 (array!73072 (store (arr!35188 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35724 _keys!1208)))))

(declare-fun b!1120363 () Bool)

(declare-fun res!748437 () Bool)

(assert (=> b!1120363 (=> (not res!748437) (not e!637970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120363 (= res!748437 (validMask!0 mask!1564))))

(declare-fun res!748445 () Bool)

(assert (=> start!97864 (=> (not res!748445) (not e!637970))))

(assert (=> start!97864 (= res!748445 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35724 _keys!1208))))))

(assert (=> start!97864 e!637970))

(assert (=> start!97864 tp_is_empty!28095))

(declare-fun array_inv!27026 (array!73071) Bool)

(assert (=> start!97864 (array_inv!27026 _keys!1208)))

(assert (=> start!97864 true))

(assert (=> start!97864 tp!83398))

(declare-fun array_inv!27027 (array!73073) Bool)

(assert (=> start!97864 (and (array_inv!27027 _values!996) e!637973)))

(declare-fun mapNonEmpty!43960 () Bool)

(declare-fun tp!83399 () Bool)

(declare-fun e!637974 () Bool)

(assert (=> mapNonEmpty!43960 (= mapRes!43960 (and tp!83399 e!637974))))

(declare-fun mapValue!43960 () ValueCell!13338)

(declare-fun mapKey!43960 () (_ BitVec 32))

(declare-fun mapRest!43960 () (Array (_ BitVec 32) ValueCell!13338))

(assert (=> mapNonEmpty!43960 (= (arr!35189 _values!996) (store mapRest!43960 mapKey!43960 mapValue!43960))))

(declare-fun b!1120364 () Bool)

(assert (=> b!1120364 (= e!637974 tp_is_empty!28095)))

(declare-fun b!1120365 () Bool)

(declare-fun res!748447 () Bool)

(assert (=> b!1120365 (=> (not res!748447) (not e!637970))))

(assert (=> b!1120365 (= res!748447 (= (select (arr!35188 _keys!1208) i!673) k0!934))))

(declare-fun b!1120366 () Bool)

(declare-fun res!748443 () Bool)

(assert (=> b!1120366 (=> (not res!748443) (not e!637970))))

(assert (=> b!1120366 (= res!748443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120367 () Bool)

(declare-fun res!748441 () Bool)

(assert (=> b!1120367 (=> (not res!748441) (not e!637970))))

(assert (=> b!1120367 (= res!748441 (and (= (size!35725 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35724 _keys!1208) (size!35725 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97864 res!748445) b!1120363))

(assert (= (and b!1120363 res!748437) b!1120367))

(assert (= (and b!1120367 res!748441) b!1120366))

(assert (= (and b!1120366 res!748443) b!1120360))

(assert (= (and b!1120360 res!748442) b!1120361))

(assert (= (and b!1120361 res!748439) b!1120354))

(assert (= (and b!1120354 res!748444) b!1120365))

(assert (= (and b!1120365 res!748447) b!1120362))

(assert (= (and b!1120362 res!748446) b!1120355))

(assert (= (and b!1120355 res!748438) b!1120358))

(assert (= (and b!1120358 (not res!748440)) b!1120359))

(assert (= (and b!1120356 condMapEmpty!43960) mapIsEmpty!43960))

(assert (= (and b!1120356 (not condMapEmpty!43960)) mapNonEmpty!43960))

(get-info :version)

(assert (= (and mapNonEmpty!43960 ((_ is ValueCellFull!13338) mapValue!43960)) b!1120364))

(assert (= (and b!1120356 ((_ is ValueCellFull!13338) mapDefault!43960)) b!1120357))

(assert (= start!97864 b!1120356))

(declare-fun b_lambda!18535 () Bool)

(assert (=> (not b_lambda!18535) (not b!1120359)))

(declare-fun t!35036 () Bool)

(declare-fun tb!8377 () Bool)

(assert (=> (and start!97864 (= defaultEntry!1004 defaultEntry!1004) t!35036) tb!8377))

(declare-fun result!17315 () Bool)

(assert (=> tb!8377 (= result!17315 tp_is_empty!28095)))

(assert (=> b!1120359 t!35036))

(declare-fun b_and!37915 () Bool)

(assert (= b_and!37913 (and (=> t!35036 result!17315) b_and!37915)))

(declare-fun m!1035429 () Bool)

(assert (=> b!1120358 m!1035429))

(declare-fun m!1035431 () Bool)

(assert (=> b!1120358 m!1035431))

(declare-fun m!1035433 () Bool)

(assert (=> b!1120355 m!1035433))

(declare-fun m!1035435 () Bool)

(assert (=> b!1120363 m!1035435))

(declare-fun m!1035437 () Bool)

(assert (=> b!1120354 m!1035437))

(declare-fun m!1035439 () Bool)

(assert (=> b!1120365 m!1035439))

(declare-fun m!1035441 () Bool)

(assert (=> mapNonEmpty!43960 m!1035441))

(declare-fun m!1035443 () Bool)

(assert (=> b!1120360 m!1035443))

(declare-fun m!1035445 () Bool)

(assert (=> start!97864 m!1035445))

(declare-fun m!1035447 () Bool)

(assert (=> start!97864 m!1035447))

(declare-fun m!1035449 () Bool)

(assert (=> b!1120359 m!1035449))

(declare-fun m!1035451 () Bool)

(assert (=> b!1120359 m!1035451))

(declare-fun m!1035453 () Bool)

(assert (=> b!1120359 m!1035453))

(declare-fun m!1035455 () Bool)

(assert (=> b!1120359 m!1035455))

(declare-fun m!1035457 () Bool)

(assert (=> b!1120362 m!1035457))

(declare-fun m!1035459 () Bool)

(assert (=> b!1120362 m!1035459))

(declare-fun m!1035461 () Bool)

(assert (=> b!1120366 m!1035461))

(check-sat (not b!1120363) (not b!1120354) (not b!1120362) (not b!1120360) (not b_next!23565) (not start!97864) (not mapNonEmpty!43960) b_and!37915 (not b!1120358) (not b_lambda!18535) (not b!1120355) (not b!1120359) tp_is_empty!28095 (not b!1120366))
(check-sat b_and!37915 (not b_next!23565))
