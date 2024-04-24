; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41772 () Bool)

(assert start!41772)

(declare-fun b_free!11407 () Bool)

(declare-fun b_next!11407 () Bool)

(assert (=> start!41772 (= b_free!11407 (not b_next!11407))))

(declare-fun tp!40228 () Bool)

(declare-fun b_and!19785 () Bool)

(assert (=> start!41772 (= tp!40228 b_and!19785)))

(declare-fun b!466541 () Bool)

(declare-fun e!272808 () Bool)

(assert (=> b!466541 (= e!272808 true)))

(declare-datatypes ((V!18219 0))(
  ( (V!18220 (val!6462 Int)) )
))
(declare-datatypes ((tuple2!8412 0))(
  ( (tuple2!8413 (_1!4217 (_ BitVec 64)) (_2!4217 V!18219)) )
))
(declare-datatypes ((List!8492 0))(
  ( (Nil!8489) (Cons!8488 (h!9344 tuple2!8412) (t!14436 List!8492)) )
))
(declare-datatypes ((ListLongMap!7327 0))(
  ( (ListLongMap!7328 (toList!3679 List!8492)) )
))
(declare-fun lt!210907 () ListLongMap!7327)

(declare-fun zeroValue!794 () V!18219)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29446 0))(
  ( (array!29447 (arr!14151 (Array (_ BitVec 32) (_ BitVec 64))) (size!14503 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29446)

(declare-datatypes ((ValueCell!6074 0))(
  ( (ValueCellFull!6074 (v!8751 V!18219)) (EmptyCell!6074) )
))
(declare-datatypes ((array!29448 0))(
  ( (array!29449 (arr!14152 (Array (_ BitVec 32) ValueCell!6074)) (size!14504 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29448)

(declare-fun minValueAfter!38 () V!18219)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2127 (array!29446 array!29448 (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 (_ BitVec 32) Int) ListLongMap!7327)

(assert (=> b!466541 (= lt!210907 (getCurrentListMap!2127 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18219)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210908 () ListLongMap!7327)

(declare-fun +!1676 (ListLongMap!7327 tuple2!8412) ListLongMap!7327)

(assert (=> b!466541 (= lt!210908 (+!1676 (getCurrentListMap!2127 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8413 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466542 () Bool)

(declare-fun res!278900 () Bool)

(declare-fun e!272807 () Bool)

(assert (=> b!466542 (=> (not res!278900) (not e!272807))))

(declare-datatypes ((List!8493 0))(
  ( (Nil!8490) (Cons!8489 (h!9345 (_ BitVec 64)) (t!14437 List!8493)) )
))
(declare-fun arrayNoDuplicates!0 (array!29446 (_ BitVec 32) List!8493) Bool)

(assert (=> b!466542 (= res!278900 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8490))))

(declare-fun res!278899 () Bool)

(assert (=> start!41772 (=> (not res!278899) (not e!272807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41772 (= res!278899 (validMask!0 mask!1365))))

(assert (=> start!41772 e!272807))

(declare-fun tp_is_empty!12835 () Bool)

(assert (=> start!41772 tp_is_empty!12835))

(assert (=> start!41772 tp!40228))

(assert (=> start!41772 true))

(declare-fun array_inv!10300 (array!29446) Bool)

(assert (=> start!41772 (array_inv!10300 _keys!1025)))

(declare-fun e!272811 () Bool)

(declare-fun array_inv!10301 (array!29448) Bool)

(assert (=> start!41772 (and (array_inv!10301 _values!833) e!272811)))

(declare-fun mapNonEmpty!20938 () Bool)

(declare-fun mapRes!20938 () Bool)

(declare-fun tp!40227 () Bool)

(declare-fun e!272812 () Bool)

(assert (=> mapNonEmpty!20938 (= mapRes!20938 (and tp!40227 e!272812))))

(declare-fun mapKey!20938 () (_ BitVec 32))

(declare-fun mapRest!20938 () (Array (_ BitVec 32) ValueCell!6074))

(declare-fun mapValue!20938 () ValueCell!6074)

(assert (=> mapNonEmpty!20938 (= (arr!14152 _values!833) (store mapRest!20938 mapKey!20938 mapValue!20938))))

(declare-fun mapIsEmpty!20938 () Bool)

(assert (=> mapIsEmpty!20938 mapRes!20938))

(declare-fun b!466543 () Bool)

(declare-fun res!278898 () Bool)

(assert (=> b!466543 (=> (not res!278898) (not e!272807))))

(assert (=> b!466543 (= res!278898 (and (= (size!14504 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14503 _keys!1025) (size!14504 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466544 () Bool)

(assert (=> b!466544 (= e!272807 (not e!272808))))

(declare-fun res!278902 () Bool)

(assert (=> b!466544 (=> res!278902 e!272808)))

(assert (=> b!466544 (= res!278902 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210905 () ListLongMap!7327)

(declare-fun lt!210906 () ListLongMap!7327)

(assert (=> b!466544 (= lt!210905 lt!210906)))

(declare-datatypes ((Unit!13570 0))(
  ( (Unit!13571) )
))
(declare-fun lt!210909 () Unit!13570)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!62 (array!29446 array!29448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 V!18219 V!18219 (_ BitVec 32) Int) Unit!13570)

(assert (=> b!466544 (= lt!210909 (lemmaNoChangeToArrayThenSameMapNoExtras!62 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1902 (array!29446 array!29448 (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 (_ BitVec 32) Int) ListLongMap!7327)

(assert (=> b!466544 (= lt!210906 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466544 (= lt!210905 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466545 () Bool)

(declare-fun e!272810 () Bool)

(assert (=> b!466545 (= e!272811 (and e!272810 mapRes!20938))))

(declare-fun condMapEmpty!20938 () Bool)

(declare-fun mapDefault!20938 () ValueCell!6074)

(assert (=> b!466545 (= condMapEmpty!20938 (= (arr!14152 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6074)) mapDefault!20938)))))

(declare-fun b!466546 () Bool)

(declare-fun res!278901 () Bool)

(assert (=> b!466546 (=> (not res!278901) (not e!272807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29446 (_ BitVec 32)) Bool)

(assert (=> b!466546 (= res!278901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466547 () Bool)

(assert (=> b!466547 (= e!272812 tp_is_empty!12835)))

(declare-fun b!466548 () Bool)

(assert (=> b!466548 (= e!272810 tp_is_empty!12835)))

(assert (= (and start!41772 res!278899) b!466543))

(assert (= (and b!466543 res!278898) b!466546))

(assert (= (and b!466546 res!278901) b!466542))

(assert (= (and b!466542 res!278900) b!466544))

(assert (= (and b!466544 (not res!278902)) b!466541))

(assert (= (and b!466545 condMapEmpty!20938) mapIsEmpty!20938))

(assert (= (and b!466545 (not condMapEmpty!20938)) mapNonEmpty!20938))

(get-info :version)

(assert (= (and mapNonEmpty!20938 ((_ is ValueCellFull!6074) mapValue!20938)) b!466547))

(assert (= (and b!466545 ((_ is ValueCellFull!6074) mapDefault!20938)) b!466548))

(assert (= start!41772 b!466545))

(declare-fun m!449001 () Bool)

(assert (=> start!41772 m!449001))

(declare-fun m!449003 () Bool)

(assert (=> start!41772 m!449003))

(declare-fun m!449005 () Bool)

(assert (=> start!41772 m!449005))

(declare-fun m!449007 () Bool)

(assert (=> b!466542 m!449007))

(declare-fun m!449009 () Bool)

(assert (=> b!466541 m!449009))

(declare-fun m!449011 () Bool)

(assert (=> b!466541 m!449011))

(assert (=> b!466541 m!449011))

(declare-fun m!449013 () Bool)

(assert (=> b!466541 m!449013))

(declare-fun m!449015 () Bool)

(assert (=> b!466544 m!449015))

(declare-fun m!449017 () Bool)

(assert (=> b!466544 m!449017))

(declare-fun m!449019 () Bool)

(assert (=> b!466544 m!449019))

(declare-fun m!449021 () Bool)

(assert (=> mapNonEmpty!20938 m!449021))

(declare-fun m!449023 () Bool)

(assert (=> b!466546 m!449023))

(check-sat (not b!466544) (not mapNonEmpty!20938) (not b!466541) (not b_next!11407) (not b!466546) (not start!41772) (not b!466542) b_and!19785 tp_is_empty!12835)
(check-sat b_and!19785 (not b_next!11407))
