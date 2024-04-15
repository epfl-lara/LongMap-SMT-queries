; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7418 () Bool)

(assert start!7418)

(declare-fun b!47584 () Bool)

(declare-fun e!30494 () Bool)

(declare-fun e!30491 () Bool)

(declare-fun mapRes!2123 () Bool)

(assert (=> b!47584 (= e!30494 (and e!30491 mapRes!2123))))

(declare-fun condMapEmpty!2123 () Bool)

(declare-datatypes ((V!2471 0))(
  ( (V!2472 (val!1065 Int)) )
))
(declare-datatypes ((ValueCell!737 0))(
  ( (ValueCellFull!737 (v!2124 V!2471)) (EmptyCell!737) )
))
(declare-datatypes ((array!3146 0))(
  ( (array!3147 (arr!1507 (Array (_ BitVec 32) ValueCell!737)) (size!1730 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3146)

(declare-fun mapDefault!2123 () ValueCell!737)

(assert (=> b!47584 (= condMapEmpty!2123 (= (arr!1507 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!737)) mapDefault!2123)))))

(declare-fun res!27698 () Bool)

(declare-fun e!30493 () Bool)

(assert (=> start!7418 (=> (not res!27698) (not e!30493))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7418 (= res!27698 (validMask!0 mask!2458))))

(assert (=> start!7418 e!30493))

(assert (=> start!7418 true))

(declare-fun array_inv!910 (array!3146) Bool)

(assert (=> start!7418 (and (array_inv!910 _values!1550) e!30494)))

(declare-datatypes ((array!3148 0))(
  ( (array!3149 (arr!1508 (Array (_ BitVec 32) (_ BitVec 64))) (size!1731 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3148)

(declare-fun array_inv!911 (array!3148) Bool)

(assert (=> start!7418 (array_inv!911 _keys!1940)))

(declare-fun b!47585 () Bool)

(assert (=> b!47585 (= e!30493 false)))

(declare-fun lt!20425 () Bool)

(declare-datatypes ((List!1259 0))(
  ( (Nil!1256) (Cons!1255 (h!1835 (_ BitVec 64)) (t!4286 List!1259)) )
))
(declare-fun arrayNoDuplicates!0 (array!3148 (_ BitVec 32) List!1259) Bool)

(assert (=> b!47585 (= lt!20425 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1256))))

(declare-fun b!47586 () Bool)

(declare-fun e!30492 () Bool)

(declare-fun tp_is_empty!2053 () Bool)

(assert (=> b!47586 (= e!30492 tp_is_empty!2053)))

(declare-fun mapIsEmpty!2123 () Bool)

(assert (=> mapIsEmpty!2123 mapRes!2123))

(declare-fun b!47587 () Bool)

(declare-fun res!27699 () Bool)

(assert (=> b!47587 (=> (not res!27699) (not e!30493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3148 (_ BitVec 32)) Bool)

(assert (=> b!47587 (= res!27699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47588 () Bool)

(declare-fun res!27697 () Bool)

(assert (=> b!47588 (=> (not res!27697) (not e!30493))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47588 (= res!27697 (and (= (size!1730 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1731 _keys!1940) (size!1730 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2123 () Bool)

(declare-fun tp!6272 () Bool)

(assert (=> mapNonEmpty!2123 (= mapRes!2123 (and tp!6272 e!30492))))

(declare-fun mapKey!2123 () (_ BitVec 32))

(declare-fun mapValue!2123 () ValueCell!737)

(declare-fun mapRest!2123 () (Array (_ BitVec 32) ValueCell!737))

(assert (=> mapNonEmpty!2123 (= (arr!1507 _values!1550) (store mapRest!2123 mapKey!2123 mapValue!2123))))

(declare-fun b!47589 () Bool)

(assert (=> b!47589 (= e!30491 tp_is_empty!2053)))

(assert (= (and start!7418 res!27698) b!47588))

(assert (= (and b!47588 res!27697) b!47587))

(assert (= (and b!47587 res!27699) b!47585))

(assert (= (and b!47584 condMapEmpty!2123) mapIsEmpty!2123))

(assert (= (and b!47584 (not condMapEmpty!2123)) mapNonEmpty!2123))

(get-info :version)

(assert (= (and mapNonEmpty!2123 ((_ is ValueCellFull!737) mapValue!2123)) b!47586))

(assert (= (and b!47584 ((_ is ValueCellFull!737) mapDefault!2123)) b!47589))

(assert (= start!7418 b!47584))

(declare-fun m!41709 () Bool)

(assert (=> start!7418 m!41709))

(declare-fun m!41711 () Bool)

(assert (=> start!7418 m!41711))

(declare-fun m!41713 () Bool)

(assert (=> start!7418 m!41713))

(declare-fun m!41715 () Bool)

(assert (=> b!47585 m!41715))

(declare-fun m!41717 () Bool)

(assert (=> b!47587 m!41717))

(declare-fun m!41719 () Bool)

(assert (=> mapNonEmpty!2123 m!41719))

(check-sat (not b!47587) tp_is_empty!2053 (not start!7418) (not b!47585) (not mapNonEmpty!2123))
(check-sat)
