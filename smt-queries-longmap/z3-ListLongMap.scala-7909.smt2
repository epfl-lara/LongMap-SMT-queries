; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98192 () Bool)

(assert start!98192)

(declare-fun b_free!23899 () Bool)

(declare-fun b_next!23899 () Bool)

(assert (=> start!98192 (= b_free!23899 (not b_next!23899))))

(declare-fun tp!84401 () Bool)

(declare-fun b_and!38559 () Bool)

(assert (=> start!98192 (= tp!84401 b_and!38559)))

(declare-fun b!1130027 () Bool)

(declare-fun e!643114 () Bool)

(declare-fun tp_is_empty!28429 () Bool)

(assert (=> b!1130027 (= e!643114 tp_is_empty!28429)))

(declare-fun b!1130028 () Bool)

(declare-fun e!643109 () Bool)

(assert (=> b!1130028 (= e!643109 true)))

(declare-datatypes ((V!43033 0))(
  ( (V!43034 (val!14271 Int)) )
))
(declare-fun zeroValue!944 () V!43033)

(declare-datatypes ((array!73638 0))(
  ( (array!73639 (arr!35472 (Array (_ BitVec 32) (_ BitVec 64))) (size!36010 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73638)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!501636 () Bool)

(declare-datatypes ((ValueCell!13505 0))(
  ( (ValueCellFull!13505 (v!16903 V!43033)) (EmptyCell!13505) )
))
(declare-datatypes ((array!73640 0))(
  ( (array!73641 (arr!35473 (Array (_ BitVec 32) ValueCell!13505)) (size!36011 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73640)

(declare-fun minValue!944 () V!43033)

(declare-datatypes ((tuple2!18062 0))(
  ( (tuple2!18063 (_1!9042 (_ BitVec 64)) (_2!9042 V!43033)) )
))
(declare-datatypes ((List!24813 0))(
  ( (Nil!24810) (Cons!24809 (h!26018 tuple2!18062) (t!35695 List!24813)) )
))
(declare-datatypes ((ListLongMap!16031 0))(
  ( (ListLongMap!16032 (toList!8031 List!24813)) )
))
(declare-fun contains!6483 (ListLongMap!16031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4360 (array!73638 array!73640 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!16031)

(assert (=> b!1130028 (= lt!501636 (contains!6483 (getCurrentListMap!4360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130029 () Bool)

(declare-fun e!643108 () Bool)

(declare-fun mapRes!44461 () Bool)

(assert (=> b!1130029 (= e!643108 (and e!643114 mapRes!44461))))

(declare-fun condMapEmpty!44461 () Bool)

(declare-fun mapDefault!44461 () ValueCell!13505)

(assert (=> b!1130029 (= condMapEmpty!44461 (= (arr!35473 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13505)) mapDefault!44461)))))

(declare-fun call!48245 () Bool)

(declare-fun c!109953 () Bool)

(declare-fun bm!48235 () Bool)

(declare-fun call!48241 () ListLongMap!16031)

(declare-fun lt!501642 () ListLongMap!16031)

(assert (=> bm!48235 (= call!48245 (contains!6483 (ite c!109953 lt!501642 call!48241) k0!934))))

(declare-fun lt!501638 () ListLongMap!16031)

(declare-fun bm!48236 () Bool)

(declare-fun c!109955 () Bool)

(declare-fun call!48238 () ListLongMap!16031)

(declare-fun +!3472 (ListLongMap!16031 tuple2!18062) ListLongMap!16031)

(assert (=> bm!48236 (= call!48238 (+!3472 lt!501638 (ite (or c!109953 c!109955) (tuple2!18063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-datatypes ((Unit!36862 0))(
  ( (Unit!36863) )
))
(declare-fun call!48244 () Unit!36862)

(declare-fun bm!48237 () Bool)

(declare-fun addStillContains!689 (ListLongMap!16031 (_ BitVec 64) V!43033 (_ BitVec 64)) Unit!36862)

(assert (=> bm!48237 (= call!48244 (addStillContains!689 (ite c!109953 lt!501642 lt!501638) (ite c!109953 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109955 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109953 minValue!944 (ite c!109955 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!48238 () Bool)

(declare-fun call!48243 () Bool)

(assert (=> bm!48238 (= call!48243 call!48245)))

(declare-fun b!1130030 () Bool)

(declare-fun c!109956 () Bool)

(declare-fun lt!501633 () Bool)

(assert (=> b!1130030 (= c!109956 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501633))))

(declare-fun e!643107 () Unit!36862)

(declare-fun e!643103 () Unit!36862)

(assert (=> b!1130030 (= e!643107 e!643103)))

(declare-fun b!1130031 () Bool)

(declare-fun res!755083 () Bool)

(declare-fun e!643115 () Bool)

(assert (=> b!1130031 (=> (not res!755083) (not e!643115))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130031 (= res!755083 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36010 _keys!1208))))))

(declare-fun bm!48239 () Bool)

(declare-fun call!48242 () ListLongMap!16031)

(declare-fun getCurrentListMapNoExtraKeys!4531 (array!73638 array!73640 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!16031)

(assert (=> bm!48239 (= call!48242 (getCurrentListMapNoExtraKeys!4531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130032 () Bool)

(declare-fun res!755081 () Bool)

(assert (=> b!1130032 (=> (not res!755081) (not e!643115))))

(assert (=> b!1130032 (= res!755081 (= (select (arr!35472 _keys!1208) i!673) k0!934))))

(declare-fun b!1130033 () Bool)

(declare-fun e!643110 () Bool)

(assert (=> b!1130033 (= e!643110 tp_is_empty!28429)))

(declare-fun b!1130034 () Bool)

(declare-fun e!643111 () Bool)

(declare-fun e!643105 () Bool)

(assert (=> b!1130034 (= e!643111 e!643105)))

(declare-fun res!755079 () Bool)

(assert (=> b!1130034 (=> res!755079 e!643105)))

(assert (=> b!1130034 (= res!755079 (not (= (select (arr!35472 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643102 () Bool)

(assert (=> b!1130034 e!643102))

(declare-fun c!109954 () Bool)

(assert (=> b!1130034 (= c!109954 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501630 () Unit!36862)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 (array!73638 array!73640 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36862)

(assert (=> b!1130034 (= lt!501630 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48240 () Bool)

(declare-fun call!48239 () Unit!36862)

(assert (=> bm!48240 (= call!48239 call!48244)))

(declare-fun res!755089 () Bool)

(assert (=> start!98192 (=> (not res!755089) (not e!643115))))

(assert (=> start!98192 (= res!755089 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36010 _keys!1208))))))

(assert (=> start!98192 e!643115))

(assert (=> start!98192 tp_is_empty!28429))

(declare-fun array_inv!27292 (array!73638) Bool)

(assert (=> start!98192 (array_inv!27292 _keys!1208)))

(assert (=> start!98192 true))

(assert (=> start!98192 tp!84401))

(declare-fun array_inv!27293 (array!73640) Bool)

(assert (=> start!98192 (and (array_inv!27293 _values!996) e!643108)))

(declare-fun mapIsEmpty!44461 () Bool)

(assert (=> mapIsEmpty!44461 mapRes!44461))

(declare-fun b!1130035 () Bool)

(declare-fun res!755077 () Bool)

(assert (=> b!1130035 (=> (not res!755077) (not e!643115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73638 (_ BitVec 32)) Bool)

(assert (=> b!1130035 (= res!755077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130036 () Bool)

(declare-fun e!643106 () Bool)

(declare-fun e!643112 () Bool)

(assert (=> b!1130036 (= e!643106 (not e!643112))))

(declare-fun res!755084 () Bool)

(assert (=> b!1130036 (=> res!755084 e!643112)))

(assert (=> b!1130036 (= res!755084 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130036 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501637 () Unit!36862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73638 (_ BitVec 64) (_ BitVec 32)) Unit!36862)

(assert (=> b!1130036 (= lt!501637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!48240 () ListLongMap!16031)

(declare-fun b!1130037 () Bool)

(declare-fun -!1143 (ListLongMap!16031 (_ BitVec 64)) ListLongMap!16031)

(assert (=> b!1130037 (= e!643102 (= call!48240 (-!1143 call!48242 k0!934)))))

(declare-fun lt!501635 () array!73638)

(declare-fun lt!501631 () array!73640)

(declare-fun bm!48241 () Bool)

(assert (=> bm!48241 (= call!48240 (getCurrentListMapNoExtraKeys!4531 lt!501635 lt!501631 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130038 () Bool)

(declare-fun res!755087 () Bool)

(assert (=> b!1130038 (=> (not res!755087) (not e!643115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130038 (= res!755087 (validMask!0 mask!1564))))

(declare-fun b!1130039 () Bool)

(declare-fun res!755080 () Bool)

(assert (=> b!1130039 (=> (not res!755080) (not e!643106))))

(declare-datatypes ((List!24814 0))(
  ( (Nil!24811) (Cons!24810 (h!26019 (_ BitVec 64)) (t!35696 List!24814)) )
))
(declare-fun arrayNoDuplicates!0 (array!73638 (_ BitVec 32) List!24814) Bool)

(assert (=> b!1130039 (= res!755080 (arrayNoDuplicates!0 lt!501635 #b00000000000000000000000000000000 Nil!24811))))

(declare-fun b!1130040 () Bool)

(declare-fun e!643104 () Bool)

(assert (=> b!1130040 (= e!643105 e!643104)))

(declare-fun res!755082 () Bool)

(assert (=> b!1130040 (=> res!755082 e!643104)))

(assert (=> b!1130040 (= res!755082 (not (contains!6483 lt!501638 k0!934)))))

(assert (=> b!1130040 (= lt!501638 (getCurrentListMapNoExtraKeys!4531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130041 () Bool)

(assert (=> b!1130041 (= e!643112 e!643111)))

(declare-fun res!755086 () Bool)

(assert (=> b!1130041 (=> res!755086 e!643111)))

(assert (=> b!1130041 (= res!755086 (not (= from!1455 i!673)))))

(declare-fun lt!501639 () ListLongMap!16031)

(assert (=> b!1130041 (= lt!501639 (getCurrentListMapNoExtraKeys!4531 lt!501635 lt!501631 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2536 (Int (_ BitVec 64)) V!43033)

(assert (=> b!1130041 (= lt!501631 (array!73641 (store (arr!35473 _values!996) i!673 (ValueCellFull!13505 (dynLambda!2536 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36011 _values!996)))))

(declare-fun lt!501628 () ListLongMap!16031)

(assert (=> b!1130041 (= lt!501628 (getCurrentListMapNoExtraKeys!4531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130042 () Bool)

(declare-fun e!643116 () Unit!36862)

(assert (=> b!1130042 (= e!643116 e!643107)))

(assert (=> b!1130042 (= c!109955 (and (not lt!501633) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130043 () Bool)

(declare-fun lt!501641 () Unit!36862)

(assert (=> b!1130043 (= e!643103 lt!501641)))

(assert (=> b!1130043 (= lt!501641 call!48239)))

(assert (=> b!1130043 call!48243))

(declare-fun b!1130044 () Bool)

(declare-fun Unit!36864 () Unit!36862)

(assert (=> b!1130044 (= e!643103 Unit!36864)))

(declare-fun b!1130045 () Bool)

(declare-fun res!755088 () Bool)

(assert (=> b!1130045 (=> (not res!755088) (not e!643115))))

(assert (=> b!1130045 (= res!755088 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24811))))

(declare-fun b!1130046 () Bool)

(assert (=> b!1130046 (= e!643115 e!643106)))

(declare-fun res!755085 () Bool)

(assert (=> b!1130046 (=> (not res!755085) (not e!643106))))

(assert (=> b!1130046 (= res!755085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501635 mask!1564))))

(assert (=> b!1130046 (= lt!501635 (array!73639 (store (arr!35472 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36010 _keys!1208)))))

(declare-fun mapNonEmpty!44461 () Bool)

(declare-fun tp!84400 () Bool)

(assert (=> mapNonEmpty!44461 (= mapRes!44461 (and tp!84400 e!643110))))

(declare-fun mapValue!44461 () ValueCell!13505)

(declare-fun mapKey!44461 () (_ BitVec 32))

(declare-fun mapRest!44461 () (Array (_ BitVec 32) ValueCell!13505))

(assert (=> mapNonEmpty!44461 (= (arr!35473 _values!996) (store mapRest!44461 mapKey!44461 mapValue!44461))))

(declare-fun b!1130047 () Bool)

(assert (=> b!1130047 call!48243))

(declare-fun lt!501632 () Unit!36862)

(assert (=> b!1130047 (= lt!501632 call!48239)))

(assert (=> b!1130047 (= e!643107 lt!501632)))

(declare-fun bm!48242 () Bool)

(assert (=> bm!48242 (= call!48241 call!48238)))

(declare-fun b!1130048 () Bool)

(declare-fun res!755078 () Bool)

(assert (=> b!1130048 (=> (not res!755078) (not e!643115))))

(assert (=> b!1130048 (= res!755078 (and (= (size!36011 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36010 _keys!1208) (size!36011 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130049 () Bool)

(assert (=> b!1130049 (= e!643102 (= call!48240 call!48242))))

(declare-fun b!1130050 () Bool)

(assert (=> b!1130050 (= e!643104 e!643109)))

(declare-fun res!755075 () Bool)

(assert (=> b!1130050 (=> res!755075 e!643109)))

(assert (=> b!1130050 (= res!755075 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36010 _keys!1208))))))

(declare-fun lt!501640 () Unit!36862)

(assert (=> b!1130050 (= lt!501640 e!643116)))

(assert (=> b!1130050 (= c!109953 (and (not lt!501633) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130050 (= lt!501633 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130051 () Bool)

(declare-fun res!755076 () Bool)

(assert (=> b!1130051 (=> (not res!755076) (not e!643115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130051 (= res!755076 (validKeyInArray!0 k0!934))))

(declare-fun b!1130052 () Bool)

(declare-fun lt!501629 () Unit!36862)

(assert (=> b!1130052 (= e!643116 lt!501629)))

(declare-fun lt!501634 () Unit!36862)

(assert (=> b!1130052 (= lt!501634 (addStillContains!689 lt!501638 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1130052 (= lt!501642 call!48238)))

(assert (=> b!1130052 call!48245))

(assert (=> b!1130052 (= lt!501629 call!48244)))

(assert (=> b!1130052 (contains!6483 (+!3472 lt!501642 (tuple2!18063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (= (and start!98192 res!755089) b!1130038))

(assert (= (and b!1130038 res!755087) b!1130048))

(assert (= (and b!1130048 res!755078) b!1130035))

(assert (= (and b!1130035 res!755077) b!1130045))

(assert (= (and b!1130045 res!755088) b!1130031))

(assert (= (and b!1130031 res!755083) b!1130051))

(assert (= (and b!1130051 res!755076) b!1130032))

(assert (= (and b!1130032 res!755081) b!1130046))

(assert (= (and b!1130046 res!755085) b!1130039))

(assert (= (and b!1130039 res!755080) b!1130036))

(assert (= (and b!1130036 (not res!755084)) b!1130041))

(assert (= (and b!1130041 (not res!755086)) b!1130034))

(assert (= (and b!1130034 c!109954) b!1130037))

(assert (= (and b!1130034 (not c!109954)) b!1130049))

(assert (= (or b!1130037 b!1130049) bm!48241))

(assert (= (or b!1130037 b!1130049) bm!48239))

(assert (= (and b!1130034 (not res!755079)) b!1130040))

(assert (= (and b!1130040 (not res!755082)) b!1130050))

(assert (= (and b!1130050 c!109953) b!1130052))

(assert (= (and b!1130050 (not c!109953)) b!1130042))

(assert (= (and b!1130042 c!109955) b!1130047))

(assert (= (and b!1130042 (not c!109955)) b!1130030))

(assert (= (and b!1130030 c!109956) b!1130043))

(assert (= (and b!1130030 (not c!109956)) b!1130044))

(assert (= (or b!1130047 b!1130043) bm!48240))

(assert (= (or b!1130047 b!1130043) bm!48242))

(assert (= (or b!1130047 b!1130043) bm!48238))

(assert (= (or b!1130052 bm!48238) bm!48235))

(assert (= (or b!1130052 bm!48240) bm!48237))

(assert (= (or b!1130052 bm!48242) bm!48236))

(assert (= (and b!1130050 (not res!755075)) b!1130028))

(assert (= (and b!1130029 condMapEmpty!44461) mapIsEmpty!44461))

(assert (= (and b!1130029 (not condMapEmpty!44461)) mapNonEmpty!44461))

(get-info :version)

(assert (= (and mapNonEmpty!44461 ((_ is ValueCellFull!13505) mapValue!44461)) b!1130033))

(assert (= (and b!1130029 ((_ is ValueCellFull!13505) mapDefault!44461)) b!1130027))

(assert (= start!98192 b!1130029))

(declare-fun b_lambda!18851 () Bool)

(assert (=> (not b_lambda!18851) (not b!1130041)))

(declare-fun t!35694 () Bool)

(declare-fun tb!8703 () Bool)

(assert (=> (and start!98192 (= defaultEntry!1004 defaultEntry!1004) t!35694) tb!8703))

(declare-fun result!17975 () Bool)

(assert (=> tb!8703 (= result!17975 tp_is_empty!28429)))

(assert (=> b!1130041 t!35694))

(declare-fun b_and!38561 () Bool)

(assert (= b_and!38559 (and (=> t!35694 result!17975) b_and!38561)))

(declare-fun m!1042743 () Bool)

(assert (=> b!1130028 m!1042743))

(assert (=> b!1130028 m!1042743))

(declare-fun m!1042745 () Bool)

(assert (=> b!1130028 m!1042745))

(declare-fun m!1042747 () Bool)

(assert (=> b!1130037 m!1042747))

(declare-fun m!1042749 () Bool)

(assert (=> bm!48236 m!1042749))

(declare-fun m!1042751 () Bool)

(assert (=> start!98192 m!1042751))

(declare-fun m!1042753 () Bool)

(assert (=> start!98192 m!1042753))

(declare-fun m!1042755 () Bool)

(assert (=> b!1130046 m!1042755))

(declare-fun m!1042757 () Bool)

(assert (=> b!1130046 m!1042757))

(declare-fun m!1042759 () Bool)

(assert (=> bm!48239 m!1042759))

(declare-fun m!1042761 () Bool)

(assert (=> b!1130045 m!1042761))

(declare-fun m!1042763 () Bool)

(assert (=> b!1130032 m!1042763))

(declare-fun m!1042765 () Bool)

(assert (=> b!1130036 m!1042765))

(declare-fun m!1042767 () Bool)

(assert (=> b!1130036 m!1042767))

(declare-fun m!1042769 () Bool)

(assert (=> b!1130040 m!1042769))

(assert (=> b!1130040 m!1042759))

(declare-fun m!1042771 () Bool)

(assert (=> b!1130051 m!1042771))

(declare-fun m!1042773 () Bool)

(assert (=> mapNonEmpty!44461 m!1042773))

(declare-fun m!1042775 () Bool)

(assert (=> b!1130035 m!1042775))

(declare-fun m!1042777 () Bool)

(assert (=> b!1130034 m!1042777))

(declare-fun m!1042779 () Bool)

(assert (=> b!1130034 m!1042779))

(declare-fun m!1042781 () Bool)

(assert (=> b!1130041 m!1042781))

(declare-fun m!1042783 () Bool)

(assert (=> b!1130041 m!1042783))

(declare-fun m!1042785 () Bool)

(assert (=> b!1130041 m!1042785))

(declare-fun m!1042787 () Bool)

(assert (=> b!1130041 m!1042787))

(declare-fun m!1042789 () Bool)

(assert (=> b!1130052 m!1042789))

(declare-fun m!1042791 () Bool)

(assert (=> b!1130052 m!1042791))

(assert (=> b!1130052 m!1042791))

(declare-fun m!1042793 () Bool)

(assert (=> b!1130052 m!1042793))

(declare-fun m!1042795 () Bool)

(assert (=> b!1130038 m!1042795))

(declare-fun m!1042797 () Bool)

(assert (=> b!1130039 m!1042797))

(declare-fun m!1042799 () Bool)

(assert (=> bm!48235 m!1042799))

(declare-fun m!1042801 () Bool)

(assert (=> bm!48237 m!1042801))

(declare-fun m!1042803 () Bool)

(assert (=> bm!48241 m!1042803))

(check-sat (not b!1130046) (not b!1130045) (not b!1130036) (not b!1130052) (not b!1130051) (not b_next!23899) (not b_lambda!18851) b_and!38561 (not b!1130038) (not bm!48241) (not bm!48239) tp_is_empty!28429 (not bm!48237) (not bm!48235) (not b!1130041) (not b!1130035) (not mapNonEmpty!44461) (not b!1130034) (not b!1130037) (not b!1130028) (not bm!48236) (not b!1130040) (not b!1130039) (not start!98192))
(check-sat b_and!38561 (not b_next!23899))
