; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101626 () Bool)

(assert start!101626)

(declare-fun b_free!26353 () Bool)

(declare-fun b_next!26353 () Bool)

(assert (=> start!101626 (= b_free!26353 (not b_next!26353))))

(declare-fun tp!92101 () Bool)

(declare-fun b_and!43931 () Bool)

(assert (=> start!101626 (= tp!92101 b_and!43931)))

(declare-fun res!811945 () Bool)

(declare-fun e!694016 () Bool)

(assert (=> start!101626 (=> (not res!811945) (not e!694016))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78818 0))(
  ( (array!78819 (arr!38037 (Array (_ BitVec 32) (_ BitVec 64))) (size!38575 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78818)

(assert (=> start!101626 (= res!811945 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38575 _keys!1208))))))

(assert (=> start!101626 e!694016))

(declare-fun tp_is_empty!31057 () Bool)

(assert (=> start!101626 tp_is_empty!31057))

(declare-fun array_inv!29068 (array!78818) Bool)

(assert (=> start!101626 (array_inv!29068 _keys!1208)))

(assert (=> start!101626 true))

(assert (=> start!101626 tp!92101))

(declare-datatypes ((V!46537 0))(
  ( (V!46538 (val!15585 Int)) )
))
(declare-datatypes ((ValueCell!14819 0))(
  ( (ValueCellFull!14819 (v!18245 V!46537)) (EmptyCell!14819) )
))
(declare-datatypes ((array!78820 0))(
  ( (array!78821 (arr!38038 (Array (_ BitVec 32) ValueCell!14819)) (size!38576 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78820)

(declare-fun e!694022 () Bool)

(declare-fun array_inv!29069 (array!78820) Bool)

(assert (=> start!101626 (and (array_inv!29069 _values!996) e!694022)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1222068 () Bool)

(declare-fun e!694017 () Bool)

(declare-fun arrayContainsKey!0 (array!78818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222068 (= e!694017 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222069 () Bool)

(declare-fun e!694018 () Bool)

(declare-fun mapRes!48481 () Bool)

(assert (=> b!1222069 (= e!694022 (and e!694018 mapRes!48481))))

(declare-fun condMapEmpty!48481 () Bool)

(declare-fun mapDefault!48481 () ValueCell!14819)

(assert (=> b!1222069 (= condMapEmpty!48481 (= (arr!38038 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14819)) mapDefault!48481)))))

(declare-fun b!1222070 () Bool)

(declare-fun res!811937 () Bool)

(assert (=> b!1222070 (=> (not res!811937) (not e!694016))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222070 (= res!811937 (validMask!0 mask!1564))))

(declare-fun b!1222071 () Bool)

(declare-fun res!811950 () Bool)

(assert (=> b!1222071 (=> (not res!811950) (not e!694016))))

(declare-datatypes ((List!26932 0))(
  ( (Nil!26929) (Cons!26928 (h!28137 (_ BitVec 64)) (t!40256 List!26932)) )
))
(declare-fun arrayNoDuplicates!0 (array!78818 (_ BitVec 32) List!26932) Bool)

(assert (=> b!1222071 (= res!811950 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26929))))

(declare-fun b!1222072 () Bool)

(declare-fun res!811943 () Bool)

(assert (=> b!1222072 (=> (not res!811943) (not e!694016))))

(assert (=> b!1222072 (= res!811943 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38575 _keys!1208))))))

(declare-fun b!1222073 () Bool)

(declare-fun e!694019 () Bool)

(declare-fun e!694015 () Bool)

(assert (=> b!1222073 (= e!694019 (not e!694015))))

(declare-fun res!811951 () Bool)

(assert (=> b!1222073 (=> res!811951 e!694015)))

(assert (=> b!1222073 (= res!811951 (bvsgt from!1455 i!673))))

(assert (=> b!1222073 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40323 0))(
  ( (Unit!40324) )
))
(declare-fun lt!555817 () Unit!40323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78818 (_ BitVec 64) (_ BitVec 32)) Unit!40323)

(assert (=> b!1222073 (= lt!555817 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222074 () Bool)

(declare-fun e!694024 () Bool)

(assert (=> b!1222074 (= e!694015 e!694024)))

(declare-fun res!811938 () Bool)

(assert (=> b!1222074 (=> res!811938 e!694024)))

(assert (=> b!1222074 (= res!811938 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46537)

(declare-fun lt!555815 () array!78818)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555814 () array!78820)

(declare-fun minValue!944 () V!46537)

(declare-datatypes ((tuple2!20154 0))(
  ( (tuple2!20155 (_1!10088 (_ BitVec 64)) (_2!10088 V!46537)) )
))
(declare-datatypes ((List!26933 0))(
  ( (Nil!26930) (Cons!26929 (h!28138 tuple2!20154) (t!40257 List!26933)) )
))
(declare-datatypes ((ListLongMap!18123 0))(
  ( (ListLongMap!18124 (toList!9077 List!26933)) )
))
(declare-fun lt!555820 () ListLongMap!18123)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5511 (array!78818 array!78820 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) Int) ListLongMap!18123)

(assert (=> b!1222074 (= lt!555820 (getCurrentListMapNoExtraKeys!5511 lt!555815 lt!555814 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555821 () V!46537)

(assert (=> b!1222074 (= lt!555814 (array!78821 (store (arr!38038 _values!996) i!673 (ValueCellFull!14819 lt!555821)) (size!38576 _values!996)))))

(declare-fun dynLambda!3359 (Int (_ BitVec 64)) V!46537)

(assert (=> b!1222074 (= lt!555821 (dynLambda!3359 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555824 () ListLongMap!18123)

(assert (=> b!1222074 (= lt!555824 (getCurrentListMapNoExtraKeys!5511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222075 () Bool)

(declare-fun e!694025 () Bool)

(declare-fun e!694020 () Bool)

(assert (=> b!1222075 (= e!694025 e!694020)))

(declare-fun res!811944 () Bool)

(assert (=> b!1222075 (=> res!811944 e!694020)))

(assert (=> b!1222075 (= res!811944 (not (= (select (arr!38037 _keys!1208) from!1455) k0!934)))))

(declare-fun e!694021 () Bool)

(assert (=> b!1222075 e!694021))

(declare-fun res!811942 () Bool)

(assert (=> b!1222075 (=> (not res!811942) (not e!694021))))

(declare-fun lt!555819 () ListLongMap!18123)

(declare-fun +!4139 (ListLongMap!18123 tuple2!20154) ListLongMap!18123)

(declare-fun get!19430 (ValueCell!14819 V!46537) V!46537)

(assert (=> b!1222075 (= res!811942 (= lt!555820 (+!4139 lt!555819 (tuple2!20155 (select (arr!38037 _keys!1208) from!1455) (get!19430 (select (arr!38038 _values!996) from!1455) lt!555821)))))))

(declare-fun b!1222076 () Bool)

(declare-fun e!694026 () Bool)

(assert (=> b!1222076 (= e!694026 tp_is_empty!31057)))

(declare-fun b!1222077 () Bool)

(assert (=> b!1222077 (= e!694016 e!694019)))

(declare-fun res!811940 () Bool)

(assert (=> b!1222077 (=> (not res!811940) (not e!694019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78818 (_ BitVec 32)) Bool)

(assert (=> b!1222077 (= res!811940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555815 mask!1564))))

(assert (=> b!1222077 (= lt!555815 (array!78819 (store (arr!38037 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38575 _keys!1208)))))

(declare-fun b!1222078 () Bool)

(assert (=> b!1222078 (= e!694020 true)))

(assert (=> b!1222078 false))

(declare-fun lt!555825 () Unit!40323)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78818 (_ BitVec 64) (_ BitVec 32) List!26932) Unit!40323)

(assert (=> b!1222078 (= lt!555825 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26929))))

(assert (=> b!1222078 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26929)))

(declare-fun lt!555818 () Unit!40323)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78818 (_ BitVec 32) (_ BitVec 32)) Unit!40323)

(assert (=> b!1222078 (= lt!555818 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222078 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555816 () Unit!40323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78818 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40323)

(assert (=> b!1222078 (= lt!555816 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222079 () Bool)

(declare-fun res!811941 () Bool)

(assert (=> b!1222079 (=> (not res!811941) (not e!694016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222079 (= res!811941 (validKeyInArray!0 k0!934))))

(declare-fun b!1222080 () Bool)

(assert (=> b!1222080 (= e!694024 e!694025)))

(declare-fun res!811946 () Bool)

(assert (=> b!1222080 (=> res!811946 e!694025)))

(assert (=> b!1222080 (= res!811946 (not (validKeyInArray!0 (select (arr!38037 _keys!1208) from!1455))))))

(declare-fun lt!555813 () ListLongMap!18123)

(assert (=> b!1222080 (= lt!555813 lt!555819)))

(declare-fun lt!555823 () ListLongMap!18123)

(declare-fun -!1903 (ListLongMap!18123 (_ BitVec 64)) ListLongMap!18123)

(assert (=> b!1222080 (= lt!555819 (-!1903 lt!555823 k0!934))))

(assert (=> b!1222080 (= lt!555813 (getCurrentListMapNoExtraKeys!5511 lt!555815 lt!555814 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222080 (= lt!555823 (getCurrentListMapNoExtraKeys!5511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555822 () Unit!40323)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 (array!78818 array!78820 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40323)

(assert (=> b!1222080 (= lt!555822 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1138 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48481 () Bool)

(declare-fun tp!92102 () Bool)

(assert (=> mapNonEmpty!48481 (= mapRes!48481 (and tp!92102 e!694026))))

(declare-fun mapValue!48481 () ValueCell!14819)

(declare-fun mapRest!48481 () (Array (_ BitVec 32) ValueCell!14819))

(declare-fun mapKey!48481 () (_ BitVec 32))

(assert (=> mapNonEmpty!48481 (= (arr!38038 _values!996) (store mapRest!48481 mapKey!48481 mapValue!48481))))

(declare-fun b!1222081 () Bool)

(declare-fun res!811949 () Bool)

(assert (=> b!1222081 (=> (not res!811949) (not e!694019))))

(assert (=> b!1222081 (= res!811949 (arrayNoDuplicates!0 lt!555815 #b00000000000000000000000000000000 Nil!26929))))

(declare-fun b!1222082 () Bool)

(declare-fun res!811947 () Bool)

(assert (=> b!1222082 (=> (not res!811947) (not e!694016))))

(assert (=> b!1222082 (= res!811947 (= (select (arr!38037 _keys!1208) i!673) k0!934))))

(declare-fun b!1222083 () Bool)

(assert (=> b!1222083 (= e!694018 tp_is_empty!31057)))

(declare-fun b!1222084 () Bool)

(declare-fun res!811939 () Bool)

(assert (=> b!1222084 (=> (not res!811939) (not e!694016))))

(assert (=> b!1222084 (= res!811939 (and (= (size!38576 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38575 _keys!1208) (size!38576 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48481 () Bool)

(assert (=> mapIsEmpty!48481 mapRes!48481))

(declare-fun b!1222085 () Bool)

(assert (=> b!1222085 (= e!694021 e!694017)))

(declare-fun res!811936 () Bool)

(assert (=> b!1222085 (=> res!811936 e!694017)))

(assert (=> b!1222085 (= res!811936 (not (= (select (arr!38037 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222086 () Bool)

(declare-fun res!811948 () Bool)

(assert (=> b!1222086 (=> (not res!811948) (not e!694016))))

(assert (=> b!1222086 (= res!811948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!101626 res!811945) b!1222070))

(assert (= (and b!1222070 res!811937) b!1222084))

(assert (= (and b!1222084 res!811939) b!1222086))

(assert (= (and b!1222086 res!811948) b!1222071))

(assert (= (and b!1222071 res!811950) b!1222072))

(assert (= (and b!1222072 res!811943) b!1222079))

(assert (= (and b!1222079 res!811941) b!1222082))

(assert (= (and b!1222082 res!811947) b!1222077))

(assert (= (and b!1222077 res!811940) b!1222081))

(assert (= (and b!1222081 res!811949) b!1222073))

(assert (= (and b!1222073 (not res!811951)) b!1222074))

(assert (= (and b!1222074 (not res!811938)) b!1222080))

(assert (= (and b!1222080 (not res!811946)) b!1222075))

(assert (= (and b!1222075 res!811942) b!1222085))

(assert (= (and b!1222085 (not res!811936)) b!1222068))

(assert (= (and b!1222075 (not res!811944)) b!1222078))

(assert (= (and b!1222069 condMapEmpty!48481) mapIsEmpty!48481))

(assert (= (and b!1222069 (not condMapEmpty!48481)) mapNonEmpty!48481))

(get-info :version)

(assert (= (and mapNonEmpty!48481 ((_ is ValueCellFull!14819) mapValue!48481)) b!1222076))

(assert (= (and b!1222069 ((_ is ValueCellFull!14819) mapDefault!48481)) b!1222083))

(assert (= start!101626 b!1222069))

(declare-fun b_lambda!22285 () Bool)

(assert (=> (not b_lambda!22285) (not b!1222074)))

(declare-fun t!40255 () Bool)

(declare-fun tb!11145 () Bool)

(assert (=> (and start!101626 (= defaultEntry!1004 defaultEntry!1004) t!40255) tb!11145))

(declare-fun result!22909 () Bool)

(assert (=> tb!11145 (= result!22909 tp_is_empty!31057)))

(assert (=> b!1222074 t!40255))

(declare-fun b_and!43933 () Bool)

(assert (= b_and!43931 (and (=> t!40255 result!22909) b_and!43933)))

(declare-fun m!1126529 () Bool)

(assert (=> b!1222073 m!1126529))

(declare-fun m!1126531 () Bool)

(assert (=> b!1222073 m!1126531))

(declare-fun m!1126533 () Bool)

(assert (=> start!101626 m!1126533))

(declare-fun m!1126535 () Bool)

(assert (=> start!101626 m!1126535))

(declare-fun m!1126537 () Bool)

(assert (=> mapNonEmpty!48481 m!1126537))

(declare-fun m!1126539 () Bool)

(assert (=> b!1222086 m!1126539))

(declare-fun m!1126541 () Bool)

(assert (=> b!1222082 m!1126541))

(declare-fun m!1126543 () Bool)

(assert (=> b!1222075 m!1126543))

(declare-fun m!1126545 () Bool)

(assert (=> b!1222075 m!1126545))

(assert (=> b!1222075 m!1126545))

(declare-fun m!1126547 () Bool)

(assert (=> b!1222075 m!1126547))

(declare-fun m!1126549 () Bool)

(assert (=> b!1222075 m!1126549))

(declare-fun m!1126551 () Bool)

(assert (=> b!1222068 m!1126551))

(declare-fun m!1126553 () Bool)

(assert (=> b!1222071 m!1126553))

(declare-fun m!1126555 () Bool)

(assert (=> b!1222078 m!1126555))

(declare-fun m!1126557 () Bool)

(assert (=> b!1222078 m!1126557))

(declare-fun m!1126559 () Bool)

(assert (=> b!1222078 m!1126559))

(declare-fun m!1126561 () Bool)

(assert (=> b!1222078 m!1126561))

(declare-fun m!1126563 () Bool)

(assert (=> b!1222078 m!1126563))

(declare-fun m!1126565 () Bool)

(assert (=> b!1222074 m!1126565))

(declare-fun m!1126567 () Bool)

(assert (=> b!1222074 m!1126567))

(declare-fun m!1126569 () Bool)

(assert (=> b!1222074 m!1126569))

(declare-fun m!1126571 () Bool)

(assert (=> b!1222074 m!1126571))

(declare-fun m!1126573 () Bool)

(assert (=> b!1222077 m!1126573))

(declare-fun m!1126575 () Bool)

(assert (=> b!1222077 m!1126575))

(declare-fun m!1126577 () Bool)

(assert (=> b!1222070 m!1126577))

(assert (=> b!1222085 m!1126543))

(declare-fun m!1126579 () Bool)

(assert (=> b!1222081 m!1126579))

(declare-fun m!1126581 () Bool)

(assert (=> b!1222079 m!1126581))

(declare-fun m!1126583 () Bool)

(assert (=> b!1222080 m!1126583))

(declare-fun m!1126585 () Bool)

(assert (=> b!1222080 m!1126585))

(declare-fun m!1126587 () Bool)

(assert (=> b!1222080 m!1126587))

(declare-fun m!1126589 () Bool)

(assert (=> b!1222080 m!1126589))

(assert (=> b!1222080 m!1126543))

(declare-fun m!1126591 () Bool)

(assert (=> b!1222080 m!1126591))

(assert (=> b!1222080 m!1126543))

(check-sat (not b!1222070) (not b!1222086) (not b!1222079) (not b!1222080) (not start!101626) b_and!43933 (not b!1222078) (not b_lambda!22285) (not b_next!26353) (not b!1222073) (not b!1222081) (not b!1222068) tp_is_empty!31057 (not mapNonEmpty!48481) (not b!1222074) (not b!1222077) (not b!1222075) (not b!1222071))
(check-sat b_and!43933 (not b_next!26353))
