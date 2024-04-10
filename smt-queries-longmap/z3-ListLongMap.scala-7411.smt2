; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94282 () Bool)

(assert start!94282)

(declare-fun b_free!21645 () Bool)

(declare-fun b_next!21645 () Bool)

(assert (=> start!94282 (= b_free!21645 (not b_next!21645))))

(declare-fun tp!76376 () Bool)

(declare-fun b_and!34417 () Bool)

(assert (=> start!94282 (= tp!76376 b_and!34417)))

(declare-fun b!1066177 () Bool)

(declare-fun e!607919 () Bool)

(declare-fun e!607920 () Bool)

(declare-fun mapRes!39871 () Bool)

(assert (=> b!1066177 (= e!607919 (and e!607920 mapRes!39871))))

(declare-fun condMapEmpty!39871 () Bool)

(declare-datatypes ((V!39075 0))(
  ( (V!39076 (val!12778 Int)) )
))
(declare-datatypes ((ValueCell!12024 0))(
  ( (ValueCellFull!12024 (v!15391 V!39075)) (EmptyCell!12024) )
))
(declare-datatypes ((array!67895 0))(
  ( (array!67896 (arr!32649 (Array (_ BitVec 32) ValueCell!12024)) (size!33185 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67895)

(declare-fun mapDefault!39871 () ValueCell!12024)

(assert (=> b!1066177 (= condMapEmpty!39871 (= (arr!32649 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12024)) mapDefault!39871)))))

(declare-fun b!1066178 () Bool)

(declare-fun res!711615 () Bool)

(declare-fun e!607924 () Bool)

(assert (=> b!1066178 (=> (not res!711615) (not e!607924))))

(declare-datatypes ((array!67897 0))(
  ( (array!67898 (arr!32650 (Array (_ BitVec 32) (_ BitVec 64))) (size!33186 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67897)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67897 (_ BitVec 32)) Bool)

(assert (=> b!1066178 (= res!711615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066179 () Bool)

(declare-fun res!711614 () Bool)

(assert (=> b!1066179 (=> (not res!711614) (not e!607924))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066179 (= res!711614 (and (= (size!33185 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33186 _keys!1163) (size!33185 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39871 () Bool)

(declare-fun tp!76375 () Bool)

(declare-fun e!607922 () Bool)

(assert (=> mapNonEmpty!39871 (= mapRes!39871 (and tp!76375 e!607922))))

(declare-fun mapKey!39871 () (_ BitVec 32))

(declare-fun mapRest!39871 () (Array (_ BitVec 32) ValueCell!12024))

(declare-fun mapValue!39871 () ValueCell!12024)

(assert (=> mapNonEmpty!39871 (= (arr!32649 _values!955) (store mapRest!39871 mapKey!39871 mapValue!39871))))

(declare-fun b!1066180 () Bool)

(declare-fun res!711612 () Bool)

(assert (=> b!1066180 (=> (not res!711612) (not e!607924))))

(declare-datatypes ((List!22766 0))(
  ( (Nil!22763) (Cons!22762 (h!23971 (_ BitVec 64)) (t!32087 List!22766)) )
))
(declare-fun arrayNoDuplicates!0 (array!67897 (_ BitVec 32) List!22766) Bool)

(assert (=> b!1066180 (= res!711612 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22763))))

(declare-fun res!711616 () Bool)

(assert (=> start!94282 (=> (not res!711616) (not e!607924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94282 (= res!711616 (validMask!0 mask!1515))))

(assert (=> start!94282 e!607924))

(assert (=> start!94282 true))

(declare-fun tp_is_empty!25455 () Bool)

(assert (=> start!94282 tp_is_empty!25455))

(declare-fun array_inv!25280 (array!67895) Bool)

(assert (=> start!94282 (and (array_inv!25280 _values!955) e!607919)))

(assert (=> start!94282 tp!76376))

(declare-fun array_inv!25281 (array!67897) Bool)

(assert (=> start!94282 (array_inv!25281 _keys!1163)))

(declare-fun b!1066181 () Bool)

(assert (=> b!1066181 (= e!607920 tp_is_empty!25455)))

(declare-fun b!1066182 () Bool)

(declare-fun e!607921 () Bool)

(assert (=> b!1066182 (= e!607921 true)))

(declare-datatypes ((tuple2!16202 0))(
  ( (tuple2!16203 (_1!8112 (_ BitVec 64)) (_2!8112 V!39075)) )
))
(declare-datatypes ((List!22767 0))(
  ( (Nil!22764) (Cons!22763 (h!23972 tuple2!16202) (t!32088 List!22767)) )
))
(declare-datatypes ((ListLongMap!14171 0))(
  ( (ListLongMap!14172 (toList!7101 List!22767)) )
))
(declare-fun lt!470540 () ListLongMap!14171)

(declare-fun lt!470541 () ListLongMap!14171)

(declare-fun -!614 (ListLongMap!14171 (_ BitVec 64)) ListLongMap!14171)

(assert (=> b!1066182 (= lt!470540 (-!614 lt!470541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470545 () ListLongMap!14171)

(declare-fun lt!470542 () ListLongMap!14171)

(assert (=> b!1066182 (= (-!614 lt!470545 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470542)))

(declare-datatypes ((Unit!34997 0))(
  ( (Unit!34998) )
))
(declare-fun lt!470547 () Unit!34997)

(declare-fun zeroValueBefore!47 () V!39075)

(declare-fun addThenRemoveForNewKeyIsSame!23 (ListLongMap!14171 (_ BitVec 64) V!39075) Unit!34997)

(assert (=> b!1066182 (= lt!470547 (addThenRemoveForNewKeyIsSame!23 lt!470542 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470544 () ListLongMap!14171)

(declare-fun lt!470543 () ListLongMap!14171)

(assert (=> b!1066182 (and (= lt!470541 lt!470545) (= lt!470543 lt!470544))))

(declare-fun +!3145 (ListLongMap!14171 tuple2!16202) ListLongMap!14171)

(assert (=> b!1066182 (= lt!470545 (+!3145 lt!470542 (tuple2!16203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39075)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39075)

(declare-fun getCurrentListMap!4058 (array!67897 array!67895 (_ BitVec 32) (_ BitVec 32) V!39075 V!39075 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1066182 (= lt!470543 (getCurrentListMap!4058 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066182 (= lt!470541 (getCurrentListMap!4058 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39871 () Bool)

(assert (=> mapIsEmpty!39871 mapRes!39871))

(declare-fun b!1066183 () Bool)

(assert (=> b!1066183 (= e!607924 (not e!607921))))

(declare-fun res!711613 () Bool)

(assert (=> b!1066183 (=> res!711613 e!607921)))

(assert (=> b!1066183 (= res!711613 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066183 (= lt!470542 lt!470544)))

(declare-fun lt!470546 () Unit!34997)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!724 (array!67897 array!67895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39075 V!39075 V!39075 V!39075 (_ BitVec 32) Int) Unit!34997)

(assert (=> b!1066183 (= lt!470546 (lemmaNoChangeToArrayThenSameMapNoExtras!724 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3687 (array!67897 array!67895 (_ BitVec 32) (_ BitVec 32) V!39075 V!39075 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1066183 (= lt!470544 (getCurrentListMapNoExtraKeys!3687 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066183 (= lt!470542 (getCurrentListMapNoExtraKeys!3687 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066184 () Bool)

(assert (=> b!1066184 (= e!607922 tp_is_empty!25455)))

(assert (= (and start!94282 res!711616) b!1066179))

(assert (= (and b!1066179 res!711614) b!1066178))

(assert (= (and b!1066178 res!711615) b!1066180))

(assert (= (and b!1066180 res!711612) b!1066183))

(assert (= (and b!1066183 (not res!711613)) b!1066182))

(assert (= (and b!1066177 condMapEmpty!39871) mapIsEmpty!39871))

(assert (= (and b!1066177 (not condMapEmpty!39871)) mapNonEmpty!39871))

(get-info :version)

(assert (= (and mapNonEmpty!39871 ((_ is ValueCellFull!12024) mapValue!39871)) b!1066184))

(assert (= (and b!1066177 ((_ is ValueCellFull!12024) mapDefault!39871)) b!1066181))

(assert (= start!94282 b!1066177))

(declare-fun m!984773 () Bool)

(assert (=> mapNonEmpty!39871 m!984773))

(declare-fun m!984775 () Bool)

(assert (=> b!1066178 m!984775))

(declare-fun m!984777 () Bool)

(assert (=> b!1066182 m!984777))

(declare-fun m!984779 () Bool)

(assert (=> b!1066182 m!984779))

(declare-fun m!984781 () Bool)

(assert (=> b!1066182 m!984781))

(declare-fun m!984783 () Bool)

(assert (=> b!1066182 m!984783))

(declare-fun m!984785 () Bool)

(assert (=> b!1066182 m!984785))

(declare-fun m!984787 () Bool)

(assert (=> b!1066182 m!984787))

(declare-fun m!984789 () Bool)

(assert (=> start!94282 m!984789))

(declare-fun m!984791 () Bool)

(assert (=> start!94282 m!984791))

(declare-fun m!984793 () Bool)

(assert (=> start!94282 m!984793))

(declare-fun m!984795 () Bool)

(assert (=> b!1066180 m!984795))

(declare-fun m!984797 () Bool)

(assert (=> b!1066183 m!984797))

(declare-fun m!984799 () Bool)

(assert (=> b!1066183 m!984799))

(declare-fun m!984801 () Bool)

(assert (=> b!1066183 m!984801))

(check-sat (not b!1066183) (not b!1066178) (not mapNonEmpty!39871) (not b_next!21645) b_and!34417 tp_is_empty!25455 (not b!1066182) (not b!1066180) (not start!94282))
(check-sat b_and!34417 (not b_next!21645))
