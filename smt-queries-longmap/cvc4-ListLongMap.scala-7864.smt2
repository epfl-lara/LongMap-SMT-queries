; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97932 () Bool)

(assert start!97932)

(declare-fun b_free!23633 () Bool)

(declare-fun b_next!23633 () Bool)

(assert (=> start!97932 (= b_free!23633 (not b_next!23633))))

(declare-fun tp!83603 () Bool)

(declare-fun b_and!38049 () Bool)

(assert (=> start!97932 (= tp!83603 b_and!38049)))

(declare-datatypes ((V!42677 0))(
  ( (V!42678 (val!14138 Int)) )
))
(declare-fun zeroValue!944 () V!42677)

(declare-fun bm!47178 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13372 0))(
  ( (ValueCellFull!13372 (v!16771 V!42677)) (EmptyCell!13372) )
))
(declare-datatypes ((array!73205 0))(
  ( (array!73206 (arr!35255 (Array (_ BitVec 32) ValueCell!13372)) (size!35791 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73205)

(declare-fun minValue!944 () V!42677)

(declare-datatypes ((array!73207 0))(
  ( (array!73208 (arr!35256 (Array (_ BitVec 32) (_ BitVec 64))) (size!35792 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73207)

(declare-datatypes ((tuple2!17750 0))(
  ( (tuple2!17751 (_1!8886 (_ BitVec 64)) (_2!8886 V!42677)) )
))
(declare-datatypes ((List!24531 0))(
  ( (Nil!24528) (Cons!24527 (h!25736 tuple2!17750) (t!35156 List!24531)) )
))
(declare-datatypes ((ListLongMap!15719 0))(
  ( (ListLongMap!15720 (toList!7875 List!24531)) )
))
(declare-fun call!47181 () ListLongMap!15719)

(declare-fun getCurrentListMapNoExtraKeys!4364 (array!73207 array!73205 (_ BitVec 32) (_ BitVec 32) V!42677 V!42677 (_ BitVec 32) Int) ListLongMap!15719)

(assert (=> bm!47178 (= call!47181 (getCurrentListMapNoExtraKeys!4364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122125 () Bool)

(declare-fun res!749664 () Bool)

(declare-fun e!638877 () Bool)

(assert (=> b!1122125 (=> (not res!749664) (not e!638877))))

(declare-fun lt!498596 () array!73207)

(declare-datatypes ((List!24532 0))(
  ( (Nil!24529) (Cons!24528 (h!25737 (_ BitVec 64)) (t!35157 List!24532)) )
))
(declare-fun arrayNoDuplicates!0 (array!73207 (_ BitVec 32) List!24532) Bool)

(assert (=> b!1122125 (= res!749664 (arrayNoDuplicates!0 lt!498596 #b00000000000000000000000000000000 Nil!24529))))

(declare-fun res!749668 () Bool)

(declare-fun e!638870 () Bool)

(assert (=> start!97932 (=> (not res!749668) (not e!638870))))

(assert (=> start!97932 (= res!749668 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35792 _keys!1208))))))

(assert (=> start!97932 e!638870))

(declare-fun tp_is_empty!28163 () Bool)

(assert (=> start!97932 tp_is_empty!28163))

(declare-fun array_inv!27066 (array!73207) Bool)

(assert (=> start!97932 (array_inv!27066 _keys!1208)))

(assert (=> start!97932 true))

(assert (=> start!97932 tp!83603))

(declare-fun e!638872 () Bool)

(declare-fun array_inv!27067 (array!73205) Bool)

(assert (=> start!97932 (and (array_inv!27067 _values!996) e!638872)))

(declare-fun b!1122126 () Bool)

(declare-fun e!638868 () Bool)

(assert (=> b!1122126 (= e!638877 (not e!638868))))

(declare-fun res!749667 () Bool)

(assert (=> b!1122126 (=> res!749667 e!638868)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122126 (= res!749667 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122126 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36806 0))(
  ( (Unit!36807) )
))
(declare-fun lt!498598 () Unit!36806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73207 (_ BitVec 64) (_ BitVec 32)) Unit!36806)

(assert (=> b!1122126 (= lt!498598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1122127 () Bool)

(declare-fun res!749660 () Bool)

(assert (=> b!1122127 (=> (not res!749660) (not e!638870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122127 (= res!749660 (validKeyInArray!0 k!934))))

(declare-fun b!1122128 () Bool)

(declare-fun e!638876 () Bool)

(declare-fun mapRes!44062 () Bool)

(assert (=> b!1122128 (= e!638872 (and e!638876 mapRes!44062))))

(declare-fun condMapEmpty!44062 () Bool)

(declare-fun mapDefault!44062 () ValueCell!13372)

