; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101524 () Bool)

(assert start!101524)

(declare-fun b_free!26317 () Bool)

(declare-fun b_next!26317 () Bool)

(assert (=> start!101524 (= b_free!26317 (not b_next!26317))))

(declare-fun tp!91988 () Bool)

(declare-fun b_and!43823 () Bool)

(assert (=> start!101524 (= tp!91988 b_and!43823)))

(declare-fun b!1220592 () Bool)

(declare-fun e!693101 () Bool)

(declare-fun tp_is_empty!31021 () Bool)

(assert (=> b!1220592 (= e!693101 tp_is_empty!31021)))

(declare-datatypes ((array!78742 0))(
  ( (array!78743 (arr!38001 (Array (_ BitVec 32) (_ BitVec 64))) (size!38539 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78742)

(declare-fun b!1220593 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!693099 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220593 (= e!693099 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220594 () Bool)

(declare-fun e!693105 () Bool)

(assert (=> b!1220594 (= e!693105 e!693099)))

(declare-fun res!810840 () Bool)

(assert (=> b!1220594 (=> res!810840 e!693099)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220594 (= res!810840 (not (= (select (arr!38001 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220595 () Bool)

(declare-fun e!693107 () Bool)

(declare-fun e!693103 () Bool)

(declare-fun mapRes!48421 () Bool)

(assert (=> b!1220595 (= e!693107 (and e!693103 mapRes!48421))))

(declare-fun condMapEmpty!48421 () Bool)

(declare-datatypes ((V!46489 0))(
  ( (V!46490 (val!15567 Int)) )
))
(declare-datatypes ((ValueCell!14801 0))(
  ( (ValueCellFull!14801 (v!18224 V!46489)) (EmptyCell!14801) )
))
(declare-datatypes ((array!78744 0))(
  ( (array!78745 (arr!38002 (Array (_ BitVec 32) ValueCell!14801)) (size!38540 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78744)

(declare-fun mapDefault!48421 () ValueCell!14801)

(assert (=> b!1220595 (= condMapEmpty!48421 (= (arr!38002 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14801)) mapDefault!48421)))))

(declare-fun res!810845 () Bool)

(declare-fun e!693106 () Bool)

(assert (=> start!101524 (=> (not res!810845) (not e!693106))))

(assert (=> start!101524 (= res!810845 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38539 _keys!1208))))))

(assert (=> start!101524 e!693106))

(assert (=> start!101524 tp_is_empty!31021))

(declare-fun array_inv!29042 (array!78742) Bool)

(assert (=> start!101524 (array_inv!29042 _keys!1208)))

(assert (=> start!101524 true))

(assert (=> start!101524 tp!91988))

(declare-fun array_inv!29043 (array!78744) Bool)

(assert (=> start!101524 (and (array_inv!29043 _values!996) e!693107)))

(declare-fun b!1220596 () Bool)

(declare-fun res!810842 () Bool)

(assert (=> b!1220596 (=> (not res!810842) (not e!693106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220596 (= res!810842 (validKeyInArray!0 k0!934))))

(declare-fun b!1220597 () Bool)

(declare-fun res!810833 () Bool)

(assert (=> b!1220597 (=> (not res!810833) (not e!693106))))

(assert (=> b!1220597 (= res!810833 (= (select (arr!38001 _keys!1208) i!673) k0!934))))

(declare-fun b!1220598 () Bool)

(declare-fun res!810843 () Bool)

(assert (=> b!1220598 (=> (not res!810843) (not e!693106))))

(assert (=> b!1220598 (= res!810843 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38539 _keys!1208))))))

(declare-fun mapIsEmpty!48421 () Bool)

(assert (=> mapIsEmpty!48421 mapRes!48421))

(declare-fun b!1220599 () Bool)

(declare-fun e!693098 () Bool)

(declare-fun e!693100 () Bool)

(assert (=> b!1220599 (= e!693098 e!693100)))

(declare-fun res!810835 () Bool)

(assert (=> b!1220599 (=> res!810835 e!693100)))

(assert (=> b!1220599 (= res!810835 (not (= (select (arr!38001 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220599 e!693105))

(declare-fun res!810831 () Bool)

(assert (=> b!1220599 (=> (not res!810831) (not e!693105))))

(declare-datatypes ((tuple2!20122 0))(
  ( (tuple2!20123 (_1!10072 (_ BitVec 64)) (_2!10072 V!46489)) )
))
(declare-datatypes ((List!26902 0))(
  ( (Nil!26899) (Cons!26898 (h!28107 tuple2!20122) (t!40190 List!26902)) )
))
(declare-datatypes ((ListLongMap!18091 0))(
  ( (ListLongMap!18092 (toList!9061 List!26902)) )
))
(declare-fun lt!554979 () ListLongMap!18091)

(declare-fun lt!554987 () V!46489)

(declare-fun lt!554986 () ListLongMap!18091)

(declare-fun +!4125 (ListLongMap!18091 tuple2!20122) ListLongMap!18091)

(declare-fun get!19400 (ValueCell!14801 V!46489) V!46489)

(assert (=> b!1220599 (= res!810831 (= lt!554979 (+!4125 lt!554986 (tuple2!20123 (select (arr!38001 _keys!1208) from!1455) (get!19400 (select (arr!38002 _values!996) from!1455) lt!554987)))))))

(declare-fun b!1220600 () Bool)

(declare-fun e!693104 () Bool)

(declare-fun e!693108 () Bool)

(assert (=> b!1220600 (= e!693104 (not e!693108))))

(declare-fun res!810830 () Bool)

(assert (=> b!1220600 (=> res!810830 e!693108)))

(assert (=> b!1220600 (= res!810830 (bvsgt from!1455 i!673))))

(assert (=> b!1220600 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40295 0))(
  ( (Unit!40296) )
))
(declare-fun lt!554981 () Unit!40295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78742 (_ BitVec 64) (_ BitVec 32)) Unit!40295)

(assert (=> b!1220600 (= lt!554981 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220601 () Bool)

(declare-fun e!693109 () Bool)

(assert (=> b!1220601 (= e!693108 e!693109)))

(declare-fun res!810841 () Bool)

(assert (=> b!1220601 (=> res!810841 e!693109)))

(assert (=> b!1220601 (= res!810841 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!554988 () array!78742)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554989 () array!78744)

(declare-fun minValue!944 () V!46489)

(declare-fun getCurrentListMapNoExtraKeys!5498 (array!78742 array!78744 (_ BitVec 32) (_ BitVec 32) V!46489 V!46489 (_ BitVec 32) Int) ListLongMap!18091)

(assert (=> b!1220601 (= lt!554979 (getCurrentListMapNoExtraKeys!5498 lt!554988 lt!554989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220601 (= lt!554989 (array!78745 (store (arr!38002 _values!996) i!673 (ValueCellFull!14801 lt!554987)) (size!38540 _values!996)))))

(declare-fun dynLambda!3346 (Int (_ BitVec 64)) V!46489)

(assert (=> b!1220601 (= lt!554987 (dynLambda!3346 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554980 () ListLongMap!18091)

(assert (=> b!1220601 (= lt!554980 (getCurrentListMapNoExtraKeys!5498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220602 () Bool)

(assert (=> b!1220602 (= e!693106 e!693104)))

(declare-fun res!810839 () Bool)

(assert (=> b!1220602 (=> (not res!810839) (not e!693104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78742 (_ BitVec 32)) Bool)

(assert (=> b!1220602 (= res!810839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554988 mask!1564))))

(assert (=> b!1220602 (= lt!554988 (array!78743 (store (arr!38001 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38539 _keys!1208)))))

(declare-fun b!1220603 () Bool)

(declare-fun res!810837 () Bool)

(assert (=> b!1220603 (=> (not res!810837) (not e!693106))))

(assert (=> b!1220603 (= res!810837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220604 () Bool)

(assert (=> b!1220604 (= e!693109 e!693098)))

(declare-fun res!810832 () Bool)

(assert (=> b!1220604 (=> res!810832 e!693098)))

(assert (=> b!1220604 (= res!810832 (not (validKeyInArray!0 (select (arr!38001 _keys!1208) from!1455))))))

(declare-fun lt!554982 () ListLongMap!18091)

(assert (=> b!1220604 (= lt!554982 lt!554986)))

(declare-fun lt!554984 () ListLongMap!18091)

(declare-fun -!1890 (ListLongMap!18091 (_ BitVec 64)) ListLongMap!18091)

(assert (=> b!1220604 (= lt!554986 (-!1890 lt!554984 k0!934))))

(assert (=> b!1220604 (= lt!554982 (getCurrentListMapNoExtraKeys!5498 lt!554988 lt!554989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220604 (= lt!554984 (getCurrentListMapNoExtraKeys!5498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554990 () Unit!40295)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1125 (array!78742 array!78744 (_ BitVec 32) (_ BitVec 32) V!46489 V!46489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40295)

(assert (=> b!1220604 (= lt!554990 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220605 () Bool)

(assert (=> b!1220605 (= e!693100 (or (bvsge (size!38539 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38539 _keys!1208))))))

(declare-datatypes ((List!26903 0))(
  ( (Nil!26900) (Cons!26899 (h!28108 (_ BitVec 64)) (t!40191 List!26903)) )
))
(declare-fun arrayNoDuplicates!0 (array!78742 (_ BitVec 32) List!26903) Bool)

(assert (=> b!1220605 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26900)))

(declare-fun lt!554983 () Unit!40295)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78742 (_ BitVec 32) (_ BitVec 32)) Unit!40295)

(assert (=> b!1220605 (= lt!554983 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220605 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554985 () Unit!40295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40295)

(assert (=> b!1220605 (= lt!554985 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220606 () Bool)

(declare-fun res!810834 () Bool)

(assert (=> b!1220606 (=> (not res!810834) (not e!693106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220606 (= res!810834 (validMask!0 mask!1564))))

(declare-fun b!1220607 () Bool)

(declare-fun res!810844 () Bool)

(assert (=> b!1220607 (=> (not res!810844) (not e!693106))))

(assert (=> b!1220607 (= res!810844 (and (= (size!38540 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38539 _keys!1208) (size!38540 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48421 () Bool)

(declare-fun tp!91987 () Bool)

(assert (=> mapNonEmpty!48421 (= mapRes!48421 (and tp!91987 e!693101))))

(declare-fun mapValue!48421 () ValueCell!14801)

(declare-fun mapKey!48421 () (_ BitVec 32))

(declare-fun mapRest!48421 () (Array (_ BitVec 32) ValueCell!14801))

(assert (=> mapNonEmpty!48421 (= (arr!38002 _values!996) (store mapRest!48421 mapKey!48421 mapValue!48421))))

(declare-fun b!1220608 () Bool)

(assert (=> b!1220608 (= e!693103 tp_is_empty!31021)))

(declare-fun b!1220609 () Bool)

(declare-fun res!810836 () Bool)

(assert (=> b!1220609 (=> (not res!810836) (not e!693106))))

(assert (=> b!1220609 (= res!810836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26900))))

(declare-fun b!1220610 () Bool)

(declare-fun res!810838 () Bool)

(assert (=> b!1220610 (=> (not res!810838) (not e!693104))))

(assert (=> b!1220610 (= res!810838 (arrayNoDuplicates!0 lt!554988 #b00000000000000000000000000000000 Nil!26900))))

(assert (= (and start!101524 res!810845) b!1220606))

(assert (= (and b!1220606 res!810834) b!1220607))

(assert (= (and b!1220607 res!810844) b!1220603))

(assert (= (and b!1220603 res!810837) b!1220609))

(assert (= (and b!1220609 res!810836) b!1220598))

(assert (= (and b!1220598 res!810843) b!1220596))

(assert (= (and b!1220596 res!810842) b!1220597))

(assert (= (and b!1220597 res!810833) b!1220602))

(assert (= (and b!1220602 res!810839) b!1220610))

(assert (= (and b!1220610 res!810838) b!1220600))

(assert (= (and b!1220600 (not res!810830)) b!1220601))

(assert (= (and b!1220601 (not res!810841)) b!1220604))

(assert (= (and b!1220604 (not res!810832)) b!1220599))

(assert (= (and b!1220599 res!810831) b!1220594))

(assert (= (and b!1220594 (not res!810840)) b!1220593))

(assert (= (and b!1220599 (not res!810835)) b!1220605))

(assert (= (and b!1220595 condMapEmpty!48421) mapIsEmpty!48421))

(assert (= (and b!1220595 (not condMapEmpty!48421)) mapNonEmpty!48421))

(get-info :version)

(assert (= (and mapNonEmpty!48421 ((_ is ValueCellFull!14801) mapValue!48421)) b!1220592))

(assert (= (and b!1220595 ((_ is ValueCellFull!14801) mapDefault!48421)) b!1220608))

(assert (= start!101524 b!1220595))

(declare-fun b_lambda!22173 () Bool)

(assert (=> (not b_lambda!22173) (not b!1220601)))

(declare-fun t!40189 () Bool)

(declare-fun tb!11109 () Bool)

(assert (=> (and start!101524 (= defaultEntry!1004 defaultEntry!1004) t!40189) tb!11109))

(declare-fun result!22833 () Bool)

(assert (=> tb!11109 (= result!22833 tp_is_empty!31021)))

(assert (=> b!1220601 t!40189))

(declare-fun b_and!43825 () Bool)

(assert (= b_and!43823 (and (=> t!40189 result!22833) b_and!43825)))

(declare-fun m!1124967 () Bool)

(assert (=> b!1220593 m!1124967))

(declare-fun m!1124969 () Bool)

(assert (=> b!1220603 m!1124969))

(declare-fun m!1124971 () Bool)

(assert (=> b!1220599 m!1124971))

(declare-fun m!1124973 () Bool)

(assert (=> b!1220599 m!1124973))

(assert (=> b!1220599 m!1124973))

(declare-fun m!1124975 () Bool)

(assert (=> b!1220599 m!1124975))

(declare-fun m!1124977 () Bool)

(assert (=> b!1220599 m!1124977))

(declare-fun m!1124979 () Bool)

(assert (=> b!1220601 m!1124979))

(declare-fun m!1124981 () Bool)

(assert (=> b!1220601 m!1124981))

(declare-fun m!1124983 () Bool)

(assert (=> b!1220601 m!1124983))

(declare-fun m!1124985 () Bool)

(assert (=> b!1220601 m!1124985))

(declare-fun m!1124987 () Bool)

(assert (=> b!1220604 m!1124987))

(declare-fun m!1124989 () Bool)

(assert (=> b!1220604 m!1124989))

(declare-fun m!1124991 () Bool)

(assert (=> b!1220604 m!1124991))

(assert (=> b!1220604 m!1124971))

(declare-fun m!1124993 () Bool)

(assert (=> b!1220604 m!1124993))

(declare-fun m!1124995 () Bool)

(assert (=> b!1220604 m!1124995))

(assert (=> b!1220604 m!1124971))

(declare-fun m!1124997 () Bool)

(assert (=> b!1220605 m!1124997))

(declare-fun m!1124999 () Bool)

(assert (=> b!1220605 m!1124999))

(declare-fun m!1125001 () Bool)

(assert (=> b!1220605 m!1125001))

(declare-fun m!1125003 () Bool)

(assert (=> b!1220605 m!1125003))

(declare-fun m!1125005 () Bool)

(assert (=> start!101524 m!1125005))

(declare-fun m!1125007 () Bool)

(assert (=> start!101524 m!1125007))

(declare-fun m!1125009 () Bool)

(assert (=> b!1220596 m!1125009))

(declare-fun m!1125011 () Bool)

(assert (=> b!1220609 m!1125011))

(assert (=> b!1220594 m!1124971))

(declare-fun m!1125013 () Bool)

(assert (=> b!1220606 m!1125013))

(declare-fun m!1125015 () Bool)

(assert (=> b!1220597 m!1125015))

(declare-fun m!1125017 () Bool)

(assert (=> b!1220600 m!1125017))

(declare-fun m!1125019 () Bool)

(assert (=> b!1220600 m!1125019))

(declare-fun m!1125021 () Bool)

(assert (=> b!1220610 m!1125021))

(declare-fun m!1125023 () Bool)

(assert (=> b!1220602 m!1125023))

(declare-fun m!1125025 () Bool)

(assert (=> b!1220602 m!1125025))

(declare-fun m!1125027 () Bool)

(assert (=> mapNonEmpty!48421 m!1125027))

(check-sat (not b!1220596) (not b!1220603) (not b_next!26317) (not mapNonEmpty!48421) (not b!1220609) (not b!1220601) (not b!1220610) tp_is_empty!31021 (not b!1220599) (not start!101524) (not b!1220593) (not b!1220606) b_and!43825 (not b!1220600) (not b!1220605) (not b!1220604) (not b_lambda!22173) (not b!1220602))
(check-sat b_and!43825 (not b_next!26317))
