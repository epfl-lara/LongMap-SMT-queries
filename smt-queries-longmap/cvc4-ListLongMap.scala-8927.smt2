; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108248 () Bool)

(assert start!108248)

(declare-fun b!1278157 () Bool)

(declare-fun e!730065 () Bool)

(declare-fun tp_is_empty!33479 () Bool)

(assert (=> b!1278157 (= e!730065 tp_is_empty!33479)))

(declare-fun mapIsEmpty!51755 () Bool)

(declare-fun mapRes!51755 () Bool)

(assert (=> mapIsEmpty!51755 mapRes!51755))

(declare-fun res!849201 () Bool)

(declare-fun e!730063 () Bool)

(assert (=> start!108248 (=> (not res!849201) (not e!730063))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108248 (= res!849201 (validMask!0 mask!2175))))

(assert (=> start!108248 e!730063))

(assert (=> start!108248 true))

(declare-datatypes ((V!49741 0))(
  ( (V!49742 (val!16814 Int)) )
))
(declare-datatypes ((ValueCell!15841 0))(
  ( (ValueCellFull!15841 (v!19413 V!49741)) (EmptyCell!15841) )
))
(declare-datatypes ((array!84046 0))(
  ( (array!84047 (arr!40532 (Array (_ BitVec 32) ValueCell!15841)) (size!41082 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84046)

(declare-fun e!730062 () Bool)

(declare-fun array_inv!30791 (array!84046) Bool)

(assert (=> start!108248 (and (array_inv!30791 _values!1445) e!730062)))

(declare-datatypes ((array!84048 0))(
  ( (array!84049 (arr!40533 (Array (_ BitVec 32) (_ BitVec 64))) (size!41083 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84048)

(declare-fun array_inv!30792 (array!84048) Bool)

(assert (=> start!108248 (array_inv!30792 _keys!1741)))

(declare-fun b!1278158 () Bool)

(declare-fun e!730064 () Bool)

(assert (=> b!1278158 (= e!730062 (and e!730064 mapRes!51755))))

(declare-fun condMapEmpty!51755 () Bool)

(declare-fun mapDefault!51755 () ValueCell!15841)

