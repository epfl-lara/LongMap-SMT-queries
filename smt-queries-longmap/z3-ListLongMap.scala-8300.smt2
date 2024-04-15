; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101142 () Bool)

(assert start!101142)

(declare-fun b_free!26071 () Bool)

(declare-fun b_next!26071 () Bool)

(assert (=> start!101142 (= b_free!26071 (not b_next!26071))))

(declare-fun tp!91235 () Bool)

(declare-fun b_and!43241 () Bool)

(assert (=> start!101142 (= tp!91235 b_and!43241)))

(declare-fun b!1213183 () Bool)

(declare-fun res!805615 () Bool)

(declare-fun e!688984 () Bool)

(assert (=> b!1213183 (=> (not res!805615) (not e!688984))))

(declare-datatypes ((array!78252 0))(
  ( (array!78253 (arr!37761 (Array (_ BitVec 32) (_ BitVec 64))) (size!38299 (_ BitVec 32))) )
))
(declare-fun lt!551403 () array!78252)

(declare-datatypes ((List!26702 0))(
  ( (Nil!26699) (Cons!26698 (h!27907 (_ BitVec 64)) (t!39744 List!26702)) )
))
(declare-fun arrayNoDuplicates!0 (array!78252 (_ BitVec 32) List!26702) Bool)

(assert (=> b!1213183 (= res!805615 (arrayNoDuplicates!0 lt!551403 #b00000000000000000000000000000000 Nil!26699))))

(declare-fun bm!60310 () Bool)

(declare-fun call!60317 () Bool)

(declare-fun call!60316 () Bool)

(assert (=> bm!60310 (= call!60317 call!60316)))

(declare-fun b!1213184 () Bool)

(assert (=> b!1213184 call!60317))

(declare-datatypes ((Unit!40074 0))(
  ( (Unit!40075) )
))
(declare-fun lt!551389 () Unit!40074)

(declare-fun call!60314 () Unit!40074)

(assert (=> b!1213184 (= lt!551389 call!60314)))

(declare-fun e!688969 () Unit!40074)

(assert (=> b!1213184 (= e!688969 lt!551389)))

(declare-fun b!1213185 () Bool)

(declare-fun Unit!40076 () Unit!40074)

(assert (=> b!1213185 (= e!688969 Unit!40076)))

(declare-fun b!1213186 () Bool)

(declare-fun res!805605 () Bool)

(declare-fun e!688968 () Bool)

(assert (=> b!1213186 (=> (not res!805605) (not e!688968))))

(declare-fun _keys!1208 () array!78252)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1213186 (= res!805605 (= (select (arr!37761 _keys!1208) i!673) k0!934))))

(declare-fun b!1213187 () Bool)

(declare-fun res!805607 () Bool)

(assert (=> b!1213187 (=> (not res!805607) (not e!688968))))

(assert (=> b!1213187 (= res!805607 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26699))))

(declare-fun b!1213188 () Bool)

(declare-fun res!805606 () Bool)

(assert (=> b!1213188 (=> (not res!805606) (not e!688968))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78252 (_ BitVec 32)) Bool)

(assert (=> b!1213188 (= res!805606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!805614 () Bool)

(assert (=> start!101142 (=> (not res!805614) (not e!688968))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101142 (= res!805614 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38299 _keys!1208))))))

(assert (=> start!101142 e!688968))

(declare-fun tp_is_empty!30775 () Bool)

(assert (=> start!101142 tp_is_empty!30775))

(declare-fun array_inv!28868 (array!78252) Bool)

(assert (=> start!101142 (array_inv!28868 _keys!1208)))

(assert (=> start!101142 true))

(assert (=> start!101142 tp!91235))

(declare-datatypes ((V!46161 0))(
  ( (V!46162 (val!15444 Int)) )
))
(declare-datatypes ((ValueCell!14678 0))(
  ( (ValueCellFull!14678 (v!18096 V!46161)) (EmptyCell!14678) )
))
(declare-datatypes ((array!78254 0))(
  ( (array!78255 (arr!37762 (Array (_ BitVec 32) ValueCell!14678)) (size!38300 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78254)

(declare-fun e!688983 () Bool)

(declare-fun array_inv!28869 (array!78254) Bool)

(assert (=> start!101142 (and (array_inv!28869 _values!996) e!688983)))

(declare-fun mapIsEmpty!48037 () Bool)

(declare-fun mapRes!48037 () Bool)

(assert (=> mapIsEmpty!48037 mapRes!48037))

(declare-fun b!1213189 () Bool)

(declare-fun e!688975 () Bool)

(assert (=> b!1213189 (= e!688975 tp_is_empty!30775)))

(declare-fun bm!60311 () Bool)

(declare-fun call!60320 () Unit!40074)

(assert (=> bm!60311 (= call!60314 call!60320)))

(declare-fun zeroValue!944 () V!46161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!551394 () array!78254)

(declare-datatypes ((tuple2!19924 0))(
  ( (tuple2!19925 (_1!9973 (_ BitVec 64)) (_2!9973 V!46161)) )
))
(declare-datatypes ((List!26703 0))(
  ( (Nil!26700) (Cons!26699 (h!27908 tuple2!19924) (t!39745 List!26703)) )
))
(declare-datatypes ((ListLongMap!17893 0))(
  ( (ListLongMap!17894 (toList!8962 List!26703)) )
))
(declare-fun call!60313 () ListLongMap!17893)

(declare-fun minValue!944 () V!46161)

(declare-fun bm!60312 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5403 (array!78252 array!78254 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 32) Int) ListLongMap!17893)

(assert (=> bm!60312 (= call!60313 (getCurrentListMapNoExtraKeys!5403 lt!551403 lt!551394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213190 () Bool)

(declare-fun res!805617 () Bool)

(assert (=> b!1213190 (=> (not res!805617) (not e!688968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213190 (= res!805617 (validKeyInArray!0 k0!934))))

(declare-fun b!1213191 () Bool)

(declare-fun e!688979 () Unit!40074)

(declare-fun Unit!40077 () Unit!40074)

(assert (=> b!1213191 (= e!688979 Unit!40077)))

(declare-fun b!1213192 () Bool)

(declare-fun res!805612 () Bool)

(assert (=> b!1213192 (=> (not res!805612) (not e!688968))))

(assert (=> b!1213192 (= res!805612 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38299 _keys!1208))))))

(declare-fun call!60319 () ListLongMap!17893)

(declare-fun lt!551393 () ListLongMap!17893)

(declare-fun bm!60313 () Bool)

(declare-fun c!119824 () Bool)

(declare-fun contains!6969 (ListLongMap!17893 (_ BitVec 64)) Bool)

(assert (=> bm!60313 (= call!60316 (contains!6969 (ite c!119824 lt!551393 call!60319) k0!934))))

(declare-fun b!1213193 () Bool)

(declare-fun Unit!40078 () Unit!40074)

(assert (=> b!1213193 (= e!688979 Unit!40078)))

(declare-fun lt!551405 () Bool)

(assert (=> b!1213193 (= lt!551405 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213193 (= c!119824 (and (not lt!551405) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551402 () Unit!40074)

(declare-fun e!688976 () Unit!40074)

(assert (=> b!1213193 (= lt!551402 e!688976)))

(declare-fun lt!551397 () Unit!40074)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!607 (array!78252 array!78254 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 64) (_ BitVec 32) Int) Unit!40074)

(assert (=> b!1213193 (= lt!551397 (lemmaListMapContainsThenArrayContainsFrom!607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119829 () Bool)

(assert (=> b!1213193 (= c!119829 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805618 () Bool)

(declare-fun e!688978 () Bool)

(assert (=> b!1213193 (= res!805618 e!688978)))

(declare-fun e!688974 () Bool)

(assert (=> b!1213193 (=> (not res!805618) (not e!688974))))

(assert (=> b!1213193 e!688974))

(declare-fun lt!551398 () Unit!40074)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78252 (_ BitVec 32) (_ BitVec 32)) Unit!40074)

(assert (=> b!1213193 (= lt!551398 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213193 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26699)))

(declare-fun lt!551396 () Unit!40074)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78252 (_ BitVec 64) (_ BitVec 32) List!26702) Unit!40074)

(assert (=> b!1213193 (= lt!551396 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26699))))

(assert (=> b!1213193 false))

(declare-fun b!1213194 () Bool)

(assert (=> b!1213194 (= e!688978 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551405) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213195 () Bool)

(declare-fun arrayContainsKey!0 (array!78252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213195 (= e!688974 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213196 () Bool)

(declare-fun c!119826 () Bool)

(assert (=> b!1213196 (= c!119826 (and (not lt!551405) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688981 () Unit!40074)

(assert (=> b!1213196 (= e!688976 e!688981)))

(declare-fun b!1213197 () Bool)

(declare-fun e!688970 () Bool)

(assert (=> b!1213197 (= e!688983 (and e!688970 mapRes!48037))))

(declare-fun condMapEmpty!48037 () Bool)

(declare-fun mapDefault!48037 () ValueCell!14678)

(assert (=> b!1213197 (= condMapEmpty!48037 (= (arr!37762 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14678)) mapDefault!48037)))))

(declare-fun b!1213198 () Bool)

(assert (=> b!1213198 (= e!688968 e!688984)))

(declare-fun res!805610 () Bool)

(assert (=> b!1213198 (=> (not res!805610) (not e!688984))))

(assert (=> b!1213198 (= res!805610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551403 mask!1564))))

(assert (=> b!1213198 (= lt!551403 (array!78253 (store (arr!37761 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38299 _keys!1208)))))

(declare-fun bm!60314 () Bool)

(declare-fun call!60315 () ListLongMap!17893)

(assert (=> bm!60314 (= call!60319 call!60315)))

(declare-fun b!1213199 () Bool)

(declare-fun e!688971 () Bool)

(declare-fun lt!551401 () ListLongMap!17893)

(assert (=> b!1213199 (= e!688971 (= lt!551401 (getCurrentListMapNoExtraKeys!5403 lt!551403 lt!551394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213200 () Bool)

(declare-fun e!688980 () Bool)

(declare-fun e!688973 () Bool)

(assert (=> b!1213200 (= e!688980 e!688973)))

(declare-fun res!805604 () Bool)

(assert (=> b!1213200 (=> res!805604 e!688973)))

(assert (=> b!1213200 (= res!805604 (not (= from!1455 i!673)))))

(declare-fun lt!551390 () ListLongMap!17893)

(assert (=> b!1213200 (= lt!551390 (getCurrentListMapNoExtraKeys!5403 lt!551403 lt!551394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551395 () V!46161)

(assert (=> b!1213200 (= lt!551394 (array!78255 (store (arr!37762 _values!996) i!673 (ValueCellFull!14678 lt!551395)) (size!38300 _values!996)))))

(declare-fun dynLambda!3258 (Int (_ BitVec 64)) V!46161)

(assert (=> b!1213200 (= lt!551395 (dynLambda!3258 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551388 () ListLongMap!17893)

(assert (=> b!1213200 (= lt!551388 (getCurrentListMapNoExtraKeys!5403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551386 () ListLongMap!17893)

(declare-fun bm!60315 () Bool)

(declare-fun +!4081 (ListLongMap!17893 tuple2!19924) ListLongMap!17893)

(assert (=> bm!60315 (= call!60315 (+!4081 (ite c!119824 lt!551393 lt!551386) (ite c!119824 (tuple2!19925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119826 (tuple2!19925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!60318 () ListLongMap!17893)

(declare-fun bm!60316 () Bool)

(assert (=> bm!60316 (= call!60318 (getCurrentListMapNoExtraKeys!5403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213201 () Bool)

(assert (=> b!1213201 (= e!688970 tp_is_empty!30775)))

(declare-fun b!1213202 () Bool)

(declare-fun res!805613 () Bool)

(assert (=> b!1213202 (=> (not res!805613) (not e!688968))))

(assert (=> b!1213202 (= res!805613 (and (= (size!38300 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38299 _keys!1208) (size!38300 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213203 () Bool)

(assert (=> b!1213203 (= e!688981 e!688969)))

(declare-fun c!119825 () Bool)

(assert (=> b!1213203 (= c!119825 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551405))))

(declare-fun mapNonEmpty!48037 () Bool)

(declare-fun tp!91234 () Bool)

(assert (=> mapNonEmpty!48037 (= mapRes!48037 (and tp!91234 e!688975))))

(declare-fun mapValue!48037 () ValueCell!14678)

(declare-fun mapKey!48037 () (_ BitVec 32))

(declare-fun mapRest!48037 () (Array (_ BitVec 32) ValueCell!14678))

(assert (=> mapNonEmpty!48037 (= (arr!37762 _values!996) (store mapRest!48037 mapKey!48037 mapValue!48037))))

(declare-fun b!1213204 () Bool)

(assert (=> b!1213204 (= e!688984 (not e!688980))))

(declare-fun res!805611 () Bool)

(assert (=> b!1213204 (=> res!805611 e!688980)))

(assert (=> b!1213204 (= res!805611 (bvsgt from!1455 i!673))))

(assert (=> b!1213204 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551385 () Unit!40074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78252 (_ BitVec 64) (_ BitVec 32)) Unit!40074)

(assert (=> b!1213204 (= lt!551385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213205 () Bool)

(declare-fun res!805616 () Bool)

(assert (=> b!1213205 (=> (not res!805616) (not e!688968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213205 (= res!805616 (validMask!0 mask!1564))))

(declare-fun bm!60317 () Bool)

(declare-fun addStillContains!1066 (ListLongMap!17893 (_ BitVec 64) V!46161 (_ BitVec 64)) Unit!40074)

(assert (=> bm!60317 (= call!60320 (addStillContains!1066 lt!551386 (ite (or c!119824 c!119826) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119824 c!119826) zeroValue!944 minValue!944) k0!934))))

(declare-fun e!688977 () Bool)

(declare-fun b!1213206 () Bool)

(declare-fun -!1838 (ListLongMap!17893 (_ BitVec 64)) ListLongMap!17893)

(assert (=> b!1213206 (= e!688977 (= call!60313 (-!1838 call!60318 k0!934)))))

(declare-fun b!1213207 () Bool)

(assert (=> b!1213207 (contains!6969 call!60315 k0!934)))

(declare-fun lt!551399 () Unit!40074)

(assert (=> b!1213207 (= lt!551399 (addStillContains!1066 lt!551393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1213207 call!60316))

(assert (=> b!1213207 (= lt!551393 (+!4081 lt!551386 (tuple2!19925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551387 () Unit!40074)

(assert (=> b!1213207 (= lt!551387 call!60320)))

(assert (=> b!1213207 (= e!688976 lt!551399)))

(declare-fun b!1213208 () Bool)

(declare-fun lt!551400 () Unit!40074)

(assert (=> b!1213208 (= e!688981 lt!551400)))

(assert (=> b!1213208 (= lt!551400 call!60314)))

(assert (=> b!1213208 call!60317))

(declare-fun b!1213209 () Bool)

(declare-fun e!688972 () Bool)

(assert (=> b!1213209 (= e!688972 (or (not (= lt!551401 lt!551390)) (bvslt i!673 (size!38300 _values!996))))))

(assert (=> b!1213209 e!688971))

(declare-fun res!805608 () Bool)

(assert (=> b!1213209 (=> (not res!805608) (not e!688971))))

(assert (=> b!1213209 (= res!805608 (= lt!551401 lt!551386))))

(assert (=> b!1213209 (= lt!551401 (-!1838 lt!551388 k0!934))))

(declare-fun lt!551404 () V!46161)

(assert (=> b!1213209 (= (-!1838 (+!4081 lt!551386 (tuple2!19925 (select (arr!37761 _keys!1208) from!1455) lt!551404)) (select (arr!37761 _keys!1208) from!1455)) lt!551386)))

(declare-fun lt!551391 () Unit!40074)

(declare-fun addThenRemoveForNewKeyIsSame!271 (ListLongMap!17893 (_ BitVec 64) V!46161) Unit!40074)

(assert (=> b!1213209 (= lt!551391 (addThenRemoveForNewKeyIsSame!271 lt!551386 (select (arr!37761 _keys!1208) from!1455) lt!551404))))

(declare-fun get!19266 (ValueCell!14678 V!46161) V!46161)

(assert (=> b!1213209 (= lt!551404 (get!19266 (select (arr!37762 _values!996) from!1455) lt!551395))))

(declare-fun lt!551384 () Unit!40074)

(assert (=> b!1213209 (= lt!551384 e!688979)))

(declare-fun c!119828 () Bool)

(assert (=> b!1213209 (= c!119828 (contains!6969 lt!551386 k0!934))))

(assert (=> b!1213209 (= lt!551386 (getCurrentListMapNoExtraKeys!5403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213210 () Bool)

(assert (=> b!1213210 (= e!688978 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213211 () Bool)

(assert (=> b!1213211 (= e!688977 (= call!60313 call!60318))))

(declare-fun b!1213212 () Bool)

(assert (=> b!1213212 (= e!688973 e!688972)))

(declare-fun res!805609 () Bool)

(assert (=> b!1213212 (=> res!805609 e!688972)))

(assert (=> b!1213212 (= res!805609 (not (= (select (arr!37761 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213212 e!688977))

(declare-fun c!119827 () Bool)

(assert (=> b!1213212 (= c!119827 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551392 () Unit!40074)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 (array!78252 array!78254 (_ BitVec 32) (_ BitVec 32) V!46161 V!46161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40074)

(assert (=> b!1213212 (= lt!551392 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101142 res!805614) b!1213205))

(assert (= (and b!1213205 res!805616) b!1213202))

(assert (= (and b!1213202 res!805613) b!1213188))

(assert (= (and b!1213188 res!805606) b!1213187))

(assert (= (and b!1213187 res!805607) b!1213192))

(assert (= (and b!1213192 res!805612) b!1213190))

(assert (= (and b!1213190 res!805617) b!1213186))

(assert (= (and b!1213186 res!805605) b!1213198))

(assert (= (and b!1213198 res!805610) b!1213183))

(assert (= (and b!1213183 res!805615) b!1213204))

(assert (= (and b!1213204 (not res!805611)) b!1213200))

(assert (= (and b!1213200 (not res!805604)) b!1213212))

(assert (= (and b!1213212 c!119827) b!1213206))

(assert (= (and b!1213212 (not c!119827)) b!1213211))

(assert (= (or b!1213206 b!1213211) bm!60312))

(assert (= (or b!1213206 b!1213211) bm!60316))

(assert (= (and b!1213212 (not res!805609)) b!1213209))

(assert (= (and b!1213209 c!119828) b!1213193))

(assert (= (and b!1213209 (not c!119828)) b!1213191))

(assert (= (and b!1213193 c!119824) b!1213207))

(assert (= (and b!1213193 (not c!119824)) b!1213196))

(assert (= (and b!1213196 c!119826) b!1213208))

(assert (= (and b!1213196 (not c!119826)) b!1213203))

(assert (= (and b!1213203 c!119825) b!1213184))

(assert (= (and b!1213203 (not c!119825)) b!1213185))

(assert (= (or b!1213208 b!1213184) bm!60311))

(assert (= (or b!1213208 b!1213184) bm!60314))

(assert (= (or b!1213208 b!1213184) bm!60310))

(assert (= (or b!1213207 bm!60310) bm!60313))

(assert (= (or b!1213207 bm!60311) bm!60317))

(assert (= (or b!1213207 bm!60314) bm!60315))

(assert (= (and b!1213193 c!119829) b!1213210))

(assert (= (and b!1213193 (not c!119829)) b!1213194))

(assert (= (and b!1213193 res!805618) b!1213195))

(assert (= (and b!1213209 res!805608) b!1213199))

(assert (= (and b!1213197 condMapEmpty!48037) mapIsEmpty!48037))

(assert (= (and b!1213197 (not condMapEmpty!48037)) mapNonEmpty!48037))

(get-info :version)

(assert (= (and mapNonEmpty!48037 ((_ is ValueCellFull!14678) mapValue!48037)) b!1213189))

(assert (= (and b!1213197 ((_ is ValueCellFull!14678) mapDefault!48037)) b!1213201))

(assert (= start!101142 b!1213197))

(declare-fun b_lambda!21737 () Bool)

(assert (=> (not b_lambda!21737) (not b!1213200)))

(declare-fun t!39743 () Bool)

(declare-fun tb!10863 () Bool)

(assert (=> (and start!101142 (= defaultEntry!1004 defaultEntry!1004) t!39743) tb!10863))

(declare-fun result!22331 () Bool)

(assert (=> tb!10863 (= result!22331 tp_is_empty!30775)))

(assert (=> b!1213200 t!39743))

(declare-fun b_and!43243 () Bool)

(assert (= b_and!43241 (and (=> t!39743 result!22331) b_and!43243)))

(declare-fun m!1118055 () Bool)

(assert (=> bm!60316 m!1118055))

(declare-fun m!1118057 () Bool)

(assert (=> b!1213205 m!1118057))

(declare-fun m!1118059 () Bool)

(assert (=> b!1213204 m!1118059))

(declare-fun m!1118061 () Bool)

(assert (=> b!1213204 m!1118061))

(declare-fun m!1118063 () Bool)

(assert (=> b!1213199 m!1118063))

(declare-fun m!1118065 () Bool)

(assert (=> b!1213200 m!1118065))

(declare-fun m!1118067 () Bool)

(assert (=> b!1213200 m!1118067))

(declare-fun m!1118069 () Bool)

(assert (=> b!1213200 m!1118069))

(declare-fun m!1118071 () Bool)

(assert (=> b!1213200 m!1118071))

(declare-fun m!1118073 () Bool)

(assert (=> b!1213210 m!1118073))

(declare-fun m!1118075 () Bool)

(assert (=> b!1213183 m!1118075))

(declare-fun m!1118077 () Bool)

(assert (=> b!1213212 m!1118077))

(declare-fun m!1118079 () Bool)

(assert (=> b!1213212 m!1118079))

(declare-fun m!1118081 () Bool)

(assert (=> b!1213193 m!1118081))

(declare-fun m!1118083 () Bool)

(assert (=> b!1213193 m!1118083))

(declare-fun m!1118085 () Bool)

(assert (=> b!1213193 m!1118085))

(declare-fun m!1118087 () Bool)

(assert (=> b!1213193 m!1118087))

(assert (=> b!1213195 m!1118073))

(declare-fun m!1118089 () Bool)

(assert (=> b!1213187 m!1118089))

(declare-fun m!1118091 () Bool)

(assert (=> b!1213207 m!1118091))

(declare-fun m!1118093 () Bool)

(assert (=> b!1213207 m!1118093))

(declare-fun m!1118095 () Bool)

(assert (=> b!1213207 m!1118095))

(declare-fun m!1118097 () Bool)

(assert (=> bm!60315 m!1118097))

(declare-fun m!1118099 () Bool)

(assert (=> b!1213206 m!1118099))

(declare-fun m!1118101 () Bool)

(assert (=> b!1213198 m!1118101))

(declare-fun m!1118103 () Bool)

(assert (=> b!1213198 m!1118103))

(declare-fun m!1118105 () Bool)

(assert (=> b!1213186 m!1118105))

(assert (=> bm!60312 m!1118063))

(declare-fun m!1118107 () Bool)

(assert (=> mapNonEmpty!48037 m!1118107))

(declare-fun m!1118109 () Bool)

(assert (=> bm!60317 m!1118109))

(declare-fun m!1118111 () Bool)

(assert (=> bm!60313 m!1118111))

(declare-fun m!1118113 () Bool)

(assert (=> b!1213190 m!1118113))

(assert (=> b!1213209 m!1118055))

(declare-fun m!1118115 () Bool)

(assert (=> b!1213209 m!1118115))

(declare-fun m!1118117 () Bool)

(assert (=> b!1213209 m!1118117))

(declare-fun m!1118119 () Bool)

(assert (=> b!1213209 m!1118119))

(assert (=> b!1213209 m!1118077))

(declare-fun m!1118121 () Bool)

(assert (=> b!1213209 m!1118121))

(assert (=> b!1213209 m!1118119))

(assert (=> b!1213209 m!1118117))

(declare-fun m!1118123 () Bool)

(assert (=> b!1213209 m!1118123))

(assert (=> b!1213209 m!1118077))

(declare-fun m!1118125 () Bool)

(assert (=> b!1213209 m!1118125))

(assert (=> b!1213209 m!1118077))

(declare-fun m!1118127 () Bool)

(assert (=> b!1213209 m!1118127))

(declare-fun m!1118129 () Bool)

(assert (=> start!101142 m!1118129))

(declare-fun m!1118131 () Bool)

(assert (=> start!101142 m!1118131))

(declare-fun m!1118133 () Bool)

(assert (=> b!1213188 m!1118133))

(check-sat (not b!1213205) (not b_lambda!21737) (not bm!60316) (not bm!60313) (not b!1213206) (not bm!60315) (not b!1213207) (not bm!60317) tp_is_empty!30775 (not b!1213195) (not b!1213190) b_and!43243 (not mapNonEmpty!48037) (not bm!60312) (not b!1213188) (not b!1213187) (not start!101142) (not b!1213209) (not b!1213193) (not b!1213198) (not b!1213199) (not b!1213210) (not b!1213183) (not b!1213204) (not b_next!26071) (not b!1213212) (not b!1213200))
(check-sat b_and!43243 (not b_next!26071))
