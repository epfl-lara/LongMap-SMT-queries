; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98648 () Bool)

(assert start!98648)

(declare-fun b_free!24259 () Bool)

(declare-fun b_next!24259 () Bool)

(assert (=> start!98648 (= b_free!24259 (not b_next!24259))))

(declare-fun tp!85488 () Bool)

(declare-fun b_and!39345 () Bool)

(assert (=> start!98648 (= tp!85488 b_and!39345)))

(declare-fun b!1146802 () Bool)

(declare-datatypes ((Unit!37524 0))(
  ( (Unit!37525) )
))
(declare-fun e!652326 () Unit!37524)

(declare-fun e!652319 () Unit!37524)

(assert (=> b!1146802 (= e!652326 e!652319)))

(declare-fun c!113163 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!512172 () Bool)

(assert (=> b!1146802 (= c!113163 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512172))))

(declare-fun b!1146803 () Bool)

(declare-fun res!763428 () Bool)

(declare-fun e!652313 () Bool)

(assert (=> b!1146803 (=> (not res!763428) (not e!652313))))

(declare-datatypes ((array!74350 0))(
  ( (array!74351 (arr!35826 (Array (_ BitVec 32) (_ BitVec 64))) (size!36364 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74350)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1146803 (= res!763428 (= (select (arr!35826 _keys!1208) i!673) k0!934))))

(declare-fun b!1146804 () Bool)

(declare-fun call!52633 () Bool)

(assert (=> b!1146804 call!52633))

(declare-fun lt!512166 () Unit!37524)

(declare-fun call!52630 () Unit!37524)

(assert (=> b!1146804 (= lt!512166 call!52630)))

(assert (=> b!1146804 (= e!652319 lt!512166)))

(declare-fun b!1146805 () Bool)

(declare-fun e!652315 () Bool)

(declare-fun e!652317 () Bool)

(assert (=> b!1146805 (= e!652315 (not e!652317))))

(declare-fun res!763434 () Bool)

(assert (=> b!1146805 (=> res!763434 e!652317)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146805 (= res!763434 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146805 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512171 () Unit!37524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74350 (_ BitVec 64) (_ BitVec 32)) Unit!37524)

(assert (=> b!1146805 (= lt!512171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52624 () Bool)

(declare-fun call!52628 () Bool)

(assert (=> bm!52624 (= call!52633 call!52628)))

(declare-fun b!1146806 () Bool)

(declare-fun e!652325 () Bool)

(declare-fun e!652310 () Bool)

(declare-fun mapRes!45008 () Bool)

(assert (=> b!1146806 (= e!652325 (and e!652310 mapRes!45008))))

(declare-fun condMapEmpty!45008 () Bool)

(declare-datatypes ((V!43513 0))(
  ( (V!43514 (val!14451 Int)) )
))
(declare-datatypes ((ValueCell!13685 0))(
  ( (ValueCellFull!13685 (v!17087 V!43513)) (EmptyCell!13685) )
))
(declare-datatypes ((array!74352 0))(
  ( (array!74353 (arr!35827 (Array (_ BitVec 32) ValueCell!13685)) (size!36365 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74352)

(declare-fun mapDefault!45008 () ValueCell!13685)

(assert (=> b!1146806 (= condMapEmpty!45008 (= (arr!35827 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13685)) mapDefault!45008)))))

(declare-fun zeroValue!944 () V!43513)

(declare-fun defaultEntry!1004 () Int)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!52625 () Bool)

(declare-fun minValue!944 () V!43513)

(declare-datatypes ((tuple2!18400 0))(
  ( (tuple2!18401 (_1!9211 (_ BitVec 64)) (_2!9211 V!43513)) )
))
(declare-datatypes ((List!25137 0))(
  ( (Nil!25134) (Cons!25133 (h!26342 tuple2!18400) (t!36379 List!25137)) )
))
(declare-datatypes ((ListLongMap!16369 0))(
  ( (ListLongMap!16370 (toList!8200 List!25137)) )
))
(declare-fun call!52634 () ListLongMap!16369)

(declare-fun getCurrentListMapNoExtraKeys!4686 (array!74350 array!74352 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) Int) ListLongMap!16369)

(assert (=> bm!52625 (= call!52634 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52626 () Bool)

(declare-fun call!52629 () ListLongMap!16369)

(declare-fun call!52632 () ListLongMap!16369)

(assert (=> bm!52626 (= call!52629 call!52632)))

(declare-fun e!652322 () Bool)

(declare-fun b!1146807 () Bool)

(assert (=> b!1146807 (= e!652322 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146808 () Bool)

(declare-fun lt!512160 () Unit!37524)

(assert (=> b!1146808 (= e!652326 lt!512160)))

(assert (=> b!1146808 (= lt!512160 call!52630)))

(assert (=> b!1146808 call!52633))

(declare-fun b!1146809 () Bool)

(declare-fun res!763440 () Bool)

(assert (=> b!1146809 (=> (not res!763440) (not e!652313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146809 (= res!763440 (validMask!0 mask!1564))))

(declare-fun b!1146810 () Bool)

(declare-fun res!763441 () Bool)

(assert (=> b!1146810 (=> (not res!763441) (not e!652315))))

(declare-fun lt!512164 () array!74350)

(declare-datatypes ((List!25138 0))(
  ( (Nil!25135) (Cons!25134 (h!26343 (_ BitVec 64)) (t!36380 List!25138)) )
))
(declare-fun arrayNoDuplicates!0 (array!74350 (_ BitVec 32) List!25138) Bool)

(assert (=> b!1146810 (= res!763441 (arrayNoDuplicates!0 lt!512164 #b00000000000000000000000000000000 Nil!25135))))

(declare-fun res!763438 () Bool)

(assert (=> start!98648 (=> (not res!763438) (not e!652313))))

(assert (=> start!98648 (= res!763438 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36364 _keys!1208))))))

(assert (=> start!98648 e!652313))

(declare-fun tp_is_empty!28789 () Bool)

(assert (=> start!98648 tp_is_empty!28789))

(declare-fun array_inv!27532 (array!74350) Bool)

(assert (=> start!98648 (array_inv!27532 _keys!1208)))

(assert (=> start!98648 true))

(assert (=> start!98648 tp!85488))

(declare-fun array_inv!27533 (array!74352) Bool)

(assert (=> start!98648 (and (array_inv!27533 _values!996) e!652325)))

(declare-fun mapNonEmpty!45008 () Bool)

(declare-fun tp!85487 () Bool)

(declare-fun e!652321 () Bool)

(assert (=> mapNonEmpty!45008 (= mapRes!45008 (and tp!85487 e!652321))))

(declare-fun mapKey!45008 () (_ BitVec 32))

(declare-fun mapValue!45008 () ValueCell!13685)

(declare-fun mapRest!45008 () (Array (_ BitVec 32) ValueCell!13685))

(assert (=> mapNonEmpty!45008 (= (arr!35827 _values!996) (store mapRest!45008 mapKey!45008 mapValue!45008))))

(declare-fun b!1146811 () Bool)

(declare-fun lt!512170 () ListLongMap!16369)

(declare-fun contains!6663 (ListLongMap!16369 (_ BitVec 64)) Bool)

(declare-fun +!3619 (ListLongMap!16369 tuple2!18400) ListLongMap!16369)

(assert (=> b!1146811 (contains!6663 (+!3619 lt!512170 (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!512158 () Unit!37524)

(declare-fun addStillContains!833 (ListLongMap!16369 (_ BitVec 64) V!43513 (_ BitVec 64)) Unit!37524)

(assert (=> b!1146811 (= lt!512158 (addStillContains!833 lt!512170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1146811 call!52628))

(assert (=> b!1146811 (= lt!512170 call!52632)))

(declare-fun lt!512167 () Unit!37524)

(declare-fun call!52627 () Unit!37524)

(assert (=> b!1146811 (= lt!512167 call!52627)))

(declare-fun e!652311 () Unit!37524)

(assert (=> b!1146811 (= e!652311 lt!512158)))

(declare-fun e!652320 () Bool)

(declare-fun lt!512162 () ListLongMap!16369)

(declare-fun b!1146812 () Bool)

(declare-fun lt!512159 () ListLongMap!16369)

(declare-fun -!1273 (ListLongMap!16369 (_ BitVec 64)) ListLongMap!16369)

(assert (=> b!1146812 (= e!652320 (= (-!1273 lt!512159 k0!934) lt!512162))))

(declare-fun b!1146813 () Bool)

(declare-fun res!763432 () Bool)

(assert (=> b!1146813 (=> (not res!763432) (not e!652313))))

(assert (=> b!1146813 (= res!763432 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25135))))

(declare-fun b!1146814 () Bool)

(declare-fun res!763431 () Bool)

(assert (=> b!1146814 (=> (not res!763431) (not e!652313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74350 (_ BitVec 32)) Bool)

(assert (=> b!1146814 (= res!763431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146815 () Bool)

(declare-fun res!763435 () Bool)

(assert (=> b!1146815 (=> (not res!763435) (not e!652313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146815 (= res!763435 (validKeyInArray!0 k0!934))))

(declare-fun b!1146816 () Bool)

(assert (=> b!1146816 (= e!652310 tp_is_empty!28789)))

(declare-fun b!1146817 () Bool)

(declare-fun res!763439 () Bool)

(assert (=> b!1146817 (=> (not res!763439) (not e!652313))))

(assert (=> b!1146817 (= res!763439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36364 _keys!1208))))))

(declare-fun b!1146818 () Bool)

(assert (=> b!1146818 (= e!652322 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512172) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146819 () Bool)

(declare-fun e!652312 () Bool)

(assert (=> b!1146819 (= e!652312 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146820 () Bool)

(assert (=> b!1146820 (= e!652321 tp_is_empty!28789)))

(declare-fun b!1146821 () Bool)

(declare-fun c!113167 () Bool)

(assert (=> b!1146821 (= c!113167 (and (not lt!512172) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146821 (= e!652311 e!652326)))

(declare-fun b!1146822 () Bool)

(declare-fun e!652318 () Unit!37524)

(declare-fun Unit!37526 () Unit!37524)

(assert (=> b!1146822 (= e!652318 Unit!37526)))

(declare-fun c!113165 () Bool)

(declare-fun bm!52627 () Bool)

(assert (=> bm!52627 (= call!52632 (+!3619 lt!512162 (ite (or c!113165 c!113167) (tuple2!18401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!52628 () Bool)

(assert (=> bm!52628 (= call!52628 (contains!6663 (ite c!113165 lt!512170 call!52629) k0!934))))

(declare-fun b!1146823 () Bool)

(declare-fun e!652324 () Bool)

(assert (=> b!1146823 (= e!652324 true)))

(assert (=> b!1146823 e!652320))

(declare-fun res!763433 () Bool)

(assert (=> b!1146823 (=> (not res!763433) (not e!652320))))

(declare-fun lt!512163 () V!43513)

(assert (=> b!1146823 (= res!763433 (= (-!1273 (+!3619 lt!512162 (tuple2!18401 (select (arr!35826 _keys!1208) from!1455) lt!512163)) (select (arr!35826 _keys!1208) from!1455)) lt!512162))))

(declare-fun lt!512174 () Unit!37524)

(declare-fun addThenRemoveForNewKeyIsSame!136 (ListLongMap!16369 (_ BitVec 64) V!43513) Unit!37524)

(assert (=> b!1146823 (= lt!512174 (addThenRemoveForNewKeyIsSame!136 lt!512162 (select (arr!35826 _keys!1208) from!1455) lt!512163))))

(declare-fun lt!512177 () V!43513)

(declare-fun get!18236 (ValueCell!13685 V!43513) V!43513)

(assert (=> b!1146823 (= lt!512163 (get!18236 (select (arr!35827 _values!996) from!1455) lt!512177))))

(declare-fun lt!512178 () Unit!37524)

(assert (=> b!1146823 (= lt!512178 e!652318)))

(declare-fun c!113166 () Bool)

(assert (=> b!1146823 (= c!113166 (contains!6663 lt!512162 k0!934))))

(assert (=> b!1146823 (= lt!512162 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45008 () Bool)

(assert (=> mapIsEmpty!45008 mapRes!45008))

(declare-fun b!1146824 () Bool)

(declare-fun res!763436 () Bool)

(assert (=> b!1146824 (=> (not res!763436) (not e!652313))))

(assert (=> b!1146824 (= res!763436 (and (= (size!36365 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36364 _keys!1208) (size!36365 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146825 () Bool)

(declare-fun e!652316 () Bool)

(declare-fun call!52631 () ListLongMap!16369)

(assert (=> b!1146825 (= e!652316 (= call!52631 call!52634))))

(declare-fun b!1146826 () Bool)

(declare-fun e!652314 () Bool)

(assert (=> b!1146826 (= e!652314 e!652324)))

(declare-fun res!763430 () Bool)

(assert (=> b!1146826 (=> res!763430 e!652324)))

(assert (=> b!1146826 (= res!763430 (not (= (select (arr!35826 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146826 e!652316))

(declare-fun c!113168 () Bool)

(assert (=> b!1146826 (= c!113168 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512175 () Unit!37524)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!553 (array!74350 array!74352 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37524)

(assert (=> b!1146826 (= lt!512175 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52629 () Bool)

(assert (=> bm!52629 (= call!52627 (addStillContains!833 lt!512162 (ite (or c!113165 c!113167) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113165 c!113167) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146827 () Bool)

(assert (=> b!1146827 (= e!652317 e!652314)))

(declare-fun res!763437 () Bool)

(assert (=> b!1146827 (=> res!763437 e!652314)))

(assert (=> b!1146827 (= res!763437 (not (= from!1455 i!673)))))

(declare-fun lt!512168 () ListLongMap!16369)

(declare-fun lt!512165 () array!74352)

(assert (=> b!1146827 (= lt!512168 (getCurrentListMapNoExtraKeys!4686 lt!512164 lt!512165 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146827 (= lt!512165 (array!74353 (store (arr!35827 _values!996) i!673 (ValueCellFull!13685 lt!512177)) (size!36365 _values!996)))))

(declare-fun dynLambda!2656 (Int (_ BitVec 64)) V!43513)

(assert (=> b!1146827 (= lt!512177 (dynLambda!2656 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1146827 (= lt!512159 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52630 () Bool)

(assert (=> bm!52630 (= call!52631 (getCurrentListMapNoExtraKeys!4686 lt!512164 lt!512165 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146828 () Bool)

(declare-fun Unit!37527 () Unit!37524)

(assert (=> b!1146828 (= e!652318 Unit!37527)))

(assert (=> b!1146828 (= lt!512172 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146828 (= c!113165 (and (not lt!512172) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512173 () Unit!37524)

(assert (=> b!1146828 (= lt!512173 e!652311)))

(declare-fun lt!512161 () Unit!37524)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!428 (array!74350 array!74352 (_ BitVec 32) (_ BitVec 32) V!43513 V!43513 (_ BitVec 64) (_ BitVec 32) Int) Unit!37524)

(assert (=> b!1146828 (= lt!512161 (lemmaListMapContainsThenArrayContainsFrom!428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113164 () Bool)

(assert (=> b!1146828 (= c!113164 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763429 () Bool)

(assert (=> b!1146828 (= res!763429 e!652322)))

(assert (=> b!1146828 (=> (not res!763429) (not e!652312))))

(assert (=> b!1146828 e!652312))

(declare-fun lt!512169 () Unit!37524)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74350 (_ BitVec 32) (_ BitVec 32)) Unit!37524)

(assert (=> b!1146828 (= lt!512169 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146828 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25135)))

(declare-fun lt!512176 () Unit!37524)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74350 (_ BitVec 64) (_ BitVec 32) List!25138) Unit!37524)

(assert (=> b!1146828 (= lt!512176 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25135))))

(assert (=> b!1146828 false))

(declare-fun b!1146829 () Bool)

(assert (=> b!1146829 (= e!652316 (= call!52631 (-!1273 call!52634 k0!934)))))

(declare-fun b!1146830 () Bool)

(declare-fun Unit!37528 () Unit!37524)

(assert (=> b!1146830 (= e!652319 Unit!37528)))

(declare-fun bm!52631 () Bool)

(assert (=> bm!52631 (= call!52630 call!52627)))

(declare-fun b!1146831 () Bool)

(assert (=> b!1146831 (= e!652313 e!652315)))

(declare-fun res!763442 () Bool)

(assert (=> b!1146831 (=> (not res!763442) (not e!652315))))

(assert (=> b!1146831 (= res!763442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512164 mask!1564))))

(assert (=> b!1146831 (= lt!512164 (array!74351 (store (arr!35826 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36364 _keys!1208)))))

(assert (= (and start!98648 res!763438) b!1146809))

(assert (= (and b!1146809 res!763440) b!1146824))

(assert (= (and b!1146824 res!763436) b!1146814))

(assert (= (and b!1146814 res!763431) b!1146813))

(assert (= (and b!1146813 res!763432) b!1146817))

(assert (= (and b!1146817 res!763439) b!1146815))

(assert (= (and b!1146815 res!763435) b!1146803))

(assert (= (and b!1146803 res!763428) b!1146831))

(assert (= (and b!1146831 res!763442) b!1146810))

(assert (= (and b!1146810 res!763441) b!1146805))

(assert (= (and b!1146805 (not res!763434)) b!1146827))

(assert (= (and b!1146827 (not res!763437)) b!1146826))

(assert (= (and b!1146826 c!113168) b!1146829))

(assert (= (and b!1146826 (not c!113168)) b!1146825))

(assert (= (or b!1146829 b!1146825) bm!52630))

(assert (= (or b!1146829 b!1146825) bm!52625))

(assert (= (and b!1146826 (not res!763430)) b!1146823))

(assert (= (and b!1146823 c!113166) b!1146828))

(assert (= (and b!1146823 (not c!113166)) b!1146822))

(assert (= (and b!1146828 c!113165) b!1146811))

(assert (= (and b!1146828 (not c!113165)) b!1146821))

(assert (= (and b!1146821 c!113167) b!1146808))

(assert (= (and b!1146821 (not c!113167)) b!1146802))

(assert (= (and b!1146802 c!113163) b!1146804))

(assert (= (and b!1146802 (not c!113163)) b!1146830))

(assert (= (or b!1146808 b!1146804) bm!52631))

(assert (= (or b!1146808 b!1146804) bm!52626))

(assert (= (or b!1146808 b!1146804) bm!52624))

(assert (= (or b!1146811 bm!52624) bm!52628))

(assert (= (or b!1146811 bm!52631) bm!52629))

(assert (= (or b!1146811 bm!52626) bm!52627))

(assert (= (and b!1146828 c!113164) b!1146807))

(assert (= (and b!1146828 (not c!113164)) b!1146818))

(assert (= (and b!1146828 res!763429) b!1146819))

(assert (= (and b!1146823 res!763433) b!1146812))

(assert (= (and b!1146806 condMapEmpty!45008) mapIsEmpty!45008))

(assert (= (and b!1146806 (not condMapEmpty!45008)) mapNonEmpty!45008))

(get-info :version)

(assert (= (and mapNonEmpty!45008 ((_ is ValueCellFull!13685) mapValue!45008)) b!1146820))

(assert (= (and b!1146806 ((_ is ValueCellFull!13685) mapDefault!45008)) b!1146816))

(assert (= start!98648 b!1146806))

(declare-fun b_lambda!19347 () Bool)

(assert (=> (not b_lambda!19347) (not b!1146827)))

(declare-fun t!36378 () Bool)

(declare-fun tb!9063 () Bool)

(assert (=> (and start!98648 (= defaultEntry!1004 defaultEntry!1004) t!36378) tb!9063))

(declare-fun result!18699 () Bool)

(assert (=> tb!9063 (= result!18699 tp_is_empty!28789)))

(assert (=> b!1146827 t!36378))

(declare-fun b_and!39347 () Bool)

(assert (= b_and!39345 (and (=> t!36378 result!18699) b_and!39347)))

(declare-fun m!1057019 () Bool)

(assert (=> b!1146814 m!1057019))

(declare-fun m!1057021 () Bool)

(assert (=> b!1146819 m!1057021))

(declare-fun m!1057023 () Bool)

(assert (=> b!1146823 m!1057023))

(declare-fun m!1057025 () Bool)

(assert (=> b!1146823 m!1057025))

(declare-fun m!1057027 () Bool)

(assert (=> b!1146823 m!1057027))

(declare-fun m!1057029 () Bool)

(assert (=> b!1146823 m!1057029))

(declare-fun m!1057031 () Bool)

(assert (=> b!1146823 m!1057031))

(assert (=> b!1146823 m!1057027))

(declare-fun m!1057033 () Bool)

(assert (=> b!1146823 m!1057033))

(declare-fun m!1057035 () Bool)

(assert (=> b!1146823 m!1057035))

(assert (=> b!1146823 m!1057031))

(assert (=> b!1146823 m!1057027))

(assert (=> b!1146823 m!1057025))

(declare-fun m!1057037 () Bool)

(assert (=> b!1146823 m!1057037))

(declare-fun m!1057039 () Bool)

(assert (=> start!98648 m!1057039))

(declare-fun m!1057041 () Bool)

(assert (=> start!98648 m!1057041))

(assert (=> b!1146826 m!1057027))

(declare-fun m!1057043 () Bool)

(assert (=> b!1146826 m!1057043))

(declare-fun m!1057045 () Bool)

(assert (=> b!1146805 m!1057045))

(declare-fun m!1057047 () Bool)

(assert (=> b!1146805 m!1057047))

(assert (=> b!1146807 m!1057021))

(declare-fun m!1057049 () Bool)

(assert (=> b!1146812 m!1057049))

(declare-fun m!1057051 () Bool)

(assert (=> b!1146828 m!1057051))

(declare-fun m!1057053 () Bool)

(assert (=> b!1146828 m!1057053))

(declare-fun m!1057055 () Bool)

(assert (=> b!1146828 m!1057055))

(declare-fun m!1057057 () Bool)

(assert (=> b!1146828 m!1057057))

(declare-fun m!1057059 () Bool)

(assert (=> bm!52630 m!1057059))

(declare-fun m!1057061 () Bool)

(assert (=> b!1146809 m!1057061))

(declare-fun m!1057063 () Bool)

(assert (=> mapNonEmpty!45008 m!1057063))

(declare-fun m!1057065 () Bool)

(assert (=> b!1146827 m!1057065))

(declare-fun m!1057067 () Bool)

(assert (=> b!1146827 m!1057067))

(declare-fun m!1057069 () Bool)

(assert (=> b!1146827 m!1057069))

(declare-fun m!1057071 () Bool)

(assert (=> b!1146827 m!1057071))

(declare-fun m!1057073 () Bool)

(assert (=> bm!52628 m!1057073))

(assert (=> bm!52625 m!1057023))

(declare-fun m!1057075 () Bool)

(assert (=> b!1146815 m!1057075))

(declare-fun m!1057077 () Bool)

(assert (=> b!1146810 m!1057077))

(declare-fun m!1057079 () Bool)

(assert (=> b!1146803 m!1057079))

(declare-fun m!1057081 () Bool)

(assert (=> b!1146813 m!1057081))

(declare-fun m!1057083 () Bool)

(assert (=> b!1146829 m!1057083))

(declare-fun m!1057085 () Bool)

(assert (=> b!1146831 m!1057085))

(declare-fun m!1057087 () Bool)

(assert (=> b!1146831 m!1057087))

(declare-fun m!1057089 () Bool)

(assert (=> bm!52629 m!1057089))

(declare-fun m!1057091 () Bool)

(assert (=> bm!52627 m!1057091))

(declare-fun m!1057093 () Bool)

(assert (=> b!1146811 m!1057093))

(assert (=> b!1146811 m!1057093))

(declare-fun m!1057095 () Bool)

(assert (=> b!1146811 m!1057095))

(declare-fun m!1057097 () Bool)

(assert (=> b!1146811 m!1057097))

(check-sat (not mapNonEmpty!45008) (not b!1146815) (not b!1146831) (not b!1146829) (not b!1146819) (not b!1146812) (not b!1146811) (not b!1146823) (not bm!52628) (not b!1146810) (not b!1146807) (not b!1146826) (not start!98648) (not b!1146809) (not bm!52627) (not b!1146827) (not b!1146813) (not bm!52630) (not bm!52625) (not b_next!24259) (not b!1146805) (not b!1146828) (not bm!52629) (not b_lambda!19347) b_and!39347 (not b!1146814) tp_is_empty!28789)
(check-sat b_and!39347 (not b_next!24259))
