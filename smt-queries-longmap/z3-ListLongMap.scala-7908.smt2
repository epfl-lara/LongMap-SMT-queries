; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98194 () Bool)

(assert start!98194)

(declare-fun b_free!23895 () Bool)

(declare-fun b_next!23895 () Bool)

(assert (=> start!98194 (= b_free!23895 (not b_next!23895))))

(declare-fun tp!84388 () Bool)

(declare-fun b_and!38573 () Bool)

(assert (=> start!98194 (= tp!84388 b_and!38573)))

(declare-fun bm!48210 () Bool)

(declare-datatypes ((V!43027 0))(
  ( (V!43028 (val!14269 Int)) )
))
(declare-datatypes ((tuple2!17972 0))(
  ( (tuple2!17973 (_1!8997 (_ BitVec 64)) (_2!8997 V!43027)) )
))
(declare-datatypes ((List!24736 0))(
  ( (Nil!24733) (Cons!24732 (h!25941 tuple2!17972) (t!35623 List!24736)) )
))
(declare-datatypes ((ListLongMap!15941 0))(
  ( (ListLongMap!15942 (toList!7986 List!24736)) )
))
(declare-fun call!48217 () ListLongMap!15941)

(declare-fun call!48216 () ListLongMap!15941)

(assert (=> bm!48210 (= call!48217 call!48216)))

(declare-fun b!1129996 () Bool)

(declare-fun res!755057 () Bool)

(declare-fun e!643107 () Bool)

(assert (=> b!1129996 (=> (not res!755057) (not e!643107))))

(declare-datatypes ((array!73707 0))(
  ( (array!73708 (arr!35506 (Array (_ BitVec 32) (_ BitVec 64))) (size!36042 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73707)

(declare-datatypes ((List!24737 0))(
  ( (Nil!24734) (Cons!24733 (h!25942 (_ BitVec 64)) (t!35624 List!24737)) )
))
(declare-fun arrayNoDuplicates!0 (array!73707 (_ BitVec 32) List!24737) Bool)

(assert (=> b!1129996 (= res!755057 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24734))))

(declare-fun mapNonEmpty!44455 () Bool)

(declare-fun mapRes!44455 () Bool)

(declare-fun tp!84389 () Bool)

(declare-fun e!643106 () Bool)

(assert (=> mapNonEmpty!44455 (= mapRes!44455 (and tp!84389 e!643106))))

(declare-datatypes ((ValueCell!13503 0))(
  ( (ValueCellFull!13503 (v!16902 V!43027)) (EmptyCell!13503) )
))
(declare-fun mapRest!44455 () (Array (_ BitVec 32) ValueCell!13503))

(declare-fun mapValue!44455 () ValueCell!13503)

(declare-datatypes ((array!73709 0))(
  ( (array!73710 (arr!35507 (Array (_ BitVec 32) ValueCell!13503)) (size!36043 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73709)

(declare-fun mapKey!44455 () (_ BitVec 32))

(assert (=> mapNonEmpty!44455 (= (arr!35507 _values!996) (store mapRest!44455 mapKey!44455 mapValue!44455))))

(declare-fun bm!48211 () Bool)

(declare-datatypes ((Unit!37017 0))(
  ( (Unit!37018) )
))
(declare-fun call!48214 () Unit!37017)

(declare-fun call!48213 () Unit!37017)

(assert (=> bm!48211 (= call!48214 call!48213)))

(declare-fun e!643101 () Bool)

(declare-fun call!48220 () ListLongMap!15941)

(declare-fun call!48215 () ListLongMap!15941)

(declare-fun b!1129997 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1165 (ListLongMap!15941 (_ BitVec 64)) ListLongMap!15941)

(assert (=> b!1129997 (= e!643101 (= call!48215 (-!1165 call!48220 k0!934)))))

(declare-fun zeroValue!944 () V!43027)

(declare-fun lt!501749 () array!73707)

(declare-fun bm!48212 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!501741 () array!73709)

(declare-fun minValue!944 () V!43027)

(declare-fun getCurrentListMapNoExtraKeys!4473 (array!73707 array!73709 (_ BitVec 32) (_ BitVec 32) V!43027 V!43027 (_ BitVec 32) Int) ListLongMap!15941)

(assert (=> bm!48212 (= call!48215 (getCurrentListMapNoExtraKeys!4473 lt!501749 lt!501741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129998 () Bool)

(declare-fun e!643102 () Unit!37017)

(declare-fun lt!501742 () Unit!37017)

(assert (=> b!1129998 (= e!643102 lt!501742)))

(assert (=> b!1129998 (= lt!501742 call!48214)))

(declare-fun call!48218 () Bool)

(assert (=> b!1129998 call!48218))

(declare-fun b!1129999 () Bool)

(declare-fun res!755059 () Bool)

(assert (=> b!1129999 (=> (not res!755059) (not e!643107))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129999 (= res!755059 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36042 _keys!1208))))))

(declare-fun bm!48213 () Bool)

(declare-fun lt!501743 () ListLongMap!15941)

(declare-fun c!109957 () Bool)

(declare-fun c!109958 () Bool)

(declare-fun +!3436 (ListLongMap!15941 tuple2!17972) ListLongMap!15941)

(assert (=> bm!48213 (= call!48216 (+!3436 lt!501743 (ite (or c!109957 c!109958) (tuple2!17973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130000 () Bool)

(declare-fun res!755066 () Bool)

(assert (=> b!1130000 (=> (not res!755066) (not e!643107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130000 (= res!755066 (validKeyInArray!0 k0!934))))

(declare-fun b!1130001 () Bool)

(declare-fun e!643094 () Bool)

(declare-fun e!643096 () Bool)

(assert (=> b!1130001 (= e!643094 e!643096)))

(declare-fun res!755063 () Bool)

(assert (=> b!1130001 (=> res!755063 e!643096)))

(declare-fun contains!6509 (ListLongMap!15941 (_ BitVec 64)) Bool)

(assert (=> b!1130001 (= res!755063 (not (contains!6509 lt!501743 k0!934)))))

(assert (=> b!1130001 (= lt!501743 (getCurrentListMapNoExtraKeys!4473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130002 () Bool)

(declare-fun res!755058 () Bool)

(assert (=> b!1130002 (=> (not res!755058) (not e!643107))))

(assert (=> b!1130002 (= res!755058 (= (select (arr!35506 _keys!1208) i!673) k0!934))))

(declare-fun b!1130003 () Bool)

(declare-fun e!643105 () Bool)

(declare-fun e!643097 () Bool)

(assert (=> b!1130003 (= e!643105 e!643097)))

(declare-fun res!755064 () Bool)

(assert (=> b!1130003 (=> res!755064 e!643097)))

(assert (=> b!1130003 (= res!755064 (not (= from!1455 i!673)))))

(declare-fun lt!501745 () ListLongMap!15941)

(assert (=> b!1130003 (= lt!501745 (getCurrentListMapNoExtraKeys!4473 lt!501749 lt!501741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2550 (Int (_ BitVec 64)) V!43027)

(assert (=> b!1130003 (= lt!501741 (array!73710 (store (arr!35507 _values!996) i!673 (ValueCellFull!13503 (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36043 _values!996)))))

(declare-fun lt!501739 () ListLongMap!15941)

(assert (=> b!1130003 (= lt!501739 (getCurrentListMapNoExtraKeys!4473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!755055 () Bool)

(assert (=> start!98194 (=> (not res!755055) (not e!643107))))

(assert (=> start!98194 (= res!755055 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36042 _keys!1208))))))

(assert (=> start!98194 e!643107))

(declare-fun tp_is_empty!28425 () Bool)

(assert (=> start!98194 tp_is_empty!28425))

(declare-fun array_inv!27236 (array!73707) Bool)

(assert (=> start!98194 (array_inv!27236 _keys!1208)))

(assert (=> start!98194 true))

(assert (=> start!98194 tp!84388))

(declare-fun e!643095 () Bool)

(declare-fun array_inv!27237 (array!73709) Bool)

(assert (=> start!98194 (and (array_inv!27237 _values!996) e!643095)))

(declare-fun b!1130004 () Bool)

(declare-fun e!643098 () Bool)

(assert (=> b!1130004 (= e!643098 tp_is_empty!28425)))

(declare-fun b!1130005 () Bool)

(declare-fun c!109956 () Bool)

(declare-fun lt!501744 () Bool)

(assert (=> b!1130005 (= c!109956 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501744))))

(declare-fun e!643099 () Unit!37017)

(assert (=> b!1130005 (= e!643099 e!643102)))

(declare-fun bm!48214 () Bool)

(declare-fun call!48219 () Bool)

(assert (=> bm!48214 (= call!48218 call!48219)))

(declare-fun b!1130006 () Bool)

(declare-fun e!643104 () Unit!37017)

(declare-fun lt!501748 () Unit!37017)

(assert (=> b!1130006 (= e!643104 lt!501748)))

(declare-fun lt!501746 () Unit!37017)

(assert (=> b!1130006 (= lt!501746 call!48213)))

(declare-fun lt!501750 () ListLongMap!15941)

(assert (=> b!1130006 (= lt!501750 call!48216)))

(assert (=> b!1130006 call!48219))

(declare-fun addStillContains!698 (ListLongMap!15941 (_ BitVec 64) V!43027 (_ BitVec 64)) Unit!37017)

(assert (=> b!1130006 (= lt!501748 (addStillContains!698 lt!501750 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1130006 (contains!6509 (+!3436 lt!501750 (tuple2!17973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!48215 () Bool)

(assert (=> bm!48215 (= call!48220 (getCurrentListMapNoExtraKeys!4473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130007 () Bool)

(assert (=> b!1130007 (= e!643106 tp_is_empty!28425)))

(declare-fun b!1130008 () Bool)

(assert (=> b!1130008 (= e!643097 e!643094)))

(declare-fun res!755060 () Bool)

(assert (=> b!1130008 (=> res!755060 e!643094)))

(assert (=> b!1130008 (= res!755060 (not (= (select (arr!35506 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130008 e!643101))

(declare-fun c!109959 () Bool)

(assert (=> b!1130008 (= c!109959 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501752 () Unit!37017)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 (array!73707 array!73709 (_ BitVec 32) (_ BitVec 32) V!43027 V!43027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37017)

(assert (=> b!1130008 (= lt!501752 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130009 () Bool)

(declare-fun e!643093 () Bool)

(assert (=> b!1130009 (= e!643093 (not e!643105))))

(declare-fun res!755056 () Bool)

(assert (=> b!1130009 (=> res!755056 e!643105)))

(assert (=> b!1130009 (= res!755056 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130009 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501738 () Unit!37017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73707 (_ BitVec 64) (_ BitVec 32)) Unit!37017)

(assert (=> b!1130009 (= lt!501738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130010 () Bool)

(declare-fun e!643103 () Bool)

(assert (=> b!1130010 (= e!643096 e!643103)))

(declare-fun res!755054 () Bool)

(assert (=> b!1130010 (=> res!755054 e!643103)))

(assert (=> b!1130010 (= res!755054 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36042 _keys!1208))))))

(declare-fun lt!501751 () Unit!37017)

(assert (=> b!1130010 (= lt!501751 e!643104)))

(assert (=> b!1130010 (= c!109957 (and (not lt!501744) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130010 (= lt!501744 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130011 () Bool)

(declare-fun Unit!37019 () Unit!37017)

(assert (=> b!1130011 (= e!643102 Unit!37019)))

(declare-fun mapIsEmpty!44455 () Bool)

(assert (=> mapIsEmpty!44455 mapRes!44455))

(declare-fun b!1130012 () Bool)

(assert (=> b!1130012 (= e!643095 (and e!643098 mapRes!44455))))

(declare-fun condMapEmpty!44455 () Bool)

(declare-fun mapDefault!44455 () ValueCell!13503)

(assert (=> b!1130012 (= condMapEmpty!44455 (= (arr!35507 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13503)) mapDefault!44455)))))

(declare-fun b!1130013 () Bool)

(assert (=> b!1130013 (= e!643104 e!643099)))

(assert (=> b!1130013 (= c!109958 (and (not lt!501744) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130014 () Bool)

(declare-fun res!755065 () Bool)

(assert (=> b!1130014 (=> (not res!755065) (not e!643107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73707 (_ BitVec 32)) Bool)

(assert (=> b!1130014 (= res!755065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130015 () Bool)

(declare-fun res!755062 () Bool)

(assert (=> b!1130015 (=> (not res!755062) (not e!643107))))

(assert (=> b!1130015 (= res!755062 (and (= (size!36043 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36042 _keys!1208) (size!36043 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130016 () Bool)

(assert (=> b!1130016 (= e!643103 true)))

(declare-fun lt!501740 () Bool)

(declare-fun getCurrentListMap!4419 (array!73707 array!73709 (_ BitVec 32) (_ BitVec 32) V!43027 V!43027 (_ BitVec 32) Int) ListLongMap!15941)

(assert (=> b!1130016 (= lt!501740 (contains!6509 (getCurrentListMap!4419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130017 () Bool)

(assert (=> b!1130017 (= e!643101 (= call!48215 call!48220))))

(declare-fun b!1130018 () Bool)

(declare-fun res!755067 () Bool)

(assert (=> b!1130018 (=> (not res!755067) (not e!643107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130018 (= res!755067 (validMask!0 mask!1564))))

(declare-fun bm!48216 () Bool)

(assert (=> bm!48216 (= call!48219 (contains!6509 (ite c!109957 lt!501750 call!48217) k0!934))))

(declare-fun b!1130019 () Bool)

(assert (=> b!1130019 (= e!643107 e!643093)))

(declare-fun res!755068 () Bool)

(assert (=> b!1130019 (=> (not res!755068) (not e!643093))))

(assert (=> b!1130019 (= res!755068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501749 mask!1564))))

(assert (=> b!1130019 (= lt!501749 (array!73708 (store (arr!35506 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36042 _keys!1208)))))

(declare-fun b!1130020 () Bool)

(declare-fun res!755061 () Bool)

(assert (=> b!1130020 (=> (not res!755061) (not e!643093))))

(assert (=> b!1130020 (= res!755061 (arrayNoDuplicates!0 lt!501749 #b00000000000000000000000000000000 Nil!24734))))

(declare-fun bm!48217 () Bool)

(assert (=> bm!48217 (= call!48213 (addStillContains!698 lt!501743 (ite (or c!109957 c!109958) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109957 c!109958) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1130021 () Bool)

(assert (=> b!1130021 call!48218))

(declare-fun lt!501747 () Unit!37017)

(assert (=> b!1130021 (= lt!501747 call!48214)))

(assert (=> b!1130021 (= e!643099 lt!501747)))

(assert (= (and start!98194 res!755055) b!1130018))

(assert (= (and b!1130018 res!755067) b!1130015))

(assert (= (and b!1130015 res!755062) b!1130014))

(assert (= (and b!1130014 res!755065) b!1129996))

(assert (= (and b!1129996 res!755057) b!1129999))

(assert (= (and b!1129999 res!755059) b!1130000))

(assert (= (and b!1130000 res!755066) b!1130002))

(assert (= (and b!1130002 res!755058) b!1130019))

(assert (= (and b!1130019 res!755068) b!1130020))

(assert (= (and b!1130020 res!755061) b!1130009))

(assert (= (and b!1130009 (not res!755056)) b!1130003))

(assert (= (and b!1130003 (not res!755064)) b!1130008))

(assert (= (and b!1130008 c!109959) b!1129997))

(assert (= (and b!1130008 (not c!109959)) b!1130017))

(assert (= (or b!1129997 b!1130017) bm!48212))

(assert (= (or b!1129997 b!1130017) bm!48215))

(assert (= (and b!1130008 (not res!755060)) b!1130001))

(assert (= (and b!1130001 (not res!755063)) b!1130010))

(assert (= (and b!1130010 c!109957) b!1130006))

(assert (= (and b!1130010 (not c!109957)) b!1130013))

(assert (= (and b!1130013 c!109958) b!1130021))

(assert (= (and b!1130013 (not c!109958)) b!1130005))

(assert (= (and b!1130005 c!109956) b!1129998))

(assert (= (and b!1130005 (not c!109956)) b!1130011))

(assert (= (or b!1130021 b!1129998) bm!48211))

(assert (= (or b!1130021 b!1129998) bm!48210))

(assert (= (or b!1130021 b!1129998) bm!48214))

(assert (= (or b!1130006 bm!48214) bm!48216))

(assert (= (or b!1130006 bm!48211) bm!48217))

(assert (= (or b!1130006 bm!48210) bm!48213))

(assert (= (and b!1130010 (not res!755054)) b!1130016))

(assert (= (and b!1130012 condMapEmpty!44455) mapIsEmpty!44455))

(assert (= (and b!1130012 (not condMapEmpty!44455)) mapNonEmpty!44455))

(get-info :version)

(assert (= (and mapNonEmpty!44455 ((_ is ValueCellFull!13503) mapValue!44455)) b!1130007))

(assert (= (and b!1130012 ((_ is ValueCellFull!13503) mapDefault!44455)) b!1130004))

(assert (= start!98194 b!1130012))

(declare-fun b_lambda!18865 () Bool)

(assert (=> (not b_lambda!18865) (not b!1130003)))

(declare-fun t!35622 () Bool)

(declare-fun tb!8707 () Bool)

(assert (=> (and start!98194 (= defaultEntry!1004 defaultEntry!1004) t!35622) tb!8707))

(declare-fun result!17975 () Bool)

(assert (=> tb!8707 (= result!17975 tp_is_empty!28425)))

(assert (=> b!1130003 t!35622))

(declare-fun b_and!38575 () Bool)

(assert (= b_and!38573 (and (=> t!35622 result!17975) b_and!38575)))

(declare-fun m!1043251 () Bool)

(assert (=> bm!48213 m!1043251))

(declare-fun m!1043253 () Bool)

(assert (=> b!1130016 m!1043253))

(assert (=> b!1130016 m!1043253))

(declare-fun m!1043255 () Bool)

(assert (=> b!1130016 m!1043255))

(declare-fun m!1043257 () Bool)

(assert (=> b!1130003 m!1043257))

(declare-fun m!1043259 () Bool)

(assert (=> b!1130003 m!1043259))

(declare-fun m!1043261 () Bool)

(assert (=> b!1130003 m!1043261))

(declare-fun m!1043263 () Bool)

(assert (=> b!1130003 m!1043263))

(declare-fun m!1043265 () Bool)

(assert (=> b!1130001 m!1043265))

(declare-fun m!1043267 () Bool)

(assert (=> b!1130001 m!1043267))

(declare-fun m!1043269 () Bool)

(assert (=> mapNonEmpty!44455 m!1043269))

(declare-fun m!1043271 () Bool)

(assert (=> b!1130019 m!1043271))

(declare-fun m!1043273 () Bool)

(assert (=> b!1130019 m!1043273))

(declare-fun m!1043275 () Bool)

(assert (=> b!1130000 m!1043275))

(declare-fun m!1043277 () Bool)

(assert (=> bm!48216 m!1043277))

(assert (=> bm!48215 m!1043267))

(declare-fun m!1043279 () Bool)

(assert (=> b!1130018 m!1043279))

(declare-fun m!1043281 () Bool)

(assert (=> b!1130008 m!1043281))

(declare-fun m!1043283 () Bool)

(assert (=> b!1130008 m!1043283))

(declare-fun m!1043285 () Bool)

(assert (=> start!98194 m!1043285))

(declare-fun m!1043287 () Bool)

(assert (=> start!98194 m!1043287))

(declare-fun m!1043289 () Bool)

(assert (=> b!1130014 m!1043289))

(declare-fun m!1043291 () Bool)

(assert (=> b!1130020 m!1043291))

(declare-fun m!1043293 () Bool)

(assert (=> b!1129997 m!1043293))

(declare-fun m!1043295 () Bool)

(assert (=> b!1130009 m!1043295))

(declare-fun m!1043297 () Bool)

(assert (=> b!1130009 m!1043297))

(declare-fun m!1043299 () Bool)

(assert (=> b!1130002 m!1043299))

(declare-fun m!1043301 () Bool)

(assert (=> b!1129996 m!1043301))

(declare-fun m!1043303 () Bool)

(assert (=> b!1130006 m!1043303))

(declare-fun m!1043305 () Bool)

(assert (=> b!1130006 m!1043305))

(assert (=> b!1130006 m!1043305))

(declare-fun m!1043307 () Bool)

(assert (=> b!1130006 m!1043307))

(declare-fun m!1043309 () Bool)

(assert (=> bm!48217 m!1043309))

(declare-fun m!1043311 () Bool)

(assert (=> bm!48212 m!1043311))

(check-sat b_and!38575 (not b!1130009) (not b!1130006) (not b!1130016) (not bm!48216) (not b!1129996) (not b!1130001) (not b!1130020) (not b_lambda!18865) (not start!98194) (not b!1130014) (not b!1130000) (not b!1130019) (not b!1130003) (not bm!48212) tp_is_empty!28425 (not bm!48215) (not b!1129997) (not bm!48213) (not b!1130018) (not mapNonEmpty!44455) (not bm!48217) (not b!1130008) (not b_next!23895))
(check-sat b_and!38575 (not b_next!23895))
