; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105140 () Bool)

(assert start!105140)

(declare-fun b_free!26707 () Bool)

(declare-fun b_next!26707 () Bool)

(assert (=> start!105140 (= b_free!26707 (not b_next!26707))))

(declare-fun tp!93613 () Bool)

(declare-fun b_and!44485 () Bool)

(assert (=> start!105140 (= tp!93613 b_and!44485)))

(declare-fun b!1251842 () Bool)

(declare-fun res!834655 () Bool)

(declare-fun e!710800 () Bool)

(assert (=> b!1251842 (=> (not res!834655) (not e!710800))))

(declare-datatypes ((array!80935 0))(
  ( (array!80936 (arr!39029 (Array (_ BitVec 32) (_ BitVec 64))) (size!39566 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80935)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80935 (_ BitVec 32)) Bool)

(assert (=> b!1251842 (= res!834655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251843 () Bool)

(declare-fun e!710799 () Bool)

(assert (=> b!1251843 (= e!710800 (not e!710799))))

(declare-fun res!834658 () Bool)

(assert (=> b!1251843 (=> res!834658 e!710799)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251843 (= res!834658 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47511 0))(
  ( (V!47512 (val!15867 Int)) )
))
(declare-datatypes ((tuple2!20482 0))(
  ( (tuple2!20483 (_1!10252 (_ BitVec 64)) (_2!10252 V!47511)) )
))
(declare-datatypes ((List!27731 0))(
  ( (Nil!27728) (Cons!27727 (h!28945 tuple2!20482) (t!41196 List!27731)) )
))
(declare-datatypes ((ListLongMap!18363 0))(
  ( (ListLongMap!18364 (toList!9197 List!27731)) )
))
(declare-fun lt!564771 () ListLongMap!18363)

(declare-fun lt!564767 () ListLongMap!18363)

(assert (=> b!1251843 (= lt!564771 lt!564767)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47511)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47511)

(declare-datatypes ((ValueCell!15041 0))(
  ( (ValueCellFull!15041 (v!18559 V!47511)) (EmptyCell!15041) )
))
(declare-datatypes ((array!80937 0))(
  ( (array!80938 (arr!39030 (Array (_ BitVec 32) ValueCell!15041)) (size!39567 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80937)

(declare-fun minValueBefore!43 () V!47511)

(declare-datatypes ((Unit!41530 0))(
  ( (Unit!41531) )
))
(declare-fun lt!564769 () Unit!41530)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!943 (array!80935 array!80937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 V!47511 V!47511 (_ BitVec 32) Int) Unit!41530)

(assert (=> b!1251843 (= lt!564769 (lemmaNoChangeToArrayThenSameMapNoExtras!943 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5629 (array!80935 array!80937 (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 (_ BitVec 32) Int) ListLongMap!18363)

(assert (=> b!1251843 (= lt!564767 (getCurrentListMapNoExtraKeys!5629 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251843 (= lt!564771 (getCurrentListMapNoExtraKeys!5629 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49177 () Bool)

(declare-fun mapRes!49177 () Bool)

(declare-fun tp!93614 () Bool)

(declare-fun e!710802 () Bool)

(assert (=> mapNonEmpty!49177 (= mapRes!49177 (and tp!93614 e!710802))))

(declare-fun mapRest!49177 () (Array (_ BitVec 32) ValueCell!15041))

(declare-fun mapKey!49177 () (_ BitVec 32))

(declare-fun mapValue!49177 () ValueCell!15041)

(assert (=> mapNonEmpty!49177 (= (arr!39030 _values!914) (store mapRest!49177 mapKey!49177 mapValue!49177))))

(declare-fun b!1251844 () Bool)

(declare-fun e!710805 () Bool)

(declare-fun e!710801 () Bool)

(assert (=> b!1251844 (= e!710805 (and e!710801 mapRes!49177))))

(declare-fun condMapEmpty!49177 () Bool)

(declare-fun mapDefault!49177 () ValueCell!15041)

(assert (=> b!1251844 (= condMapEmpty!49177 (= (arr!39030 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15041)) mapDefault!49177)))))

(declare-fun b!1251845 () Bool)

(declare-fun res!834656 () Bool)

(assert (=> b!1251845 (=> (not res!834656) (not e!710800))))

(assert (=> b!1251845 (= res!834656 (and (= (size!39567 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39566 _keys!1118) (size!39567 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251846 () Bool)

(declare-fun e!710803 () Bool)

(assert (=> b!1251846 (= e!710803 true)))

(declare-fun lt!564768 () ListLongMap!18363)

(declare-fun -!1984 (ListLongMap!18363 (_ BitVec 64)) ListLongMap!18363)

(assert (=> b!1251846 (= (-!1984 lt!564768 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564768)))

(declare-fun lt!564770 () Unit!41530)

(declare-fun removeNotPresentStillSame!94 (ListLongMap!18363 (_ BitVec 64)) Unit!41530)

(assert (=> b!1251846 (= lt!564770 (removeNotPresentStillSame!94 lt!564768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834654 () Bool)

(assert (=> start!105140 (=> (not res!834654) (not e!710800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105140 (= res!834654 (validMask!0 mask!1466))))

(assert (=> start!105140 e!710800))

(assert (=> start!105140 true))

(assert (=> start!105140 tp!93613))

(declare-fun tp_is_empty!31609 () Bool)

(assert (=> start!105140 tp_is_empty!31609))

(declare-fun array_inv!29889 (array!80935) Bool)

(assert (=> start!105140 (array_inv!29889 _keys!1118)))

(declare-fun array_inv!29890 (array!80937) Bool)

(assert (=> start!105140 (and (array_inv!29890 _values!914) e!710805)))

(declare-fun b!1251847 () Bool)

(assert (=> b!1251847 (= e!710801 tp_is_empty!31609)))

(declare-fun b!1251848 () Bool)

(declare-fun res!834659 () Bool)

(assert (=> b!1251848 (=> (not res!834659) (not e!710800))))

(declare-datatypes ((List!27732 0))(
  ( (Nil!27729) (Cons!27728 (h!28946 (_ BitVec 64)) (t!41197 List!27732)) )
))
(declare-fun arrayNoDuplicates!0 (array!80935 (_ BitVec 32) List!27732) Bool)

(assert (=> b!1251848 (= res!834659 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27729))))

(declare-fun b!1251849 () Bool)

(assert (=> b!1251849 (= e!710802 tp_is_empty!31609)))

(declare-fun mapIsEmpty!49177 () Bool)

(assert (=> mapIsEmpty!49177 mapRes!49177))

(declare-fun b!1251850 () Bool)

(assert (=> b!1251850 (= e!710799 e!710803)))

(declare-fun res!834657 () Bool)

(assert (=> b!1251850 (=> res!834657 e!710803)))

(declare-fun contains!7523 (ListLongMap!18363 (_ BitVec 64)) Bool)

(assert (=> b!1251850 (= res!834657 (contains!7523 lt!564768 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4460 (array!80935 array!80937 (_ BitVec 32) (_ BitVec 32) V!47511 V!47511 (_ BitVec 32) Int) ListLongMap!18363)

(assert (=> b!1251850 (= lt!564768 (getCurrentListMap!4460 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105140 res!834654) b!1251845))

(assert (= (and b!1251845 res!834656) b!1251842))

(assert (= (and b!1251842 res!834655) b!1251848))

(assert (= (and b!1251848 res!834659) b!1251843))

(assert (= (and b!1251843 (not res!834658)) b!1251850))

(assert (= (and b!1251850 (not res!834657)) b!1251846))

(assert (= (and b!1251844 condMapEmpty!49177) mapIsEmpty!49177))

(assert (= (and b!1251844 (not condMapEmpty!49177)) mapNonEmpty!49177))

(get-info :version)

(assert (= (and mapNonEmpty!49177 ((_ is ValueCellFull!15041) mapValue!49177)) b!1251849))

(assert (= (and b!1251844 ((_ is ValueCellFull!15041) mapDefault!49177)) b!1251847))

(assert (= start!105140 b!1251844))

(declare-fun m!1152975 () Bool)

(assert (=> start!105140 m!1152975))

(declare-fun m!1152977 () Bool)

(assert (=> start!105140 m!1152977))

(declare-fun m!1152979 () Bool)

(assert (=> start!105140 m!1152979))

(declare-fun m!1152981 () Bool)

(assert (=> mapNonEmpty!49177 m!1152981))

(declare-fun m!1152983 () Bool)

(assert (=> b!1251843 m!1152983))

(declare-fun m!1152985 () Bool)

(assert (=> b!1251843 m!1152985))

(declare-fun m!1152987 () Bool)

(assert (=> b!1251843 m!1152987))

(declare-fun m!1152989 () Bool)

(assert (=> b!1251846 m!1152989))

(declare-fun m!1152991 () Bool)

(assert (=> b!1251846 m!1152991))

(declare-fun m!1152993 () Bool)

(assert (=> b!1251850 m!1152993))

(declare-fun m!1152995 () Bool)

(assert (=> b!1251850 m!1152995))

(declare-fun m!1152997 () Bool)

(assert (=> b!1251848 m!1152997))

(declare-fun m!1152999 () Bool)

(assert (=> b!1251842 m!1152999))

(check-sat (not b!1251842) (not mapNonEmpty!49177) tp_is_empty!31609 (not b!1251848) (not b!1251843) (not b!1251850) (not b_next!26707) (not start!105140) b_and!44485 (not b!1251846))
(check-sat b_and!44485 (not b_next!26707))
