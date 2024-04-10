; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7400 () Bool)

(assert start!7400)

(declare-fun b!47488 () Bool)

(declare-fun e!30416 () Bool)

(assert (=> b!47488 (= e!30416 false)))

(declare-fun lt!20426 () Bool)

(declare-datatypes ((array!3139 0))(
  ( (array!3140 (arr!1504 (Array (_ BitVec 32) (_ BitVec 64))) (size!1726 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3139)

(declare-datatypes ((List!1261 0))(
  ( (Nil!1258) (Cons!1257 (h!1837 (_ BitVec 64)) (t!4289 List!1261)) )
))
(declare-fun arrayNoDuplicates!0 (array!3139 (_ BitVec 32) List!1261) Bool)

(assert (=> b!47488 (= lt!20426 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1258))))

(declare-fun b!47489 () Bool)

(declare-fun res!27627 () Bool)

(assert (=> b!47489 (=> (not res!27627) (not e!30416))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2449 0))(
  ( (V!2450 (val!1057 Int)) )
))
(declare-datatypes ((ValueCell!729 0))(
  ( (ValueCellFull!729 (v!2118 V!2449)) (EmptyCell!729) )
))
(declare-datatypes ((array!3141 0))(
  ( (array!3142 (arr!1505 (Array (_ BitVec 32) ValueCell!729)) (size!1727 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3141)

(assert (=> b!47489 (= res!27627 (and (= (size!1727 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1726 _keys!1940) (size!1727 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2099 () Bool)

(declare-fun mapRes!2099 () Bool)

(assert (=> mapIsEmpty!2099 mapRes!2099))

(declare-fun b!47490 () Bool)

(declare-fun e!30415 () Bool)

(declare-fun tp_is_empty!2037 () Bool)

(assert (=> b!47490 (= e!30415 tp_is_empty!2037)))

(declare-fun b!47491 () Bool)

(declare-fun e!30418 () Bool)

(declare-fun e!30414 () Bool)

(assert (=> b!47491 (= e!30418 (and e!30414 mapRes!2099))))

(declare-fun condMapEmpty!2099 () Bool)

(declare-fun mapDefault!2099 () ValueCell!729)

(assert (=> b!47491 (= condMapEmpty!2099 (= (arr!1505 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!729)) mapDefault!2099)))))

(declare-fun b!47492 () Bool)

(assert (=> b!47492 (= e!30414 tp_is_empty!2037)))

(declare-fun res!27629 () Bool)

(assert (=> start!7400 (=> (not res!27629) (not e!30416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7400 (= res!27629 (validMask!0 mask!2458))))

(assert (=> start!7400 e!30416))

(assert (=> start!7400 true))

(declare-fun array_inv!906 (array!3141) Bool)

(assert (=> start!7400 (and (array_inv!906 _values!1550) e!30418)))

(declare-fun array_inv!907 (array!3139) Bool)

(assert (=> start!7400 (array_inv!907 _keys!1940)))

(declare-fun mapNonEmpty!2099 () Bool)

(declare-fun tp!6248 () Bool)

(assert (=> mapNonEmpty!2099 (= mapRes!2099 (and tp!6248 e!30415))))

(declare-fun mapValue!2099 () ValueCell!729)

(declare-fun mapRest!2099 () (Array (_ BitVec 32) ValueCell!729))

(declare-fun mapKey!2099 () (_ BitVec 32))

(assert (=> mapNonEmpty!2099 (= (arr!1505 _values!1550) (store mapRest!2099 mapKey!2099 mapValue!2099))))

(declare-fun b!47493 () Bool)

(declare-fun res!27628 () Bool)

(assert (=> b!47493 (=> (not res!27628) (not e!30416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3139 (_ BitVec 32)) Bool)

(assert (=> b!47493 (= res!27628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(assert (= (and start!7400 res!27629) b!47489))

(assert (= (and b!47489 res!27627) b!47493))

(assert (= (and b!47493 res!27628) b!47488))

(assert (= (and b!47491 condMapEmpty!2099) mapIsEmpty!2099))

(assert (= (and b!47491 (not condMapEmpty!2099)) mapNonEmpty!2099))

(get-info :version)

(assert (= (and mapNonEmpty!2099 ((_ is ValueCellFull!729) mapValue!2099)) b!47490))

(assert (= (and b!47491 ((_ is ValueCellFull!729) mapDefault!2099)) b!47492))

(assert (= start!7400 b!47491))

(declare-fun m!41689 () Bool)

(assert (=> b!47488 m!41689))

(declare-fun m!41691 () Bool)

(assert (=> start!7400 m!41691))

(declare-fun m!41693 () Bool)

(assert (=> start!7400 m!41693))

(declare-fun m!41695 () Bool)

(assert (=> start!7400 m!41695))

(declare-fun m!41697 () Bool)

(assert (=> mapNonEmpty!2099 m!41697))

(declare-fun m!41699 () Bool)

(assert (=> b!47493 m!41699))

(check-sat (not start!7400) (not b!47488) tp_is_empty!2037 (not mapNonEmpty!2099) (not b!47493))
(check-sat)
