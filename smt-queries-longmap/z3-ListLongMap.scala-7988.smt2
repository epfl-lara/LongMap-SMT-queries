; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98762 () Bool)

(assert start!98762)

(declare-fun b_free!24373 () Bool)

(declare-fun b_next!24373 () Bool)

(assert (=> start!98762 (= b_free!24373 (not b_next!24373))))

(declare-fun tp!85830 () Bool)

(declare-fun b_and!39573 () Bool)

(assert (=> start!98762 (= tp!85830 b_and!39573)))

(declare-datatypes ((V!43665 0))(
  ( (V!43666 (val!14508 Int)) )
))
(declare-fun zeroValue!944 () V!43665)

(declare-datatypes ((array!74570 0))(
  ( (array!74571 (arr!35936 (Array (_ BitVec 32) (_ BitVec 64))) (size!36474 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74570)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18500 0))(
  ( (tuple2!18501 (_1!9261 (_ BitVec 64)) (_2!9261 V!43665)) )
))
(declare-datatypes ((List!25232 0))(
  ( (Nil!25229) (Cons!25228 (h!26437 tuple2!18500) (t!36588 List!25232)) )
))
(declare-datatypes ((ListLongMap!16469 0))(
  ( (ListLongMap!16470 (toList!8250 List!25232)) )
))
(declare-fun call!53996 () ListLongMap!16469)

(declare-fun bm!53992 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13742 0))(
  ( (ValueCellFull!13742 (v!17144 V!43665)) (EmptyCell!13742) )
))
(declare-datatypes ((array!74572 0))(
  ( (array!74573 (arr!35937 (Array (_ BitVec 32) ValueCell!13742)) (size!36475 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74572)

(declare-fun minValue!944 () V!43665)

(declare-fun getCurrentListMapNoExtraKeys!4734 (array!74570 array!74572 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) Int) ListLongMap!16469)

(assert (=> bm!53992 (= call!53996 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152046 () Bool)

(declare-fun lt!515868 () ListLongMap!16469)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6705 (ListLongMap!16469 (_ BitVec 64)) Bool)

(declare-fun +!3665 (ListLongMap!16469 tuple2!18500) ListLongMap!16469)

(assert (=> b!1152046 (contains!6705 (+!3665 lt!515868 (tuple2!18501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37736 0))(
  ( (Unit!37737) )
))
(declare-fun lt!515861 () Unit!37736)

(declare-fun call!53999 () Unit!37736)

(assert (=> b!1152046 (= lt!515861 call!53999)))

(declare-fun call!54002 () Bool)

(assert (=> b!1152046 call!54002))

(declare-fun call!53997 () ListLongMap!16469)

(assert (=> b!1152046 (= lt!515868 call!53997)))

(declare-fun lt!515865 () Unit!37736)

(declare-fun lt!515854 () ListLongMap!16469)

(declare-fun addStillContains!874 (ListLongMap!16469 (_ BitVec 64) V!43665 (_ BitVec 64)) Unit!37736)

(assert (=> b!1152046 (= lt!515865 (addStillContains!874 lt!515854 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!655232 () Unit!37736)

(assert (=> b!1152046 (= e!655232 lt!515861)))

(declare-fun b!1152047 () Bool)

(declare-fun e!655224 () Bool)

(declare-fun tp_is_empty!28903 () Bool)

(assert (=> b!1152047 (= e!655224 tp_is_empty!28903)))

(declare-fun b!1152048 () Bool)

(declare-fun e!655217 () Bool)

(declare-fun call!54001 () ListLongMap!16469)

(assert (=> b!1152048 (= e!655217 (= call!54001 call!53996))))

(declare-fun b!1152049 () Bool)

(declare-fun e!655229 () Bool)

(declare-fun e!655226 () Bool)

(assert (=> b!1152049 (= e!655229 e!655226)))

(declare-fun res!766004 () Bool)

(assert (=> b!1152049 (=> res!766004 e!655226)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152049 (= res!766004 (not (= from!1455 i!673)))))

(declare-fun lt!515869 () array!74572)

(declare-fun lt!515855 () ListLongMap!16469)

(declare-fun lt!515864 () array!74570)

(assert (=> b!1152049 (= lt!515855 (getCurrentListMapNoExtraKeys!4734 lt!515864 lt!515869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515856 () V!43665)

(assert (=> b!1152049 (= lt!515869 (array!74573 (store (arr!35937 _values!996) i!673 (ValueCellFull!13742 lt!515856)) (size!36475 _values!996)))))

(declare-fun dynLambda!2696 (Int (_ BitVec 64)) V!43665)

(assert (=> b!1152049 (= lt!515856 (dynLambda!2696 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515866 () ListLongMap!16469)

(assert (=> b!1152049 (= lt!515866 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152050 () Bool)

(declare-fun res!765993 () Bool)

(declare-fun e!655230 () Bool)

(assert (=> b!1152050 (=> (not res!765993) (not e!655230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74570 (_ BitVec 32)) Bool)

(assert (=> b!1152050 (= res!765993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152051 () Bool)

(declare-fun e!655222 () Unit!37736)

(declare-fun e!655223 () Unit!37736)

(assert (=> b!1152051 (= e!655222 e!655223)))

(declare-fun c!114194 () Bool)

(declare-fun lt!515852 () Bool)

(assert (=> b!1152051 (= c!114194 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515852))))

(declare-fun b!1152052 () Bool)

(declare-fun res!766000 () Bool)

(assert (=> b!1152052 (=> (not res!766000) (not e!655230))))

(assert (=> b!1152052 (= res!766000 (and (= (size!36475 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36474 _keys!1208) (size!36475 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152053 () Bool)

(declare-fun e!655228 () Bool)

(assert (=> b!1152053 (= e!655228 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515852) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!766007 () Bool)

(assert (=> start!98762 (=> (not res!766007) (not e!655230))))

(assert (=> start!98762 (= res!766007 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36474 _keys!1208))))))

(assert (=> start!98762 e!655230))

(assert (=> start!98762 tp_is_empty!28903))

(declare-fun array_inv!27614 (array!74570) Bool)

(assert (=> start!98762 (array_inv!27614 _keys!1208)))

(assert (=> start!98762 true))

(assert (=> start!98762 tp!85830))

(declare-fun e!655227 () Bool)

(declare-fun array_inv!27615 (array!74572) Bool)

(assert (=> start!98762 (and (array_inv!27615 _values!996) e!655227)))

(declare-fun b!1152054 () Bool)

(declare-fun res!766005 () Bool)

(assert (=> b!1152054 (=> (not res!766005) (not e!655230))))

(assert (=> b!1152054 (= res!766005 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36474 _keys!1208))))))

(declare-fun b!1152055 () Bool)

(declare-fun res!765996 () Bool)

(assert (=> b!1152055 (=> (not res!765996) (not e!655230))))

(assert (=> b!1152055 (= res!765996 (= (select (arr!35936 _keys!1208) i!673) k0!934))))

(declare-fun b!1152056 () Bool)

(declare-fun e!655219 () Bool)

(assert (=> b!1152056 (= e!655219 true)))

(declare-fun e!655218 () Bool)

(assert (=> b!1152056 e!655218))

(declare-fun res!765995 () Bool)

(assert (=> b!1152056 (=> (not res!765995) (not e!655218))))

(declare-fun lt!515850 () ListLongMap!16469)

(assert (=> b!1152056 (= res!765995 (= lt!515850 lt!515854))))

(declare-fun -!1315 (ListLongMap!16469 (_ BitVec 64)) ListLongMap!16469)

(assert (=> b!1152056 (= lt!515850 (-!1315 lt!515866 k0!934))))

(declare-fun lt!515860 () V!43665)

(assert (=> b!1152056 (= (-!1315 (+!3665 lt!515854 (tuple2!18501 (select (arr!35936 _keys!1208) from!1455) lt!515860)) (select (arr!35936 _keys!1208) from!1455)) lt!515854)))

(declare-fun lt!515853 () Unit!37736)

(declare-fun addThenRemoveForNewKeyIsSame!171 (ListLongMap!16469 (_ BitVec 64) V!43665) Unit!37736)

(assert (=> b!1152056 (= lt!515853 (addThenRemoveForNewKeyIsSame!171 lt!515854 (select (arr!35936 _keys!1208) from!1455) lt!515860))))

(declare-fun get!18309 (ValueCell!13742 V!43665) V!43665)

(assert (=> b!1152056 (= lt!515860 (get!18309 (select (arr!35937 _values!996) from!1455) lt!515856))))

(declare-fun lt!515851 () Unit!37736)

(declare-fun e!655225 () Unit!37736)

(assert (=> b!1152056 (= lt!515851 e!655225)))

(declare-fun c!114189 () Bool)

(assert (=> b!1152056 (= c!114189 (contains!6705 lt!515854 k0!934))))

(assert (=> b!1152056 (= lt!515854 (getCurrentListMapNoExtraKeys!4734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152057 () Bool)

(declare-fun lt!515857 () Unit!37736)

(assert (=> b!1152057 (= e!655222 lt!515857)))

(declare-fun call!53998 () Unit!37736)

(assert (=> b!1152057 (= lt!515857 call!53998)))

(declare-fun call!54000 () Bool)

(assert (=> b!1152057 call!54000))

(declare-fun b!1152058 () Bool)

(declare-fun e!655233 () Bool)

(assert (=> b!1152058 (= e!655233 tp_is_empty!28903)))

(declare-fun b!1152059 () Bool)

(declare-fun mapRes!45179 () Bool)

(assert (=> b!1152059 (= e!655227 (and e!655233 mapRes!45179))))

(declare-fun condMapEmpty!45179 () Bool)

(declare-fun mapDefault!45179 () ValueCell!13742)

(assert (=> b!1152059 (= condMapEmpty!45179 (= (arr!35937 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13742)) mapDefault!45179)))))

(declare-fun b!1152060 () Bool)

(declare-fun e!655231 () Bool)

(assert (=> b!1152060 (= e!655231 (not e!655229))))

(declare-fun res!765998 () Bool)

(assert (=> b!1152060 (=> res!765998 e!655229)))

(assert (=> b!1152060 (= res!765998 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152060 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515870 () Unit!37736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74570 (_ BitVec 64) (_ BitVec 32)) Unit!37736)

(assert (=> b!1152060 (= lt!515870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53993 () Bool)

(assert (=> bm!53993 (= call!54001 (getCurrentListMapNoExtraKeys!4734 lt!515864 lt!515869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53994 () Bool)

(assert (=> bm!53994 (= call!53998 call!53999)))

(declare-fun b!1152061 () Bool)

(assert (=> b!1152061 call!54000))

(declare-fun lt!515863 () Unit!37736)

(assert (=> b!1152061 (= lt!515863 call!53998)))

(assert (=> b!1152061 (= e!655223 lt!515863)))

(declare-fun mapNonEmpty!45179 () Bool)

(declare-fun tp!85829 () Bool)

(assert (=> mapNonEmpty!45179 (= mapRes!45179 (and tp!85829 e!655224))))

(declare-fun mapKey!45179 () (_ BitVec 32))

(declare-fun mapRest!45179 () (Array (_ BitVec 32) ValueCell!13742))

(declare-fun mapValue!45179 () ValueCell!13742)

(assert (=> mapNonEmpty!45179 (= (arr!35937 _values!996) (store mapRest!45179 mapKey!45179 mapValue!45179))))

(declare-fun b!1152062 () Bool)

(declare-fun Unit!37738 () Unit!37736)

(assert (=> b!1152062 (= e!655223 Unit!37738)))

(declare-fun b!1152063 () Bool)

(assert (=> b!1152063 (= e!655230 e!655231)))

(declare-fun res!766002 () Bool)

(assert (=> b!1152063 (=> (not res!766002) (not e!655231))))

(assert (=> b!1152063 (= res!766002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515864 mask!1564))))

(assert (=> b!1152063 (= lt!515864 (array!74571 (store (arr!35936 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36474 _keys!1208)))))

(declare-fun b!1152064 () Bool)

(assert (=> b!1152064 (= e!655218 (= lt!515850 (getCurrentListMapNoExtraKeys!4734 lt!515864 lt!515869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152065 () Bool)

(declare-fun Unit!37739 () Unit!37736)

(assert (=> b!1152065 (= e!655225 Unit!37739)))

(declare-fun e!655220 () Bool)

(declare-fun b!1152066 () Bool)

(assert (=> b!1152066 (= e!655220 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53995 () Bool)

(declare-fun call!53995 () ListLongMap!16469)

(assert (=> bm!53995 (= call!53995 call!53997)))

(declare-fun mapIsEmpty!45179 () Bool)

(assert (=> mapIsEmpty!45179 mapRes!45179))

(declare-fun b!1152067 () Bool)

(declare-fun c!114192 () Bool)

(assert (=> b!1152067 (= c!114192 (and (not lt!515852) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152067 (= e!655232 e!655222)))

(declare-fun bm!53996 () Bool)

(declare-fun c!114190 () Bool)

(assert (=> bm!53996 (= call!53999 (addStillContains!874 (ite c!114190 lt!515868 lt!515854) (ite c!114190 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114192 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114190 minValue!944 (ite c!114192 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1152068 () Bool)

(declare-fun res!766006 () Bool)

(assert (=> b!1152068 (=> (not res!766006) (not e!655230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152068 (= res!766006 (validKeyInArray!0 k0!934))))

(declare-fun b!1152069 () Bool)

(assert (=> b!1152069 (= e!655217 (= call!54001 (-!1315 call!53996 k0!934)))))

(declare-fun b!1152070 () Bool)

(assert (=> b!1152070 (= e!655226 e!655219)))

(declare-fun res!765994 () Bool)

(assert (=> b!1152070 (=> res!765994 e!655219)))

(assert (=> b!1152070 (= res!765994 (not (= (select (arr!35936 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152070 e!655217))

(declare-fun c!114191 () Bool)

(assert (=> b!1152070 (= c!114191 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515859 () Unit!37736)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 (array!74570 array!74572 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37736)

(assert (=> b!1152070 (= lt!515859 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53997 () Bool)

(assert (=> bm!53997 (= call!53997 (+!3665 lt!515854 (ite (or c!114190 c!114192) (tuple2!18501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152071 () Bool)

(declare-fun Unit!37740 () Unit!37736)

(assert (=> b!1152071 (= e!655225 Unit!37740)))

(assert (=> b!1152071 (= lt!515852 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152071 (= c!114190 (and (not lt!515852) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515858 () Unit!37736)

(assert (=> b!1152071 (= lt!515858 e!655232)))

(declare-fun lt!515862 () Unit!37736)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!465 (array!74570 array!74572 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 64) (_ BitVec 32) Int) Unit!37736)

(assert (=> b!1152071 (= lt!515862 (lemmaListMapContainsThenArrayContainsFrom!465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114193 () Bool)

(assert (=> b!1152071 (= c!114193 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765997 () Bool)

(assert (=> b!1152071 (= res!765997 e!655228)))

(assert (=> b!1152071 (=> (not res!765997) (not e!655220))))

(assert (=> b!1152071 e!655220))

(declare-fun lt!515867 () Unit!37736)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74570 (_ BitVec 32) (_ BitVec 32)) Unit!37736)

(assert (=> b!1152071 (= lt!515867 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25233 0))(
  ( (Nil!25230) (Cons!25229 (h!26438 (_ BitVec 64)) (t!36589 List!25233)) )
))
(declare-fun arrayNoDuplicates!0 (array!74570 (_ BitVec 32) List!25233) Bool)

(assert (=> b!1152071 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25230)))

(declare-fun lt!515871 () Unit!37736)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74570 (_ BitVec 64) (_ BitVec 32) List!25233) Unit!37736)

(assert (=> b!1152071 (= lt!515871 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25230))))

(assert (=> b!1152071 false))

(declare-fun b!1152072 () Bool)

(assert (=> b!1152072 (= e!655228 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152073 () Bool)

(declare-fun res!766001 () Bool)

(assert (=> b!1152073 (=> (not res!766001) (not e!655230))))

(assert (=> b!1152073 (= res!766001 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25230))))

(declare-fun b!1152074 () Bool)

(declare-fun res!766003 () Bool)

(assert (=> b!1152074 (=> (not res!766003) (not e!655231))))

(assert (=> b!1152074 (= res!766003 (arrayNoDuplicates!0 lt!515864 #b00000000000000000000000000000000 Nil!25230))))

(declare-fun b!1152075 () Bool)

(declare-fun res!765999 () Bool)

(assert (=> b!1152075 (=> (not res!765999) (not e!655230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152075 (= res!765999 (validMask!0 mask!1564))))

(declare-fun bm!53998 () Bool)

(assert (=> bm!53998 (= call!54000 call!54002)))

(declare-fun bm!53999 () Bool)

(assert (=> bm!53999 (= call!54002 (contains!6705 (ite c!114190 lt!515868 call!53995) k0!934))))

(assert (= (and start!98762 res!766007) b!1152075))

(assert (= (and b!1152075 res!765999) b!1152052))

(assert (= (and b!1152052 res!766000) b!1152050))

(assert (= (and b!1152050 res!765993) b!1152073))

(assert (= (and b!1152073 res!766001) b!1152054))

(assert (= (and b!1152054 res!766005) b!1152068))

(assert (= (and b!1152068 res!766006) b!1152055))

(assert (= (and b!1152055 res!765996) b!1152063))

(assert (= (and b!1152063 res!766002) b!1152074))

(assert (= (and b!1152074 res!766003) b!1152060))

(assert (= (and b!1152060 (not res!765998)) b!1152049))

(assert (= (and b!1152049 (not res!766004)) b!1152070))

(assert (= (and b!1152070 c!114191) b!1152069))

(assert (= (and b!1152070 (not c!114191)) b!1152048))

(assert (= (or b!1152069 b!1152048) bm!53993))

(assert (= (or b!1152069 b!1152048) bm!53992))

(assert (= (and b!1152070 (not res!765994)) b!1152056))

(assert (= (and b!1152056 c!114189) b!1152071))

(assert (= (and b!1152056 (not c!114189)) b!1152065))

(assert (= (and b!1152071 c!114190) b!1152046))

(assert (= (and b!1152071 (not c!114190)) b!1152067))

(assert (= (and b!1152067 c!114192) b!1152057))

(assert (= (and b!1152067 (not c!114192)) b!1152051))

(assert (= (and b!1152051 c!114194) b!1152061))

(assert (= (and b!1152051 (not c!114194)) b!1152062))

(assert (= (or b!1152057 b!1152061) bm!53994))

(assert (= (or b!1152057 b!1152061) bm!53995))

(assert (= (or b!1152057 b!1152061) bm!53998))

(assert (= (or b!1152046 bm!53998) bm!53999))

(assert (= (or b!1152046 bm!53994) bm!53996))

(assert (= (or b!1152046 bm!53995) bm!53997))

(assert (= (and b!1152071 c!114193) b!1152072))

(assert (= (and b!1152071 (not c!114193)) b!1152053))

(assert (= (and b!1152071 res!765997) b!1152066))

(assert (= (and b!1152056 res!765995) b!1152064))

(assert (= (and b!1152059 condMapEmpty!45179) mapIsEmpty!45179))

(assert (= (and b!1152059 (not condMapEmpty!45179)) mapNonEmpty!45179))

(get-info :version)

(assert (= (and mapNonEmpty!45179 ((_ is ValueCellFull!13742) mapValue!45179)) b!1152047))

(assert (= (and b!1152059 ((_ is ValueCellFull!13742) mapDefault!45179)) b!1152058))

(assert (= start!98762 b!1152059))

(declare-fun b_lambda!19461 () Bool)

(assert (=> (not b_lambda!19461) (not b!1152049)))

(declare-fun t!36587 () Bool)

(declare-fun tb!9177 () Bool)

(assert (=> (and start!98762 (= defaultEntry!1004 defaultEntry!1004) t!36587) tb!9177))

(declare-fun result!18927 () Bool)

(assert (=> tb!9177 (= result!18927 tp_is_empty!28903)))

(assert (=> b!1152049 t!36587))

(declare-fun b_and!39575 () Bool)

(assert (= b_and!39573 (and (=> t!36587 result!18927) b_and!39575)))

(declare-fun m!1061583 () Bool)

(assert (=> b!1152064 m!1061583))

(declare-fun m!1061585 () Bool)

(assert (=> bm!53996 m!1061585))

(declare-fun m!1061587 () Bool)

(assert (=> b!1152049 m!1061587))

(declare-fun m!1061589 () Bool)

(assert (=> b!1152049 m!1061589))

(declare-fun m!1061591 () Bool)

(assert (=> b!1152049 m!1061591))

(declare-fun m!1061593 () Bool)

(assert (=> b!1152049 m!1061593))

(declare-fun m!1061595 () Bool)

(assert (=> b!1152055 m!1061595))

(declare-fun m!1061597 () Bool)

(assert (=> b!1152060 m!1061597))

(declare-fun m!1061599 () Bool)

(assert (=> b!1152060 m!1061599))

(declare-fun m!1061601 () Bool)

(assert (=> b!1152075 m!1061601))

(declare-fun m!1061603 () Bool)

(assert (=> mapNonEmpty!45179 m!1061603))

(declare-fun m!1061605 () Bool)

(assert (=> b!1152063 m!1061605))

(declare-fun m!1061607 () Bool)

(assert (=> b!1152063 m!1061607))

(declare-fun m!1061609 () Bool)

(assert (=> b!1152066 m!1061609))

(declare-fun m!1061611 () Bool)

(assert (=> b!1152074 m!1061611))

(declare-fun m!1061613 () Bool)

(assert (=> bm!53992 m!1061613))

(assert (=> bm!53993 m!1061583))

(declare-fun m!1061615 () Bool)

(assert (=> bm!53997 m!1061615))

(assert (=> b!1152072 m!1061609))

(declare-fun m!1061617 () Bool)

(assert (=> b!1152070 m!1061617))

(declare-fun m!1061619 () Bool)

(assert (=> b!1152070 m!1061619))

(declare-fun m!1061621 () Bool)

(assert (=> b!1152050 m!1061621))

(declare-fun m!1061623 () Bool)

(assert (=> b!1152071 m!1061623))

(declare-fun m!1061625 () Bool)

(assert (=> b!1152071 m!1061625))

(declare-fun m!1061627 () Bool)

(assert (=> b!1152071 m!1061627))

(declare-fun m!1061629 () Bool)

(assert (=> b!1152071 m!1061629))

(declare-fun m!1061631 () Bool)

(assert (=> start!98762 m!1061631))

(declare-fun m!1061633 () Bool)

(assert (=> start!98762 m!1061633))

(declare-fun m!1061635 () Bool)

(assert (=> b!1152056 m!1061635))

(assert (=> b!1152056 m!1061613))

(declare-fun m!1061637 () Bool)

(assert (=> b!1152056 m!1061637))

(assert (=> b!1152056 m!1061637))

(declare-fun m!1061639 () Bool)

(assert (=> b!1152056 m!1061639))

(assert (=> b!1152056 m!1061617))

(declare-fun m!1061641 () Bool)

(assert (=> b!1152056 m!1061641))

(declare-fun m!1061643 () Bool)

(assert (=> b!1152056 m!1061643))

(assert (=> b!1152056 m!1061617))

(declare-fun m!1061645 () Bool)

(assert (=> b!1152056 m!1061645))

(declare-fun m!1061647 () Bool)

(assert (=> b!1152056 m!1061647))

(assert (=> b!1152056 m!1061617))

(assert (=> b!1152056 m!1061643))

(declare-fun m!1061649 () Bool)

(assert (=> b!1152046 m!1061649))

(assert (=> b!1152046 m!1061649))

(declare-fun m!1061651 () Bool)

(assert (=> b!1152046 m!1061651))

(declare-fun m!1061653 () Bool)

(assert (=> b!1152046 m!1061653))

(declare-fun m!1061655 () Bool)

(assert (=> b!1152073 m!1061655))

(declare-fun m!1061657 () Bool)

(assert (=> b!1152069 m!1061657))

(declare-fun m!1061659 () Bool)

(assert (=> b!1152068 m!1061659))

(declare-fun m!1061661 () Bool)

(assert (=> bm!53999 m!1061661))

(check-sat (not b!1152075) (not b!1152073) (not b!1152060) (not bm!53996) (not mapNonEmpty!45179) (not b!1152064) (not b!1152074) (not bm!53993) (not b!1152069) (not b_next!24373) (not b!1152068) (not bm!53999) (not b!1152072) tp_is_empty!28903 (not b!1152063) (not b_lambda!19461) b_and!39575 (not b!1152056) (not b!1152071) (not b!1152070) (not b!1152049) (not bm!53992) (not b!1152050) (not bm!53997) (not start!98762) (not b!1152066) (not b!1152046))
(check-sat b_and!39575 (not b_next!24373))
