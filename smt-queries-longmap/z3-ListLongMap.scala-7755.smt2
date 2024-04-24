; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97510 () Bool)

(assert start!97510)

(declare-fun b_free!23245 () Bool)

(declare-fun b_next!23245 () Bool)

(assert (=> start!97510 (= b_free!23245 (not b_next!23245))))

(declare-fun tp!82034 () Bool)

(declare-fun b_and!37333 () Bool)

(assert (=> start!97510 (= tp!82034 b_and!37333)))

(declare-fun b!1108835 () Bool)

(declare-fun e!632742 () Bool)

(declare-fun e!632738 () Bool)

(assert (=> b!1108835 (= e!632742 (not e!632738))))

(declare-fun res!739630 () Bool)

(assert (=> b!1108835 (=> res!739630 e!632738)))

(declare-datatypes ((array!71961 0))(
  ( (array!71962 (arr!34627 (Array (_ BitVec 32) (_ BitVec 64))) (size!35164 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71961)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108835 (= res!739630 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35164 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108835 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36327 0))(
  ( (Unit!36328) )
))
(declare-fun lt!496155 () Unit!36327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71961 (_ BitVec 64) (_ BitVec 32)) Unit!36327)

(assert (=> b!1108835 (= lt!496155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108836 () Bool)

(declare-fun res!739636 () Bool)

(assert (=> b!1108836 (=> (not res!739636) (not e!632742))))

(declare-fun lt!496156 () array!71961)

(declare-datatypes ((List!24143 0))(
  ( (Nil!24140) (Cons!24139 (h!25357 (_ BitVec 64)) (t!34426 List!24143)) )
))
(declare-fun arrayNoDuplicates!0 (array!71961 (_ BitVec 32) List!24143) Bool)

(assert (=> b!1108836 (= res!739636 (arrayNoDuplicates!0 lt!496156 #b00000000000000000000000000000000 Nil!24140))))

(declare-fun b!1108837 () Bool)

(declare-fun e!632739 () Bool)

(declare-fun tp_is_empty!27505 () Bool)

(assert (=> b!1108837 (= e!632739 tp_is_empty!27505)))

(declare-fun b!1108838 () Bool)

(declare-datatypes ((V!41801 0))(
  ( (V!41802 (val!13809 Int)) )
))
(declare-datatypes ((tuple2!17456 0))(
  ( (tuple2!17457 (_1!8739 (_ BitVec 64)) (_2!8739 V!41801)) )
))
(declare-datatypes ((List!24144 0))(
  ( (Nil!24141) (Cons!24140 (h!25358 tuple2!17456) (t!34427 List!24144)) )
))
(declare-datatypes ((ListLongMap!15433 0))(
  ( (ListLongMap!15434 (toList!7732 List!24144)) )
))
(declare-fun call!46499 () ListLongMap!15433)

(declare-fun e!632740 () Bool)

(declare-fun call!46498 () ListLongMap!15433)

(declare-fun -!992 (ListLongMap!15433 (_ BitVec 64)) ListLongMap!15433)

(assert (=> b!1108838 (= e!632740 (= call!46498 (-!992 call!46499 k0!934)))))

(declare-fun b!1108839 () Bool)

(declare-fun res!739634 () Bool)

(declare-fun e!632736 () Bool)

(assert (=> b!1108839 (=> (not res!739634) (not e!632736))))

(assert (=> b!1108839 (= res!739634 (= (select (arr!34627 _keys!1208) i!673) k0!934))))

(declare-fun b!1108840 () Bool)

(declare-fun res!739639 () Bool)

(assert (=> b!1108840 (=> (not res!739639) (not e!632736))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13043 0))(
  ( (ValueCellFull!13043 (v!16438 V!41801)) (EmptyCell!13043) )
))
(declare-datatypes ((array!71963 0))(
  ( (array!71964 (arr!34628 (Array (_ BitVec 32) ValueCell!13043)) (size!35165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71963)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1108840 (= res!739639 (and (= (size!35165 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35164 _keys!1208) (size!35165 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41801)

(declare-fun bm!46495 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41801)

(declare-fun getCurrentListMapNoExtraKeys!4269 (array!71961 array!71963 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) Int) ListLongMap!15433)

(declare-fun dynLambda!2386 (Int (_ BitVec 64)) V!41801)

(assert (=> bm!46495 (= call!46498 (getCurrentListMapNoExtraKeys!4269 lt!496156 (array!71964 (store (arr!34628 _values!996) i!673 (ValueCellFull!13043 (dynLambda!2386 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35165 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739637 () Bool)

(assert (=> start!97510 (=> (not res!739637) (not e!632736))))

(assert (=> start!97510 (= res!739637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35164 _keys!1208))))))

(assert (=> start!97510 e!632736))

(assert (=> start!97510 tp_is_empty!27505))

(declare-fun array_inv!26678 (array!71961) Bool)

(assert (=> start!97510 (array_inv!26678 _keys!1208)))

(assert (=> start!97510 true))

(assert (=> start!97510 tp!82034))

(declare-fun e!632737 () Bool)

(declare-fun array_inv!26679 (array!71963) Bool)

(assert (=> start!97510 (and (array_inv!26679 _values!996) e!632737)))

(declare-fun b!1108834 () Bool)

(declare-fun res!739629 () Bool)

(assert (=> b!1108834 (=> (not res!739629) (not e!632736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108834 (= res!739629 (validKeyInArray!0 k0!934))))

(declare-fun b!1108841 () Bool)

(declare-fun res!739633 () Bool)

(assert (=> b!1108841 (=> (not res!739633) (not e!632736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71961 (_ BitVec 32)) Bool)

(assert (=> b!1108841 (= res!739633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46496 () Bool)

(assert (=> bm!46496 (= call!46499 (getCurrentListMapNoExtraKeys!4269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43075 () Bool)

(declare-fun mapRes!43075 () Bool)

(assert (=> mapIsEmpty!43075 mapRes!43075))

(declare-fun b!1108842 () Bool)

(declare-fun res!739635 () Bool)

(assert (=> b!1108842 (=> (not res!739635) (not e!632736))))

(assert (=> b!1108842 (= res!739635 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35164 _keys!1208))))))

(declare-fun b!1108843 () Bool)

(declare-fun e!632735 () Bool)

(assert (=> b!1108843 (= e!632735 tp_is_empty!27505)))

(declare-fun mapNonEmpty!43075 () Bool)

(declare-fun tp!82033 () Bool)

(assert (=> mapNonEmpty!43075 (= mapRes!43075 (and tp!82033 e!632735))))

(declare-fun mapRest!43075 () (Array (_ BitVec 32) ValueCell!13043))

(declare-fun mapValue!43075 () ValueCell!13043)

(declare-fun mapKey!43075 () (_ BitVec 32))

(assert (=> mapNonEmpty!43075 (= (arr!34628 _values!996) (store mapRest!43075 mapKey!43075 mapValue!43075))))

(declare-fun b!1108844 () Bool)

(assert (=> b!1108844 (= e!632740 (= call!46498 call!46499))))

(declare-fun b!1108845 () Bool)

(assert (=> b!1108845 (= e!632738 true)))

(assert (=> b!1108845 e!632740))

(declare-fun c!109463 () Bool)

(assert (=> b!1108845 (= c!109463 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496154 () Unit!36327)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!261 (array!71961 array!71963 (_ BitVec 32) (_ BitVec 32) V!41801 V!41801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36327)

(assert (=> b!1108845 (= lt!496154 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108846 () Bool)

(declare-fun res!739632 () Bool)

(assert (=> b!1108846 (=> (not res!739632) (not e!632736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108846 (= res!739632 (validMask!0 mask!1564))))

(declare-fun b!1108847 () Bool)

(declare-fun res!739631 () Bool)

(assert (=> b!1108847 (=> (not res!739631) (not e!632736))))

(assert (=> b!1108847 (= res!739631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24140))))

(declare-fun b!1108848 () Bool)

(assert (=> b!1108848 (= e!632737 (and e!632739 mapRes!43075))))

(declare-fun condMapEmpty!43075 () Bool)

(declare-fun mapDefault!43075 () ValueCell!13043)

(assert (=> b!1108848 (= condMapEmpty!43075 (= (arr!34628 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13043)) mapDefault!43075)))))

(declare-fun b!1108849 () Bool)

(assert (=> b!1108849 (= e!632736 e!632742)))

(declare-fun res!739638 () Bool)

(assert (=> b!1108849 (=> (not res!739638) (not e!632742))))

(assert (=> b!1108849 (= res!739638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496156 mask!1564))))

(assert (=> b!1108849 (= lt!496156 (array!71962 (store (arr!34627 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35164 _keys!1208)))))

(assert (= (and start!97510 res!739637) b!1108846))

(assert (= (and b!1108846 res!739632) b!1108840))

(assert (= (and b!1108840 res!739639) b!1108841))

(assert (= (and b!1108841 res!739633) b!1108847))

(assert (= (and b!1108847 res!739631) b!1108842))

(assert (= (and b!1108842 res!739635) b!1108834))

(assert (= (and b!1108834 res!739629) b!1108839))

(assert (= (and b!1108839 res!739634) b!1108849))

(assert (= (and b!1108849 res!739638) b!1108836))

(assert (= (and b!1108836 res!739636) b!1108835))

(assert (= (and b!1108835 (not res!739630)) b!1108845))

(assert (= (and b!1108845 c!109463) b!1108838))

(assert (= (and b!1108845 (not c!109463)) b!1108844))

(assert (= (or b!1108838 b!1108844) bm!46495))

(assert (= (or b!1108838 b!1108844) bm!46496))

(assert (= (and b!1108848 condMapEmpty!43075) mapIsEmpty!43075))

(assert (= (and b!1108848 (not condMapEmpty!43075)) mapNonEmpty!43075))

(get-info :version)

(assert (= (and mapNonEmpty!43075 ((_ is ValueCellFull!13043) mapValue!43075)) b!1108843))

(assert (= (and b!1108848 ((_ is ValueCellFull!13043) mapDefault!43075)) b!1108837))

(assert (= start!97510 b!1108848))

(declare-fun b_lambda!18275 () Bool)

(assert (=> (not b_lambda!18275) (not bm!46495)))

(declare-fun t!34425 () Bool)

(declare-fun tb!8103 () Bool)

(assert (=> (and start!97510 (= defaultEntry!1004 defaultEntry!1004) t!34425) tb!8103))

(declare-fun result!16775 () Bool)

(assert (=> tb!8103 (= result!16775 tp_is_empty!27505)))

(assert (=> bm!46495 t!34425))

(declare-fun b_and!37335 () Bool)

(assert (= b_and!37333 (and (=> t!34425 result!16775) b_and!37335)))

(declare-fun m!1027929 () Bool)

(assert (=> b!1108835 m!1027929))

(declare-fun m!1027931 () Bool)

(assert (=> b!1108835 m!1027931))

(declare-fun m!1027933 () Bool)

(assert (=> b!1108836 m!1027933))

(declare-fun m!1027935 () Bool)

(assert (=> b!1108839 m!1027935))

(declare-fun m!1027937 () Bool)

(assert (=> bm!46495 m!1027937))

(declare-fun m!1027939 () Bool)

(assert (=> bm!46495 m!1027939))

(declare-fun m!1027941 () Bool)

(assert (=> bm!46495 m!1027941))

(declare-fun m!1027943 () Bool)

(assert (=> b!1108846 m!1027943))

(declare-fun m!1027945 () Bool)

(assert (=> bm!46496 m!1027945))

(declare-fun m!1027947 () Bool)

(assert (=> b!1108847 m!1027947))

(declare-fun m!1027949 () Bool)

(assert (=> mapNonEmpty!43075 m!1027949))

(declare-fun m!1027951 () Bool)

(assert (=> start!97510 m!1027951))

(declare-fun m!1027953 () Bool)

(assert (=> start!97510 m!1027953))

(declare-fun m!1027955 () Bool)

(assert (=> b!1108849 m!1027955))

(declare-fun m!1027957 () Bool)

(assert (=> b!1108849 m!1027957))

(declare-fun m!1027959 () Bool)

(assert (=> b!1108838 m!1027959))

(declare-fun m!1027961 () Bool)

(assert (=> b!1108845 m!1027961))

(declare-fun m!1027963 () Bool)

(assert (=> b!1108834 m!1027963))

(declare-fun m!1027965 () Bool)

(assert (=> b!1108841 m!1027965))

(check-sat (not mapNonEmpty!43075) b_and!37335 (not b!1108838) (not b!1108841) (not bm!46496) (not b!1108847) (not b!1108845) (not b_next!23245) (not start!97510) (not b!1108836) (not b!1108835) tp_is_empty!27505 (not b!1108834) (not b!1108846) (not bm!46495) (not b!1108849) (not b_lambda!18275))
(check-sat b_and!37335 (not b_next!23245))
