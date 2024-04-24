; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41838 () Bool)

(assert start!41838)

(declare-fun b_free!11455 () Bool)

(declare-fun b_next!11455 () Bool)

(assert (=> start!41838 (= b_free!11455 (not b_next!11455))))

(declare-fun tp!40375 () Bool)

(declare-fun b_and!19845 () Bool)

(assert (=> start!41838 (= tp!40375 b_and!19845)))

(declare-fun b!467263 () Bool)

(declare-fun res!279304 () Bool)

(declare-fun e!273313 () Bool)

(assert (=> b!467263 (=> (not res!279304) (not e!273313))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29536 0))(
  ( (array!29537 (arr!14195 (Array (_ BitVec 32) (_ BitVec 64))) (size!14547 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29536)

(declare-datatypes ((V!18283 0))(
  ( (V!18284 (val!6486 Int)) )
))
(declare-datatypes ((ValueCell!6098 0))(
  ( (ValueCellFull!6098 (v!8776 V!18283)) (EmptyCell!6098) )
))
(declare-datatypes ((array!29538 0))(
  ( (array!29539 (arr!14196 (Array (_ BitVec 32) ValueCell!6098)) (size!14548 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29538)

(assert (=> b!467263 (= res!279304 (and (= (size!14548 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14547 _keys!1025) (size!14548 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279305 () Bool)

(assert (=> start!41838 (=> (not res!279305) (not e!273313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41838 (= res!279305 (validMask!0 mask!1365))))

(assert (=> start!41838 e!273313))

(declare-fun tp_is_empty!12883 () Bool)

(assert (=> start!41838 tp_is_empty!12883))

(assert (=> start!41838 tp!40375))

(assert (=> start!41838 true))

(declare-fun array_inv!10336 (array!29536) Bool)

(assert (=> start!41838 (array_inv!10336 _keys!1025)))

(declare-fun e!273314 () Bool)

(declare-fun array_inv!10337 (array!29538) Bool)

(assert (=> start!41838 (and (array_inv!10337 _values!833) e!273314)))

(declare-fun b!467264 () Bool)

(declare-fun res!279303 () Bool)

(assert (=> b!467264 (=> (not res!279303) (not e!273313))))

(declare-datatypes ((List!8526 0))(
  ( (Nil!8523) (Cons!8522 (h!9378 (_ BitVec 64)) (t!14472 List!8526)) )
))
(declare-fun arrayNoDuplicates!0 (array!29536 (_ BitVec 32) List!8526) Bool)

(assert (=> b!467264 (= res!279303 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8523))))

(declare-fun b!467265 () Bool)

(declare-fun e!273311 () Bool)

(declare-fun mapRes!21013 () Bool)

(assert (=> b!467265 (= e!273314 (and e!273311 mapRes!21013))))

(declare-fun condMapEmpty!21013 () Bool)

(declare-fun mapDefault!21013 () ValueCell!6098)

(assert (=> b!467265 (= condMapEmpty!21013 (= (arr!14196 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6098)) mapDefault!21013)))))

(declare-fun b!467266 () Bool)

(assert (=> b!467266 (= e!273311 tp_is_empty!12883)))

(declare-fun mapNonEmpty!21013 () Bool)

(declare-fun tp!40374 () Bool)

(declare-fun e!273312 () Bool)

(assert (=> mapNonEmpty!21013 (= mapRes!21013 (and tp!40374 e!273312))))

(declare-fun mapKey!21013 () (_ BitVec 32))

(declare-fun mapValue!21013 () ValueCell!6098)

(declare-fun mapRest!21013 () (Array (_ BitVec 32) ValueCell!6098))

(assert (=> mapNonEmpty!21013 (= (arr!14196 _values!833) (store mapRest!21013 mapKey!21013 mapValue!21013))))

(declare-fun b!467267 () Bool)

(declare-fun res!279302 () Bool)

(assert (=> b!467267 (=> (not res!279302) (not e!273313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29536 (_ BitVec 32)) Bool)

(assert (=> b!467267 (= res!279302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467268 () Bool)

(assert (=> b!467268 (= e!273312 tp_is_empty!12883)))

(declare-fun b!467269 () Bool)

(assert (=> b!467269 (= e!273313 (not true))))

(declare-datatypes ((tuple2!8446 0))(
  ( (tuple2!8447 (_1!4234 (_ BitVec 64)) (_2!4234 V!18283)) )
))
(declare-datatypes ((List!8527 0))(
  ( (Nil!8524) (Cons!8523 (h!9379 tuple2!8446) (t!14473 List!8527)) )
))
(declare-datatypes ((ListLongMap!7361 0))(
  ( (ListLongMap!7362 (toList!3696 List!8527)) )
))
(declare-fun lt!211311 () ListLongMap!7361)

(declare-fun lt!211312 () ListLongMap!7361)

(assert (=> b!467269 (= lt!211311 lt!211312)))

(declare-datatypes ((Unit!13604 0))(
  ( (Unit!13605) )
))
(declare-fun lt!211313 () Unit!13604)

(declare-fun minValueBefore!38 () V!18283)

(declare-fun zeroValue!794 () V!18283)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18283)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!78 (array!29536 array!29538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18283 V!18283 V!18283 V!18283 (_ BitVec 32) Int) Unit!13604)

(assert (=> b!467269 (= lt!211313 (lemmaNoChangeToArrayThenSameMapNoExtras!78 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1918 (array!29536 array!29538 (_ BitVec 32) (_ BitVec 32) V!18283 V!18283 (_ BitVec 32) Int) ListLongMap!7361)

(assert (=> b!467269 (= lt!211312 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467269 (= lt!211311 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21013 () Bool)

(assert (=> mapIsEmpty!21013 mapRes!21013))

(assert (= (and start!41838 res!279305) b!467263))

(assert (= (and b!467263 res!279304) b!467267))

(assert (= (and b!467267 res!279302) b!467264))

(assert (= (and b!467264 res!279303) b!467269))

(assert (= (and b!467265 condMapEmpty!21013) mapIsEmpty!21013))

(assert (= (and b!467265 (not condMapEmpty!21013)) mapNonEmpty!21013))

(get-info :version)

(assert (= (and mapNonEmpty!21013 ((_ is ValueCellFull!6098) mapValue!21013)) b!467268))

(assert (= (and b!467265 ((_ is ValueCellFull!6098) mapDefault!21013)) b!467266))

(assert (= start!41838 b!467265))

(declare-fun m!449675 () Bool)

(assert (=> b!467264 m!449675))

(declare-fun m!449677 () Bool)

(assert (=> start!41838 m!449677))

(declare-fun m!449679 () Bool)

(assert (=> start!41838 m!449679))

(declare-fun m!449681 () Bool)

(assert (=> start!41838 m!449681))

(declare-fun m!449683 () Bool)

(assert (=> mapNonEmpty!21013 m!449683))

(declare-fun m!449685 () Bool)

(assert (=> b!467269 m!449685))

(declare-fun m!449687 () Bool)

(assert (=> b!467269 m!449687))

(declare-fun m!449689 () Bool)

(assert (=> b!467269 m!449689))

(declare-fun m!449691 () Bool)

(assert (=> b!467267 m!449691))

(check-sat (not b_next!11455) (not start!41838) tp_is_empty!12883 (not b!467267) (not b!467269) b_and!19845 (not b!467264) (not mapNonEmpty!21013))
(check-sat b_and!19845 (not b_next!11455))
