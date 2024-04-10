; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98948 () Bool)

(assert start!98948)

(declare-fun b_free!24553 () Bool)

(declare-fun b_next!24553 () Bool)

(assert (=> start!98948 (= b_free!24553 (not b_next!24553))))

(declare-fun tp!86369 () Bool)

(declare-fun b_and!39955 () Bool)

(assert (=> start!98948 (= tp!86369 b_and!39955)))

(declare-fun b!1160450 () Bool)

(declare-fun res!770115 () Bool)

(declare-fun e!659891 () Bool)

(assert (=> b!1160450 (=> (not res!770115) (not e!659891))))

(declare-datatypes ((array!75007 0))(
  ( (array!75008 (arr!36154 (Array (_ BitVec 32) (_ BitVec 64))) (size!36690 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75007)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75007 (_ BitVec 32)) Bool)

(assert (=> b!1160450 (= res!770115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56175 () Bool)

(declare-datatypes ((Unit!38257 0))(
  ( (Unit!38258) )
))
(declare-fun call!56180 () Unit!38257)

(declare-fun call!56184 () Unit!38257)

(assert (=> bm!56175 (= call!56180 call!56184)))

(declare-fun b!1160451 () Bool)

(declare-fun res!770123 () Bool)

(assert (=> b!1160451 (=> (not res!770123) (not e!659891))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1160451 (= res!770123 (= (select (arr!36154 _keys!1208) i!673) k!934))))

(declare-fun b!1160452 () Bool)

(declare-fun res!770116 () Bool)

(assert (=> b!1160452 (=> (not res!770116) (not e!659891))))

(assert (=> b!1160452 (= res!770116 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36690 _keys!1208))))))

(declare-fun b!1160453 () Bool)

(declare-fun e!659897 () Bool)

(declare-fun e!659895 () Bool)

(assert (=> b!1160453 (= e!659897 e!659895)))

(declare-fun res!770112 () Bool)

(assert (=> b!1160453 (=> res!770112 e!659895)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1160453 (= res!770112 (not (= (select (arr!36154 _keys!1208) from!1455) k!934)))))

(declare-fun e!659886 () Bool)

(assert (=> b!1160453 e!659886))

(declare-fun c!115835 () Bool)

(assert (=> b!1160453 (= c!115835 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!43905 0))(
  ( (V!43906 (val!14598 Int)) )
))
(declare-datatypes ((ValueCell!13832 0))(
  ( (ValueCellFull!13832 (v!17235 V!43905)) (EmptyCell!13832) )
))
(declare-datatypes ((array!75009 0))(
  ( (array!75010 (arr!36155 (Array (_ BitVec 32) ValueCell!13832)) (size!36691 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75009)

(declare-fun minValue!944 () V!43905)

(declare-fun zeroValue!944 () V!43905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!521985 () Unit!38257)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 (array!75007 array!75009 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38257)

(assert (=> b!1160453 (= lt!521985 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160454 () Bool)

(declare-fun e!659893 () Unit!38257)

(declare-fun Unit!38259 () Unit!38257)

(assert (=> b!1160454 (= e!659893 Unit!38259)))

(declare-fun lt!521986 () Bool)

(assert (=> b!1160454 (= lt!521986 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115837 () Bool)

(assert (=> b!1160454 (= c!115837 (and (not lt!521986) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521982 () Unit!38257)

(declare-fun e!659885 () Unit!38257)

(assert (=> b!1160454 (= lt!521982 e!659885)))

(declare-fun lt!521997 () Unit!38257)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!530 (array!75007 array!75009 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 64) (_ BitVec 32) Int) Unit!38257)

(assert (=> b!1160454 (= lt!521997 (lemmaListMapContainsThenArrayContainsFrom!530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115838 () Bool)

(assert (=> b!1160454 (= c!115838 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770120 () Bool)

(declare-fun e!659896 () Bool)

(assert (=> b!1160454 (= res!770120 e!659896)))

(declare-fun e!659890 () Bool)

(assert (=> b!1160454 (=> (not res!770120) (not e!659890))))

(assert (=> b!1160454 e!659890))

(declare-fun lt!521998 () Unit!38257)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75007 (_ BitVec 32) (_ BitVec 32)) Unit!38257)

(assert (=> b!1160454 (= lt!521998 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25331 0))(
  ( (Nil!25328) (Cons!25327 (h!26536 (_ BitVec 64)) (t!36876 List!25331)) )
))
(declare-fun arrayNoDuplicates!0 (array!75007 (_ BitVec 32) List!25331) Bool)

(assert (=> b!1160454 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25328)))

(declare-fun lt!521999 () Unit!38257)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75007 (_ BitVec 64) (_ BitVec 32) List!25331) Unit!38257)

(assert (=> b!1160454 (= lt!521999 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25328))))

(assert (=> b!1160454 false))

(declare-fun bm!56176 () Bool)

(declare-fun call!56185 () Bool)

(declare-fun call!56183 () Bool)

(assert (=> bm!56176 (= call!56185 call!56183)))

(declare-datatypes ((tuple2!18594 0))(
  ( (tuple2!18595 (_1!9308 (_ BitVec 64)) (_2!9308 V!43905)) )
))
(declare-datatypes ((List!25332 0))(
  ( (Nil!25329) (Cons!25328 (h!26537 tuple2!18594) (t!36877 List!25332)) )
))
(declare-datatypes ((ListLongMap!16563 0))(
  ( (ListLongMap!16564 (toList!8297 List!25332)) )
))
(declare-fun call!56182 () ListLongMap!16563)

(declare-fun bm!56177 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4761 (array!75007 array!75009 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) Int) ListLongMap!16563)

(assert (=> bm!56177 (= call!56182 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160456 () Bool)

(declare-fun e!659899 () Unit!38257)

(declare-fun Unit!38260 () Unit!38257)

(assert (=> b!1160456 (= e!659899 Unit!38260)))

(declare-fun lt!521992 () ListLongMap!16563)

(declare-fun bm!56178 () Bool)

(declare-fun c!115839 () Bool)

(declare-fun lt!521984 () ListLongMap!16563)

(declare-fun addStillContains!944 (ListLongMap!16563 (_ BitVec 64) V!43905 (_ BitVec 64)) Unit!38257)

(assert (=> bm!56178 (= call!56184 (addStillContains!944 (ite c!115837 lt!521984 lt!521992) (ite c!115837 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115839 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115837 minValue!944 (ite c!115839 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1160457 () Bool)

(assert (=> b!1160457 (= e!659896 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521986) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160458 () Bool)

(declare-fun arrayContainsKey!0 (array!75007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160458 (= e!659896 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160459 () Bool)

(declare-fun res!770118 () Bool)

(assert (=> b!1160459 (=> (not res!770118) (not e!659891))))

(assert (=> b!1160459 (= res!770118 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25328))))

(declare-fun b!1160460 () Bool)

(declare-fun e!659888 () Unit!38257)

(assert (=> b!1160460 (= e!659888 e!659899)))

(declare-fun c!115836 () Bool)

(assert (=> b!1160460 (= c!115836 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521986))))

(declare-fun b!1160461 () Bool)

(assert (=> b!1160461 (= e!659895 true)))

(declare-fun e!659900 () Bool)

(assert (=> b!1160461 e!659900))

(declare-fun res!770119 () Bool)

(assert (=> b!1160461 (=> (not res!770119) (not e!659900))))

(declare-fun lt!521996 () ListLongMap!16563)

(assert (=> b!1160461 (= res!770119 (= lt!521996 lt!521992))))

(declare-fun lt!521991 () ListLongMap!16563)

(declare-fun -!1406 (ListLongMap!16563 (_ BitVec 64)) ListLongMap!16563)

(assert (=> b!1160461 (= lt!521996 (-!1406 lt!521991 k!934))))

(declare-fun lt!521983 () V!43905)

(declare-fun +!3702 (ListLongMap!16563 tuple2!18594) ListLongMap!16563)

(assert (=> b!1160461 (= (-!1406 (+!3702 lt!521992 (tuple2!18595 (select (arr!36154 _keys!1208) from!1455) lt!521983)) (select (arr!36154 _keys!1208) from!1455)) lt!521992)))

(declare-fun lt!521994 () Unit!38257)

(declare-fun addThenRemoveForNewKeyIsSame!240 (ListLongMap!16563 (_ BitVec 64) V!43905) Unit!38257)

(assert (=> b!1160461 (= lt!521994 (addThenRemoveForNewKeyIsSame!240 lt!521992 (select (arr!36154 _keys!1208) from!1455) lt!521983))))

(declare-fun lt!521993 () V!43905)

(declare-fun get!18438 (ValueCell!13832 V!43905) V!43905)

(assert (=> b!1160461 (= lt!521983 (get!18438 (select (arr!36155 _values!996) from!1455) lt!521993))))

(declare-fun lt!522000 () Unit!38257)

(assert (=> b!1160461 (= lt!522000 e!659893)))

(declare-fun c!115840 () Bool)

(declare-fun contains!6803 (ListLongMap!16563 (_ BitVec 64)) Bool)

(assert (=> b!1160461 (= c!115840 (contains!6803 lt!521992 k!934))))

(assert (=> b!1160461 (= lt!521992 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160462 () Bool)

(declare-fun e!659887 () Bool)

(declare-fun tp_is_empty!29083 () Bool)

(assert (=> b!1160462 (= e!659887 tp_is_empty!29083)))

(declare-fun b!1160463 () Bool)

(declare-fun res!770111 () Bool)

(assert (=> b!1160463 (=> (not res!770111) (not e!659891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160463 (= res!770111 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!45449 () Bool)

(declare-fun mapRes!45449 () Bool)

(assert (=> mapIsEmpty!45449 mapRes!45449))

(declare-fun b!1160464 () Bool)

(declare-fun Unit!38261 () Unit!38257)

(assert (=> b!1160464 (= e!659893 Unit!38261)))

(declare-fun b!1160465 () Bool)

(declare-fun e!659901 () Bool)

(assert (=> b!1160465 (= e!659901 e!659897)))

(declare-fun res!770121 () Bool)

(assert (=> b!1160465 (=> res!770121 e!659897)))

(assert (=> b!1160465 (= res!770121 (not (= from!1455 i!673)))))

(declare-fun lt!521987 () ListLongMap!16563)

(declare-fun lt!521995 () array!75007)

(declare-fun lt!522001 () array!75009)

(assert (=> b!1160465 (= lt!521987 (getCurrentListMapNoExtraKeys!4761 lt!521995 lt!522001 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160465 (= lt!522001 (array!75010 (store (arr!36155 _values!996) i!673 (ValueCellFull!13832 lt!521993)) (size!36691 _values!996)))))

(declare-fun dynLambda!2761 (Int (_ BitVec 64)) V!43905)

(assert (=> b!1160465 (= lt!521993 (dynLambda!2761 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160465 (= lt!521991 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160466 () Bool)

(declare-fun res!770110 () Bool)

(declare-fun e!659894 () Bool)

(assert (=> b!1160466 (=> (not res!770110) (not e!659894))))

(assert (=> b!1160466 (= res!770110 (arrayNoDuplicates!0 lt!521995 #b00000000000000000000000000000000 Nil!25328))))

(declare-fun b!1160467 () Bool)

(declare-fun res!770109 () Bool)

(assert (=> b!1160467 (=> (not res!770109) (not e!659891))))

(assert (=> b!1160467 (= res!770109 (and (= (size!36691 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36690 _keys!1208) (size!36691 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160468 () Bool)

(assert (=> b!1160468 call!56185))

(declare-fun lt!521988 () Unit!38257)

(assert (=> b!1160468 (= lt!521988 call!56180)))

(assert (=> b!1160468 (= e!659899 lt!521988)))

(declare-fun mapNonEmpty!45449 () Bool)

(declare-fun tp!86370 () Bool)

(assert (=> mapNonEmpty!45449 (= mapRes!45449 (and tp!86370 e!659887))))

(declare-fun mapValue!45449 () ValueCell!13832)

(declare-fun mapKey!45449 () (_ BitVec 32))

(declare-fun mapRest!45449 () (Array (_ BitVec 32) ValueCell!13832))

(assert (=> mapNonEmpty!45449 (= (arr!36155 _values!996) (store mapRest!45449 mapKey!45449 mapValue!45449))))

(declare-fun res!770117 () Bool)

(assert (=> start!98948 (=> (not res!770117) (not e!659891))))

(assert (=> start!98948 (= res!770117 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36690 _keys!1208))))))

(assert (=> start!98948 e!659891))

(assert (=> start!98948 tp_is_empty!29083))

(declare-fun array_inv!27664 (array!75007) Bool)

(assert (=> start!98948 (array_inv!27664 _keys!1208)))

(assert (=> start!98948 true))

(assert (=> start!98948 tp!86369))

(declare-fun e!659898 () Bool)

(declare-fun array_inv!27665 (array!75009) Bool)

(assert (=> start!98948 (and (array_inv!27665 _values!996) e!659898)))

(declare-fun b!1160455 () Bool)

(declare-fun e!659892 () Bool)

(assert (=> b!1160455 (= e!659898 (and e!659892 mapRes!45449))))

(declare-fun condMapEmpty!45449 () Bool)

(declare-fun mapDefault!45449 () ValueCell!13832)

