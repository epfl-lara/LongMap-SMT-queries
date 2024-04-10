; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98032 () Bool)

(assert start!98032)

(declare-fun b_free!23733 () Bool)

(declare-fun b_next!23733 () Bool)

(assert (=> start!98032 (= b_free!23733 (not b_next!23733))))

(declare-fun tp!83902 () Bool)

(declare-fun b_and!38249 () Bool)

(assert (=> start!98032 (= tp!83902 b_and!38249)))

(declare-fun res!751753 () Bool)

(declare-fun e!640441 () Bool)

(assert (=> start!98032 (=> (not res!751753) (not e!640441))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73391 0))(
  ( (array!73392 (arr!35348 (Array (_ BitVec 32) (_ BitVec 64))) (size!35884 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73391)

(assert (=> start!98032 (= res!751753 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35884 _keys!1208))))))

(assert (=> start!98032 e!640441))

(declare-fun tp_is_empty!28263 () Bool)

(assert (=> start!98032 tp_is_empty!28263))

(declare-fun array_inv!27134 (array!73391) Bool)

(assert (=> start!98032 (array_inv!27134 _keys!1208)))

(assert (=> start!98032 true))

(assert (=> start!98032 tp!83902))

(declare-datatypes ((V!42811 0))(
  ( (V!42812 (val!14188 Int)) )
))
(declare-datatypes ((ValueCell!13422 0))(
  ( (ValueCellFull!13422 (v!16821 V!42811)) (EmptyCell!13422) )
))
(declare-datatypes ((array!73393 0))(
  ( (array!73394 (arr!35349 (Array (_ BitVec 32) ValueCell!13422)) (size!35885 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73393)

(declare-fun e!640443 () Bool)

(declare-fun array_inv!27135 (array!73393) Bool)

(assert (=> start!98032 (and (array_inv!27135 _values!996) e!640443)))

(declare-fun b!1125070 () Bool)

(declare-fun res!751764 () Bool)

(assert (=> b!1125070 (=> (not res!751764) (not e!640441))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1125070 (= res!751764 (= (select (arr!35348 _keys!1208) i!673) k0!934))))

(declare-fun b!1125071 () Bool)

(declare-fun e!640438 () Bool)

(declare-fun e!640439 () Bool)

(assert (=> b!1125071 (= e!640438 e!640439)))

(declare-fun res!751759 () Bool)

(assert (=> b!1125071 (=> res!751759 e!640439)))

(assert (=> b!1125071 (= res!751759 (not (= (select (arr!35348 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640440 () Bool)

(assert (=> b!1125071 e!640440))

(declare-fun c!109590 () Bool)

(assert (=> b!1125071 (= c!109590 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42811)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36876 0))(
  ( (Unit!36877) )
))
(declare-fun lt!499710 () Unit!36876)

(declare-fun minValue!944 () V!42811)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!362 (array!73391 array!73393 (_ BitVec 32) (_ BitVec 32) V!42811 V!42811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36876)

(assert (=> b!1125071 (= lt!499710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125072 () Bool)

(declare-fun e!640446 () Bool)

(assert (=> b!1125072 (= e!640441 e!640446)))

(declare-fun res!751754 () Bool)

(assert (=> b!1125072 (=> (not res!751754) (not e!640446))))

(declare-fun lt!499709 () array!73391)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73391 (_ BitVec 32)) Bool)

(assert (=> b!1125072 (= res!751754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499709 mask!1564))))

(assert (=> b!1125072 (= lt!499709 (array!73392 (store (arr!35348 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35884 _keys!1208)))))

(declare-fun b!1125073 () Bool)

(declare-fun res!751765 () Bool)

(assert (=> b!1125073 (=> (not res!751765) (not e!640441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125073 (= res!751765 (validKeyInArray!0 k0!934))))

(declare-fun b!1125074 () Bool)

(declare-fun e!640437 () Bool)

(assert (=> b!1125074 (= e!640437 tp_is_empty!28263)))

(declare-fun b!1125075 () Bool)

(declare-fun res!751763 () Bool)

(assert (=> b!1125075 (=> (not res!751763) (not e!640441))))

(assert (=> b!1125075 (= res!751763 (and (= (size!35885 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35884 _keys!1208) (size!35885 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125076 () Bool)

(declare-fun e!640442 () Bool)

(assert (=> b!1125076 (= e!640439 e!640442)))

(declare-fun res!751752 () Bool)

(assert (=> b!1125076 (=> res!751752 e!640442)))

(declare-datatypes ((tuple2!17826 0))(
  ( (tuple2!17827 (_1!8924 (_ BitVec 64)) (_2!8924 V!42811)) )
))
(declare-datatypes ((List!24606 0))(
  ( (Nil!24603) (Cons!24602 (h!25811 tuple2!17826) (t!35331 List!24606)) )
))
(declare-datatypes ((ListLongMap!15795 0))(
  ( (ListLongMap!15796 (toList!7913 List!24606)) )
))
(declare-fun lt!499706 () ListLongMap!15795)

(declare-fun contains!6450 (ListLongMap!15795 (_ BitVec 64)) Bool)

(assert (=> b!1125076 (= res!751752 (not (contains!6450 lt!499706 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4401 (array!73391 array!73393 (_ BitVec 32) (_ BitVec 32) V!42811 V!42811 (_ BitVec 32) Int) ListLongMap!15795)

(assert (=> b!1125076 (= lt!499706 (getCurrentListMapNoExtraKeys!4401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47478 () Bool)

(declare-fun call!47481 () ListLongMap!15795)

(assert (=> bm!47478 (= call!47481 (getCurrentListMapNoExtraKeys!4401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125077 () Bool)

(declare-fun res!751761 () Bool)

(assert (=> b!1125077 (=> (not res!751761) (not e!640446))))

(declare-datatypes ((List!24607 0))(
  ( (Nil!24604) (Cons!24603 (h!25812 (_ BitVec 64)) (t!35332 List!24607)) )
))
(declare-fun arrayNoDuplicates!0 (array!73391 (_ BitVec 32) List!24607) Bool)

(assert (=> b!1125077 (= res!751761 (arrayNoDuplicates!0 lt!499709 #b00000000000000000000000000000000 Nil!24604))))

(declare-fun b!1125078 () Bool)

(declare-fun e!640444 () Bool)

(assert (=> b!1125078 (= e!640446 (not e!640444))))

(declare-fun res!751758 () Bool)

(assert (=> b!1125078 (=> res!751758 e!640444)))

(assert (=> b!1125078 (= res!751758 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125078 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499712 () Unit!36876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73391 (_ BitVec 64) (_ BitVec 32)) Unit!36876)

(assert (=> b!1125078 (= lt!499712 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44212 () Bool)

(declare-fun mapRes!44212 () Bool)

(assert (=> mapIsEmpty!44212 mapRes!44212))

(declare-fun b!1125079 () Bool)

(assert (=> b!1125079 (= e!640442 true)))

(declare-fun +!3420 (ListLongMap!15795 tuple2!17826) ListLongMap!15795)

(assert (=> b!1125079 (contains!6450 (+!3420 lt!499706 (tuple2!17827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499705 () Unit!36876)

(declare-fun addStillContains!682 (ListLongMap!15795 (_ BitVec 64) V!42811 (_ BitVec 64)) Unit!36876)

(assert (=> b!1125079 (= lt!499705 (addStillContains!682 lt!499706 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125080 () Bool)

(declare-fun res!751751 () Bool)

(assert (=> b!1125080 (=> (not res!751751) (not e!640441))))

(assert (=> b!1125080 (= res!751751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125081 () Bool)

(declare-fun res!751756 () Bool)

(assert (=> b!1125081 (=> res!751756 e!640442)))

(assert (=> b!1125081 (= res!751756 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125082 () Bool)

(declare-fun res!751755 () Bool)

(assert (=> b!1125082 (=> (not res!751755) (not e!640441))))

(assert (=> b!1125082 (= res!751755 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24604))))

(declare-fun b!1125083 () Bool)

(declare-fun res!751762 () Bool)

(assert (=> b!1125083 (=> (not res!751762) (not e!640441))))

(assert (=> b!1125083 (= res!751762 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35884 _keys!1208))))))

(declare-fun b!1125084 () Bool)

(assert (=> b!1125084 (= e!640443 (and e!640437 mapRes!44212))))

(declare-fun condMapEmpty!44212 () Bool)

(declare-fun mapDefault!44212 () ValueCell!13422)

(assert (=> b!1125084 (= condMapEmpty!44212 (= (arr!35349 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13422)) mapDefault!44212)))))

(declare-fun call!47482 () ListLongMap!15795)

(declare-fun b!1125085 () Bool)

(declare-fun -!1115 (ListLongMap!15795 (_ BitVec 64)) ListLongMap!15795)

(assert (=> b!1125085 (= e!640440 (= call!47482 (-!1115 call!47481 k0!934)))))

(declare-fun b!1125086 () Bool)

(assert (=> b!1125086 (= e!640444 e!640438)))

(declare-fun res!751757 () Bool)

(assert (=> b!1125086 (=> res!751757 e!640438)))

(assert (=> b!1125086 (= res!751757 (not (= from!1455 i!673)))))

(declare-fun lt!499711 () array!73393)

(declare-fun lt!499708 () ListLongMap!15795)

(assert (=> b!1125086 (= lt!499708 (getCurrentListMapNoExtraKeys!4401 lt!499709 lt!499711 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2494 (Int (_ BitVec 64)) V!42811)

(assert (=> b!1125086 (= lt!499711 (array!73394 (store (arr!35349 _values!996) i!673 (ValueCellFull!13422 (dynLambda!2494 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35885 _values!996)))))

(declare-fun lt!499707 () ListLongMap!15795)

(assert (=> b!1125086 (= lt!499707 (getCurrentListMapNoExtraKeys!4401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125087 () Bool)

(assert (=> b!1125087 (= e!640440 (= call!47482 call!47481))))

(declare-fun bm!47479 () Bool)

(assert (=> bm!47479 (= call!47482 (getCurrentListMapNoExtraKeys!4401 lt!499709 lt!499711 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44212 () Bool)

(declare-fun tp!83903 () Bool)

(declare-fun e!640436 () Bool)

(assert (=> mapNonEmpty!44212 (= mapRes!44212 (and tp!83903 e!640436))))

(declare-fun mapKey!44212 () (_ BitVec 32))

(declare-fun mapRest!44212 () (Array (_ BitVec 32) ValueCell!13422))

(declare-fun mapValue!44212 () ValueCell!13422)

(assert (=> mapNonEmpty!44212 (= (arr!35349 _values!996) (store mapRest!44212 mapKey!44212 mapValue!44212))))

(declare-fun b!1125088 () Bool)

(assert (=> b!1125088 (= e!640436 tp_is_empty!28263)))

(declare-fun b!1125089 () Bool)

(declare-fun res!751760 () Bool)

(assert (=> b!1125089 (=> (not res!751760) (not e!640441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125089 (= res!751760 (validMask!0 mask!1564))))

(assert (= (and start!98032 res!751753) b!1125089))

(assert (= (and b!1125089 res!751760) b!1125075))

(assert (= (and b!1125075 res!751763) b!1125080))

(assert (= (and b!1125080 res!751751) b!1125082))

(assert (= (and b!1125082 res!751755) b!1125083))

(assert (= (and b!1125083 res!751762) b!1125073))

(assert (= (and b!1125073 res!751765) b!1125070))

(assert (= (and b!1125070 res!751764) b!1125072))

(assert (= (and b!1125072 res!751754) b!1125077))

(assert (= (and b!1125077 res!751761) b!1125078))

(assert (= (and b!1125078 (not res!751758)) b!1125086))

(assert (= (and b!1125086 (not res!751757)) b!1125071))

(assert (= (and b!1125071 c!109590) b!1125085))

(assert (= (and b!1125071 (not c!109590)) b!1125087))

(assert (= (or b!1125085 b!1125087) bm!47479))

(assert (= (or b!1125085 b!1125087) bm!47478))

(assert (= (and b!1125071 (not res!751759)) b!1125076))

(assert (= (and b!1125076 (not res!751752)) b!1125081))

(assert (= (and b!1125081 (not res!751756)) b!1125079))

(assert (= (and b!1125084 condMapEmpty!44212) mapIsEmpty!44212))

(assert (= (and b!1125084 (not condMapEmpty!44212)) mapNonEmpty!44212))

(get-info :version)

(assert (= (and mapNonEmpty!44212 ((_ is ValueCellFull!13422) mapValue!44212)) b!1125088))

(assert (= (and b!1125084 ((_ is ValueCellFull!13422) mapDefault!44212)) b!1125074))

(assert (= start!98032 b!1125084))

(declare-fun b_lambda!18703 () Bool)

(assert (=> (not b_lambda!18703) (not b!1125086)))

(declare-fun t!35330 () Bool)

(declare-fun tb!8545 () Bool)

(assert (=> (and start!98032 (= defaultEntry!1004 defaultEntry!1004) t!35330) tb!8545))

(declare-fun result!17651 () Bool)

(assert (=> tb!8545 (= result!17651 tp_is_empty!28263)))

(assert (=> b!1125086 t!35330))

(declare-fun b_and!38251 () Bool)

(assert (= b_and!38249 (and (=> t!35330 result!17651) b_and!38251)))

(declare-fun m!1039267 () Bool)

(assert (=> b!1125072 m!1039267))

(declare-fun m!1039269 () Bool)

(assert (=> b!1125072 m!1039269))

(declare-fun m!1039271 () Bool)

(assert (=> b!1125071 m!1039271))

(declare-fun m!1039273 () Bool)

(assert (=> b!1125071 m!1039273))

(declare-fun m!1039275 () Bool)

(assert (=> b!1125089 m!1039275))

(declare-fun m!1039277 () Bool)

(assert (=> b!1125076 m!1039277))

(declare-fun m!1039279 () Bool)

(assert (=> b!1125076 m!1039279))

(declare-fun m!1039281 () Bool)

(assert (=> b!1125085 m!1039281))

(declare-fun m!1039283 () Bool)

(assert (=> b!1125086 m!1039283))

(declare-fun m!1039285 () Bool)

(assert (=> b!1125086 m!1039285))

(declare-fun m!1039287 () Bool)

(assert (=> b!1125086 m!1039287))

(declare-fun m!1039289 () Bool)

(assert (=> b!1125086 m!1039289))

(declare-fun m!1039291 () Bool)

(assert (=> start!98032 m!1039291))

(declare-fun m!1039293 () Bool)

(assert (=> start!98032 m!1039293))

(declare-fun m!1039295 () Bool)

(assert (=> b!1125082 m!1039295))

(declare-fun m!1039297 () Bool)

(assert (=> b!1125073 m!1039297))

(assert (=> bm!47478 m!1039279))

(declare-fun m!1039299 () Bool)

(assert (=> mapNonEmpty!44212 m!1039299))

(declare-fun m!1039301 () Bool)

(assert (=> b!1125080 m!1039301))

(declare-fun m!1039303 () Bool)

(assert (=> b!1125079 m!1039303))

(assert (=> b!1125079 m!1039303))

(declare-fun m!1039305 () Bool)

(assert (=> b!1125079 m!1039305))

(declare-fun m!1039307 () Bool)

(assert (=> b!1125079 m!1039307))

(declare-fun m!1039309 () Bool)

(assert (=> b!1125070 m!1039309))

(declare-fun m!1039311 () Bool)

(assert (=> b!1125078 m!1039311))

(declare-fun m!1039313 () Bool)

(assert (=> b!1125078 m!1039313))

(declare-fun m!1039315 () Bool)

(assert (=> b!1125077 m!1039315))

(declare-fun m!1039317 () Bool)

(assert (=> bm!47479 m!1039317))

(check-sat (not b!1125079) (not b!1125078) (not b!1125073) b_and!38251 (not b!1125086) (not b!1125072) tp_is_empty!28263 (not b_next!23733) (not b!1125076) (not bm!47479) (not b!1125082) (not b!1125077) (not b!1125089) (not b!1125071) (not bm!47478) (not start!98032) (not b_lambda!18703) (not mapNonEmpty!44212) (not b!1125085) (not b!1125080))
(check-sat b_and!38251 (not b_next!23733))
