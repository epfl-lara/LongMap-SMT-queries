; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98854 () Bool)

(assert start!98854)

(declare-fun b_free!24223 () Bool)

(declare-fun b_next!24223 () Bool)

(assert (=> start!98854 (= b_free!24223 (not b_next!24223))))

(declare-fun tp!85380 () Bool)

(declare-fun b_and!39297 () Bool)

(assert (=> start!98854 (= tp!85380 b_and!39297)))

(declare-datatypes ((V!43465 0))(
  ( (V!43466 (val!14433 Int)) )
))
(declare-fun zeroValue!944 () V!43465)

(declare-datatypes ((array!74403 0))(
  ( (array!74404 (arr!35846 (Array (_ BitVec 32) (_ BitVec 64))) (size!36383 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74403)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18298 0))(
  ( (tuple2!18299 (_1!9160 (_ BitVec 64)) (_2!9160 V!43465)) )
))
(declare-datatypes ((List!25053 0))(
  ( (Nil!25050) (Cons!25049 (h!26267 tuple2!18298) (t!36260 List!25053)) )
))
(declare-datatypes ((ListLongMap!16275 0))(
  ( (ListLongMap!16276 (toList!8153 List!25053)) )
))
(declare-fun call!52289 () ListLongMap!16275)

(declare-fun bm!52280 () Bool)

(declare-datatypes ((ValueCell!13667 0))(
  ( (ValueCellFull!13667 (v!17066 V!43465)) (EmptyCell!13667) )
))
(declare-datatypes ((array!74405 0))(
  ( (array!74406 (arr!35847 (Array (_ BitVec 32) ValueCell!13667)) (size!36384 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74405)

(declare-fun minValue!944 () V!43465)

(declare-fun getCurrentListMapNoExtraKeys!4657 (array!74403 array!74405 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) Int) ListLongMap!16275)

(assert (=> bm!52280 (= call!52289 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52281 () Bool)

(declare-fun call!52288 () ListLongMap!16275)

(declare-fun call!52284 () ListLongMap!16275)

(assert (=> bm!52281 (= call!52288 call!52284)))

(declare-fun b!1146559 () Bool)

(declare-fun res!763198 () Bool)

(declare-fun e!652318 () Bool)

(assert (=> b!1146559 (=> (not res!763198) (not e!652318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74403 (_ BitVec 32)) Bool)

(assert (=> b!1146559 (= res!763198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!763199 () Bool)

(assert (=> start!98854 (=> (not res!763199) (not e!652318))))

(assert (=> start!98854 (= res!763199 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36383 _keys!1208))))))

(assert (=> start!98854 e!652318))

(declare-fun tp_is_empty!28753 () Bool)

(assert (=> start!98854 tp_is_empty!28753))

(declare-fun array_inv!27510 (array!74403) Bool)

(assert (=> start!98854 (array_inv!27510 _keys!1208)))

(assert (=> start!98854 true))

(assert (=> start!98854 tp!85380))

(declare-fun e!652307 () Bool)

(declare-fun array_inv!27511 (array!74405) Bool)

(assert (=> start!98854 (and (array_inv!27511 _values!996) e!652307)))

(declare-fun b!1146560 () Bool)

(declare-fun c!113266 () Bool)

(declare-fun lt!511717 () Bool)

(assert (=> b!1146560 (= c!113266 (and (not lt!511717) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37578 0))(
  ( (Unit!37579) )
))
(declare-fun e!652313 () Unit!37578)

(declare-fun e!652310 () Unit!37578)

(assert (=> b!1146560 (= e!652313 e!652310)))

(declare-fun mapNonEmpty!44954 () Bool)

(declare-fun mapRes!44954 () Bool)

(declare-fun tp!85379 () Bool)

(declare-fun e!652316 () Bool)

(assert (=> mapNonEmpty!44954 (= mapRes!44954 (and tp!85379 e!652316))))

(declare-fun mapKey!44954 () (_ BitVec 32))

(declare-fun mapValue!44954 () ValueCell!13667)

(declare-fun mapRest!44954 () (Array (_ BitVec 32) ValueCell!13667))

(assert (=> mapNonEmpty!44954 (= (arr!35847 _values!996) (store mapRest!44954 mapKey!44954 mapValue!44954))))

(declare-fun lt!511716 () array!74403)

(declare-fun bm!52282 () Bool)

(declare-fun call!52285 () ListLongMap!16275)

(declare-fun lt!511707 () array!74405)

(assert (=> bm!52282 (= call!52285 (getCurrentListMapNoExtraKeys!4657 lt!511716 lt!511707 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146561 () Bool)

(declare-fun e!652311 () Bool)

(assert (=> b!1146561 (= e!652307 (and e!652311 mapRes!44954))))

(declare-fun condMapEmpty!44954 () Bool)

(declare-fun mapDefault!44954 () ValueCell!13667)

(assert (=> b!1146561 (= condMapEmpty!44954 (= (arr!35847 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13667)) mapDefault!44954)))))

(declare-fun b!1146562 () Bool)

(declare-fun e!652314 () Bool)

(declare-fun e!652315 () Bool)

(assert (=> b!1146562 (= e!652314 (not e!652315))))

(declare-fun res!763204 () Bool)

(assert (=> b!1146562 (=> res!763204 e!652315)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146562 (= res!763204 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146562 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511711 () Unit!37578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74403 (_ BitVec 64) (_ BitVec 32)) Unit!37578)

(assert (=> b!1146562 (= lt!511711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146563 () Bool)

(declare-fun e!652302 () Unit!37578)

(declare-fun Unit!37580 () Unit!37578)

(assert (=> b!1146563 (= e!652302 Unit!37580)))

(declare-fun b!1146564 () Bool)

(declare-fun res!763197 () Bool)

(assert (=> b!1146564 (=> (not res!763197) (not e!652318))))

(assert (=> b!1146564 (= res!763197 (and (= (size!36384 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36383 _keys!1208) (size!36384 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44954 () Bool)

(assert (=> mapIsEmpty!44954 mapRes!44954))

(declare-fun b!1146565 () Bool)

(declare-fun res!763194 () Bool)

(assert (=> b!1146565 (=> (not res!763194) (not e!652318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146565 (= res!763194 (validKeyInArray!0 k0!934))))

(declare-fun e!652306 () Bool)

(declare-fun b!1146566 () Bool)

(assert (=> b!1146566 (= e!652306 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146567 () Bool)

(assert (=> b!1146567 (= e!652311 tp_is_empty!28753)))

(declare-fun b!1146568 () Bool)

(declare-fun e!652304 () Unit!37578)

(declare-fun Unit!37581 () Unit!37578)

(assert (=> b!1146568 (= e!652304 Unit!37581)))

(declare-fun bm!52283 () Bool)

(declare-fun call!52283 () Unit!37578)

(declare-fun call!52290 () Unit!37578)

(assert (=> bm!52283 (= call!52283 call!52290)))

(declare-fun b!1146569 () Bool)

(declare-fun res!763195 () Bool)

(assert (=> b!1146569 (=> (not res!763195) (not e!652314))))

(declare-datatypes ((List!25054 0))(
  ( (Nil!25051) (Cons!25050 (h!26268 (_ BitVec 64)) (t!36261 List!25054)) )
))
(declare-fun arrayNoDuplicates!0 (array!74403 (_ BitVec 32) List!25054) Bool)

(assert (=> b!1146569 (= res!763195 (arrayNoDuplicates!0 lt!511716 #b00000000000000000000000000000000 Nil!25051))))

(declare-fun b!1146570 () Bool)

(declare-fun e!652305 () Bool)

(assert (=> b!1146570 (= e!652305 (= call!52285 call!52289))))

(declare-fun b!1146571 () Bool)

(declare-fun call!52286 () Bool)

(assert (=> b!1146571 call!52286))

(declare-fun lt!511710 () Unit!37578)

(assert (=> b!1146571 (= lt!511710 call!52283)))

(assert (=> b!1146571 (= e!652304 lt!511710)))

(declare-fun c!113265 () Bool)

(declare-fun lt!511704 () ListLongMap!16275)

(declare-fun lt!511718 () ListLongMap!16275)

(declare-fun bm!52284 () Bool)

(declare-fun addStillContains!821 (ListLongMap!16275 (_ BitVec 64) V!43465 (_ BitVec 64)) Unit!37578)

(assert (=> bm!52284 (= call!52290 (addStillContains!821 (ite c!113265 lt!511704 lt!511718) (ite c!113265 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113266 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113265 minValue!944 (ite c!113266 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!52285 () Bool)

(declare-fun call!52287 () Bool)

(assert (=> bm!52285 (= call!52286 call!52287)))

(declare-fun b!1146572 () Bool)

(declare-fun res!763206 () Bool)

(assert (=> b!1146572 (=> (not res!763206) (not e!652318))))

(assert (=> b!1146572 (= res!763206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36383 _keys!1208))))))

(declare-fun bm!52286 () Bool)

(declare-fun contains!6693 (ListLongMap!16275 (_ BitVec 64)) Bool)

(assert (=> bm!52286 (= call!52287 (contains!6693 (ite c!113265 lt!511704 call!52288) k0!934))))

(declare-fun b!1146573 () Bool)

(assert (=> b!1146573 (= e!652310 e!652304)))

(declare-fun c!113267 () Bool)

(assert (=> b!1146573 (= c!113267 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511717))))

(declare-fun b!1146574 () Bool)

(declare-fun res!763200 () Bool)

(assert (=> b!1146574 (=> (not res!763200) (not e!652318))))

(assert (=> b!1146574 (= res!763200 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25051))))

(declare-fun b!1146575 () Bool)

(declare-fun e!652312 () Bool)

(assert (=> b!1146575 (= e!652312 true)))

(declare-fun e!652303 () Bool)

(assert (=> b!1146575 e!652303))

(declare-fun res!763203 () Bool)

(assert (=> b!1146575 (=> (not res!763203) (not e!652303))))

(declare-fun lt!511709 () V!43465)

(declare-fun -!1279 (ListLongMap!16275 (_ BitVec 64)) ListLongMap!16275)

(declare-fun +!3594 (ListLongMap!16275 tuple2!18298) ListLongMap!16275)

(assert (=> b!1146575 (= res!763203 (= (-!1279 (+!3594 lt!511718 (tuple2!18299 (select (arr!35846 _keys!1208) from!1455) lt!511709)) (select (arr!35846 _keys!1208) from!1455)) lt!511718))))

(declare-fun lt!511702 () Unit!37578)

(declare-fun addThenRemoveForNewKeyIsSame!134 (ListLongMap!16275 (_ BitVec 64) V!43465) Unit!37578)

(assert (=> b!1146575 (= lt!511702 (addThenRemoveForNewKeyIsSame!134 lt!511718 (select (arr!35846 _keys!1208) from!1455) lt!511709))))

(declare-fun lt!511701 () V!43465)

(declare-fun get!18253 (ValueCell!13667 V!43465) V!43465)

(assert (=> b!1146575 (= lt!511709 (get!18253 (select (arr!35847 _values!996) from!1455) lt!511701))))

(declare-fun lt!511720 () Unit!37578)

(assert (=> b!1146575 (= lt!511720 e!652302)))

(declare-fun c!113263 () Bool)

(assert (=> b!1146575 (= c!113263 (contains!6693 lt!511718 k0!934))))

(assert (=> b!1146575 (= lt!511718 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146576 () Bool)

(declare-fun res!763196 () Bool)

(assert (=> b!1146576 (=> (not res!763196) (not e!652318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146576 (= res!763196 (validMask!0 mask!1564))))

(declare-fun b!1146577 () Bool)

(declare-fun e!652317 () Bool)

(assert (=> b!1146577 (= e!652315 e!652317)))

(declare-fun res!763201 () Bool)

(assert (=> b!1146577 (=> res!763201 e!652317)))

(assert (=> b!1146577 (= res!763201 (not (= from!1455 i!673)))))

(declare-fun lt!511719 () ListLongMap!16275)

(assert (=> b!1146577 (= lt!511719 (getCurrentListMapNoExtraKeys!4657 lt!511716 lt!511707 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146577 (= lt!511707 (array!74406 (store (arr!35847 _values!996) i!673 (ValueCellFull!13667 lt!511701)) (size!36384 _values!996)))))

(declare-fun dynLambda!2686 (Int (_ BitVec 64)) V!43465)

(assert (=> b!1146577 (= lt!511701 (dynLambda!2686 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511703 () ListLongMap!16275)

(assert (=> b!1146577 (= lt!511703 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52287 () Bool)

(assert (=> bm!52287 (= call!52284 (+!3594 lt!511718 (ite (or c!113265 c!113266) (tuple2!18299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146578 () Bool)

(assert (=> b!1146578 (= e!652316 tp_is_empty!28753)))

(declare-fun b!1146579 () Bool)

(assert (=> b!1146579 (= e!652303 (= (-!1279 lt!511703 k0!934) lt!511718))))

(declare-fun b!1146580 () Bool)

(declare-fun res!763193 () Bool)

(assert (=> b!1146580 (=> (not res!763193) (not e!652318))))

(assert (=> b!1146580 (= res!763193 (= (select (arr!35846 _keys!1208) i!673) k0!934))))

(declare-fun b!1146581 () Bool)

(assert (=> b!1146581 (= e!652318 e!652314)))

(declare-fun res!763202 () Bool)

(assert (=> b!1146581 (=> (not res!763202) (not e!652314))))

(assert (=> b!1146581 (= res!763202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511716 mask!1564))))

(assert (=> b!1146581 (= lt!511716 (array!74404 (store (arr!35846 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36383 _keys!1208)))))

(declare-fun b!1146582 () Bool)

(assert (=> b!1146582 (= e!652317 e!652312)))

(declare-fun res!763192 () Bool)

(assert (=> b!1146582 (=> res!763192 e!652312)))

(assert (=> b!1146582 (= res!763192 (not (= (select (arr!35846 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146582 e!652305))

(declare-fun c!113268 () Bool)

(assert (=> b!1146582 (= c!113268 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511705 () Unit!37578)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!526 (array!74403 array!74405 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37578)

(assert (=> b!1146582 (= lt!511705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146583 () Bool)

(assert (=> b!1146583 (= e!652305 (= call!52285 (-!1279 call!52289 k0!934)))))

(declare-fun b!1146584 () Bool)

(declare-fun Unit!37582 () Unit!37578)

(assert (=> b!1146584 (= e!652302 Unit!37582)))

(assert (=> b!1146584 (= lt!511717 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146584 (= c!113265 (and (not lt!511717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511713 () Unit!37578)

(assert (=> b!1146584 (= lt!511713 e!652313)))

(declare-fun lt!511708 () Unit!37578)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!418 (array!74403 array!74405 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 64) (_ BitVec 32) Int) Unit!37578)

(assert (=> b!1146584 (= lt!511708 (lemmaListMapContainsThenArrayContainsFrom!418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113264 () Bool)

(assert (=> b!1146584 (= c!113264 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763205 () Bool)

(declare-fun e!652308 () Bool)

(assert (=> b!1146584 (= res!763205 e!652308)))

(assert (=> b!1146584 (=> (not res!763205) (not e!652306))))

(assert (=> b!1146584 e!652306))

(declare-fun lt!511700 () Unit!37578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74403 (_ BitVec 32) (_ BitVec 32)) Unit!37578)

(assert (=> b!1146584 (= lt!511700 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146584 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25051)))

(declare-fun lt!511712 () Unit!37578)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74403 (_ BitVec 64) (_ BitVec 32) List!25054) Unit!37578)

(assert (=> b!1146584 (= lt!511712 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25051))))

(assert (=> b!1146584 false))

(declare-fun b!1146585 () Bool)

(declare-fun lt!511714 () Unit!37578)

(assert (=> b!1146585 (= e!652310 lt!511714)))

(assert (=> b!1146585 (= lt!511714 call!52283)))

(assert (=> b!1146585 call!52286))

(declare-fun b!1146586 () Bool)

(assert (=> b!1146586 (= e!652308 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511717) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146587 () Bool)

(assert (=> b!1146587 (contains!6693 (+!3594 lt!511704 (tuple2!18299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511715 () Unit!37578)

(assert (=> b!1146587 (= lt!511715 call!52290)))

(assert (=> b!1146587 call!52287))

(assert (=> b!1146587 (= lt!511704 call!52284)))

(declare-fun lt!511706 () Unit!37578)

(assert (=> b!1146587 (= lt!511706 (addStillContains!821 lt!511718 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1146587 (= e!652313 lt!511715)))

(declare-fun b!1146588 () Bool)

(assert (=> b!1146588 (= e!652308 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98854 res!763199) b!1146576))

(assert (= (and b!1146576 res!763196) b!1146564))

(assert (= (and b!1146564 res!763197) b!1146559))

(assert (= (and b!1146559 res!763198) b!1146574))

(assert (= (and b!1146574 res!763200) b!1146572))

(assert (= (and b!1146572 res!763206) b!1146565))

(assert (= (and b!1146565 res!763194) b!1146580))

(assert (= (and b!1146580 res!763193) b!1146581))

(assert (= (and b!1146581 res!763202) b!1146569))

(assert (= (and b!1146569 res!763195) b!1146562))

(assert (= (and b!1146562 (not res!763204)) b!1146577))

(assert (= (and b!1146577 (not res!763201)) b!1146582))

(assert (= (and b!1146582 c!113268) b!1146583))

(assert (= (and b!1146582 (not c!113268)) b!1146570))

(assert (= (or b!1146583 b!1146570) bm!52282))

(assert (= (or b!1146583 b!1146570) bm!52280))

(assert (= (and b!1146582 (not res!763192)) b!1146575))

(assert (= (and b!1146575 c!113263) b!1146584))

(assert (= (and b!1146575 (not c!113263)) b!1146563))

(assert (= (and b!1146584 c!113265) b!1146587))

(assert (= (and b!1146584 (not c!113265)) b!1146560))

(assert (= (and b!1146560 c!113266) b!1146585))

(assert (= (and b!1146560 (not c!113266)) b!1146573))

(assert (= (and b!1146573 c!113267) b!1146571))

(assert (= (and b!1146573 (not c!113267)) b!1146568))

(assert (= (or b!1146585 b!1146571) bm!52283))

(assert (= (or b!1146585 b!1146571) bm!52281))

(assert (= (or b!1146585 b!1146571) bm!52285))

(assert (= (or b!1146587 bm!52285) bm!52286))

(assert (= (or b!1146587 bm!52283) bm!52284))

(assert (= (or b!1146587 bm!52281) bm!52287))

(assert (= (and b!1146584 c!113264) b!1146588))

(assert (= (and b!1146584 (not c!113264)) b!1146586))

(assert (= (and b!1146584 res!763205) b!1146566))

(assert (= (and b!1146575 res!763203) b!1146579))

(assert (= (and b!1146561 condMapEmpty!44954) mapIsEmpty!44954))

(assert (= (and b!1146561 (not condMapEmpty!44954)) mapNonEmpty!44954))

(get-info :version)

(assert (= (and mapNonEmpty!44954 ((_ is ValueCellFull!13667) mapValue!44954)) b!1146578))

(assert (= (and b!1146561 ((_ is ValueCellFull!13667) mapDefault!44954)) b!1146567))

(assert (= start!98854 b!1146561))

(declare-fun b_lambda!19323 () Bool)

(assert (=> (not b_lambda!19323) (not b!1146577)))

(declare-fun t!36259 () Bool)

(declare-fun tb!9027 () Bool)

(assert (=> (and start!98854 (= defaultEntry!1004 defaultEntry!1004) t!36259) tb!9027))

(declare-fun result!18627 () Bool)

(assert (=> tb!9027 (= result!18627 tp_is_empty!28753)))

(assert (=> b!1146577 t!36259))

(declare-fun b_and!39299 () Bool)

(assert (= b_and!39297 (and (=> t!36259 result!18627) b_and!39299)))

(declare-fun m!1057753 () Bool)

(assert (=> b!1146574 m!1057753))

(declare-fun m!1057755 () Bool)

(assert (=> b!1146581 m!1057755))

(declare-fun m!1057757 () Bool)

(assert (=> b!1146581 m!1057757))

(declare-fun m!1057759 () Bool)

(assert (=> bm!52284 m!1057759))

(declare-fun m!1057761 () Bool)

(assert (=> b!1146588 m!1057761))

(declare-fun m!1057763 () Bool)

(assert (=> bm!52280 m!1057763))

(declare-fun m!1057765 () Bool)

(assert (=> bm!52287 m!1057765))

(declare-fun m!1057767 () Bool)

(assert (=> b!1146583 m!1057767))

(declare-fun m!1057769 () Bool)

(assert (=> b!1146562 m!1057769))

(declare-fun m!1057771 () Bool)

(assert (=> b!1146562 m!1057771))

(declare-fun m!1057773 () Bool)

(assert (=> b!1146582 m!1057773))

(declare-fun m!1057775 () Bool)

(assert (=> b!1146582 m!1057775))

(declare-fun m!1057777 () Bool)

(assert (=> b!1146579 m!1057777))

(declare-fun m!1057779 () Bool)

(assert (=> b!1146587 m!1057779))

(assert (=> b!1146587 m!1057779))

(declare-fun m!1057781 () Bool)

(assert (=> b!1146587 m!1057781))

(declare-fun m!1057783 () Bool)

(assert (=> b!1146587 m!1057783))

(declare-fun m!1057785 () Bool)

(assert (=> b!1146580 m!1057785))

(assert (=> b!1146575 m!1057763))

(declare-fun m!1057787 () Bool)

(assert (=> b!1146575 m!1057787))

(assert (=> b!1146575 m!1057787))

(declare-fun m!1057789 () Bool)

(assert (=> b!1146575 m!1057789))

(assert (=> b!1146575 m!1057773))

(declare-fun m!1057791 () Bool)

(assert (=> b!1146575 m!1057791))

(declare-fun m!1057793 () Bool)

(assert (=> b!1146575 m!1057793))

(declare-fun m!1057795 () Bool)

(assert (=> b!1146575 m!1057795))

(assert (=> b!1146575 m!1057773))

(assert (=> b!1146575 m!1057793))

(assert (=> b!1146575 m!1057773))

(declare-fun m!1057797 () Bool)

(assert (=> b!1146575 m!1057797))

(declare-fun m!1057799 () Bool)

(assert (=> bm!52282 m!1057799))

(declare-fun m!1057801 () Bool)

(assert (=> b!1146577 m!1057801))

(declare-fun m!1057803 () Bool)

(assert (=> b!1146577 m!1057803))

(declare-fun m!1057805 () Bool)

(assert (=> b!1146577 m!1057805))

(declare-fun m!1057807 () Bool)

(assert (=> b!1146577 m!1057807))

(declare-fun m!1057809 () Bool)

(assert (=> b!1146576 m!1057809))

(declare-fun m!1057811 () Bool)

(assert (=> start!98854 m!1057811))

(declare-fun m!1057813 () Bool)

(assert (=> start!98854 m!1057813))

(declare-fun m!1057815 () Bool)

(assert (=> bm!52286 m!1057815))

(declare-fun m!1057817 () Bool)

(assert (=> b!1146565 m!1057817))

(declare-fun m!1057819 () Bool)

(assert (=> b!1146559 m!1057819))

(declare-fun m!1057821 () Bool)

(assert (=> mapNonEmpty!44954 m!1057821))

(declare-fun m!1057823 () Bool)

(assert (=> b!1146569 m!1057823))

(declare-fun m!1057825 () Bool)

(assert (=> b!1146584 m!1057825))

(declare-fun m!1057827 () Bool)

(assert (=> b!1146584 m!1057827))

(declare-fun m!1057829 () Bool)

(assert (=> b!1146584 m!1057829))

(declare-fun m!1057831 () Bool)

(assert (=> b!1146584 m!1057831))

(assert (=> b!1146566 m!1057761))

(check-sat (not b!1146588) (not b!1146566) (not b!1146583) (not b_lambda!19323) (not bm!52282) b_and!39299 (not bm!52280) (not b!1146559) (not b!1146579) (not start!98854) (not bm!52286) (not b!1146581) (not b!1146576) (not mapNonEmpty!44954) (not b!1146569) (not b!1146582) tp_is_empty!28753 (not b!1146575) (not b_next!24223) (not b!1146565) (not bm!52284) (not b!1146587) (not b!1146577) (not b!1146562) (not b!1146574) (not bm!52287) (not b!1146584))
(check-sat b_and!39299 (not b_next!24223))
