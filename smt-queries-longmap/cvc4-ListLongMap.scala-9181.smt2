; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110438 () Bool)

(assert start!110438)

(declare-fun res!867367 () Bool)

(declare-fun e!745412 () Bool)

(assert (=> start!110438 (=> (not res!867367) (not e!745412))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110438 (= res!867367 (validMask!0 mask!2040))))

(assert (=> start!110438 e!745412))

(assert (=> start!110438 true))

(declare-datatypes ((V!51773 0))(
  ( (V!51774 (val!17576 Int)) )
))
(declare-datatypes ((ValueCell!16603 0))(
  ( (ValueCellFull!16603 (v!20203 V!51773)) (EmptyCell!16603) )
))
(declare-datatypes ((array!87022 0))(
  ( (array!87023 (arr!41991 (Array (_ BitVec 32) ValueCell!16603)) (size!42541 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87022)

(declare-fun e!745410 () Bool)

(declare-fun array_inv!31747 (array!87022) Bool)

(assert (=> start!110438 (and (array_inv!31747 _values!1354) e!745410)))

(declare-datatypes ((array!87024 0))(
  ( (array!87025 (arr!41992 (Array (_ BitVec 32) (_ BitVec 64))) (size!42542 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87024)

(declare-fun array_inv!31748 (array!87024) Bool)

(assert (=> start!110438 (array_inv!31748 _keys!1628)))

(declare-fun b!1306552 () Bool)

(declare-fun res!867369 () Bool)

(assert (=> b!1306552 (=> (not res!867369) (not e!745412))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306552 (= res!867369 (and (= (size!42541 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42542 _keys!1628) (size!42541 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54133 () Bool)

(declare-fun mapRes!54133 () Bool)

(declare-fun tp!103213 () Bool)

(declare-fun e!745408 () Bool)

(assert (=> mapNonEmpty!54133 (= mapRes!54133 (and tp!103213 e!745408))))

(declare-fun mapValue!54133 () ValueCell!16603)

(declare-fun mapRest!54133 () (Array (_ BitVec 32) ValueCell!16603))

(declare-fun mapKey!54133 () (_ BitVec 32))

(assert (=> mapNonEmpty!54133 (= (arr!41991 _values!1354) (store mapRest!54133 mapKey!54133 mapValue!54133))))

(declare-fun b!1306553 () Bool)

(declare-fun res!867368 () Bool)

(assert (=> b!1306553 (=> (not res!867368) (not e!745412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87024 (_ BitVec 32)) Bool)

(assert (=> b!1306553 (= res!867368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306554 () Bool)

(declare-fun tp_is_empty!35003 () Bool)

(assert (=> b!1306554 (= e!745408 tp_is_empty!35003)))

(declare-fun mapIsEmpty!54133 () Bool)

(assert (=> mapIsEmpty!54133 mapRes!54133))

(declare-fun b!1306555 () Bool)

(declare-fun e!745411 () Bool)

(assert (=> b!1306555 (= e!745410 (and e!745411 mapRes!54133))))

(declare-fun condMapEmpty!54133 () Bool)

(declare-fun mapDefault!54133 () ValueCell!16603)

