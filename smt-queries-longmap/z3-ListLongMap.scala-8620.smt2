; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104988 () Bool)

(assert start!104988)

(declare-fun b_free!26757 () Bool)

(declare-fun b_next!26757 () Bool)

(assert (=> start!104988 (= b_free!26757 (not b_next!26757))))

(declare-fun tp!93766 () Bool)

(declare-fun b_and!44543 () Bool)

(assert (=> start!104988 (= tp!93766 b_and!44543)))

(declare-fun res!834646 () Bool)

(declare-fun e!710579 () Bool)

(assert (=> start!104988 (=> (not res!834646) (not e!710579))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104988 (= res!834646 (validMask!0 mask!1466))))

(assert (=> start!104988 e!710579))

(assert (=> start!104988 true))

(assert (=> start!104988 tp!93766))

(declare-fun tp_is_empty!31659 () Bool)

(assert (=> start!104988 tp_is_empty!31659))

(declare-datatypes ((array!80982 0))(
  ( (array!80983 (arr!39056 (Array (_ BitVec 32) (_ BitVec 64))) (size!39592 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80982)

(declare-fun array_inv!29793 (array!80982) Bool)

(assert (=> start!104988 (array_inv!29793 _keys!1118)))

(declare-datatypes ((V!47577 0))(
  ( (V!47578 (val!15892 Int)) )
))
(declare-datatypes ((ValueCell!15066 0))(
  ( (ValueCellFull!15066 (v!18589 V!47577)) (EmptyCell!15066) )
))
(declare-datatypes ((array!80984 0))(
  ( (array!80985 (arr!39057 (Array (_ BitVec 32) ValueCell!15066)) (size!39593 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80984)

(declare-fun e!710578 () Bool)

(declare-fun array_inv!29794 (array!80984) Bool)

(assert (=> start!104988 (and (array_inv!29794 _values!914) e!710578)))

(declare-fun b!1251369 () Bool)

(declare-fun e!710580 () Bool)

(assert (=> b!1251369 (= e!710580 tp_is_empty!31659)))

(declare-fun mapNonEmpty!49255 () Bool)

(declare-fun mapRes!49255 () Bool)

(declare-fun tp!93767 () Bool)

(declare-fun e!710582 () Bool)

(assert (=> mapNonEmpty!49255 (= mapRes!49255 (and tp!93767 e!710582))))

(declare-fun mapValue!49255 () ValueCell!15066)

(declare-fun mapRest!49255 () (Array (_ BitVec 32) ValueCell!15066))

(declare-fun mapKey!49255 () (_ BitVec 32))

(assert (=> mapNonEmpty!49255 (= (arr!39057 _values!914) (store mapRest!49255 mapKey!49255 mapValue!49255))))

(declare-fun mapIsEmpty!49255 () Bool)

(assert (=> mapIsEmpty!49255 mapRes!49255))

(declare-fun b!1251370 () Bool)

(declare-fun res!834650 () Bool)

(assert (=> b!1251370 (=> (not res!834650) (not e!710579))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251370 (= res!834650 (and (= (size!39593 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39592 _keys!1118) (size!39593 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251371 () Bool)

(declare-fun e!710577 () Bool)

(assert (=> b!1251371 (= e!710579 (not e!710577))))

(declare-fun res!834649 () Bool)

(assert (=> b!1251371 (=> res!834649 e!710577)))

(assert (=> b!1251371 (= res!834649 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20488 0))(
  ( (tuple2!20489 (_1!10255 (_ BitVec 64)) (_2!10255 V!47577)) )
))
(declare-datatypes ((List!27722 0))(
  ( (Nil!27719) (Cons!27718 (h!28927 tuple2!20488) (t!41197 List!27722)) )
))
(declare-datatypes ((ListLongMap!18361 0))(
  ( (ListLongMap!18362 (toList!9196 List!27722)) )
))
(declare-fun lt!564783 () ListLongMap!18361)

(declare-fun lt!564785 () ListLongMap!18361)

(assert (=> b!1251371 (= lt!564783 lt!564785)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47577)

(declare-fun zeroValue!871 () V!47577)

(declare-datatypes ((Unit!41579 0))(
  ( (Unit!41580) )
))
(declare-fun lt!564784 () Unit!41579)

(declare-fun minValueBefore!43 () V!47577)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!958 (array!80982 array!80984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47577 V!47577 V!47577 V!47577 (_ BitVec 32) Int) Unit!41579)

(assert (=> b!1251371 (= lt!564784 (lemmaNoChangeToArrayThenSameMapNoExtras!958 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5594 (array!80982 array!80984 (_ BitVec 32) (_ BitVec 32) V!47577 V!47577 (_ BitVec 32) Int) ListLongMap!18361)

(assert (=> b!1251371 (= lt!564785 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251371 (= lt!564783 (getCurrentListMapNoExtraKeys!5594 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251372 () Bool)

(declare-fun e!710581 () Bool)

(assert (=> b!1251372 (= e!710577 e!710581)))

(declare-fun res!834645 () Bool)

(assert (=> b!1251372 (=> res!834645 e!710581)))

(declare-fun lt!564782 () ListLongMap!18361)

(declare-fun contains!7507 (ListLongMap!18361 (_ BitVec 64)) Bool)

(assert (=> b!1251372 (= res!834645 (contains!7507 lt!564782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4467 (array!80982 array!80984 (_ BitVec 32) (_ BitVec 32) V!47577 V!47577 (_ BitVec 32) Int) ListLongMap!18361)

(assert (=> b!1251372 (= lt!564782 (getCurrentListMap!4467 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251373 () Bool)

(assert (=> b!1251373 (= e!710581 true)))

(declare-fun -!2016 (ListLongMap!18361 (_ BitVec 64)) ListLongMap!18361)

(assert (=> b!1251373 (= (-!2016 lt!564782 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564782)))

(declare-fun lt!564786 () Unit!41579)

(declare-fun removeNotPresentStillSame!111 (ListLongMap!18361 (_ BitVec 64)) Unit!41579)

(assert (=> b!1251373 (= lt!564786 (removeNotPresentStillSame!111 lt!564782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251374 () Bool)

(assert (=> b!1251374 (= e!710582 tp_is_empty!31659)))

(declare-fun b!1251375 () Bool)

(declare-fun res!834648 () Bool)

(assert (=> b!1251375 (=> (not res!834648) (not e!710579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80982 (_ BitVec 32)) Bool)

(assert (=> b!1251375 (= res!834648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251376 () Bool)

(declare-fun res!834647 () Bool)

(assert (=> b!1251376 (=> (not res!834647) (not e!710579))))

(declare-datatypes ((List!27723 0))(
  ( (Nil!27720) (Cons!27719 (h!28928 (_ BitVec 64)) (t!41198 List!27723)) )
))
(declare-fun arrayNoDuplicates!0 (array!80982 (_ BitVec 32) List!27723) Bool)

(assert (=> b!1251376 (= res!834647 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27720))))

(declare-fun b!1251377 () Bool)

(assert (=> b!1251377 (= e!710578 (and e!710580 mapRes!49255))))

(declare-fun condMapEmpty!49255 () Bool)

(declare-fun mapDefault!49255 () ValueCell!15066)

(assert (=> b!1251377 (= condMapEmpty!49255 (= (arr!39057 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15066)) mapDefault!49255)))))

(assert (= (and start!104988 res!834646) b!1251370))

(assert (= (and b!1251370 res!834650) b!1251375))

(assert (= (and b!1251375 res!834648) b!1251376))

(assert (= (and b!1251376 res!834647) b!1251371))

(assert (= (and b!1251371 (not res!834649)) b!1251372))

(assert (= (and b!1251372 (not res!834645)) b!1251373))

(assert (= (and b!1251377 condMapEmpty!49255) mapIsEmpty!49255))

(assert (= (and b!1251377 (not condMapEmpty!49255)) mapNonEmpty!49255))

(get-info :version)

(assert (= (and mapNonEmpty!49255 ((_ is ValueCellFull!15066) mapValue!49255)) b!1251374))

(assert (= (and b!1251377 ((_ is ValueCellFull!15066) mapDefault!49255)) b!1251369))

(assert (= start!104988 b!1251377))

(declare-fun m!1152139 () Bool)

(assert (=> b!1251373 m!1152139))

(declare-fun m!1152141 () Bool)

(assert (=> b!1251373 m!1152141))

(declare-fun m!1152143 () Bool)

(assert (=> b!1251375 m!1152143))

(declare-fun m!1152145 () Bool)

(assert (=> b!1251371 m!1152145))

(declare-fun m!1152147 () Bool)

(assert (=> b!1251371 m!1152147))

(declare-fun m!1152149 () Bool)

(assert (=> b!1251371 m!1152149))

(declare-fun m!1152151 () Bool)

(assert (=> start!104988 m!1152151))

(declare-fun m!1152153 () Bool)

(assert (=> start!104988 m!1152153))

(declare-fun m!1152155 () Bool)

(assert (=> start!104988 m!1152155))

(declare-fun m!1152157 () Bool)

(assert (=> mapNonEmpty!49255 m!1152157))

(declare-fun m!1152159 () Bool)

(assert (=> b!1251376 m!1152159))

(declare-fun m!1152161 () Bool)

(assert (=> b!1251372 m!1152161))

(declare-fun m!1152163 () Bool)

(assert (=> b!1251372 m!1152163))

(check-sat (not b!1251376) (not mapNonEmpty!49255) (not b!1251372) (not b!1251373) b_and!44543 tp_is_empty!31659 (not start!104988) (not b!1251375) (not b_next!26757) (not b!1251371))
(check-sat b_and!44543 (not b_next!26757))
