; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42396 () Bool)

(assert start!42396)

(declare-fun b_free!11871 () Bool)

(declare-fun b_next!11871 () Bool)

(assert (=> start!42396 (= b_free!11871 (not b_next!11871))))

(declare-fun tp!41646 () Bool)

(declare-fun b_and!20327 () Bool)

(assert (=> start!42396 (= tp!41646 b_and!20327)))

(declare-fun b!473024 () Bool)

(declare-fun e!277441 () Bool)

(declare-fun e!277443 () Bool)

(assert (=> b!473024 (= e!277441 (not e!277443))))

(declare-fun res!282537 () Bool)

(assert (=> b!473024 (=> res!282537 e!277443)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473024 (= res!282537 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18837 0))(
  ( (V!18838 (val!6694 Int)) )
))
(declare-datatypes ((tuple2!8818 0))(
  ( (tuple2!8819 (_1!4420 (_ BitVec 64)) (_2!4420 V!18837)) )
))
(declare-datatypes ((List!8902 0))(
  ( (Nil!8899) (Cons!8898 (h!9754 tuple2!8818) (t!14872 List!8902)) )
))
(declare-datatypes ((ListLongMap!7731 0))(
  ( (ListLongMap!7732 (toList!3881 List!8902)) )
))
(declare-fun lt!214728 () ListLongMap!7731)

(declare-fun lt!214730 () ListLongMap!7731)

(assert (=> b!473024 (= lt!214728 lt!214730)))

(declare-datatypes ((Unit!13918 0))(
  ( (Unit!13919) )
))
(declare-fun lt!214731 () Unit!13918)

(declare-fun minValueBefore!38 () V!18837)

(declare-fun zeroValue!794 () V!18837)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30357 0))(
  ( (array!30358 (arr!14598 (Array (_ BitVec 32) (_ BitVec 64))) (size!14950 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30357)

(declare-datatypes ((ValueCell!6306 0))(
  ( (ValueCellFull!6306 (v!8985 V!18837)) (EmptyCell!6306) )
))
(declare-datatypes ((array!30359 0))(
  ( (array!30360 (arr!14599 (Array (_ BitVec 32) ValueCell!6306)) (size!14951 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30359)

(declare-fun minValueAfter!38 () V!18837)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!221 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18837 V!18837 V!18837 V!18837 (_ BitVec 32) Int) Unit!13918)

(assert (=> b!473024 (= lt!214731 (lemmaNoChangeToArrayThenSameMapNoExtras!221 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2041 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) V!18837 V!18837 (_ BitVec 32) Int) ListLongMap!7731)

(assert (=> b!473024 (= lt!214730 (getCurrentListMapNoExtraKeys!2041 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473024 (= lt!214728 (getCurrentListMapNoExtraKeys!2041 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473025 () Bool)

(declare-fun e!277442 () Bool)

(declare-fun tp_is_empty!13299 () Bool)

(assert (=> b!473025 (= e!277442 tp_is_empty!13299)))

(declare-fun b!473027 () Bool)

(declare-fun e!277445 () Bool)

(assert (=> b!473027 (= e!277445 tp_is_empty!13299)))

(declare-fun b!473028 () Bool)

(declare-fun res!282541 () Bool)

(assert (=> b!473028 (=> (not res!282541) (not e!277441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30357 (_ BitVec 32)) Bool)

(assert (=> b!473028 (= res!282541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473029 () Bool)

(declare-fun e!277444 () Bool)

(declare-fun mapRes!21661 () Bool)

(assert (=> b!473029 (= e!277444 (and e!277445 mapRes!21661))))

(declare-fun condMapEmpty!21661 () Bool)

(declare-fun mapDefault!21661 () ValueCell!6306)

(assert (=> b!473029 (= condMapEmpty!21661 (= (arr!14599 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6306)) mapDefault!21661)))))

(declare-fun b!473030 () Bool)

(declare-fun res!282538 () Bool)

(assert (=> b!473030 (=> (not res!282538) (not e!277441))))

(declare-datatypes ((List!8903 0))(
  ( (Nil!8900) (Cons!8899 (h!9755 (_ BitVec 64)) (t!14873 List!8903)) )
))
(declare-fun arrayNoDuplicates!0 (array!30357 (_ BitVec 32) List!8903) Bool)

(assert (=> b!473030 (= res!282538 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8900))))

(declare-fun mapIsEmpty!21661 () Bool)

(assert (=> mapIsEmpty!21661 mapRes!21661))

(declare-fun b!473031 () Bool)

(declare-fun res!282540 () Bool)

(assert (=> b!473031 (=> (not res!282540) (not e!277441))))

(assert (=> b!473031 (= res!282540 (and (= (size!14951 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14950 _keys!1025) (size!14951 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21661 () Bool)

(declare-fun tp!41647 () Bool)

(assert (=> mapNonEmpty!21661 (= mapRes!21661 (and tp!41647 e!277442))))

(declare-fun mapValue!21661 () ValueCell!6306)

(declare-fun mapKey!21661 () (_ BitVec 32))

(declare-fun mapRest!21661 () (Array (_ BitVec 32) ValueCell!6306))

(assert (=> mapNonEmpty!21661 (= (arr!14599 _values!833) (store mapRest!21661 mapKey!21661 mapValue!21661))))

(declare-fun res!282539 () Bool)

(assert (=> start!42396 (=> (not res!282539) (not e!277441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42396 (= res!282539 (validMask!0 mask!1365))))

(assert (=> start!42396 e!277441))

(assert (=> start!42396 tp_is_empty!13299))

(assert (=> start!42396 tp!41646))

(assert (=> start!42396 true))

(declare-fun array_inv!10528 (array!30357) Bool)

(assert (=> start!42396 (array_inv!10528 _keys!1025)))

(declare-fun array_inv!10529 (array!30359) Bool)

(assert (=> start!42396 (and (array_inv!10529 _values!833) e!277444)))

(declare-fun b!473026 () Bool)

(assert (=> b!473026 (= e!277443 true)))

(declare-fun lt!214727 () ListLongMap!7731)

(declare-fun lt!214726 () tuple2!8818)

(declare-fun +!1721 (ListLongMap!7731 tuple2!8818) ListLongMap!7731)

(assert (=> b!473026 (= (+!1721 lt!214727 lt!214726) (+!1721 (+!1721 lt!214727 (tuple2!8819 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214726))))

(assert (=> b!473026 (= lt!214726 (tuple2!8819 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214729 () Unit!13918)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!130 (ListLongMap!7731 (_ BitVec 64) V!18837 V!18837) Unit!13918)

(assert (=> b!473026 (= lt!214729 (addSameAsAddTwiceSameKeyDiffValues!130 lt!214727 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473026 (= lt!214727 (+!1721 lt!214728 (tuple2!8819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214732 () ListLongMap!7731)

(declare-fun getCurrentListMap!2250 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) V!18837 V!18837 (_ BitVec 32) Int) ListLongMap!7731)

(assert (=> b!473026 (= lt!214732 (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214725 () ListLongMap!7731)

(assert (=> b!473026 (= lt!214725 (getCurrentListMap!2250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42396 res!282539) b!473031))

(assert (= (and b!473031 res!282540) b!473028))

(assert (= (and b!473028 res!282541) b!473030))

(assert (= (and b!473030 res!282538) b!473024))

(assert (= (and b!473024 (not res!282537)) b!473026))

(assert (= (and b!473029 condMapEmpty!21661) mapIsEmpty!21661))

(assert (= (and b!473029 (not condMapEmpty!21661)) mapNonEmpty!21661))

(get-info :version)

(assert (= (and mapNonEmpty!21661 ((_ is ValueCellFull!6306) mapValue!21661)) b!473025))

(assert (= (and b!473029 ((_ is ValueCellFull!6306) mapDefault!21661)) b!473027))

(assert (= start!42396 b!473029))

(declare-fun m!454937 () Bool)

(assert (=> b!473030 m!454937))

(declare-fun m!454939 () Bool)

(assert (=> b!473026 m!454939))

(declare-fun m!454941 () Bool)

(assert (=> b!473026 m!454941))

(declare-fun m!454943 () Bool)

(assert (=> b!473026 m!454943))

(declare-fun m!454945 () Bool)

(assert (=> b!473026 m!454945))

(declare-fun m!454947 () Bool)

(assert (=> b!473026 m!454947))

(assert (=> b!473026 m!454943))

(declare-fun m!454949 () Bool)

(assert (=> b!473026 m!454949))

(declare-fun m!454951 () Bool)

(assert (=> b!473026 m!454951))

(declare-fun m!454953 () Bool)

(assert (=> mapNonEmpty!21661 m!454953))

(declare-fun m!454955 () Bool)

(assert (=> b!473028 m!454955))

(declare-fun m!454957 () Bool)

(assert (=> start!42396 m!454957))

(declare-fun m!454959 () Bool)

(assert (=> start!42396 m!454959))

(declare-fun m!454961 () Bool)

(assert (=> start!42396 m!454961))

(declare-fun m!454963 () Bool)

(assert (=> b!473024 m!454963))

(declare-fun m!454965 () Bool)

(assert (=> b!473024 m!454965))

(declare-fun m!454967 () Bool)

(assert (=> b!473024 m!454967))

(check-sat b_and!20327 (not b_next!11871) (not b!473026) (not start!42396) (not mapNonEmpty!21661) (not b!473024) (not b!473028) (not b!473030) tp_is_empty!13299)
(check-sat b_and!20327 (not b_next!11871))
