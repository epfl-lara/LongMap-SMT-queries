; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97874 () Bool)

(assert start!97874)

(declare-fun b_free!23575 () Bool)

(declare-fun b_next!23575 () Bool)

(assert (=> start!97874 (= b_free!23575 (not b_next!23575))))

(declare-fun tp!83429 () Bool)

(declare-fun b_and!37933 () Bool)

(assert (=> start!97874 (= tp!83429 b_and!37933)))

(declare-fun b!1120580 () Bool)

(declare-fun res!748604 () Bool)

(declare-fun e!638083 () Bool)

(assert (=> b!1120580 (=> (not res!748604) (not e!638083))))

(declare-datatypes ((array!73091 0))(
  ( (array!73092 (arr!35198 (Array (_ BitVec 32) (_ BitVec 64))) (size!35734 (_ BitVec 32))) )
))
(declare-fun lt!498070 () array!73091)

(declare-datatypes ((List!24487 0))(
  ( (Nil!24484) (Cons!24483 (h!25692 (_ BitVec 64)) (t!35054 List!24487)) )
))
(declare-fun arrayNoDuplicates!0 (array!73091 (_ BitVec 32) List!24487) Bool)

(assert (=> b!1120580 (= res!748604 (arrayNoDuplicates!0 lt!498070 #b00000000000000000000000000000000 Nil!24484))))

(declare-fun b!1120581 () Bool)

(declare-fun res!748614 () Bool)

(declare-fun e!638081 () Bool)

(assert (=> b!1120581 (=> (not res!748614) (not e!638081))))

(declare-fun _keys!1208 () array!73091)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73091 (_ BitVec 32)) Bool)

(assert (=> b!1120581 (= res!748614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42601 0))(
  ( (V!42602 (val!14109 Int)) )
))
(declare-fun zeroValue!944 () V!42601)

(declare-datatypes ((tuple2!17702 0))(
  ( (tuple2!17703 (_1!8862 (_ BitVec 64)) (_2!8862 V!42601)) )
))
(declare-datatypes ((List!24488 0))(
  ( (Nil!24485) (Cons!24484 (h!25693 tuple2!17702) (t!35055 List!24488)) )
))
(declare-datatypes ((ListLongMap!15671 0))(
  ( (ListLongMap!15672 (toList!7851 List!24488)) )
))
(declare-fun call!47007 () ListLongMap!15671)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13343 0))(
  ( (ValueCellFull!13343 (v!16742 V!42601)) (EmptyCell!13343) )
))
(declare-datatypes ((array!73093 0))(
  ( (array!73094 (arr!35199 (Array (_ BitVec 32) ValueCell!13343)) (size!35735 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73093)

(declare-fun minValue!944 () V!42601)

(declare-fun bm!47004 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4341 (array!73091 array!73093 (_ BitVec 32) (_ BitVec 32) V!42601 V!42601 (_ BitVec 32) Int) ListLongMap!15671)

(assert (=> bm!47004 (= call!47007 (getCurrentListMapNoExtraKeys!4341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120582 () Bool)

(declare-fun e!638077 () Bool)

(assert (=> b!1120582 (= e!638083 (not e!638077))))

(declare-fun res!748607 () Bool)

(assert (=> b!1120582 (=> res!748607 e!638077)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120582 (= res!748607 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120582 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36768 0))(
  ( (Unit!36769) )
))
(declare-fun lt!498069 () Unit!36768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73091 (_ BitVec 64) (_ BitVec 32)) Unit!36768)

(assert (=> b!1120582 (= lt!498069 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1120583 () Bool)

(declare-fun res!748615 () Bool)

(assert (=> b!1120583 (=> (not res!748615) (not e!638081))))

(assert (=> b!1120583 (= res!748615 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24484))))

(declare-fun b!1120584 () Bool)

(declare-fun e!638079 () Bool)

(declare-fun e!638080 () Bool)

(declare-fun mapRes!43975 () Bool)

(assert (=> b!1120584 (= e!638079 (and e!638080 mapRes!43975))))

(declare-fun condMapEmpty!43975 () Bool)

(declare-fun mapDefault!43975 () ValueCell!13343)

