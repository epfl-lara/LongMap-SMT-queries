; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41794 () Bool)

(assert start!41794)

(declare-fun b_free!11415 () Bool)

(declare-fun b_next!11415 () Bool)

(assert (=> start!41794 (= b_free!11415 (not b_next!11415))))

(declare-fun tp!40251 () Bool)

(declare-fun b_and!19783 () Bool)

(assert (=> start!41794 (= tp!40251 b_and!19783)))

(declare-fun b!466698 () Bool)

(declare-fun e!272920 () Bool)

(declare-fun e!272919 () Bool)

(assert (=> b!466698 (= e!272920 (not e!272919))))

(declare-fun res!278965 () Bool)

(assert (=> b!466698 (=> res!278965 e!272919)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466698 (= res!278965 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18229 0))(
  ( (V!18230 (val!6466 Int)) )
))
(declare-datatypes ((tuple2!8482 0))(
  ( (tuple2!8483 (_1!4252 (_ BitVec 64)) (_2!4252 V!18229)) )
))
(declare-datatypes ((List!8572 0))(
  ( (Nil!8569) (Cons!8568 (h!9424 tuple2!8482) (t!14524 List!8572)) )
))
(declare-datatypes ((ListLongMap!7395 0))(
  ( (ListLongMap!7396 (toList!3713 List!8572)) )
))
(declare-fun lt!210956 () ListLongMap!7395)

(declare-fun lt!210955 () ListLongMap!7395)

(assert (=> b!466698 (= lt!210956 lt!210955)))

(declare-fun minValueBefore!38 () V!18229)

(declare-fun zeroValue!794 () V!18229)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13588 0))(
  ( (Unit!13589) )
))
(declare-fun lt!210957 () Unit!13588)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29467 0))(
  ( (array!29468 (arr!14162 (Array (_ BitVec 32) (_ BitVec 64))) (size!14514 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29467)

(declare-datatypes ((ValueCell!6078 0))(
  ( (ValueCellFull!6078 (v!8754 V!18229)) (EmptyCell!6078) )
))
(declare-datatypes ((array!29469 0))(
  ( (array!29470 (arr!14163 (Array (_ BitVec 32) ValueCell!6078)) (size!14515 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29469)

(declare-fun minValueAfter!38 () V!18229)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!69 (array!29467 array!29469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18229 V!18229 V!18229 V!18229 (_ BitVec 32) Int) Unit!13588)

(assert (=> b!466698 (= lt!210957 (lemmaNoChangeToArrayThenSameMapNoExtras!69 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1889 (array!29467 array!29469 (_ BitVec 32) (_ BitVec 32) V!18229 V!18229 (_ BitVec 32) Int) ListLongMap!7395)

(assert (=> b!466698 (= lt!210955 (getCurrentListMapNoExtraKeys!1889 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466698 (= lt!210956 (getCurrentListMapNoExtraKeys!1889 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466699 () Bool)

(declare-fun res!278968 () Bool)

(assert (=> b!466699 (=> (not res!278968) (not e!272920))))

(assert (=> b!466699 (= res!278968 (and (= (size!14515 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14514 _keys!1025) (size!14515 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466700 () Bool)

(declare-fun res!278966 () Bool)

(assert (=> b!466700 (=> (not res!278966) (not e!272920))))

(declare-datatypes ((List!8573 0))(
  ( (Nil!8570) (Cons!8569 (h!9425 (_ BitVec 64)) (t!14525 List!8573)) )
))
(declare-fun arrayNoDuplicates!0 (array!29467 (_ BitVec 32) List!8573) Bool)

(assert (=> b!466700 (= res!278966 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8570))))

(declare-fun mapNonEmpty!20950 () Bool)

(declare-fun mapRes!20950 () Bool)

(declare-fun tp!40252 () Bool)

(declare-fun e!272923 () Bool)

(assert (=> mapNonEmpty!20950 (= mapRes!20950 (and tp!40252 e!272923))))

(declare-fun mapRest!20950 () (Array (_ BitVec 32) ValueCell!6078))

(declare-fun mapKey!20950 () (_ BitVec 32))

(declare-fun mapValue!20950 () ValueCell!6078)

(assert (=> mapNonEmpty!20950 (= (arr!14163 _values!833) (store mapRest!20950 mapKey!20950 mapValue!20950))))

(declare-fun b!466701 () Bool)

(declare-fun e!272918 () Bool)

(declare-fun e!272921 () Bool)

(assert (=> b!466701 (= e!272918 (and e!272921 mapRes!20950))))

(declare-fun condMapEmpty!20950 () Bool)

(declare-fun mapDefault!20950 () ValueCell!6078)

(assert (=> b!466701 (= condMapEmpty!20950 (= (arr!14163 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6078)) mapDefault!20950)))))

(declare-fun b!466702 () Bool)

(assert (=> b!466702 (= e!272919 true)))

(declare-fun lt!210954 () ListLongMap!7395)

(declare-fun getCurrentListMap!2162 (array!29467 array!29469 (_ BitVec 32) (_ BitVec 32) V!18229 V!18229 (_ BitVec 32) Int) ListLongMap!7395)

(assert (=> b!466702 (= lt!210954 (getCurrentListMap!2162 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210953 () ListLongMap!7395)

(declare-fun +!1668 (ListLongMap!7395 tuple2!8482) ListLongMap!7395)

(assert (=> b!466702 (= lt!210953 (+!1668 (getCurrentListMap!2162 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8483 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466703 () Bool)

(declare-fun tp_is_empty!12843 () Bool)

(assert (=> b!466703 (= e!272923 tp_is_empty!12843)))

(declare-fun res!278969 () Bool)

(assert (=> start!41794 (=> (not res!278969) (not e!272920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41794 (= res!278969 (validMask!0 mask!1365))))

(assert (=> start!41794 e!272920))

(assert (=> start!41794 tp_is_empty!12843))

(assert (=> start!41794 tp!40251))

(assert (=> start!41794 true))

(declare-fun array_inv!10226 (array!29467) Bool)

(assert (=> start!41794 (array_inv!10226 _keys!1025)))

(declare-fun array_inv!10227 (array!29469) Bool)

(assert (=> start!41794 (and (array_inv!10227 _values!833) e!272918)))

(declare-fun mapIsEmpty!20950 () Bool)

(assert (=> mapIsEmpty!20950 mapRes!20950))

(declare-fun b!466704 () Bool)

(declare-fun res!278967 () Bool)

(assert (=> b!466704 (=> (not res!278967) (not e!272920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29467 (_ BitVec 32)) Bool)

(assert (=> b!466704 (= res!278967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466705 () Bool)

(assert (=> b!466705 (= e!272921 tp_is_empty!12843)))

(assert (= (and start!41794 res!278969) b!466699))

(assert (= (and b!466699 res!278968) b!466704))

(assert (= (and b!466704 res!278967) b!466700))

(assert (= (and b!466700 res!278966) b!466698))

(assert (= (and b!466698 (not res!278965)) b!466702))

(assert (= (and b!466701 condMapEmpty!20950) mapIsEmpty!20950))

(assert (= (and b!466701 (not condMapEmpty!20950)) mapNonEmpty!20950))

(get-info :version)

(assert (= (and mapNonEmpty!20950 ((_ is ValueCellFull!6078) mapValue!20950)) b!466703))

(assert (= (and b!466701 ((_ is ValueCellFull!6078) mapDefault!20950)) b!466705))

(assert (= start!41794 b!466701))

(declare-fun m!448915 () Bool)

(assert (=> mapNonEmpty!20950 m!448915))

(declare-fun m!448917 () Bool)

(assert (=> b!466702 m!448917))

(declare-fun m!448919 () Bool)

(assert (=> b!466702 m!448919))

(assert (=> b!466702 m!448919))

(declare-fun m!448921 () Bool)

(assert (=> b!466702 m!448921))

(declare-fun m!448923 () Bool)

(assert (=> b!466698 m!448923))

(declare-fun m!448925 () Bool)

(assert (=> b!466698 m!448925))

(declare-fun m!448927 () Bool)

(assert (=> b!466698 m!448927))

(declare-fun m!448929 () Bool)

(assert (=> b!466700 m!448929))

(declare-fun m!448931 () Bool)

(assert (=> b!466704 m!448931))

(declare-fun m!448933 () Bool)

(assert (=> start!41794 m!448933))

(declare-fun m!448935 () Bool)

(assert (=> start!41794 m!448935))

(declare-fun m!448937 () Bool)

(assert (=> start!41794 m!448937))

(check-sat (not mapNonEmpty!20950) (not b!466698) (not start!41794) (not b!466700) (not b!466704) tp_is_empty!12843 (not b!466702) (not b_next!11415) b_and!19783)
(check-sat b_and!19783 (not b_next!11415))
