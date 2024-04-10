; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94538 () Bool)

(assert start!94538)

(declare-fun b_free!21843 () Bool)

(declare-fun b_next!21843 () Bool)

(assert (=> start!94538 (= b_free!21843 (not b_next!21843))))

(declare-fun tp!76978 () Bool)

(declare-fun b_and!34645 () Bool)

(assert (=> start!94538 (= tp!76978 b_and!34645)))

(declare-fun b!1069038 () Bool)

(declare-fun res!713335 () Bool)

(declare-fun e!610034 () Bool)

(assert (=> b!1069038 (=> (not res!713335) (not e!610034))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39339 0))(
  ( (V!39340 (val!12877 Int)) )
))
(declare-datatypes ((ValueCell!12123 0))(
  ( (ValueCellFull!12123 (v!15492 V!39339)) (EmptyCell!12123) )
))
(declare-datatypes ((array!68283 0))(
  ( (array!68284 (arr!32840 (Array (_ BitVec 32) ValueCell!12123)) (size!33376 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68283)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68285 0))(
  ( (array!68286 (arr!32841 (Array (_ BitVec 32) (_ BitVec 64))) (size!33377 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68285)

(assert (=> b!1069038 (= res!713335 (and (= (size!33376 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33377 _keys!1163) (size!33376 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069039 () Bool)

(declare-fun e!610035 () Bool)

(declare-fun tp_is_empty!25653 () Bool)

(assert (=> b!1069039 (= e!610035 tp_is_empty!25653)))

(declare-fun b!1069040 () Bool)

(declare-fun e!610037 () Bool)

(assert (=> b!1069040 (= e!610037 true)))

(declare-datatypes ((tuple2!16362 0))(
  ( (tuple2!16363 (_1!8192 (_ BitVec 64)) (_2!8192 V!39339)) )
))
(declare-datatypes ((List!22908 0))(
  ( (Nil!22905) (Cons!22904 (h!24113 tuple2!16362) (t!32235 List!22908)) )
))
(declare-datatypes ((ListLongMap!14331 0))(
  ( (ListLongMap!14332 (toList!7181 List!22908)) )
))
(declare-fun lt!472357 () ListLongMap!14331)

(declare-fun -!660 (ListLongMap!14331 (_ BitVec 64)) ListLongMap!14331)

(assert (=> b!1069040 (= (-!660 lt!472357 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472357)))

(declare-datatypes ((Unit!35159 0))(
  ( (Unit!35160) )
))
(declare-fun lt!472359 () Unit!35159)

(declare-fun removeNotPresentStillSame!70 (ListLongMap!14331 (_ BitVec 64)) Unit!35159)

(assert (=> b!1069040 (= lt!472359 (removeNotPresentStillSame!70 lt!472357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40177 () Bool)

(declare-fun mapRes!40177 () Bool)

(assert (=> mapIsEmpty!40177 mapRes!40177))

(declare-fun b!1069041 () Bool)

(declare-fun res!713330 () Bool)

(assert (=> b!1069041 (=> (not res!713330) (not e!610034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68285 (_ BitVec 32)) Bool)

(assert (=> b!1069041 (= res!713330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069042 () Bool)

(declare-fun e!610040 () Bool)

(declare-fun e!610036 () Bool)

(assert (=> b!1069042 (= e!610040 (and e!610036 mapRes!40177))))

(declare-fun condMapEmpty!40177 () Bool)

(declare-fun mapDefault!40177 () ValueCell!12123)

(assert (=> b!1069042 (= condMapEmpty!40177 (= (arr!32840 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12123)) mapDefault!40177)))))

(declare-fun res!713334 () Bool)

(assert (=> start!94538 (=> (not res!713334) (not e!610034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94538 (= res!713334 (validMask!0 mask!1515))))

(assert (=> start!94538 e!610034))

(assert (=> start!94538 true))

(assert (=> start!94538 tp_is_empty!25653))

(declare-fun array_inv!25418 (array!68283) Bool)

(assert (=> start!94538 (and (array_inv!25418 _values!955) e!610040)))

(assert (=> start!94538 tp!76978))

(declare-fun array_inv!25419 (array!68285) Bool)

(assert (=> start!94538 (array_inv!25419 _keys!1163)))

(declare-fun b!1069043 () Bool)

(declare-fun e!610039 () Bool)

(assert (=> b!1069043 (= e!610039 e!610037)))

(declare-fun res!713332 () Bool)

(assert (=> b!1069043 (=> res!713332 e!610037)))

(declare-fun contains!6309 (ListLongMap!14331 (_ BitVec 64)) Bool)

(assert (=> b!1069043 (= res!713332 (contains!6309 lt!472357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39339)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39339)

(declare-fun getCurrentListMap!4105 (array!68285 array!68283 (_ BitVec 32) (_ BitVec 32) V!39339 V!39339 (_ BitVec 32) Int) ListLongMap!14331)

(assert (=> b!1069043 (= lt!472357 (getCurrentListMap!4105 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40177 () Bool)

(declare-fun tp!76979 () Bool)

(assert (=> mapNonEmpty!40177 (= mapRes!40177 (and tp!76979 e!610035))))

(declare-fun mapKey!40177 () (_ BitVec 32))

(declare-fun mapRest!40177 () (Array (_ BitVec 32) ValueCell!12123))

(declare-fun mapValue!40177 () ValueCell!12123)

(assert (=> mapNonEmpty!40177 (= (arr!32840 _values!955) (store mapRest!40177 mapKey!40177 mapValue!40177))))

(declare-fun b!1069044 () Bool)

(assert (=> b!1069044 (= e!610034 (not e!610039))))

(declare-fun res!713331 () Bool)

(assert (=> b!1069044 (=> res!713331 e!610039)))

(assert (=> b!1069044 (= res!713331 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472361 () ListLongMap!14331)

(declare-fun lt!472360 () ListLongMap!14331)

(assert (=> b!1069044 (= lt!472361 lt!472360)))

(declare-fun lt!472358 () Unit!35159)

(declare-fun zeroValueAfter!47 () V!39339)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!794 (array!68285 array!68283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39339 V!39339 V!39339 V!39339 (_ BitVec 32) Int) Unit!35159)

(assert (=> b!1069044 (= lt!472358 (lemmaNoChangeToArrayThenSameMapNoExtras!794 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3757 (array!68285 array!68283 (_ BitVec 32) (_ BitVec 32) V!39339 V!39339 (_ BitVec 32) Int) ListLongMap!14331)

(assert (=> b!1069044 (= lt!472360 (getCurrentListMapNoExtraKeys!3757 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069044 (= lt!472361 (getCurrentListMapNoExtraKeys!3757 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069045 () Bool)

(assert (=> b!1069045 (= e!610036 tp_is_empty!25653)))

(declare-fun b!1069046 () Bool)

(declare-fun res!713333 () Bool)

(assert (=> b!1069046 (=> (not res!713333) (not e!610034))))

(declare-datatypes ((List!22909 0))(
  ( (Nil!22906) (Cons!22905 (h!24114 (_ BitVec 64)) (t!32236 List!22909)) )
))
(declare-fun arrayNoDuplicates!0 (array!68285 (_ BitVec 32) List!22909) Bool)

(assert (=> b!1069046 (= res!713333 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22906))))

(assert (= (and start!94538 res!713334) b!1069038))

(assert (= (and b!1069038 res!713335) b!1069041))

(assert (= (and b!1069041 res!713330) b!1069046))

(assert (= (and b!1069046 res!713333) b!1069044))

(assert (= (and b!1069044 (not res!713331)) b!1069043))

(assert (= (and b!1069043 (not res!713332)) b!1069040))

(assert (= (and b!1069042 condMapEmpty!40177) mapIsEmpty!40177))

(assert (= (and b!1069042 (not condMapEmpty!40177)) mapNonEmpty!40177))

(get-info :version)

(assert (= (and mapNonEmpty!40177 ((_ is ValueCellFull!12123) mapValue!40177)) b!1069039))

(assert (= (and b!1069042 ((_ is ValueCellFull!12123) mapDefault!40177)) b!1069045))

(assert (= start!94538 b!1069042))

(declare-fun m!987587 () Bool)

(assert (=> b!1069040 m!987587))

(declare-fun m!987589 () Bool)

(assert (=> b!1069040 m!987589))

(declare-fun m!987591 () Bool)

(assert (=> b!1069043 m!987591))

(declare-fun m!987593 () Bool)

(assert (=> b!1069043 m!987593))

(declare-fun m!987595 () Bool)

(assert (=> b!1069046 m!987595))

(declare-fun m!987597 () Bool)

(assert (=> b!1069044 m!987597))

(declare-fun m!987599 () Bool)

(assert (=> b!1069044 m!987599))

(declare-fun m!987601 () Bool)

(assert (=> b!1069044 m!987601))

(declare-fun m!987603 () Bool)

(assert (=> mapNonEmpty!40177 m!987603))

(declare-fun m!987605 () Bool)

(assert (=> b!1069041 m!987605))

(declare-fun m!987607 () Bool)

(assert (=> start!94538 m!987607))

(declare-fun m!987609 () Bool)

(assert (=> start!94538 m!987609))

(declare-fun m!987611 () Bool)

(assert (=> start!94538 m!987611))

(check-sat (not b!1069044) b_and!34645 (not b!1069041) (not b_next!21843) (not start!94538) (not b!1069046) (not b!1069043) tp_is_empty!25653 (not mapNonEmpty!40177) (not b!1069040))
(check-sat b_and!34645 (not b_next!21843))
