; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100824 () Bool)

(assert start!100824)

(declare-fun b_free!25963 () Bool)

(declare-fun b_next!25963 () Bool)

(assert (=> start!100824 (= b_free!25963 (not b_next!25963))))

(declare-fun tp!90894 () Bool)

(declare-fun b_and!42927 () Bool)

(assert (=> start!100824 (= tp!90894 b_and!42927)))

(declare-fun b!1207151 () Bool)

(declare-datatypes ((Unit!40013 0))(
  ( (Unit!40014) )
))
(declare-fun e!685536 () Unit!40013)

(declare-fun e!685535 () Unit!40013)

(assert (=> b!1207151 (= e!685536 e!685535)))

(declare-fun c!118594 () Bool)

(declare-fun lt!547697 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1207151 (= c!118594 (and (not lt!547697) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1207152 () Bool)

(declare-fun e!685529 () Bool)

(declare-fun e!685526 () Bool)

(assert (=> b!1207152 (= e!685529 e!685526)))

(declare-fun res!802675 () Bool)

(assert (=> b!1207152 (=> res!802675 e!685526)))

(declare-datatypes ((V!46017 0))(
  ( (V!46018 (val!15390 Int)) )
))
(declare-datatypes ((tuple2!19750 0))(
  ( (tuple2!19751 (_1!9886 (_ BitVec 64)) (_2!9886 V!46017)) )
))
(declare-datatypes ((List!26552 0))(
  ( (Nil!26549) (Cons!26548 (h!27757 tuple2!19750) (t!39495 List!26552)) )
))
(declare-datatypes ((ListLongMap!17719 0))(
  ( (ListLongMap!17720 (toList!8875 List!26552)) )
))
(declare-fun lt!547700 () ListLongMap!17719)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6934 (ListLongMap!17719 (_ BitVec 64)) Bool)

(assert (=> b!1207152 (= res!802675 (not (contains!6934 lt!547700 k!934)))))

(declare-fun zeroValue!944 () V!46017)

(declare-datatypes ((array!78115 0))(
  ( (array!78116 (arr!37697 (Array (_ BitVec 32) (_ BitVec 64))) (size!38233 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78115)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14624 0))(
  ( (ValueCellFull!14624 (v!18035 V!46017)) (EmptyCell!14624) )
))
(declare-datatypes ((array!78117 0))(
  ( (array!78118 (arr!37698 (Array (_ BitVec 32) ValueCell!14624)) (size!38234 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78117)

(declare-fun minValue!944 () V!46017)

(declare-fun getCurrentListMapNoExtraKeys!5309 (array!78115 array!78117 (_ BitVec 32) (_ BitVec 32) V!46017 V!46017 (_ BitVec 32) Int) ListLongMap!17719)

(assert (=> b!1207152 (= lt!547700 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207153 () Bool)

(declare-fun e!685541 () Bool)

(declare-fun e!685539 () Bool)

(assert (=> b!1207153 (= e!685541 e!685539)))

(declare-fun res!802671 () Bool)

(assert (=> b!1207153 (=> res!802671 e!685539)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207153 (= res!802671 (not (= from!1455 i!673)))))

(declare-fun lt!547698 () ListLongMap!17719)

(declare-fun lt!547689 () array!78115)

(declare-fun lt!547690 () array!78117)

(assert (=> b!1207153 (= lt!547698 (getCurrentListMapNoExtraKeys!5309 lt!547689 lt!547690 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3213 (Int (_ BitVec 64)) V!46017)

(assert (=> b!1207153 (= lt!547690 (array!78118 (store (arr!37698 _values!996) i!673 (ValueCellFull!14624 (dynLambda!3213 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38234 _values!996)))))

(declare-fun lt!547691 () ListLongMap!17719)

(assert (=> b!1207153 (= lt!547691 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207154 () Bool)

(declare-fun res!802669 () Bool)

(declare-fun e!685527 () Bool)

(assert (=> b!1207154 (=> (not res!802669) (not e!685527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78115 (_ BitVec 32)) Bool)

(assert (=> b!1207154 (= res!802669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!58908 () ListLongMap!17719)

(declare-fun bm!58902 () Bool)

(assert (=> bm!58902 (= call!58908 (getCurrentListMapNoExtraKeys!5309 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207155 () Bool)

(declare-fun e!685532 () Bool)

(assert (=> b!1207155 (= e!685532 (not e!685541))))

(declare-fun res!802677 () Bool)

(assert (=> b!1207155 (=> res!802677 e!685541)))

(assert (=> b!1207155 (= res!802677 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207155 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!547694 () Unit!40013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78115 (_ BitVec 64) (_ BitVec 32)) Unit!40013)

(assert (=> b!1207155 (= lt!547694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!58903 () Bool)

(declare-fun call!58906 () Bool)

(declare-fun call!58912 () Bool)

(assert (=> bm!58903 (= call!58906 call!58912)))

(declare-fun b!1207156 () Bool)

(declare-fun res!802683 () Bool)

(assert (=> b!1207156 (=> (not res!802683) (not e!685527))))

(assert (=> b!1207156 (= res!802683 (= (select (arr!37697 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!47859 () Bool)

(declare-fun mapRes!47859 () Bool)

(declare-fun tp!90895 () Bool)

(declare-fun e!685534 () Bool)

(assert (=> mapNonEmpty!47859 (= mapRes!47859 (and tp!90895 e!685534))))

(declare-fun mapRest!47859 () (Array (_ BitVec 32) ValueCell!14624))

(declare-fun mapValue!47859 () ValueCell!14624)

(declare-fun mapKey!47859 () (_ BitVec 32))

(assert (=> mapNonEmpty!47859 (= (arr!37698 _values!996) (store mapRest!47859 mapKey!47859 mapValue!47859))))

(declare-fun b!1207157 () Bool)

(assert (=> b!1207157 (= e!685527 e!685532)))

(declare-fun res!802679 () Bool)

(assert (=> b!1207157 (=> (not res!802679) (not e!685532))))

(assert (=> b!1207157 (= res!802679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547689 mask!1564))))

(assert (=> b!1207157 (= lt!547689 (array!78116 (store (arr!37697 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38233 _keys!1208)))))

(declare-fun b!1207158 () Bool)

(declare-fun e!685538 () Bool)

(declare-fun e!685537 () Bool)

(assert (=> b!1207158 (= e!685538 (and e!685537 mapRes!47859))))

(declare-fun condMapEmpty!47859 () Bool)

(declare-fun mapDefault!47859 () ValueCell!14624)

