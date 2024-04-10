; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99460 () Bool)

(assert start!99460)

(declare-fun b_free!25039 () Bool)

(declare-fun b_next!25039 () Bool)

(assert (=> start!99460 (= b_free!25039 (not b_next!25039))))

(declare-fun tp!87831 () Bool)

(declare-fun b_and!40945 () Bool)

(assert (=> start!99460 (= tp!87831 b_and!40945)))

(declare-fun b!1175153 () Bool)

(declare-fun res!780445 () Bool)

(declare-fun e!667989 () Bool)

(assert (=> b!1175153 (=> (not res!780445) (not e!667989))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175153 (= res!780445 (validKeyInArray!0 k!934))))

(declare-fun b!1175154 () Bool)

(declare-fun res!780451 () Bool)

(assert (=> b!1175154 (=> (not res!780451) (not e!667989))))

(declare-datatypes ((array!75949 0))(
  ( (array!75950 (arr!36624 (Array (_ BitVec 32) (_ BitVec 64))) (size!37160 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75949)

(declare-datatypes ((List!25716 0))(
  ( (Nil!25713) (Cons!25712 (h!26921 (_ BitVec 64)) (t!37747 List!25716)) )
))
(declare-fun arrayNoDuplicates!0 (array!75949 (_ BitVec 32) List!25716) Bool)

(assert (=> b!1175154 (= res!780451 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25713))))

(declare-fun b!1175155 () Bool)

(declare-fun res!780439 () Bool)

(assert (=> b!1175155 (=> (not res!780439) (not e!667989))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44553 0))(
  ( (V!44554 (val!14841 Int)) )
))
(declare-datatypes ((ValueCell!14075 0))(
  ( (ValueCellFull!14075 (v!17479 V!44553)) (EmptyCell!14075) )
))
(declare-datatypes ((array!75951 0))(
  ( (array!75952 (arr!36625 (Array (_ BitVec 32) ValueCell!14075)) (size!37161 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75951)

(assert (=> b!1175155 (= res!780439 (and (= (size!37161 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37160 _keys!1208) (size!37161 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46181 () Bool)

(declare-fun mapRes!46181 () Bool)

(declare-fun tp!87830 () Bool)

(declare-fun e!667987 () Bool)

(assert (=> mapNonEmpty!46181 (= mapRes!46181 (and tp!87830 e!667987))))

(declare-fun mapValue!46181 () ValueCell!14075)

(declare-fun mapKey!46181 () (_ BitVec 32))

(declare-fun mapRest!46181 () (Array (_ BitVec 32) ValueCell!14075))

(assert (=> mapNonEmpty!46181 (= (arr!36625 _values!996) (store mapRest!46181 mapKey!46181 mapValue!46181))))

(declare-fun b!1175156 () Bool)

(declare-fun e!667988 () Bool)

(assert (=> b!1175156 (= e!667988 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175156 (not (= (select (arr!36624 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38783 0))(
  ( (Unit!38784) )
))
(declare-fun lt!530090 () Unit!38783)

(declare-fun e!667984 () Unit!38783)

(assert (=> b!1175156 (= lt!530090 e!667984)))

(declare-fun c!116682 () Bool)

(assert (=> b!1175156 (= c!116682 (= (select (arr!36624 _keys!1208) from!1455) k!934))))

(declare-fun e!667982 () Bool)

(assert (=> b!1175156 e!667982))

(declare-fun res!780442 () Bool)

(assert (=> b!1175156 (=> (not res!780442) (not e!667982))))

(declare-datatypes ((tuple2!18978 0))(
  ( (tuple2!18979 (_1!9500 (_ BitVec 64)) (_2!9500 V!44553)) )
))
(declare-datatypes ((List!25717 0))(
  ( (Nil!25714) (Cons!25713 (h!26922 tuple2!18978) (t!37748 List!25717)) )
))
(declare-datatypes ((ListLongMap!16947 0))(
  ( (ListLongMap!16948 (toList!8489 List!25717)) )
))
(declare-fun lt!530100 () ListLongMap!16947)

(declare-fun lt!530098 () ListLongMap!16947)

(declare-fun lt!530099 () V!44553)

(declare-fun +!3805 (ListLongMap!16947 tuple2!18978) ListLongMap!16947)

(declare-fun get!18699 (ValueCell!14075 V!44553) V!44553)

(assert (=> b!1175156 (= res!780442 (= lt!530100 (+!3805 lt!530098 (tuple2!18979 (select (arr!36624 _keys!1208) from!1455) (get!18699 (select (arr!36625 _values!996) from!1455) lt!530099)))))))

(declare-fun b!1175157 () Bool)

(declare-fun tp_is_empty!29569 () Bool)

(assert (=> b!1175157 (= e!667987 tp_is_empty!29569)))

(declare-fun b!1175158 () Bool)

(declare-fun e!667983 () Bool)

(assert (=> b!1175158 (= e!667982 e!667983)))

(declare-fun res!780443 () Bool)

(assert (=> b!1175158 (=> res!780443 e!667983)))

(assert (=> b!1175158 (= res!780443 (not (= (select (arr!36624 _keys!1208) from!1455) k!934)))))

(declare-fun b!1175160 () Bool)

(declare-fun e!667980 () Bool)

(assert (=> b!1175160 (= e!667980 e!667988)))

(declare-fun res!780447 () Bool)

(assert (=> b!1175160 (=> res!780447 e!667988)))

(assert (=> b!1175160 (= res!780447 (not (validKeyInArray!0 (select (arr!36624 _keys!1208) from!1455))))))

(declare-fun lt!530087 () ListLongMap!16947)

(assert (=> b!1175160 (= lt!530087 lt!530098)))

(declare-fun lt!530089 () ListLongMap!16947)

(declare-fun -!1545 (ListLongMap!16947 (_ BitVec 64)) ListLongMap!16947)

(assert (=> b!1175160 (= lt!530098 (-!1545 lt!530089 k!934))))

(declare-fun zeroValue!944 () V!44553)

(declare-fun lt!530096 () array!75951)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44553)

(declare-fun lt!530091 () array!75949)

(declare-fun getCurrentListMapNoExtraKeys!4949 (array!75949 array!75951 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) Int) ListLongMap!16947)

(assert (=> b!1175160 (= lt!530087 (getCurrentListMapNoExtraKeys!4949 lt!530091 lt!530096 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175160 (= lt!530089 (getCurrentListMapNoExtraKeys!4949 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!530093 () Unit!38783)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!772 (array!75949 array!75951 (_ BitVec 32) (_ BitVec 32) V!44553 V!44553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38783)

(assert (=> b!1175160 (= lt!530093 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46181 () Bool)

(assert (=> mapIsEmpty!46181 mapRes!46181))

(declare-fun b!1175161 () Bool)

(declare-fun arrayContainsKey!0 (array!75949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175161 (= e!667983 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1175162 () Bool)

(declare-fun e!667990 () Bool)

(assert (=> b!1175162 (= e!667989 e!667990)))

(declare-fun res!780446 () Bool)

(assert (=> b!1175162 (=> (not res!780446) (not e!667990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75949 (_ BitVec 32)) Bool)

(assert (=> b!1175162 (= res!780446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530091 mask!1564))))

(assert (=> b!1175162 (= lt!530091 (array!75950 (store (arr!36624 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37160 _keys!1208)))))

(declare-fun b!1175163 () Bool)

(declare-fun e!667985 () Bool)

(assert (=> b!1175163 (= e!667990 (not e!667985))))

(declare-fun res!780438 () Bool)

(assert (=> b!1175163 (=> res!780438 e!667985)))

(assert (=> b!1175163 (= res!780438 (bvsgt from!1455 i!673))))

(assert (=> b!1175163 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!530095 () Unit!38783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75949 (_ BitVec 64) (_ BitVec 32)) Unit!38783)

(assert (=> b!1175163 (= lt!530095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1175164 () Bool)

(declare-fun res!780444 () Bool)

(assert (=> b!1175164 (=> (not res!780444) (not e!667989))))

(assert (=> b!1175164 (= res!780444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175165 () Bool)

(declare-fun e!667979 () Bool)

(declare-fun e!667986 () Bool)

(assert (=> b!1175165 (= e!667979 (and e!667986 mapRes!46181))))

(declare-fun condMapEmpty!46181 () Bool)

(declare-fun mapDefault!46181 () ValueCell!14075)

