; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97652 () Bool)

(assert start!97652)

(declare-fun b!1115952 () Bool)

(declare-fun res!745072 () Bool)

(declare-fun e!635868 () Bool)

(assert (=> b!1115952 (=> (not res!745072) (not e!635868))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72663 0))(
  ( (array!72664 (arr!34984 (Array (_ BitVec 32) (_ BitVec 64))) (size!35520 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72663)

(assert (=> b!1115952 (= res!745072 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35520 _keys!1208))))))

(declare-fun b!1115953 () Bool)

(declare-fun e!635870 () Bool)

(assert (=> b!1115953 (= e!635868 e!635870)))

(declare-fun res!745066 () Bool)

(assert (=> b!1115953 (=> (not res!745066) (not e!635870))))

(declare-fun lt!497059 () array!72663)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72663 (_ BitVec 32)) Bool)

(assert (=> b!1115953 (= res!745066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497059 mask!1564))))

(assert (=> b!1115953 (= lt!497059 (array!72664 (store (arr!34984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35520 _keys!1208)))))

(declare-fun b!1115954 () Bool)

(assert (=> b!1115954 (= e!635870 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115954 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36626 0))(
  ( (Unit!36627) )
))
(declare-fun lt!497060 () Unit!36626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72663 (_ BitVec 64) (_ BitVec 32)) Unit!36626)

(assert (=> b!1115954 (= lt!497060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1115955 () Bool)

(declare-fun res!745063 () Bool)

(assert (=> b!1115955 (=> (not res!745063) (not e!635868))))

(assert (=> b!1115955 (= res!745063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115956 () Bool)

(declare-fun e!635869 () Bool)

(declare-fun e!635867 () Bool)

(declare-fun mapRes!43642 () Bool)

(assert (=> b!1115956 (= e!635869 (and e!635867 mapRes!43642))))

(declare-fun condMapEmpty!43642 () Bool)

(declare-datatypes ((V!42305 0))(
  ( (V!42306 (val!13998 Int)) )
))
(declare-datatypes ((ValueCell!13232 0))(
  ( (ValueCellFull!13232 (v!16631 V!42305)) (EmptyCell!13232) )
))
(declare-datatypes ((array!72665 0))(
  ( (array!72666 (arr!34985 (Array (_ BitVec 32) ValueCell!13232)) (size!35521 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72665)

(declare-fun mapDefault!43642 () ValueCell!13232)

