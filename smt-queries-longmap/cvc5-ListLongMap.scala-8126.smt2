; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99622 () Bool)

(assert start!99622)

(declare-fun b_free!25201 () Bool)

(declare-fun b_next!25201 () Bool)

(assert (=> start!99622 (= b_free!25201 (not b_next!25201))))

(declare-fun tp!88316 () Bool)

(declare-fun b_and!41269 () Bool)

(assert (=> start!99622 (= tp!88316 b_and!41269)))

(declare-fun b!1180413 () Bool)

(declare-fun res!784322 () Bool)

(declare-fun e!671099 () Bool)

(assert (=> b!1180413 (=> (not res!784322) (not e!671099))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76265 0))(
  ( (array!76266 (arr!36782 (Array (_ BitVec 32) (_ BitVec 64))) (size!37318 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76265)

(assert (=> b!1180413 (= res!784322 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37318 _keys!1208))))))

(declare-fun b!1180414 () Bool)

(declare-datatypes ((Unit!39019 0))(
  ( (Unit!39020) )
))
(declare-fun e!671095 () Unit!39019)

(declare-fun Unit!39021 () Unit!39019)

(assert (=> b!1180414 (= e!671095 Unit!39021)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!533695 () Unit!39019)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39019)

(assert (=> b!1180414 (= lt!533695 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180414 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533697 () Unit!39019)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76265 (_ BitVec 32) (_ BitVec 32)) Unit!39019)

(assert (=> b!1180414 (= lt!533697 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25848 0))(
  ( (Nil!25845) (Cons!25844 (h!27053 (_ BitVec 64)) (t!38041 List!25848)) )
))
(declare-fun arrayNoDuplicates!0 (array!76265 (_ BitVec 32) List!25848) Bool)

(assert (=> b!1180414 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25845)))

(declare-fun lt!533701 () Unit!39019)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76265 (_ BitVec 64) (_ BitVec 32) List!25848) Unit!39019)

(assert (=> b!1180414 (= lt!533701 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25845))))

(assert (=> b!1180414 false))

(declare-fun b!1180415 () Bool)

(declare-fun res!784335 () Bool)

(assert (=> b!1180415 (=> (not res!784335) (not e!671099))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44769 0))(
  ( (V!44770 (val!14922 Int)) )
))
(declare-datatypes ((ValueCell!14156 0))(
  ( (ValueCellFull!14156 (v!17560 V!44769)) (EmptyCell!14156) )
))
(declare-datatypes ((array!76267 0))(
  ( (array!76268 (arr!36783 (Array (_ BitVec 32) ValueCell!14156)) (size!37319 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76267)

(assert (=> b!1180415 (= res!784335 (and (= (size!37319 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37318 _keys!1208) (size!37319 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180416 () Bool)

(declare-fun Unit!39022 () Unit!39019)

(assert (=> b!1180416 (= e!671095 Unit!39022)))

(declare-fun b!1180417 () Bool)

(declare-fun e!671100 () Bool)

(declare-fun e!671102 () Bool)

(assert (=> b!1180417 (= e!671100 e!671102)))

(declare-fun res!784326 () Bool)

(assert (=> b!1180417 (=> res!784326 e!671102)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180417 (= res!784326 (not (validKeyInArray!0 (select (arr!36782 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19110 0))(
  ( (tuple2!19111 (_1!9566 (_ BitVec 64)) (_2!9566 V!44769)) )
))
(declare-datatypes ((List!25849 0))(
  ( (Nil!25846) (Cons!25845 (h!27054 tuple2!19110) (t!38042 List!25849)) )
))
(declare-datatypes ((ListLongMap!17079 0))(
  ( (ListLongMap!17080 (toList!8555 List!25849)) )
))
(declare-fun lt!533696 () ListLongMap!17079)

(declare-fun lt!533692 () ListLongMap!17079)

(assert (=> b!1180417 (= lt!533696 lt!533692)))

(declare-fun lt!533702 () ListLongMap!17079)

(declare-fun -!1597 (ListLongMap!17079 (_ BitVec 64)) ListLongMap!17079)

(assert (=> b!1180417 (= lt!533692 (-!1597 lt!533702 k!934))))

(declare-fun zeroValue!944 () V!44769)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533698 () array!76265)

(declare-fun minValue!944 () V!44769)

(declare-fun lt!533691 () array!76267)

(declare-fun getCurrentListMapNoExtraKeys!5009 (array!76265 array!76267 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) Int) ListLongMap!17079)

(assert (=> b!1180417 (= lt!533696 (getCurrentListMapNoExtraKeys!5009 lt!533698 lt!533691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180417 (= lt!533702 (getCurrentListMapNoExtraKeys!5009 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533689 () Unit!39019)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 (array!76265 array!76267 (_ BitVec 32) (_ BitVec 32) V!44769 V!44769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39019)

(assert (=> b!1180417 (= lt!533689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180418 () Bool)

(declare-fun e!671104 () Bool)

(declare-fun e!671103 () Bool)

(declare-fun mapRes!46424 () Bool)

(assert (=> b!1180418 (= e!671104 (and e!671103 mapRes!46424))))

(declare-fun condMapEmpty!46424 () Bool)

(declare-fun mapDefault!46424 () ValueCell!14156)

