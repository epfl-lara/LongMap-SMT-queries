; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99454 () Bool)

(assert start!99454)

(declare-fun b_free!25033 () Bool)

(declare-fun b_next!25033 () Bool)

(assert (=> start!99454 (= b_free!25033 (not b_next!25033))))

(declare-fun tp!87813 () Bool)

(declare-fun b_and!40933 () Bool)

(assert (=> start!99454 (= tp!87813 b_and!40933)))

(declare-fun b!1174967 () Bool)

(declare-fun res!780313 () Bool)

(declare-fun e!667880 () Bool)

(assert (=> b!1174967 (=> (not res!780313) (not e!667880))))

(declare-datatypes ((array!75937 0))(
  ( (array!75938 (arr!36618 (Array (_ BitVec 32) (_ BitVec 64))) (size!37154 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75937)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44545 0))(
  ( (V!44546 (val!14838 Int)) )
))
(declare-datatypes ((ValueCell!14072 0))(
  ( (ValueCellFull!14072 (v!17476 V!44545)) (EmptyCell!14072) )
))
(declare-datatypes ((array!75939 0))(
  ( (array!75940 (arr!36619 (Array (_ BitVec 32) ValueCell!14072)) (size!37155 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75939)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1174967 (= res!780313 (and (= (size!37155 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37154 _keys!1208) (size!37155 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174968 () Bool)

(declare-datatypes ((Unit!38774 0))(
  ( (Unit!38775) )
))
(declare-fun e!667877 () Unit!38774)

(declare-fun Unit!38776 () Unit!38774)

(assert (=> b!1174968 (= e!667877 Unit!38776)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!529961 () Unit!38774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75937 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38774)

(assert (=> b!1174968 (= lt!529961 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174968 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529973 () Unit!38774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75937 (_ BitVec 32) (_ BitVec 32)) Unit!38774)

(assert (=> b!1174968 (= lt!529973 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25710 0))(
  ( (Nil!25707) (Cons!25706 (h!26915 (_ BitVec 64)) (t!37735 List!25710)) )
))
(declare-fun arrayNoDuplicates!0 (array!75937 (_ BitVec 32) List!25710) Bool)

(assert (=> b!1174968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25707)))

(declare-fun lt!529974 () Unit!38774)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75937 (_ BitVec 64) (_ BitVec 32) List!25710) Unit!38774)

(assert (=> b!1174968 (= lt!529974 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25707))))

(assert (=> b!1174968 false))

(declare-fun b!1174969 () Bool)

(declare-fun e!667872 () Bool)

(declare-fun e!667881 () Bool)

(assert (=> b!1174969 (= e!667872 e!667881)))

(declare-fun res!780306 () Bool)

(assert (=> b!1174969 (=> res!780306 e!667881)))

(assert (=> b!1174969 (= res!780306 (not (= (select (arr!36618 _keys!1208) from!1455) k!934)))))

(declare-fun b!1174970 () Bool)

(declare-fun e!667874 () Bool)

(declare-fun e!667878 () Bool)

(assert (=> b!1174970 (= e!667874 e!667878)))

(declare-fun res!780305 () Bool)

(assert (=> b!1174970 (=> res!780305 e!667878)))

(assert (=> b!1174970 (= res!780305 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44545)

(declare-fun lt!529962 () array!75939)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529967 () array!75937)

(declare-datatypes ((tuple2!18972 0))(
  ( (tuple2!18973 (_1!9497 (_ BitVec 64)) (_2!9497 V!44545)) )
))
(declare-datatypes ((List!25711 0))(
  ( (Nil!25708) (Cons!25707 (h!26916 tuple2!18972) (t!37736 List!25711)) )
))
(declare-datatypes ((ListLongMap!16941 0))(
  ( (ListLongMap!16942 (toList!8486 List!25711)) )
))
(declare-fun lt!529972 () ListLongMap!16941)

(declare-fun minValue!944 () V!44545)

(declare-fun getCurrentListMapNoExtraKeys!4946 (array!75937 array!75939 (_ BitVec 32) (_ BitVec 32) V!44545 V!44545 (_ BitVec 32) Int) ListLongMap!16941)

(assert (=> b!1174970 (= lt!529972 (getCurrentListMapNoExtraKeys!4946 lt!529967 lt!529962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529966 () V!44545)

(assert (=> b!1174970 (= lt!529962 (array!75940 (store (arr!36619 _values!996) i!673 (ValueCellFull!14072 lt!529966)) (size!37155 _values!996)))))

(declare-fun dynLambda!2914 (Int (_ BitVec 64)) V!44545)

(assert (=> b!1174970 (= lt!529966 (dynLambda!2914 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529965 () ListLongMap!16941)

(assert (=> b!1174970 (= lt!529965 (getCurrentListMapNoExtraKeys!4946 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174971 () Bool)

(declare-fun e!667879 () Bool)

(declare-fun tp_is_empty!29563 () Bool)

(assert (=> b!1174971 (= e!667879 tp_is_empty!29563)))

(declare-fun b!1174972 () Bool)

(declare-fun res!780302 () Bool)

(assert (=> b!1174972 (=> (not res!780302) (not e!667880))))

(assert (=> b!1174972 (= res!780302 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25707))))

(declare-fun b!1174973 () Bool)

(declare-fun res!780314 () Bool)

(assert (=> b!1174973 (=> (not res!780314) (not e!667880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75937 (_ BitVec 32)) Bool)

(assert (=> b!1174973 (= res!780314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174974 () Bool)

(declare-fun res!780311 () Bool)

(declare-fun e!667875 () Bool)

(assert (=> b!1174974 (=> (not res!780311) (not e!667875))))

(assert (=> b!1174974 (= res!780311 (arrayNoDuplicates!0 lt!529967 #b00000000000000000000000000000000 Nil!25707))))

(declare-fun mapIsEmpty!46172 () Bool)

(declare-fun mapRes!46172 () Bool)

(assert (=> mapIsEmpty!46172 mapRes!46172))

(declare-fun res!780307 () Bool)

(assert (=> start!99454 (=> (not res!780307) (not e!667880))))

(assert (=> start!99454 (= res!780307 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37154 _keys!1208))))))

(assert (=> start!99454 e!667880))

(assert (=> start!99454 tp_is_empty!29563))

(declare-fun array_inv!27974 (array!75937) Bool)

(assert (=> start!99454 (array_inv!27974 _keys!1208)))

(assert (=> start!99454 true))

(assert (=> start!99454 tp!87813))

(declare-fun e!667876 () Bool)

(declare-fun array_inv!27975 (array!75939) Bool)

(assert (=> start!99454 (and (array_inv!27975 _values!996) e!667876)))

(declare-fun b!1174975 () Bool)

(declare-fun res!780312 () Bool)

(assert (=> b!1174975 (=> (not res!780312) (not e!667880))))

(assert (=> b!1174975 (= res!780312 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37154 _keys!1208))))))

(declare-fun b!1174976 () Bool)

(declare-fun res!780315 () Bool)

(assert (=> b!1174976 (=> (not res!780315) (not e!667880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174976 (= res!780315 (validKeyInArray!0 k!934))))

(declare-fun b!1174977 () Bool)

(assert (=> b!1174977 (= e!667881 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174978 () Bool)

(assert (=> b!1174978 (= e!667876 (and e!667879 mapRes!46172))))

(declare-fun condMapEmpty!46172 () Bool)

(declare-fun mapDefault!46172 () ValueCell!14072)

