; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41766 () Bool)

(assert start!41766)

(declare-fun b_free!11401 () Bool)

(declare-fun b_next!11401 () Bool)

(assert (=> start!41766 (= b_free!11401 (not b_next!11401))))

(declare-fun tp!40209 () Bool)

(declare-fun b_and!19779 () Bool)

(assert (=> start!41766 (= tp!40209 b_and!19779)))

(declare-fun b!466469 () Bool)

(declare-fun e!272755 () Bool)

(declare-fun e!272757 () Bool)

(declare-fun mapRes!20929 () Bool)

(assert (=> b!466469 (= e!272755 (and e!272757 mapRes!20929))))

(declare-fun condMapEmpty!20929 () Bool)

(declare-datatypes ((V!18211 0))(
  ( (V!18212 (val!6459 Int)) )
))
(declare-datatypes ((ValueCell!6071 0))(
  ( (ValueCellFull!6071 (v!8748 V!18211)) (EmptyCell!6071) )
))
(declare-datatypes ((array!29434 0))(
  ( (array!29435 (arr!14145 (Array (_ BitVec 32) ValueCell!6071)) (size!14497 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29434)

(declare-fun mapDefault!20929 () ValueCell!6071)

(assert (=> b!466469 (= condMapEmpty!20929 (= (arr!14145 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6071)) mapDefault!20929)))))

(declare-fun b!466470 () Bool)

(declare-fun e!272754 () Bool)

(declare-fun tp_is_empty!12829 () Bool)

(assert (=> b!466470 (= e!272754 tp_is_empty!12829)))

(declare-fun b!466471 () Bool)

(declare-fun res!278856 () Bool)

(declare-fun e!272753 () Bool)

(assert (=> b!466471 (=> (not res!278856) (not e!272753))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29436 0))(
  ( (array!29437 (arr!14146 (Array (_ BitVec 32) (_ BitVec 64))) (size!14498 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29436)

(assert (=> b!466471 (= res!278856 (and (= (size!14497 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14498 _keys!1025) (size!14497 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20929 () Bool)

(assert (=> mapIsEmpty!20929 mapRes!20929))

(declare-fun res!278855 () Bool)

(assert (=> start!41766 (=> (not res!278855) (not e!272753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41766 (= res!278855 (validMask!0 mask!1365))))

(assert (=> start!41766 e!272753))

(assert (=> start!41766 tp_is_empty!12829))

(assert (=> start!41766 tp!40209))

(assert (=> start!41766 true))

(declare-fun array_inv!10298 (array!29436) Bool)

(assert (=> start!41766 (array_inv!10298 _keys!1025)))

(declare-fun array_inv!10299 (array!29434) Bool)

(assert (=> start!41766 (and (array_inv!10299 _values!833) e!272755)))

(declare-fun b!466472 () Bool)

(declare-fun res!278853 () Bool)

(assert (=> b!466472 (=> (not res!278853) (not e!272753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29436 (_ BitVec 32)) Bool)

(assert (=> b!466472 (= res!278853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466473 () Bool)

(declare-fun e!272756 () Bool)

(assert (=> b!466473 (= e!272753 (not e!272756))))

(declare-fun res!278857 () Bool)

(assert (=> b!466473 (=> res!278857 e!272756)))

(assert (=> b!466473 (= res!278857 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8406 0))(
  ( (tuple2!8407 (_1!4214 (_ BitVec 64)) (_2!4214 V!18211)) )
))
(declare-datatypes ((List!8488 0))(
  ( (Nil!8485) (Cons!8484 (h!9340 tuple2!8406) (t!14432 List!8488)) )
))
(declare-datatypes ((ListLongMap!7321 0))(
  ( (ListLongMap!7322 (toList!3676 List!8488)) )
))
(declare-fun lt!210861 () ListLongMap!7321)

(declare-fun lt!210864 () ListLongMap!7321)

(assert (=> b!466473 (= lt!210861 lt!210864)))

(declare-fun minValueBefore!38 () V!18211)

(declare-fun zeroValue!794 () V!18211)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13566 0))(
  ( (Unit!13567) )
))
(declare-fun lt!210860 () Unit!13566)

(declare-fun minValueAfter!38 () V!18211)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!60 (array!29436 array!29434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 V!18211 V!18211 (_ BitVec 32) Int) Unit!13566)

(assert (=> b!466473 (= lt!210860 (lemmaNoChangeToArrayThenSameMapNoExtras!60 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1900 (array!29436 array!29434 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7321)

(assert (=> b!466473 (= lt!210864 (getCurrentListMapNoExtraKeys!1900 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466473 (= lt!210861 (getCurrentListMapNoExtraKeys!1900 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466474 () Bool)

(assert (=> b!466474 (= e!272757 tp_is_empty!12829)))

(declare-fun b!466475 () Bool)

(declare-fun res!278854 () Bool)

(assert (=> b!466475 (=> (not res!278854) (not e!272753))))

(declare-datatypes ((List!8489 0))(
  ( (Nil!8486) (Cons!8485 (h!9341 (_ BitVec 64)) (t!14433 List!8489)) )
))
(declare-fun arrayNoDuplicates!0 (array!29436 (_ BitVec 32) List!8489) Bool)

(assert (=> b!466475 (= res!278854 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8486))))

(declare-fun mapNonEmpty!20929 () Bool)

(declare-fun tp!40210 () Bool)

(assert (=> mapNonEmpty!20929 (= mapRes!20929 (and tp!40210 e!272754))))

(declare-fun mapKey!20929 () (_ BitVec 32))

(declare-fun mapValue!20929 () ValueCell!6071)

(declare-fun mapRest!20929 () (Array (_ BitVec 32) ValueCell!6071))

(assert (=> mapNonEmpty!20929 (= (arr!14145 _values!833) (store mapRest!20929 mapKey!20929 mapValue!20929))))

(declare-fun b!466476 () Bool)

(assert (=> b!466476 (= e!272756 true)))

(declare-fun lt!210863 () ListLongMap!7321)

(declare-fun getCurrentListMap!2125 (array!29436 array!29434 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7321)

(assert (=> b!466476 (= lt!210863 (getCurrentListMap!2125 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210862 () ListLongMap!7321)

(declare-fun +!1674 (ListLongMap!7321 tuple2!8406) ListLongMap!7321)

(assert (=> b!466476 (= lt!210862 (+!1674 (getCurrentListMap!2125 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8407 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and start!41766 res!278855) b!466471))

(assert (= (and b!466471 res!278856) b!466472))

(assert (= (and b!466472 res!278853) b!466475))

(assert (= (and b!466475 res!278854) b!466473))

(assert (= (and b!466473 (not res!278857)) b!466476))

(assert (= (and b!466469 condMapEmpty!20929) mapIsEmpty!20929))

(assert (= (and b!466469 (not condMapEmpty!20929)) mapNonEmpty!20929))

(get-info :version)

(assert (= (and mapNonEmpty!20929 ((_ is ValueCellFull!6071) mapValue!20929)) b!466470))

(assert (= (and b!466469 ((_ is ValueCellFull!6071) mapDefault!20929)) b!466474))

(assert (= start!41766 b!466469))

(declare-fun m!448929 () Bool)

(assert (=> b!466472 m!448929))

(declare-fun m!448931 () Bool)

(assert (=> start!41766 m!448931))

(declare-fun m!448933 () Bool)

(assert (=> start!41766 m!448933))

(declare-fun m!448935 () Bool)

(assert (=> start!41766 m!448935))

(declare-fun m!448937 () Bool)

(assert (=> b!466476 m!448937))

(declare-fun m!448939 () Bool)

(assert (=> b!466476 m!448939))

(assert (=> b!466476 m!448939))

(declare-fun m!448941 () Bool)

(assert (=> b!466476 m!448941))

(declare-fun m!448943 () Bool)

(assert (=> b!466473 m!448943))

(declare-fun m!448945 () Bool)

(assert (=> b!466473 m!448945))

(declare-fun m!448947 () Bool)

(assert (=> b!466473 m!448947))

(declare-fun m!448949 () Bool)

(assert (=> mapNonEmpty!20929 m!448949))

(declare-fun m!448951 () Bool)

(assert (=> b!466475 m!448951))

(check-sat (not b!466472) (not mapNonEmpty!20929) (not start!41766) b_and!19779 (not b!466475) (not b!466476) tp_is_empty!12829 (not b!466473) (not b_next!11401))
(check-sat b_and!19779 (not b_next!11401))
