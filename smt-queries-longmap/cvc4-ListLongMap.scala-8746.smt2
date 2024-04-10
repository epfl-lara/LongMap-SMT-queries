; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106122 () Bool)

(assert start!106122)

(declare-fun b_free!27515 () Bool)

(declare-fun b_next!27515 () Bool)

(assert (=> start!106122 (= b_free!27515 (not b_next!27515))))

(declare-fun tp!96101 () Bool)

(declare-fun b_and!45511 () Bool)

(assert (=> start!106122 (= tp!96101 b_and!45511)))

(declare-fun mapNonEmpty!50452 () Bool)

(declare-fun mapRes!50452 () Bool)

(declare-fun tp!96100 () Bool)

(declare-fun e!719410 () Bool)

(assert (=> mapNonEmpty!50452 (= mapRes!50452 (and tp!96100 e!719410))))

(declare-fun mapKey!50452 () (_ BitVec 32))

(declare-datatypes ((V!48587 0))(
  ( (V!48588 (val!16271 Int)) )
))
(declare-datatypes ((ValueCell!15445 0))(
  ( (ValueCellFull!15445 (v!18982 V!48587)) (EmptyCell!15445) )
))
(declare-fun mapValue!50452 () ValueCell!15445)

(declare-fun mapRest!50452 () (Array (_ BitVec 32) ValueCell!15445))

(declare-datatypes ((array!82458 0))(
  ( (array!82459 (arr!39774 (Array (_ BitVec 32) ValueCell!15445)) (size!40310 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82458)

(assert (=> mapNonEmpty!50452 (= (arr!39774 _values!914) (store mapRest!50452 mapKey!50452 mapValue!50452))))

(declare-fun b!1263578 () Bool)

(declare-fun res!841635 () Bool)

(declare-fun e!719412 () Bool)

(assert (=> b!1263578 (=> (not res!841635) (not e!719412))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82460 0))(
  ( (array!82461 (arr!39775 (Array (_ BitVec 32) (_ BitVec 64))) (size!40311 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82460)

(assert (=> b!1263578 (= res!841635 (and (= (size!40310 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40311 _keys!1118) (size!40310 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263579 () Bool)

(declare-fun tp_is_empty!32417 () Bool)

(assert (=> b!1263579 (= e!719410 tp_is_empty!32417)))

(declare-fun mapIsEmpty!50452 () Bool)

(assert (=> mapIsEmpty!50452 mapRes!50452))

(declare-fun b!1263580 () Bool)

(declare-fun res!841632 () Bool)

(assert (=> b!1263580 (=> (not res!841632) (not e!719412))))

(declare-datatypes ((List!28258 0))(
  ( (Nil!28255) (Cons!28254 (h!29463 (_ BitVec 64)) (t!41773 List!28258)) )
))
(declare-fun arrayNoDuplicates!0 (array!82460 (_ BitVec 32) List!28258) Bool)

(assert (=> b!1263580 (= res!841632 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28255))))

(declare-fun res!841631 () Bool)

(assert (=> start!106122 (=> (not res!841631) (not e!719412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106122 (= res!841631 (validMask!0 mask!1466))))

(assert (=> start!106122 e!719412))

(assert (=> start!106122 true))

(assert (=> start!106122 tp!96101))

(assert (=> start!106122 tp_is_empty!32417))

(declare-fun array_inv!30271 (array!82460) Bool)

(assert (=> start!106122 (array_inv!30271 _keys!1118)))

(declare-fun e!719411 () Bool)

(declare-fun array_inv!30272 (array!82458) Bool)

(assert (=> start!106122 (and (array_inv!30272 _values!914) e!719411)))

(declare-fun b!1263581 () Bool)

(declare-fun res!841634 () Bool)

(assert (=> b!1263581 (=> (not res!841634) (not e!719412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82460 (_ BitVec 32)) Bool)

(assert (=> b!1263581 (= res!841634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263582 () Bool)

(declare-fun e!719409 () Bool)

(assert (=> b!1263582 (= e!719411 (and e!719409 mapRes!50452))))

(declare-fun condMapEmpty!50452 () Bool)

(declare-fun mapDefault!50452 () ValueCell!15445)

