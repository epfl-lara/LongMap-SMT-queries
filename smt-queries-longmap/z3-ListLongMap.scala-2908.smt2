; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41576 () Bool)

(assert start!41576)

(declare-fun b_free!11257 () Bool)

(declare-fun b_next!11257 () Bool)

(assert (=> start!41576 (= b_free!11257 (not b_next!11257))))

(declare-fun tp!39768 () Bool)

(declare-fun b_and!19571 () Bool)

(assert (=> start!41576 (= tp!39768 b_and!19571)))

(declare-fun b!464274 () Bool)

(declare-fun e!271202 () Bool)

(declare-fun tp_is_empty!12685 () Bool)

(assert (=> b!464274 (= e!271202 tp_is_empty!12685)))

(declare-fun b!464275 () Bool)

(declare-fun e!271203 () Bool)

(assert (=> b!464275 (= e!271203 tp_is_empty!12685)))

(declare-fun b!464276 () Bool)

(declare-fun res!277604 () Bool)

(declare-fun e!271200 () Bool)

(assert (=> b!464276 (=> (not res!277604) (not e!271200))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29153 0))(
  ( (array!29154 (arr!14008 (Array (_ BitVec 32) (_ BitVec 64))) (size!14361 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29153)

(declare-datatypes ((V!18019 0))(
  ( (V!18020 (val!6387 Int)) )
))
(declare-datatypes ((ValueCell!5999 0))(
  ( (ValueCellFull!5999 (v!8668 V!18019)) (EmptyCell!5999) )
))
(declare-datatypes ((array!29155 0))(
  ( (array!29156 (arr!14009 (Array (_ BitVec 32) ValueCell!5999)) (size!14362 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29155)

(assert (=> b!464276 (= res!277604 (and (= (size!14362 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14361 _keys!1025) (size!14362 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464277 () Bool)

(assert (=> b!464277 (= e!271200 (not true))))

(declare-datatypes ((tuple2!8398 0))(
  ( (tuple2!8399 (_1!4210 (_ BitVec 64)) (_2!4210 V!18019)) )
))
(declare-datatypes ((List!8486 0))(
  ( (Nil!8483) (Cons!8482 (h!9338 tuple2!8398) (t!14423 List!8486)) )
))
(declare-datatypes ((ListLongMap!7301 0))(
  ( (ListLongMap!7302 (toList!3666 List!8486)) )
))
(declare-fun lt!209526 () ListLongMap!7301)

(declare-fun lt!209528 () ListLongMap!7301)

(assert (=> b!464277 (= lt!209526 lt!209528)))

(declare-fun minValueBefore!38 () V!18019)

(declare-datatypes ((Unit!13448 0))(
  ( (Unit!13449) )
))
(declare-fun lt!209527 () Unit!13448)

(declare-fun zeroValue!794 () V!18019)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18019)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!15 (array!29153 array!29155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 V!18019 V!18019 (_ BitVec 32) Int) Unit!13448)

(assert (=> b!464277 (= lt!209527 (lemmaNoChangeToArrayThenSameMapNoExtras!15 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1858 (array!29153 array!29155 (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 (_ BitVec 32) Int) ListLongMap!7301)

(assert (=> b!464277 (= lt!209528 (getCurrentListMapNoExtraKeys!1858 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464277 (= lt!209526 (getCurrentListMapNoExtraKeys!1858 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464278 () Bool)

(declare-fun e!271201 () Bool)

(declare-fun mapRes!20704 () Bool)

(assert (=> b!464278 (= e!271201 (and e!271203 mapRes!20704))))

(declare-fun condMapEmpty!20704 () Bool)

(declare-fun mapDefault!20704 () ValueCell!5999)

(assert (=> b!464278 (= condMapEmpty!20704 (= (arr!14009 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5999)) mapDefault!20704)))))

(declare-fun mapIsEmpty!20704 () Bool)

(assert (=> mapIsEmpty!20704 mapRes!20704))

(declare-fun res!277606 () Bool)

(assert (=> start!41576 (=> (not res!277606) (not e!271200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41576 (= res!277606 (validMask!0 mask!1365))))

(assert (=> start!41576 e!271200))

(assert (=> start!41576 tp_is_empty!12685))

(assert (=> start!41576 tp!39768))

(assert (=> start!41576 true))

(declare-fun array_inv!10198 (array!29153) Bool)

(assert (=> start!41576 (array_inv!10198 _keys!1025)))

(declare-fun array_inv!10199 (array!29155) Bool)

(assert (=> start!41576 (and (array_inv!10199 _values!833) e!271201)))

(declare-fun mapNonEmpty!20704 () Bool)

(declare-fun tp!39769 () Bool)

(assert (=> mapNonEmpty!20704 (= mapRes!20704 (and tp!39769 e!271202))))

(declare-fun mapValue!20704 () ValueCell!5999)

(declare-fun mapKey!20704 () (_ BitVec 32))

(declare-fun mapRest!20704 () (Array (_ BitVec 32) ValueCell!5999))

(assert (=> mapNonEmpty!20704 (= (arr!14009 _values!833) (store mapRest!20704 mapKey!20704 mapValue!20704))))

(declare-fun b!464279 () Bool)

(declare-fun res!277607 () Bool)

(assert (=> b!464279 (=> (not res!277607) (not e!271200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29153 (_ BitVec 32)) Bool)

(assert (=> b!464279 (= res!277607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464280 () Bool)

(declare-fun res!277605 () Bool)

(assert (=> b!464280 (=> (not res!277605) (not e!271200))))

(declare-datatypes ((List!8487 0))(
  ( (Nil!8484) (Cons!8483 (h!9339 (_ BitVec 64)) (t!14424 List!8487)) )
))
(declare-fun arrayNoDuplicates!0 (array!29153 (_ BitVec 32) List!8487) Bool)

(assert (=> b!464280 (= res!277605 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8484))))

(assert (= (and start!41576 res!277606) b!464276))

(assert (= (and b!464276 res!277604) b!464279))

(assert (= (and b!464279 res!277607) b!464280))

(assert (= (and b!464280 res!277605) b!464277))

(assert (= (and b!464278 condMapEmpty!20704) mapIsEmpty!20704))

(assert (= (and b!464278 (not condMapEmpty!20704)) mapNonEmpty!20704))

(get-info :version)

(assert (= (and mapNonEmpty!20704 ((_ is ValueCellFull!5999) mapValue!20704)) b!464274))

(assert (= (and b!464278 ((_ is ValueCellFull!5999) mapDefault!20704)) b!464275))

(assert (= start!41576 b!464278))

(declare-fun m!446181 () Bool)

(assert (=> mapNonEmpty!20704 m!446181))

(declare-fun m!446183 () Bool)

(assert (=> b!464279 m!446183))

(declare-fun m!446185 () Bool)

(assert (=> b!464277 m!446185))

(declare-fun m!446187 () Bool)

(assert (=> b!464277 m!446187))

(declare-fun m!446189 () Bool)

(assert (=> b!464277 m!446189))

(declare-fun m!446191 () Bool)

(assert (=> start!41576 m!446191))

(declare-fun m!446193 () Bool)

(assert (=> start!41576 m!446193))

(declare-fun m!446195 () Bool)

(assert (=> start!41576 m!446195))

(declare-fun m!446197 () Bool)

(assert (=> b!464280 m!446197))

(check-sat (not mapNonEmpty!20704) (not b!464280) (not b!464277) (not b_next!11257) b_and!19571 (not start!41576) (not b!464279) tp_is_empty!12685)
(check-sat b_and!19571 (not b_next!11257))
