; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41538 () Bool)

(assert start!41538)

(declare-fun b_free!11205 () Bool)

(declare-fun b_next!11205 () Bool)

(assert (=> start!41538 (= b_free!11205 (not b_next!11205))))

(declare-fun tp!39612 () Bool)

(declare-fun b_and!19545 () Bool)

(assert (=> start!41538 (= tp!39612 b_and!19545)))

(declare-fun b!463999 () Bool)

(declare-fun e!270984 () Bool)

(declare-fun tp_is_empty!12633 () Bool)

(assert (=> b!463999 (= e!270984 tp_is_empty!12633)))

(declare-fun res!277421 () Bool)

(declare-fun e!270983 () Bool)

(assert (=> start!41538 (=> (not res!277421) (not e!270983))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41538 (= res!277421 (validMask!0 mask!1365))))

(assert (=> start!41538 e!270983))

(assert (=> start!41538 tp_is_empty!12633))

(assert (=> start!41538 tp!39612))

(assert (=> start!41538 true))

(declare-datatypes ((array!29055 0))(
  ( (array!29056 (arr!13959 (Array (_ BitVec 32) (_ BitVec 64))) (size!14311 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29055)

(declare-fun array_inv!10088 (array!29055) Bool)

(assert (=> start!41538 (array_inv!10088 _keys!1025)))

(declare-datatypes ((V!17949 0))(
  ( (V!17950 (val!6361 Int)) )
))
(declare-datatypes ((ValueCell!5973 0))(
  ( (ValueCellFull!5973 (v!8648 V!17949)) (EmptyCell!5973) )
))
(declare-datatypes ((array!29057 0))(
  ( (array!29058 (arr!13960 (Array (_ BitVec 32) ValueCell!5973)) (size!14312 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29057)

(declare-fun e!270987 () Bool)

(declare-fun array_inv!10089 (array!29057) Bool)

(assert (=> start!41538 (and (array_inv!10089 _values!833) e!270987)))

(declare-fun b!464000 () Bool)

(declare-fun res!277424 () Bool)

(assert (=> b!464000 (=> (not res!277424) (not e!270983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29055 (_ BitVec 32)) Bool)

(assert (=> b!464000 (= res!277424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464001 () Bool)

(assert (=> b!464001 (= e!270983 false)))

(declare-fun zeroValue!794 () V!17949)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8332 0))(
  ( (tuple2!8333 (_1!4177 (_ BitVec 64)) (_2!4177 V!17949)) )
))
(declare-datatypes ((List!8427 0))(
  ( (Nil!8424) (Cons!8423 (h!9279 tuple2!8332) (t!14373 List!8427)) )
))
(declare-datatypes ((ListLongMap!7245 0))(
  ( (ListLongMap!7246 (toList!3638 List!8427)) )
))
(declare-fun lt!209539 () ListLongMap!7245)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17949)

(declare-fun getCurrentListMapNoExtraKeys!1818 (array!29055 array!29057 (_ BitVec 32) (_ BitVec 32) V!17949 V!17949 (_ BitVec 32) Int) ListLongMap!7245)

(assert (=> b!464001 (= lt!209539 (getCurrentListMapNoExtraKeys!1818 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17949)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209540 () ListLongMap!7245)

(assert (=> b!464001 (= lt!209540 (getCurrentListMapNoExtraKeys!1818 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464002 () Bool)

(declare-fun res!277422 () Bool)

(assert (=> b!464002 (=> (not res!277422) (not e!270983))))

(assert (=> b!464002 (= res!277422 (and (= (size!14312 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14311 _keys!1025) (size!14312 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20626 () Bool)

(declare-fun mapRes!20626 () Bool)

(declare-fun tp!39613 () Bool)

(declare-fun e!270986 () Bool)

(assert (=> mapNonEmpty!20626 (= mapRes!20626 (and tp!39613 e!270986))))

(declare-fun mapValue!20626 () ValueCell!5973)

(declare-fun mapKey!20626 () (_ BitVec 32))

(declare-fun mapRest!20626 () (Array (_ BitVec 32) ValueCell!5973))

(assert (=> mapNonEmpty!20626 (= (arr!13960 _values!833) (store mapRest!20626 mapKey!20626 mapValue!20626))))

(declare-fun b!464003 () Bool)

(assert (=> b!464003 (= e!270987 (and e!270984 mapRes!20626))))

(declare-fun condMapEmpty!20626 () Bool)

(declare-fun mapDefault!20626 () ValueCell!5973)

(assert (=> b!464003 (= condMapEmpty!20626 (= (arr!13960 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5973)) mapDefault!20626)))))

(declare-fun b!464004 () Bool)

(assert (=> b!464004 (= e!270986 tp_is_empty!12633)))

(declare-fun mapIsEmpty!20626 () Bool)

(assert (=> mapIsEmpty!20626 mapRes!20626))

(declare-fun b!464005 () Bool)

(declare-fun res!277423 () Bool)

(assert (=> b!464005 (=> (not res!277423) (not e!270983))))

(declare-datatypes ((List!8428 0))(
  ( (Nil!8425) (Cons!8424 (h!9280 (_ BitVec 64)) (t!14374 List!8428)) )
))
(declare-fun arrayNoDuplicates!0 (array!29055 (_ BitVec 32) List!8428) Bool)

(assert (=> b!464005 (= res!277423 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8425))))

(assert (= (and start!41538 res!277421) b!464002))

(assert (= (and b!464002 res!277422) b!464000))

(assert (= (and b!464000 res!277424) b!464005))

(assert (= (and b!464005 res!277423) b!464001))

(assert (= (and b!464003 condMapEmpty!20626) mapIsEmpty!20626))

(assert (= (and b!464003 (not condMapEmpty!20626)) mapNonEmpty!20626))

(get-info :version)

(assert (= (and mapNonEmpty!20626 ((_ is ValueCellFull!5973) mapValue!20626)) b!464004))

(assert (= (and b!464003 ((_ is ValueCellFull!5973) mapDefault!20626)) b!463999))

(assert (= start!41538 b!464003))

(declare-fun m!446457 () Bool)

(assert (=> b!464001 m!446457))

(declare-fun m!446459 () Bool)

(assert (=> b!464001 m!446459))

(declare-fun m!446461 () Bool)

(assert (=> b!464005 m!446461))

(declare-fun m!446463 () Bool)

(assert (=> start!41538 m!446463))

(declare-fun m!446465 () Bool)

(assert (=> start!41538 m!446465))

(declare-fun m!446467 () Bool)

(assert (=> start!41538 m!446467))

(declare-fun m!446469 () Bool)

(assert (=> b!464000 m!446469))

(declare-fun m!446471 () Bool)

(assert (=> mapNonEmpty!20626 m!446471))

(check-sat (not b!464005) (not b!464001) (not b_next!11205) (not b!464000) tp_is_empty!12633 (not start!41538) b_and!19545 (not mapNonEmpty!20626))
(check-sat b_and!19545 (not b_next!11205))
