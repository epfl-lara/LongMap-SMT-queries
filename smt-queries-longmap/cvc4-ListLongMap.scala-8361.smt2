; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101752 () Bool)

(assert start!101752)

(declare-fun b_free!26441 () Bool)

(declare-fun b_next!26441 () Bool)

(assert (=> start!101752 (= b_free!26441 (not b_next!26441))))

(declare-fun tp!92369 () Bool)

(declare-fun b_and!44143 () Bool)

(assert (=> start!101752 (= tp!92369 b_and!44143)))

(declare-fun res!814141 () Bool)

(declare-fun e!695828 () Bool)

(assert (=> start!101752 (=> (not res!814141) (not e!695828))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!79073 0))(
  ( (array!79074 (arr!38163 (Array (_ BitVec 32) (_ BitVec 64))) (size!38699 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79073)

(assert (=> start!101752 (= res!814141 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38699 _keys!1208))))))

(assert (=> start!101752 e!695828))

(declare-fun tp_is_empty!31145 () Bool)

(assert (=> start!101752 tp_is_empty!31145))

(declare-fun array_inv!29026 (array!79073) Bool)

(assert (=> start!101752 (array_inv!29026 _keys!1208)))

(assert (=> start!101752 true))

(assert (=> start!101752 tp!92369))

(declare-datatypes ((V!46653 0))(
  ( (V!46654 (val!15629 Int)) )
))
(declare-datatypes ((ValueCell!14863 0))(
  ( (ValueCellFull!14863 (v!18291 V!46653)) (EmptyCell!14863) )
))
(declare-datatypes ((array!79075 0))(
  ( (array!79076 (arr!38164 (Array (_ BitVec 32) ValueCell!14863)) (size!38700 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79075)

(declare-fun e!695836 () Bool)

(declare-fun array_inv!29027 (array!79075) Bool)

(assert (=> start!101752 (and (array_inv!29027 _values!996) e!695836)))

(declare-fun b!1225133 () Bool)

(declare-fun e!695831 () Bool)

(assert (=> b!1225133 (= e!695831 tp_is_empty!31145)))

(declare-fun b!1225134 () Bool)

(declare-fun e!695826 () Bool)

(assert (=> b!1225134 (= e!695828 e!695826)))

(declare-fun res!814135 () Bool)

(assert (=> b!1225134 (=> (not res!814135) (not e!695826))))

(declare-fun lt!558119 () array!79073)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79073 (_ BitVec 32)) Bool)

(assert (=> b!1225134 (= res!814135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558119 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225134 (= lt!558119 (array!79074 (store (arr!38163 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38699 _keys!1208)))))

(declare-fun b!1225135 () Bool)

(declare-fun res!814140 () Bool)

(assert (=> b!1225135 (=> (not res!814140) (not e!695828))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1225135 (= res!814140 (= (select (arr!38163 _keys!1208) i!673) k!934))))

(declare-fun b!1225136 () Bool)

(declare-fun res!814147 () Bool)

(assert (=> b!1225136 (=> (not res!814147) (not e!695826))))

(declare-datatypes ((List!26945 0))(
  ( (Nil!26942) (Cons!26941 (h!28150 (_ BitVec 64)) (t!40366 List!26945)) )
))
(declare-fun arrayNoDuplicates!0 (array!79073 (_ BitVec 32) List!26945) Bool)

(assert (=> b!1225136 (= res!814147 (arrayNoDuplicates!0 lt!558119 #b00000000000000000000000000000000 Nil!26942))))

(declare-fun b!1225137 () Bool)

(declare-fun e!695835 () Bool)

(declare-fun arrayContainsKey!0 (array!79073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225137 (= e!695835 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!48616 () Bool)

(declare-fun mapRes!48616 () Bool)

(assert (=> mapIsEmpty!48616 mapRes!48616))

(declare-fun b!1225138 () Bool)

(declare-fun e!695829 () Bool)

(declare-fun e!695832 () Bool)

(assert (=> b!1225138 (= e!695829 e!695832)))

(declare-fun res!814133 () Bool)

(assert (=> b!1225138 (=> res!814133 e!695832)))

(assert (=> b!1225138 (= res!814133 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20144 0))(
  ( (tuple2!20145 (_1!10083 (_ BitVec 64)) (_2!10083 V!46653)) )
))
(declare-datatypes ((List!26946 0))(
  ( (Nil!26943) (Cons!26942 (h!28151 tuple2!20144) (t!40367 List!26946)) )
))
(declare-datatypes ((ListLongMap!18113 0))(
  ( (ListLongMap!18114 (toList!9072 List!26946)) )
))
(declare-fun lt!558125 () ListLongMap!18113)

(declare-fun lt!558124 () array!79075)

(declare-fun minValue!944 () V!46653)

(declare-fun zeroValue!944 () V!46653)

(declare-fun getCurrentListMapNoExtraKeys!5491 (array!79073 array!79075 (_ BitVec 32) (_ BitVec 32) V!46653 V!46653 (_ BitVec 32) Int) ListLongMap!18113)

(assert (=> b!1225138 (= lt!558125 (getCurrentListMapNoExtraKeys!5491 lt!558119 lt!558124 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558132 () V!46653)

(assert (=> b!1225138 (= lt!558124 (array!79076 (store (arr!38164 _values!996) i!673 (ValueCellFull!14863 lt!558132)) (size!38700 _values!996)))))

(declare-fun dynLambda!3363 (Int (_ BitVec 64)) V!46653)

(assert (=> b!1225138 (= lt!558132 (dynLambda!3363 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558130 () ListLongMap!18113)

(assert (=> b!1225138 (= lt!558130 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225139 () Bool)

(declare-fun res!814134 () Bool)

(assert (=> b!1225139 (=> (not res!814134) (not e!695828))))

(assert (=> b!1225139 (= res!814134 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38699 _keys!1208))))))

(declare-fun b!1225140 () Bool)

(declare-datatypes ((Unit!40601 0))(
  ( (Unit!40602) )
))
(declare-fun e!695825 () Unit!40601)

(declare-fun Unit!40603 () Unit!40601)

(assert (=> b!1225140 (= e!695825 Unit!40603)))

(declare-fun b!1225141 () Bool)

(declare-fun res!814142 () Bool)

(assert (=> b!1225141 (=> (not res!814142) (not e!695828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225141 (= res!814142 (validKeyInArray!0 k!934))))

(declare-fun b!1225142 () Bool)

(assert (=> b!1225142 (= e!695826 (not e!695829))))

(declare-fun res!814136 () Bool)

(assert (=> b!1225142 (=> res!814136 e!695829)))

(assert (=> b!1225142 (= res!814136 (bvsgt from!1455 i!673))))

(assert (=> b!1225142 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!558118 () Unit!40601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79073 (_ BitVec 64) (_ BitVec 32)) Unit!40601)

(assert (=> b!1225142 (= lt!558118 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1225143 () Bool)

(declare-fun e!695830 () Bool)

(assert (=> b!1225143 (= e!695830 e!695835)))

(declare-fun res!814145 () Bool)

(assert (=> b!1225143 (=> res!814145 e!695835)))

(assert (=> b!1225143 (= res!814145 (not (= (select (arr!38163 _keys!1208) from!1455) k!934)))))

(declare-fun b!1225144 () Bool)

(declare-fun e!695827 () Bool)

(assert (=> b!1225144 (= e!695827 true)))

(declare-fun lt!558133 () ListLongMap!18113)

(declare-fun lt!558131 () ListLongMap!18113)

(declare-fun -!1971 (ListLongMap!18113 (_ BitVec 64)) ListLongMap!18113)

(assert (=> b!1225144 (= (-!1971 lt!558133 k!934) lt!558131)))

(declare-fun lt!558134 () Unit!40601)

(declare-fun lt!558122 () V!46653)

(declare-fun lt!558126 () ListLongMap!18113)

(declare-fun addRemoveCommutativeForDiffKeys!214 (ListLongMap!18113 (_ BitVec 64) V!46653 (_ BitVec 64)) Unit!40601)

(assert (=> b!1225144 (= lt!558134 (addRemoveCommutativeForDiffKeys!214 lt!558126 (select (arr!38163 _keys!1208) from!1455) lt!558122 k!934))))

(declare-fun lt!558128 () ListLongMap!18113)

(declare-fun lt!558116 () ListLongMap!18113)

(assert (=> b!1225144 (and (= lt!558130 lt!558133) (= lt!558116 lt!558128))))

(declare-fun lt!558129 () tuple2!20144)

(declare-fun +!4127 (ListLongMap!18113 tuple2!20144) ListLongMap!18113)

(assert (=> b!1225144 (= lt!558133 (+!4127 lt!558126 lt!558129))))

(assert (=> b!1225144 (not (= (select (arr!38163 _keys!1208) from!1455) k!934))))

(declare-fun lt!558123 () Unit!40601)

(assert (=> b!1225144 (= lt!558123 e!695825)))

(declare-fun c!120482 () Bool)

(assert (=> b!1225144 (= c!120482 (= (select (arr!38163 _keys!1208) from!1455) k!934))))

(assert (=> b!1225144 e!695830))

(declare-fun res!814138 () Bool)

(assert (=> b!1225144 (=> (not res!814138) (not e!695830))))

(assert (=> b!1225144 (= res!814138 (= lt!558125 lt!558131))))

(assert (=> b!1225144 (= lt!558131 (+!4127 lt!558116 lt!558129))))

(assert (=> b!1225144 (= lt!558129 (tuple2!20145 (select (arr!38163 _keys!1208) from!1455) lt!558122))))

(declare-fun get!19493 (ValueCell!14863 V!46653) V!46653)

(assert (=> b!1225144 (= lt!558122 (get!19493 (select (arr!38164 _values!996) from!1455) lt!558132))))

(declare-fun b!1225145 () Bool)

(declare-fun res!814143 () Bool)

(assert (=> b!1225145 (=> (not res!814143) (not e!695828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225145 (= res!814143 (validMask!0 mask!1564))))

(declare-fun b!1225146 () Bool)

(declare-fun res!814144 () Bool)

(assert (=> b!1225146 (=> (not res!814144) (not e!695828))))

(assert (=> b!1225146 (= res!814144 (and (= (size!38700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38699 _keys!1208) (size!38700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225147 () Bool)

(assert (=> b!1225147 (= e!695832 e!695827)))

(declare-fun res!814139 () Bool)

(assert (=> b!1225147 (=> res!814139 e!695827)))

(assert (=> b!1225147 (= res!814139 (not (validKeyInArray!0 (select (arr!38163 _keys!1208) from!1455))))))

(assert (=> b!1225147 (= lt!558128 lt!558116)))

(assert (=> b!1225147 (= lt!558116 (-!1971 lt!558126 k!934))))

(assert (=> b!1225147 (= lt!558128 (getCurrentListMapNoExtraKeys!5491 lt!558119 lt!558124 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225147 (= lt!558126 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558117 () Unit!40601)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1177 (array!79073 array!79075 (_ BitVec 32) (_ BitVec 32) V!46653 V!46653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40601)

(assert (=> b!1225147 (= lt!558117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1177 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225148 () Bool)

(declare-fun res!814137 () Bool)

(assert (=> b!1225148 (=> (not res!814137) (not e!695828))))

(assert (=> b!1225148 (= res!814137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225149 () Bool)

(declare-fun Unit!40604 () Unit!40601)

(assert (=> b!1225149 (= e!695825 Unit!40604)))

(declare-fun lt!558121 () Unit!40601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79073 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40601)

(assert (=> b!1225149 (= lt!558121 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225149 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558127 () Unit!40601)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79073 (_ BitVec 32) (_ BitVec 32)) Unit!40601)

(assert (=> b!1225149 (= lt!558127 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225149 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26942)))

(declare-fun lt!558120 () Unit!40601)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79073 (_ BitVec 64) (_ BitVec 32) List!26945) Unit!40601)

(assert (=> b!1225149 (= lt!558120 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26942))))

(assert (=> b!1225149 false))

(declare-fun b!1225150 () Bool)

(declare-fun e!695833 () Bool)

(assert (=> b!1225150 (= e!695833 tp_is_empty!31145)))

(declare-fun b!1225151 () Bool)

(declare-fun res!814146 () Bool)

(assert (=> b!1225151 (=> (not res!814146) (not e!695828))))

(assert (=> b!1225151 (= res!814146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26942))))

(declare-fun mapNonEmpty!48616 () Bool)

(declare-fun tp!92368 () Bool)

(assert (=> mapNonEmpty!48616 (= mapRes!48616 (and tp!92368 e!695833))))

(declare-fun mapKey!48616 () (_ BitVec 32))

(declare-fun mapValue!48616 () ValueCell!14863)

(declare-fun mapRest!48616 () (Array (_ BitVec 32) ValueCell!14863))

(assert (=> mapNonEmpty!48616 (= (arr!38164 _values!996) (store mapRest!48616 mapKey!48616 mapValue!48616))))

(declare-fun b!1225152 () Bool)

(assert (=> b!1225152 (= e!695836 (and e!695831 mapRes!48616))))

(declare-fun condMapEmpty!48616 () Bool)

(declare-fun mapDefault!48616 () ValueCell!14863)

