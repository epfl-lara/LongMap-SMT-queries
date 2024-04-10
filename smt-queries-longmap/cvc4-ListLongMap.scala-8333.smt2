; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101428 () Bool)

(assert start!101428)

(declare-fun b_free!26273 () Bool)

(declare-fun b_next!26273 () Bool)

(assert (=> start!101428 (= b_free!26273 (not b_next!26273))))

(declare-fun tp!91849 () Bool)

(declare-fun b_and!43717 () Bool)

(assert (=> start!101428 (= tp!91849 b_and!43717)))

(declare-fun b!1219104 () Bool)

(declare-fun res!809709 () Bool)

(declare-fun e!692176 () Bool)

(assert (=> b!1219104 (=> (not res!809709) (not e!692176))))

(declare-datatypes ((array!78729 0))(
  ( (array!78730 (arr!37996 (Array (_ BitVec 32) (_ BitVec 64))) (size!38532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78729)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78729 (_ BitVec 32)) Bool)

(assert (=> b!1219104 (= res!809709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219105 () Bool)

(declare-fun e!692186 () Bool)

(declare-fun e!692185 () Bool)

(assert (=> b!1219105 (= e!692186 e!692185)))

(declare-fun res!809708 () Bool)

(assert (=> b!1219105 (=> res!809708 e!692185)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219105 (= res!809708 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46429 0))(
  ( (V!46430 (val!15545 Int)) )
))
(declare-fun zeroValue!944 () V!46429)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14779 0))(
  ( (ValueCellFull!14779 (v!18201 V!46429)) (EmptyCell!14779) )
))
(declare-datatypes ((array!78731 0))(
  ( (array!78732 (arr!37997 (Array (_ BitVec 32) ValueCell!14779)) (size!38533 (_ BitVec 32))) )
))
(declare-fun lt!554255 () array!78731)

(declare-fun lt!554254 () array!78729)

(declare-fun minValue!944 () V!46429)

(declare-datatypes ((tuple2!20002 0))(
  ( (tuple2!20003 (_1!10012 (_ BitVec 64)) (_2!10012 V!46429)) )
))
(declare-datatypes ((List!26803 0))(
  ( (Nil!26800) (Cons!26799 (h!28008 tuple2!20002) (t!40056 List!26803)) )
))
(declare-datatypes ((ListLongMap!17971 0))(
  ( (ListLongMap!17972 (toList!9001 List!26803)) )
))
(declare-fun lt!554252 () ListLongMap!17971)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5426 (array!78729 array!78731 (_ BitVec 32) (_ BitVec 32) V!46429 V!46429 (_ BitVec 32) Int) ListLongMap!17971)

(assert (=> b!1219105 (= lt!554252 (getCurrentListMapNoExtraKeys!5426 lt!554254 lt!554255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554246 () V!46429)

(declare-fun _values!996 () array!78731)

(assert (=> b!1219105 (= lt!554255 (array!78732 (store (arr!37997 _values!996) i!673 (ValueCellFull!14779 lt!554246)) (size!38533 _values!996)))))

(declare-fun dynLambda!3309 (Int (_ BitVec 64)) V!46429)

(assert (=> b!1219105 (= lt!554246 (dynLambda!3309 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554247 () ListLongMap!17971)

(assert (=> b!1219105 (= lt!554247 (getCurrentListMapNoExtraKeys!5426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219106 () Bool)

(declare-fun res!809715 () Bool)

(assert (=> b!1219106 (=> (not res!809715) (not e!692176))))

(declare-datatypes ((List!26804 0))(
  ( (Nil!26801) (Cons!26800 (h!28009 (_ BitVec 64)) (t!40057 List!26804)) )
))
(declare-fun arrayNoDuplicates!0 (array!78729 (_ BitVec 32) List!26804) Bool)

(assert (=> b!1219106 (= res!809715 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26801))))

(declare-fun b!1219107 () Bool)

(declare-fun e!692178 () Bool)

(assert (=> b!1219107 (= e!692178 (bvslt (size!38532 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219107 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!40402 0))(
  ( (Unit!40403) )
))
(declare-fun lt!554253 () Unit!40402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40402)

(assert (=> b!1219107 (= lt!554253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!48349 () Bool)

(declare-fun mapRes!48349 () Bool)

(assert (=> mapIsEmpty!48349 mapRes!48349))

(declare-fun mapNonEmpty!48349 () Bool)

(declare-fun tp!91850 () Bool)

(declare-fun e!692179 () Bool)

(assert (=> mapNonEmpty!48349 (= mapRes!48349 (and tp!91850 e!692179))))

(declare-fun mapKey!48349 () (_ BitVec 32))

(declare-fun mapValue!48349 () ValueCell!14779)

(declare-fun mapRest!48349 () (Array (_ BitVec 32) ValueCell!14779))

(assert (=> mapNonEmpty!48349 (= (arr!37997 _values!996) (store mapRest!48349 mapKey!48349 mapValue!48349))))

(declare-fun b!1219108 () Bool)

(declare-fun res!809714 () Bool)

(assert (=> b!1219108 (=> (not res!809714) (not e!692176))))

(assert (=> b!1219108 (= res!809714 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38532 _keys!1208))))))

(declare-fun b!1219109 () Bool)

(declare-fun e!692182 () Bool)

(assert (=> b!1219109 (= e!692182 (not e!692186))))

(declare-fun res!809711 () Bool)

(assert (=> b!1219109 (=> res!809711 e!692186)))

(assert (=> b!1219109 (= res!809711 (bvsgt from!1455 i!673))))

(assert (=> b!1219109 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!554248 () Unit!40402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78729 (_ BitVec 64) (_ BitVec 32)) Unit!40402)

(assert (=> b!1219109 (= lt!554248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219110 () Bool)

(declare-fun e!692180 () Bool)

(declare-fun e!692181 () Bool)

(assert (=> b!1219110 (= e!692180 e!692181)))

(declare-fun res!809719 () Bool)

(assert (=> b!1219110 (=> res!809719 e!692181)))

(assert (=> b!1219110 (= res!809719 (not (= (select (arr!37996 _keys!1208) from!1455) k!934)))))

(declare-fun b!1219111 () Bool)

(declare-fun res!809717 () Bool)

(assert (=> b!1219111 (=> (not res!809717) (not e!692176))))

(assert (=> b!1219111 (= res!809717 (= (select (arr!37996 _keys!1208) i!673) k!934))))

(declare-fun res!809720 () Bool)

(assert (=> start!101428 (=> (not res!809720) (not e!692176))))

(assert (=> start!101428 (= res!809720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38532 _keys!1208))))))

(assert (=> start!101428 e!692176))

(declare-fun tp_is_empty!30977 () Bool)

(assert (=> start!101428 tp_is_empty!30977))

(declare-fun array_inv!28918 (array!78729) Bool)

(assert (=> start!101428 (array_inv!28918 _keys!1208)))

(assert (=> start!101428 true))

(assert (=> start!101428 tp!91849))

(declare-fun e!692177 () Bool)

(declare-fun array_inv!28919 (array!78731) Bool)

(assert (=> start!101428 (and (array_inv!28919 _values!996) e!692177)))

(declare-fun b!1219112 () Bool)

(declare-fun res!809721 () Bool)

(assert (=> b!1219112 (=> (not res!809721) (not e!692176))))

(assert (=> b!1219112 (= res!809721 (and (= (size!38533 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38532 _keys!1208) (size!38533 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219113 () Bool)

(declare-fun res!809710 () Bool)

(assert (=> b!1219113 (=> (not res!809710) (not e!692182))))

(assert (=> b!1219113 (= res!809710 (arrayNoDuplicates!0 lt!554254 #b00000000000000000000000000000000 Nil!26801))))

(declare-fun b!1219114 () Bool)

(assert (=> b!1219114 (= e!692181 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219115 () Bool)

(declare-fun e!692184 () Bool)

(assert (=> b!1219115 (= e!692185 e!692184)))

(declare-fun res!809707 () Bool)

(assert (=> b!1219115 (=> res!809707 e!692184)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219115 (= res!809707 (not (validKeyInArray!0 (select (arr!37996 _keys!1208) from!1455))))))

(declare-fun lt!554251 () ListLongMap!17971)

(declare-fun lt!554250 () ListLongMap!17971)

(assert (=> b!1219115 (= lt!554251 lt!554250)))

(declare-fun lt!554249 () ListLongMap!17971)

(declare-fun -!1913 (ListLongMap!17971 (_ BitVec 64)) ListLongMap!17971)

(assert (=> b!1219115 (= lt!554250 (-!1913 lt!554249 k!934))))

(assert (=> b!1219115 (= lt!554251 (getCurrentListMapNoExtraKeys!5426 lt!554254 lt!554255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219115 (= lt!554249 (getCurrentListMapNoExtraKeys!5426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554256 () Unit!40402)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1120 (array!78729 array!78731 (_ BitVec 32) (_ BitVec 32) V!46429 V!46429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40402)

(assert (=> b!1219115 (= lt!554256 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1120 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219116 () Bool)

(assert (=> b!1219116 (= e!692176 e!692182)))

(declare-fun res!809713 () Bool)

(assert (=> b!1219116 (=> (not res!809713) (not e!692182))))

(assert (=> b!1219116 (= res!809713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554254 mask!1564))))

(assert (=> b!1219116 (= lt!554254 (array!78730 (store (arr!37996 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38532 _keys!1208)))))

(declare-fun b!1219117 () Bool)

(declare-fun e!692183 () Bool)

(assert (=> b!1219117 (= e!692183 tp_is_empty!30977)))

(declare-fun b!1219118 () Bool)

(assert (=> b!1219118 (= e!692184 e!692178)))

(declare-fun res!809718 () Bool)

(assert (=> b!1219118 (=> res!809718 e!692178)))

(assert (=> b!1219118 (= res!809718 (not (= (select (arr!37996 _keys!1208) from!1455) k!934)))))

(assert (=> b!1219118 e!692180))

(declare-fun res!809716 () Bool)

(assert (=> b!1219118 (=> (not res!809716) (not e!692180))))

(declare-fun +!4070 (ListLongMap!17971 tuple2!20002) ListLongMap!17971)

(declare-fun get!19373 (ValueCell!14779 V!46429) V!46429)

(assert (=> b!1219118 (= res!809716 (= lt!554252 (+!4070 lt!554250 (tuple2!20003 (select (arr!37996 _keys!1208) from!1455) (get!19373 (select (arr!37997 _values!996) from!1455) lt!554246)))))))

(declare-fun b!1219119 () Bool)

(assert (=> b!1219119 (= e!692177 (and e!692183 mapRes!48349))))

(declare-fun condMapEmpty!48349 () Bool)

(declare-fun mapDefault!48349 () ValueCell!14779)

