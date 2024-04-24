; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104870 () Bool)

(assert start!104870)

(declare-fun b!1249060 () Bool)

(declare-fun res!833045 () Bool)

(declare-fun e!708778 () Bool)

(assert (=> b!1249060 (=> (not res!833045) (not e!708778))))

(declare-datatypes ((array!80473 0))(
  ( (array!80474 (arr!38801 (Array (_ BitVec 32) (_ BitVec 64))) (size!39338 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80473)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80473 (_ BitVec 32)) Bool)

(assert (=> b!1249060 (= res!833045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249061 () Bool)

(declare-fun e!708776 () Bool)

(declare-fun tp_is_empty!31375 () Bool)

(assert (=> b!1249061 (= e!708776 tp_is_empty!31375)))

(declare-fun res!833046 () Bool)

(assert (=> start!104870 (=> (not res!833046) (not e!708778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104870 (= res!833046 (validMask!0 mask!1466))))

(assert (=> start!104870 e!708778))

(assert (=> start!104870 true))

(declare-fun array_inv!29721 (array!80473) Bool)

(assert (=> start!104870 (array_inv!29721 _keys!1118)))

(declare-datatypes ((V!47199 0))(
  ( (V!47200 (val!15750 Int)) )
))
(declare-datatypes ((ValueCell!14924 0))(
  ( (ValueCellFull!14924 (v!18442 V!47199)) (EmptyCell!14924) )
))
(declare-datatypes ((array!80475 0))(
  ( (array!80476 (arr!38802 (Array (_ BitVec 32) ValueCell!14924)) (size!39339 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80475)

(declare-fun e!708777 () Bool)

(declare-fun array_inv!29722 (array!80475) Bool)

(assert (=> start!104870 (and (array_inv!29722 _values!914) e!708777)))

(declare-fun b!1249062 () Bool)

(declare-fun e!708779 () Bool)

(declare-fun mapRes!48817 () Bool)

(assert (=> b!1249062 (= e!708777 (and e!708779 mapRes!48817))))

(declare-fun condMapEmpty!48817 () Bool)

(declare-fun mapDefault!48817 () ValueCell!14924)

(assert (=> b!1249062 (= condMapEmpty!48817 (= (arr!38802 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14924)) mapDefault!48817)))))

(declare-fun b!1249063 () Bool)

(declare-fun res!833047 () Bool)

(assert (=> b!1249063 (=> (not res!833047) (not e!708778))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249063 (= res!833047 (and (= (size!39339 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39338 _keys!1118) (size!39339 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48817 () Bool)

(declare-fun tp!92918 () Bool)

(assert (=> mapNonEmpty!48817 (= mapRes!48817 (and tp!92918 e!708776))))

(declare-fun mapValue!48817 () ValueCell!14924)

(declare-fun mapRest!48817 () (Array (_ BitVec 32) ValueCell!14924))

(declare-fun mapKey!48817 () (_ BitVec 32))

(assert (=> mapNonEmpty!48817 (= (arr!38802 _values!914) (store mapRest!48817 mapKey!48817 mapValue!48817))))

(declare-fun b!1249064 () Bool)

(assert (=> b!1249064 (= e!708779 tp_is_empty!31375)))

(declare-fun mapIsEmpty!48817 () Bool)

(assert (=> mapIsEmpty!48817 mapRes!48817))

(declare-fun b!1249065 () Bool)

(assert (=> b!1249065 (= e!708778 false)))

(declare-fun lt!563798 () Bool)

(declare-datatypes ((List!27562 0))(
  ( (Nil!27559) (Cons!27558 (h!28776 (_ BitVec 64)) (t!41023 List!27562)) )
))
(declare-fun arrayNoDuplicates!0 (array!80473 (_ BitVec 32) List!27562) Bool)

(assert (=> b!1249065 (= lt!563798 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27559))))

(assert (= (and start!104870 res!833046) b!1249063))

(assert (= (and b!1249063 res!833047) b!1249060))

(assert (= (and b!1249060 res!833045) b!1249065))

(assert (= (and b!1249062 condMapEmpty!48817) mapIsEmpty!48817))

(assert (= (and b!1249062 (not condMapEmpty!48817)) mapNonEmpty!48817))

(get-info :version)

(assert (= (and mapNonEmpty!48817 ((_ is ValueCellFull!14924) mapValue!48817)) b!1249061))

(assert (= (and b!1249062 ((_ is ValueCellFull!14924) mapDefault!48817)) b!1249064))

(assert (= start!104870 b!1249062))

(declare-fun m!1150771 () Bool)

(assert (=> b!1249060 m!1150771))

(declare-fun m!1150773 () Bool)

(assert (=> start!104870 m!1150773))

(declare-fun m!1150775 () Bool)

(assert (=> start!104870 m!1150775))

(declare-fun m!1150777 () Bool)

(assert (=> start!104870 m!1150777))

(declare-fun m!1150779 () Bool)

(assert (=> mapNonEmpty!48817 m!1150779))

(declare-fun m!1150781 () Bool)

(assert (=> b!1249065 m!1150781))

(check-sat (not b!1249065) tp_is_empty!31375 (not mapNonEmpty!48817) (not b!1249060) (not start!104870))
(check-sat)
