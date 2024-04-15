; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99892 () Bool)

(assert start!99892)

(declare-fun b_free!25477 () Bool)

(declare-fun b_next!25477 () Bool)

(assert (=> start!99892 (= b_free!25477 (not b_next!25477))))

(declare-fun tp!89144 () Bool)

(declare-fun b_and!41799 () Bool)

(assert (=> start!99892 (= tp!89144 b_and!41799)))

(declare-fun res!790461 () Bool)

(declare-fun e!675888 () Bool)

(assert (=> start!99892 (=> (not res!790461) (not e!675888))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76744 0))(
  ( (array!76745 (arr!37022 (Array (_ BitVec 32) (_ BitVec 64))) (size!37560 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76744)

(assert (=> start!99892 (= res!790461 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37560 _keys!1208))))))

(assert (=> start!99892 e!675888))

(declare-fun tp_is_empty!30007 () Bool)

(assert (=> start!99892 tp_is_empty!30007))

(declare-fun array_inv!28356 (array!76744) Bool)

(assert (=> start!99892 (array_inv!28356 _keys!1208)))

(assert (=> start!99892 true))

(assert (=> start!99892 tp!89144))

(declare-datatypes ((V!45137 0))(
  ( (V!45138 (val!15060 Int)) )
))
(declare-datatypes ((ValueCell!14294 0))(
  ( (ValueCellFull!14294 (v!17697 V!45137)) (EmptyCell!14294) )
))
(declare-datatypes ((array!76746 0))(
  ( (array!76747 (arr!37023 (Array (_ BitVec 32) ValueCell!14294)) (size!37561 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76746)

(declare-fun e!675891 () Bool)

(declare-fun array_inv!28357 (array!76746) Bool)

(assert (=> start!99892 (and (array_inv!28357 _values!996) e!675891)))

(declare-fun b!1188759 () Bool)

(declare-fun res!790456 () Bool)

(assert (=> b!1188759 (=> (not res!790456) (not e!675888))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188759 (= res!790456 (validMask!0 mask!1564))))

(declare-fun b!1188760 () Bool)

(declare-fun e!675887 () Bool)

(assert (=> b!1188760 (= e!675887 tp_is_empty!30007)))

(declare-fun b!1188761 () Bool)

(declare-fun res!790455 () Bool)

(assert (=> b!1188761 (=> (not res!790455) (not e!675888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76744 (_ BitVec 32)) Bool)

(assert (=> b!1188761 (= res!790455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188762 () Bool)

(declare-fun e!675889 () Bool)

(declare-fun e!675885 () Bool)

(assert (=> b!1188762 (= e!675889 e!675885)))

(declare-fun res!790454 () Bool)

(assert (=> b!1188762 (=> res!790454 e!675885)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188762 (= res!790454 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45137)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540663 () array!76744)

(declare-datatypes ((tuple2!19456 0))(
  ( (tuple2!19457 (_1!9739 (_ BitVec 64)) (_2!9739 V!45137)) )
))
(declare-datatypes ((List!26168 0))(
  ( (Nil!26165) (Cons!26164 (h!27373 tuple2!19456) (t!38628 List!26168)) )
))
(declare-datatypes ((ListLongMap!17425 0))(
  ( (ListLongMap!17426 (toList!8728 List!26168)) )
))
(declare-fun lt!540666 () ListLongMap!17425)

(declare-fun lt!540661 () array!76746)

(declare-fun minValue!944 () V!45137)

(declare-fun getCurrentListMapNoExtraKeys!5178 (array!76744 array!76746 (_ BitVec 32) (_ BitVec 32) V!45137 V!45137 (_ BitVec 32) Int) ListLongMap!17425)

(assert (=> b!1188762 (= lt!540666 (getCurrentListMapNoExtraKeys!5178 lt!540663 lt!540661 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3074 (Int (_ BitVec 64)) V!45137)

(assert (=> b!1188762 (= lt!540661 (array!76747 (store (arr!37023 _values!996) i!673 (ValueCellFull!14294 (dynLambda!3074 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37561 _values!996)))))

(declare-fun lt!540662 () ListLongMap!17425)

(assert (=> b!1188762 (= lt!540662 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188763 () Bool)

(declare-fun res!790464 () Bool)

(assert (=> b!1188763 (=> (not res!790464) (not e!675888))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188763 (= res!790464 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46838 () Bool)

(declare-fun mapRes!46838 () Bool)

(declare-fun tp!89145 () Bool)

(assert (=> mapNonEmpty!46838 (= mapRes!46838 (and tp!89145 e!675887))))

(declare-fun mapKey!46838 () (_ BitVec 32))

(declare-fun mapRest!46838 () (Array (_ BitVec 32) ValueCell!14294))

(declare-fun mapValue!46838 () ValueCell!14294)

(assert (=> mapNonEmpty!46838 (= (arr!37023 _values!996) (store mapRest!46838 mapKey!46838 mapValue!46838))))

(declare-fun b!1188764 () Bool)

(declare-fun res!790465 () Bool)

(declare-fun e!675890 () Bool)

(assert (=> b!1188764 (=> (not res!790465) (not e!675890))))

(declare-datatypes ((List!26169 0))(
  ( (Nil!26166) (Cons!26165 (h!27374 (_ BitVec 64)) (t!38629 List!26169)) )
))
(declare-fun arrayNoDuplicates!0 (array!76744 (_ BitVec 32) List!26169) Bool)

(assert (=> b!1188764 (= res!790465 (arrayNoDuplicates!0 lt!540663 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun b!1188765 () Bool)

(declare-fun e!675886 () Bool)

(assert (=> b!1188765 (= e!675886 tp_is_empty!30007)))

(declare-fun b!1188766 () Bool)

(assert (=> b!1188766 (= e!675890 (not e!675889))))

(declare-fun res!790462 () Bool)

(assert (=> b!1188766 (=> res!790462 e!675889)))

(assert (=> b!1188766 (= res!790462 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188766 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39313 0))(
  ( (Unit!39314) )
))
(declare-fun lt!540664 () Unit!39313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76744 (_ BitVec 64) (_ BitVec 32)) Unit!39313)

(assert (=> b!1188766 (= lt!540664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188767 () Bool)

(assert (=> b!1188767 (= e!675891 (and e!675886 mapRes!46838))))

(declare-fun condMapEmpty!46838 () Bool)

(declare-fun mapDefault!46838 () ValueCell!14294)

(assert (=> b!1188767 (= condMapEmpty!46838 (= (arr!37023 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14294)) mapDefault!46838)))))

(declare-fun b!1188768 () Bool)

(declare-fun res!790463 () Bool)

(assert (=> b!1188768 (=> (not res!790463) (not e!675888))))

(assert (=> b!1188768 (= res!790463 (and (= (size!37561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37560 _keys!1208) (size!37561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188769 () Bool)

(declare-fun res!790457 () Bool)

(assert (=> b!1188769 (=> (not res!790457) (not e!675888))))

(assert (=> b!1188769 (= res!790457 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37560 _keys!1208))))))

(declare-fun b!1188770 () Bool)

(assert (=> b!1188770 (= e!675888 e!675890)))

(declare-fun res!790459 () Bool)

(assert (=> b!1188770 (=> (not res!790459) (not e!675890))))

(assert (=> b!1188770 (= res!790459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540663 mask!1564))))

(assert (=> b!1188770 (= lt!540663 (array!76745 (store (arr!37022 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37560 _keys!1208)))))

(declare-fun b!1188771 () Bool)

(declare-fun res!790460 () Bool)

(assert (=> b!1188771 (=> (not res!790460) (not e!675888))))

(assert (=> b!1188771 (= res!790460 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26166))))

(declare-fun mapIsEmpty!46838 () Bool)

(assert (=> mapIsEmpty!46838 mapRes!46838))

(declare-fun b!1188772 () Bool)

(assert (=> b!1188772 (= e!675885 true)))

(declare-fun -!1676 (ListLongMap!17425 (_ BitVec 64)) ListLongMap!17425)

(assert (=> b!1188772 (= (getCurrentListMapNoExtraKeys!5178 lt!540663 lt!540661 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1676 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540665 () Unit!39313)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 (array!76744 array!76746 (_ BitVec 32) (_ BitVec 32) V!45137 V!45137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39313)

(assert (=> b!1188772 (= lt!540665 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188773 () Bool)

(declare-fun res!790458 () Bool)

(assert (=> b!1188773 (=> (not res!790458) (not e!675888))))

(assert (=> b!1188773 (= res!790458 (= (select (arr!37022 _keys!1208) i!673) k0!934))))

(assert (= (and start!99892 res!790461) b!1188759))

(assert (= (and b!1188759 res!790456) b!1188768))

(assert (= (and b!1188768 res!790463) b!1188761))

(assert (= (and b!1188761 res!790455) b!1188771))

(assert (= (and b!1188771 res!790460) b!1188769))

(assert (= (and b!1188769 res!790457) b!1188763))

(assert (= (and b!1188763 res!790464) b!1188773))

(assert (= (and b!1188773 res!790458) b!1188770))

(assert (= (and b!1188770 res!790459) b!1188764))

(assert (= (and b!1188764 res!790465) b!1188766))

(assert (= (and b!1188766 (not res!790462)) b!1188762))

(assert (= (and b!1188762 (not res!790454)) b!1188772))

(assert (= (and b!1188767 condMapEmpty!46838) mapIsEmpty!46838))

(assert (= (and b!1188767 (not condMapEmpty!46838)) mapNonEmpty!46838))

(get-info :version)

(assert (= (and mapNonEmpty!46838 ((_ is ValueCellFull!14294) mapValue!46838)) b!1188760))

(assert (= (and b!1188767 ((_ is ValueCellFull!14294) mapDefault!46838)) b!1188765))

(assert (= start!99892 b!1188767))

(declare-fun b_lambda!20603 () Bool)

(assert (=> (not b_lambda!20603) (not b!1188762)))

(declare-fun t!38627 () Bool)

(declare-fun tb!10281 () Bool)

(assert (=> (and start!99892 (= defaultEntry!1004 defaultEntry!1004) t!38627) tb!10281))

(declare-fun result!21137 () Bool)

(assert (=> tb!10281 (= result!21137 tp_is_empty!30007)))

(assert (=> b!1188762 t!38627))

(declare-fun b_and!41801 () Bool)

(assert (= b_and!41799 (and (=> t!38627 result!21137) b_and!41801)))

(declare-fun m!1097009 () Bool)

(assert (=> b!1188772 m!1097009))

(declare-fun m!1097011 () Bool)

(assert (=> b!1188772 m!1097011))

(assert (=> b!1188772 m!1097011))

(declare-fun m!1097013 () Bool)

(assert (=> b!1188772 m!1097013))

(declare-fun m!1097015 () Bool)

(assert (=> b!1188772 m!1097015))

(declare-fun m!1097017 () Bool)

(assert (=> b!1188764 m!1097017))

(declare-fun m!1097019 () Bool)

(assert (=> b!1188773 m!1097019))

(declare-fun m!1097021 () Bool)

(assert (=> b!1188770 m!1097021))

(declare-fun m!1097023 () Bool)

(assert (=> b!1188770 m!1097023))

(declare-fun m!1097025 () Bool)

(assert (=> start!99892 m!1097025))

(declare-fun m!1097027 () Bool)

(assert (=> start!99892 m!1097027))

(declare-fun m!1097029 () Bool)

(assert (=> b!1188761 m!1097029))

(declare-fun m!1097031 () Bool)

(assert (=> b!1188762 m!1097031))

(declare-fun m!1097033 () Bool)

(assert (=> b!1188762 m!1097033))

(declare-fun m!1097035 () Bool)

(assert (=> b!1188762 m!1097035))

(declare-fun m!1097037 () Bool)

(assert (=> b!1188762 m!1097037))

(declare-fun m!1097039 () Bool)

(assert (=> b!1188759 m!1097039))

(declare-fun m!1097041 () Bool)

(assert (=> b!1188763 m!1097041))

(declare-fun m!1097043 () Bool)

(assert (=> b!1188766 m!1097043))

(declare-fun m!1097045 () Bool)

(assert (=> b!1188766 m!1097045))

(declare-fun m!1097047 () Bool)

(assert (=> mapNonEmpty!46838 m!1097047))

(declare-fun m!1097049 () Bool)

(assert (=> b!1188771 m!1097049))

(check-sat (not b_lambda!20603) b_and!41801 tp_is_empty!30007 (not b!1188761) (not b!1188762) (not b!1188772) (not b!1188766) (not start!99892) (not b!1188770) (not mapNonEmpty!46838) (not b_next!25477) (not b!1188771) (not b!1188763) (not b!1188764) (not b!1188759))
(check-sat b_and!41801 (not b_next!25477))
