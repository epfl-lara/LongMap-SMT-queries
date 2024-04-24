; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41850 () Bool)

(assert start!41850)

(declare-fun b_free!11467 () Bool)

(declare-fun b_next!11467 () Bool)

(assert (=> start!41850 (= b_free!11467 (not b_next!11467))))

(declare-fun tp!40411 () Bool)

(declare-fun b_and!19857 () Bool)

(assert (=> start!41850 (= tp!40411 b_and!19857)))

(declare-fun res!279375 () Bool)

(declare-fun e!273402 () Bool)

(assert (=> start!41850 (=> (not res!279375) (not e!273402))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41850 (= res!279375 (validMask!0 mask!1365))))

(assert (=> start!41850 e!273402))

(declare-fun tp_is_empty!12895 () Bool)

(assert (=> start!41850 tp_is_empty!12895))

(assert (=> start!41850 tp!40411))

(assert (=> start!41850 true))

(declare-datatypes ((array!29558 0))(
  ( (array!29559 (arr!14206 (Array (_ BitVec 32) (_ BitVec 64))) (size!14558 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29558)

(declare-fun array_inv!10346 (array!29558) Bool)

(assert (=> start!41850 (array_inv!10346 _keys!1025)))

(declare-datatypes ((V!18299 0))(
  ( (V!18300 (val!6492 Int)) )
))
(declare-datatypes ((ValueCell!6104 0))(
  ( (ValueCellFull!6104 (v!8782 V!18299)) (EmptyCell!6104) )
))
(declare-datatypes ((array!29560 0))(
  ( (array!29561 (arr!14207 (Array (_ BitVec 32) ValueCell!6104)) (size!14559 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29560)

(declare-fun e!273404 () Bool)

(declare-fun array_inv!10347 (array!29560) Bool)

(assert (=> start!41850 (and (array_inv!10347 _values!833) e!273404)))

(declare-fun b!467389 () Bool)

(declare-fun res!279376 () Bool)

(assert (=> b!467389 (=> (not res!279376) (not e!273402))))

(declare-datatypes ((List!8534 0))(
  ( (Nil!8531) (Cons!8530 (h!9386 (_ BitVec 64)) (t!14480 List!8534)) )
))
(declare-fun arrayNoDuplicates!0 (array!29558 (_ BitVec 32) List!8534) Bool)

(assert (=> b!467389 (= res!279376 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8531))))

(declare-fun mapIsEmpty!21031 () Bool)

(declare-fun mapRes!21031 () Bool)

(assert (=> mapIsEmpty!21031 mapRes!21031))

(declare-fun b!467390 () Bool)

(declare-fun res!279374 () Bool)

(assert (=> b!467390 (=> (not res!279374) (not e!273402))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467390 (= res!279374 (and (= (size!14559 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14558 _keys!1025) (size!14559 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467391 () Bool)

(declare-fun res!279377 () Bool)

(assert (=> b!467391 (=> (not res!279377) (not e!273402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29558 (_ BitVec 32)) Bool)

(assert (=> b!467391 (= res!279377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467392 () Bool)

(declare-fun e!273401 () Bool)

(assert (=> b!467392 (= e!273404 (and e!273401 mapRes!21031))))

(declare-fun condMapEmpty!21031 () Bool)

(declare-fun mapDefault!21031 () ValueCell!6104)

(assert (=> b!467392 (= condMapEmpty!21031 (= (arr!14207 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6104)) mapDefault!21031)))))

(declare-fun b!467393 () Bool)

(declare-fun e!273403 () Bool)

(assert (=> b!467393 (= e!273403 tp_is_empty!12895)))

(declare-fun b!467394 () Bool)

(assert (=> b!467394 (= e!273402 (not true))))

(declare-datatypes ((tuple2!8454 0))(
  ( (tuple2!8455 (_1!4238 (_ BitVec 64)) (_2!4238 V!18299)) )
))
(declare-datatypes ((List!8535 0))(
  ( (Nil!8532) (Cons!8531 (h!9387 tuple2!8454) (t!14481 List!8535)) )
))
(declare-datatypes ((ListLongMap!7369 0))(
  ( (ListLongMap!7370 (toList!3700 List!8535)) )
))
(declare-fun lt!211367 () ListLongMap!7369)

(declare-fun lt!211366 () ListLongMap!7369)

(assert (=> b!467394 (= lt!211367 lt!211366)))

(declare-fun minValueBefore!38 () V!18299)

(declare-fun zeroValue!794 () V!18299)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13612 0))(
  ( (Unit!13613) )
))
(declare-fun lt!211365 () Unit!13612)

(declare-fun minValueAfter!38 () V!18299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!82 (array!29558 array!29560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18299 V!18299 V!18299 V!18299 (_ BitVec 32) Int) Unit!13612)

(assert (=> b!467394 (= lt!211365 (lemmaNoChangeToArrayThenSameMapNoExtras!82 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1922 (array!29558 array!29560 (_ BitVec 32) (_ BitVec 32) V!18299 V!18299 (_ BitVec 32) Int) ListLongMap!7369)

(assert (=> b!467394 (= lt!211366 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467394 (= lt!211367 (getCurrentListMapNoExtraKeys!1922 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467395 () Bool)

(assert (=> b!467395 (= e!273401 tp_is_empty!12895)))

(declare-fun mapNonEmpty!21031 () Bool)

(declare-fun tp!40410 () Bool)

(assert (=> mapNonEmpty!21031 (= mapRes!21031 (and tp!40410 e!273403))))

(declare-fun mapValue!21031 () ValueCell!6104)

(declare-fun mapRest!21031 () (Array (_ BitVec 32) ValueCell!6104))

(declare-fun mapKey!21031 () (_ BitVec 32))

(assert (=> mapNonEmpty!21031 (= (arr!14207 _values!833) (store mapRest!21031 mapKey!21031 mapValue!21031))))

(assert (= (and start!41850 res!279375) b!467390))

(assert (= (and b!467390 res!279374) b!467391))

(assert (= (and b!467391 res!279377) b!467389))

(assert (= (and b!467389 res!279376) b!467394))

(assert (= (and b!467392 condMapEmpty!21031) mapIsEmpty!21031))

(assert (= (and b!467392 (not condMapEmpty!21031)) mapNonEmpty!21031))

(get-info :version)

(assert (= (and mapNonEmpty!21031 ((_ is ValueCellFull!6104) mapValue!21031)) b!467393))

(assert (= (and b!467392 ((_ is ValueCellFull!6104) mapDefault!21031)) b!467395))

(assert (= start!41850 b!467392))

(declare-fun m!449783 () Bool)

(assert (=> b!467391 m!449783))

(declare-fun m!449785 () Bool)

(assert (=> mapNonEmpty!21031 m!449785))

(declare-fun m!449787 () Bool)

(assert (=> b!467389 m!449787))

(declare-fun m!449789 () Bool)

(assert (=> start!41850 m!449789))

(declare-fun m!449791 () Bool)

(assert (=> start!41850 m!449791))

(declare-fun m!449793 () Bool)

(assert (=> start!41850 m!449793))

(declare-fun m!449795 () Bool)

(assert (=> b!467394 m!449795))

(declare-fun m!449797 () Bool)

(assert (=> b!467394 m!449797))

(declare-fun m!449799 () Bool)

(assert (=> b!467394 m!449799))

(check-sat (not b!467394) (not b!467391) (not mapNonEmpty!21031) tp_is_empty!12895 (not b!467389) b_and!19857 (not start!41850) (not b_next!11467))
(check-sat b_and!19857 (not b_next!11467))
