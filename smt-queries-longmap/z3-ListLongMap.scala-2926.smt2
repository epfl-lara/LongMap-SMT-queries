; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41728 () Bool)

(assert start!41728)

(declare-fun b_free!11367 () Bool)

(declare-fun b_next!11367 () Bool)

(assert (=> start!41728 (= b_free!11367 (not b_next!11367))))

(declare-fun tp!40105 () Bool)

(declare-fun b_and!19723 () Bool)

(assert (=> start!41728 (= tp!40105 b_and!19723)))

(declare-fun b!465938 () Bool)

(declare-fun res!278523 () Bool)

(declare-fun e!272376 () Bool)

(assert (=> b!465938 (=> (not res!278523) (not e!272376))))

(declare-datatypes ((array!29371 0))(
  ( (array!29372 (arr!14115 (Array (_ BitVec 32) (_ BitVec 64))) (size!14467 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29371)

(declare-datatypes ((List!8533 0))(
  ( (Nil!8530) (Cons!8529 (h!9385 (_ BitVec 64)) (t!14483 List!8533)) )
))
(declare-fun arrayNoDuplicates!0 (array!29371 (_ BitVec 32) List!8533) Bool)

(assert (=> b!465938 (= res!278523 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8530))))

(declare-fun b!465939 () Bool)

(declare-fun e!272379 () Bool)

(assert (=> b!465939 (= e!272376 (not e!272379))))

(declare-fun res!278524 () Bool)

(assert (=> b!465939 (=> res!278524 e!272379)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465939 (= res!278524 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18165 0))(
  ( (V!18166 (val!6442 Int)) )
))
(declare-datatypes ((tuple2!8440 0))(
  ( (tuple2!8441 (_1!4231 (_ BitVec 64)) (_2!4231 V!18165)) )
))
(declare-datatypes ((List!8534 0))(
  ( (Nil!8531) (Cons!8530 (h!9386 tuple2!8440) (t!14484 List!8534)) )
))
(declare-datatypes ((ListLongMap!7353 0))(
  ( (ListLongMap!7354 (toList!3692 List!8534)) )
))
(declare-fun lt!210471 () ListLongMap!7353)

(declare-fun lt!210474 () ListLongMap!7353)

(assert (=> b!465939 (= lt!210471 lt!210474)))

(declare-datatypes ((Unit!13550 0))(
  ( (Unit!13551) )
))
(declare-fun lt!210473 () Unit!13550)

(declare-fun minValueBefore!38 () V!18165)

(declare-fun zeroValue!794 () V!18165)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6054 0))(
  ( (ValueCellFull!6054 (v!8729 V!18165)) (EmptyCell!6054) )
))
(declare-datatypes ((array!29373 0))(
  ( (array!29374 (arr!14116 (Array (_ BitVec 32) ValueCell!6054)) (size!14468 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29373)

(declare-fun minValueAfter!38 () V!18165)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!51 (array!29371 array!29373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18165 V!18165 V!18165 V!18165 (_ BitVec 32) Int) Unit!13550)

(assert (=> b!465939 (= lt!210473 (lemmaNoChangeToArrayThenSameMapNoExtras!51 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1871 (array!29371 array!29373 (_ BitVec 32) (_ BitVec 32) V!18165 V!18165 (_ BitVec 32) Int) ListLongMap!7353)

(assert (=> b!465939 (= lt!210474 (getCurrentListMapNoExtraKeys!1871 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465939 (= lt!210471 (getCurrentListMapNoExtraKeys!1871 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20875 () Bool)

(declare-fun mapRes!20875 () Bool)

(assert (=> mapIsEmpty!20875 mapRes!20875))

(declare-fun mapNonEmpty!20875 () Bool)

(declare-fun tp!40104 () Bool)

(declare-fun e!272380 () Bool)

(assert (=> mapNonEmpty!20875 (= mapRes!20875 (and tp!40104 e!272380))))

(declare-fun mapKey!20875 () (_ BitVec 32))

(declare-fun mapRest!20875 () (Array (_ BitVec 32) ValueCell!6054))

(declare-fun mapValue!20875 () ValueCell!6054)

(assert (=> mapNonEmpty!20875 (= (arr!14116 _values!833) (store mapRest!20875 mapKey!20875 mapValue!20875))))

(declare-fun b!465940 () Bool)

(declare-fun res!278525 () Bool)

(assert (=> b!465940 (=> (not res!278525) (not e!272376))))

(assert (=> b!465940 (= res!278525 (and (= (size!14468 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14467 _keys!1025) (size!14468 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465941 () Bool)

(declare-fun e!272381 () Bool)

(declare-fun tp_is_empty!12795 () Bool)

(assert (=> b!465941 (= e!272381 tp_is_empty!12795)))

(declare-fun b!465942 () Bool)

(declare-fun res!278527 () Bool)

(assert (=> b!465942 (=> (not res!278527) (not e!272376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29371 (_ BitVec 32)) Bool)

(assert (=> b!465942 (= res!278527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278526 () Bool)

(assert (=> start!41728 (=> (not res!278526) (not e!272376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41728 (= res!278526 (validMask!0 mask!1365))))

(assert (=> start!41728 e!272376))

(assert (=> start!41728 tp_is_empty!12795))

(assert (=> start!41728 tp!40105))

(assert (=> start!41728 true))

(declare-fun array_inv!10194 (array!29371) Bool)

(assert (=> start!41728 (array_inv!10194 _keys!1025)))

(declare-fun e!272378 () Bool)

(declare-fun array_inv!10195 (array!29373) Bool)

(assert (=> start!41728 (and (array_inv!10195 _values!833) e!272378)))

(declare-fun b!465943 () Bool)

(assert (=> b!465943 (= e!272378 (and e!272381 mapRes!20875))))

(declare-fun condMapEmpty!20875 () Bool)

(declare-fun mapDefault!20875 () ValueCell!6054)

(assert (=> b!465943 (= condMapEmpty!20875 (= (arr!14116 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6054)) mapDefault!20875)))))

(declare-fun b!465944 () Bool)

(assert (=> b!465944 (= e!272379 true)))

(declare-fun lt!210472 () ListLongMap!7353)

(declare-fun getCurrentListMap!2145 (array!29371 array!29373 (_ BitVec 32) (_ BitVec 32) V!18165 V!18165 (_ BitVec 32) Int) ListLongMap!7353)

(assert (=> b!465944 (= lt!210472 (getCurrentListMap!2145 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210475 () ListLongMap!7353)

(declare-fun +!1651 (ListLongMap!7353 tuple2!8440) ListLongMap!7353)

(assert (=> b!465944 (= lt!210475 (+!1651 (getCurrentListMap!2145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8441 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465945 () Bool)

(assert (=> b!465945 (= e!272380 tp_is_empty!12795)))

(assert (= (and start!41728 res!278526) b!465940))

(assert (= (and b!465940 res!278525) b!465942))

(assert (= (and b!465942 res!278527) b!465938))

(assert (= (and b!465938 res!278523) b!465939))

(assert (= (and b!465939 (not res!278524)) b!465944))

(assert (= (and b!465943 condMapEmpty!20875) mapIsEmpty!20875))

(assert (= (and b!465943 (not condMapEmpty!20875)) mapNonEmpty!20875))

(get-info :version)

(assert (= (and mapNonEmpty!20875 ((_ is ValueCellFull!6054) mapValue!20875)) b!465945))

(assert (= (and b!465943 ((_ is ValueCellFull!6054) mapDefault!20875)) b!465941))

(assert (= start!41728 b!465943))

(declare-fun m!448169 () Bool)

(assert (=> b!465942 m!448169))

(declare-fun m!448171 () Bool)

(assert (=> b!465944 m!448171))

(declare-fun m!448173 () Bool)

(assert (=> b!465944 m!448173))

(assert (=> b!465944 m!448173))

(declare-fun m!448175 () Bool)

(assert (=> b!465944 m!448175))

(declare-fun m!448177 () Bool)

(assert (=> b!465939 m!448177))

(declare-fun m!448179 () Bool)

(assert (=> b!465939 m!448179))

(declare-fun m!448181 () Bool)

(assert (=> b!465939 m!448181))

(declare-fun m!448183 () Bool)

(assert (=> start!41728 m!448183))

(declare-fun m!448185 () Bool)

(assert (=> start!41728 m!448185))

(declare-fun m!448187 () Bool)

(assert (=> start!41728 m!448187))

(declare-fun m!448189 () Bool)

(assert (=> b!465938 m!448189))

(declare-fun m!448191 () Bool)

(assert (=> mapNonEmpty!20875 m!448191))

(check-sat (not b!465944) (not mapNonEmpty!20875) (not b!465942) (not b!465939) b_and!19723 (not start!41728) (not b!465938) (not b_next!11367) tp_is_empty!12795)
(check-sat b_and!19723 (not b_next!11367))
