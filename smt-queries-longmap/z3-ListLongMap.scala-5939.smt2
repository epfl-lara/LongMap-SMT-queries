; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77432 () Bool)

(assert start!77432)

(declare-fun b!902393 () Bool)

(declare-fun e!505412 () Bool)

(declare-fun tp_is_empty!18463 () Bool)

(assert (=> b!902393 (= e!505412 tp_is_empty!18463)))

(declare-fun b!902394 () Bool)

(declare-fun res!609001 () Bool)

(declare-fun e!505413 () Bool)

(assert (=> b!902394 (=> (not res!609001) (not e!505413))))

(declare-datatypes ((V!29583 0))(
  ( (V!29584 (val!9282 Int)) )
))
(declare-datatypes ((ValueCell!8750 0))(
  ( (ValueCellFull!8750 (v!11786 V!29583)) (EmptyCell!8750) )
))
(declare-datatypes ((array!52973 0))(
  ( (array!52974 (arr!25447 (Array (_ BitVec 32) ValueCell!8750)) (size!25908 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52973)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52975 0))(
  ( (array!52976 (arr!25448 (Array (_ BitVec 32) (_ BitVec 64))) (size!25909 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52975)

(assert (=> b!902394 (= res!609001 (and (= (size!25908 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25909 _keys!1386) (size!25908 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902395 () Bool)

(declare-fun e!505415 () Bool)

(declare-fun e!505411 () Bool)

(declare-fun mapRes!29404 () Bool)

(assert (=> b!902395 (= e!505415 (and e!505411 mapRes!29404))))

(declare-fun condMapEmpty!29404 () Bool)

(declare-fun mapDefault!29404 () ValueCell!8750)

(assert (=> b!902395 (= condMapEmpty!29404 (= (arr!25447 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8750)) mapDefault!29404)))))

(declare-fun mapNonEmpty!29404 () Bool)

(declare-fun tp!56464 () Bool)

(assert (=> mapNonEmpty!29404 (= mapRes!29404 (and tp!56464 e!505412))))

(declare-fun mapValue!29404 () ValueCell!8750)

(declare-fun mapKey!29404 () (_ BitVec 32))

(declare-fun mapRest!29404 () (Array (_ BitVec 32) ValueCell!8750))

(assert (=> mapNonEmpty!29404 (= (arr!25447 _values!1152) (store mapRest!29404 mapKey!29404 mapValue!29404))))

(declare-fun b!902396 () Bool)

(declare-fun res!609002 () Bool)

(assert (=> b!902396 (=> (not res!609002) (not e!505413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52975 (_ BitVec 32)) Bool)

(assert (=> b!902396 (= res!609002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902397 () Bool)

(assert (=> b!902397 (= e!505413 false)))

(declare-fun lt!407653 () Bool)

(declare-datatypes ((List!17901 0))(
  ( (Nil!17898) (Cons!17897 (h!19043 (_ BitVec 64)) (t!25275 List!17901)) )
))
(declare-fun arrayNoDuplicates!0 (array!52975 (_ BitVec 32) List!17901) Bool)

(assert (=> b!902397 (= lt!407653 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17898))))

(declare-fun mapIsEmpty!29404 () Bool)

(assert (=> mapIsEmpty!29404 mapRes!29404))

(declare-fun b!902398 () Bool)

(assert (=> b!902398 (= e!505411 tp_is_empty!18463)))

(declare-fun res!609003 () Bool)

(assert (=> start!77432 (=> (not res!609003) (not e!505413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77432 (= res!609003 (validMask!0 mask!1756))))

(assert (=> start!77432 e!505413))

(assert (=> start!77432 true))

(declare-fun array_inv!20010 (array!52973) Bool)

(assert (=> start!77432 (and (array_inv!20010 _values!1152) e!505415)))

(declare-fun array_inv!20011 (array!52975) Bool)

(assert (=> start!77432 (array_inv!20011 _keys!1386)))

(assert (= (and start!77432 res!609003) b!902394))

(assert (= (and b!902394 res!609001) b!902396))

(assert (= (and b!902396 res!609002) b!902397))

(assert (= (and b!902395 condMapEmpty!29404) mapIsEmpty!29404))

(assert (= (and b!902395 (not condMapEmpty!29404)) mapNonEmpty!29404))

(get-info :version)

(assert (= (and mapNonEmpty!29404 ((_ is ValueCellFull!8750) mapValue!29404)) b!902393))

(assert (= (and b!902395 ((_ is ValueCellFull!8750) mapDefault!29404)) b!902398))

(assert (= start!77432 b!902395))

(declare-fun m!837809 () Bool)

(assert (=> mapNonEmpty!29404 m!837809))

(declare-fun m!837811 () Bool)

(assert (=> b!902396 m!837811))

(declare-fun m!837813 () Bool)

(assert (=> b!902397 m!837813))

(declare-fun m!837815 () Bool)

(assert (=> start!77432 m!837815))

(declare-fun m!837817 () Bool)

(assert (=> start!77432 m!837817))

(declare-fun m!837819 () Bool)

(assert (=> start!77432 m!837819))

(check-sat (not b!902396) tp_is_empty!18463 (not b!902397) (not start!77432) (not mapNonEmpty!29404))
(check-sat)
