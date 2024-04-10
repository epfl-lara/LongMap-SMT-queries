; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99050 () Bool)

(assert start!99050)

(declare-fun b_free!24655 () Bool)

(declare-fun b_next!24655 () Bool)

(assert (=> start!99050 (= b_free!24655 (not b_next!24655))))

(declare-fun tp!86676 () Bool)

(declare-fun b_and!40159 () Bool)

(assert (=> start!99050 (= tp!86676 b_and!40159)))

(declare-fun mapIsEmpty!45602 () Bool)

(declare-fun mapRes!45602 () Bool)

(assert (=> mapIsEmpty!45602 mapRes!45602))

(declare-fun b!1164534 () Bool)

(declare-fun e!662109 () Bool)

(assert (=> b!1164534 (= e!662109 true)))

(declare-datatypes ((V!44041 0))(
  ( (V!44042 (val!14649 Int)) )
))
(declare-fun zeroValue!944 () V!44041)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13883 0))(
  ( (ValueCellFull!13883 (v!17286 V!44041)) (EmptyCell!13883) )
))
(declare-datatypes ((array!75205 0))(
  ( (array!75206 (arr!36253 (Array (_ BitVec 32) ValueCell!13883)) (size!36789 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75205)

(declare-datatypes ((array!75207 0))(
  ( (array!75208 (arr!36254 (Array (_ BitVec 32) (_ BitVec 64))) (size!36790 (_ BitVec 32))) )
))
(declare-fun lt!524666 () array!75207)

(declare-fun minValue!944 () V!44041)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18684 0))(
  ( (tuple2!18685 (_1!9353 (_ BitVec 64)) (_2!9353 V!44041)) )
))
(declare-datatypes ((List!25417 0))(
  ( (Nil!25414) (Cons!25413 (h!26622 tuple2!18684) (t!37064 List!25417)) )
))
(declare-datatypes ((ListLongMap!16653 0))(
  ( (ListLongMap!16654 (toList!8342 List!25417)) )
))
(declare-fun lt!524667 () ListLongMap!16653)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4806 (array!75207 array!75205 (_ BitVec 32) (_ BitVec 32) V!44041 V!44041 (_ BitVec 32) Int) ListLongMap!16653)

(declare-fun dynLambda!2796 (Int (_ BitVec 64)) V!44041)

(assert (=> b!1164534 (= lt!524667 (getCurrentListMapNoExtraKeys!4806 lt!524666 (array!75206 (store (arr!36253 _values!996) i!673 (ValueCellFull!13883 (dynLambda!2796 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36789 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75207)

(declare-fun lt!524664 () ListLongMap!16653)

(assert (=> b!1164534 (= lt!524664 (getCurrentListMapNoExtraKeys!4806 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164535 () Bool)

(declare-fun res!772260 () Bool)

(declare-fun e!662106 () Bool)

(assert (=> b!1164535 (=> (not res!772260) (not e!662106))))

(declare-datatypes ((List!25418 0))(
  ( (Nil!25415) (Cons!25414 (h!26623 (_ BitVec 64)) (t!37065 List!25418)) )
))
(declare-fun arrayNoDuplicates!0 (array!75207 (_ BitVec 32) List!25418) Bool)

(assert (=> b!1164535 (= res!772260 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25415))))

(declare-fun b!1164536 () Bool)

(declare-fun e!662111 () Bool)

(declare-fun e!662112 () Bool)

(assert (=> b!1164536 (= e!662111 (and e!662112 mapRes!45602))))

(declare-fun condMapEmpty!45602 () Bool)

(declare-fun mapDefault!45602 () ValueCell!13883)

