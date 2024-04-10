; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98100 () Bool)

(assert start!98100)

(declare-fun b_free!23801 () Bool)

(declare-fun b_next!23801 () Bool)

(assert (=> start!98100 (= b_free!23801 (not b_next!23801))))

(declare-fun tp!84106 () Bool)

(declare-fun b_and!38385 () Bool)

(assert (=> start!98100 (= tp!84106 b_and!38385)))

(declare-fun b!1127026 () Bool)

(declare-fun e!641482 () Bool)

(declare-fun e!641486 () Bool)

(assert (=> b!1127026 (= e!641482 (not e!641486))))

(declare-fun res!753129 () Bool)

(assert (=> b!1127026 (=> res!753129 e!641486)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127026 (= res!753129 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73523 0))(
  ( (array!73524 (arr!35414 (Array (_ BitVec 32) (_ BitVec 64))) (size!35950 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73523)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127026 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36930 0))(
  ( (Unit!36931) )
))
(declare-fun lt!500437 () Unit!36930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73523 (_ BitVec 64) (_ BitVec 32)) Unit!36930)

(assert (=> b!1127026 (= lt!500437 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1127027 () Bool)

(declare-fun res!753132 () Bool)

(declare-fun e!641484 () Bool)

(assert (=> b!1127027 (=> res!753132 e!641484)))

(declare-datatypes ((V!42901 0))(
  ( (V!42902 (val!14222 Int)) )
))
(declare-fun zeroValue!944 () V!42901)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13456 0))(
  ( (ValueCellFull!13456 (v!16855 V!42901)) (EmptyCell!13456) )
))
(declare-datatypes ((array!73525 0))(
  ( (array!73526 (arr!35415 (Array (_ BitVec 32) ValueCell!13456)) (size!35951 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73525)

(declare-fun minValue!944 () V!42901)

(declare-datatypes ((tuple2!17884 0))(
  ( (tuple2!17885 (_1!8953 (_ BitVec 64)) (_2!8953 V!42901)) )
))
(declare-datatypes ((List!24658 0))(
  ( (Nil!24655) (Cons!24654 (h!25863 tuple2!17884) (t!35451 List!24658)) )
))
(declare-datatypes ((ListLongMap!15853 0))(
  ( (ListLongMap!15854 (toList!7942 List!24658)) )
))
(declare-fun contains!6474 (ListLongMap!15853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4430 (array!73523 array!73525 (_ BitVec 32) (_ BitVec 32) V!42901 V!42901 (_ BitVec 32) Int) ListLongMap!15853)

(assert (=> b!1127027 (= res!753132 (not (contains!6474 (getCurrentListMapNoExtraKeys!4430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934)))))

(declare-fun b!1127028 () Bool)

(declare-fun e!641483 () Bool)

(declare-fun e!641480 () Bool)

(declare-fun mapRes!44314 () Bool)

(assert (=> b!1127028 (= e!641483 (and e!641480 mapRes!44314))))

(declare-fun condMapEmpty!44314 () Bool)

(declare-fun mapDefault!44314 () ValueCell!13456)

