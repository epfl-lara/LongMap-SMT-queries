; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41882 () Bool)

(assert start!41882)

(declare-fun b_free!11485 () Bool)

(declare-fun b_next!11485 () Bool)

(assert (=> start!41882 (= b_free!11485 (not b_next!11485))))

(declare-fun tp!40468 () Bool)

(declare-fun b_and!19847 () Bool)

(assert (=> start!41882 (= tp!40468 b_and!19847)))

(declare-fun b!467455 () Bool)

(declare-fun res!279395 () Bool)

(declare-fun e!273461 () Bool)

(assert (=> b!467455 (=> (not res!279395) (not e!273461))))

(declare-datatypes ((array!29595 0))(
  ( (array!29596 (arr!14224 (Array (_ BitVec 32) (_ BitVec 64))) (size!14577 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29595)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29595 (_ BitVec 32)) Bool)

(assert (=> b!467455 (= res!279395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467456 () Bool)

(declare-fun res!279394 () Bool)

(assert (=> b!467456 (=> (not res!279394) (not e!273461))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18323 0))(
  ( (V!18324 (val!6501 Int)) )
))
(declare-datatypes ((ValueCell!6113 0))(
  ( (ValueCellFull!6113 (v!8784 V!18323)) (EmptyCell!6113) )
))
(declare-datatypes ((array!29597 0))(
  ( (array!29598 (arr!14225 (Array (_ BitVec 32) ValueCell!6113)) (size!14578 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29597)

(assert (=> b!467456 (= res!279394 (and (= (size!14578 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14577 _keys!1025) (size!14578 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467457 () Bool)

(declare-fun e!273462 () Bool)

(declare-fun tp_is_empty!12913 () Bool)

(assert (=> b!467457 (= e!273462 tp_is_empty!12913)))

(declare-fun res!279393 () Bool)

(assert (=> start!41882 (=> (not res!279393) (not e!273461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41882 (= res!279393 (validMask!0 mask!1365))))

(assert (=> start!41882 e!273461))

(assert (=> start!41882 tp_is_empty!12913))

(assert (=> start!41882 tp!40468))

(assert (=> start!41882 true))

(declare-fun array_inv!10350 (array!29595) Bool)

(assert (=> start!41882 (array_inv!10350 _keys!1025)))

(declare-fun e!273458 () Bool)

(declare-fun array_inv!10351 (array!29597) Bool)

(assert (=> start!41882 (and (array_inv!10351 _values!833) e!273458)))

(declare-fun b!467458 () Bool)

(declare-fun e!273460 () Bool)

(assert (=> b!467458 (= e!273460 true)))

(declare-fun minValueBefore!38 () V!18323)

(declare-fun zeroValue!794 () V!18323)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8574 0))(
  ( (tuple2!8575 (_1!4298 (_ BitVec 64)) (_2!4298 V!18323)) )
))
(declare-datatypes ((List!8653 0))(
  ( (Nil!8650) (Cons!8649 (h!9505 tuple2!8574) (t!14600 List!8653)) )
))
(declare-datatypes ((ListLongMap!7477 0))(
  ( (ListLongMap!7478 (toList!3754 List!8653)) )
))
(declare-fun lt!211243 () ListLongMap!7477)

(declare-fun getCurrentListMap!2126 (array!29595 array!29597 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!467458 (= lt!211243 (getCurrentListMap!2126 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467459 () Bool)

(declare-fun e!273463 () Bool)

(assert (=> b!467459 (= e!273463 tp_is_empty!12913)))

(declare-fun b!467460 () Bool)

(declare-fun res!279397 () Bool)

(assert (=> b!467460 (=> (not res!279397) (not e!273461))))

(declare-datatypes ((List!8654 0))(
  ( (Nil!8651) (Cons!8650 (h!9506 (_ BitVec 64)) (t!14601 List!8654)) )
))
(declare-fun arrayNoDuplicates!0 (array!29595 (_ BitVec 32) List!8654) Bool)

(assert (=> b!467460 (= res!279397 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8651))))

(declare-fun mapIsEmpty!21061 () Bool)

(declare-fun mapRes!21061 () Bool)

(assert (=> mapIsEmpty!21061 mapRes!21061))

(declare-fun b!467461 () Bool)

(assert (=> b!467461 (= e!273461 (not e!273460))))

(declare-fun res!279396 () Bool)

(assert (=> b!467461 (=> res!279396 e!273460)))

(assert (=> b!467461 (= res!279396 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211242 () ListLongMap!7477)

(declare-fun lt!211245 () ListLongMap!7477)

(assert (=> b!467461 (= lt!211242 lt!211245)))

(declare-datatypes ((Unit!13612 0))(
  ( (Unit!13613) )
))
(declare-fun lt!211244 () Unit!13612)

(declare-fun minValueAfter!38 () V!18323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!95 (array!29595 array!29597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 V!18323 V!18323 (_ BitVec 32) Int) Unit!13612)

(assert (=> b!467461 (= lt!211244 (lemmaNoChangeToArrayThenSameMapNoExtras!95 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1938 (array!29595 array!29597 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!467461 (= lt!211245 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467461 (= lt!211242 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467462 () Bool)

(assert (=> b!467462 (= e!273458 (and e!273463 mapRes!21061))))

(declare-fun condMapEmpty!21061 () Bool)

(declare-fun mapDefault!21061 () ValueCell!6113)

(assert (=> b!467462 (= condMapEmpty!21061 (= (arr!14225 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6113)) mapDefault!21061)))))

(declare-fun mapNonEmpty!21061 () Bool)

(declare-fun tp!40467 () Bool)

(assert (=> mapNonEmpty!21061 (= mapRes!21061 (and tp!40467 e!273462))))

(declare-fun mapValue!21061 () ValueCell!6113)

(declare-fun mapRest!21061 () (Array (_ BitVec 32) ValueCell!6113))

(declare-fun mapKey!21061 () (_ BitVec 32))

(assert (=> mapNonEmpty!21061 (= (arr!14225 _values!833) (store mapRest!21061 mapKey!21061 mapValue!21061))))

(assert (= (and start!41882 res!279393) b!467456))

(assert (= (and b!467456 res!279394) b!467455))

(assert (= (and b!467455 res!279395) b!467460))

(assert (= (and b!467460 res!279397) b!467461))

(assert (= (and b!467461 (not res!279396)) b!467458))

(assert (= (and b!467462 condMapEmpty!21061) mapIsEmpty!21061))

(assert (= (and b!467462 (not condMapEmpty!21061)) mapNonEmpty!21061))

(get-info :version)

(assert (= (and mapNonEmpty!21061 ((_ is ValueCellFull!6113) mapValue!21061)) b!467457))

(assert (= (and b!467462 ((_ is ValueCellFull!6113) mapDefault!21061)) b!467459))

(assert (= start!41882 b!467462))

(declare-fun m!449095 () Bool)

(assert (=> start!41882 m!449095))

(declare-fun m!449097 () Bool)

(assert (=> start!41882 m!449097))

(declare-fun m!449099 () Bool)

(assert (=> start!41882 m!449099))

(declare-fun m!449101 () Bool)

(assert (=> b!467458 m!449101))

(declare-fun m!449103 () Bool)

(assert (=> mapNonEmpty!21061 m!449103))

(declare-fun m!449105 () Bool)

(assert (=> b!467455 m!449105))

(declare-fun m!449107 () Bool)

(assert (=> b!467461 m!449107))

(declare-fun m!449109 () Bool)

(assert (=> b!467461 m!449109))

(declare-fun m!449111 () Bool)

(assert (=> b!467461 m!449111))

(declare-fun m!449113 () Bool)

(assert (=> b!467460 m!449113))

(check-sat (not b!467458) (not b!467461) (not b!467460) b_and!19847 (not b_next!11485) tp_is_empty!12913 (not mapNonEmpty!21061) (not start!41882) (not b!467455))
(check-sat b_and!19847 (not b_next!11485))
