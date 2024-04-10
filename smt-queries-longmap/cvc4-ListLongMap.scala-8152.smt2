; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99782 () Bool)

(assert start!99782)

(declare-fun b_free!25361 () Bool)

(declare-fun b_next!25361 () Bool)

(assert (=> start!99782 (= b_free!25361 (not b_next!25361))))

(declare-fun tp!88796 () Bool)

(declare-fun b_and!41589 () Bool)

(assert (=> start!99782 (= tp!88796 b_and!41589)))

(declare-fun b!1185477 () Bool)

(declare-fun res!788036 () Bool)

(declare-fun e!674027 () Bool)

(assert (=> b!1185477 (=> (not res!788036) (not e!674027))))

(declare-datatypes ((array!76579 0))(
  ( (array!76580 (arr!36939 (Array (_ BitVec 32) (_ BitVec 64))) (size!37475 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76579)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44981 0))(
  ( (V!44982 (val!15002 Int)) )
))
(declare-datatypes ((ValueCell!14236 0))(
  ( (ValueCellFull!14236 (v!17640 V!44981)) (EmptyCell!14236) )
))
(declare-datatypes ((array!76581 0))(
  ( (array!76582 (arr!36940 (Array (_ BitVec 32) ValueCell!14236)) (size!37476 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76581)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1185477 (= res!788036 (and (= (size!37476 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37475 _keys!1208) (size!37476 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185478 () Bool)

(declare-datatypes ((Unit!39272 0))(
  ( (Unit!39273) )
))
(declare-fun e!674032 () Unit!39272)

(declare-fun Unit!39274 () Unit!39272)

(assert (=> b!1185478 (= e!674032 Unit!39274)))

(declare-fun b!1185479 () Bool)

(declare-fun Unit!39275 () Unit!39272)

(assert (=> b!1185479 (= e!674032 Unit!39275)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!538050 () Unit!39272)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39272)

(assert (=> b!1185479 (= lt!538050 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185479 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538056 () Unit!39272)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76579 (_ BitVec 32) (_ BitVec 32)) Unit!39272)

(assert (=> b!1185479 (= lt!538056 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25984 0))(
  ( (Nil!25981) (Cons!25980 (h!27189 (_ BitVec 64)) (t!38337 List!25984)) )
))
(declare-fun arrayNoDuplicates!0 (array!76579 (_ BitVec 32) List!25984) Bool)

(assert (=> b!1185479 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25981)))

(declare-fun lt!538055 () Unit!39272)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76579 (_ BitVec 64) (_ BitVec 32) List!25984) Unit!39272)

(assert (=> b!1185479 (= lt!538055 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25981))))

(assert (=> b!1185479 false))

(declare-fun b!1185480 () Bool)

(declare-fun e!674038 () Bool)

(declare-fun tp_is_empty!29891 () Bool)

(assert (=> b!1185480 (= e!674038 tp_is_empty!29891)))

(declare-fun b!1185481 () Bool)

(declare-fun res!788024 () Bool)

(assert (=> b!1185481 (=> (not res!788024) (not e!674027))))

(assert (=> b!1185481 (= res!788024 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37475 _keys!1208))))))

(declare-fun mapNonEmpty!46664 () Bool)

(declare-fun mapRes!46664 () Bool)

(declare-fun tp!88797 () Bool)

(assert (=> mapNonEmpty!46664 (= mapRes!46664 (and tp!88797 e!674038))))

(declare-fun mapValue!46664 () ValueCell!14236)

(declare-fun mapKey!46664 () (_ BitVec 32))

(declare-fun mapRest!46664 () (Array (_ BitVec 32) ValueCell!14236))

(assert (=> mapNonEmpty!46664 (= (arr!36940 _values!996) (store mapRest!46664 mapKey!46664 mapValue!46664))))

(declare-fun b!1185482 () Bool)

(declare-fun e!674035 () Bool)

(assert (=> b!1185482 (= e!674035 tp_is_empty!29891)))

(declare-fun b!1185483 () Bool)

(declare-fun res!788025 () Bool)

(assert (=> b!1185483 (=> (not res!788025) (not e!674027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185483 (= res!788025 (validMask!0 mask!1564))))

(declare-fun b!1185484 () Bool)

(declare-fun e!674033 () Bool)

(declare-fun e!674031 () Bool)

(assert (=> b!1185484 (= e!674033 e!674031)))

(declare-fun res!788028 () Bool)

(assert (=> b!1185484 (=> res!788028 e!674031)))

(assert (=> b!1185484 (= res!788028 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44981)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538047 () array!76579)

(declare-fun minValue!944 () V!44981)

(declare-datatypes ((tuple2!19244 0))(
  ( (tuple2!19245 (_1!9633 (_ BitVec 64)) (_2!9633 V!44981)) )
))
(declare-datatypes ((List!25985 0))(
  ( (Nil!25982) (Cons!25981 (h!27190 tuple2!19244) (t!38338 List!25985)) )
))
(declare-datatypes ((ListLongMap!17213 0))(
  ( (ListLongMap!17214 (toList!8622 List!25985)) )
))
(declare-fun lt!538049 () ListLongMap!17213)

(declare-fun lt!538051 () array!76581)

(declare-fun getCurrentListMapNoExtraKeys!5068 (array!76579 array!76581 (_ BitVec 32) (_ BitVec 32) V!44981 V!44981 (_ BitVec 32) Int) ListLongMap!17213)

(assert (=> b!1185484 (= lt!538049 (getCurrentListMapNoExtraKeys!5068 lt!538047 lt!538051 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538057 () V!44981)

(assert (=> b!1185484 (= lt!538051 (array!76582 (store (arr!36940 _values!996) i!673 (ValueCellFull!14236 lt!538057)) (size!37476 _values!996)))))

(declare-fun dynLambda!3019 (Int (_ BitVec 64)) V!44981)

(assert (=> b!1185484 (= lt!538057 (dynLambda!3019 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538048 () ListLongMap!17213)

(assert (=> b!1185484 (= lt!538048 (getCurrentListMapNoExtraKeys!5068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185485 () Bool)

(declare-fun res!788035 () Bool)

(declare-fun e!674030 () Bool)

(assert (=> b!1185485 (=> (not res!788035) (not e!674030))))

(assert (=> b!1185485 (= res!788035 (arrayNoDuplicates!0 lt!538047 #b00000000000000000000000000000000 Nil!25981))))

(declare-fun b!1185486 () Bool)

(declare-fun res!788031 () Bool)

(assert (=> b!1185486 (=> (not res!788031) (not e!674027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185486 (= res!788031 (validKeyInArray!0 k!934))))

(declare-fun b!1185487 () Bool)

(assert (=> b!1185487 (= e!674027 e!674030)))

(declare-fun res!788034 () Bool)

(assert (=> b!1185487 (=> (not res!788034) (not e!674030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76579 (_ BitVec 32)) Bool)

(assert (=> b!1185487 (= res!788034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538047 mask!1564))))

(assert (=> b!1185487 (= lt!538047 (array!76580 (store (arr!36939 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37475 _keys!1208)))))

(declare-fun b!1185489 () Bool)

(declare-fun res!788032 () Bool)

(assert (=> b!1185489 (=> (not res!788032) (not e!674027))))

(assert (=> b!1185489 (= res!788032 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25981))))

(declare-fun b!1185490 () Bool)

(declare-fun res!788033 () Bool)

(assert (=> b!1185490 (=> (not res!788033) (not e!674027))))

(assert (=> b!1185490 (= res!788033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185491 () Bool)

(declare-fun res!788038 () Bool)

(assert (=> b!1185491 (=> (not res!788038) (not e!674027))))

(assert (=> b!1185491 (= res!788038 (= (select (arr!36939 _keys!1208) i!673) k!934))))

(declare-fun b!1185492 () Bool)

(declare-fun e!674036 () Bool)

(assert (=> b!1185492 (= e!674036 (and e!674035 mapRes!46664))))

(declare-fun condMapEmpty!46664 () Bool)

(declare-fun mapDefault!46664 () ValueCell!14236)

