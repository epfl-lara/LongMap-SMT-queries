; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100994 () Bool)

(assert start!100994)

(declare-fun b_free!25993 () Bool)

(declare-fun b_next!25993 () Bool)

(assert (=> start!100994 (= b_free!25993 (not b_next!25993))))

(declare-fun tp!90995 () Bool)

(declare-fun b_and!43067 () Bool)

(assert (=> start!100994 (= tp!90995 b_and!43067)))

(declare-fun b!1209408 () Bool)

(declare-fun e!686887 () Bool)

(declare-datatypes ((V!46057 0))(
  ( (V!46058 (val!15405 Int)) )
))
(declare-datatypes ((tuple2!19776 0))(
  ( (tuple2!19777 (_1!9899 (_ BitVec 64)) (_2!9899 V!46057)) )
))
(declare-datatypes ((List!26577 0))(
  ( (Nil!26574) (Cons!26573 (h!27782 tuple2!19776) (t!39550 List!26577)) )
))
(declare-datatypes ((ListLongMap!17745 0))(
  ( (ListLongMap!17746 (toList!8888 List!26577)) )
))
(declare-fun call!59364 () ListLongMap!17745)

(declare-fun call!59360 () ListLongMap!17745)

(assert (=> b!1209408 (= e!686887 (= call!59364 call!59360))))

(declare-fun b!1209409 () Bool)

(declare-fun res!803800 () Bool)

(declare-fun e!686886 () Bool)

(assert (=> b!1209409 (=> (not res!803800) (not e!686886))))

(declare-datatypes ((array!78179 0))(
  ( (array!78180 (arr!37726 (Array (_ BitVec 32) (_ BitVec 64))) (size!38262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78179)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14639 0))(
  ( (ValueCellFull!14639 (v!18056 V!46057)) (EmptyCell!14639) )
))
(declare-datatypes ((array!78181 0))(
  ( (array!78182 (arr!37727 (Array (_ BitVec 32) ValueCell!14639)) (size!38263 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78181)

(assert (=> b!1209409 (= res!803800 (and (= (size!38263 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38262 _keys!1208) (size!38263 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209410 () Bool)

(declare-fun e!686873 () Bool)

(declare-fun e!686876 () Bool)

(assert (=> b!1209410 (= e!686873 e!686876)))

(declare-fun res!803805 () Bool)

(assert (=> b!1209410 (=> res!803805 e!686876)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1209410 (= res!803805 (not (= (select (arr!37726 _keys!1208) from!1455) k!934)))))

(assert (=> b!1209410 e!686887))

(declare-fun c!119067 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209410 (= c!119067 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!46057)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!40082 0))(
  ( (Unit!40083) )
))
(declare-fun lt!548977 () Unit!40082)

(declare-fun minValue!944 () V!46057)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1050 (array!78179 array!78181 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40082)

(assert (=> b!1209410 (= lt!548977 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209411 () Bool)

(declare-fun res!803799 () Bool)

(assert (=> b!1209411 (=> (not res!803799) (not e!686886))))

(assert (=> b!1209411 (= res!803799 (= (select (arr!37726 _keys!1208) i!673) k!934))))

(declare-fun b!1209412 () Bool)

(declare-fun res!803801 () Bool)

(assert (=> b!1209412 (=> (not res!803801) (not e!686886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209412 (= res!803801 (validMask!0 mask!1564))))

(declare-fun lt!548965 () array!78181)

(declare-fun lt!548967 () array!78179)

(declare-fun bm!59354 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5322 (array!78179 array!78181 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) Int) ListLongMap!17745)

(assert (=> bm!59354 (= call!59364 (getCurrentListMapNoExtraKeys!5322 lt!548967 lt!548965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209413 () Bool)

(declare-fun e!686874 () Bool)

(declare-fun e!686888 () Bool)

(assert (=> b!1209413 (= e!686874 (not e!686888))))

(declare-fun res!803802 () Bool)

(assert (=> b!1209413 (=> res!803802 e!686888)))

(assert (=> b!1209413 (= res!803802 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209413 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548973 () Unit!40082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78179 (_ BitVec 64) (_ BitVec 32)) Unit!40082)

(assert (=> b!1209413 (= lt!548973 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1209414 () Bool)

(declare-fun e!686872 () Bool)

(declare-fun tp_is_empty!30697 () Bool)

(assert (=> b!1209414 (= e!686872 tp_is_empty!30697)))

(declare-fun b!1209415 () Bool)

(declare-fun call!59361 () Bool)

(assert (=> b!1209415 call!59361))

(declare-fun lt!548979 () Unit!40082)

(declare-fun call!59362 () Unit!40082)

(assert (=> b!1209415 (= lt!548979 call!59362)))

(declare-fun e!686878 () Unit!40082)

(assert (=> b!1209415 (= e!686878 lt!548979)))

(declare-fun e!686881 () Bool)

(declare-fun lt!548972 () Bool)

(declare-fun b!1209416 () Bool)

(assert (=> b!1209416 (= e!686881 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548972) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!59358 () Unit!40082)

(declare-fun lt!548976 () ListLongMap!17745)

(declare-fun lt!548978 () ListLongMap!17745)

(declare-fun c!119069 () Bool)

(declare-fun bm!59355 () Bool)

(declare-fun c!119066 () Bool)

(declare-fun addStillContains!1035 (ListLongMap!17745 (_ BitVec 64) V!46057 (_ BitVec 64)) Unit!40082)

(assert (=> bm!59355 (= call!59358 (addStillContains!1035 (ite c!119069 lt!548976 lt!548978) (ite c!119069 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119066 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119069 minValue!944 (ite c!119066 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1209417 () Bool)

(declare-fun e!686883 () Bool)

(assert (=> b!1209417 (= e!686883 true)))

(declare-fun lt!548969 () Bool)

(declare-datatypes ((List!26578 0))(
  ( (Nil!26575) (Cons!26574 (h!27783 (_ BitVec 64)) (t!39551 List!26578)) )
))
(declare-fun contains!6956 (List!26578 (_ BitVec 64)) Bool)

(assert (=> b!1209417 (= lt!548969 (contains!6956 Nil!26575 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209418 () Bool)

(assert (=> b!1209418 (= e!686886 e!686874)))

(declare-fun res!803793 () Bool)

(assert (=> b!1209418 (=> (not res!803793) (not e!686874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78179 (_ BitVec 32)) Bool)

(assert (=> b!1209418 (= res!803793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548967 mask!1564))))

(assert (=> b!1209418 (= lt!548967 (array!78180 (store (arr!37726 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38262 _keys!1208)))))

(declare-fun bm!59356 () Bool)

(declare-fun call!59357 () Bool)

(declare-fun call!59359 () ListLongMap!17745)

(declare-fun contains!6957 (ListLongMap!17745 (_ BitVec 64)) Bool)

(assert (=> bm!59356 (= call!59357 (contains!6957 (ite c!119069 lt!548976 call!59359) k!934))))

(declare-fun b!1209419 () Bool)

(declare-fun res!803789 () Bool)

(assert (=> b!1209419 (=> (not res!803789) (not e!686886))))

(assert (=> b!1209419 (= res!803789 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38262 _keys!1208))))))

(declare-fun b!1209420 () Bool)

(declare-fun e!686884 () Unit!40082)

(declare-fun lt!548964 () Unit!40082)

(assert (=> b!1209420 (= e!686884 lt!548964)))

(declare-fun lt!548966 () Unit!40082)

(assert (=> b!1209420 (= lt!548966 (addStillContains!1035 lt!548978 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun +!4007 (ListLongMap!17745 tuple2!19776) ListLongMap!17745)

(assert (=> b!1209420 (= lt!548976 (+!4007 lt!548978 (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209420 call!59357))

(assert (=> b!1209420 (= lt!548964 call!59358)))

(declare-fun call!59363 () ListLongMap!17745)

(assert (=> b!1209420 (contains!6957 call!59363 k!934)))

(declare-fun bm!59357 () Bool)

(assert (=> bm!59357 (= call!59360 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!686877 () Bool)

(declare-fun b!1209421 () Bool)

(assert (=> b!1209421 (= e!686877 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59358 () Bool)

(assert (=> bm!59358 (= call!59359 call!59363)))

(declare-fun b!1209422 () Bool)

(declare-fun e!686882 () Bool)

(assert (=> b!1209422 (= e!686876 e!686882)))

(declare-fun res!803804 () Bool)

(assert (=> b!1209422 (=> res!803804 e!686882)))

(assert (=> b!1209422 (= res!803804 (not (contains!6957 lt!548978 k!934)))))

(assert (=> b!1209422 (= lt!548978 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47914 () Bool)

(declare-fun mapRes!47914 () Bool)

(declare-fun tp!90994 () Bool)

(assert (=> mapNonEmpty!47914 (= mapRes!47914 (and tp!90994 e!686872))))

(declare-fun mapKey!47914 () (_ BitVec 32))

(declare-fun mapRest!47914 () (Array (_ BitVec 32) ValueCell!14639))

(declare-fun mapValue!47914 () ValueCell!14639)

(assert (=> mapNonEmpty!47914 (= (arr!37727 _values!996) (store mapRest!47914 mapKey!47914 mapValue!47914))))

(declare-fun b!1209423 () Bool)

(declare-fun c!119065 () Bool)

(assert (=> b!1209423 (= c!119065 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548972))))

(declare-fun e!686885 () Unit!40082)

(assert (=> b!1209423 (= e!686878 e!686885)))

(declare-fun b!1209424 () Bool)

(declare-fun Unit!40084 () Unit!40082)

(assert (=> b!1209424 (= e!686885 Unit!40084)))

(declare-fun mapIsEmpty!47914 () Bool)

(assert (=> mapIsEmpty!47914 mapRes!47914))

(declare-fun res!803797 () Bool)

(assert (=> start!100994 (=> (not res!803797) (not e!686886))))

(assert (=> start!100994 (= res!803797 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38262 _keys!1208))))))

(assert (=> start!100994 e!686886))

(assert (=> start!100994 tp_is_empty!30697))

(declare-fun array_inv!28738 (array!78179) Bool)

(assert (=> start!100994 (array_inv!28738 _keys!1208)))

(assert (=> start!100994 true))

(assert (=> start!100994 tp!90995))

(declare-fun e!686880 () Bool)

(declare-fun array_inv!28739 (array!78181) Bool)

(assert (=> start!100994 (and (array_inv!28739 _values!996) e!686880)))

(declare-fun b!1209425 () Bool)

(assert (=> b!1209425 (= e!686881 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59359 () Bool)

(assert (=> bm!59359 (= call!59361 call!59357)))

(declare-fun b!1209426 () Bool)

(declare-fun res!803803 () Bool)

(assert (=> b!1209426 (=> (not res!803803) (not e!686886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209426 (= res!803803 (validKeyInArray!0 k!934))))

(declare-fun b!1209427 () Bool)

(declare-fun lt!548980 () Unit!40082)

(assert (=> b!1209427 (= e!686885 lt!548980)))

(assert (=> b!1209427 (= lt!548980 call!59362)))

(assert (=> b!1209427 call!59361))

(declare-fun b!1209428 () Bool)

(declare-fun res!803794 () Bool)

(assert (=> b!1209428 (=> (not res!803794) (not e!686874))))

(declare-fun arrayNoDuplicates!0 (array!78179 (_ BitVec 32) List!26578) Bool)

(assert (=> b!1209428 (= res!803794 (arrayNoDuplicates!0 lt!548967 #b00000000000000000000000000000000 Nil!26575))))

(declare-fun b!1209429 () Bool)

(declare-fun res!803788 () Bool)

(assert (=> b!1209429 (=> res!803788 e!686883)))

(assert (=> b!1209429 (= res!803788 (contains!6956 Nil!26575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209430 () Bool)

(declare-fun e!686879 () Bool)

(assert (=> b!1209430 (= e!686879 tp_is_empty!30697)))

(declare-fun b!1209431 () Bool)

(declare-fun res!803791 () Bool)

(assert (=> b!1209431 (=> res!803791 e!686883)))

(declare-fun noDuplicate!1628 (List!26578) Bool)

(assert (=> b!1209431 (= res!803791 (not (noDuplicate!1628 Nil!26575)))))

(declare-fun b!1209432 () Bool)

(assert (=> b!1209432 (= e!686884 e!686878)))

(assert (=> b!1209432 (= c!119066 (and (not lt!548972) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1209433 () Bool)

(assert (=> b!1209433 (= e!686888 e!686873)))

(declare-fun res!803790 () Bool)

(assert (=> b!1209433 (=> res!803790 e!686873)))

(assert (=> b!1209433 (= res!803790 (not (= from!1455 i!673)))))

(declare-fun lt!548975 () ListLongMap!17745)

(assert (=> b!1209433 (= lt!548975 (getCurrentListMapNoExtraKeys!5322 lt!548967 lt!548965 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3221 (Int (_ BitVec 64)) V!46057)

(assert (=> b!1209433 (= lt!548965 (array!78182 (store (arr!37727 _values!996) i!673 (ValueCellFull!14639 (dynLambda!3221 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38263 _values!996)))))

(declare-fun lt!548968 () ListLongMap!17745)

(assert (=> b!1209433 (= lt!548968 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59360 () Bool)

(assert (=> bm!59360 (= call!59363 (+!4007 (ite c!119069 lt!548976 lt!548978) (ite c!119069 (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119066 (tuple2!19777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209434 () Bool)

(assert (=> b!1209434 (= e!686882 e!686883)))

(declare-fun res!803792 () Bool)

(assert (=> b!1209434 (=> res!803792 e!686883)))

(assert (=> b!1209434 (= res!803792 (or (bvsge (size!38262 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38262 _keys!1208)) (bvsge from!1455 (size!38262 _keys!1208))))))

(assert (=> b!1209434 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26575)))

(declare-fun lt!548974 () Unit!40082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78179 (_ BitVec 32) (_ BitVec 32)) Unit!40082)

(assert (=> b!1209434 (= lt!548974 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209434 e!686877))

(declare-fun res!803796 () Bool)

(assert (=> b!1209434 (=> (not res!803796) (not e!686877))))

(assert (=> b!1209434 (= res!803796 e!686881)))

(declare-fun c!119068 () Bool)

(assert (=> b!1209434 (= c!119068 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548970 () Unit!40082)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!588 (array!78179 array!78181 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 64) (_ BitVec 32) Int) Unit!40082)

(assert (=> b!1209434 (= lt!548970 (lemmaListMapContainsThenArrayContainsFrom!588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548971 () Unit!40082)

(assert (=> b!1209434 (= lt!548971 e!686884)))

(assert (=> b!1209434 (= c!119069 (and (not lt!548972) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209434 (= lt!548972 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209435 () Bool)

(declare-fun res!803795 () Bool)

(assert (=> b!1209435 (=> (not res!803795) (not e!686886))))

(assert (=> b!1209435 (= res!803795 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26575))))

(declare-fun b!1209436 () Bool)

(assert (=> b!1209436 (= e!686880 (and e!686879 mapRes!47914))))

(declare-fun condMapEmpty!47914 () Bool)

(declare-fun mapDefault!47914 () ValueCell!14639)

