; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98620 () Bool)

(assert start!98620)

(declare-fun b_free!23989 () Bool)

(declare-fun b_next!23989 () Bool)

(assert (=> start!98620 (= b_free!23989 (not b_next!23989))))

(declare-fun tp!84677 () Bool)

(declare-fun b_and!38829 () Bool)

(assert (=> start!98620 (= tp!84677 b_and!38829)))

(declare-fun b!1135986 () Bool)

(declare-fun res!757999 () Bool)

(declare-fun e!646597 () Bool)

(assert (=> b!1135986 (=> res!757999 e!646597)))

(declare-datatypes ((List!24841 0))(
  ( (Nil!24838) (Cons!24837 (h!26055 (_ BitVec 64)) (t!35814 List!24841)) )
))
(declare-fun contains!6579 (List!24841 (_ BitVec 64)) Bool)

(assert (=> b!1135986 (= res!757999 (contains!6579 Nil!24838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135987 () Bool)

(declare-fun res!758007 () Bool)

(declare-fun e!646601 () Bool)

(assert (=> b!1135987 (=> (not res!758007) (not e!646601))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135987 (= res!758007 (validKeyInArray!0 k0!934))))

(declare-fun b!1135988 () Bool)

(declare-fun res!758008 () Bool)

(assert (=> b!1135988 (=> (not res!758008) (not e!646601))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73941 0))(
  ( (array!73942 (arr!35615 (Array (_ BitVec 32) (_ BitVec 64))) (size!36152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73941)

(assert (=> b!1135988 (= res!758008 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36152 _keys!1208))))))

(declare-fun b!1135989 () Bool)

(declare-fun call!49475 () Bool)

(assert (=> b!1135989 call!49475))

(declare-datatypes ((Unit!37143 0))(
  ( (Unit!37144) )
))
(declare-fun lt!504836 () Unit!37143)

(declare-fun call!49479 () Unit!37143)

(assert (=> b!1135989 (= lt!504836 call!49479)))

(declare-fun e!646602 () Unit!37143)

(assert (=> b!1135989 (= e!646602 lt!504836)))

(declare-fun b!1135990 () Bool)

(declare-fun e!646596 () Unit!37143)

(declare-fun lt!504843 () Unit!37143)

(assert (=> b!1135990 (= e!646596 lt!504843)))

(declare-fun lt!504834 () Unit!37143)

(declare-fun call!49477 () Unit!37143)

(assert (=> b!1135990 (= lt!504834 call!49477)))

(declare-datatypes ((V!43153 0))(
  ( (V!43154 (val!14316 Int)) )
))
(declare-datatypes ((tuple2!18074 0))(
  ( (tuple2!18075 (_1!9048 (_ BitVec 64)) (_2!9048 V!43153)) )
))
(declare-datatypes ((List!24842 0))(
  ( (Nil!24839) (Cons!24838 (h!26056 tuple2!18074) (t!35815 List!24842)) )
))
(declare-datatypes ((ListLongMap!16051 0))(
  ( (ListLongMap!16052 (toList!8041 List!24842)) )
))
(declare-fun lt!504844 () ListLongMap!16051)

(declare-fun call!49476 () ListLongMap!16051)

(assert (=> b!1135990 (= lt!504844 call!49476)))

(declare-fun call!49482 () Bool)

(assert (=> b!1135990 call!49482))

(declare-fun minValue!944 () V!43153)

(declare-fun addStillContains!725 (ListLongMap!16051 (_ BitVec 64) V!43153 (_ BitVec 64)) Unit!37143)

(assert (=> b!1135990 (= lt!504843 (addStillContains!725 lt!504844 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6580 (ListLongMap!16051 (_ BitVec 64)) Bool)

(declare-fun +!3498 (ListLongMap!16051 tuple2!18074) ListLongMap!16051)

(assert (=> b!1135990 (contains!6580 (+!3498 lt!504844 (tuple2!18075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135991 () Bool)

(declare-fun e!646590 () Bool)

(declare-fun e!646588 () Bool)

(declare-fun mapRes!44603 () Bool)

(assert (=> b!1135991 (= e!646590 (and e!646588 mapRes!44603))))

(declare-fun condMapEmpty!44603 () Bool)

(declare-datatypes ((ValueCell!13550 0))(
  ( (ValueCellFull!13550 (v!16949 V!43153)) (EmptyCell!13550) )
))
(declare-datatypes ((array!73943 0))(
  ( (array!73944 (arr!35616 (Array (_ BitVec 32) ValueCell!13550)) (size!36153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73943)

(declare-fun mapDefault!44603 () ValueCell!13550)

(assert (=> b!1135991 (= condMapEmpty!44603 (= (arr!35616 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13550)) mapDefault!44603)))))

(declare-fun b!1135992 () Bool)

(declare-fun res!758001 () Bool)

(assert (=> b!1135992 (=> (not res!758001) (not e!646601))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135992 (= res!758001 (validMask!0 mask!1564))))

(declare-fun b!1135993 () Bool)

(declare-fun e!646587 () Bool)

(assert (=> b!1135993 (= e!646601 e!646587)))

(declare-fun res!758012 () Bool)

(assert (=> b!1135993 (=> (not res!758012) (not e!646587))))

(declare-fun lt!504840 () array!73941)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73941 (_ BitVec 32)) Bool)

(assert (=> b!1135993 (= res!758012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504840 mask!1564))))

(assert (=> b!1135993 (= lt!504840 (array!73942 (store (arr!35615 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36152 _keys!1208)))))

(declare-fun b!1135994 () Bool)

(declare-fun e!646598 () Bool)

(declare-fun call!49480 () ListLongMap!16051)

(declare-fun call!49481 () ListLongMap!16051)

(declare-fun -!1191 (ListLongMap!16051 (_ BitVec 64)) ListLongMap!16051)

(assert (=> b!1135994 (= e!646598 (= call!49481 (-!1191 call!49480 k0!934)))))

(declare-fun bm!49472 () Bool)

(assert (=> bm!49472 (= call!49479 call!49477)))

(declare-fun b!1135995 () Bool)

(declare-fun e!646594 () Bool)

(declare-fun e!646600 () Bool)

(assert (=> b!1135995 (= e!646594 e!646600)))

(declare-fun res!757997 () Bool)

(assert (=> b!1135995 (=> res!757997 e!646600)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1135995 (= res!757997 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43153)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504842 () array!73943)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!504835 () ListLongMap!16051)

(declare-fun getCurrentListMapNoExtraKeys!4553 (array!73941 array!73943 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 32) Int) ListLongMap!16051)

(assert (=> b!1135995 (= lt!504835 (getCurrentListMapNoExtraKeys!4553 lt!504840 lt!504842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2608 (Int (_ BitVec 64)) V!43153)

(assert (=> b!1135995 (= lt!504842 (array!73944 (store (arr!35616 _values!996) i!673 (ValueCellFull!13550 (dynLambda!2608 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36153 _values!996)))))

(declare-fun lt!504838 () ListLongMap!16051)

(assert (=> b!1135995 (= lt!504838 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135996 () Bool)

(declare-fun tp_is_empty!28519 () Bool)

(assert (=> b!1135996 (= e!646588 tp_is_empty!28519)))

(declare-fun b!1135997 () Bool)

(declare-fun e!646599 () Bool)

(declare-fun lt!504837 () Bool)

(assert (=> b!1135997 (= e!646599 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504837) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49473 () Bool)

(declare-fun call!49478 () ListLongMap!16051)

(assert (=> bm!49473 (= call!49478 call!49476)))

(declare-fun b!1135998 () Bool)

(declare-fun res!758011 () Bool)

(assert (=> b!1135998 (=> (not res!758011) (not e!646601))))

(declare-fun arrayNoDuplicates!0 (array!73941 (_ BitVec 32) List!24841) Bool)

(assert (=> b!1135998 (= res!758011 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun b!1135999 () Bool)

(declare-fun c!111219 () Bool)

(assert (=> b!1135999 (= c!111219 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504837))))

(declare-fun e!646592 () Unit!37143)

(assert (=> b!1135999 (= e!646602 e!646592)))

(declare-fun b!1136000 () Bool)

(declare-fun res!758002 () Bool)

(assert (=> b!1136000 (=> (not res!758002) (not e!646601))))

(assert (=> b!1136000 (= res!758002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136001 () Bool)

(assert (=> b!1136001 (= e!646597 true)))

(declare-fun lt!504849 () Bool)

(assert (=> b!1136001 (= lt!504849 (contains!6579 Nil!24838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!646595 () Bool)

(declare-fun b!1136002 () Bool)

(declare-fun arrayContainsKey!0 (array!73941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136002 (= e!646595 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44603 () Bool)

(declare-fun tp!84678 () Bool)

(declare-fun e!646591 () Bool)

(assert (=> mapNonEmpty!44603 (= mapRes!44603 (and tp!84678 e!646591))))

(declare-fun mapValue!44603 () ValueCell!13550)

(declare-fun mapKey!44603 () (_ BitVec 32))

(declare-fun mapRest!44603 () (Array (_ BitVec 32) ValueCell!13550))

(assert (=> mapNonEmpty!44603 (= (arr!35616 _values!996) (store mapRest!44603 mapKey!44603 mapValue!44603))))

(declare-fun lt!504847 () ListLongMap!16051)

(declare-fun c!111218 () Bool)

(declare-fun bm!49474 () Bool)

(declare-fun c!111220 () Bool)

(assert (=> bm!49474 (= call!49476 (+!3498 lt!504847 (ite (or c!111220 c!111218) (tuple2!18075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136003 () Bool)

(declare-fun e!646593 () Bool)

(assert (=> b!1136003 (= e!646593 e!646597)))

(declare-fun res!757996 () Bool)

(assert (=> b!1136003 (=> res!757996 e!646597)))

(assert (=> b!1136003 (= res!757996 (or (bvsge (size!36152 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36152 _keys!1208)) (bvsge from!1455 (size!36152 _keys!1208))))))

(assert (=> b!1136003 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24838)))

(declare-fun lt!504846 () Unit!37143)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73941 (_ BitVec 32) (_ BitVec 32)) Unit!37143)

(assert (=> b!1136003 (= lt!504846 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136003 e!646595))

(declare-fun res!758009 () Bool)

(assert (=> b!1136003 (=> (not res!758009) (not e!646595))))

(assert (=> b!1136003 (= res!758009 e!646599)))

(declare-fun c!111221 () Bool)

(assert (=> b!1136003 (= c!111221 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504839 () Unit!37143)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!334 (array!73941 array!73943 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 64) (_ BitVec 32) Int) Unit!37143)

(assert (=> b!1136003 (= lt!504839 (lemmaListMapContainsThenArrayContainsFrom!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504848 () Unit!37143)

(assert (=> b!1136003 (= lt!504848 e!646596)))

(assert (=> b!1136003 (= c!111220 (and (not lt!504837) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136003 (= lt!504837 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49475 () Bool)

(assert (=> bm!49475 (= call!49475 call!49482)))

(declare-fun mapIsEmpty!44603 () Bool)

(assert (=> mapIsEmpty!44603 mapRes!44603))

(declare-fun b!1136004 () Bool)

(assert (=> b!1136004 (= e!646596 e!646602)))

(assert (=> b!1136004 (= c!111218 (and (not lt!504837) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136005 () Bool)

(declare-fun res!758003 () Bool)

(assert (=> b!1136005 (=> (not res!758003) (not e!646587))))

(assert (=> b!1136005 (= res!758003 (arrayNoDuplicates!0 lt!504840 #b00000000000000000000000000000000 Nil!24838))))

(declare-fun b!1136006 () Bool)

(assert (=> b!1136006 (= e!646599 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49476 () Bool)

(assert (=> bm!49476 (= call!49477 (addStillContains!725 lt!504847 (ite (or c!111220 c!111218) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111220 c!111218) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1136007 () Bool)

(declare-fun res!758000 () Bool)

(assert (=> b!1136007 (=> (not res!758000) (not e!646601))))

(assert (=> b!1136007 (= res!758000 (= (select (arr!35615 _keys!1208) i!673) k0!934))))

(declare-fun b!1136008 () Bool)

(assert (=> b!1136008 (= e!646591 tp_is_empty!28519)))

(declare-fun b!1136009 () Bool)

(declare-fun res!758004 () Bool)

(assert (=> b!1136009 (=> res!758004 e!646597)))

(declare-fun noDuplicate!1608 (List!24841) Bool)

(assert (=> b!1136009 (= res!758004 (not (noDuplicate!1608 Nil!24838)))))

(declare-fun bm!49477 () Bool)

(assert (=> bm!49477 (= call!49480 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136010 () Bool)

(declare-fun res!758005 () Bool)

(assert (=> b!1136010 (=> (not res!758005) (not e!646601))))

(assert (=> b!1136010 (= res!758005 (and (= (size!36153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36152 _keys!1208) (size!36153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136011 () Bool)

(declare-fun lt!504845 () Unit!37143)

(assert (=> b!1136011 (= e!646592 lt!504845)))

(assert (=> b!1136011 (= lt!504845 call!49479)))

(assert (=> b!1136011 call!49475))

(declare-fun b!1136012 () Bool)

(declare-fun Unit!37145 () Unit!37143)

(assert (=> b!1136012 (= e!646592 Unit!37145)))

(declare-fun b!1136013 () Bool)

(declare-fun e!646603 () Bool)

(assert (=> b!1136013 (= e!646603 e!646593)))

(declare-fun res!758013 () Bool)

(assert (=> b!1136013 (=> res!758013 e!646593)))

(assert (=> b!1136013 (= res!758013 (not (contains!6580 lt!504847 k0!934)))))

(assert (=> b!1136013 (= lt!504847 (getCurrentListMapNoExtraKeys!4553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136014 () Bool)

(assert (=> b!1136014 (= e!646587 (not e!646594))))

(declare-fun res!758010 () Bool)

(assert (=> b!1136014 (=> res!758010 e!646594)))

(assert (=> b!1136014 (= res!758010 (bvsgt from!1455 i!673))))

(assert (=> b!1136014 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504850 () Unit!37143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73941 (_ BitVec 64) (_ BitVec 32)) Unit!37143)

(assert (=> b!1136014 (= lt!504850 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49478 () Bool)

(assert (=> bm!49478 (= call!49482 (contains!6580 (ite c!111220 lt!504844 call!49478) k0!934))))

(declare-fun b!1136015 () Bool)

(assert (=> b!1136015 (= e!646598 (= call!49481 call!49480))))

(declare-fun res!757998 () Bool)

(assert (=> start!98620 (=> (not res!757998) (not e!646601))))

(assert (=> start!98620 (= res!757998 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36152 _keys!1208))))))

(assert (=> start!98620 e!646601))

(assert (=> start!98620 tp_is_empty!28519))

(declare-fun array_inv!27366 (array!73941) Bool)

(assert (=> start!98620 (array_inv!27366 _keys!1208)))

(assert (=> start!98620 true))

(assert (=> start!98620 tp!84677))

(declare-fun array_inv!27367 (array!73943) Bool)

(assert (=> start!98620 (and (array_inv!27367 _values!996) e!646590)))

(declare-fun b!1136016 () Bool)

(assert (=> b!1136016 (= e!646600 e!646603)))

(declare-fun res!758006 () Bool)

(assert (=> b!1136016 (=> res!758006 e!646603)))

(assert (=> b!1136016 (= res!758006 (not (= (select (arr!35615 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136016 e!646598))

(declare-fun c!111222 () Bool)

(assert (=> b!1136016 (= c!111222 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504841 () Unit!37143)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!447 (array!73941 array!73943 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37143)

(assert (=> b!1136016 (= lt!504841 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49479 () Bool)

(assert (=> bm!49479 (= call!49481 (getCurrentListMapNoExtraKeys!4553 lt!504840 lt!504842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98620 res!757998) b!1135992))

(assert (= (and b!1135992 res!758001) b!1136010))

(assert (= (and b!1136010 res!758005) b!1136000))

(assert (= (and b!1136000 res!758002) b!1135998))

(assert (= (and b!1135998 res!758011) b!1135988))

(assert (= (and b!1135988 res!758008) b!1135987))

(assert (= (and b!1135987 res!758007) b!1136007))

(assert (= (and b!1136007 res!758000) b!1135993))

(assert (= (and b!1135993 res!758012) b!1136005))

(assert (= (and b!1136005 res!758003) b!1136014))

(assert (= (and b!1136014 (not res!758010)) b!1135995))

(assert (= (and b!1135995 (not res!757997)) b!1136016))

(assert (= (and b!1136016 c!111222) b!1135994))

(assert (= (and b!1136016 (not c!111222)) b!1136015))

(assert (= (or b!1135994 b!1136015) bm!49479))

(assert (= (or b!1135994 b!1136015) bm!49477))

(assert (= (and b!1136016 (not res!758006)) b!1136013))

(assert (= (and b!1136013 (not res!758013)) b!1136003))

(assert (= (and b!1136003 c!111220) b!1135990))

(assert (= (and b!1136003 (not c!111220)) b!1136004))

(assert (= (and b!1136004 c!111218) b!1135989))

(assert (= (and b!1136004 (not c!111218)) b!1135999))

(assert (= (and b!1135999 c!111219) b!1136011))

(assert (= (and b!1135999 (not c!111219)) b!1136012))

(assert (= (or b!1135989 b!1136011) bm!49472))

(assert (= (or b!1135989 b!1136011) bm!49473))

(assert (= (or b!1135989 b!1136011) bm!49475))

(assert (= (or b!1135990 bm!49475) bm!49478))

(assert (= (or b!1135990 bm!49472) bm!49476))

(assert (= (or b!1135990 bm!49473) bm!49474))

(assert (= (and b!1136003 c!111221) b!1136006))

(assert (= (and b!1136003 (not c!111221)) b!1135997))

(assert (= (and b!1136003 res!758009) b!1136002))

(assert (= (and b!1136003 (not res!757996)) b!1136009))

(assert (= (and b!1136009 (not res!758004)) b!1135986))

(assert (= (and b!1135986 (not res!757999)) b!1136001))

(assert (= (and b!1135991 condMapEmpty!44603) mapIsEmpty!44603))

(assert (= (and b!1135991 (not condMapEmpty!44603)) mapNonEmpty!44603))

(get-info :version)

(assert (= (and mapNonEmpty!44603 ((_ is ValueCellFull!13550) mapValue!44603)) b!1136008))

(assert (= (and b!1135991 ((_ is ValueCellFull!13550) mapDefault!44603)) b!1135996))

(assert (= start!98620 b!1135991))

(declare-fun b_lambda!19089 () Bool)

(assert (=> (not b_lambda!19089) (not b!1135995)))

(declare-fun t!35813 () Bool)

(declare-fun tb!8793 () Bool)

(assert (=> (and start!98620 (= defaultEntry!1004 defaultEntry!1004) t!35813) tb!8793))

(declare-fun result!18159 () Bool)

(assert (=> tb!8793 (= result!18159 tp_is_empty!28519)))

(assert (=> b!1135995 t!35813))

(declare-fun b_and!38831 () Bool)

(assert (= b_and!38829 (and (=> t!35813 result!18159) b_and!38831)))

(declare-fun m!1049019 () Bool)

(assert (=> b!1136005 m!1049019))

(declare-fun m!1049021 () Bool)

(assert (=> b!1136000 m!1049021))

(declare-fun m!1049023 () Bool)

(assert (=> b!1136016 m!1049023))

(declare-fun m!1049025 () Bool)

(assert (=> b!1136016 m!1049025))

(declare-fun m!1049027 () Bool)

(assert (=> b!1135993 m!1049027))

(declare-fun m!1049029 () Bool)

(assert (=> b!1135993 m!1049029))

(declare-fun m!1049031 () Bool)

(assert (=> b!1135992 m!1049031))

(declare-fun m!1049033 () Bool)

(assert (=> b!1135994 m!1049033))

(declare-fun m!1049035 () Bool)

(assert (=> b!1135990 m!1049035))

(declare-fun m!1049037 () Bool)

(assert (=> b!1135990 m!1049037))

(assert (=> b!1135990 m!1049037))

(declare-fun m!1049039 () Bool)

(assert (=> b!1135990 m!1049039))

(declare-fun m!1049041 () Bool)

(assert (=> b!1136002 m!1049041))

(declare-fun m!1049043 () Bool)

(assert (=> bm!49477 m!1049043))

(declare-fun m!1049045 () Bool)

(assert (=> b!1135998 m!1049045))

(declare-fun m!1049047 () Bool)

(assert (=> mapNonEmpty!44603 m!1049047))

(declare-fun m!1049049 () Bool)

(assert (=> bm!49474 m!1049049))

(declare-fun m!1049051 () Bool)

(assert (=> b!1136007 m!1049051))

(declare-fun m!1049053 () Bool)

(assert (=> b!1136001 m!1049053))

(declare-fun m!1049055 () Bool)

(assert (=> b!1135995 m!1049055))

(declare-fun m!1049057 () Bool)

(assert (=> b!1135995 m!1049057))

(declare-fun m!1049059 () Bool)

(assert (=> b!1135995 m!1049059))

(declare-fun m!1049061 () Bool)

(assert (=> b!1135995 m!1049061))

(declare-fun m!1049063 () Bool)

(assert (=> b!1136014 m!1049063))

(declare-fun m!1049065 () Bool)

(assert (=> b!1136014 m!1049065))

(assert (=> b!1136006 m!1049041))

(declare-fun m!1049067 () Bool)

(assert (=> b!1136013 m!1049067))

(assert (=> b!1136013 m!1049043))

(declare-fun m!1049069 () Bool)

(assert (=> b!1136009 m!1049069))

(declare-fun m!1049071 () Bool)

(assert (=> start!98620 m!1049071))

(declare-fun m!1049073 () Bool)

(assert (=> start!98620 m!1049073))

(declare-fun m!1049075 () Bool)

(assert (=> bm!49479 m!1049075))

(declare-fun m!1049077 () Bool)

(assert (=> bm!49478 m!1049077))

(declare-fun m!1049079 () Bool)

(assert (=> b!1135986 m!1049079))

(declare-fun m!1049081 () Bool)

(assert (=> bm!49476 m!1049081))

(declare-fun m!1049083 () Bool)

(assert (=> b!1135987 m!1049083))

(declare-fun m!1049085 () Bool)

(assert (=> b!1136003 m!1049085))

(declare-fun m!1049087 () Bool)

(assert (=> b!1136003 m!1049087))

(declare-fun m!1049089 () Bool)

(assert (=> b!1136003 m!1049089))

(check-sat (not bm!49478) (not bm!49474) (not b!1136003) (not b!1135993) (not b!1135998) (not b!1135992) (not b!1136002) (not b!1135990) b_and!38831 (not b!1136009) (not b_next!23989) (not b!1136000) (not mapNonEmpty!44603) (not b!1136013) (not b!1135994) (not b!1136014) (not b!1136005) (not b!1136006) (not bm!49477) tp_is_empty!28519 (not b!1135986) (not bm!49476) (not b!1136001) (not bm!49479) (not b_lambda!19089) (not start!98620) (not b!1136016) (not b!1135987) (not b!1135995))
(check-sat b_and!38831 (not b_next!23989))
