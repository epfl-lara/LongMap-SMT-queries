; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105776 () Bool)

(assert start!105776)

(declare-fun b_free!27339 () Bool)

(declare-fun b_next!27339 () Bool)

(assert (=> start!105776 (= b_free!27339 (not b_next!27339))))

(declare-fun tp!95545 () Bool)

(declare-fun b_and!45235 () Bool)

(assert (=> start!105776 (= tp!95545 b_and!45235)))

(declare-fun mapIsEmpty!50161 () Bool)

(declare-fun mapRes!50161 () Bool)

(assert (=> mapIsEmpty!50161 mapRes!50161))

(declare-fun b!1259985 () Bool)

(declare-fun e!716885 () Bool)

(declare-fun tp_is_empty!32241 () Bool)

(assert (=> b!1259985 (= e!716885 tp_is_empty!32241)))

(declare-fun b!1259986 () Bool)

(declare-fun e!716883 () Bool)

(declare-fun e!716887 () Bool)

(assert (=> b!1259986 (= e!716883 (not e!716887))))

(declare-fun res!839706 () Bool)

(assert (=> b!1259986 (=> res!839706 e!716887)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259986 (= res!839706 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48353 0))(
  ( (V!48354 (val!16183 Int)) )
))
(declare-datatypes ((tuple2!20926 0))(
  ( (tuple2!20927 (_1!10474 (_ BitVec 64)) (_2!10474 V!48353)) )
))
(declare-datatypes ((List!28128 0))(
  ( (Nil!28125) (Cons!28124 (h!29333 tuple2!20926) (t!41625 List!28128)) )
))
(declare-datatypes ((ListLongMap!18799 0))(
  ( (ListLongMap!18800 (toList!9415 List!28128)) )
))
(declare-fun lt!570615 () ListLongMap!18799)

(declare-fun lt!570620 () ListLongMap!18799)

(assert (=> b!1259986 (= lt!570615 lt!570620)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48353)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48353)

(declare-datatypes ((Unit!42015 0))(
  ( (Unit!42016) )
))
(declare-fun lt!570621 () Unit!42015)

(declare-datatypes ((array!82100 0))(
  ( (array!82101 (arr!39604 (Array (_ BitVec 32) (_ BitVec 64))) (size!40140 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82100)

(declare-datatypes ((ValueCell!15357 0))(
  ( (ValueCellFull!15357 (v!18886 V!48353)) (EmptyCell!15357) )
))
(declare-datatypes ((array!82102 0))(
  ( (array!82103 (arr!39605 (Array (_ BitVec 32) ValueCell!15357)) (size!40141 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82102)

(declare-fun minValueBefore!43 () V!48353)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1154 (array!82100 array!82102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48353 V!48353 V!48353 V!48353 (_ BitVec 32) Int) Unit!42015)

(assert (=> b!1259986 (= lt!570621 (lemmaNoChangeToArrayThenSameMapNoExtras!1154 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5790 (array!82100 array!82102 (_ BitVec 32) (_ BitVec 32) V!48353 V!48353 (_ BitVec 32) Int) ListLongMap!18799)

(assert (=> b!1259986 (= lt!570620 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259986 (= lt!570615 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259987 () Bool)

(assert (=> b!1259987 (= e!716887 true)))

(declare-fun lt!570622 () ListLongMap!18799)

(declare-fun lt!570613 () ListLongMap!18799)

(declare-fun -!2121 (ListLongMap!18799 (_ BitVec 64)) ListLongMap!18799)

(assert (=> b!1259987 (= lt!570622 (-!2121 lt!570613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570617 () ListLongMap!18799)

(declare-fun lt!570616 () ListLongMap!18799)

(assert (=> b!1259987 (= (-!2121 lt!570617 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570616)))

(declare-fun lt!570619 () Unit!42015)

(declare-fun addThenRemoveForNewKeyIsSame!358 (ListLongMap!18799 (_ BitVec 64) V!48353) Unit!42015)

(assert (=> b!1259987 (= lt!570619 (addThenRemoveForNewKeyIsSame!358 lt!570616 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716884 () Bool)

(assert (=> b!1259987 e!716884))

(declare-fun res!839709 () Bool)

(assert (=> b!1259987 (=> (not res!839709) (not e!716884))))

(assert (=> b!1259987 (= res!839709 (= lt!570613 lt!570617))))

(declare-fun +!4219 (ListLongMap!18799 tuple2!20926) ListLongMap!18799)

(assert (=> b!1259987 (= lt!570617 (+!4219 lt!570616 (tuple2!20927 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570618 () tuple2!20926)

(assert (=> b!1259987 (= lt!570616 (+!4219 lt!570615 lt!570618))))

(assert (=> b!1259987 (= lt!570618 (tuple2!20927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570614 () ListLongMap!18799)

(declare-fun getCurrentListMap!4612 (array!82100 array!82102 (_ BitVec 32) (_ BitVec 32) V!48353 V!48353 (_ BitVec 32) Int) ListLongMap!18799)

(assert (=> b!1259987 (= lt!570614 (getCurrentListMap!4612 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259987 (= lt!570613 (getCurrentListMap!4612 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50161 () Bool)

(declare-fun tp!95546 () Bool)

(declare-fun e!716886 () Bool)

(assert (=> mapNonEmpty!50161 (= mapRes!50161 (and tp!95546 e!716886))))

(declare-fun mapRest!50161 () (Array (_ BitVec 32) ValueCell!15357))

(declare-fun mapValue!50161 () ValueCell!15357)

(declare-fun mapKey!50161 () (_ BitVec 32))

(assert (=> mapNonEmpty!50161 (= (arr!39605 _values!914) (store mapRest!50161 mapKey!50161 mapValue!50161))))

(declare-fun b!1259988 () Bool)

(declare-fun res!839710 () Bool)

(assert (=> b!1259988 (=> (not res!839710) (not e!716883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82100 (_ BitVec 32)) Bool)

(assert (=> b!1259988 (= res!839710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!839708 () Bool)

(assert (=> start!105776 (=> (not res!839708) (not e!716883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105776 (= res!839708 (validMask!0 mask!1466))))

(assert (=> start!105776 e!716883))

(assert (=> start!105776 true))

(assert (=> start!105776 tp!95545))

(assert (=> start!105776 tp_is_empty!32241))

(declare-fun array_inv!30151 (array!82100) Bool)

(assert (=> start!105776 (array_inv!30151 _keys!1118)))

(declare-fun e!716881 () Bool)

(declare-fun array_inv!30152 (array!82102) Bool)

(assert (=> start!105776 (and (array_inv!30152 _values!914) e!716881)))

(declare-fun b!1259989 () Bool)

(assert (=> b!1259989 (= e!716881 (and e!716885 mapRes!50161))))

(declare-fun condMapEmpty!50161 () Bool)

(declare-fun mapDefault!50161 () ValueCell!15357)

(assert (=> b!1259989 (= condMapEmpty!50161 (= (arr!39605 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15357)) mapDefault!50161)))))

(declare-fun b!1259990 () Bool)

(declare-fun res!839707 () Bool)

(assert (=> b!1259990 (=> (not res!839707) (not e!716883))))

(assert (=> b!1259990 (= res!839707 (and (= (size!40141 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40140 _keys!1118) (size!40141 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259991 () Bool)

(assert (=> b!1259991 (= e!716884 (= lt!570614 (+!4219 lt!570620 lt!570618)))))

(declare-fun b!1259992 () Bool)

(declare-fun res!839711 () Bool)

(assert (=> b!1259992 (=> (not res!839711) (not e!716883))))

(declare-datatypes ((List!28129 0))(
  ( (Nil!28126) (Cons!28125 (h!29334 (_ BitVec 64)) (t!41626 List!28129)) )
))
(declare-fun arrayNoDuplicates!0 (array!82100 (_ BitVec 32) List!28129) Bool)

(assert (=> b!1259992 (= res!839711 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28126))))

(declare-fun b!1259993 () Bool)

(assert (=> b!1259993 (= e!716886 tp_is_empty!32241)))

(assert (= (and start!105776 res!839708) b!1259990))

(assert (= (and b!1259990 res!839707) b!1259988))

(assert (= (and b!1259988 res!839710) b!1259992))

(assert (= (and b!1259992 res!839711) b!1259986))

(assert (= (and b!1259986 (not res!839706)) b!1259987))

(assert (= (and b!1259987 res!839709) b!1259991))

(assert (= (and b!1259989 condMapEmpty!50161) mapIsEmpty!50161))

(assert (= (and b!1259989 (not condMapEmpty!50161)) mapNonEmpty!50161))

(get-info :version)

(assert (= (and mapNonEmpty!50161 ((_ is ValueCellFull!15357) mapValue!50161)) b!1259993))

(assert (= (and b!1259989 ((_ is ValueCellFull!15357) mapDefault!50161)) b!1259985))

(assert (= start!105776 b!1259989))

(declare-fun m!1160573 () Bool)

(assert (=> b!1259986 m!1160573))

(declare-fun m!1160575 () Bool)

(assert (=> b!1259986 m!1160575))

(declare-fun m!1160577 () Bool)

(assert (=> b!1259986 m!1160577))

(declare-fun m!1160579 () Bool)

(assert (=> mapNonEmpty!50161 m!1160579))

(declare-fun m!1160581 () Bool)

(assert (=> b!1259991 m!1160581))

(declare-fun m!1160583 () Bool)

(assert (=> start!105776 m!1160583))

(declare-fun m!1160585 () Bool)

(assert (=> start!105776 m!1160585))

(declare-fun m!1160587 () Bool)

(assert (=> start!105776 m!1160587))

(declare-fun m!1160589 () Bool)

(assert (=> b!1259992 m!1160589))

(declare-fun m!1160591 () Bool)

(assert (=> b!1259988 m!1160591))

(declare-fun m!1160593 () Bool)

(assert (=> b!1259987 m!1160593))

(declare-fun m!1160595 () Bool)

(assert (=> b!1259987 m!1160595))

(declare-fun m!1160597 () Bool)

(assert (=> b!1259987 m!1160597))

(declare-fun m!1160599 () Bool)

(assert (=> b!1259987 m!1160599))

(declare-fun m!1160601 () Bool)

(assert (=> b!1259987 m!1160601))

(declare-fun m!1160603 () Bool)

(assert (=> b!1259987 m!1160603))

(declare-fun m!1160605 () Bool)

(assert (=> b!1259987 m!1160605))

(check-sat (not b!1259986) (not mapNonEmpty!50161) tp_is_empty!32241 (not b_next!27339) (not start!105776) (not b!1259987) (not b!1259988) (not b!1259991) b_and!45235 (not b!1259992))
(check-sat b_and!45235 (not b_next!27339))
