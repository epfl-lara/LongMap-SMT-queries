; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105034 () Bool)

(assert start!105034)

(declare-fun b_free!26785 () Bool)

(declare-fun b_next!26785 () Bool)

(assert (=> start!105034 (= b_free!26785 (not b_next!26785))))

(declare-fun tp!93853 () Bool)

(declare-fun b_and!44563 () Bool)

(assert (=> start!105034 (= tp!93853 b_and!44563)))

(declare-fun b!1251782 () Bool)

(declare-fun res!834880 () Bool)

(declare-fun e!710886 () Bool)

(assert (=> b!1251782 (=> (not res!834880) (not e!710886))))

(declare-datatypes ((array!80961 0))(
  ( (array!80962 (arr!39045 (Array (_ BitVec 32) (_ BitVec 64))) (size!39583 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80961)

(declare-datatypes ((List!27814 0))(
  ( (Nil!27811) (Cons!27810 (h!29019 (_ BitVec 64)) (t!41282 List!27814)) )
))
(declare-fun arrayNoDuplicates!0 (array!80961 (_ BitVec 32) List!27814) Bool)

(assert (=> b!1251782 (= res!834880 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27811))))

(declare-fun b!1251783 () Bool)

(declare-fun res!834879 () Bool)

(assert (=> b!1251783 (=> (not res!834879) (not e!710886))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80961 (_ BitVec 32)) Bool)

(assert (=> b!1251783 (= res!834879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251784 () Bool)

(assert (=> b!1251784 (= e!710886 (not true))))

(declare-datatypes ((V!47615 0))(
  ( (V!47616 (val!15906 Int)) )
))
(declare-datatypes ((tuple2!20598 0))(
  ( (tuple2!20599 (_1!10310 (_ BitVec 64)) (_2!10310 V!47615)) )
))
(declare-datatypes ((List!27815 0))(
  ( (Nil!27812) (Cons!27811 (h!29020 tuple2!20598) (t!41283 List!27815)) )
))
(declare-datatypes ((ListLongMap!18471 0))(
  ( (ListLongMap!18472 (toList!9251 List!27815)) )
))
(declare-fun lt!564899 () ListLongMap!18471)

(declare-fun lt!564897 () ListLongMap!18471)

(assert (=> b!1251784 (= lt!564899 lt!564897)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47615)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47615)

(declare-datatypes ((ValueCell!15080 0))(
  ( (ValueCellFull!15080 (v!18603 V!47615)) (EmptyCell!15080) )
))
(declare-datatypes ((array!80963 0))(
  ( (array!80964 (arr!39046 (Array (_ BitVec 32) ValueCell!15080)) (size!39584 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80963)

(declare-fun minValueBefore!43 () V!47615)

(declare-datatypes ((Unit!41468 0))(
  ( (Unit!41469) )
))
(declare-fun lt!564898 () Unit!41468)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!977 (array!80961 array!80963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 V!47615 V!47615 (_ BitVec 32) Int) Unit!41468)

(assert (=> b!1251784 (= lt!564898 (lemmaNoChangeToArrayThenSameMapNoExtras!977 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5655 (array!80961 array!80963 (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 (_ BitVec 32) Int) ListLongMap!18471)

(assert (=> b!1251784 (= lt!564897 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251784 (= lt!564899 (getCurrentListMapNoExtraKeys!5655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49300 () Bool)

(declare-fun mapRes!49300 () Bool)

(assert (=> mapIsEmpty!49300 mapRes!49300))

(declare-fun res!834878 () Bool)

(assert (=> start!105034 (=> (not res!834878) (not e!710886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105034 (= res!834878 (validMask!0 mask!1466))))

(assert (=> start!105034 e!710886))

(assert (=> start!105034 true))

(assert (=> start!105034 tp!93853))

(declare-fun tp_is_empty!31687 () Bool)

(assert (=> start!105034 tp_is_empty!31687))

(declare-fun array_inv!29909 (array!80961) Bool)

(assert (=> start!105034 (array_inv!29909 _keys!1118)))

(declare-fun e!710888 () Bool)

(declare-fun array_inv!29910 (array!80963) Bool)

(assert (=> start!105034 (and (array_inv!29910 _values!914) e!710888)))

(declare-fun mapNonEmpty!49300 () Bool)

(declare-fun tp!93854 () Bool)

(declare-fun e!710887 () Bool)

(assert (=> mapNonEmpty!49300 (= mapRes!49300 (and tp!93854 e!710887))))

(declare-fun mapRest!49300 () (Array (_ BitVec 32) ValueCell!15080))

(declare-fun mapValue!49300 () ValueCell!15080)

(declare-fun mapKey!49300 () (_ BitVec 32))

(assert (=> mapNonEmpty!49300 (= (arr!39046 _values!914) (store mapRest!49300 mapKey!49300 mapValue!49300))))

(declare-fun b!1251785 () Bool)

(declare-fun e!710890 () Bool)

(assert (=> b!1251785 (= e!710888 (and e!710890 mapRes!49300))))

(declare-fun condMapEmpty!49300 () Bool)

(declare-fun mapDefault!49300 () ValueCell!15080)

(assert (=> b!1251785 (= condMapEmpty!49300 (= (arr!39046 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15080)) mapDefault!49300)))))

(declare-fun b!1251786 () Bool)

(assert (=> b!1251786 (= e!710890 tp_is_empty!31687)))

(declare-fun b!1251787 () Bool)

(assert (=> b!1251787 (= e!710887 tp_is_empty!31687)))

(declare-fun b!1251788 () Bool)

(declare-fun res!834881 () Bool)

(assert (=> b!1251788 (=> (not res!834881) (not e!710886))))

(assert (=> b!1251788 (= res!834881 (and (= (size!39584 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39583 _keys!1118) (size!39584 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105034 res!834878) b!1251788))

(assert (= (and b!1251788 res!834881) b!1251783))

(assert (= (and b!1251783 res!834879) b!1251782))

(assert (= (and b!1251782 res!834880) b!1251784))

(assert (= (and b!1251785 condMapEmpty!49300) mapIsEmpty!49300))

(assert (= (and b!1251785 (not condMapEmpty!49300)) mapNonEmpty!49300))

(get-info :version)

(assert (= (and mapNonEmpty!49300 ((_ is ValueCellFull!15080) mapValue!49300)) b!1251787))

(assert (= (and b!1251785 ((_ is ValueCellFull!15080) mapDefault!49300)) b!1251786))

(assert (= start!105034 b!1251785))

(declare-fun m!1152061 () Bool)

(assert (=> mapNonEmpty!49300 m!1152061))

(declare-fun m!1152063 () Bool)

(assert (=> b!1251782 m!1152063))

(declare-fun m!1152065 () Bool)

(assert (=> start!105034 m!1152065))

(declare-fun m!1152067 () Bool)

(assert (=> start!105034 m!1152067))

(declare-fun m!1152069 () Bool)

(assert (=> start!105034 m!1152069))

(declare-fun m!1152071 () Bool)

(assert (=> b!1251783 m!1152071))

(declare-fun m!1152073 () Bool)

(assert (=> b!1251784 m!1152073))

(declare-fun m!1152075 () Bool)

(assert (=> b!1251784 m!1152075))

(declare-fun m!1152077 () Bool)

(assert (=> b!1251784 m!1152077))

(check-sat (not start!105034) (not b!1251784) b_and!44563 (not mapNonEmpty!49300) (not b_next!26785) tp_is_empty!31687 (not b!1251782) (not b!1251783))
(check-sat b_and!44563 (not b_next!26785))
