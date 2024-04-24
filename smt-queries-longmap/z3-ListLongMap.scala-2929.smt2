; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41748 () Bool)

(assert start!41748)

(declare-fun b_free!11383 () Bool)

(declare-fun b_next!11383 () Bool)

(assert (=> start!41748 (= b_free!11383 (not b_next!11383))))

(declare-fun tp!40156 () Bool)

(declare-fun b_and!19761 () Bool)

(assert (=> start!41748 (= tp!40156 b_and!19761)))

(declare-fun b!466253 () Bool)

(declare-fun res!278718 () Bool)

(declare-fun e!272592 () Bool)

(assert (=> b!466253 (=> (not res!278718) (not e!272592))))

(declare-datatypes ((array!29404 0))(
  ( (array!29405 (arr!14130 (Array (_ BitVec 32) (_ BitVec 64))) (size!14482 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29404)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29404 (_ BitVec 32)) Bool)

(assert (=> b!466253 (= res!278718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466254 () Bool)

(declare-fun res!278719 () Bool)

(assert (=> b!466254 (=> (not res!278719) (not e!272592))))

(declare-datatypes ((List!8479 0))(
  ( (Nil!8476) (Cons!8475 (h!9331 (_ BitVec 64)) (t!14423 List!8479)) )
))
(declare-fun arrayNoDuplicates!0 (array!29404 (_ BitVec 32) List!8479) Bool)

(assert (=> b!466254 (= res!278719 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8476))))

(declare-fun mapIsEmpty!20902 () Bool)

(declare-fun mapRes!20902 () Bool)

(assert (=> mapIsEmpty!20902 mapRes!20902))

(declare-fun b!466255 () Bool)

(declare-fun res!278720 () Bool)

(assert (=> b!466255 (=> (not res!278720) (not e!272592))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18187 0))(
  ( (V!18188 (val!6450 Int)) )
))
(declare-datatypes ((ValueCell!6062 0))(
  ( (ValueCellFull!6062 (v!8739 V!18187)) (EmptyCell!6062) )
))
(declare-datatypes ((array!29406 0))(
  ( (array!29407 (arr!14131 (Array (_ BitVec 32) ValueCell!6062)) (size!14483 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29406)

(assert (=> b!466255 (= res!278720 (and (= (size!14483 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14482 _keys!1025) (size!14483 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466257 () Bool)

(declare-fun e!272596 () Bool)

(assert (=> b!466257 (= e!272592 (not e!272596))))

(declare-fun res!278722 () Bool)

(assert (=> b!466257 (=> res!278722 e!272596)))

(assert (=> b!466257 (= res!278722 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8396 0))(
  ( (tuple2!8397 (_1!4209 (_ BitVec 64)) (_2!4209 V!18187)) )
))
(declare-datatypes ((List!8480 0))(
  ( (Nil!8477) (Cons!8476 (h!9332 tuple2!8396) (t!14424 List!8480)) )
))
(declare-datatypes ((ListLongMap!7311 0))(
  ( (ListLongMap!7312 (toList!3671 List!8480)) )
))
(declare-fun lt!210727 () ListLongMap!7311)

(declare-fun lt!210725 () ListLongMap!7311)

(assert (=> b!466257 (= lt!210727 lt!210725)))

(declare-fun minValueBefore!38 () V!18187)

(declare-fun zeroValue!794 () V!18187)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13556 0))(
  ( (Unit!13557) )
))
(declare-fun lt!210729 () Unit!13556)

(declare-fun minValueAfter!38 () V!18187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!55 (array!29404 array!29406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 V!18187 V!18187 (_ BitVec 32) Int) Unit!13556)

(assert (=> b!466257 (= lt!210729 (lemmaNoChangeToArrayThenSameMapNoExtras!55 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1895 (array!29404 array!29406 (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 (_ BitVec 32) Int) ListLongMap!7311)

(assert (=> b!466257 (= lt!210725 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466257 (= lt!210727 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466258 () Bool)

(assert (=> b!466258 (= e!272596 true)))

(declare-fun lt!210728 () ListLongMap!7311)

(declare-fun getCurrentListMap!2120 (array!29404 array!29406 (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 (_ BitVec 32) Int) ListLongMap!7311)

(assert (=> b!466258 (= lt!210728 (getCurrentListMap!2120 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210726 () ListLongMap!7311)

(declare-fun +!1669 (ListLongMap!7311 tuple2!8396) ListLongMap!7311)

(assert (=> b!466258 (= lt!210726 (+!1669 (getCurrentListMap!2120 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8397 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466259 () Bool)

(declare-fun e!272595 () Bool)

(declare-fun tp_is_empty!12811 () Bool)

(assert (=> b!466259 (= e!272595 tp_is_empty!12811)))

(declare-fun res!278721 () Bool)

(assert (=> start!41748 (=> (not res!278721) (not e!272592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41748 (= res!278721 (validMask!0 mask!1365))))

(assert (=> start!41748 e!272592))

(assert (=> start!41748 tp_is_empty!12811))

(assert (=> start!41748 tp!40156))

(assert (=> start!41748 true))

(declare-fun array_inv!10288 (array!29404) Bool)

(assert (=> start!41748 (array_inv!10288 _keys!1025)))

(declare-fun e!272591 () Bool)

(declare-fun array_inv!10289 (array!29406) Bool)

(assert (=> start!41748 (and (array_inv!10289 _values!833) e!272591)))

(declare-fun b!466256 () Bool)

(declare-fun e!272593 () Bool)

(assert (=> b!466256 (= e!272593 tp_is_empty!12811)))

(declare-fun b!466260 () Bool)

(assert (=> b!466260 (= e!272591 (and e!272593 mapRes!20902))))

(declare-fun condMapEmpty!20902 () Bool)

(declare-fun mapDefault!20902 () ValueCell!6062)

(assert (=> b!466260 (= condMapEmpty!20902 (= (arr!14131 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6062)) mapDefault!20902)))))

(declare-fun mapNonEmpty!20902 () Bool)

(declare-fun tp!40155 () Bool)

(assert (=> mapNonEmpty!20902 (= mapRes!20902 (and tp!40155 e!272595))))

(declare-fun mapRest!20902 () (Array (_ BitVec 32) ValueCell!6062))

(declare-fun mapValue!20902 () ValueCell!6062)

(declare-fun mapKey!20902 () (_ BitVec 32))

(assert (=> mapNonEmpty!20902 (= (arr!14131 _values!833) (store mapRest!20902 mapKey!20902 mapValue!20902))))

(assert (= (and start!41748 res!278721) b!466255))

(assert (= (and b!466255 res!278720) b!466253))

(assert (= (and b!466253 res!278718) b!466254))

(assert (= (and b!466254 res!278719) b!466257))

(assert (= (and b!466257 (not res!278722)) b!466258))

(assert (= (and b!466260 condMapEmpty!20902) mapIsEmpty!20902))

(assert (= (and b!466260 (not condMapEmpty!20902)) mapNonEmpty!20902))

(get-info :version)

(assert (= (and mapNonEmpty!20902 ((_ is ValueCellFull!6062) mapValue!20902)) b!466259))

(assert (= (and b!466260 ((_ is ValueCellFull!6062) mapDefault!20902)) b!466256))

(assert (= start!41748 b!466260))

(declare-fun m!448713 () Bool)

(assert (=> b!466254 m!448713))

(declare-fun m!448715 () Bool)

(assert (=> start!41748 m!448715))

(declare-fun m!448717 () Bool)

(assert (=> start!41748 m!448717))

(declare-fun m!448719 () Bool)

(assert (=> start!41748 m!448719))

(declare-fun m!448721 () Bool)

(assert (=> b!466258 m!448721))

(declare-fun m!448723 () Bool)

(assert (=> b!466258 m!448723))

(assert (=> b!466258 m!448723))

(declare-fun m!448725 () Bool)

(assert (=> b!466258 m!448725))

(declare-fun m!448727 () Bool)

(assert (=> b!466257 m!448727))

(declare-fun m!448729 () Bool)

(assert (=> b!466257 m!448729))

(declare-fun m!448731 () Bool)

(assert (=> b!466257 m!448731))

(declare-fun m!448733 () Bool)

(assert (=> b!466253 m!448733))

(declare-fun m!448735 () Bool)

(assert (=> mapNonEmpty!20902 m!448735))

(check-sat (not start!41748) (not b!466253) (not b_next!11383) b_and!19761 (not b!466254) tp_is_empty!12811 (not b!466257) (not mapNonEmpty!20902) (not b!466258))
(check-sat b_and!19761 (not b_next!11383))
