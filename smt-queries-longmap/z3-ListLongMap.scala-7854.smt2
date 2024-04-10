; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97870 () Bool)

(assert start!97870)

(declare-fun b_free!23571 () Bool)

(declare-fun b_next!23571 () Bool)

(assert (=> start!97870 (= b_free!23571 (not b_next!23571))))

(declare-fun tp!83416 () Bool)

(declare-fun b_and!37925 () Bool)

(assert (=> start!97870 (= tp!83416 b_and!37925)))

(declare-fun b!1120486 () Bool)

(declare-fun res!748536 () Bool)

(declare-fun e!638031 () Bool)

(assert (=> b!1120486 (=> (not res!748536) (not e!638031))))

(declare-datatypes ((array!73083 0))(
  ( (array!73084 (arr!35194 (Array (_ BitVec 32) (_ BitVec 64))) (size!35730 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73083)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1120486 (= res!748536 (= (select (arr!35194 _keys!1208) i!673) k0!934))))

(declare-fun b!1120487 () Bool)

(declare-fun e!638032 () Bool)

(declare-fun e!638035 () Bool)

(assert (=> b!1120487 (= e!638032 (not e!638035))))

(declare-fun res!748542 () Bool)

(assert (=> b!1120487 (=> res!748542 e!638035)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1120487 (= res!748542 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120487 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36764 0))(
  ( (Unit!36765) )
))
(declare-fun lt!498041 () Unit!36764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73083 (_ BitVec 64) (_ BitVec 32)) Unit!36764)

(assert (=> b!1120487 (= lt!498041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120488 () Bool)

(declare-fun e!638036 () Bool)

(declare-fun e!638034 () Bool)

(declare-fun mapRes!43969 () Bool)

(assert (=> b!1120488 (= e!638036 (and e!638034 mapRes!43969))))

(declare-fun condMapEmpty!43969 () Bool)

(declare-datatypes ((V!42595 0))(
  ( (V!42596 (val!14107 Int)) )
))
(declare-datatypes ((ValueCell!13341 0))(
  ( (ValueCellFull!13341 (v!16740 V!42595)) (EmptyCell!13341) )
))
(declare-datatypes ((array!73085 0))(
  ( (array!73086 (arr!35195 (Array (_ BitVec 32) ValueCell!13341)) (size!35731 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73085)

(declare-fun mapDefault!43969 () ValueCell!13341)

(assert (=> b!1120488 (= condMapEmpty!43969 (= (arr!35195 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13341)) mapDefault!43969)))))

(declare-fun b!1120489 () Bool)

(declare-fun res!748544 () Bool)

(assert (=> b!1120489 (=> (not res!748544) (not e!638031))))

(assert (=> b!1120489 (= res!748544 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35730 _keys!1208))))))

(declare-fun b!1120490 () Bool)

(declare-fun res!748537 () Bool)

(assert (=> b!1120490 (=> (not res!748537) (not e!638031))))

(declare-datatypes ((List!24485 0))(
  ( (Nil!24482) (Cons!24481 (h!25690 (_ BitVec 64)) (t!35048 List!24485)) )
))
(declare-fun arrayNoDuplicates!0 (array!73083 (_ BitVec 32) List!24485) Bool)

(assert (=> b!1120490 (= res!748537 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24482))))

(declare-fun mapNonEmpty!43969 () Bool)

(declare-fun tp!83417 () Bool)

(declare-fun e!638033 () Bool)

(assert (=> mapNonEmpty!43969 (= mapRes!43969 (and tp!83417 e!638033))))

(declare-fun mapRest!43969 () (Array (_ BitVec 32) ValueCell!13341))

(declare-fun mapKey!43969 () (_ BitVec 32))

(declare-fun mapValue!43969 () ValueCell!13341)

(assert (=> mapNonEmpty!43969 (= (arr!35195 _values!996) (store mapRest!43969 mapKey!43969 mapValue!43969))))

(declare-fun res!748543 () Bool)

(assert (=> start!97870 (=> (not res!748543) (not e!638031))))

(assert (=> start!97870 (= res!748543 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35730 _keys!1208))))))

(assert (=> start!97870 e!638031))

(declare-fun tp_is_empty!28101 () Bool)

(assert (=> start!97870 tp_is_empty!28101))

(declare-fun array_inv!27030 (array!73083) Bool)

(assert (=> start!97870 (array_inv!27030 _keys!1208)))

(assert (=> start!97870 true))

(assert (=> start!97870 tp!83416))

(declare-fun array_inv!27031 (array!73085) Bool)

(assert (=> start!97870 (and (array_inv!27031 _values!996) e!638036)))

(declare-fun b!1120491 () Bool)

(assert (=> b!1120491 (= e!638034 tp_is_empty!28101)))

(declare-fun b!1120492 () Bool)

(declare-fun res!748541 () Bool)

(assert (=> b!1120492 (=> (not res!748541) (not e!638031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120492 (= res!748541 (validKeyInArray!0 k0!934))))

(declare-fun b!1120493 () Bool)

(declare-fun res!748545 () Bool)

(assert (=> b!1120493 (=> (not res!748545) (not e!638031))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120493 (= res!748545 (validMask!0 mask!1564))))

(declare-fun b!1120494 () Bool)

(declare-fun res!748538 () Bool)

(assert (=> b!1120494 (=> (not res!748538) (not e!638031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73083 (_ BitVec 32)) Bool)

(assert (=> b!1120494 (= res!748538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43969 () Bool)

(assert (=> mapIsEmpty!43969 mapRes!43969))

(declare-fun b!1120495 () Bool)

(declare-fun res!748546 () Bool)

(assert (=> b!1120495 (=> (not res!748546) (not e!638032))))

(declare-fun lt!498039 () array!73083)

(assert (=> b!1120495 (= res!748546 (arrayNoDuplicates!0 lt!498039 #b00000000000000000000000000000000 Nil!24482))))

(declare-fun b!1120496 () Bool)

(assert (=> b!1120496 (= e!638033 tp_is_empty!28101)))

(declare-fun b!1120497 () Bool)

(declare-fun res!748540 () Bool)

(assert (=> b!1120497 (=> (not res!748540) (not e!638031))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1120497 (= res!748540 (and (= (size!35731 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35730 _keys!1208) (size!35731 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120498 () Bool)

(assert (=> b!1120498 (= e!638031 e!638032)))

(declare-fun res!748539 () Bool)

(assert (=> b!1120498 (=> (not res!748539) (not e!638032))))

(assert (=> b!1120498 (= res!748539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498039 mask!1564))))

(assert (=> b!1120498 (= lt!498039 (array!73084 (store (arr!35194 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35730 _keys!1208)))))

(declare-fun b!1120499 () Bool)

(assert (=> b!1120499 (= e!638035 true)))

(declare-fun zeroValue!944 () V!42595)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17700 0))(
  ( (tuple2!17701 (_1!8861 (_ BitVec 64)) (_2!8861 V!42595)) )
))
(declare-datatypes ((List!24486 0))(
  ( (Nil!24483) (Cons!24482 (h!25691 tuple2!17700) (t!35049 List!24486)) )
))
(declare-datatypes ((ListLongMap!15669 0))(
  ( (ListLongMap!15670 (toList!7850 List!24486)) )
))
(declare-fun lt!498038 () ListLongMap!15669)

(declare-fun minValue!944 () V!42595)

(declare-fun getCurrentListMapNoExtraKeys!4340 (array!73083 array!73085 (_ BitVec 32) (_ BitVec 32) V!42595 V!42595 (_ BitVec 32) Int) ListLongMap!15669)

(declare-fun dynLambda!2444 (Int (_ BitVec 64)) V!42595)

(assert (=> b!1120499 (= lt!498038 (getCurrentListMapNoExtraKeys!4340 lt!498039 (array!73086 (store (arr!35195 _values!996) i!673 (ValueCellFull!13341 (dynLambda!2444 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35731 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498040 () ListLongMap!15669)

(assert (=> b!1120499 (= lt!498040 (getCurrentListMapNoExtraKeys!4340 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97870 res!748543) b!1120493))

(assert (= (and b!1120493 res!748545) b!1120497))

(assert (= (and b!1120497 res!748540) b!1120494))

(assert (= (and b!1120494 res!748538) b!1120490))

(assert (= (and b!1120490 res!748537) b!1120489))

(assert (= (and b!1120489 res!748544) b!1120492))

(assert (= (and b!1120492 res!748541) b!1120486))

(assert (= (and b!1120486 res!748536) b!1120498))

(assert (= (and b!1120498 res!748539) b!1120495))

(assert (= (and b!1120495 res!748546) b!1120487))

(assert (= (and b!1120487 (not res!748542)) b!1120499))

(assert (= (and b!1120488 condMapEmpty!43969) mapIsEmpty!43969))

(assert (= (and b!1120488 (not condMapEmpty!43969)) mapNonEmpty!43969))

(get-info :version)

(assert (= (and mapNonEmpty!43969 ((_ is ValueCellFull!13341) mapValue!43969)) b!1120496))

(assert (= (and b!1120488 ((_ is ValueCellFull!13341) mapDefault!43969)) b!1120491))

(assert (= start!97870 b!1120488))

(declare-fun b_lambda!18541 () Bool)

(assert (=> (not b_lambda!18541) (not b!1120499)))

(declare-fun t!35047 () Bool)

(declare-fun tb!8383 () Bool)

(assert (=> (and start!97870 (= defaultEntry!1004 defaultEntry!1004) t!35047) tb!8383))

(declare-fun result!17327 () Bool)

(assert (=> tb!8383 (= result!17327 tp_is_empty!28101)))

(assert (=> b!1120499 t!35047))

(declare-fun b_and!37927 () Bool)

(assert (= b_and!37925 (and (=> t!35047 result!17327) b_and!37927)))

(declare-fun m!1035531 () Bool)

(assert (=> mapNonEmpty!43969 m!1035531))

(declare-fun m!1035533 () Bool)

(assert (=> b!1120499 m!1035533))

(declare-fun m!1035535 () Bool)

(assert (=> b!1120499 m!1035535))

(declare-fun m!1035537 () Bool)

(assert (=> b!1120499 m!1035537))

(declare-fun m!1035539 () Bool)

(assert (=> b!1120499 m!1035539))

(declare-fun m!1035541 () Bool)

(assert (=> b!1120486 m!1035541))

(declare-fun m!1035543 () Bool)

(assert (=> b!1120494 m!1035543))

(declare-fun m!1035545 () Bool)

(assert (=> b!1120495 m!1035545))

(declare-fun m!1035547 () Bool)

(assert (=> b!1120498 m!1035547))

(declare-fun m!1035549 () Bool)

(assert (=> b!1120498 m!1035549))

(declare-fun m!1035551 () Bool)

(assert (=> b!1120490 m!1035551))

(declare-fun m!1035553 () Bool)

(assert (=> b!1120492 m!1035553))

(declare-fun m!1035555 () Bool)

(assert (=> b!1120487 m!1035555))

(declare-fun m!1035557 () Bool)

(assert (=> b!1120487 m!1035557))

(declare-fun m!1035559 () Bool)

(assert (=> b!1120493 m!1035559))

(declare-fun m!1035561 () Bool)

(assert (=> start!97870 m!1035561))

(declare-fun m!1035563 () Bool)

(assert (=> start!97870 m!1035563))

(check-sat (not b!1120487) b_and!37927 (not start!97870) (not b!1120490) (not mapNonEmpty!43969) (not b!1120499) tp_is_empty!28101 (not b!1120495) (not b_next!23571) (not b!1120492) (not b!1120494) (not b!1120498) (not b!1120493) (not b_lambda!18541))
(check-sat b_and!37927 (not b_next!23571))
