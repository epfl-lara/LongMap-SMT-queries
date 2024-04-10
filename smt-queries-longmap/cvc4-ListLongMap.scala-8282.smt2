; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100828 () Bool)

(assert start!100828)

(declare-fun b_free!25967 () Bool)

(declare-fun b_next!25967 () Bool)

(assert (=> start!100828 (= b_free!25967 (not b_next!25967))))

(declare-fun tp!90906 () Bool)

(declare-fun b_and!42935 () Bool)

(assert (=> start!100828 (= tp!90906 b_and!42935)))

(declare-fun b!1207323 () Bool)

(declare-fun c!118627 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!547784 () Bool)

(assert (=> b!1207323 (= c!118627 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547784))))

(declare-datatypes ((Unit!40018 0))(
  ( (Unit!40019) )
))
(declare-fun e!685633 () Unit!40018)

(declare-fun e!685626 () Unit!40018)

(assert (=> b!1207323 (= e!685633 e!685626)))

(declare-fun b!1207324 () Bool)

(declare-fun e!685623 () Bool)

(declare-fun e!685635 () Bool)

(assert (=> b!1207324 (= e!685623 (not e!685635))))

(declare-fun res!802764 () Bool)

(assert (=> b!1207324 (=> res!802764 e!685635)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207324 (= res!802764 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78123 0))(
  ( (array!78124 (arr!37701 (Array (_ BitVec 32) (_ BitVec 64))) (size!38237 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78123)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207324 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!547794 () Unit!40018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78123 (_ BitVec 64) (_ BitVec 32)) Unit!40018)

(assert (=> b!1207324 (= lt!547794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!802769 () Bool)

(declare-fun e!685630 () Bool)

(assert (=> start!100828 (=> (not res!802769) (not e!685630))))

(assert (=> start!100828 (= res!802769 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38237 _keys!1208))))))

(assert (=> start!100828 e!685630))

(declare-fun tp_is_empty!30671 () Bool)

(assert (=> start!100828 tp_is_empty!30671))

(declare-fun array_inv!28716 (array!78123) Bool)

(assert (=> start!100828 (array_inv!28716 _keys!1208)))

(assert (=> start!100828 true))

(assert (=> start!100828 tp!90906))

(declare-datatypes ((V!46021 0))(
  ( (V!46022 (val!15392 Int)) )
))
(declare-datatypes ((ValueCell!14626 0))(
  ( (ValueCellFull!14626 (v!18037 V!46021)) (EmptyCell!14626) )
))
(declare-datatypes ((array!78125 0))(
  ( (array!78126 (arr!37702 (Array (_ BitVec 32) ValueCell!14626)) (size!38238 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78125)

(declare-fun e!685628 () Bool)

(declare-fun array_inv!28717 (array!78125) Bool)

(assert (=> start!100828 (and (array_inv!28717 _values!996) e!685628)))

(declare-fun b!1207325 () Bool)

(declare-fun Unit!40020 () Unit!40018)

(assert (=> b!1207325 (= e!685626 Unit!40020)))

(declare-fun b!1207326 () Bool)

(declare-fun e!685627 () Bool)

(assert (=> b!1207326 (= e!685627 tp_is_empty!30671)))

(declare-fun bm!58950 () Bool)

(declare-fun call!58957 () Unit!40018)

(declare-fun call!58960 () Unit!40018)

(assert (=> bm!58950 (= call!58957 call!58960)))

(declare-fun bm!58951 () Bool)

(declare-datatypes ((tuple2!19754 0))(
  ( (tuple2!19755 (_1!9888 (_ BitVec 64)) (_2!9888 V!46021)) )
))
(declare-datatypes ((List!26555 0))(
  ( (Nil!26552) (Cons!26551 (h!27760 tuple2!19754) (t!39502 List!26555)) )
))
(declare-datatypes ((ListLongMap!17723 0))(
  ( (ListLongMap!17724 (toList!8877 List!26555)) )
))
(declare-fun call!58955 () ListLongMap!17723)

(declare-fun call!58959 () ListLongMap!17723)

(assert (=> bm!58951 (= call!58955 call!58959)))

(declare-fun b!1207327 () Bool)

(declare-fun res!802772 () Bool)

(assert (=> b!1207327 (=> (not res!802772) (not e!685630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207327 (= res!802772 (validKeyInArray!0 k!934))))

(declare-fun zeroValue!944 () V!46021)

(declare-fun bm!58952 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!58953 () ListLongMap!17723)

(declare-fun minValue!944 () V!46021)

(declare-fun getCurrentListMapNoExtraKeys!5311 (array!78123 array!78125 (_ BitVec 32) (_ BitVec 32) V!46021 V!46021 (_ BitVec 32) Int) ListLongMap!17723)

(assert (=> bm!58952 (= call!58953 (getCurrentListMapNoExtraKeys!5311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58956 () ListLongMap!17723)

(declare-fun b!1207328 () Bool)

(declare-fun e!685634 () Bool)

(declare-fun -!1832 (ListLongMap!17723 (_ BitVec 64)) ListLongMap!17723)

(assert (=> b!1207328 (= e!685634 (= call!58956 (-!1832 call!58953 k!934)))))

(declare-fun b!1207329 () Bool)

(declare-fun e!685631 () Bool)

(assert (=> b!1207329 (= e!685631 (or (bvsge (size!38237 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38237 _keys!1208))))))

(declare-datatypes ((List!26556 0))(
  ( (Nil!26553) (Cons!26552 (h!27761 (_ BitVec 64)) (t!39503 List!26556)) )
))
(declare-fun arrayNoDuplicates!0 (array!78123 (_ BitVec 32) List!26556) Bool)

(assert (=> b!1207329 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26553)))

(declare-fun lt!547791 () Unit!40018)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78123 (_ BitVec 32) (_ BitVec 32)) Unit!40018)

(assert (=> b!1207329 (= lt!547791 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!685637 () Bool)

(assert (=> b!1207329 e!685637))

(declare-fun res!802760 () Bool)

(assert (=> b!1207329 (=> (not res!802760) (not e!685637))))

(declare-fun e!685622 () Bool)

(assert (=> b!1207329 (= res!802760 e!685622)))

(declare-fun c!118624 () Bool)

(assert (=> b!1207329 (= c!118624 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547796 () Unit!40018)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!579 (array!78123 array!78125 (_ BitVec 32) (_ BitVec 32) V!46021 V!46021 (_ BitVec 64) (_ BitVec 32) Int) Unit!40018)

(assert (=> b!1207329 (= lt!547796 (lemmaListMapContainsThenArrayContainsFrom!579 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547795 () Unit!40018)

(declare-fun e!685625 () Unit!40018)

(assert (=> b!1207329 (= lt!547795 e!685625)))

(declare-fun c!118625 () Bool)

(assert (=> b!1207329 (= c!118625 (and (not lt!547784) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207329 (= lt!547784 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207330 () Bool)

(declare-fun e!685629 () Bool)

(declare-fun e!685632 () Bool)

(assert (=> b!1207330 (= e!685629 e!685632)))

(declare-fun res!802770 () Bool)

(assert (=> b!1207330 (=> res!802770 e!685632)))

(assert (=> b!1207330 (= res!802770 (not (= (select (arr!37701 _keys!1208) from!1455) k!934)))))

(assert (=> b!1207330 e!685634))

(declare-fun c!118628 () Bool)

(assert (=> b!1207330 (= c!118628 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547793 () Unit!40018)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1039 (array!78123 array!78125 (_ BitVec 32) (_ BitVec 32) V!46021 V!46021 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40018)

(assert (=> b!1207330 (= lt!547793 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1039 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207331 () Bool)

(declare-fun call!58954 () Bool)

(assert (=> b!1207331 call!58954))

(declare-fun lt!547785 () Unit!40018)

(assert (=> b!1207331 (= lt!547785 call!58957)))

(assert (=> b!1207331 (= e!685633 lt!547785)))

(declare-fun b!1207332 () Bool)

(declare-fun res!802771 () Bool)

(assert (=> b!1207332 (=> (not res!802771) (not e!685630))))

(assert (=> b!1207332 (= res!802771 (= (select (arr!37701 _keys!1208) i!673) k!934))))

(declare-fun b!1207333 () Bool)

(declare-fun e!685624 () Bool)

(declare-fun mapRes!47865 () Bool)

(assert (=> b!1207333 (= e!685628 (and e!685624 mapRes!47865))))

(declare-fun condMapEmpty!47865 () Bool)

(declare-fun mapDefault!47865 () ValueCell!14626)

