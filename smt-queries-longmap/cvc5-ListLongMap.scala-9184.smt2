; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110452 () Bool)

(assert start!110452)

(declare-fun b!1306678 () Bool)

(declare-fun res!867431 () Bool)

(declare-fun e!745517 () Bool)

(assert (=> b!1306678 (=> (not res!867431) (not e!745517))))

(declare-datatypes ((array!87048 0))(
  ( (array!87049 (arr!42004 (Array (_ BitVec 32) (_ BitVec 64))) (size!42554 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87048)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87048 (_ BitVec 32)) Bool)

(assert (=> b!1306678 (= res!867431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306679 () Bool)

(declare-fun e!745516 () Bool)

(declare-fun tp_is_empty!35017 () Bool)

(assert (=> b!1306679 (= e!745516 tp_is_empty!35017)))

(declare-fun b!1306680 () Bool)

(assert (=> b!1306680 (= e!745517 false)))

(declare-fun lt!584958 () Bool)

(declare-datatypes ((List!29796 0))(
  ( (Nil!29793) (Cons!29792 (h!31001 (_ BitVec 64)) (t!43402 List!29796)) )
))
(declare-fun arrayNoDuplicates!0 (array!87048 (_ BitVec 32) List!29796) Bool)

(assert (=> b!1306680 (= lt!584958 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29793))))

(declare-fun res!867432 () Bool)

(assert (=> start!110452 (=> (not res!867432) (not e!745517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110452 (= res!867432 (validMask!0 mask!2040))))

(assert (=> start!110452 e!745517))

(assert (=> start!110452 true))

(declare-datatypes ((V!51793 0))(
  ( (V!51794 (val!17583 Int)) )
))
(declare-datatypes ((ValueCell!16610 0))(
  ( (ValueCellFull!16610 (v!20210 V!51793)) (EmptyCell!16610) )
))
(declare-datatypes ((array!87050 0))(
  ( (array!87051 (arr!42005 (Array (_ BitVec 32) ValueCell!16610)) (size!42555 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87050)

(declare-fun e!745515 () Bool)

(declare-fun array_inv!31757 (array!87050) Bool)

(assert (=> start!110452 (and (array_inv!31757 _values!1354) e!745515)))

(declare-fun array_inv!31758 (array!87048) Bool)

(assert (=> start!110452 (array_inv!31758 _keys!1628)))

(declare-fun b!1306681 () Bool)

(declare-fun res!867430 () Bool)

(assert (=> b!1306681 (=> (not res!867430) (not e!745517))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306681 (= res!867430 (and (= (size!42555 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42554 _keys!1628) (size!42555 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306682 () Bool)

(declare-fun e!745513 () Bool)

(declare-fun mapRes!54154 () Bool)

(assert (=> b!1306682 (= e!745515 (and e!745513 mapRes!54154))))

(declare-fun condMapEmpty!54154 () Bool)

(declare-fun mapDefault!54154 () ValueCell!16610)

