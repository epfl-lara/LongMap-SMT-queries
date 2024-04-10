; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94276 () Bool)

(assert start!94276)

(declare-fun b_free!21639 () Bool)

(declare-fun b_next!21639 () Bool)

(assert (=> start!94276 (= b_free!21639 (not b_next!21639))))

(declare-fun tp!76358 () Bool)

(declare-fun b_and!34411 () Bool)

(assert (=> start!94276 (= tp!76358 b_and!34411)))

(declare-fun b!1066105 () Bool)

(declare-fun res!711571 () Bool)

(declare-fun e!607869 () Bool)

(assert (=> b!1066105 (=> (not res!711571) (not e!607869))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39067 0))(
  ( (V!39068 (val!12775 Int)) )
))
(declare-datatypes ((ValueCell!12021 0))(
  ( (ValueCellFull!12021 (v!15388 V!39067)) (EmptyCell!12021) )
))
(declare-datatypes ((array!67883 0))(
  ( (array!67884 (arr!32643 (Array (_ BitVec 32) ValueCell!12021)) (size!33179 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67883)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67885 0))(
  ( (array!67886 (arr!32644 (Array (_ BitVec 32) (_ BitVec 64))) (size!33180 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67885)

(assert (=> b!1066105 (= res!711571 (and (= (size!33179 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33180 _keys!1163) (size!33179 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711569 () Bool)

(assert (=> start!94276 (=> (not res!711569) (not e!607869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94276 (= res!711569 (validMask!0 mask!1515))))

(assert (=> start!94276 e!607869))

(assert (=> start!94276 true))

(declare-fun tp_is_empty!25449 () Bool)

(assert (=> start!94276 tp_is_empty!25449))

(declare-fun e!607870 () Bool)

(declare-fun array_inv!25274 (array!67883) Bool)

(assert (=> start!94276 (and (array_inv!25274 _values!955) e!607870)))

(assert (=> start!94276 tp!76358))

(declare-fun array_inv!25275 (array!67885) Bool)

(assert (=> start!94276 (array_inv!25275 _keys!1163)))

(declare-fun b!1066106 () Bool)

(declare-fun e!607866 () Bool)

(assert (=> b!1066106 (= e!607866 true)))

(declare-datatypes ((tuple2!16198 0))(
  ( (tuple2!16199 (_1!8110 (_ BitVec 64)) (_2!8110 V!39067)) )
))
(declare-datatypes ((List!22762 0))(
  ( (Nil!22759) (Cons!22758 (h!23967 tuple2!16198) (t!32083 List!22762)) )
))
(declare-datatypes ((ListLongMap!14167 0))(
  ( (ListLongMap!14168 (toList!7099 List!22762)) )
))
(declare-fun lt!470472 () ListLongMap!14167)

(declare-fun lt!470470 () ListLongMap!14167)

(declare-fun -!612 (ListLongMap!14167 (_ BitVec 64)) ListLongMap!14167)

(assert (=> b!1066106 (= lt!470472 (-!612 lt!470470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470471 () ListLongMap!14167)

(declare-fun lt!470473 () ListLongMap!14167)

(assert (=> b!1066106 (= (-!612 lt!470471 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470473)))

(declare-datatypes ((Unit!34993 0))(
  ( (Unit!34994) )
))
(declare-fun lt!470474 () Unit!34993)

(declare-fun zeroValueBefore!47 () V!39067)

(declare-fun addThenRemoveForNewKeyIsSame!21 (ListLongMap!14167 (_ BitVec 64) V!39067) Unit!34993)

(assert (=> b!1066106 (= lt!470474 (addThenRemoveForNewKeyIsSame!21 lt!470473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470475 () ListLongMap!14167)

(declare-fun lt!470468 () ListLongMap!14167)

(assert (=> b!1066106 (and (= lt!470470 lt!470471) (= lt!470475 lt!470468))))

(declare-fun +!3143 (ListLongMap!14167 tuple2!16198) ListLongMap!14167)

(assert (=> b!1066106 (= lt!470471 (+!3143 lt!470473 (tuple2!16199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39067)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39067)

(declare-fun getCurrentListMap!4056 (array!67885 array!67883 (_ BitVec 32) (_ BitVec 32) V!39067 V!39067 (_ BitVec 32) Int) ListLongMap!14167)

(assert (=> b!1066106 (= lt!470475 (getCurrentListMap!4056 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066106 (= lt!470470 (getCurrentListMap!4056 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066107 () Bool)

(declare-fun res!711570 () Bool)

(assert (=> b!1066107 (=> (not res!711570) (not e!607869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67885 (_ BitVec 32)) Bool)

(assert (=> b!1066107 (= res!711570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39862 () Bool)

(declare-fun mapRes!39862 () Bool)

(declare-fun tp!76357 () Bool)

(declare-fun e!607868 () Bool)

(assert (=> mapNonEmpty!39862 (= mapRes!39862 (and tp!76357 e!607868))))

(declare-fun mapRest!39862 () (Array (_ BitVec 32) ValueCell!12021))

(declare-fun mapKey!39862 () (_ BitVec 32))

(declare-fun mapValue!39862 () ValueCell!12021)

(assert (=> mapNonEmpty!39862 (= (arr!32643 _values!955) (store mapRest!39862 mapKey!39862 mapValue!39862))))

(declare-fun b!1066108 () Bool)

(assert (=> b!1066108 (= e!607869 (not e!607866))))

(declare-fun res!711568 () Bool)

(assert (=> b!1066108 (=> res!711568 e!607866)))

(assert (=> b!1066108 (= res!711568 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066108 (= lt!470473 lt!470468)))

(declare-fun lt!470469 () Unit!34993)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!722 (array!67885 array!67883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39067 V!39067 V!39067 V!39067 (_ BitVec 32) Int) Unit!34993)

(assert (=> b!1066108 (= lt!470469 (lemmaNoChangeToArrayThenSameMapNoExtras!722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3685 (array!67885 array!67883 (_ BitVec 32) (_ BitVec 32) V!39067 V!39067 (_ BitVec 32) Int) ListLongMap!14167)

(assert (=> b!1066108 (= lt!470468 (getCurrentListMapNoExtraKeys!3685 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066108 (= lt!470473 (getCurrentListMapNoExtraKeys!3685 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066109 () Bool)

(assert (=> b!1066109 (= e!607868 tp_is_empty!25449)))

(declare-fun mapIsEmpty!39862 () Bool)

(assert (=> mapIsEmpty!39862 mapRes!39862))

(declare-fun b!1066110 () Bool)

(declare-fun res!711567 () Bool)

(assert (=> b!1066110 (=> (not res!711567) (not e!607869))))

(declare-datatypes ((List!22763 0))(
  ( (Nil!22760) (Cons!22759 (h!23968 (_ BitVec 64)) (t!32084 List!22763)) )
))
(declare-fun arrayNoDuplicates!0 (array!67885 (_ BitVec 32) List!22763) Bool)

(assert (=> b!1066110 (= res!711567 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22760))))

(declare-fun b!1066111 () Bool)

(declare-fun e!607865 () Bool)

(assert (=> b!1066111 (= e!607870 (and e!607865 mapRes!39862))))

(declare-fun condMapEmpty!39862 () Bool)

(declare-fun mapDefault!39862 () ValueCell!12021)

(assert (=> b!1066111 (= condMapEmpty!39862 (= (arr!32643 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12021)) mapDefault!39862)))))

(declare-fun b!1066112 () Bool)

(assert (=> b!1066112 (= e!607865 tp_is_empty!25449)))

(assert (= (and start!94276 res!711569) b!1066105))

(assert (= (and b!1066105 res!711571) b!1066107))

(assert (= (and b!1066107 res!711570) b!1066110))

(assert (= (and b!1066110 res!711567) b!1066108))

(assert (= (and b!1066108 (not res!711568)) b!1066106))

(assert (= (and b!1066111 condMapEmpty!39862) mapIsEmpty!39862))

(assert (= (and b!1066111 (not condMapEmpty!39862)) mapNonEmpty!39862))

(get-info :version)

(assert (= (and mapNonEmpty!39862 ((_ is ValueCellFull!12021) mapValue!39862)) b!1066109))

(assert (= (and b!1066111 ((_ is ValueCellFull!12021) mapDefault!39862)) b!1066112))

(assert (= start!94276 b!1066111))

(declare-fun m!984683 () Bool)

(assert (=> start!94276 m!984683))

(declare-fun m!984685 () Bool)

(assert (=> start!94276 m!984685))

(declare-fun m!984687 () Bool)

(assert (=> start!94276 m!984687))

(declare-fun m!984689 () Bool)

(assert (=> b!1066108 m!984689))

(declare-fun m!984691 () Bool)

(assert (=> b!1066108 m!984691))

(declare-fun m!984693 () Bool)

(assert (=> b!1066108 m!984693))

(declare-fun m!984695 () Bool)

(assert (=> b!1066106 m!984695))

(declare-fun m!984697 () Bool)

(assert (=> b!1066106 m!984697))

(declare-fun m!984699 () Bool)

(assert (=> b!1066106 m!984699))

(declare-fun m!984701 () Bool)

(assert (=> b!1066106 m!984701))

(declare-fun m!984703 () Bool)

(assert (=> b!1066106 m!984703))

(declare-fun m!984705 () Bool)

(assert (=> b!1066106 m!984705))

(declare-fun m!984707 () Bool)

(assert (=> b!1066107 m!984707))

(declare-fun m!984709 () Bool)

(assert (=> b!1066110 m!984709))

(declare-fun m!984711 () Bool)

(assert (=> mapNonEmpty!39862 m!984711))

(check-sat (not b!1066106) tp_is_empty!25449 (not b!1066108) (not mapNonEmpty!39862) (not start!94276) (not b!1066110) b_and!34411 (not b!1066107) (not b_next!21639))
(check-sat b_and!34411 (not b_next!21639))
