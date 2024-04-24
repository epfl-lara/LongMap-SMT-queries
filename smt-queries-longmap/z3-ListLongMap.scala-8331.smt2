; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101622 () Bool)

(assert start!101622)

(declare-fun b_free!26257 () Bool)

(declare-fun b_next!26257 () Bool)

(assert (=> start!101622 (= b_free!26257 (not b_next!26257))))

(declare-fun tp!91799 () Bool)

(declare-fun b_and!43669 () Bool)

(assert (=> start!101622 (= tp!91799 b_and!43669)))

(declare-fun b!1219790 () Bool)

(declare-fun res!809792 () Bool)

(declare-fun e!692641 () Bool)

(assert (=> b!1219790 (=> (not res!809792) (not e!692641))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219790 (= res!809792 (validMask!0 mask!1564))))

(declare-fun b!1219791 () Bool)

(declare-fun res!809788 () Bool)

(assert (=> b!1219791 (=> (not res!809788) (not e!692641))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219791 (= res!809788 (validKeyInArray!0 k0!934))))

(declare-fun b!1219792 () Bool)

(declare-fun res!809795 () Bool)

(assert (=> b!1219792 (=> (not res!809795) (not e!692641))))

(declare-datatypes ((array!78737 0))(
  ( (array!78738 (arr!37995 (Array (_ BitVec 32) (_ BitVec 64))) (size!38532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78737)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78737 (_ BitVec 32)) Bool)

(assert (=> b!1219792 (= res!809795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219793 () Bool)

(declare-fun res!809785 () Bool)

(declare-fun e!692638 () Bool)

(assert (=> b!1219793 (=> (not res!809785) (not e!692638))))

(declare-fun lt!554411 () array!78737)

(declare-datatypes ((List!26810 0))(
  ( (Nil!26807) (Cons!26806 (h!28024 (_ BitVec 64)) (t!40039 List!26810)) )
))
(declare-fun arrayNoDuplicates!0 (array!78737 (_ BitVec 32) List!26810) Bool)

(assert (=> b!1219793 (= res!809785 (arrayNoDuplicates!0 lt!554411 #b00000000000000000000000000000000 Nil!26807))))

(declare-fun mapNonEmpty!48322 () Bool)

(declare-fun mapRes!48322 () Bool)

(declare-fun tp!91798 () Bool)

(declare-fun e!692645 () Bool)

(assert (=> mapNonEmpty!48322 (= mapRes!48322 (and tp!91798 e!692645))))

(declare-fun mapKey!48322 () (_ BitVec 32))

(declare-datatypes ((V!46409 0))(
  ( (V!46410 (val!15537 Int)) )
))
(declare-datatypes ((ValueCell!14771 0))(
  ( (ValueCellFull!14771 (v!18188 V!46409)) (EmptyCell!14771) )
))
(declare-fun mapRest!48322 () (Array (_ BitVec 32) ValueCell!14771))

(declare-datatypes ((array!78739 0))(
  ( (array!78740 (arr!37996 (Array (_ BitVec 32) ValueCell!14771)) (size!38533 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78739)

(declare-fun mapValue!48322 () ValueCell!14771)

(assert (=> mapNonEmpty!48322 (= (arr!37996 _values!996) (store mapRest!48322 mapKey!48322 mapValue!48322))))

(declare-fun b!1219794 () Bool)

(declare-fun tp_is_empty!30961 () Bool)

(assert (=> b!1219794 (= e!692645 tp_is_empty!30961)))

(declare-fun b!1219795 () Bool)

(declare-fun e!692648 () Bool)

(declare-fun e!692640 () Bool)

(assert (=> b!1219795 (= e!692648 e!692640)))

(declare-fun res!809797 () Bool)

(assert (=> b!1219795 (=> res!809797 e!692640)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219795 (= res!809797 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46409)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554408 () array!78739)

(declare-datatypes ((tuple2!20000 0))(
  ( (tuple2!20001 (_1!10011 (_ BitVec 64)) (_2!10011 V!46409)) )
))
(declare-datatypes ((List!26811 0))(
  ( (Nil!26808) (Cons!26807 (h!28025 tuple2!20000) (t!40040 List!26811)) )
))
(declare-datatypes ((ListLongMap!17977 0))(
  ( (ListLongMap!17978 (toList!9004 List!26811)) )
))
(declare-fun lt!554403 () ListLongMap!17977)

(declare-fun minValue!944 () V!46409)

(declare-fun getCurrentListMapNoExtraKeys!5461 (array!78737 array!78739 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) Int) ListLongMap!17977)

(assert (=> b!1219795 (= lt!554403 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554407 () V!46409)

(assert (=> b!1219795 (= lt!554408 (array!78740 (store (arr!37996 _values!996) i!673 (ValueCellFull!14771 lt!554407)) (size!38533 _values!996)))))

(declare-fun dynLambda!3365 (Int (_ BitVec 64)) V!46409)

(assert (=> b!1219795 (= lt!554407 (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554404 () ListLongMap!17977)

(assert (=> b!1219795 (= lt!554404 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219797 () Bool)

(declare-fun e!692646 () Bool)

(declare-fun arrayContainsKey!0 (array!78737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219797 (= e!692646 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219798 () Bool)

(declare-fun e!692644 () Bool)

(declare-fun e!692639 () Bool)

(assert (=> b!1219798 (= e!692644 (and e!692639 mapRes!48322))))

(declare-fun condMapEmpty!48322 () Bool)

(declare-fun mapDefault!48322 () ValueCell!14771)

(assert (=> b!1219798 (= condMapEmpty!48322 (= (arr!37996 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14771)) mapDefault!48322)))))

(declare-fun b!1219799 () Bool)

(declare-fun e!692642 () Bool)

(assert (=> b!1219799 (= e!692642 e!692646)))

(declare-fun res!809790 () Bool)

(assert (=> b!1219799 (=> res!809790 e!692646)))

(assert (=> b!1219799 (= res!809790 (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219800 () Bool)

(declare-fun e!692643 () Bool)

(assert (=> b!1219800 (= e!692640 e!692643)))

(declare-fun res!809789 () Bool)

(assert (=> b!1219800 (=> res!809789 e!692643)))

(assert (=> b!1219800 (= res!809789 (not (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455))))))

(declare-fun lt!554409 () ListLongMap!17977)

(declare-fun lt!554405 () ListLongMap!17977)

(assert (=> b!1219800 (= lt!554409 lt!554405)))

(declare-fun lt!554406 () ListLongMap!17977)

(declare-fun -!1893 (ListLongMap!17977 (_ BitVec 64)) ListLongMap!17977)

(assert (=> b!1219800 (= lt!554405 (-!1893 lt!554406 k0!934))))

(assert (=> b!1219800 (= lt!554409 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219800 (= lt!554406 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40364 0))(
  ( (Unit!40365) )
))
(declare-fun lt!554412 () Unit!40364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1108 (array!78737 array!78739 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40364)

(assert (=> b!1219800 (= lt!554412 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1108 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219801 () Bool)

(declare-fun res!809784 () Bool)

(assert (=> b!1219801 (=> (not res!809784) (not e!692641))))

(assert (=> b!1219801 (= res!809784 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38532 _keys!1208))))))

(declare-fun b!1219802 () Bool)

(declare-fun res!809783 () Bool)

(assert (=> b!1219802 (=> (not res!809783) (not e!692641))))

(assert (=> b!1219802 (= res!809783 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26807))))

(declare-fun b!1219803 () Bool)

(assert (=> b!1219803 (= e!692638 (not e!692648))))

(declare-fun res!809786 () Bool)

(assert (=> b!1219803 (=> res!809786 e!692648)))

(assert (=> b!1219803 (= res!809786 (bvsgt from!1455 i!673))))

(assert (=> b!1219803 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554410 () Unit!40364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78737 (_ BitVec 64) (_ BitVec 32)) Unit!40364)

(assert (=> b!1219803 (= lt!554410 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219804 () Bool)

(declare-fun res!809796 () Bool)

(assert (=> b!1219804 (=> (not res!809796) (not e!692641))))

(assert (=> b!1219804 (= res!809796 (= (select (arr!37995 _keys!1208) i!673) k0!934))))

(declare-fun res!809791 () Bool)

(assert (=> start!101622 (=> (not res!809791) (not e!692641))))

(assert (=> start!101622 (= res!809791 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38532 _keys!1208))))))

(assert (=> start!101622 e!692641))

(assert (=> start!101622 tp_is_empty!30961))

(declare-fun array_inv!28988 (array!78737) Bool)

(assert (=> start!101622 (array_inv!28988 _keys!1208)))

(assert (=> start!101622 true))

(assert (=> start!101622 tp!91799))

(declare-fun array_inv!28989 (array!78739) Bool)

(assert (=> start!101622 (and (array_inv!28989 _values!996) e!692644)))

(declare-fun b!1219796 () Bool)

(assert (=> b!1219796 (= e!692643 (or (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (size!38532 _keys!1208) #b01111111111111111111111111111111)))))

(assert (=> b!1219796 e!692642))

(declare-fun res!809794 () Bool)

(assert (=> b!1219796 (=> (not res!809794) (not e!692642))))

(declare-fun +!4115 (ListLongMap!17977 tuple2!20000) ListLongMap!17977)

(declare-fun get!19409 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1219796 (= res!809794 (= lt!554403 (+!4115 lt!554405 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))))))

(declare-fun mapIsEmpty!48322 () Bool)

(assert (=> mapIsEmpty!48322 mapRes!48322))

(declare-fun b!1219805 () Bool)

(declare-fun res!809793 () Bool)

(assert (=> b!1219805 (=> (not res!809793) (not e!692641))))

(assert (=> b!1219805 (= res!809793 (and (= (size!38533 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38532 _keys!1208) (size!38533 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219806 () Bool)

(assert (=> b!1219806 (= e!692639 tp_is_empty!30961)))

(declare-fun b!1219807 () Bool)

(assert (=> b!1219807 (= e!692641 e!692638)))

(declare-fun res!809787 () Bool)

(assert (=> b!1219807 (=> (not res!809787) (not e!692638))))

(assert (=> b!1219807 (= res!809787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554411 mask!1564))))

(assert (=> b!1219807 (= lt!554411 (array!78738 (store (arr!37995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38532 _keys!1208)))))

(assert (= (and start!101622 res!809791) b!1219790))

(assert (= (and b!1219790 res!809792) b!1219805))

(assert (= (and b!1219805 res!809793) b!1219792))

(assert (= (and b!1219792 res!809795) b!1219802))

(assert (= (and b!1219802 res!809783) b!1219801))

(assert (= (and b!1219801 res!809784) b!1219791))

(assert (= (and b!1219791 res!809788) b!1219804))

(assert (= (and b!1219804 res!809796) b!1219807))

(assert (= (and b!1219807 res!809787) b!1219793))

(assert (= (and b!1219793 res!809785) b!1219803))

(assert (= (and b!1219803 (not res!809786)) b!1219795))

(assert (= (and b!1219795 (not res!809797)) b!1219800))

(assert (= (and b!1219800 (not res!809789)) b!1219796))

(assert (= (and b!1219796 res!809794) b!1219799))

(assert (= (and b!1219799 (not res!809790)) b!1219797))

(assert (= (and b!1219798 condMapEmpty!48322) mapIsEmpty!48322))

(assert (= (and b!1219798 (not condMapEmpty!48322)) mapNonEmpty!48322))

(get-info :version)

(assert (= (and mapNonEmpty!48322 ((_ is ValueCellFull!14771) mapValue!48322)) b!1219794))

(assert (= (and b!1219798 ((_ is ValueCellFull!14771) mapDefault!48322)) b!1219806))

(assert (= start!101622 b!1219798))

(declare-fun b_lambda!22003 () Bool)

(assert (=> (not b_lambda!22003) (not b!1219795)))

(declare-fun t!40038 () Bool)

(declare-fun tb!11049 () Bool)

(assert (=> (and start!101622 (= defaultEntry!1004 defaultEntry!1004) t!40038) tb!11049))

(declare-fun result!22707 () Bool)

(assert (=> tb!11049 (= result!22707 tp_is_empty!30961)))

(assert (=> b!1219795 t!40038))

(declare-fun b_and!43671 () Bool)

(assert (= b_and!43669 (and (=> t!40038 result!22707) b_and!43671)))

(declare-fun m!1124833 () Bool)

(assert (=> b!1219796 m!1124833))

(declare-fun m!1124835 () Bool)

(assert (=> b!1219796 m!1124835))

(assert (=> b!1219796 m!1124835))

(declare-fun m!1124837 () Bool)

(assert (=> b!1219796 m!1124837))

(declare-fun m!1124839 () Bool)

(assert (=> b!1219796 m!1124839))

(declare-fun m!1124841 () Bool)

(assert (=> b!1219790 m!1124841))

(declare-fun m!1124843 () Bool)

(assert (=> b!1219792 m!1124843))

(declare-fun m!1124845 () Bool)

(assert (=> b!1219797 m!1124845))

(declare-fun m!1124847 () Bool)

(assert (=> b!1219804 m!1124847))

(declare-fun m!1124849 () Bool)

(assert (=> b!1219803 m!1124849))

(declare-fun m!1124851 () Bool)

(assert (=> b!1219803 m!1124851))

(declare-fun m!1124853 () Bool)

(assert (=> b!1219807 m!1124853))

(declare-fun m!1124855 () Bool)

(assert (=> b!1219807 m!1124855))

(declare-fun m!1124857 () Bool)

(assert (=> start!101622 m!1124857))

(declare-fun m!1124859 () Bool)

(assert (=> start!101622 m!1124859))

(declare-fun m!1124861 () Bool)

(assert (=> b!1219791 m!1124861))

(declare-fun m!1124863 () Bool)

(assert (=> mapNonEmpty!48322 m!1124863))

(declare-fun m!1124865 () Bool)

(assert (=> b!1219802 m!1124865))

(declare-fun m!1124867 () Bool)

(assert (=> b!1219800 m!1124867))

(declare-fun m!1124869 () Bool)

(assert (=> b!1219800 m!1124869))

(declare-fun m!1124871 () Bool)

(assert (=> b!1219800 m!1124871))

(declare-fun m!1124873 () Bool)

(assert (=> b!1219800 m!1124873))

(assert (=> b!1219800 m!1124833))

(declare-fun m!1124875 () Bool)

(assert (=> b!1219800 m!1124875))

(assert (=> b!1219800 m!1124833))

(declare-fun m!1124877 () Bool)

(assert (=> b!1219793 m!1124877))

(assert (=> b!1219799 m!1124833))

(declare-fun m!1124879 () Bool)

(assert (=> b!1219795 m!1124879))

(declare-fun m!1124881 () Bool)

(assert (=> b!1219795 m!1124881))

(declare-fun m!1124883 () Bool)

(assert (=> b!1219795 m!1124883))

(declare-fun m!1124885 () Bool)

(assert (=> b!1219795 m!1124885))

(check-sat (not b_next!26257) (not b!1219791) (not b!1219800) (not b!1219792) (not b!1219790) (not b!1219807) (not b!1219796) b_and!43671 (not b!1219803) (not b!1219797) (not mapNonEmpty!48322) (not b!1219793) (not b!1219795) (not start!101622) (not b!1219802) tp_is_empty!30961 (not b_lambda!22003))
(check-sat b_and!43671 (not b_next!26257))
(get-model)

(declare-fun b_lambda!22009 () Bool)

(assert (= b_lambda!22003 (or (and start!101622 b_free!26257) b_lambda!22009)))

(check-sat (not b_next!26257) (not b!1219791) (not b!1219800) (not b!1219792) (not b!1219790) (not b!1219807) (not b!1219796) b_and!43671 (not b!1219803) (not b!1219797) tp_is_empty!30961 (not b!1219793) (not b!1219795) (not start!101622) (not b!1219802) (not mapNonEmpty!48322) (not b_lambda!22009))
(check-sat b_and!43671 (not b_next!26257))
(get-model)

(declare-fun d!134081 () Bool)

(assert (=> d!134081 (= (array_inv!28988 _keys!1208) (bvsge (size!38532 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101622 d!134081))

(declare-fun d!134083 () Bool)

(assert (=> d!134083 (= (array_inv!28989 _values!996) (bvsge (size!38533 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101622 d!134083))

(declare-fun b!1219946 () Bool)

(assert (=> b!1219946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38532 lt!554411)))))

(assert (=> b!1219946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38533 lt!554408)))))

(declare-fun e!692733 () Bool)

(declare-fun lt!554489 () ListLongMap!17977)

(declare-fun apply!981 (ListLongMap!17977 (_ BitVec 64)) V!46409)

(assert (=> b!1219946 (= e!692733 (= (apply!981 lt!554489 (select (arr!37995 lt!554411) from!1455)) (get!19409 (select (arr!37996 lt!554408) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219947 () Bool)

(declare-fun e!692732 () Bool)

(assert (=> b!1219947 (= e!692732 e!692733)))

(assert (=> b!1219947 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38532 lt!554411)))))

(declare-fun res!809896 () Bool)

(declare-fun contains!7046 (ListLongMap!17977 (_ BitVec 64)) Bool)

(assert (=> b!1219947 (= res!809896 (contains!7046 lt!554489 (select (arr!37995 lt!554411) from!1455)))))

(assert (=> b!1219947 (=> (not res!809896) (not e!692733))))

(declare-fun call!60714 () ListLongMap!17977)

(declare-fun bm!60711 () Bool)

(assert (=> bm!60711 (= call!60714 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219948 () Bool)

(declare-fun e!692734 () ListLongMap!17977)

(assert (=> b!1219948 (= e!692734 (ListLongMap!17978 Nil!26808))))

(declare-fun b!1219949 () Bool)

(declare-fun e!692731 () ListLongMap!17977)

(assert (=> b!1219949 (= e!692731 call!60714)))

(declare-fun b!1219950 () Bool)

(declare-fun e!692735 () Bool)

(declare-fun isEmpty!1000 (ListLongMap!17977) Bool)

(assert (=> b!1219950 (= e!692735 (isEmpty!1000 lt!554489))))

(declare-fun b!1219952 () Bool)

(assert (=> b!1219952 (= e!692732 e!692735)))

(declare-fun c!120531 () Bool)

(assert (=> b!1219952 (= c!120531 (bvslt from!1455 (size!38532 lt!554411)))))

(declare-fun b!1219953 () Bool)

(assert (=> b!1219953 (= e!692735 (= lt!554489 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219954 () Bool)

(declare-fun e!692729 () Bool)

(assert (=> b!1219954 (= e!692729 e!692732)))

(declare-fun c!120533 () Bool)

(declare-fun e!692730 () Bool)

(assert (=> b!1219954 (= c!120533 e!692730)))

(declare-fun res!809899 () Bool)

(assert (=> b!1219954 (=> (not res!809899) (not e!692730))))

(assert (=> b!1219954 (= res!809899 (bvslt from!1455 (size!38532 lt!554411)))))

(declare-fun b!1219955 () Bool)

(declare-fun res!809898 () Bool)

(assert (=> b!1219955 (=> (not res!809898) (not e!692729))))

(assert (=> b!1219955 (= res!809898 (not (contains!7046 lt!554489 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219956 () Bool)

(assert (=> b!1219956 (= e!692734 e!692731)))

(declare-fun c!120532 () Bool)

(assert (=> b!1219956 (= c!120532 (validKeyInArray!0 (select (arr!37995 lt!554411) from!1455)))))

(declare-fun b!1219957 () Bool)

(assert (=> b!1219957 (= e!692730 (validKeyInArray!0 (select (arr!37995 lt!554411) from!1455)))))

(assert (=> b!1219957 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!134085 () Bool)

(assert (=> d!134085 e!692729))

(declare-fun res!809897 () Bool)

(assert (=> d!134085 (=> (not res!809897) (not e!692729))))

(assert (=> d!134085 (= res!809897 (not (contains!7046 lt!554489 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134085 (= lt!554489 e!692734)))

(declare-fun c!120534 () Bool)

(assert (=> d!134085 (= c!120534 (bvsge from!1455 (size!38532 lt!554411)))))

(assert (=> d!134085 (validMask!0 mask!1564)))

(assert (=> d!134085 (= (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554489)))

(declare-fun b!1219951 () Bool)

(declare-fun lt!554492 () Unit!40364)

(declare-fun lt!554490 () Unit!40364)

(assert (=> b!1219951 (= lt!554492 lt!554490)))

(declare-fun lt!554493 () (_ BitVec 64))

(declare-fun lt!554488 () V!46409)

(declare-fun lt!554487 () ListLongMap!17977)

(declare-fun lt!554491 () (_ BitVec 64))

(assert (=> b!1219951 (not (contains!7046 (+!4115 lt!554487 (tuple2!20001 lt!554493 lt!554488)) lt!554491))))

(declare-fun addStillNotContains!302 (ListLongMap!17977 (_ BitVec 64) V!46409 (_ BitVec 64)) Unit!40364)

(assert (=> b!1219951 (= lt!554490 (addStillNotContains!302 lt!554487 lt!554493 lt!554488 lt!554491))))

(assert (=> b!1219951 (= lt!554491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219951 (= lt!554488 (get!19409 (select (arr!37996 lt!554408) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219951 (= lt!554493 (select (arr!37995 lt!554411) from!1455))))

(assert (=> b!1219951 (= lt!554487 call!60714)))

(assert (=> b!1219951 (= e!692731 (+!4115 call!60714 (tuple2!20001 (select (arr!37995 lt!554411) from!1455) (get!19409 (select (arr!37996 lt!554408) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134085 c!120534) b!1219948))

(assert (= (and d!134085 (not c!120534)) b!1219956))

(assert (= (and b!1219956 c!120532) b!1219951))

(assert (= (and b!1219956 (not c!120532)) b!1219949))

(assert (= (or b!1219951 b!1219949) bm!60711))

(assert (= (and d!134085 res!809897) b!1219955))

(assert (= (and b!1219955 res!809898) b!1219954))

(assert (= (and b!1219954 res!809899) b!1219957))

(assert (= (and b!1219954 c!120533) b!1219947))

(assert (= (and b!1219954 (not c!120533)) b!1219952))

(assert (= (and b!1219947 res!809896) b!1219946))

(assert (= (and b!1219952 c!120531) b!1219953))

(assert (= (and b!1219952 (not c!120531)) b!1219950))

(declare-fun b_lambda!22011 () Bool)

(assert (=> (not b_lambda!22011) (not b!1219946)))

(assert (=> b!1219946 t!40038))

(declare-fun b_and!43681 () Bool)

(assert (= b_and!43671 (and (=> t!40038 result!22707) b_and!43681)))

(declare-fun b_lambda!22013 () Bool)

(assert (=> (not b_lambda!22013) (not b!1219951)))

(assert (=> b!1219951 t!40038))

(declare-fun b_and!43683 () Bool)

(assert (= b_and!43681 (and (=> t!40038 result!22707) b_and!43683)))

(declare-fun m!1124995 () Bool)

(assert (=> b!1219953 m!1124995))

(declare-fun m!1124997 () Bool)

(assert (=> b!1219956 m!1124997))

(assert (=> b!1219956 m!1124997))

(declare-fun m!1124999 () Bool)

(assert (=> b!1219956 m!1124999))

(assert (=> bm!60711 m!1124995))

(declare-fun m!1125001 () Bool)

(assert (=> b!1219955 m!1125001))

(declare-fun m!1125003 () Bool)

(assert (=> b!1219950 m!1125003))

(assert (=> b!1219957 m!1124997))

(assert (=> b!1219957 m!1124997))

(assert (=> b!1219957 m!1124999))

(declare-fun m!1125005 () Bool)

(assert (=> b!1219951 m!1125005))

(assert (=> b!1219951 m!1124883))

(declare-fun m!1125007 () Bool)

(assert (=> b!1219951 m!1125007))

(assert (=> b!1219951 m!1125005))

(assert (=> b!1219951 m!1124997))

(declare-fun m!1125009 () Bool)

(assert (=> b!1219951 m!1125009))

(declare-fun m!1125011 () Bool)

(assert (=> b!1219951 m!1125011))

(declare-fun m!1125013 () Bool)

(assert (=> b!1219951 m!1125013))

(assert (=> b!1219951 m!1125011))

(declare-fun m!1125015 () Bool)

(assert (=> b!1219951 m!1125015))

(assert (=> b!1219951 m!1124883))

(assert (=> b!1219947 m!1124997))

(assert (=> b!1219947 m!1124997))

(declare-fun m!1125017 () Bool)

(assert (=> b!1219947 m!1125017))

(declare-fun m!1125019 () Bool)

(assert (=> d!134085 m!1125019))

(assert (=> d!134085 m!1124841))

(assert (=> b!1219946 m!1125005))

(assert (=> b!1219946 m!1124883))

(assert (=> b!1219946 m!1125007))

(assert (=> b!1219946 m!1124997))

(declare-fun m!1125021 () Bool)

(assert (=> b!1219946 m!1125021))

(assert (=> b!1219946 m!1125005))

(assert (=> b!1219946 m!1124883))

(assert (=> b!1219946 m!1124997))

(assert (=> b!1219795 d!134085))

(declare-fun b!1219958 () Bool)

(assert (=> b!1219958 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38532 _keys!1208)))))

(assert (=> b!1219958 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38533 _values!996)))))

(declare-fun lt!554496 () ListLongMap!17977)

(declare-fun e!692740 () Bool)

(assert (=> b!1219958 (= e!692740 (= (apply!981 lt!554496 (select (arr!37995 _keys!1208) from!1455)) (get!19409 (select (arr!37996 _values!996) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219959 () Bool)

(declare-fun e!692739 () Bool)

(assert (=> b!1219959 (= e!692739 e!692740)))

(assert (=> b!1219959 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38532 _keys!1208)))))

(declare-fun res!809900 () Bool)

(assert (=> b!1219959 (= res!809900 (contains!7046 lt!554496 (select (arr!37995 _keys!1208) from!1455)))))

(assert (=> b!1219959 (=> (not res!809900) (not e!692740))))

(declare-fun bm!60712 () Bool)

(declare-fun call!60715 () ListLongMap!17977)

(assert (=> bm!60712 (= call!60715 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219960 () Bool)

(declare-fun e!692741 () ListLongMap!17977)

(assert (=> b!1219960 (= e!692741 (ListLongMap!17978 Nil!26808))))

(declare-fun b!1219961 () Bool)

(declare-fun e!692738 () ListLongMap!17977)

(assert (=> b!1219961 (= e!692738 call!60715)))

(declare-fun b!1219962 () Bool)

(declare-fun e!692742 () Bool)

(assert (=> b!1219962 (= e!692742 (isEmpty!1000 lt!554496))))

(declare-fun b!1219964 () Bool)

(assert (=> b!1219964 (= e!692739 e!692742)))

(declare-fun c!120535 () Bool)

(assert (=> b!1219964 (= c!120535 (bvslt from!1455 (size!38532 _keys!1208)))))

(declare-fun b!1219965 () Bool)

(assert (=> b!1219965 (= e!692742 (= lt!554496 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1219966 () Bool)

(declare-fun e!692736 () Bool)

(assert (=> b!1219966 (= e!692736 e!692739)))

(declare-fun c!120537 () Bool)

(declare-fun e!692737 () Bool)

(assert (=> b!1219966 (= c!120537 e!692737)))

(declare-fun res!809903 () Bool)

(assert (=> b!1219966 (=> (not res!809903) (not e!692737))))

(assert (=> b!1219966 (= res!809903 (bvslt from!1455 (size!38532 _keys!1208)))))

(declare-fun b!1219967 () Bool)

(declare-fun res!809902 () Bool)

(assert (=> b!1219967 (=> (not res!809902) (not e!692736))))

(assert (=> b!1219967 (= res!809902 (not (contains!7046 lt!554496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219968 () Bool)

(assert (=> b!1219968 (= e!692741 e!692738)))

(declare-fun c!120536 () Bool)

(assert (=> b!1219968 (= c!120536 (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)))))

(declare-fun b!1219969 () Bool)

(assert (=> b!1219969 (= e!692737 (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)))))

(assert (=> b!1219969 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun d!134087 () Bool)

(assert (=> d!134087 e!692736))

(declare-fun res!809901 () Bool)

(assert (=> d!134087 (=> (not res!809901) (not e!692736))))

(assert (=> d!134087 (= res!809901 (not (contains!7046 lt!554496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134087 (= lt!554496 e!692741)))

(declare-fun c!120538 () Bool)

(assert (=> d!134087 (= c!120538 (bvsge from!1455 (size!38532 _keys!1208)))))

(assert (=> d!134087 (validMask!0 mask!1564)))

(assert (=> d!134087 (= (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554496)))

(declare-fun b!1219963 () Bool)

(declare-fun lt!554499 () Unit!40364)

(declare-fun lt!554497 () Unit!40364)

(assert (=> b!1219963 (= lt!554499 lt!554497)))

(declare-fun lt!554498 () (_ BitVec 64))

(declare-fun lt!554495 () V!46409)

(declare-fun lt!554500 () (_ BitVec 64))

(declare-fun lt!554494 () ListLongMap!17977)

(assert (=> b!1219963 (not (contains!7046 (+!4115 lt!554494 (tuple2!20001 lt!554500 lt!554495)) lt!554498))))

(assert (=> b!1219963 (= lt!554497 (addStillNotContains!302 lt!554494 lt!554500 lt!554495 lt!554498))))

(assert (=> b!1219963 (= lt!554498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219963 (= lt!554495 (get!19409 (select (arr!37996 _values!996) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219963 (= lt!554500 (select (arr!37995 _keys!1208) from!1455))))

(assert (=> b!1219963 (= lt!554494 call!60715)))

(assert (=> b!1219963 (= e!692738 (+!4115 call!60715 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134087 c!120538) b!1219960))

(assert (= (and d!134087 (not c!120538)) b!1219968))

(assert (= (and b!1219968 c!120536) b!1219963))

(assert (= (and b!1219968 (not c!120536)) b!1219961))

(assert (= (or b!1219963 b!1219961) bm!60712))

(assert (= (and d!134087 res!809901) b!1219967))

(assert (= (and b!1219967 res!809902) b!1219966))

(assert (= (and b!1219966 res!809903) b!1219969))

(assert (= (and b!1219966 c!120537) b!1219959))

(assert (= (and b!1219966 (not c!120537)) b!1219964))

(assert (= (and b!1219959 res!809900) b!1219958))

(assert (= (and b!1219964 c!120535) b!1219965))

(assert (= (and b!1219964 (not c!120535)) b!1219962))

(declare-fun b_lambda!22015 () Bool)

(assert (=> (not b_lambda!22015) (not b!1219958)))

(assert (=> b!1219958 t!40038))

(declare-fun b_and!43685 () Bool)

(assert (= b_and!43683 (and (=> t!40038 result!22707) b_and!43685)))

(declare-fun b_lambda!22017 () Bool)

(assert (=> (not b_lambda!22017) (not b!1219963)))

(assert (=> b!1219963 t!40038))

(declare-fun b_and!43687 () Bool)

(assert (= b_and!43685 (and (=> t!40038 result!22707) b_and!43687)))

(declare-fun m!1125023 () Bool)

(assert (=> b!1219965 m!1125023))

(assert (=> b!1219968 m!1124833))

(assert (=> b!1219968 m!1124833))

(assert (=> b!1219968 m!1124875))

(assert (=> bm!60712 m!1125023))

(declare-fun m!1125025 () Bool)

(assert (=> b!1219967 m!1125025))

(declare-fun m!1125027 () Bool)

(assert (=> b!1219962 m!1125027))

(assert (=> b!1219969 m!1124833))

(assert (=> b!1219969 m!1124833))

(assert (=> b!1219969 m!1124875))

(assert (=> b!1219963 m!1124835))

(assert (=> b!1219963 m!1124883))

(declare-fun m!1125029 () Bool)

(assert (=> b!1219963 m!1125029))

(assert (=> b!1219963 m!1124835))

(assert (=> b!1219963 m!1124833))

(declare-fun m!1125031 () Bool)

(assert (=> b!1219963 m!1125031))

(declare-fun m!1125033 () Bool)

(assert (=> b!1219963 m!1125033))

(declare-fun m!1125035 () Bool)

(assert (=> b!1219963 m!1125035))

(assert (=> b!1219963 m!1125033))

(declare-fun m!1125037 () Bool)

(assert (=> b!1219963 m!1125037))

(assert (=> b!1219963 m!1124883))

(assert (=> b!1219959 m!1124833))

(assert (=> b!1219959 m!1124833))

(declare-fun m!1125039 () Bool)

(assert (=> b!1219959 m!1125039))

(declare-fun m!1125041 () Bool)

(assert (=> d!134087 m!1125041))

(assert (=> d!134087 m!1124841))

(assert (=> b!1219958 m!1124835))

(assert (=> b!1219958 m!1124883))

(assert (=> b!1219958 m!1125029))

(assert (=> b!1219958 m!1124833))

(declare-fun m!1125043 () Bool)

(assert (=> b!1219958 m!1125043))

(assert (=> b!1219958 m!1124835))

(assert (=> b!1219958 m!1124883))

(assert (=> b!1219958 m!1124833))

(assert (=> b!1219795 d!134087))

(declare-fun bm!60715 () Bool)

(declare-fun call!60718 () Bool)

(declare-fun c!120541 () Bool)

(assert (=> bm!60715 (= call!60718 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120541 (Cons!26806 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) Nil!26807) Nil!26807)))))

(declare-fun b!1219981 () Bool)

(declare-fun e!692751 () Bool)

(declare-fun e!692753 () Bool)

(assert (=> b!1219981 (= e!692751 e!692753)))

(declare-fun res!809910 () Bool)

(assert (=> b!1219981 (=> (not res!809910) (not e!692753))))

(declare-fun e!692752 () Bool)

(assert (=> b!1219981 (= res!809910 (not e!692752))))

(declare-fun res!809911 () Bool)

(assert (=> b!1219981 (=> (not res!809911) (not e!692752))))

(assert (=> b!1219981 (= res!809911 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219982 () Bool)

(declare-fun e!692754 () Bool)

(assert (=> b!1219982 (= e!692754 call!60718)))

(declare-fun b!1219980 () Bool)

(declare-fun contains!7047 (List!26810 (_ BitVec 64)) Bool)

(assert (=> b!1219980 (= e!692752 (contains!7047 Nil!26807 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!134089 () Bool)

(declare-fun res!809912 () Bool)

(assert (=> d!134089 (=> res!809912 e!692751)))

(assert (=> d!134089 (= res!809912 (bvsge #b00000000000000000000000000000000 (size!38532 _keys!1208)))))

(assert (=> d!134089 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26807) e!692751)))

(declare-fun b!1219983 () Bool)

(assert (=> b!1219983 (= e!692753 e!692754)))

(assert (=> b!1219983 (= c!120541 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219984 () Bool)

(assert (=> b!1219984 (= e!692754 call!60718)))

(assert (= (and d!134089 (not res!809912)) b!1219981))

(assert (= (and b!1219981 res!809911) b!1219980))

(assert (= (and b!1219981 res!809910) b!1219983))

(assert (= (and b!1219983 c!120541) b!1219982))

(assert (= (and b!1219983 (not c!120541)) b!1219984))

(assert (= (or b!1219982 b!1219984) bm!60715))

(declare-fun m!1125045 () Bool)

(assert (=> bm!60715 m!1125045))

(declare-fun m!1125047 () Bool)

(assert (=> bm!60715 m!1125047))

(assert (=> b!1219981 m!1125045))

(assert (=> b!1219981 m!1125045))

(declare-fun m!1125049 () Bool)

(assert (=> b!1219981 m!1125049))

(assert (=> b!1219980 m!1125045))

(assert (=> b!1219980 m!1125045))

(declare-fun m!1125051 () Bool)

(assert (=> b!1219980 m!1125051))

(assert (=> b!1219983 m!1125045))

(assert (=> b!1219983 m!1125045))

(assert (=> b!1219983 m!1125049))

(assert (=> b!1219802 d!134089))

(declare-fun b!1219993 () Bool)

(declare-fun e!692763 () Bool)

(declare-fun e!692761 () Bool)

(assert (=> b!1219993 (= e!692763 e!692761)))

(declare-fun lt!554508 () (_ BitVec 64))

(assert (=> b!1219993 (= lt!554508 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554507 () Unit!40364)

(assert (=> b!1219993 (= lt!554507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554508 #b00000000000000000000000000000000))))

(assert (=> b!1219993 (arrayContainsKey!0 _keys!1208 lt!554508 #b00000000000000000000000000000000)))

(declare-fun lt!554509 () Unit!40364)

(assert (=> b!1219993 (= lt!554509 lt!554507)))

(declare-fun res!809918 () Bool)

(declare-datatypes ((SeekEntryResult!9901 0))(
  ( (MissingZero!9901 (index!41975 (_ BitVec 32))) (Found!9901 (index!41976 (_ BitVec 32))) (Intermediate!9901 (undefined!10713 Bool) (index!41977 (_ BitVec 32)) (x!107332 (_ BitVec 32))) (Undefined!9901) (MissingVacant!9901 (index!41978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78737 (_ BitVec 32)) SeekEntryResult!9901)

(assert (=> b!1219993 (= res!809918 (= (seekEntryOrOpen!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1219993 (=> (not res!809918) (not e!692761))))

(declare-fun d!134091 () Bool)

(declare-fun res!809917 () Bool)

(declare-fun e!692762 () Bool)

(assert (=> d!134091 (=> res!809917 e!692762)))

(assert (=> d!134091 (= res!809917 (bvsge #b00000000000000000000000000000000 (size!38532 _keys!1208)))))

(assert (=> d!134091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692762)))

(declare-fun b!1219994 () Bool)

(declare-fun call!60721 () Bool)

(assert (=> b!1219994 (= e!692761 call!60721)))

(declare-fun b!1219995 () Bool)

(assert (=> b!1219995 (= e!692762 e!692763)))

(declare-fun c!120544 () Bool)

(assert (=> b!1219995 (= c!120544 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60718 () Bool)

(assert (=> bm!60718 (= call!60721 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1219996 () Bool)

(assert (=> b!1219996 (= e!692763 call!60721)))

(assert (= (and d!134091 (not res!809917)) b!1219995))

(assert (= (and b!1219995 c!120544) b!1219993))

(assert (= (and b!1219995 (not c!120544)) b!1219996))

(assert (= (and b!1219993 res!809918) b!1219994))

(assert (= (or b!1219994 b!1219996) bm!60718))

(assert (=> b!1219993 m!1125045))

(declare-fun m!1125053 () Bool)

(assert (=> b!1219993 m!1125053))

(declare-fun m!1125055 () Bool)

(assert (=> b!1219993 m!1125055))

(assert (=> b!1219993 m!1125045))

(declare-fun m!1125057 () Bool)

(assert (=> b!1219993 m!1125057))

(assert (=> b!1219995 m!1125045))

(assert (=> b!1219995 m!1125045))

(assert (=> b!1219995 m!1125049))

(declare-fun m!1125059 () Bool)

(assert (=> bm!60718 m!1125059))

(assert (=> b!1219792 d!134091))

(declare-fun bm!60719 () Bool)

(declare-fun call!60722 () Bool)

(declare-fun c!120545 () Bool)

(assert (=> bm!60719 (= call!60722 (arrayNoDuplicates!0 lt!554411 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120545 (Cons!26806 (select (arr!37995 lt!554411) #b00000000000000000000000000000000) Nil!26807) Nil!26807)))))

(declare-fun b!1219998 () Bool)

(declare-fun e!692764 () Bool)

(declare-fun e!692766 () Bool)

(assert (=> b!1219998 (= e!692764 e!692766)))

(declare-fun res!809919 () Bool)

(assert (=> b!1219998 (=> (not res!809919) (not e!692766))))

(declare-fun e!692765 () Bool)

(assert (=> b!1219998 (= res!809919 (not e!692765))))

(declare-fun res!809920 () Bool)

(assert (=> b!1219998 (=> (not res!809920) (not e!692765))))

(assert (=> b!1219998 (= res!809920 (validKeyInArray!0 (select (arr!37995 lt!554411) #b00000000000000000000000000000000)))))

(declare-fun b!1219999 () Bool)

(declare-fun e!692767 () Bool)

(assert (=> b!1219999 (= e!692767 call!60722)))

(declare-fun b!1219997 () Bool)

(assert (=> b!1219997 (= e!692765 (contains!7047 Nil!26807 (select (arr!37995 lt!554411) #b00000000000000000000000000000000)))))

(declare-fun d!134093 () Bool)

(declare-fun res!809921 () Bool)

(assert (=> d!134093 (=> res!809921 e!692764)))

(assert (=> d!134093 (= res!809921 (bvsge #b00000000000000000000000000000000 (size!38532 lt!554411)))))

(assert (=> d!134093 (= (arrayNoDuplicates!0 lt!554411 #b00000000000000000000000000000000 Nil!26807) e!692764)))

(declare-fun b!1220000 () Bool)

(assert (=> b!1220000 (= e!692766 e!692767)))

(assert (=> b!1220000 (= c!120545 (validKeyInArray!0 (select (arr!37995 lt!554411) #b00000000000000000000000000000000)))))

(declare-fun b!1220001 () Bool)

(assert (=> b!1220001 (= e!692767 call!60722)))

(assert (= (and d!134093 (not res!809921)) b!1219998))

(assert (= (and b!1219998 res!809920) b!1219997))

(assert (= (and b!1219998 res!809919) b!1220000))

(assert (= (and b!1220000 c!120545) b!1219999))

(assert (= (and b!1220000 (not c!120545)) b!1220001))

(assert (= (or b!1219999 b!1220001) bm!60719))

(declare-fun m!1125061 () Bool)

(assert (=> bm!60719 m!1125061))

(declare-fun m!1125063 () Bool)

(assert (=> bm!60719 m!1125063))

(assert (=> b!1219998 m!1125061))

(assert (=> b!1219998 m!1125061))

(declare-fun m!1125065 () Bool)

(assert (=> b!1219998 m!1125065))

(assert (=> b!1219997 m!1125061))

(assert (=> b!1219997 m!1125061))

(declare-fun m!1125067 () Bool)

(assert (=> b!1219997 m!1125067))

(assert (=> b!1220000 m!1125061))

(assert (=> b!1220000 m!1125061))

(assert (=> b!1220000 m!1125065))

(assert (=> b!1219793 d!134093))

(declare-fun d!134095 () Bool)

(declare-fun res!809926 () Bool)

(declare-fun e!692772 () Bool)

(assert (=> d!134095 (=> res!809926 e!692772)))

(assert (=> d!134095 (= res!809926 (= (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134095 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692772)))

(declare-fun b!1220006 () Bool)

(declare-fun e!692773 () Bool)

(assert (=> b!1220006 (= e!692772 e!692773)))

(declare-fun res!809927 () Bool)

(assert (=> b!1220006 (=> (not res!809927) (not e!692773))))

(assert (=> b!1220006 (= res!809927 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38532 _keys!1208)))))

(declare-fun b!1220007 () Bool)

(assert (=> b!1220007 (= e!692773 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134095 (not res!809926)) b!1220006))

(assert (= (and b!1220006 res!809927) b!1220007))

(assert (=> d!134095 m!1125045))

(declare-fun m!1125069 () Bool)

(assert (=> b!1220007 m!1125069))

(assert (=> b!1219803 d!134095))

(declare-fun d!134097 () Bool)

(assert (=> d!134097 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554512 () Unit!40364)

(declare-fun choose!13 (array!78737 (_ BitVec 64) (_ BitVec 32)) Unit!40364)

(assert (=> d!134097 (= lt!554512 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134097 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134097 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554512)))

(declare-fun bs!34349 () Bool)

(assert (= bs!34349 d!134097))

(assert (=> bs!34349 m!1124849))

(declare-fun m!1125071 () Bool)

(assert (=> bs!34349 m!1125071))

(assert (=> b!1219803 d!134097))

(declare-fun d!134099 () Bool)

(assert (=> d!134099 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1219790 d!134099))

(declare-fun d!134101 () Bool)

(assert (=> d!134101 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219791 d!134101))

(declare-fun d!134103 () Bool)

(declare-fun lt!554515 () ListLongMap!17977)

(assert (=> d!134103 (not (contains!7046 lt!554515 k0!934))))

(declare-fun removeStrictlySorted!104 (List!26811 (_ BitVec 64)) List!26811)

(assert (=> d!134103 (= lt!554515 (ListLongMap!17978 (removeStrictlySorted!104 (toList!9004 lt!554406) k0!934)))))

(assert (=> d!134103 (= (-!1893 lt!554406 k0!934) lt!554515)))

(declare-fun bs!34350 () Bool)

(assert (= bs!34350 d!134103))

(declare-fun m!1125073 () Bool)

(assert (=> bs!34350 m!1125073))

(declare-fun m!1125075 () Bool)

(assert (=> bs!34350 m!1125075))

(assert (=> b!1219800 d!134103))

(declare-fun b!1220008 () Bool)

(assert (=> b!1220008 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 lt!554411)))))

(assert (=> b!1220008 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38533 lt!554408)))))

(declare-fun e!692778 () Bool)

(declare-fun lt!554518 () ListLongMap!17977)

(assert (=> b!1220008 (= e!692778 (= (apply!981 lt!554518 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19409 (select (arr!37996 lt!554408) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220009 () Bool)

(declare-fun e!692777 () Bool)

(assert (=> b!1220009 (= e!692777 e!692778)))

(assert (=> b!1220009 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 lt!554411)))))

(declare-fun res!809928 () Bool)

(assert (=> b!1220009 (= res!809928 (contains!7046 lt!554518 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220009 (=> (not res!809928) (not e!692778))))

(declare-fun bm!60720 () Bool)

(declare-fun call!60723 () ListLongMap!17977)

(assert (=> bm!60720 (= call!60723 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220010 () Bool)

(declare-fun e!692779 () ListLongMap!17977)

(assert (=> b!1220010 (= e!692779 (ListLongMap!17978 Nil!26808))))

(declare-fun b!1220011 () Bool)

(declare-fun e!692776 () ListLongMap!17977)

(assert (=> b!1220011 (= e!692776 call!60723)))

(declare-fun b!1220012 () Bool)

(declare-fun e!692780 () Bool)

(assert (=> b!1220012 (= e!692780 (isEmpty!1000 lt!554518))))

(declare-fun b!1220014 () Bool)

(assert (=> b!1220014 (= e!692777 e!692780)))

(declare-fun c!120546 () Bool)

(assert (=> b!1220014 (= c!120546 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 lt!554411)))))

(declare-fun b!1220015 () Bool)

(assert (=> b!1220015 (= e!692780 (= lt!554518 (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220016 () Bool)

(declare-fun e!692774 () Bool)

(assert (=> b!1220016 (= e!692774 e!692777)))

(declare-fun c!120548 () Bool)

(declare-fun e!692775 () Bool)

(assert (=> b!1220016 (= c!120548 e!692775)))

(declare-fun res!809931 () Bool)

(assert (=> b!1220016 (=> (not res!809931) (not e!692775))))

(assert (=> b!1220016 (= res!809931 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 lt!554411)))))

(declare-fun b!1220017 () Bool)

(declare-fun res!809930 () Bool)

(assert (=> b!1220017 (=> (not res!809930) (not e!692774))))

(assert (=> b!1220017 (= res!809930 (not (contains!7046 lt!554518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220018 () Bool)

(assert (=> b!1220018 (= e!692779 e!692776)))

(declare-fun c!120547 () Bool)

(assert (=> b!1220018 (= c!120547 (validKeyInArray!0 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220019 () Bool)

(assert (=> b!1220019 (= e!692775 (validKeyInArray!0 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220019 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!134105 () Bool)

(assert (=> d!134105 e!692774))

(declare-fun res!809929 () Bool)

(assert (=> d!134105 (=> (not res!809929) (not e!692774))))

(assert (=> d!134105 (= res!809929 (not (contains!7046 lt!554518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134105 (= lt!554518 e!692779)))

(declare-fun c!120549 () Bool)

(assert (=> d!134105 (= c!120549 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 lt!554411)))))

(assert (=> d!134105 (validMask!0 mask!1564)))

(assert (=> d!134105 (= (getCurrentListMapNoExtraKeys!5461 lt!554411 lt!554408 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554518)))

(declare-fun b!1220013 () Bool)

(declare-fun lt!554521 () Unit!40364)

(declare-fun lt!554519 () Unit!40364)

(assert (=> b!1220013 (= lt!554521 lt!554519)))

(declare-fun lt!554520 () (_ BitVec 64))

(declare-fun lt!554517 () V!46409)

(declare-fun lt!554522 () (_ BitVec 64))

(declare-fun lt!554516 () ListLongMap!17977)

(assert (=> b!1220013 (not (contains!7046 (+!4115 lt!554516 (tuple2!20001 lt!554522 lt!554517)) lt!554520))))

(assert (=> b!1220013 (= lt!554519 (addStillNotContains!302 lt!554516 lt!554522 lt!554517 lt!554520))))

(assert (=> b!1220013 (= lt!554520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220013 (= lt!554517 (get!19409 (select (arr!37996 lt!554408) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220013 (= lt!554522 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220013 (= lt!554516 call!60723)))

(assert (=> b!1220013 (= e!692776 (+!4115 call!60723 (tuple2!20001 (select (arr!37995 lt!554411) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19409 (select (arr!37996 lt!554408) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134105 c!120549) b!1220010))

(assert (= (and d!134105 (not c!120549)) b!1220018))

(assert (= (and b!1220018 c!120547) b!1220013))

(assert (= (and b!1220018 (not c!120547)) b!1220011))

(assert (= (or b!1220013 b!1220011) bm!60720))

(assert (= (and d!134105 res!809929) b!1220017))

(assert (= (and b!1220017 res!809930) b!1220016))

(assert (= (and b!1220016 res!809931) b!1220019))

(assert (= (and b!1220016 c!120548) b!1220009))

(assert (= (and b!1220016 (not c!120548)) b!1220014))

(assert (= (and b!1220009 res!809928) b!1220008))

(assert (= (and b!1220014 c!120546) b!1220015))

(assert (= (and b!1220014 (not c!120546)) b!1220012))

(declare-fun b_lambda!22019 () Bool)

(assert (=> (not b_lambda!22019) (not b!1220008)))

(assert (=> b!1220008 t!40038))

(declare-fun b_and!43689 () Bool)

(assert (= b_and!43687 (and (=> t!40038 result!22707) b_and!43689)))

(declare-fun b_lambda!22021 () Bool)

(assert (=> (not b_lambda!22021) (not b!1220013)))

(assert (=> b!1220013 t!40038))

(declare-fun b_and!43691 () Bool)

(assert (= b_and!43689 (and (=> t!40038 result!22707) b_and!43691)))

(declare-fun m!1125077 () Bool)

(assert (=> b!1220015 m!1125077))

(declare-fun m!1125079 () Bool)

(assert (=> b!1220018 m!1125079))

(assert (=> b!1220018 m!1125079))

(declare-fun m!1125081 () Bool)

(assert (=> b!1220018 m!1125081))

(assert (=> bm!60720 m!1125077))

(declare-fun m!1125083 () Bool)

(assert (=> b!1220017 m!1125083))

(declare-fun m!1125085 () Bool)

(assert (=> b!1220012 m!1125085))

(assert (=> b!1220019 m!1125079))

(assert (=> b!1220019 m!1125079))

(assert (=> b!1220019 m!1125081))

(declare-fun m!1125087 () Bool)

(assert (=> b!1220013 m!1125087))

(assert (=> b!1220013 m!1124883))

(declare-fun m!1125089 () Bool)

(assert (=> b!1220013 m!1125089))

(assert (=> b!1220013 m!1125087))

(assert (=> b!1220013 m!1125079))

(declare-fun m!1125091 () Bool)

(assert (=> b!1220013 m!1125091))

(declare-fun m!1125093 () Bool)

(assert (=> b!1220013 m!1125093))

(declare-fun m!1125095 () Bool)

(assert (=> b!1220013 m!1125095))

(assert (=> b!1220013 m!1125093))

(declare-fun m!1125097 () Bool)

(assert (=> b!1220013 m!1125097))

(assert (=> b!1220013 m!1124883))

(assert (=> b!1220009 m!1125079))

(assert (=> b!1220009 m!1125079))

(declare-fun m!1125099 () Bool)

(assert (=> b!1220009 m!1125099))

(declare-fun m!1125101 () Bool)

(assert (=> d!134105 m!1125101))

(assert (=> d!134105 m!1124841))

(assert (=> b!1220008 m!1125087))

(assert (=> b!1220008 m!1124883))

(assert (=> b!1220008 m!1125089))

(assert (=> b!1220008 m!1125079))

(declare-fun m!1125103 () Bool)

(assert (=> b!1220008 m!1125103))

(assert (=> b!1220008 m!1125087))

(assert (=> b!1220008 m!1124883))

(assert (=> b!1220008 m!1125079))

(assert (=> b!1219800 d!134105))

(declare-fun d!134107 () Bool)

(assert (=> d!134107 (= (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)) (and (not (= (select (arr!37995 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37995 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219800 d!134107))

(declare-fun b!1220026 () Bool)

(declare-fun e!692786 () Bool)

(declare-fun call!60729 () ListLongMap!17977)

(declare-fun call!60728 () ListLongMap!17977)

(assert (=> b!1220026 (= e!692786 (= call!60729 call!60728))))

(assert (=> b!1220026 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38533 _values!996)))))

(declare-fun bm!60725 () Bool)

(assert (=> bm!60725 (= call!60728 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220027 () Bool)

(declare-fun e!692785 () Bool)

(assert (=> b!1220027 (= e!692785 e!692786)))

(declare-fun c!120552 () Bool)

(assert (=> b!1220027 (= c!120552 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!134109 () Bool)

(assert (=> d!134109 e!692785))

(declare-fun res!809934 () Bool)

(assert (=> d!134109 (=> (not res!809934) (not e!692785))))

(assert (=> d!134109 (= res!809934 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38532 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38532 _keys!1208))))))))

(declare-fun lt!554525 () Unit!40364)

(declare-fun choose!1828 (array!78737 array!78739 (_ BitVec 32) (_ BitVec 32) V!46409 V!46409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40364)

(assert (=> d!134109 (= lt!554525 (choose!1828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134109 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(assert (=> d!134109 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1108 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554525)))

(declare-fun b!1220028 () Bool)

(assert (=> b!1220028 (= e!692786 (= call!60729 (-!1893 call!60728 k0!934)))))

(assert (=> b!1220028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38533 _values!996)))))

(declare-fun bm!60726 () Bool)

(assert (=> bm!60726 (= call!60729 (getCurrentListMapNoExtraKeys!5461 (array!78738 (store (arr!37995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38532 _keys!1208)) (array!78740 (store (arr!37996 _values!996) i!673 (ValueCellFull!14771 (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38533 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!134109 res!809934) b!1220027))

(assert (= (and b!1220027 c!120552) b!1220028))

(assert (= (and b!1220027 (not c!120552)) b!1220026))

(assert (= (or b!1220028 b!1220026) bm!60725))

(assert (= (or b!1220028 b!1220026) bm!60726))

(declare-fun b_lambda!22023 () Bool)

(assert (=> (not b_lambda!22023) (not bm!60726)))

(assert (=> bm!60726 t!40038))

(declare-fun b_and!43693 () Bool)

(assert (= b_and!43691 (and (=> t!40038 result!22707) b_and!43693)))

(assert (=> bm!60725 m!1124867))

(declare-fun m!1125105 () Bool)

(assert (=> d!134109 m!1125105))

(declare-fun m!1125107 () Bool)

(assert (=> b!1220028 m!1125107))

(assert (=> bm!60726 m!1124855))

(assert (=> bm!60726 m!1124883))

(declare-fun m!1125109 () Bool)

(assert (=> bm!60726 m!1125109))

(declare-fun m!1125111 () Bool)

(assert (=> bm!60726 m!1125111))

(assert (=> b!1219800 d!134109))

(declare-fun b!1220029 () Bool)

(assert (=> b!1220029 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(assert (=> b!1220029 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38533 _values!996)))))

(declare-fun e!692791 () Bool)

(declare-fun lt!554528 () ListLongMap!17977)

(assert (=> b!1220029 (= e!692791 (= (apply!981 lt!554528 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19409 (select (arr!37996 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220030 () Bool)

(declare-fun e!692790 () Bool)

(assert (=> b!1220030 (= e!692790 e!692791)))

(assert (=> b!1220030 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(declare-fun res!809935 () Bool)

(assert (=> b!1220030 (= res!809935 (contains!7046 lt!554528 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220030 (=> (not res!809935) (not e!692791))))

(declare-fun call!60730 () ListLongMap!17977)

(declare-fun bm!60727 () Bool)

(assert (=> bm!60727 (= call!60730 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220031 () Bool)

(declare-fun e!692792 () ListLongMap!17977)

(assert (=> b!1220031 (= e!692792 (ListLongMap!17978 Nil!26808))))

(declare-fun b!1220032 () Bool)

(declare-fun e!692789 () ListLongMap!17977)

(assert (=> b!1220032 (= e!692789 call!60730)))

(declare-fun b!1220033 () Bool)

(declare-fun e!692793 () Bool)

(assert (=> b!1220033 (= e!692793 (isEmpty!1000 lt!554528))))

(declare-fun b!1220035 () Bool)

(assert (=> b!1220035 (= e!692790 e!692793)))

(declare-fun c!120553 () Bool)

(assert (=> b!1220035 (= c!120553 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(declare-fun b!1220036 () Bool)

(assert (=> b!1220036 (= e!692793 (= lt!554528 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220037 () Bool)

(declare-fun e!692787 () Bool)

(assert (=> b!1220037 (= e!692787 e!692790)))

(declare-fun c!120555 () Bool)

(declare-fun e!692788 () Bool)

(assert (=> b!1220037 (= c!120555 e!692788)))

(declare-fun res!809938 () Bool)

(assert (=> b!1220037 (=> (not res!809938) (not e!692788))))

(assert (=> b!1220037 (= res!809938 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(declare-fun b!1220038 () Bool)

(declare-fun res!809937 () Bool)

(assert (=> b!1220038 (=> (not res!809937) (not e!692787))))

(assert (=> b!1220038 (= res!809937 (not (contains!7046 lt!554528 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220039 () Bool)

(assert (=> b!1220039 (= e!692792 e!692789)))

(declare-fun c!120554 () Bool)

(assert (=> b!1220039 (= c!120554 (validKeyInArray!0 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220040 () Bool)

(assert (=> b!1220040 (= e!692788 (validKeyInArray!0 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220040 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun d!134111 () Bool)

(assert (=> d!134111 e!692787))

(declare-fun res!809936 () Bool)

(assert (=> d!134111 (=> (not res!809936) (not e!692787))))

(assert (=> d!134111 (= res!809936 (not (contains!7046 lt!554528 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134111 (= lt!554528 e!692792)))

(declare-fun c!120556 () Bool)

(assert (=> d!134111 (= c!120556 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38532 _keys!1208)))))

(assert (=> d!134111 (validMask!0 mask!1564)))

(assert (=> d!134111 (= (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554528)))

(declare-fun b!1220034 () Bool)

(declare-fun lt!554531 () Unit!40364)

(declare-fun lt!554529 () Unit!40364)

(assert (=> b!1220034 (= lt!554531 lt!554529)))

(declare-fun lt!554527 () V!46409)

(declare-fun lt!554530 () (_ BitVec 64))

(declare-fun lt!554526 () ListLongMap!17977)

(declare-fun lt!554532 () (_ BitVec 64))

(assert (=> b!1220034 (not (contains!7046 (+!4115 lt!554526 (tuple2!20001 lt!554532 lt!554527)) lt!554530))))

(assert (=> b!1220034 (= lt!554529 (addStillNotContains!302 lt!554526 lt!554532 lt!554527 lt!554530))))

(assert (=> b!1220034 (= lt!554530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220034 (= lt!554527 (get!19409 (select (arr!37996 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220034 (= lt!554532 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220034 (= lt!554526 call!60730)))

(assert (=> b!1220034 (= e!692789 (+!4115 call!60730 (tuple2!20001 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19409 (select (arr!37996 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134111 c!120556) b!1220031))

(assert (= (and d!134111 (not c!120556)) b!1220039))

(assert (= (and b!1220039 c!120554) b!1220034))

(assert (= (and b!1220039 (not c!120554)) b!1220032))

(assert (= (or b!1220034 b!1220032) bm!60727))

(assert (= (and d!134111 res!809936) b!1220038))

(assert (= (and b!1220038 res!809937) b!1220037))

(assert (= (and b!1220037 res!809938) b!1220040))

(assert (= (and b!1220037 c!120555) b!1220030))

(assert (= (and b!1220037 (not c!120555)) b!1220035))

(assert (= (and b!1220030 res!809935) b!1220029))

(assert (= (and b!1220035 c!120553) b!1220036))

(assert (= (and b!1220035 (not c!120553)) b!1220033))

(declare-fun b_lambda!22025 () Bool)

(assert (=> (not b_lambda!22025) (not b!1220029)))

(assert (=> b!1220029 t!40038))

(declare-fun b_and!43695 () Bool)

(assert (= b_and!43693 (and (=> t!40038 result!22707) b_and!43695)))

(declare-fun b_lambda!22027 () Bool)

(assert (=> (not b_lambda!22027) (not b!1220034)))

(assert (=> b!1220034 t!40038))

(declare-fun b_and!43697 () Bool)

(assert (= b_and!43695 (and (=> t!40038 result!22707) b_and!43697)))

(declare-fun m!1125113 () Bool)

(assert (=> b!1220036 m!1125113))

(declare-fun m!1125115 () Bool)

(assert (=> b!1220039 m!1125115))

(assert (=> b!1220039 m!1125115))

(declare-fun m!1125117 () Bool)

(assert (=> b!1220039 m!1125117))

(assert (=> bm!60727 m!1125113))

(declare-fun m!1125119 () Bool)

(assert (=> b!1220038 m!1125119))

(declare-fun m!1125121 () Bool)

(assert (=> b!1220033 m!1125121))

(assert (=> b!1220040 m!1125115))

(assert (=> b!1220040 m!1125115))

(assert (=> b!1220040 m!1125117))

(declare-fun m!1125123 () Bool)

(assert (=> b!1220034 m!1125123))

(assert (=> b!1220034 m!1124883))

(declare-fun m!1125125 () Bool)

(assert (=> b!1220034 m!1125125))

(assert (=> b!1220034 m!1125123))

(assert (=> b!1220034 m!1125115))

(declare-fun m!1125127 () Bool)

(assert (=> b!1220034 m!1125127))

(declare-fun m!1125129 () Bool)

(assert (=> b!1220034 m!1125129))

(declare-fun m!1125131 () Bool)

(assert (=> b!1220034 m!1125131))

(assert (=> b!1220034 m!1125129))

(declare-fun m!1125133 () Bool)

(assert (=> b!1220034 m!1125133))

(assert (=> b!1220034 m!1124883))

(assert (=> b!1220030 m!1125115))

(assert (=> b!1220030 m!1125115))

(declare-fun m!1125135 () Bool)

(assert (=> b!1220030 m!1125135))

(declare-fun m!1125137 () Bool)

(assert (=> d!134111 m!1125137))

(assert (=> d!134111 m!1124841))

(assert (=> b!1220029 m!1125123))

(assert (=> b!1220029 m!1124883))

(assert (=> b!1220029 m!1125125))

(assert (=> b!1220029 m!1125115))

(declare-fun m!1125139 () Bool)

(assert (=> b!1220029 m!1125139))

(assert (=> b!1220029 m!1125123))

(assert (=> b!1220029 m!1124883))

(assert (=> b!1220029 m!1125115))

(assert (=> b!1219800 d!134111))

(declare-fun d!134113 () Bool)

(declare-fun res!809939 () Bool)

(declare-fun e!692794 () Bool)

(assert (=> d!134113 (=> res!809939 e!692794)))

(assert (=> d!134113 (= res!809939 (= (select (arr!37995 _keys!1208) i!673) k0!934))))

(assert (=> d!134113 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692794)))

(declare-fun b!1220041 () Bool)

(declare-fun e!692795 () Bool)

(assert (=> b!1220041 (= e!692794 e!692795)))

(declare-fun res!809940 () Bool)

(assert (=> b!1220041 (=> (not res!809940) (not e!692795))))

(assert (=> b!1220041 (= res!809940 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38532 _keys!1208)))))

(declare-fun b!1220042 () Bool)

(assert (=> b!1220042 (= e!692795 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134113 (not res!809939)) b!1220041))

(assert (= (and b!1220041 res!809940) b!1220042))

(assert (=> d!134113 m!1124847))

(declare-fun m!1125141 () Bool)

(assert (=> b!1220042 m!1125141))

(assert (=> b!1219797 d!134113))

(declare-fun d!134115 () Bool)

(declare-fun e!692798 () Bool)

(assert (=> d!134115 e!692798))

(declare-fun res!809946 () Bool)

(assert (=> d!134115 (=> (not res!809946) (not e!692798))))

(declare-fun lt!554542 () ListLongMap!17977)

(assert (=> d!134115 (= res!809946 (contains!7046 lt!554542 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))))))

(declare-fun lt!554543 () List!26811)

(assert (=> d!134115 (= lt!554542 (ListLongMap!17978 lt!554543))))

(declare-fun lt!554541 () Unit!40364)

(declare-fun lt!554544 () Unit!40364)

(assert (=> d!134115 (= lt!554541 lt!554544)))

(declare-datatypes ((Option!690 0))(
  ( (Some!689 (v!18191 V!46409)) (None!688) )
))
(declare-fun getValueByKey!639 (List!26811 (_ BitVec 64)) Option!690)

(assert (=> d!134115 (= (getValueByKey!639 lt!554543 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))) (Some!689 (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!321 (List!26811 (_ BitVec 64) V!46409) Unit!40364)

(assert (=> d!134115 (= lt!554544 (lemmaContainsTupThenGetReturnValue!321 lt!554543 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407))) (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))))))

(declare-fun insertStrictlySorted!414 (List!26811 (_ BitVec 64) V!46409) List!26811)

(assert (=> d!134115 (= lt!554543 (insertStrictlySorted!414 (toList!9004 lt!554405) (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407))) (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))))))

(assert (=> d!134115 (= (+!4115 lt!554405 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407))) lt!554542)))

(declare-fun b!1220047 () Bool)

(declare-fun res!809945 () Bool)

(assert (=> b!1220047 (=> (not res!809945) (not e!692798))))

(assert (=> b!1220047 (= res!809945 (= (getValueByKey!639 (toList!9004 lt!554542) (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407)))) (Some!689 (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407))))))))

(declare-fun b!1220048 () Bool)

(declare-fun contains!7048 (List!26811 tuple2!20000) Bool)

(assert (=> b!1220048 (= e!692798 (contains!7048 (toList!9004 lt!554542) (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407))))))

(assert (= (and d!134115 res!809946) b!1220047))

(assert (= (and b!1220047 res!809945) b!1220048))

(declare-fun m!1125143 () Bool)

(assert (=> d!134115 m!1125143))

(declare-fun m!1125145 () Bool)

(assert (=> d!134115 m!1125145))

(declare-fun m!1125147 () Bool)

(assert (=> d!134115 m!1125147))

(declare-fun m!1125149 () Bool)

(assert (=> d!134115 m!1125149))

(declare-fun m!1125151 () Bool)

(assert (=> b!1220047 m!1125151))

(declare-fun m!1125153 () Bool)

(assert (=> b!1220048 m!1125153))

(assert (=> b!1219796 d!134115))

(declare-fun d!134117 () Bool)

(declare-fun c!120559 () Bool)

(assert (=> d!134117 (= c!120559 ((_ is ValueCellFull!14771) (select (arr!37996 _values!996) from!1455)))))

(declare-fun e!692801 () V!46409)

(assert (=> d!134117 (= (get!19409 (select (arr!37996 _values!996) from!1455) lt!554407) e!692801)))

(declare-fun b!1220053 () Bool)

(declare-fun get!19412 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1220053 (= e!692801 (get!19412 (select (arr!37996 _values!996) from!1455) lt!554407))))

(declare-fun b!1220054 () Bool)

(declare-fun get!19413 (ValueCell!14771 V!46409) V!46409)

(assert (=> b!1220054 (= e!692801 (get!19413 (select (arr!37996 _values!996) from!1455) lt!554407))))

(assert (= (and d!134117 c!120559) b!1220053))

(assert (= (and d!134117 (not c!120559)) b!1220054))

(assert (=> b!1220053 m!1124835))

(declare-fun m!1125155 () Bool)

(assert (=> b!1220053 m!1125155))

(assert (=> b!1220054 m!1124835))

(declare-fun m!1125157 () Bool)

(assert (=> b!1220054 m!1125157))

(assert (=> b!1219796 d!134117))

(declare-fun b!1220055 () Bool)

(declare-fun e!692804 () Bool)

(declare-fun e!692802 () Bool)

(assert (=> b!1220055 (= e!692804 e!692802)))

(declare-fun lt!554546 () (_ BitVec 64))

(assert (=> b!1220055 (= lt!554546 (select (arr!37995 lt!554411) #b00000000000000000000000000000000))))

(declare-fun lt!554545 () Unit!40364)

(assert (=> b!1220055 (= lt!554545 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554411 lt!554546 #b00000000000000000000000000000000))))

(assert (=> b!1220055 (arrayContainsKey!0 lt!554411 lt!554546 #b00000000000000000000000000000000)))

(declare-fun lt!554547 () Unit!40364)

(assert (=> b!1220055 (= lt!554547 lt!554545)))

(declare-fun res!809948 () Bool)

(assert (=> b!1220055 (= res!809948 (= (seekEntryOrOpen!0 (select (arr!37995 lt!554411) #b00000000000000000000000000000000) lt!554411 mask!1564) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1220055 (=> (not res!809948) (not e!692802))))

(declare-fun d!134119 () Bool)

(declare-fun res!809947 () Bool)

(declare-fun e!692803 () Bool)

(assert (=> d!134119 (=> res!809947 e!692803)))

(assert (=> d!134119 (= res!809947 (bvsge #b00000000000000000000000000000000 (size!38532 lt!554411)))))

(assert (=> d!134119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554411 mask!1564) e!692803)))

(declare-fun b!1220056 () Bool)

(declare-fun call!60731 () Bool)

(assert (=> b!1220056 (= e!692802 call!60731)))

(declare-fun b!1220057 () Bool)

(assert (=> b!1220057 (= e!692803 e!692804)))

(declare-fun c!120560 () Bool)

(assert (=> b!1220057 (= c!120560 (validKeyInArray!0 (select (arr!37995 lt!554411) #b00000000000000000000000000000000)))))

(declare-fun bm!60728 () Bool)

(assert (=> bm!60728 (= call!60731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554411 mask!1564))))

(declare-fun b!1220058 () Bool)

(assert (=> b!1220058 (= e!692804 call!60731)))

(assert (= (and d!134119 (not res!809947)) b!1220057))

(assert (= (and b!1220057 c!120560) b!1220055))

(assert (= (and b!1220057 (not c!120560)) b!1220058))

(assert (= (and b!1220055 res!809948) b!1220056))

(assert (= (or b!1220056 b!1220058) bm!60728))

(assert (=> b!1220055 m!1125061))

(declare-fun m!1125159 () Bool)

(assert (=> b!1220055 m!1125159))

(declare-fun m!1125161 () Bool)

(assert (=> b!1220055 m!1125161))

(assert (=> b!1220055 m!1125061))

(declare-fun m!1125163 () Bool)

(assert (=> b!1220055 m!1125163))

(assert (=> b!1220057 m!1125061))

(assert (=> b!1220057 m!1125061))

(assert (=> b!1220057 m!1125065))

(declare-fun m!1125165 () Bool)

(assert (=> bm!60728 m!1125165))

(assert (=> b!1219807 d!134119))

(declare-fun mapNonEmpty!48331 () Bool)

(declare-fun mapRes!48331 () Bool)

(declare-fun tp!91814 () Bool)

(declare-fun e!692809 () Bool)

(assert (=> mapNonEmpty!48331 (= mapRes!48331 (and tp!91814 e!692809))))

(declare-fun mapRest!48331 () (Array (_ BitVec 32) ValueCell!14771))

(declare-fun mapKey!48331 () (_ BitVec 32))

(declare-fun mapValue!48331 () ValueCell!14771)

(assert (=> mapNonEmpty!48331 (= mapRest!48322 (store mapRest!48331 mapKey!48331 mapValue!48331))))

(declare-fun b!1220066 () Bool)

(declare-fun e!692810 () Bool)

(assert (=> b!1220066 (= e!692810 tp_is_empty!30961)))

(declare-fun b!1220065 () Bool)

(assert (=> b!1220065 (= e!692809 tp_is_empty!30961)))

(declare-fun condMapEmpty!48331 () Bool)

(declare-fun mapDefault!48331 () ValueCell!14771)

(assert (=> mapNonEmpty!48322 (= condMapEmpty!48331 (= mapRest!48322 ((as const (Array (_ BitVec 32) ValueCell!14771)) mapDefault!48331)))))

(assert (=> mapNonEmpty!48322 (= tp!91798 (and e!692810 mapRes!48331))))

(declare-fun mapIsEmpty!48331 () Bool)

(assert (=> mapIsEmpty!48331 mapRes!48331))

(assert (= (and mapNonEmpty!48322 condMapEmpty!48331) mapIsEmpty!48331))

(assert (= (and mapNonEmpty!48322 (not condMapEmpty!48331)) mapNonEmpty!48331))

(assert (= (and mapNonEmpty!48331 ((_ is ValueCellFull!14771) mapValue!48331)) b!1220065))

(assert (= (and mapNonEmpty!48322 ((_ is ValueCellFull!14771) mapDefault!48331)) b!1220066))

(declare-fun m!1125167 () Bool)

(assert (=> mapNonEmpty!48331 m!1125167))

(declare-fun b_lambda!22029 () Bool)

(assert (= b_lambda!22011 (or (and start!101622 b_free!26257) b_lambda!22029)))

(declare-fun b_lambda!22031 () Bool)

(assert (= b_lambda!22015 (or (and start!101622 b_free!26257) b_lambda!22031)))

(declare-fun b_lambda!22033 () Bool)

(assert (= b_lambda!22023 (or (and start!101622 b_free!26257) b_lambda!22033)))

(declare-fun b_lambda!22035 () Bool)

(assert (= b_lambda!22017 (or (and start!101622 b_free!26257) b_lambda!22035)))

(declare-fun b_lambda!22037 () Bool)

(assert (= b_lambda!22019 (or (and start!101622 b_free!26257) b_lambda!22037)))

(declare-fun b_lambda!22039 () Bool)

(assert (= b_lambda!22027 (or (and start!101622 b_free!26257) b_lambda!22039)))

(declare-fun b_lambda!22041 () Bool)

(assert (= b_lambda!22021 (or (and start!101622 b_free!26257) b_lambda!22041)))

(declare-fun b_lambda!22043 () Bool)

(assert (= b_lambda!22025 (or (and start!101622 b_free!26257) b_lambda!22043)))

(declare-fun b_lambda!22045 () Bool)

(assert (= b_lambda!22013 (or (and start!101622 b_free!26257) b_lambda!22045)))

(check-sat (not b!1220029) (not bm!60718) (not b!1220038) (not b_lambda!22045) (not b!1220009) (not bm!60727) (not b!1220007) (not bm!60715) (not b!1220018) (not b!1219953) (not b_next!26257) (not b!1220028) (not b!1219957) (not b!1219947) (not b_lambda!22041) (not b!1220030) (not b!1219955) (not b!1220000) (not b!1220048) (not b_lambda!22039) (not b!1220054) (not d!134087) (not b!1220053) (not d!134097) (not b!1220057) (not b!1220012) (not b!1219956) (not b!1219983) (not b!1219950) (not b!1219965) (not bm!60728) (not b_lambda!22033) (not bm!60720) (not b!1219946) (not b!1219962) (not b!1220042) (not b_lambda!22035) (not bm!60725) (not mapNonEmpty!48331) (not bm!60712) (not b!1219981) (not b_lambda!22037) (not d!134109) (not b!1220008) (not bm!60711) (not b_lambda!22029) (not b_lambda!22031) (not b!1219963) (not bm!60726) b_and!43697 (not b!1220055) (not b!1220015) (not d!134085) (not b!1220039) (not b!1219997) (not b!1220033) (not b!1219995) (not b!1220036) (not b!1220034) (not d!134103) (not b!1219959) tp_is_empty!30961 (not b!1220040) (not b!1220047) (not b_lambda!22009) (not b!1219980) (not b_lambda!22043) (not d!134115) (not b!1219968) (not b!1219969) (not b!1220019) (not b!1220013) (not b!1219993) (not d!134105) (not b!1219967) (not b!1220017) (not b!1219951) (not b!1219958) (not bm!60719) (not b!1219998) (not d!134111))
(check-sat b_and!43697 (not b_next!26257))
