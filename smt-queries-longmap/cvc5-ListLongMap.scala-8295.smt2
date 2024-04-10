; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101080 () Bool)

(assert start!101080)

(declare-fun b_free!26041 () Bool)

(declare-fun b_next!26041 () Bool)

(assert (=> start!101080 (= b_free!26041 (not b_next!26041))))

(declare-fun tp!91141 () Bool)

(declare-fun b_and!43181 () Bool)

(assert (=> start!101080 (= tp!91141 b_and!43181)))

(declare-fun b!1211743 () Bool)

(declare-datatypes ((Unit!40182 0))(
  ( (Unit!40183) )
))
(declare-fun e!688165 () Unit!40182)

(declare-fun lt!550464 () Unit!40182)

(assert (=> b!1211743 (= e!688165 lt!550464)))

(declare-fun call!59956 () Unit!40182)

(assert (=> b!1211743 (= lt!550464 call!59956)))

(declare-fun call!59957 () Bool)

(assert (=> b!1211743 call!59957))

(declare-datatypes ((V!46121 0))(
  ( (V!46122 (val!15429 Int)) )
))
(declare-fun zeroValue!944 () V!46121)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!78277 0))(
  ( (array!78278 (arr!37774 (Array (_ BitVec 32) (_ BitVec 64))) (size!38310 (_ BitVec 32))) )
))
(declare-fun lt!550457 () array!78277)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59951 () Bool)

(declare-datatypes ((tuple2!19822 0))(
  ( (tuple2!19823 (_1!9922 (_ BitVec 64)) (_2!9922 V!46121)) )
))
(declare-datatypes ((List!26623 0))(
  ( (Nil!26620) (Cons!26619 (h!27828 tuple2!19822) (t!39644 List!26623)) )
))
(declare-datatypes ((ListLongMap!17791 0))(
  ( (ListLongMap!17792 (toList!8911 List!26623)) )
))
(declare-fun call!59954 () ListLongMap!17791)

(declare-datatypes ((ValueCell!14663 0))(
  ( (ValueCellFull!14663 (v!18081 V!46121)) (EmptyCell!14663) )
))
(declare-datatypes ((array!78279 0))(
  ( (array!78280 (arr!37775 (Array (_ BitVec 32) ValueCell!14663)) (size!38311 (_ BitVec 32))) )
))
(declare-fun lt!550456 () array!78279)

(declare-fun minValue!944 () V!46121)

(declare-fun getCurrentListMapNoExtraKeys!5343 (array!78277 array!78279 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) Int) ListLongMap!17791)

(assert (=> bm!59951 (= call!59954 (getCurrentListMapNoExtraKeys!5343 lt!550457 lt!550456 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!78277)

(declare-fun _values!996 () array!78279)

(declare-fun bm!59952 () Bool)

(declare-fun call!59958 () ListLongMap!17791)

(assert (=> bm!59952 (= call!59958 (getCurrentListMapNoExtraKeys!5343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211744 () Bool)

(assert (=> b!1211744 call!59957))

(declare-fun lt!550472 () Unit!40182)

(assert (=> b!1211744 (= lt!550472 call!59956)))

(declare-fun e!688175 () Unit!40182)

(assert (=> b!1211744 (= e!688175 lt!550472)))

(declare-fun b!1211745 () Bool)

(declare-fun res!804928 () Bool)

(declare-fun e!688176 () Bool)

(assert (=> b!1211745 (=> (not res!804928) (not e!688176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78277 (_ BitVec 32)) Bool)

(assert (=> b!1211745 (= res!804928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211746 () Bool)

(declare-fun res!804934 () Bool)

(assert (=> b!1211746 (=> (not res!804934) (not e!688176))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1211746 (= res!804934 (= (select (arr!37774 _keys!1208) i!673) k!934))))

(declare-fun b!1211748 () Bool)

(declare-fun res!804936 () Bool)

(declare-fun e!688172 () Bool)

(assert (=> b!1211748 (=> (not res!804936) (not e!688172))))

(declare-datatypes ((List!26624 0))(
  ( (Nil!26621) (Cons!26620 (h!27829 (_ BitVec 64)) (t!39645 List!26624)) )
))
(declare-fun arrayNoDuplicates!0 (array!78277 (_ BitVec 32) List!26624) Bool)

(assert (=> b!1211748 (= res!804936 (arrayNoDuplicates!0 lt!550457 #b00000000000000000000000000000000 Nil!26621))))

(declare-fun mapIsEmpty!47989 () Bool)

(declare-fun mapRes!47989 () Bool)

(assert (=> mapIsEmpty!47989 mapRes!47989))

(declare-fun b!1211749 () Bool)

(declare-fun e!688171 () Bool)

(assert (=> b!1211749 (= e!688172 (not e!688171))))

(declare-fun res!804931 () Bool)

(assert (=> b!1211749 (=> res!804931 e!688171)))

(assert (=> b!1211749 (= res!804931 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211749 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!550468 () Unit!40182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78277 (_ BitVec 64) (_ BitVec 32)) Unit!40182)

(assert (=> b!1211749 (= lt!550468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun e!688168 () Bool)

(declare-fun b!1211750 () Bool)

(assert (=> b!1211750 (= e!688168 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211751 () Bool)

(declare-fun res!804930 () Bool)

(assert (=> b!1211751 (=> (not res!804930) (not e!688176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211751 (= res!804930 (validKeyInArray!0 k!934))))

(declare-fun b!1211752 () Bool)

(declare-fun e!688179 () Bool)

(declare-fun e!688164 () Bool)

(assert (=> b!1211752 (= e!688179 e!688164)))

(declare-fun res!804933 () Bool)

(assert (=> b!1211752 (=> res!804933 e!688164)))

(assert (=> b!1211752 (= res!804933 (not (= (select (arr!37774 _keys!1208) from!1455) k!934)))))

(declare-fun e!688169 () Bool)

(assert (=> b!1211752 e!688169))

(declare-fun c!119531 () Bool)

(assert (=> b!1211752 (= c!119531 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550454 () Unit!40182)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1069 (array!78277 array!78279 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40182)

(assert (=> b!1211752 (= lt!550454 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1069 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211753 () Bool)

(declare-fun e!688166 () Bool)

(declare-fun tp_is_empty!30745 () Bool)

(assert (=> b!1211753 (= e!688166 tp_is_empty!30745)))

(declare-fun b!1211754 () Bool)

(assert (=> b!1211754 (= e!688176 e!688172)))

(declare-fun res!804924 () Bool)

(assert (=> b!1211754 (=> (not res!804924) (not e!688172))))

(assert (=> b!1211754 (= res!804924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550457 mask!1564))))

(assert (=> b!1211754 (= lt!550457 (array!78278 (store (arr!37774 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38310 _keys!1208)))))

(declare-fun lt!550473 () Bool)

(declare-fun b!1211755 () Bool)

(assert (=> b!1211755 (= e!688168 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550463 () ListLongMap!17791)

(declare-fun bm!59953 () Bool)

(declare-fun call!59960 () ListLongMap!17791)

(declare-fun c!119533 () Bool)

(declare-fun call!59955 () Bool)

(declare-fun contains!6983 (ListLongMap!17791 (_ BitVec 64)) Bool)

(assert (=> bm!59953 (= call!59955 (contains!6983 (ite c!119533 lt!550463 call!59960) k!934))))

(declare-fun res!804927 () Bool)

(assert (=> start!101080 (=> (not res!804927) (not e!688176))))

(assert (=> start!101080 (= res!804927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38310 _keys!1208))))))

(assert (=> start!101080 e!688176))

(assert (=> start!101080 tp_is_empty!30745))

(declare-fun array_inv!28774 (array!78277) Bool)

(assert (=> start!101080 (array_inv!28774 _keys!1208)))

(assert (=> start!101080 true))

(assert (=> start!101080 tp!91141))

(declare-fun e!688178 () Bool)

(declare-fun array_inv!28775 (array!78279) Bool)

(assert (=> start!101080 (and (array_inv!28775 _values!996) e!688178)))

(declare-fun b!1211747 () Bool)

(declare-fun c!119528 () Bool)

(assert (=> b!1211747 (= c!119528 (and (not lt!550473) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688173 () Unit!40182)

(assert (=> b!1211747 (= e!688173 e!688165)))

(declare-fun b!1211756 () Bool)

(declare-fun res!804929 () Bool)

(assert (=> b!1211756 (=> (not res!804929) (not e!688176))))

(assert (=> b!1211756 (= res!804929 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38310 _keys!1208))))))

(declare-fun b!1211757 () Bool)

(declare-fun call!59959 () ListLongMap!17791)

(assert (=> b!1211757 (contains!6983 call!59959 k!934)))

(declare-fun lt!550470 () Unit!40182)

(declare-fun call!59961 () Unit!40182)

(assert (=> b!1211757 (= lt!550470 call!59961)))

(assert (=> b!1211757 call!59955))

(declare-fun lt!550461 () ListLongMap!17791)

(declare-fun +!4029 (ListLongMap!17791 tuple2!19822) ListLongMap!17791)

(assert (=> b!1211757 (= lt!550463 (+!4029 lt!550461 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550458 () Unit!40182)

(declare-fun addStillContains!1056 (ListLongMap!17791 (_ BitVec 64) V!46121 (_ BitVec 64)) Unit!40182)

(assert (=> b!1211757 (= lt!550458 (addStillContains!1056 lt!550461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1211757 (= e!688173 lt!550470)))

(declare-fun b!1211758 () Bool)

(assert (=> b!1211758 (= e!688165 e!688175)))

(declare-fun c!119532 () Bool)

(assert (=> b!1211758 (= c!119532 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550473))))

(declare-fun b!1211759 () Bool)

(assert (=> b!1211759 (= e!688171 e!688179)))

(declare-fun res!804937 () Bool)

(assert (=> b!1211759 (=> res!804937 e!688179)))

(assert (=> b!1211759 (= res!804937 (not (= from!1455 i!673)))))

(declare-fun lt!550460 () ListLongMap!17791)

(assert (=> b!1211759 (= lt!550460 (getCurrentListMapNoExtraKeys!5343 lt!550457 lt!550456 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550475 () V!46121)

(assert (=> b!1211759 (= lt!550456 (array!78280 (store (arr!37775 _values!996) i!673 (ValueCellFull!14663 lt!550475)) (size!38311 _values!996)))))

(declare-fun dynLambda!3237 (Int (_ BitVec 64)) V!46121)

(assert (=> b!1211759 (= lt!550475 (dynLambda!3237 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550467 () ListLongMap!17791)

(assert (=> b!1211759 (= lt!550467 (getCurrentListMapNoExtraKeys!5343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59954 () Bool)

(assert (=> bm!59954 (= call!59959 (+!4029 (ite c!119533 lt!550463 lt!550461) (ite c!119533 (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119528 (tuple2!19823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211760 () Bool)

(declare-fun lt!550455 () ListLongMap!17791)

(assert (=> b!1211760 (= e!688164 (= lt!550455 (getCurrentListMapNoExtraKeys!5343 lt!550457 lt!550456 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (=> b!1211760 (= lt!550455 lt!550461)))

(declare-fun -!1859 (ListLongMap!17791 (_ BitVec 64)) ListLongMap!17791)

(assert (=> b!1211760 (= lt!550455 (-!1859 lt!550467 k!934))))

(declare-fun lt!550469 () V!46121)

(assert (=> b!1211760 (= (-!1859 (+!4029 lt!550461 (tuple2!19823 (select (arr!37774 _keys!1208) from!1455) lt!550469)) (select (arr!37774 _keys!1208) from!1455)) lt!550461)))

(declare-fun lt!550462 () Unit!40182)

(declare-fun addThenRemoveForNewKeyIsSame!276 (ListLongMap!17791 (_ BitVec 64) V!46121) Unit!40182)

(assert (=> b!1211760 (= lt!550462 (addThenRemoveForNewKeyIsSame!276 lt!550461 (select (arr!37774 _keys!1208) from!1455) lt!550469))))

(declare-fun get!19251 (ValueCell!14663 V!46121) V!46121)

(assert (=> b!1211760 (= lt!550469 (get!19251 (select (arr!37775 _values!996) from!1455) lt!550475))))

(declare-fun lt!550471 () Unit!40182)

(declare-fun e!688177 () Unit!40182)

(assert (=> b!1211760 (= lt!550471 e!688177)))

(declare-fun c!119529 () Bool)

(assert (=> b!1211760 (= c!119529 (contains!6983 lt!550461 k!934))))

(assert (=> b!1211760 (= lt!550461 (getCurrentListMapNoExtraKeys!5343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211761 () Bool)

(declare-fun res!804926 () Bool)

(assert (=> b!1211761 (=> (not res!804926) (not e!688176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211761 (= res!804926 (validMask!0 mask!1564))))

(declare-fun b!1211762 () Bool)

(assert (=> b!1211762 (= e!688178 (and e!688166 mapRes!47989))))

(declare-fun condMapEmpty!47989 () Bool)

(declare-fun mapDefault!47989 () ValueCell!14663)

