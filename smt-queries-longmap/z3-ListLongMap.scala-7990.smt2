; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98774 () Bool)

(assert start!98774)

(declare-fun b_free!24385 () Bool)

(declare-fun b_next!24385 () Bool)

(assert (=> start!98774 (= b_free!24385 (not b_next!24385))))

(declare-fun tp!85865 () Bool)

(declare-fun b_and!39597 () Bool)

(assert (=> start!98774 (= tp!85865 b_and!39597)))

(declare-fun bm!54136 () Bool)

(declare-datatypes ((Unit!37757 0))(
  ( (Unit!37758) )
))
(declare-fun call!54139 () Unit!37757)

(declare-fun call!54145 () Unit!37757)

(assert (=> bm!54136 (= call!54139 call!54145)))

(declare-fun b!1152598 () Bool)

(declare-fun e!655524 () Bool)

(declare-fun e!655530 () Bool)

(assert (=> b!1152598 (= e!655524 e!655530)))

(declare-fun res!766269 () Bool)

(assert (=> b!1152598 (=> res!766269 e!655530)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152598 (= res!766269 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43681 0))(
  ( (V!43682 (val!14514 Int)) )
))
(declare-fun zeroValue!944 () V!43681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18512 0))(
  ( (tuple2!18513 (_1!9267 (_ BitVec 64)) (_2!9267 V!43681)) )
))
(declare-datatypes ((List!25243 0))(
  ( (Nil!25240) (Cons!25239 (h!26448 tuple2!18512) (t!36611 List!25243)) )
))
(declare-datatypes ((ListLongMap!16481 0))(
  ( (ListLongMap!16482 (toList!8256 List!25243)) )
))
(declare-fun lt!516263 () ListLongMap!16481)

(declare-datatypes ((array!74594 0))(
  ( (array!74595 (arr!35948 (Array (_ BitVec 32) (_ BitVec 64))) (size!36486 (_ BitVec 32))) )
))
(declare-fun lt!516267 () array!74594)

(declare-datatypes ((ValueCell!13748 0))(
  ( (ValueCellFull!13748 (v!17150 V!43681)) (EmptyCell!13748) )
))
(declare-datatypes ((array!74596 0))(
  ( (array!74597 (arr!35949 (Array (_ BitVec 32) ValueCell!13748)) (size!36487 (_ BitVec 32))) )
))
(declare-fun lt!516259 () array!74596)

(declare-fun minValue!944 () V!43681)

(declare-fun getCurrentListMapNoExtraKeys!4738 (array!74594 array!74596 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 32) Int) ListLongMap!16481)

(assert (=> b!1152598 (= lt!516263 (getCurrentListMapNoExtraKeys!4738 lt!516267 lt!516259 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516255 () V!43681)

(declare-fun _values!996 () array!74596)

(assert (=> b!1152598 (= lt!516259 (array!74597 (store (arr!35949 _values!996) i!673 (ValueCellFull!13748 lt!516255)) (size!36487 _values!996)))))

(declare-fun dynLambda!2699 (Int (_ BitVec 64)) V!43681)

(assert (=> b!1152598 (= lt!516255 (dynLambda!2699 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74594)

(declare-fun lt!516248 () ListLongMap!16481)

(assert (=> b!1152598 (= lt!516248 (getCurrentListMapNoExtraKeys!4738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1152599 () Bool)

(declare-fun c!114298 () Bool)

(declare-fun lt!516266 () Bool)

(assert (=> b!1152599 (= c!114298 (and (not lt!516266) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655531 () Unit!37757)

(declare-fun e!655536 () Unit!37757)

(assert (=> b!1152599 (= e!655531 e!655536)))

(declare-fun b!1152600 () Bool)

(declare-fun e!655523 () Bool)

(declare-fun e!655528 () Bool)

(assert (=> b!1152600 (= e!655523 e!655528)))

(declare-fun res!766266 () Bool)

(assert (=> b!1152600 (=> (not res!766266) (not e!655528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74594 (_ BitVec 32)) Bool)

(assert (=> b!1152600 (= res!766266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516267 mask!1564))))

(assert (=> b!1152600 (= lt!516267 (array!74595 (store (arr!35948 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36486 _keys!1208)))))

(declare-fun call!54144 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!114297 () Bool)

(declare-fun lt!516261 () ListLongMap!16481)

(declare-fun call!54142 () ListLongMap!16481)

(declare-fun bm!54137 () Bool)

(declare-fun contains!6709 (ListLongMap!16481 (_ BitVec 64)) Bool)

(assert (=> bm!54137 (= call!54144 (contains!6709 (ite c!114297 lt!516261 call!54142) k0!934))))

(declare-fun b!1152601 () Bool)

(declare-fun res!766267 () Bool)

(assert (=> b!1152601 (=> (not res!766267) (not e!655523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152601 (= res!766267 (validMask!0 mask!1564))))

(declare-fun b!1152602 () Bool)

(declare-fun e!655529 () Bool)

(declare-fun arrayContainsKey!0 (array!74594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152602 (= e!655529 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152603 () Bool)

(declare-fun e!655533 () Bool)

(declare-fun tp_is_empty!28915 () Bool)

(assert (=> b!1152603 (= e!655533 tp_is_empty!28915)))

(declare-fun call!54143 () ListLongMap!16481)

(declare-fun bm!54138 () Bool)

(assert (=> bm!54138 (= call!54143 (getCurrentListMapNoExtraKeys!4738 lt!516267 lt!516259 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152604 () Bool)

(declare-fun lt!516260 () ListLongMap!16481)

(declare-fun e!655526 () Bool)

(assert (=> b!1152604 (= e!655526 (= lt!516260 (getCurrentListMapNoExtraKeys!4738 lt!516267 lt!516259 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152605 () Bool)

(declare-fun e!655525 () Bool)

(declare-fun e!655538 () Bool)

(declare-fun mapRes!45197 () Bool)

(assert (=> b!1152605 (= e!655525 (and e!655538 mapRes!45197))))

(declare-fun condMapEmpty!45197 () Bool)

(declare-fun mapDefault!45197 () ValueCell!13748)

(assert (=> b!1152605 (= condMapEmpty!45197 (= (arr!35949 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13748)) mapDefault!45197)))))

(declare-fun lt!516251 () ListLongMap!16481)

(declare-fun bm!54139 () Bool)

(declare-fun addStillContains!880 (ListLongMap!16481 (_ BitVec 64) V!43681 (_ BitVec 64)) Unit!37757)

(assert (=> bm!54139 (= call!54145 (addStillContains!880 (ite c!114297 lt!516261 lt!516251) (ite c!114297 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114298 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114297 minValue!944 (ite c!114298 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!45197 () Bool)

(declare-fun tp!85866 () Bool)

(assert (=> mapNonEmpty!45197 (= mapRes!45197 (and tp!85866 e!655533))))

(declare-fun mapKey!45197 () (_ BitVec 32))

(declare-fun mapValue!45197 () ValueCell!13748)

(declare-fun mapRest!45197 () (Array (_ BitVec 32) ValueCell!13748))

(assert (=> mapNonEmpty!45197 (= (arr!35949 _values!996) (store mapRest!45197 mapKey!45197 mapValue!45197))))

(declare-fun b!1152606 () Bool)

(declare-fun e!655534 () Unit!37757)

(declare-fun Unit!37759 () Unit!37757)

(assert (=> b!1152606 (= e!655534 Unit!37759)))

(declare-fun b!1152607 () Bool)

(declare-fun e!655527 () Unit!37757)

(assert (=> b!1152607 (= e!655536 e!655527)))

(declare-fun c!114299 () Bool)

(assert (=> b!1152607 (= c!114299 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516266))))

(declare-fun b!1152608 () Bool)

(declare-fun res!766268 () Bool)

(assert (=> b!1152608 (=> (not res!766268) (not e!655523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152608 (= res!766268 (validKeyInArray!0 k0!934))))

(declare-fun e!655532 () Bool)

(declare-fun b!1152609 () Bool)

(assert (=> b!1152609 (= e!655532 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!54141 () ListLongMap!16481)

(declare-fun bm!54140 () Bool)

(assert (=> bm!54140 (= call!54141 (getCurrentListMapNoExtraKeys!4738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152610 () Bool)

(assert (=> b!1152610 (= e!655532 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516266) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1152611 () Bool)

(assert (=> b!1152611 (= e!655528 (not e!655524))))

(declare-fun res!766274 () Bool)

(assert (=> b!1152611 (=> res!766274 e!655524)))

(assert (=> b!1152611 (= res!766274 (bvsgt from!1455 i!673))))

(assert (=> b!1152611 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516262 () Unit!37757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74594 (_ BitVec 64) (_ BitVec 32)) Unit!37757)

(assert (=> b!1152611 (= lt!516262 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1152612 () Bool)

(declare-fun res!766272 () Bool)

(assert (=> b!1152612 (=> (not res!766272) (not e!655523))))

(assert (=> b!1152612 (= res!766272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152613 () Bool)

(declare-fun e!655537 () Bool)

(declare-fun -!1318 (ListLongMap!16481 (_ BitVec 64)) ListLongMap!16481)

(assert (=> b!1152613 (= e!655537 (= call!54143 (-!1318 call!54141 k0!934)))))

(declare-fun b!1152614 () Bool)

(assert (=> b!1152614 (= e!655538 tp_is_empty!28915)))

(declare-fun bm!54141 () Bool)

(declare-fun call!54146 () ListLongMap!16481)

(assert (=> bm!54141 (= call!54142 call!54146)))

(declare-fun b!1152615 () Bool)

(declare-fun Unit!37760 () Unit!37757)

(assert (=> b!1152615 (= e!655527 Unit!37760)))

(declare-fun b!1152616 () Bool)

(declare-fun res!766276 () Bool)

(assert (=> b!1152616 (=> (not res!766276) (not e!655523))))

(assert (=> b!1152616 (= res!766276 (= (select (arr!35948 _keys!1208) i!673) k0!934))))

(declare-fun b!1152617 () Bool)

(assert (=> b!1152617 (contains!6709 call!54146 k0!934)))

(declare-fun lt!516257 () Unit!37757)

(assert (=> b!1152617 (= lt!516257 call!54145)))

(assert (=> b!1152617 call!54144))

(declare-fun +!3669 (ListLongMap!16481 tuple2!18512) ListLongMap!16481)

(assert (=> b!1152617 (= lt!516261 (+!3669 lt!516251 (tuple2!18513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516254 () Unit!37757)

(assert (=> b!1152617 (= lt!516254 (addStillContains!880 lt!516251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1152617 (= e!655531 lt!516257)))

(declare-fun b!1152618 () Bool)

(declare-fun res!766265 () Bool)

(assert (=> b!1152618 (=> (not res!766265) (not e!655523))))

(assert (=> b!1152618 (= res!766265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36486 _keys!1208))))))

(declare-fun b!1152619 () Bool)

(declare-fun res!766263 () Bool)

(assert (=> b!1152619 (=> (not res!766263) (not e!655528))))

(declare-datatypes ((List!25244 0))(
  ( (Nil!25241) (Cons!25240 (h!26449 (_ BitVec 64)) (t!36612 List!25244)) )
))
(declare-fun arrayNoDuplicates!0 (array!74594 (_ BitVec 32) List!25244) Bool)

(assert (=> b!1152619 (= res!766263 (arrayNoDuplicates!0 lt!516267 #b00000000000000000000000000000000 Nil!25241))))

(declare-fun bm!54142 () Bool)

(declare-fun call!54140 () Bool)

(assert (=> bm!54142 (= call!54140 call!54144)))

(declare-fun b!1152620 () Bool)

(declare-fun e!655535 () Bool)

(assert (=> b!1152620 (= e!655535 true)))

(assert (=> b!1152620 e!655526))

(declare-fun res!766264 () Bool)

(assert (=> b!1152620 (=> (not res!766264) (not e!655526))))

(assert (=> b!1152620 (= res!766264 (= lt!516260 lt!516251))))

(assert (=> b!1152620 (= lt!516260 (-!1318 lt!516248 k0!934))))

(declare-fun lt!516265 () V!43681)

(assert (=> b!1152620 (= (-!1318 (+!3669 lt!516251 (tuple2!18513 (select (arr!35948 _keys!1208) from!1455) lt!516265)) (select (arr!35948 _keys!1208) from!1455)) lt!516251)))

(declare-fun lt!516252 () Unit!37757)

(declare-fun addThenRemoveForNewKeyIsSame!174 (ListLongMap!16481 (_ BitVec 64) V!43681) Unit!37757)

(assert (=> b!1152620 (= lt!516252 (addThenRemoveForNewKeyIsSame!174 lt!516251 (select (arr!35948 _keys!1208) from!1455) lt!516265))))

(declare-fun get!18316 (ValueCell!13748 V!43681) V!43681)

(assert (=> b!1152620 (= lt!516265 (get!18316 (select (arr!35949 _values!996) from!1455) lt!516255))))

(declare-fun lt!516246 () Unit!37757)

(assert (=> b!1152620 (= lt!516246 e!655534)))

(declare-fun c!114302 () Bool)

(assert (=> b!1152620 (= c!114302 (contains!6709 lt!516251 k0!934))))

(assert (=> b!1152620 (= lt!516251 (getCurrentListMapNoExtraKeys!4738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152621 () Bool)

(declare-fun lt!516256 () Unit!37757)

(assert (=> b!1152621 (= e!655536 lt!516256)))

(assert (=> b!1152621 (= lt!516256 call!54139)))

(assert (=> b!1152621 call!54140))

(declare-fun b!1152622 () Bool)

(declare-fun res!766277 () Bool)

(assert (=> b!1152622 (=> (not res!766277) (not e!655523))))

(assert (=> b!1152622 (= res!766277 (and (= (size!36487 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36486 _keys!1208) (size!36487 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152623 () Bool)

(assert (=> b!1152623 (= e!655530 e!655535)))

(declare-fun res!766270 () Bool)

(assert (=> b!1152623 (=> res!766270 e!655535)))

(assert (=> b!1152623 (= res!766270 (not (= (select (arr!35948 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1152623 e!655537))

(declare-fun c!114300 () Bool)

(assert (=> b!1152623 (= c!114300 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516258 () Unit!37757)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!593 (array!74594 array!74596 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37757)

(assert (=> b!1152623 (= lt!516258 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152624 () Bool)

(assert (=> b!1152624 (= e!655537 (= call!54143 call!54141))))

(declare-fun bm!54143 () Bool)

(assert (=> bm!54143 (= call!54146 (+!3669 (ite c!114297 lt!516261 lt!516251) (ite c!114297 (tuple2!18513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114298 (tuple2!18513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152625 () Bool)

(assert (=> b!1152625 call!54140))

(declare-fun lt!516249 () Unit!37757)

(assert (=> b!1152625 (= lt!516249 call!54139)))

(assert (=> b!1152625 (= e!655527 lt!516249)))

(declare-fun mapIsEmpty!45197 () Bool)

(assert (=> mapIsEmpty!45197 mapRes!45197))

(declare-fun b!1152626 () Bool)

(declare-fun res!766273 () Bool)

(assert (=> b!1152626 (=> (not res!766273) (not e!655523))))

(assert (=> b!1152626 (= res!766273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25241))))

(declare-fun res!766271 () Bool)

(assert (=> start!98774 (=> (not res!766271) (not e!655523))))

(assert (=> start!98774 (= res!766271 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36486 _keys!1208))))))

(assert (=> start!98774 e!655523))

(assert (=> start!98774 tp_is_empty!28915))

(declare-fun array_inv!27620 (array!74594) Bool)

(assert (=> start!98774 (array_inv!27620 _keys!1208)))

(assert (=> start!98774 true))

(assert (=> start!98774 tp!85865))

(declare-fun array_inv!27621 (array!74596) Bool)

(assert (=> start!98774 (and (array_inv!27621 _values!996) e!655525)))

(declare-fun b!1152627 () Bool)

(declare-fun Unit!37761 () Unit!37757)

(assert (=> b!1152627 (= e!655534 Unit!37761)))

(assert (=> b!1152627 (= lt!516266 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152627 (= c!114297 (and (not lt!516266) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516253 () Unit!37757)

(assert (=> b!1152627 (= lt!516253 e!655531)))

(declare-fun lt!516264 () Unit!37757)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!469 (array!74594 array!74596 (_ BitVec 32) (_ BitVec 32) V!43681 V!43681 (_ BitVec 64) (_ BitVec 32) Int) Unit!37757)

(assert (=> b!1152627 (= lt!516264 (lemmaListMapContainsThenArrayContainsFrom!469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114301 () Bool)

(assert (=> b!1152627 (= c!114301 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766275 () Bool)

(assert (=> b!1152627 (= res!766275 e!655532)))

(assert (=> b!1152627 (=> (not res!766275) (not e!655529))))

(assert (=> b!1152627 e!655529))

(declare-fun lt!516247 () Unit!37757)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74594 (_ BitVec 32) (_ BitVec 32)) Unit!37757)

(assert (=> b!1152627 (= lt!516247 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1152627 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25241)))

(declare-fun lt!516250 () Unit!37757)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74594 (_ BitVec 64) (_ BitVec 32) List!25244) Unit!37757)

(assert (=> b!1152627 (= lt!516250 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25241))))

(assert (=> b!1152627 false))

(assert (= (and start!98774 res!766271) b!1152601))

(assert (= (and b!1152601 res!766267) b!1152622))

(assert (= (and b!1152622 res!766277) b!1152612))

(assert (= (and b!1152612 res!766272) b!1152626))

(assert (= (and b!1152626 res!766273) b!1152618))

(assert (= (and b!1152618 res!766265) b!1152608))

(assert (= (and b!1152608 res!766268) b!1152616))

(assert (= (and b!1152616 res!766276) b!1152600))

(assert (= (and b!1152600 res!766266) b!1152619))

(assert (= (and b!1152619 res!766263) b!1152611))

(assert (= (and b!1152611 (not res!766274)) b!1152598))

(assert (= (and b!1152598 (not res!766269)) b!1152623))

(assert (= (and b!1152623 c!114300) b!1152613))

(assert (= (and b!1152623 (not c!114300)) b!1152624))

(assert (= (or b!1152613 b!1152624) bm!54138))

(assert (= (or b!1152613 b!1152624) bm!54140))

(assert (= (and b!1152623 (not res!766270)) b!1152620))

(assert (= (and b!1152620 c!114302) b!1152627))

(assert (= (and b!1152620 (not c!114302)) b!1152606))

(assert (= (and b!1152627 c!114297) b!1152617))

(assert (= (and b!1152627 (not c!114297)) b!1152599))

(assert (= (and b!1152599 c!114298) b!1152621))

(assert (= (and b!1152599 (not c!114298)) b!1152607))

(assert (= (and b!1152607 c!114299) b!1152625))

(assert (= (and b!1152607 (not c!114299)) b!1152615))

(assert (= (or b!1152621 b!1152625) bm!54136))

(assert (= (or b!1152621 b!1152625) bm!54141))

(assert (= (or b!1152621 b!1152625) bm!54142))

(assert (= (or b!1152617 bm!54142) bm!54137))

(assert (= (or b!1152617 bm!54136) bm!54139))

(assert (= (or b!1152617 bm!54141) bm!54143))

(assert (= (and b!1152627 c!114301) b!1152609))

(assert (= (and b!1152627 (not c!114301)) b!1152610))

(assert (= (and b!1152627 res!766275) b!1152602))

(assert (= (and b!1152620 res!766264) b!1152604))

(assert (= (and b!1152605 condMapEmpty!45197) mapIsEmpty!45197))

(assert (= (and b!1152605 (not condMapEmpty!45197)) mapNonEmpty!45197))

(get-info :version)

(assert (= (and mapNonEmpty!45197 ((_ is ValueCellFull!13748) mapValue!45197)) b!1152603))

(assert (= (and b!1152605 ((_ is ValueCellFull!13748) mapDefault!45197)) b!1152614))

(assert (= start!98774 b!1152605))

(declare-fun b_lambda!19473 () Bool)

(assert (=> (not b_lambda!19473) (not b!1152598)))

(declare-fun t!36610 () Bool)

(declare-fun tb!9189 () Bool)

(assert (=> (and start!98774 (= defaultEntry!1004 defaultEntry!1004) t!36610) tb!9189))

(declare-fun result!18951 () Bool)

(assert (=> tb!9189 (= result!18951 tp_is_empty!28915)))

(assert (=> b!1152598 t!36610))

(declare-fun b_and!39599 () Bool)

(assert (= b_and!39597 (and (=> t!36610 result!18951) b_and!39599)))

(declare-fun m!1062063 () Bool)

(assert (=> b!1152601 m!1062063))

(declare-fun m!1062065 () Bool)

(assert (=> bm!54143 m!1062065))

(declare-fun m!1062067 () Bool)

(assert (=> b!1152598 m!1062067))

(declare-fun m!1062069 () Bool)

(assert (=> b!1152598 m!1062069))

(declare-fun m!1062071 () Bool)

(assert (=> b!1152598 m!1062071))

(declare-fun m!1062073 () Bool)

(assert (=> b!1152598 m!1062073))

(declare-fun m!1062075 () Bool)

(assert (=> b!1152604 m!1062075))

(declare-fun m!1062077 () Bool)

(assert (=> bm!54137 m!1062077))

(declare-fun m!1062079 () Bool)

(assert (=> bm!54139 m!1062079))

(declare-fun m!1062081 () Bool)

(assert (=> bm!54140 m!1062081))

(declare-fun m!1062083 () Bool)

(assert (=> b!1152613 m!1062083))

(declare-fun m!1062085 () Bool)

(assert (=> b!1152620 m!1062085))

(declare-fun m!1062087 () Bool)

(assert (=> b!1152620 m!1062087))

(declare-fun m!1062089 () Bool)

(assert (=> b!1152620 m!1062089))

(assert (=> b!1152620 m!1062081))

(declare-fun m!1062091 () Bool)

(assert (=> b!1152620 m!1062091))

(declare-fun m!1062093 () Bool)

(assert (=> b!1152620 m!1062093))

(declare-fun m!1062095 () Bool)

(assert (=> b!1152620 m!1062095))

(declare-fun m!1062097 () Bool)

(assert (=> b!1152620 m!1062097))

(assert (=> b!1152620 m!1062087))

(declare-fun m!1062099 () Bool)

(assert (=> b!1152620 m!1062099))

(assert (=> b!1152620 m!1062087))

(assert (=> b!1152620 m!1062095))

(assert (=> b!1152620 m!1062085))

(declare-fun m!1062101 () Bool)

(assert (=> b!1152612 m!1062101))

(declare-fun m!1062103 () Bool)

(assert (=> b!1152627 m!1062103))

(declare-fun m!1062105 () Bool)

(assert (=> b!1152627 m!1062105))

(declare-fun m!1062107 () Bool)

(assert (=> b!1152627 m!1062107))

(declare-fun m!1062109 () Bool)

(assert (=> b!1152627 m!1062109))

(declare-fun m!1062111 () Bool)

(assert (=> start!98774 m!1062111))

(declare-fun m!1062113 () Bool)

(assert (=> start!98774 m!1062113))

(assert (=> bm!54138 m!1062075))

(declare-fun m!1062115 () Bool)

(assert (=> b!1152626 m!1062115))

(declare-fun m!1062117 () Bool)

(assert (=> b!1152611 m!1062117))

(declare-fun m!1062119 () Bool)

(assert (=> b!1152611 m!1062119))

(declare-fun m!1062121 () Bool)

(assert (=> b!1152609 m!1062121))

(declare-fun m!1062123 () Bool)

(assert (=> b!1152608 m!1062123))

(declare-fun m!1062125 () Bool)

(assert (=> b!1152600 m!1062125))

(declare-fun m!1062127 () Bool)

(assert (=> b!1152600 m!1062127))

(declare-fun m!1062129 () Bool)

(assert (=> b!1152617 m!1062129))

(declare-fun m!1062131 () Bool)

(assert (=> b!1152617 m!1062131))

(declare-fun m!1062133 () Bool)

(assert (=> b!1152617 m!1062133))

(assert (=> b!1152602 m!1062121))

(declare-fun m!1062135 () Bool)

(assert (=> b!1152619 m!1062135))

(declare-fun m!1062137 () Bool)

(assert (=> b!1152616 m!1062137))

(assert (=> b!1152623 m!1062087))

(declare-fun m!1062139 () Bool)

(assert (=> b!1152623 m!1062139))

(declare-fun m!1062141 () Bool)

(assert (=> mapNonEmpty!45197 m!1062141))

(check-sat b_and!39599 (not bm!54137) (not mapNonEmpty!45197) (not bm!54143) (not start!98774) (not b!1152609) (not b!1152627) (not bm!54139) tp_is_empty!28915 (not b!1152601) (not b!1152612) (not b_next!24385) (not b!1152611) (not b!1152626) (not b!1152600) (not b!1152623) (not b!1152617) (not b!1152604) (not bm!54140) (not b!1152613) (not b_lambda!19473) (not b!1152608) (not b!1152620) (not b!1152619) (not b!1152602) (not bm!54138) (not b!1152598))
(check-sat b_and!39599 (not b_next!24385))
