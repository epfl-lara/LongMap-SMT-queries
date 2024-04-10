; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101630 () Bool)

(assert start!101630)

(declare-fun b_free!26351 () Bool)

(declare-fun b_next!26351 () Bool)

(assert (=> start!101630 (= b_free!26351 (not b_next!26351))))

(declare-fun tp!92095 () Bool)

(declare-fun b_and!43945 () Bool)

(assert (=> start!101630 (= tp!92095 b_and!43945)))

(declare-fun mapNonEmpty!48478 () Bool)

(declare-fun mapRes!48478 () Bool)

(declare-fun tp!92096 () Bool)

(declare-fun e!694059 () Bool)

(assert (=> mapNonEmpty!48478 (= mapRes!48478 (and tp!92096 e!694059))))

(declare-fun mapKey!48478 () (_ BitVec 32))

(declare-datatypes ((V!46533 0))(
  ( (V!46534 (val!15584 Int)) )
))
(declare-datatypes ((ValueCell!14818 0))(
  ( (ValueCellFull!14818 (v!18245 V!46533)) (EmptyCell!14818) )
))
(declare-fun mapRest!48478 () (Array (_ BitVec 32) ValueCell!14818))

(declare-fun mapValue!48478 () ValueCell!14818)

(declare-datatypes ((array!78893 0))(
  ( (array!78894 (arr!38074 (Array (_ BitVec 32) ValueCell!14818)) (size!38610 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78893)

(assert (=> mapNonEmpty!48478 (= (arr!38074 _values!996) (store mapRest!48478 mapKey!48478 mapValue!48478))))

(declare-fun res!811946 () Bool)

(declare-fun e!694048 () Bool)

(assert (=> start!101630 (=> (not res!811946) (not e!694048))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78895 0))(
  ( (array!78896 (arr!38075 (Array (_ BitVec 32) (_ BitVec 64))) (size!38611 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78895)

(assert (=> start!101630 (= res!811946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38611 _keys!1208))))))

(assert (=> start!101630 e!694048))

(declare-fun tp_is_empty!31055 () Bool)

(assert (=> start!101630 tp_is_empty!31055))

(declare-fun array_inv!28970 (array!78895) Bool)

(assert (=> start!101630 (array_inv!28970 _keys!1208)))

(assert (=> start!101630 true))

(assert (=> start!101630 tp!92095))

(declare-fun e!694057 () Bool)

(declare-fun array_inv!28971 (array!78893) Bool)

(assert (=> start!101630 (and (array_inv!28971 _values!996) e!694057)))

(declare-fun b!1222115 () Bool)

(declare-fun res!811947 () Bool)

(declare-fun e!694047 () Bool)

(assert (=> b!1222115 (=> res!811947 e!694047)))

(declare-datatypes ((List!26871 0))(
  ( (Nil!26868) (Cons!26867 (h!28076 (_ BitVec 64)) (t!40202 List!26871)) )
))
(declare-fun noDuplicate!1635 (List!26871) Bool)

(assert (=> b!1222115 (= res!811947 (not (noDuplicate!1635 Nil!26868)))))

(declare-fun b!1222116 () Bool)

(declare-fun res!811964 () Bool)

(assert (=> b!1222116 (=> (not res!811964) (not e!694048))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78895 (_ BitVec 32)) Bool)

(assert (=> b!1222116 (= res!811964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222117 () Bool)

(declare-fun e!694056 () Bool)

(assert (=> b!1222117 (= e!694056 e!694047)))

(declare-fun res!811961 () Bool)

(assert (=> b!1222117 (=> res!811961 e!694047)))

(assert (=> b!1222117 (= res!811961 (or (bvsge (size!38611 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38611 _keys!1208)) (bvsge from!1455 (size!38611 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78895 (_ BitVec 32) List!26871) Bool)

(assert (=> b!1222117 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26868)))

(declare-datatypes ((Unit!40474 0))(
  ( (Unit!40475) )
))
(declare-fun lt!555963 () Unit!40474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78895 (_ BitVec 32) (_ BitVec 32)) Unit!40474)

(assert (=> b!1222117 (= lt!555963 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222117 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!555964 () Unit!40474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78895 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40474)

(assert (=> b!1222117 (= lt!555964 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222118 () Bool)

(declare-fun res!811963 () Bool)

(assert (=> b!1222118 (=> (not res!811963) (not e!694048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222118 (= res!811963 (validMask!0 mask!1564))))

(declare-fun b!1222119 () Bool)

(declare-fun res!811951 () Bool)

(declare-fun e!694054 () Bool)

(assert (=> b!1222119 (=> (not res!811951) (not e!694054))))

(declare-fun lt!555961 () array!78895)

(assert (=> b!1222119 (= res!811951 (arrayNoDuplicates!0 lt!555961 #b00000000000000000000000000000000 Nil!26868))))

(declare-fun b!1222120 () Bool)

(declare-fun e!694055 () Bool)

(declare-fun e!694058 () Bool)

(assert (=> b!1222120 (= e!694055 e!694058)))

(declare-fun res!811954 () Bool)

(assert (=> b!1222120 (=> res!811954 e!694058)))

(assert (=> b!1222120 (= res!811954 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555966 () array!78893)

(declare-datatypes ((tuple2!20070 0))(
  ( (tuple2!20071 (_1!10046 (_ BitVec 64)) (_2!10046 V!46533)) )
))
(declare-datatypes ((List!26872 0))(
  ( (Nil!26869) (Cons!26868 (h!28077 tuple2!20070) (t!40203 List!26872)) )
))
(declare-datatypes ((ListLongMap!18039 0))(
  ( (ListLongMap!18040 (toList!9035 List!26872)) )
))
(declare-fun lt!555962 () ListLongMap!18039)

(declare-fun minValue!944 () V!46533)

(declare-fun getCurrentListMapNoExtraKeys!5457 (array!78895 array!78893 (_ BitVec 32) (_ BitVec 32) V!46533 V!46533 (_ BitVec 32) Int) ListLongMap!18039)

(assert (=> b!1222120 (= lt!555962 (getCurrentListMapNoExtraKeys!5457 lt!555961 lt!555966 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555955 () V!46533)

(assert (=> b!1222120 (= lt!555966 (array!78894 (store (arr!38074 _values!996) i!673 (ValueCellFull!14818 lt!555955)) (size!38610 _values!996)))))

(declare-fun dynLambda!3336 (Int (_ BitVec 64)) V!46533)

(assert (=> b!1222120 (= lt!555955 (dynLambda!3336 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555967 () ListLongMap!18039)

(assert (=> b!1222120 (= lt!555967 (getCurrentListMapNoExtraKeys!5457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222121 () Bool)

(assert (=> b!1222121 (= e!694054 (not e!694055))))

(declare-fun res!811957 () Bool)

(assert (=> b!1222121 (=> res!811957 e!694055)))

(assert (=> b!1222121 (= res!811957 (bvsgt from!1455 i!673))))

(assert (=> b!1222121 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!555957 () Unit!40474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78895 (_ BitVec 64) (_ BitVec 32)) Unit!40474)

(assert (=> b!1222121 (= lt!555957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222122 () Bool)

(assert (=> b!1222122 (= e!694059 tp_is_empty!31055)))

(declare-fun mapIsEmpty!48478 () Bool)

(assert (=> mapIsEmpty!48478 mapRes!48478))

(declare-fun b!1222123 () Bool)

(assert (=> b!1222123 (= e!694048 e!694054)))

(declare-fun res!811950 () Bool)

(assert (=> b!1222123 (=> (not res!811950) (not e!694054))))

(assert (=> b!1222123 (= res!811950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555961 mask!1564))))

(assert (=> b!1222123 (= lt!555961 (array!78896 (store (arr!38075 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38611 _keys!1208)))))

(declare-fun b!1222124 () Bool)

(declare-fun e!694050 () Bool)

(assert (=> b!1222124 (= e!694050 e!694056)))

(declare-fun res!811952 () Bool)

(assert (=> b!1222124 (=> res!811952 e!694056)))

(assert (=> b!1222124 (= res!811952 (not (= (select (arr!38075 _keys!1208) from!1455) k!934)))))

(declare-fun e!694049 () Bool)

(assert (=> b!1222124 e!694049))

(declare-fun res!811955 () Bool)

(assert (=> b!1222124 (=> (not res!811955) (not e!694049))))

(declare-fun lt!555965 () ListLongMap!18039)

(declare-fun +!4097 (ListLongMap!18039 tuple2!20070) ListLongMap!18039)

(declare-fun get!19434 (ValueCell!14818 V!46533) V!46533)

(assert (=> b!1222124 (= res!811955 (= lt!555962 (+!4097 lt!555965 (tuple2!20071 (select (arr!38075 _keys!1208) from!1455) (get!19434 (select (arr!38074 _values!996) from!1455) lt!555955)))))))

(declare-fun b!1222125 () Bool)

(declare-fun e!694053 () Bool)

(assert (=> b!1222125 (= e!694053 tp_is_empty!31055)))

(declare-fun b!1222126 () Bool)

(declare-fun res!811959 () Bool)

(assert (=> b!1222126 (=> (not res!811959) (not e!694048))))

(assert (=> b!1222126 (= res!811959 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38611 _keys!1208))))))

(declare-fun b!1222127 () Bool)

(assert (=> b!1222127 (= e!694047 true)))

(declare-fun lt!555956 () Bool)

(declare-fun contains!7033 (List!26871 (_ BitVec 64)) Bool)

(assert (=> b!1222127 (= lt!555956 (contains!7033 Nil!26868 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1222128 () Bool)

(declare-fun e!694051 () Bool)

(assert (=> b!1222128 (= e!694049 e!694051)))

(declare-fun res!811962 () Bool)

(assert (=> b!1222128 (=> res!811962 e!694051)))

(assert (=> b!1222128 (= res!811962 (not (= (select (arr!38075 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222129 () Bool)

(declare-fun res!811960 () Bool)

(assert (=> b!1222129 (=> res!811960 e!694047)))

(assert (=> b!1222129 (= res!811960 (contains!7033 Nil!26868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1222130 () Bool)

(declare-fun res!811948 () Bool)

(assert (=> b!1222130 (=> (not res!811948) (not e!694048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222130 (= res!811948 (validKeyInArray!0 k!934))))

(declare-fun b!1222131 () Bool)

(assert (=> b!1222131 (= e!694058 e!694050)))

(declare-fun res!811958 () Bool)

(assert (=> b!1222131 (=> res!811958 e!694050)))

(assert (=> b!1222131 (= res!811958 (not (validKeyInArray!0 (select (arr!38075 _keys!1208) from!1455))))))

(declare-fun lt!555960 () ListLongMap!18039)

(assert (=> b!1222131 (= lt!555960 lt!555965)))

(declare-fun lt!555959 () ListLongMap!18039)

(declare-fun -!1939 (ListLongMap!18039 (_ BitVec 64)) ListLongMap!18039)

(assert (=> b!1222131 (= lt!555965 (-!1939 lt!555959 k!934))))

(assert (=> b!1222131 (= lt!555960 (getCurrentListMapNoExtraKeys!5457 lt!555961 lt!555966 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222131 (= lt!555959 (getCurrentListMapNoExtraKeys!5457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555958 () Unit!40474)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1146 (array!78895 array!78893 (_ BitVec 32) (_ BitVec 32) V!46533 V!46533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40474)

(assert (=> b!1222131 (= lt!555958 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222132 () Bool)

(declare-fun res!811949 () Bool)

(assert (=> b!1222132 (=> (not res!811949) (not e!694048))))

(assert (=> b!1222132 (= res!811949 (= (select (arr!38075 _keys!1208) i!673) k!934))))

(declare-fun b!1222133 () Bool)

(declare-fun res!811956 () Bool)

(assert (=> b!1222133 (=> (not res!811956) (not e!694048))))

(assert (=> b!1222133 (= res!811956 (and (= (size!38610 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38611 _keys!1208) (size!38610 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222134 () Bool)

(assert (=> b!1222134 (= e!694057 (and e!694053 mapRes!48478))))

(declare-fun condMapEmpty!48478 () Bool)

(declare-fun mapDefault!48478 () ValueCell!14818)

