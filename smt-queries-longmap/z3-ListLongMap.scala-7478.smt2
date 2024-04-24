; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95052 () Bool)

(assert start!95052)

(declare-fun b_free!22045 () Bool)

(declare-fun b_next!22045 () Bool)

(assert (=> start!95052 (= b_free!22045 (not b_next!22045))))

(declare-fun tp!77596 () Bool)

(declare-fun b_and!34897 () Bool)

(assert (=> start!95052 (= tp!77596 b_and!34897)))

(declare-fun mapNonEmpty!40492 () Bool)

(declare-fun mapRes!40492 () Bool)

(declare-fun tp!77597 () Bool)

(declare-fun e!613141 () Bool)

(assert (=> mapNonEmpty!40492 (= mapRes!40492 (and tp!77597 e!613141))))

(declare-datatypes ((V!39609 0))(
  ( (V!39610 (val!12978 Int)) )
))
(declare-datatypes ((ValueCell!12224 0))(
  ( (ValueCellFull!12224 (v!15591 V!39609)) (EmptyCell!12224) )
))
(declare-fun mapValue!40492 () ValueCell!12224)

(declare-datatypes ((array!68721 0))(
  ( (array!68722 (arr!33049 (Array (_ BitVec 32) ValueCell!12224)) (size!33586 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68721)

(declare-fun mapKey!40492 () (_ BitVec 32))

(declare-fun mapRest!40492 () (Array (_ BitVec 32) ValueCell!12224))

(assert (=> mapNonEmpty!40492 (= (arr!33049 _values!955) (store mapRest!40492 mapKey!40492 mapValue!40492))))

(declare-datatypes ((tuple2!16494 0))(
  ( (tuple2!16495 (_1!8258 (_ BitVec 64)) (_2!8258 V!39609)) )
))
(declare-fun lt!475443 () tuple2!16494)

(declare-fun b!1073431 () Bool)

(declare-fun e!613142 () Bool)

(declare-datatypes ((List!23053 0))(
  ( (Nil!23050) (Cons!23049 (h!24267 tuple2!16494) (t!32380 List!23053)) )
))
(declare-datatypes ((ListLongMap!14471 0))(
  ( (ListLongMap!14472 (toList!7251 List!23053)) )
))
(declare-fun lt!475441 () ListLongMap!14471)

(declare-fun lt!475444 () ListLongMap!14471)

(declare-fun +!3214 (ListLongMap!14471 tuple2!16494) ListLongMap!14471)

(assert (=> b!1073431 (= e!613142 (= lt!475441 (+!3214 lt!475444 lt!475443)))))

(declare-fun mapIsEmpty!40492 () Bool)

(assert (=> mapIsEmpty!40492 mapRes!40492))

(declare-fun b!1073433 () Bool)

(declare-fun e!613140 () Bool)

(assert (=> b!1073433 (= e!613140 true)))

(declare-fun lt!475442 () ListLongMap!14471)

(declare-fun lt!475445 () ListLongMap!14471)

(declare-fun -!683 (ListLongMap!14471 (_ BitVec 64)) ListLongMap!14471)

(assert (=> b!1073433 (= lt!475442 (-!683 lt!475445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475434 () ListLongMap!14471)

(declare-fun lt!475438 () ListLongMap!14471)

(assert (=> b!1073433 (= lt!475434 lt!475438)))

(declare-fun zeroValueBefore!47 () V!39609)

(declare-fun minValue!907 () V!39609)

(declare-datatypes ((Unit!35285 0))(
  ( (Unit!35286) )
))
(declare-fun lt!475440 () Unit!35285)

(declare-fun lt!475435 () ListLongMap!14471)

(declare-fun addCommutativeForDiffKeys!740 (ListLongMap!14471 (_ BitVec 64) V!39609 (_ BitVec 64) V!39609) Unit!35285)

(assert (=> b!1073433 (= lt!475440 (addCommutativeForDiffKeys!740 lt!475435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475433 () ListLongMap!14471)

(assert (=> b!1073433 (= (-!683 lt!475438 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475433)))

(declare-fun lt!475437 () tuple2!16494)

(assert (=> b!1073433 (= lt!475438 (+!3214 lt!475433 lt!475437))))

(declare-fun lt!475436 () Unit!35285)

(declare-fun addThenRemoveForNewKeyIsSame!58 (ListLongMap!14471 (_ BitVec 64) V!39609) Unit!35285)

(assert (=> b!1073433 (= lt!475436 (addThenRemoveForNewKeyIsSame!58 lt!475433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073433 (= lt!475433 (+!3214 lt!475435 lt!475443))))

(assert (=> b!1073433 e!613142))

(declare-fun res!715670 () Bool)

(assert (=> b!1073433 (=> (not res!715670) (not e!613142))))

(assert (=> b!1073433 (= res!715670 (= lt!475445 lt!475434))))

(assert (=> b!1073433 (= lt!475434 (+!3214 (+!3214 lt!475435 lt!475437) lt!475443))))

(assert (=> b!1073433 (= lt!475443 (tuple2!16495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073433 (= lt!475437 (tuple2!16495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((array!68723 0))(
  ( (array!68724 (arr!33050 (Array (_ BitVec 32) (_ BitVec 64))) (size!33587 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68723)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39609)

(declare-fun getCurrentListMap!4144 (array!68723 array!68721 (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1073433 (= lt!475441 (getCurrentListMap!4144 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073433 (= lt!475445 (getCurrentListMap!4144 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073434 () Bool)

(declare-fun e!613143 () Bool)

(assert (=> b!1073434 (= e!613143 (not e!613140))))

(declare-fun res!715668 () Bool)

(assert (=> b!1073434 (=> res!715668 e!613140)))

(assert (=> b!1073434 (= res!715668 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073434 (= lt!475435 lt!475444)))

(declare-fun lt!475439 () Unit!35285)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!857 (array!68723 array!68721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 V!39609 V!39609 (_ BitVec 32) Int) Unit!35285)

(assert (=> b!1073434 (= lt!475439 (lemmaNoChangeToArrayThenSameMapNoExtras!857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3854 (array!68723 array!68721 (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1073434 (= lt!475444 (getCurrentListMapNoExtraKeys!3854 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073434 (= lt!475435 (getCurrentListMapNoExtraKeys!3854 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073435 () Bool)

(declare-fun res!715669 () Bool)

(assert (=> b!1073435 (=> (not res!715669) (not e!613143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68723 (_ BitVec 32)) Bool)

(assert (=> b!1073435 (= res!715669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073436 () Bool)

(declare-fun e!613139 () Bool)

(declare-fun tp_is_empty!25855 () Bool)

(assert (=> b!1073436 (= e!613139 tp_is_empty!25855)))

(declare-fun b!1073437 () Bool)

(assert (=> b!1073437 (= e!613141 tp_is_empty!25855)))

(declare-fun b!1073432 () Bool)

(declare-fun res!715671 () Bool)

(assert (=> b!1073432 (=> (not res!715671) (not e!613143))))

(assert (=> b!1073432 (= res!715671 (and (= (size!33586 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33587 _keys!1163) (size!33586 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715672 () Bool)

(assert (=> start!95052 (=> (not res!715672) (not e!613143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95052 (= res!715672 (validMask!0 mask!1515))))

(assert (=> start!95052 e!613143))

(assert (=> start!95052 true))

(assert (=> start!95052 tp_is_empty!25855))

(declare-fun e!613145 () Bool)

(declare-fun array_inv!25582 (array!68721) Bool)

(assert (=> start!95052 (and (array_inv!25582 _values!955) e!613145)))

(assert (=> start!95052 tp!77596))

(declare-fun array_inv!25583 (array!68723) Bool)

(assert (=> start!95052 (array_inv!25583 _keys!1163)))

(declare-fun b!1073438 () Bool)

(assert (=> b!1073438 (= e!613145 (and e!613139 mapRes!40492))))

(declare-fun condMapEmpty!40492 () Bool)

(declare-fun mapDefault!40492 () ValueCell!12224)

(assert (=> b!1073438 (= condMapEmpty!40492 (= (arr!33049 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12224)) mapDefault!40492)))))

(declare-fun b!1073439 () Bool)

(declare-fun res!715667 () Bool)

(assert (=> b!1073439 (=> (not res!715667) (not e!613143))))

(declare-datatypes ((List!23054 0))(
  ( (Nil!23051) (Cons!23050 (h!24268 (_ BitVec 64)) (t!32381 List!23054)) )
))
(declare-fun arrayNoDuplicates!0 (array!68723 (_ BitVec 32) List!23054) Bool)

(assert (=> b!1073439 (= res!715667 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23051))))

(assert (= (and start!95052 res!715672) b!1073432))

(assert (= (and b!1073432 res!715671) b!1073435))

(assert (= (and b!1073435 res!715669) b!1073439))

(assert (= (and b!1073439 res!715667) b!1073434))

(assert (= (and b!1073434 (not res!715668)) b!1073433))

(assert (= (and b!1073433 res!715670) b!1073431))

(assert (= (and b!1073438 condMapEmpty!40492) mapIsEmpty!40492))

(assert (= (and b!1073438 (not condMapEmpty!40492)) mapNonEmpty!40492))

(get-info :version)

(assert (= (and mapNonEmpty!40492 ((_ is ValueCellFull!12224) mapValue!40492)) b!1073437))

(assert (= (and b!1073438 ((_ is ValueCellFull!12224) mapDefault!40492)) b!1073436))

(assert (= start!95052 b!1073438))

(declare-fun m!992565 () Bool)

(assert (=> mapNonEmpty!40492 m!992565))

(declare-fun m!992567 () Bool)

(assert (=> start!95052 m!992567))

(declare-fun m!992569 () Bool)

(assert (=> start!95052 m!992569))

(declare-fun m!992571 () Bool)

(assert (=> start!95052 m!992571))

(declare-fun m!992573 () Bool)

(assert (=> b!1073439 m!992573))

(declare-fun m!992575 () Bool)

(assert (=> b!1073433 m!992575))

(declare-fun m!992577 () Bool)

(assert (=> b!1073433 m!992577))

(declare-fun m!992579 () Bool)

(assert (=> b!1073433 m!992579))

(declare-fun m!992581 () Bool)

(assert (=> b!1073433 m!992581))

(declare-fun m!992583 () Bool)

(assert (=> b!1073433 m!992583))

(declare-fun m!992585 () Bool)

(assert (=> b!1073433 m!992585))

(assert (=> b!1073433 m!992581))

(declare-fun m!992587 () Bool)

(assert (=> b!1073433 m!992587))

(declare-fun m!992589 () Bool)

(assert (=> b!1073433 m!992589))

(declare-fun m!992591 () Bool)

(assert (=> b!1073433 m!992591))

(declare-fun m!992593 () Bool)

(assert (=> b!1073433 m!992593))

(declare-fun m!992595 () Bool)

(assert (=> b!1073434 m!992595))

(declare-fun m!992597 () Bool)

(assert (=> b!1073434 m!992597))

(declare-fun m!992599 () Bool)

(assert (=> b!1073434 m!992599))

(declare-fun m!992601 () Bool)

(assert (=> b!1073431 m!992601))

(declare-fun m!992603 () Bool)

(assert (=> b!1073435 m!992603))

(check-sat (not b_next!22045) (not b!1073431) (not b!1073433) tp_is_empty!25855 (not start!95052) (not b!1073439) (not b!1073434) (not b!1073435) (not mapNonEmpty!40492) b_and!34897)
(check-sat b_and!34897 (not b_next!22045))
