; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97274 () Bool)

(assert start!97274)

(declare-fun b_free!23245 () Bool)

(declare-fun b_next!23245 () Bool)

(assert (=> start!97274 (= b_free!23245 (not b_next!23245))))

(declare-fun tp!82034 () Bool)

(declare-fun b_and!37321 () Bool)

(assert (=> start!97274 (= tp!82034 b_and!37321)))

(declare-fun b!1107495 () Bool)

(declare-fun e!631879 () Bool)

(declare-datatypes ((V!41801 0))(
  ( (V!41802 (val!13809 Int)) )
))
(declare-datatypes ((tuple2!17442 0))(
  ( (tuple2!17443 (_1!8732 (_ BitVec 64)) (_2!8732 V!41801)) )
))
(declare-datatypes ((List!24127 0))(
  ( (Nil!24124) (Cons!24123 (h!25332 tuple2!17442) (t!34418 List!24127)) )
))
(declare-datatypes ((ListLongMap!15411 0))(
  ( (ListLongMap!15412 (toList!7721 List!24127)) )
))
(declare-fun call!46432 () ListLongMap!15411)

(declare-fun call!46431 () ListLongMap!15411)

(assert (=> b!1107495 (= e!631879 (= call!46432 call!46431))))

(declare-fun zeroValue!944 () V!41801)

(declare-datatypes ((array!71927 0))(
  ( (array!71928 (arr!34616 (Array (_ BitVec 32) (_ BitVec 64))) (size!35152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71927)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13043 0))(
  ( (ValueCellFull!13043 (v!16442 V!41801)) (EmptyCell!13043) )
))
(declare-datatypes ((array!71929 0))(
  ( (array!71930 (arr!34617 (Array (_ BitVec 32) ValueCell!13043)) (size!35153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71929)

(declare-fun minValue!944 () V!41801)

(declare-fun bm!46428 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4219 (array!71927 array!71929 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) Int) ListLongMap!15411)

(assert (=> bm!46428 (= call!46431 (getCurrentListMapNoExtraKeys!4219 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43075 () Bool)

(declare-fun mapRes!43075 () Bool)

(declare-fun tp!82033 () Bool)

(declare-fun e!631877 () Bool)

(assert (=> mapNonEmpty!43075 (= mapRes!43075 (and tp!82033 e!631877))))

(declare-fun mapRest!43075 () (Array (_ BitVec 32) ValueCell!13043))

(declare-fun mapKey!43075 () (_ BitVec 32))

(declare-fun mapValue!43075 () ValueCell!13043)

(assert (=> mapNonEmpty!43075 (= (arr!34617 _values!996) (store mapRest!43075 mapKey!43075 mapValue!43075))))

(declare-fun b!1107496 () Bool)

(declare-fun e!631878 () Bool)

(declare-fun tp_is_empty!27505 () Bool)

(assert (=> b!1107496 (= e!631878 tp_is_empty!27505)))

(declare-fun b!1107497 () Bool)

(declare-fun res!739107 () Bool)

(declare-fun e!631881 () Bool)

(assert (=> b!1107497 (=> (not res!739107) (not e!631881))))

(assert (=> b!1107497 (= res!739107 (and (= (size!35153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35152 _keys!1208) (size!35153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!495641 () array!71927)

(declare-fun bm!46429 () Bool)

(declare-fun dynLambda!2352 (Int (_ BitVec 64)) V!41801)

(assert (=> bm!46429 (= call!46432 (getCurrentListMapNoExtraKeys!4219 lt!495641 (array!71930 (store (arr!34617 _values!996) i!673 (ValueCellFull!13043 (dynLambda!2352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35153 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107498 () Bool)

(declare-fun res!739109 () Bool)

(assert (=> b!1107498 (=> (not res!739109) (not e!631881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107498 (= res!739109 (validMask!0 mask!1564))))

(declare-fun b!1107499 () Bool)

(declare-fun e!631880 () Bool)

(declare-fun e!631876 () Bool)

(assert (=> b!1107499 (= e!631880 (not e!631876))))

(declare-fun res!739112 () Bool)

(assert (=> b!1107499 (=> res!739112 e!631876)))

(assert (=> b!1107499 (= res!739112 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35152 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107499 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36348 0))(
  ( (Unit!36349) )
))
(declare-fun lt!495639 () Unit!36348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71927 (_ BitVec 64) (_ BitVec 32)) Unit!36348)

(assert (=> b!1107499 (= lt!495639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1107500 () Bool)

(assert (=> b!1107500 (= e!631877 tp_is_empty!27505)))

(declare-fun b!1107501 () Bool)

(declare-fun res!739113 () Bool)

(assert (=> b!1107501 (=> (not res!739113) (not e!631881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71927 (_ BitVec 32)) Bool)

(assert (=> b!1107501 (= res!739113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43075 () Bool)

(assert (=> mapIsEmpty!43075 mapRes!43075))

(declare-fun b!1107502 () Bool)

(assert (=> b!1107502 (= e!631876 true)))

(assert (=> b!1107502 e!631879))

(declare-fun c!109047 () Bool)

(assert (=> b!1107502 (= c!109047 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495640 () Unit!36348)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 (array!71927 array!71929 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36348)

(assert (=> b!1107502 (= lt!495640 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!248 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107504 () Bool)

(declare-fun e!631875 () Bool)

(assert (=> b!1107504 (= e!631875 (and e!631878 mapRes!43075))))

(declare-fun condMapEmpty!43075 () Bool)

(declare-fun mapDefault!43075 () ValueCell!13043)

