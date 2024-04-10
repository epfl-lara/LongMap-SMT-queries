; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98850 () Bool)

(assert start!98850)

(declare-fun b_free!24455 () Bool)

(declare-fun b_next!24455 () Bool)

(assert (=> start!98850 (= b_free!24455 (not b_next!24455))))

(declare-fun tp!86076 () Bool)

(declare-fun b_and!39759 () Bool)

(assert (=> start!98850 (= tp!86076 b_and!39759)))

(declare-fun b!1155942 () Bool)

(declare-datatypes ((Unit!38072 0))(
  ( (Unit!38073) )
))
(declare-fun e!657402 () Unit!38072)

(declare-fun Unit!38074 () Unit!38072)

(assert (=> b!1155942 (= e!657402 Unit!38074)))

(declare-fun lt!518769 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155942 (= lt!518769 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114955 () Bool)

(assert (=> b!1155942 (= c!114955 (and (not lt!518769) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518763 () Unit!38072)

(declare-fun e!657394 () Unit!38072)

(assert (=> b!1155942 (= lt!518763 e!657394)))

(declare-datatypes ((V!43773 0))(
  ( (V!43774 (val!14549 Int)) )
))
(declare-fun zeroValue!944 () V!43773)

(declare-datatypes ((array!74817 0))(
  ( (array!74818 (arr!36059 (Array (_ BitVec 32) (_ BitVec 64))) (size!36595 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!518753 () Unit!38072)

(declare-datatypes ((ValueCell!13783 0))(
  ( (ValueCellFull!13783 (v!17186 V!43773)) (EmptyCell!13783) )
))
(declare-datatypes ((array!74819 0))(
  ( (array!74820 (arr!36060 (Array (_ BitVec 32) ValueCell!13783)) (size!36596 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74819)

(declare-fun minValue!944 () V!43773)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!498 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43773 V!43773 (_ BitVec 64) (_ BitVec 32) Int) Unit!38072)

(assert (=> b!1155942 (= lt!518753 (lemmaListMapContainsThenArrayContainsFrom!498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114954 () Bool)

(assert (=> b!1155942 (= c!114954 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767904 () Bool)

(declare-fun e!657391 () Bool)

(assert (=> b!1155942 (= res!767904 e!657391)))

(declare-fun e!657392 () Bool)

(assert (=> b!1155942 (=> (not res!767904) (not e!657392))))

(assert (=> b!1155942 e!657392))

(declare-fun lt!518765 () Unit!38072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74817 (_ BitVec 32) (_ BitVec 32)) Unit!38072)

(assert (=> b!1155942 (= lt!518765 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25249 0))(
  ( (Nil!25246) (Cons!25245 (h!26454 (_ BitVec 64)) (t!36696 List!25249)) )
))
(declare-fun arrayNoDuplicates!0 (array!74817 (_ BitVec 32) List!25249) Bool)

(assert (=> b!1155942 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25246)))

(declare-fun lt!518749 () Unit!38072)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74817 (_ BitVec 64) (_ BitVec 32) List!25249) Unit!38072)

(assert (=> b!1155942 (= lt!518749 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25246))))

(assert (=> b!1155942 false))

(declare-datatypes ((tuple2!18506 0))(
  ( (tuple2!18507 (_1!9264 (_ BitVec 64)) (_2!9264 V!43773)) )
))
(declare-datatypes ((List!25250 0))(
  ( (Nil!25247) (Cons!25246 (h!26455 tuple2!18506) (t!36697 List!25250)) )
))
(declare-datatypes ((ListLongMap!16475 0))(
  ( (ListLongMap!16476 (toList!8253 List!25250)) )
))
(declare-fun call!55007 () ListLongMap!16475)

(declare-fun call!55006 () ListLongMap!16475)

(declare-fun b!1155943 () Bool)

(declare-fun e!657395 () Bool)

(declare-fun -!1371 (ListLongMap!16475 (_ BitVec 64)) ListLongMap!16475)

(assert (=> b!1155943 (= e!657395 (= call!55006 (-!1371 call!55007 k!934)))))

(declare-fun b!1155944 () Bool)

(assert (=> b!1155944 (= e!657395 (= call!55006 call!55007))))

(declare-fun b!1155945 () Bool)

(assert (=> b!1155945 (= e!657391 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518769) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54999 () Bool)

(declare-fun lt!518752 () array!74819)

(declare-fun lt!518759 () array!74817)

(declare-fun getCurrentListMapNoExtraKeys!4722 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43773 V!43773 (_ BitVec 32) Int) ListLongMap!16475)

(assert (=> bm!54999 (= call!55006 (getCurrentListMapNoExtraKeys!4722 lt!518759 lt!518752 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155946 () Bool)

(declare-fun res!767917 () Bool)

(declare-fun e!657396 () Bool)

(assert (=> b!1155946 (=> (not res!767917) (not e!657396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155946 (= res!767917 (validKeyInArray!0 k!934))))

(declare-fun call!55003 () Unit!38072)

(declare-fun c!114956 () Bool)

(declare-fun lt!518750 () ListLongMap!16475)

(declare-fun lt!518762 () ListLongMap!16475)

(declare-fun bm!55000 () Bool)

(declare-fun addStillContains!909 (ListLongMap!16475 (_ BitVec 64) V!43773 (_ BitVec 64)) Unit!38072)

(assert (=> bm!55000 (= call!55003 (addStillContains!909 (ite c!114955 lt!518750 lt!518762) (ite c!114955 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114956 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114955 minValue!944 (ite c!114956 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1155947 () Bool)

(declare-fun Unit!38075 () Unit!38072)

(assert (=> b!1155947 (= e!657402 Unit!38075)))

(declare-fun b!1155948 () Bool)

(declare-fun res!767907 () Bool)

(assert (=> b!1155948 (=> (not res!767907) (not e!657396))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155948 (= res!767907 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36595 _keys!1208))))))

(declare-fun b!1155949 () Bool)

(declare-fun e!657393 () Unit!38072)

(declare-fun lt!518756 () Unit!38072)

(assert (=> b!1155949 (= e!657393 lt!518756)))

(declare-fun call!55009 () Unit!38072)

(assert (=> b!1155949 (= lt!518756 call!55009)))

(declare-fun call!55004 () Bool)

(assert (=> b!1155949 call!55004))

(declare-fun bm!55001 () Bool)

(assert (=> bm!55001 (= call!55007 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155950 () Bool)

(declare-fun res!767916 () Bool)

(assert (=> b!1155950 (=> (not res!767916) (not e!657396))))

(assert (=> b!1155950 (= res!767916 (= (select (arr!36059 _keys!1208) i!673) k!934))))

(declare-fun e!657387 () Bool)

(declare-fun b!1155951 () Bool)

(declare-fun lt!518766 () ListLongMap!16475)

(assert (=> b!1155951 (= e!657387 (= lt!518766 (getCurrentListMapNoExtraKeys!4722 lt!518759 lt!518752 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!55008 () ListLongMap!16475)

(declare-fun bm!55002 () Bool)

(declare-fun +!3666 (ListLongMap!16475 tuple2!18506) ListLongMap!16475)

(assert (=> bm!55002 (= call!55008 (+!3666 (ite c!114955 lt!518750 lt!518762) (ite c!114955 (tuple2!18507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114956 (tuple2!18507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155952 () Bool)

(declare-fun res!767910 () Bool)

(declare-fun e!657398 () Bool)

(assert (=> b!1155952 (=> (not res!767910) (not e!657398))))

(assert (=> b!1155952 (= res!767910 (arrayNoDuplicates!0 lt!518759 #b00000000000000000000000000000000 Nil!25246))))

(declare-fun b!1155953 () Bool)

(declare-fun res!767908 () Bool)

(assert (=> b!1155953 (=> (not res!767908) (not e!657396))))

(assert (=> b!1155953 (= res!767908 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25246))))

(declare-fun b!1155954 () Bool)

(assert (=> b!1155954 call!55004))

(declare-fun lt!518755 () Unit!38072)

(assert (=> b!1155954 (= lt!518755 call!55009)))

(declare-fun e!657401 () Unit!38072)

(assert (=> b!1155954 (= e!657401 lt!518755)))

(declare-fun bm!55003 () Bool)

(assert (=> bm!55003 (= call!55009 call!55003)))

(declare-fun b!1155955 () Bool)

(declare-fun arrayContainsKey!0 (array!74817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155955 (= e!657391 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155956 () Bool)

(declare-fun e!657386 () Bool)

(declare-fun tp_is_empty!28985 () Bool)

(assert (=> b!1155956 (= e!657386 tp_is_empty!28985)))

(declare-fun bm!55004 () Bool)

(declare-fun call!55002 () Bool)

(declare-fun call!55005 () ListLongMap!16475)

(declare-fun contains!6765 (ListLongMap!16475 (_ BitVec 64)) Bool)

(assert (=> bm!55004 (= call!55002 (contains!6765 (ite c!114955 lt!518750 call!55005) k!934))))

(declare-fun b!1155957 () Bool)

(declare-fun e!657389 () Bool)

(assert (=> b!1155957 (= e!657389 tp_is_empty!28985)))

(declare-fun b!1155958 () Bool)

(declare-fun e!657390 () Bool)

(declare-fun e!657399 () Bool)

(assert (=> b!1155958 (= e!657390 e!657399)))

(declare-fun res!767909 () Bool)

(assert (=> b!1155958 (=> res!767909 e!657399)))

(assert (=> b!1155958 (= res!767909 (not (= from!1455 i!673)))))

(declare-fun lt!518748 () ListLongMap!16475)

(assert (=> b!1155958 (= lt!518748 (getCurrentListMapNoExtraKeys!4722 lt!518759 lt!518752 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518758 () V!43773)

(assert (=> b!1155958 (= lt!518752 (array!74820 (store (arr!36060 _values!996) i!673 (ValueCellFull!13783 lt!518758)) (size!36596 _values!996)))))

(declare-fun dynLambda!2730 (Int (_ BitVec 64)) V!43773)

(assert (=> b!1155958 (= lt!518758 (dynLambda!2730 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518754 () ListLongMap!16475)

(assert (=> b!1155958 (= lt!518754 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155959 () Bool)

(assert (=> b!1155959 (= e!657396 e!657398)))

(declare-fun res!767906 () Bool)

(assert (=> b!1155959 (=> (not res!767906) (not e!657398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74817 (_ BitVec 32)) Bool)

(assert (=> b!1155959 (= res!767906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518759 mask!1564))))

(assert (=> b!1155959 (= lt!518759 (array!74818 (store (arr!36059 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36595 _keys!1208)))))

(declare-fun b!1155960 () Bool)

(assert (=> b!1155960 (contains!6765 call!55008 k!934)))

(declare-fun lt!518757 () Unit!38072)

(assert (=> b!1155960 (= lt!518757 call!55003)))

(assert (=> b!1155960 call!55002))

(assert (=> b!1155960 (= lt!518750 (+!3666 lt!518762 (tuple2!18507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518760 () Unit!38072)

(assert (=> b!1155960 (= lt!518760 (addStillContains!909 lt!518762 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1155960 (= e!657394 lt!518757)))

(declare-fun b!1155961 () Bool)

(declare-fun res!767918 () Bool)

(assert (=> b!1155961 (=> (not res!767918) (not e!657396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155961 (= res!767918 (validMask!0 mask!1564))))

(declare-fun bm!55005 () Bool)

(assert (=> bm!55005 (= call!55004 call!55002)))

(declare-fun mapNonEmpty!45302 () Bool)

(declare-fun mapRes!45302 () Bool)

(declare-fun tp!86075 () Bool)

(assert (=> mapNonEmpty!45302 (= mapRes!45302 (and tp!86075 e!657386))))

(declare-fun mapValue!45302 () ValueCell!13783)

(declare-fun mapKey!45302 () (_ BitVec 32))

(declare-fun mapRest!45302 () (Array (_ BitVec 32) ValueCell!13783))

(assert (=> mapNonEmpty!45302 (= (arr!36060 _values!996) (store mapRest!45302 mapKey!45302 mapValue!45302))))

(declare-fun b!1155962 () Bool)

(declare-fun res!767912 () Bool)

(assert (=> b!1155962 (=> (not res!767912) (not e!657396))))

(assert (=> b!1155962 (= res!767912 (and (= (size!36596 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36595 _keys!1208) (size!36596 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55006 () Bool)

(assert (=> bm!55006 (= call!55005 call!55008)))

(declare-fun b!1155963 () Bool)

(declare-fun res!767914 () Bool)

(assert (=> b!1155963 (=> (not res!767914) (not e!657396))))

(assert (=> b!1155963 (= res!767914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155964 () Bool)

(assert (=> b!1155964 (= e!657398 (not e!657390))))

(declare-fun res!767913 () Bool)

(assert (=> b!1155964 (=> res!767913 e!657390)))

(assert (=> b!1155964 (= res!767913 (bvsgt from!1455 i!673))))

(assert (=> b!1155964 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!518751 () Unit!38072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74817 (_ BitVec 64) (_ BitVec 32)) Unit!38072)

(assert (=> b!1155964 (= lt!518751 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1155965 () Bool)

(declare-fun e!657400 () Bool)

(assert (=> b!1155965 (= e!657399 e!657400)))

(declare-fun res!767915 () Bool)

(assert (=> b!1155965 (=> res!767915 e!657400)))

(assert (=> b!1155965 (= res!767915 (not (= (select (arr!36059 _keys!1208) from!1455) k!934)))))

(assert (=> b!1155965 e!657395))

(declare-fun c!114953 () Bool)

(assert (=> b!1155965 (= c!114953 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518768 () Unit!38072)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!603 (array!74817 array!74819 (_ BitVec 32) (_ BitVec 32) V!43773 V!43773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38072)

(assert (=> b!1155965 (= lt!518768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!603 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155966 () Bool)

(declare-fun Unit!38076 () Unit!38072)

(assert (=> b!1155966 (= e!657401 Unit!38076)))

(declare-fun b!1155967 () Bool)

(assert (=> b!1155967 (= c!114956 (and (not lt!518769) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155967 (= e!657394 e!657393)))

(declare-fun b!1155968 () Bool)

(assert (=> b!1155968 (= e!657393 e!657401)))

(declare-fun c!114958 () Bool)

(assert (=> b!1155968 (= c!114958 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518769))))

(declare-fun mapIsEmpty!45302 () Bool)

(assert (=> mapIsEmpty!45302 mapRes!45302))

(declare-fun b!1155969 () Bool)

(assert (=> b!1155969 (= e!657400 true)))

(assert (=> b!1155969 e!657387))

(declare-fun res!767911 () Bool)

(assert (=> b!1155969 (=> (not res!767911) (not e!657387))))

(assert (=> b!1155969 (= res!767911 (= lt!518766 lt!518762))))

(assert (=> b!1155969 (= lt!518766 (-!1371 lt!518754 k!934))))

(declare-fun lt!518761 () V!43773)

(assert (=> b!1155969 (= (-!1371 (+!3666 lt!518762 (tuple2!18507 (select (arr!36059 _keys!1208) from!1455) lt!518761)) (select (arr!36059 _keys!1208) from!1455)) lt!518762)))

(declare-fun lt!518764 () Unit!38072)

(declare-fun addThenRemoveForNewKeyIsSame!210 (ListLongMap!16475 (_ BitVec 64) V!43773) Unit!38072)

(assert (=> b!1155969 (= lt!518764 (addThenRemoveForNewKeyIsSame!210 lt!518762 (select (arr!36059 _keys!1208) from!1455) lt!518761))))

(declare-fun get!18374 (ValueCell!13783 V!43773) V!43773)

(assert (=> b!1155969 (= lt!518761 (get!18374 (select (arr!36060 _values!996) from!1455) lt!518758))))

(declare-fun lt!518767 () Unit!38072)

(assert (=> b!1155969 (= lt!518767 e!657402)))

(declare-fun c!114957 () Bool)

(assert (=> b!1155969 (= c!114957 (contains!6765 lt!518762 k!934))))

(assert (=> b!1155969 (= lt!518762 (getCurrentListMapNoExtraKeys!4722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!767905 () Bool)

(assert (=> start!98850 (=> (not res!767905) (not e!657396))))

(assert (=> start!98850 (= res!767905 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36595 _keys!1208))))))

(assert (=> start!98850 e!657396))

(assert (=> start!98850 tp_is_empty!28985))

(declare-fun array_inv!27598 (array!74817) Bool)

(assert (=> start!98850 (array_inv!27598 _keys!1208)))

(assert (=> start!98850 true))

(assert (=> start!98850 tp!86076))

(declare-fun e!657388 () Bool)

(declare-fun array_inv!27599 (array!74819) Bool)

(assert (=> start!98850 (and (array_inv!27599 _values!996) e!657388)))

(declare-fun b!1155970 () Bool)

(assert (=> b!1155970 (= e!657388 (and e!657389 mapRes!45302))))

(declare-fun condMapEmpty!45302 () Bool)

(declare-fun mapDefault!45302 () ValueCell!13783)

