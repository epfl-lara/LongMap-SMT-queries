; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99894 () Bool)

(assert start!99894)

(declare-fun b_free!25473 () Bool)

(declare-fun b_next!25473 () Bool)

(assert (=> start!99894 (= b_free!25473 (not b_next!25473))))

(declare-fun tp!89132 () Bool)

(declare-fun b_and!41813 () Bool)

(assert (=> start!99894 (= tp!89132 b_and!41813)))

(declare-fun b!1188789 () Bool)

(declare-fun res!790451 () Bool)

(declare-fun e!675918 () Bool)

(assert (=> b!1188789 (=> (not res!790451) (not e!675918))))

(declare-datatypes ((array!76801 0))(
  ( (array!76802 (arr!37050 (Array (_ BitVec 32) (_ BitVec 64))) (size!37586 (_ BitVec 32))) )
))
(declare-fun lt!540819 () array!76801)

(declare-datatypes ((List!26081 0))(
  ( (Nil!26078) (Cons!26077 (h!27286 (_ BitVec 64)) (t!38546 List!26081)) )
))
(declare-fun arrayNoDuplicates!0 (array!76801 (_ BitVec 32) List!26081) Bool)

(assert (=> b!1188789 (= res!790451 (arrayNoDuplicates!0 lt!540819 #b00000000000000000000000000000000 Nil!26078))))

(declare-fun b!1188790 () Bool)

(declare-fun e!675915 () Bool)

(declare-fun tp_is_empty!30003 () Bool)

(assert (=> b!1188790 (= e!675915 tp_is_empty!30003)))

(declare-fun b!1188791 () Bool)

(declare-fun e!675921 () Bool)

(assert (=> b!1188791 (= e!675921 tp_is_empty!30003)))

(declare-fun b!1188792 () Bool)

(declare-fun res!790454 () Bool)

(declare-fun e!675922 () Bool)

(assert (=> b!1188792 (=> (not res!790454) (not e!675922))))

(declare-fun _keys!1208 () array!76801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45131 0))(
  ( (V!45132 (val!15058 Int)) )
))
(declare-datatypes ((ValueCell!14292 0))(
  ( (ValueCellFull!14292 (v!17696 V!45131)) (EmptyCell!14292) )
))
(declare-datatypes ((array!76803 0))(
  ( (array!76804 (arr!37051 (Array (_ BitVec 32) ValueCell!14292)) (size!37587 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76803)

(assert (=> b!1188792 (= res!790454 (and (= (size!37587 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37586 _keys!1208) (size!37587 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188793 () Bool)

(declare-fun res!790452 () Bool)

(assert (=> b!1188793 (=> (not res!790452) (not e!675922))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188793 (= res!790452 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37586 _keys!1208))))))

(declare-fun b!1188794 () Bool)

(assert (=> b!1188794 (= e!675922 e!675918)))

(declare-fun res!790448 () Bool)

(assert (=> b!1188794 (=> (not res!790448) (not e!675918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76801 (_ BitVec 32)) Bool)

(assert (=> b!1188794 (= res!790448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540819 mask!1564))))

(assert (=> b!1188794 (= lt!540819 (array!76802 (store (arr!37050 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37586 _keys!1208)))))

(declare-fun b!1188795 () Bool)

(declare-fun e!675920 () Bool)

(declare-fun e!675919 () Bool)

(assert (=> b!1188795 (= e!675920 e!675919)))

(declare-fun res!790450 () Bool)

(assert (=> b!1188795 (=> res!790450 e!675919)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188795 (= res!790450 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun minValue!944 () V!45131)

(declare-fun zeroValue!944 () V!45131)

(declare-fun lt!540821 () array!76803)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19338 0))(
  ( (tuple2!19339 (_1!9680 (_ BitVec 64)) (_2!9680 V!45131)) )
))
(declare-datatypes ((List!26082 0))(
  ( (Nil!26079) (Cons!26078 (h!27287 tuple2!19338) (t!38547 List!26082)) )
))
(declare-datatypes ((ListLongMap!17307 0))(
  ( (ListLongMap!17308 (toList!8669 List!26082)) )
))
(declare-fun lt!540822 () ListLongMap!17307)

(declare-fun getCurrentListMapNoExtraKeys!5110 (array!76801 array!76803 (_ BitVec 32) (_ BitVec 32) V!45131 V!45131 (_ BitVec 32) Int) ListLongMap!17307)

(assert (=> b!1188795 (= lt!540822 (getCurrentListMapNoExtraKeys!5110 lt!540819 lt!540821 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3054 (Int (_ BitVec 64)) V!45131)

(assert (=> b!1188795 (= lt!540821 (array!76804 (store (arr!37051 _values!996) i!673 (ValueCellFull!14292 (dynLambda!3054 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37587 _values!996)))))

(declare-fun lt!540818 () ListLongMap!17307)

(assert (=> b!1188795 (= lt!540818 (getCurrentListMapNoExtraKeys!5110 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188796 () Bool)

(declare-fun res!790459 () Bool)

(assert (=> b!1188796 (=> (not res!790459) (not e!675922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188796 (= res!790459 (validMask!0 mask!1564))))

(declare-fun b!1188797 () Bool)

(assert (=> b!1188797 (= e!675919 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1699 (ListLongMap!17307 (_ BitVec 64)) ListLongMap!17307)

(assert (=> b!1188797 (= (getCurrentListMapNoExtraKeys!5110 lt!540819 lt!540821 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1699 (getCurrentListMapNoExtraKeys!5110 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39438 0))(
  ( (Unit!39439) )
))
(declare-fun lt!540820 () Unit!39438)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 (array!76801 array!76803 (_ BitVec 32) (_ BitVec 32) V!45131 V!45131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39438)

(assert (=> b!1188797 (= lt!540820 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188798 () Bool)

(assert (=> b!1188798 (= e!675918 (not e!675920))))

(declare-fun res!790449 () Bool)

(assert (=> b!1188798 (=> res!790449 e!675920)))

(assert (=> b!1188798 (= res!790449 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188798 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540817 () Unit!39438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76801 (_ BitVec 64) (_ BitVec 32)) Unit!39438)

(assert (=> b!1188798 (= lt!540817 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188799 () Bool)

(declare-fun res!790453 () Bool)

(assert (=> b!1188799 (=> (not res!790453) (not e!675922))))

(assert (=> b!1188799 (= res!790453 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26078))))

(declare-fun res!790457 () Bool)

(assert (=> start!99894 (=> (not res!790457) (not e!675922))))

(assert (=> start!99894 (= res!790457 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37586 _keys!1208))))))

(assert (=> start!99894 e!675922))

(assert (=> start!99894 tp_is_empty!30003))

(declare-fun array_inv!28262 (array!76801) Bool)

(assert (=> start!99894 (array_inv!28262 _keys!1208)))

(assert (=> start!99894 true))

(assert (=> start!99894 tp!89132))

(declare-fun e!675916 () Bool)

(declare-fun array_inv!28263 (array!76803) Bool)

(assert (=> start!99894 (and (array_inv!28263 _values!996) e!675916)))

(declare-fun b!1188800 () Bool)

(declare-fun res!790458 () Bool)

(assert (=> b!1188800 (=> (not res!790458) (not e!675922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188800 (= res!790458 (validKeyInArray!0 k0!934))))

(declare-fun b!1188801 () Bool)

(declare-fun res!790456 () Bool)

(assert (=> b!1188801 (=> (not res!790456) (not e!675922))))

(assert (=> b!1188801 (= res!790456 (= (select (arr!37050 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46832 () Bool)

(declare-fun mapRes!46832 () Bool)

(declare-fun tp!89133 () Bool)

(assert (=> mapNonEmpty!46832 (= mapRes!46832 (and tp!89133 e!675921))))

(declare-fun mapRest!46832 () (Array (_ BitVec 32) ValueCell!14292))

(declare-fun mapKey!46832 () (_ BitVec 32))

(declare-fun mapValue!46832 () ValueCell!14292)

(assert (=> mapNonEmpty!46832 (= (arr!37051 _values!996) (store mapRest!46832 mapKey!46832 mapValue!46832))))

(declare-fun b!1188802 () Bool)

(assert (=> b!1188802 (= e!675916 (and e!675915 mapRes!46832))))

(declare-fun condMapEmpty!46832 () Bool)

(declare-fun mapDefault!46832 () ValueCell!14292)

(assert (=> b!1188802 (= condMapEmpty!46832 (= (arr!37051 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14292)) mapDefault!46832)))))

(declare-fun b!1188803 () Bool)

(declare-fun res!790455 () Bool)

(assert (=> b!1188803 (=> (not res!790455) (not e!675922))))

(assert (=> b!1188803 (= res!790455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46832 () Bool)

(assert (=> mapIsEmpty!46832 mapRes!46832))

(assert (= (and start!99894 res!790457) b!1188796))

(assert (= (and b!1188796 res!790459) b!1188792))

(assert (= (and b!1188792 res!790454) b!1188803))

(assert (= (and b!1188803 res!790455) b!1188799))

(assert (= (and b!1188799 res!790453) b!1188793))

(assert (= (and b!1188793 res!790452) b!1188800))

(assert (= (and b!1188800 res!790458) b!1188801))

(assert (= (and b!1188801 res!790456) b!1188794))

(assert (= (and b!1188794 res!790448) b!1188789))

(assert (= (and b!1188789 res!790451) b!1188798))

(assert (= (and b!1188798 (not res!790449)) b!1188795))

(assert (= (and b!1188795 (not res!790450)) b!1188797))

(assert (= (and b!1188802 condMapEmpty!46832) mapIsEmpty!46832))

(assert (= (and b!1188802 (not condMapEmpty!46832)) mapNonEmpty!46832))

(get-info :version)

(assert (= (and mapNonEmpty!46832 ((_ is ValueCellFull!14292) mapValue!46832)) b!1188791))

(assert (= (and b!1188802 ((_ is ValueCellFull!14292) mapDefault!46832)) b!1188790))

(assert (= start!99894 b!1188802))

(declare-fun b_lambda!20617 () Bool)

(assert (=> (not b_lambda!20617) (not b!1188795)))

(declare-fun t!38545 () Bool)

(declare-fun tb!10285 () Bool)

(assert (=> (and start!99894 (= defaultEntry!1004 defaultEntry!1004) t!38545) tb!10285))

(declare-fun result!21137 () Bool)

(assert (=> tb!10285 (= result!21137 tp_is_empty!30003)))

(assert (=> b!1188795 t!38545))

(declare-fun b_and!41815 () Bool)

(assert (= b_and!41813 (and (=> t!38545 result!21137) b_and!41815)))

(declare-fun m!1097535 () Bool)

(assert (=> b!1188801 m!1097535))

(declare-fun m!1097537 () Bool)

(assert (=> mapNonEmpty!46832 m!1097537))

(declare-fun m!1097539 () Bool)

(assert (=> b!1188789 m!1097539))

(declare-fun m!1097541 () Bool)

(assert (=> b!1188795 m!1097541))

(declare-fun m!1097543 () Bool)

(assert (=> b!1188795 m!1097543))

(declare-fun m!1097545 () Bool)

(assert (=> b!1188795 m!1097545))

(declare-fun m!1097547 () Bool)

(assert (=> b!1188795 m!1097547))

(declare-fun m!1097549 () Bool)

(assert (=> b!1188794 m!1097549))

(declare-fun m!1097551 () Bool)

(assert (=> b!1188794 m!1097551))

(declare-fun m!1097553 () Bool)

(assert (=> b!1188800 m!1097553))

(declare-fun m!1097555 () Bool)

(assert (=> b!1188799 m!1097555))

(declare-fun m!1097557 () Bool)

(assert (=> b!1188798 m!1097557))

(declare-fun m!1097559 () Bool)

(assert (=> b!1188798 m!1097559))

(declare-fun m!1097561 () Bool)

(assert (=> b!1188803 m!1097561))

(declare-fun m!1097563 () Bool)

(assert (=> start!99894 m!1097563))

(declare-fun m!1097565 () Bool)

(assert (=> start!99894 m!1097565))

(declare-fun m!1097567 () Bool)

(assert (=> b!1188797 m!1097567))

(declare-fun m!1097569 () Bool)

(assert (=> b!1188797 m!1097569))

(assert (=> b!1188797 m!1097569))

(declare-fun m!1097571 () Bool)

(assert (=> b!1188797 m!1097571))

(declare-fun m!1097573 () Bool)

(assert (=> b!1188797 m!1097573))

(declare-fun m!1097575 () Bool)

(assert (=> b!1188796 m!1097575))

(check-sat b_and!41815 (not mapNonEmpty!46832) (not b!1188798) (not b_next!25473) (not start!99894) (not b!1188789) (not b!1188795) (not b!1188799) (not b_lambda!20617) (not b!1188796) (not b!1188797) (not b!1188800) tp_is_empty!30003 (not b!1188803) (not b!1188794))
(check-sat b_and!41815 (not b_next!25473))
