; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98080 () Bool)

(assert start!98080)

(declare-fun b_free!23545 () Bool)

(declare-fun b_next!23545 () Bool)

(assert (=> start!98080 (= b_free!23545 (not b_next!23545))))

(declare-fun tp!83339 () Bool)

(declare-fun b_and!37883 () Bool)

(assert (=> start!98080 (= tp!83339 b_and!37883)))

(declare-fun b!1121241 () Bool)

(declare-fun res!748638 () Bool)

(declare-fun e!638616 () Bool)

(assert (=> b!1121241 (=> (not res!748638) (not e!638616))))

(declare-datatypes ((array!73081 0))(
  ( (array!73082 (arr!35187 (Array (_ BitVec 32) (_ BitVec 64))) (size!35724 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73081)

(declare-datatypes ((List!24489 0))(
  ( (Nil!24486) (Cons!24485 (h!25703 (_ BitVec 64)) (t!35018 List!24489)) )
))
(declare-fun arrayNoDuplicates!0 (array!73081 (_ BitVec 32) List!24489) Bool)

(assert (=> b!1121241 (= res!748638 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24486))))

(declare-fun b!1121242 () Bool)

(declare-fun res!748633 () Bool)

(assert (=> b!1121242 (=> (not res!748633) (not e!638616))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121242 (= res!748633 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35724 _keys!1208))))))

(declare-fun b!1121243 () Bool)

(declare-fun e!638614 () Bool)

(declare-fun e!638618 () Bool)

(declare-fun mapRes!43930 () Bool)

(assert (=> b!1121243 (= e!638614 (and e!638618 mapRes!43930))))

(declare-fun condMapEmpty!43930 () Bool)

(declare-datatypes ((V!42561 0))(
  ( (V!42562 (val!14094 Int)) )
))
(declare-datatypes ((ValueCell!13328 0))(
  ( (ValueCellFull!13328 (v!16723 V!42561)) (EmptyCell!13328) )
))
(declare-datatypes ((array!73083 0))(
  ( (array!73084 (arr!35188 (Array (_ BitVec 32) ValueCell!13328)) (size!35725 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73083)

(declare-fun mapDefault!43930 () ValueCell!13328)

(assert (=> b!1121243 (= condMapEmpty!43930 (= (arr!35188 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13328)) mapDefault!43930)))))

(declare-fun b!1121244 () Bool)

(declare-fun e!638619 () Bool)

(assert (=> b!1121244 (= e!638616 e!638619)))

(declare-fun res!748631 () Bool)

(assert (=> b!1121244 (=> (not res!748631) (not e!638619))))

(declare-fun lt!498398 () array!73081)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73081 (_ BitVec 32)) Bool)

(assert (=> b!1121244 (= res!748631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498398 mask!1564))))

(assert (=> b!1121244 (= lt!498398 (array!73082 (store (arr!35187 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35724 _keys!1208)))))

(declare-fun b!1121245 () Bool)

(declare-fun res!748630 () Bool)

(assert (=> b!1121245 (=> (not res!748630) (not e!638616))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121245 (= res!748630 (validKeyInArray!0 k0!934))))

(declare-fun b!1121246 () Bool)

(declare-fun e!638615 () Bool)

(declare-fun tp_is_empty!28075 () Bool)

(assert (=> b!1121246 (= e!638615 tp_is_empty!28075)))

(declare-fun b!1121247 () Bool)

(declare-fun res!748629 () Bool)

(assert (=> b!1121247 (=> (not res!748629) (not e!638616))))

(assert (=> b!1121247 (= res!748629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43930 () Bool)

(assert (=> mapIsEmpty!43930 mapRes!43930))

(declare-fun b!1121248 () Bool)

(declare-fun res!748632 () Bool)

(assert (=> b!1121248 (=> (not res!748632) (not e!638616))))

(assert (=> b!1121248 (= res!748632 (= (select (arr!35187 _keys!1208) i!673) k0!934))))

(declare-fun b!1121249 () Bool)

(assert (=> b!1121249 (= e!638618 tp_is_empty!28075)))

(declare-fun b!1121250 () Bool)

(declare-fun res!748635 () Bool)

(assert (=> b!1121250 (=> (not res!748635) (not e!638616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121250 (= res!748635 (validMask!0 mask!1564))))

(declare-fun b!1121251 () Bool)

(declare-fun res!748634 () Bool)

(assert (=> b!1121251 (=> (not res!748634) (not e!638619))))

(assert (=> b!1121251 (= res!748634 (arrayNoDuplicates!0 lt!498398 #b00000000000000000000000000000000 Nil!24486))))

(declare-fun res!748637 () Bool)

(assert (=> start!98080 (=> (not res!748637) (not e!638616))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98080 (= res!748637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35724 _keys!1208))))))

(assert (=> start!98080 e!638616))

(assert (=> start!98080 tp_is_empty!28075))

(declare-fun array_inv!27088 (array!73081) Bool)

(assert (=> start!98080 (array_inv!27088 _keys!1208)))

(assert (=> start!98080 true))

(assert (=> start!98080 tp!83339))

(declare-fun array_inv!27089 (array!73083) Bool)

(assert (=> start!98080 (and (array_inv!27089 _values!996) e!638614)))

(declare-fun b!1121252 () Bool)

(declare-fun res!748636 () Bool)

(assert (=> b!1121252 (=> (not res!748636) (not e!638616))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1121252 (= res!748636 (and (= (size!35725 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35724 _keys!1208) (size!35725 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121253 () Bool)

(declare-fun e!638613 () Bool)

(assert (=> b!1121253 (= e!638613 true)))

(declare-fun zeroValue!944 () V!42561)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17694 0))(
  ( (tuple2!17695 (_1!8858 (_ BitVec 64)) (_2!8858 V!42561)) )
))
(declare-datatypes ((List!24490 0))(
  ( (Nil!24487) (Cons!24486 (h!25704 tuple2!17694) (t!35019 List!24490)) )
))
(declare-datatypes ((ListLongMap!15671 0))(
  ( (ListLongMap!15672 (toList!7851 List!24490)) )
))
(declare-fun lt!498400 () ListLongMap!15671)

(declare-fun minValue!944 () V!42561)

(declare-fun getCurrentListMapNoExtraKeys!4381 (array!73081 array!73083 (_ BitVec 32) (_ BitVec 32) V!42561 V!42561 (_ BitVec 32) Int) ListLongMap!15671)

(declare-fun dynLambda!2470 (Int (_ BitVec 64)) V!42561)

(assert (=> b!1121253 (= lt!498400 (getCurrentListMapNoExtraKeys!4381 lt!498398 (array!73084 (store (arr!35188 _values!996) i!673 (ValueCellFull!13328 (dynLambda!2470 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35725 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498399 () ListLongMap!15671)

(assert (=> b!1121253 (= lt!498399 (getCurrentListMapNoExtraKeys!4381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43930 () Bool)

(declare-fun tp!83338 () Bool)

(assert (=> mapNonEmpty!43930 (= mapRes!43930 (and tp!83338 e!638615))))

(declare-fun mapValue!43930 () ValueCell!13328)

(declare-fun mapRest!43930 () (Array (_ BitVec 32) ValueCell!13328))

(declare-fun mapKey!43930 () (_ BitVec 32))

(assert (=> mapNonEmpty!43930 (= (arr!35188 _values!996) (store mapRest!43930 mapKey!43930 mapValue!43930))))

(declare-fun b!1121254 () Bool)

(assert (=> b!1121254 (= e!638619 (not e!638613))))

(declare-fun res!748639 () Bool)

(assert (=> b!1121254 (=> res!748639 e!638613)))

(assert (=> b!1121254 (= res!748639 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121254 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36735 0))(
  ( (Unit!36736) )
))
(declare-fun lt!498397 () Unit!36735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73081 (_ BitVec 64) (_ BitVec 32)) Unit!36735)

(assert (=> b!1121254 (= lt!498397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98080 res!748637) b!1121250))

(assert (= (and b!1121250 res!748635) b!1121252))

(assert (= (and b!1121252 res!748636) b!1121247))

(assert (= (and b!1121247 res!748629) b!1121241))

(assert (= (and b!1121241 res!748638) b!1121242))

(assert (= (and b!1121242 res!748633) b!1121245))

(assert (= (and b!1121245 res!748630) b!1121248))

(assert (= (and b!1121248 res!748632) b!1121244))

(assert (= (and b!1121244 res!748631) b!1121251))

(assert (= (and b!1121251 res!748634) b!1121254))

(assert (= (and b!1121254 (not res!748639)) b!1121253))

(assert (= (and b!1121243 condMapEmpty!43930) mapIsEmpty!43930))

(assert (= (and b!1121243 (not condMapEmpty!43930)) mapNonEmpty!43930))

(get-info :version)

(assert (= (and mapNonEmpty!43930 ((_ is ValueCellFull!13328) mapValue!43930)) b!1121246))

(assert (= (and b!1121243 ((_ is ValueCellFull!13328) mapDefault!43930)) b!1121249))

(assert (= start!98080 b!1121243))

(declare-fun b_lambda!18525 () Bool)

(assert (=> (not b_lambda!18525) (not b!1121253)))

(declare-fun t!35017 () Bool)

(declare-fun tb!8349 () Bool)

(assert (=> (and start!98080 (= defaultEntry!1004 defaultEntry!1004) t!35017) tb!8349))

(declare-fun result!17267 () Bool)

(assert (=> tb!8349 (= result!17267 tp_is_empty!28075)))

(assert (=> b!1121253 t!35017))

(declare-fun b_and!37885 () Bool)

(assert (= b_and!37883 (and (=> t!35017 result!17267) b_and!37885)))

(declare-fun m!1036761 () Bool)

(assert (=> b!1121247 m!1036761))

(declare-fun m!1036763 () Bool)

(assert (=> b!1121248 m!1036763))

(declare-fun m!1036765 () Bool)

(assert (=> start!98080 m!1036765))

(declare-fun m!1036767 () Bool)

(assert (=> start!98080 m!1036767))

(declare-fun m!1036769 () Bool)

(assert (=> b!1121244 m!1036769))

(declare-fun m!1036771 () Bool)

(assert (=> b!1121244 m!1036771))

(declare-fun m!1036773 () Bool)

(assert (=> b!1121251 m!1036773))

(declare-fun m!1036775 () Bool)

(assert (=> mapNonEmpty!43930 m!1036775))

(declare-fun m!1036777 () Bool)

(assert (=> b!1121250 m!1036777))

(declare-fun m!1036779 () Bool)

(assert (=> b!1121241 m!1036779))

(declare-fun m!1036781 () Bool)

(assert (=> b!1121245 m!1036781))

(declare-fun m!1036783 () Bool)

(assert (=> b!1121254 m!1036783))

(declare-fun m!1036785 () Bool)

(assert (=> b!1121254 m!1036785))

(declare-fun m!1036787 () Bool)

(assert (=> b!1121253 m!1036787))

(declare-fun m!1036789 () Bool)

(assert (=> b!1121253 m!1036789))

(declare-fun m!1036791 () Bool)

(assert (=> b!1121253 m!1036791))

(declare-fun m!1036793 () Bool)

(assert (=> b!1121253 m!1036793))

(check-sat (not b!1121254) (not start!98080) (not mapNonEmpty!43930) (not b_next!23545) (not b!1121250) (not b!1121244) (not b_lambda!18525) (not b!1121247) (not b!1121253) (not b!1121241) (not b!1121251) b_and!37885 (not b!1121245) tp_is_empty!28075)
(check-sat b_and!37885 (not b_next!23545))
