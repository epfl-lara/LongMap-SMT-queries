; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3780 () Bool)

(assert start!3780)

(declare-fun b!26450 () Bool)

(declare-fun e!17235 () Bool)

(declare-fun tp_is_empty!1111 () Bool)

(assert (=> b!26450 (= e!17235 tp_is_empty!1111)))

(declare-fun mapIsEmpty!1183 () Bool)

(declare-fun mapRes!1183 () Bool)

(assert (=> mapIsEmpty!1183 mapRes!1183))

(declare-fun b!26451 () Bool)

(declare-fun e!17232 () Bool)

(assert (=> b!26451 (= e!17232 false)))

(declare-fun lt!10372 () Bool)

(declare-datatypes ((array!1441 0))(
  ( (array!1442 (arr!678 (Array (_ BitVec 32) (_ BitVec 64))) (size!779 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1441)

(declare-datatypes ((List!589 0))(
  ( (Nil!586) (Cons!585 (h!1152 (_ BitVec 64)) (t!3269 List!589)) )
))
(declare-fun arrayNoDuplicates!0 (array!1441 (_ BitVec 32) List!589) Bool)

(assert (=> b!26451 (= lt!10372 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!586))))

(declare-fun res!15696 () Bool)

(assert (=> start!3780 (=> (not res!15696) (not e!17232))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3780 (= res!15696 (validMask!0 mask!2294))))

(assert (=> start!3780 e!17232))

(assert (=> start!3780 true))

(declare-datatypes ((V!1307 0))(
  ( (V!1308 (val!582 Int)) )
))
(declare-datatypes ((ValueCell!356 0))(
  ( (ValueCellFull!356 (v!1667 V!1307)) (EmptyCell!356) )
))
(declare-datatypes ((array!1443 0))(
  ( (array!1444 (arr!679 (Array (_ BitVec 32) ValueCell!356)) (size!780 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1443)

(declare-fun e!17233 () Bool)

(declare-fun array_inv!479 (array!1443) Bool)

(assert (=> start!3780 (and (array_inv!479 _values!1501) e!17233)))

(declare-fun array_inv!480 (array!1441) Bool)

(assert (=> start!3780 (array_inv!480 _keys!1833)))

(declare-fun mapNonEmpty!1183 () Bool)

(declare-fun tp!3703 () Bool)

(assert (=> mapNonEmpty!1183 (= mapRes!1183 (and tp!3703 e!17235))))

(declare-fun mapValue!1183 () ValueCell!356)

(declare-fun mapKey!1183 () (_ BitVec 32))

(declare-fun mapRest!1183 () (Array (_ BitVec 32) ValueCell!356))

(assert (=> mapNonEmpty!1183 (= (arr!679 _values!1501) (store mapRest!1183 mapKey!1183 mapValue!1183))))

(declare-fun b!26452 () Bool)

(declare-fun e!17236 () Bool)

(assert (=> b!26452 (= e!17233 (and e!17236 mapRes!1183))))

(declare-fun condMapEmpty!1183 () Bool)

(declare-fun mapDefault!1183 () ValueCell!356)

(assert (=> b!26452 (= condMapEmpty!1183 (= (arr!679 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!356)) mapDefault!1183)))))

(declare-fun b!26453 () Bool)

(declare-fun res!15695 () Bool)

(assert (=> b!26453 (=> (not res!15695) (not e!17232))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26453 (= res!15695 (and (= (size!780 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!779 _keys!1833) (size!780 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26454 () Bool)

(assert (=> b!26454 (= e!17236 tp_is_empty!1111)))

(declare-fun b!26455 () Bool)

(declare-fun res!15697 () Bool)

(assert (=> b!26455 (=> (not res!15697) (not e!17232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1441 (_ BitVec 32)) Bool)

(assert (=> b!26455 (= res!15697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3780 res!15696) b!26453))

(assert (= (and b!26453 res!15695) b!26455))

(assert (= (and b!26455 res!15697) b!26451))

(assert (= (and b!26452 condMapEmpty!1183) mapIsEmpty!1183))

(assert (= (and b!26452 (not condMapEmpty!1183)) mapNonEmpty!1183))

(get-info :version)

(assert (= (and mapNonEmpty!1183 ((_ is ValueCellFull!356) mapValue!1183)) b!26450))

(assert (= (and b!26452 ((_ is ValueCellFull!356) mapDefault!1183)) b!26454))

(assert (= start!3780 b!26452))

(declare-fun m!21187 () Bool)

(assert (=> b!26451 m!21187))

(declare-fun m!21189 () Bool)

(assert (=> start!3780 m!21189))

(declare-fun m!21191 () Bool)

(assert (=> start!3780 m!21191))

(declare-fun m!21193 () Bool)

(assert (=> start!3780 m!21193))

(declare-fun m!21195 () Bool)

(assert (=> mapNonEmpty!1183 m!21195))

(declare-fun m!21197 () Bool)

(assert (=> b!26455 m!21197))

(check-sat (not start!3780) (not b!26451) tp_is_empty!1111 (not b!26455) (not mapNonEmpty!1183))
(check-sat)
