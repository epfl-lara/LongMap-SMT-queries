; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3792 () Bool)

(assert start!3792)

(declare-fun res!15737 () Bool)

(declare-fun e!17294 () Bool)

(assert (=> start!3792 (=> (not res!15737) (not e!17294))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3792 (= res!15737 (validMask!0 mask!2294))))

(assert (=> start!3792 e!17294))

(assert (=> start!3792 true))

(declare-datatypes ((V!1309 0))(
  ( (V!1310 (val!583 Int)) )
))
(declare-datatypes ((ValueCell!357 0))(
  ( (ValueCellFull!357 (v!1669 V!1309)) (EmptyCell!357) )
))
(declare-datatypes ((array!1469 0))(
  ( (array!1470 (arr!692 (Array (_ BitVec 32) ValueCell!357)) (size!793 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1469)

(declare-fun e!17292 () Bool)

(declare-fun array_inv!475 (array!1469) Bool)

(assert (=> start!3792 (and (array_inv!475 _values!1501) e!17292)))

(declare-datatypes ((array!1471 0))(
  ( (array!1472 (arr!693 (Array (_ BitVec 32) (_ BitVec 64))) (size!794 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1471)

(declare-fun array_inv!476 (array!1471) Bool)

(assert (=> start!3792 (array_inv!476 _keys!1833)))

(declare-fun b!26522 () Bool)

(declare-fun e!17290 () Bool)

(declare-fun tp_is_empty!1113 () Bool)

(assert (=> b!26522 (= e!17290 tp_is_empty!1113)))

(declare-fun b!26523 () Bool)

(declare-fun mapRes!1186 () Bool)

(assert (=> b!26523 (= e!17292 (and e!17290 mapRes!1186))))

(declare-fun condMapEmpty!1186 () Bool)

(declare-fun mapDefault!1186 () ValueCell!357)

(assert (=> b!26523 (= condMapEmpty!1186 (= (arr!692 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!357)) mapDefault!1186)))))

(declare-fun mapNonEmpty!1186 () Bool)

(declare-fun tp!3706 () Bool)

(declare-fun e!17293 () Bool)

(assert (=> mapNonEmpty!1186 (= mapRes!1186 (and tp!3706 e!17293))))

(declare-fun mapValue!1186 () ValueCell!357)

(declare-fun mapRest!1186 () (Array (_ BitVec 32) ValueCell!357))

(declare-fun mapKey!1186 () (_ BitVec 32))

(assert (=> mapNonEmpty!1186 (= (arr!692 _values!1501) (store mapRest!1186 mapKey!1186 mapValue!1186))))

(declare-fun mapIsEmpty!1186 () Bool)

(assert (=> mapIsEmpty!1186 mapRes!1186))

(declare-fun b!26524 () Bool)

(assert (=> b!26524 (= e!17293 tp_is_empty!1113)))

(declare-fun b!26525 () Bool)

(declare-fun res!15738 () Bool)

(assert (=> b!26525 (=> (not res!15738) (not e!17294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1471 (_ BitVec 32)) Bool)

(assert (=> b!26525 (= res!15738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26526 () Bool)

(declare-fun res!15736 () Bool)

(assert (=> b!26526 (=> (not res!15736) (not e!17294))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26526 (= res!15736 (and (= (size!793 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!794 _keys!1833) (size!793 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26527 () Bool)

(assert (=> b!26527 (= e!17294 false)))

(declare-fun lt!10379 () Bool)

(declare-datatypes ((List!593 0))(
  ( (Nil!590) (Cons!589 (h!1156 (_ BitVec 64)) (t!3280 List!593)) )
))
(declare-fun arrayNoDuplicates!0 (array!1471 (_ BitVec 32) List!593) Bool)

(assert (=> b!26527 (= lt!10379 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!590))))

(assert (= (and start!3792 res!15737) b!26526))

(assert (= (and b!26526 res!15736) b!26525))

(assert (= (and b!26525 res!15738) b!26527))

(assert (= (and b!26523 condMapEmpty!1186) mapIsEmpty!1186))

(assert (= (and b!26523 (not condMapEmpty!1186)) mapNonEmpty!1186))

(get-info :version)

(assert (= (and mapNonEmpty!1186 ((_ is ValueCellFull!357) mapValue!1186)) b!26524))

(assert (= (and b!26523 ((_ is ValueCellFull!357) mapDefault!1186)) b!26522))

(assert (= start!3792 b!26523))

(declare-fun m!21269 () Bool)

(assert (=> start!3792 m!21269))

(declare-fun m!21271 () Bool)

(assert (=> start!3792 m!21271))

(declare-fun m!21273 () Bool)

(assert (=> start!3792 m!21273))

(declare-fun m!21275 () Bool)

(assert (=> mapNonEmpty!1186 m!21275))

(declare-fun m!21277 () Bool)

(assert (=> b!26525 m!21277))

(declare-fun m!21279 () Bool)

(assert (=> b!26527 m!21279))

(check-sat (not b!26527) (not start!3792) tp_is_empty!1113 (not mapNonEmpty!1186) (not b!26525))
(check-sat)
