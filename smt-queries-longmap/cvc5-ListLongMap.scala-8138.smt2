; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99694 () Bool)

(assert start!99694)

(declare-fun b_free!25273 () Bool)

(declare-fun b_next!25273 () Bool)

(assert (=> start!99694 (= b_free!25273 (not b_next!25273))))

(declare-fun tp!88533 () Bool)

(declare-fun b_and!41413 () Bool)

(assert (=> start!99694 (= tp!88533 b_and!41413)))

(declare-fun res!786046 () Bool)

(declare-fun e!672443 () Bool)

(assert (=> start!99694 (=> (not res!786046) (not e!672443))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76409 0))(
  ( (array!76410 (arr!36854 (Array (_ BitVec 32) (_ BitVec 64))) (size!37390 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76409)

(assert (=> start!99694 (= res!786046 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37390 _keys!1208))))))

(assert (=> start!99694 e!672443))

(declare-fun tp_is_empty!29803 () Bool)

(assert (=> start!99694 tp_is_empty!29803))

(declare-fun array_inv!28138 (array!76409) Bool)

(assert (=> start!99694 (array_inv!28138 _keys!1208)))

(assert (=> start!99694 true))

(assert (=> start!99694 tp!88533))

(declare-datatypes ((V!44865 0))(
  ( (V!44866 (val!14958 Int)) )
))
(declare-datatypes ((ValueCell!14192 0))(
  ( (ValueCellFull!14192 (v!17596 V!44865)) (EmptyCell!14192) )
))
(declare-datatypes ((array!76411 0))(
  ( (array!76412 (arr!36855 (Array (_ BitVec 32) ValueCell!14192)) (size!37391 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76411)

(declare-fun e!672453 () Bool)

(declare-fun array_inv!28139 (array!76411) Bool)

(assert (=> start!99694 (and (array_inv!28139 _values!996) e!672453)))

(declare-fun b!1182749 () Bool)

(declare-fun res!786048 () Bool)

(assert (=> b!1182749 (=> (not res!786048) (not e!672443))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182749 (= res!786048 (validKeyInArray!0 k!934))))

(declare-fun b!1182750 () Bool)

(declare-fun e!672446 () Bool)

(declare-fun e!672452 () Bool)

(assert (=> b!1182750 (= e!672446 (not e!672452))))

(declare-fun res!786057 () Bool)

(assert (=> b!1182750 (=> res!786057 e!672452)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182750 (= res!786057 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182750 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39136 0))(
  ( (Unit!39137) )
))
(declare-fun lt!535543 () Unit!39136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76409 (_ BitVec 64) (_ BitVec 32)) Unit!39136)

(assert (=> b!1182750 (= lt!535543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1182751 () Bool)

(declare-fun res!786047 () Bool)

(assert (=> b!1182751 (=> (not res!786047) (not e!672443))))

(assert (=> b!1182751 (= res!786047 (= (select (arr!36854 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!46532 () Bool)

(declare-fun mapRes!46532 () Bool)

(assert (=> mapIsEmpty!46532 mapRes!46532))

(declare-fun b!1182752 () Bool)

(declare-fun e!672451 () Unit!39136)

(declare-fun Unit!39138 () Unit!39136)

(assert (=> b!1182752 (= e!672451 Unit!39138)))

(declare-fun b!1182753 () Bool)

(declare-fun e!672444 () Bool)

(assert (=> b!1182753 (= e!672452 e!672444)))

(declare-fun res!786049 () Bool)

(assert (=> b!1182753 (=> res!786049 e!672444)))

(assert (=> b!1182753 (= res!786049 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44865)

(declare-fun lt!535533 () array!76409)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19172 0))(
  ( (tuple2!19173 (_1!9597 (_ BitVec 64)) (_2!9597 V!44865)) )
))
(declare-datatypes ((List!25913 0))(
  ( (Nil!25910) (Cons!25909 (h!27118 tuple2!19172) (t!38178 List!25913)) )
))
(declare-datatypes ((ListLongMap!17141 0))(
  ( (ListLongMap!17142 (toList!8586 List!25913)) )
))
(declare-fun lt!535536 () ListLongMap!17141)

(declare-fun lt!535548 () array!76411)

(declare-fun minValue!944 () V!44865)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5037 (array!76409 array!76411 (_ BitVec 32) (_ BitVec 32) V!44865 V!44865 (_ BitVec 32) Int) ListLongMap!17141)

(assert (=> b!1182753 (= lt!535536 (getCurrentListMapNoExtraKeys!5037 lt!535533 lt!535548 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535537 () V!44865)

(assert (=> b!1182753 (= lt!535548 (array!76412 (store (arr!36855 _values!996) i!673 (ValueCellFull!14192 lt!535537)) (size!37391 _values!996)))))

(declare-fun dynLambda!2992 (Int (_ BitVec 64)) V!44865)

(assert (=> b!1182753 (= lt!535537 (dynLambda!2992 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535551 () ListLongMap!17141)

(assert (=> b!1182753 (= lt!535551 (getCurrentListMapNoExtraKeys!5037 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182754 () Bool)

(assert (=> b!1182754 (= e!672443 e!672446)))

(declare-fun res!786053 () Bool)

(assert (=> b!1182754 (=> (not res!786053) (not e!672446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76409 (_ BitVec 32)) Bool)

(assert (=> b!1182754 (= res!786053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535533 mask!1564))))

(assert (=> b!1182754 (= lt!535533 (array!76410 (store (arr!36854 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37390 _keys!1208)))))

(declare-fun b!1182755 () Bool)

(declare-fun res!786050 () Bool)

(assert (=> b!1182755 (=> (not res!786050) (not e!672446))))

(declare-datatypes ((List!25914 0))(
  ( (Nil!25911) (Cons!25910 (h!27119 (_ BitVec 64)) (t!38179 List!25914)) )
))
(declare-fun arrayNoDuplicates!0 (array!76409 (_ BitVec 32) List!25914) Bool)

(assert (=> b!1182755 (= res!786050 (arrayNoDuplicates!0 lt!535533 #b00000000000000000000000000000000 Nil!25911))))

(declare-fun b!1182756 () Bool)

(declare-fun res!786045 () Bool)

(assert (=> b!1182756 (=> (not res!786045) (not e!672443))))

(assert (=> b!1182756 (= res!786045 (and (= (size!37391 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37390 _keys!1208) (size!37391 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182757 () Bool)

(declare-fun e!672454 () Bool)

(assert (=> b!1182757 (= e!672454 tp_is_empty!29803)))

(declare-fun b!1182758 () Bool)

(declare-fun res!786051 () Bool)

(assert (=> b!1182758 (=> (not res!786051) (not e!672443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182758 (= res!786051 (validMask!0 mask!1564))))

(declare-fun b!1182759 () Bool)

(assert (=> b!1182759 (= e!672453 (and e!672454 mapRes!46532))))

(declare-fun condMapEmpty!46532 () Bool)

(declare-fun mapDefault!46532 () ValueCell!14192)

