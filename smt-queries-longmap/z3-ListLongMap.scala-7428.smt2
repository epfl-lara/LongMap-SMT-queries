; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94412 () Bool)

(assert start!94412)

(declare-fun b_free!21745 () Bool)

(declare-fun b_next!21745 () Bool)

(assert (=> start!94412 (= b_free!21745 (not b_next!21745))))

(declare-fun tp!76681 () Bool)

(declare-fun b_and!34511 () Bool)

(assert (=> start!94412 (= tp!76681 b_and!34511)))

(declare-fun b!1067412 () Bool)

(declare-fun e!608820 () Bool)

(declare-fun tp_is_empty!25555 () Bool)

(assert (=> b!1067412 (= e!608820 tp_is_empty!25555)))

(declare-fun b!1067413 () Bool)

(declare-fun res!712326 () Bool)

(declare-fun e!608823 () Bool)

(assert (=> b!1067413 (=> (not res!712326) (not e!608823))))

(declare-datatypes ((array!68040 0))(
  ( (array!68041 (arr!32720 (Array (_ BitVec 32) (_ BitVec 64))) (size!33258 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68040)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68040 (_ BitVec 32)) Bool)

(assert (=> b!1067413 (= res!712326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067414 () Bool)

(declare-fun e!608819 () Bool)

(assert (=> b!1067414 (= e!608823 (not e!608819))))

(declare-fun res!712328 () Bool)

(assert (=> b!1067414 (=> res!712328 e!608819)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067414 (= res!712328 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39209 0))(
  ( (V!39210 (val!12828 Int)) )
))
(declare-datatypes ((tuple2!16338 0))(
  ( (tuple2!16339 (_1!8180 (_ BitVec 64)) (_2!8180 V!39209)) )
))
(declare-datatypes ((List!22880 0))(
  ( (Nil!22877) (Cons!22876 (h!24085 tuple2!16338) (t!32196 List!22880)) )
))
(declare-datatypes ((ListLongMap!14307 0))(
  ( (ListLongMap!14308 (toList!7169 List!22880)) )
))
(declare-fun lt!471306 () ListLongMap!14307)

(declare-fun lt!471307 () ListLongMap!14307)

(assert (=> b!1067414 (= lt!471306 lt!471307)))

(declare-fun zeroValueBefore!47 () V!39209)

(declare-datatypes ((Unit!34928 0))(
  ( (Unit!34929) )
))
(declare-fun lt!471305 () Unit!34928)

(declare-datatypes ((ValueCell!12074 0))(
  ( (ValueCellFull!12074 (v!15441 V!39209)) (EmptyCell!12074) )
))
(declare-datatypes ((array!68042 0))(
  ( (array!68043 (arr!32721 (Array (_ BitVec 32) ValueCell!12074)) (size!33259 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68042)

(declare-fun minValue!907 () V!39209)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!759 (array!68040 array!68042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 V!39209 V!39209 (_ BitVec 32) Int) Unit!34928)

(assert (=> b!1067414 (= lt!471305 (lemmaNoChangeToArrayThenSameMapNoExtras!759 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3765 (array!68040 array!68042 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14307)

(assert (=> b!1067414 (= lt!471307 (getCurrentListMapNoExtraKeys!3765 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067414 (= lt!471306 (getCurrentListMapNoExtraKeys!3765 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067415 () Bool)

(declare-fun e!608822 () Bool)

(declare-fun e!608821 () Bool)

(declare-fun mapRes!40027 () Bool)

(assert (=> b!1067415 (= e!608822 (and e!608821 mapRes!40027))))

(declare-fun condMapEmpty!40027 () Bool)

(declare-fun mapDefault!40027 () ValueCell!12074)

(assert (=> b!1067415 (= condMapEmpty!40027 (= (arr!32721 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12074)) mapDefault!40027)))))

(declare-fun b!1067416 () Bool)

(assert (=> b!1067416 (= e!608819 true)))

(declare-fun lt!471308 () Bool)

(declare-fun contains!6247 (ListLongMap!14307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4016 (array!68040 array!68042 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14307)

(assert (=> b!1067416 (= lt!471308 (contains!6247 (getCurrentListMap!4016 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40027 () Bool)

(assert (=> mapIsEmpty!40027 mapRes!40027))

(declare-fun b!1067417 () Bool)

(assert (=> b!1067417 (= e!608821 tp_is_empty!25555)))

(declare-fun b!1067418 () Bool)

(declare-fun res!712327 () Bool)

(assert (=> b!1067418 (=> (not res!712327) (not e!608823))))

(declare-datatypes ((List!22881 0))(
  ( (Nil!22878) (Cons!22877 (h!24086 (_ BitVec 64)) (t!32197 List!22881)) )
))
(declare-fun arrayNoDuplicates!0 (array!68040 (_ BitVec 32) List!22881) Bool)

(assert (=> b!1067418 (= res!712327 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22878))))

(declare-fun res!712325 () Bool)

(assert (=> start!94412 (=> (not res!712325) (not e!608823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94412 (= res!712325 (validMask!0 mask!1515))))

(assert (=> start!94412 e!608823))

(assert (=> start!94412 true))

(assert (=> start!94412 tp_is_empty!25555))

(declare-fun array_inv!25328 (array!68042) Bool)

(assert (=> start!94412 (and (array_inv!25328 _values!955) e!608822)))

(assert (=> start!94412 tp!76681))

(declare-fun array_inv!25329 (array!68040) Bool)

(assert (=> start!94412 (array_inv!25329 _keys!1163)))

(declare-fun mapNonEmpty!40027 () Bool)

(declare-fun tp!76682 () Bool)

(assert (=> mapNonEmpty!40027 (= mapRes!40027 (and tp!76682 e!608820))))

(declare-fun mapRest!40027 () (Array (_ BitVec 32) ValueCell!12074))

(declare-fun mapKey!40027 () (_ BitVec 32))

(declare-fun mapValue!40027 () ValueCell!12074)

(assert (=> mapNonEmpty!40027 (= (arr!32721 _values!955) (store mapRest!40027 mapKey!40027 mapValue!40027))))

(declare-fun b!1067419 () Bool)

(declare-fun res!712329 () Bool)

(assert (=> b!1067419 (=> (not res!712329) (not e!608823))))

(assert (=> b!1067419 (= res!712329 (and (= (size!33259 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33258 _keys!1163) (size!33259 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94412 res!712325) b!1067419))

(assert (= (and b!1067419 res!712329) b!1067413))

(assert (= (and b!1067413 res!712326) b!1067418))

(assert (= (and b!1067418 res!712327) b!1067414))

(assert (= (and b!1067414 (not res!712328)) b!1067416))

(assert (= (and b!1067415 condMapEmpty!40027) mapIsEmpty!40027))

(assert (= (and b!1067415 (not condMapEmpty!40027)) mapNonEmpty!40027))

(get-info :version)

(assert (= (and mapNonEmpty!40027 ((_ is ValueCellFull!12074) mapValue!40027)) b!1067412))

(assert (= (and b!1067415 ((_ is ValueCellFull!12074) mapDefault!40027)) b!1067417))

(assert (= start!94412 b!1067415))

(declare-fun m!985573 () Bool)

(assert (=> b!1067413 m!985573))

(declare-fun m!985575 () Bool)

(assert (=> b!1067414 m!985575))

(declare-fun m!985577 () Bool)

(assert (=> b!1067414 m!985577))

(declare-fun m!985579 () Bool)

(assert (=> b!1067414 m!985579))

(declare-fun m!985581 () Bool)

(assert (=> b!1067416 m!985581))

(assert (=> b!1067416 m!985581))

(declare-fun m!985583 () Bool)

(assert (=> b!1067416 m!985583))

(declare-fun m!985585 () Bool)

(assert (=> b!1067418 m!985585))

(declare-fun m!985587 () Bool)

(assert (=> start!94412 m!985587))

(declare-fun m!985589 () Bool)

(assert (=> start!94412 m!985589))

(declare-fun m!985591 () Bool)

(assert (=> start!94412 m!985591))

(declare-fun m!985593 () Bool)

(assert (=> mapNonEmpty!40027 m!985593))

(check-sat (not start!94412) (not b_next!21745) tp_is_empty!25555 (not mapNonEmpty!40027) (not b!1067416) b_and!34511 (not b!1067414) (not b!1067418) (not b!1067413))
(check-sat b_and!34511 (not b_next!21745))
