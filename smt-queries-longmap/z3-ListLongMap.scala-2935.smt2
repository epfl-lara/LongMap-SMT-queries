; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41784 () Bool)

(assert start!41784)

(declare-fun b_free!11419 () Bool)

(declare-fun b_next!11419 () Bool)

(assert (=> start!41784 (= b_free!11419 (not b_next!11419))))

(declare-fun tp!40263 () Bool)

(declare-fun b_and!19761 () Bool)

(assert (=> start!41784 (= tp!40263 b_and!19761)))

(declare-fun res!278867 () Bool)

(declare-fun e!272782 () Bool)

(assert (=> start!41784 (=> (not res!278867) (not e!272782))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41784 (= res!278867 (validMask!0 mask!1365))))

(assert (=> start!41784 e!272782))

(declare-fun tp_is_empty!12847 () Bool)

(assert (=> start!41784 tp_is_empty!12847))

(assert (=> start!41784 tp!40263))

(assert (=> start!41784 true))

(declare-datatypes ((array!29469 0))(
  ( (array!29470 (arr!14163 (Array (_ BitVec 32) (_ BitVec 64))) (size!14516 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29469)

(declare-fun array_inv!10312 (array!29469) Bool)

(assert (=> start!41784 (array_inv!10312 _keys!1025)))

(declare-datatypes ((V!18235 0))(
  ( (V!18236 (val!6468 Int)) )
))
(declare-datatypes ((ValueCell!6080 0))(
  ( (ValueCellFull!6080 (v!8750 V!18235)) (EmptyCell!6080) )
))
(declare-datatypes ((array!29471 0))(
  ( (array!29472 (arr!14164 (Array (_ BitVec 32) ValueCell!6080)) (size!14517 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29471)

(declare-fun e!272781 () Bool)

(declare-fun array_inv!10313 (array!29471) Bool)

(assert (=> start!41784 (and (array_inv!10313 _values!833) e!272781)))

(declare-fun mapIsEmpty!20956 () Bool)

(declare-fun mapRes!20956 () Bool)

(assert (=> mapIsEmpty!20956 mapRes!20956))

(declare-fun mapNonEmpty!20956 () Bool)

(declare-fun tp!40264 () Bool)

(declare-fun e!272780 () Bool)

(assert (=> mapNonEmpty!20956 (= mapRes!20956 (and tp!40264 e!272780))))

(declare-fun mapValue!20956 () ValueCell!6080)

(declare-fun mapKey!20956 () (_ BitVec 32))

(declare-fun mapRest!20956 () (Array (_ BitVec 32) ValueCell!6080))

(assert (=> mapNonEmpty!20956 (= (arr!14164 _values!833) (store mapRest!20956 mapKey!20956 mapValue!20956))))

(declare-fun b!466475 () Bool)

(declare-fun res!278866 () Bool)

(assert (=> b!466475 (=> (not res!278866) (not e!272782))))

(declare-datatypes ((List!8610 0))(
  ( (Nil!8607) (Cons!8606 (h!9462 (_ BitVec 64)) (t!14553 List!8610)) )
))
(declare-fun arrayNoDuplicates!0 (array!29469 (_ BitVec 32) List!8610) Bool)

(assert (=> b!466475 (= res!278866 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8607))))

(declare-fun b!466476 () Bool)

(declare-fun res!278868 () Bool)

(assert (=> b!466476 (=> (not res!278868) (not e!272782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29469 (_ BitVec 32)) Bool)

(assert (=> b!466476 (= res!278868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466477 () Bool)

(assert (=> b!466477 (= e!272780 tp_is_empty!12847)))

(declare-fun b!466478 () Bool)

(declare-fun e!272785 () Bool)

(assert (=> b!466478 (= e!272785 true)))

(declare-fun zeroValue!794 () V!18235)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8528 0))(
  ( (tuple2!8529 (_1!4275 (_ BitVec 64)) (_2!4275 V!18235)) )
))
(declare-datatypes ((List!8611 0))(
  ( (Nil!8608) (Cons!8607 (h!9463 tuple2!8528) (t!14554 List!8611)) )
))
(declare-datatypes ((ListLongMap!7431 0))(
  ( (ListLongMap!7432 (toList!3731 List!8611)) )
))
(declare-fun lt!210751 () ListLongMap!7431)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18235)

(declare-fun getCurrentListMap!2121 (array!29469 array!29471 (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 (_ BitVec 32) Int) ListLongMap!7431)

(assert (=> b!466478 (= lt!210751 (getCurrentListMap!2121 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18235)

(declare-fun lt!210749 () ListLongMap!7431)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1702 (ListLongMap!7431 tuple2!8528) ListLongMap!7431)

(assert (=> b!466478 (= lt!210749 (+!1702 (getCurrentListMap!2121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8529 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466479 () Bool)

(declare-fun e!272784 () Bool)

(assert (=> b!466479 (= e!272781 (and e!272784 mapRes!20956))))

(declare-fun condMapEmpty!20956 () Bool)

(declare-fun mapDefault!20956 () ValueCell!6080)

(assert (=> b!466479 (= condMapEmpty!20956 (= (arr!14164 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6080)) mapDefault!20956)))))

(declare-fun b!466480 () Bool)

(assert (=> b!466480 (= e!272782 (not e!272785))))

(declare-fun res!278869 () Bool)

(assert (=> b!466480 (=> res!278869 e!272785)))

(assert (=> b!466480 (= res!278869 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210752 () ListLongMap!7431)

(declare-fun lt!210753 () ListLongMap!7431)

(assert (=> b!466480 (= lt!210752 lt!210753)))

(declare-datatypes ((Unit!13564 0))(
  ( (Unit!13565) )
))
(declare-fun lt!210750 () Unit!13564)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!72 (array!29469 array!29471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 V!18235 V!18235 (_ BitVec 32) Int) Unit!13564)

(assert (=> b!466480 (= lt!210750 (lemmaNoChangeToArrayThenSameMapNoExtras!72 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1915 (array!29469 array!29471 (_ BitVec 32) (_ BitVec 32) V!18235 V!18235 (_ BitVec 32) Int) ListLongMap!7431)

(assert (=> b!466480 (= lt!210753 (getCurrentListMapNoExtraKeys!1915 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466480 (= lt!210752 (getCurrentListMapNoExtraKeys!1915 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466481 () Bool)

(assert (=> b!466481 (= e!272784 tp_is_empty!12847)))

(declare-fun b!466482 () Bool)

(declare-fun res!278870 () Bool)

(assert (=> b!466482 (=> (not res!278870) (not e!272782))))

(assert (=> b!466482 (= res!278870 (and (= (size!14517 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14516 _keys!1025) (size!14517 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41784 res!278867) b!466482))

(assert (= (and b!466482 res!278870) b!466476))

(assert (= (and b!466476 res!278868) b!466475))

(assert (= (and b!466475 res!278866) b!466480))

(assert (= (and b!466480 (not res!278869)) b!466478))

(assert (= (and b!466479 condMapEmpty!20956) mapIsEmpty!20956))

(assert (= (and b!466479 (not condMapEmpty!20956)) mapNonEmpty!20956))

(get-info :version)

(assert (= (and mapNonEmpty!20956 ((_ is ValueCellFull!6080) mapValue!20956)) b!466477))

(assert (= (and b!466479 ((_ is ValueCellFull!6080) mapDefault!20956)) b!466481))

(assert (= start!41784 b!466479))

(declare-fun m!448229 () Bool)

(assert (=> mapNonEmpty!20956 m!448229))

(declare-fun m!448231 () Bool)

(assert (=> start!41784 m!448231))

(declare-fun m!448233 () Bool)

(assert (=> start!41784 m!448233))

(declare-fun m!448235 () Bool)

(assert (=> start!41784 m!448235))

(declare-fun m!448237 () Bool)

(assert (=> b!466478 m!448237))

(declare-fun m!448239 () Bool)

(assert (=> b!466478 m!448239))

(assert (=> b!466478 m!448239))

(declare-fun m!448241 () Bool)

(assert (=> b!466478 m!448241))

(declare-fun m!448243 () Bool)

(assert (=> b!466480 m!448243))

(declare-fun m!448245 () Bool)

(assert (=> b!466480 m!448245))

(declare-fun m!448247 () Bool)

(assert (=> b!466480 m!448247))

(declare-fun m!448249 () Bool)

(assert (=> b!466475 m!448249))

(declare-fun m!448251 () Bool)

(assert (=> b!466476 m!448251))

(check-sat (not b!466478) (not start!41784) (not b!466475) (not b!466480) (not b_next!11419) (not b!466476) (not mapNonEmpty!20956) tp_is_empty!12847 b_and!19761)
(check-sat b_and!19761 (not b_next!11419))
