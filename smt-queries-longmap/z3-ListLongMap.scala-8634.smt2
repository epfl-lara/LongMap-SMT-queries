; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105330 () Bool)

(assert start!105330)

(declare-fun b_free!26839 () Bool)

(declare-fun b_next!26839 () Bool)

(assert (=> start!105330 (= b_free!26839 (not b_next!26839))))

(declare-fun tp!94019 () Bool)

(declare-fun b_and!44645 () Bool)

(assert (=> start!105330 (= tp!94019 b_and!44645)))

(declare-fun b!1253841 () Bool)

(declare-fun res!835816 () Bool)

(declare-fun e!712260 () Bool)

(assert (=> b!1253841 (=> (not res!835816) (not e!712260))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81191 0))(
  ( (array!81192 (arr!39154 (Array (_ BitVec 32) (_ BitVec 64))) (size!39691 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81191)

(declare-datatypes ((V!47687 0))(
  ( (V!47688 (val!15933 Int)) )
))
(declare-datatypes ((ValueCell!15107 0))(
  ( (ValueCellFull!15107 (v!18627 V!47687)) (EmptyCell!15107) )
))
(declare-datatypes ((array!81193 0))(
  ( (array!81194 (arr!39155 (Array (_ BitVec 32) ValueCell!15107)) (size!39692 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81193)

(assert (=> b!1253841 (= res!835816 (and (= (size!39692 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39691 _keys!1118) (size!39692 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253842 () Bool)

(declare-fun res!835815 () Bool)

(assert (=> b!1253842 (=> (not res!835815) (not e!712260))))

(declare-datatypes ((List!27818 0))(
  ( (Nil!27815) (Cons!27814 (h!29032 (_ BitVec 64)) (t!41289 List!27818)) )
))
(declare-fun arrayNoDuplicates!0 (array!81191 (_ BitVec 32) List!27818) Bool)

(assert (=> b!1253842 (= res!835815 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27815))))

(declare-fun res!835817 () Bool)

(assert (=> start!105330 (=> (not res!835817) (not e!712260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105330 (= res!835817 (validMask!0 mask!1466))))

(assert (=> start!105330 e!712260))

(assert (=> start!105330 true))

(assert (=> start!105330 tp!94019))

(declare-fun tp_is_empty!31741 () Bool)

(assert (=> start!105330 tp_is_empty!31741))

(declare-fun array_inv!29973 (array!81191) Bool)

(assert (=> start!105330 (array_inv!29973 _keys!1118)))

(declare-fun e!712258 () Bool)

(declare-fun array_inv!29974 (array!81193) Bool)

(assert (=> start!105330 (and (array_inv!29974 _values!914) e!712258)))

(declare-fun b!1253843 () Bool)

(declare-fun res!835813 () Bool)

(assert (=> b!1253843 (=> (not res!835813) (not e!712260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81191 (_ BitVec 32)) Bool)

(assert (=> b!1253843 (= res!835813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253844 () Bool)

(declare-fun e!712263 () Bool)

(assert (=> b!1253844 (= e!712260 (not e!712263))))

(declare-fun res!835814 () Bool)

(assert (=> b!1253844 (=> res!835814 e!712263)))

(assert (=> b!1253844 (= res!835814 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20574 0))(
  ( (tuple2!20575 (_1!10298 (_ BitVec 64)) (_2!10298 V!47687)) )
))
(declare-datatypes ((List!27819 0))(
  ( (Nil!27816) (Cons!27815 (h!29033 tuple2!20574) (t!41290 List!27819)) )
))
(declare-datatypes ((ListLongMap!18455 0))(
  ( (ListLongMap!18456 (toList!9243 List!27819)) )
))
(declare-fun lt!565863 () ListLongMap!18455)

(declare-fun lt!565865 () ListLongMap!18455)

(assert (=> b!1253844 (= lt!565863 lt!565865)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47687)

(declare-fun zeroValue!871 () V!47687)

(declare-fun minValueBefore!43 () V!47687)

(declare-datatypes ((Unit!41624 0))(
  ( (Unit!41625) )
))
(declare-fun lt!565866 () Unit!41624)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!984 (array!81191 array!81193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 V!47687 V!47687 (_ BitVec 32) Int) Unit!41624)

(assert (=> b!1253844 (= lt!565866 (lemmaNoChangeToArrayThenSameMapNoExtras!984 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5670 (array!81191 array!81193 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18455)

(assert (=> b!1253844 (= lt!565865 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253844 (= lt!565863 (getCurrentListMapNoExtraKeys!5670 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253845 () Bool)

(declare-fun e!712262 () Bool)

(declare-fun mapRes!49384 () Bool)

(assert (=> b!1253845 (= e!712258 (and e!712262 mapRes!49384))))

(declare-fun condMapEmpty!49384 () Bool)

(declare-fun mapDefault!49384 () ValueCell!15107)

(assert (=> b!1253845 (= condMapEmpty!49384 (= (arr!39155 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15107)) mapDefault!49384)))))

(declare-fun b!1253846 () Bool)

(assert (=> b!1253846 (= e!712263 true)))

(declare-fun lt!565864 () ListLongMap!18455)

(declare-fun getCurrentListMap!4482 (array!81191 array!81193 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18455)

(assert (=> b!1253846 (= lt!565864 (getCurrentListMap!4482 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49384 () Bool)

(declare-fun tp!94018 () Bool)

(declare-fun e!712261 () Bool)

(assert (=> mapNonEmpty!49384 (= mapRes!49384 (and tp!94018 e!712261))))

(declare-fun mapRest!49384 () (Array (_ BitVec 32) ValueCell!15107))

(declare-fun mapKey!49384 () (_ BitVec 32))

(declare-fun mapValue!49384 () ValueCell!15107)

(assert (=> mapNonEmpty!49384 (= (arr!39155 _values!914) (store mapRest!49384 mapKey!49384 mapValue!49384))))

(declare-fun mapIsEmpty!49384 () Bool)

(assert (=> mapIsEmpty!49384 mapRes!49384))

(declare-fun b!1253847 () Bool)

(assert (=> b!1253847 (= e!712261 tp_is_empty!31741)))

(declare-fun b!1253848 () Bool)

(assert (=> b!1253848 (= e!712262 tp_is_empty!31741)))

(assert (= (and start!105330 res!835817) b!1253841))

(assert (= (and b!1253841 res!835816) b!1253843))

(assert (= (and b!1253843 res!835813) b!1253842))

(assert (= (and b!1253842 res!835815) b!1253844))

(assert (= (and b!1253844 (not res!835814)) b!1253846))

(assert (= (and b!1253845 condMapEmpty!49384) mapIsEmpty!49384))

(assert (= (and b!1253845 (not condMapEmpty!49384)) mapNonEmpty!49384))

(get-info :version)

(assert (= (and mapNonEmpty!49384 ((_ is ValueCellFull!15107) mapValue!49384)) b!1253847))

(assert (= (and b!1253845 ((_ is ValueCellFull!15107) mapDefault!49384)) b!1253848))

(assert (= start!105330 b!1253845))

(declare-fun m!1154757 () Bool)

(assert (=> start!105330 m!1154757))

(declare-fun m!1154759 () Bool)

(assert (=> start!105330 m!1154759))

(declare-fun m!1154761 () Bool)

(assert (=> start!105330 m!1154761))

(declare-fun m!1154763 () Bool)

(assert (=> b!1253843 m!1154763))

(declare-fun m!1154765 () Bool)

(assert (=> b!1253846 m!1154765))

(declare-fun m!1154767 () Bool)

(assert (=> b!1253844 m!1154767))

(declare-fun m!1154769 () Bool)

(assert (=> b!1253844 m!1154769))

(declare-fun m!1154771 () Bool)

(assert (=> b!1253844 m!1154771))

(declare-fun m!1154773 () Bool)

(assert (=> b!1253842 m!1154773))

(declare-fun m!1154775 () Bool)

(assert (=> mapNonEmpty!49384 m!1154775))

(check-sat (not b!1253844) (not start!105330) (not b_next!26839) (not b!1253842) (not b!1253846) b_and!44645 (not mapNonEmpty!49384) tp_is_empty!31741 (not b!1253843))
(check-sat b_and!44645 (not b_next!26839))
