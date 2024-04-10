; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110440 () Bool)

(assert start!110440)

(declare-fun b!1306570 () Bool)

(declare-fun res!867376 () Bool)

(declare-fun e!745423 () Bool)

(assert (=> b!1306570 (=> (not res!867376) (not e!745423))))

(declare-datatypes ((array!87026 0))(
  ( (array!87027 (arr!41993 (Array (_ BitVec 32) (_ BitVec 64))) (size!42543 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87026)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51777 0))(
  ( (V!51778 (val!17577 Int)) )
))
(declare-datatypes ((ValueCell!16604 0))(
  ( (ValueCellFull!16604 (v!20204 V!51777)) (EmptyCell!16604) )
))
(declare-datatypes ((array!87028 0))(
  ( (array!87029 (arr!41994 (Array (_ BitVec 32) ValueCell!16604)) (size!42544 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87028)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306570 (= res!867376 (and (= (size!42544 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42543 _keys!1628) (size!42544 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306571 () Bool)

(assert (=> b!1306571 (= e!745423 false)))

(declare-fun lt!584940 () Bool)

(declare-datatypes ((List!29792 0))(
  ( (Nil!29789) (Cons!29788 (h!30997 (_ BitVec 64)) (t!43398 List!29792)) )
))
(declare-fun arrayNoDuplicates!0 (array!87026 (_ BitVec 32) List!29792) Bool)

(assert (=> b!1306571 (= lt!584940 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29789))))

(declare-fun b!1306573 () Bool)

(declare-fun e!745424 () Bool)

(declare-fun tp_is_empty!35005 () Bool)

(assert (=> b!1306573 (= e!745424 tp_is_empty!35005)))

(declare-fun b!1306574 () Bool)

(declare-fun e!745425 () Bool)

(declare-fun e!745426 () Bool)

(declare-fun mapRes!54136 () Bool)

(assert (=> b!1306574 (= e!745425 (and e!745426 mapRes!54136))))

(declare-fun condMapEmpty!54136 () Bool)

(declare-fun mapDefault!54136 () ValueCell!16604)

