; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99800 () Bool)

(assert start!99800)

(declare-fun b_free!25379 () Bool)

(declare-fun b_next!25379 () Bool)

(assert (=> start!99800 (= b_free!25379 (not b_next!25379))))

(declare-fun tp!88851 () Bool)

(declare-fun b_and!41625 () Bool)

(assert (=> start!99800 (= tp!88851 b_and!41625)))

(declare-fun b!1186035 () Bool)

(declare-fun res!788436 () Bool)

(declare-fun e!674355 () Bool)

(assert (=> b!1186035 (=> (not res!788436) (not e!674355))))

(declare-datatypes ((array!76615 0))(
  ( (array!76616 (arr!36957 (Array (_ BitVec 32) (_ BitVec 64))) (size!37493 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76615)

(declare-datatypes ((List!26001 0))(
  ( (Nil!25998) (Cons!25997 (h!27206 (_ BitVec 64)) (t!38372 List!26001)) )
))
(declare-fun arrayNoDuplicates!0 (array!76615 (_ BitVec 32) List!26001) Bool)

(assert (=> b!1186035 (= res!788436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25998))))

(declare-fun b!1186036 () Bool)

(declare-fun res!788441 () Bool)

(assert (=> b!1186036 (=> (not res!788441) (not e!674355))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45005 0))(
  ( (V!45006 (val!15011 Int)) )
))
(declare-datatypes ((ValueCell!14245 0))(
  ( (ValueCellFull!14245 (v!17649 V!45005)) (EmptyCell!14245) )
))
(declare-datatypes ((array!76617 0))(
  ( (array!76618 (arr!36958 (Array (_ BitVec 32) ValueCell!14245)) (size!37494 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76617)

(assert (=> b!1186036 (= res!788441 (and (= (size!37494 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37493 _keys!1208) (size!37494 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186037 () Bool)

(declare-datatypes ((Unit!39306 0))(
  ( (Unit!39307) )
))
(declare-fun e!674357 () Unit!39306)

(declare-fun Unit!39308 () Unit!39306)

(assert (=> b!1186037 (= e!674357 Unit!39308)))

(declare-fun lt!538563 () Unit!39306)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76615 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39306)

(assert (=> b!1186037 (= lt!538563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186037 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538557 () Unit!39306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76615 (_ BitVec 32) (_ BitVec 32)) Unit!39306)

(assert (=> b!1186037 (= lt!538557 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186037 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25998)))

(declare-fun lt!538571 () Unit!39306)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76615 (_ BitVec 64) (_ BitVec 32) List!26001) Unit!39306)

(assert (=> b!1186037 (= lt!538571 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25998))))

(assert (=> b!1186037 false))

(declare-fun b!1186038 () Bool)

(declare-fun res!788435 () Bool)

(assert (=> b!1186038 (=> (not res!788435) (not e!674355))))

(assert (=> b!1186038 (= res!788435 (= (select (arr!36957 _keys!1208) i!673) k!934))))

(declare-fun b!1186040 () Bool)

(declare-fun res!788430 () Bool)

(assert (=> b!1186040 (=> (not res!788430) (not e!674355))))

(assert (=> b!1186040 (= res!788430 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37493 _keys!1208))))))

(declare-fun b!1186041 () Bool)

(declare-fun e!674351 () Bool)

(assert (=> b!1186041 (= e!674351 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186042 () Bool)

(declare-fun e!674361 () Bool)

(assert (=> b!1186042 (= e!674361 e!674351)))

(declare-fun res!788429 () Bool)

(assert (=> b!1186042 (=> res!788429 e!674351)))

(assert (=> b!1186042 (= res!788429 (not (= (select (arr!36957 _keys!1208) from!1455) k!934)))))

(declare-fun b!1186043 () Bool)

(declare-fun e!674352 () Bool)

(assert (=> b!1186043 (= e!674355 e!674352)))

(declare-fun res!788440 () Bool)

(assert (=> b!1186043 (=> (not res!788440) (not e!674352))))

(declare-fun lt!538560 () array!76615)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76615 (_ BitVec 32)) Bool)

(assert (=> b!1186043 (= res!788440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538560 mask!1564))))

(assert (=> b!1186043 (= lt!538560 (array!76616 (store (arr!36957 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37493 _keys!1208)))))

(declare-fun mapIsEmpty!46691 () Bool)

(declare-fun mapRes!46691 () Bool)

(assert (=> mapIsEmpty!46691 mapRes!46691))

(declare-fun b!1186044 () Bool)

(declare-fun Unit!39309 () Unit!39306)

(assert (=> b!1186044 (= e!674357 Unit!39309)))

(declare-fun b!1186045 () Bool)

(declare-fun res!788437 () Bool)

(assert (=> b!1186045 (=> (not res!788437) (not e!674355))))

(assert (=> b!1186045 (= res!788437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186046 () Bool)

(declare-fun res!788432 () Bool)

(assert (=> b!1186046 (=> (not res!788432) (not e!674355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186046 (= res!788432 (validKeyInArray!0 k!934))))

(declare-fun res!788438 () Bool)

(assert (=> start!99800 (=> (not res!788438) (not e!674355))))

(assert (=> start!99800 (= res!788438 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37493 _keys!1208))))))

(assert (=> start!99800 e!674355))

(declare-fun tp_is_empty!29909 () Bool)

(assert (=> start!99800 tp_is_empty!29909))

(declare-fun array_inv!28204 (array!76615) Bool)

(assert (=> start!99800 (array_inv!28204 _keys!1208)))

(assert (=> start!99800 true))

(assert (=> start!99800 tp!88851))

(declare-fun e!674356 () Bool)

(declare-fun array_inv!28205 (array!76617) Bool)

(assert (=> start!99800 (and (array_inv!28205 _values!996) e!674356)))

(declare-fun b!1186039 () Bool)

(declare-fun res!788431 () Bool)

(assert (=> b!1186039 (=> (not res!788431) (not e!674352))))

(assert (=> b!1186039 (= res!788431 (arrayNoDuplicates!0 lt!538560 #b00000000000000000000000000000000 Nil!25998))))

(declare-fun mapNonEmpty!46691 () Bool)

(declare-fun tp!88850 () Bool)

(declare-fun e!674360 () Bool)

(assert (=> mapNonEmpty!46691 (= mapRes!46691 (and tp!88850 e!674360))))

(declare-fun mapValue!46691 () ValueCell!14245)

(declare-fun mapKey!46691 () (_ BitVec 32))

(declare-fun mapRest!46691 () (Array (_ BitVec 32) ValueCell!14245))

(assert (=> mapNonEmpty!46691 (= (arr!36958 _values!996) (store mapRest!46691 mapKey!46691 mapValue!46691))))

(declare-fun b!1186047 () Bool)

(declare-fun e!674353 () Bool)

(declare-fun e!674358 () Bool)

(assert (=> b!1186047 (= e!674353 e!674358)))

(declare-fun res!788442 () Bool)

(assert (=> b!1186047 (=> res!788442 e!674358)))

(assert (=> b!1186047 (= res!788442 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45005)

(declare-fun lt!538566 () array!76617)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19260 0))(
  ( (tuple2!19261 (_1!9641 (_ BitVec 64)) (_2!9641 V!45005)) )
))
(declare-datatypes ((List!26002 0))(
  ( (Nil!25999) (Cons!25998 (h!27207 tuple2!19260) (t!38373 List!26002)) )
))
(declare-datatypes ((ListLongMap!17229 0))(
  ( (ListLongMap!17230 (toList!8630 List!26002)) )
))
(declare-fun lt!538559 () ListLongMap!17229)

(declare-fun minValue!944 () V!45005)

(declare-fun getCurrentListMapNoExtraKeys!5075 (array!76615 array!76617 (_ BitVec 32) (_ BitVec 32) V!45005 V!45005 (_ BitVec 32) Int) ListLongMap!17229)

(assert (=> b!1186047 (= lt!538559 (getCurrentListMapNoExtraKeys!5075 lt!538560 lt!538566 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538572 () V!45005)

(assert (=> b!1186047 (= lt!538566 (array!76618 (store (arr!36958 _values!996) i!673 (ValueCellFull!14245 lt!538572)) (size!37494 _values!996)))))

(declare-fun dynLambda!3025 (Int (_ BitVec 64)) V!45005)

(assert (=> b!1186047 (= lt!538572 (dynLambda!3025 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538554 () ListLongMap!17229)

(assert (=> b!1186047 (= lt!538554 (getCurrentListMapNoExtraKeys!5075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186048 () Bool)

(assert (=> b!1186048 (= e!674360 tp_is_empty!29909)))

(declare-fun b!1186049 () Bool)

(assert (=> b!1186049 (= e!674352 (not e!674353))))

(declare-fun res!788443 () Bool)

(assert (=> b!1186049 (=> res!788443 e!674353)))

(assert (=> b!1186049 (= res!788443 (bvsgt from!1455 i!673))))

(assert (=> b!1186049 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538555 () Unit!39306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76615 (_ BitVec 64) (_ BitVec 32)) Unit!39306)

(assert (=> b!1186049 (= lt!538555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186050 () Bool)

(declare-fun e!674359 () Bool)

(assert (=> b!1186050 (= e!674356 (and e!674359 mapRes!46691))))

(declare-fun condMapEmpty!46691 () Bool)

(declare-fun mapDefault!46691 () ValueCell!14245)

