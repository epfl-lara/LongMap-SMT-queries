; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110464 () Bool)

(assert start!110464)

(declare-fun b!1306786 () Bool)

(declare-fun res!867484 () Bool)

(declare-fun e!745605 () Bool)

(assert (=> b!1306786 (=> (not res!867484) (not e!745605))))

(declare-datatypes ((array!87068 0))(
  ( (array!87069 (arr!42014 (Array (_ BitVec 32) (_ BitVec 64))) (size!42564 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87068)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51809 0))(
  ( (V!51810 (val!17589 Int)) )
))
(declare-datatypes ((ValueCell!16616 0))(
  ( (ValueCellFull!16616 (v!20216 V!51809)) (EmptyCell!16616) )
))
(declare-datatypes ((array!87070 0))(
  ( (array!87071 (arr!42015 (Array (_ BitVec 32) ValueCell!16616)) (size!42565 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87070)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306786 (= res!867484 (and (= (size!42565 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42564 _keys!1628) (size!42565 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54172 () Bool)

(declare-fun mapRes!54172 () Bool)

(declare-fun tp!103252 () Bool)

(declare-fun e!745603 () Bool)

(assert (=> mapNonEmpty!54172 (= mapRes!54172 (and tp!103252 e!745603))))

(declare-fun mapRest!54172 () (Array (_ BitVec 32) ValueCell!16616))

(declare-fun mapKey!54172 () (_ BitVec 32))

(declare-fun mapValue!54172 () ValueCell!16616)

(assert (=> mapNonEmpty!54172 (= (arr!42015 _values!1354) (store mapRest!54172 mapKey!54172 mapValue!54172))))

(declare-fun b!1306787 () Bool)

(declare-fun tp_is_empty!35029 () Bool)

(assert (=> b!1306787 (= e!745603 tp_is_empty!35029)))

(declare-fun b!1306788 () Bool)

(declare-fun res!867485 () Bool)

(assert (=> b!1306788 (=> (not res!867485) (not e!745605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87068 (_ BitVec 32)) Bool)

(assert (=> b!1306788 (= res!867485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54172 () Bool)

(assert (=> mapIsEmpty!54172 mapRes!54172))

(declare-fun b!1306789 () Bool)

(declare-fun e!745607 () Bool)

(assert (=> b!1306789 (= e!745607 tp_is_empty!35029)))

(declare-fun b!1306790 () Bool)

(declare-fun e!745606 () Bool)

(assert (=> b!1306790 (= e!745606 (and e!745607 mapRes!54172))))

(declare-fun condMapEmpty!54172 () Bool)

(declare-fun mapDefault!54172 () ValueCell!16616)

