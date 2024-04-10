; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99150 () Bool)

(assert start!99150)

(declare-fun b_free!24755 () Bool)

(declare-fun b_next!24755 () Bool)

(assert (=> start!99150 (= b_free!24755 (not b_next!24755))))

(declare-fun tp!86976 () Bool)

(declare-fun b_and!40359 () Bool)

(assert (=> start!99150 (= tp!86976 b_and!40359)))

(declare-fun b!1166796 () Bool)

(declare-fun e!663218 () Bool)

(assert (=> b!1166796 (= e!663218 true)))

(declare-datatypes ((V!44173 0))(
  ( (V!44174 (val!14699 Int)) )
))
(declare-fun zeroValue!944 () V!44173)

(declare-datatypes ((array!75401 0))(
  ( (array!75402 (arr!36351 (Array (_ BitVec 32) (_ BitVec 64))) (size!36887 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13933 0))(
  ( (ValueCellFull!13933 (v!17336 V!44173)) (EmptyCell!13933) )
))
(declare-datatypes ((array!75403 0))(
  ( (array!75404 (arr!36352 (Array (_ BitVec 32) ValueCell!13933)) (size!36888 (_ BitVec 32))) )
))
(declare-fun lt!525391 () array!75403)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525388 () array!75401)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!75403)

(declare-fun minValue!944 () V!44173)

(declare-datatypes ((tuple2!18748 0))(
  ( (tuple2!18749 (_1!9385 (_ BitVec 64)) (_2!9385 V!44173)) )
))
(declare-datatypes ((List!25489 0))(
  ( (Nil!25486) (Cons!25485 (h!26694 tuple2!18748) (t!37236 List!25489)) )
))
(declare-datatypes ((ListLongMap!16717 0))(
  ( (ListLongMap!16718 (toList!8374 List!25489)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4838 (array!75401 array!75403 (_ BitVec 32) (_ BitVec 32) V!44173 V!44173 (_ BitVec 32) Int) ListLongMap!16717)

(declare-fun -!1450 (ListLongMap!16717 (_ BitVec 64)) ListLongMap!16717)

(assert (=> b!1166796 (= (getCurrentListMapNoExtraKeys!4838 lt!525388 lt!525391 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1450 (getCurrentListMapNoExtraKeys!4838 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38502 0))(
  ( (Unit!38503) )
))
(declare-fun lt!525393 () Unit!38502)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!677 (array!75401 array!75403 (_ BitVec 32) (_ BitVec 32) V!44173 V!44173 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38502)

(assert (=> b!1166796 (= lt!525393 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!677 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166797 () Bool)

(declare-fun res!773967 () Bool)

(declare-fun e!663223 () Bool)

(assert (=> b!1166797 (=> (not res!773967) (not e!663223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75401 (_ BitVec 32)) Bool)

(assert (=> b!1166797 (= res!773967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166798 () Bool)

(declare-fun res!773970 () Bool)

(assert (=> b!1166798 (=> (not res!773970) (not e!663223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166798 (= res!773970 (validMask!0 mask!1564))))

(declare-fun b!1166799 () Bool)

(declare-fun e!663222 () Bool)

(assert (=> b!1166799 (= e!663223 e!663222)))

(declare-fun res!773968 () Bool)

(assert (=> b!1166799 (=> (not res!773968) (not e!663222))))

(assert (=> b!1166799 (= res!773968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525388 mask!1564))))

(assert (=> b!1166799 (= lt!525388 (array!75402 (store (arr!36351 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36887 _keys!1208)))))

(declare-fun mapNonEmpty!45752 () Bool)

(declare-fun mapRes!45752 () Bool)

(declare-fun tp!86975 () Bool)

(declare-fun e!663221 () Bool)

(assert (=> mapNonEmpty!45752 (= mapRes!45752 (and tp!86975 e!663221))))

(declare-fun mapRest!45752 () (Array (_ BitVec 32) ValueCell!13933))

(declare-fun mapKey!45752 () (_ BitVec 32))

(declare-fun mapValue!45752 () ValueCell!13933)

(assert (=> mapNonEmpty!45752 (= (arr!36352 _values!996) (store mapRest!45752 mapKey!45752 mapValue!45752))))

(declare-fun b!1166801 () Bool)

(declare-fun res!773975 () Bool)

(assert (=> b!1166801 (=> (not res!773975) (not e!663223))))

(assert (=> b!1166801 (= res!773975 (= (select (arr!36351 _keys!1208) i!673) k!934))))

(declare-fun b!1166802 () Bool)

(declare-fun e!663224 () Bool)

(assert (=> b!1166802 (= e!663222 (not e!663224))))

(declare-fun res!773964 () Bool)

(assert (=> b!1166802 (=> res!773964 e!663224)))

(assert (=> b!1166802 (= res!773964 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166802 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!525392 () Unit!38502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75401 (_ BitVec 64) (_ BitVec 32)) Unit!38502)

(assert (=> b!1166802 (= lt!525392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166803 () Bool)

(declare-fun tp_is_empty!29285 () Bool)

(assert (=> b!1166803 (= e!663221 tp_is_empty!29285)))

(declare-fun mapIsEmpty!45752 () Bool)

(assert (=> mapIsEmpty!45752 mapRes!45752))

(declare-fun b!1166804 () Bool)

(declare-fun res!773969 () Bool)

(assert (=> b!1166804 (=> (not res!773969) (not e!663223))))

(declare-datatypes ((List!25490 0))(
  ( (Nil!25487) (Cons!25486 (h!26695 (_ BitVec 64)) (t!37237 List!25490)) )
))
(declare-fun arrayNoDuplicates!0 (array!75401 (_ BitVec 32) List!25490) Bool)

(assert (=> b!1166804 (= res!773969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25487))))

(declare-fun b!1166805 () Bool)

(declare-fun e!663219 () Bool)

(assert (=> b!1166805 (= e!663219 tp_is_empty!29285)))

(declare-fun b!1166806 () Bool)

(declare-fun res!773972 () Bool)

(assert (=> b!1166806 (=> (not res!773972) (not e!663223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166806 (= res!773972 (validKeyInArray!0 k!934))))

(declare-fun b!1166800 () Bool)

(declare-fun res!773966 () Bool)

(assert (=> b!1166800 (=> (not res!773966) (not e!663222))))

(assert (=> b!1166800 (= res!773966 (arrayNoDuplicates!0 lt!525388 #b00000000000000000000000000000000 Nil!25487))))

(declare-fun res!773974 () Bool)

(assert (=> start!99150 (=> (not res!773974) (not e!663223))))

(assert (=> start!99150 (= res!773974 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36887 _keys!1208))))))

(assert (=> start!99150 e!663223))

(assert (=> start!99150 tp_is_empty!29285))

(declare-fun array_inv!27796 (array!75401) Bool)

(assert (=> start!99150 (array_inv!27796 _keys!1208)))

(assert (=> start!99150 true))

(assert (=> start!99150 tp!86976))

(declare-fun e!663225 () Bool)

(declare-fun array_inv!27797 (array!75403) Bool)

(assert (=> start!99150 (and (array_inv!27797 _values!996) e!663225)))

(declare-fun b!1166807 () Bool)

(declare-fun res!773973 () Bool)

(assert (=> b!1166807 (=> (not res!773973) (not e!663223))))

(assert (=> b!1166807 (= res!773973 (and (= (size!36888 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36887 _keys!1208) (size!36888 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166808 () Bool)

(declare-fun res!773971 () Bool)

(assert (=> b!1166808 (=> (not res!773971) (not e!663223))))

(assert (=> b!1166808 (= res!773971 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36887 _keys!1208))))))

(declare-fun b!1166809 () Bool)

(assert (=> b!1166809 (= e!663225 (and e!663219 mapRes!45752))))

(declare-fun condMapEmpty!45752 () Bool)

(declare-fun mapDefault!45752 () ValueCell!13933)

