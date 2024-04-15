; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97328 () Bool)

(assert start!97328)

(declare-fun b_free!23305 () Bool)

(declare-fun b_next!23305 () Bool)

(assert (=> start!97328 (= b_free!23305 (not b_next!23305))))

(declare-fun tp!82213 () Bool)

(declare-fun b_and!37421 () Bool)

(assert (=> start!97328 (= tp!82213 b_and!37421)))

(declare-fun b!1108878 () Bool)

(declare-fun e!632520 () Bool)

(declare-fun e!632525 () Bool)

(assert (=> b!1108878 (= e!632520 e!632525)))

(declare-fun res!740034 () Bool)

(assert (=> b!1108878 (=> (not res!740034) (not e!632525))))

(declare-datatypes ((array!71942 0))(
  ( (array!71943 (arr!34624 (Array (_ BitVec 32) (_ BitVec 64))) (size!35162 (_ BitVec 32))) )
))
(declare-fun lt!495709 () array!71942)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71942 (_ BitVec 32)) Bool)

(assert (=> b!1108878 (= res!740034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495709 mask!1564))))

(declare-fun _keys!1208 () array!71942)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108878 (= lt!495709 (array!71943 (store (arr!34624 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35162 _keys!1208)))))

(declare-fun b!1108879 () Bool)

(declare-fun res!740033 () Bool)

(assert (=> b!1108879 (=> (not res!740033) (not e!632520))))

(declare-datatypes ((V!41881 0))(
  ( (V!41882 (val!13839 Int)) )
))
(declare-datatypes ((ValueCell!13073 0))(
  ( (ValueCellFull!13073 (v!16471 V!41881)) (EmptyCell!13073) )
))
(declare-datatypes ((array!71944 0))(
  ( (array!71945 (arr!34625 (Array (_ BitVec 32) ValueCell!13073)) (size!35163 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71944)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1108879 (= res!740033 (and (= (size!35163 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35162 _keys!1208) (size!35163 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108880 () Bool)

(declare-fun res!740035 () Bool)

(assert (=> b!1108880 (=> (not res!740035) (not e!632520))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1108880 (= res!740035 (= (select (arr!34624 _keys!1208) i!673) k0!934))))

(declare-fun b!1108881 () Bool)

(declare-fun e!632526 () Bool)

(assert (=> b!1108881 (= e!632526 true)))

(declare-fun e!632521 () Bool)

(assert (=> b!1108881 e!632521))

(declare-fun c!109116 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108881 (= c!109116 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41881)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36205 0))(
  ( (Unit!36206) )
))
(declare-fun lt!495710 () Unit!36205)

(declare-fun minValue!944 () V!41881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 (array!71942 array!71944 (_ BitVec 32) (_ BitVec 32) V!41881 V!41881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36205)

(assert (=> b!1108881 (= lt!495710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108882 () Bool)

(declare-fun e!632522 () Bool)

(declare-fun e!632523 () Bool)

(declare-fun mapRes!43165 () Bool)

(assert (=> b!1108882 (= e!632522 (and e!632523 mapRes!43165))))

(declare-fun condMapEmpty!43165 () Bool)

(declare-fun mapDefault!43165 () ValueCell!13073)

(assert (=> b!1108882 (= condMapEmpty!43165 (= (arr!34625 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13073)) mapDefault!43165)))))

(declare-datatypes ((tuple2!17544 0))(
  ( (tuple2!17545 (_1!8783 (_ BitVec 64)) (_2!8783 V!41881)) )
))
(declare-datatypes ((List!24202 0))(
  ( (Nil!24199) (Cons!24198 (h!25407 tuple2!17544) (t!34544 List!24202)) )
))
(declare-datatypes ((ListLongMap!15513 0))(
  ( (ListLongMap!15514 (toList!7772 List!24202)) )
))
(declare-fun call!46588 () ListLongMap!15513)

(declare-fun bm!46585 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4288 (array!71942 array!71944 (_ BitVec 32) (_ BitVec 32) V!41881 V!41881 (_ BitVec 32) Int) ListLongMap!15513)

(assert (=> bm!46585 (= call!46588 (getCurrentListMapNoExtraKeys!4288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46589 () ListLongMap!15513)

(declare-fun bm!46586 () Bool)

(declare-fun dynLambda!2354 (Int (_ BitVec 64)) V!41881)

(assert (=> bm!46586 (= call!46589 (getCurrentListMapNoExtraKeys!4288 lt!495709 (array!71945 (store (arr!34625 _values!996) i!673 (ValueCellFull!13073 (dynLambda!2354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35163 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108883 () Bool)

(declare-fun res!740038 () Bool)

(assert (=> b!1108883 (=> (not res!740038) (not e!632520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108883 (= res!740038 (validKeyInArray!0 k0!934))))

(declare-fun b!1108884 () Bool)

(declare-fun -!994 (ListLongMap!15513 (_ BitVec 64)) ListLongMap!15513)

(assert (=> b!1108884 (= e!632521 (= call!46589 (-!994 call!46588 k0!934)))))

(declare-fun b!1108885 () Bool)

(declare-fun e!632524 () Bool)

(declare-fun tp_is_empty!27565 () Bool)

(assert (=> b!1108885 (= e!632524 tp_is_empty!27565)))

(declare-fun b!1108886 () Bool)

(declare-fun res!740028 () Bool)

(assert (=> b!1108886 (=> (not res!740028) (not e!632520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108886 (= res!740028 (validMask!0 mask!1564))))

(declare-fun b!1108887 () Bool)

(declare-fun res!740037 () Bool)

(assert (=> b!1108887 (=> (not res!740037) (not e!632520))))

(declare-datatypes ((List!24203 0))(
  ( (Nil!24200) (Cons!24199 (h!25408 (_ BitVec 64)) (t!34545 List!24203)) )
))
(declare-fun arrayNoDuplicates!0 (array!71942 (_ BitVec 32) List!24203) Bool)

(assert (=> b!1108887 (= res!740037 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24200))))

(declare-fun b!1108889 () Bool)

(assert (=> b!1108889 (= e!632523 tp_is_empty!27565)))

(declare-fun mapIsEmpty!43165 () Bool)

(assert (=> mapIsEmpty!43165 mapRes!43165))

(declare-fun b!1108890 () Bool)

(assert (=> b!1108890 (= e!632521 (= call!46589 call!46588))))

(declare-fun mapNonEmpty!43165 () Bool)

(declare-fun tp!82214 () Bool)

(assert (=> mapNonEmpty!43165 (= mapRes!43165 (and tp!82214 e!632524))))

(declare-fun mapRest!43165 () (Array (_ BitVec 32) ValueCell!13073))

(declare-fun mapKey!43165 () (_ BitVec 32))

(declare-fun mapValue!43165 () ValueCell!13073)

(assert (=> mapNonEmpty!43165 (= (arr!34625 _values!996) (store mapRest!43165 mapKey!43165 mapValue!43165))))

(declare-fun b!1108891 () Bool)

(declare-fun res!740031 () Bool)

(assert (=> b!1108891 (=> (not res!740031) (not e!632520))))

(assert (=> b!1108891 (= res!740031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108892 () Bool)

(declare-fun res!740029 () Bool)

(assert (=> b!1108892 (=> (not res!740029) (not e!632525))))

(assert (=> b!1108892 (= res!740029 (arrayNoDuplicates!0 lt!495709 #b00000000000000000000000000000000 Nil!24200))))

(declare-fun b!1108893 () Bool)

(assert (=> b!1108893 (= e!632525 (not e!632526))))

(declare-fun res!740030 () Bool)

(assert (=> b!1108893 (=> res!740030 e!632526)))

(assert (=> b!1108893 (= res!740030 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35162 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108893 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495711 () Unit!36205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71942 (_ BitVec 64) (_ BitVec 32)) Unit!36205)

(assert (=> b!1108893 (= lt!495711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!740036 () Bool)

(assert (=> start!97328 (=> (not res!740036) (not e!632520))))

(assert (=> start!97328 (= res!740036 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35162 _keys!1208))))))

(assert (=> start!97328 e!632520))

(assert (=> start!97328 tp_is_empty!27565))

(declare-fun array_inv!26698 (array!71942) Bool)

(assert (=> start!97328 (array_inv!26698 _keys!1208)))

(assert (=> start!97328 true))

(assert (=> start!97328 tp!82213))

(declare-fun array_inv!26699 (array!71944) Bool)

(assert (=> start!97328 (and (array_inv!26699 _values!996) e!632522)))

(declare-fun b!1108888 () Bool)

(declare-fun res!740032 () Bool)

(assert (=> b!1108888 (=> (not res!740032) (not e!632520))))

(assert (=> b!1108888 (= res!740032 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35162 _keys!1208))))))

(assert (= (and start!97328 res!740036) b!1108886))

(assert (= (and b!1108886 res!740028) b!1108879))

(assert (= (and b!1108879 res!740033) b!1108891))

(assert (= (and b!1108891 res!740031) b!1108887))

(assert (= (and b!1108887 res!740037) b!1108888))

(assert (= (and b!1108888 res!740032) b!1108883))

(assert (= (and b!1108883 res!740038) b!1108880))

(assert (= (and b!1108880 res!740035) b!1108878))

(assert (= (and b!1108878 res!740034) b!1108892))

(assert (= (and b!1108892 res!740029) b!1108893))

(assert (= (and b!1108893 (not res!740030)) b!1108881))

(assert (= (and b!1108881 c!109116) b!1108884))

(assert (= (and b!1108881 (not c!109116)) b!1108890))

(assert (= (or b!1108884 b!1108890) bm!46586))

(assert (= (or b!1108884 b!1108890) bm!46585))

(assert (= (and b!1108882 condMapEmpty!43165) mapIsEmpty!43165))

(assert (= (and b!1108882 (not condMapEmpty!43165)) mapNonEmpty!43165))

(get-info :version)

(assert (= (and mapNonEmpty!43165 ((_ is ValueCellFull!13073) mapValue!43165)) b!1108885))

(assert (= (and b!1108882 ((_ is ValueCellFull!13073) mapDefault!43165)) b!1108889))

(assert (= start!97328 b!1108882))

(declare-fun b_lambda!18307 () Bool)

(assert (=> (not b_lambda!18307) (not bm!46586)))

(declare-fun t!34543 () Bool)

(declare-fun tb!8163 () Bool)

(assert (=> (and start!97328 (= defaultEntry!1004 defaultEntry!1004) t!34543) tb!8163))

(declare-fun result!16895 () Bool)

(assert (=> tb!8163 (= result!16895 tp_is_empty!27565)))

(assert (=> bm!46586 t!34543))

(declare-fun b_and!37423 () Bool)

(assert (= b_and!37421 (and (=> t!34543 result!16895) b_and!37423)))

(declare-fun m!1026771 () Bool)

(assert (=> b!1108880 m!1026771))

(declare-fun m!1026773 () Bool)

(assert (=> b!1108892 m!1026773))

(declare-fun m!1026775 () Bool)

(assert (=> b!1108881 m!1026775))

(declare-fun m!1026777 () Bool)

(assert (=> bm!46586 m!1026777))

(declare-fun m!1026779 () Bool)

(assert (=> bm!46586 m!1026779))

(declare-fun m!1026781 () Bool)

(assert (=> bm!46586 m!1026781))

(declare-fun m!1026783 () Bool)

(assert (=> b!1108893 m!1026783))

(declare-fun m!1026785 () Bool)

(assert (=> b!1108893 m!1026785))

(declare-fun m!1026787 () Bool)

(assert (=> b!1108883 m!1026787))

(declare-fun m!1026789 () Bool)

(assert (=> bm!46585 m!1026789))

(declare-fun m!1026791 () Bool)

(assert (=> b!1108884 m!1026791))

(declare-fun m!1026793 () Bool)

(assert (=> b!1108887 m!1026793))

(declare-fun m!1026795 () Bool)

(assert (=> mapNonEmpty!43165 m!1026795))

(declare-fun m!1026797 () Bool)

(assert (=> b!1108886 m!1026797))

(declare-fun m!1026799 () Bool)

(assert (=> b!1108878 m!1026799))

(declare-fun m!1026801 () Bool)

(assert (=> b!1108878 m!1026801))

(declare-fun m!1026803 () Bool)

(assert (=> start!97328 m!1026803))

(declare-fun m!1026805 () Bool)

(assert (=> start!97328 m!1026805))

(declare-fun m!1026807 () Bool)

(assert (=> b!1108891 m!1026807))

(check-sat (not b_next!23305) tp_is_empty!27565 (not b!1108878) (not b!1108883) (not bm!46585) (not b!1108884) (not b!1108887) (not bm!46586) (not start!97328) (not b!1108886) (not b!1108881) (not mapNonEmpty!43165) (not b!1108891) (not b!1108892) b_and!37423 (not b_lambda!18307) (not b!1108893))
(check-sat b_and!37423 (not b_next!23305))
