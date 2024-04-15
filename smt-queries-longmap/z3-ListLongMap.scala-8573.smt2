; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104642 () Bool)

(assert start!104642)

(declare-fun b!1247673 () Bool)

(declare-fun e!707887 () Bool)

(declare-fun tp_is_empty!31375 () Bool)

(assert (=> b!1247673 (= e!707887 tp_is_empty!31375)))

(declare-fun b!1247674 () Bool)

(declare-fun res!832486 () Bool)

(declare-fun e!707883 () Bool)

(assert (=> b!1247674 (=> (not res!832486) (not e!707883))))

(declare-datatypes ((array!80363 0))(
  ( (array!80364 (arr!38751 (Array (_ BitVec 32) (_ BitVec 64))) (size!39289 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80363)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80363 (_ BitVec 32)) Bool)

(assert (=> b!1247674 (= res!832486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247675 () Bool)

(assert (=> b!1247675 (= e!707883 false)))

(declare-fun lt!563135 () Bool)

(declare-datatypes ((List!27601 0))(
  ( (Nil!27598) (Cons!27597 (h!28806 (_ BitVec 64)) (t!41061 List!27601)) )
))
(declare-fun arrayNoDuplicates!0 (array!80363 (_ BitVec 32) List!27601) Bool)

(assert (=> b!1247675 (= lt!563135 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27598))))

(declare-fun res!832487 () Bool)

(assert (=> start!104642 (=> (not res!832487) (not e!707883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104642 (= res!832487 (validMask!0 mask!1466))))

(assert (=> start!104642 e!707883))

(assert (=> start!104642 true))

(declare-fun array_inv!29711 (array!80363) Bool)

(assert (=> start!104642 (array_inv!29711 _keys!1118)))

(declare-datatypes ((V!47199 0))(
  ( (V!47200 (val!15750 Int)) )
))
(declare-datatypes ((ValueCell!14924 0))(
  ( (ValueCellFull!14924 (v!18445 V!47199)) (EmptyCell!14924) )
))
(declare-datatypes ((array!80365 0))(
  ( (array!80366 (arr!38752 (Array (_ BitVec 32) ValueCell!14924)) (size!39290 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80365)

(declare-fun e!707886 () Bool)

(declare-fun array_inv!29712 (array!80365) Bool)

(assert (=> start!104642 (and (array_inv!29712 _values!914) e!707886)))

(declare-fun mapNonEmpty!48817 () Bool)

(declare-fun mapRes!48817 () Bool)

(declare-fun tp!92918 () Bool)

(assert (=> mapNonEmpty!48817 (= mapRes!48817 (and tp!92918 e!707887))))

(declare-fun mapRest!48817 () (Array (_ BitVec 32) ValueCell!14924))

(declare-fun mapKey!48817 () (_ BitVec 32))

(declare-fun mapValue!48817 () ValueCell!14924)

(assert (=> mapNonEmpty!48817 (= (arr!38752 _values!914) (store mapRest!48817 mapKey!48817 mapValue!48817))))

(declare-fun b!1247676 () Bool)

(declare-fun e!707884 () Bool)

(assert (=> b!1247676 (= e!707884 tp_is_empty!31375)))

(declare-fun mapIsEmpty!48817 () Bool)

(assert (=> mapIsEmpty!48817 mapRes!48817))

(declare-fun b!1247677 () Bool)

(assert (=> b!1247677 (= e!707886 (and e!707884 mapRes!48817))))

(declare-fun condMapEmpty!48817 () Bool)

(declare-fun mapDefault!48817 () ValueCell!14924)

(assert (=> b!1247677 (= condMapEmpty!48817 (= (arr!38752 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14924)) mapDefault!48817)))))

(declare-fun b!1247678 () Bool)

(declare-fun res!832485 () Bool)

(assert (=> b!1247678 (=> (not res!832485) (not e!707883))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247678 (= res!832485 (and (= (size!39290 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39289 _keys!1118) (size!39290 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104642 res!832487) b!1247678))

(assert (= (and b!1247678 res!832485) b!1247674))

(assert (= (and b!1247674 res!832486) b!1247675))

(assert (= (and b!1247677 condMapEmpty!48817) mapIsEmpty!48817))

(assert (= (and b!1247677 (not condMapEmpty!48817)) mapNonEmpty!48817))

(get-info :version)

(assert (= (and mapNonEmpty!48817 ((_ is ValueCellFull!14924) mapValue!48817)) b!1247673))

(assert (= (and b!1247677 ((_ is ValueCellFull!14924) mapDefault!48817)) b!1247676))

(assert (= start!104642 b!1247677))

(declare-fun m!1148639 () Bool)

(assert (=> b!1247674 m!1148639))

(declare-fun m!1148641 () Bool)

(assert (=> b!1247675 m!1148641))

(declare-fun m!1148643 () Bool)

(assert (=> start!104642 m!1148643))

(declare-fun m!1148645 () Bool)

(assert (=> start!104642 m!1148645))

(declare-fun m!1148647 () Bool)

(assert (=> start!104642 m!1148647))

(declare-fun m!1148649 () Bool)

(assert (=> mapNonEmpty!48817 m!1148649))

(check-sat tp_is_empty!31375 (not start!104642) (not b!1247675) (not mapNonEmpty!48817) (not b!1247674))
(check-sat)
