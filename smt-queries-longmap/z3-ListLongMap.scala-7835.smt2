; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97990 () Bool)

(assert start!97990)

(declare-fun b_free!23455 () Bool)

(declare-fun b_next!23455 () Bool)

(assert (=> start!97990 (= b_free!23455 (not b_next!23455))))

(declare-fun tp!83068 () Bool)

(declare-fun b_and!37739 () Bool)

(assert (=> start!97990 (= tp!83068 b_and!37739)))

(declare-fun b!1119297 () Bool)

(declare-fun res!747148 () Bool)

(declare-fun e!637673 () Bool)

(assert (=> b!1119297 (=> (not res!747148) (not e!637673))))

(declare-datatypes ((array!72907 0))(
  ( (array!72908 (arr!35100 (Array (_ BitVec 32) (_ BitVec 64))) (size!35637 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72907)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119297 (= res!747148 (= (select (arr!35100 _keys!1208) i!673) k0!934))))

(declare-fun b!1119298 () Bool)

(declare-fun e!637671 () Bool)

(assert (=> b!1119298 (= e!637671 true)))

(declare-datatypes ((V!42441 0))(
  ( (V!42442 (val!14049 Int)) )
))
(declare-fun zeroValue!944 () V!42441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17636 0))(
  ( (tuple2!17637 (_1!8829 (_ BitVec 64)) (_2!8829 V!42441)) )
))
(declare-datatypes ((List!24427 0))(
  ( (Nil!24424) (Cons!24423 (h!25641 tuple2!17636) (t!34900 List!24427)) )
))
(declare-datatypes ((ListLongMap!15613 0))(
  ( (ListLongMap!15614 (toList!7822 List!24427)) )
))
(declare-fun lt!497909 () ListLongMap!15613)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13283 0))(
  ( (ValueCellFull!13283 (v!16678 V!42441)) (EmptyCell!13283) )
))
(declare-datatypes ((array!72909 0))(
  ( (array!72910 (arr!35101 (Array (_ BitVec 32) ValueCell!13283)) (size!35638 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72909)

(declare-fun minValue!944 () V!42441)

(declare-fun getCurrentListMapNoExtraKeys!4352 (array!72907 array!72909 (_ BitVec 32) (_ BitVec 32) V!42441 V!42441 (_ BitVec 32) Int) ListLongMap!15613)

(assert (=> b!1119298 (= lt!497909 (getCurrentListMapNoExtraKeys!4352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119299 () Bool)

(declare-fun e!637674 () Bool)

(assert (=> b!1119299 (= e!637673 e!637674)))

(declare-fun res!747152 () Bool)

(assert (=> b!1119299 (=> (not res!747152) (not e!637674))))

(declare-fun lt!497910 () array!72907)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72907 (_ BitVec 32)) Bool)

(assert (=> b!1119299 (= res!747152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497910 mask!1564))))

(assert (=> b!1119299 (= lt!497910 (array!72908 (store (arr!35100 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35637 _keys!1208)))))

(declare-fun mapNonEmpty!43795 () Bool)

(declare-fun mapRes!43795 () Bool)

(declare-fun tp!83069 () Bool)

(declare-fun e!637670 () Bool)

(assert (=> mapNonEmpty!43795 (= mapRes!43795 (and tp!83069 e!637670))))

(declare-fun mapValue!43795 () ValueCell!13283)

(declare-fun mapRest!43795 () (Array (_ BitVec 32) ValueCell!13283))

(declare-fun mapKey!43795 () (_ BitVec 32))

(assert (=> mapNonEmpty!43795 (= (arr!35101 _values!996) (store mapRest!43795 mapKey!43795 mapValue!43795))))

(declare-fun b!1119300 () Bool)

(declare-fun res!747144 () Bool)

(assert (=> b!1119300 (=> (not res!747144) (not e!637673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119300 (= res!747144 (validMask!0 mask!1564))))

(declare-fun b!1119301 () Bool)

(declare-fun res!747147 () Bool)

(assert (=> b!1119301 (=> (not res!747147) (not e!637673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119301 (= res!747147 (validKeyInArray!0 k0!934))))

(declare-fun res!747146 () Bool)

(assert (=> start!97990 (=> (not res!747146) (not e!637673))))

(assert (=> start!97990 (= res!747146 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35637 _keys!1208))))))

(assert (=> start!97990 e!637673))

(declare-fun tp_is_empty!27985 () Bool)

(assert (=> start!97990 tp_is_empty!27985))

(declare-fun array_inv!27038 (array!72907) Bool)

(assert (=> start!97990 (array_inv!27038 _keys!1208)))

(assert (=> start!97990 true))

(assert (=> start!97990 tp!83068))

(declare-fun e!637668 () Bool)

(declare-fun array_inv!27039 (array!72909) Bool)

(assert (=> start!97990 (and (array_inv!27039 _values!996) e!637668)))

(declare-fun b!1119302 () Bool)

(declare-fun res!747145 () Bool)

(assert (=> b!1119302 (=> (not res!747145) (not e!637674))))

(declare-datatypes ((List!24428 0))(
  ( (Nil!24425) (Cons!24424 (h!25642 (_ BitVec 64)) (t!34901 List!24428)) )
))
(declare-fun arrayNoDuplicates!0 (array!72907 (_ BitVec 32) List!24428) Bool)

(assert (=> b!1119302 (= res!747145 (arrayNoDuplicates!0 lt!497910 #b00000000000000000000000000000000 Nil!24425))))

(declare-fun b!1119303 () Bool)

(assert (=> b!1119303 (= e!637674 (not e!637671))))

(declare-fun res!747150 () Bool)

(assert (=> b!1119303 (=> res!747150 e!637671)))

(assert (=> b!1119303 (= res!747150 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119303 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36675 0))(
  ( (Unit!36676) )
))
(declare-fun lt!497911 () Unit!36675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72907 (_ BitVec 64) (_ BitVec 32)) Unit!36675)

(assert (=> b!1119303 (= lt!497911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119304 () Bool)

(assert (=> b!1119304 (= e!637670 tp_is_empty!27985)))

(declare-fun b!1119305 () Bool)

(declare-fun res!747149 () Bool)

(assert (=> b!1119305 (=> (not res!747149) (not e!637673))))

(assert (=> b!1119305 (= res!747149 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24425))))

(declare-fun b!1119306 () Bool)

(declare-fun e!637669 () Bool)

(assert (=> b!1119306 (= e!637669 tp_is_empty!27985)))

(declare-fun b!1119307 () Bool)

(assert (=> b!1119307 (= e!637668 (and e!637669 mapRes!43795))))

(declare-fun condMapEmpty!43795 () Bool)

(declare-fun mapDefault!43795 () ValueCell!13283)

(assert (=> b!1119307 (= condMapEmpty!43795 (= (arr!35101 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13283)) mapDefault!43795)))))

(declare-fun b!1119308 () Bool)

(declare-fun res!747154 () Bool)

(assert (=> b!1119308 (=> (not res!747154) (not e!637673))))

(assert (=> b!1119308 (= res!747154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35637 _keys!1208))))))

(declare-fun b!1119309 () Bool)

(declare-fun res!747153 () Bool)

(assert (=> b!1119309 (=> (not res!747153) (not e!637673))))

(assert (=> b!1119309 (= res!747153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43795 () Bool)

(assert (=> mapIsEmpty!43795 mapRes!43795))

(declare-fun b!1119310 () Bool)

(declare-fun res!747151 () Bool)

(assert (=> b!1119310 (=> (not res!747151) (not e!637673))))

(assert (=> b!1119310 (= res!747151 (and (= (size!35638 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35637 _keys!1208) (size!35638 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97990 res!747146) b!1119300))

(assert (= (and b!1119300 res!747144) b!1119310))

(assert (= (and b!1119310 res!747151) b!1119309))

(assert (= (and b!1119309 res!747153) b!1119305))

(assert (= (and b!1119305 res!747149) b!1119308))

(assert (= (and b!1119308 res!747154) b!1119301))

(assert (= (and b!1119301 res!747147) b!1119297))

(assert (= (and b!1119297 res!747148) b!1119299))

(assert (= (and b!1119299 res!747152) b!1119302))

(assert (= (and b!1119302 res!747145) b!1119303))

(assert (= (and b!1119303 (not res!747150)) b!1119298))

(assert (= (and b!1119307 condMapEmpty!43795) mapIsEmpty!43795))

(assert (= (and b!1119307 (not condMapEmpty!43795)) mapNonEmpty!43795))

(get-info :version)

(assert (= (and mapNonEmpty!43795 ((_ is ValueCellFull!13283) mapValue!43795)) b!1119304))

(assert (= (and b!1119307 ((_ is ValueCellFull!13283) mapDefault!43795)) b!1119306))

(assert (= start!97990 b!1119307))

(declare-fun m!1035339 () Bool)

(assert (=> b!1119297 m!1035339))

(declare-fun m!1035341 () Bool)

(assert (=> b!1119299 m!1035341))

(declare-fun m!1035343 () Bool)

(assert (=> b!1119299 m!1035343))

(declare-fun m!1035345 () Bool)

(assert (=> start!97990 m!1035345))

(declare-fun m!1035347 () Bool)

(assert (=> start!97990 m!1035347))

(declare-fun m!1035349 () Bool)

(assert (=> b!1119305 m!1035349))

(declare-fun m!1035351 () Bool)

(assert (=> b!1119298 m!1035351))

(declare-fun m!1035353 () Bool)

(assert (=> b!1119300 m!1035353))

(declare-fun m!1035355 () Bool)

(assert (=> b!1119301 m!1035355))

(declare-fun m!1035357 () Bool)

(assert (=> b!1119303 m!1035357))

(declare-fun m!1035359 () Bool)

(assert (=> b!1119303 m!1035359))

(declare-fun m!1035361 () Bool)

(assert (=> b!1119302 m!1035361))

(declare-fun m!1035363 () Bool)

(assert (=> mapNonEmpty!43795 m!1035363))

(declare-fun m!1035365 () Bool)

(assert (=> b!1119309 m!1035365))

(check-sat (not b!1119300) (not b_next!23455) (not mapNonEmpty!43795) (not b!1119298) (not b!1119303) b_and!37739 (not b!1119309) (not b!1119301) (not b!1119299) (not b!1119302) (not start!97990) (not b!1119305) tp_is_empty!27985)
(check-sat b_and!37739 (not b_next!23455))
