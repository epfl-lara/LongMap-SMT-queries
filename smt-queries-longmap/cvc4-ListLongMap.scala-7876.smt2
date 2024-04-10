; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98004 () Bool)

(assert start!98004)

(declare-fun b_free!23705 () Bool)

(declare-fun b_next!23705 () Bool)

(assert (=> start!98004 (= b_free!23705 (not b_next!23705))))

(declare-fun tp!83818 () Bool)

(declare-fun b_and!38193 () Bool)

(assert (=> start!98004 (= tp!83818 b_and!38193)))

(declare-fun b!1124202 () Bool)

(declare-fun e!639975 () Bool)

(declare-fun e!639980 () Bool)

(assert (=> b!1124202 (= e!639975 e!639980)))

(declare-fun res!751135 () Bool)

(assert (=> b!1124202 (=> res!751135 e!639980)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124202 (= res!751135 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42773 0))(
  ( (V!42774 (val!14174 Int)) )
))
(declare-fun zeroValue!944 () V!42773)

(declare-datatypes ((tuple2!17804 0))(
  ( (tuple2!17805 (_1!8913 (_ BitVec 64)) (_2!8913 V!42773)) )
))
(declare-datatypes ((List!24583 0))(
  ( (Nil!24580) (Cons!24579 (h!25788 tuple2!17804) (t!35280 List!24583)) )
))
(declare-datatypes ((ListLongMap!15773 0))(
  ( (ListLongMap!15774 (toList!7902 List!24583)) )
))
(declare-fun lt!499373 () ListLongMap!15773)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42773)

(declare-datatypes ((array!73337 0))(
  ( (array!73338 (arr!35321 (Array (_ BitVec 32) (_ BitVec 64))) (size!35857 (_ BitVec 32))) )
))
(declare-fun lt!499376 () array!73337)

(declare-datatypes ((ValueCell!13408 0))(
  ( (ValueCellFull!13408 (v!16807 V!42773)) (EmptyCell!13408) )
))
(declare-datatypes ((array!73339 0))(
  ( (array!73340 (arr!35322 (Array (_ BitVec 32) ValueCell!13408)) (size!35858 (_ BitVec 32))) )
))
(declare-fun lt!499369 () array!73339)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4390 (array!73337 array!73339 (_ BitVec 32) (_ BitVec 32) V!42773 V!42773 (_ BitVec 32) Int) ListLongMap!15773)

(assert (=> b!1124202 (= lt!499373 (getCurrentListMapNoExtraKeys!4390 lt!499376 lt!499369 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73339)

(declare-fun dynLambda!2486 (Int (_ BitVec 64)) V!42773)

(assert (=> b!1124202 (= lt!499369 (array!73340 (store (arr!35322 _values!996) i!673 (ValueCellFull!13408 (dynLambda!2486 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35858 _values!996)))))

(declare-fun _keys!1208 () array!73337)

(declare-fun lt!499374 () ListLongMap!15773)

(assert (=> b!1124202 (= lt!499374 (getCurrentListMapNoExtraKeys!4390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124203 () Bool)

(declare-fun res!751126 () Bool)

(declare-fun e!639974 () Bool)

(assert (=> b!1124203 (=> (not res!751126) (not e!639974))))

(declare-datatypes ((List!24584 0))(
  ( (Nil!24581) (Cons!24580 (h!25789 (_ BitVec 64)) (t!35281 List!24584)) )
))
(declare-fun arrayNoDuplicates!0 (array!73337 (_ BitVec 32) List!24584) Bool)

(assert (=> b!1124203 (= res!751126 (arrayNoDuplicates!0 lt!499376 #b00000000000000000000000000000000 Nil!24581))))

(declare-fun b!1124204 () Bool)

(declare-fun e!639984 () Bool)

(assert (=> b!1124204 (= e!639984 e!639974)))

(declare-fun res!751128 () Bool)

(assert (=> b!1124204 (=> (not res!751128) (not e!639974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73337 (_ BitVec 32)) Bool)

(assert (=> b!1124204 (= res!751128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499376 mask!1564))))

(assert (=> b!1124204 (= lt!499376 (array!73338 (store (arr!35321 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35857 _keys!1208)))))

(declare-fun b!1124205 () Bool)

(declare-fun res!751134 () Bool)

(assert (=> b!1124205 (=> (not res!751134) (not e!639984))))

(assert (=> b!1124205 (= res!751134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124206 () Bool)

(declare-fun e!639983 () Bool)

(declare-fun e!639976 () Bool)

(declare-fun mapRes!44170 () Bool)

(assert (=> b!1124206 (= e!639983 (and e!639976 mapRes!44170))))

(declare-fun condMapEmpty!44170 () Bool)

(declare-fun mapDefault!44170 () ValueCell!13408)

