; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98572 () Bool)

(assert start!98572)

(declare-fun b_free!24177 () Bool)

(declare-fun b_next!24177 () Bool)

(assert (=> start!98572 (= b_free!24177 (not b_next!24177))))

(declare-fun tp!85241 () Bool)

(declare-fun b_and!39203 () Bool)

(assert (=> start!98572 (= tp!85241 b_and!39203)))

(declare-fun b!1143185 () Bool)

(declare-fun res!761681 () Bool)

(declare-fun e!650330 () Bool)

(assert (=> b!1143185 (=> (not res!761681) (not e!650330))))

(declare-datatypes ((array!74267 0))(
  ( (array!74268 (arr!35784 (Array (_ BitVec 32) (_ BitVec 64))) (size!36320 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74267)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74267 (_ BitVec 32)) Bool)

(assert (=> b!1143185 (= res!761681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143187 () Bool)

(declare-datatypes ((Unit!37509 0))(
  ( (Unit!37510) )
))
(declare-fun e!650338 () Unit!37509)

(declare-fun Unit!37511 () Unit!37509)

(assert (=> b!1143187 (= e!650338 Unit!37511)))

(declare-fun lt!509771 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143187 (= lt!509771 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112451 () Bool)

(assert (=> b!1143187 (= c!112451 (and (not lt!509771) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509780 () Unit!37509)

(declare-fun e!650339 () Unit!37509)

(assert (=> b!1143187 (= lt!509780 e!650339)))

(declare-datatypes ((V!43403 0))(
  ( (V!43404 (val!14410 Int)) )
))
(declare-fun zeroValue!944 () V!43403)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509785 () Unit!37509)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13644 0))(
  ( (ValueCellFull!13644 (v!17047 V!43403)) (EmptyCell!13644) )
))
(declare-datatypes ((array!74269 0))(
  ( (array!74270 (arr!35785 (Array (_ BitVec 32) ValueCell!13644)) (size!36321 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74269)

(declare-fun minValue!944 () V!43403)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!399 (array!74267 array!74269 (_ BitVec 32) (_ BitVec 32) V!43403 V!43403 (_ BitVec 64) (_ BitVec 32) Int) Unit!37509)

(assert (=> b!1143187 (= lt!509785 (lemmaListMapContainsThenArrayContainsFrom!399 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112455 () Bool)

(assert (=> b!1143187 (= c!112455 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761680 () Bool)

(declare-fun e!650332 () Bool)

(assert (=> b!1143187 (= res!761680 e!650332)))

(declare-fun e!650343 () Bool)

(assert (=> b!1143187 (=> (not res!761680) (not e!650343))))

(assert (=> b!1143187 e!650343))

(declare-fun lt!509781 () Unit!37509)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74267 (_ BitVec 32) (_ BitVec 32)) Unit!37509)

(assert (=> b!1143187 (= lt!509781 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24993 0))(
  ( (Nil!24990) (Cons!24989 (h!26198 (_ BitVec 64)) (t!36162 List!24993)) )
))
(declare-fun arrayNoDuplicates!0 (array!74267 (_ BitVec 32) List!24993) Bool)

(assert (=> b!1143187 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24990)))

(declare-fun lt!509767 () Unit!37509)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74267 (_ BitVec 64) (_ BitVec 32) List!24993) Unit!37509)

(assert (=> b!1143187 (= lt!509767 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24990))))

(assert (=> b!1143187 false))

(declare-fun b!1143188 () Bool)

(declare-fun e!650342 () Bool)

(declare-datatypes ((tuple2!18240 0))(
  ( (tuple2!18241 (_1!9131 (_ BitVec 64)) (_2!9131 V!43403)) )
))
(declare-datatypes ((List!24994 0))(
  ( (Nil!24991) (Cons!24990 (h!26199 tuple2!18240) (t!36163 List!24994)) )
))
(declare-datatypes ((ListLongMap!16209 0))(
  ( (ListLongMap!16210 (toList!8120 List!24994)) )
))
(declare-fun call!51672 () ListLongMap!16209)

(declare-fun call!51670 () ListLongMap!16209)

(assert (=> b!1143188 (= e!650342 (= call!51672 call!51670))))

(declare-fun b!1143189 () Bool)

(declare-fun e!650336 () Unit!37509)

(declare-fun lt!509768 () Unit!37509)

(assert (=> b!1143189 (= e!650336 lt!509768)))

(declare-fun call!51667 () Unit!37509)

(assert (=> b!1143189 (= lt!509768 call!51667)))

(declare-fun call!51668 () Bool)

(assert (=> b!1143189 call!51668))

(declare-fun b!1143190 () Bool)

(declare-fun e!650341 () Bool)

(declare-fun tp_is_empty!28707 () Bool)

(assert (=> b!1143190 (= e!650341 tp_is_empty!28707)))

(declare-fun b!1143191 () Bool)

(declare-fun e!650331 () Unit!37509)

(assert (=> b!1143191 (= e!650336 e!650331)))

(declare-fun c!112452 () Bool)

(assert (=> b!1143191 (= c!112452 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509771))))

(declare-fun b!1143192 () Bool)

(assert (=> b!1143192 call!51668))

(declare-fun lt!509782 () Unit!37509)

(assert (=> b!1143192 (= lt!509782 call!51667)))

(assert (=> b!1143192 (= e!650331 lt!509782)))

(declare-fun lt!509784 () array!74269)

(declare-fun bm!51663 () Bool)

(declare-fun lt!509783 () array!74267)

(declare-fun getCurrentListMapNoExtraKeys!4600 (array!74267 array!74269 (_ BitVec 32) (_ BitVec 32) V!43403 V!43403 (_ BitVec 32) Int) ListLongMap!16209)

(assert (=> bm!51663 (= call!51672 (getCurrentListMapNoExtraKeys!4600 lt!509783 lt!509784 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143193 () Bool)

(declare-fun res!761691 () Bool)

(assert (=> b!1143193 (=> (not res!761691) (not e!650330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143193 (= res!761691 (validMask!0 mask!1564))))

(declare-fun b!1143194 () Bool)

(declare-fun res!761686 () Bool)

(declare-fun e!650334 () Bool)

(assert (=> b!1143194 (=> (not res!761686) (not e!650334))))

(assert (=> b!1143194 (= res!761686 (arrayNoDuplicates!0 lt!509783 #b00000000000000000000000000000000 Nil!24990))))

(declare-fun bm!51664 () Bool)

(assert (=> bm!51664 (= call!51670 (getCurrentListMapNoExtraKeys!4600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143195 () Bool)

(declare-fun e!650328 () Bool)

(declare-fun e!650340 () Bool)

(declare-fun mapRes!44885 () Bool)

(assert (=> b!1143195 (= e!650328 (and e!650340 mapRes!44885))))

(declare-fun condMapEmpty!44885 () Bool)

(declare-fun mapDefault!44885 () ValueCell!13644)

(assert (=> b!1143195 (= condMapEmpty!44885 (= (arr!35785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13644)) mapDefault!44885)))))

(declare-fun b!1143196 () Bool)

(declare-fun e!650329 () Bool)

(declare-fun e!650335 () Bool)

(assert (=> b!1143196 (= e!650329 e!650335)))

(declare-fun res!761690 () Bool)

(assert (=> b!1143196 (=> res!761690 e!650335)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143196 (= res!761690 (not (= from!1455 i!673)))))

(declare-fun lt!509786 () ListLongMap!16209)

(assert (=> b!1143196 (= lt!509786 (getCurrentListMapNoExtraKeys!4600 lt!509783 lt!509784 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509775 () V!43403)

(assert (=> b!1143196 (= lt!509784 (array!74270 (store (arr!35785 _values!996) i!673 (ValueCellFull!13644 lt!509775)) (size!36321 _values!996)))))

(declare-fun dynLambda!2639 (Int (_ BitVec 64)) V!43403)

(assert (=> b!1143196 (= lt!509775 (dynLambda!2639 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509776 () ListLongMap!16209)

(assert (=> b!1143196 (= lt!509776 (getCurrentListMapNoExtraKeys!4600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143197 () Bool)

(declare-fun res!761688 () Bool)

(assert (=> b!1143197 (=> (not res!761688) (not e!650330))))

(assert (=> b!1143197 (= res!761688 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36320 _keys!1208))))))

(declare-fun b!1143186 () Bool)

(declare-fun res!761683 () Bool)

(assert (=> b!1143186 (=> (not res!761683) (not e!650330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143186 (= res!761683 (validKeyInArray!0 k0!934))))

(declare-fun res!761687 () Bool)

(assert (=> start!98572 (=> (not res!761687) (not e!650330))))

(assert (=> start!98572 (= res!761687 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36320 _keys!1208))))))

(assert (=> start!98572 e!650330))

(assert (=> start!98572 tp_is_empty!28707))

(declare-fun array_inv!27420 (array!74267) Bool)

(assert (=> start!98572 (array_inv!27420 _keys!1208)))

(assert (=> start!98572 true))

(assert (=> start!98572 tp!85241))

(declare-fun array_inv!27421 (array!74269) Bool)

(assert (=> start!98572 (and (array_inv!27421 _values!996) e!650328)))

(declare-fun bm!51665 () Bool)

(declare-fun lt!509773 () ListLongMap!16209)

(declare-fun call!51669 () ListLongMap!16209)

(declare-fun c!112456 () Bool)

(declare-fun +!3549 (ListLongMap!16209 tuple2!18240) ListLongMap!16209)

(assert (=> bm!51665 (= call!51669 (+!3549 lt!509773 (ite (or c!112451 c!112456) (tuple2!18241 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1143198 () Bool)

(declare-fun res!761693 () Bool)

(assert (=> b!1143198 (=> (not res!761693) (not e!650330))))

(assert (=> b!1143198 (= res!761693 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24990))))

(declare-fun bm!51666 () Bool)

(declare-fun call!51671 () ListLongMap!16209)

(assert (=> bm!51666 (= call!51671 call!51669)))

(declare-fun bm!51667 () Bool)

(declare-fun call!51673 () Bool)

(assert (=> bm!51667 (= call!51668 call!51673)))

(declare-fun mapIsEmpty!44885 () Bool)

(assert (=> mapIsEmpty!44885 mapRes!44885))

(declare-fun bm!51668 () Bool)

(declare-fun lt!509777 () ListLongMap!16209)

(declare-fun contains!6652 (ListLongMap!16209 (_ BitVec 64)) Bool)

(assert (=> bm!51668 (= call!51673 (contains!6652 (ite c!112451 lt!509777 call!51671) k0!934))))

(declare-fun b!1143199 () Bool)

(declare-fun Unit!37512 () Unit!37509)

(assert (=> b!1143199 (= e!650331 Unit!37512)))

(declare-fun b!1143200 () Bool)

(declare-fun res!761682 () Bool)

(assert (=> b!1143200 (=> (not res!761682) (not e!650330))))

(assert (=> b!1143200 (= res!761682 (= (select (arr!35784 _keys!1208) i!673) k0!934))))

(declare-fun b!1143201 () Bool)

(declare-fun arrayContainsKey!0 (array!74267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143201 (= e!650332 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143202 () Bool)

(declare-fun e!650337 () Bool)

(assert (=> b!1143202 (= e!650335 e!650337)))

(declare-fun res!761689 () Bool)

(assert (=> b!1143202 (=> res!761689 e!650337)))

(assert (=> b!1143202 (= res!761689 (not (= (select (arr!35784 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143202 e!650342))

(declare-fun c!112454 () Bool)

(assert (=> b!1143202 (= c!112454 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509787 () Unit!37509)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!508 (array!74267 array!74269 (_ BitVec 32) (_ BitVec 32) V!43403 V!43403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37509)

(assert (=> b!1143202 (= lt!509787 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51669 () Bool)

(declare-fun call!51666 () Unit!37509)

(assert (=> bm!51669 (= call!51667 call!51666)))

(declare-fun bm!51670 () Bool)

(declare-fun addStillContains!805 (ListLongMap!16209 (_ BitVec 64) V!43403 (_ BitVec 64)) Unit!37509)

(assert (=> bm!51670 (= call!51666 (addStillContains!805 lt!509773 (ite (or c!112451 c!112456) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112451 c!112456) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1143203 () Bool)

(declare-fun -!1266 (ListLongMap!16209 (_ BitVec 64)) ListLongMap!16209)

(assert (=> b!1143203 (= e!650342 (= call!51672 (-!1266 call!51670 k0!934)))))

(declare-fun b!1143204 () Bool)

(declare-fun res!761684 () Bool)

(assert (=> b!1143204 (=> (not res!761684) (not e!650330))))

(assert (=> b!1143204 (= res!761684 (and (= (size!36321 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36320 _keys!1208) (size!36321 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143205 () Bool)

(assert (=> b!1143205 (contains!6652 (+!3549 lt!509777 (tuple2!18241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509769 () Unit!37509)

(assert (=> b!1143205 (= lt!509769 (addStillContains!805 lt!509777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1143205 call!51673))

(assert (=> b!1143205 (= lt!509777 call!51669)))

(declare-fun lt!509774 () Unit!37509)

(assert (=> b!1143205 (= lt!509774 call!51666)))

(assert (=> b!1143205 (= e!650339 lt!509769)))

(declare-fun b!1143206 () Bool)

(assert (=> b!1143206 (= e!650334 (not e!650329))))

(declare-fun res!761692 () Bool)

(assert (=> b!1143206 (=> res!761692 e!650329)))

(assert (=> b!1143206 (= res!761692 (bvsgt from!1455 i!673))))

(assert (=> b!1143206 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509779 () Unit!37509)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74267 (_ BitVec 64) (_ BitVec 32)) Unit!37509)

(assert (=> b!1143206 (= lt!509779 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143207 () Bool)

(assert (=> b!1143207 (= e!650330 e!650334)))

(declare-fun res!761685 () Bool)

(assert (=> b!1143207 (=> (not res!761685) (not e!650334))))

(assert (=> b!1143207 (= res!761685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509783 mask!1564))))

(assert (=> b!1143207 (= lt!509783 (array!74268 (store (arr!35784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36320 _keys!1208)))))

(declare-fun b!1143208 () Bool)

(assert (=> b!1143208 (= e!650337 true)))

(declare-fun lt!509778 () V!43403)

(assert (=> b!1143208 (= (-!1266 (+!3549 lt!509773 (tuple2!18241 (select (arr!35784 _keys!1208) from!1455) lt!509778)) (select (arr!35784 _keys!1208) from!1455)) lt!509773)))

(declare-fun lt!509772 () Unit!37509)

(declare-fun addThenRemoveForNewKeyIsSame!118 (ListLongMap!16209 (_ BitVec 64) V!43403) Unit!37509)

(assert (=> b!1143208 (= lt!509772 (addThenRemoveForNewKeyIsSame!118 lt!509773 (select (arr!35784 _keys!1208) from!1455) lt!509778))))

(declare-fun get!18190 (ValueCell!13644 V!43403) V!43403)

(assert (=> b!1143208 (= lt!509778 (get!18190 (select (arr!35785 _values!996) from!1455) lt!509775))))

(declare-fun lt!509770 () Unit!37509)

(assert (=> b!1143208 (= lt!509770 e!650338)))

(declare-fun c!112453 () Bool)

(assert (=> b!1143208 (= c!112453 (contains!6652 lt!509773 k0!934))))

(assert (=> b!1143208 (= lt!509773 (getCurrentListMapNoExtraKeys!4600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143209 () Bool)

(assert (=> b!1143209 (= c!112456 (and (not lt!509771) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143209 (= e!650339 e!650336)))

(declare-fun b!1143210 () Bool)

(assert (=> b!1143210 (= e!650343 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143211 () Bool)

(assert (=> b!1143211 (= e!650340 tp_is_empty!28707)))

(declare-fun b!1143212 () Bool)

(assert (=> b!1143212 (= e!650332 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509771) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!44885 () Bool)

(declare-fun tp!85242 () Bool)

(assert (=> mapNonEmpty!44885 (= mapRes!44885 (and tp!85242 e!650341))))

(declare-fun mapRest!44885 () (Array (_ BitVec 32) ValueCell!13644))

(declare-fun mapValue!44885 () ValueCell!13644)

(declare-fun mapKey!44885 () (_ BitVec 32))

(assert (=> mapNonEmpty!44885 (= (arr!35785 _values!996) (store mapRest!44885 mapKey!44885 mapValue!44885))))

(declare-fun b!1143213 () Bool)

(declare-fun Unit!37513 () Unit!37509)

(assert (=> b!1143213 (= e!650338 Unit!37513)))

(assert (= (and start!98572 res!761687) b!1143193))

(assert (= (and b!1143193 res!761691) b!1143204))

(assert (= (and b!1143204 res!761684) b!1143185))

(assert (= (and b!1143185 res!761681) b!1143198))

(assert (= (and b!1143198 res!761693) b!1143197))

(assert (= (and b!1143197 res!761688) b!1143186))

(assert (= (and b!1143186 res!761683) b!1143200))

(assert (= (and b!1143200 res!761682) b!1143207))

(assert (= (and b!1143207 res!761685) b!1143194))

(assert (= (and b!1143194 res!761686) b!1143206))

(assert (= (and b!1143206 (not res!761692)) b!1143196))

(assert (= (and b!1143196 (not res!761690)) b!1143202))

(assert (= (and b!1143202 c!112454) b!1143203))

(assert (= (and b!1143202 (not c!112454)) b!1143188))

(assert (= (or b!1143203 b!1143188) bm!51663))

(assert (= (or b!1143203 b!1143188) bm!51664))

(assert (= (and b!1143202 (not res!761689)) b!1143208))

(assert (= (and b!1143208 c!112453) b!1143187))

(assert (= (and b!1143208 (not c!112453)) b!1143213))

(assert (= (and b!1143187 c!112451) b!1143205))

(assert (= (and b!1143187 (not c!112451)) b!1143209))

(assert (= (and b!1143209 c!112456) b!1143189))

(assert (= (and b!1143209 (not c!112456)) b!1143191))

(assert (= (and b!1143191 c!112452) b!1143192))

(assert (= (and b!1143191 (not c!112452)) b!1143199))

(assert (= (or b!1143189 b!1143192) bm!51669))

(assert (= (or b!1143189 b!1143192) bm!51666))

(assert (= (or b!1143189 b!1143192) bm!51667))

(assert (= (or b!1143205 bm!51667) bm!51668))

(assert (= (or b!1143205 bm!51669) bm!51670))

(assert (= (or b!1143205 bm!51666) bm!51665))

(assert (= (and b!1143187 c!112455) b!1143201))

(assert (= (and b!1143187 (not c!112455)) b!1143212))

(assert (= (and b!1143187 res!761680) b!1143210))

(assert (= (and b!1143195 condMapEmpty!44885) mapIsEmpty!44885))

(assert (= (and b!1143195 (not condMapEmpty!44885)) mapNonEmpty!44885))

(get-info :version)

(assert (= (and mapNonEmpty!44885 ((_ is ValueCellFull!13644) mapValue!44885)) b!1143190))

(assert (= (and b!1143195 ((_ is ValueCellFull!13644) mapDefault!44885)) b!1143211))

(assert (= start!98572 b!1143195))

(declare-fun b_lambda!19283 () Bool)

(assert (=> (not b_lambda!19283) (not b!1143196)))

(declare-fun t!36161 () Bool)

(declare-fun tb!8989 () Bool)

(assert (=> (and start!98572 (= defaultEntry!1004 defaultEntry!1004) t!36161) tb!8989))

(declare-fun result!18543 () Bool)

(assert (=> tb!8989 (= result!18543 tp_is_empty!28707)))

(assert (=> b!1143196 t!36161))

(declare-fun b_and!39205 () Bool)

(assert (= b_and!39203 (and (=> t!36161 result!18543) b_and!39205)))

(declare-fun m!1054359 () Bool)

(assert (=> b!1143201 m!1054359))

(declare-fun m!1054361 () Bool)

(assert (=> b!1143186 m!1054361))

(declare-fun m!1054363 () Bool)

(assert (=> b!1143196 m!1054363))

(declare-fun m!1054365 () Bool)

(assert (=> b!1143196 m!1054365))

(declare-fun m!1054367 () Bool)

(assert (=> b!1143196 m!1054367))

(declare-fun m!1054369 () Bool)

(assert (=> b!1143196 m!1054369))

(declare-fun m!1054371 () Bool)

(assert (=> b!1143200 m!1054371))

(declare-fun m!1054373 () Bool)

(assert (=> bm!51668 m!1054373))

(declare-fun m!1054375 () Bool)

(assert (=> mapNonEmpty!44885 m!1054375))

(declare-fun m!1054377 () Bool)

(assert (=> b!1143202 m!1054377))

(declare-fun m!1054379 () Bool)

(assert (=> b!1143202 m!1054379))

(declare-fun m!1054381 () Bool)

(assert (=> b!1143194 m!1054381))

(assert (=> b!1143210 m!1054359))

(declare-fun m!1054383 () Bool)

(assert (=> b!1143207 m!1054383))

(declare-fun m!1054385 () Bool)

(assert (=> b!1143207 m!1054385))

(declare-fun m!1054387 () Bool)

(assert (=> bm!51670 m!1054387))

(declare-fun m!1054389 () Bool)

(assert (=> b!1143206 m!1054389))

(declare-fun m!1054391 () Bool)

(assert (=> b!1143206 m!1054391))

(declare-fun m!1054393 () Bool)

(assert (=> bm!51665 m!1054393))

(declare-fun m!1054395 () Bool)

(assert (=> b!1143203 m!1054395))

(declare-fun m!1054397 () Bool)

(assert (=> b!1143185 m!1054397))

(declare-fun m!1054399 () Bool)

(assert (=> b!1143205 m!1054399))

(assert (=> b!1143205 m!1054399))

(declare-fun m!1054401 () Bool)

(assert (=> b!1143205 m!1054401))

(declare-fun m!1054403 () Bool)

(assert (=> b!1143205 m!1054403))

(declare-fun m!1054405 () Bool)

(assert (=> b!1143208 m!1054405))

(declare-fun m!1054407 () Bool)

(assert (=> b!1143208 m!1054407))

(declare-fun m!1054409 () Bool)

(assert (=> b!1143208 m!1054409))

(assert (=> b!1143208 m!1054377))

(declare-fun m!1054411 () Bool)

(assert (=> b!1143208 m!1054411))

(assert (=> b!1143208 m!1054377))

(declare-fun m!1054413 () Bool)

(assert (=> b!1143208 m!1054413))

(declare-fun m!1054415 () Bool)

(assert (=> b!1143208 m!1054415))

(assert (=> b!1143208 m!1054407))

(declare-fun m!1054417 () Bool)

(assert (=> b!1143208 m!1054417))

(assert (=> b!1143208 m!1054409))

(assert (=> b!1143208 m!1054377))

(declare-fun m!1054419 () Bool)

(assert (=> b!1143198 m!1054419))

(declare-fun m!1054421 () Bool)

(assert (=> b!1143193 m!1054421))

(declare-fun m!1054423 () Bool)

(assert (=> b!1143187 m!1054423))

(declare-fun m!1054425 () Bool)

(assert (=> b!1143187 m!1054425))

(declare-fun m!1054427 () Bool)

(assert (=> b!1143187 m!1054427))

(declare-fun m!1054429 () Bool)

(assert (=> b!1143187 m!1054429))

(assert (=> bm!51664 m!1054405))

(declare-fun m!1054431 () Bool)

(assert (=> start!98572 m!1054431))

(declare-fun m!1054433 () Bool)

(assert (=> start!98572 m!1054433))

(declare-fun m!1054435 () Bool)

(assert (=> bm!51663 m!1054435))

(check-sat tp_is_empty!28707 (not b_lambda!19283) (not b!1143185) b_and!39205 (not b!1143208) (not bm!51670) (not b!1143203) (not b!1143198) (not b!1143186) (not b!1143194) (not b!1143210) (not b!1143202) (not bm!51665) (not b!1143205) (not b_next!24177) (not bm!51664) (not b!1143193) (not b!1143201) (not bm!51663) (not b!1143196) (not mapNonEmpty!44885) (not start!98572) (not b!1143207) (not b!1143187) (not b!1143206) (not bm!51668))
(check-sat b_and!39205 (not b_next!24177))
