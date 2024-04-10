; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98920 () Bool)

(assert start!98920)

(declare-fun b_free!24525 () Bool)

(declare-fun b_next!24525 () Bool)

(assert (=> start!98920 (= b_free!24525 (not b_next!24525))))

(declare-fun tp!86286 () Bool)

(declare-fun b_and!39899 () Bool)

(assert (=> start!98920 (= tp!86286 b_and!39899)))

(declare-fun b!1159162 () Bool)

(declare-fun e!659175 () Bool)

(assert (=> b!1159162 (= e!659175 true)))

(declare-fun e!659187 () Bool)

(assert (=> b!1159162 e!659187))

(declare-fun res!769489 () Bool)

(assert (=> b!1159162 (=> (not res!769489) (not e!659187))))

(declare-datatypes ((V!43867 0))(
  ( (V!43868 (val!14584 Int)) )
))
(declare-datatypes ((tuple2!18566 0))(
  ( (tuple2!18567 (_1!9294 (_ BitVec 64)) (_2!9294 V!43867)) )
))
(declare-datatypes ((List!25304 0))(
  ( (Nil!25301) (Cons!25300 (h!26509 tuple2!18566) (t!36821 List!25304)) )
))
(declare-datatypes ((ListLongMap!16535 0))(
  ( (ListLongMap!16536 (toList!8283 List!25304)) )
))
(declare-fun lt!521064 () ListLongMap!16535)

(declare-fun lt!521073 () ListLongMap!16535)

(assert (=> b!1159162 (= res!769489 (= lt!521064 lt!521073))))

(declare-fun lt!521067 () ListLongMap!16535)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1394 (ListLongMap!16535 (_ BitVec 64)) ListLongMap!16535)

(assert (=> b!1159162 (= lt!521064 (-!1394 lt!521067 k0!934))))

(declare-datatypes ((array!74951 0))(
  ( (array!74952 (arr!36126 (Array (_ BitVec 32) (_ BitVec 64))) (size!36662 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74951)

(declare-fun lt!521068 () V!43867)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3691 (ListLongMap!16535 tuple2!18566) ListLongMap!16535)

(assert (=> b!1159162 (= (-!1394 (+!3691 lt!521073 (tuple2!18567 (select (arr!36126 _keys!1208) from!1455) lt!521068)) (select (arr!36126 _keys!1208) from!1455)) lt!521073)))

(declare-datatypes ((Unit!38197 0))(
  ( (Unit!38198) )
))
(declare-fun lt!521075 () Unit!38197)

(declare-fun addThenRemoveForNewKeyIsSame!230 (ListLongMap!16535 (_ BitVec 64) V!43867) Unit!38197)

(assert (=> b!1159162 (= lt!521075 (addThenRemoveForNewKeyIsSame!230 lt!521073 (select (arr!36126 _keys!1208) from!1455) lt!521068))))

(declare-fun lt!521072 () V!43867)

(declare-datatypes ((ValueCell!13818 0))(
  ( (ValueCellFull!13818 (v!17221 V!43867)) (EmptyCell!13818) )
))
(declare-datatypes ((array!74953 0))(
  ( (array!74954 (arr!36127 (Array (_ BitVec 32) ValueCell!13818)) (size!36663 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74953)

(declare-fun get!18418 (ValueCell!13818 V!43867) V!43867)

(assert (=> b!1159162 (= lt!521068 (get!18418 (select (arr!36127 _values!996) from!1455) lt!521072))))

(declare-fun lt!521063 () Unit!38197)

(declare-fun e!659186 () Unit!38197)

(assert (=> b!1159162 (= lt!521063 e!659186)))

(declare-fun c!115586 () Bool)

(declare-fun contains!6792 (ListLongMap!16535 (_ BitVec 64)) Bool)

(assert (=> b!1159162 (= c!115586 (contains!6792 lt!521073 k0!934))))

(declare-fun zeroValue!944 () V!43867)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43867)

(declare-fun getCurrentListMapNoExtraKeys!4747 (array!74951 array!74953 (_ BitVec 32) (_ BitVec 32) V!43867 V!43867 (_ BitVec 32) Int) ListLongMap!16535)

(assert (=> b!1159162 (= lt!521073 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159163 () Bool)

(declare-fun res!769483 () Bool)

(declare-fun e!659177 () Bool)

(assert (=> b!1159163 (=> (not res!769483) (not e!659177))))

(declare-datatypes ((List!25305 0))(
  ( (Nil!25302) (Cons!25301 (h!26510 (_ BitVec 64)) (t!36822 List!25305)) )
))
(declare-fun arrayNoDuplicates!0 (array!74951 (_ BitVec 32) List!25305) Bool)

(assert (=> b!1159163 (= res!769483 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25302))))

(declare-fun b!1159164 () Bool)

(declare-fun Unit!38199 () Unit!38197)

(assert (=> b!1159164 (= e!659186 Unit!38199)))

(declare-fun b!1159165 () Bool)

(declare-fun e!659179 () Bool)

(declare-fun tp_is_empty!29055 () Bool)

(assert (=> b!1159165 (= e!659179 tp_is_empty!29055)))

(declare-fun mapNonEmpty!45407 () Bool)

(declare-fun mapRes!45407 () Bool)

(declare-fun tp!86285 () Bool)

(declare-fun e!659182 () Bool)

(assert (=> mapNonEmpty!45407 (= mapRes!45407 (and tp!86285 e!659182))))

(declare-fun mapRest!45407 () (Array (_ BitVec 32) ValueCell!13818))

(declare-fun mapValue!45407 () ValueCell!13818)

(declare-fun mapKey!45407 () (_ BitVec 32))

(assert (=> mapNonEmpty!45407 (= (arr!36127 _values!996) (store mapRest!45407 mapKey!45407 mapValue!45407))))

(declare-fun b!1159166 () Bool)

(declare-fun lt!521078 () array!74951)

(declare-fun lt!521076 () array!74953)

(assert (=> b!1159166 (= e!659187 (= lt!521064 (getCurrentListMapNoExtraKeys!4747 lt!521078 lt!521076 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159167 () Bool)

(declare-fun res!769491 () Bool)

(assert (=> b!1159167 (=> (not res!769491) (not e!659177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74951 (_ BitVec 32)) Bool)

(assert (=> b!1159167 (= res!769491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!55839 () Bool)

(declare-fun call!55842 () ListLongMap!16535)

(assert (=> bm!55839 (= call!55842 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159168 () Bool)

(declare-fun res!769486 () Bool)

(assert (=> b!1159168 (=> (not res!769486) (not e!659177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159168 (= res!769486 (validKeyInArray!0 k0!934))))

(declare-fun b!1159169 () Bool)

(declare-fun Unit!38200 () Unit!38197)

(assert (=> b!1159169 (= e!659186 Unit!38200)))

(declare-fun lt!521069 () Bool)

(assert (=> b!1159169 (= lt!521069 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115587 () Bool)

(assert (=> b!1159169 (= c!115587 (and (not lt!521069) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521066 () Unit!38197)

(declare-fun e!659181 () Unit!38197)

(assert (=> b!1159169 (= lt!521066 e!659181)))

(declare-fun lt!521058 () Unit!38197)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!518 (array!74951 array!74953 (_ BitVec 32) (_ BitVec 32) V!43867 V!43867 (_ BitVec 64) (_ BitVec 32) Int) Unit!38197)

(assert (=> b!1159169 (= lt!521058 (lemmaListMapContainsThenArrayContainsFrom!518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115583 () Bool)

(assert (=> b!1159169 (= c!115583 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769490 () Bool)

(declare-fun e!659174 () Bool)

(assert (=> b!1159169 (= res!769490 e!659174)))

(declare-fun e!659178 () Bool)

(assert (=> b!1159169 (=> (not res!769490) (not e!659178))))

(assert (=> b!1159169 e!659178))

(declare-fun lt!521060 () Unit!38197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74951 (_ BitVec 32) (_ BitVec 32)) Unit!38197)

(assert (=> b!1159169 (= lt!521060 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159169 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25302)))

(declare-fun lt!521074 () Unit!38197)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74951 (_ BitVec 64) (_ BitVec 32) List!25305) Unit!38197)

(assert (=> b!1159169 (= lt!521074 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25302))))

(assert (=> b!1159169 false))

(declare-fun b!1159170 () Bool)

(declare-fun e!659171 () Bool)

(declare-fun e!659183 () Bool)

(assert (=> b!1159170 (= e!659171 e!659183)))

(declare-fun res!769492 () Bool)

(assert (=> b!1159170 (=> res!769492 e!659183)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159170 (= res!769492 (not (= from!1455 i!673)))))

(declare-fun lt!521065 () ListLongMap!16535)

(assert (=> b!1159170 (= lt!521065 (getCurrentListMapNoExtraKeys!4747 lt!521078 lt!521076 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159170 (= lt!521076 (array!74954 (store (arr!36127 _values!996) i!673 (ValueCellFull!13818 lt!521072)) (size!36663 _values!996)))))

(declare-fun dynLambda!2751 (Int (_ BitVec 64)) V!43867)

(assert (=> b!1159170 (= lt!521072 (dynLambda!2751 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159170 (= lt!521067 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159171 () Bool)

(declare-fun c!115588 () Bool)

(assert (=> b!1159171 (= c!115588 (and (not lt!521069) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659185 () Unit!38197)

(assert (=> b!1159171 (= e!659181 e!659185)))

(declare-fun b!1159172 () Bool)

(declare-fun arrayContainsKey!0 (array!74951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159172 (= e!659178 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55840 () Bool)

(declare-fun call!55844 () Bool)

(declare-fun call!55843 () Bool)

(assert (=> bm!55840 (= call!55844 call!55843)))

(declare-fun b!1159173 () Bool)

(assert (=> b!1159173 (= e!659182 tp_is_empty!29055)))

(declare-fun b!1159174 () Bool)

(assert (=> b!1159174 (= e!659183 e!659175)))

(declare-fun res!769481 () Bool)

(assert (=> b!1159174 (=> res!769481 e!659175)))

(assert (=> b!1159174 (= res!769481 (not (= (select (arr!36126 _keys!1208) from!1455) k0!934)))))

(declare-fun e!659173 () Bool)

(assert (=> b!1159174 e!659173))

(declare-fun c!115585 () Bool)

(assert (=> b!1159174 (= c!115585 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521079 () Unit!38197)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!625 (array!74951 array!74953 (_ BitVec 32) (_ BitVec 32) V!43867 V!43867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38197)

(assert (=> b!1159174 (= lt!521079 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159175 () Bool)

(declare-fun e!659176 () Unit!38197)

(declare-fun Unit!38201 () Unit!38197)

(assert (=> b!1159175 (= e!659176 Unit!38201)))

(declare-fun bm!55841 () Bool)

(declare-fun call!55845 () ListLongMap!16535)

(declare-fun lt!521061 () ListLongMap!16535)

(assert (=> bm!55841 (= call!55843 (contains!6792 (ite c!115587 lt!521061 call!55845) k0!934))))

(declare-fun b!1159176 () Bool)

(declare-fun e!659184 () Bool)

(assert (=> b!1159176 (= e!659184 (not e!659171))))

(declare-fun res!769482 () Bool)

(assert (=> b!1159176 (=> res!769482 e!659171)))

(assert (=> b!1159176 (= res!769482 (bvsgt from!1455 i!673))))

(assert (=> b!1159176 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521071 () Unit!38197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74951 (_ BitVec 64) (_ BitVec 32)) Unit!38197)

(assert (=> b!1159176 (= lt!521071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159177 () Bool)

(declare-fun res!769479 () Bool)

(assert (=> b!1159177 (=> (not res!769479) (not e!659177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159177 (= res!769479 (validMask!0 mask!1564))))

(declare-fun b!1159178 () Bool)

(declare-fun res!769484 () Bool)

(assert (=> b!1159178 (=> (not res!769484) (not e!659177))))

(assert (=> b!1159178 (= res!769484 (= (select (arr!36126 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45407 () Bool)

(assert (=> mapIsEmpty!45407 mapRes!45407))

(declare-fun call!55847 () ListLongMap!16535)

(declare-fun bm!55842 () Bool)

(assert (=> bm!55842 (= call!55847 (getCurrentListMapNoExtraKeys!4747 lt!521078 lt!521076 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159179 () Bool)

(declare-fun res!769480 () Bool)

(assert (=> b!1159179 (=> (not res!769480) (not e!659184))))

(assert (=> b!1159179 (= res!769480 (arrayNoDuplicates!0 lt!521078 #b00000000000000000000000000000000 Nil!25302))))

(declare-fun bm!55843 () Bool)

(declare-fun call!55846 () Unit!38197)

(declare-fun addStillContains!933 (ListLongMap!16535 (_ BitVec 64) V!43867 (_ BitVec 64)) Unit!38197)

(assert (=> bm!55843 (= call!55846 (addStillContains!933 lt!521073 (ite (or c!115587 c!115588) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115587 c!115588) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1159180 () Bool)

(assert (=> b!1159180 (= e!659174 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159181 () Bool)

(assert (=> b!1159181 (= e!659185 e!659176)))

(declare-fun c!115584 () Bool)

(assert (=> b!1159181 (= c!115584 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521069))))

(declare-fun bm!55844 () Bool)

(declare-fun call!55849 () ListLongMap!16535)

(assert (=> bm!55844 (= call!55845 call!55849)))

(declare-fun b!1159182 () Bool)

(assert (=> b!1159182 (= e!659173 (= call!55847 (-!1394 call!55842 k0!934)))))

(declare-fun b!1159183 () Bool)

(assert (=> b!1159183 (contains!6792 (+!3691 lt!521061 (tuple2!18567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521077 () Unit!38197)

(assert (=> b!1159183 (= lt!521077 (addStillContains!933 lt!521061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159183 call!55843))

(assert (=> b!1159183 (= lt!521061 call!55849)))

(declare-fun lt!521059 () Unit!38197)

(assert (=> b!1159183 (= lt!521059 call!55846)))

(assert (=> b!1159183 (= e!659181 lt!521077)))

(declare-fun b!1159184 () Bool)

(declare-fun res!769488 () Bool)

(assert (=> b!1159184 (=> (not res!769488) (not e!659177))))

(assert (=> b!1159184 (= res!769488 (and (= (size!36663 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36662 _keys!1208) (size!36663 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159185 () Bool)

(declare-fun e!659180 () Bool)

(assert (=> b!1159185 (= e!659180 (and e!659179 mapRes!45407))))

(declare-fun condMapEmpty!45407 () Bool)

(declare-fun mapDefault!45407 () ValueCell!13818)

(assert (=> b!1159185 (= condMapEmpty!45407 (= (arr!36127 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13818)) mapDefault!45407)))))

(declare-fun res!769493 () Bool)

(assert (=> start!98920 (=> (not res!769493) (not e!659177))))

(assert (=> start!98920 (= res!769493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36662 _keys!1208))))))

(assert (=> start!98920 e!659177))

(assert (=> start!98920 tp_is_empty!29055))

(declare-fun array_inv!27644 (array!74951) Bool)

(assert (=> start!98920 (array_inv!27644 _keys!1208)))

(assert (=> start!98920 true))

(assert (=> start!98920 tp!86286))

(declare-fun array_inv!27645 (array!74953) Bool)

(assert (=> start!98920 (and (array_inv!27645 _values!996) e!659180)))

(declare-fun b!1159186 () Bool)

(assert (=> b!1159186 (= e!659177 e!659184)))

(declare-fun res!769487 () Bool)

(assert (=> b!1159186 (=> (not res!769487) (not e!659184))))

(assert (=> b!1159186 (= res!769487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521078 mask!1564))))

(assert (=> b!1159186 (= lt!521078 (array!74952 (store (arr!36126 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36662 _keys!1208)))))

(declare-fun b!1159187 () Bool)

(assert (=> b!1159187 call!55844))

(declare-fun lt!521062 () Unit!38197)

(declare-fun call!55848 () Unit!38197)

(assert (=> b!1159187 (= lt!521062 call!55848)))

(assert (=> b!1159187 (= e!659176 lt!521062)))

(declare-fun bm!55845 () Bool)

(assert (=> bm!55845 (= call!55849 (+!3691 lt!521073 (ite (or c!115587 c!115588) (tuple2!18567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1159188 () Bool)

(assert (=> b!1159188 (= e!659174 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521069) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159189 () Bool)

(declare-fun lt!521070 () Unit!38197)

(assert (=> b!1159189 (= e!659185 lt!521070)))

(assert (=> b!1159189 (= lt!521070 call!55848)))

(assert (=> b!1159189 call!55844))

(declare-fun b!1159190 () Bool)

(assert (=> b!1159190 (= e!659173 (= call!55847 call!55842))))

(declare-fun bm!55846 () Bool)

(assert (=> bm!55846 (= call!55848 call!55846)))

(declare-fun b!1159191 () Bool)

(declare-fun res!769485 () Bool)

(assert (=> b!1159191 (=> (not res!769485) (not e!659177))))

(assert (=> b!1159191 (= res!769485 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36662 _keys!1208))))))

(assert (= (and start!98920 res!769493) b!1159177))

(assert (= (and b!1159177 res!769479) b!1159184))

(assert (= (and b!1159184 res!769488) b!1159167))

(assert (= (and b!1159167 res!769491) b!1159163))

(assert (= (and b!1159163 res!769483) b!1159191))

(assert (= (and b!1159191 res!769485) b!1159168))

(assert (= (and b!1159168 res!769486) b!1159178))

(assert (= (and b!1159178 res!769484) b!1159186))

(assert (= (and b!1159186 res!769487) b!1159179))

(assert (= (and b!1159179 res!769480) b!1159176))

(assert (= (and b!1159176 (not res!769482)) b!1159170))

(assert (= (and b!1159170 (not res!769492)) b!1159174))

(assert (= (and b!1159174 c!115585) b!1159182))

(assert (= (and b!1159174 (not c!115585)) b!1159190))

(assert (= (or b!1159182 b!1159190) bm!55842))

(assert (= (or b!1159182 b!1159190) bm!55839))

(assert (= (and b!1159174 (not res!769481)) b!1159162))

(assert (= (and b!1159162 c!115586) b!1159169))

(assert (= (and b!1159162 (not c!115586)) b!1159164))

(assert (= (and b!1159169 c!115587) b!1159183))

(assert (= (and b!1159169 (not c!115587)) b!1159171))

(assert (= (and b!1159171 c!115588) b!1159189))

(assert (= (and b!1159171 (not c!115588)) b!1159181))

(assert (= (and b!1159181 c!115584) b!1159187))

(assert (= (and b!1159181 (not c!115584)) b!1159175))

(assert (= (or b!1159189 b!1159187) bm!55846))

(assert (= (or b!1159189 b!1159187) bm!55844))

(assert (= (or b!1159189 b!1159187) bm!55840))

(assert (= (or b!1159183 bm!55840) bm!55841))

(assert (= (or b!1159183 bm!55846) bm!55843))

(assert (= (or b!1159183 bm!55844) bm!55845))

(assert (= (and b!1159169 c!115583) b!1159180))

(assert (= (and b!1159169 (not c!115583)) b!1159188))

(assert (= (and b!1159169 res!769490) b!1159172))

(assert (= (and b!1159162 res!769489) b!1159166))

(assert (= (and b!1159185 condMapEmpty!45407) mapIsEmpty!45407))

(assert (= (and b!1159185 (not condMapEmpty!45407)) mapNonEmpty!45407))

(get-info :version)

(assert (= (and mapNonEmpty!45407 ((_ is ValueCellFull!13818) mapValue!45407)) b!1159173))

(assert (= (and b!1159185 ((_ is ValueCellFull!13818) mapDefault!45407)) b!1159165))

(assert (= start!98920 b!1159185))

(declare-fun b_lambda!19631 () Bool)

(assert (=> (not b_lambda!19631) (not b!1159170)))

(declare-fun t!36820 () Bool)

(declare-fun tb!9337 () Bool)

(assert (=> (and start!98920 (= defaultEntry!1004 defaultEntry!1004) t!36820) tb!9337))

(declare-fun result!19239 () Bool)

(assert (=> tb!9337 (= result!19239 tp_is_empty!29055)))

(assert (=> b!1159170 t!36820))

(declare-fun b_and!39901 () Bool)

(assert (= b_and!39899 (and (=> t!36820 result!19239) b_and!39901)))

(declare-fun m!1068269 () Bool)

(assert (=> b!1159186 m!1068269))

(declare-fun m!1068271 () Bool)

(assert (=> b!1159186 m!1068271))

(declare-fun m!1068273 () Bool)

(assert (=> mapNonEmpty!45407 m!1068273))

(declare-fun m!1068275 () Bool)

(assert (=> b!1159183 m!1068275))

(assert (=> b!1159183 m!1068275))

(declare-fun m!1068277 () Bool)

(assert (=> b!1159183 m!1068277))

(declare-fun m!1068279 () Bool)

(assert (=> b!1159183 m!1068279))

(declare-fun m!1068281 () Bool)

(assert (=> b!1159168 m!1068281))

(declare-fun m!1068283 () Bool)

(assert (=> b!1159178 m!1068283))

(declare-fun m!1068285 () Bool)

(assert (=> bm!55845 m!1068285))

(declare-fun m!1068287 () Bool)

(assert (=> b!1159170 m!1068287))

(declare-fun m!1068289 () Bool)

(assert (=> b!1159170 m!1068289))

(declare-fun m!1068291 () Bool)

(assert (=> b!1159170 m!1068291))

(declare-fun m!1068293 () Bool)

(assert (=> b!1159170 m!1068293))

(declare-fun m!1068295 () Bool)

(assert (=> bm!55839 m!1068295))

(declare-fun m!1068297 () Bool)

(assert (=> b!1159179 m!1068297))

(declare-fun m!1068299 () Bool)

(assert (=> b!1159176 m!1068299))

(declare-fun m!1068301 () Bool)

(assert (=> b!1159176 m!1068301))

(declare-fun m!1068303 () Bool)

(assert (=> b!1159169 m!1068303))

(declare-fun m!1068305 () Bool)

(assert (=> b!1159169 m!1068305))

(declare-fun m!1068307 () Bool)

(assert (=> b!1159169 m!1068307))

(declare-fun m!1068309 () Bool)

(assert (=> b!1159169 m!1068309))

(declare-fun m!1068311 () Bool)

(assert (=> b!1159180 m!1068311))

(declare-fun m!1068313 () Bool)

(assert (=> b!1159177 m!1068313))

(assert (=> b!1159172 m!1068311))

(declare-fun m!1068315 () Bool)

(assert (=> bm!55843 m!1068315))

(declare-fun m!1068317 () Bool)

(assert (=> b!1159182 m!1068317))

(declare-fun m!1068319 () Bool)

(assert (=> start!98920 m!1068319))

(declare-fun m!1068321 () Bool)

(assert (=> start!98920 m!1068321))

(declare-fun m!1068323 () Bool)

(assert (=> bm!55842 m!1068323))

(assert (=> b!1159166 m!1068323))

(declare-fun m!1068325 () Bool)

(assert (=> b!1159174 m!1068325))

(declare-fun m!1068327 () Bool)

(assert (=> b!1159174 m!1068327))

(assert (=> b!1159162 m!1068295))

(declare-fun m!1068329 () Bool)

(assert (=> b!1159162 m!1068329))

(declare-fun m!1068331 () Bool)

(assert (=> b!1159162 m!1068331))

(assert (=> b!1159162 m!1068329))

(declare-fun m!1068333 () Bool)

(assert (=> b!1159162 m!1068333))

(declare-fun m!1068335 () Bool)

(assert (=> b!1159162 m!1068335))

(declare-fun m!1068337 () Bool)

(assert (=> b!1159162 m!1068337))

(assert (=> b!1159162 m!1068337))

(assert (=> b!1159162 m!1068325))

(declare-fun m!1068339 () Bool)

(assert (=> b!1159162 m!1068339))

(assert (=> b!1159162 m!1068325))

(declare-fun m!1068341 () Bool)

(assert (=> b!1159162 m!1068341))

(assert (=> b!1159162 m!1068325))

(declare-fun m!1068343 () Bool)

(assert (=> b!1159163 m!1068343))

(declare-fun m!1068345 () Bool)

(assert (=> b!1159167 m!1068345))

(declare-fun m!1068347 () Bool)

(assert (=> bm!55841 m!1068347))

(check-sat (not b!1159176) (not b!1159182) (not b_lambda!19631) (not bm!55845) (not mapNonEmpty!45407) (not b!1159179) (not b!1159163) (not b!1159169) (not bm!55842) tp_is_empty!29055 (not b!1159172) (not bm!55843) (not b!1159162) (not bm!55841) (not b_next!24525) (not b!1159177) (not b!1159168) (not b!1159174) (not b!1159183) (not bm!55839) (not b!1159170) (not b!1159167) b_and!39901 (not start!98920) (not b!1159180) (not b!1159166) (not b!1159186))
(check-sat b_and!39901 (not b_next!24525))
