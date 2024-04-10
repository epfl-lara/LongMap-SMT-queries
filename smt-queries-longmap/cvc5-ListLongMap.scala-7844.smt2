; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97808 () Bool)

(assert start!97808)

(declare-fun b_free!23509 () Bool)

(declare-fun b_next!23509 () Bool)

(assert (=> start!97808 (= b_free!23509 (not b_next!23509))))

(declare-fun tp!83231 () Bool)

(declare-fun b_and!37801 () Bool)

(assert (=> start!97808 (= tp!83231 b_and!37801)))

(declare-fun b!1119122 () Bool)

(declare-fun res!747519 () Bool)

(declare-fun e!637385 () Bool)

(assert (=> b!1119122 (=> (not res!747519) (not e!637385))))

(declare-datatypes ((array!72965 0))(
  ( (array!72966 (arr!35135 (Array (_ BitVec 32) (_ BitVec 64))) (size!35671 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72965)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72965 (_ BitVec 32)) Bool)

(assert (=> b!1119122 (= res!747519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119123 () Bool)

(declare-fun res!747514 () Bool)

(assert (=> b!1119123 (=> (not res!747514) (not e!637385))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1119123 (= res!747514 (= (select (arr!35135 _keys!1208) i!673) k!934))))

(declare-fun b!1119124 () Bool)

(declare-fun res!747521 () Bool)

(assert (=> b!1119124 (=> (not res!747521) (not e!637385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119124 (= res!747521 (validMask!0 mask!1564))))

(declare-fun b!1119125 () Bool)

(declare-fun e!637380 () Bool)

(assert (=> b!1119125 (= e!637380 true)))

(declare-datatypes ((V!42513 0))(
  ( (V!42514 (val!14076 Int)) )
))
(declare-fun zeroValue!944 () V!42513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!497667 () array!72965)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13310 0))(
  ( (ValueCellFull!13310 (v!16709 V!42513)) (EmptyCell!13310) )
))
(declare-datatypes ((array!72967 0))(
  ( (array!72968 (arr!35136 (Array (_ BitVec 32) ValueCell!13310)) (size!35672 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72967)

(declare-fun minValue!944 () V!42513)

(declare-datatypes ((tuple2!17660 0))(
  ( (tuple2!17661 (_1!8841 (_ BitVec 64)) (_2!8841 V!42513)) )
))
(declare-datatypes ((List!24445 0))(
  ( (Nil!24442) (Cons!24441 (h!25650 tuple2!17660) (t!34946 List!24445)) )
))
(declare-datatypes ((ListLongMap!15629 0))(
  ( (ListLongMap!15630 (toList!7830 List!24445)) )
))
(declare-fun lt!497666 () ListLongMap!15629)

(declare-fun getCurrentListMapNoExtraKeys!4320 (array!72965 array!72967 (_ BitVec 32) (_ BitVec 32) V!42513 V!42513 (_ BitVec 32) Int) ListLongMap!15629)

(declare-fun dynLambda!2424 (Int (_ BitVec 64)) V!42513)

(assert (=> b!1119125 (= lt!497666 (getCurrentListMapNoExtraKeys!4320 lt!497667 (array!72968 (store (arr!35136 _values!996) i!673 (ValueCellFull!13310 (dynLambda!2424 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35672 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497669 () ListLongMap!15629)

(assert (=> b!1119125 (= lt!497669 (getCurrentListMapNoExtraKeys!4320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119126 () Bool)

(declare-fun res!747522 () Bool)

(assert (=> b!1119126 (=> (not res!747522) (not e!637385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119126 (= res!747522 (validKeyInArray!0 k!934))))

(declare-fun b!1119127 () Bool)

(declare-fun res!747523 () Bool)

(assert (=> b!1119127 (=> (not res!747523) (not e!637385))))

(assert (=> b!1119127 (= res!747523 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35671 _keys!1208))))))

(declare-fun b!1119128 () Bool)

(declare-fun e!637382 () Bool)

(declare-fun e!637386 () Bool)

(declare-fun mapRes!43876 () Bool)

(assert (=> b!1119128 (= e!637382 (and e!637386 mapRes!43876))))

(declare-fun condMapEmpty!43876 () Bool)

(declare-fun mapDefault!43876 () ValueCell!13310)

