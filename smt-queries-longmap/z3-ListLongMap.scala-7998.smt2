; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99064 () Bool)

(assert start!99064)

(declare-fun b_free!24433 () Bool)

(declare-fun b_next!24433 () Bool)

(assert (=> start!99064 (= b_free!24433 (not b_next!24433))))

(declare-fun tp!86010 () Bool)

(declare-fun b_and!39717 () Bool)

(assert (=> start!99064 (= tp!86010 b_and!39717)))

(declare-fun b!1156220 () Bool)

(declare-fun res!767919 () Bool)

(declare-fun e!657659 () Bool)

(assert (=> b!1156220 (=> (not res!767919) (not e!657659))))

(declare-datatypes ((array!74817 0))(
  ( (array!74818 (arr!36053 (Array (_ BitVec 32) (_ BitVec 64))) (size!36590 (_ BitVec 32))) )
))
(declare-fun lt!518527 () array!74817)

(declare-datatypes ((List!25246 0))(
  ( (Nil!25243) (Cons!25242 (h!26460 (_ BitVec 64)) (t!36663 List!25246)) )
))
(declare-fun arrayNoDuplicates!0 (array!74817 (_ BitVec 32) List!25246) Bool)

(assert (=> b!1156220 (= res!767919 (arrayNoDuplicates!0 lt!518527 #b00000000000000000000000000000000 Nil!25243))))

(declare-fun b!1156221 () Bool)

(declare-fun e!657673 () Bool)

(declare-datatypes ((V!43745 0))(
  ( (V!43746 (val!14538 Int)) )
))
(declare-datatypes ((tuple2!18502 0))(
  ( (tuple2!18503 (_1!9262 (_ BitVec 64)) (_2!9262 V!43745)) )
))
(declare-datatypes ((List!25247 0))(
  ( (Nil!25244) (Cons!25243 (h!26461 tuple2!18502) (t!36664 List!25247)) )
))
(declare-datatypes ((ListLongMap!16479 0))(
  ( (ListLongMap!16480 (toList!8255 List!25247)) )
))
(declare-fun call!54810 () ListLongMap!16479)

(declare-fun call!54809 () ListLongMap!16479)

(assert (=> b!1156221 (= e!657673 (= call!54810 call!54809))))

(declare-fun b!1156222 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1363 (ListLongMap!16479 (_ BitVec 64)) ListLongMap!16479)

(assert (=> b!1156222 (= e!657673 (= call!54810 (-!1363 call!54809 k0!934)))))

(declare-fun b!1156223 () Bool)

(declare-fun e!657667 () Bool)

(declare-fun e!657663 () Bool)

(assert (=> b!1156223 (= e!657667 e!657663)))

(declare-fun res!767929 () Bool)

(assert (=> b!1156223 (=> res!767929 e!657663)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156223 (= res!767929 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13772 0))(
  ( (ValueCellFull!13772 (v!17171 V!43745)) (EmptyCell!13772) )
))
(declare-datatypes ((array!74819 0))(
  ( (array!74820 (arr!36054 (Array (_ BitVec 32) ValueCell!13772)) (size!36591 (_ BitVec 32))) )
))
(declare-fun lt!518526 () array!74819)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518524 () ListLongMap!16479)

(declare-fun minValue!944 () V!43745)

(declare-fun getCurrentListMapNoExtraKeys!4750 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) Int) ListLongMap!16479)

(assert (=> b!1156223 (= lt!518524 (getCurrentListMapNoExtraKeys!4750 lt!518527 lt!518526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518506 () V!43745)

(declare-fun _values!996 () array!74819)

(assert (=> b!1156223 (= lt!518526 (array!74820 (store (arr!36054 _values!996) i!673 (ValueCellFull!13772 lt!518506)) (size!36591 _values!996)))))

(declare-fun dynLambda!2766 (Int (_ BitVec 64)) V!43745)

(assert (=> b!1156223 (= lt!518506 (dynLambda!2766 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74817)

(declare-fun lt!518518 () ListLongMap!16479)

(assert (=> b!1156223 (= lt!518518 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54800 () Bool)

(assert (=> bm!54800 (= call!54810 (getCurrentListMapNoExtraKeys!4750 lt!518527 lt!518526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156224 () Bool)

(declare-fun e!657658 () Bool)

(declare-fun tp_is_empty!28963 () Bool)

(assert (=> b!1156224 (= e!657658 tp_is_empty!28963)))

(declare-fun b!1156225 () Bool)

(declare-datatypes ((Unit!38007 0))(
  ( (Unit!38008) )
))
(declare-fun e!657665 () Unit!38007)

(declare-fun Unit!38009 () Unit!38007)

(assert (=> b!1156225 (= e!657665 Unit!38009)))

(declare-fun e!657664 () Bool)

(declare-fun b!1156226 () Bool)

(declare-fun arrayContainsKey!0 (array!74817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156226 (= e!657664 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156227 () Bool)

(declare-fun e!657660 () Bool)

(assert (=> b!1156227 (= e!657660 e!657659)))

(declare-fun res!767928 () Bool)

(assert (=> b!1156227 (=> (not res!767928) (not e!657659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74817 (_ BitVec 32)) Bool)

(assert (=> b!1156227 (= res!767928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518527 mask!1564))))

(assert (=> b!1156227 (= lt!518527 (array!74818 (store (arr!36053 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36590 _keys!1208)))))

(declare-fun b!1156228 () Bool)

(declare-fun e!657662 () Bool)

(assert (=> b!1156228 (= e!657662 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54801 () Bool)

(declare-fun call!54804 () Bool)

(declare-fun call!54806 () Bool)

(assert (=> bm!54801 (= call!54804 call!54806)))

(declare-fun lt!518509 () ListLongMap!16479)

(declare-fun call!54803 () ListLongMap!16479)

(declare-fun c!115156 () Bool)

(declare-fun bm!54802 () Bool)

(declare-fun c!115153 () Bool)

(declare-fun +!3682 (ListLongMap!16479 tuple2!18502) ListLongMap!16479)

(assert (=> bm!54802 (= call!54803 (+!3682 lt!518509 (ite (or c!115156 c!115153) (tuple2!18503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!518510 () ListLongMap!16479)

(declare-fun e!657666 () Bool)

(declare-fun b!1156229 () Bool)

(assert (=> b!1156229 (= e!657666 (= lt!518510 (getCurrentListMapNoExtraKeys!4750 lt!518527 lt!518526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54803 () Bool)

(declare-fun call!54807 () ListLongMap!16479)

(assert (=> bm!54803 (= call!54807 call!54803)))

(declare-fun bm!54804 () Bool)

(declare-fun lt!518520 () ListLongMap!16479)

(declare-fun contains!6781 (ListLongMap!16479 (_ BitVec 64)) Bool)

(assert (=> bm!54804 (= call!54806 (contains!6781 (ite c!115156 lt!518520 call!54807) k0!934))))

(declare-fun b!1156230 () Bool)

(declare-fun e!657661 () Bool)

(assert (=> b!1156230 (= e!657661 true)))

(assert (=> b!1156230 e!657666))

(declare-fun res!767921 () Bool)

(assert (=> b!1156230 (=> (not res!767921) (not e!657666))))

(assert (=> b!1156230 (= res!767921 (= lt!518510 lt!518509))))

(assert (=> b!1156230 (= lt!518510 (-!1363 lt!518518 k0!934))))

(declare-fun lt!518521 () V!43745)

(assert (=> b!1156230 (= (-!1363 (+!3682 lt!518509 (tuple2!18503 (select (arr!36053 _keys!1208) from!1455) lt!518521)) (select (arr!36053 _keys!1208) from!1455)) lt!518509)))

(declare-fun lt!518511 () Unit!38007)

(declare-fun addThenRemoveForNewKeyIsSame!203 (ListLongMap!16479 (_ BitVec 64) V!43745) Unit!38007)

(assert (=> b!1156230 (= lt!518511 (addThenRemoveForNewKeyIsSame!203 lt!518509 (select (arr!36053 _keys!1208) from!1455) lt!518521))))

(declare-fun get!18392 (ValueCell!13772 V!43745) V!43745)

(assert (=> b!1156230 (= lt!518521 (get!18392 (select (arr!36054 _values!996) from!1455) lt!518506))))

(declare-fun lt!518512 () Unit!38007)

(declare-fun e!657671 () Unit!38007)

(assert (=> b!1156230 (= lt!518512 e!657671)))

(declare-fun c!115157 () Bool)

(assert (=> b!1156230 (= c!115157 (contains!6781 lt!518509 k0!934))))

(assert (=> b!1156230 (= lt!518509 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156219 () Bool)

(declare-fun e!657672 () Bool)

(assert (=> b!1156219 (= e!657672 tp_is_empty!28963)))

(declare-fun res!767931 () Bool)

(assert (=> start!99064 (=> (not res!767931) (not e!657660))))

(assert (=> start!99064 (= res!767931 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36590 _keys!1208))))))

(assert (=> start!99064 e!657660))

(assert (=> start!99064 tp_is_empty!28963))

(declare-fun array_inv!27652 (array!74817) Bool)

(assert (=> start!99064 (array_inv!27652 _keys!1208)))

(assert (=> start!99064 true))

(assert (=> start!99064 tp!86010))

(declare-fun e!657669 () Bool)

(declare-fun array_inv!27653 (array!74819) Bool)

(assert (=> start!99064 (and (array_inv!27653 _values!996) e!657669)))

(declare-fun bm!54805 () Bool)

(assert (=> bm!54805 (= call!54809 (getCurrentListMapNoExtraKeys!4750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156231 () Bool)

(assert (=> b!1156231 call!54804))

(declare-fun lt!518515 () Unit!38007)

(declare-fun call!54808 () Unit!38007)

(assert (=> b!1156231 (= lt!518515 call!54808)))

(assert (=> b!1156231 (= e!657665 lt!518515)))

(declare-fun b!1156232 () Bool)

(declare-fun e!657668 () Unit!38007)

(declare-fun lt!518519 () Unit!38007)

(assert (=> b!1156232 (= e!657668 lt!518519)))

(assert (=> b!1156232 (= lt!518519 call!54808)))

(assert (=> b!1156232 call!54804))

(declare-fun bm!54806 () Bool)

(declare-fun call!54805 () Unit!38007)

(assert (=> bm!54806 (= call!54808 call!54805)))

(declare-fun b!1156233 () Bool)

(declare-fun res!767925 () Bool)

(assert (=> b!1156233 (=> (not res!767925) (not e!657660))))

(assert (=> b!1156233 (= res!767925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45269 () Bool)

(declare-fun mapRes!45269 () Bool)

(declare-fun tp!86009 () Bool)

(assert (=> mapNonEmpty!45269 (= mapRes!45269 (and tp!86009 e!657672))))

(declare-fun mapKey!45269 () (_ BitVec 32))

(declare-fun mapValue!45269 () ValueCell!13772)

(declare-fun mapRest!45269 () (Array (_ BitVec 32) ValueCell!13772))

(assert (=> mapNonEmpty!45269 (= (arr!36054 _values!996) (store mapRest!45269 mapKey!45269 mapValue!45269))))

(declare-fun b!1156234 () Bool)

(declare-fun res!767917 () Bool)

(assert (=> b!1156234 (=> (not res!767917) (not e!657660))))

(assert (=> b!1156234 (= res!767917 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36590 _keys!1208))))))

(declare-fun b!1156235 () Bool)

(declare-fun lt!518508 () Bool)

(assert (=> b!1156235 (= c!115153 (and (not lt!518508) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657670 () Unit!38007)

(assert (=> b!1156235 (= e!657670 e!657668)))

(declare-fun b!1156236 () Bool)

(assert (=> b!1156236 (= e!657668 e!657665)))

(declare-fun c!115155 () Bool)

(assert (=> b!1156236 (= c!115155 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518508))))

(declare-fun b!1156237 () Bool)

(assert (=> b!1156237 (= e!657662 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518508) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156238 () Bool)

(declare-fun Unit!38010 () Unit!38007)

(assert (=> b!1156238 (= e!657671 Unit!38010)))

(declare-fun b!1156239 () Bool)

(declare-fun res!767926 () Bool)

(assert (=> b!1156239 (=> (not res!767926) (not e!657660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156239 (= res!767926 (validKeyInArray!0 k0!934))))

(declare-fun b!1156240 () Bool)

(declare-fun res!767924 () Bool)

(assert (=> b!1156240 (=> (not res!767924) (not e!657660))))

(assert (=> b!1156240 (= res!767924 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25243))))

(declare-fun b!1156241 () Bool)

(declare-fun res!767930 () Bool)

(assert (=> b!1156241 (=> (not res!767930) (not e!657660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156241 (= res!767930 (validMask!0 mask!1564))))

(declare-fun b!1156242 () Bool)

(assert (=> b!1156242 (contains!6781 (+!3682 lt!518520 (tuple2!18503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!518507 () Unit!38007)

(assert (=> b!1156242 (= lt!518507 call!54805)))

(assert (=> b!1156242 call!54806))

(assert (=> b!1156242 (= lt!518520 call!54803)))

(declare-fun lt!518522 () Unit!38007)

(declare-fun addStillContains!904 (ListLongMap!16479 (_ BitVec 64) V!43745 (_ BitVec 64)) Unit!38007)

(assert (=> b!1156242 (= lt!518522 (addStillContains!904 lt!518509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1156242 (= e!657670 lt!518507)))

(declare-fun b!1156243 () Bool)

(declare-fun Unit!38011 () Unit!38007)

(assert (=> b!1156243 (= e!657671 Unit!38011)))

(assert (=> b!1156243 (= lt!518508 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156243 (= c!115156 (and (not lt!518508) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518514 () Unit!38007)

(assert (=> b!1156243 (= lt!518514 e!657670)))

(declare-fun lt!518513 () Unit!38007)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!496 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 64) (_ BitVec 32) Int) Unit!38007)

(assert (=> b!1156243 (= lt!518513 (lemmaListMapContainsThenArrayContainsFrom!496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115158 () Bool)

(assert (=> b!1156243 (= c!115158 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767923 () Bool)

(assert (=> b!1156243 (= res!767923 e!657662)))

(assert (=> b!1156243 (=> (not res!767923) (not e!657664))))

(assert (=> b!1156243 e!657664))

(declare-fun lt!518517 () Unit!38007)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74817 (_ BitVec 32) (_ BitVec 32)) Unit!38007)

(assert (=> b!1156243 (= lt!518517 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156243 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25243)))

(declare-fun lt!518525 () Unit!38007)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74817 (_ BitVec 64) (_ BitVec 32) List!25246) Unit!38007)

(assert (=> b!1156243 (= lt!518525 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25243))))

(assert (=> b!1156243 false))

(declare-fun bm!54807 () Bool)

(assert (=> bm!54807 (= call!54805 (addStillContains!904 (ite c!115156 lt!518520 lt!518509) (ite c!115156 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115153 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115156 minValue!944 (ite c!115153 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!45269 () Bool)

(assert (=> mapIsEmpty!45269 mapRes!45269))

(declare-fun b!1156244 () Bool)

(assert (=> b!1156244 (= e!657663 e!657661)))

(declare-fun res!767920 () Bool)

(assert (=> b!1156244 (=> res!767920 e!657661)))

(assert (=> b!1156244 (= res!767920 (not (= (select (arr!36053 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156244 e!657673))

(declare-fun c!115154 () Bool)

(assert (=> b!1156244 (= c!115154 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518516 () Unit!38007)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38007)

(assert (=> b!1156244 (= lt!518516 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156245 () Bool)

(declare-fun res!767918 () Bool)

(assert (=> b!1156245 (=> (not res!767918) (not e!657660))))

(assert (=> b!1156245 (= res!767918 (= (select (arr!36053 _keys!1208) i!673) k0!934))))

(declare-fun b!1156246 () Bool)

(declare-fun res!767922 () Bool)

(assert (=> b!1156246 (=> (not res!767922) (not e!657660))))

(assert (=> b!1156246 (= res!767922 (and (= (size!36591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36590 _keys!1208) (size!36591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156247 () Bool)

(assert (=> b!1156247 (= e!657669 (and e!657658 mapRes!45269))))

(declare-fun condMapEmpty!45269 () Bool)

(declare-fun mapDefault!45269 () ValueCell!13772)

(assert (=> b!1156247 (= condMapEmpty!45269 (= (arr!36054 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13772)) mapDefault!45269)))))

(declare-fun b!1156248 () Bool)

(assert (=> b!1156248 (= e!657659 (not e!657667))))

(declare-fun res!767927 () Bool)

(assert (=> b!1156248 (=> res!767927 e!657667)))

(assert (=> b!1156248 (= res!767927 (bvsgt from!1455 i!673))))

(assert (=> b!1156248 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518523 () Unit!38007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74817 (_ BitVec 64) (_ BitVec 32)) Unit!38007)

(assert (=> b!1156248 (= lt!518523 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99064 res!767931) b!1156241))

(assert (= (and b!1156241 res!767930) b!1156246))

(assert (= (and b!1156246 res!767922) b!1156233))

(assert (= (and b!1156233 res!767925) b!1156240))

(assert (= (and b!1156240 res!767924) b!1156234))

(assert (= (and b!1156234 res!767917) b!1156239))

(assert (= (and b!1156239 res!767926) b!1156245))

(assert (= (and b!1156245 res!767918) b!1156227))

(assert (= (and b!1156227 res!767928) b!1156220))

(assert (= (and b!1156220 res!767919) b!1156248))

(assert (= (and b!1156248 (not res!767927)) b!1156223))

(assert (= (and b!1156223 (not res!767929)) b!1156244))

(assert (= (and b!1156244 c!115154) b!1156222))

(assert (= (and b!1156244 (not c!115154)) b!1156221))

(assert (= (or b!1156222 b!1156221) bm!54800))

(assert (= (or b!1156222 b!1156221) bm!54805))

(assert (= (and b!1156244 (not res!767920)) b!1156230))

(assert (= (and b!1156230 c!115157) b!1156243))

(assert (= (and b!1156230 (not c!115157)) b!1156238))

(assert (= (and b!1156243 c!115156) b!1156242))

(assert (= (and b!1156243 (not c!115156)) b!1156235))

(assert (= (and b!1156235 c!115153) b!1156232))

(assert (= (and b!1156235 (not c!115153)) b!1156236))

(assert (= (and b!1156236 c!115155) b!1156231))

(assert (= (and b!1156236 (not c!115155)) b!1156225))

(assert (= (or b!1156232 b!1156231) bm!54806))

(assert (= (or b!1156232 b!1156231) bm!54803))

(assert (= (or b!1156232 b!1156231) bm!54801))

(assert (= (or b!1156242 bm!54801) bm!54804))

(assert (= (or b!1156242 bm!54806) bm!54807))

(assert (= (or b!1156242 bm!54803) bm!54802))

(assert (= (and b!1156243 c!115158) b!1156228))

(assert (= (and b!1156243 (not c!115158)) b!1156237))

(assert (= (and b!1156243 res!767923) b!1156226))

(assert (= (and b!1156230 res!767921) b!1156229))

(assert (= (and b!1156247 condMapEmpty!45269) mapIsEmpty!45269))

(assert (= (and b!1156247 (not condMapEmpty!45269)) mapNonEmpty!45269))

(get-info :version)

(assert (= (and mapNonEmpty!45269 ((_ is ValueCellFull!13772) mapValue!45269)) b!1156219))

(assert (= (and b!1156247 ((_ is ValueCellFull!13772) mapDefault!45269)) b!1156224))

(assert (= start!99064 b!1156247))

(declare-fun b_lambda!19533 () Bool)

(assert (=> (not b_lambda!19533) (not b!1156223)))

(declare-fun t!36662 () Bool)

(declare-fun tb!9237 () Bool)

(assert (=> (and start!99064 (= defaultEntry!1004 defaultEntry!1004) t!36662) tb!9237))

(declare-fun result!19047 () Bool)

(assert (=> tb!9237 (= result!19047 tp_is_empty!28963)))

(assert (=> b!1156223 t!36662))

(declare-fun b_and!39719 () Bool)

(assert (= b_and!39717 (and (=> t!36662 result!19047) b_and!39719)))

(declare-fun m!1066157 () Bool)

(assert (=> b!1156230 m!1066157))

(declare-fun m!1066159 () Bool)

(assert (=> b!1156230 m!1066159))

(declare-fun m!1066161 () Bool)

(assert (=> b!1156230 m!1066161))

(declare-fun m!1066163 () Bool)

(assert (=> b!1156230 m!1066163))

(assert (=> b!1156230 m!1066159))

(declare-fun m!1066165 () Bool)

(assert (=> b!1156230 m!1066165))

(declare-fun m!1066167 () Bool)

(assert (=> b!1156230 m!1066167))

(declare-fun m!1066169 () Bool)

(assert (=> b!1156230 m!1066169))

(assert (=> b!1156230 m!1066169))

(declare-fun m!1066171 () Bool)

(assert (=> b!1156230 m!1066171))

(assert (=> b!1156230 m!1066161))

(assert (=> b!1156230 m!1066169))

(declare-fun m!1066173 () Bool)

(assert (=> b!1156230 m!1066173))

(declare-fun m!1066175 () Bool)

(assert (=> b!1156227 m!1066175))

(declare-fun m!1066177 () Bool)

(assert (=> b!1156227 m!1066177))

(declare-fun m!1066179 () Bool)

(assert (=> b!1156241 m!1066179))

(declare-fun m!1066181 () Bool)

(assert (=> start!99064 m!1066181))

(declare-fun m!1066183 () Bool)

(assert (=> start!99064 m!1066183))

(declare-fun m!1066185 () Bool)

(assert (=> b!1156240 m!1066185))

(declare-fun m!1066187 () Bool)

(assert (=> b!1156223 m!1066187))

(declare-fun m!1066189 () Bool)

(assert (=> b!1156223 m!1066189))

(declare-fun m!1066191 () Bool)

(assert (=> b!1156223 m!1066191))

(declare-fun m!1066193 () Bool)

(assert (=> b!1156223 m!1066193))

(declare-fun m!1066195 () Bool)

(assert (=> b!1156245 m!1066195))

(declare-fun m!1066197 () Bool)

(assert (=> mapNonEmpty!45269 m!1066197))

(declare-fun m!1066199 () Bool)

(assert (=> b!1156228 m!1066199))

(assert (=> b!1156226 m!1066199))

(declare-fun m!1066201 () Bool)

(assert (=> b!1156222 m!1066201))

(declare-fun m!1066203 () Bool)

(assert (=> b!1156233 m!1066203))

(declare-fun m!1066205 () Bool)

(assert (=> b!1156248 m!1066205))

(declare-fun m!1066207 () Bool)

(assert (=> b!1156248 m!1066207))

(assert (=> bm!54805 m!1066157))

(declare-fun m!1066209 () Bool)

(assert (=> bm!54804 m!1066209))

(declare-fun m!1066211 () Bool)

(assert (=> bm!54800 m!1066211))

(declare-fun m!1066213 () Bool)

(assert (=> b!1156220 m!1066213))

(declare-fun m!1066215 () Bool)

(assert (=> bm!54807 m!1066215))

(declare-fun m!1066217 () Bool)

(assert (=> b!1156239 m!1066217))

(assert (=> b!1156244 m!1066169))

(declare-fun m!1066219 () Bool)

(assert (=> b!1156244 m!1066219))

(declare-fun m!1066221 () Bool)

(assert (=> bm!54802 m!1066221))

(declare-fun m!1066223 () Bool)

(assert (=> b!1156243 m!1066223))

(declare-fun m!1066225 () Bool)

(assert (=> b!1156243 m!1066225))

(declare-fun m!1066227 () Bool)

(assert (=> b!1156243 m!1066227))

(declare-fun m!1066229 () Bool)

(assert (=> b!1156243 m!1066229))

(assert (=> b!1156229 m!1066211))

(declare-fun m!1066231 () Bool)

(assert (=> b!1156242 m!1066231))

(assert (=> b!1156242 m!1066231))

(declare-fun m!1066233 () Bool)

(assert (=> b!1156242 m!1066233))

(declare-fun m!1066235 () Bool)

(assert (=> b!1156242 m!1066235))

(check-sat (not bm!54807) (not b!1156222) (not b!1156220) (not b!1156239) (not b!1156240) (not bm!54800) (not bm!54805) (not bm!54802) (not b!1156248) (not b_lambda!19533) (not b!1156223) tp_is_empty!28963 (not b!1156228) (not start!99064) (not bm!54804) (not mapNonEmpty!45269) (not b!1156244) (not b!1156226) (not b!1156233) (not b!1156227) b_and!39719 (not b!1156243) (not b!1156242) (not b_next!24433) (not b!1156241) (not b!1156230) (not b!1156229))
(check-sat b_and!39719 (not b_next!24433))
