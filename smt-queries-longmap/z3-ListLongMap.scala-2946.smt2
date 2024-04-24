; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41882 () Bool)

(assert start!41882)

(declare-fun b_free!11485 () Bool)

(declare-fun b_next!11485 () Bool)

(assert (=> start!41882 (= b_free!11485 (not b_next!11485))))

(declare-fun tp!40468 () Bool)

(declare-fun b_and!19883 () Bool)

(assert (=> start!41882 (= tp!40468 b_and!19883)))

(declare-fun res!279517 () Bool)

(declare-fun e!273594 () Bool)

(assert (=> start!41882 (=> (not res!279517) (not e!273594))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41882 (= res!279517 (validMask!0 mask!1365))))

(assert (=> start!41882 e!273594))

(declare-fun tp_is_empty!12913 () Bool)

(assert (=> start!41882 tp_is_empty!12913))

(assert (=> start!41882 tp!40468))

(assert (=> start!41882 true))

(declare-datatypes ((array!29594 0))(
  ( (array!29595 (arr!14223 (Array (_ BitVec 32) (_ BitVec 64))) (size!14575 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29594)

(declare-fun array_inv!10360 (array!29594) Bool)

(assert (=> start!41882 (array_inv!10360 _keys!1025)))

(declare-datatypes ((V!18323 0))(
  ( (V!18324 (val!6501 Int)) )
))
(declare-datatypes ((ValueCell!6113 0))(
  ( (ValueCellFull!6113 (v!8791 V!18323)) (EmptyCell!6113) )
))
(declare-datatypes ((array!29596 0))(
  ( (array!29597 (arr!14224 (Array (_ BitVec 32) ValueCell!6113)) (size!14576 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29596)

(declare-fun e!273593 () Bool)

(declare-fun array_inv!10361 (array!29596) Bool)

(assert (=> start!41882 (and (array_inv!10361 _values!833) e!273593)))

(declare-fun mapIsEmpty!21061 () Bool)

(declare-fun mapRes!21061 () Bool)

(assert (=> mapIsEmpty!21061 mapRes!21061))

(declare-fun b!467665 () Bool)

(declare-fun e!273597 () Bool)

(assert (=> b!467665 (= e!273597 true)))

(declare-datatypes ((tuple2!8464 0))(
  ( (tuple2!8465 (_1!4243 (_ BitVec 64)) (_2!4243 V!18323)) )
))
(declare-datatypes ((List!8546 0))(
  ( (Nil!8543) (Cons!8542 (h!9398 tuple2!8464) (t!14494 List!8546)) )
))
(declare-datatypes ((ListLongMap!7379 0))(
  ( (ListLongMap!7380 (toList!3705 List!8546)) )
))
(declare-fun lt!211489 () ListLongMap!7379)

(declare-fun minValueBefore!38 () V!18323)

(declare-fun zeroValue!794 () V!18323)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2135 (array!29594 array!29596 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!467665 (= lt!211489 (getCurrentListMap!2135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467666 () Bool)

(declare-fun res!279518 () Bool)

(assert (=> b!467666 (=> (not res!279518) (not e!273594))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467666 (= res!279518 (and (= (size!14576 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14575 _keys!1025) (size!14576 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467667 () Bool)

(declare-fun res!279516 () Bool)

(assert (=> b!467667 (=> (not res!279516) (not e!273594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29594 (_ BitVec 32)) Bool)

(assert (=> b!467667 (= res!279516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467668 () Bool)

(declare-fun e!273595 () Bool)

(assert (=> b!467668 (= e!273593 (and e!273595 mapRes!21061))))

(declare-fun condMapEmpty!21061 () Bool)

(declare-fun mapDefault!21061 () ValueCell!6113)

(assert (=> b!467668 (= condMapEmpty!21061 (= (arr!14224 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6113)) mapDefault!21061)))))

(declare-fun b!467669 () Bool)

(assert (=> b!467669 (= e!273594 (not e!273597))))

(declare-fun res!279519 () Bool)

(assert (=> b!467669 (=> res!279519 e!273597)))

(assert (=> b!467669 (= res!279519 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211488 () ListLongMap!7379)

(declare-fun lt!211491 () ListLongMap!7379)

(assert (=> b!467669 (= lt!211488 lt!211491)))

(declare-datatypes ((Unit!13622 0))(
  ( (Unit!13623) )
))
(declare-fun lt!211490 () Unit!13622)

(declare-fun minValueAfter!38 () V!18323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!87 (array!29594 array!29596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 V!18323 V!18323 (_ BitVec 32) Int) Unit!13622)

(assert (=> b!467669 (= lt!211490 (lemmaNoChangeToArrayThenSameMapNoExtras!87 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1927 (array!29594 array!29596 (_ BitVec 32) (_ BitVec 32) V!18323 V!18323 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!467669 (= lt!211491 (getCurrentListMapNoExtraKeys!1927 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467669 (= lt!211488 (getCurrentListMapNoExtraKeys!1927 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467670 () Bool)

(assert (=> b!467670 (= e!273595 tp_is_empty!12913)))

(declare-fun b!467671 () Bool)

(declare-fun e!273596 () Bool)

(assert (=> b!467671 (= e!273596 tp_is_empty!12913)))

(declare-fun mapNonEmpty!21061 () Bool)

(declare-fun tp!40467 () Bool)

(assert (=> mapNonEmpty!21061 (= mapRes!21061 (and tp!40467 e!273596))))

(declare-fun mapRest!21061 () (Array (_ BitVec 32) ValueCell!6113))

(declare-fun mapKey!21061 () (_ BitVec 32))

(declare-fun mapValue!21061 () ValueCell!6113)

(assert (=> mapNonEmpty!21061 (= (arr!14224 _values!833) (store mapRest!21061 mapKey!21061 mapValue!21061))))

(declare-fun b!467672 () Bool)

(declare-fun res!279515 () Bool)

(assert (=> b!467672 (=> (not res!279515) (not e!273594))))

(declare-datatypes ((List!8547 0))(
  ( (Nil!8544) (Cons!8543 (h!9399 (_ BitVec 64)) (t!14495 List!8547)) )
))
(declare-fun arrayNoDuplicates!0 (array!29594 (_ BitVec 32) List!8547) Bool)

(assert (=> b!467672 (= res!279515 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8544))))

(assert (= (and start!41882 res!279517) b!467666))

(assert (= (and b!467666 res!279518) b!467667))

(assert (= (and b!467667 res!279516) b!467672))

(assert (= (and b!467672 res!279515) b!467669))

(assert (= (and b!467669 (not res!279519)) b!467665))

(assert (= (and b!467668 condMapEmpty!21061) mapIsEmpty!21061))

(assert (= (and b!467668 (not condMapEmpty!21061)) mapNonEmpty!21061))

(get-info :version)

(assert (= (and mapNonEmpty!21061 ((_ is ValueCellFull!6113) mapValue!21061)) b!467671))

(assert (= (and b!467668 ((_ is ValueCellFull!6113) mapDefault!21061)) b!467670))

(assert (= start!41882 b!467668))

(declare-fun m!450011 () Bool)

(assert (=> start!41882 m!450011))

(declare-fun m!450013 () Bool)

(assert (=> start!41882 m!450013))

(declare-fun m!450015 () Bool)

(assert (=> start!41882 m!450015))

(declare-fun m!450017 () Bool)

(assert (=> b!467672 m!450017))

(declare-fun m!450019 () Bool)

(assert (=> b!467665 m!450019))

(declare-fun m!450021 () Bool)

(assert (=> b!467667 m!450021))

(declare-fun m!450023 () Bool)

(assert (=> b!467669 m!450023))

(declare-fun m!450025 () Bool)

(assert (=> b!467669 m!450025))

(declare-fun m!450027 () Bool)

(assert (=> b!467669 m!450027))

(declare-fun m!450029 () Bool)

(assert (=> mapNonEmpty!21061 m!450029))

(check-sat tp_is_empty!12913 (not start!41882) (not b!467665) (not b!467667) (not b_next!11485) (not mapNonEmpty!21061) (not b!467672) (not b!467669) b_and!19883)
(check-sat b_and!19883 (not b_next!11485))
