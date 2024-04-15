; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99212 () Bool)

(assert start!99212)

(declare-fun b_free!24823 () Bool)

(declare-fun b_next!24823 () Bool)

(assert (=> start!99212 (= b_free!24823 (not b_next!24823))))

(declare-fun tp!87180 () Bool)

(declare-fun b_and!40473 () Bool)

(assert (=> start!99212 (= tp!87180 b_and!40473)))

(declare-fun b!1168281 () Bool)

(declare-fun e!663972 () Bool)

(declare-fun e!663975 () Bool)

(assert (=> b!1168281 (= e!663972 e!663975)))

(declare-fun res!775141 () Bool)

(assert (=> b!1168281 (=> res!775141 e!663975)))

(declare-datatypes ((array!75454 0))(
  ( (array!75455 (arr!36378 (Array (_ BitVec 32) (_ BitVec 64))) (size!36916 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75454)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168281 (= res!775141 (not (validKeyInArray!0 (select (arr!36378 _keys!1208) from!1455))))))

(declare-datatypes ((V!44265 0))(
  ( (V!44266 (val!14733 Int)) )
))
(declare-datatypes ((tuple2!18892 0))(
  ( (tuple2!18893 (_1!9457 (_ BitVec 64)) (_2!9457 V!44265)) )
))
(declare-datatypes ((List!25608 0))(
  ( (Nil!25605) (Cons!25604 (h!26813 tuple2!18892) (t!37414 List!25608)) )
))
(declare-datatypes ((ListLongMap!16861 0))(
  ( (ListLongMap!16862 (toList!8446 List!25608)) )
))
(declare-fun lt!525819 () ListLongMap!16861)

(declare-fun lt!525818 () ListLongMap!16861)

(assert (=> b!1168281 (= lt!525819 lt!525818)))

(declare-fun lt!525821 () ListLongMap!16861)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1454 (ListLongMap!16861 (_ BitVec 64)) ListLongMap!16861)

(assert (=> b!1168281 (= lt!525818 (-!1454 lt!525821 k0!934))))

(declare-fun zeroValue!944 () V!44265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13967 0))(
  ( (ValueCellFull!13967 (v!17369 V!44265)) (EmptyCell!13967) )
))
(declare-datatypes ((array!75456 0))(
  ( (array!75457 (arr!36379 (Array (_ BitVec 32) ValueCell!13967)) (size!36917 (_ BitVec 32))) )
))
(declare-fun lt!525822 () array!75456)

(declare-fun lt!525825 () array!75454)

(declare-fun minValue!944 () V!44265)

(declare-fun getCurrentListMapNoExtraKeys!4922 (array!75454 array!75456 (_ BitVec 32) (_ BitVec 32) V!44265 V!44265 (_ BitVec 32) Int) ListLongMap!16861)

(assert (=> b!1168281 (= lt!525819 (getCurrentListMapNoExtraKeys!4922 lt!525825 lt!525822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75456)

(assert (=> b!1168281 (= lt!525821 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38381 0))(
  ( (Unit!38382) )
))
(declare-fun lt!525824 () Unit!38381)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 (array!75454 array!75456 (_ BitVec 32) (_ BitVec 32) V!44265 V!44265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38381)

(assert (=> b!1168281 (= lt!525824 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168282 () Bool)

(declare-fun res!775143 () Bool)

(declare-fun e!663973 () Bool)

(assert (=> b!1168282 (=> (not res!775143) (not e!663973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168282 (= res!775143 (validMask!0 mask!1564))))

(declare-fun b!1168283 () Bool)

(declare-fun res!775137 () Bool)

(assert (=> b!1168283 (=> (not res!775137) (not e!663973))))

(assert (=> b!1168283 (= res!775137 (validKeyInArray!0 k0!934))))

(declare-fun b!1168284 () Bool)

(declare-fun res!775134 () Bool)

(assert (=> b!1168284 (=> (not res!775134) (not e!663973))))

(assert (=> b!1168284 (= res!775134 (and (= (size!36917 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36916 _keys!1208) (size!36917 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168285 () Bool)

(declare-fun res!775136 () Bool)

(declare-fun e!663971 () Bool)

(assert (=> b!1168285 (=> (not res!775136) (not e!663971))))

(declare-datatypes ((List!25609 0))(
  ( (Nil!25606) (Cons!25605 (h!26814 (_ BitVec 64)) (t!37415 List!25609)) )
))
(declare-fun arrayNoDuplicates!0 (array!75454 (_ BitVec 32) List!25609) Bool)

(assert (=> b!1168285 (= res!775136 (arrayNoDuplicates!0 lt!525825 #b00000000000000000000000000000000 Nil!25606))))

(declare-fun b!1168286 () Bool)

(declare-fun e!663970 () Bool)

(assert (=> b!1168286 (= e!663971 (not e!663970))))

(declare-fun res!775133 () Bool)

(assert (=> b!1168286 (=> res!775133 e!663970)))

(assert (=> b!1168286 (= res!775133 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168286 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525820 () Unit!38381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75454 (_ BitVec 64) (_ BitVec 32)) Unit!38381)

(assert (=> b!1168286 (= lt!525820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45854 () Bool)

(declare-fun mapRes!45854 () Bool)

(assert (=> mapIsEmpty!45854 mapRes!45854))

(declare-fun b!1168287 () Bool)

(declare-fun res!775145 () Bool)

(assert (=> b!1168287 (=> (not res!775145) (not e!663973))))

(assert (=> b!1168287 (= res!775145 (= (select (arr!36378 _keys!1208) i!673) k0!934))))

(declare-fun res!775140 () Bool)

(assert (=> start!99212 (=> (not res!775140) (not e!663973))))

(assert (=> start!99212 (= res!775140 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36916 _keys!1208))))))

(assert (=> start!99212 e!663973))

(declare-fun tp_is_empty!29353 () Bool)

(assert (=> start!99212 tp_is_empty!29353))

(declare-fun array_inv!27912 (array!75454) Bool)

(assert (=> start!99212 (array_inv!27912 _keys!1208)))

(assert (=> start!99212 true))

(assert (=> start!99212 tp!87180))

(declare-fun e!663967 () Bool)

(declare-fun array_inv!27913 (array!75456) Bool)

(assert (=> start!99212 (and (array_inv!27913 _values!996) e!663967)))

(declare-fun b!1168288 () Bool)

(declare-fun res!775138 () Bool)

(assert (=> b!1168288 (=> (not res!775138) (not e!663973))))

(assert (=> b!1168288 (= res!775138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25606))))

(declare-fun b!1168289 () Bool)

(declare-fun e!663968 () Bool)

(assert (=> b!1168289 (= e!663967 (and e!663968 mapRes!45854))))

(declare-fun condMapEmpty!45854 () Bool)

(declare-fun mapDefault!45854 () ValueCell!13967)

(assert (=> b!1168289 (= condMapEmpty!45854 (= (arr!36379 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13967)) mapDefault!45854)))))

(declare-fun b!1168290 () Bool)

(assert (=> b!1168290 (= e!663975 true)))

(declare-fun lt!525816 () ListLongMap!16861)

(declare-fun lt!525823 () V!44265)

(declare-fun +!3774 (ListLongMap!16861 tuple2!18892) ListLongMap!16861)

(declare-fun get!18546 (ValueCell!13967 V!44265) V!44265)

(assert (=> b!1168290 (= lt!525816 (+!3774 lt!525818 (tuple2!18893 (select (arr!36378 _keys!1208) from!1455) (get!18546 (select (arr!36379 _values!996) from!1455) lt!525823))))))

(declare-fun b!1168291 () Bool)

(declare-fun e!663969 () Bool)

(assert (=> b!1168291 (= e!663969 tp_is_empty!29353)))

(declare-fun b!1168292 () Bool)

(assert (=> b!1168292 (= e!663973 e!663971)))

(declare-fun res!775142 () Bool)

(assert (=> b!1168292 (=> (not res!775142) (not e!663971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75454 (_ BitVec 32)) Bool)

(assert (=> b!1168292 (= res!775142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525825 mask!1564))))

(assert (=> b!1168292 (= lt!525825 (array!75455 (store (arr!36378 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36916 _keys!1208)))))

(declare-fun mapNonEmpty!45854 () Bool)

(declare-fun tp!87179 () Bool)

(assert (=> mapNonEmpty!45854 (= mapRes!45854 (and tp!87179 e!663969))))

(declare-fun mapValue!45854 () ValueCell!13967)

(declare-fun mapRest!45854 () (Array (_ BitVec 32) ValueCell!13967))

(declare-fun mapKey!45854 () (_ BitVec 32))

(assert (=> mapNonEmpty!45854 (= (arr!36379 _values!996) (store mapRest!45854 mapKey!45854 mapValue!45854))))

(declare-fun b!1168293 () Bool)

(assert (=> b!1168293 (= e!663968 tp_is_empty!29353)))

(declare-fun b!1168294 () Bool)

(assert (=> b!1168294 (= e!663970 e!663972)))

(declare-fun res!775144 () Bool)

(assert (=> b!1168294 (=> res!775144 e!663972)))

(assert (=> b!1168294 (= res!775144 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1168294 (= lt!525816 (getCurrentListMapNoExtraKeys!4922 lt!525825 lt!525822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1168294 (= lt!525822 (array!75457 (store (arr!36379 _values!996) i!673 (ValueCellFull!13967 lt!525823)) (size!36917 _values!996)))))

(declare-fun dynLambda!2850 (Int (_ BitVec 64)) V!44265)

(assert (=> b!1168294 (= lt!525823 (dynLambda!2850 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!525817 () ListLongMap!16861)

(assert (=> b!1168294 (= lt!525817 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168295 () Bool)

(declare-fun res!775139 () Bool)

(assert (=> b!1168295 (=> (not res!775139) (not e!663973))))

(assert (=> b!1168295 (= res!775139 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36916 _keys!1208))))))

(declare-fun b!1168296 () Bool)

(declare-fun res!775135 () Bool)

(assert (=> b!1168296 (=> (not res!775135) (not e!663973))))

(assert (=> b!1168296 (= res!775135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99212 res!775140) b!1168282))

(assert (= (and b!1168282 res!775143) b!1168284))

(assert (= (and b!1168284 res!775134) b!1168296))

(assert (= (and b!1168296 res!775135) b!1168288))

(assert (= (and b!1168288 res!775138) b!1168295))

(assert (= (and b!1168295 res!775139) b!1168283))

(assert (= (and b!1168283 res!775137) b!1168287))

(assert (= (and b!1168287 res!775145) b!1168292))

(assert (= (and b!1168292 res!775142) b!1168285))

(assert (= (and b!1168285 res!775136) b!1168286))

(assert (= (and b!1168286 (not res!775133)) b!1168294))

(assert (= (and b!1168294 (not res!775144)) b!1168281))

(assert (= (and b!1168281 (not res!775141)) b!1168290))

(assert (= (and b!1168289 condMapEmpty!45854) mapIsEmpty!45854))

(assert (= (and b!1168289 (not condMapEmpty!45854)) mapNonEmpty!45854))

(get-info :version)

(assert (= (and mapNonEmpty!45854 ((_ is ValueCellFull!13967) mapValue!45854)) b!1168291))

(assert (= (and b!1168289 ((_ is ValueCellFull!13967) mapDefault!45854)) b!1168293))

(assert (= start!99212 b!1168289))

(declare-fun b_lambda!19911 () Bool)

(assert (=> (not b_lambda!19911) (not b!1168294)))

(declare-fun t!37413 () Bool)

(declare-fun tb!9627 () Bool)

(assert (=> (and start!99212 (= defaultEntry!1004 defaultEntry!1004) t!37413) tb!9627))

(declare-fun result!19827 () Bool)

(assert (=> tb!9627 (= result!19827 tp_is_empty!29353)))

(assert (=> b!1168294 t!37413))

(declare-fun b_and!40475 () Bool)

(assert (= b_and!40473 (and (=> t!37413 result!19827) b_and!40475)))

(declare-fun m!1075627 () Bool)

(assert (=> b!1168294 m!1075627))

(declare-fun m!1075629 () Bool)

(assert (=> b!1168294 m!1075629))

(declare-fun m!1075631 () Bool)

(assert (=> b!1168294 m!1075631))

(declare-fun m!1075633 () Bool)

(assert (=> b!1168294 m!1075633))

(declare-fun m!1075635 () Bool)

(assert (=> b!1168290 m!1075635))

(declare-fun m!1075637 () Bool)

(assert (=> b!1168290 m!1075637))

(assert (=> b!1168290 m!1075637))

(declare-fun m!1075639 () Bool)

(assert (=> b!1168290 m!1075639))

(declare-fun m!1075641 () Bool)

(assert (=> b!1168290 m!1075641))

(declare-fun m!1075643 () Bool)

(assert (=> b!1168283 m!1075643))

(declare-fun m!1075645 () Bool)

(assert (=> b!1168285 m!1075645))

(declare-fun m!1075647 () Bool)

(assert (=> b!1168288 m!1075647))

(declare-fun m!1075649 () Bool)

(assert (=> start!99212 m!1075649))

(declare-fun m!1075651 () Bool)

(assert (=> start!99212 m!1075651))

(declare-fun m!1075653 () Bool)

(assert (=> b!1168286 m!1075653))

(declare-fun m!1075655 () Bool)

(assert (=> b!1168286 m!1075655))

(declare-fun m!1075657 () Bool)

(assert (=> b!1168296 m!1075657))

(declare-fun m!1075659 () Bool)

(assert (=> mapNonEmpty!45854 m!1075659))

(declare-fun m!1075661 () Bool)

(assert (=> b!1168281 m!1075661))

(declare-fun m!1075663 () Bool)

(assert (=> b!1168281 m!1075663))

(declare-fun m!1075665 () Bool)

(assert (=> b!1168281 m!1075665))

(declare-fun m!1075667 () Bool)

(assert (=> b!1168281 m!1075667))

(assert (=> b!1168281 m!1075635))

(declare-fun m!1075669 () Bool)

(assert (=> b!1168281 m!1075669))

(assert (=> b!1168281 m!1075635))

(declare-fun m!1075671 () Bool)

(assert (=> b!1168292 m!1075671))

(declare-fun m!1075673 () Bool)

(assert (=> b!1168292 m!1075673))

(declare-fun m!1075675 () Bool)

(assert (=> b!1168287 m!1075675))

(declare-fun m!1075677 () Bool)

(assert (=> b!1168282 m!1075677))

(check-sat (not b_next!24823) (not b!1168290) (not b!1168292) tp_is_empty!29353 (not b!1168288) b_and!40475 (not b!1168294) (not b!1168283) (not start!99212) (not b_lambda!19911) (not b!1168286) (not mapNonEmpty!45854) (not b!1168285) (not b!1168281) (not b!1168282) (not b!1168296))
(check-sat b_and!40475 (not b_next!24823))
