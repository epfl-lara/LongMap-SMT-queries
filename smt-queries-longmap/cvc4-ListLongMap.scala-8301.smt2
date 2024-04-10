; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101158 () Bool)

(assert start!101158)

(declare-fun b_free!26081 () Bool)

(declare-fun b_next!26081 () Bool)

(assert (=> start!101158 (= b_free!26081 (not b_next!26081))))

(declare-fun tp!91264 () Bool)

(declare-fun b_and!43279 () Bool)

(assert (=> start!101158 (= tp!91264 b_and!43279)))

(declare-fun b!1213752 () Bool)

(declare-fun e!689304 () Bool)

(declare-fun tp_is_empty!30785 () Bool)

(assert (=> b!1213752 (= e!689304 tp_is_empty!30785)))

(declare-fun b!1213753 () Bool)

(declare-fun e!689305 () Bool)

(declare-fun e!689293 () Bool)

(assert (=> b!1213753 (= e!689305 (not e!689293))))

(declare-fun res!805901 () Bool)

(assert (=> b!1213753 (=> res!805901 e!689293)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213753 (= res!805901 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78357 0))(
  ( (array!78358 (arr!37813 (Array (_ BitVec 32) (_ BitVec 64))) (size!38349 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78357)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213753 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40250 0))(
  ( (Unit!40251) )
))
(declare-fun lt!551911 () Unit!40250)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78357 (_ BitVec 64) (_ BitVec 32)) Unit!40250)

(assert (=> b!1213753 (= lt!551911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((V!46173 0))(
  ( (V!46174 (val!15449 Int)) )
))
(declare-fun zeroValue!944 () V!46173)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14683 0))(
  ( (ValueCellFull!14683 (v!18102 V!46173)) (EmptyCell!14683) )
))
(declare-datatypes ((array!78359 0))(
  ( (array!78360 (arr!37814 (Array (_ BitVec 32) ValueCell!14683)) (size!38350 (_ BitVec 32))) )
))
(declare-fun lt!551900 () array!78359)

(declare-fun lt!551897 () array!78357)

(declare-fun minValue!944 () V!46173)

(declare-datatypes ((tuple2!19858 0))(
  ( (tuple2!19859 (_1!9940 (_ BitVec 64)) (_2!9940 V!46173)) )
))
(declare-datatypes ((List!26657 0))(
  ( (Nil!26654) (Cons!26653 (h!27862 tuple2!19858) (t!39718 List!26657)) )
))
(declare-datatypes ((ListLongMap!17827 0))(
  ( (ListLongMap!17828 (toList!8929 List!26657)) )
))
(declare-fun call!60455 () ListLongMap!17827)

(declare-fun bm!60452 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5357 (array!78357 array!78359 (_ BitVec 32) (_ BitVec 32) V!46173 V!46173 (_ BitVec 32) Int) ListLongMap!17827)

(assert (=> bm!60452 (= call!60455 (getCurrentListMapNoExtraKeys!5357 lt!551897 lt!551900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60462 () ListLongMap!17827)

(declare-fun e!689306 () Bool)

(declare-fun b!1213754 () Bool)

(declare-fun -!1875 (ListLongMap!17827 (_ BitVec 64)) ListLongMap!17827)

(assert (=> b!1213754 (= e!689306 (= call!60455 (-!1875 call!60462 k!934)))))

(declare-fun b!1213755 () Bool)

(declare-fun res!805899 () Bool)

(assert (=> b!1213755 (=> (not res!805899) (not e!689305))))

(declare-datatypes ((List!26658 0))(
  ( (Nil!26655) (Cons!26654 (h!27863 (_ BitVec 64)) (t!39719 List!26658)) )
))
(declare-fun arrayNoDuplicates!0 (array!78357 (_ BitVec 32) List!26658) Bool)

(assert (=> b!1213755 (= res!805899 (arrayNoDuplicates!0 lt!551897 #b00000000000000000000000000000000 Nil!26655))))

(declare-fun b!1213756 () Bool)

(declare-fun res!805890 () Bool)

(declare-fun e!689296 () Bool)

(assert (=> b!1213756 (=> (not res!805890) (not e!689296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213756 (= res!805890 (validMask!0 mask!1564))))

(declare-fun bm!60453 () Bool)

(declare-fun call!60456 () Unit!40250)

(declare-fun call!60458 () Unit!40250)

(assert (=> bm!60453 (= call!60456 call!60458)))

(declare-fun b!1213757 () Bool)

(declare-fun e!689298 () Bool)

(declare-fun lt!551915 () ListLongMap!17827)

(assert (=> b!1213757 (= e!689298 (= lt!551915 (getCurrentListMapNoExtraKeys!5357 lt!551897 lt!551900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213758 () Bool)

(assert (=> b!1213758 (= e!689306 (= call!60455 call!60462))))

(declare-fun b!1213759 () Bool)

(declare-fun e!689302 () Bool)

(declare-fun e!689307 () Bool)

(assert (=> b!1213759 (= e!689302 e!689307)))

(declare-fun res!805891 () Bool)

(assert (=> b!1213759 (=> res!805891 e!689307)))

(assert (=> b!1213759 (= res!805891 (not (= (select (arr!37813 _keys!1208) from!1455) k!934)))))

(assert (=> b!1213759 e!689306))

(declare-fun c!119935 () Bool)

(assert (=> b!1213759 (= c!119935 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551908 () Unit!40250)

(declare-fun _values!996 () array!78359)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1082 (array!78357 array!78359 (_ BitVec 32) (_ BitVec 32) V!46173 V!46173 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40250)

(assert (=> b!1213759 (= lt!551908 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1082 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213760 () Bool)

(declare-fun res!805902 () Bool)

(assert (=> b!1213760 (=> (not res!805902) (not e!689296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213760 (= res!805902 (validKeyInArray!0 k!934))))

(declare-fun b!1213761 () Bool)

(declare-fun e!689295 () Unit!40250)

(declare-fun lt!551913 () Unit!40250)

(assert (=> b!1213761 (= e!689295 lt!551913)))

(assert (=> b!1213761 (= lt!551913 call!60456)))

(declare-fun call!60457 () Bool)

(assert (=> b!1213761 call!60457))

(declare-fun lt!551903 () ListLongMap!17827)

(declare-fun call!60461 () Bool)

(declare-fun bm!60454 () Bool)

(declare-fun call!60459 () ListLongMap!17827)

(declare-fun c!119937 () Bool)

(declare-fun contains!6999 (ListLongMap!17827 (_ BitVec 64)) Bool)

(assert (=> bm!60454 (= call!60461 (contains!6999 (ite c!119937 lt!551903 call!60459) k!934))))

(declare-fun mapNonEmpty!48052 () Bool)

(declare-fun mapRes!48052 () Bool)

(declare-fun tp!91265 () Bool)

(assert (=> mapNonEmpty!48052 (= mapRes!48052 (and tp!91265 e!689304))))

(declare-fun mapValue!48052 () ValueCell!14683)

(declare-fun mapRest!48052 () (Array (_ BitVec 32) ValueCell!14683))

(declare-fun mapKey!48052 () (_ BitVec 32))

(assert (=> mapNonEmpty!48052 (= (arr!37814 _values!996) (store mapRest!48052 mapKey!48052 mapValue!48052))))

(declare-fun b!1213762 () Bool)

(declare-fun res!805898 () Bool)

(assert (=> b!1213762 (=> (not res!805898) (not e!689296))))

(assert (=> b!1213762 (= res!805898 (and (= (size!38350 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38349 _keys!1208) (size!38350 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213763 () Bool)

(declare-fun e!689297 () Unit!40250)

(declare-fun Unit!40252 () Unit!40250)

(assert (=> b!1213763 (= e!689297 Unit!40252)))

(declare-fun b!1213764 () Bool)

(declare-fun c!119940 () Bool)

(declare-fun lt!551914 () Bool)

(assert (=> b!1213764 (= c!119940 (and (not lt!551914) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689294 () Unit!40250)

(assert (=> b!1213764 (= e!689294 e!689295)))

(declare-fun bm!60455 () Bool)

(assert (=> bm!60455 (= call!60462 (getCurrentListMapNoExtraKeys!5357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60456 () Bool)

(declare-fun call!60460 () ListLongMap!17827)

(assert (=> bm!60456 (= call!60459 call!60460)))

(declare-fun b!1213765 () Bool)

(declare-fun e!689308 () Bool)

(assert (=> b!1213765 (= e!689308 tp_is_empty!30785)))

(declare-fun b!1213766 () Bool)

(declare-fun e!689300 () Bool)

(assert (=> b!1213766 (= e!689300 (and e!689308 mapRes!48052))))

(declare-fun condMapEmpty!48052 () Bool)

(declare-fun mapDefault!48052 () ValueCell!14683)

