; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97628 () Bool)

(assert start!97628)

(declare-fun mapNonEmpty!43606 () Bool)

(declare-fun mapRes!43606 () Bool)

(declare-fun tp!82850 () Bool)

(declare-fun e!635655 () Bool)

(assert (=> mapNonEmpty!43606 (= mapRes!43606 (and tp!82850 e!635655))))

(declare-datatypes ((V!42273 0))(
  ( (V!42274 (val!13986 Int)) )
))
(declare-datatypes ((ValueCell!13220 0))(
  ( (ValueCellFull!13220 (v!16619 V!42273)) (EmptyCell!13220) )
))
(declare-fun mapValue!43606 () ValueCell!13220)

(declare-fun mapRest!43606 () (Array (_ BitVec 32) ValueCell!13220))

(declare-fun mapKey!43606 () (_ BitVec 32))

(declare-datatypes ((array!72619 0))(
  ( (array!72620 (arr!34962 (Array (_ BitVec 32) ValueCell!13220)) (size!35498 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72619)

(assert (=> mapNonEmpty!43606 (= (arr!34962 _values!996) (store mapRest!43606 mapKey!43606 mapValue!43606))))

(declare-fun b!1115485 () Bool)

(declare-fun res!744711 () Bool)

(declare-fun e!635652 () Bool)

(assert (=> b!1115485 (=> (not res!744711) (not e!635652))))

(declare-datatypes ((array!72621 0))(
  ( (array!72622 (arr!34963 (Array (_ BitVec 32) (_ BitVec 64))) (size!35499 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72621)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72621 (_ BitVec 32)) Bool)

(assert (=> b!1115485 (= res!744711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115486 () Bool)

(declare-fun res!744712 () Bool)

(assert (=> b!1115486 (=> (not res!744712) (not e!635652))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115486 (= res!744712 (validKeyInArray!0 k!934))))

(declare-fun b!1115487 () Bool)

(declare-fun res!744707 () Bool)

(assert (=> b!1115487 (=> (not res!744707) (not e!635652))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115487 (= res!744707 (and (= (size!35498 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35499 _keys!1208) (size!35498 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115488 () Bool)

(declare-fun e!635650 () Bool)

(assert (=> b!1115488 (= e!635652 e!635650)))

(declare-fun res!744706 () Bool)

(assert (=> b!1115488 (=> (not res!744706) (not e!635650))))

(declare-fun lt!496987 () array!72621)

(assert (=> b!1115488 (= res!744706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496987 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115488 (= lt!496987 (array!72622 (store (arr!34963 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35499 _keys!1208)))))

(declare-fun b!1115489 () Bool)

(declare-fun res!744703 () Bool)

(assert (=> b!1115489 (=> (not res!744703) (not e!635652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115489 (= res!744703 (validMask!0 mask!1564))))

(declare-fun b!1115490 () Bool)

(declare-fun e!635653 () Bool)

(declare-fun e!635654 () Bool)

(assert (=> b!1115490 (= e!635653 (and e!635654 mapRes!43606))))

(declare-fun condMapEmpty!43606 () Bool)

(declare-fun mapDefault!43606 () ValueCell!13220)

