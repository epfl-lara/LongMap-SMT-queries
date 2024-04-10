; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108114 () Bool)

(assert start!108114)

(declare-fun b_free!27827 () Bool)

(declare-fun b_next!27827 () Bool)

(assert (=> start!108114 (= b_free!27827 (not b_next!27827))))

(declare-fun tp!98434 () Bool)

(declare-fun b_and!45883 () Bool)

(assert (=> start!108114 (= tp!98434 b_and!45883)))

(declare-fun res!848465 () Bool)

(declare-fun e!729111 () Bool)

(assert (=> start!108114 (=> (not res!848465) (not e!729111))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108114 (= res!848465 (validMask!0 mask!1805))))

(assert (=> start!108114 e!729111))

(assert (=> start!108114 true))

(assert (=> start!108114 tp!98434))

(declare-fun tp_is_empty!33377 () Bool)

(assert (=> start!108114 tp_is_empty!33377))

(declare-datatypes ((V!49605 0))(
  ( (V!49606 (val!16763 Int)) )
))
(declare-datatypes ((ValueCell!15790 0))(
  ( (ValueCellFull!15790 (v!19360 V!49605)) (EmptyCell!15790) )
))
(declare-datatypes ((array!83846 0))(
  ( (array!83847 (arr!40434 (Array (_ BitVec 32) ValueCell!15790)) (size!40984 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83846)

(declare-fun e!729108 () Bool)

(declare-fun array_inv!30727 (array!83846) Bool)

(assert (=> start!108114 (and (array_inv!30727 _values!1187) e!729108)))

(declare-datatypes ((array!83848 0))(
  ( (array!83849 (arr!40435 (Array (_ BitVec 32) (_ BitVec 64))) (size!40985 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83848)

(declare-fun array_inv!30728 (array!83848) Bool)

(assert (=> start!108114 (array_inv!30728 _keys!1427)))

(declare-fun mapIsEmpty!51596 () Bool)

(declare-fun mapRes!51596 () Bool)

(assert (=> mapIsEmpty!51596 mapRes!51596))

(declare-fun b!1276754 () Bool)

(declare-fun e!729110 () Bool)

(assert (=> b!1276754 (= e!729110 tp_is_empty!33377)))

(declare-fun b!1276755 () Bool)

(declare-fun e!729107 () Bool)

(assert (=> b!1276755 (= e!729107 tp_is_empty!33377)))

(declare-fun b!1276756 () Bool)

(declare-fun res!848464 () Bool)

(assert (=> b!1276756 (=> (not res!848464) (not e!729111))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276756 (= res!848464 (and (= (size!40984 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40985 _keys!1427) (size!40984 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276757 () Bool)

(declare-fun res!848466 () Bool)

(assert (=> b!1276757 (=> (not res!848466) (not e!729111))))

(declare-datatypes ((List!28673 0))(
  ( (Nil!28670) (Cons!28669 (h!29878 (_ BitVec 64)) (t!42209 List!28673)) )
))
(declare-fun arrayNoDuplicates!0 (array!83848 (_ BitVec 32) List!28673) Bool)

(assert (=> b!1276757 (= res!848466 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28670))))

(declare-fun b!1276758 () Bool)

(declare-fun res!848463 () Bool)

(assert (=> b!1276758 (=> (not res!848463) (not e!729111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83848 (_ BitVec 32)) Bool)

(assert (=> b!1276758 (= res!848463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276759 () Bool)

(assert (=> b!1276759 (= e!729108 (and e!729110 mapRes!51596))))

(declare-fun condMapEmpty!51596 () Bool)

(declare-fun mapDefault!51596 () ValueCell!15790)

