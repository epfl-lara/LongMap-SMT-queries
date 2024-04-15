; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7406 () Bool)

(assert start!7406)

(declare-fun b!47458 () Bool)

(declare-fun e!30405 () Bool)

(assert (=> b!47458 (= e!30405 false)))

(declare-fun lt!20416 () Bool)

(declare-datatypes ((array!3122 0))(
  ( (array!3123 (arr!1495 (Array (_ BitVec 32) (_ BitVec 64))) (size!1718 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3122)

(declare-datatypes ((List!1255 0))(
  ( (Nil!1252) (Cons!1251 (h!1831 (_ BitVec 64)) (t!4282 List!1255)) )
))
(declare-fun arrayNoDuplicates!0 (array!3122 (_ BitVec 32) List!1255) Bool)

(assert (=> b!47458 (= lt!20416 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1252))))

(declare-fun b!47459 () Bool)

(declare-fun e!30402 () Bool)

(declare-fun tp_is_empty!2041 () Bool)

(assert (=> b!47459 (= e!30402 tp_is_empty!2041)))

(declare-fun b!47460 () Bool)

(declare-fun e!30404 () Bool)

(assert (=> b!47460 (= e!30404 tp_is_empty!2041)))

(declare-fun b!47461 () Bool)

(declare-fun res!27626 () Bool)

(assert (=> b!47461 (=> (not res!27626) (not e!30405))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2455 0))(
  ( (V!2456 (val!1059 Int)) )
))
(declare-datatypes ((ValueCell!731 0))(
  ( (ValueCellFull!731 (v!2118 V!2455)) (EmptyCell!731) )
))
(declare-datatypes ((array!3124 0))(
  ( (array!3125 (arr!1496 (Array (_ BitVec 32) ValueCell!731)) (size!1719 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3124)

(assert (=> b!47461 (= res!27626 (and (= (size!1719 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1718 _keys!1940) (size!1719 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47462 () Bool)

(declare-fun e!30403 () Bool)

(declare-fun mapRes!2105 () Bool)

(assert (=> b!47462 (= e!30403 (and e!30404 mapRes!2105))))

(declare-fun condMapEmpty!2105 () Bool)

(declare-fun mapDefault!2105 () ValueCell!731)

(assert (=> b!47462 (= condMapEmpty!2105 (= (arr!1496 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!731)) mapDefault!2105)))))

(declare-fun mapNonEmpty!2105 () Bool)

(declare-fun tp!6254 () Bool)

(assert (=> mapNonEmpty!2105 (= mapRes!2105 (and tp!6254 e!30402))))

(declare-fun mapKey!2105 () (_ BitVec 32))

(declare-fun mapValue!2105 () ValueCell!731)

(declare-fun mapRest!2105 () (Array (_ BitVec 32) ValueCell!731))

(assert (=> mapNonEmpty!2105 (= (arr!1496 _values!1550) (store mapRest!2105 mapKey!2105 mapValue!2105))))

(declare-fun mapIsEmpty!2105 () Bool)

(assert (=> mapIsEmpty!2105 mapRes!2105))

(declare-fun b!47463 () Bool)

(declare-fun res!27625 () Bool)

(assert (=> b!47463 (=> (not res!27625) (not e!30405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3122 (_ BitVec 32)) Bool)

(assert (=> b!47463 (= res!27625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun res!27627 () Bool)

(assert (=> start!7406 (=> (not res!27627) (not e!30405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7406 (= res!27627 (validMask!0 mask!2458))))

(assert (=> start!7406 e!30405))

(assert (=> start!7406 true))

(declare-fun array_inv!902 (array!3124) Bool)

(assert (=> start!7406 (and (array_inv!902 _values!1550) e!30403)))

(declare-fun array_inv!903 (array!3122) Bool)

(assert (=> start!7406 (array_inv!903 _keys!1940)))

(assert (= (and start!7406 res!27627) b!47461))

(assert (= (and b!47461 res!27626) b!47463))

(assert (= (and b!47463 res!27625) b!47458))

(assert (= (and b!47462 condMapEmpty!2105) mapIsEmpty!2105))

(assert (= (and b!47462 (not condMapEmpty!2105)) mapNonEmpty!2105))

(get-info :version)

(assert (= (and mapNonEmpty!2105 ((_ is ValueCellFull!731) mapValue!2105)) b!47459))

(assert (= (and b!47462 ((_ is ValueCellFull!731) mapDefault!2105)) b!47460))

(assert (= start!7406 b!47462))

(declare-fun m!41631 () Bool)

(assert (=> b!47458 m!41631))

(declare-fun m!41633 () Bool)

(assert (=> mapNonEmpty!2105 m!41633))

(declare-fun m!41635 () Bool)

(assert (=> b!47463 m!41635))

(declare-fun m!41637 () Bool)

(assert (=> start!7406 m!41637))

(declare-fun m!41639 () Bool)

(assert (=> start!7406 m!41639))

(declare-fun m!41641 () Bool)

(assert (=> start!7406 m!41641))

(check-sat (not start!7406) tp_is_empty!2041 (not b!47458) (not mapNonEmpty!2105) (not b!47463))
(check-sat)
