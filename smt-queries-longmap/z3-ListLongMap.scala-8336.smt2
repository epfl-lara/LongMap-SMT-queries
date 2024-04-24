; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101706 () Bool)

(assert start!101706)

(declare-fun b_free!26287 () Bool)

(declare-fun b_next!26287 () Bool)

(assert (=> start!101706 (= b_free!26287 (not b_next!26287))))

(declare-fun tp!91895 () Bool)

(declare-fun b_and!43765 () Bool)

(assert (=> start!101706 (= tp!91895 b_and!43765)))

(declare-datatypes ((array!78799 0))(
  ( (array!78800 (arr!38024 (Array (_ BitVec 32) (_ BitVec 64))) (size!38561 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78799)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1220951 () Bool)

(declare-fun e!693364 () Bool)

(declare-fun arrayContainsKey!0 (array!78799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220951 (= e!693364 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220952 () Bool)

(declare-fun e!693358 () Bool)

(declare-fun e!693357 () Bool)

(assert (=> b!1220952 (= e!693358 e!693357)))

(declare-fun res!810617 () Bool)

(assert (=> b!1220952 (=> res!810617 e!693357)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220952 (= res!810617 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46449 0))(
  ( (V!46450 (val!15552 Int)) )
))
(declare-fun zeroValue!944 () V!46449)

(declare-fun lt!555038 () array!78799)

(declare-datatypes ((ValueCell!14786 0))(
  ( (ValueCellFull!14786 (v!18205 V!46449)) (EmptyCell!14786) )
))
(declare-datatypes ((array!78801 0))(
  ( (array!78802 (arr!38025 (Array (_ BitVec 32) ValueCell!14786)) (size!38562 (_ BitVec 32))) )
))
(declare-fun lt!555039 () array!78801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!20026 0))(
  ( (tuple2!20027 (_1!10024 (_ BitVec 64)) (_2!10024 V!46449)) )
))
(declare-datatypes ((List!26836 0))(
  ( (Nil!26833) (Cons!26832 (h!28050 tuple2!20026) (t!40095 List!26836)) )
))
(declare-datatypes ((ListLongMap!18003 0))(
  ( (ListLongMap!18004 (toList!9017 List!26836)) )
))
(declare-fun lt!555043 () ListLongMap!18003)

(declare-fun minValue!944 () V!46449)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5472 (array!78799 array!78801 (_ BitVec 32) (_ BitVec 32) V!46449 V!46449 (_ BitVec 32) Int) ListLongMap!18003)

(assert (=> b!1220952 (= lt!555043 (getCurrentListMapNoExtraKeys!5472 lt!555038 lt!555039 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78801)

(declare-fun lt!555044 () V!46449)

(assert (=> b!1220952 (= lt!555039 (array!78802 (store (arr!38025 _values!996) i!673 (ValueCellFull!14786 lt!555044)) (size!38562 _values!996)))))

(declare-fun dynLambda!3373 (Int (_ BitVec 64)) V!46449)

(assert (=> b!1220952 (= lt!555044 (dynLambda!3373 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555045 () ListLongMap!18003)

(assert (=> b!1220952 (= lt!555045 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220953 () Bool)

(declare-fun res!810612 () Bool)

(declare-fun e!693363 () Bool)

(assert (=> b!1220953 (=> (not res!810612) (not e!693363))))

(assert (=> b!1220953 (= res!810612 (= (select (arr!38024 _keys!1208) i!673) k0!934))))

(declare-fun b!1220954 () Bool)

(declare-fun res!810623 () Bool)

(assert (=> b!1220954 (=> (not res!810623) (not e!693363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78799 (_ BitVec 32)) Bool)

(assert (=> b!1220954 (= res!810623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220955 () Bool)

(declare-fun res!810621 () Bool)

(declare-fun e!693366 () Bool)

(assert (=> b!1220955 (=> (not res!810621) (not e!693366))))

(declare-datatypes ((List!26837 0))(
  ( (Nil!26834) (Cons!26833 (h!28051 (_ BitVec 64)) (t!40096 List!26837)) )
))
(declare-fun arrayNoDuplicates!0 (array!78799 (_ BitVec 32) List!26837) Bool)

(assert (=> b!1220955 (= res!810621 (arrayNoDuplicates!0 lt!555038 #b00000000000000000000000000000000 Nil!26834))))

(declare-fun b!1220956 () Bool)

(declare-fun e!693359 () Bool)

(declare-fun tp_is_empty!30991 () Bool)

(assert (=> b!1220956 (= e!693359 tp_is_empty!30991)))

(declare-fun b!1220957 () Bool)

(declare-fun e!693361 () Bool)

(declare-fun e!693367 () Bool)

(assert (=> b!1220957 (= e!693361 e!693367)))

(declare-fun res!810615 () Bool)

(assert (=> b!1220957 (=> res!810615 e!693367)))

(assert (=> b!1220957 (= res!810615 (not (= (select (arr!38024 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693356 () Bool)

(assert (=> b!1220957 e!693356))

(declare-fun res!810625 () Bool)

(assert (=> b!1220957 (=> (not res!810625) (not e!693356))))

(declare-fun lt!555042 () ListLongMap!18003)

(declare-fun +!4127 (ListLongMap!18003 tuple2!20026) ListLongMap!18003)

(declare-fun get!19435 (ValueCell!14786 V!46449) V!46449)

(assert (=> b!1220957 (= res!810625 (= lt!555043 (+!4127 lt!555042 (tuple2!20027 (select (arr!38024 _keys!1208) from!1455) (get!19435 (select (arr!38025 _values!996) from!1455) lt!555044)))))))

(declare-fun b!1220958 () Bool)

(declare-fun res!810611 () Bool)

(assert (=> b!1220958 (=> (not res!810611) (not e!693363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220958 (= res!810611 (validKeyInArray!0 k0!934))))

(declare-fun b!1220959 () Bool)

(assert (=> b!1220959 (= e!693357 e!693361)))

(declare-fun res!810624 () Bool)

(assert (=> b!1220959 (=> res!810624 e!693361)))

(assert (=> b!1220959 (= res!810624 (not (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455))))))

(declare-fun lt!555037 () ListLongMap!18003)

(assert (=> b!1220959 (= lt!555037 lt!555042)))

(declare-fun lt!555035 () ListLongMap!18003)

(declare-fun -!1903 (ListLongMap!18003 (_ BitVec 64)) ListLongMap!18003)

(assert (=> b!1220959 (= lt!555042 (-!1903 lt!555035 k0!934))))

(assert (=> b!1220959 (= lt!555037 (getCurrentListMapNoExtraKeys!5472 lt!555038 lt!555039 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220959 (= lt!555035 (getCurrentListMapNoExtraKeys!5472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40392 0))(
  ( (Unit!40393) )
))
(declare-fun lt!555041 () Unit!40392)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1118 (array!78799 array!78801 (_ BitVec 32) (_ BitVec 32) V!46449 V!46449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40392)

(assert (=> b!1220959 (= lt!555041 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1118 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220960 () Bool)

(assert (=> b!1220960 (= e!693367 true)))

(assert (=> b!1220960 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555036 () Unit!40392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78799 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40392)

(assert (=> b!1220960 (= lt!555036 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220961 () Bool)

(declare-fun e!693362 () Bool)

(assert (=> b!1220961 (= e!693362 tp_is_empty!30991)))

(declare-fun b!1220962 () Bool)

(assert (=> b!1220962 (= e!693356 e!693364)))

(declare-fun res!810616 () Bool)

(assert (=> b!1220962 (=> res!810616 e!693364)))

(assert (=> b!1220962 (= res!810616 (not (= (select (arr!38024 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220963 () Bool)

(declare-fun res!810620 () Bool)

(assert (=> b!1220963 (=> (not res!810620) (not e!693363))))

(assert (=> b!1220963 (= res!810620 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38561 _keys!1208))))))

(declare-fun b!1220964 () Bool)

(declare-fun res!810614 () Bool)

(assert (=> b!1220964 (=> (not res!810614) (not e!693363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220964 (= res!810614 (validMask!0 mask!1564))))

(declare-fun b!1220965 () Bool)

(declare-fun res!810622 () Bool)

(assert (=> b!1220965 (=> (not res!810622) (not e!693363))))

(assert (=> b!1220965 (= res!810622 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26834))))

(declare-fun b!1220966 () Bool)

(assert (=> b!1220966 (= e!693366 (not e!693358))))

(declare-fun res!810613 () Bool)

(assert (=> b!1220966 (=> res!810613 e!693358)))

(assert (=> b!1220966 (= res!810613 (bvsgt from!1455 i!673))))

(assert (=> b!1220966 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555040 () Unit!40392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78799 (_ BitVec 64) (_ BitVec 32)) Unit!40392)

(assert (=> b!1220966 (= lt!555040 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220967 () Bool)

(declare-fun res!810618 () Bool)

(assert (=> b!1220967 (=> (not res!810618) (not e!693363))))

(assert (=> b!1220967 (= res!810618 (and (= (size!38562 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38561 _keys!1208) (size!38562 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220968 () Bool)

(assert (=> b!1220968 (= e!693363 e!693366)))

(declare-fun res!810619 () Bool)

(assert (=> b!1220968 (=> (not res!810619) (not e!693366))))

(assert (=> b!1220968 (= res!810619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555038 mask!1564))))

(assert (=> b!1220968 (= lt!555038 (array!78800 (store (arr!38024 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38561 _keys!1208)))))

(declare-fun res!810626 () Bool)

(assert (=> start!101706 (=> (not res!810626) (not e!693363))))

(assert (=> start!101706 (= res!810626 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38561 _keys!1208))))))

(assert (=> start!101706 e!693363))

(assert (=> start!101706 tp_is_empty!30991))

(declare-fun array_inv!29010 (array!78799) Bool)

(assert (=> start!101706 (array_inv!29010 _keys!1208)))

(assert (=> start!101706 true))

(assert (=> start!101706 tp!91895))

(declare-fun e!693360 () Bool)

(declare-fun array_inv!29011 (array!78801) Bool)

(assert (=> start!101706 (and (array_inv!29011 _values!996) e!693360)))

(declare-fun mapIsEmpty!48373 () Bool)

(declare-fun mapRes!48373 () Bool)

(assert (=> mapIsEmpty!48373 mapRes!48373))

(declare-fun mapNonEmpty!48373 () Bool)

(declare-fun tp!91894 () Bool)

(assert (=> mapNonEmpty!48373 (= mapRes!48373 (and tp!91894 e!693362))))

(declare-fun mapKey!48373 () (_ BitVec 32))

(declare-fun mapRest!48373 () (Array (_ BitVec 32) ValueCell!14786))

(declare-fun mapValue!48373 () ValueCell!14786)

(assert (=> mapNonEmpty!48373 (= (arr!38025 _values!996) (store mapRest!48373 mapKey!48373 mapValue!48373))))

(declare-fun b!1220969 () Bool)

(assert (=> b!1220969 (= e!693360 (and e!693359 mapRes!48373))))

(declare-fun condMapEmpty!48373 () Bool)

(declare-fun mapDefault!48373 () ValueCell!14786)

(assert (=> b!1220969 (= condMapEmpty!48373 (= (arr!38025 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14786)) mapDefault!48373)))))

(assert (= (and start!101706 res!810626) b!1220964))

(assert (= (and b!1220964 res!810614) b!1220967))

(assert (= (and b!1220967 res!810618) b!1220954))

(assert (= (and b!1220954 res!810623) b!1220965))

(assert (= (and b!1220965 res!810622) b!1220963))

(assert (= (and b!1220963 res!810620) b!1220958))

(assert (= (and b!1220958 res!810611) b!1220953))

(assert (= (and b!1220953 res!810612) b!1220968))

(assert (= (and b!1220968 res!810619) b!1220955))

(assert (= (and b!1220955 res!810621) b!1220966))

(assert (= (and b!1220966 (not res!810613)) b!1220952))

(assert (= (and b!1220952 (not res!810617)) b!1220959))

(assert (= (and b!1220959 (not res!810624)) b!1220957))

(assert (= (and b!1220957 res!810625) b!1220962))

(assert (= (and b!1220962 (not res!810616)) b!1220951))

(assert (= (and b!1220957 (not res!810615)) b!1220960))

(assert (= (and b!1220969 condMapEmpty!48373) mapIsEmpty!48373))

(assert (= (and b!1220969 (not condMapEmpty!48373)) mapNonEmpty!48373))

(get-info :version)

(assert (= (and mapNonEmpty!48373 ((_ is ValueCellFull!14786) mapValue!48373)) b!1220961))

(assert (= (and b!1220969 ((_ is ValueCellFull!14786) mapDefault!48373)) b!1220956))

(assert (= start!101706 b!1220969))

(declare-fun b_lambda!22109 () Bool)

(assert (=> (not b_lambda!22109) (not b!1220952)))

(declare-fun t!40094 () Bool)

(declare-fun tb!11079 () Bool)

(assert (=> (and start!101706 (= defaultEntry!1004 defaultEntry!1004) t!40094) tb!11079))

(declare-fun result!22771 () Bool)

(assert (=> tb!11079 (= result!22771 tp_is_empty!30991)))

(assert (=> b!1220952 t!40094))

(declare-fun b_and!43767 () Bool)

(assert (= b_and!43765 (and (=> t!40094 result!22771) b_and!43767)))

(declare-fun m!1126031 () Bool)

(assert (=> b!1220958 m!1126031))

(declare-fun m!1126033 () Bool)

(assert (=> b!1220952 m!1126033))

(declare-fun m!1126035 () Bool)

(assert (=> b!1220952 m!1126035))

(declare-fun m!1126037 () Bool)

(assert (=> b!1220952 m!1126037))

(declare-fun m!1126039 () Bool)

(assert (=> b!1220952 m!1126039))

(declare-fun m!1126041 () Bool)

(assert (=> start!101706 m!1126041))

(declare-fun m!1126043 () Bool)

(assert (=> start!101706 m!1126043))

(declare-fun m!1126045 () Bool)

(assert (=> b!1220960 m!1126045))

(declare-fun m!1126047 () Bool)

(assert (=> b!1220960 m!1126047))

(declare-fun m!1126049 () Bool)

(assert (=> b!1220965 m!1126049))

(declare-fun m!1126051 () Bool)

(assert (=> b!1220964 m!1126051))

(declare-fun m!1126053 () Bool)

(assert (=> b!1220957 m!1126053))

(declare-fun m!1126055 () Bool)

(assert (=> b!1220957 m!1126055))

(assert (=> b!1220957 m!1126055))

(declare-fun m!1126057 () Bool)

(assert (=> b!1220957 m!1126057))

(declare-fun m!1126059 () Bool)

(assert (=> b!1220957 m!1126059))

(declare-fun m!1126061 () Bool)

(assert (=> b!1220954 m!1126061))

(declare-fun m!1126063 () Bool)

(assert (=> b!1220953 m!1126063))

(declare-fun m!1126065 () Bool)

(assert (=> b!1220966 m!1126065))

(declare-fun m!1126067 () Bool)

(assert (=> b!1220966 m!1126067))

(assert (=> b!1220962 m!1126053))

(declare-fun m!1126069 () Bool)

(assert (=> b!1220955 m!1126069))

(declare-fun m!1126071 () Bool)

(assert (=> b!1220959 m!1126071))

(declare-fun m!1126073 () Bool)

(assert (=> b!1220959 m!1126073))

(declare-fun m!1126075 () Bool)

(assert (=> b!1220959 m!1126075))

(assert (=> b!1220959 m!1126053))

(declare-fun m!1126077 () Bool)

(assert (=> b!1220959 m!1126077))

(declare-fun m!1126079 () Bool)

(assert (=> b!1220959 m!1126079))

(assert (=> b!1220959 m!1126053))

(declare-fun m!1126081 () Bool)

(assert (=> b!1220968 m!1126081))

(declare-fun m!1126083 () Bool)

(assert (=> b!1220968 m!1126083))

(declare-fun m!1126085 () Bool)

(assert (=> b!1220951 m!1126085))

(declare-fun m!1126087 () Bool)

(assert (=> mapNonEmpty!48373 m!1126087))

(check-sat (not b!1220955) (not b!1220959) (not b!1220960) (not mapNonEmpty!48373) (not b!1220954) (not b!1220968) (not b!1220957) (not b!1220951) (not b!1220958) (not start!101706) (not b!1220966) (not b!1220952) (not b!1220964) (not b_lambda!22109) b_and!43767 tp_is_empty!30991 (not b_next!26287) (not b!1220965))
(check-sat b_and!43767 (not b_next!26287))
