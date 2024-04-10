; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99836 () Bool)

(assert start!99836)

(declare-fun b_free!25415 () Bool)

(declare-fun b_next!25415 () Bool)

(assert (=> start!99836 (= b_free!25415 (not b_next!25415))))

(declare-fun tp!88959 () Bool)

(declare-fun b_and!41697 () Bool)

(assert (=> start!99836 (= tp!88959 b_and!41697)))

(declare-fun b!1187151 () Bool)

(declare-fun e!675007 () Bool)

(declare-fun tp_is_empty!29945 () Bool)

(assert (=> b!1187151 (= e!675007 tp_is_empty!29945)))

(declare-fun b!1187152 () Bool)

(declare-fun res!789249 () Bool)

(declare-fun e!675010 () Bool)

(assert (=> b!1187152 (=> (not res!789249) (not e!675010))))

(declare-datatypes ((array!76685 0))(
  ( (array!76686 (arr!36992 (Array (_ BitVec 32) (_ BitVec 64))) (size!37528 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76685)

(declare-datatypes ((List!26030 0))(
  ( (Nil!26027) (Cons!26026 (h!27235 (_ BitVec 64)) (t!38437 List!26030)) )
))
(declare-fun arrayNoDuplicates!0 (array!76685 (_ BitVec 32) List!26030) Bool)

(assert (=> b!1187152 (= res!789249 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26027))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1187153 () Bool)

(declare-fun e!675006 () Bool)

(declare-fun arrayContainsKey!0 (array!76685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187153 (= e!675006 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187154 () Bool)

(declare-fun e!675004 () Bool)

(assert (=> b!1187154 (= e!675004 tp_is_empty!29945)))

(declare-fun b!1187155 () Bool)

(declare-fun res!789240 () Bool)

(assert (=> b!1187155 (=> (not res!789240) (not e!675010))))

(assert (=> b!1187155 (= res!789240 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37528 _keys!1208))))))

(declare-fun b!1187156 () Bool)

(declare-fun e!675008 () Bool)

(declare-fun e!675000 () Bool)

(assert (=> b!1187156 (= e!675008 e!675000)))

(declare-fun res!789248 () Bool)

(assert (=> b!1187156 (=> res!789248 e!675000)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187156 (= res!789248 (not (validKeyInArray!0 (select (arr!36992 _keys!1208) from!1455))))))

(declare-datatypes ((V!45053 0))(
  ( (V!45054 (val!15029 Int)) )
))
(declare-datatypes ((tuple2!19290 0))(
  ( (tuple2!19291 (_1!9656 (_ BitVec 64)) (_2!9656 V!45053)) )
))
(declare-datatypes ((List!26031 0))(
  ( (Nil!26028) (Cons!26027 (h!27236 tuple2!19290) (t!38438 List!26031)) )
))
(declare-datatypes ((ListLongMap!17259 0))(
  ( (ListLongMap!17260 (toList!8645 List!26031)) )
))
(declare-fun lt!539592 () ListLongMap!17259)

(declare-fun lt!539580 () ListLongMap!17259)

(assert (=> b!1187156 (= lt!539592 lt!539580)))

(declare-fun lt!539582 () ListLongMap!17259)

(declare-fun -!1676 (ListLongMap!17259 (_ BitVec 64)) ListLongMap!17259)

(assert (=> b!1187156 (= lt!539580 (-!1676 lt!539582 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!539597 () array!76685)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14263 0))(
  ( (ValueCellFull!14263 (v!17667 V!45053)) (EmptyCell!14263) )
))
(declare-datatypes ((array!76687 0))(
  ( (array!76688 (arr!36993 (Array (_ BitVec 32) ValueCell!14263)) (size!37529 (_ BitVec 32))) )
))
(declare-fun lt!539594 () array!76687)

(declare-fun minValue!944 () V!45053)

(declare-fun zeroValue!944 () V!45053)

(declare-fun getCurrentListMapNoExtraKeys!5088 (array!76685 array!76687 (_ BitVec 32) (_ BitVec 32) V!45053 V!45053 (_ BitVec 32) Int) ListLongMap!17259)

(assert (=> b!1187156 (= lt!539592 (getCurrentListMapNoExtraKeys!5088 lt!539597 lt!539594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76687)

(assert (=> b!1187156 (= lt!539582 (getCurrentListMapNoExtraKeys!5088 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39361 0))(
  ( (Unit!39362) )
))
(declare-fun lt!539581 () Unit!39361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!888 (array!76685 array!76687 (_ BitVec 32) (_ BitVec 32) V!45053 V!45053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39361)

(assert (=> b!1187156 (= lt!539581 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187157 () Bool)

(declare-fun e!675009 () Unit!39361)

(declare-fun Unit!39363 () Unit!39361)

(assert (=> b!1187157 (= e!675009 Unit!39363)))

(declare-fun lt!539588 () Unit!39361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39361)

(assert (=> b!1187157 (= lt!539588 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187157 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539596 () Unit!39361)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76685 (_ BitVec 32) (_ BitVec 32)) Unit!39361)

(assert (=> b!1187157 (= lt!539596 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187157 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26027)))

(declare-fun lt!539583 () Unit!39361)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76685 (_ BitVec 64) (_ BitVec 32) List!26030) Unit!39361)

(assert (=> b!1187157 (= lt!539583 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26027))))

(assert (=> b!1187157 false))

(declare-fun b!1187158 () Bool)

(declare-fun e!675003 () Bool)

(assert (=> b!1187158 (= e!675003 e!675006)))

(declare-fun res!789242 () Bool)

(assert (=> b!1187158 (=> res!789242 e!675006)))

(assert (=> b!1187158 (= res!789242 (not (= (select (arr!36992 _keys!1208) from!1455) k!934)))))

(declare-fun b!1187159 () Bool)

(declare-fun res!789250 () Bool)

(assert (=> b!1187159 (=> (not res!789250) (not e!675010))))

(assert (=> b!1187159 (= res!789250 (and (= (size!37529 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37528 _keys!1208) (size!37529 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46745 () Bool)

(declare-fun mapRes!46745 () Bool)

(assert (=> mapIsEmpty!46745 mapRes!46745))

(declare-fun b!1187160 () Bool)

(declare-fun res!789251 () Bool)

(declare-fun e!675001 () Bool)

(assert (=> b!1187160 (=> (not res!789251) (not e!675001))))

(assert (=> b!1187160 (= res!789251 (arrayNoDuplicates!0 lt!539597 #b00000000000000000000000000000000 Nil!26027))))

(declare-fun mapNonEmpty!46745 () Bool)

(declare-fun tp!88958 () Bool)

(assert (=> mapNonEmpty!46745 (= mapRes!46745 (and tp!88958 e!675007))))

(declare-fun mapKey!46745 () (_ BitVec 32))

(declare-fun mapRest!46745 () (Array (_ BitVec 32) ValueCell!14263))

(declare-fun mapValue!46745 () ValueCell!14263)

(assert (=> mapNonEmpty!46745 (= (arr!36993 _values!996) (store mapRest!46745 mapKey!46745 mapValue!46745))))

(declare-fun b!1187161 () Bool)

(declare-fun e!675002 () Bool)

(assert (=> b!1187161 (= e!675002 (and e!675004 mapRes!46745))))

(declare-fun condMapEmpty!46745 () Bool)

(declare-fun mapDefault!46745 () ValueCell!14263)

