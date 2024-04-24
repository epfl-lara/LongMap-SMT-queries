; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98842 () Bool)

(assert start!98842)

(declare-fun b_free!24211 () Bool)

(declare-fun b_next!24211 () Bool)

(assert (=> start!98842 (= b_free!24211 (not b_next!24211))))

(declare-fun tp!85344 () Bool)

(declare-fun b_and!39273 () Bool)

(assert (=> start!98842 (= tp!85344 b_and!39273)))

(declare-fun mapNonEmpty!44936 () Bool)

(declare-fun mapRes!44936 () Bool)

(declare-fun tp!85343 () Bool)

(declare-fun e!652006 () Bool)

(assert (=> mapNonEmpty!44936 (= mapRes!44936 (and tp!85343 e!652006))))

(declare-fun mapKey!44936 () (_ BitVec 32))

(declare-datatypes ((V!43449 0))(
  ( (V!43450 (val!14427 Int)) )
))
(declare-datatypes ((ValueCell!13661 0))(
  ( (ValueCellFull!13661 (v!17060 V!43449)) (EmptyCell!13661) )
))
(declare-fun mapRest!44936 () (Array (_ BitVec 32) ValueCell!13661))

(declare-datatypes ((array!74381 0))(
  ( (array!74382 (arr!35835 (Array (_ BitVec 32) ValueCell!13661)) (size!36372 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74381)

(declare-fun mapValue!44936 () ValueCell!13661)

(assert (=> mapNonEmpty!44936 (= (arr!35835 _values!996) (store mapRest!44936 mapKey!44936 mapValue!44936))))

(declare-fun e!652010 () Bool)

(declare-datatypes ((tuple2!18288 0))(
  ( (tuple2!18289 (_1!9155 (_ BitVec 64)) (_2!9155 V!43449)) )
))
(declare-datatypes ((List!25044 0))(
  ( (Nil!25041) (Cons!25040 (h!26258 tuple2!18288) (t!36239 List!25044)) )
))
(declare-datatypes ((ListLongMap!16265 0))(
  ( (ListLongMap!16266 (toList!8148 List!25044)) )
))
(declare-fun call!52146 () ListLongMap!16265)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!52139 () ListLongMap!16265)

(declare-fun b!1146007 () Bool)

(declare-fun -!1276 (ListLongMap!16265 (_ BitVec 64)) ListLongMap!16265)

(assert (=> b!1146007 (= e!652010 (= call!52146 (-!1276 call!52139 k0!934)))))

(declare-fun zeroValue!944 () V!43449)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!52136 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511328 () array!74381)

(declare-datatypes ((array!74383 0))(
  ( (array!74384 (arr!35836 (Array (_ BitVec 32) (_ BitVec 64))) (size!36373 (_ BitVec 32))) )
))
(declare-fun lt!511325 () array!74383)

(declare-fun minValue!944 () V!43449)

(declare-fun getCurrentListMapNoExtraKeys!4653 (array!74383 array!74381 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 32) Int) ListLongMap!16265)

(assert (=> bm!52136 (= call!52146 (getCurrentListMapNoExtraKeys!4653 lt!511325 lt!511328 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146008 () Bool)

(declare-fun e!652011 () Bool)

(declare-fun e!652002 () Bool)

(assert (=> b!1146008 (= e!652011 (not e!652002))))

(declare-fun res!762927 () Bool)

(assert (=> b!1146008 (=> res!762927 e!652002)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146008 (= res!762927 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!74383)

(declare-fun arrayContainsKey!0 (array!74383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146008 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37558 0))(
  ( (Unit!37559) )
))
(declare-fun lt!511331 () Unit!37558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74383 (_ BitVec 64) (_ BitVec 32)) Unit!37558)

(assert (=> b!1146008 (= lt!511331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52137 () Bool)

(declare-fun call!52141 () Bool)

(declare-fun call!52143 () Bool)

(assert (=> bm!52137 (= call!52141 call!52143)))

(declare-fun bm!52138 () Bool)

(assert (=> bm!52138 (= call!52139 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146009 () Bool)

(declare-fun c!113160 () Bool)

(declare-fun lt!511323 () Bool)

(assert (=> b!1146009 (= c!113160 (and (not lt!511323) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652007 () Unit!37558)

(declare-fun e!652001 () Unit!37558)

(assert (=> b!1146009 (= e!652007 e!652001)))

(declare-fun e!652008 () Bool)

(declare-fun b!1146010 () Bool)

(assert (=> b!1146010 (= e!652008 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511323) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146011 () Bool)

(declare-fun e!651998 () Unit!37558)

(assert (=> b!1146011 (= e!652001 e!651998)))

(declare-fun c!113156 () Bool)

(assert (=> b!1146011 (= c!113156 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511323))))

(declare-fun b!1146012 () Bool)

(declare-fun res!762934 () Bool)

(declare-fun e!652000 () Bool)

(assert (=> b!1146012 (=> (not res!762934) (not e!652000))))

(assert (=> b!1146012 (= res!762934 (= (select (arr!35836 _keys!1208) i!673) k0!934))))

(declare-fun b!1146013 () Bool)

(declare-fun e!652004 () Bool)

(declare-fun tp_is_empty!28741 () Bool)

(assert (=> b!1146013 (= e!652004 tp_is_empty!28741)))

(declare-fun b!1146014 () Bool)

(declare-fun lt!511341 () ListLongMap!16265)

(declare-fun contains!6690 (ListLongMap!16265 (_ BitVec 64)) Bool)

(declare-fun +!3591 (ListLongMap!16265 tuple2!18288) ListLongMap!16265)

(assert (=> b!1146014 (contains!6690 (+!3591 lt!511341 (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511327 () Unit!37558)

(declare-fun call!52140 () Unit!37558)

(assert (=> b!1146014 (= lt!511327 call!52140)))

(assert (=> b!1146014 call!52143))

(declare-fun call!52142 () ListLongMap!16265)

(assert (=> b!1146014 (= lt!511341 call!52142)))

(declare-fun lt!511336 () ListLongMap!16265)

(declare-fun lt!511324 () Unit!37558)

(declare-fun addStillContains!817 (ListLongMap!16265 (_ BitVec 64) V!43449 (_ BitVec 64)) Unit!37558)

(assert (=> b!1146014 (= lt!511324 (addStillContains!817 lt!511336 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1146014 (= e!652007 lt!511327)))

(declare-fun b!1146015 () Bool)

(assert (=> b!1146015 (= e!652006 tp_is_empty!28741)))

(declare-fun b!1146016 () Bool)

(declare-fun res!762932 () Bool)

(assert (=> b!1146016 (=> (not res!762932) (not e!652000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146016 (= res!762932 (validKeyInArray!0 k0!934))))

(declare-fun b!1146017 () Bool)

(assert (=> b!1146017 (= e!652008 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146018 () Bool)

(assert (=> b!1146018 (= e!652000 e!652011)))

(declare-fun res!762931 () Bool)

(assert (=> b!1146018 (=> (not res!762931) (not e!652011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74383 (_ BitVec 32)) Bool)

(assert (=> b!1146018 (= res!762931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511325 mask!1564))))

(assert (=> b!1146018 (= lt!511325 (array!74384 (store (arr!35836 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36373 _keys!1208)))))

(declare-fun b!1146019 () Bool)

(declare-fun res!762924 () Bool)

(assert (=> b!1146019 (=> (not res!762924) (not e!652000))))

(declare-datatypes ((List!25045 0))(
  ( (Nil!25042) (Cons!25041 (h!26259 (_ BitVec 64)) (t!36240 List!25045)) )
))
(declare-fun arrayNoDuplicates!0 (array!74383 (_ BitVec 32) List!25045) Bool)

(assert (=> b!1146019 (= res!762924 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25042))))

(declare-fun b!1146020 () Bool)

(declare-fun e!651997 () Bool)

(assert (=> b!1146020 (= e!651997 true)))

(declare-fun e!652012 () Bool)

(assert (=> b!1146020 e!652012))

(declare-fun res!762930 () Bool)

(assert (=> b!1146020 (=> (not res!762930) (not e!652012))))

(declare-fun lt!511333 () V!43449)

(assert (=> b!1146020 (= res!762930 (= (-!1276 (+!3591 lt!511336 (tuple2!18289 (select (arr!35836 _keys!1208) from!1455) lt!511333)) (select (arr!35836 _keys!1208) from!1455)) lt!511336))))

(declare-fun lt!511338 () Unit!37558)

(declare-fun addThenRemoveForNewKeyIsSame!131 (ListLongMap!16265 (_ BitVec 64) V!43449) Unit!37558)

(assert (=> b!1146020 (= lt!511338 (addThenRemoveForNewKeyIsSame!131 lt!511336 (select (arr!35836 _keys!1208) from!1455) lt!511333))))

(declare-fun lt!511332 () V!43449)

(declare-fun get!18246 (ValueCell!13661 V!43449) V!43449)

(assert (=> b!1146020 (= lt!511333 (get!18246 (select (arr!35835 _values!996) from!1455) lt!511332))))

(declare-fun lt!511322 () Unit!37558)

(declare-fun e!652005 () Unit!37558)

(assert (=> b!1146020 (= lt!511322 e!652005)))

(declare-fun c!113155 () Bool)

(assert (=> b!1146020 (= c!113155 (contains!6690 lt!511336 k0!934))))

(assert (=> b!1146020 (= lt!511336 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52139 () Bool)

(declare-fun call!52144 () ListLongMap!16265)

(assert (=> bm!52139 (= call!52144 call!52142)))

(declare-fun b!1146021 () Bool)

(declare-fun Unit!37560 () Unit!37558)

(assert (=> b!1146021 (= e!652005 Unit!37560)))

(declare-fun b!1146022 () Bool)

(declare-fun lt!511330 () Unit!37558)

(assert (=> b!1146022 (= e!652001 lt!511330)))

(declare-fun call!52145 () Unit!37558)

(assert (=> b!1146022 (= lt!511330 call!52145)))

(assert (=> b!1146022 call!52141))

(declare-fun lt!511334 () ListLongMap!16265)

(declare-fun b!1146023 () Bool)

(assert (=> b!1146023 (= e!652012 (= (-!1276 lt!511334 k0!934) lt!511336))))

(declare-fun b!1146024 () Bool)

(declare-fun res!762925 () Bool)

(assert (=> b!1146024 (=> (not res!762925) (not e!652000))))

(assert (=> b!1146024 (= res!762925 (and (= (size!36372 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36373 _keys!1208) (size!36372 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146025 () Bool)

(declare-fun e!651999 () Bool)

(assert (=> b!1146025 (= e!651999 e!651997)))

(declare-fun res!762935 () Bool)

(assert (=> b!1146025 (=> res!762935 e!651997)))

(assert (=> b!1146025 (= res!762935 (not (= (select (arr!35836 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146025 e!652010))

(declare-fun c!113158 () Bool)

(assert (=> b!1146025 (= c!113158 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511335 () Unit!37558)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!523 (array!74383 array!74381 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37558)

(assert (=> b!1146025 (= lt!511335 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146026 () Bool)

(assert (=> b!1146026 (= e!652002 e!651999)))

(declare-fun res!762928 () Bool)

(assert (=> b!1146026 (=> res!762928 e!651999)))

(assert (=> b!1146026 (= res!762928 (not (= from!1455 i!673)))))

(declare-fun lt!511337 () ListLongMap!16265)

(assert (=> b!1146026 (= lt!511337 (getCurrentListMapNoExtraKeys!4653 lt!511325 lt!511328 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146026 (= lt!511328 (array!74382 (store (arr!35835 _values!996) i!673 (ValueCellFull!13661 lt!511332)) (size!36372 _values!996)))))

(declare-fun dynLambda!2684 (Int (_ BitVec 64)) V!43449)

(assert (=> b!1146026 (= lt!511332 (dynLambda!2684 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1146026 (= lt!511334 (getCurrentListMapNoExtraKeys!4653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146027 () Bool)

(declare-fun e!651996 () Bool)

(assert (=> b!1146027 (= e!651996 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44936 () Bool)

(assert (=> mapIsEmpty!44936 mapRes!44936))

(declare-fun b!1146028 () Bool)

(declare-fun Unit!37561 () Unit!37558)

(assert (=> b!1146028 (= e!652005 Unit!37561)))

(assert (=> b!1146028 (= lt!511323 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113157 () Bool)

(assert (=> b!1146028 (= c!113157 (and (not lt!511323) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511342 () Unit!37558)

(assert (=> b!1146028 (= lt!511342 e!652007)))

(declare-fun lt!511339 () Unit!37558)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!415 (array!74383 array!74381 (_ BitVec 32) (_ BitVec 32) V!43449 V!43449 (_ BitVec 64) (_ BitVec 32) Int) Unit!37558)

(assert (=> b!1146028 (= lt!511339 (lemmaListMapContainsThenArrayContainsFrom!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113159 () Bool)

(assert (=> b!1146028 (= c!113159 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762923 () Bool)

(assert (=> b!1146028 (= res!762923 e!652008)))

(assert (=> b!1146028 (=> (not res!762923) (not e!651996))))

(assert (=> b!1146028 e!651996))

(declare-fun lt!511326 () Unit!37558)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74383 (_ BitVec 32) (_ BitVec 32)) Unit!37558)

(assert (=> b!1146028 (= lt!511326 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146028 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25042)))

(declare-fun lt!511340 () Unit!37558)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74383 (_ BitVec 64) (_ BitVec 32) List!25045) Unit!37558)

(assert (=> b!1146028 (= lt!511340 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25042))))

(assert (=> b!1146028 false))

(declare-fun bm!52140 () Bool)

(assert (=> bm!52140 (= call!52140 (addStillContains!817 (ite c!113157 lt!511341 lt!511336) (ite c!113157 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113160 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113157 minValue!944 (ite c!113160 zeroValue!944 minValue!944)) k0!934))))

(declare-fun res!762929 () Bool)

(assert (=> start!98842 (=> (not res!762929) (not e!652000))))

(assert (=> start!98842 (= res!762929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36373 _keys!1208))))))

(assert (=> start!98842 e!652000))

(assert (=> start!98842 tp_is_empty!28741))

(declare-fun array_inv!27504 (array!74383) Bool)

(assert (=> start!98842 (array_inv!27504 _keys!1208)))

(assert (=> start!98842 true))

(assert (=> start!98842 tp!85344))

(declare-fun e!652009 () Bool)

(declare-fun array_inv!27505 (array!74381) Bool)

(assert (=> start!98842 (and (array_inv!27505 _values!996) e!652009)))

(declare-fun b!1146029 () Bool)

(declare-fun res!762922 () Bool)

(assert (=> b!1146029 (=> (not res!762922) (not e!652000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146029 (= res!762922 (validMask!0 mask!1564))))

(declare-fun b!1146030 () Bool)

(assert (=> b!1146030 (= e!652010 (= call!52146 call!52139))))

(declare-fun bm!52141 () Bool)

(assert (=> bm!52141 (= call!52143 (contains!6690 (ite c!113157 lt!511341 call!52144) k0!934))))

(declare-fun b!1146031 () Bool)

(assert (=> b!1146031 call!52141))

(declare-fun lt!511329 () Unit!37558)

(assert (=> b!1146031 (= lt!511329 call!52145)))

(assert (=> b!1146031 (= e!651998 lt!511329)))

(declare-fun b!1146032 () Bool)

(declare-fun res!762926 () Bool)

(assert (=> b!1146032 (=> (not res!762926) (not e!652011))))

(assert (=> b!1146032 (= res!762926 (arrayNoDuplicates!0 lt!511325 #b00000000000000000000000000000000 Nil!25042))))

(declare-fun b!1146033 () Bool)

(declare-fun Unit!37562 () Unit!37558)

(assert (=> b!1146033 (= e!651998 Unit!37562)))

(declare-fun b!1146034 () Bool)

(assert (=> b!1146034 (= e!652009 (and e!652004 mapRes!44936))))

(declare-fun condMapEmpty!44936 () Bool)

(declare-fun mapDefault!44936 () ValueCell!13661)

(assert (=> b!1146034 (= condMapEmpty!44936 (= (arr!35835 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13661)) mapDefault!44936)))))

(declare-fun bm!52142 () Bool)

(assert (=> bm!52142 (= call!52142 (+!3591 lt!511336 (ite (or c!113157 c!113160) (tuple2!18289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146035 () Bool)

(declare-fun res!762936 () Bool)

(assert (=> b!1146035 (=> (not res!762936) (not e!652000))))

(assert (=> b!1146035 (= res!762936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52143 () Bool)

(assert (=> bm!52143 (= call!52145 call!52140)))

(declare-fun b!1146036 () Bool)

(declare-fun res!762933 () Bool)

(assert (=> b!1146036 (=> (not res!762933) (not e!652000))))

(assert (=> b!1146036 (= res!762933 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36373 _keys!1208))))))

(assert (= (and start!98842 res!762929) b!1146029))

(assert (= (and b!1146029 res!762922) b!1146024))

(assert (= (and b!1146024 res!762925) b!1146035))

(assert (= (and b!1146035 res!762936) b!1146019))

(assert (= (and b!1146019 res!762924) b!1146036))

(assert (= (and b!1146036 res!762933) b!1146016))

(assert (= (and b!1146016 res!762932) b!1146012))

(assert (= (and b!1146012 res!762934) b!1146018))

(assert (= (and b!1146018 res!762931) b!1146032))

(assert (= (and b!1146032 res!762926) b!1146008))

(assert (= (and b!1146008 (not res!762927)) b!1146026))

(assert (= (and b!1146026 (not res!762928)) b!1146025))

(assert (= (and b!1146025 c!113158) b!1146007))

(assert (= (and b!1146025 (not c!113158)) b!1146030))

(assert (= (or b!1146007 b!1146030) bm!52136))

(assert (= (or b!1146007 b!1146030) bm!52138))

(assert (= (and b!1146025 (not res!762935)) b!1146020))

(assert (= (and b!1146020 c!113155) b!1146028))

(assert (= (and b!1146020 (not c!113155)) b!1146021))

(assert (= (and b!1146028 c!113157) b!1146014))

(assert (= (and b!1146028 (not c!113157)) b!1146009))

(assert (= (and b!1146009 c!113160) b!1146022))

(assert (= (and b!1146009 (not c!113160)) b!1146011))

(assert (= (and b!1146011 c!113156) b!1146031))

(assert (= (and b!1146011 (not c!113156)) b!1146033))

(assert (= (or b!1146022 b!1146031) bm!52143))

(assert (= (or b!1146022 b!1146031) bm!52139))

(assert (= (or b!1146022 b!1146031) bm!52137))

(assert (= (or b!1146014 bm!52137) bm!52141))

(assert (= (or b!1146014 bm!52143) bm!52140))

(assert (= (or b!1146014 bm!52139) bm!52142))

(assert (= (and b!1146028 c!113159) b!1146017))

(assert (= (and b!1146028 (not c!113159)) b!1146010))

(assert (= (and b!1146028 res!762923) b!1146027))

(assert (= (and b!1146020 res!762930) b!1146023))

(assert (= (and b!1146034 condMapEmpty!44936) mapIsEmpty!44936))

(assert (= (and b!1146034 (not condMapEmpty!44936)) mapNonEmpty!44936))

(get-info :version)

(assert (= (and mapNonEmpty!44936 ((_ is ValueCellFull!13661) mapValue!44936)) b!1146015))

(assert (= (and b!1146034 ((_ is ValueCellFull!13661) mapDefault!44936)) b!1146013))

(assert (= start!98842 b!1146034))

(declare-fun b_lambda!19311 () Bool)

(assert (=> (not b_lambda!19311) (not b!1146026)))

(declare-fun t!36238 () Bool)

(declare-fun tb!9015 () Bool)

(assert (=> (and start!98842 (= defaultEntry!1004 defaultEntry!1004) t!36238) tb!9015))

(declare-fun result!18603 () Bool)

(assert (=> tb!9015 (= result!18603 tp_is_empty!28741)))

(assert (=> b!1146026 t!36238))

(declare-fun b_and!39275 () Bool)

(assert (= b_and!39273 (and (=> t!36238 result!18603) b_and!39275)))

(declare-fun m!1057271 () Bool)

(assert (=> b!1146014 m!1057271))

(assert (=> b!1146014 m!1057271))

(declare-fun m!1057273 () Bool)

(assert (=> b!1146014 m!1057273))

(declare-fun m!1057275 () Bool)

(assert (=> b!1146014 m!1057275))

(declare-fun m!1057277 () Bool)

(assert (=> bm!52141 m!1057277))

(declare-fun m!1057279 () Bool)

(assert (=> bm!52142 m!1057279))

(declare-fun m!1057281 () Bool)

(assert (=> b!1146019 m!1057281))

(declare-fun m!1057283 () Bool)

(assert (=> b!1146025 m!1057283))

(declare-fun m!1057285 () Bool)

(assert (=> b!1146025 m!1057285))

(declare-fun m!1057287 () Bool)

(assert (=> b!1146026 m!1057287))

(declare-fun m!1057289 () Bool)

(assert (=> b!1146026 m!1057289))

(declare-fun m!1057291 () Bool)

(assert (=> b!1146026 m!1057291))

(declare-fun m!1057293 () Bool)

(assert (=> b!1146026 m!1057293))

(declare-fun m!1057295 () Bool)

(assert (=> b!1146018 m!1057295))

(declare-fun m!1057297 () Bool)

(assert (=> b!1146018 m!1057297))

(declare-fun m!1057299 () Bool)

(assert (=> bm!52136 m!1057299))

(declare-fun m!1057301 () Bool)

(assert (=> b!1146032 m!1057301))

(declare-fun m!1057303 () Bool)

(assert (=> b!1146035 m!1057303))

(declare-fun m!1057305 () Bool)

(assert (=> bm!52140 m!1057305))

(declare-fun m!1057307 () Bool)

(assert (=> b!1146008 m!1057307))

(declare-fun m!1057309 () Bool)

(assert (=> b!1146008 m!1057309))

(declare-fun m!1057311 () Bool)

(assert (=> mapNonEmpty!44936 m!1057311))

(declare-fun m!1057313 () Bool)

(assert (=> b!1146023 m!1057313))

(declare-fun m!1057315 () Bool)

(assert (=> b!1146029 m!1057315))

(declare-fun m!1057317 () Bool)

(assert (=> b!1146027 m!1057317))

(declare-fun m!1057319 () Bool)

(assert (=> b!1146012 m!1057319))

(declare-fun m!1057321 () Bool)

(assert (=> b!1146007 m!1057321))

(declare-fun m!1057323 () Bool)

(assert (=> b!1146016 m!1057323))

(assert (=> b!1146017 m!1057317))

(declare-fun m!1057325 () Bool)

(assert (=> start!98842 m!1057325))

(declare-fun m!1057327 () Bool)

(assert (=> start!98842 m!1057327))

(declare-fun m!1057329 () Bool)

(assert (=> b!1146020 m!1057329))

(declare-fun m!1057331 () Bool)

(assert (=> b!1146020 m!1057331))

(assert (=> b!1146020 m!1057331))

(declare-fun m!1057333 () Bool)

(assert (=> b!1146020 m!1057333))

(assert (=> b!1146020 m!1057283))

(declare-fun m!1057335 () Bool)

(assert (=> b!1146020 m!1057335))

(declare-fun m!1057337 () Bool)

(assert (=> b!1146020 m!1057337))

(assert (=> b!1146020 m!1057283))

(declare-fun m!1057339 () Bool)

(assert (=> b!1146020 m!1057339))

(assert (=> b!1146020 m!1057337))

(assert (=> b!1146020 m!1057283))

(declare-fun m!1057341 () Bool)

(assert (=> b!1146020 m!1057341))

(assert (=> bm!52138 m!1057329))

(declare-fun m!1057343 () Bool)

(assert (=> b!1146028 m!1057343))

(declare-fun m!1057345 () Bool)

(assert (=> b!1146028 m!1057345))

(declare-fun m!1057347 () Bool)

(assert (=> b!1146028 m!1057347))

(declare-fun m!1057349 () Bool)

(assert (=> b!1146028 m!1057349))

(check-sat tp_is_empty!28741 (not b!1146032) (not bm!52140) (not b!1146018) (not b_next!24211) (not bm!52138) (not start!98842) (not b_lambda!19311) (not b!1146027) (not b!1146025) (not bm!52142) (not b!1146016) (not b!1146026) (not b!1146020) (not b!1146019) (not b!1146017) (not bm!52136) (not bm!52141) (not mapNonEmpty!44936) (not b!1146023) (not b!1146028) (not b!1146007) b_and!39275 (not b!1146014) (not b!1146035) (not b!1146008) (not b!1146029))
(check-sat b_and!39275 (not b_next!24211))
