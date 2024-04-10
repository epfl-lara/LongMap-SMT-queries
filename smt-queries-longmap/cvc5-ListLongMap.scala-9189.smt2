; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110482 () Bool)

(assert start!110482)

(declare-fun mapIsEmpty!54199 () Bool)

(declare-fun mapRes!54199 () Bool)

(assert (=> mapIsEmpty!54199 mapRes!54199))

(declare-fun res!867569 () Bool)

(declare-fun e!745738 () Bool)

(assert (=> start!110482 (=> (not res!867569) (not e!745738))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110482 (= res!867569 (validMask!0 mask!2040))))

(assert (=> start!110482 e!745738))

(declare-datatypes ((array!87100 0))(
  ( (array!87101 (arr!42030 (Array (_ BitVec 32) (_ BitVec 64))) (size!42580 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87100)

(declare-fun array_inv!31773 (array!87100) Bool)

(assert (=> start!110482 (array_inv!31773 _keys!1628)))

(assert (=> start!110482 true))

(declare-datatypes ((V!51833 0))(
  ( (V!51834 (val!17598 Int)) )
))
(declare-datatypes ((ValueCell!16625 0))(
  ( (ValueCellFull!16625 (v!20225 V!51833)) (EmptyCell!16625) )
))
(declare-datatypes ((array!87102 0))(
  ( (array!87103 (arr!42031 (Array (_ BitVec 32) ValueCell!16625)) (size!42581 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87102)

(declare-fun e!745742 () Bool)

(declare-fun array_inv!31774 (array!87102) Bool)

(assert (=> start!110482 (and (array_inv!31774 _values!1354) e!745742)))

(declare-fun mapNonEmpty!54199 () Bool)

(declare-fun tp!103279 () Bool)

(declare-fun e!745739 () Bool)

(assert (=> mapNonEmpty!54199 (= mapRes!54199 (and tp!103279 e!745739))))

(declare-fun mapValue!54199 () ValueCell!16625)

(declare-fun mapRest!54199 () (Array (_ BitVec 32) ValueCell!16625))

(declare-fun mapKey!54199 () (_ BitVec 32))

(assert (=> mapNonEmpty!54199 (= (arr!42031 _values!1354) (store mapRest!54199 mapKey!54199 mapValue!54199))))

(declare-fun b!1306950 () Bool)

(declare-fun res!867567 () Bool)

(assert (=> b!1306950 (=> (not res!867567) (not e!745738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87100 (_ BitVec 32)) Bool)

(assert (=> b!1306950 (= res!867567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306951 () Bool)

(declare-fun e!745741 () Bool)

(assert (=> b!1306951 (= e!745742 (and e!745741 mapRes!54199))))

(declare-fun condMapEmpty!54199 () Bool)

(declare-fun mapDefault!54199 () ValueCell!16625)

