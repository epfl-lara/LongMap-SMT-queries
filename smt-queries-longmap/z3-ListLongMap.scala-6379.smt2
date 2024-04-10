; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82012 () Bool)

(assert start!82012)

(declare-fun mapNonEmpty!33538 () Bool)

(declare-fun mapRes!33538 () Bool)

(declare-fun tp!64116 () Bool)

(declare-fun e!538992 () Bool)

(assert (=> mapNonEmpty!33538 (= mapRes!33538 (and tp!64116 e!538992))))

(declare-datatypes ((V!33051 0))(
  ( (V!33052 (val!10576 Int)) )
))
(declare-datatypes ((ValueCell!10044 0))(
  ( (ValueCellFull!10044 (v!13131 V!33051)) (EmptyCell!10044) )
))
(declare-fun mapRest!33538 () (Array (_ BitVec 32) ValueCell!10044))

(declare-fun mapKey!33538 () (_ BitVec 32))

(declare-datatypes ((array!58199 0))(
  ( (array!58200 (arr!27979 (Array (_ BitVec 32) ValueCell!10044)) (size!28458 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58199)

(declare-fun mapValue!33538 () ValueCell!10044)

(assert (=> mapNonEmpty!33538 (= (arr!27979 _values!1197) (store mapRest!33538 mapKey!33538 mapValue!33538))))

(declare-fun b!956491 () Bool)

(declare-fun e!538990 () Bool)

(assert (=> b!956491 (= e!538990 false)))

(declare-fun lt!430154 () Bool)

(declare-datatypes ((array!58201 0))(
  ( (array!58202 (arr!27980 (Array (_ BitVec 32) (_ BitVec 64))) (size!28459 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58201)

(declare-datatypes ((List!19484 0))(
  ( (Nil!19481) (Cons!19480 (h!20642 (_ BitVec 64)) (t!27845 List!19484)) )
))
(declare-fun arrayNoDuplicates!0 (array!58201 (_ BitVec 32) List!19484) Bool)

(assert (=> b!956491 (= lt!430154 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19481))))

(declare-fun b!956492 () Bool)

(declare-fun res!640427 () Bool)

(assert (=> b!956492 (=> (not res!640427) (not e!538990))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58201 (_ BitVec 32)) Bool)

(assert (=> b!956492 (= res!640427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33538 () Bool)

(assert (=> mapIsEmpty!33538 mapRes!33538))

(declare-fun b!956494 () Bool)

(declare-fun e!538989 () Bool)

(declare-fun tp_is_empty!21051 () Bool)

(assert (=> b!956494 (= e!538989 tp_is_empty!21051)))

(declare-fun b!956495 () Bool)

(declare-fun res!640426 () Bool)

(assert (=> b!956495 (=> (not res!640426) (not e!538990))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956495 (= res!640426 (and (= (size!28458 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28459 _keys!1441) (size!28458 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956496 () Bool)

(declare-fun e!538991 () Bool)

(assert (=> b!956496 (= e!538991 (and e!538989 mapRes!33538))))

(declare-fun condMapEmpty!33538 () Bool)

(declare-fun mapDefault!33538 () ValueCell!10044)

(assert (=> b!956496 (= condMapEmpty!33538 (= (arr!27979 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10044)) mapDefault!33538)))))

(declare-fun res!640428 () Bool)

(assert (=> start!82012 (=> (not res!640428) (not e!538990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82012 (= res!640428 (validMask!0 mask!1823))))

(assert (=> start!82012 e!538990))

(assert (=> start!82012 true))

(declare-fun array_inv!21709 (array!58199) Bool)

(assert (=> start!82012 (and (array_inv!21709 _values!1197) e!538991)))

(declare-fun array_inv!21710 (array!58201) Bool)

(assert (=> start!82012 (array_inv!21710 _keys!1441)))

(declare-fun b!956493 () Bool)

(assert (=> b!956493 (= e!538992 tp_is_empty!21051)))

(assert (= (and start!82012 res!640428) b!956495))

(assert (= (and b!956495 res!640426) b!956492))

(assert (= (and b!956492 res!640427) b!956491))

(assert (= (and b!956496 condMapEmpty!33538) mapIsEmpty!33538))

(assert (= (and b!956496 (not condMapEmpty!33538)) mapNonEmpty!33538))

(get-info :version)

(assert (= (and mapNonEmpty!33538 ((_ is ValueCellFull!10044) mapValue!33538)) b!956493))

(assert (= (and b!956496 ((_ is ValueCellFull!10044) mapDefault!33538)) b!956494))

(assert (= start!82012 b!956496))

(declare-fun m!887753 () Bool)

(assert (=> mapNonEmpty!33538 m!887753))

(declare-fun m!887755 () Bool)

(assert (=> b!956491 m!887755))

(declare-fun m!887757 () Bool)

(assert (=> b!956492 m!887757))

(declare-fun m!887759 () Bool)

(assert (=> start!82012 m!887759))

(declare-fun m!887761 () Bool)

(assert (=> start!82012 m!887761))

(declare-fun m!887763 () Bool)

(assert (=> start!82012 m!887763))

(check-sat (not mapNonEmpty!33538) (not start!82012) (not b!956492) tp_is_empty!21051 (not b!956491))
(check-sat)
