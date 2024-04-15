; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94834 () Bool)

(assert start!94834)

(declare-fun b_free!22069 () Bool)

(declare-fun b_next!22069 () Bool)

(assert (=> start!94834 (= b_free!22069 (not b_next!22069))))

(declare-fun tp!77668 () Bool)

(declare-fun b_and!34885 () Bool)

(assert (=> start!94834 (= tp!77668 b_and!34885)))

(declare-fun b!1072275 () Bool)

(declare-fun res!715293 () Bool)

(declare-fun e!612446 () Bool)

(assert (=> b!1072275 (=> (not res!715293) (not e!612446))))

(declare-datatypes ((array!68666 0))(
  ( (array!68667 (arr!33028 (Array (_ BitVec 32) (_ BitVec 64))) (size!33566 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68666)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68666 (_ BitVec 32)) Bool)

(assert (=> b!1072275 (= res!715293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun e!612447 () Bool)

(declare-datatypes ((V!39641 0))(
  ( (V!39642 (val!12990 Int)) )
))
(declare-datatypes ((tuple2!16600 0))(
  ( (tuple2!16601 (_1!8311 (_ BitVec 64)) (_2!8311 V!39641)) )
))
(declare-datatypes ((List!23123 0))(
  ( (Nil!23120) (Cons!23119 (h!24328 tuple2!16600) (t!32449 List!23123)) )
))
(declare-datatypes ((ListLongMap!14569 0))(
  ( (ListLongMap!14570 (toList!7300 List!23123)) )
))
(declare-fun lt!475188 () ListLongMap!14569)

(declare-fun b!1072276 () Bool)

(declare-fun lt!475194 () tuple2!16600)

(declare-fun lt!475189 () ListLongMap!14569)

(declare-fun +!3232 (ListLongMap!14569 tuple2!16600) ListLongMap!14569)

(assert (=> b!1072276 (= e!612447 (= lt!475189 (+!3232 lt!475188 lt!475194)))))

(declare-fun mapNonEmpty!40528 () Bool)

(declare-fun mapRes!40528 () Bool)

(declare-fun tp!77669 () Bool)

(declare-fun e!612443 () Bool)

(assert (=> mapNonEmpty!40528 (= mapRes!40528 (and tp!77669 e!612443))))

(declare-fun mapKey!40528 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12236 0))(
  ( (ValueCellFull!12236 (v!15606 V!39641)) (EmptyCell!12236) )
))
(declare-fun mapRest!40528 () (Array (_ BitVec 32) ValueCell!12236))

(declare-fun mapValue!40528 () ValueCell!12236)

(declare-datatypes ((array!68668 0))(
  ( (array!68669 (arr!33029 (Array (_ BitVec 32) ValueCell!12236)) (size!33567 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68668)

(assert (=> mapNonEmpty!40528 (= (arr!33029 _values!955) (store mapRest!40528 mapKey!40528 mapValue!40528))))

(declare-fun b!1072278 () Bool)

(declare-fun res!715292 () Bool)

(assert (=> b!1072278 (=> (not res!715292) (not e!612446))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072278 (= res!715292 (and (= (size!33567 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33566 _keys!1163) (size!33567 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072279 () Bool)

(declare-fun e!612444 () Bool)

(declare-fun tp_is_empty!25879 () Bool)

(assert (=> b!1072279 (= e!612444 tp_is_empty!25879)))

(declare-fun mapIsEmpty!40528 () Bool)

(assert (=> mapIsEmpty!40528 mapRes!40528))

(declare-fun b!1072280 () Bool)

(declare-fun e!612449 () Bool)

(assert (=> b!1072280 (= e!612449 (and e!612444 mapRes!40528))))

(declare-fun condMapEmpty!40528 () Bool)

(declare-fun mapDefault!40528 () ValueCell!12236)

(assert (=> b!1072280 (= condMapEmpty!40528 (= (arr!33029 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12236)) mapDefault!40528)))))

(declare-fun b!1072281 () Bool)

(declare-fun e!612448 () Bool)

(assert (=> b!1072281 (= e!612448 true)))

(declare-fun lt!475191 () ListLongMap!14569)

(declare-fun lt!475186 () ListLongMap!14569)

(declare-fun -!687 (ListLongMap!14569 (_ BitVec 64)) ListLongMap!14569)

(assert (=> b!1072281 (= lt!475191 (-!687 lt!475186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475187 () ListLongMap!14569)

(declare-fun lt!475196 () ListLongMap!14569)

(assert (=> b!1072281 (= lt!475187 lt!475196)))

(declare-fun lt!475197 () ListLongMap!14569)

(declare-fun zeroValueBefore!47 () V!39641)

(declare-datatypes ((Unit!35177 0))(
  ( (Unit!35178) )
))
(declare-fun lt!475198 () Unit!35177)

(declare-fun minValue!907 () V!39641)

(declare-fun addCommutativeForDiffKeys!745 (ListLongMap!14569 (_ BitVec 64) V!39641 (_ BitVec 64) V!39641) Unit!35177)

(assert (=> b!1072281 (= lt!475198 (addCommutativeForDiffKeys!745 lt!475197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475190 () ListLongMap!14569)

(assert (=> b!1072281 (= (-!687 lt!475196 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475190)))

(declare-fun lt!475193 () tuple2!16600)

(assert (=> b!1072281 (= lt!475196 (+!3232 lt!475190 lt!475193))))

(declare-fun lt!475192 () Unit!35177)

(declare-fun addThenRemoveForNewKeyIsSame!68 (ListLongMap!14569 (_ BitVec 64) V!39641) Unit!35177)

(assert (=> b!1072281 (= lt!475192 (addThenRemoveForNewKeyIsSame!68 lt!475190 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072281 (= lt!475190 (+!3232 lt!475197 lt!475194))))

(assert (=> b!1072281 e!612447))

(declare-fun res!715295 () Bool)

(assert (=> b!1072281 (=> (not res!715295) (not e!612447))))

(assert (=> b!1072281 (= res!715295 (= lt!475186 lt!475187))))

(assert (=> b!1072281 (= lt!475187 (+!3232 (+!3232 lt!475197 lt!475193) lt!475194))))

(assert (=> b!1072281 (= lt!475194 (tuple2!16601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072281 (= lt!475193 (tuple2!16601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39641)

(declare-fun getCurrentListMap!4100 (array!68666 array!68668 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1072281 (= lt!475189 (getCurrentListMap!4100 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072281 (= lt!475186 (getCurrentListMap!4100 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072282 () Bool)

(assert (=> b!1072282 (= e!612443 tp_is_empty!25879)))

(declare-fun b!1072283 () Bool)

(assert (=> b!1072283 (= e!612446 (not e!612448))))

(declare-fun res!715296 () Bool)

(assert (=> b!1072283 (=> res!715296 e!612448)))

(assert (=> b!1072283 (= res!715296 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072283 (= lt!475197 lt!475188)))

(declare-fun lt!475195 () Unit!35177)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!875 (array!68666 array!68668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 V!39641 V!39641 (_ BitVec 32) Int) Unit!35177)

(assert (=> b!1072283 (= lt!475195 (lemmaNoChangeToArrayThenSameMapNoExtras!875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3881 (array!68666 array!68668 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1072283 (= lt!475188 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072283 (= lt!475197 (getCurrentListMapNoExtraKeys!3881 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072277 () Bool)

(declare-fun res!715294 () Bool)

(assert (=> b!1072277 (=> (not res!715294) (not e!612446))))

(declare-datatypes ((List!23124 0))(
  ( (Nil!23121) (Cons!23120 (h!24329 (_ BitVec 64)) (t!32450 List!23124)) )
))
(declare-fun arrayNoDuplicates!0 (array!68666 (_ BitVec 32) List!23124) Bool)

(assert (=> b!1072277 (= res!715294 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23121))))

(declare-fun res!715297 () Bool)

(assert (=> start!94834 (=> (not res!715297) (not e!612446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94834 (= res!715297 (validMask!0 mask!1515))))

(assert (=> start!94834 e!612446))

(assert (=> start!94834 true))

(assert (=> start!94834 tp_is_empty!25879))

(declare-fun array_inv!25556 (array!68668) Bool)

(assert (=> start!94834 (and (array_inv!25556 _values!955) e!612449)))

(assert (=> start!94834 tp!77668))

(declare-fun array_inv!25557 (array!68666) Bool)

(assert (=> start!94834 (array_inv!25557 _keys!1163)))

(assert (= (and start!94834 res!715297) b!1072278))

(assert (= (and b!1072278 res!715292) b!1072275))

(assert (= (and b!1072275 res!715293) b!1072277))

(assert (= (and b!1072277 res!715294) b!1072283))

(assert (= (and b!1072283 (not res!715296)) b!1072281))

(assert (= (and b!1072281 res!715295) b!1072276))

(assert (= (and b!1072280 condMapEmpty!40528) mapIsEmpty!40528))

(assert (= (and b!1072280 (not condMapEmpty!40528)) mapNonEmpty!40528))

(get-info :version)

(assert (= (and mapNonEmpty!40528 ((_ is ValueCellFull!12236) mapValue!40528)) b!1072282))

(assert (= (and b!1072280 ((_ is ValueCellFull!12236) mapDefault!40528)) b!1072279))

(assert (= start!94834 b!1072280))

(declare-fun m!990747 () Bool)

(assert (=> b!1072276 m!990747))

(declare-fun m!990749 () Bool)

(assert (=> start!94834 m!990749))

(declare-fun m!990751 () Bool)

(assert (=> start!94834 m!990751))

(declare-fun m!990753 () Bool)

(assert (=> start!94834 m!990753))

(declare-fun m!990755 () Bool)

(assert (=> mapNonEmpty!40528 m!990755))

(declare-fun m!990757 () Bool)

(assert (=> b!1072277 m!990757))

(declare-fun m!990759 () Bool)

(assert (=> b!1072283 m!990759))

(declare-fun m!990761 () Bool)

(assert (=> b!1072283 m!990761))

(declare-fun m!990763 () Bool)

(assert (=> b!1072283 m!990763))

(declare-fun m!990765 () Bool)

(assert (=> b!1072281 m!990765))

(declare-fun m!990767 () Bool)

(assert (=> b!1072281 m!990767))

(declare-fun m!990769 () Bool)

(assert (=> b!1072281 m!990769))

(declare-fun m!990771 () Bool)

(assert (=> b!1072281 m!990771))

(declare-fun m!990773 () Bool)

(assert (=> b!1072281 m!990773))

(declare-fun m!990775 () Bool)

(assert (=> b!1072281 m!990775))

(declare-fun m!990777 () Bool)

(assert (=> b!1072281 m!990777))

(declare-fun m!990779 () Bool)

(assert (=> b!1072281 m!990779))

(declare-fun m!990781 () Bool)

(assert (=> b!1072281 m!990781))

(assert (=> b!1072281 m!990773))

(declare-fun m!990783 () Bool)

(assert (=> b!1072281 m!990783))

(declare-fun m!990785 () Bool)

(assert (=> b!1072275 m!990785))

(check-sat (not b!1072281) (not b_next!22069) (not start!94834) (not b!1072277) b_and!34885 (not mapNonEmpty!40528) (not b!1072276) (not b!1072275) tp_is_empty!25879 (not b!1072283))
(check-sat b_and!34885 (not b_next!22069))
