; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7422 () Bool)

(assert start!7422)

(declare-fun mapIsEmpty!2123 () Bool)

(declare-fun mapRes!2123 () Bool)

(assert (=> mapIsEmpty!2123 mapRes!2123))

(declare-fun b!47593 () Bool)

(declare-fun res!27693 () Bool)

(declare-fun e!30501 () Bool)

(assert (=> b!47593 (=> (not res!27693) (not e!30501))))

(declare-datatypes ((array!3156 0))(
  ( (array!3157 (arr!1512 (Array (_ BitVec 32) (_ BitVec 64))) (size!1734 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3156)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3156 (_ BitVec 32)) Bool)

(assert (=> b!47593 (= res!27693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47594 () Bool)

(assert (=> b!47594 (= e!30501 false)))

(declare-fun lt!20398 () Bool)

(declare-datatypes ((List!1250 0))(
  ( (Nil!1247) (Cons!1246 (h!1826 (_ BitVec 64)) (t!4278 List!1250)) )
))
(declare-fun arrayNoDuplicates!0 (array!3156 (_ BitVec 32) List!1250) Bool)

(assert (=> b!47594 (= lt!20398 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1247))))

(declare-fun b!47595 () Bool)

(declare-fun e!30497 () Bool)

(declare-fun tp_is_empty!2053 () Bool)

(assert (=> b!47595 (= e!30497 tp_is_empty!2053)))

(declare-fun res!27692 () Bool)

(assert (=> start!7422 (=> (not res!27692) (not e!30501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7422 (= res!27692 (validMask!0 mask!2458))))

(assert (=> start!7422 e!30501))

(assert (=> start!7422 true))

(declare-datatypes ((V!2471 0))(
  ( (V!2472 (val!1065 Int)) )
))
(declare-datatypes ((ValueCell!737 0))(
  ( (ValueCellFull!737 (v!2127 V!2471)) (EmptyCell!737) )
))
(declare-datatypes ((array!3158 0))(
  ( (array!3159 (arr!1513 (Array (_ BitVec 32) ValueCell!737)) (size!1735 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3158)

(declare-fun e!30499 () Bool)

(declare-fun array_inv!902 (array!3158) Bool)

(assert (=> start!7422 (and (array_inv!902 _values!1550) e!30499)))

(declare-fun array_inv!903 (array!3156) Bool)

(assert (=> start!7422 (array_inv!903 _keys!1940)))

(declare-fun mapNonEmpty!2123 () Bool)

(declare-fun tp!6272 () Bool)

(declare-fun e!30498 () Bool)

(assert (=> mapNonEmpty!2123 (= mapRes!2123 (and tp!6272 e!30498))))

(declare-fun mapKey!2123 () (_ BitVec 32))

(declare-fun mapRest!2123 () (Array (_ BitVec 32) ValueCell!737))

(declare-fun mapValue!2123 () ValueCell!737)

(assert (=> mapNonEmpty!2123 (= (arr!1513 _values!1550) (store mapRest!2123 mapKey!2123 mapValue!2123))))

(declare-fun b!47596 () Bool)

(declare-fun res!27694 () Bool)

(assert (=> b!47596 (=> (not res!27694) (not e!30501))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47596 (= res!27694 (and (= (size!1735 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1734 _keys!1940) (size!1735 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47597 () Bool)

(assert (=> b!47597 (= e!30498 tp_is_empty!2053)))

(declare-fun b!47598 () Bool)

(assert (=> b!47598 (= e!30499 (and e!30497 mapRes!2123))))

(declare-fun condMapEmpty!2123 () Bool)

(declare-fun mapDefault!2123 () ValueCell!737)

(assert (=> b!47598 (= condMapEmpty!2123 (= (arr!1513 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!737)) mapDefault!2123)))))

(assert (= (and start!7422 res!27692) b!47596))

(assert (= (and b!47596 res!27694) b!47593))

(assert (= (and b!47593 res!27693) b!47594))

(assert (= (and b!47598 condMapEmpty!2123) mapIsEmpty!2123))

(assert (= (and b!47598 (not condMapEmpty!2123)) mapNonEmpty!2123))

(get-info :version)

(assert (= (and mapNonEmpty!2123 ((_ is ValueCellFull!737) mapValue!2123)) b!47597))

(assert (= (and b!47598 ((_ is ValueCellFull!737) mapDefault!2123)) b!47595))

(assert (= start!7422 b!47598))

(declare-fun m!41667 () Bool)

(assert (=> b!47593 m!41667))

(declare-fun m!41669 () Bool)

(assert (=> b!47594 m!41669))

(declare-fun m!41671 () Bool)

(assert (=> start!7422 m!41671))

(declare-fun m!41673 () Bool)

(assert (=> start!7422 m!41673))

(declare-fun m!41675 () Bool)

(assert (=> start!7422 m!41675))

(declare-fun m!41677 () Bool)

(assert (=> mapNonEmpty!2123 m!41677))

(check-sat (not b!47593) (not start!7422) (not b!47594) (not mapNonEmpty!2123) tp_is_empty!2053)
(check-sat)
