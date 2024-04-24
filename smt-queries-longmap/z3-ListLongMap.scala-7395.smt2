; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94382 () Bool)

(assert start!94382)

(declare-fun b_free!21547 () Bool)

(declare-fun b_next!21547 () Bool)

(assert (=> start!94382 (= b_free!21547 (not b_next!21547))))

(declare-fun tp!76075 () Bool)

(declare-fun b_and!34307 () Bool)

(assert (=> start!94382 (= tp!76075 b_and!34307)))

(declare-fun mapIsEmpty!39718 () Bool)

(declare-fun mapRes!39718 () Bool)

(assert (=> mapIsEmpty!39718 mapRes!39718))

(declare-fun b!1065987 () Bool)

(declare-fun e!607675 () Bool)

(declare-fun tp_is_empty!25357 () Bool)

(assert (=> b!1065987 (= e!607675 tp_is_empty!25357)))

(declare-fun b!1065988 () Bool)

(declare-fun res!711252 () Bool)

(declare-fun e!607671 () Bool)

(assert (=> b!1065988 (=> (not res!711252) (not e!607671))))

(declare-datatypes ((array!67759 0))(
  ( (array!67760 (arr!32577 (Array (_ BitVec 32) (_ BitVec 64))) (size!33114 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67759)

(declare-datatypes ((List!22688 0))(
  ( (Nil!22685) (Cons!22684 (h!23902 (_ BitVec 64)) (t!31997 List!22688)) )
))
(declare-fun arrayNoDuplicates!0 (array!67759 (_ BitVec 32) List!22688) Bool)

(assert (=> b!1065988 (= res!711252 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22685))))

(declare-fun res!711250 () Bool)

(assert (=> start!94382 (=> (not res!711250) (not e!607671))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94382 (= res!711250 (validMask!0 mask!1515))))

(assert (=> start!94382 e!607671))

(assert (=> start!94382 true))

(assert (=> start!94382 tp_is_empty!25357))

(declare-datatypes ((V!38945 0))(
  ( (V!38946 (val!12729 Int)) )
))
(declare-datatypes ((ValueCell!11975 0))(
  ( (ValueCellFull!11975 (v!15337 V!38945)) (EmptyCell!11975) )
))
(declare-datatypes ((array!67761 0))(
  ( (array!67762 (arr!32578 (Array (_ BitVec 32) ValueCell!11975)) (size!33115 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67761)

(declare-fun e!607673 () Bool)

(declare-fun array_inv!25252 (array!67761) Bool)

(assert (=> start!94382 (and (array_inv!25252 _values!955) e!607673)))

(assert (=> start!94382 tp!76075))

(declare-fun array_inv!25253 (array!67759) Bool)

(assert (=> start!94382 (array_inv!25253 _keys!1163)))

(declare-fun b!1065989 () Bool)

(declare-fun e!607670 () Bool)

(assert (=> b!1065989 (= e!607670 true)))

(declare-fun zeroValueBefore!47 () V!38945)

(declare-datatypes ((tuple2!16114 0))(
  ( (tuple2!16115 (_1!8068 (_ BitVec 64)) (_2!8068 V!38945)) )
))
(declare-datatypes ((List!22689 0))(
  ( (Nil!22686) (Cons!22685 (h!23903 tuple2!16114) (t!31998 List!22689)) )
))
(declare-datatypes ((ListLongMap!14091 0))(
  ( (ListLongMap!14092 (toList!7061 List!22689)) )
))
(declare-fun lt!469826 () ListLongMap!14091)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38945)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4015 (array!67759 array!67761 (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 (_ BitVec 32) Int) ListLongMap!14091)

(assert (=> b!1065989 (= lt!469826 (getCurrentListMap!4015 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39718 () Bool)

(declare-fun tp!76076 () Bool)

(assert (=> mapNonEmpty!39718 (= mapRes!39718 (and tp!76076 e!607675))))

(declare-fun mapRest!39718 () (Array (_ BitVec 32) ValueCell!11975))

(declare-fun mapValue!39718 () ValueCell!11975)

(declare-fun mapKey!39718 () (_ BitVec 32))

(assert (=> mapNonEmpty!39718 (= (arr!32578 _values!955) (store mapRest!39718 mapKey!39718 mapValue!39718))))

(declare-fun b!1065990 () Bool)

(assert (=> b!1065990 (= e!607671 (not e!607670))))

(declare-fun res!711253 () Bool)

(assert (=> b!1065990 (=> res!711253 e!607670)))

(assert (=> b!1065990 (= res!711253 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469827 () ListLongMap!14091)

(declare-fun lt!469828 () ListLongMap!14091)

(assert (=> b!1065990 (= lt!469827 lt!469828)))

(declare-datatypes ((Unit!34917 0))(
  ( (Unit!34918) )
))
(declare-fun lt!469825 () Unit!34917)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38945)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!694 (array!67759 array!67761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 V!38945 V!38945 (_ BitVec 32) Int) Unit!34917)

(assert (=> b!1065990 (= lt!469825 (lemmaNoChangeToArrayThenSameMapNoExtras!694 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3691 (array!67759 array!67761 (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 (_ BitVec 32) Int) ListLongMap!14091)

(assert (=> b!1065990 (= lt!469828 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065990 (= lt!469827 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065991 () Bool)

(declare-fun res!711251 () Bool)

(assert (=> b!1065991 (=> (not res!711251) (not e!607671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67759 (_ BitVec 32)) Bool)

(assert (=> b!1065991 (= res!711251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065992 () Bool)

(declare-fun res!711254 () Bool)

(assert (=> b!1065992 (=> (not res!711254) (not e!607671))))

(assert (=> b!1065992 (= res!711254 (and (= (size!33115 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33114 _keys!1163) (size!33115 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065993 () Bool)

(declare-fun e!607674 () Bool)

(assert (=> b!1065993 (= e!607674 tp_is_empty!25357)))

(declare-fun b!1065994 () Bool)

(assert (=> b!1065994 (= e!607673 (and e!607674 mapRes!39718))))

(declare-fun condMapEmpty!39718 () Bool)

(declare-fun mapDefault!39718 () ValueCell!11975)

(assert (=> b!1065994 (= condMapEmpty!39718 (= (arr!32578 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11975)) mapDefault!39718)))))

(assert (= (and start!94382 res!711250) b!1065992))

(assert (= (and b!1065992 res!711254) b!1065991))

(assert (= (and b!1065991 res!711251) b!1065988))

(assert (= (and b!1065988 res!711252) b!1065990))

(assert (= (and b!1065990 (not res!711253)) b!1065989))

(assert (= (and b!1065994 condMapEmpty!39718) mapIsEmpty!39718))

(assert (= (and b!1065994 (not condMapEmpty!39718)) mapNonEmpty!39718))

(get-info :version)

(assert (= (and mapNonEmpty!39718 ((_ is ValueCellFull!11975) mapValue!39718)) b!1065987))

(assert (= (and b!1065994 ((_ is ValueCellFull!11975) mapDefault!39718)) b!1065993))

(assert (= start!94382 b!1065994))

(declare-fun m!984841 () Bool)

(assert (=> b!1065989 m!984841))

(declare-fun m!984843 () Bool)

(assert (=> mapNonEmpty!39718 m!984843))

(declare-fun m!984845 () Bool)

(assert (=> b!1065988 m!984845))

(declare-fun m!984847 () Bool)

(assert (=> start!94382 m!984847))

(declare-fun m!984849 () Bool)

(assert (=> start!94382 m!984849))

(declare-fun m!984851 () Bool)

(assert (=> start!94382 m!984851))

(declare-fun m!984853 () Bool)

(assert (=> b!1065991 m!984853))

(declare-fun m!984855 () Bool)

(assert (=> b!1065990 m!984855))

(declare-fun m!984857 () Bool)

(assert (=> b!1065990 m!984857))

(declare-fun m!984859 () Bool)

(assert (=> b!1065990 m!984859))

(check-sat (not b!1065989) (not b!1065991) (not b_next!21547) b_and!34307 (not b!1065990) tp_is_empty!25357 (not mapNonEmpty!39718) (not start!94382) (not b!1065988))
(check-sat b_and!34307 (not b_next!21547))
