; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42478 () Bool)

(assert start!42478)

(declare-fun b_free!11947 () Bool)

(declare-fun b_next!11947 () Bool)

(assert (=> start!42478 (= b_free!11947 (not b_next!11947))))

(declare-fun tp!41877 () Bool)

(declare-fun b_and!20425 () Bool)

(assert (=> start!42478 (= tp!41877 b_and!20425)))

(declare-fun b!474056 () Bool)

(declare-fun e!278201 () Bool)

(assert (=> b!474056 (= e!278201 true)))

(declare-datatypes ((V!18939 0))(
  ( (V!18940 (val!6732 Int)) )
))
(declare-datatypes ((tuple2!8798 0))(
  ( (tuple2!8799 (_1!4410 (_ BitVec 64)) (_2!4410 V!18939)) )
))
(declare-datatypes ((List!8859 0))(
  ( (Nil!8856) (Cons!8855 (h!9711 tuple2!8798) (t!14823 List!8859)) )
))
(declare-datatypes ((ListLongMap!7713 0))(
  ( (ListLongMap!7714 (toList!3872 List!8859)) )
))
(declare-fun lt!215811 () ListLongMap!7713)

(declare-fun lt!215806 () tuple2!8798)

(declare-fun minValueBefore!38 () V!18939)

(declare-fun +!1754 (ListLongMap!7713 tuple2!8798) ListLongMap!7713)

(assert (=> b!474056 (= (+!1754 lt!215811 lt!215806) (+!1754 (+!1754 lt!215811 (tuple2!8799 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215806))))

(declare-fun minValueAfter!38 () V!18939)

(assert (=> b!474056 (= lt!215806 (tuple2!8799 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13950 0))(
  ( (Unit!13951) )
))
(declare-fun lt!215810 () Unit!13950)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!156 (ListLongMap!7713 (_ BitVec 64) V!18939 V!18939) Unit!13950)

(assert (=> b!474056 (= lt!215810 (addSameAsAddTwiceSameKeyDiffValues!156 lt!215811 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215808 () ListLongMap!7713)

(declare-fun zeroValue!794 () V!18939)

(assert (=> b!474056 (= lt!215811 (+!1754 lt!215808 (tuple2!8799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!215805 () ListLongMap!7713)

(declare-datatypes ((array!30478 0))(
  ( (array!30479 (arr!14657 (Array (_ BitVec 32) (_ BitVec 64))) (size!15009 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30478)

(declare-datatypes ((ValueCell!6344 0))(
  ( (ValueCellFull!6344 (v!9025 V!18939)) (EmptyCell!6344) )
))
(declare-datatypes ((array!30480 0))(
  ( (array!30481 (arr!14658 (Array (_ BitVec 32) ValueCell!6344)) (size!15010 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30480)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2234 (array!30478 array!30480 (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!474056 (= lt!215805 (getCurrentListMap!2234 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215804 () ListLongMap!7713)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474056 (= lt!215804 (getCurrentListMap!2234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474057 () Bool)

(declare-fun res!283181 () Bool)

(declare-fun e!278198 () Bool)

(assert (=> b!474057 (=> (not res!283181) (not e!278198))))

(assert (=> b!474057 (= res!283181 (and (= (size!15010 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15009 _keys!1025) (size!15010 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21778 () Bool)

(declare-fun mapRes!21778 () Bool)

(declare-fun tp!41878 () Bool)

(declare-fun e!278203 () Bool)

(assert (=> mapNonEmpty!21778 (= mapRes!21778 (and tp!41878 e!278203))))

(declare-fun mapValue!21778 () ValueCell!6344)

(declare-fun mapKey!21778 () (_ BitVec 32))

(declare-fun mapRest!21778 () (Array (_ BitVec 32) ValueCell!6344))

(assert (=> mapNonEmpty!21778 (= (arr!14658 _values!833) (store mapRest!21778 mapKey!21778 mapValue!21778))))

(declare-fun b!474058 () Bool)

(declare-fun tp_is_empty!13375 () Bool)

(assert (=> b!474058 (= e!278203 tp_is_empty!13375)))

(declare-fun res!283180 () Bool)

(assert (=> start!42478 (=> (not res!283180) (not e!278198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42478 (= res!283180 (validMask!0 mask!1365))))

(assert (=> start!42478 e!278198))

(assert (=> start!42478 tp_is_empty!13375))

(assert (=> start!42478 tp!41877))

(assert (=> start!42478 true))

(declare-fun array_inv!10656 (array!30478) Bool)

(assert (=> start!42478 (array_inv!10656 _keys!1025)))

(declare-fun e!278202 () Bool)

(declare-fun array_inv!10657 (array!30480) Bool)

(assert (=> start!42478 (and (array_inv!10657 _values!833) e!278202)))

(declare-fun b!474059 () Bool)

(assert (=> b!474059 (= e!278198 (not e!278201))))

(declare-fun res!283179 () Bool)

(assert (=> b!474059 (=> res!283179 e!278201)))

(assert (=> b!474059 (= res!283179 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215807 () ListLongMap!7713)

(assert (=> b!474059 (= lt!215808 lt!215807)))

(declare-fun lt!215809 () Unit!13950)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!241 (array!30478 array!30480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 V!18939 V!18939 (_ BitVec 32) Int) Unit!13950)

(assert (=> b!474059 (= lt!215809 (lemmaNoChangeToArrayThenSameMapNoExtras!241 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2081 (array!30478 array!30480 (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!474059 (= lt!215807 (getCurrentListMapNoExtraKeys!2081 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474059 (= lt!215808 (getCurrentListMapNoExtraKeys!2081 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21778 () Bool)

(assert (=> mapIsEmpty!21778 mapRes!21778))

(declare-fun b!474060 () Bool)

(declare-fun res!283183 () Bool)

(assert (=> b!474060 (=> (not res!283183) (not e!278198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30478 (_ BitVec 32)) Bool)

(assert (=> b!474060 (= res!283183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474061 () Bool)

(declare-fun e!278200 () Bool)

(assert (=> b!474061 (= e!278202 (and e!278200 mapRes!21778))))

(declare-fun condMapEmpty!21778 () Bool)

(declare-fun mapDefault!21778 () ValueCell!6344)

(assert (=> b!474061 (= condMapEmpty!21778 (= (arr!14658 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6344)) mapDefault!21778)))))

(declare-fun b!474062 () Bool)

(assert (=> b!474062 (= e!278200 tp_is_empty!13375)))

(declare-fun b!474063 () Bool)

(declare-fun res!283182 () Bool)

(assert (=> b!474063 (=> (not res!283182) (not e!278198))))

(declare-datatypes ((List!8860 0))(
  ( (Nil!8857) (Cons!8856 (h!9712 (_ BitVec 64)) (t!14824 List!8860)) )
))
(declare-fun arrayNoDuplicates!0 (array!30478 (_ BitVec 32) List!8860) Bool)

(assert (=> b!474063 (= res!283182 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8857))))

(assert (= (and start!42478 res!283180) b!474057))

(assert (= (and b!474057 res!283181) b!474060))

(assert (= (and b!474060 res!283183) b!474063))

(assert (= (and b!474063 res!283182) b!474059))

(assert (= (and b!474059 (not res!283179)) b!474056))

(assert (= (and b!474061 condMapEmpty!21778) mapIsEmpty!21778))

(assert (= (and b!474061 (not condMapEmpty!21778)) mapNonEmpty!21778))

(get-info :version)

(assert (= (and mapNonEmpty!21778 ((_ is ValueCellFull!6344) mapValue!21778)) b!474058))

(assert (= (and b!474061 ((_ is ValueCellFull!6344) mapDefault!21778)) b!474062))

(assert (= start!42478 b!474061))

(declare-fun m!456547 () Bool)

(assert (=> mapNonEmpty!21778 m!456547))

(declare-fun m!456549 () Bool)

(assert (=> start!42478 m!456549))

(declare-fun m!456551 () Bool)

(assert (=> start!42478 m!456551))

(declare-fun m!456553 () Bool)

(assert (=> start!42478 m!456553))

(declare-fun m!456555 () Bool)

(assert (=> b!474056 m!456555))

(declare-fun m!456557 () Bool)

(assert (=> b!474056 m!456557))

(declare-fun m!456559 () Bool)

(assert (=> b!474056 m!456559))

(declare-fun m!456561 () Bool)

(assert (=> b!474056 m!456561))

(assert (=> b!474056 m!456557))

(declare-fun m!456563 () Bool)

(assert (=> b!474056 m!456563))

(declare-fun m!456565 () Bool)

(assert (=> b!474056 m!456565))

(declare-fun m!456567 () Bool)

(assert (=> b!474056 m!456567))

(declare-fun m!456569 () Bool)

(assert (=> b!474060 m!456569))

(declare-fun m!456571 () Bool)

(assert (=> b!474059 m!456571))

(declare-fun m!456573 () Bool)

(assert (=> b!474059 m!456573))

(declare-fun m!456575 () Bool)

(assert (=> b!474059 m!456575))

(declare-fun m!456577 () Bool)

(assert (=> b!474063 m!456577))

(check-sat (not b!474063) tp_is_empty!13375 (not b!474056) (not b_next!11947) b_and!20425 (not start!42478) (not b!474060) (not mapNonEmpty!21778) (not b!474059))
(check-sat b_and!20425 (not b_next!11947))
