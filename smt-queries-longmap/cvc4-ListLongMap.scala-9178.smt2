; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110390 () Bool)

(assert start!110390)

(declare-fun mapNonEmpty!54097 () Bool)

(declare-fun mapRes!54097 () Bool)

(declare-fun tp!103177 () Bool)

(declare-fun e!745203 () Bool)

(assert (=> mapNonEmpty!54097 (= mapRes!54097 (and tp!103177 e!745203))))

(declare-datatypes ((V!51749 0))(
  ( (V!51750 (val!17567 Int)) )
))
(declare-datatypes ((ValueCell!16594 0))(
  ( (ValueCellFull!16594 (v!20193 V!51749)) (EmptyCell!16594) )
))
(declare-fun mapRest!54097 () (Array (_ BitVec 32) ValueCell!16594))

(declare-datatypes ((array!86984 0))(
  ( (array!86985 (arr!41975 (Array (_ BitVec 32) ValueCell!16594)) (size!42525 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86984)

(declare-fun mapValue!54097 () ValueCell!16594)

(declare-fun mapKey!54097 () (_ BitVec 32))

(assert (=> mapNonEmpty!54097 (= (arr!41975 _values!1354) (store mapRest!54097 mapKey!54097 mapValue!54097))))

(declare-fun b!1306274 () Bool)

(declare-fun e!745199 () Bool)

(declare-datatypes ((array!86986 0))(
  ( (array!86987 (arr!41976 (Array (_ BitVec 32) (_ BitVec 64))) (size!42526 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86986)

(assert (=> b!1306274 (= e!745199 (and (bvsle #b00000000000000000000000000000000 (size!42526 _keys!1628)) (bvsge (size!42526 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!54097 () Bool)

(assert (=> mapIsEmpty!54097 mapRes!54097))

(declare-fun b!1306275 () Bool)

(declare-fun e!745202 () Bool)

(declare-fun e!745201 () Bool)

(assert (=> b!1306275 (= e!745202 (and e!745201 mapRes!54097))))

(declare-fun condMapEmpty!54097 () Bool)

(declare-fun mapDefault!54097 () ValueCell!16594)

