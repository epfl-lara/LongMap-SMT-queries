; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98780 () Bool)

(assert start!98780)

(declare-fun b_free!24391 () Bool)

(declare-fun b_next!24391 () Bool)

(assert (=> start!98780 (= b_free!24391 (not b_next!24391))))

(declare-fun tp!85883 () Bool)

(declare-fun b_and!39609 () Bool)

(assert (=> start!98780 (= tp!85883 b_and!39609)))

(declare-fun b!1152874 () Bool)

(declare-fun res!766410 () Bool)

(declare-fun e!655692 () Bool)

(assert (=> b!1152874 (=> (not res!766410) (not e!655692))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152874 (= res!766410 (validMask!0 mask!1564))))

(declare-fun b!1152875 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!43689 0))(
  ( (V!43690 (val!14517 Int)) )
))
(declare-datatypes ((tuple2!18518 0))(
  ( (tuple2!18519 (_1!9270 (_ BitVec 64)) (_2!9270 V!43689)) )
))
(declare-datatypes ((List!25249 0))(
  ( (Nil!25246) (Cons!25245 (h!26454 tuple2!18518) (t!36623 List!25249)) )
))
(declare-datatypes ((ListLongMap!16487 0))(
  ( (ListLongMap!16488 (toList!8259 List!25249)) )
))
(declare-fun call!54213 () ListLongMap!16487)

(declare-fun call!54214 () ListLongMap!16487)

(declare-fun e!655678 () Bool)

(declare-fun -!1320 (ListLongMap!16487 (_ BitVec 64)) ListLongMap!16487)

(assert (=> b!1152875 (= e!655678 (= call!54214 (-!1320 call!54213 k0!934)))))

(declare-fun b!1152876 () Bool)

(declare-fun res!766404 () Bool)

(assert (=> b!1152876 (=> (not res!766404) (not e!655692))))

(declare-datatypes ((array!74606 0))(
  ( (array!74607 (arr!35954 (Array (_ BitVec 32) (_ BitVec 64))) (size!36492 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74606)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74606 (_ BitVec 32)) Bool)

(assert (=> b!1152876 (= res!766404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152877 () Bool)

(declare-fun res!766402 () Bool)

(assert (=> b!1152877 (=> (not res!766402) (not e!655692))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13751 0))(
  ( (ValueCellFull!13751 (v!17153 V!43689)) (EmptyCell!13751) )
))
(declare-datatypes ((array!74608 0))(
  ( (array!74609 (arr!35955 (Array (_ BitVec 32) ValueCell!13751)) (size!36493 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74608)

(assert (=> b!1152877 (= res!766402 (and (= (size!36493 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36492 _keys!1208) (size!36493 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152878 () Bool)

(declare-fun c!114354 () Bool)

(declare-fun lt!516449 () Bool)

(assert (=> b!1152878 (= c!114354 (and (not lt!516449) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37771 0))(
  ( (Unit!37772) )
))
(declare-fun e!655680 () Unit!37771)

(declare-fun e!655691 () Unit!37771)

(assert (=> b!1152878 (= e!655680 e!655691)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1152879 () Bool)

(declare-fun e!655679 () Bool)

(declare-fun arrayContainsKey!0 (array!74606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152879 (= e!655679 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54208 () Bool)

(declare-fun call!54218 () Unit!37771)

(declare-fun call!54215 () Unit!37771)

(assert (=> bm!54208 (= call!54218 call!54215)))

(declare-fun b!1152880 () Bool)

(declare-fun call!54216 () Bool)

(assert (=> b!1152880 call!54216))

(declare-fun lt!516456 () Unit!37771)

(assert (=> b!1152880 (= lt!516456 call!54218)))

(declare-fun e!655683 () Unit!37771)

(assert (=> b!1152880 (= e!655683 lt!516456)))

(declare-fun b!1152881 () Bool)

(declare-fun res!766398 () Bool)

(assert (=> b!1152881 (=> (not res!766398) (not e!655692))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152881 (= res!766398 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36492 _keys!1208))))))

(declare-fun b!1152882 () Bool)

(assert (=> b!1152882 (= e!655678 (= call!54214 call!54213))))

(declare-fun zeroValue!944 () V!43689)

(declare-fun bm!54209 () Bool)

(declare-fun lt!516458 () ListLongMap!16487)

(declare-fun lt!516461 () ListLongMap!16487)

(declare-fun minValue!944 () V!43689)

(declare-fun c!114352 () Bool)

(declare-fun addStillContains!883 (ListLongMap!16487 (_ BitVec 64) V!43689 (_ BitVec 64)) Unit!37771)

(assert (=> bm!54209 (= call!54215 (addStillContains!883 (ite c!114352 lt!516458 lt!516461) (ite c!114352 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114354 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114352 minValue!944 (ite c!114354 zeroValue!944 minValue!944)) k0!934))))

(declare-fun lt!516463 () array!74606)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516450 () array!74608)

(declare-fun b!1152883 () Bool)

(declare-fun e!655676 () Bool)

(declare-fun lt!516459 () ListLongMap!16487)

(declare-fun getCurrentListMapNoExtraKeys!4741 (array!74606 array!74608 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 32) Int) ListLongMap!16487)

(assert (=> b!1152883 (= e!655676 (= lt!516459 (getCurrentListMapNoExtraKeys!4741 lt!516463 lt!516450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun res!766406 () Bool)

(assert (=> start!98780 (=> (not res!766406) (not e!655692))))

(assert (=> start!98780 (= res!766406 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36492 _keys!1208))))))

(assert (=> start!98780 e!655692))

(declare-fun tp_is_empty!28921 () Bool)

(assert (=> start!98780 tp_is_empty!28921))

(declare-fun array_inv!27624 (array!74606) Bool)

(assert (=> start!98780 (array_inv!27624 _keys!1208)))

(assert (=> start!98780 true))

(assert (=> start!98780 tp!85883))

(declare-fun e!655688 () Bool)

(declare-fun array_inv!27625 (array!74608) Bool)

(assert (=> start!98780 (and (array_inv!27625 _values!996) e!655688)))

(declare-fun bm!54210 () Bool)

(declare-fun call!54211 () ListLongMap!16487)

(declare-fun call!54212 () ListLongMap!16487)

(assert (=> bm!54210 (= call!54211 call!54212)))

(declare-fun b!1152884 () Bool)

(declare-fun e!655685 () Bool)

(assert (=> b!1152884 (= e!655685 tp_is_empty!28921)))

(declare-fun b!1152885 () Bool)

(declare-fun e!655690 () Bool)

(declare-fun mapRes!45206 () Bool)

(assert (=> b!1152885 (= e!655688 (and e!655690 mapRes!45206))))

(declare-fun condMapEmpty!45206 () Bool)

(declare-fun mapDefault!45206 () ValueCell!13751)

(assert (=> b!1152885 (= condMapEmpty!45206 (= (arr!35955 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13751)) mapDefault!45206)))))

(declare-fun bm!54211 () Bool)

(assert (=> bm!54211 (= call!54213 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152886 () Bool)

(declare-fun Unit!37773 () Unit!37771)

(assert (=> b!1152886 (= e!655683 Unit!37773)))

(declare-fun b!1152887 () Bool)

(declare-fun res!766409 () Bool)

(declare-fun e!655677 () Bool)

(assert (=> b!1152887 (=> (not res!766409) (not e!655677))))

(declare-datatypes ((List!25250 0))(
  ( (Nil!25247) (Cons!25246 (h!26455 (_ BitVec 64)) (t!36624 List!25250)) )
))
(declare-fun arrayNoDuplicates!0 (array!74606 (_ BitVec 32) List!25250) Bool)

(assert (=> b!1152887 (= res!766409 (arrayNoDuplicates!0 lt!516463 #b00000000000000000000000000000000 Nil!25247))))

(declare-fun b!1152888 () Bool)

(declare-fun e!655682 () Bool)

(assert (=> b!1152888 (= e!655682 true)))

(assert (=> b!1152888 e!655676))

(declare-fun res!766399 () Bool)

(assert (=> b!1152888 (=> (not res!766399) (not e!655676))))

(assert (=> b!1152888 (= res!766399 (= lt!516459 lt!516461))))

(declare-fun lt!516451 () ListLongMap!16487)

(assert (=> b!1152888 (= lt!516459 (-!1320 lt!516451 k0!934))))

(declare-fun lt!516445 () V!43689)

(declare-fun +!3672 (ListLongMap!16487 tuple2!18518) ListLongMap!16487)

(assert (=> b!1152888 (= (-!1320 (+!3672 lt!516461 (tuple2!18519 (select (arr!35954 _keys!1208) from!1455) lt!516445)) (select (arr!35954 _keys!1208) from!1455)) lt!516461)))

(declare-fun lt!516448 () Unit!37771)

(declare-fun addThenRemoveForNewKeyIsSame!176 (ListLongMap!16487 (_ BitVec 64) V!43689) Unit!37771)

(assert (=> b!1152888 (= lt!516448 (addThenRemoveForNewKeyIsSame!176 lt!516461 (select (arr!35954 _keys!1208) from!1455) lt!516445))))

(declare-fun lt!516464 () V!43689)

(declare-fun get!18320 (ValueCell!13751 V!43689) V!43689)

(assert (=> b!1152888 (= lt!516445 (get!18320 (select (arr!35955 _values!996) from!1455) lt!516464))))

(declare-fun lt!516457 () Unit!37771)

(declare-fun e!655687 () Unit!37771)

(assert (=> b!1152888 (= lt!516457 e!655687)))

(declare-fun c!114355 () Bool)

(declare-fun contains!6712 (ListLongMap!16487 (_ BitVec 64)) Bool)

(assert (=> b!1152888 (= c!114355 (contains!6712 lt!516461 k0!934))))

(assert (=> b!1152888 (= lt!516461 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152889 () Bool)

(declare-fun e!655684 () Bool)

(declare-fun e!655689 () Bool)

(assert (=> b!1152889 (= e!655684 e!655689)))

(declare-fun res!766408 () Bool)

(assert (=> b!1152889 (=> res!766408 e!655689)))

(assert (=> b!1152889 (= res!766408 (not (= from!1455 i!673)))))

(declare-fun lt!516465 () ListLongMap!16487)

(assert (=> b!1152889 (= lt!516465 (getCurrentListMapNoExtraKeys!4741 lt!516463 lt!516450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1152889 (= lt!516450 (array!74609 (store (arr!35955 _values!996) i!673 (ValueCellFull!13751 lt!516464)) (size!36493 _values!996)))))

(declare-fun dynLambda!2702 (Int (_ BitVec 64)) V!43689)

(assert (=> b!1152889 (= lt!516464 (dynLambda!2702 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1152889 (= lt!516451 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54212 () Bool)

(assert (=> bm!54212 (= call!54214 (getCurrentListMapNoExtraKeys!4741 lt!516463 lt!516450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152890 () Bool)

(declare-fun Unit!37774 () Unit!37771)

(assert (=> b!1152890 (= e!655687 Unit!37774)))

(assert (=> b!1152890 (= lt!516449 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152890 (= c!114352 (and (not lt!516449) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516447 () Unit!37771)

(assert (=> b!1152890 (= lt!516447 e!655680)))

(declare-fun lt!516452 () Unit!37771)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!472 (array!74606 array!74608 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 64) (_ BitVec 32) Int) Unit!37771)

(assert (=> b!1152890 (= lt!516452 (lemmaListMapContainsThenArrayContainsFrom!472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114351 () Bool)

(assert (=> b!1152890 (= c!114351 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766400 () Bool)

(declare-fun e!655681 () Bool)

(assert (=> b!1152890 (= res!766400 e!655681)))

(assert (=> b!1152890 (=> (not res!766400) (not e!655679))))

(assert (=> b!1152890 e!655679))

(declare-fun lt!516454 () Unit!37771)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74606 (_ BitVec 32) (_ BitVec 32)) Unit!37771)

(assert (=> b!1152890 (= lt!516454 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152890 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25247)))

(declare-fun lt!516446 () Unit!37771)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74606 (_ BitVec 64) (_ BitVec 32) List!25250) Unit!37771)

(assert (=> b!1152890 (= lt!516446 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25247))))

(assert (=> b!1152890 false))

(declare-fun b!1152891 () Bool)

(assert (=> b!1152891 (= e!655681 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516449) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152892 () Bool)

(assert (=> b!1152892 (= e!655681 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152893 () Bool)

(assert (=> b!1152893 (= e!655677 (not e!655684))))

(declare-fun res!766407 () Bool)

(assert (=> b!1152893 (=> res!766407 e!655684)))

(assert (=> b!1152893 (= res!766407 (bvsgt from!1455 i!673))))

(assert (=> b!1152893 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516460 () Unit!37771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74606 (_ BitVec 64) (_ BitVec 32)) Unit!37771)

(assert (=> b!1152893 (= lt!516460 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152894 () Bool)

(declare-fun lt!516455 () Unit!37771)

(assert (=> b!1152894 (= e!655691 lt!516455)))

(assert (=> b!1152894 (= lt!516455 call!54218)))

(assert (=> b!1152894 call!54216))

(declare-fun mapIsEmpty!45206 () Bool)

(assert (=> mapIsEmpty!45206 mapRes!45206))

(declare-fun b!1152895 () Bool)

(declare-fun res!766401 () Bool)

(assert (=> b!1152895 (=> (not res!766401) (not e!655692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152895 (= res!766401 (validKeyInArray!0 k0!934))))

(declare-fun b!1152896 () Bool)

(declare-fun res!766411 () Bool)

(assert (=> b!1152896 (=> (not res!766411) (not e!655692))))

(assert (=> b!1152896 (= res!766411 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25247))))

(declare-fun b!1152897 () Bool)

(assert (=> b!1152897 (= e!655691 e!655683)))

(declare-fun c!114353 () Bool)

(assert (=> b!1152897 (= c!114353 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516449))))

(declare-fun bm!54213 () Bool)

(declare-fun call!54217 () Bool)

(assert (=> bm!54213 (= call!54216 call!54217)))

(declare-fun b!1152898 () Bool)

(declare-fun res!766405 () Bool)

(assert (=> b!1152898 (=> (not res!766405) (not e!655692))))

(assert (=> b!1152898 (= res!766405 (= (select (arr!35954 _keys!1208) i!673) k0!934))))

(declare-fun b!1152899 () Bool)

(assert (=> b!1152899 (= e!655690 tp_is_empty!28921)))

(declare-fun bm!54214 () Bool)

(assert (=> bm!54214 (= call!54217 (contains!6712 (ite c!114352 lt!516458 call!54211) k0!934))))

(declare-fun b!1152900 () Bool)

(assert (=> b!1152900 (= e!655692 e!655677)))

(declare-fun res!766403 () Bool)

(assert (=> b!1152900 (=> (not res!766403) (not e!655677))))

(assert (=> b!1152900 (= res!766403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516463 mask!1564))))

(assert (=> b!1152900 (= lt!516463 (array!74607 (store (arr!35954 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36492 _keys!1208)))))

(declare-fun b!1152901 () Bool)

(assert (=> b!1152901 (contains!6712 (+!3672 lt!516458 (tuple2!18519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516462 () Unit!37771)

(assert (=> b!1152901 (= lt!516462 call!54215)))

(assert (=> b!1152901 call!54217))

(assert (=> b!1152901 (= lt!516458 call!54212)))

(declare-fun lt!516453 () Unit!37771)

(assert (=> b!1152901 (= lt!516453 (addStillContains!883 lt!516461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1152901 (= e!655680 lt!516462)))

(declare-fun b!1152902 () Bool)

(assert (=> b!1152902 (= e!655689 e!655682)))

(declare-fun res!766412 () Bool)

(assert (=> b!1152902 (=> res!766412 e!655682)))

(assert (=> b!1152902 (= res!766412 (not (= (select (arr!35954 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152902 e!655678))

(declare-fun c!114356 () Bool)

(assert (=> b!1152902 (= c!114356 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516444 () Unit!37771)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 (array!74606 array!74608 (_ BitVec 32) (_ BitVec 32) V!43689 V!43689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37771)

(assert (=> b!1152902 (= lt!516444 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45206 () Bool)

(declare-fun tp!85884 () Bool)

(assert (=> mapNonEmpty!45206 (= mapRes!45206 (and tp!85884 e!655685))))

(declare-fun mapKey!45206 () (_ BitVec 32))

(declare-fun mapRest!45206 () (Array (_ BitVec 32) ValueCell!13751))

(declare-fun mapValue!45206 () ValueCell!13751)

(assert (=> mapNonEmpty!45206 (= (arr!35955 _values!996) (store mapRest!45206 mapKey!45206 mapValue!45206))))

(declare-fun bm!54215 () Bool)

(assert (=> bm!54215 (= call!54212 (+!3672 lt!516461 (ite (or c!114352 c!114354) (tuple2!18519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152903 () Bool)

(declare-fun Unit!37775 () Unit!37771)

(assert (=> b!1152903 (= e!655687 Unit!37775)))

(assert (= (and start!98780 res!766406) b!1152874))

(assert (= (and b!1152874 res!766410) b!1152877))

(assert (= (and b!1152877 res!766402) b!1152876))

(assert (= (and b!1152876 res!766404) b!1152896))

(assert (= (and b!1152896 res!766411) b!1152881))

(assert (= (and b!1152881 res!766398) b!1152895))

(assert (= (and b!1152895 res!766401) b!1152898))

(assert (= (and b!1152898 res!766405) b!1152900))

(assert (= (and b!1152900 res!766403) b!1152887))

(assert (= (and b!1152887 res!766409) b!1152893))

(assert (= (and b!1152893 (not res!766407)) b!1152889))

(assert (= (and b!1152889 (not res!766408)) b!1152902))

(assert (= (and b!1152902 c!114356) b!1152875))

(assert (= (and b!1152902 (not c!114356)) b!1152882))

(assert (= (or b!1152875 b!1152882) bm!54212))

(assert (= (or b!1152875 b!1152882) bm!54211))

(assert (= (and b!1152902 (not res!766412)) b!1152888))

(assert (= (and b!1152888 c!114355) b!1152890))

(assert (= (and b!1152888 (not c!114355)) b!1152903))

(assert (= (and b!1152890 c!114352) b!1152901))

(assert (= (and b!1152890 (not c!114352)) b!1152878))

(assert (= (and b!1152878 c!114354) b!1152894))

(assert (= (and b!1152878 (not c!114354)) b!1152897))

(assert (= (and b!1152897 c!114353) b!1152880))

(assert (= (and b!1152897 (not c!114353)) b!1152886))

(assert (= (or b!1152894 b!1152880) bm!54208))

(assert (= (or b!1152894 b!1152880) bm!54210))

(assert (= (or b!1152894 b!1152880) bm!54213))

(assert (= (or b!1152901 bm!54213) bm!54214))

(assert (= (or b!1152901 bm!54208) bm!54209))

(assert (= (or b!1152901 bm!54210) bm!54215))

(assert (= (and b!1152890 c!114351) b!1152892))

(assert (= (and b!1152890 (not c!114351)) b!1152891))

(assert (= (and b!1152890 res!766400) b!1152879))

(assert (= (and b!1152888 res!766399) b!1152883))

(assert (= (and b!1152885 condMapEmpty!45206) mapIsEmpty!45206))

(assert (= (and b!1152885 (not condMapEmpty!45206)) mapNonEmpty!45206))

(get-info :version)

(assert (= (and mapNonEmpty!45206 ((_ is ValueCellFull!13751) mapValue!45206)) b!1152884))

(assert (= (and b!1152885 ((_ is ValueCellFull!13751) mapDefault!45206)) b!1152899))

(assert (= start!98780 b!1152885))

(declare-fun b_lambda!19479 () Bool)

(assert (=> (not b_lambda!19479) (not b!1152889)))

(declare-fun t!36622 () Bool)

(declare-fun tb!9195 () Bool)

(assert (=> (and start!98780 (= defaultEntry!1004 defaultEntry!1004) t!36622) tb!9195))

(declare-fun result!18963 () Bool)

(assert (=> tb!9195 (= result!18963 tp_is_empty!28921)))

(assert (=> b!1152889 t!36622))

(declare-fun b_and!39611 () Bool)

(assert (= b_and!39609 (and (=> t!36622 result!18963) b_and!39611)))

(declare-fun m!1062303 () Bool)

(assert (=> b!1152887 m!1062303))

(declare-fun m!1062305 () Bool)

(assert (=> bm!54214 m!1062305))

(declare-fun m!1062307 () Bool)

(assert (=> b!1152890 m!1062307))

(declare-fun m!1062309 () Bool)

(assert (=> b!1152890 m!1062309))

(declare-fun m!1062311 () Bool)

(assert (=> b!1152890 m!1062311))

(declare-fun m!1062313 () Bool)

(assert (=> b!1152890 m!1062313))

(declare-fun m!1062315 () Bool)

(assert (=> b!1152893 m!1062315))

(declare-fun m!1062317 () Bool)

(assert (=> b!1152893 m!1062317))

(declare-fun m!1062319 () Bool)

(assert (=> b!1152889 m!1062319))

(declare-fun m!1062321 () Bool)

(assert (=> b!1152889 m!1062321))

(declare-fun m!1062323 () Bool)

(assert (=> b!1152889 m!1062323))

(declare-fun m!1062325 () Bool)

(assert (=> b!1152889 m!1062325))

(declare-fun m!1062327 () Bool)

(assert (=> bm!54215 m!1062327))

(declare-fun m!1062329 () Bool)

(assert (=> b!1152900 m!1062329))

(declare-fun m!1062331 () Bool)

(assert (=> b!1152900 m!1062331))

(declare-fun m!1062333 () Bool)

(assert (=> b!1152883 m!1062333))

(declare-fun m!1062335 () Bool)

(assert (=> b!1152896 m!1062335))

(declare-fun m!1062337 () Bool)

(assert (=> b!1152902 m!1062337))

(declare-fun m!1062339 () Bool)

(assert (=> b!1152902 m!1062339))

(declare-fun m!1062341 () Bool)

(assert (=> b!1152895 m!1062341))

(declare-fun m!1062343 () Bool)

(assert (=> b!1152892 m!1062343))

(declare-fun m!1062345 () Bool)

(assert (=> mapNonEmpty!45206 m!1062345))

(assert (=> bm!54212 m!1062333))

(declare-fun m!1062347 () Bool)

(assert (=> bm!54211 m!1062347))

(declare-fun m!1062349 () Bool)

(assert (=> b!1152875 m!1062349))

(declare-fun m!1062351 () Bool)

(assert (=> b!1152901 m!1062351))

(assert (=> b!1152901 m!1062351))

(declare-fun m!1062353 () Bool)

(assert (=> b!1152901 m!1062353))

(declare-fun m!1062355 () Bool)

(assert (=> b!1152901 m!1062355))

(declare-fun m!1062357 () Bool)

(assert (=> start!98780 m!1062357))

(declare-fun m!1062359 () Bool)

(assert (=> start!98780 m!1062359))

(assert (=> b!1152888 m!1062347))

(declare-fun m!1062361 () Bool)

(assert (=> b!1152888 m!1062361))

(assert (=> b!1152888 m!1062361))

(declare-fun m!1062363 () Bool)

(assert (=> b!1152888 m!1062363))

(declare-fun m!1062365 () Bool)

(assert (=> b!1152888 m!1062365))

(assert (=> b!1152888 m!1062337))

(declare-fun m!1062367 () Bool)

(assert (=> b!1152888 m!1062367))

(declare-fun m!1062369 () Bool)

(assert (=> b!1152888 m!1062369))

(declare-fun m!1062371 () Bool)

(assert (=> b!1152888 m!1062371))

(assert (=> b!1152888 m!1062337))

(declare-fun m!1062373 () Bool)

(assert (=> b!1152888 m!1062373))

(assert (=> b!1152888 m!1062371))

(assert (=> b!1152888 m!1062337))

(declare-fun m!1062375 () Bool)

(assert (=> b!1152874 m!1062375))

(declare-fun m!1062377 () Bool)

(assert (=> bm!54209 m!1062377))

(declare-fun m!1062379 () Bool)

(assert (=> b!1152876 m!1062379))

(assert (=> b!1152879 m!1062343))

(declare-fun m!1062381 () Bool)

(assert (=> b!1152898 m!1062381))

(check-sat (not b!1152902) (not b!1152895) (not b_next!24391) (not bm!54215) (not b!1152892) b_and!39611 (not b!1152893) (not mapNonEmpty!45206) (not b!1152874) (not b!1152901) (not b!1152889) (not b!1152900) (not b!1152896) (not b!1152879) (not b!1152887) (not b!1152876) (not bm!54212) (not bm!54214) (not bm!54211) (not b!1152890) (not b_lambda!19479) (not b!1152875) (not b!1152888) (not b!1152883) (not start!98780) tp_is_empty!28921 (not bm!54209))
(check-sat b_and!39611 (not b_next!24391))
