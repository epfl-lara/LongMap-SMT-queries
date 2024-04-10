; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101458 () Bool)

(assert start!101458)

(declare-fun b_free!26275 () Bool)

(declare-fun b_next!26275 () Bool)

(assert (=> start!101458 (= b_free!26275 (not b_next!26275))))

(declare-fun tp!91858 () Bool)

(declare-fun b_and!43739 () Bool)

(assert (=> start!101458 (= tp!91858 b_and!43739)))

(declare-fun b!1219310 () Bool)

(declare-fun e!692320 () Bool)

(assert (=> b!1219310 (= e!692320 true)))

(declare-datatypes ((array!78735 0))(
  ( (array!78736 (arr!37998 (Array (_ BitVec 32) (_ BitVec 64))) (size!38534 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78735)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219310 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40404 0))(
  ( (Unit!40405) )
))
(declare-fun lt!554359 () Unit!40404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40404)

(assert (=> b!1219310 (= lt!554359 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219311 () Bool)

(declare-fun res!809828 () Bool)

(declare-fun e!692314 () Bool)

(assert (=> b!1219311 (=> (not res!809828) (not e!692314))))

(declare-fun lt!554357 () array!78735)

(declare-datatypes ((List!26805 0))(
  ( (Nil!26802) (Cons!26801 (h!28010 (_ BitVec 64)) (t!40060 List!26805)) )
))
(declare-fun arrayNoDuplicates!0 (array!78735 (_ BitVec 32) List!26805) Bool)

(assert (=> b!1219311 (= res!809828 (arrayNoDuplicates!0 lt!554357 #b00000000000000000000000000000000 Nil!26802))))

(declare-fun mapIsEmpty!48355 () Bool)

(declare-fun mapRes!48355 () Bool)

(assert (=> mapIsEmpty!48355 mapRes!48355))

(declare-fun b!1219312 () Bool)

(declare-fun e!692319 () Bool)

(declare-fun e!692312 () Bool)

(assert (=> b!1219312 (= e!692319 e!692312)))

(declare-fun res!809832 () Bool)

(assert (=> b!1219312 (=> res!809832 e!692312)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219312 (= res!809832 (not (validKeyInArray!0 (select (arr!37998 _keys!1208) from!1455))))))

(declare-datatypes ((V!46433 0))(
  ( (V!46434 (val!15546 Int)) )
))
(declare-datatypes ((tuple2!20004 0))(
  ( (tuple2!20005 (_1!10013 (_ BitVec 64)) (_2!10013 V!46433)) )
))
(declare-datatypes ((List!26806 0))(
  ( (Nil!26803) (Cons!26802 (h!28011 tuple2!20004) (t!40061 List!26806)) )
))
(declare-datatypes ((ListLongMap!17973 0))(
  ( (ListLongMap!17974 (toList!9002 List!26806)) )
))
(declare-fun lt!554365 () ListLongMap!17973)

(declare-fun lt!554362 () ListLongMap!17973)

(assert (=> b!1219312 (= lt!554365 lt!554362)))

(declare-fun lt!554360 () ListLongMap!17973)

(declare-fun -!1914 (ListLongMap!17973 (_ BitVec 64)) ListLongMap!17973)

(assert (=> b!1219312 (= lt!554362 (-!1914 lt!554360 k!934))))

(declare-fun zeroValue!944 () V!46433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14780 0))(
  ( (ValueCellFull!14780 (v!18203 V!46433)) (EmptyCell!14780) )
))
(declare-datatypes ((array!78737 0))(
  ( (array!78738 (arr!37999 (Array (_ BitVec 32) ValueCell!14780)) (size!38535 (_ BitVec 32))) )
))
(declare-fun lt!554363 () array!78737)

(declare-fun minValue!944 () V!46433)

(declare-fun getCurrentListMapNoExtraKeys!5427 (array!78735 array!78737 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) Int) ListLongMap!17973)

(assert (=> b!1219312 (= lt!554365 (getCurrentListMapNoExtraKeys!5427 lt!554357 lt!554363 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78737)

(assert (=> b!1219312 (= lt!554360 (getCurrentListMapNoExtraKeys!5427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554367 () Unit!40404)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 (array!78735 array!78737 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40404)

(assert (=> b!1219312 (= lt!554367 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219313 () Bool)

(declare-fun e!692309 () Bool)

(assert (=> b!1219313 (= e!692314 (not e!692309))))

(declare-fun res!809824 () Bool)

(assert (=> b!1219313 (=> res!809824 e!692309)))

(assert (=> b!1219313 (= res!809824 (bvsgt from!1455 i!673))))

(assert (=> b!1219313 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!554366 () Unit!40404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78735 (_ BitVec 64) (_ BitVec 32)) Unit!40404)

(assert (=> b!1219313 (= lt!554366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219314 () Bool)

(declare-fun res!809829 () Bool)

(declare-fun e!692310 () Bool)

(assert (=> b!1219314 (=> (not res!809829) (not e!692310))))

(assert (=> b!1219314 (= res!809829 (and (= (size!38535 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38534 _keys!1208) (size!38535 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219315 () Bool)

(declare-fun e!692316 () Bool)

(declare-fun tp_is_empty!30979 () Bool)

(assert (=> b!1219315 (= e!692316 tp_is_empty!30979)))

(declare-fun b!1219317 () Bool)

(declare-fun res!809825 () Bool)

(assert (=> b!1219317 (=> (not res!809825) (not e!692310))))

(assert (=> b!1219317 (= res!809825 (validKeyInArray!0 k!934))))

(declare-fun b!1219318 () Bool)

(declare-fun res!809823 () Bool)

(assert (=> b!1219318 (=> (not res!809823) (not e!692310))))

(assert (=> b!1219318 (= res!809823 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38534 _keys!1208))))))

(declare-fun b!1219319 () Bool)

(declare-fun e!692311 () Bool)

(assert (=> b!1219319 (= e!692311 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219320 () Bool)

(declare-fun e!692313 () Bool)

(assert (=> b!1219320 (= e!692313 e!692311)))

(declare-fun res!809821 () Bool)

(assert (=> b!1219320 (=> res!809821 e!692311)))

(assert (=> b!1219320 (= res!809821 (not (= (select (arr!37998 _keys!1208) from!1455) k!934)))))

(declare-fun b!1219321 () Bool)

(declare-fun res!809817 () Bool)

(assert (=> b!1219321 (=> (not res!809817) (not e!692310))))

(assert (=> b!1219321 (= res!809817 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26802))))

(declare-fun b!1219322 () Bool)

(assert (=> b!1219322 (= e!692310 e!692314)))

(declare-fun res!809826 () Bool)

(assert (=> b!1219322 (=> (not res!809826) (not e!692314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78735 (_ BitVec 32)) Bool)

(assert (=> b!1219322 (= res!809826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554357 mask!1564))))

(assert (=> b!1219322 (= lt!554357 (array!78736 (store (arr!37998 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38534 _keys!1208)))))

(declare-fun b!1219323 () Bool)

(declare-fun res!809820 () Bool)

(assert (=> b!1219323 (=> (not res!809820) (not e!692310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219323 (= res!809820 (validMask!0 mask!1564))))

(declare-fun b!1219324 () Bool)

(assert (=> b!1219324 (= e!692312 e!692320)))

(declare-fun res!809830 () Bool)

(assert (=> b!1219324 (=> res!809830 e!692320)))

(assert (=> b!1219324 (= res!809830 (not (= (select (arr!37998 _keys!1208) from!1455) k!934)))))

(assert (=> b!1219324 e!692313))

(declare-fun res!809827 () Bool)

(assert (=> b!1219324 (=> (not res!809827) (not e!692313))))

(declare-fun lt!554364 () ListLongMap!17973)

(declare-fun lt!554361 () V!46433)

(declare-fun +!4071 (ListLongMap!17973 tuple2!20004) ListLongMap!17973)

(declare-fun get!19378 (ValueCell!14780 V!46433) V!46433)

(assert (=> b!1219324 (= res!809827 (= lt!554364 (+!4071 lt!554362 (tuple2!20005 (select (arr!37998 _keys!1208) from!1455) (get!19378 (select (arr!37999 _values!996) from!1455) lt!554361)))))))

(declare-fun b!1219325 () Bool)

(declare-fun e!692318 () Bool)

(assert (=> b!1219325 (= e!692318 tp_is_empty!30979)))

(declare-fun b!1219316 () Bool)

(declare-fun e!692315 () Bool)

(assert (=> b!1219316 (= e!692315 (and e!692318 mapRes!48355))))

(declare-fun condMapEmpty!48355 () Bool)

(declare-fun mapDefault!48355 () ValueCell!14780)

