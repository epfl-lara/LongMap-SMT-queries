; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99784 () Bool)

(assert start!99784)

(declare-fun b_free!25363 () Bool)

(declare-fun b_next!25363 () Bool)

(assert (=> start!99784 (= b_free!25363 (not b_next!25363))))

(declare-fun tp!88803 () Bool)

(declare-fun b_and!41593 () Bool)

(assert (=> start!99784 (= tp!88803 b_and!41593)))

(declare-fun b!1185539 () Bool)

(declare-datatypes ((Unit!39276 0))(
  ( (Unit!39277) )
))
(declare-fun e!674069 () Unit!39276)

(declare-fun Unit!39278 () Unit!39276)

(assert (=> b!1185539 (= e!674069 Unit!39278)))

(declare-datatypes ((array!76583 0))(
  ( (array!76584 (arr!36941 (Array (_ BitVec 32) (_ BitVec 64))) (size!37477 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76583)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538115 () Unit!39276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39276)

(assert (=> b!1185539 (= lt!538115 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185539 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538112 () Unit!39276)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76583 (_ BitVec 32) (_ BitVec 32)) Unit!39276)

(assert (=> b!1185539 (= lt!538112 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25986 0))(
  ( (Nil!25983) (Cons!25982 (h!27191 (_ BitVec 64)) (t!38341 List!25986)) )
))
(declare-fun arrayNoDuplicates!0 (array!76583 (_ BitVec 32) List!25986) Bool)

(assert (=> b!1185539 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25983)))

(declare-fun lt!538116 () Unit!39276)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76583 (_ BitVec 64) (_ BitVec 32) List!25986) Unit!39276)

(assert (=> b!1185539 (= lt!538116 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25983))))

(assert (=> b!1185539 false))

(declare-fun b!1185540 () Bool)

(declare-fun e!674073 () Bool)

(declare-fun e!674072 () Bool)

(assert (=> b!1185540 (= e!674073 (not e!674072))))

(declare-fun res!788070 () Bool)

(assert (=> b!1185540 (=> res!788070 e!674072)))

(assert (=> b!1185540 (= res!788070 (bvsgt from!1455 i!673))))

(assert (=> b!1185540 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538106 () Unit!39276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76583 (_ BitVec 64) (_ BitVec 32)) Unit!39276)

(assert (=> b!1185540 (= lt!538106 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185541 () Bool)

(declare-fun res!788082 () Bool)

(declare-fun e!674068 () Bool)

(assert (=> b!1185541 (=> (not res!788082) (not e!674068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185541 (= res!788082 (validKeyInArray!0 k!934))))

(declare-fun b!1185542 () Bool)

(declare-fun Unit!39279 () Unit!39276)

(assert (=> b!1185542 (= e!674069 Unit!39279)))

(declare-fun b!1185543 () Bool)

(declare-fun res!788078 () Bool)

(assert (=> b!1185543 (=> (not res!788078) (not e!674068))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76583 (_ BitVec 32)) Bool)

(assert (=> b!1185543 (= res!788078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185544 () Bool)

(declare-fun res!788073 () Bool)

(assert (=> b!1185544 (=> (not res!788073) (not e!674073))))

(declare-fun lt!538098 () array!76583)

(assert (=> b!1185544 (= res!788073 (arrayNoDuplicates!0 lt!538098 #b00000000000000000000000000000000 Nil!25983))))

(declare-fun b!1185546 () Bool)

(declare-fun res!788077 () Bool)

(assert (=> b!1185546 (=> (not res!788077) (not e!674068))))

(assert (=> b!1185546 (= res!788077 (= (select (arr!36941 _keys!1208) i!673) k!934))))

(declare-fun b!1185547 () Bool)

(declare-fun e!674063 () Bool)

(declare-fun tp_is_empty!29893 () Bool)

(assert (=> b!1185547 (= e!674063 tp_is_empty!29893)))

(declare-fun b!1185548 () Bool)

(assert (=> b!1185548 (= e!674068 e!674073)))

(declare-fun res!788081 () Bool)

(assert (=> b!1185548 (=> (not res!788081) (not e!674073))))

(assert (=> b!1185548 (= res!788081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538098 mask!1564))))

(assert (=> b!1185548 (= lt!538098 (array!76584 (store (arr!36941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37477 _keys!1208)))))

(declare-fun mapNonEmpty!46667 () Bool)

(declare-fun mapRes!46667 () Bool)

(declare-fun tp!88802 () Bool)

(declare-fun e!674066 () Bool)

(assert (=> mapNonEmpty!46667 (= mapRes!46667 (and tp!88802 e!674066))))

(declare-datatypes ((V!44985 0))(
  ( (V!44986 (val!15003 Int)) )
))
(declare-datatypes ((ValueCell!14237 0))(
  ( (ValueCellFull!14237 (v!17641 V!44985)) (EmptyCell!14237) )
))
(declare-fun mapRest!46667 () (Array (_ BitVec 32) ValueCell!14237))

(declare-fun mapKey!46667 () (_ BitVec 32))

(declare-fun mapValue!46667 () ValueCell!14237)

(declare-datatypes ((array!76585 0))(
  ( (array!76586 (arr!36942 (Array (_ BitVec 32) ValueCell!14237)) (size!37478 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76585)

(assert (=> mapNonEmpty!46667 (= (arr!36942 _values!996) (store mapRest!46667 mapKey!46667 mapValue!46667))))

(declare-fun b!1185549 () Bool)

(declare-fun e!674067 () Bool)

(declare-fun e!674074 () Bool)

(assert (=> b!1185549 (= e!674067 e!674074)))

(declare-fun res!788069 () Bool)

(assert (=> b!1185549 (=> res!788069 e!674074)))

(assert (=> b!1185549 (= res!788069 (not (= (select (arr!36941 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!46667 () Bool)

(assert (=> mapIsEmpty!46667 mapRes!46667))

(declare-fun b!1185550 () Bool)

(assert (=> b!1185550 (= e!674066 tp_is_empty!29893)))

(declare-fun b!1185551 () Bool)

(declare-fun res!788079 () Bool)

(assert (=> b!1185551 (=> (not res!788079) (not e!674068))))

(assert (=> b!1185551 (= res!788079 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25983))))

(declare-fun b!1185552 () Bool)

(declare-fun res!788074 () Bool)

(assert (=> b!1185552 (=> (not res!788074) (not e!674068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185552 (= res!788074 (validMask!0 mask!1564))))

(declare-fun res!788076 () Bool)

(assert (=> start!99784 (=> (not res!788076) (not e!674068))))

(assert (=> start!99784 (= res!788076 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37477 _keys!1208))))))

(assert (=> start!99784 e!674068))

(assert (=> start!99784 tp_is_empty!29893))

(declare-fun array_inv!28192 (array!76583) Bool)

(assert (=> start!99784 (array_inv!28192 _keys!1208)))

(assert (=> start!99784 true))

(assert (=> start!99784 tp!88803))

(declare-fun e!674065 () Bool)

(declare-fun array_inv!28193 (array!76585) Bool)

(assert (=> start!99784 (and (array_inv!28193 _values!996) e!674065)))

(declare-fun b!1185545 () Bool)

(declare-fun e!674070 () Bool)

(declare-fun e!674064 () Bool)

(assert (=> b!1185545 (= e!674070 e!674064)))

(declare-fun res!788072 () Bool)

(assert (=> b!1185545 (=> res!788072 e!674064)))

(assert (=> b!1185545 (= res!788072 (not (validKeyInArray!0 (select (arr!36941 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19246 0))(
  ( (tuple2!19247 (_1!9634 (_ BitVec 64)) (_2!9634 V!44985)) )
))
(declare-datatypes ((List!25987 0))(
  ( (Nil!25984) (Cons!25983 (h!27192 tuple2!19246) (t!38342 List!25987)) )
))
(declare-datatypes ((ListLongMap!17215 0))(
  ( (ListLongMap!17216 (toList!8623 List!25987)) )
))
(declare-fun lt!538109 () ListLongMap!17215)

(declare-fun lt!538110 () ListLongMap!17215)

(assert (=> b!1185545 (= lt!538109 lt!538110)))

(declare-fun lt!538103 () ListLongMap!17215)

(declare-fun -!1657 (ListLongMap!17215 (_ BitVec 64)) ListLongMap!17215)

(assert (=> b!1185545 (= lt!538110 (-!1657 lt!538103 k!934))))

(declare-fun zeroValue!944 () V!44985)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!538114 () array!76585)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44985)

(declare-fun getCurrentListMapNoExtraKeys!5069 (array!76583 array!76585 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) Int) ListLongMap!17215)

(assert (=> b!1185545 (= lt!538109 (getCurrentListMapNoExtraKeys!5069 lt!538098 lt!538114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185545 (= lt!538103 (getCurrentListMapNoExtraKeys!5069 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538113 () Unit!39276)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!873 (array!76583 array!76585 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39276)

(assert (=> b!1185545 (= lt!538113 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!873 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185553 () Bool)

(assert (=> b!1185553 (= e!674074 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185554 () Bool)

(assert (=> b!1185554 (= e!674064 true)))

(declare-fun lt!538104 () ListLongMap!17215)

(declare-fun lt!538108 () ListLongMap!17215)

(assert (=> b!1185554 (= (-!1657 lt!538104 k!934) lt!538108)))

(declare-fun lt!538102 () Unit!39276)

(declare-fun lt!538099 () V!44985)

(declare-fun addRemoveCommutativeForDiffKeys!182 (ListLongMap!17215 (_ BitVec 64) V!44985 (_ BitVec 64)) Unit!39276)

(assert (=> b!1185554 (= lt!538102 (addRemoveCommutativeForDiffKeys!182 lt!538103 (select (arr!36941 _keys!1208) from!1455) lt!538099 k!934))))

(declare-fun lt!538107 () ListLongMap!17215)

(assert (=> b!1185554 (and (= lt!538107 lt!538104) (= lt!538110 lt!538109))))

(declare-fun lt!538101 () tuple2!19246)

(declare-fun +!3919 (ListLongMap!17215 tuple2!19246) ListLongMap!17215)

(assert (=> b!1185554 (= lt!538104 (+!3919 lt!538103 lt!538101))))

(assert (=> b!1185554 (not (= (select (arr!36941 _keys!1208) from!1455) k!934))))

(declare-fun lt!538111 () Unit!39276)

(assert (=> b!1185554 (= lt!538111 e!674069)))

(declare-fun c!117168 () Bool)

(assert (=> b!1185554 (= c!117168 (= (select (arr!36941 _keys!1208) from!1455) k!934))))

(assert (=> b!1185554 e!674067))

(declare-fun res!788080 () Bool)

(assert (=> b!1185554 (=> (not res!788080) (not e!674067))))

(declare-fun lt!538105 () ListLongMap!17215)

(assert (=> b!1185554 (= res!788080 (= lt!538105 lt!538108))))

(assert (=> b!1185554 (= lt!538108 (+!3919 lt!538110 lt!538101))))

(assert (=> b!1185554 (= lt!538101 (tuple2!19247 (select (arr!36941 _keys!1208) from!1455) lt!538099))))

(declare-fun lt!538100 () V!44985)

(declare-fun get!18914 (ValueCell!14237 V!44985) V!44985)

(assert (=> b!1185554 (= lt!538099 (get!18914 (select (arr!36942 _values!996) from!1455) lt!538100))))

(declare-fun b!1185555 () Bool)

(declare-fun res!788071 () Bool)

(assert (=> b!1185555 (=> (not res!788071) (not e!674068))))

(assert (=> b!1185555 (= res!788071 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37477 _keys!1208))))))

(declare-fun b!1185556 () Bool)

(declare-fun res!788083 () Bool)

(assert (=> b!1185556 (=> (not res!788083) (not e!674068))))

(assert (=> b!1185556 (= res!788083 (and (= (size!37478 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37477 _keys!1208) (size!37478 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185557 () Bool)

(assert (=> b!1185557 (= e!674072 e!674070)))

(declare-fun res!788075 () Bool)

(assert (=> b!1185557 (=> res!788075 e!674070)))

(assert (=> b!1185557 (= res!788075 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185557 (= lt!538105 (getCurrentListMapNoExtraKeys!5069 lt!538098 lt!538114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185557 (= lt!538114 (array!76586 (store (arr!36942 _values!996) i!673 (ValueCellFull!14237 lt!538100)) (size!37478 _values!996)))))

(declare-fun dynLambda!3020 (Int (_ BitVec 64)) V!44985)

(assert (=> b!1185557 (= lt!538100 (dynLambda!3020 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185557 (= lt!538107 (getCurrentListMapNoExtraKeys!5069 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185558 () Bool)

(assert (=> b!1185558 (= e!674065 (and e!674063 mapRes!46667))))

(declare-fun condMapEmpty!46667 () Bool)

(declare-fun mapDefault!46667 () ValueCell!14237)

