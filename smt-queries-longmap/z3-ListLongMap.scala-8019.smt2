; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99190 () Bool)

(assert start!99190)

(declare-fun b_free!24559 () Bool)

(declare-fun b_next!24559 () Bool)

(assert (=> start!99190 (= b_free!24559 (not b_next!24559))))

(declare-fun tp!86388 () Bool)

(declare-fun b_and!39969 () Bool)

(assert (=> start!99190 (= tp!86388 b_and!39969)))

(declare-fun b!1162015 () Bool)

(declare-fun res!770756 () Bool)

(declare-fun e!660884 () Bool)

(assert (=> b!1162015 (=> (not res!770756) (not e!660884))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162015 (= res!770756 (validMask!0 mask!1564))))

(declare-fun b!1162016 () Bool)

(declare-fun e!660877 () Bool)

(declare-datatypes ((V!43913 0))(
  ( (V!43914 (val!14601 Int)) )
))
(declare-datatypes ((tuple2!18626 0))(
  ( (tuple2!18627 (_1!9324 (_ BitVec 64)) (_2!9324 V!43913)) )
))
(declare-datatypes ((List!25362 0))(
  ( (Nil!25359) (Cons!25358 (h!26576 tuple2!18626) (t!36905 List!25362)) )
))
(declare-datatypes ((ListLongMap!16603 0))(
  ( (ListLongMap!16604 (toList!8317 List!25362)) )
))
(declare-fun call!56320 () ListLongMap!16603)

(declare-fun call!56316 () ListLongMap!16603)

(assert (=> b!1162016 (= e!660877 (= call!56320 call!56316))))

(declare-fun b!1162017 () Bool)

(declare-fun e!660873 () Bool)

(declare-fun e!660881 () Bool)

(assert (=> b!1162017 (= e!660873 e!660881)))

(declare-fun res!770753 () Bool)

(assert (=> b!1162017 (=> res!770753 e!660881)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162017 (= res!770753 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43913)

(declare-datatypes ((ValueCell!13835 0))(
  ( (ValueCellFull!13835 (v!17234 V!43913)) (EmptyCell!13835) )
))
(declare-datatypes ((array!75067 0))(
  ( (array!75068 (arr!36178 (Array (_ BitVec 32) ValueCell!13835)) (size!36715 (_ BitVec 32))) )
))
(declare-fun lt!522679 () array!75067)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!522674 () ListLongMap!16603)

(declare-fun minValue!944 () V!43913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75069 0))(
  ( (array!75070 (arr!36179 (Array (_ BitVec 32) (_ BitVec 64))) (size!36716 (_ BitVec 32))) )
))
(declare-fun lt!522673 () array!75069)

(declare-fun getCurrentListMapNoExtraKeys!4809 (array!75069 array!75067 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) Int) ListLongMap!16603)

(assert (=> b!1162017 (= lt!522674 (getCurrentListMapNoExtraKeys!4809 lt!522673 lt!522679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522681 () V!43913)

(declare-fun _values!996 () array!75067)

(assert (=> b!1162017 (= lt!522679 (array!75068 (store (arr!36178 _values!996) i!673 (ValueCellFull!13835 lt!522681)) (size!36715 _values!996)))))

(declare-fun dynLambda!2809 (Int (_ BitVec 64)) V!43913)

(assert (=> b!1162017 (= lt!522681 (dynLambda!2809 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75069)

(declare-fun lt!522671 () ListLongMap!16603)

(assert (=> b!1162017 (= lt!522671 (getCurrentListMapNoExtraKeys!4809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!56322 () ListLongMap!16603)

(declare-fun lt!522670 () ListLongMap!16603)

(declare-fun c!116291 () Bool)

(declare-fun lt!522682 () ListLongMap!16603)

(declare-fun c!116292 () Bool)

(declare-fun bm!56312 () Bool)

(declare-fun +!3735 (ListLongMap!16603 tuple2!18626) ListLongMap!16603)

(assert (=> bm!56312 (= call!56322 (+!3735 (ite c!116291 lt!522682 lt!522670) (ite c!116291 (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116292 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162018 () Bool)

(declare-fun res!770765 () Bool)

(assert (=> b!1162018 (=> (not res!770765) (not e!660884))))

(assert (=> b!1162018 (= res!770765 (and (= (size!36715 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36716 _keys!1208) (size!36715 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56313 () Bool)

(declare-fun call!56321 () Bool)

(declare-fun call!56318 () Bool)

(assert (=> bm!56313 (= call!56321 call!56318)))

(declare-fun bm!56314 () Bool)

(declare-datatypes ((Unit!38256 0))(
  ( (Unit!38257) )
))
(declare-fun call!56315 () Unit!38256)

(declare-fun call!56317 () Unit!38256)

(assert (=> bm!56314 (= call!56315 call!56317)))

(declare-fun b!1162019 () Bool)

(declare-fun e!660883 () Bool)

(declare-fun e!660872 () Bool)

(declare-fun mapRes!45458 () Bool)

(assert (=> b!1162019 (= e!660883 (and e!660872 mapRes!45458))))

(declare-fun condMapEmpty!45458 () Bool)

(declare-fun mapDefault!45458 () ValueCell!13835)

(assert (=> b!1162019 (= condMapEmpty!45458 (= (arr!36178 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13835)) mapDefault!45458)))))

(declare-fun b!1162020 () Bool)

(declare-fun e!660880 () Bool)

(assert (=> b!1162020 (= e!660880 (not e!660873))))

(declare-fun res!770757 () Bool)

(assert (=> b!1162020 (=> res!770757 e!660873)))

(assert (=> b!1162020 (= res!770757 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162020 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522664 () Unit!38256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75069 (_ BitVec 64) (_ BitVec 32)) Unit!38256)

(assert (=> b!1162020 (= lt!522664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!56315 () Bool)

(assert (=> bm!56315 (= call!56316 (getCurrentListMapNoExtraKeys!4809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162021 () Bool)

(assert (=> b!1162021 (= e!660884 e!660880)))

(declare-fun res!770766 () Bool)

(assert (=> b!1162021 (=> (not res!770766) (not e!660880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75069 (_ BitVec 32)) Bool)

(assert (=> b!1162021 (= res!770766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522673 mask!1564))))

(assert (=> b!1162021 (= lt!522673 (array!75070 (store (arr!36179 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36716 _keys!1208)))))

(declare-fun b!1162022 () Bool)

(declare-fun res!770763 () Bool)

(assert (=> b!1162022 (=> (not res!770763) (not e!660884))))

(assert (=> b!1162022 (= res!770763 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36716 _keys!1208))))))

(declare-fun b!1162023 () Bool)

(declare-fun e!660878 () Bool)

(assert (=> b!1162023 (= e!660878 true)))

(declare-fun e!660874 () Bool)

(assert (=> b!1162023 e!660874))

(declare-fun res!770761 () Bool)

(assert (=> b!1162023 (=> (not res!770761) (not e!660874))))

(declare-fun lt!522685 () ListLongMap!16603)

(assert (=> b!1162023 (= res!770761 (= lt!522685 lt!522670))))

(declare-fun -!1415 (ListLongMap!16603 (_ BitVec 64)) ListLongMap!16603)

(assert (=> b!1162023 (= lt!522685 (-!1415 lt!522671 k0!934))))

(declare-fun lt!522684 () V!43913)

(assert (=> b!1162023 (= (-!1415 (+!3735 lt!522670 (tuple2!18627 (select (arr!36179 _keys!1208) from!1455) lt!522684)) (select (arr!36179 _keys!1208) from!1455)) lt!522670)))

(declare-fun lt!522666 () Unit!38256)

(declare-fun addThenRemoveForNewKeyIsSame!244 (ListLongMap!16603 (_ BitVec 64) V!43913) Unit!38256)

(assert (=> b!1162023 (= lt!522666 (addThenRemoveForNewKeyIsSame!244 lt!522670 (select (arr!36179 _keys!1208) from!1455) lt!522684))))

(declare-fun get!18475 (ValueCell!13835 V!43913) V!43913)

(assert (=> b!1162023 (= lt!522684 (get!18475 (select (arr!36178 _values!996) from!1455) lt!522681))))

(declare-fun lt!522665 () Unit!38256)

(declare-fun e!660886 () Unit!38256)

(assert (=> b!1162023 (= lt!522665 e!660886)))

(declare-fun c!116288 () Bool)

(declare-fun contains!6836 (ListLongMap!16603 (_ BitVec 64)) Bool)

(assert (=> b!1162023 (= c!116288 (contains!6836 lt!522670 k0!934))))

(assert (=> b!1162023 (= lt!522670 (getCurrentListMapNoExtraKeys!4809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162024 () Bool)

(declare-fun tp_is_empty!29089 () Bool)

(assert (=> b!1162024 (= e!660872 tp_is_empty!29089)))

(declare-fun bm!56316 () Bool)

(assert (=> bm!56316 (= call!56320 (getCurrentListMapNoExtraKeys!4809 lt!522673 lt!522679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162025 () Bool)

(declare-fun Unit!38258 () Unit!38256)

(assert (=> b!1162025 (= e!660886 Unit!38258)))

(declare-fun lt!522669 () Bool)

(assert (=> b!1162025 (= lt!522669 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162025 (= c!116291 (and (not lt!522669) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522683 () Unit!38256)

(declare-fun e!660875 () Unit!38256)

(assert (=> b!1162025 (= lt!522683 e!660875)))

(declare-fun lt!522667 () Unit!38256)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!539 (array!75069 array!75067 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 64) (_ BitVec 32) Int) Unit!38256)

(assert (=> b!1162025 (= lt!522667 (lemmaListMapContainsThenArrayContainsFrom!539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116290 () Bool)

(assert (=> b!1162025 (= c!116290 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770762 () Bool)

(declare-fun e!660870 () Bool)

(assert (=> b!1162025 (= res!770762 e!660870)))

(declare-fun e!660882 () Bool)

(assert (=> b!1162025 (=> (not res!770762) (not e!660882))))

(assert (=> b!1162025 e!660882))

(declare-fun lt!522672 () Unit!38256)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75069 (_ BitVec 32) (_ BitVec 32)) Unit!38256)

(assert (=> b!1162025 (= lt!522672 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25363 0))(
  ( (Nil!25360) (Cons!25359 (h!26577 (_ BitVec 64)) (t!36906 List!25363)) )
))
(declare-fun arrayNoDuplicates!0 (array!75069 (_ BitVec 32) List!25363) Bool)

(assert (=> b!1162025 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25360)))

(declare-fun lt!522668 () Unit!38256)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75069 (_ BitVec 64) (_ BitVec 32) List!25363) Unit!38256)

(assert (=> b!1162025 (= lt!522668 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25360))))

(assert (=> b!1162025 false))

(declare-fun b!1162026 () Bool)

(declare-fun res!770755 () Bool)

(assert (=> b!1162026 (=> (not res!770755) (not e!660884))))

(assert (=> b!1162026 (= res!770755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162027 () Bool)

(assert (=> b!1162027 (= e!660870 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522669) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56317 () Bool)

(declare-fun call!56319 () ListLongMap!16603)

(assert (=> bm!56317 (= call!56318 (contains!6836 (ite c!116291 lt!522682 call!56319) k0!934))))

(declare-fun b!1162028 () Bool)

(declare-fun e!660879 () Unit!38256)

(declare-fun lt!522677 () Unit!38256)

(assert (=> b!1162028 (= e!660879 lt!522677)))

(assert (=> b!1162028 (= lt!522677 call!56315)))

(assert (=> b!1162028 call!56321))

(declare-fun b!1162029 () Bool)

(declare-fun Unit!38259 () Unit!38256)

(assert (=> b!1162029 (= e!660886 Unit!38259)))

(declare-fun bm!56318 () Bool)

(assert (=> bm!56318 (= call!56319 call!56322)))

(declare-fun b!1162030 () Bool)

(assert (=> b!1162030 (= e!660882 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162031 () Bool)

(assert (=> b!1162031 (= c!116292 (and (not lt!522669) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162031 (= e!660875 e!660879)))

(declare-fun bm!56319 () Bool)

(declare-fun addStillContains!954 (ListLongMap!16603 (_ BitVec 64) V!43913 (_ BitVec 64)) Unit!38256)

(assert (=> bm!56319 (= call!56317 (addStillContains!954 lt!522670 (ite (or c!116291 c!116292) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116291 c!116292) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162032 () Bool)

(declare-fun res!770760 () Bool)

(assert (=> b!1162032 (=> (not res!770760) (not e!660884))))

(assert (=> b!1162032 (= res!770760 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25360))))

(declare-fun b!1162033 () Bool)

(assert (=> b!1162033 call!56321))

(declare-fun lt!522680 () Unit!38256)

(assert (=> b!1162033 (= lt!522680 call!56315)))

(declare-fun e!660885 () Unit!38256)

(assert (=> b!1162033 (= e!660885 lt!522680)))

(declare-fun mapNonEmpty!45458 () Bool)

(declare-fun tp!86387 () Bool)

(declare-fun e!660876 () Bool)

(assert (=> mapNonEmpty!45458 (= mapRes!45458 (and tp!86387 e!660876))))

(declare-fun mapRest!45458 () (Array (_ BitVec 32) ValueCell!13835))

(declare-fun mapValue!45458 () ValueCell!13835)

(declare-fun mapKey!45458 () (_ BitVec 32))

(assert (=> mapNonEmpty!45458 (= (arr!36178 _values!996) (store mapRest!45458 mapKey!45458 mapValue!45458))))

(declare-fun b!1162034 () Bool)

(assert (=> b!1162034 (= e!660877 (= call!56320 (-!1415 call!56316 k0!934)))))

(declare-fun b!1162035 () Bool)

(declare-fun Unit!38260 () Unit!38256)

(assert (=> b!1162035 (= e!660885 Unit!38260)))

(declare-fun res!770759 () Bool)

(assert (=> start!99190 (=> (not res!770759) (not e!660884))))

(assert (=> start!99190 (= res!770759 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36716 _keys!1208))))))

(assert (=> start!99190 e!660884))

(assert (=> start!99190 tp_is_empty!29089))

(declare-fun array_inv!27748 (array!75069) Bool)

(assert (=> start!99190 (array_inv!27748 _keys!1208)))

(assert (=> start!99190 true))

(assert (=> start!99190 tp!86388))

(declare-fun array_inv!27749 (array!75067) Bool)

(assert (=> start!99190 (and (array_inv!27749 _values!996) e!660883)))

(declare-fun b!1162036 () Bool)

(declare-fun res!770754 () Bool)

(assert (=> b!1162036 (=> (not res!770754) (not e!660884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162036 (= res!770754 (validKeyInArray!0 k0!934))))

(declare-fun b!1162037 () Bool)

(declare-fun res!770752 () Bool)

(assert (=> b!1162037 (=> (not res!770752) (not e!660880))))

(assert (=> b!1162037 (= res!770752 (arrayNoDuplicates!0 lt!522673 #b00000000000000000000000000000000 Nil!25360))))

(declare-fun b!1162038 () Bool)

(assert (=> b!1162038 (= e!660876 tp_is_empty!29089)))

(declare-fun b!1162039 () Bool)

(assert (=> b!1162039 (= e!660879 e!660885)))

(declare-fun c!116287 () Bool)

(assert (=> b!1162039 (= c!116287 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522669))))

(declare-fun b!1162040 () Bool)

(assert (=> b!1162040 (= e!660881 e!660878)))

(declare-fun res!770758 () Bool)

(assert (=> b!1162040 (=> res!770758 e!660878)))

(assert (=> b!1162040 (= res!770758 (not (= (select (arr!36179 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162040 e!660877))

(declare-fun c!116289 () Bool)

(assert (=> b!1162040 (= c!116289 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522678 () Unit!38256)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!645 (array!75069 array!75067 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38256)

(assert (=> b!1162040 (= lt!522678 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!645 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162041 () Bool)

(assert (=> b!1162041 (contains!6836 call!56322 k0!934)))

(declare-fun lt!522675 () Unit!38256)

(assert (=> b!1162041 (= lt!522675 (addStillContains!954 lt!522682 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1162041 call!56318))

(assert (=> b!1162041 (= lt!522682 (+!3735 lt!522670 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522676 () Unit!38256)

(assert (=> b!1162041 (= lt!522676 call!56317)))

(assert (=> b!1162041 (= e!660875 lt!522675)))

(declare-fun b!1162042 () Bool)

(declare-fun res!770764 () Bool)

(assert (=> b!1162042 (=> (not res!770764) (not e!660884))))

(assert (=> b!1162042 (= res!770764 (= (select (arr!36179 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45458 () Bool)

(assert (=> mapIsEmpty!45458 mapRes!45458))

(declare-fun b!1162043 () Bool)

(assert (=> b!1162043 (= e!660870 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162044 () Bool)

(assert (=> b!1162044 (= e!660874 (= lt!522685 (getCurrentListMapNoExtraKeys!4809 lt!522673 lt!522679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!99190 res!770759) b!1162015))

(assert (= (and b!1162015 res!770756) b!1162018))

(assert (= (and b!1162018 res!770765) b!1162026))

(assert (= (and b!1162026 res!770755) b!1162032))

(assert (= (and b!1162032 res!770760) b!1162022))

(assert (= (and b!1162022 res!770763) b!1162036))

(assert (= (and b!1162036 res!770754) b!1162042))

(assert (= (and b!1162042 res!770764) b!1162021))

(assert (= (and b!1162021 res!770766) b!1162037))

(assert (= (and b!1162037 res!770752) b!1162020))

(assert (= (and b!1162020 (not res!770757)) b!1162017))

(assert (= (and b!1162017 (not res!770753)) b!1162040))

(assert (= (and b!1162040 c!116289) b!1162034))

(assert (= (and b!1162040 (not c!116289)) b!1162016))

(assert (= (or b!1162034 b!1162016) bm!56316))

(assert (= (or b!1162034 b!1162016) bm!56315))

(assert (= (and b!1162040 (not res!770758)) b!1162023))

(assert (= (and b!1162023 c!116288) b!1162025))

(assert (= (and b!1162023 (not c!116288)) b!1162029))

(assert (= (and b!1162025 c!116291) b!1162041))

(assert (= (and b!1162025 (not c!116291)) b!1162031))

(assert (= (and b!1162031 c!116292) b!1162028))

(assert (= (and b!1162031 (not c!116292)) b!1162039))

(assert (= (and b!1162039 c!116287) b!1162033))

(assert (= (and b!1162039 (not c!116287)) b!1162035))

(assert (= (or b!1162028 b!1162033) bm!56314))

(assert (= (or b!1162028 b!1162033) bm!56318))

(assert (= (or b!1162028 b!1162033) bm!56313))

(assert (= (or b!1162041 bm!56313) bm!56317))

(assert (= (or b!1162041 bm!56314) bm!56319))

(assert (= (or b!1162041 bm!56318) bm!56312))

(assert (= (and b!1162025 c!116290) b!1162043))

(assert (= (and b!1162025 (not c!116290)) b!1162027))

(assert (= (and b!1162025 res!770762) b!1162030))

(assert (= (and b!1162023 res!770761) b!1162044))

(assert (= (and b!1162019 condMapEmpty!45458) mapIsEmpty!45458))

(assert (= (and b!1162019 (not condMapEmpty!45458)) mapNonEmpty!45458))

(get-info :version)

(assert (= (and mapNonEmpty!45458 ((_ is ValueCellFull!13835) mapValue!45458)) b!1162038))

(assert (= (and b!1162019 ((_ is ValueCellFull!13835) mapDefault!45458)) b!1162024))

(assert (= start!99190 b!1162019))

(declare-fun b_lambda!19659 () Bool)

(assert (=> (not b_lambda!19659) (not b!1162017)))

(declare-fun t!36904 () Bool)

(declare-fun tb!9363 () Bool)

(assert (=> (and start!99190 (= defaultEntry!1004 defaultEntry!1004) t!36904) tb!9363))

(declare-fun result!19299 () Bool)

(assert (=> tb!9363 (= result!19299 tp_is_empty!29089)))

(assert (=> b!1162017 t!36904))

(declare-fun b_and!39971 () Bool)

(assert (= b_and!39969 (and (=> t!36904 result!19299) b_and!39971)))

(declare-fun m!1071209 () Bool)

(assert (=> b!1162040 m!1071209))

(declare-fun m!1071211 () Bool)

(assert (=> b!1162040 m!1071211))

(declare-fun m!1071213 () Bool)

(assert (=> mapNonEmpty!45458 m!1071213))

(declare-fun m!1071215 () Bool)

(assert (=> b!1162043 m!1071215))

(declare-fun m!1071217 () Bool)

(assert (=> bm!56315 m!1071217))

(assert (=> b!1162030 m!1071215))

(declare-fun m!1071219 () Bool)

(assert (=> b!1162037 m!1071219))

(declare-fun m!1071221 () Bool)

(assert (=> b!1162025 m!1071221))

(declare-fun m!1071223 () Bool)

(assert (=> b!1162025 m!1071223))

(declare-fun m!1071225 () Bool)

(assert (=> b!1162025 m!1071225))

(declare-fun m!1071227 () Bool)

(assert (=> b!1162025 m!1071227))

(declare-fun m!1071229 () Bool)

(assert (=> b!1162032 m!1071229))

(declare-fun m!1071231 () Bool)

(assert (=> start!99190 m!1071231))

(declare-fun m!1071233 () Bool)

(assert (=> start!99190 m!1071233))

(declare-fun m!1071235 () Bool)

(assert (=> b!1162042 m!1071235))

(declare-fun m!1071237 () Bool)

(assert (=> b!1162036 m!1071237))

(declare-fun m!1071239 () Bool)

(assert (=> b!1162015 m!1071239))

(declare-fun m!1071241 () Bool)

(assert (=> b!1162017 m!1071241))

(declare-fun m!1071243 () Bool)

(assert (=> b!1162017 m!1071243))

(declare-fun m!1071245 () Bool)

(assert (=> b!1162017 m!1071245))

(declare-fun m!1071247 () Bool)

(assert (=> b!1162017 m!1071247))

(declare-fun m!1071249 () Bool)

(assert (=> b!1162041 m!1071249))

(declare-fun m!1071251 () Bool)

(assert (=> b!1162041 m!1071251))

(declare-fun m!1071253 () Bool)

(assert (=> b!1162041 m!1071253))

(declare-fun m!1071255 () Bool)

(assert (=> b!1162026 m!1071255))

(declare-fun m!1071257 () Bool)

(assert (=> b!1162034 m!1071257))

(declare-fun m!1071259 () Bool)

(assert (=> bm!56316 m!1071259))

(declare-fun m!1071261 () Bool)

(assert (=> bm!56312 m!1071261))

(assert (=> b!1162044 m!1071259))

(assert (=> b!1162023 m!1071217))

(declare-fun m!1071263 () Bool)

(assert (=> b!1162023 m!1071263))

(declare-fun m!1071265 () Bool)

(assert (=> b!1162023 m!1071265))

(declare-fun m!1071267 () Bool)

(assert (=> b!1162023 m!1071267))

(assert (=> b!1162023 m!1071209))

(declare-fun m!1071269 () Bool)

(assert (=> b!1162023 m!1071269))

(assert (=> b!1162023 m!1071267))

(declare-fun m!1071271 () Bool)

(assert (=> b!1162023 m!1071271))

(assert (=> b!1162023 m!1071209))

(declare-fun m!1071273 () Bool)

(assert (=> b!1162023 m!1071273))

(assert (=> b!1162023 m!1071263))

(declare-fun m!1071275 () Bool)

(assert (=> b!1162023 m!1071275))

(assert (=> b!1162023 m!1071209))

(declare-fun m!1071277 () Bool)

(assert (=> bm!56319 m!1071277))

(declare-fun m!1071279 () Bool)

(assert (=> bm!56317 m!1071279))

(declare-fun m!1071281 () Bool)

(assert (=> b!1162020 m!1071281))

(declare-fun m!1071283 () Bool)

(assert (=> b!1162020 m!1071283))

(declare-fun m!1071285 () Bool)

(assert (=> b!1162021 m!1071285))

(declare-fun m!1071287 () Bool)

(assert (=> b!1162021 m!1071287))

(check-sat tp_is_empty!29089 (not bm!56319) (not b!1162021) (not b!1162034) b_and!39971 (not b!1162036) (not b!1162040) (not b!1162020) (not b!1162025) (not b!1162023) (not b!1162017) (not b!1162043) (not bm!56316) (not b!1162026) (not b!1162015) (not bm!56312) (not mapNonEmpty!45458) (not b!1162032) (not b!1162044) (not b!1162041) (not b!1162037) (not b!1162030) (not bm!56315) (not b_next!24559) (not b_lambda!19659) (not start!99190) (not bm!56317))
(check-sat b_and!39971 (not b_next!24559))
