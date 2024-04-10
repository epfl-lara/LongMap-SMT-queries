; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42482 () Bool)

(assert start!42482)

(declare-fun b_free!11937 () Bool)

(declare-fun b_next!11937 () Bool)

(assert (=> start!42482 (= b_free!11937 (not b_next!11937))))

(declare-fun tp!41847 () Bool)

(declare-fun b_and!20405 () Bool)

(assert (=> start!42482 (= tp!41847 b_and!20405)))

(declare-fun res!283111 () Bool)

(declare-fun e!278147 () Bool)

(assert (=> start!42482 (=> (not res!283111) (not e!278147))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42482 (= res!283111 (validMask!0 mask!1365))))

(assert (=> start!42482 e!278147))

(declare-fun tp_is_empty!13365 () Bool)

(assert (=> start!42482 tp_is_empty!13365))

(assert (=> start!42482 tp!41847))

(assert (=> start!42482 true))

(declare-datatypes ((array!30485 0))(
  ( (array!30486 (arr!14661 (Array (_ BitVec 32) (_ BitVec 64))) (size!15013 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30485)

(declare-fun array_inv!10578 (array!30485) Bool)

(assert (=> start!42482 (array_inv!10578 _keys!1025)))

(declare-datatypes ((V!18925 0))(
  ( (V!18926 (val!6727 Int)) )
))
(declare-datatypes ((ValueCell!6339 0))(
  ( (ValueCellFull!6339 (v!9019 V!18925)) (EmptyCell!6339) )
))
(declare-datatypes ((array!30487 0))(
  ( (array!30488 (arr!14662 (Array (_ BitVec 32) ValueCell!6339)) (size!15014 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30487)

(declare-fun e!278149 () Bool)

(declare-fun array_inv!10579 (array!30487) Bool)

(assert (=> start!42482 (and (array_inv!10579 _values!833) e!278149)))

(declare-fun mapIsEmpty!21763 () Bool)

(declare-fun mapRes!21763 () Bool)

(assert (=> mapIsEmpty!21763 mapRes!21763))

(declare-fun b!473997 () Bool)

(declare-fun e!278152 () Bool)

(assert (=> b!473997 (= e!278149 (and e!278152 mapRes!21763))))

(declare-fun condMapEmpty!21763 () Bool)

(declare-fun mapDefault!21763 () ValueCell!6339)

(assert (=> b!473997 (= condMapEmpty!21763 (= (arr!14662 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6339)) mapDefault!21763)))))

(declare-fun mapNonEmpty!21763 () Bool)

(declare-fun tp!41848 () Bool)

(declare-fun e!278150 () Bool)

(assert (=> mapNonEmpty!21763 (= mapRes!21763 (and tp!41848 e!278150))))

(declare-fun mapRest!21763 () (Array (_ BitVec 32) ValueCell!6339))

(declare-fun mapValue!21763 () ValueCell!6339)

(declare-fun mapKey!21763 () (_ BitVec 32))

(assert (=> mapNonEmpty!21763 (= (arr!14662 _values!833) (store mapRest!21763 mapKey!21763 mapValue!21763))))

(declare-fun b!473998 () Bool)

(assert (=> b!473998 (= e!278150 tp_is_empty!13365)))

(declare-fun b!473999 () Bool)

(declare-fun res!283112 () Bool)

(assert (=> b!473999 (=> (not res!283112) (not e!278147))))

(declare-datatypes ((List!8949 0))(
  ( (Nil!8946) (Cons!8945 (h!9801 (_ BitVec 64)) (t!14921 List!8949)) )
))
(declare-fun arrayNoDuplicates!0 (array!30485 (_ BitVec 32) List!8949) Bool)

(assert (=> b!473999 (= res!283112 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8946))))

(declare-fun b!474000 () Bool)

(declare-fun e!278148 () Bool)

(assert (=> b!474000 (= e!278147 (not e!278148))))

(declare-fun res!283114 () Bool)

(assert (=> b!474000 (=> res!283114 e!278148)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474000 (= res!283114 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8870 0))(
  ( (tuple2!8871 (_1!4446 (_ BitVec 64)) (_2!4446 V!18925)) )
))
(declare-datatypes ((List!8950 0))(
  ( (Nil!8947) (Cons!8946 (h!9802 tuple2!8870) (t!14922 List!8950)) )
))
(declare-datatypes ((ListLongMap!7783 0))(
  ( (ListLongMap!7784 (toList!3907 List!8950)) )
))
(declare-fun lt!215679 () ListLongMap!7783)

(declare-fun lt!215675 () ListLongMap!7783)

(assert (=> b!474000 (= lt!215679 lt!215675)))

(declare-fun minValueBefore!38 () V!18925)

(declare-fun zeroValue!794 () V!18925)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13972 0))(
  ( (Unit!13973) )
))
(declare-fun lt!215674 () Unit!13972)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18925)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!246 (array!30485 array!30487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18925 V!18925 V!18925 V!18925 (_ BitVec 32) Int) Unit!13972)

(assert (=> b!474000 (= lt!215674 (lemmaNoChangeToArrayThenSameMapNoExtras!246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2066 (array!30485 array!30487 (_ BitVec 32) (_ BitVec 32) V!18925 V!18925 (_ BitVec 32) Int) ListLongMap!7783)

(assert (=> b!474000 (= lt!215675 (getCurrentListMapNoExtraKeys!2066 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474000 (= lt!215679 (getCurrentListMapNoExtraKeys!2066 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474001 () Bool)

(declare-fun res!283115 () Bool)

(assert (=> b!474001 (=> (not res!283115) (not e!278147))))

(assert (=> b!474001 (= res!283115 (and (= (size!15014 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15013 _keys!1025) (size!15014 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474002 () Bool)

(declare-fun res!283113 () Bool)

(assert (=> b!474002 (=> (not res!283113) (not e!278147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30485 (_ BitVec 32)) Bool)

(assert (=> b!474002 (= res!283113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474003 () Bool)

(assert (=> b!474003 (= e!278148 true)))

(declare-fun lt!215672 () ListLongMap!7783)

(declare-fun lt!215678 () tuple2!8870)

(declare-fun +!1742 (ListLongMap!7783 tuple2!8870) ListLongMap!7783)

(assert (=> b!474003 (= (+!1742 lt!215672 lt!215678) (+!1742 (+!1742 lt!215672 (tuple2!8871 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215678))))

(assert (=> b!474003 (= lt!215678 (tuple2!8871 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215673 () Unit!13972)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!151 (ListLongMap!7783 (_ BitVec 64) V!18925 V!18925) Unit!13972)

(assert (=> b!474003 (= lt!215673 (addSameAsAddTwiceSameKeyDiffValues!151 lt!215672 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474003 (= lt!215672 (+!1742 lt!215679 (tuple2!8871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215676 () ListLongMap!7783)

(declare-fun getCurrentListMap!2271 (array!30485 array!30487 (_ BitVec 32) (_ BitVec 32) V!18925 V!18925 (_ BitVec 32) Int) ListLongMap!7783)

(assert (=> b!474003 (= lt!215676 (getCurrentListMap!2271 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215677 () ListLongMap!7783)

(assert (=> b!474003 (= lt!215677 (getCurrentListMap!2271 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474004 () Bool)

(assert (=> b!474004 (= e!278152 tp_is_empty!13365)))

(assert (= (and start!42482 res!283111) b!474001))

(assert (= (and b!474001 res!283115) b!474002))

(assert (= (and b!474002 res!283113) b!473999))

(assert (= (and b!473999 res!283112) b!474000))

(assert (= (and b!474000 (not res!283114)) b!474003))

(assert (= (and b!473997 condMapEmpty!21763) mapIsEmpty!21763))

(assert (= (and b!473997 (not condMapEmpty!21763)) mapNonEmpty!21763))

(get-info :version)

(assert (= (and mapNonEmpty!21763 ((_ is ValueCellFull!6339) mapValue!21763)) b!473998))

(assert (= (and b!473997 ((_ is ValueCellFull!6339) mapDefault!21763)) b!474004))

(assert (= start!42482 b!473997))

(declare-fun m!456205 () Bool)

(assert (=> start!42482 m!456205))

(declare-fun m!456207 () Bool)

(assert (=> start!42482 m!456207))

(declare-fun m!456209 () Bool)

(assert (=> start!42482 m!456209))

(declare-fun m!456211 () Bool)

(assert (=> b!474002 m!456211))

(declare-fun m!456213 () Bool)

(assert (=> b!474003 m!456213))

(declare-fun m!456215 () Bool)

(assert (=> b!474003 m!456215))

(declare-fun m!456217 () Bool)

(assert (=> b!474003 m!456217))

(declare-fun m!456219 () Bool)

(assert (=> b!474003 m!456219))

(declare-fun m!456221 () Bool)

(assert (=> b!474003 m!456221))

(assert (=> b!474003 m!456215))

(declare-fun m!456223 () Bool)

(assert (=> b!474003 m!456223))

(declare-fun m!456225 () Bool)

(assert (=> b!474003 m!456225))

(declare-fun m!456227 () Bool)

(assert (=> b!473999 m!456227))

(declare-fun m!456229 () Bool)

(assert (=> mapNonEmpty!21763 m!456229))

(declare-fun m!456231 () Bool)

(assert (=> b!474000 m!456231))

(declare-fun m!456233 () Bool)

(assert (=> b!474000 m!456233))

(declare-fun m!456235 () Bool)

(assert (=> b!474000 m!456235))

(check-sat (not b_next!11937) (not b!474000) (not b!473999) b_and!20405 (not mapNonEmpty!21763) (not b!474003) (not start!42482) tp_is_empty!13365 (not b!474002))
(check-sat b_and!20405 (not b_next!11937))
