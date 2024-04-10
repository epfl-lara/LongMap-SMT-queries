; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108242 () Bool)

(assert start!108242)

(declare-fun b!1278121 () Bool)

(declare-fun e!730018 () Bool)

(declare-fun tp_is_empty!33473 () Bool)

(assert (=> b!1278121 (= e!730018 tp_is_empty!33473)))

(declare-fun mapNonEmpty!51746 () Bool)

(declare-fun mapRes!51746 () Bool)

(declare-fun tp!98720 () Bool)

(declare-fun e!730017 () Bool)

(assert (=> mapNonEmpty!51746 (= mapRes!51746 (and tp!98720 e!730017))))

(declare-datatypes ((V!49733 0))(
  ( (V!49734 (val!16811 Int)) )
))
(declare-datatypes ((ValueCell!15838 0))(
  ( (ValueCellFull!15838 (v!19410 V!49733)) (EmptyCell!15838) )
))
(declare-fun mapRest!51746 () (Array (_ BitVec 32) ValueCell!15838))

(declare-datatypes ((array!84034 0))(
  ( (array!84035 (arr!40526 (Array (_ BitVec 32) ValueCell!15838)) (size!41076 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84034)

(declare-fun mapKey!51746 () (_ BitVec 32))

(declare-fun mapValue!51746 () ValueCell!15838)

(assert (=> mapNonEmpty!51746 (= (arr!40526 _values!1445) (store mapRest!51746 mapKey!51746 mapValue!51746))))

(declare-fun res!849192 () Bool)

(declare-fun e!730019 () Bool)

(assert (=> start!108242 (=> (not res!849192) (not e!730019))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108242 (= res!849192 (validMask!0 mask!2175))))

(assert (=> start!108242 e!730019))

(assert (=> start!108242 true))

(declare-fun e!730016 () Bool)

(declare-fun array_inv!30785 (array!84034) Bool)

(assert (=> start!108242 (and (array_inv!30785 _values!1445) e!730016)))

(declare-datatypes ((array!84036 0))(
  ( (array!84037 (arr!40527 (Array (_ BitVec 32) (_ BitVec 64))) (size!41077 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84036)

(declare-fun array_inv!30786 (array!84036) Bool)

(assert (=> start!108242 (array_inv!30786 _keys!1741)))

(declare-fun b!1278122 () Bool)

(assert (=> b!1278122 (= e!730017 tp_is_empty!33473)))

(declare-fun b!1278123 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278123 (= e!730019 (and (= (size!41076 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41077 _keys!1741) (size!41076 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011) (not (= (size!41077 _keys!1741) (bvadd #b00000000000000000000000000000001 mask!2175)))))))

(declare-fun mapIsEmpty!51746 () Bool)

(assert (=> mapIsEmpty!51746 mapRes!51746))

(declare-fun b!1278124 () Bool)

(assert (=> b!1278124 (= e!730016 (and e!730018 mapRes!51746))))

(declare-fun condMapEmpty!51746 () Bool)

(declare-fun mapDefault!51746 () ValueCell!15838)

