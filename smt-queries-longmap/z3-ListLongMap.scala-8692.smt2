; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105796 () Bool)

(assert start!105796)

(declare-fun b_free!27187 () Bool)

(declare-fun b_next!27187 () Bool)

(assert (=> start!105796 (= b_free!27187 (not b_next!27187))))

(declare-fun tp!95080 () Bool)

(declare-fun b_and!45055 () Bool)

(assert (=> start!105796 (= tp!95080 b_and!45055)))

(declare-fun mapIsEmpty!49924 () Bool)

(declare-fun mapRes!49924 () Bool)

(assert (=> mapIsEmpty!49924 mapRes!49924))

(declare-fun b!1258984 () Bool)

(declare-fun e!716030 () Bool)

(assert (=> b!1258984 (= e!716030 (not true))))

(declare-datatypes ((V!48151 0))(
  ( (V!48152 (val!16107 Int)) )
))
(declare-datatypes ((tuple2!20836 0))(
  ( (tuple2!20837 (_1!10429 (_ BitVec 64)) (_2!10429 V!48151)) )
))
(declare-datatypes ((List!28063 0))(
  ( (Nil!28060) (Cons!28059 (h!29277 tuple2!20836) (t!41546 List!28063)) )
))
(declare-datatypes ((ListLongMap!18717 0))(
  ( (ListLongMap!18718 (toList!9374 List!28063)) )
))
(declare-fun lt!569332 () ListLongMap!18717)

(declare-fun lt!569330 () ListLongMap!18717)

(assert (=> b!1258984 (= lt!569332 lt!569330)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41891 0))(
  ( (Unit!41892) )
))
(declare-fun lt!569331 () Unit!41891)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48151)

(declare-datatypes ((array!81857 0))(
  ( (array!81858 (arr!39481 (Array (_ BitVec 32) (_ BitVec 64))) (size!40018 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81857)

(declare-datatypes ((ValueCell!15281 0))(
  ( (ValueCellFull!15281 (v!18805 V!48151)) (EmptyCell!15281) )
))
(declare-datatypes ((array!81859 0))(
  ( (array!81860 (arr!39482 (Array (_ BitVec 32) ValueCell!15281)) (size!40019 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81859)

(declare-fun minValueBefore!43 () V!48151)

(declare-fun minValueAfter!43 () V!48151)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1104 (array!81857 array!81859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48151 V!48151 V!48151 V!48151 (_ BitVec 32) Int) Unit!41891)

(assert (=> b!1258984 (= lt!569331 (lemmaNoChangeToArrayThenSameMapNoExtras!1104 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5790 (array!81857 array!81859 (_ BitVec 32) (_ BitVec 32) V!48151 V!48151 (_ BitVec 32) Int) ListLongMap!18717)

(assert (=> b!1258984 (= lt!569330 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258984 (= lt!569332 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258985 () Bool)

(declare-fun e!716029 () Bool)

(declare-fun e!716032 () Bool)

(assert (=> b!1258985 (= e!716029 (and e!716032 mapRes!49924))))

(declare-fun condMapEmpty!49924 () Bool)

(declare-fun mapDefault!49924 () ValueCell!15281)

(assert (=> b!1258985 (= condMapEmpty!49924 (= (arr!39482 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15281)) mapDefault!49924)))))

(declare-fun res!838851 () Bool)

(assert (=> start!105796 (=> (not res!838851) (not e!716030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105796 (= res!838851 (validMask!0 mask!1466))))

(assert (=> start!105796 e!716030))

(assert (=> start!105796 true))

(assert (=> start!105796 tp!95080))

(declare-fun tp_is_empty!32089 () Bool)

(assert (=> start!105796 tp_is_empty!32089))

(declare-fun array_inv!30209 (array!81857) Bool)

(assert (=> start!105796 (array_inv!30209 _keys!1118)))

(declare-fun array_inv!30210 (array!81859) Bool)

(assert (=> start!105796 (and (array_inv!30210 _values!914) e!716029)))

(declare-fun b!1258986 () Bool)

(declare-fun res!838850 () Bool)

(assert (=> b!1258986 (=> (not res!838850) (not e!716030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81857 (_ BitVec 32)) Bool)

(assert (=> b!1258986 (= res!838850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49924 () Bool)

(declare-fun tp!95081 () Bool)

(declare-fun e!716033 () Bool)

(assert (=> mapNonEmpty!49924 (= mapRes!49924 (and tp!95081 e!716033))))

(declare-fun mapValue!49924 () ValueCell!15281)

(declare-fun mapKey!49924 () (_ BitVec 32))

(declare-fun mapRest!49924 () (Array (_ BitVec 32) ValueCell!15281))

(assert (=> mapNonEmpty!49924 (= (arr!39482 _values!914) (store mapRest!49924 mapKey!49924 mapValue!49924))))

(declare-fun b!1258987 () Bool)

(assert (=> b!1258987 (= e!716032 tp_is_empty!32089)))

(declare-fun b!1258988 () Bool)

(declare-fun res!838852 () Bool)

(assert (=> b!1258988 (=> (not res!838852) (not e!716030))))

(declare-datatypes ((List!28064 0))(
  ( (Nil!28061) (Cons!28060 (h!29278 (_ BitVec 64)) (t!41547 List!28064)) )
))
(declare-fun arrayNoDuplicates!0 (array!81857 (_ BitVec 32) List!28064) Bool)

(assert (=> b!1258988 (= res!838852 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28061))))

(declare-fun b!1258989 () Bool)

(declare-fun res!838853 () Bool)

(assert (=> b!1258989 (=> (not res!838853) (not e!716030))))

(assert (=> b!1258989 (= res!838853 (and (= (size!40019 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40018 _keys!1118) (size!40019 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258990 () Bool)

(assert (=> b!1258990 (= e!716033 tp_is_empty!32089)))

(assert (= (and start!105796 res!838851) b!1258989))

(assert (= (and b!1258989 res!838853) b!1258986))

(assert (= (and b!1258986 res!838850) b!1258988))

(assert (= (and b!1258988 res!838852) b!1258984))

(assert (= (and b!1258985 condMapEmpty!49924) mapIsEmpty!49924))

(assert (= (and b!1258985 (not condMapEmpty!49924)) mapNonEmpty!49924))

(get-info :version)

(assert (= (and mapNonEmpty!49924 ((_ is ValueCellFull!15281) mapValue!49924)) b!1258990))

(assert (= (and b!1258985 ((_ is ValueCellFull!15281) mapDefault!49924)) b!1258987))

(assert (= start!105796 b!1258985))

(declare-fun m!1159845 () Bool)

(assert (=> mapNonEmpty!49924 m!1159845))

(declare-fun m!1159847 () Bool)

(assert (=> b!1258988 m!1159847))

(declare-fun m!1159849 () Bool)

(assert (=> b!1258986 m!1159849))

(declare-fun m!1159851 () Bool)

(assert (=> start!105796 m!1159851))

(declare-fun m!1159853 () Bool)

(assert (=> start!105796 m!1159853))

(declare-fun m!1159855 () Bool)

(assert (=> start!105796 m!1159855))

(declare-fun m!1159857 () Bool)

(assert (=> b!1258984 m!1159857))

(declare-fun m!1159859 () Bool)

(assert (=> b!1258984 m!1159859))

(declare-fun m!1159861 () Bool)

(assert (=> b!1258984 m!1159861))

(check-sat (not start!105796) (not b!1258988) (not b!1258986) (not mapNonEmpty!49924) (not b_next!27187) (not b!1258984) b_and!45055 tp_is_empty!32089)
(check-sat b_and!45055 (not b_next!27187))
