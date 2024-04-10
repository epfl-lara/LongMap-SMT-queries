; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42004 () Bool)

(assert start!42004)

(declare-fun b_free!11577 () Bool)

(declare-fun b_next!11577 () Bool)

(assert (=> start!42004 (= b_free!11577 (not b_next!11577))))

(declare-fun tp!40746 () Bool)

(declare-fun b_and!19975 () Bool)

(assert (=> start!42004 (= tp!40746 b_and!19975)))

(declare-fun b!468978 () Bool)

(declare-fun res!280274 () Bool)

(declare-fun e!274557 () Bool)

(assert (=> b!468978 (=> (not res!280274) (not e!274557))))

(declare-datatypes ((array!29783 0))(
  ( (array!29784 (arr!14317 (Array (_ BitVec 32) (_ BitVec 64))) (size!14669 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29783)

(declare-datatypes ((List!8694 0))(
  ( (Nil!8691) (Cons!8690 (h!9546 (_ BitVec 64)) (t!14652 List!8694)) )
))
(declare-fun arrayNoDuplicates!0 (array!29783 (_ BitVec 32) List!8694) Bool)

(assert (=> b!468978 (= res!280274 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8691))))

(declare-fun mapNonEmpty!21202 () Bool)

(declare-fun mapRes!21202 () Bool)

(declare-fun tp!40747 () Bool)

(declare-fun e!274554 () Bool)

(assert (=> mapNonEmpty!21202 (= mapRes!21202 (and tp!40747 e!274554))))

(declare-datatypes ((V!18445 0))(
  ( (V!18446 (val!6547 Int)) )
))
(declare-datatypes ((ValueCell!6159 0))(
  ( (ValueCellFull!6159 (v!8836 V!18445)) (EmptyCell!6159) )
))
(declare-fun mapValue!21202 () ValueCell!6159)

(declare-fun mapRest!21202 () (Array (_ BitVec 32) ValueCell!6159))

(declare-fun mapKey!21202 () (_ BitVec 32))

(declare-datatypes ((array!29785 0))(
  ( (array!29786 (arr!14318 (Array (_ BitVec 32) ValueCell!6159)) (size!14670 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29785)

(assert (=> mapNonEmpty!21202 (= (arr!14318 _values!833) (store mapRest!21202 mapKey!21202 mapValue!21202))))

(declare-fun b!468979 () Bool)

(declare-fun res!280272 () Bool)

(assert (=> b!468979 (=> (not res!280272) (not e!274557))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468979 (= res!280272 (and (= (size!14670 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14669 _keys!1025) (size!14670 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468980 () Bool)

(declare-fun e!274558 () Bool)

(assert (=> b!468980 (= e!274558 true)))

(declare-datatypes ((tuple2!8610 0))(
  ( (tuple2!8611 (_1!4316 (_ BitVec 64)) (_2!4316 V!18445)) )
))
(declare-datatypes ((List!8695 0))(
  ( (Nil!8692) (Cons!8691 (h!9547 tuple2!8610) (t!14653 List!8695)) )
))
(declare-datatypes ((ListLongMap!7523 0))(
  ( (ListLongMap!7524 (toList!3777 List!8695)) )
))
(declare-fun lt!212311 () ListLongMap!7523)

(declare-fun lt!212316 () tuple2!8610)

(declare-fun minValueBefore!38 () V!18445)

(declare-fun +!1687 (ListLongMap!7523 tuple2!8610) ListLongMap!7523)

(assert (=> b!468980 (= (+!1687 lt!212311 lt!212316) (+!1687 (+!1687 lt!212311 (tuple2!8611 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212316))))

(declare-fun minValueAfter!38 () V!18445)

(assert (=> b!468980 (= lt!212316 (tuple2!8611 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13709 0))(
  ( (Unit!13710) )
))
(declare-fun lt!212315 () Unit!13709)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!100 (ListLongMap!7523 (_ BitVec 64) V!18445 V!18445) Unit!13709)

(assert (=> b!468980 (= lt!212315 (addSameAsAddTwiceSameKeyDiffValues!100 lt!212311 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18445)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212313 () ListLongMap!7523)

(declare-fun getCurrentListMap!2201 (array!29783 array!29785 (_ BitVec 32) (_ BitVec 32) V!18445 V!18445 (_ BitVec 32) Int) ListLongMap!7523)

(assert (=> b!468980 (= lt!212313 (getCurrentListMap!2201 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212312 () ListLongMap!7523)

(assert (=> b!468980 (= lt!212312 (getCurrentListMap!2201 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468981 () Bool)

(declare-fun tp_is_empty!13005 () Bool)

(assert (=> b!468981 (= e!274554 tp_is_empty!13005)))

(declare-fun res!280271 () Bool)

(assert (=> start!42004 (=> (not res!280271) (not e!274557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42004 (= res!280271 (validMask!0 mask!1365))))

(assert (=> start!42004 e!274557))

(assert (=> start!42004 tp_is_empty!13005))

(assert (=> start!42004 tp!40746))

(assert (=> start!42004 true))

(declare-fun array_inv!10334 (array!29783) Bool)

(assert (=> start!42004 (array_inv!10334 _keys!1025)))

(declare-fun e!274555 () Bool)

(declare-fun array_inv!10335 (array!29785) Bool)

(assert (=> start!42004 (and (array_inv!10335 _values!833) e!274555)))

(declare-fun b!468982 () Bool)

(declare-fun e!274559 () Bool)

(assert (=> b!468982 (= e!274559 tp_is_empty!13005)))

(declare-fun b!468983 () Bool)

(declare-fun res!280270 () Bool)

(assert (=> b!468983 (=> (not res!280270) (not e!274557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29783 (_ BitVec 32)) Bool)

(assert (=> b!468983 (= res!280270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468984 () Bool)

(assert (=> b!468984 (= e!274557 (not e!274558))))

(declare-fun res!280273 () Bool)

(assert (=> b!468984 (=> res!280273 e!274558)))

(assert (=> b!468984 (= res!280273 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212314 () ListLongMap!7523)

(assert (=> b!468984 (= lt!212311 lt!212314)))

(declare-fun lt!212317 () Unit!13709)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!126 (array!29783 array!29785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18445 V!18445 V!18445 V!18445 (_ BitVec 32) Int) Unit!13709)

(assert (=> b!468984 (= lt!212317 (lemmaNoChangeToArrayThenSameMapNoExtras!126 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1946 (array!29783 array!29785 (_ BitVec 32) (_ BitVec 32) V!18445 V!18445 (_ BitVec 32) Int) ListLongMap!7523)

(assert (=> b!468984 (= lt!212314 (getCurrentListMapNoExtraKeys!1946 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468984 (= lt!212311 (getCurrentListMapNoExtraKeys!1946 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468985 () Bool)

(assert (=> b!468985 (= e!274555 (and e!274559 mapRes!21202))))

(declare-fun condMapEmpty!21202 () Bool)

(declare-fun mapDefault!21202 () ValueCell!6159)

(assert (=> b!468985 (= condMapEmpty!21202 (= (arr!14318 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6159)) mapDefault!21202)))))

(declare-fun mapIsEmpty!21202 () Bool)

(assert (=> mapIsEmpty!21202 mapRes!21202))

(assert (= (and start!42004 res!280271) b!468979))

(assert (= (and b!468979 res!280272) b!468983))

(assert (= (and b!468983 res!280270) b!468978))

(assert (= (and b!468978 res!280274) b!468984))

(assert (= (and b!468984 (not res!280273)) b!468980))

(assert (= (and b!468985 condMapEmpty!21202) mapIsEmpty!21202))

(assert (= (and b!468985 (not condMapEmpty!21202)) mapNonEmpty!21202))

(get-info :version)

(assert (= (and mapNonEmpty!21202 ((_ is ValueCellFull!6159) mapValue!21202)) b!468981))

(assert (= (and b!468985 ((_ is ValueCellFull!6159) mapDefault!21202)) b!468982))

(assert (= start!42004 b!468985))

(declare-fun m!451051 () Bool)

(assert (=> start!42004 m!451051))

(declare-fun m!451053 () Bool)

(assert (=> start!42004 m!451053))

(declare-fun m!451055 () Bool)

(assert (=> start!42004 m!451055))

(declare-fun m!451057 () Bool)

(assert (=> b!468980 m!451057))

(declare-fun m!451059 () Bool)

(assert (=> b!468980 m!451059))

(declare-fun m!451061 () Bool)

(assert (=> b!468980 m!451061))

(declare-fun m!451063 () Bool)

(assert (=> b!468980 m!451063))

(assert (=> b!468980 m!451061))

(declare-fun m!451065 () Bool)

(assert (=> b!468980 m!451065))

(declare-fun m!451067 () Bool)

(assert (=> b!468980 m!451067))

(declare-fun m!451069 () Bool)

(assert (=> b!468983 m!451069))

(declare-fun m!451071 () Bool)

(assert (=> b!468984 m!451071))

(declare-fun m!451073 () Bool)

(assert (=> b!468984 m!451073))

(declare-fun m!451075 () Bool)

(assert (=> b!468984 m!451075))

(declare-fun m!451077 () Bool)

(assert (=> mapNonEmpty!21202 m!451077))

(declare-fun m!451079 () Bool)

(assert (=> b!468978 m!451079))

(check-sat tp_is_empty!13005 (not b!468984) (not b!468983) (not start!42004) (not b_next!11577) b_and!19975 (not b!468980) (not b!468978) (not mapNonEmpty!21202))
(check-sat b_and!19975 (not b_next!11577))
