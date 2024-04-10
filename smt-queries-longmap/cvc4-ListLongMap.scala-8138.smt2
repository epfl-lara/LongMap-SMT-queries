; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99698 () Bool)

(assert start!99698)

(declare-fun b_free!25277 () Bool)

(declare-fun b_next!25277 () Bool)

(assert (=> start!99698 (= b_free!25277 (not b_next!25277))))

(declare-fun tp!88544 () Bool)

(declare-fun b_and!41421 () Bool)

(assert (=> start!99698 (= tp!88544 b_and!41421)))

(declare-fun b!1182873 () Bool)

(declare-fun e!672522 () Bool)

(declare-fun e!672519 () Bool)

(assert (=> b!1182873 (= e!672522 e!672519)))

(declare-fun res!786135 () Bool)

(assert (=> b!1182873 (=> (not res!786135) (not e!672519))))

(declare-datatypes ((array!76417 0))(
  ( (array!76418 (arr!36858 (Array (_ BitVec 32) (_ BitVec 64))) (size!37394 (_ BitVec 32))) )
))
(declare-fun lt!535651 () array!76417)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76417 (_ BitVec 32)) Bool)

(assert (=> b!1182873 (= res!786135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535651 mask!1564))))

(declare-fun _keys!1208 () array!76417)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182873 (= lt!535651 (array!76418 (store (arr!36858 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37394 _keys!1208)))))

(declare-fun b!1182874 () Bool)

(declare-fun e!672520 () Bool)

(declare-fun tp_is_empty!29807 () Bool)

(assert (=> b!1182874 (= e!672520 tp_is_empty!29807)))

(declare-fun b!1182875 () Bool)

(declare-fun e!672515 () Bool)

(declare-fun e!672525 () Bool)

(assert (=> b!1182875 (= e!672515 e!672525)))

(declare-fun res!786139 () Bool)

(assert (=> b!1182875 (=> res!786139 e!672525)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182875 (= res!786139 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44869 0))(
  ( (V!44870 (val!14960 Int)) )
))
(declare-fun zeroValue!944 () V!44869)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19176 0))(
  ( (tuple2!19177 (_1!9599 (_ BitVec 64)) (_2!9599 V!44869)) )
))
(declare-datatypes ((List!25917 0))(
  ( (Nil!25914) (Cons!25913 (h!27122 tuple2!19176) (t!38186 List!25917)) )
))
(declare-datatypes ((ListLongMap!17145 0))(
  ( (ListLongMap!17146 (toList!8588 List!25917)) )
))
(declare-fun lt!535663 () ListLongMap!17145)

(declare-datatypes ((ValueCell!14194 0))(
  ( (ValueCellFull!14194 (v!17598 V!44869)) (EmptyCell!14194) )
))
(declare-datatypes ((array!76419 0))(
  ( (array!76420 (arr!36859 (Array (_ BitVec 32) ValueCell!14194)) (size!37395 (_ BitVec 32))) )
))
(declare-fun lt!535665 () array!76419)

(declare-fun minValue!944 () V!44869)

(declare-fun getCurrentListMapNoExtraKeys!5039 (array!76417 array!76419 (_ BitVec 32) (_ BitVec 32) V!44869 V!44869 (_ BitVec 32) Int) ListLongMap!17145)

(assert (=> b!1182875 (= lt!535663 (getCurrentListMapNoExtraKeys!5039 lt!535651 lt!535665 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535658 () V!44869)

(declare-fun _values!996 () array!76419)

(assert (=> b!1182875 (= lt!535665 (array!76420 (store (arr!36859 _values!996) i!673 (ValueCellFull!14194 lt!535658)) (size!37395 _values!996)))))

(declare-fun dynLambda!2994 (Int (_ BitVec 64)) V!44869)

(assert (=> b!1182875 (= lt!535658 (dynLambda!2994 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535661 () ListLongMap!17145)

(assert (=> b!1182875 (= lt!535661 (getCurrentListMapNoExtraKeys!5039 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182876 () Bool)

(declare-fun res!786145 () Bool)

(assert (=> b!1182876 (=> (not res!786145) (not e!672522))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1182876 (= res!786145 (= (select (arr!36858 _keys!1208) i!673) k!934))))

(declare-fun b!1182877 () Bool)

(declare-fun res!786143 () Bool)

(assert (=> b!1182877 (=> (not res!786143) (not e!672522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182877 (= res!786143 (validKeyInArray!0 k!934))))

(declare-fun b!1182878 () Bool)

(declare-fun e!672524 () Bool)

(assert (=> b!1182878 (= e!672524 tp_is_empty!29807)))

(declare-fun b!1182879 () Bool)

(declare-fun e!672526 () Bool)

(declare-fun mapRes!46538 () Bool)

(assert (=> b!1182879 (= e!672526 (and e!672520 mapRes!46538))))

(declare-fun condMapEmpty!46538 () Bool)

(declare-fun mapDefault!46538 () ValueCell!14194)

