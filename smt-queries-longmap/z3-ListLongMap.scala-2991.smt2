; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42236 () Bool)

(assert start!42236)

(declare-fun b_free!11755 () Bool)

(declare-fun b_next!11755 () Bool)

(assert (=> start!42236 (= b_free!11755 (not b_next!11755))))

(declare-fun tp!41293 () Bool)

(declare-fun b_and!20167 () Bool)

(assert (=> start!42236 (= tp!41293 b_and!20167)))

(declare-fun mapNonEmpty!21481 () Bool)

(declare-fun mapRes!21481 () Bool)

(declare-fun tp!41292 () Bool)

(declare-fun e!276154 () Bool)

(assert (=> mapNonEmpty!21481 (= mapRes!21481 (and tp!41292 e!276154))))

(declare-datatypes ((V!18683 0))(
  ( (V!18684 (val!6636 Int)) )
))
(declare-datatypes ((ValueCell!6248 0))(
  ( (ValueCellFull!6248 (v!8921 V!18683)) (EmptyCell!6248) )
))
(declare-datatypes ((array!30113 0))(
  ( (array!30114 (arr!14478 (Array (_ BitVec 32) ValueCell!6248)) (size!14831 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30113)

(declare-fun mapValue!21481 () ValueCell!6248)

(declare-fun mapKey!21481 () (_ BitVec 32))

(declare-fun mapRest!21481 () (Array (_ BitVec 32) ValueCell!6248))

(assert (=> mapNonEmpty!21481 (= (arr!14478 _values!833) (store mapRest!21481 mapKey!21481 mapValue!21481))))

(declare-fun res!281531 () Bool)

(declare-fun e!276152 () Bool)

(assert (=> start!42236 (=> (not res!281531) (not e!276152))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42236 (= res!281531 (validMask!0 mask!1365))))

(assert (=> start!42236 e!276152))

(declare-fun tp_is_empty!13183 () Bool)

(assert (=> start!42236 tp_is_empty!13183))

(assert (=> start!42236 tp!41293))

(assert (=> start!42236 true))

(declare-datatypes ((array!30115 0))(
  ( (array!30116 (arr!14479 (Array (_ BitVec 32) (_ BitVec 64))) (size!14832 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30115)

(declare-fun array_inv!10530 (array!30115) Bool)

(assert (=> start!42236 (array_inv!10530 _keys!1025)))

(declare-fun e!276153 () Bool)

(declare-fun array_inv!10531 (array!30113) Bool)

(assert (=> start!42236 (and (array_inv!10531 _values!833) e!276153)))

(declare-fun b!471207 () Bool)

(assert (=> b!471207 (= e!276154 tp_is_empty!13183)))

(declare-fun b!471208 () Bool)

(declare-fun res!281528 () Bool)

(assert (=> b!471208 (=> (not res!281528) (not e!276152))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471208 (= res!281528 (and (= (size!14831 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14832 _keys!1025) (size!14831 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471209 () Bool)

(declare-fun res!281529 () Bool)

(assert (=> b!471209 (=> (not res!281529) (not e!276152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30115 (_ BitVec 32)) Bool)

(assert (=> b!471209 (= res!281529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21481 () Bool)

(assert (=> mapIsEmpty!21481 mapRes!21481))

(declare-fun b!471210 () Bool)

(declare-fun e!276155 () Bool)

(assert (=> b!471210 (= e!276155 tp_is_empty!13183)))

(declare-fun b!471211 () Bool)

(assert (=> b!471211 (= e!276153 (and e!276155 mapRes!21481))))

(declare-fun condMapEmpty!21481 () Bool)

(declare-fun mapDefault!21481 () ValueCell!6248)

(assert (=> b!471211 (= condMapEmpty!21481 (= (arr!14478 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6248)) mapDefault!21481)))))

(declare-fun b!471212 () Bool)

(assert (=> b!471212 (= e!276152 (not true))))

(declare-datatypes ((tuple2!8772 0))(
  ( (tuple2!8773 (_1!4397 (_ BitVec 64)) (_2!4397 V!18683)) )
))
(declare-datatypes ((List!8843 0))(
  ( (Nil!8840) (Cons!8839 (h!9695 tuple2!8772) (t!14800 List!8843)) )
))
(declare-datatypes ((ListLongMap!7675 0))(
  ( (ListLongMap!7676 (toList!3853 List!8843)) )
))
(declare-fun lt!213672 () ListLongMap!7675)

(declare-fun lt!213673 () ListLongMap!7675)

(assert (=> b!471212 (= lt!213672 lt!213673)))

(declare-fun minValueBefore!38 () V!18683)

(declare-fun zeroValue!794 () V!18683)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18683)

(declare-datatypes ((Unit!13807 0))(
  ( (Unit!13808) )
))
(declare-fun lt!213674 () Unit!13807)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!185 (array!30115 array!30113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 V!18683 V!18683 (_ BitVec 32) Int) Unit!13807)

(assert (=> b!471212 (= lt!213674 (lemmaNoChangeToArrayThenSameMapNoExtras!185 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2028 (array!30115 array!30113 (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 (_ BitVec 32) Int) ListLongMap!7675)

(assert (=> b!471212 (= lt!213673 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471212 (= lt!213672 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471213 () Bool)

(declare-fun res!281530 () Bool)

(assert (=> b!471213 (=> (not res!281530) (not e!276152))))

(declare-datatypes ((List!8844 0))(
  ( (Nil!8841) (Cons!8840 (h!9696 (_ BitVec 64)) (t!14801 List!8844)) )
))
(declare-fun arrayNoDuplicates!0 (array!30115 (_ BitVec 32) List!8844) Bool)

(assert (=> b!471213 (= res!281530 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8841))))

(assert (= (and start!42236 res!281531) b!471208))

(assert (= (and b!471208 res!281528) b!471209))

(assert (= (and b!471209 res!281529) b!471213))

(assert (= (and b!471213 res!281530) b!471212))

(assert (= (and b!471211 condMapEmpty!21481) mapIsEmpty!21481))

(assert (= (and b!471211 (not condMapEmpty!21481)) mapNonEmpty!21481))

(get-info :version)

(assert (= (and mapNonEmpty!21481 ((_ is ValueCellFull!6248) mapValue!21481)) b!471207))

(assert (= (and b!471211 ((_ is ValueCellFull!6248) mapDefault!21481)) b!471210))

(assert (= start!42236 b!471211))

(declare-fun m!452871 () Bool)

(assert (=> b!471212 m!452871))

(declare-fun m!452873 () Bool)

(assert (=> b!471212 m!452873))

(declare-fun m!452875 () Bool)

(assert (=> b!471212 m!452875))

(declare-fun m!452877 () Bool)

(assert (=> b!471209 m!452877))

(declare-fun m!452879 () Bool)

(assert (=> start!42236 m!452879))

(declare-fun m!452881 () Bool)

(assert (=> start!42236 m!452881))

(declare-fun m!452883 () Bool)

(assert (=> start!42236 m!452883))

(declare-fun m!452885 () Bool)

(assert (=> mapNonEmpty!21481 m!452885))

(declare-fun m!452887 () Bool)

(assert (=> b!471213 m!452887))

(check-sat (not b!471209) (not mapNonEmpty!21481) tp_is_empty!13183 (not start!42236) (not b!471212) (not b!471213) b_and!20167 (not b_next!11755))
(check-sat b_and!20167 (not b_next!11755))
