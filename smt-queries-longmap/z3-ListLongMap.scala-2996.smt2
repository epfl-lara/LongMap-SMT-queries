; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42282 () Bool)

(assert start!42282)

(declare-fun b_free!11787 () Bool)

(declare-fun b_next!11787 () Bool)

(assert (=> start!42282 (= b_free!11787 (not b_next!11787))))

(declare-fun tp!41388 () Bool)

(declare-fun b_and!20225 () Bool)

(assert (=> start!42282 (= tp!41388 b_and!20225)))

(declare-fun mapNonEmpty!21529 () Bool)

(declare-fun mapRes!21529 () Bool)

(declare-fun tp!41389 () Bool)

(declare-fun e!276569 () Bool)

(assert (=> mapNonEmpty!21529 (= mapRes!21529 (and tp!41389 e!276569))))

(declare-fun mapKey!21529 () (_ BitVec 32))

(declare-datatypes ((V!18725 0))(
  ( (V!18726 (val!6652 Int)) )
))
(declare-datatypes ((ValueCell!6264 0))(
  ( (ValueCellFull!6264 (v!8943 V!18725)) (EmptyCell!6264) )
))
(declare-datatypes ((array!30189 0))(
  ( (array!30190 (arr!14516 (Array (_ BitVec 32) ValueCell!6264)) (size!14868 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30189)

(declare-fun mapRest!21529 () (Array (_ BitVec 32) ValueCell!6264))

(declare-fun mapValue!21529 () ValueCell!6264)

(assert (=> mapNonEmpty!21529 (= (arr!14516 _values!833) (store mapRest!21529 mapKey!21529 mapValue!21529))))

(declare-fun b!471814 () Bool)

(declare-fun res!281850 () Bool)

(declare-fun e!276570 () Bool)

(assert (=> b!471814 (=> (not res!281850) (not e!276570))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30191 0))(
  ( (array!30192 (arr!14517 (Array (_ BitVec 32) (_ BitVec 64))) (size!14869 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30191)

(assert (=> b!471814 (= res!281850 (and (= (size!14868 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14869 _keys!1025) (size!14868 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281851 () Bool)

(assert (=> start!42282 (=> (not res!281851) (not e!276570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42282 (= res!281851 (validMask!0 mask!1365))))

(assert (=> start!42282 e!276570))

(declare-fun tp_is_empty!13215 () Bool)

(assert (=> start!42282 tp_is_empty!13215))

(assert (=> start!42282 tp!41388))

(assert (=> start!42282 true))

(declare-fun array_inv!10462 (array!30191) Bool)

(assert (=> start!42282 (array_inv!10462 _keys!1025)))

(declare-fun e!276568 () Bool)

(declare-fun array_inv!10463 (array!30189) Bool)

(assert (=> start!42282 (and (array_inv!10463 _values!833) e!276568)))

(declare-fun b!471815 () Bool)

(declare-fun e!276567 () Bool)

(assert (=> b!471815 (= e!276568 (and e!276567 mapRes!21529))))

(declare-fun condMapEmpty!21529 () Bool)

(declare-fun mapDefault!21529 () ValueCell!6264)

(assert (=> b!471815 (= condMapEmpty!21529 (= (arr!14516 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6264)) mapDefault!21529)))))

(declare-fun mapIsEmpty!21529 () Bool)

(assert (=> mapIsEmpty!21529 mapRes!21529))

(declare-fun b!471816 () Bool)

(declare-fun res!281852 () Bool)

(assert (=> b!471816 (=> (not res!281852) (not e!276570))))

(declare-datatypes ((List!8837 0))(
  ( (Nil!8834) (Cons!8833 (h!9689 (_ BitVec 64)) (t!14803 List!8837)) )
))
(declare-fun arrayNoDuplicates!0 (array!30191 (_ BitVec 32) List!8837) Bool)

(assert (=> b!471816 (= res!281852 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8834))))

(declare-fun b!471817 () Bool)

(assert (=> b!471817 (= e!276567 tp_is_empty!13215)))

(declare-fun b!471818 () Bool)

(declare-fun res!281849 () Bool)

(assert (=> b!471818 (=> (not res!281849) (not e!276570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30191 (_ BitVec 32)) Bool)

(assert (=> b!471818 (= res!281849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471819 () Bool)

(assert (=> b!471819 (= e!276569 tp_is_empty!13215)))

(declare-fun b!471820 () Bool)

(assert (=> b!471820 (= e!276570 (not true))))

(declare-datatypes ((tuple2!8754 0))(
  ( (tuple2!8755 (_1!4388 (_ BitVec 64)) (_2!4388 V!18725)) )
))
(declare-datatypes ((List!8838 0))(
  ( (Nil!8835) (Cons!8834 (h!9690 tuple2!8754) (t!14804 List!8838)) )
))
(declare-datatypes ((ListLongMap!7667 0))(
  ( (ListLongMap!7668 (toList!3849 List!8838)) )
))
(declare-fun lt!214051 () ListLongMap!7667)

(declare-fun lt!214052 () ListLongMap!7667)

(assert (=> b!471820 (= lt!214051 lt!214052)))

(declare-datatypes ((Unit!13857 0))(
  ( (Unit!13858) )
))
(declare-fun lt!214050 () Unit!13857)

(declare-fun minValueBefore!38 () V!18725)

(declare-fun zeroValue!794 () V!18725)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18725)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!192 (array!30191 array!30189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18725 V!18725 V!18725 V!18725 (_ BitVec 32) Int) Unit!13857)

(assert (=> b!471820 (= lt!214050 (lemmaNoChangeToArrayThenSameMapNoExtras!192 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2012 (array!30191 array!30189 (_ BitVec 32) (_ BitVec 32) V!18725 V!18725 (_ BitVec 32) Int) ListLongMap!7667)

(assert (=> b!471820 (= lt!214052 (getCurrentListMapNoExtraKeys!2012 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471820 (= lt!214051 (getCurrentListMapNoExtraKeys!2012 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42282 res!281851) b!471814))

(assert (= (and b!471814 res!281850) b!471818))

(assert (= (and b!471818 res!281849) b!471816))

(assert (= (and b!471816 res!281852) b!471820))

(assert (= (and b!471815 condMapEmpty!21529) mapIsEmpty!21529))

(assert (= (and b!471815 (not condMapEmpty!21529)) mapNonEmpty!21529))

(get-info :version)

(assert (= (and mapNonEmpty!21529 ((_ is ValueCellFull!6264) mapValue!21529)) b!471819))

(assert (= (and b!471815 ((_ is ValueCellFull!6264) mapDefault!21529)) b!471817))

(assert (= start!42282 b!471815))

(declare-fun m!453893 () Bool)

(assert (=> start!42282 m!453893))

(declare-fun m!453895 () Bool)

(assert (=> start!42282 m!453895))

(declare-fun m!453897 () Bool)

(assert (=> start!42282 m!453897))

(declare-fun m!453899 () Bool)

(assert (=> mapNonEmpty!21529 m!453899))

(declare-fun m!453901 () Bool)

(assert (=> b!471820 m!453901))

(declare-fun m!453903 () Bool)

(assert (=> b!471820 m!453903))

(declare-fun m!453905 () Bool)

(assert (=> b!471820 m!453905))

(declare-fun m!453907 () Bool)

(assert (=> b!471816 m!453907))

(declare-fun m!453909 () Bool)

(assert (=> b!471818 m!453909))

(check-sat (not mapNonEmpty!21529) (not b!471820) (not start!42282) (not b_next!11787) (not b!471816) (not b!471818) tp_is_empty!13215 b_and!20225)
(check-sat b_and!20225 (not b_next!11787))
