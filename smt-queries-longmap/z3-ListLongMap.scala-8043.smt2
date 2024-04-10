; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99100 () Bool)

(assert start!99100)

(declare-fun b_free!24705 () Bool)

(declare-fun b_next!24705 () Bool)

(assert (=> start!99100 (= b_free!24705 (not b_next!24705))))

(declare-fun tp!86825 () Bool)

(declare-fun b_and!40259 () Bool)

(assert (=> start!99100 (= tp!86825 b_and!40259)))

(declare-fun b!1165634 () Bool)

(declare-fun res!773084 () Bool)

(declare-fun e!662632 () Bool)

(assert (=> b!1165634 (=> (not res!773084) (not e!662632))))

(declare-datatypes ((array!75301 0))(
  ( (array!75302 (arr!36301 (Array (_ BitVec 32) (_ BitVec 64))) (size!36837 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75301)

(declare-datatypes ((List!25448 0))(
  ( (Nil!25445) (Cons!25444 (h!26653 (_ BitVec 64)) (t!37145 List!25448)) )
))
(declare-fun arrayNoDuplicates!0 (array!75301 (_ BitVec 32) List!25448) Bool)

(assert (=> b!1165634 (= res!773084 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25445))))

(declare-fun b!1165635 () Bool)

(declare-fun res!773078 () Bool)

(assert (=> b!1165635 (=> (not res!773078) (not e!662632))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75301 (_ BitVec 32)) Bool)

(assert (=> b!1165635 (= res!773078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45677 () Bool)

(declare-fun mapRes!45677 () Bool)

(declare-fun tp!86826 () Bool)

(declare-fun e!662633 () Bool)

(assert (=> mapNonEmpty!45677 (= mapRes!45677 (and tp!86826 e!662633))))

(declare-fun mapKey!45677 () (_ BitVec 32))

(declare-datatypes ((V!44107 0))(
  ( (V!44108 (val!14674 Int)) )
))
(declare-datatypes ((ValueCell!13908 0))(
  ( (ValueCellFull!13908 (v!17311 V!44107)) (EmptyCell!13908) )
))
(declare-datatypes ((array!75303 0))(
  ( (array!75304 (arr!36302 (Array (_ BitVec 32) ValueCell!13908)) (size!36838 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75303)

(declare-fun mapValue!45677 () ValueCell!13908)

(declare-fun mapRest!45677 () (Array (_ BitVec 32) ValueCell!13908))

(assert (=> mapNonEmpty!45677 (= (arr!36302 _values!996) (store mapRest!45677 mapKey!45677 mapValue!45677))))

(declare-fun b!1165637 () Bool)

(declare-fun res!773082 () Bool)

(assert (=> b!1165637 (=> (not res!773082) (not e!662632))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165637 (= res!773082 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36837 _keys!1208))))))

(declare-fun b!1165638 () Bool)

(declare-fun res!773086 () Bool)

(assert (=> b!1165638 (=> (not res!773086) (not e!662632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165638 (= res!773086 (validMask!0 mask!1564))))

(declare-fun b!1165639 () Bool)

(declare-fun res!773085 () Bool)

(assert (=> b!1165639 (=> (not res!773085) (not e!662632))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1165639 (= res!773085 (= (select (arr!36301 _keys!1208) i!673) k0!934))))

(declare-fun b!1165640 () Bool)

(declare-fun e!662634 () Bool)

(declare-fun e!662631 () Bool)

(assert (=> b!1165640 (= e!662634 (and e!662631 mapRes!45677))))

(declare-fun condMapEmpty!45677 () Bool)

(declare-fun mapDefault!45677 () ValueCell!13908)

(assert (=> b!1165640 (= condMapEmpty!45677 (= (arr!36302 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13908)) mapDefault!45677)))))

(declare-fun b!1165641 () Bool)

(declare-fun res!773083 () Bool)

(declare-fun e!662635 () Bool)

(assert (=> b!1165641 (=> (not res!773083) (not e!662635))))

(declare-fun lt!524964 () array!75301)

(assert (=> b!1165641 (= res!773083 (arrayNoDuplicates!0 lt!524964 #b00000000000000000000000000000000 Nil!25445))))

(declare-fun b!1165642 () Bool)

(assert (=> b!1165642 (= e!662632 e!662635)))

(declare-fun res!773079 () Bool)

(assert (=> b!1165642 (=> (not res!773079) (not e!662635))))

(assert (=> b!1165642 (= res!773079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524964 mask!1564))))

(assert (=> b!1165642 (= lt!524964 (array!75302 (store (arr!36301 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36837 _keys!1208)))))

(declare-fun b!1165643 () Bool)

(declare-fun e!662636 () Bool)

(assert (=> b!1165643 (= e!662635 (not e!662636))))

(declare-fun res!773087 () Bool)

(assert (=> b!1165643 (=> res!773087 e!662636)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1165643 (= res!773087 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165643 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38464 0))(
  ( (Unit!38465) )
))
(declare-fun lt!524965 () Unit!38464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75301 (_ BitVec 64) (_ BitVec 32)) Unit!38464)

(assert (=> b!1165643 (= lt!524965 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165644 () Bool)

(declare-fun res!773081 () Bool)

(assert (=> b!1165644 (=> (not res!773081) (not e!662632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165644 (= res!773081 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45677 () Bool)

(assert (=> mapIsEmpty!45677 mapRes!45677))

(declare-fun b!1165645 () Bool)

(declare-fun res!773077 () Bool)

(assert (=> b!1165645 (=> (not res!773077) (not e!662632))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165645 (= res!773077 (and (= (size!36838 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36837 _keys!1208) (size!36838 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165646 () Bool)

(declare-fun tp_is_empty!29235 () Bool)

(assert (=> b!1165646 (= e!662633 tp_is_empty!29235)))

(declare-fun b!1165647 () Bool)

(assert (=> b!1165647 (= e!662631 tp_is_empty!29235)))

(declare-fun res!773080 () Bool)

(assert (=> start!99100 (=> (not res!773080) (not e!662632))))

(assert (=> start!99100 (= res!773080 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36837 _keys!1208))))))

(assert (=> start!99100 e!662632))

(assert (=> start!99100 tp_is_empty!29235))

(declare-fun array_inv!27762 (array!75301) Bool)

(assert (=> start!99100 (array_inv!27762 _keys!1208)))

(assert (=> start!99100 true))

(assert (=> start!99100 tp!86825))

(declare-fun array_inv!27763 (array!75303) Bool)

(assert (=> start!99100 (and (array_inv!27763 _values!996) e!662634)))

(declare-fun b!1165636 () Bool)

(assert (=> b!1165636 (= e!662636 true)))

(declare-fun zeroValue!944 () V!44107)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18712 0))(
  ( (tuple2!18713 (_1!9367 (_ BitVec 64)) (_2!9367 V!44107)) )
))
(declare-datatypes ((List!25449 0))(
  ( (Nil!25446) (Cons!25445 (h!26654 tuple2!18712) (t!37146 List!25449)) )
))
(declare-datatypes ((ListLongMap!16681 0))(
  ( (ListLongMap!16682 (toList!8356 List!25449)) )
))
(declare-fun lt!524967 () ListLongMap!16681)

(declare-fun minValue!944 () V!44107)

(declare-fun getCurrentListMapNoExtraKeys!4820 (array!75301 array!75303 (_ BitVec 32) (_ BitVec 32) V!44107 V!44107 (_ BitVec 32) Int) ListLongMap!16681)

(declare-fun dynLambda!2810 (Int (_ BitVec 64)) V!44107)

(assert (=> b!1165636 (= lt!524967 (getCurrentListMapNoExtraKeys!4820 lt!524964 (array!75304 (store (arr!36302 _values!996) i!673 (ValueCellFull!13908 (dynLambda!2810 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36838 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524966 () ListLongMap!16681)

(assert (=> b!1165636 (= lt!524966 (getCurrentListMapNoExtraKeys!4820 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99100 res!773080) b!1165638))

(assert (= (and b!1165638 res!773086) b!1165645))

(assert (= (and b!1165645 res!773077) b!1165635))

(assert (= (and b!1165635 res!773078) b!1165634))

(assert (= (and b!1165634 res!773084) b!1165637))

(assert (= (and b!1165637 res!773082) b!1165644))

(assert (= (and b!1165644 res!773081) b!1165639))

(assert (= (and b!1165639 res!773085) b!1165642))

(assert (= (and b!1165642 res!773079) b!1165641))

(assert (= (and b!1165641 res!773083) b!1165643))

(assert (= (and b!1165643 (not res!773087)) b!1165636))

(assert (= (and b!1165640 condMapEmpty!45677) mapIsEmpty!45677))

(assert (= (and b!1165640 (not condMapEmpty!45677)) mapNonEmpty!45677))

(get-info :version)

(assert (= (and mapNonEmpty!45677 ((_ is ValueCellFull!13908) mapValue!45677)) b!1165646))

(assert (= (and b!1165640 ((_ is ValueCellFull!13908) mapDefault!45677)) b!1165647))

(assert (= start!99100 b!1165640))

(declare-fun b_lambda!19811 () Bool)

(assert (=> (not b_lambda!19811) (not b!1165636)))

(declare-fun t!37144 () Bool)

(declare-fun tb!9517 () Bool)

(assert (=> (and start!99100 (= defaultEntry!1004 defaultEntry!1004) t!37144) tb!9517))

(declare-fun result!19599 () Bool)

(assert (=> tb!9517 (= result!19599 tp_is_empty!29235)))

(assert (=> b!1165636 t!37144))

(declare-fun b_and!40261 () Bool)

(assert (= b_and!40259 (and (=> t!37144 result!19599) b_and!40261)))

(declare-fun m!1073787 () Bool)

(assert (=> b!1165636 m!1073787))

(declare-fun m!1073789 () Bool)

(assert (=> b!1165636 m!1073789))

(declare-fun m!1073791 () Bool)

(assert (=> b!1165636 m!1073791))

(declare-fun m!1073793 () Bool)

(assert (=> b!1165636 m!1073793))

(declare-fun m!1073795 () Bool)

(assert (=> b!1165638 m!1073795))

(declare-fun m!1073797 () Bool)

(assert (=> b!1165641 m!1073797))

(declare-fun m!1073799 () Bool)

(assert (=> mapNonEmpty!45677 m!1073799))

(declare-fun m!1073801 () Bool)

(assert (=> b!1165643 m!1073801))

(declare-fun m!1073803 () Bool)

(assert (=> b!1165643 m!1073803))

(declare-fun m!1073805 () Bool)

(assert (=> b!1165635 m!1073805))

(declare-fun m!1073807 () Bool)

(assert (=> start!99100 m!1073807))

(declare-fun m!1073809 () Bool)

(assert (=> start!99100 m!1073809))

(declare-fun m!1073811 () Bool)

(assert (=> b!1165639 m!1073811))

(declare-fun m!1073813 () Bool)

(assert (=> b!1165644 m!1073813))

(declare-fun m!1073815 () Bool)

(assert (=> b!1165642 m!1073815))

(declare-fun m!1073817 () Bool)

(assert (=> b!1165642 m!1073817))

(declare-fun m!1073819 () Bool)

(assert (=> b!1165634 m!1073819))

(check-sat (not b_lambda!19811) (not b!1165638) (not b!1165636) (not mapNonEmpty!45677) tp_is_empty!29235 (not b!1165634) b_and!40261 (not b!1165644) (not b!1165643) (not b!1165635) (not b!1165642) (not b!1165641) (not b_next!24705) (not start!99100))
(check-sat b_and!40261 (not b_next!24705))
