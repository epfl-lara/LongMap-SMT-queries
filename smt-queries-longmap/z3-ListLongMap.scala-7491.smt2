; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94920 () Bool)

(assert start!94920)

(declare-fun b_free!22125 () Bool)

(declare-fun b_next!22125 () Bool)

(assert (=> start!94920 (= b_free!22125 (not b_next!22125))))

(declare-fun tp!77840 () Bool)

(declare-fun b_and!34979 () Bool)

(assert (=> start!94920 (= tp!77840 b_and!34979)))

(declare-fun b!1073258 () Bool)

(declare-fun e!613130 () Bool)

(declare-fun tp_is_empty!25935 () Bool)

(assert (=> b!1073258 (= e!613130 tp_is_empty!25935)))

(declare-fun b!1073259 () Bool)

(declare-fun e!613131 () Bool)

(declare-fun e!613133 () Bool)

(declare-fun mapRes!40615 () Bool)

(assert (=> b!1073259 (= e!613131 (and e!613133 mapRes!40615))))

(declare-fun condMapEmpty!40615 () Bool)

(declare-datatypes ((V!39715 0))(
  ( (V!39716 (val!13018 Int)) )
))
(declare-datatypes ((ValueCell!12264 0))(
  ( (ValueCellFull!12264 (v!15636 V!39715)) (EmptyCell!12264) )
))
(declare-datatypes ((array!68833 0))(
  ( (array!68834 (arr!33110 (Array (_ BitVec 32) ValueCell!12264)) (size!33646 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68833)

(declare-fun mapDefault!40615 () ValueCell!12264)

(assert (=> b!1073259 (= condMapEmpty!40615 (= (arr!33110 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12264)) mapDefault!40615)))))

(declare-fun b!1073260 () Bool)

(declare-fun res!715839 () Bool)

(declare-fun e!613132 () Bool)

(assert (=> b!1073260 (=> (not res!715839) (not e!613132))))

(declare-datatypes ((array!68835 0))(
  ( (array!68836 (arr!33111 (Array (_ BitVec 32) (_ BitVec 64))) (size!33647 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68835)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68835 (_ BitVec 32)) Bool)

(assert (=> b!1073260 (= res!715839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40615 () Bool)

(assert (=> mapIsEmpty!40615 mapRes!40615))

(declare-fun b!1073261 () Bool)

(assert (=> b!1073261 (= e!613132 false)))

(declare-fun minValue!907 () V!39715)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!16576 0))(
  ( (tuple2!16577 (_1!8299 (_ BitVec 64)) (_2!8299 V!39715)) )
))
(declare-datatypes ((List!23112 0))(
  ( (Nil!23109) (Cons!23108 (h!24317 tuple2!16576) (t!32449 List!23112)) )
))
(declare-datatypes ((ListLongMap!14545 0))(
  ( (ListLongMap!14546 (toList!7288 List!23112)) )
))
(declare-fun lt!475996 () ListLongMap!14545)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39715)

(declare-fun getCurrentListMapNoExtraKeys!3852 (array!68835 array!68833 (_ BitVec 32) (_ BitVec 32) V!39715 V!39715 (_ BitVec 32) Int) ListLongMap!14545)

(assert (=> b!1073261 (= lt!475996 (getCurrentListMapNoExtraKeys!3852 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39715)

(declare-fun lt!475995 () ListLongMap!14545)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073261 (= lt!475995 (getCurrentListMapNoExtraKeys!3852 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073262 () Bool)

(declare-fun res!715840 () Bool)

(assert (=> b!1073262 (=> (not res!715840) (not e!613132))))

(assert (=> b!1073262 (= res!715840 (and (= (size!33646 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33647 _keys!1163) (size!33646 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073263 () Bool)

(assert (=> b!1073263 (= e!613133 tp_is_empty!25935)))

(declare-fun res!715837 () Bool)

(assert (=> start!94920 (=> (not res!715837) (not e!613132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94920 (= res!715837 (validMask!0 mask!1515))))

(assert (=> start!94920 e!613132))

(assert (=> start!94920 true))

(assert (=> start!94920 tp_is_empty!25935))

(declare-fun array_inv!25592 (array!68833) Bool)

(assert (=> start!94920 (and (array_inv!25592 _values!955) e!613131)))

(assert (=> start!94920 tp!77840))

(declare-fun array_inv!25593 (array!68835) Bool)

(assert (=> start!94920 (array_inv!25593 _keys!1163)))

(declare-fun b!1073264 () Bool)

(declare-fun res!715838 () Bool)

(assert (=> b!1073264 (=> (not res!715838) (not e!613132))))

(declare-datatypes ((List!23113 0))(
  ( (Nil!23110) (Cons!23109 (h!24318 (_ BitVec 64)) (t!32450 List!23113)) )
))
(declare-fun arrayNoDuplicates!0 (array!68835 (_ BitVec 32) List!23113) Bool)

(assert (=> b!1073264 (= res!715838 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23110))))

(declare-fun mapNonEmpty!40615 () Bool)

(declare-fun tp!77839 () Bool)

(assert (=> mapNonEmpty!40615 (= mapRes!40615 (and tp!77839 e!613130))))

(declare-fun mapKey!40615 () (_ BitVec 32))

(declare-fun mapRest!40615 () (Array (_ BitVec 32) ValueCell!12264))

(declare-fun mapValue!40615 () ValueCell!12264)

(assert (=> mapNonEmpty!40615 (= (arr!33110 _values!955) (store mapRest!40615 mapKey!40615 mapValue!40615))))

(assert (= (and start!94920 res!715837) b!1073262))

(assert (= (and b!1073262 res!715840) b!1073260))

(assert (= (and b!1073260 res!715839) b!1073264))

(assert (= (and b!1073264 res!715838) b!1073261))

(assert (= (and b!1073259 condMapEmpty!40615) mapIsEmpty!40615))

(assert (= (and b!1073259 (not condMapEmpty!40615)) mapNonEmpty!40615))

(get-info :version)

(assert (= (and mapNonEmpty!40615 ((_ is ValueCellFull!12264) mapValue!40615)) b!1073258))

(assert (= (and b!1073259 ((_ is ValueCellFull!12264) mapDefault!40615)) b!1073263))

(assert (= start!94920 b!1073259))

(declare-fun m!992287 () Bool)

(assert (=> b!1073260 m!992287))

(declare-fun m!992289 () Bool)

(assert (=> start!94920 m!992289))

(declare-fun m!992291 () Bool)

(assert (=> start!94920 m!992291))

(declare-fun m!992293 () Bool)

(assert (=> start!94920 m!992293))

(declare-fun m!992295 () Bool)

(assert (=> mapNonEmpty!40615 m!992295))

(declare-fun m!992297 () Bool)

(assert (=> b!1073264 m!992297))

(declare-fun m!992299 () Bool)

(assert (=> b!1073261 m!992299))

(declare-fun m!992301 () Bool)

(assert (=> b!1073261 m!992301))

(check-sat (not b!1073261) (not mapNonEmpty!40615) b_and!34979 (not start!94920) (not b_next!22125) (not b!1073260) (not b!1073264) tp_is_empty!25935)
(check-sat b_and!34979 (not b_next!22125))
