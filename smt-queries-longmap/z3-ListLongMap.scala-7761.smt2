; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97312 () Bool)

(assert start!97312)

(declare-fun b_free!23283 () Bool)

(declare-fun b_next!23283 () Bool)

(assert (=> start!97312 (= b_free!23283 (not b_next!23283))))

(declare-fun tp!82148 () Bool)

(declare-fun b_and!37397 () Bool)

(assert (=> start!97312 (= tp!82148 b_and!37397)))

(declare-fun b!1108445 () Bool)

(declare-fun e!632335 () Bool)

(declare-fun e!632333 () Bool)

(declare-fun mapRes!43132 () Bool)

(assert (=> b!1108445 (= e!632335 (and e!632333 mapRes!43132))))

(declare-fun condMapEmpty!43132 () Bool)

(declare-datatypes ((V!41851 0))(
  ( (V!41852 (val!13828 Int)) )
))
(declare-datatypes ((ValueCell!13062 0))(
  ( (ValueCellFull!13062 (v!16461 V!41851)) (EmptyCell!13062) )
))
(declare-datatypes ((array!72003 0))(
  ( (array!72004 (arr!34654 (Array (_ BitVec 32) ValueCell!13062)) (size!35190 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72003)

(declare-fun mapDefault!43132 () ValueCell!13062)

(assert (=> b!1108445 (= condMapEmpty!43132 (= (arr!34654 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13062)) mapDefault!43132)))))

(declare-fun mapIsEmpty!43132 () Bool)

(assert (=> mapIsEmpty!43132 mapRes!43132))

(declare-fun b!1108446 () Bool)

(declare-fun res!739743 () Bool)

(declare-fun e!632332 () Bool)

(assert (=> b!1108446 (=> (not res!739743) (not e!632332))))

(declare-datatypes ((array!72005 0))(
  ( (array!72006 (arr!34655 (Array (_ BitVec 32) (_ BitVec 64))) (size!35191 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72005)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72005 (_ BitVec 32)) Bool)

(assert (=> b!1108446 (= res!739743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!739738 () Bool)

(assert (=> start!97312 (=> (not res!739738) (not e!632332))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97312 (= res!739738 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35191 _keys!1208))))))

(assert (=> start!97312 e!632332))

(declare-fun tp_is_empty!27543 () Bool)

(assert (=> start!97312 tp_is_empty!27543))

(declare-fun array_inv!26670 (array!72005) Bool)

(assert (=> start!97312 (array_inv!26670 _keys!1208)))

(assert (=> start!97312 true))

(assert (=> start!97312 tp!82148))

(declare-fun array_inv!26671 (array!72003) Bool)

(assert (=> start!97312 (and (array_inv!26671 _values!996) e!632335)))

(declare-fun b!1108447 () Bool)

(declare-fun res!739741 () Bool)

(declare-fun e!632337 () Bool)

(assert (=> b!1108447 (=> (not res!739741) (not e!632337))))

(declare-fun lt!495810 () array!72005)

(declare-datatypes ((List!24158 0))(
  ( (Nil!24155) (Cons!24154 (h!25363 (_ BitVec 64)) (t!34487 List!24158)) )
))
(declare-fun arrayNoDuplicates!0 (array!72005 (_ BitVec 32) List!24158) Bool)

(assert (=> b!1108447 (= res!739741 (arrayNoDuplicates!0 lt!495810 #b00000000000000000000000000000000 Nil!24155))))

(declare-fun b!1108448 () Bool)

(declare-fun res!739739 () Bool)

(assert (=> b!1108448 (=> (not res!739739) (not e!632332))))

(assert (=> b!1108448 (= res!739739 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24155))))

(declare-fun b!1108449 () Bool)

(assert (=> b!1108449 (= e!632332 e!632337)))

(declare-fun res!739736 () Bool)

(assert (=> b!1108449 (=> (not res!739736) (not e!632337))))

(assert (=> b!1108449 (= res!739736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495810 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108449 (= lt!495810 (array!72006 (store (arr!34655 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35191 _keys!1208)))))

(declare-fun b!1108450 () Bool)

(declare-fun e!632330 () Bool)

(assert (=> b!1108450 (= e!632337 (not e!632330))))

(declare-fun res!739735 () Bool)

(assert (=> b!1108450 (=> res!739735 e!632330)))

(assert (=> b!1108450 (= res!739735 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35191 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108450 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36380 0))(
  ( (Unit!36381) )
))
(declare-fun lt!495812 () Unit!36380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72005 (_ BitVec 64) (_ BitVec 32)) Unit!36380)

(assert (=> b!1108450 (= lt!495812 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108451 () Bool)

(declare-fun res!739740 () Bool)

(assert (=> b!1108451 (=> (not res!739740) (not e!632332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108451 (= res!739740 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!41851)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17474 0))(
  ( (tuple2!17475 (_1!8748 (_ BitVec 64)) (_2!8748 V!41851)) )
))
(declare-datatypes ((List!24159 0))(
  ( (Nil!24156) (Cons!24155 (h!25364 tuple2!17474) (t!34488 List!24159)) )
))
(declare-datatypes ((ListLongMap!15443 0))(
  ( (ListLongMap!15444 (toList!7737 List!24159)) )
))
(declare-fun call!46545 () ListLongMap!15443)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41851)

(declare-fun bm!46542 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4233 (array!72005 array!72003 (_ BitVec 32) (_ BitVec 32) V!41851 V!41851 (_ BitVec 32) Int) ListLongMap!15443)

(declare-fun dynLambda!2365 (Int (_ BitVec 64)) V!41851)

(assert (=> bm!46542 (= call!46545 (getCurrentListMapNoExtraKeys!4233 lt!495810 (array!72004 (store (arr!34654 _values!996) i!673 (ValueCellFull!13062 (dynLambda!2365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35190 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46543 () Bool)

(declare-fun call!46546 () ListLongMap!15443)

(assert (=> bm!46543 (= call!46546 (getCurrentListMapNoExtraKeys!4233 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108452 () Bool)

(assert (=> b!1108452 (= e!632333 tp_is_empty!27543)))

(declare-fun b!1108453 () Bool)

(assert (=> b!1108453 (= e!632330 true)))

(declare-fun e!632334 () Bool)

(assert (=> b!1108453 e!632334))

(declare-fun c!109104 () Bool)

(assert (=> b!1108453 (= c!109104 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495811 () Unit!36380)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!262 (array!72005 array!72003 (_ BitVec 32) (_ BitVec 32) V!41851 V!41851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36380)

(assert (=> b!1108453 (= lt!495811 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108454 () Bool)

(declare-fun e!632331 () Bool)

(assert (=> b!1108454 (= e!632331 tp_is_empty!27543)))

(declare-fun b!1108455 () Bool)

(declare-fun res!739734 () Bool)

(assert (=> b!1108455 (=> (not res!739734) (not e!632332))))

(assert (=> b!1108455 (= res!739734 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35191 _keys!1208))))))

(declare-fun b!1108456 () Bool)

(declare-fun res!739744 () Bool)

(assert (=> b!1108456 (=> (not res!739744) (not e!632332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108456 (= res!739744 (validMask!0 mask!1564))))

(declare-fun b!1108457 () Bool)

(declare-fun res!739742 () Bool)

(assert (=> b!1108457 (=> (not res!739742) (not e!632332))))

(assert (=> b!1108457 (= res!739742 (and (= (size!35190 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35191 _keys!1208) (size!35190 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108458 () Bool)

(declare-fun -!1016 (ListLongMap!15443 (_ BitVec 64)) ListLongMap!15443)

(assert (=> b!1108458 (= e!632334 (= call!46545 (-!1016 call!46546 k0!934)))))

(declare-fun mapNonEmpty!43132 () Bool)

(declare-fun tp!82147 () Bool)

(assert (=> mapNonEmpty!43132 (= mapRes!43132 (and tp!82147 e!632331))))

(declare-fun mapRest!43132 () (Array (_ BitVec 32) ValueCell!13062))

(declare-fun mapValue!43132 () ValueCell!13062)

(declare-fun mapKey!43132 () (_ BitVec 32))

(assert (=> mapNonEmpty!43132 (= (arr!34654 _values!996) (store mapRest!43132 mapKey!43132 mapValue!43132))))

(declare-fun b!1108459 () Bool)

(declare-fun res!739737 () Bool)

(assert (=> b!1108459 (=> (not res!739737) (not e!632332))))

(assert (=> b!1108459 (= res!739737 (= (select (arr!34655 _keys!1208) i!673) k0!934))))

(declare-fun b!1108460 () Bool)

(assert (=> b!1108460 (= e!632334 (= call!46545 call!46546))))

(assert (= (and start!97312 res!739738) b!1108456))

(assert (= (and b!1108456 res!739744) b!1108457))

(assert (= (and b!1108457 res!739742) b!1108446))

(assert (= (and b!1108446 res!739743) b!1108448))

(assert (= (and b!1108448 res!739739) b!1108455))

(assert (= (and b!1108455 res!739734) b!1108451))

(assert (= (and b!1108451 res!739740) b!1108459))

(assert (= (and b!1108459 res!739737) b!1108449))

(assert (= (and b!1108449 res!739736) b!1108447))

(assert (= (and b!1108447 res!739741) b!1108450))

(assert (= (and b!1108450 (not res!739735)) b!1108453))

(assert (= (and b!1108453 c!109104) b!1108458))

(assert (= (and b!1108453 (not c!109104)) b!1108460))

(assert (= (or b!1108458 b!1108460) bm!46542))

(assert (= (or b!1108458 b!1108460) bm!46543))

(assert (= (and b!1108445 condMapEmpty!43132) mapIsEmpty!43132))

(assert (= (and b!1108445 (not condMapEmpty!43132)) mapNonEmpty!43132))

(get-info :version)

(assert (= (and mapNonEmpty!43132 ((_ is ValueCellFull!13062) mapValue!43132)) b!1108454))

(assert (= (and b!1108445 ((_ is ValueCellFull!13062) mapDefault!43132)) b!1108452))

(assert (= start!97312 b!1108445))

(declare-fun b_lambda!18301 () Bool)

(assert (=> (not b_lambda!18301) (not bm!46542)))

(declare-fun t!34486 () Bool)

(declare-fun tb!8149 () Bool)

(assert (=> (and start!97312 (= defaultEntry!1004 defaultEntry!1004) t!34486) tb!8149))

(declare-fun result!16859 () Bool)

(assert (=> tb!8149 (= result!16859 tp_is_empty!27543)))

(assert (=> bm!46542 t!34486))

(declare-fun b_and!37399 () Bool)

(assert (= b_and!37397 (and (=> t!34486 result!16859) b_and!37399)))

(declare-fun m!1026979 () Bool)

(assert (=> b!1108446 m!1026979))

(declare-fun m!1026981 () Bool)

(assert (=> b!1108458 m!1026981))

(declare-fun m!1026983 () Bool)

(assert (=> b!1108448 m!1026983))

(declare-fun m!1026985 () Bool)

(assert (=> b!1108447 m!1026985))

(declare-fun m!1026987 () Bool)

(assert (=> start!97312 m!1026987))

(declare-fun m!1026989 () Bool)

(assert (=> start!97312 m!1026989))

(declare-fun m!1026991 () Bool)

(assert (=> bm!46542 m!1026991))

(declare-fun m!1026993 () Bool)

(assert (=> bm!46542 m!1026993))

(declare-fun m!1026995 () Bool)

(assert (=> bm!46542 m!1026995))

(declare-fun m!1026997 () Bool)

(assert (=> b!1108453 m!1026997))

(declare-fun m!1026999 () Bool)

(assert (=> b!1108450 m!1026999))

(declare-fun m!1027001 () Bool)

(assert (=> b!1108450 m!1027001))

(declare-fun m!1027003 () Bool)

(assert (=> b!1108451 m!1027003))

(declare-fun m!1027005 () Bool)

(assert (=> b!1108449 m!1027005))

(declare-fun m!1027007 () Bool)

(assert (=> b!1108449 m!1027007))

(declare-fun m!1027009 () Bool)

(assert (=> mapNonEmpty!43132 m!1027009))

(declare-fun m!1027011 () Bool)

(assert (=> bm!46543 m!1027011))

(declare-fun m!1027013 () Bool)

(assert (=> b!1108456 m!1027013))

(declare-fun m!1027015 () Bool)

(assert (=> b!1108459 m!1027015))

(check-sat b_and!37399 (not b!1108450) (not bm!46542) (not b!1108451) (not b!1108446) (not b_next!23283) (not b!1108449) tp_is_empty!27543 (not b!1108456) (not mapNonEmpty!43132) (not b!1108448) (not b!1108447) (not start!97312) (not b_lambda!18301) (not bm!46543) (not b!1108453) (not b!1108458))
(check-sat b_and!37399 (not b_next!23283))
