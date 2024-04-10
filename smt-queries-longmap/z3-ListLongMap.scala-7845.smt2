; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97816 () Bool)

(assert start!97816)

(declare-fun b_free!23517 () Bool)

(declare-fun b_next!23517 () Bool)

(assert (=> start!97816 (= b_free!23517 (not b_next!23517))))

(declare-fun tp!83255 () Bool)

(declare-fun b_and!37817 () Bool)

(assert (=> start!97816 (= tp!83255 b_and!37817)))

(declare-fun mapNonEmpty!43888 () Bool)

(declare-fun mapRes!43888 () Bool)

(declare-fun tp!83254 () Bool)

(declare-fun e!637467 () Bool)

(assert (=> mapNonEmpty!43888 (= mapRes!43888 (and tp!83254 e!637467))))

(declare-fun mapKey!43888 () (_ BitVec 32))

(declare-datatypes ((V!42523 0))(
  ( (V!42524 (val!14080 Int)) )
))
(declare-datatypes ((ValueCell!13314 0))(
  ( (ValueCellFull!13314 (v!16713 V!42523)) (EmptyCell!13314) )
))
(declare-fun mapRest!43888 () (Array (_ BitVec 32) ValueCell!13314))

(declare-datatypes ((array!72979 0))(
  ( (array!72980 (arr!35142 (Array (_ BitVec 32) ValueCell!13314)) (size!35678 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72979)

(declare-fun mapValue!43888 () ValueCell!13314)

(assert (=> mapNonEmpty!43888 (= (arr!35142 _values!996) (store mapRest!43888 mapKey!43888 mapValue!43888))))

(declare-fun mapIsEmpty!43888 () Bool)

(assert (=> mapIsEmpty!43888 mapRes!43888))

(declare-fun b!1119298 () Bool)

(declare-fun e!637470 () Bool)

(declare-fun e!637464 () Bool)

(assert (=> b!1119298 (= e!637470 (and e!637464 mapRes!43888))))

(declare-fun condMapEmpty!43888 () Bool)

(declare-fun mapDefault!43888 () ValueCell!13314)

(assert (=> b!1119298 (= condMapEmpty!43888 (= (arr!35142 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13314)) mapDefault!43888)))))

(declare-fun b!1119299 () Bool)

(declare-fun res!747647 () Bool)

(declare-fun e!637468 () Bool)

(assert (=> b!1119299 (=> (not res!747647) (not e!637468))))

(declare-datatypes ((array!72981 0))(
  ( (array!72982 (arr!35143 (Array (_ BitVec 32) (_ BitVec 64))) (size!35679 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72981)

(declare-datatypes ((List!24448 0))(
  ( (Nil!24445) (Cons!24444 (h!25653 (_ BitVec 64)) (t!34957 List!24448)) )
))
(declare-fun arrayNoDuplicates!0 (array!72981 (_ BitVec 32) List!24448) Bool)

(assert (=> b!1119299 (= res!747647 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24445))))

(declare-fun b!1119300 () Bool)

(declare-fun res!747655 () Bool)

(assert (=> b!1119300 (=> (not res!747655) (not e!637468))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119300 (= res!747655 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35679 _keys!1208))))))

(declare-fun b!1119301 () Bool)

(declare-fun res!747648 () Bool)

(assert (=> b!1119301 (=> (not res!747648) (not e!637468))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119301 (= res!747648 (= (select (arr!35143 _keys!1208) i!673) k0!934))))

(declare-fun b!1119302 () Bool)

(declare-fun res!747652 () Bool)

(assert (=> b!1119302 (=> (not res!747652) (not e!637468))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1119302 (= res!747652 (and (= (size!35678 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35679 _keys!1208) (size!35678 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!747646 () Bool)

(assert (=> start!97816 (=> (not res!747646) (not e!637468))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97816 (= res!747646 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35679 _keys!1208))))))

(assert (=> start!97816 e!637468))

(declare-fun tp_is_empty!28047 () Bool)

(assert (=> start!97816 tp_is_empty!28047))

(declare-fun array_inv!27000 (array!72981) Bool)

(assert (=> start!97816 (array_inv!27000 _keys!1208)))

(assert (=> start!97816 true))

(assert (=> start!97816 tp!83255))

(declare-fun array_inv!27001 (array!72979) Bool)

(assert (=> start!97816 (and (array_inv!27001 _values!996) e!637470)))

(declare-fun b!1119303 () Bool)

(declare-fun res!747650 () Bool)

(assert (=> b!1119303 (=> (not res!747650) (not e!637468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119303 (= res!747650 (validKeyInArray!0 k0!934))))

(declare-fun b!1119304 () Bool)

(declare-fun res!747651 () Bool)

(assert (=> b!1119304 (=> (not res!747651) (not e!637468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119304 (= res!747651 (validMask!0 mask!1564))))

(declare-fun b!1119305 () Bool)

(declare-fun e!637465 () Bool)

(assert (=> b!1119305 (= e!637465 true)))

(declare-fun zeroValue!944 () V!42523)

(declare-datatypes ((tuple2!17664 0))(
  ( (tuple2!17665 (_1!8843 (_ BitVec 64)) (_2!8843 V!42523)) )
))
(declare-datatypes ((List!24449 0))(
  ( (Nil!24446) (Cons!24445 (h!25654 tuple2!17664) (t!34958 List!24449)) )
))
(declare-datatypes ((ListLongMap!15633 0))(
  ( (ListLongMap!15634 (toList!7832 List!24449)) )
))
(declare-fun lt!497717 () ListLongMap!15633)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42523)

(declare-fun lt!497715 () array!72981)

(declare-fun getCurrentListMapNoExtraKeys!4322 (array!72981 array!72979 (_ BitVec 32) (_ BitVec 32) V!42523 V!42523 (_ BitVec 32) Int) ListLongMap!15633)

(declare-fun dynLambda!2426 (Int (_ BitVec 64)) V!42523)

(assert (=> b!1119305 (= lt!497717 (getCurrentListMapNoExtraKeys!4322 lt!497715 (array!72980 (store (arr!35142 _values!996) i!673 (ValueCellFull!13314 (dynLambda!2426 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35678 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497714 () ListLongMap!15633)

(assert (=> b!1119305 (= lt!497714 (getCurrentListMapNoExtraKeys!4322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119306 () Bool)

(declare-fun res!747645 () Bool)

(assert (=> b!1119306 (=> (not res!747645) (not e!637468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72981 (_ BitVec 32)) Bool)

(assert (=> b!1119306 (= res!747645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119307 () Bool)

(declare-fun e!637469 () Bool)

(assert (=> b!1119307 (= e!637469 (not e!637465))))

(declare-fun res!747649 () Bool)

(assert (=> b!1119307 (=> res!747649 e!637465)))

(assert (=> b!1119307 (= res!747649 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119307 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36732 0))(
  ( (Unit!36733) )
))
(declare-fun lt!497716 () Unit!36732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72981 (_ BitVec 64) (_ BitVec 32)) Unit!36732)

(assert (=> b!1119307 (= lt!497716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119308 () Bool)

(declare-fun res!747653 () Bool)

(assert (=> b!1119308 (=> (not res!747653) (not e!637469))))

(assert (=> b!1119308 (= res!747653 (arrayNoDuplicates!0 lt!497715 #b00000000000000000000000000000000 Nil!24445))))

(declare-fun b!1119309 () Bool)

(assert (=> b!1119309 (= e!637467 tp_is_empty!28047)))

(declare-fun b!1119310 () Bool)

(assert (=> b!1119310 (= e!637464 tp_is_empty!28047)))

(declare-fun b!1119311 () Bool)

(assert (=> b!1119311 (= e!637468 e!637469)))

(declare-fun res!747654 () Bool)

(assert (=> b!1119311 (=> (not res!747654) (not e!637469))))

(assert (=> b!1119311 (= res!747654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497715 mask!1564))))

(assert (=> b!1119311 (= lt!497715 (array!72982 (store (arr!35143 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35679 _keys!1208)))))

(assert (= (and start!97816 res!747646) b!1119304))

(assert (= (and b!1119304 res!747651) b!1119302))

(assert (= (and b!1119302 res!747652) b!1119306))

(assert (= (and b!1119306 res!747645) b!1119299))

(assert (= (and b!1119299 res!747647) b!1119300))

(assert (= (and b!1119300 res!747655) b!1119303))

(assert (= (and b!1119303 res!747650) b!1119301))

(assert (= (and b!1119301 res!747648) b!1119311))

(assert (= (and b!1119311 res!747654) b!1119308))

(assert (= (and b!1119308 res!747653) b!1119307))

(assert (= (and b!1119307 (not res!747649)) b!1119305))

(assert (= (and b!1119298 condMapEmpty!43888) mapIsEmpty!43888))

(assert (= (and b!1119298 (not condMapEmpty!43888)) mapNonEmpty!43888))

(get-info :version)

(assert (= (and mapNonEmpty!43888 ((_ is ValueCellFull!13314) mapValue!43888)) b!1119309))

(assert (= (and b!1119298 ((_ is ValueCellFull!13314) mapDefault!43888)) b!1119310))

(assert (= start!97816 b!1119298))

(declare-fun b_lambda!18487 () Bool)

(assert (=> (not b_lambda!18487) (not b!1119305)))

(declare-fun t!34956 () Bool)

(declare-fun tb!8329 () Bool)

(assert (=> (and start!97816 (= defaultEntry!1004 defaultEntry!1004) t!34956) tb!8329))

(declare-fun result!17219 () Bool)

(assert (=> tb!8329 (= result!17219 tp_is_empty!28047)))

(assert (=> b!1119305 t!34956))

(declare-fun b_and!37819 () Bool)

(assert (= b_and!37817 (and (=> t!34956 result!17219) b_and!37819)))

(declare-fun m!1034613 () Bool)

(assert (=> start!97816 m!1034613))

(declare-fun m!1034615 () Bool)

(assert (=> start!97816 m!1034615))

(declare-fun m!1034617 () Bool)

(assert (=> b!1119301 m!1034617))

(declare-fun m!1034619 () Bool)

(assert (=> b!1119299 m!1034619))

(declare-fun m!1034621 () Bool)

(assert (=> b!1119306 m!1034621))

(declare-fun m!1034623 () Bool)

(assert (=> b!1119303 m!1034623))

(declare-fun m!1034625 () Bool)

(assert (=> b!1119304 m!1034625))

(declare-fun m!1034627 () Bool)

(assert (=> mapNonEmpty!43888 m!1034627))

(declare-fun m!1034629 () Bool)

(assert (=> b!1119305 m!1034629))

(declare-fun m!1034631 () Bool)

(assert (=> b!1119305 m!1034631))

(declare-fun m!1034633 () Bool)

(assert (=> b!1119305 m!1034633))

(declare-fun m!1034635 () Bool)

(assert (=> b!1119305 m!1034635))

(declare-fun m!1034637 () Bool)

(assert (=> b!1119311 m!1034637))

(declare-fun m!1034639 () Bool)

(assert (=> b!1119311 m!1034639))

(declare-fun m!1034641 () Bool)

(assert (=> b!1119308 m!1034641))

(declare-fun m!1034643 () Bool)

(assert (=> b!1119307 m!1034643))

(declare-fun m!1034645 () Bool)

(assert (=> b!1119307 m!1034645))

(check-sat (not mapNonEmpty!43888) (not b!1119306) (not b_lambda!18487) b_and!37819 tp_is_empty!28047 (not b!1119307) (not b_next!23517) (not b!1119304) (not b!1119303) (not start!97816) (not b!1119308) (not b!1119305) (not b!1119299) (not b!1119311))
(check-sat b_and!37819 (not b_next!23517))
