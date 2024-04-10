; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108050 () Bool)

(assert start!108050)

(declare-fun mapIsEmpty!51512 () Bool)

(declare-fun mapRes!51512 () Bool)

(assert (=> mapIsEmpty!51512 mapRes!51512))

(declare-fun res!848127 () Bool)

(declare-fun e!728676 () Bool)

(assert (=> start!108050 (=> (not res!848127) (not e!728676))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108050 (= res!848127 (validMask!0 mask!1805))))

(assert (=> start!108050 e!728676))

(assert (=> start!108050 true))

(declare-datatypes ((V!49533 0))(
  ( (V!49534 (val!16736 Int)) )
))
(declare-datatypes ((ValueCell!15763 0))(
  ( (ValueCellFull!15763 (v!19333 V!49533)) (EmptyCell!15763) )
))
(declare-datatypes ((array!83740 0))(
  ( (array!83741 (arr!40382 (Array (_ BitVec 32) ValueCell!15763)) (size!40932 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83740)

(declare-fun e!728679 () Bool)

(declare-fun array_inv!30691 (array!83740) Bool)

(assert (=> start!108050 (and (array_inv!30691 _values!1187) e!728679)))

(declare-datatypes ((array!83742 0))(
  ( (array!83743 (arr!40383 (Array (_ BitVec 32) (_ BitVec 64))) (size!40933 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83742)

(declare-fun array_inv!30692 (array!83742) Bool)

(assert (=> start!108050 (array_inv!30692 _keys!1427)))

(declare-fun b!1276152 () Bool)

(declare-fun e!728678 () Bool)

(declare-fun tp_is_empty!33323 () Bool)

(assert (=> b!1276152 (= e!728678 tp_is_empty!33323)))

(declare-fun b!1276153 () Bool)

(assert (=> b!1276153 (= e!728676 (bvsgt #b00000000000000000000000000000000 (size!40933 _keys!1427)))))

(declare-fun b!1276154 () Bool)

(declare-fun res!848125 () Bool)

(assert (=> b!1276154 (=> (not res!848125) (not e!728676))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276154 (= res!848125 (and (= (size!40932 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40933 _keys!1427) (size!40932 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51512 () Bool)

(declare-fun tp!98270 () Bool)

(declare-fun e!728677 () Bool)

(assert (=> mapNonEmpty!51512 (= mapRes!51512 (and tp!98270 e!728677))))

(declare-fun mapValue!51512 () ValueCell!15763)

(declare-fun mapRest!51512 () (Array (_ BitVec 32) ValueCell!15763))

(declare-fun mapKey!51512 () (_ BitVec 32))

(assert (=> mapNonEmpty!51512 (= (arr!40382 _values!1187) (store mapRest!51512 mapKey!51512 mapValue!51512))))

(declare-fun b!1276155 () Bool)

(assert (=> b!1276155 (= e!728677 tp_is_empty!33323)))

(declare-fun b!1276156 () Bool)

(declare-fun res!848124 () Bool)

(assert (=> b!1276156 (=> (not res!848124) (not e!728676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83742 (_ BitVec 32)) Bool)

(assert (=> b!1276156 (= res!848124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276157 () Bool)

(declare-fun res!848126 () Bool)

(assert (=> b!1276157 (=> (not res!848126) (not e!728676))))

(declare-datatypes ((List!28637 0))(
  ( (Nil!28634) (Cons!28633 (h!29842 (_ BitVec 64)) (t!42173 List!28637)) )
))
(declare-fun arrayNoDuplicates!0 (array!83742 (_ BitVec 32) List!28637) Bool)

(assert (=> b!1276157 (= res!848126 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28634))))

(declare-fun b!1276158 () Bool)

(assert (=> b!1276158 (= e!728679 (and e!728678 mapRes!51512))))

(declare-fun condMapEmpty!51512 () Bool)

(declare-fun mapDefault!51512 () ValueCell!15763)

