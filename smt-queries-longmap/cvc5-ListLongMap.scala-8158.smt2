; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99814 () Bool)

(assert start!99814)

(declare-fun b_free!25393 () Bool)

(declare-fun b_next!25393 () Bool)

(assert (=> start!99814 (= b_free!25393 (not b_next!25393))))

(declare-fun tp!88893 () Bool)

(declare-fun b_and!41653 () Bool)

(assert (=> start!99814 (= tp!88893 b_and!41653)))

(declare-fun res!788746 () Bool)

(declare-fun e!674613 () Bool)

(assert (=> start!99814 (=> (not res!788746) (not e!674613))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76641 0))(
  ( (array!76642 (arr!36970 (Array (_ BitVec 32) (_ BitVec 64))) (size!37506 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76641)

(assert (=> start!99814 (= res!788746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37506 _keys!1208))))))

(assert (=> start!99814 e!674613))

(declare-fun tp_is_empty!29923 () Bool)

(assert (=> start!99814 tp_is_empty!29923))

(declare-fun array_inv!28212 (array!76641) Bool)

(assert (=> start!99814 (array_inv!28212 _keys!1208)))

(assert (=> start!99814 true))

(assert (=> start!99814 tp!88893))

(declare-datatypes ((V!45025 0))(
  ( (V!45026 (val!15018 Int)) )
))
(declare-datatypes ((ValueCell!14252 0))(
  ( (ValueCellFull!14252 (v!17656 V!45025)) (EmptyCell!14252) )
))
(declare-datatypes ((array!76643 0))(
  ( (array!76644 (arr!36971 (Array (_ BitVec 32) ValueCell!14252)) (size!37507 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76643)

(declare-fun e!674610 () Bool)

(declare-fun array_inv!28213 (array!76643) Bool)

(assert (=> start!99814 (and (array_inv!28213 _values!996) e!674610)))

(declare-fun b!1186469 () Bool)

(declare-fun e!674605 () Bool)

(assert (=> b!1186469 (= e!674605 true)))

(declare-datatypes ((tuple2!19272 0))(
  ( (tuple2!19273 (_1!9647 (_ BitVec 64)) (_2!9647 V!45025)) )
))
(declare-datatypes ((List!26012 0))(
  ( (Nil!26009) (Cons!26008 (h!27217 tuple2!19272) (t!38397 List!26012)) )
))
(declare-datatypes ((ListLongMap!17241 0))(
  ( (ListLongMap!17242 (toList!8636 List!26012)) )
))
(declare-fun lt!538959 () ListLongMap!17241)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!538953 () ListLongMap!17241)

(declare-fun -!1668 (ListLongMap!17241 (_ BitVec 64)) ListLongMap!17241)

(assert (=> b!1186469 (= (-!1668 lt!538959 k!934) lt!538953)))

(declare-fun lt!538958 () ListLongMap!17241)

(declare-fun lt!538970 () V!45025)

(declare-datatypes ((Unit!39328 0))(
  ( (Unit!39329) )
))
(declare-fun lt!538954 () Unit!39328)

(declare-fun addRemoveCommutativeForDiffKeys!192 (ListLongMap!17241 (_ BitVec 64) V!45025 (_ BitVec 64)) Unit!39328)

(assert (=> b!1186469 (= lt!538954 (addRemoveCommutativeForDiffKeys!192 lt!538958 (select (arr!36970 _keys!1208) from!1455) lt!538970 k!934))))

(declare-fun lt!538957 () ListLongMap!17241)

(declare-fun lt!538963 () ListLongMap!17241)

(declare-fun lt!538961 () ListLongMap!17241)

(assert (=> b!1186469 (and (= lt!538957 lt!538959) (= lt!538961 lt!538963))))

(declare-fun lt!538971 () tuple2!19272)

(declare-fun +!3929 (ListLongMap!17241 tuple2!19272) ListLongMap!17241)

(assert (=> b!1186469 (= lt!538959 (+!3929 lt!538958 lt!538971))))

(assert (=> b!1186469 (not (= (select (arr!36970 _keys!1208) from!1455) k!934))))

(declare-fun lt!538964 () Unit!39328)

(declare-fun e!674608 () Unit!39328)

(assert (=> b!1186469 (= lt!538964 e!674608)))

(declare-fun c!117213 () Bool)

(assert (=> b!1186469 (= c!117213 (= (select (arr!36970 _keys!1208) from!1455) k!934))))

(declare-fun e!674607 () Bool)

(assert (=> b!1186469 e!674607))

(declare-fun res!788750 () Bool)

(assert (=> b!1186469 (=> (not res!788750) (not e!674607))))

(declare-fun lt!538966 () ListLongMap!17241)

(assert (=> b!1186469 (= res!788750 (= lt!538966 lt!538953))))

(assert (=> b!1186469 (= lt!538953 (+!3929 lt!538961 lt!538971))))

(assert (=> b!1186469 (= lt!538971 (tuple2!19273 (select (arr!36970 _keys!1208) from!1455) lt!538970))))

(declare-fun lt!538968 () V!45025)

(declare-fun get!18934 (ValueCell!14252 V!45025) V!45025)

(assert (=> b!1186469 (= lt!538970 (get!18934 (select (arr!36971 _values!996) from!1455) lt!538968))))

(declare-fun b!1186470 () Bool)

(declare-fun e!674604 () Bool)

(assert (=> b!1186470 (= e!674607 e!674604)))

(declare-fun res!788756 () Bool)

(assert (=> b!1186470 (=> res!788756 e!674604)))

(assert (=> b!1186470 (= res!788756 (not (= (select (arr!36970 _keys!1208) from!1455) k!934)))))

(declare-fun b!1186471 () Bool)

(declare-fun res!788751 () Bool)

(assert (=> b!1186471 (=> (not res!788751) (not e!674613))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76641 (_ BitVec 32)) Bool)

(assert (=> b!1186471 (= res!788751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186472 () Bool)

(declare-fun e!674606 () Bool)

(declare-fun e!674614 () Bool)

(assert (=> b!1186472 (= e!674606 (not e!674614))))

(declare-fun res!788747 () Bool)

(assert (=> b!1186472 (=> res!788747 e!674614)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186472 (= res!788747 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186472 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538956 () Unit!39328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76641 (_ BitVec 64) (_ BitVec 32)) Unit!39328)

(assert (=> b!1186472 (= lt!538956 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186473 () Bool)

(declare-fun res!788749 () Bool)

(assert (=> b!1186473 (=> (not res!788749) (not e!674613))))

(assert (=> b!1186473 (= res!788749 (= (select (arr!36970 _keys!1208) i!673) k!934))))

(declare-fun b!1186474 () Bool)

(declare-fun e!674611 () Bool)

(assert (=> b!1186474 (= e!674611 tp_is_empty!29923)))

(declare-fun b!1186475 () Bool)

(declare-fun Unit!39330 () Unit!39328)

(assert (=> b!1186475 (= e!674608 Unit!39330)))

(declare-fun b!1186476 () Bool)

(assert (=> b!1186476 (= e!674604 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186477 () Bool)

(declare-fun res!788754 () Bool)

(assert (=> b!1186477 (=> (not res!788754) (not e!674606))))

(declare-fun lt!538960 () array!76641)

(declare-datatypes ((List!26013 0))(
  ( (Nil!26010) (Cons!26009 (h!27218 (_ BitVec 64)) (t!38398 List!26013)) )
))
(declare-fun arrayNoDuplicates!0 (array!76641 (_ BitVec 32) List!26013) Bool)

(assert (=> b!1186477 (= res!788754 (arrayNoDuplicates!0 lt!538960 #b00000000000000000000000000000000 Nil!26010))))

(declare-fun b!1186478 () Bool)

(declare-fun e!674603 () Bool)

(declare-fun mapRes!46712 () Bool)

(assert (=> b!1186478 (= e!674610 (and e!674603 mapRes!46712))))

(declare-fun condMapEmpty!46712 () Bool)

(declare-fun mapDefault!46712 () ValueCell!14252)

