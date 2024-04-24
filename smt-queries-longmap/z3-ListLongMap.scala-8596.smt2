; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105030 () Bool)

(assert start!105030)

(declare-fun b_free!26611 () Bool)

(declare-fun b_next!26611 () Bool)

(assert (=> start!105030 (= b_free!26611 (not b_next!26611))))

(declare-fun tp!93322 () Bool)

(declare-fun b_and!44381 () Bool)

(assert (=> start!105030 (= tp!93322 b_and!44381)))

(declare-fun b!1250610 () Bool)

(declare-fun res!833911 () Bool)

(declare-fun e!709886 () Bool)

(assert (=> b!1250610 (=> (not res!833911) (not e!709886))))

(declare-datatypes ((array!80745 0))(
  ( (array!80746 (arr!38935 (Array (_ BitVec 32) (_ BitVec 64))) (size!39472 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80745)

(declare-datatypes ((List!27656 0))(
  ( (Nil!27653) (Cons!27652 (h!28870 (_ BitVec 64)) (t!41119 List!27656)) )
))
(declare-fun arrayNoDuplicates!0 (array!80745 (_ BitVec 32) List!27656) Bool)

(assert (=> b!1250610 (= res!833911 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27653))))

(declare-fun b!1250611 () Bool)

(declare-fun res!833910 () Bool)

(assert (=> b!1250611 (=> (not res!833910) (not e!709886))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47383 0))(
  ( (V!47384 (val!15819 Int)) )
))
(declare-datatypes ((ValueCell!14993 0))(
  ( (ValueCellFull!14993 (v!18511 V!47383)) (EmptyCell!14993) )
))
(declare-datatypes ((array!80747 0))(
  ( (array!80748 (arr!38936 (Array (_ BitVec 32) ValueCell!14993)) (size!39473 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80747)

(assert (=> b!1250611 (= res!833910 (and (= (size!39473 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39472 _keys!1118) (size!39473 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250612 () Bool)

(assert (=> b!1250612 (= e!709886 (not true))))

(declare-datatypes ((tuple2!20402 0))(
  ( (tuple2!20403 (_1!10212 (_ BitVec 64)) (_2!10212 V!47383)) )
))
(declare-datatypes ((List!27657 0))(
  ( (Nil!27654) (Cons!27653 (h!28871 tuple2!20402) (t!41120 List!27657)) )
))
(declare-datatypes ((ListLongMap!18283 0))(
  ( (ListLongMap!18284 (toList!9157 List!27657)) )
))
(declare-fun lt!564158 () ListLongMap!18283)

(declare-fun lt!564157 () ListLongMap!18283)

(assert (=> b!1250612 (= lt!564158 lt!564157)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41454 0))(
  ( (Unit!41455) )
))
(declare-fun lt!564156 () Unit!41454)

(declare-fun minValueAfter!43 () V!47383)

(declare-fun zeroValue!871 () V!47383)

(declare-fun minValueBefore!43 () V!47383)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!906 (array!80745 array!80747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47383 V!47383 V!47383 V!47383 (_ BitVec 32) Int) Unit!41454)

(assert (=> b!1250612 (= lt!564156 (lemmaNoChangeToArrayThenSameMapNoExtras!906 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5592 (array!80745 array!80747 (_ BitVec 32) (_ BitVec 32) V!47383 V!47383 (_ BitVec 32) Int) ListLongMap!18283)

(assert (=> b!1250612 (= lt!564157 (getCurrentListMapNoExtraKeys!5592 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250612 (= lt!564158 (getCurrentListMapNoExtraKeys!5592 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250613 () Bool)

(declare-fun e!709885 () Bool)

(declare-fun tp_is_empty!31513 () Bool)

(assert (=> b!1250613 (= e!709885 tp_is_empty!31513)))

(declare-fun mapIsEmpty!49030 () Bool)

(declare-fun mapRes!49030 () Bool)

(assert (=> mapIsEmpty!49030 mapRes!49030))

(declare-fun b!1250614 () Bool)

(declare-fun e!709888 () Bool)

(declare-fun e!709889 () Bool)

(assert (=> b!1250614 (= e!709888 (and e!709889 mapRes!49030))))

(declare-fun condMapEmpty!49030 () Bool)

(declare-fun mapDefault!49030 () ValueCell!14993)

(assert (=> b!1250614 (= condMapEmpty!49030 (= (arr!38936 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14993)) mapDefault!49030)))))

(declare-fun mapNonEmpty!49030 () Bool)

(declare-fun tp!93323 () Bool)

(assert (=> mapNonEmpty!49030 (= mapRes!49030 (and tp!93323 e!709885))))

(declare-fun mapKey!49030 () (_ BitVec 32))

(declare-fun mapRest!49030 () (Array (_ BitVec 32) ValueCell!14993))

(declare-fun mapValue!49030 () ValueCell!14993)

(assert (=> mapNonEmpty!49030 (= (arr!38936 _values!914) (store mapRest!49030 mapKey!49030 mapValue!49030))))

(declare-fun b!1250615 () Bool)

(assert (=> b!1250615 (= e!709889 tp_is_empty!31513)))

(declare-fun res!833909 () Bool)

(assert (=> start!105030 (=> (not res!833909) (not e!709886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105030 (= res!833909 (validMask!0 mask!1466))))

(assert (=> start!105030 e!709886))

(assert (=> start!105030 true))

(assert (=> start!105030 tp!93322))

(assert (=> start!105030 tp_is_empty!31513))

(declare-fun array_inv!29819 (array!80745) Bool)

(assert (=> start!105030 (array_inv!29819 _keys!1118)))

(declare-fun array_inv!29820 (array!80747) Bool)

(assert (=> start!105030 (and (array_inv!29820 _values!914) e!709888)))

(declare-fun b!1250616 () Bool)

(declare-fun res!833908 () Bool)

(assert (=> b!1250616 (=> (not res!833908) (not e!709886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80745 (_ BitVec 32)) Bool)

(assert (=> b!1250616 (= res!833908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105030 res!833909) b!1250611))

(assert (= (and b!1250611 res!833910) b!1250616))

(assert (= (and b!1250616 res!833908) b!1250610))

(assert (= (and b!1250610 res!833911) b!1250612))

(assert (= (and b!1250614 condMapEmpty!49030) mapIsEmpty!49030))

(assert (= (and b!1250614 (not condMapEmpty!49030)) mapNonEmpty!49030))

(get-info :version)

(assert (= (and mapNonEmpty!49030 ((_ is ValueCellFull!14993) mapValue!49030)) b!1250613))

(assert (= (and b!1250614 ((_ is ValueCellFull!14993) mapDefault!49030)) b!1250615))

(assert (= start!105030 b!1250614))

(declare-fun m!1151865 () Bool)

(assert (=> b!1250610 m!1151865))

(declare-fun m!1151867 () Bool)

(assert (=> b!1250612 m!1151867))

(declare-fun m!1151869 () Bool)

(assert (=> b!1250612 m!1151869))

(declare-fun m!1151871 () Bool)

(assert (=> b!1250612 m!1151871))

(declare-fun m!1151873 () Bool)

(assert (=> b!1250616 m!1151873))

(declare-fun m!1151875 () Bool)

(assert (=> start!105030 m!1151875))

(declare-fun m!1151877 () Bool)

(assert (=> start!105030 m!1151877))

(declare-fun m!1151879 () Bool)

(assert (=> start!105030 m!1151879))

(declare-fun m!1151881 () Bool)

(assert (=> mapNonEmpty!49030 m!1151881))

(check-sat tp_is_empty!31513 (not start!105030) (not b!1250612) (not b_next!26611) (not b!1250610) (not b!1250616) (not mapNonEmpty!49030) b_and!44381)
(check-sat b_and!44381 (not b_next!26611))
