; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98438 () Bool)

(assert start!98438)

(declare-fun b_free!24049 () Bool)

(declare-fun b_next!24049 () Bool)

(assert (=> start!98438 (= b_free!24049 (not b_next!24049))))

(declare-fun tp!84858 () Bool)

(declare-fun b_and!38925 () Bool)

(assert (=> start!98438 (= tp!84858 b_and!38925)))

(declare-fun b!1137365 () Bool)

(declare-datatypes ((Unit!37108 0))(
  ( (Unit!37109) )
))
(declare-fun e!647187 () Unit!37108)

(declare-fun Unit!37110 () Unit!37108)

(assert (=> b!1137365 (= e!647187 Unit!37110)))

(declare-fun b!1137366 () Bool)

(declare-fun res!758938 () Bool)

(declare-fun e!647185 () Bool)

(assert (=> b!1137366 (=> (not res!758938) (not e!647185))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137366 (= res!758938 (validKeyInArray!0 k0!934))))

(declare-fun bm!50104 () Bool)

(declare-fun call!50114 () Bool)

(declare-fun call!50111 () Bool)

(assert (=> bm!50104 (= call!50114 call!50111)))

(declare-fun b!1137367 () Bool)

(declare-fun e!647181 () Bool)

(declare-datatypes ((V!43233 0))(
  ( (V!43234 (val!14346 Int)) )
))
(declare-datatypes ((tuple2!18206 0))(
  ( (tuple2!18207 (_1!9114 (_ BitVec 64)) (_2!9114 V!43233)) )
))
(declare-datatypes ((List!24948 0))(
  ( (Nil!24945) (Cons!24944 (h!26153 tuple2!18206) (t!35980 List!24948)) )
))
(declare-datatypes ((ListLongMap!16175 0))(
  ( (ListLongMap!16176 (toList!8103 List!24948)) )
))
(declare-fun call!50108 () ListLongMap!16175)

(declare-fun call!50107 () ListLongMap!16175)

(assert (=> b!1137367 (= e!647181 (= call!50108 call!50107))))

(declare-fun b!1137368 () Bool)

(declare-fun -!1197 (ListLongMap!16175 (_ BitVec 64)) ListLongMap!16175)

(assert (=> b!1137368 (= e!647181 (= call!50108 (-!1197 call!50107 k0!934)))))

(declare-fun b!1137369 () Bool)

(declare-fun res!758939 () Bool)

(declare-fun e!647184 () Bool)

(assert (=> b!1137369 (=> (not res!758939) (not e!647184))))

(declare-datatypes ((array!73940 0))(
  ( (array!73941 (arr!35621 (Array (_ BitVec 32) (_ BitVec 64))) (size!36159 (_ BitVec 32))) )
))
(declare-fun lt!505718 () array!73940)

(declare-datatypes ((List!24949 0))(
  ( (Nil!24946) (Cons!24945 (h!26154 (_ BitVec 64)) (t!35981 List!24949)) )
))
(declare-fun arrayNoDuplicates!0 (array!73940 (_ BitVec 32) List!24949) Bool)

(assert (=> b!1137369 (= res!758939 (arrayNoDuplicates!0 lt!505718 #b00000000000000000000000000000000 Nil!24946))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1137370 () Bool)

(declare-fun lt!505717 () Bool)

(declare-fun e!647186 () Bool)

(assert (=> b!1137370 (= e!647186 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44693 () Bool)

(declare-fun mapRes!44693 () Bool)

(assert (=> mapIsEmpty!44693 mapRes!44693))

(declare-fun b!1137371 () Bool)

(declare-fun e!647192 () Bool)

(declare-fun e!647178 () Bool)

(assert (=> b!1137371 (= e!647192 (and e!647178 mapRes!44693))))

(declare-fun condMapEmpty!44693 () Bool)

(declare-datatypes ((ValueCell!13580 0))(
  ( (ValueCellFull!13580 (v!16982 V!43233)) (EmptyCell!13580) )
))
(declare-datatypes ((array!73942 0))(
  ( (array!73943 (arr!35622 (Array (_ BitVec 32) ValueCell!13580)) (size!36160 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73942)

(declare-fun mapDefault!44693 () ValueCell!13580)

(assert (=> b!1137371 (= condMapEmpty!44693 (= (arr!35622 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13580)) mapDefault!44693)))))

(declare-fun b!1137372 () Bool)

(declare-fun e!647190 () Unit!37108)

(declare-fun Unit!37111 () Unit!37108)

(assert (=> b!1137372 (= e!647190 Unit!37111)))

(declare-fun b!1137373 () Bool)

(declare-fun tp_is_empty!28579 () Bool)

(assert (=> b!1137373 (= e!647178 tp_is_empty!28579)))

(declare-fun b!1137374 () Bool)

(assert (=> b!1137374 (= e!647185 e!647184)))

(declare-fun res!758931 () Bool)

(assert (=> b!1137374 (=> (not res!758931) (not e!647184))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73940 (_ BitVec 32)) Bool)

(assert (=> b!1137374 (= res!758931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505718 mask!1564))))

(declare-fun _keys!1208 () array!73940)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137374 (= lt!505718 (array!73941 (store (arr!35621 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36159 _keys!1208)))))

(declare-fun b!1137375 () Bool)

(declare-fun res!758929 () Bool)

(assert (=> b!1137375 (=> (not res!758929) (not e!647185))))

(assert (=> b!1137375 (= res!758929 (and (= (size!36160 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36159 _keys!1208) (size!36160 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44693 () Bool)

(declare-fun tp!84857 () Bool)

(declare-fun e!647183 () Bool)

(assert (=> mapNonEmpty!44693 (= mapRes!44693 (and tp!84857 e!647183))))

(declare-fun mapRest!44693 () (Array (_ BitVec 32) ValueCell!13580))

(declare-fun mapValue!44693 () ValueCell!13580)

(declare-fun mapKey!44693 () (_ BitVec 32))

(assert (=> mapNonEmpty!44693 (= (arr!35622 _values!996) (store mapRest!44693 mapKey!44693 mapValue!44693))))

(declare-fun b!1137376 () Bool)

(declare-fun e!647180 () Bool)

(assert (=> b!1137376 (= e!647184 (not e!647180))))

(declare-fun res!758935 () Bool)

(assert (=> b!1137376 (=> res!758935 e!647180)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1137376 (= res!758935 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137376 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505730 () Unit!37108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73940 (_ BitVec 64) (_ BitVec 32)) Unit!37108)

(assert (=> b!1137376 (= lt!505730 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137377 () Bool)

(declare-fun res!758926 () Bool)

(assert (=> b!1137377 (=> (not res!758926) (not e!647185))))

(assert (=> b!1137377 (= res!758926 (= (select (arr!35621 _keys!1208) i!673) k0!934))))

(declare-fun b!1137378 () Bool)

(assert (=> b!1137378 call!50114))

(declare-fun lt!505719 () Unit!37108)

(declare-fun call!50109 () Unit!37108)

(assert (=> b!1137378 (= lt!505719 call!50109)))

(assert (=> b!1137378 (= e!647190 lt!505719)))

(declare-fun zeroValue!944 () V!43233)

(declare-fun call!50110 () ListLongMap!16175)

(declare-fun bm!50105 () Bool)

(declare-fun minValue!944 () V!43233)

(declare-fun c!111276 () Bool)

(declare-fun lt!505731 () ListLongMap!16175)

(declare-fun c!111274 () Bool)

(declare-fun +!3532 (ListLongMap!16175 tuple2!18206) ListLongMap!16175)

(assert (=> bm!50105 (= call!50110 (+!3532 lt!505731 (ite (or c!111274 c!111276) (tuple2!18207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137379 () Bool)

(declare-fun e!647191 () Bool)

(assert (=> b!1137379 (= e!647191 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137380 () Bool)

(declare-fun res!758930 () Bool)

(assert (=> b!1137380 (=> (not res!758930) (not e!647185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137380 (= res!758930 (validMask!0 mask!1564))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!50106 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4598 (array!73940 array!73942 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) Int) ListLongMap!16175)

(assert (=> bm!50106 (= call!50107 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137381 () Bool)

(declare-fun e!647188 () Unit!37108)

(declare-fun lt!505729 () Unit!37108)

(assert (=> b!1137381 (= e!647188 lt!505729)))

(assert (=> b!1137381 (= lt!505729 call!50109)))

(assert (=> b!1137381 call!50114))

(declare-fun res!758927 () Bool)

(assert (=> start!98438 (=> (not res!758927) (not e!647185))))

(assert (=> start!98438 (= res!758927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36159 _keys!1208))))))

(assert (=> start!98438 e!647185))

(assert (=> start!98438 tp_is_empty!28579))

(declare-fun array_inv!27382 (array!73940) Bool)

(assert (=> start!98438 (array_inv!27382 _keys!1208)))

(assert (=> start!98438 true))

(assert (=> start!98438 tp!84858))

(declare-fun array_inv!27383 (array!73942) Bool)

(assert (=> start!98438 (and (array_inv!27383 _values!996) e!647192)))

(declare-fun b!1137382 () Bool)

(declare-fun lt!505734 () ListLongMap!16175)

(declare-fun contains!6577 (ListLongMap!16175 (_ BitVec 64)) Bool)

(assert (=> b!1137382 (contains!6577 (+!3532 lt!505734 (tuple2!18207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505721 () Unit!37108)

(declare-fun call!50112 () Unit!37108)

(assert (=> b!1137382 (= lt!505721 call!50112)))

(assert (=> b!1137382 call!50111))

(assert (=> b!1137382 (= lt!505734 call!50110)))

(declare-fun lt!505724 () Unit!37108)

(declare-fun addStillContains!751 (ListLongMap!16175 (_ BitVec 64) V!43233 (_ BitVec 64)) Unit!37108)

(assert (=> b!1137382 (= lt!505724 (addStillContains!751 lt!505731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!647182 () Unit!37108)

(assert (=> b!1137382 (= e!647182 lt!505721)))

(declare-fun b!1137383 () Bool)

(declare-fun res!758936 () Bool)

(assert (=> b!1137383 (=> (not res!758936) (not e!647185))))

(assert (=> b!1137383 (= res!758936 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36159 _keys!1208))))))

(declare-fun b!1137384 () Bool)

(declare-fun res!758932 () Bool)

(assert (=> b!1137384 (=> (not res!758932) (not e!647185))))

(assert (=> b!1137384 (= res!758932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24946))))

(declare-fun b!1137385 () Bool)

(assert (=> b!1137385 (= e!647186 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137386 () Bool)

(declare-fun res!758933 () Bool)

(assert (=> b!1137386 (=> (not res!758933) (not e!647185))))

(assert (=> b!1137386 (= res!758933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50107 () Bool)

(declare-fun lt!505732 () array!73942)

(assert (=> bm!50107 (= call!50108 (getCurrentListMapNoExtraKeys!4598 lt!505718 lt!505732 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137387 () Bool)

(declare-fun Unit!37112 () Unit!37108)

(assert (=> b!1137387 (= e!647187 Unit!37112)))

(assert (=> b!1137387 (= lt!505717 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137387 (= c!111274 (and (not lt!505717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505720 () Unit!37108)

(assert (=> b!1137387 (= lt!505720 e!647182)))

(declare-fun lt!505722 () Unit!37108)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!359 (array!73940 array!73942 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 64) (_ BitVec 32) Int) Unit!37108)

(assert (=> b!1137387 (= lt!505722 (lemmaListMapContainsThenArrayContainsFrom!359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111275 () Bool)

(assert (=> b!1137387 (= c!111275 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758937 () Bool)

(assert (=> b!1137387 (= res!758937 e!647186)))

(assert (=> b!1137387 (=> (not res!758937) (not e!647191))))

(assert (=> b!1137387 e!647191))

(declare-fun lt!505727 () Unit!37108)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73940 (_ BitVec 32) (_ BitVec 32)) Unit!37108)

(assert (=> b!1137387 (= lt!505727 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137387 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24946)))

(declare-fun lt!505728 () Unit!37108)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73940 (_ BitVec 64) (_ BitVec 32) List!24949) Unit!37108)

(assert (=> b!1137387 (= lt!505728 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24946))))

(assert (=> b!1137387 false))

(declare-fun call!50113 () ListLongMap!16175)

(declare-fun bm!50108 () Bool)

(assert (=> bm!50108 (= call!50111 (contains!6577 (ite c!111274 lt!505734 call!50113) k0!934))))

(declare-fun b!1137388 () Bool)

(assert (=> b!1137388 (= e!647183 tp_is_empty!28579)))

(declare-fun b!1137389 () Bool)

(assert (=> b!1137389 (= e!647188 e!647190)))

(declare-fun c!111278 () Bool)

(assert (=> b!1137389 (= c!111278 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505717))))

(declare-fun b!1137390 () Bool)

(declare-fun e!647193 () Bool)

(assert (=> b!1137390 (= e!647193 true)))

(declare-fun lt!505726 () Unit!37108)

(assert (=> b!1137390 (= lt!505726 e!647187)))

(declare-fun c!111277 () Bool)

(assert (=> b!1137390 (= c!111277 (contains!6577 lt!505731 k0!934))))

(assert (=> b!1137390 (= lt!505731 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50109 () Bool)

(assert (=> bm!50109 (= call!50109 call!50112)))

(declare-fun b!1137391 () Bool)

(declare-fun e!647179 () Bool)

(assert (=> b!1137391 (= e!647179 e!647193)))

(declare-fun res!758928 () Bool)

(assert (=> b!1137391 (=> res!758928 e!647193)))

(assert (=> b!1137391 (= res!758928 (not (= (select (arr!35621 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137391 e!647181))

(declare-fun c!111273 () Bool)

(assert (=> b!1137391 (= c!111273 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505723 () Unit!37108)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 (array!73940 array!73942 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37108)

(assert (=> b!1137391 (= lt!505723 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137392 () Bool)

(assert (=> b!1137392 (= c!111276 (and (not lt!505717) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137392 (= e!647182 e!647188)))

(declare-fun bm!50110 () Bool)

(assert (=> bm!50110 (= call!50112 (addStillContains!751 (ite c!111274 lt!505734 lt!505731) (ite c!111274 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111276 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111274 minValue!944 (ite c!111276 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!50111 () Bool)

(assert (=> bm!50111 (= call!50113 call!50110)))

(declare-fun b!1137393 () Bool)

(assert (=> b!1137393 (= e!647180 e!647179)))

(declare-fun res!758934 () Bool)

(assert (=> b!1137393 (=> res!758934 e!647179)))

(assert (=> b!1137393 (= res!758934 (not (= from!1455 i!673)))))

(declare-fun lt!505733 () ListLongMap!16175)

(assert (=> b!1137393 (= lt!505733 (getCurrentListMapNoExtraKeys!4598 lt!505718 lt!505732 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2591 (Int (_ BitVec 64)) V!43233)

(assert (=> b!1137393 (= lt!505732 (array!73943 (store (arr!35622 _values!996) i!673 (ValueCellFull!13580 (dynLambda!2591 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36160 _values!996)))))

(declare-fun lt!505725 () ListLongMap!16175)

(assert (=> b!1137393 (= lt!505725 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98438 res!758927) b!1137380))

(assert (= (and b!1137380 res!758930) b!1137375))

(assert (= (and b!1137375 res!758929) b!1137386))

(assert (= (and b!1137386 res!758933) b!1137384))

(assert (= (and b!1137384 res!758932) b!1137383))

(assert (= (and b!1137383 res!758936) b!1137366))

(assert (= (and b!1137366 res!758938) b!1137377))

(assert (= (and b!1137377 res!758926) b!1137374))

(assert (= (and b!1137374 res!758931) b!1137369))

(assert (= (and b!1137369 res!758939) b!1137376))

(assert (= (and b!1137376 (not res!758935)) b!1137393))

(assert (= (and b!1137393 (not res!758934)) b!1137391))

(assert (= (and b!1137391 c!111273) b!1137368))

(assert (= (and b!1137391 (not c!111273)) b!1137367))

(assert (= (or b!1137368 b!1137367) bm!50107))

(assert (= (or b!1137368 b!1137367) bm!50106))

(assert (= (and b!1137391 (not res!758928)) b!1137390))

(assert (= (and b!1137390 c!111277) b!1137387))

(assert (= (and b!1137390 (not c!111277)) b!1137365))

(assert (= (and b!1137387 c!111274) b!1137382))

(assert (= (and b!1137387 (not c!111274)) b!1137392))

(assert (= (and b!1137392 c!111276) b!1137381))

(assert (= (and b!1137392 (not c!111276)) b!1137389))

(assert (= (and b!1137389 c!111278) b!1137378))

(assert (= (and b!1137389 (not c!111278)) b!1137372))

(assert (= (or b!1137381 b!1137378) bm!50109))

(assert (= (or b!1137381 b!1137378) bm!50111))

(assert (= (or b!1137381 b!1137378) bm!50104))

(assert (= (or b!1137382 bm!50104) bm!50108))

(assert (= (or b!1137382 bm!50109) bm!50110))

(assert (= (or b!1137382 bm!50111) bm!50105))

(assert (= (and b!1137387 c!111275) b!1137385))

(assert (= (and b!1137387 (not c!111275)) b!1137370))

(assert (= (and b!1137387 res!758937) b!1137379))

(assert (= (and b!1137371 condMapEmpty!44693) mapIsEmpty!44693))

(assert (= (and b!1137371 (not condMapEmpty!44693)) mapNonEmpty!44693))

(get-info :version)

(assert (= (and mapNonEmpty!44693 ((_ is ValueCellFull!13580) mapValue!44693)) b!1137388))

(assert (= (and b!1137371 ((_ is ValueCellFull!13580) mapDefault!44693)) b!1137373))

(assert (= start!98438 b!1137371))

(declare-fun b_lambda!19137 () Bool)

(assert (=> (not b_lambda!19137) (not b!1137393)))

(declare-fun t!35979 () Bool)

(declare-fun tb!8853 () Bool)

(assert (=> (and start!98438 (= defaultEntry!1004 defaultEntry!1004) t!35979) tb!8853))

(declare-fun result!18279 () Bool)

(assert (=> tb!8853 (= result!18279 tp_is_empty!28579)))

(assert (=> b!1137393 t!35979))

(declare-fun b_and!38927 () Bool)

(assert (= b_and!38925 (and (=> t!35979 result!18279) b_and!38927)))

(declare-fun m!1048965 () Bool)

(assert (=> mapNonEmpty!44693 m!1048965))

(declare-fun m!1048967 () Bool)

(assert (=> b!1137390 m!1048967))

(declare-fun m!1048969 () Bool)

(assert (=> b!1137390 m!1048969))

(declare-fun m!1048971 () Bool)

(assert (=> b!1137393 m!1048971))

(declare-fun m!1048973 () Bool)

(assert (=> b!1137393 m!1048973))

(declare-fun m!1048975 () Bool)

(assert (=> b!1137393 m!1048975))

(declare-fun m!1048977 () Bool)

(assert (=> b!1137393 m!1048977))

(declare-fun m!1048979 () Bool)

(assert (=> b!1137385 m!1048979))

(declare-fun m!1048981 () Bool)

(assert (=> b!1137387 m!1048981))

(declare-fun m!1048983 () Bool)

(assert (=> b!1137387 m!1048983))

(declare-fun m!1048985 () Bool)

(assert (=> b!1137387 m!1048985))

(declare-fun m!1048987 () Bool)

(assert (=> b!1137387 m!1048987))

(declare-fun m!1048989 () Bool)

(assert (=> b!1137376 m!1048989))

(declare-fun m!1048991 () Bool)

(assert (=> b!1137376 m!1048991))

(declare-fun m!1048993 () Bool)

(assert (=> b!1137374 m!1048993))

(declare-fun m!1048995 () Bool)

(assert (=> b!1137374 m!1048995))

(declare-fun m!1048997 () Bool)

(assert (=> bm!50108 m!1048997))

(declare-fun m!1048999 () Bool)

(assert (=> bm!50110 m!1048999))

(declare-fun m!1049001 () Bool)

(assert (=> b!1137366 m!1049001))

(declare-fun m!1049003 () Bool)

(assert (=> b!1137380 m!1049003))

(assert (=> bm!50106 m!1048969))

(declare-fun m!1049005 () Bool)

(assert (=> b!1137377 m!1049005))

(declare-fun m!1049007 () Bool)

(assert (=> bm!50107 m!1049007))

(declare-fun m!1049009 () Bool)

(assert (=> start!98438 m!1049009))

(declare-fun m!1049011 () Bool)

(assert (=> start!98438 m!1049011))

(assert (=> b!1137379 m!1048979))

(declare-fun m!1049013 () Bool)

(assert (=> b!1137369 m!1049013))

(declare-fun m!1049015 () Bool)

(assert (=> b!1137386 m!1049015))

(declare-fun m!1049017 () Bool)

(assert (=> b!1137368 m!1049017))

(declare-fun m!1049019 () Bool)

(assert (=> b!1137391 m!1049019))

(declare-fun m!1049021 () Bool)

(assert (=> b!1137391 m!1049021))

(declare-fun m!1049023 () Bool)

(assert (=> b!1137382 m!1049023))

(assert (=> b!1137382 m!1049023))

(declare-fun m!1049025 () Bool)

(assert (=> b!1137382 m!1049025))

(declare-fun m!1049027 () Bool)

(assert (=> b!1137382 m!1049027))

(declare-fun m!1049029 () Bool)

(assert (=> bm!50105 m!1049029))

(declare-fun m!1049031 () Bool)

(assert (=> b!1137384 m!1049031))

(check-sat (not mapNonEmpty!44693) (not b!1137380) (not bm!50106) (not b!1137385) (not bm!50107) (not b!1137386) (not b!1137366) (not bm!50108) (not b!1137393) (not b!1137384) (not start!98438) (not bm!50105) (not b!1137376) (not bm!50110) (not b!1137368) (not b!1137391) (not b_next!24049) (not b!1137369) (not b!1137382) (not b_lambda!19137) tp_is_empty!28579 (not b!1137379) (not b!1137390) b_and!38927 (not b!1137387) (not b!1137374))
(check-sat b_and!38927 (not b_next!24049))
