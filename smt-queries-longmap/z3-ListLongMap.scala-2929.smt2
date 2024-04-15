; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41748 () Bool)

(assert start!41748)

(declare-fun b_free!11383 () Bool)

(declare-fun b_next!11383 () Bool)

(assert (=> start!41748 (= b_free!11383 (not b_next!11383))))

(declare-fun tp!40155 () Bool)

(declare-fun b_and!19725 () Bool)

(assert (=> start!41748 (= tp!40155 b_and!19725)))

(declare-fun mapNonEmpty!20902 () Bool)

(declare-fun mapRes!20902 () Bool)

(declare-fun tp!40156 () Bool)

(declare-fun e!272459 () Bool)

(assert (=> mapNonEmpty!20902 (= mapRes!20902 (and tp!40156 e!272459))))

(declare-datatypes ((V!18187 0))(
  ( (V!18188 (val!6450 Int)) )
))
(declare-datatypes ((ValueCell!6062 0))(
  ( (ValueCellFull!6062 (v!8732 V!18187)) (EmptyCell!6062) )
))
(declare-datatypes ((array!29401 0))(
  ( (array!29402 (arr!14129 (Array (_ BitVec 32) ValueCell!6062)) (size!14482 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29401)

(declare-fun mapRest!20902 () (Array (_ BitVec 32) ValueCell!6062))

(declare-fun mapValue!20902 () ValueCell!6062)

(declare-fun mapKey!20902 () (_ BitVec 32))

(assert (=> mapNonEmpty!20902 (= (arr!14129 _values!833) (store mapRest!20902 mapKey!20902 mapValue!20902))))

(declare-fun b!466044 () Bool)

(declare-fun e!272461 () Bool)

(declare-fun tp_is_empty!12811 () Bool)

(assert (=> b!466044 (= e!272461 tp_is_empty!12811)))

(declare-fun b!466045 () Bool)

(declare-fun e!272460 () Bool)

(declare-fun e!272458 () Bool)

(assert (=> b!466045 (= e!272460 (not e!272458))))

(declare-fun res!278600 () Bool)

(assert (=> b!466045 (=> res!278600 e!272458)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466045 (= res!278600 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8500 0))(
  ( (tuple2!8501 (_1!4261 (_ BitVec 64)) (_2!4261 V!18187)) )
))
(declare-datatypes ((List!8584 0))(
  ( (Nil!8581) (Cons!8580 (h!9436 tuple2!8500) (t!14527 List!8584)) )
))
(declare-datatypes ((ListLongMap!7403 0))(
  ( (ListLongMap!7404 (toList!3717 List!8584)) )
))
(declare-fun lt!210482 () ListLongMap!7403)

(declare-fun lt!210481 () ListLongMap!7403)

(assert (=> b!466045 (= lt!210482 lt!210481)))

(declare-fun minValueBefore!38 () V!18187)

(declare-fun zeroValue!794 () V!18187)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13540 0))(
  ( (Unit!13541) )
))
(declare-fun lt!210479 () Unit!13540)

(declare-datatypes ((array!29403 0))(
  ( (array!29404 (arr!14130 (Array (_ BitVec 32) (_ BitVec 64))) (size!14483 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29403)

(declare-fun minValueAfter!38 () V!18187)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!60 (array!29403 array!29401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 V!18187 V!18187 (_ BitVec 32) Int) Unit!13540)

(assert (=> b!466045 (= lt!210479 (lemmaNoChangeToArrayThenSameMapNoExtras!60 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1903 (array!29403 array!29401 (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 (_ BitVec 32) Int) ListLongMap!7403)

(assert (=> b!466045 (= lt!210481 (getCurrentListMapNoExtraKeys!1903 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466045 (= lt!210482 (getCurrentListMapNoExtraKeys!1903 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466046 () Bool)

(declare-fun res!278598 () Bool)

(assert (=> b!466046 (=> (not res!278598) (not e!272460))))

(declare-datatypes ((List!8585 0))(
  ( (Nil!8582) (Cons!8581 (h!9437 (_ BitVec 64)) (t!14528 List!8585)) )
))
(declare-fun arrayNoDuplicates!0 (array!29403 (_ BitVec 32) List!8585) Bool)

(assert (=> b!466046 (= res!278598 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8582))))

(declare-fun mapIsEmpty!20902 () Bool)

(assert (=> mapIsEmpty!20902 mapRes!20902))

(declare-fun b!466047 () Bool)

(declare-fun res!278597 () Bool)

(assert (=> b!466047 (=> (not res!278597) (not e!272460))))

(assert (=> b!466047 (= res!278597 (and (= (size!14482 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14483 _keys!1025) (size!14482 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466048 () Bool)

(assert (=> b!466048 (= e!272459 tp_is_empty!12811)))

(declare-fun res!278599 () Bool)

(assert (=> start!41748 (=> (not res!278599) (not e!272460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41748 (= res!278599 (validMask!0 mask!1365))))

(assert (=> start!41748 e!272460))

(assert (=> start!41748 tp_is_empty!12811))

(assert (=> start!41748 tp!40155))

(assert (=> start!41748 true))

(declare-fun array_inv!10288 (array!29403) Bool)

(assert (=> start!41748 (array_inv!10288 _keys!1025)))

(declare-fun e!272456 () Bool)

(declare-fun array_inv!10289 (array!29401) Bool)

(assert (=> start!41748 (and (array_inv!10289 _values!833) e!272456)))

(declare-fun b!466043 () Bool)

(assert (=> b!466043 (= e!272458 true)))

(declare-fun lt!210483 () ListLongMap!7403)

(declare-fun getCurrentListMap!2109 (array!29403 array!29401 (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 (_ BitVec 32) Int) ListLongMap!7403)

(assert (=> b!466043 (= lt!210483 (getCurrentListMap!2109 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210480 () ListLongMap!7403)

(declare-fun +!1690 (ListLongMap!7403 tuple2!8500) ListLongMap!7403)

(assert (=> b!466043 (= lt!210480 (+!1690 (getCurrentListMap!2109 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466049 () Bool)

(assert (=> b!466049 (= e!272456 (and e!272461 mapRes!20902))))

(declare-fun condMapEmpty!20902 () Bool)

(declare-fun mapDefault!20902 () ValueCell!6062)

(assert (=> b!466049 (= condMapEmpty!20902 (= (arr!14129 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6062)) mapDefault!20902)))))

(declare-fun b!466050 () Bool)

(declare-fun res!278596 () Bool)

(assert (=> b!466050 (=> (not res!278596) (not e!272460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29403 (_ BitVec 32)) Bool)

(assert (=> b!466050 (= res!278596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41748 res!278599) b!466047))

(assert (= (and b!466047 res!278597) b!466050))

(assert (= (and b!466050 res!278596) b!466046))

(assert (= (and b!466046 res!278598) b!466045))

(assert (= (and b!466045 (not res!278600)) b!466043))

(assert (= (and b!466049 condMapEmpty!20902) mapIsEmpty!20902))

(assert (= (and b!466049 (not condMapEmpty!20902)) mapNonEmpty!20902))

(get-info :version)

(assert (= (and mapNonEmpty!20902 ((_ is ValueCellFull!6062) mapValue!20902)) b!466048))

(assert (= (and b!466049 ((_ is ValueCellFull!6062) mapDefault!20902)) b!466044))

(assert (= start!41748 b!466049))

(declare-fun m!447797 () Bool)

(assert (=> b!466050 m!447797))

(declare-fun m!447799 () Bool)

(assert (=> b!466046 m!447799))

(declare-fun m!447801 () Bool)

(assert (=> b!466045 m!447801))

(declare-fun m!447803 () Bool)

(assert (=> b!466045 m!447803))

(declare-fun m!447805 () Bool)

(assert (=> b!466045 m!447805))

(declare-fun m!447807 () Bool)

(assert (=> start!41748 m!447807))

(declare-fun m!447809 () Bool)

(assert (=> start!41748 m!447809))

(declare-fun m!447811 () Bool)

(assert (=> start!41748 m!447811))

(declare-fun m!447813 () Bool)

(assert (=> mapNonEmpty!20902 m!447813))

(declare-fun m!447815 () Bool)

(assert (=> b!466043 m!447815))

(declare-fun m!447817 () Bool)

(assert (=> b!466043 m!447817))

(assert (=> b!466043 m!447817))

(declare-fun m!447819 () Bool)

(assert (=> b!466043 m!447819))

(check-sat (not b!466043) (not b!466046) (not mapNonEmpty!20902) tp_is_empty!12811 (not start!41748) (not b!466050) (not b_next!11383) b_and!19725 (not b!466045))
(check-sat b_and!19725 (not b_next!11383))
