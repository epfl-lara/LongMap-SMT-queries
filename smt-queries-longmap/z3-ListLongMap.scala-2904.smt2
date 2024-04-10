; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41568 () Bool)

(assert start!41568)

(declare-fun b_free!11235 () Bool)

(declare-fun b_next!11235 () Bool)

(assert (=> start!41568 (= b_free!11235 (not b_next!11235))))

(declare-fun tp!39702 () Bool)

(declare-fun b_and!19575 () Bool)

(assert (=> start!41568 (= tp!39702 b_and!19575)))

(declare-fun mapNonEmpty!20671 () Bool)

(declare-fun mapRes!20671 () Bool)

(declare-fun tp!39703 () Bool)

(declare-fun e!271211 () Bool)

(assert (=> mapNonEmpty!20671 (= mapRes!20671 (and tp!39703 e!271211))))

(declare-datatypes ((V!17989 0))(
  ( (V!17990 (val!6376 Int)) )
))
(declare-datatypes ((ValueCell!5988 0))(
  ( (ValueCellFull!5988 (v!8663 V!17989)) (EmptyCell!5988) )
))
(declare-fun mapValue!20671 () ValueCell!5988)

(declare-datatypes ((array!29113 0))(
  ( (array!29114 (arr!13988 (Array (_ BitVec 32) ValueCell!5988)) (size!14340 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29113)

(declare-fun mapKey!20671 () (_ BitVec 32))

(declare-fun mapRest!20671 () (Array (_ BitVec 32) ValueCell!5988))

(assert (=> mapNonEmpty!20671 (= (arr!13988 _values!833) (store mapRest!20671 mapKey!20671 mapValue!20671))))

(declare-fun b!464314 () Bool)

(declare-fun res!277604 () Bool)

(declare-fun e!271208 () Bool)

(assert (=> b!464314 (=> (not res!277604) (not e!271208))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29115 0))(
  ( (array!29116 (arr!13989 (Array (_ BitVec 32) (_ BitVec 64))) (size!14341 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29115)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464314 (= res!277604 (and (= (size!14340 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14341 _keys!1025) (size!14340 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464315 () Bool)

(declare-fun res!277602 () Bool)

(assert (=> b!464315 (=> (not res!277602) (not e!271208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29115 (_ BitVec 32)) Bool)

(assert (=> b!464315 (= res!277602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464316 () Bool)

(declare-fun e!271209 () Bool)

(declare-fun e!271212 () Bool)

(assert (=> b!464316 (= e!271209 (and e!271212 mapRes!20671))))

(declare-fun condMapEmpty!20671 () Bool)

(declare-fun mapDefault!20671 () ValueCell!5988)

(assert (=> b!464316 (= condMapEmpty!20671 (= (arr!13988 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5988)) mapDefault!20671)))))

(declare-fun b!464317 () Bool)

(assert (=> b!464317 (= e!271208 (not true))))

(declare-datatypes ((tuple2!8352 0))(
  ( (tuple2!8353 (_1!4187 (_ BitVec 64)) (_2!4187 V!17989)) )
))
(declare-datatypes ((List!8446 0))(
  ( (Nil!8443) (Cons!8442 (h!9298 tuple2!8352) (t!14392 List!8446)) )
))
(declare-datatypes ((ListLongMap!7265 0))(
  ( (ListLongMap!7266 (toList!3648 List!8446)) )
))
(declare-fun lt!209662 () ListLongMap!7265)

(declare-fun lt!209661 () ListLongMap!7265)

(assert (=> b!464317 (= lt!209662 lt!209661)))

(declare-fun minValueBefore!38 () V!17989)

(declare-fun zeroValue!794 () V!17989)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17989)

(declare-datatypes ((Unit!13464 0))(
  ( (Unit!13465) )
))
(declare-fun lt!209663 () Unit!13464)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!8 (array!29115 array!29113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17989 V!17989 V!17989 V!17989 (_ BitVec 32) Int) Unit!13464)

(assert (=> b!464317 (= lt!209663 (lemmaNoChangeToArrayThenSameMapNoExtras!8 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1828 (array!29115 array!29113 (_ BitVec 32) (_ BitVec 32) V!17989 V!17989 (_ BitVec 32) Int) ListLongMap!7265)

(assert (=> b!464317 (= lt!209661 (getCurrentListMapNoExtraKeys!1828 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464317 (= lt!209662 (getCurrentListMapNoExtraKeys!1828 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464318 () Bool)

(declare-fun tp_is_empty!12663 () Bool)

(assert (=> b!464318 (= e!271212 tp_is_empty!12663)))

(declare-fun b!464319 () Bool)

(declare-fun res!277601 () Bool)

(assert (=> b!464319 (=> (not res!277601) (not e!271208))))

(declare-datatypes ((List!8447 0))(
  ( (Nil!8444) (Cons!8443 (h!9299 (_ BitVec 64)) (t!14393 List!8447)) )
))
(declare-fun arrayNoDuplicates!0 (array!29115 (_ BitVec 32) List!8447) Bool)

(assert (=> b!464319 (= res!277601 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8444))))

(declare-fun mapIsEmpty!20671 () Bool)

(assert (=> mapIsEmpty!20671 mapRes!20671))

(declare-fun res!277603 () Bool)

(assert (=> start!41568 (=> (not res!277603) (not e!271208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41568 (= res!277603 (validMask!0 mask!1365))))

(assert (=> start!41568 e!271208))

(assert (=> start!41568 tp_is_empty!12663))

(assert (=> start!41568 tp!39702))

(assert (=> start!41568 true))

(declare-fun array_inv!10104 (array!29115) Bool)

(assert (=> start!41568 (array_inv!10104 _keys!1025)))

(declare-fun array_inv!10105 (array!29113) Bool)

(assert (=> start!41568 (and (array_inv!10105 _values!833) e!271209)))

(declare-fun b!464320 () Bool)

(assert (=> b!464320 (= e!271211 tp_is_empty!12663)))

(assert (= (and start!41568 res!277603) b!464314))

(assert (= (and b!464314 res!277604) b!464315))

(assert (= (and b!464315 res!277602) b!464319))

(assert (= (and b!464319 res!277601) b!464317))

(assert (= (and b!464316 condMapEmpty!20671) mapIsEmpty!20671))

(assert (= (and b!464316 (not condMapEmpty!20671)) mapNonEmpty!20671))

(get-info :version)

(assert (= (and mapNonEmpty!20671 ((_ is ValueCellFull!5988) mapValue!20671)) b!464320))

(assert (= (and b!464316 ((_ is ValueCellFull!5988) mapDefault!20671)) b!464318))

(assert (= start!41568 b!464316))

(declare-fun m!446717 () Bool)

(assert (=> start!41568 m!446717))

(declare-fun m!446719 () Bool)

(assert (=> start!41568 m!446719))

(declare-fun m!446721 () Bool)

(assert (=> start!41568 m!446721))

(declare-fun m!446723 () Bool)

(assert (=> mapNonEmpty!20671 m!446723))

(declare-fun m!446725 () Bool)

(assert (=> b!464317 m!446725))

(declare-fun m!446727 () Bool)

(assert (=> b!464317 m!446727))

(declare-fun m!446729 () Bool)

(assert (=> b!464317 m!446729))

(declare-fun m!446731 () Bool)

(assert (=> b!464315 m!446731))

(declare-fun m!446733 () Bool)

(assert (=> b!464319 m!446733))

(check-sat tp_is_empty!12663 b_and!19575 (not b!464317) (not b!464315) (not b_next!11235) (not start!41568) (not b!464319) (not mapNonEmpty!20671))
(check-sat b_and!19575 (not b_next!11235))
