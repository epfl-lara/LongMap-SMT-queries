; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98744 () Bool)

(assert start!98744)

(declare-fun b_free!24355 () Bool)

(declare-fun b_next!24355 () Bool)

(assert (=> start!98744 (= b_free!24355 (not b_next!24355))))

(declare-fun tp!85775 () Bool)

(declare-fun b_and!39537 () Bool)

(assert (=> start!98744 (= tp!85775 b_and!39537)))

(declare-fun b!1151218 () Bool)

(declare-datatypes ((Unit!37695 0))(
  ( (Unit!37696) )
))
(declare-fun e!654767 () Unit!37695)

(declare-fun Unit!37697 () Unit!37695)

(assert (=> b!1151218 (= e!654767 Unit!37697)))

(declare-fun lt!515277 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1151218 (= lt!515277 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114030 () Bool)

(assert (=> b!1151218 (= c!114030 (and (not lt!515277) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515264 () Unit!37695)

(declare-fun e!654760 () Unit!37695)

(assert (=> b!1151218 (= lt!515264 e!654760)))

(declare-datatypes ((V!43641 0))(
  ( (V!43642 (val!14499 Int)) )
))
(declare-fun zeroValue!944 () V!43641)

(declare-datatypes ((array!74534 0))(
  ( (array!74535 (arr!35918 (Array (_ BitVec 32) (_ BitVec 64))) (size!36456 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74534)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!515262 () Unit!37695)

(declare-datatypes ((ValueCell!13733 0))(
  ( (ValueCellFull!13733 (v!17135 V!43641)) (EmptyCell!13733) )
))
(declare-datatypes ((array!74536 0))(
  ( (array!74537 (arr!35919 (Array (_ BitVec 32) ValueCell!13733)) (size!36457 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74536)

(declare-fun minValue!944 () V!43641)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!457 (array!74534 array!74536 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 64) (_ BitVec 32) Int) Unit!37695)

(assert (=> b!1151218 (= lt!515262 (lemmaListMapContainsThenArrayContainsFrom!457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114032 () Bool)

(assert (=> b!1151218 (= c!114032 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765601 () Bool)

(declare-fun e!654770 () Bool)

(assert (=> b!1151218 (= res!765601 e!654770)))

(declare-fun e!654772 () Bool)

(assert (=> b!1151218 (=> (not res!765601) (not e!654772))))

(assert (=> b!1151218 e!654772))

(declare-fun lt!515257 () Unit!37695)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74534 (_ BitVec 32) (_ BitVec 32)) Unit!37695)

(assert (=> b!1151218 (= lt!515257 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25215 0))(
  ( (Nil!25212) (Cons!25211 (h!26420 (_ BitVec 64)) (t!36553 List!25215)) )
))
(declare-fun arrayNoDuplicates!0 (array!74534 (_ BitVec 32) List!25215) Bool)

(assert (=> b!1151218 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25212)))

(declare-fun lt!515266 () Unit!37695)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74534 (_ BitVec 64) (_ BitVec 32) List!25215) Unit!37695)

(assert (=> b!1151218 (= lt!515266 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25212))))

(assert (=> b!1151218 false))

(declare-fun b!1151219 () Bool)

(declare-fun e!654768 () Unit!37695)

(declare-fun lt!515268 () Unit!37695)

(assert (=> b!1151219 (= e!654768 lt!515268)))

(declare-fun call!53780 () Unit!37695)

(assert (=> b!1151219 (= lt!515268 call!53780)))

(declare-fun call!53783 () Bool)

(assert (=> b!1151219 call!53783))

(declare-fun b!1151220 () Bool)

(declare-fun e!654766 () Bool)

(declare-fun tp_is_empty!28885 () Bool)

(assert (=> b!1151220 (= e!654766 tp_is_empty!28885)))

(declare-fun b!1151221 () Bool)

(declare-fun res!765590 () Bool)

(declare-fun e!654763 () Bool)

(assert (=> b!1151221 (=> (not res!765590) (not e!654763))))

(assert (=> b!1151221 (= res!765590 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25212))))

(declare-datatypes ((tuple2!18482 0))(
  ( (tuple2!18483 (_1!9252 (_ BitVec 64)) (_2!9252 V!43641)) )
))
(declare-datatypes ((List!25216 0))(
  ( (Nil!25213) (Cons!25212 (h!26421 tuple2!18482) (t!36554 List!25216)) )
))
(declare-datatypes ((ListLongMap!16451 0))(
  ( (ListLongMap!16452 (toList!8241 List!25216)) )
))
(declare-fun call!53781 () ListLongMap!16451)

(declare-fun bm!53776 () Bool)

(declare-fun lt!515271 () ListLongMap!16451)

(declare-fun call!53782 () Bool)

(declare-fun contains!6696 (ListLongMap!16451 (_ BitVec 64)) Bool)

(assert (=> bm!53776 (= call!53782 (contains!6696 (ite c!114030 lt!515271 call!53781) k0!934))))

(declare-fun b!1151222 () Bool)

(declare-fun e!654758 () Bool)

(assert (=> b!1151222 (= e!654758 true)))

(declare-fun e!654771 () Bool)

(assert (=> b!1151222 e!654771))

(declare-fun res!765599 () Bool)

(assert (=> b!1151222 (=> (not res!765599) (not e!654771))))

(declare-fun lt!515270 () ListLongMap!16451)

(declare-fun lt!515258 () ListLongMap!16451)

(assert (=> b!1151222 (= res!765599 (= lt!515270 lt!515258))))

(declare-fun lt!515269 () ListLongMap!16451)

(declare-fun -!1307 (ListLongMap!16451 (_ BitVec 64)) ListLongMap!16451)

(assert (=> b!1151222 (= lt!515270 (-!1307 lt!515269 k0!934))))

(declare-fun lt!515256 () V!43641)

(declare-fun +!3656 (ListLongMap!16451 tuple2!18482) ListLongMap!16451)

(assert (=> b!1151222 (= (-!1307 (+!3656 lt!515258 (tuple2!18483 (select (arr!35918 _keys!1208) from!1455) lt!515256)) (select (arr!35918 _keys!1208) from!1455)) lt!515258)))

(declare-fun lt!515273 () Unit!37695)

(declare-fun addThenRemoveForNewKeyIsSame!163 (ListLongMap!16451 (_ BitVec 64) V!43641) Unit!37695)

(assert (=> b!1151222 (= lt!515273 (addThenRemoveForNewKeyIsSame!163 lt!515258 (select (arr!35918 _keys!1208) from!1455) lt!515256))))

(declare-fun lt!515272 () V!43641)

(declare-fun get!18295 (ValueCell!13733 V!43641) V!43641)

(assert (=> b!1151222 (= lt!515256 (get!18295 (select (arr!35919 _values!996) from!1455) lt!515272))))

(declare-fun lt!515275 () Unit!37695)

(assert (=> b!1151222 (= lt!515275 e!654767)))

(declare-fun c!114027 () Bool)

(assert (=> b!1151222 (= c!114027 (contains!6696 lt!515258 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4725 (array!74534 array!74536 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) Int) ListLongMap!16451)

(assert (=> b!1151222 (= lt!515258 (getCurrentListMapNoExtraKeys!4725 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151223 () Bool)

(declare-fun res!765588 () Bool)

(assert (=> b!1151223 (=> (not res!765588) (not e!654763))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151223 (= res!765588 (= (select (arr!35918 _keys!1208) i!673) k0!934))))

(declare-fun b!1151224 () Bool)

(declare-fun res!765589 () Bool)

(assert (=> b!1151224 (=> (not res!765589) (not e!654763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151224 (= res!765589 (validMask!0 mask!1564))))

(declare-fun bm!53777 () Bool)

(assert (=> bm!53777 (= call!53783 call!53782)))

(declare-fun b!1151225 () Bool)

(declare-fun res!765595 () Bool)

(assert (=> b!1151225 (=> (not res!765595) (not e!654763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151225 (= res!765595 (validKeyInArray!0 k0!934))))

(declare-fun e!654774 () Bool)

(declare-fun call!53784 () ListLongMap!16451)

(declare-fun call!53786 () ListLongMap!16451)

(declare-fun b!1151226 () Bool)

(assert (=> b!1151226 (= e!654774 (= call!53784 (-!1307 call!53786 k0!934)))))

(declare-fun b!1151227 () Bool)

(declare-fun e!654761 () Unit!37695)

(declare-fun Unit!37698 () Unit!37695)

(assert (=> b!1151227 (= e!654761 Unit!37698)))

(declare-fun b!1151228 () Bool)

(assert (=> b!1151228 (= e!654768 e!654761)))

(declare-fun c!114028 () Bool)

(assert (=> b!1151228 (= c!114028 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515277))))

(declare-fun b!1151229 () Bool)

(assert (=> b!1151229 (= e!654774 (= call!53784 call!53786))))

(declare-fun mapNonEmpty!45152 () Bool)

(declare-fun mapRes!45152 () Bool)

(declare-fun tp!85776 () Bool)

(declare-fun e!654765 () Bool)

(assert (=> mapNonEmpty!45152 (= mapRes!45152 (and tp!85776 e!654765))))

(declare-fun mapKey!45152 () (_ BitVec 32))

(declare-fun mapValue!45152 () ValueCell!13733)

(declare-fun mapRest!45152 () (Array (_ BitVec 32) ValueCell!13733))

(assert (=> mapNonEmpty!45152 (= (arr!35919 _values!996) (store mapRest!45152 mapKey!45152 mapValue!45152))))

(declare-fun b!1151230 () Bool)

(declare-fun e!654773 () Bool)

(assert (=> b!1151230 (= e!654763 e!654773)))

(declare-fun res!765591 () Bool)

(assert (=> b!1151230 (=> (not res!765591) (not e!654773))))

(declare-fun lt!515259 () array!74534)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74534 (_ BitVec 32)) Bool)

(assert (=> b!1151230 (= res!765591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515259 mask!1564))))

(assert (=> b!1151230 (= lt!515259 (array!74535 (store (arr!35918 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36456 _keys!1208)))))

(declare-fun b!1151231 () Bool)

(declare-fun e!654764 () Bool)

(assert (=> b!1151231 (= e!654773 (not e!654764))))

(declare-fun res!765593 () Bool)

(assert (=> b!1151231 (=> res!765593 e!654764)))

(assert (=> b!1151231 (= res!765593 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151231 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515261 () Unit!37695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74534 (_ BitVec 64) (_ BitVec 32)) Unit!37695)

(assert (=> b!1151231 (= lt!515261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151232 () Bool)

(declare-fun call!53785 () ListLongMap!16451)

(assert (=> b!1151232 (contains!6696 call!53785 k0!934)))

(declare-fun lt!515265 () Unit!37695)

(declare-fun addStillContains!866 (ListLongMap!16451 (_ BitVec 64) V!43641 (_ BitVec 64)) Unit!37695)

(assert (=> b!1151232 (= lt!515265 (addStillContains!866 lt!515271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1151232 call!53782))

(assert (=> b!1151232 (= lt!515271 (+!3656 lt!515258 (tuple2!18483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515276 () Unit!37695)

(declare-fun call!53779 () Unit!37695)

(assert (=> b!1151232 (= lt!515276 call!53779)))

(assert (=> b!1151232 (= e!654760 lt!515265)))

(declare-fun b!1151233 () Bool)

(assert (=> b!1151233 (= e!654765 tp_is_empty!28885)))

(declare-fun b!1151234 () Bool)

(assert (=> b!1151234 (= e!654770 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53778 () Bool)

(declare-fun c!114031 () Bool)

(assert (=> bm!53778 (= call!53779 (addStillContains!866 lt!515258 (ite (or c!114030 c!114031) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114030 c!114031) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1151235 () Bool)

(declare-fun e!654769 () Bool)

(assert (=> b!1151235 (= e!654764 e!654769)))

(declare-fun res!765598 () Bool)

(assert (=> b!1151235 (=> res!765598 e!654769)))

(assert (=> b!1151235 (= res!765598 (not (= from!1455 i!673)))))

(declare-fun lt!515263 () array!74536)

(declare-fun lt!515267 () ListLongMap!16451)

(assert (=> b!1151235 (= lt!515267 (getCurrentListMapNoExtraKeys!4725 lt!515259 lt!515263 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151235 (= lt!515263 (array!74537 (store (arr!35919 _values!996) i!673 (ValueCellFull!13733 lt!515272)) (size!36457 _values!996)))))

(declare-fun dynLambda!2688 (Int (_ BitVec 64)) V!43641)

(assert (=> b!1151235 (= lt!515272 (dynLambda!2688 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151235 (= lt!515269 (getCurrentListMapNoExtraKeys!4725 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53779 () Bool)

(assert (=> bm!53779 (= call!53786 (getCurrentListMapNoExtraKeys!4725 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45152 () Bool)

(assert (=> mapIsEmpty!45152 mapRes!45152))

(declare-fun b!1151236 () Bool)

(assert (=> b!1151236 (= e!654769 e!654758)))

(declare-fun res!765592 () Bool)

(assert (=> b!1151236 (=> res!765592 e!654758)))

(assert (=> b!1151236 (= res!765592 (not (= (select (arr!35918 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151236 e!654774))

(declare-fun c!114029 () Bool)

(assert (=> b!1151236 (= c!114029 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515260 () Unit!37695)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 (array!74534 array!74536 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37695)

(assert (=> b!1151236 (= lt!515260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151237 () Bool)

(declare-fun res!765594 () Bool)

(assert (=> b!1151237 (=> (not res!765594) (not e!654763))))

(assert (=> b!1151237 (= res!765594 (and (= (size!36457 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36456 _keys!1208) (size!36457 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53780 () Bool)

(assert (=> bm!53780 (= call!53784 (getCurrentListMapNoExtraKeys!4725 lt!515259 lt!515263 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151238 () Bool)

(declare-fun res!765597 () Bool)

(assert (=> b!1151238 (=> (not res!765597) (not e!654763))))

(assert (=> b!1151238 (= res!765597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151239 () Bool)

(declare-fun res!765602 () Bool)

(assert (=> b!1151239 (=> (not res!765602) (not e!654763))))

(assert (=> b!1151239 (= res!765602 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36456 _keys!1208))))))

(declare-fun bm!53781 () Bool)

(assert (=> bm!53781 (= call!53785 (+!3656 (ite c!114030 lt!515271 lt!515258) (ite c!114030 (tuple2!18483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114031 (tuple2!18483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151240 () Bool)

(declare-fun Unit!37699 () Unit!37695)

(assert (=> b!1151240 (= e!654767 Unit!37699)))

(declare-fun b!1151241 () Bool)

(assert (=> b!1151241 (= c!114031 (and (not lt!515277) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1151241 (= e!654760 e!654768)))

(declare-fun bm!53782 () Bool)

(assert (=> bm!53782 (= call!53780 call!53779)))

(declare-fun b!1151242 () Bool)

(declare-fun e!654762 () Bool)

(assert (=> b!1151242 (= e!654762 (and e!654766 mapRes!45152))))

(declare-fun condMapEmpty!45152 () Bool)

(declare-fun mapDefault!45152 () ValueCell!13733)

(assert (=> b!1151242 (= condMapEmpty!45152 (= (arr!35919 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13733)) mapDefault!45152)))))

(declare-fun b!1151243 () Bool)

(assert (=> b!1151243 call!53783))

(declare-fun lt!515274 () Unit!37695)

(assert (=> b!1151243 (= lt!515274 call!53780)))

(assert (=> b!1151243 (= e!654761 lt!515274)))

(declare-fun b!1151244 () Bool)

(assert (=> b!1151244 (= e!654770 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515277) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53783 () Bool)

(assert (=> bm!53783 (= call!53781 call!53785)))

(declare-fun b!1151245 () Bool)

(assert (=> b!1151245 (= e!654771 (= lt!515270 (getCurrentListMapNoExtraKeys!4725 lt!515259 lt!515263 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151246 () Bool)

(declare-fun res!765596 () Bool)

(assert (=> b!1151246 (=> (not res!765596) (not e!654773))))

(assert (=> b!1151246 (= res!765596 (arrayNoDuplicates!0 lt!515259 #b00000000000000000000000000000000 Nil!25212))))

(declare-fun res!765600 () Bool)

(assert (=> start!98744 (=> (not res!765600) (not e!654763))))

(assert (=> start!98744 (= res!765600 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36456 _keys!1208))))))

(assert (=> start!98744 e!654763))

(assert (=> start!98744 tp_is_empty!28885))

(declare-fun array_inv!27598 (array!74534) Bool)

(assert (=> start!98744 (array_inv!27598 _keys!1208)))

(assert (=> start!98744 true))

(assert (=> start!98744 tp!85775))

(declare-fun array_inv!27599 (array!74536) Bool)

(assert (=> start!98744 (and (array_inv!27599 _values!996) e!654762)))

(declare-fun b!1151247 () Bool)

(assert (=> b!1151247 (= e!654772 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98744 res!765600) b!1151224))

(assert (= (and b!1151224 res!765589) b!1151237))

(assert (= (and b!1151237 res!765594) b!1151238))

(assert (= (and b!1151238 res!765597) b!1151221))

(assert (= (and b!1151221 res!765590) b!1151239))

(assert (= (and b!1151239 res!765602) b!1151225))

(assert (= (and b!1151225 res!765595) b!1151223))

(assert (= (and b!1151223 res!765588) b!1151230))

(assert (= (and b!1151230 res!765591) b!1151246))

(assert (= (and b!1151246 res!765596) b!1151231))

(assert (= (and b!1151231 (not res!765593)) b!1151235))

(assert (= (and b!1151235 (not res!765598)) b!1151236))

(assert (= (and b!1151236 c!114029) b!1151226))

(assert (= (and b!1151236 (not c!114029)) b!1151229))

(assert (= (or b!1151226 b!1151229) bm!53780))

(assert (= (or b!1151226 b!1151229) bm!53779))

(assert (= (and b!1151236 (not res!765592)) b!1151222))

(assert (= (and b!1151222 c!114027) b!1151218))

(assert (= (and b!1151222 (not c!114027)) b!1151240))

(assert (= (and b!1151218 c!114030) b!1151232))

(assert (= (and b!1151218 (not c!114030)) b!1151241))

(assert (= (and b!1151241 c!114031) b!1151219))

(assert (= (and b!1151241 (not c!114031)) b!1151228))

(assert (= (and b!1151228 c!114028) b!1151243))

(assert (= (and b!1151228 (not c!114028)) b!1151227))

(assert (= (or b!1151219 b!1151243) bm!53782))

(assert (= (or b!1151219 b!1151243) bm!53783))

(assert (= (or b!1151219 b!1151243) bm!53777))

(assert (= (or b!1151232 bm!53777) bm!53776))

(assert (= (or b!1151232 bm!53782) bm!53778))

(assert (= (or b!1151232 bm!53783) bm!53781))

(assert (= (and b!1151218 c!114032) b!1151234))

(assert (= (and b!1151218 (not c!114032)) b!1151244))

(assert (= (and b!1151218 res!765601) b!1151247))

(assert (= (and b!1151222 res!765599) b!1151245))

(assert (= (and b!1151242 condMapEmpty!45152) mapIsEmpty!45152))

(assert (= (and b!1151242 (not condMapEmpty!45152)) mapNonEmpty!45152))

(get-info :version)

(assert (= (and mapNonEmpty!45152 ((_ is ValueCellFull!13733) mapValue!45152)) b!1151233))

(assert (= (and b!1151242 ((_ is ValueCellFull!13733) mapDefault!45152)) b!1151220))

(assert (= start!98744 b!1151242))

(declare-fun b_lambda!19443 () Bool)

(assert (=> (not b_lambda!19443) (not b!1151235)))

(declare-fun t!36552 () Bool)

(declare-fun tb!9159 () Bool)

(assert (=> (and start!98744 (= defaultEntry!1004 defaultEntry!1004) t!36552) tb!9159))

(declare-fun result!18891 () Bool)

(assert (=> tb!9159 (= result!18891 tp_is_empty!28885)))

(assert (=> b!1151235 t!36552))

(declare-fun b_and!39539 () Bool)

(assert (= b_and!39537 (and (=> t!36552 result!18891) b_and!39539)))

(declare-fun m!1060863 () Bool)

(assert (=> b!1151223 m!1060863))

(declare-fun m!1060865 () Bool)

(assert (=> b!1151230 m!1060865))

(declare-fun m!1060867 () Bool)

(assert (=> b!1151230 m!1060867))

(declare-fun m!1060869 () Bool)

(assert (=> bm!53776 m!1060869))

(declare-fun m!1060871 () Bool)

(assert (=> b!1151222 m!1060871))

(declare-fun m!1060873 () Bool)

(assert (=> b!1151222 m!1060873))

(declare-fun m!1060875 () Bool)

(assert (=> b!1151222 m!1060875))

(declare-fun m!1060877 () Bool)

(assert (=> b!1151222 m!1060877))

(declare-fun m!1060879 () Bool)

(assert (=> b!1151222 m!1060879))

(assert (=> b!1151222 m!1060879))

(declare-fun m!1060881 () Bool)

(assert (=> b!1151222 m!1060881))

(declare-fun m!1060883 () Bool)

(assert (=> b!1151222 m!1060883))

(declare-fun m!1060885 () Bool)

(assert (=> b!1151222 m!1060885))

(assert (=> b!1151222 m!1060881))

(assert (=> b!1151222 m!1060871))

(assert (=> b!1151222 m!1060881))

(declare-fun m!1060887 () Bool)

(assert (=> b!1151222 m!1060887))

(declare-fun m!1060889 () Bool)

(assert (=> b!1151238 m!1060889))

(declare-fun m!1060891 () Bool)

(assert (=> mapNonEmpty!45152 m!1060891))

(declare-fun m!1060893 () Bool)

(assert (=> b!1151221 m!1060893))

(assert (=> bm!53779 m!1060875))

(declare-fun m!1060895 () Bool)

(assert (=> b!1151224 m!1060895))

(assert (=> b!1151236 m!1060881))

(declare-fun m!1060897 () Bool)

(assert (=> b!1151236 m!1060897))

(declare-fun m!1060899 () Bool)

(assert (=> b!1151218 m!1060899))

(declare-fun m!1060901 () Bool)

(assert (=> b!1151218 m!1060901))

(declare-fun m!1060903 () Bool)

(assert (=> b!1151218 m!1060903))

(declare-fun m!1060905 () Bool)

(assert (=> b!1151218 m!1060905))

(declare-fun m!1060907 () Bool)

(assert (=> b!1151226 m!1060907))

(declare-fun m!1060909 () Bool)

(assert (=> b!1151225 m!1060909))

(declare-fun m!1060911 () Bool)

(assert (=> start!98744 m!1060911))

(declare-fun m!1060913 () Bool)

(assert (=> start!98744 m!1060913))

(declare-fun m!1060915 () Bool)

(assert (=> b!1151247 m!1060915))

(declare-fun m!1060917 () Bool)

(assert (=> bm!53778 m!1060917))

(declare-fun m!1060919 () Bool)

(assert (=> b!1151232 m!1060919))

(declare-fun m!1060921 () Bool)

(assert (=> b!1151232 m!1060921))

(declare-fun m!1060923 () Bool)

(assert (=> b!1151232 m!1060923))

(declare-fun m!1060925 () Bool)

(assert (=> bm!53781 m!1060925))

(declare-fun m!1060927 () Bool)

(assert (=> b!1151246 m!1060927))

(declare-fun m!1060929 () Bool)

(assert (=> b!1151245 m!1060929))

(assert (=> b!1151234 m!1060915))

(declare-fun m!1060931 () Bool)

(assert (=> b!1151235 m!1060931))

(declare-fun m!1060933 () Bool)

(assert (=> b!1151235 m!1060933))

(declare-fun m!1060935 () Bool)

(assert (=> b!1151235 m!1060935))

(declare-fun m!1060937 () Bool)

(assert (=> b!1151235 m!1060937))

(declare-fun m!1060939 () Bool)

(assert (=> b!1151231 m!1060939))

(declare-fun m!1060941 () Bool)

(assert (=> b!1151231 m!1060941))

(assert (=> bm!53780 m!1060929))

(check-sat (not b!1151225) (not bm!53779) (not b!1151234) (not b!1151231) (not b!1151246) (not b!1151230) b_and!39539 (not b!1151236) (not b!1151224) (not start!98744) (not bm!53780) (not bm!53781) (not b!1151247) (not mapNonEmpty!45152) (not b_lambda!19443) (not b!1151235) (not bm!53778) (not b!1151238) (not b!1151226) (not b!1151232) (not b!1151222) (not bm!53776) tp_is_empty!28885 (not b!1151221) (not b!1151245) (not b!1151218) (not b_next!24355))
(check-sat b_and!39539 (not b_next!24355))
