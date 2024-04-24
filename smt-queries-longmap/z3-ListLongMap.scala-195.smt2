; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3786 () Bool)

(assert start!3786)

(declare-fun b!26432 () Bool)

(declare-fun res!15687 () Bool)

(declare-fun e!17227 () Bool)

(assert (=> b!26432 (=> (not res!15687) (not e!17227))))

(declare-datatypes ((V!1307 0))(
  ( (V!1308 (val!582 Int)) )
))
(declare-datatypes ((ValueCell!356 0))(
  ( (ValueCellFull!356 (v!1668 V!1307)) (EmptyCell!356) )
))
(declare-datatypes ((array!1441 0))(
  ( (array!1442 (arr!678 (Array (_ BitVec 32) ValueCell!356)) (size!779 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1441)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1443 0))(
  ( (array!1444 (arr!679 (Array (_ BitVec 32) (_ BitVec 64))) (size!780 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1443)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26432 (= res!15687 (and (= (size!779 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!780 _keys!1833) (size!779 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1183 () Bool)

(declare-fun mapRes!1183 () Bool)

(declare-fun tp!3703 () Bool)

(declare-fun e!17223 () Bool)

(assert (=> mapNonEmpty!1183 (= mapRes!1183 (and tp!3703 e!17223))))

(declare-fun mapRest!1183 () (Array (_ BitVec 32) ValueCell!356))

(declare-fun mapValue!1183 () ValueCell!356)

(declare-fun mapKey!1183 () (_ BitVec 32))

(assert (=> mapNonEmpty!1183 (= (arr!678 _values!1501) (store mapRest!1183 mapKey!1183 mapValue!1183))))

(declare-fun b!26433 () Bool)

(declare-fun e!17224 () Bool)

(declare-fun e!17226 () Bool)

(assert (=> b!26433 (= e!17224 (and e!17226 mapRes!1183))))

(declare-fun condMapEmpty!1183 () Bool)

(declare-fun mapDefault!1183 () ValueCell!356)

(assert (=> b!26433 (= condMapEmpty!1183 (= (arr!678 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!356)) mapDefault!1183)))))

(declare-fun b!26434 () Bool)

(declare-fun tp_is_empty!1111 () Bool)

(assert (=> b!26434 (= e!17226 tp_is_empty!1111)))

(declare-fun res!15688 () Bool)

(assert (=> start!3786 (=> (not res!15688) (not e!17227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3786 (= res!15688 (validMask!0 mask!2294))))

(assert (=> start!3786 e!17227))

(assert (=> start!3786 true))

(declare-fun array_inv!473 (array!1441) Bool)

(assert (=> start!3786 (and (array_inv!473 _values!1501) e!17224)))

(declare-fun array_inv!474 (array!1443) Bool)

(assert (=> start!3786 (array_inv!474 _keys!1833)))

(declare-fun mapIsEmpty!1183 () Bool)

(assert (=> mapIsEmpty!1183 mapRes!1183))

(declare-fun b!26435 () Bool)

(declare-fun res!15689 () Bool)

(assert (=> b!26435 (=> (not res!15689) (not e!17227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1443 (_ BitVec 32)) Bool)

(assert (=> b!26435 (= res!15689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26436 () Bool)

(assert (=> b!26436 (= e!17227 false)))

(declare-fun lt!10332 () Bool)

(declare-datatypes ((List!586 0))(
  ( (Nil!583) (Cons!582 (h!1149 (_ BitVec 64)) (t!3267 List!586)) )
))
(declare-fun arrayNoDuplicates!0 (array!1443 (_ BitVec 32) List!586) Bool)

(assert (=> b!26436 (= lt!10332 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!583))))

(declare-fun b!26437 () Bool)

(assert (=> b!26437 (= e!17223 tp_is_empty!1111)))

(assert (= (and start!3786 res!15688) b!26432))

(assert (= (and b!26432 res!15687) b!26435))

(assert (= (and b!26435 res!15689) b!26436))

(assert (= (and b!26433 condMapEmpty!1183) mapIsEmpty!1183))

(assert (= (and b!26433 (not condMapEmpty!1183)) mapNonEmpty!1183))

(get-info :version)

(assert (= (and mapNonEmpty!1183 ((_ is ValueCellFull!356) mapValue!1183)) b!26437))

(assert (= (and b!26433 ((_ is ValueCellFull!356) mapDefault!1183)) b!26434))

(assert (= start!3786 b!26433))

(declare-fun m!21105 () Bool)

(assert (=> mapNonEmpty!1183 m!21105))

(declare-fun m!21107 () Bool)

(assert (=> start!3786 m!21107))

(declare-fun m!21109 () Bool)

(assert (=> start!3786 m!21109))

(declare-fun m!21111 () Bool)

(assert (=> start!3786 m!21111))

(declare-fun m!21113 () Bool)

(assert (=> b!26435 m!21113))

(declare-fun m!21115 () Bool)

(assert (=> b!26436 m!21115))

(check-sat (not b!26435) (not start!3786) (not mapNonEmpty!1183) tp_is_empty!1111 (not b!26436))
(check-sat)
