; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99502 () Bool)

(assert start!99502)

(declare-fun b_free!25087 () Bool)

(declare-fun b_next!25087 () Bool)

(assert (=> start!99502 (= b_free!25087 (not b_next!25087))))

(declare-fun tp!87975 () Bool)

(declare-fun b_and!41019 () Bool)

(assert (=> start!99502 (= tp!87975 b_and!41019)))

(declare-fun b!1176546 () Bool)

(declare-datatypes ((Unit!38682 0))(
  ( (Unit!38683) )
))
(declare-fun e!668805 () Unit!38682)

(declare-fun Unit!38684 () Unit!38682)

(assert (=> b!1176546 (= e!668805 Unit!38684)))

(declare-datatypes ((array!75974 0))(
  ( (array!75975 (arr!36637 (Array (_ BitVec 32) (_ BitVec 64))) (size!37175 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75974)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!530938 () Unit!38682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75974 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38682)

(assert (=> b!1176546 (= lt!530938 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176546 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530945 () Unit!38682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75974 (_ BitVec 32) (_ BitVec 32)) Unit!38682)

(assert (=> b!1176546 (= lt!530945 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25828 0))(
  ( (Nil!25825) (Cons!25824 (h!27033 (_ BitVec 64)) (t!37898 List!25828)) )
))
(declare-fun arrayNoDuplicates!0 (array!75974 (_ BitVec 32) List!25828) Bool)

(assert (=> b!1176546 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25825)))

(declare-fun lt!530937 () Unit!38682)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75974 (_ BitVec 64) (_ BitVec 32) List!25828) Unit!38682)

(assert (=> b!1176546 (= lt!530937 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25825))))

(assert (=> b!1176546 false))

(declare-fun b!1176547 () Bool)

(declare-fun res!781492 () Bool)

(declare-fun e!668794 () Bool)

(assert (=> b!1176547 (=> (not res!781492) (not e!668794))))

(declare-fun lt!530942 () array!75974)

(assert (=> b!1176547 (= res!781492 (arrayNoDuplicates!0 lt!530942 #b00000000000000000000000000000000 Nil!25825))))

(declare-fun res!781493 () Bool)

(declare-fun e!668806 () Bool)

(assert (=> start!99502 (=> (not res!781493) (not e!668806))))

(assert (=> start!99502 (= res!781493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37175 _keys!1208))))))

(assert (=> start!99502 e!668806))

(declare-fun tp_is_empty!29617 () Bool)

(assert (=> start!99502 tp_is_empty!29617))

(declare-fun array_inv!28088 (array!75974) Bool)

(assert (=> start!99502 (array_inv!28088 _keys!1208)))

(assert (=> start!99502 true))

(assert (=> start!99502 tp!87975))

(declare-datatypes ((V!44617 0))(
  ( (V!44618 (val!14865 Int)) )
))
(declare-datatypes ((ValueCell!14099 0))(
  ( (ValueCellFull!14099 (v!17502 V!44617)) (EmptyCell!14099) )
))
(declare-datatypes ((array!75976 0))(
  ( (array!75977 (arr!36638 (Array (_ BitVec 32) ValueCell!14099)) (size!37176 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75976)

(declare-fun e!668798 () Bool)

(declare-fun array_inv!28089 (array!75976) Bool)

(assert (=> start!99502 (and (array_inv!28089 _values!996) e!668798)))

(declare-fun b!1176548 () Bool)

(declare-fun res!781494 () Bool)

(assert (=> b!1176548 (=> (not res!781494) (not e!668806))))

(assert (=> b!1176548 (= res!781494 (= (select (arr!36637 _keys!1208) i!673) k0!934))))

(declare-fun b!1176549 () Bool)

(assert (=> b!1176549 (= e!668806 e!668794)))

(declare-fun res!781489 () Bool)

(assert (=> b!1176549 (=> (not res!781489) (not e!668794))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75974 (_ BitVec 32)) Bool)

(assert (=> b!1176549 (= res!781489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530942 mask!1564))))

(assert (=> b!1176549 (= lt!530942 (array!75975 (store (arr!36637 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37175 _keys!1208)))))

(declare-fun mapIsEmpty!46253 () Bool)

(declare-fun mapRes!46253 () Bool)

(assert (=> mapIsEmpty!46253 mapRes!46253))

(declare-fun b!1176550 () Bool)

(declare-fun e!668801 () Bool)

(declare-fun e!668800 () Bool)

(assert (=> b!1176550 (= e!668801 e!668800)))

(declare-fun res!781485 () Bool)

(assert (=> b!1176550 (=> res!781485 e!668800)))

(assert (=> b!1176550 (= res!781485 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530940 () array!75976)

(declare-fun minValue!944 () V!44617)

(declare-fun zeroValue!944 () V!44617)

(declare-datatypes ((tuple2!19118 0))(
  ( (tuple2!19119 (_1!9570 (_ BitVec 64)) (_2!9570 V!44617)) )
))
(declare-datatypes ((List!25829 0))(
  ( (Nil!25826) (Cons!25825 (h!27034 tuple2!19118) (t!37899 List!25829)) )
))
(declare-datatypes ((ListLongMap!17087 0))(
  ( (ListLongMap!17088 (toList!8559 List!25829)) )
))
(declare-fun lt!530934 () ListLongMap!17087)

(declare-fun getCurrentListMapNoExtraKeys!5026 (array!75974 array!75976 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) Int) ListLongMap!17087)

(assert (=> b!1176550 (= lt!530934 (getCurrentListMapNoExtraKeys!5026 lt!530942 lt!530940 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530933 () V!44617)

(assert (=> b!1176550 (= lt!530940 (array!75977 (store (arr!36638 _values!996) i!673 (ValueCellFull!14099 lt!530933)) (size!37176 _values!996)))))

(declare-fun dynLambda!2943 (Int (_ BitVec 64)) V!44617)

(assert (=> b!1176550 (= lt!530933 (dynLambda!2943 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530943 () ListLongMap!17087)

(assert (=> b!1176550 (= lt!530943 (getCurrentListMapNoExtraKeys!5026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176551 () Bool)

(declare-fun res!781480 () Bool)

(assert (=> b!1176551 (=> (not res!781480) (not e!668806))))

(assert (=> b!1176551 (= res!781480 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25825))))

(declare-fun b!1176552 () Bool)

(declare-fun Unit!38685 () Unit!38682)

(assert (=> b!1176552 (= e!668805 Unit!38685)))

(declare-fun b!1176553 () Bool)

(declare-fun res!781483 () Bool)

(assert (=> b!1176553 (=> (not res!781483) (not e!668806))))

(assert (=> b!1176553 (= res!781483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176554 () Bool)

(declare-fun e!668799 () Bool)

(declare-fun e!668804 () Bool)

(assert (=> b!1176554 (= e!668799 e!668804)))

(declare-fun res!781491 () Bool)

(assert (=> b!1176554 (=> res!781491 e!668804)))

(assert (=> b!1176554 (= res!781491 (not (= (select (arr!36637 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176555 () Bool)

(declare-fun res!781488 () Bool)

(assert (=> b!1176555 (=> (not res!781488) (not e!668806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176555 (= res!781488 (validKeyInArray!0 k0!934))))

(declare-fun b!1176556 () Bool)

(declare-fun e!668796 () Bool)

(assert (=> b!1176556 (= e!668800 e!668796)))

(declare-fun res!781495 () Bool)

(assert (=> b!1176556 (=> res!781495 e!668796)))

(assert (=> b!1176556 (= res!781495 (not (validKeyInArray!0 (select (arr!36637 _keys!1208) from!1455))))))

(declare-fun lt!530932 () ListLongMap!17087)

(declare-fun lt!530939 () ListLongMap!17087)

(assert (=> b!1176556 (= lt!530932 lt!530939)))

(declare-fun lt!530941 () ListLongMap!17087)

(declare-fun -!1535 (ListLongMap!17087 (_ BitVec 64)) ListLongMap!17087)

(assert (=> b!1176556 (= lt!530939 (-!1535 lt!530941 k0!934))))

(assert (=> b!1176556 (= lt!530932 (getCurrentListMapNoExtraKeys!5026 lt!530942 lt!530940 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176556 (= lt!530941 (getCurrentListMapNoExtraKeys!5026 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530944 () Unit!38682)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 (array!75974 array!75976 (_ BitVec 32) (_ BitVec 32) V!44617 V!44617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38682)

(assert (=> b!1176556 (= lt!530944 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176557 () Bool)

(declare-fun res!781486 () Bool)

(assert (=> b!1176557 (=> (not res!781486) (not e!668806))))

(assert (=> b!1176557 (= res!781486 (and (= (size!37176 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37175 _keys!1208) (size!37176 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176558 () Bool)

(assert (=> b!1176558 (= e!668804 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176559 () Bool)

(declare-fun e!668803 () Bool)

(assert (=> b!1176559 (= e!668798 (and e!668803 mapRes!46253))))

(declare-fun condMapEmpty!46253 () Bool)

(declare-fun mapDefault!46253 () ValueCell!14099)

(assert (=> b!1176559 (= condMapEmpty!46253 (= (arr!36638 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14099)) mapDefault!46253)))))

(declare-fun b!1176560 () Bool)

(declare-fun res!781484 () Bool)

(assert (=> b!1176560 (=> (not res!781484) (not e!668806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176560 (= res!781484 (validMask!0 mask!1564))))

(declare-fun b!1176561 () Bool)

(declare-fun res!781490 () Bool)

(assert (=> b!1176561 (=> (not res!781490) (not e!668806))))

(assert (=> b!1176561 (= res!781490 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37175 _keys!1208))))))

(declare-fun b!1176562 () Bool)

(assert (=> b!1176562 (= e!668796 true)))

(declare-fun e!668797 () Bool)

(assert (=> b!1176562 e!668797))

(declare-fun res!781482 () Bool)

(assert (=> b!1176562 (=> (not res!781482) (not e!668797))))

(assert (=> b!1176562 (= res!781482 (not (= (select (arr!36637 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!530936 () Unit!38682)

(assert (=> b!1176562 (= lt!530936 e!668805)))

(declare-fun c!116728 () Bool)

(assert (=> b!1176562 (= c!116728 (= (select (arr!36637 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176562 e!668799))

(declare-fun res!781481 () Bool)

(assert (=> b!1176562 (=> (not res!781481) (not e!668799))))

(declare-fun lt!530946 () tuple2!19118)

(declare-fun +!3862 (ListLongMap!17087 tuple2!19118) ListLongMap!17087)

(assert (=> b!1176562 (= res!781481 (= lt!530934 (+!3862 lt!530939 lt!530946)))))

(declare-fun get!18722 (ValueCell!14099 V!44617) V!44617)

(assert (=> b!1176562 (= lt!530946 (tuple2!19119 (select (arr!36637 _keys!1208) from!1455) (get!18722 (select (arr!36638 _values!996) from!1455) lt!530933)))))

(declare-fun b!1176563 () Bool)

(declare-fun e!668802 () Bool)

(assert (=> b!1176563 (= e!668802 tp_is_empty!29617)))

(declare-fun b!1176564 () Bool)

(assert (=> b!1176564 (= e!668797 (= lt!530943 (+!3862 lt!530941 lt!530946)))))

(declare-fun b!1176565 () Bool)

(assert (=> b!1176565 (= e!668794 (not e!668801))))

(declare-fun res!781487 () Bool)

(assert (=> b!1176565 (=> res!781487 e!668801)))

(assert (=> b!1176565 (= res!781487 (bvsgt from!1455 i!673))))

(assert (=> b!1176565 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530935 () Unit!38682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75974 (_ BitVec 64) (_ BitVec 32)) Unit!38682)

(assert (=> b!1176565 (= lt!530935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46253 () Bool)

(declare-fun tp!87974 () Bool)

(assert (=> mapNonEmpty!46253 (= mapRes!46253 (and tp!87974 e!668802))))

(declare-fun mapValue!46253 () ValueCell!14099)

(declare-fun mapRest!46253 () (Array (_ BitVec 32) ValueCell!14099))

(declare-fun mapKey!46253 () (_ BitVec 32))

(assert (=> mapNonEmpty!46253 (= (arr!36638 _values!996) (store mapRest!46253 mapKey!46253 mapValue!46253))))

(declare-fun b!1176566 () Bool)

(assert (=> b!1176566 (= e!668803 tp_is_empty!29617)))

(assert (= (and start!99502 res!781493) b!1176560))

(assert (= (and b!1176560 res!781484) b!1176557))

(assert (= (and b!1176557 res!781486) b!1176553))

(assert (= (and b!1176553 res!781483) b!1176551))

(assert (= (and b!1176551 res!781480) b!1176561))

(assert (= (and b!1176561 res!781490) b!1176555))

(assert (= (and b!1176555 res!781488) b!1176548))

(assert (= (and b!1176548 res!781494) b!1176549))

(assert (= (and b!1176549 res!781489) b!1176547))

(assert (= (and b!1176547 res!781492) b!1176565))

(assert (= (and b!1176565 (not res!781487)) b!1176550))

(assert (= (and b!1176550 (not res!781485)) b!1176556))

(assert (= (and b!1176556 (not res!781495)) b!1176562))

(assert (= (and b!1176562 res!781481) b!1176554))

(assert (= (and b!1176554 (not res!781491)) b!1176558))

(assert (= (and b!1176562 c!116728) b!1176546))

(assert (= (and b!1176562 (not c!116728)) b!1176552))

(assert (= (and b!1176562 res!781482) b!1176564))

(assert (= (and b!1176559 condMapEmpty!46253) mapIsEmpty!46253))

(assert (= (and b!1176559 (not condMapEmpty!46253)) mapNonEmpty!46253))

(get-info :version)

(assert (= (and mapNonEmpty!46253 ((_ is ValueCellFull!14099) mapValue!46253)) b!1176563))

(assert (= (and b!1176559 ((_ is ValueCellFull!14099) mapDefault!46253)) b!1176566))

(assert (= start!99502 b!1176559))

(declare-fun b_lambda!20213 () Bool)

(assert (=> (not b_lambda!20213) (not b!1176550)))

(declare-fun t!37897 () Bool)

(declare-fun tb!9891 () Bool)

(assert (=> (and start!99502 (= defaultEntry!1004 defaultEntry!1004) t!37897) tb!9891))

(declare-fun result!20357 () Bool)

(assert (=> tb!9891 (= result!20357 tp_is_empty!29617)))

(assert (=> b!1176550 t!37897))

(declare-fun b_and!41021 () Bool)

(assert (= b_and!41019 (and (=> t!37897 result!20357) b_and!41021)))

(declare-fun m!1083995 () Bool)

(assert (=> b!1176554 m!1083995))

(declare-fun m!1083997 () Bool)

(assert (=> b!1176549 m!1083997))

(declare-fun m!1083999 () Bool)

(assert (=> b!1176549 m!1083999))

(declare-fun m!1084001 () Bool)

(assert (=> b!1176548 m!1084001))

(assert (=> b!1176562 m!1083995))

(declare-fun m!1084003 () Bool)

(assert (=> b!1176562 m!1084003))

(declare-fun m!1084005 () Bool)

(assert (=> b!1176562 m!1084005))

(assert (=> b!1176562 m!1084005))

(declare-fun m!1084007 () Bool)

(assert (=> b!1176562 m!1084007))

(declare-fun m!1084009 () Bool)

(assert (=> b!1176550 m!1084009))

(declare-fun m!1084011 () Bool)

(assert (=> b!1176550 m!1084011))

(declare-fun m!1084013 () Bool)

(assert (=> b!1176550 m!1084013))

(declare-fun m!1084015 () Bool)

(assert (=> b!1176550 m!1084015))

(declare-fun m!1084017 () Bool)

(assert (=> b!1176560 m!1084017))

(declare-fun m!1084019 () Bool)

(assert (=> b!1176547 m!1084019))

(declare-fun m!1084021 () Bool)

(assert (=> b!1176565 m!1084021))

(declare-fun m!1084023 () Bool)

(assert (=> b!1176565 m!1084023))

(declare-fun m!1084025 () Bool)

(assert (=> start!99502 m!1084025))

(declare-fun m!1084027 () Bool)

(assert (=> start!99502 m!1084027))

(declare-fun m!1084029 () Bool)

(assert (=> mapNonEmpty!46253 m!1084029))

(declare-fun m!1084031 () Bool)

(assert (=> b!1176556 m!1084031))

(declare-fun m!1084033 () Bool)

(assert (=> b!1176556 m!1084033))

(assert (=> b!1176556 m!1083995))

(declare-fun m!1084035 () Bool)

(assert (=> b!1176556 m!1084035))

(declare-fun m!1084037 () Bool)

(assert (=> b!1176556 m!1084037))

(assert (=> b!1176556 m!1083995))

(declare-fun m!1084039 () Bool)

(assert (=> b!1176556 m!1084039))

(declare-fun m!1084041 () Bool)

(assert (=> b!1176558 m!1084041))

(declare-fun m!1084043 () Bool)

(assert (=> b!1176546 m!1084043))

(declare-fun m!1084045 () Bool)

(assert (=> b!1176546 m!1084045))

(declare-fun m!1084047 () Bool)

(assert (=> b!1176546 m!1084047))

(declare-fun m!1084049 () Bool)

(assert (=> b!1176546 m!1084049))

(declare-fun m!1084051 () Bool)

(assert (=> b!1176546 m!1084051))

(declare-fun m!1084053 () Bool)

(assert (=> b!1176551 m!1084053))

(declare-fun m!1084055 () Bool)

(assert (=> b!1176553 m!1084055))

(declare-fun m!1084057 () Bool)

(assert (=> b!1176564 m!1084057))

(declare-fun m!1084059 () Bool)

(assert (=> b!1176555 m!1084059))

(check-sat (not b!1176565) (not b_lambda!20213) (not b!1176547) (not b!1176556) (not start!99502) tp_is_empty!29617 (not b!1176558) (not mapNonEmpty!46253) (not b!1176551) (not b!1176546) (not b!1176555) (not b_next!25087) (not b!1176550) b_and!41021 (not b!1176553) (not b!1176562) (not b!1176560) (not b!1176564) (not b!1176549))
(check-sat b_and!41021 (not b_next!25087))
