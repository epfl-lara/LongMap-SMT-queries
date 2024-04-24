; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94452 () Bool)

(assert start!94452)

(declare-fun b_free!21601 () Bool)

(declare-fun b_next!21601 () Bool)

(assert (=> start!94452 (= b_free!21601 (not b_next!21601))))

(declare-fun tp!76240 () Bool)

(declare-fun b_and!34371 () Bool)

(assert (=> start!94452 (= tp!76240 b_and!34371)))

(declare-fun b!1066792 () Bool)

(declare-fun res!711724 () Bool)

(declare-fun e!608263 () Bool)

(assert (=> b!1066792 (=> (not res!711724) (not e!608263))))

(declare-datatypes ((array!67857 0))(
  ( (array!67858 (arr!32625 (Array (_ BitVec 32) (_ BitVec 64))) (size!33162 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67857)

(declare-datatypes ((List!22721 0))(
  ( (Nil!22718) (Cons!22717 (h!23935 (_ BitVec 64)) (t!32032 List!22721)) )
))
(declare-fun arrayNoDuplicates!0 (array!67857 (_ BitVec 32) List!22721) Bool)

(assert (=> b!1066792 (= res!711724 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22718))))

(declare-fun b!1066793 () Bool)

(declare-fun e!608262 () Bool)

(declare-fun tp_is_empty!25411 () Bool)

(assert (=> b!1066793 (= e!608262 tp_is_empty!25411)))

(declare-fun b!1066794 () Bool)

(declare-fun e!608260 () Bool)

(declare-fun mapRes!39802 () Bool)

(assert (=> b!1066794 (= e!608260 (and e!608262 mapRes!39802))))

(declare-fun condMapEmpty!39802 () Bool)

(declare-datatypes ((V!39017 0))(
  ( (V!39018 (val!12756 Int)) )
))
(declare-datatypes ((ValueCell!12002 0))(
  ( (ValueCellFull!12002 (v!15364 V!39017)) (EmptyCell!12002) )
))
(declare-datatypes ((array!67859 0))(
  ( (array!67860 (arr!32626 (Array (_ BitVec 32) ValueCell!12002)) (size!33163 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67859)

(declare-fun mapDefault!39802 () ValueCell!12002)

(assert (=> b!1066794 (= condMapEmpty!39802 (= (arr!32626 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12002)) mapDefault!39802)))))

(declare-fun b!1066795 () Bool)

(declare-fun res!711725 () Bool)

(assert (=> b!1066795 (=> (not res!711725) (not e!608263))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066795 (= res!711725 (and (= (size!33163 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33162 _keys!1163) (size!33163 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066796 () Bool)

(declare-fun e!608261 () Bool)

(assert (=> b!1066796 (= e!608261 true)))

(declare-datatypes ((tuple2!16150 0))(
  ( (tuple2!16151 (_1!8086 (_ BitVec 64)) (_2!8086 V!39017)) )
))
(declare-datatypes ((List!22722 0))(
  ( (Nil!22719) (Cons!22718 (h!23936 tuple2!16150) (t!32033 List!22722)) )
))
(declare-datatypes ((ListLongMap!14127 0))(
  ( (ListLongMap!14128 (toList!7079 List!22722)) )
))
(declare-fun lt!470396 () ListLongMap!14127)

(declare-fun lt!470394 () ListLongMap!14127)

(declare-fun -!599 (ListLongMap!14127 (_ BitVec 64)) ListLongMap!14127)

(assert (=> b!1066796 (= lt!470396 (-!599 lt!470394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470395 () ListLongMap!14127)

(declare-fun lt!470389 () ListLongMap!14127)

(assert (=> b!1066796 (= (-!599 lt!470395 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470389)))

(declare-datatypes ((Unit!34952 0))(
  ( (Unit!34953) )
))
(declare-fun lt!470390 () Unit!34952)

(declare-fun zeroValueBefore!47 () V!39017)

(declare-fun addThenRemoveForNewKeyIsSame!9 (ListLongMap!14127 (_ BitVec 64) V!39017) Unit!34952)

(assert (=> b!1066796 (= lt!470390 (addThenRemoveForNewKeyIsSame!9 lt!470389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470393 () ListLongMap!14127)

(declare-fun lt!470392 () ListLongMap!14127)

(assert (=> b!1066796 (and (= lt!470394 lt!470395) (= lt!470392 lt!470393))))

(declare-fun +!3152 (ListLongMap!14127 tuple2!16150) ListLongMap!14127)

(assert (=> b!1066796 (= lt!470395 (+!3152 lt!470389 (tuple2!16151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39017)

(declare-fun minValue!907 () V!39017)

(declare-fun getCurrentListMap!4033 (array!67857 array!67859 (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 (_ BitVec 32) Int) ListLongMap!14127)

(assert (=> b!1066796 (= lt!470392 (getCurrentListMap!4033 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066796 (= lt!470394 (getCurrentListMap!4033 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066797 () Bool)

(declare-fun res!711723 () Bool)

(assert (=> b!1066797 (=> (not res!711723) (not e!608263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67857 (_ BitVec 32)) Bool)

(assert (=> b!1066797 (= res!711723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39802 () Bool)

(assert (=> mapIsEmpty!39802 mapRes!39802))

(declare-fun res!711726 () Bool)

(assert (=> start!94452 (=> (not res!711726) (not e!608263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94452 (= res!711726 (validMask!0 mask!1515))))

(assert (=> start!94452 e!608263))

(assert (=> start!94452 true))

(assert (=> start!94452 tp_is_empty!25411))

(declare-fun array_inv!25288 (array!67859) Bool)

(assert (=> start!94452 (and (array_inv!25288 _values!955) e!608260)))

(assert (=> start!94452 tp!76240))

(declare-fun array_inv!25289 (array!67857) Bool)

(assert (=> start!94452 (array_inv!25289 _keys!1163)))

(declare-fun b!1066798 () Bool)

(assert (=> b!1066798 (= e!608263 (not e!608261))))

(declare-fun res!711722 () Bool)

(assert (=> b!1066798 (=> res!711722 e!608261)))

(assert (=> b!1066798 (= res!711722 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066798 (= lt!470389 lt!470393)))

(declare-fun lt!470391 () Unit!34952)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!709 (array!67857 array!67859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 V!39017 V!39017 (_ BitVec 32) Int) Unit!34952)

(assert (=> b!1066798 (= lt!470391 (lemmaNoChangeToArrayThenSameMapNoExtras!709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3706 (array!67857 array!67859 (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 (_ BitVec 32) Int) ListLongMap!14127)

(assert (=> b!1066798 (= lt!470393 (getCurrentListMapNoExtraKeys!3706 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066798 (= lt!470389 (getCurrentListMapNoExtraKeys!3706 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066799 () Bool)

(declare-fun e!608264 () Bool)

(assert (=> b!1066799 (= e!608264 tp_is_empty!25411)))

(declare-fun mapNonEmpty!39802 () Bool)

(declare-fun tp!76241 () Bool)

(assert (=> mapNonEmpty!39802 (= mapRes!39802 (and tp!76241 e!608264))))

(declare-fun mapValue!39802 () ValueCell!12002)

(declare-fun mapKey!39802 () (_ BitVec 32))

(declare-fun mapRest!39802 () (Array (_ BitVec 32) ValueCell!12002))

(assert (=> mapNonEmpty!39802 (= (arr!32626 _values!955) (store mapRest!39802 mapKey!39802 mapValue!39802))))

(assert (= (and start!94452 res!711726) b!1066795))

(assert (= (and b!1066795 res!711725) b!1066797))

(assert (= (and b!1066797 res!711723) b!1066792))

(assert (= (and b!1066792 res!711724) b!1066798))

(assert (= (and b!1066798 (not res!711722)) b!1066796))

(assert (= (and b!1066794 condMapEmpty!39802) mapIsEmpty!39802))

(assert (= (and b!1066794 (not condMapEmpty!39802)) mapNonEmpty!39802))

(get-info :version)

(assert (= (and mapNonEmpty!39802 ((_ is ValueCellFull!12002) mapValue!39802)) b!1066799))

(assert (= (and b!1066794 ((_ is ValueCellFull!12002) mapDefault!39802)) b!1066793))

(assert (= start!94452 b!1066794))

(declare-fun m!985601 () Bool)

(assert (=> mapNonEmpty!39802 m!985601))

(declare-fun m!985603 () Bool)

(assert (=> b!1066792 m!985603))

(declare-fun m!985605 () Bool)

(assert (=> b!1066796 m!985605))

(declare-fun m!985607 () Bool)

(assert (=> b!1066796 m!985607))

(declare-fun m!985609 () Bool)

(assert (=> b!1066796 m!985609))

(declare-fun m!985611 () Bool)

(assert (=> b!1066796 m!985611))

(declare-fun m!985613 () Bool)

(assert (=> b!1066796 m!985613))

(declare-fun m!985615 () Bool)

(assert (=> b!1066796 m!985615))

(declare-fun m!985617 () Bool)

(assert (=> b!1066797 m!985617))

(declare-fun m!985619 () Bool)

(assert (=> start!94452 m!985619))

(declare-fun m!985621 () Bool)

(assert (=> start!94452 m!985621))

(declare-fun m!985623 () Bool)

(assert (=> start!94452 m!985623))

(declare-fun m!985625 () Bool)

(assert (=> b!1066798 m!985625))

(declare-fun m!985627 () Bool)

(assert (=> b!1066798 m!985627))

(declare-fun m!985629 () Bool)

(assert (=> b!1066798 m!985629))

(check-sat b_and!34371 (not b!1066797) (not b!1066792) (not b!1066798) (not mapNonEmpty!39802) (not b_next!21601) (not b!1066796) tp_is_empty!25411 (not start!94452))
(check-sat b_and!34371 (not b_next!21601))
