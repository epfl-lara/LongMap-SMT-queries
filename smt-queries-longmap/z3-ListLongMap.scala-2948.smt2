; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41894 () Bool)

(assert start!41894)

(declare-fun b_free!11497 () Bool)

(declare-fun b_next!11497 () Bool)

(assert (=> start!41894 (= b_free!11497 (not b_next!11497))))

(declare-fun tp!40504 () Bool)

(declare-fun b_and!19859 () Bool)

(assert (=> start!41894 (= tp!40504 b_and!19859)))

(declare-fun b!467599 () Bool)

(declare-fun e!273571 () Bool)

(assert (=> b!467599 (= e!273571 true)))

(declare-datatypes ((V!18339 0))(
  ( (V!18340 (val!6507 Int)) )
))
(declare-fun minValueBefore!38 () V!18339)

(declare-fun zeroValue!794 () V!18339)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8582 0))(
  ( (tuple2!8583 (_1!4302 (_ BitVec 64)) (_2!4302 V!18339)) )
))
(declare-datatypes ((List!8659 0))(
  ( (Nil!8656) (Cons!8655 (h!9511 tuple2!8582) (t!14606 List!8659)) )
))
(declare-datatypes ((ListLongMap!7485 0))(
  ( (ListLongMap!7486 (toList!3758 List!8659)) )
))
(declare-fun lt!211314 () ListLongMap!7485)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29615 0))(
  ( (array!29616 (arr!14234 (Array (_ BitVec 32) (_ BitVec 64))) (size!14587 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29615)

(declare-datatypes ((ValueCell!6119 0))(
  ( (ValueCellFull!6119 (v!8790 V!18339)) (EmptyCell!6119) )
))
(declare-datatypes ((array!29617 0))(
  ( (array!29618 (arr!14235 (Array (_ BitVec 32) ValueCell!6119)) (size!14588 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29617)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2130 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 (_ BitVec 32) Int) ListLongMap!7485)

(assert (=> b!467599 (= lt!211314 (getCurrentListMap!2130 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467600 () Bool)

(declare-fun e!273570 () Bool)

(assert (=> b!467600 (= e!273570 (not e!273571))))

(declare-fun res!279483 () Bool)

(assert (=> b!467600 (=> res!279483 e!273571)))

(assert (=> b!467600 (= res!279483 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211316 () ListLongMap!7485)

(declare-fun lt!211315 () ListLongMap!7485)

(assert (=> b!467600 (= lt!211316 lt!211315)))

(declare-datatypes ((Unit!13620 0))(
  ( (Unit!13621) )
))
(declare-fun lt!211317 () Unit!13620)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18339)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!99 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 V!18339 V!18339 (_ BitVec 32) Int) Unit!13620)

(assert (=> b!467600 (= lt!211317 (lemmaNoChangeToArrayThenSameMapNoExtras!99 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1942 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 (_ BitVec 32) Int) ListLongMap!7485)

(assert (=> b!467600 (= lt!211315 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467600 (= lt!211316 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21079 () Bool)

(declare-fun mapRes!21079 () Bool)

(assert (=> mapIsEmpty!21079 mapRes!21079))

(declare-fun b!467601 () Bool)

(declare-fun e!273566 () Bool)

(declare-fun tp_is_empty!12925 () Bool)

(assert (=> b!467601 (= e!273566 tp_is_empty!12925)))

(declare-fun b!467602 () Bool)

(declare-fun res!279487 () Bool)

(assert (=> b!467602 (=> (not res!279487) (not e!273570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29615 (_ BitVec 32)) Bool)

(assert (=> b!467602 (= res!279487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467603 () Bool)

(declare-fun res!279485 () Bool)

(assert (=> b!467603 (=> (not res!279485) (not e!273570))))

(declare-datatypes ((List!8660 0))(
  ( (Nil!8657) (Cons!8656 (h!9512 (_ BitVec 64)) (t!14607 List!8660)) )
))
(declare-fun arrayNoDuplicates!0 (array!29615 (_ BitVec 32) List!8660) Bool)

(assert (=> b!467603 (= res!279485 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8657))))

(declare-fun mapNonEmpty!21079 () Bool)

(declare-fun tp!40503 () Bool)

(declare-fun e!273567 () Bool)

(assert (=> mapNonEmpty!21079 (= mapRes!21079 (and tp!40503 e!273567))))

(declare-fun mapRest!21079 () (Array (_ BitVec 32) ValueCell!6119))

(declare-fun mapKey!21079 () (_ BitVec 32))

(declare-fun mapValue!21079 () ValueCell!6119)

(assert (=> mapNonEmpty!21079 (= (arr!14235 _values!833) (store mapRest!21079 mapKey!21079 mapValue!21079))))

(declare-fun res!279484 () Bool)

(assert (=> start!41894 (=> (not res!279484) (not e!273570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41894 (= res!279484 (validMask!0 mask!1365))))

(assert (=> start!41894 e!273570))

(assert (=> start!41894 tp_is_empty!12925))

(assert (=> start!41894 tp!40504))

(assert (=> start!41894 true))

(declare-fun array_inv!10356 (array!29615) Bool)

(assert (=> start!41894 (array_inv!10356 _keys!1025)))

(declare-fun e!273568 () Bool)

(declare-fun array_inv!10357 (array!29617) Bool)

(assert (=> start!41894 (and (array_inv!10357 _values!833) e!273568)))

(declare-fun b!467604 () Bool)

(assert (=> b!467604 (= e!273568 (and e!273566 mapRes!21079))))

(declare-fun condMapEmpty!21079 () Bool)

(declare-fun mapDefault!21079 () ValueCell!6119)

(assert (=> b!467604 (= condMapEmpty!21079 (= (arr!14235 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6119)) mapDefault!21079)))))

(declare-fun b!467605 () Bool)

(assert (=> b!467605 (= e!273567 tp_is_empty!12925)))

(declare-fun b!467606 () Bool)

(declare-fun res!279486 () Bool)

(assert (=> b!467606 (=> (not res!279486) (not e!273570))))

(assert (=> b!467606 (= res!279486 (and (= (size!14588 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14587 _keys!1025) (size!14588 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41894 res!279484) b!467606))

(assert (= (and b!467606 res!279486) b!467602))

(assert (= (and b!467602 res!279487) b!467603))

(assert (= (and b!467603 res!279485) b!467600))

(assert (= (and b!467600 (not res!279483)) b!467599))

(assert (= (and b!467604 condMapEmpty!21079) mapIsEmpty!21079))

(assert (= (and b!467604 (not condMapEmpty!21079)) mapNonEmpty!21079))

(get-info :version)

(assert (= (and mapNonEmpty!21079 ((_ is ValueCellFull!6119) mapValue!21079)) b!467605))

(assert (= (and b!467604 ((_ is ValueCellFull!6119) mapDefault!21079)) b!467601))

(assert (= start!41894 b!467604))

(declare-fun m!449215 () Bool)

(assert (=> b!467603 m!449215))

(declare-fun m!449217 () Bool)

(assert (=> b!467599 m!449217))

(declare-fun m!449219 () Bool)

(assert (=> b!467600 m!449219))

(declare-fun m!449221 () Bool)

(assert (=> b!467600 m!449221))

(declare-fun m!449223 () Bool)

(assert (=> b!467600 m!449223))

(declare-fun m!449225 () Bool)

(assert (=> start!41894 m!449225))

(declare-fun m!449227 () Bool)

(assert (=> start!41894 m!449227))

(declare-fun m!449229 () Bool)

(assert (=> start!41894 m!449229))

(declare-fun m!449231 () Bool)

(assert (=> mapNonEmpty!21079 m!449231))

(declare-fun m!449233 () Bool)

(assert (=> b!467602 m!449233))

(check-sat (not b!467600) (not b_next!11497) (not mapNonEmpty!21079) (not b!467599) (not b!467603) (not start!41894) tp_is_empty!12925 (not b!467602) b_and!19859)
(check-sat b_and!19859 (not b_next!11497))
