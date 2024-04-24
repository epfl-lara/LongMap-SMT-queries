; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99346 () Bool)

(assert start!99346)

(declare-fun b_free!24715 () Bool)

(declare-fun b_next!24715 () Bool)

(assert (=> start!99346 (= b_free!24715 (not b_next!24715))))

(declare-fun tp!86856 () Bool)

(declare-fun b_and!40281 () Bool)

(assert (=> start!99346 (= tp!86856 b_and!40281)))

(declare-fun b!1167145 () Bool)

(declare-fun res!773752 () Bool)

(declare-fun e!663576 () Bool)

(assert (=> b!1167145 (=> (not res!773752) (not e!663576))))

(declare-datatypes ((array!75371 0))(
  ( (array!75372 (arr!36330 (Array (_ BitVec 32) (_ BitVec 64))) (size!36867 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75371)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44121 0))(
  ( (V!44122 (val!14679 Int)) )
))
(declare-datatypes ((ValueCell!13913 0))(
  ( (ValueCellFull!13913 (v!17312 V!44121)) (EmptyCell!13913) )
))
(declare-datatypes ((array!75373 0))(
  ( (array!75374 (arr!36331 (Array (_ BitVec 32) ValueCell!13913)) (size!36868 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75373)

(assert (=> b!1167145 (= res!773752 (and (= (size!36868 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36867 _keys!1208) (size!36868 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167146 () Bool)

(declare-fun res!773755 () Bool)

(assert (=> b!1167146 (=> (not res!773755) (not e!663576))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167146 (= res!773755 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45692 () Bool)

(declare-fun mapRes!45692 () Bool)

(assert (=> mapIsEmpty!45692 mapRes!45692))

(declare-fun b!1167147 () Bool)

(declare-fun e!663573 () Bool)

(declare-fun tp_is_empty!29245 () Bool)

(assert (=> b!1167147 (= e!663573 tp_is_empty!29245)))

(declare-fun mapNonEmpty!45692 () Bool)

(declare-fun tp!86855 () Bool)

(declare-fun e!663575 () Bool)

(assert (=> mapNonEmpty!45692 (= mapRes!45692 (and tp!86855 e!663575))))

(declare-fun mapValue!45692 () ValueCell!13913)

(declare-fun mapRest!45692 () (Array (_ BitVec 32) ValueCell!13913))

(declare-fun mapKey!45692 () (_ BitVec 32))

(assert (=> mapNonEmpty!45692 (= (arr!36331 _values!996) (store mapRest!45692 mapKey!45692 mapValue!45692))))

(declare-fun b!1167148 () Bool)

(declare-fun res!773761 () Bool)

(assert (=> b!1167148 (=> (not res!773761) (not e!663576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75371 (_ BitVec 32)) Bool)

(assert (=> b!1167148 (= res!773761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!773754 () Bool)

(assert (=> start!99346 (=> (not res!773754) (not e!663576))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99346 (= res!773754 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36867 _keys!1208))))))

(assert (=> start!99346 e!663576))

(assert (=> start!99346 tp_is_empty!29245))

(declare-fun array_inv!27854 (array!75371) Bool)

(assert (=> start!99346 (array_inv!27854 _keys!1208)))

(assert (=> start!99346 true))

(assert (=> start!99346 tp!86856))

(declare-fun e!663570 () Bool)

(declare-fun array_inv!27855 (array!75373) Bool)

(assert (=> start!99346 (and (array_inv!27855 _values!996) e!663570)))

(declare-fun b!1167149 () Bool)

(assert (=> b!1167149 (= e!663570 (and e!663573 mapRes!45692))))

(declare-fun condMapEmpty!45692 () Bool)

(declare-fun mapDefault!45692 () ValueCell!13913)

(assert (=> b!1167149 (= condMapEmpty!45692 (= (arr!36331 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13913)) mapDefault!45692)))))

(declare-fun b!1167150 () Bool)

(declare-fun e!663577 () Bool)

(assert (=> b!1167150 (= e!663576 e!663577)))

(declare-fun res!773762 () Bool)

(assert (=> b!1167150 (=> (not res!773762) (not e!663577))))

(declare-fun lt!525516 () array!75371)

(assert (=> b!1167150 (= res!773762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525516 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167150 (= lt!525516 (array!75372 (store (arr!36330 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36867 _keys!1208)))))

(declare-fun b!1167151 () Bool)

(declare-fun res!773759 () Bool)

(assert (=> b!1167151 (=> (not res!773759) (not e!663576))))

(assert (=> b!1167151 (= res!773759 (= (select (arr!36330 _keys!1208) i!673) k0!934))))

(declare-fun b!1167152 () Bool)

(declare-fun res!773756 () Bool)

(assert (=> b!1167152 (=> (not res!773756) (not e!663576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167152 (= res!773756 (validMask!0 mask!1564))))

(declare-fun b!1167153 () Bool)

(declare-fun e!663574 () Bool)

(declare-fun e!663571 () Bool)

(assert (=> b!1167153 (= e!663574 e!663571)))

(declare-fun res!773758 () Bool)

(assert (=> b!1167153 (=> res!773758 e!663571)))

(assert (=> b!1167153 (= res!773758 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44121)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44121)

(declare-datatypes ((tuple2!18752 0))(
  ( (tuple2!18753 (_1!9387 (_ BitVec 64)) (_2!9387 V!44121)) )
))
(declare-datatypes ((List!25493 0))(
  ( (Nil!25490) (Cons!25489 (h!26707 tuple2!18752) (t!37192 List!25493)) )
))
(declare-datatypes ((ListLongMap!16729 0))(
  ( (ListLongMap!16730 (toList!8380 List!25493)) )
))
(declare-fun lt!525515 () ListLongMap!16729)

(declare-fun lt!525513 () array!75373)

(declare-fun getCurrentListMapNoExtraKeys!4871 (array!75371 array!75373 (_ BitVec 32) (_ BitVec 32) V!44121 V!44121 (_ BitVec 32) Int) ListLongMap!16729)

(assert (=> b!1167153 (= lt!525515 (getCurrentListMapNoExtraKeys!4871 lt!525516 lt!525513 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2860 (Int (_ BitVec 64)) V!44121)

(assert (=> b!1167153 (= lt!525513 (array!75374 (store (arr!36331 _values!996) i!673 (ValueCellFull!13913 (dynLambda!2860 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36868 _values!996)))))

(declare-fun lt!525512 () ListLongMap!16729)

(assert (=> b!1167153 (= lt!525512 (getCurrentListMapNoExtraKeys!4871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167154 () Bool)

(declare-fun res!773763 () Bool)

(assert (=> b!1167154 (=> (not res!773763) (not e!663576))))

(assert (=> b!1167154 (= res!773763 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36867 _keys!1208))))))

(declare-fun b!1167155 () Bool)

(declare-fun res!773757 () Bool)

(assert (=> b!1167155 (=> (not res!773757) (not e!663577))))

(declare-datatypes ((List!25494 0))(
  ( (Nil!25491) (Cons!25490 (h!26708 (_ BitVec 64)) (t!37193 List!25494)) )
))
(declare-fun arrayNoDuplicates!0 (array!75371 (_ BitVec 32) List!25494) Bool)

(assert (=> b!1167155 (= res!773757 (arrayNoDuplicates!0 lt!525516 #b00000000000000000000000000000000 Nil!25491))))

(declare-fun b!1167156 () Bool)

(assert (=> b!1167156 (= e!663571 true)))

(declare-fun -!1446 (ListLongMap!16729 (_ BitVec 64)) ListLongMap!16729)

(assert (=> b!1167156 (= (getCurrentListMapNoExtraKeys!4871 lt!525516 lt!525513 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1446 (getCurrentListMapNoExtraKeys!4871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38463 0))(
  ( (Unit!38464) )
))
(declare-fun lt!525517 () Unit!38463)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!671 (array!75371 array!75373 (_ BitVec 32) (_ BitVec 32) V!44121 V!44121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38463)

(assert (=> b!1167156 (= lt!525517 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!671 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167157 () Bool)

(declare-fun res!773753 () Bool)

(assert (=> b!1167157 (=> (not res!773753) (not e!663576))))

(assert (=> b!1167157 (= res!773753 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25491))))

(declare-fun b!1167158 () Bool)

(assert (=> b!1167158 (= e!663575 tp_is_empty!29245)))

(declare-fun b!1167159 () Bool)

(assert (=> b!1167159 (= e!663577 (not e!663574))))

(declare-fun res!773760 () Bool)

(assert (=> b!1167159 (=> res!773760 e!663574)))

(assert (=> b!1167159 (= res!773760 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167159 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525514 () Unit!38463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75371 (_ BitVec 64) (_ BitVec 32)) Unit!38463)

(assert (=> b!1167159 (= lt!525514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99346 res!773754) b!1167152))

(assert (= (and b!1167152 res!773756) b!1167145))

(assert (= (and b!1167145 res!773752) b!1167148))

(assert (= (and b!1167148 res!773761) b!1167157))

(assert (= (and b!1167157 res!773753) b!1167154))

(assert (= (and b!1167154 res!773763) b!1167146))

(assert (= (and b!1167146 res!773755) b!1167151))

(assert (= (and b!1167151 res!773759) b!1167150))

(assert (= (and b!1167150 res!773762) b!1167155))

(assert (= (and b!1167155 res!773757) b!1167159))

(assert (= (and b!1167159 (not res!773760)) b!1167153))

(assert (= (and b!1167153 (not res!773758)) b!1167156))

(assert (= (and b!1167149 condMapEmpty!45692) mapIsEmpty!45692))

(assert (= (and b!1167149 (not condMapEmpty!45692)) mapNonEmpty!45692))

(get-info :version)

(assert (= (and mapNonEmpty!45692 ((_ is ValueCellFull!13913) mapValue!45692)) b!1167158))

(assert (= (and b!1167149 ((_ is ValueCellFull!13913) mapDefault!45692)) b!1167147))

(assert (= start!99346 b!1167149))

(declare-fun b_lambda!19815 () Bool)

(assert (=> (not b_lambda!19815) (not b!1167153)))

(declare-fun t!37191 () Bool)

(declare-fun tb!9519 () Bool)

(assert (=> (and start!99346 (= defaultEntry!1004 defaultEntry!1004) t!37191) tb!9519))

(declare-fun result!19611 () Bool)

(assert (=> tb!9519 (= result!19611 tp_is_empty!29245)))

(assert (=> b!1167153 t!37191))

(declare-fun b_and!40283 () Bool)

(assert (= b_and!40281 (and (=> t!37191 result!19611) b_and!40283)))

(declare-fun m!1075529 () Bool)

(assert (=> mapNonEmpty!45692 m!1075529))

(declare-fun m!1075531 () Bool)

(assert (=> b!1167153 m!1075531))

(declare-fun m!1075533 () Bool)

(assert (=> b!1167153 m!1075533))

(declare-fun m!1075535 () Bool)

(assert (=> b!1167153 m!1075535))

(declare-fun m!1075537 () Bool)

(assert (=> b!1167153 m!1075537))

(declare-fun m!1075539 () Bool)

(assert (=> b!1167155 m!1075539))

(declare-fun m!1075541 () Bool)

(assert (=> b!1167152 m!1075541))

(declare-fun m!1075543 () Bool)

(assert (=> b!1167159 m!1075543))

(declare-fun m!1075545 () Bool)

(assert (=> b!1167159 m!1075545))

(declare-fun m!1075547 () Bool)

(assert (=> b!1167151 m!1075547))

(declare-fun m!1075549 () Bool)

(assert (=> b!1167150 m!1075549))

(declare-fun m!1075551 () Bool)

(assert (=> b!1167150 m!1075551))

(declare-fun m!1075553 () Bool)

(assert (=> b!1167157 m!1075553))

(declare-fun m!1075555 () Bool)

(assert (=> b!1167156 m!1075555))

(declare-fun m!1075557 () Bool)

(assert (=> b!1167156 m!1075557))

(assert (=> b!1167156 m!1075557))

(declare-fun m!1075559 () Bool)

(assert (=> b!1167156 m!1075559))

(declare-fun m!1075561 () Bool)

(assert (=> b!1167156 m!1075561))

(declare-fun m!1075563 () Bool)

(assert (=> start!99346 m!1075563))

(declare-fun m!1075565 () Bool)

(assert (=> start!99346 m!1075565))

(declare-fun m!1075567 () Bool)

(assert (=> b!1167148 m!1075567))

(declare-fun m!1075569 () Bool)

(assert (=> b!1167146 m!1075569))

(check-sat (not b!1167157) b_and!40283 (not b!1167156) (not b!1167155) (not b!1167153) (not b!1167146) (not b!1167159) (not b!1167152) (not mapNonEmpty!45692) (not b_lambda!19815) (not start!99346) (not b!1167148) (not b_next!24715) (not b!1167150) tp_is_empty!29245)
(check-sat b_and!40283 (not b_next!24715))
