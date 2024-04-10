; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99280 () Bool)

(assert start!99280)

(declare-fun b_free!24859 () Bool)

(declare-fun b_next!24859 () Bool)

(assert (=> start!99280 (= b_free!24859 (not b_next!24859))))

(declare-fun tp!87291 () Bool)

(declare-fun b_and!40585 () Bool)

(assert (=> start!99280 (= tp!87291 b_and!40585)))

(declare-fun b!1169506 () Bool)

(declare-fun e!664693 () Bool)

(declare-fun e!664691 () Bool)

(assert (=> b!1169506 (= e!664693 e!664691)))

(declare-fun res!776029 () Bool)

(assert (=> b!1169506 (=> res!776029 e!664691)))

(declare-datatypes ((array!75601 0))(
  ( (array!75602 (arr!36450 (Array (_ BitVec 32) (_ BitVec 64))) (size!36986 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75601)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169506 (= res!776029 (not (validKeyInArray!0 (select (arr!36450 _keys!1208) from!1455))))))

(declare-datatypes ((V!44313 0))(
  ( (V!44314 (val!14751 Int)) )
))
(declare-datatypes ((tuple2!18834 0))(
  ( (tuple2!18835 (_1!9428 (_ BitVec 64)) (_2!9428 V!44313)) )
))
(declare-datatypes ((List!25571 0))(
  ( (Nil!25568) (Cons!25567 (h!26776 tuple2!18834) (t!37422 List!25571)) )
))
(declare-datatypes ((ListLongMap!16803 0))(
  ( (ListLongMap!16804 (toList!8417 List!25571)) )
))
(declare-fun lt!526632 () ListLongMap!16803)

(declare-fun lt!526630 () ListLongMap!16803)

(assert (=> b!1169506 (= lt!526632 lt!526630)))

(declare-fun lt!526626 () ListLongMap!16803)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1488 (ListLongMap!16803 (_ BitVec 64)) ListLongMap!16803)

(assert (=> b!1169506 (= lt!526630 (-!1488 lt!526626 k!934))))

(declare-fun zeroValue!944 () V!44313)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13985 0))(
  ( (ValueCellFull!13985 (v!17389 V!44313)) (EmptyCell!13985) )
))
(declare-datatypes ((array!75603 0))(
  ( (array!75604 (arr!36451 (Array (_ BitVec 32) ValueCell!13985)) (size!36987 (_ BitVec 32))) )
))
(declare-fun lt!526624 () array!75603)

(declare-fun lt!526631 () array!75601)

(declare-fun minValue!944 () V!44313)

(declare-fun getCurrentListMapNoExtraKeys!4881 (array!75601 array!75603 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) Int) ListLongMap!16803)

(assert (=> b!1169506 (= lt!526632 (getCurrentListMapNoExtraKeys!4881 lt!526631 lt!526624 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75603)

(assert (=> b!1169506 (= lt!526626 (getCurrentListMapNoExtraKeys!4881 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38586 0))(
  ( (Unit!38587) )
))
(declare-fun lt!526629 () Unit!38586)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!715 (array!75601 array!75603 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38586)

(assert (=> b!1169506 (= lt!526629 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!715 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169507 () Bool)

(declare-fun res!776027 () Bool)

(declare-fun e!664692 () Bool)

(assert (=> b!1169507 (=> (not res!776027) (not e!664692))))

(declare-datatypes ((List!25572 0))(
  ( (Nil!25569) (Cons!25568 (h!26777 (_ BitVec 64)) (t!37423 List!25572)) )
))
(declare-fun arrayNoDuplicates!0 (array!75601 (_ BitVec 32) List!25572) Bool)

(assert (=> b!1169507 (= res!776027 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25569))))

(declare-fun b!1169508 () Bool)

(declare-fun e!664688 () Bool)

(declare-fun e!664686 () Bool)

(assert (=> b!1169508 (= e!664688 (not e!664686))))

(declare-fun res!776023 () Bool)

(assert (=> b!1169508 (=> res!776023 e!664686)))

(assert (=> b!1169508 (= res!776023 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169508 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!526623 () Unit!38586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75601 (_ BitVec 64) (_ BitVec 32)) Unit!38586)

(assert (=> b!1169508 (= lt!526623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169509 () Bool)

(declare-fun e!664690 () Bool)

(declare-fun tp_is_empty!29389 () Bool)

(assert (=> b!1169509 (= e!664690 tp_is_empty!29389)))

(declare-fun b!1169510 () Bool)

(declare-fun res!776020 () Bool)

(assert (=> b!1169510 (=> (not res!776020) (not e!664692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75601 (_ BitVec 32)) Bool)

(assert (=> b!1169510 (= res!776020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169511 () Bool)

(assert (=> b!1169511 (= e!664691 true)))

(declare-fun e!664685 () Bool)

(assert (=> b!1169511 e!664685))

(declare-fun res!776019 () Bool)

(assert (=> b!1169511 (=> (not res!776019) (not e!664685))))

(declare-fun lt!526627 () ListLongMap!16803)

(declare-fun lt!526625 () V!44313)

(declare-fun +!3748 (ListLongMap!16803 tuple2!18834) ListLongMap!16803)

(declare-fun get!18582 (ValueCell!13985 V!44313) V!44313)

(assert (=> b!1169511 (= res!776019 (= lt!526627 (+!3748 lt!526630 (tuple2!18835 (select (arr!36450 _keys!1208) from!1455) (get!18582 (select (arr!36451 _values!996) from!1455) lt!526625)))))))

(declare-fun b!1169512 () Bool)

(declare-fun res!776021 () Bool)

(assert (=> b!1169512 (=> (not res!776021) (not e!664692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169512 (= res!776021 (validMask!0 mask!1564))))

(declare-fun b!1169513 () Bool)

(declare-fun res!776018 () Bool)

(assert (=> b!1169513 (=> (not res!776018) (not e!664692))))

(assert (=> b!1169513 (= res!776018 (and (= (size!36987 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36986 _keys!1208) (size!36987 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!776026 () Bool)

(assert (=> start!99280 (=> (not res!776026) (not e!664692))))

(assert (=> start!99280 (= res!776026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36986 _keys!1208))))))

(assert (=> start!99280 e!664692))

(assert (=> start!99280 tp_is_empty!29389))

(declare-fun array_inv!27858 (array!75601) Bool)

(assert (=> start!99280 (array_inv!27858 _keys!1208)))

(assert (=> start!99280 true))

(assert (=> start!99280 tp!87291))

(declare-fun e!664689 () Bool)

(declare-fun array_inv!27859 (array!75603) Bool)

(assert (=> start!99280 (and (array_inv!27859 _values!996) e!664689)))

(declare-fun b!1169514 () Bool)

(declare-fun e!664687 () Bool)

(assert (=> b!1169514 (= e!664685 e!664687)))

(declare-fun res!776031 () Bool)

(assert (=> b!1169514 (=> res!776031 e!664687)))

(assert (=> b!1169514 (= res!776031 (not (= (select (arr!36450 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169515 () Bool)

(declare-fun res!776028 () Bool)

(assert (=> b!1169515 (=> (not res!776028) (not e!664692))))

(assert (=> b!1169515 (= res!776028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36986 _keys!1208))))))

(declare-fun mapIsEmpty!45911 () Bool)

(declare-fun mapRes!45911 () Bool)

(assert (=> mapIsEmpty!45911 mapRes!45911))

(declare-fun b!1169516 () Bool)

(declare-fun e!664684 () Bool)

(assert (=> b!1169516 (= e!664689 (and e!664684 mapRes!45911))))

(declare-fun condMapEmpty!45911 () Bool)

(declare-fun mapDefault!45911 () ValueCell!13985)

