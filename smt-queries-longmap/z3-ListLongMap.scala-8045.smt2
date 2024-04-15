; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99104 () Bool)

(assert start!99104)

(declare-fun b_free!24715 () Bool)

(declare-fun b_next!24715 () Bool)

(assert (=> start!99104 (= b_free!24715 (not b_next!24715))))

(declare-fun tp!86856 () Bool)

(declare-fun b_and!40257 () Bool)

(assert (=> start!99104 (= tp!86856 b_and!40257)))

(declare-fun b!1165732 () Bool)

(declare-fun e!662663 () Bool)

(declare-fun e!662666 () Bool)

(assert (=> b!1165732 (= e!662663 (not e!662666))))

(declare-fun res!773180 () Bool)

(assert (=> b!1165732 (=> res!773180 e!662666)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165732 (= res!773180 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75244 0))(
  ( (array!75245 (arr!36273 (Array (_ BitVec 32) (_ BitVec 64))) (size!36811 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75244)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165732 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38299 0))(
  ( (Unit!38300) )
))
(declare-fun lt!524840 () Unit!38299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75244 (_ BitVec 64) (_ BitVec 32)) Unit!38299)

(assert (=> b!1165732 (= lt!524840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165733 () Bool)

(declare-fun e!662664 () Bool)

(assert (=> b!1165733 (= e!662664 e!662663)))

(declare-fun res!773186 () Bool)

(assert (=> b!1165733 (=> (not res!773186) (not e!662663))))

(declare-fun lt!524836 () array!75244)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75244 (_ BitVec 32)) Bool)

(assert (=> b!1165733 (= res!773186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524836 mask!1564))))

(assert (=> b!1165733 (= lt!524836 (array!75245 (store (arr!36273 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36811 _keys!1208)))))

(declare-fun b!1165734 () Bool)

(declare-fun e!662667 () Bool)

(assert (=> b!1165734 (= e!662666 e!662667)))

(declare-fun res!773187 () Bool)

(assert (=> b!1165734 (=> res!773187 e!662667)))

(assert (=> b!1165734 (= res!773187 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44121 0))(
  ( (V!44122 (val!14679 Int)) )
))
(declare-fun zeroValue!944 () V!44121)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13913 0))(
  ( (ValueCellFull!13913 (v!17315 V!44121)) (EmptyCell!13913) )
))
(declare-datatypes ((array!75246 0))(
  ( (array!75247 (arr!36274 (Array (_ BitVec 32) ValueCell!13913)) (size!36812 (_ BitVec 32))) )
))
(declare-fun lt!524837 () array!75246)

(declare-fun minValue!944 () V!44121)

(declare-datatypes ((tuple2!18808 0))(
  ( (tuple2!18809 (_1!9415 (_ BitVec 64)) (_2!9415 V!44121)) )
))
(declare-datatypes ((List!25525 0))(
  ( (Nil!25522) (Cons!25521 (h!26730 tuple2!18808) (t!37223 List!25525)) )
))
(declare-datatypes ((ListLongMap!16777 0))(
  ( (ListLongMap!16778 (toList!8404 List!25525)) )
))
(declare-fun lt!524839 () ListLongMap!16777)

(declare-fun getCurrentListMapNoExtraKeys!4880 (array!75244 array!75246 (_ BitVec 32) (_ BitVec 32) V!44121 V!44121 (_ BitVec 32) Int) ListLongMap!16777)

(assert (=> b!1165734 (= lt!524839 (getCurrentListMapNoExtraKeys!4880 lt!524836 lt!524837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75246)

(declare-fun dynLambda!2813 (Int (_ BitVec 64)) V!44121)

(assert (=> b!1165734 (= lt!524837 (array!75247 (store (arr!36274 _values!996) i!673 (ValueCellFull!13913 (dynLambda!2813 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36812 _values!996)))))

(declare-fun lt!524838 () ListLongMap!16777)

(assert (=> b!1165734 (= lt!524838 (getCurrentListMapNoExtraKeys!4880 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165735 () Bool)

(declare-fun res!773188 () Bool)

(assert (=> b!1165735 (=> (not res!773188) (not e!662664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165735 (= res!773188 (validKeyInArray!0 k0!934))))

(declare-fun b!1165737 () Bool)

(declare-fun res!773184 () Bool)

(assert (=> b!1165737 (=> (not res!773184) (not e!662664))))

(assert (=> b!1165737 (= res!773184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45692 () Bool)

(declare-fun mapRes!45692 () Bool)

(assert (=> mapIsEmpty!45692 mapRes!45692))

(declare-fun b!1165738 () Bool)

(declare-fun res!773181 () Bool)

(assert (=> b!1165738 (=> (not res!773181) (not e!662664))))

(assert (=> b!1165738 (= res!773181 (and (= (size!36812 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36811 _keys!1208) (size!36812 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165739 () Bool)

(assert (=> b!1165739 (= e!662667 true)))

(declare-fun -!1419 (ListLongMap!16777 (_ BitVec 64)) ListLongMap!16777)

(assert (=> b!1165739 (= (getCurrentListMapNoExtraKeys!4880 lt!524836 lt!524837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1419 (getCurrentListMapNoExtraKeys!4880 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!524841 () Unit!38299)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 (array!75244 array!75246 (_ BitVec 32) (_ BitVec 32) V!44121 V!44121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38299)

(assert (=> b!1165739 (= lt!524841 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45692 () Bool)

(declare-fun tp!86855 () Bool)

(declare-fun e!662661 () Bool)

(assert (=> mapNonEmpty!45692 (= mapRes!45692 (and tp!86855 e!662661))))

(declare-fun mapRest!45692 () (Array (_ BitVec 32) ValueCell!13913))

(declare-fun mapValue!45692 () ValueCell!13913)

(declare-fun mapKey!45692 () (_ BitVec 32))

(assert (=> mapNonEmpty!45692 (= (arr!36274 _values!996) (store mapRest!45692 mapKey!45692 mapValue!45692))))

(declare-fun b!1165740 () Bool)

(declare-fun e!662662 () Bool)

(declare-fun e!662665 () Bool)

(assert (=> b!1165740 (= e!662662 (and e!662665 mapRes!45692))))

(declare-fun condMapEmpty!45692 () Bool)

(declare-fun mapDefault!45692 () ValueCell!13913)

(assert (=> b!1165740 (= condMapEmpty!45692 (= (arr!36274 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13913)) mapDefault!45692)))))

(declare-fun b!1165741 () Bool)

(declare-fun res!773178 () Bool)

(assert (=> b!1165741 (=> (not res!773178) (not e!662664))))

(declare-datatypes ((List!25526 0))(
  ( (Nil!25523) (Cons!25522 (h!26731 (_ BitVec 64)) (t!37224 List!25526)) )
))
(declare-fun arrayNoDuplicates!0 (array!75244 (_ BitVec 32) List!25526) Bool)

(assert (=> b!1165741 (= res!773178 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25523))))

(declare-fun b!1165742 () Bool)

(declare-fun res!773189 () Bool)

(assert (=> b!1165742 (=> (not res!773189) (not e!662664))))

(assert (=> b!1165742 (= res!773189 (= (select (arr!36273 _keys!1208) i!673) k0!934))))

(declare-fun b!1165736 () Bool)

(declare-fun tp_is_empty!29245 () Bool)

(assert (=> b!1165736 (= e!662665 tp_is_empty!29245)))

(declare-fun res!773183 () Bool)

(assert (=> start!99104 (=> (not res!773183) (not e!662664))))

(assert (=> start!99104 (= res!773183 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36811 _keys!1208))))))

(assert (=> start!99104 e!662664))

(assert (=> start!99104 tp_is_empty!29245))

(declare-fun array_inv!27842 (array!75244) Bool)

(assert (=> start!99104 (array_inv!27842 _keys!1208)))

(assert (=> start!99104 true))

(assert (=> start!99104 tp!86856))

(declare-fun array_inv!27843 (array!75246) Bool)

(assert (=> start!99104 (and (array_inv!27843 _values!996) e!662662)))

(declare-fun b!1165743 () Bool)

(assert (=> b!1165743 (= e!662661 tp_is_empty!29245)))

(declare-fun b!1165744 () Bool)

(declare-fun res!773182 () Bool)

(assert (=> b!1165744 (=> (not res!773182) (not e!662664))))

(assert (=> b!1165744 (= res!773182 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36811 _keys!1208))))))

(declare-fun b!1165745 () Bool)

(declare-fun res!773179 () Bool)

(assert (=> b!1165745 (=> (not res!773179) (not e!662664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165745 (= res!773179 (validMask!0 mask!1564))))

(declare-fun b!1165746 () Bool)

(declare-fun res!773185 () Bool)

(assert (=> b!1165746 (=> (not res!773185) (not e!662663))))

(assert (=> b!1165746 (= res!773185 (arrayNoDuplicates!0 lt!524836 #b00000000000000000000000000000000 Nil!25523))))

(assert (= (and start!99104 res!773183) b!1165745))

(assert (= (and b!1165745 res!773179) b!1165738))

(assert (= (and b!1165738 res!773181) b!1165737))

(assert (= (and b!1165737 res!773184) b!1165741))

(assert (= (and b!1165741 res!773178) b!1165744))

(assert (= (and b!1165744 res!773182) b!1165735))

(assert (= (and b!1165735 res!773188) b!1165742))

(assert (= (and b!1165742 res!773189) b!1165733))

(assert (= (and b!1165733 res!773186) b!1165746))

(assert (= (and b!1165746 res!773185) b!1165732))

(assert (= (and b!1165732 (not res!773180)) b!1165734))

(assert (= (and b!1165734 (not res!773187)) b!1165739))

(assert (= (and b!1165740 condMapEmpty!45692) mapIsEmpty!45692))

(assert (= (and b!1165740 (not condMapEmpty!45692)) mapNonEmpty!45692))

(get-info :version)

(assert (= (and mapNonEmpty!45692 ((_ is ValueCellFull!13913) mapValue!45692)) b!1165743))

(assert (= (and b!1165740 ((_ is ValueCellFull!13913) mapDefault!45692)) b!1165736))

(assert (= start!99104 b!1165740))

(declare-fun b_lambda!19803 () Bool)

(assert (=> (not b_lambda!19803) (not b!1165734)))

(declare-fun t!37222 () Bool)

(declare-fun tb!9519 () Bool)

(assert (=> (and start!99104 (= defaultEntry!1004 defaultEntry!1004) t!37222) tb!9519))

(declare-fun result!19611 () Bool)

(assert (=> tb!9519 (= result!19611 tp_is_empty!29245)))

(assert (=> b!1165734 t!37222))

(declare-fun b_and!40259 () Bool)

(assert (= b_and!40257 (and (=> t!37222 result!19611) b_and!40259)))

(declare-fun m!1073347 () Bool)

(assert (=> b!1165746 m!1073347))

(declare-fun m!1073349 () Bool)

(assert (=> mapNonEmpty!45692 m!1073349))

(declare-fun m!1073351 () Bool)

(assert (=> b!1165734 m!1073351))

(declare-fun m!1073353 () Bool)

(assert (=> b!1165734 m!1073353))

(declare-fun m!1073355 () Bool)

(assert (=> b!1165734 m!1073355))

(declare-fun m!1073357 () Bool)

(assert (=> b!1165734 m!1073357))

(declare-fun m!1073359 () Bool)

(assert (=> b!1165732 m!1073359))

(declare-fun m!1073361 () Bool)

(assert (=> b!1165732 m!1073361))

(declare-fun m!1073363 () Bool)

(assert (=> b!1165737 m!1073363))

(declare-fun m!1073365 () Bool)

(assert (=> b!1165733 m!1073365))

(declare-fun m!1073367 () Bool)

(assert (=> b!1165733 m!1073367))

(declare-fun m!1073369 () Bool)

(assert (=> b!1165739 m!1073369))

(declare-fun m!1073371 () Bool)

(assert (=> b!1165739 m!1073371))

(assert (=> b!1165739 m!1073371))

(declare-fun m!1073373 () Bool)

(assert (=> b!1165739 m!1073373))

(declare-fun m!1073375 () Bool)

(assert (=> b!1165739 m!1073375))

(declare-fun m!1073377 () Bool)

(assert (=> b!1165742 m!1073377))

(declare-fun m!1073379 () Bool)

(assert (=> b!1165741 m!1073379))

(declare-fun m!1073381 () Bool)

(assert (=> b!1165745 m!1073381))

(declare-fun m!1073383 () Bool)

(assert (=> start!99104 m!1073383))

(declare-fun m!1073385 () Bool)

(assert (=> start!99104 m!1073385))

(declare-fun m!1073387 () Bool)

(assert (=> b!1165735 m!1073387))

(check-sat (not b_next!24715) (not b!1165745) (not b!1165733) (not start!99104) (not b!1165746) (not b!1165734) tp_is_empty!29245 (not b!1165739) (not b!1165741) (not b!1165737) (not mapNonEmpty!45692) (not b!1165735) b_and!40259 (not b!1165732) (not b_lambda!19803))
(check-sat b_and!40259 (not b_next!24715))
