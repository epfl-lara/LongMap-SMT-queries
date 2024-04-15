; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94234 () Bool)

(assert start!94234)

(declare-fun b_free!21625 () Bool)

(declare-fun b_next!21625 () Bool)

(assert (=> start!94234 (= b_free!21625 (not b_next!21625))))

(declare-fun tp!76312 () Bool)

(declare-fun b_and!34359 () Bool)

(assert (=> start!94234 (= tp!76312 b_and!34359)))

(declare-fun b!1065600 () Bool)

(declare-fun res!711315 () Bool)

(declare-fun e!607530 () Bool)

(assert (=> b!1065600 (=> (not res!711315) (not e!607530))))

(declare-datatypes ((array!67798 0))(
  ( (array!67799 (arr!32602 (Array (_ BitVec 32) (_ BitVec 64))) (size!33140 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67798)

(declare-datatypes ((List!22788 0))(
  ( (Nil!22785) (Cons!22784 (h!23993 (_ BitVec 64)) (t!32098 List!22788)) )
))
(declare-fun arrayNoDuplicates!0 (array!67798 (_ BitVec 32) List!22788) Bool)

(assert (=> b!1065600 (= res!711315 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22785))))

(declare-fun b!1065601 () Bool)

(declare-fun e!607527 () Bool)

(declare-fun e!607528 () Bool)

(declare-fun mapRes!39838 () Bool)

(assert (=> b!1065601 (= e!607527 (and e!607528 mapRes!39838))))

(declare-fun condMapEmpty!39838 () Bool)

(declare-datatypes ((V!39049 0))(
  ( (V!39050 (val!12768 Int)) )
))
(declare-datatypes ((ValueCell!12014 0))(
  ( (ValueCellFull!12014 (v!15379 V!39049)) (EmptyCell!12014) )
))
(declare-datatypes ((array!67800 0))(
  ( (array!67801 (arr!32603 (Array (_ BitVec 32) ValueCell!12014)) (size!33141 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67800)

(declare-fun mapDefault!39838 () ValueCell!12014)

(assert (=> b!1065601 (= condMapEmpty!39838 (= (arr!32603 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12014)) mapDefault!39838)))))

(declare-fun mapIsEmpty!39838 () Bool)

(assert (=> mapIsEmpty!39838 mapRes!39838))

(declare-fun b!1065603 () Bool)

(declare-fun res!711311 () Bool)

(assert (=> b!1065603 (=> (not res!711311) (not e!607530))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67798 (_ BitVec 32)) Bool)

(assert (=> b!1065603 (= res!711311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065604 () Bool)

(declare-fun tp_is_empty!25435 () Bool)

(assert (=> b!1065604 (= e!607528 tp_is_empty!25435)))

(declare-fun b!1065605 () Bool)

(declare-fun e!607531 () Bool)

(assert (=> b!1065605 (= e!607531 tp_is_empty!25435)))

(declare-fun b!1065606 () Bool)

(declare-fun e!607529 () Bool)

(assert (=> b!1065606 (= e!607530 (not e!607529))))

(declare-fun res!711314 () Bool)

(assert (=> b!1065606 (=> res!711314 e!607529)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065606 (= res!711314 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16242 0))(
  ( (tuple2!16243 (_1!8132 (_ BitVec 64)) (_2!8132 V!39049)) )
))
(declare-datatypes ((List!22789 0))(
  ( (Nil!22786) (Cons!22785 (h!23994 tuple2!16242) (t!32099 List!22789)) )
))
(declare-datatypes ((ListLongMap!14211 0))(
  ( (ListLongMap!14212 (toList!7121 List!22789)) )
))
(declare-fun lt!469967 () ListLongMap!14211)

(declare-fun lt!469965 () ListLongMap!14211)

(assert (=> b!1065606 (= lt!469967 lt!469965)))

(declare-fun zeroValueBefore!47 () V!39049)

(declare-datatypes ((Unit!34828 0))(
  ( (Unit!34829) )
))
(declare-fun lt!469968 () Unit!34828)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39049)

(declare-fun minValue!907 () V!39049)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!715 (array!67798 array!67800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 V!39049 V!39049 (_ BitVec 32) Int) Unit!34828)

(assert (=> b!1065606 (= lt!469968 (lemmaNoChangeToArrayThenSameMapNoExtras!715 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3721 (array!67798 array!67800 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14211)

(assert (=> b!1065606 (= lt!469965 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065606 (= lt!469967 (getCurrentListMapNoExtraKeys!3721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065602 () Bool)

(declare-fun res!711312 () Bool)

(assert (=> b!1065602 (=> (not res!711312) (not e!607530))))

(assert (=> b!1065602 (= res!711312 (and (= (size!33141 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33140 _keys!1163) (size!33141 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711313 () Bool)

(assert (=> start!94234 (=> (not res!711313) (not e!607530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94234 (= res!711313 (validMask!0 mask!1515))))

(assert (=> start!94234 e!607530))

(assert (=> start!94234 true))

(assert (=> start!94234 tp_is_empty!25435))

(declare-fun array_inv!25242 (array!67800) Bool)

(assert (=> start!94234 (and (array_inv!25242 _values!955) e!607527)))

(assert (=> start!94234 tp!76312))

(declare-fun array_inv!25243 (array!67798) Bool)

(assert (=> start!94234 (array_inv!25243 _keys!1163)))

(declare-fun mapNonEmpty!39838 () Bool)

(declare-fun tp!76313 () Bool)

(assert (=> mapNonEmpty!39838 (= mapRes!39838 (and tp!76313 e!607531))))

(declare-fun mapKey!39838 () (_ BitVec 32))

(declare-fun mapValue!39838 () ValueCell!12014)

(declare-fun mapRest!39838 () (Array (_ BitVec 32) ValueCell!12014))

(assert (=> mapNonEmpty!39838 (= (arr!32603 _values!955) (store mapRest!39838 mapKey!39838 mapValue!39838))))

(declare-fun b!1065607 () Bool)

(assert (=> b!1065607 (= e!607529 true)))

(declare-fun lt!469969 () ListLongMap!14211)

(declare-fun lt!469966 () ListLongMap!14211)

(declare-fun -!596 (ListLongMap!14211 (_ BitVec 64)) ListLongMap!14211)

(assert (=> b!1065607 (= lt!469969 (-!596 lt!469966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469962 () ListLongMap!14211)

(assert (=> b!1065607 (= (-!596 lt!469962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469967)))

(declare-fun lt!469963 () Unit!34828)

(declare-fun addThenRemoveForNewKeyIsSame!14 (ListLongMap!14211 (_ BitVec 64) V!39049) Unit!34828)

(assert (=> b!1065607 (= lt!469963 (addThenRemoveForNewKeyIsSame!14 lt!469967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469964 () ListLongMap!14211)

(assert (=> b!1065607 (and (= lt!469966 lt!469962) (= lt!469964 lt!469965))))

(declare-fun +!3162 (ListLongMap!14211 tuple2!16242) ListLongMap!14211)

(assert (=> b!1065607 (= lt!469962 (+!3162 lt!469967 (tuple2!16243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!3994 (array!67798 array!67800 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14211)

(assert (=> b!1065607 (= lt!469964 (getCurrentListMap!3994 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065607 (= lt!469966 (getCurrentListMap!3994 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94234 res!711313) b!1065602))

(assert (= (and b!1065602 res!711312) b!1065603))

(assert (= (and b!1065603 res!711311) b!1065600))

(assert (= (and b!1065600 res!711315) b!1065606))

(assert (= (and b!1065606 (not res!711314)) b!1065607))

(assert (= (and b!1065601 condMapEmpty!39838) mapIsEmpty!39838))

(assert (= (and b!1065601 (not condMapEmpty!39838)) mapNonEmpty!39838))

(get-info :version)

(assert (= (and mapNonEmpty!39838 ((_ is ValueCellFull!12014) mapValue!39838)) b!1065605))

(assert (= (and b!1065601 ((_ is ValueCellFull!12014) mapDefault!39838)) b!1065604))

(assert (= start!94234 b!1065601))

(declare-fun m!983663 () Bool)

(assert (=> b!1065607 m!983663))

(declare-fun m!983665 () Bool)

(assert (=> b!1065607 m!983665))

(declare-fun m!983667 () Bool)

(assert (=> b!1065607 m!983667))

(declare-fun m!983669 () Bool)

(assert (=> b!1065607 m!983669))

(declare-fun m!983671 () Bool)

(assert (=> b!1065607 m!983671))

(declare-fun m!983673 () Bool)

(assert (=> b!1065607 m!983673))

(declare-fun m!983675 () Bool)

(assert (=> b!1065600 m!983675))

(declare-fun m!983677 () Bool)

(assert (=> mapNonEmpty!39838 m!983677))

(declare-fun m!983679 () Bool)

(assert (=> start!94234 m!983679))

(declare-fun m!983681 () Bool)

(assert (=> start!94234 m!983681))

(declare-fun m!983683 () Bool)

(assert (=> start!94234 m!983683))

(declare-fun m!983685 () Bool)

(assert (=> b!1065603 m!983685))

(declare-fun m!983687 () Bool)

(assert (=> b!1065606 m!983687))

(declare-fun m!983689 () Bool)

(assert (=> b!1065606 m!983689))

(declare-fun m!983691 () Bool)

(assert (=> b!1065606 m!983691))

(check-sat (not b!1065606) (not b!1065603) (not b_next!21625) (not b!1065607) tp_is_empty!25435 (not start!94234) (not mapNonEmpty!39838) b_and!34359 (not b!1065600))
(check-sat b_and!34359 (not b_next!21625))
