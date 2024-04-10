; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99652 () Bool)

(assert start!99652)

(declare-fun b_free!25231 () Bool)

(declare-fun b_next!25231 () Bool)

(assert (=> start!99652 (= b_free!25231 (not b_next!25231))))

(declare-fun tp!88406 () Bool)

(declare-fun b_and!41329 () Bool)

(assert (=> start!99652 (= tp!88406 b_and!41329)))

(declare-fun b!1181433 () Bool)

(declare-fun e!671685 () Bool)

(declare-fun e!671691 () Bool)

(assert (=> b!1181433 (= e!671685 e!671691)))

(declare-fun res!785090 () Bool)

(assert (=> b!1181433 (=> res!785090 e!671691)))

(declare-datatypes ((array!76325 0))(
  ( (array!76326 (arr!36812 (Array (_ BitVec 32) (_ BitVec 64))) (size!37348 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76325)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181433 (= res!785090 (not (= (select (arr!36812 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!46469 () Bool)

(declare-fun mapRes!46469 () Bool)

(assert (=> mapIsEmpty!46469 mapRes!46469))

(declare-fun b!1181434 () Bool)

(declare-fun res!785096 () Bool)

(declare-fun e!671681 () Bool)

(assert (=> b!1181434 (=> (not res!785096) (not e!671681))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181434 (= res!785096 (validMask!0 mask!1564))))

(declare-fun b!1181435 () Bool)

(declare-fun e!671683 () Bool)

(declare-fun tp_is_empty!29761 () Bool)

(assert (=> b!1181435 (= e!671683 tp_is_empty!29761)))

(declare-fun b!1181436 () Bool)

(declare-fun res!785092 () Bool)

(declare-fun e!671687 () Bool)

(assert (=> b!1181436 (=> (not res!785092) (not e!671687))))

(declare-datatypes ((V!44809 0))(
  ( (V!44810 (val!14937 Int)) )
))
(declare-datatypes ((tuple2!19134 0))(
  ( (tuple2!19135 (_1!9578 (_ BitVec 64)) (_2!9578 V!44809)) )
))
(declare-datatypes ((List!25874 0))(
  ( (Nil!25871) (Cons!25870 (h!27079 tuple2!19134) (t!38097 List!25874)) )
))
(declare-datatypes ((ListLongMap!17103 0))(
  ( (ListLongMap!17104 (toList!8567 List!25874)) )
))
(declare-fun lt!534367 () ListLongMap!17103)

(declare-fun lt!534377 () ListLongMap!17103)

(declare-fun lt!534376 () tuple2!19134)

(declare-fun +!3875 (ListLongMap!17103 tuple2!19134) ListLongMap!17103)

(assert (=> b!1181436 (= res!785092 (= lt!534377 (+!3875 lt!534367 lt!534376)))))

(declare-fun b!1181438 () Bool)

(declare-fun res!785091 () Bool)

(assert (=> b!1181438 (=> (not res!785091) (not e!671681))))

(declare-datatypes ((List!25875 0))(
  ( (Nil!25872) (Cons!25871 (h!27080 (_ BitVec 64)) (t!38098 List!25875)) )
))
(declare-fun arrayNoDuplicates!0 (array!76325 (_ BitVec 32) List!25875) Bool)

(assert (=> b!1181438 (= res!785091 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25872))))

(declare-fun b!1181439 () Bool)

(declare-datatypes ((Unit!39068 0))(
  ( (Unit!39069) )
))
(declare-fun e!671692 () Unit!39068)

(declare-fun Unit!39070 () Unit!39068)

(assert (=> b!1181439 (= e!671692 Unit!39070)))

(declare-fun lt!534364 () Unit!39068)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39068)

(assert (=> b!1181439 (= lt!534364 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181439 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534372 () Unit!39068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76325 (_ BitVec 32) (_ BitVec 32)) Unit!39068)

(assert (=> b!1181439 (= lt!534372 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181439 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25872)))

(declare-fun lt!534378 () Unit!39068)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76325 (_ BitVec 64) (_ BitVec 32) List!25875) Unit!39068)

(assert (=> b!1181439 (= lt!534378 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25872))))

(assert (=> b!1181439 false))

(declare-fun b!1181440 () Bool)

(declare-fun res!785097 () Bool)

(assert (=> b!1181440 (=> (not res!785097) (not e!671681))))

(assert (=> b!1181440 (= res!785097 (= (select (arr!36812 _keys!1208) i!673) k!934))))

(declare-fun b!1181441 () Bool)

(declare-fun res!785095 () Bool)

(assert (=> b!1181441 (=> (not res!785095) (not e!671681))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14171 0))(
  ( (ValueCellFull!14171 (v!17575 V!44809)) (EmptyCell!14171) )
))
(declare-datatypes ((array!76327 0))(
  ( (array!76328 (arr!36813 (Array (_ BitVec 32) ValueCell!14171)) (size!37349 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76327)

(assert (=> b!1181441 (= res!785095 (and (= (size!37349 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37348 _keys!1208) (size!37349 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181442 () Bool)

(declare-fun e!671682 () Bool)

(declare-fun e!671690 () Bool)

(assert (=> b!1181442 (= e!671682 (not e!671690))))

(declare-fun res!785089 () Bool)

(assert (=> b!1181442 (=> res!785089 e!671690)))

(assert (=> b!1181442 (= res!785089 (bvsgt from!1455 i!673))))

(assert (=> b!1181442 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534366 () Unit!39068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76325 (_ BitVec 64) (_ BitVec 32)) Unit!39068)

(assert (=> b!1181442 (= lt!534366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181443 () Bool)

(declare-fun res!785085 () Bool)

(assert (=> b!1181443 (=> (not res!785085) (not e!671681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76325 (_ BitVec 32)) Bool)

(assert (=> b!1181443 (= res!785085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181444 () Bool)

(assert (=> b!1181444 (= e!671681 e!671682)))

(declare-fun res!785100 () Bool)

(assert (=> b!1181444 (=> (not res!785100) (not e!671682))))

(declare-fun lt!534369 () array!76325)

(assert (=> b!1181444 (= res!785100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534369 mask!1564))))

(assert (=> b!1181444 (= lt!534369 (array!76326 (store (arr!36812 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37348 _keys!1208)))))

(declare-fun b!1181445 () Bool)

(declare-fun res!785088 () Bool)

(assert (=> b!1181445 (=> (not res!785088) (not e!671681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181445 (= res!785088 (validKeyInArray!0 k!934))))

(declare-fun b!1181446 () Bool)

(declare-fun e!671686 () Bool)

(assert (=> b!1181446 (= e!671690 e!671686)))

(declare-fun res!785093 () Bool)

(assert (=> b!1181446 (=> res!785093 e!671686)))

(assert (=> b!1181446 (= res!785093 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44809)

(declare-fun lt!534375 () ListLongMap!17103)

(declare-fun lt!534373 () array!76327)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44809)

(declare-fun getCurrentListMapNoExtraKeys!5020 (array!76325 array!76327 (_ BitVec 32) (_ BitVec 32) V!44809 V!44809 (_ BitVec 32) Int) ListLongMap!17103)

(assert (=> b!1181446 (= lt!534375 (getCurrentListMapNoExtraKeys!5020 lt!534369 lt!534373 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534370 () V!44809)

(assert (=> b!1181446 (= lt!534373 (array!76328 (store (arr!36813 _values!996) i!673 (ValueCellFull!14171 lt!534370)) (size!37349 _values!996)))))

(declare-fun dynLambda!2975 (Int (_ BitVec 64)) V!44809)

(assert (=> b!1181446 (= lt!534370 (dynLambda!2975 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181446 (= lt!534377 (getCurrentListMapNoExtraKeys!5020 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181447 () Bool)

(declare-fun e!671689 () Bool)

(assert (=> b!1181447 (= e!671689 (and e!671683 mapRes!46469))))

(declare-fun condMapEmpty!46469 () Bool)

(declare-fun mapDefault!46469 () ValueCell!14171)

