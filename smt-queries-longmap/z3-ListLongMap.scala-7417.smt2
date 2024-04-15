; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94310 () Bool)

(assert start!94310)

(declare-fun b_free!21679 () Bool)

(declare-fun b_next!21679 () Bool)

(assert (=> start!94310 (= b_free!21679 (not b_next!21679))))

(declare-fun tp!76477 () Bool)

(declare-fun b_and!34425 () Bool)

(assert (=> start!94310 (= tp!76477 b_and!34425)))

(declare-fun b!1066432 () Bool)

(declare-fun res!711799 () Bool)

(declare-fun e!608135 () Bool)

(assert (=> b!1066432 (=> (not res!711799) (not e!608135))))

(declare-datatypes ((array!67904 0))(
  ( (array!67905 (arr!32654 (Array (_ BitVec 32) (_ BitVec 64))) (size!33192 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67904)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67904 (_ BitVec 32)) Bool)

(assert (=> b!1066432 (= res!711799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066433 () Bool)

(declare-fun e!608134 () Bool)

(assert (=> b!1066433 (= e!608134 true)))

(declare-datatypes ((V!39121 0))(
  ( (V!39122 (val!12795 Int)) )
))
(declare-datatypes ((tuple2!16288 0))(
  ( (tuple2!16289 (_1!8155 (_ BitVec 64)) (_2!8155 V!39121)) )
))
(declare-datatypes ((List!22831 0))(
  ( (Nil!22828) (Cons!22827 (h!24036 tuple2!16288) (t!32143 List!22831)) )
))
(declare-datatypes ((ListLongMap!14257 0))(
  ( (ListLongMap!14258 (toList!7144 List!22831)) )
))
(declare-fun lt!470750 () ListLongMap!14257)

(declare-fun lt!470748 () ListLongMap!14257)

(declare-fun -!614 (ListLongMap!14257 (_ BitVec 64)) ListLongMap!14257)

(assert (=> b!1066433 (= lt!470750 (-!614 lt!470748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470752 () ListLongMap!14257)

(declare-fun lt!470754 () ListLongMap!14257)

(assert (=> b!1066433 (= (-!614 lt!470752 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470754)))

(declare-datatypes ((Unit!34876 0))(
  ( (Unit!34877) )
))
(declare-fun lt!470749 () Unit!34876)

(declare-fun zeroValueBefore!47 () V!39121)

(declare-fun addThenRemoveForNewKeyIsSame!32 (ListLongMap!14257 (_ BitVec 64) V!39121) Unit!34876)

(assert (=> b!1066433 (= lt!470749 (addThenRemoveForNewKeyIsSame!32 lt!470754 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470751 () ListLongMap!14257)

(declare-fun lt!470753 () ListLongMap!14257)

(assert (=> b!1066433 (and (= lt!470748 lt!470752) (= lt!470753 lt!470751))))

(declare-fun +!3180 (ListLongMap!14257 tuple2!16288) ListLongMap!14257)

(assert (=> b!1066433 (= lt!470752 (+!3180 lt!470754 (tuple2!16289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-datatypes ((ValueCell!12041 0))(
  ( (ValueCellFull!12041 (v!15407 V!39121)) (EmptyCell!12041) )
))
(declare-datatypes ((array!67906 0))(
  ( (array!67907 (arr!32655 (Array (_ BitVec 32) ValueCell!12041)) (size!33193 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67906)

(declare-fun minValue!907 () V!39121)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39121)

(declare-fun getCurrentListMap!4012 (array!67904 array!67906 (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 (_ BitVec 32) Int) ListLongMap!14257)

(assert (=> b!1066433 (= lt!470753 (getCurrentListMap!4012 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066433 (= lt!470748 (getCurrentListMap!4012 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39922 () Bool)

(declare-fun mapRes!39922 () Bool)

(assert (=> mapIsEmpty!39922 mapRes!39922))

(declare-fun b!1066434 () Bool)

(assert (=> b!1066434 (= e!608135 (not e!608134))))

(declare-fun res!711798 () Bool)

(assert (=> b!1066434 (=> res!711798 e!608134)))

(assert (=> b!1066434 (= res!711798 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066434 (= lt!470754 lt!470751)))

(declare-fun lt!470755 () Unit!34876)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!734 (array!67904 array!67906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 V!39121 V!39121 (_ BitVec 32) Int) Unit!34876)

(assert (=> b!1066434 (= lt!470755 (lemmaNoChangeToArrayThenSameMapNoExtras!734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3740 (array!67904 array!67906 (_ BitVec 32) (_ BitVec 32) V!39121 V!39121 (_ BitVec 32) Int) ListLongMap!14257)

(assert (=> b!1066434 (= lt!470751 (getCurrentListMapNoExtraKeys!3740 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066434 (= lt!470754 (getCurrentListMapNoExtraKeys!3740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711802 () Bool)

(assert (=> start!94310 (=> (not res!711802) (not e!608135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94310 (= res!711802 (validMask!0 mask!1515))))

(assert (=> start!94310 e!608135))

(assert (=> start!94310 true))

(declare-fun tp_is_empty!25489 () Bool)

(assert (=> start!94310 tp_is_empty!25489))

(declare-fun e!608136 () Bool)

(declare-fun array_inv!25278 (array!67906) Bool)

(assert (=> start!94310 (and (array_inv!25278 _values!955) e!608136)))

(assert (=> start!94310 tp!76477))

(declare-fun array_inv!25279 (array!67904) Bool)

(assert (=> start!94310 (array_inv!25279 _keys!1163)))

(declare-fun b!1066435 () Bool)

(declare-fun e!608133 () Bool)

(assert (=> b!1066435 (= e!608133 tp_is_empty!25489)))

(declare-fun b!1066436 () Bool)

(declare-fun e!608137 () Bool)

(assert (=> b!1066436 (= e!608137 tp_is_empty!25489)))

(declare-fun b!1066437 () Bool)

(assert (=> b!1066437 (= e!608136 (and e!608137 mapRes!39922))))

(declare-fun condMapEmpty!39922 () Bool)

(declare-fun mapDefault!39922 () ValueCell!12041)

(assert (=> b!1066437 (= condMapEmpty!39922 (= (arr!32655 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12041)) mapDefault!39922)))))

(declare-fun b!1066438 () Bool)

(declare-fun res!711800 () Bool)

(assert (=> b!1066438 (=> (not res!711800) (not e!608135))))

(assert (=> b!1066438 (= res!711800 (and (= (size!33193 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33192 _keys!1163) (size!33193 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066439 () Bool)

(declare-fun res!711801 () Bool)

(assert (=> b!1066439 (=> (not res!711801) (not e!608135))))

(declare-datatypes ((List!22832 0))(
  ( (Nil!22829) (Cons!22828 (h!24037 (_ BitVec 64)) (t!32144 List!22832)) )
))
(declare-fun arrayNoDuplicates!0 (array!67904 (_ BitVec 32) List!22832) Bool)

(assert (=> b!1066439 (= res!711801 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22829))))

(declare-fun mapNonEmpty!39922 () Bool)

(declare-fun tp!76478 () Bool)

(assert (=> mapNonEmpty!39922 (= mapRes!39922 (and tp!76478 e!608133))))

(declare-fun mapValue!39922 () ValueCell!12041)

(declare-fun mapRest!39922 () (Array (_ BitVec 32) ValueCell!12041))

(declare-fun mapKey!39922 () (_ BitVec 32))

(assert (=> mapNonEmpty!39922 (= (arr!32655 _values!955) (store mapRest!39922 mapKey!39922 mapValue!39922))))

(assert (= (and start!94310 res!711802) b!1066438))

(assert (= (and b!1066438 res!711800) b!1066432))

(assert (= (and b!1066432 res!711799) b!1066439))

(assert (= (and b!1066439 res!711801) b!1066434))

(assert (= (and b!1066434 (not res!711798)) b!1066433))

(assert (= (and b!1066437 condMapEmpty!39922) mapIsEmpty!39922))

(assert (= (and b!1066437 (not condMapEmpty!39922)) mapNonEmpty!39922))

(get-info :version)

(assert (= (and mapNonEmpty!39922 ((_ is ValueCellFull!12041) mapValue!39922)) b!1066435))

(assert (= (and b!1066437 ((_ is ValueCellFull!12041) mapDefault!39922)) b!1066436))

(assert (= start!94310 b!1066437))

(declare-fun m!984657 () Bool)

(assert (=> b!1066433 m!984657))

(declare-fun m!984659 () Bool)

(assert (=> b!1066433 m!984659))

(declare-fun m!984661 () Bool)

(assert (=> b!1066433 m!984661))

(declare-fun m!984663 () Bool)

(assert (=> b!1066433 m!984663))

(declare-fun m!984665 () Bool)

(assert (=> b!1066433 m!984665))

(declare-fun m!984667 () Bool)

(assert (=> b!1066433 m!984667))

(declare-fun m!984669 () Bool)

(assert (=> start!94310 m!984669))

(declare-fun m!984671 () Bool)

(assert (=> start!94310 m!984671))

(declare-fun m!984673 () Bool)

(assert (=> start!94310 m!984673))

(declare-fun m!984675 () Bool)

(assert (=> b!1066432 m!984675))

(declare-fun m!984677 () Bool)

(assert (=> b!1066434 m!984677))

(declare-fun m!984679 () Bool)

(assert (=> b!1066434 m!984679))

(declare-fun m!984681 () Bool)

(assert (=> b!1066434 m!984681))

(declare-fun m!984683 () Bool)

(assert (=> b!1066439 m!984683))

(declare-fun m!984685 () Bool)

(assert (=> mapNonEmpty!39922 m!984685))

(check-sat (not mapNonEmpty!39922) tp_is_empty!25489 b_and!34425 (not start!94310) (not b!1066432) (not b!1066439) (not b!1066434) (not b!1066433) (not b_next!21679))
(check-sat b_and!34425 (not b_next!21679))
