; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94524 () Bool)

(assert start!94524)

(declare-fun b_free!21835 () Bool)

(declare-fun b_next!21835 () Bool)

(assert (=> start!94524 (= b_free!21835 (not b_next!21835))))

(declare-fun tp!76955 () Bool)

(declare-fun b_and!34611 () Bool)

(assert (=> start!94524 (= tp!76955 b_and!34611)))

(declare-fun b!1068777 () Bool)

(declare-fun e!609859 () Bool)

(declare-fun tp_is_empty!25645 () Bool)

(assert (=> b!1068777 (= e!609859 tp_is_empty!25645)))

(declare-fun res!713191 () Bool)

(declare-fun e!609863 () Bool)

(assert (=> start!94524 (=> (not res!713191) (not e!609863))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94524 (= res!713191 (validMask!0 mask!1515))))

(assert (=> start!94524 e!609863))

(assert (=> start!94524 true))

(assert (=> start!94524 tp_is_empty!25645))

(declare-datatypes ((V!39329 0))(
  ( (V!39330 (val!12873 Int)) )
))
(declare-datatypes ((ValueCell!12119 0))(
  ( (ValueCellFull!12119 (v!15487 V!39329)) (EmptyCell!12119) )
))
(declare-datatypes ((array!68210 0))(
  ( (array!68211 (arr!32804 (Array (_ BitVec 32) ValueCell!12119)) (size!33342 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68210)

(declare-fun e!609858 () Bool)

(declare-fun array_inv!25390 (array!68210) Bool)

(assert (=> start!94524 (and (array_inv!25390 _values!955) e!609858)))

(assert (=> start!94524 tp!76955))

(declare-datatypes ((array!68212 0))(
  ( (array!68213 (arr!32805 (Array (_ BitVec 32) (_ BitVec 64))) (size!33343 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68212)

(declare-fun array_inv!25391 (array!68212) Bool)

(assert (=> start!94524 (array_inv!25391 _keys!1163)))

(declare-fun b!1068778 () Bool)

(declare-fun mapRes!40165 () Bool)

(assert (=> b!1068778 (= e!609858 (and e!609859 mapRes!40165))))

(declare-fun condMapEmpty!40165 () Bool)

(declare-fun mapDefault!40165 () ValueCell!12119)

(assert (=> b!1068778 (= condMapEmpty!40165 (= (arr!32804 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12119)) mapDefault!40165)))))

(declare-fun b!1068779 () Bool)

(declare-fun e!609857 () Bool)

(assert (=> b!1068779 (= e!609863 (not e!609857))))

(declare-fun res!713190 () Bool)

(assert (=> b!1068779 (=> res!713190 e!609857)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068779 (= res!713190 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16408 0))(
  ( (tuple2!16409 (_1!8215 (_ BitVec 64)) (_2!8215 V!39329)) )
))
(declare-datatypes ((List!22946 0))(
  ( (Nil!22943) (Cons!22942 (h!24151 tuple2!16408) (t!32264 List!22946)) )
))
(declare-datatypes ((ListLongMap!14377 0))(
  ( (ListLongMap!14378 (toList!7204 List!22946)) )
))
(declare-fun lt!472101 () ListLongMap!14377)

(declare-fun lt!472098 () ListLongMap!14377)

(assert (=> b!1068779 (= lt!472101 lt!472098)))

(declare-datatypes ((Unit!34996 0))(
  ( (Unit!34997) )
))
(declare-fun lt!472100 () Unit!34996)

(declare-fun minValue!907 () V!39329)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39329)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39329)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!788 (array!68212 array!68210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 V!39329 V!39329 (_ BitVec 32) Int) Unit!34996)

(assert (=> b!1068779 (= lt!472100 (lemmaNoChangeToArrayThenSameMapNoExtras!788 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3794 (array!68212 array!68210 (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 (_ BitVec 32) Int) ListLongMap!14377)

(assert (=> b!1068779 (= lt!472098 (getCurrentListMapNoExtraKeys!3794 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068779 (= lt!472101 (getCurrentListMapNoExtraKeys!3794 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068780 () Bool)

(declare-fun res!713192 () Bool)

(assert (=> b!1068780 (=> (not res!713192) (not e!609863))))

(declare-datatypes ((List!22947 0))(
  ( (Nil!22944) (Cons!22943 (h!24152 (_ BitVec 64)) (t!32265 List!22947)) )
))
(declare-fun arrayNoDuplicates!0 (array!68212 (_ BitVec 32) List!22947) Bool)

(assert (=> b!1068780 (= res!713192 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22944))))

(declare-fun b!1068781 () Bool)

(declare-fun res!713193 () Bool)

(assert (=> b!1068781 (=> (not res!713193) (not e!609863))))

(assert (=> b!1068781 (= res!713193 (and (= (size!33342 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33343 _keys!1163) (size!33342 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068782 () Bool)

(declare-fun res!713194 () Bool)

(assert (=> b!1068782 (=> (not res!713194) (not e!609863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68212 (_ BitVec 32)) Bool)

(assert (=> b!1068782 (= res!713194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068783 () Bool)

(declare-fun e!609862 () Bool)

(assert (=> b!1068783 (= e!609857 e!609862)))

(declare-fun res!713189 () Bool)

(assert (=> b!1068783 (=> res!713189 e!609862)))

(declare-fun lt!472099 () ListLongMap!14377)

(declare-fun contains!6276 (ListLongMap!14377 (_ BitVec 64)) Bool)

(assert (=> b!1068783 (= res!713189 (contains!6276 lt!472099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4044 (array!68212 array!68210 (_ BitVec 32) (_ BitVec 32) V!39329 V!39329 (_ BitVec 32) Int) ListLongMap!14377)

(assert (=> b!1068783 (= lt!472099 (getCurrentListMap!4044 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40165 () Bool)

(declare-fun tp!76954 () Bool)

(declare-fun e!609861 () Bool)

(assert (=> mapNonEmpty!40165 (= mapRes!40165 (and tp!76954 e!609861))))

(declare-fun mapRest!40165 () (Array (_ BitVec 32) ValueCell!12119))

(declare-fun mapValue!40165 () ValueCell!12119)

(declare-fun mapKey!40165 () (_ BitVec 32))

(assert (=> mapNonEmpty!40165 (= (arr!32804 _values!955) (store mapRest!40165 mapKey!40165 mapValue!40165))))

(declare-fun mapIsEmpty!40165 () Bool)

(assert (=> mapIsEmpty!40165 mapRes!40165))

(declare-fun b!1068784 () Bool)

(assert (=> b!1068784 (= e!609862 true)))

(declare-fun -!647 (ListLongMap!14377 (_ BitVec 64)) ListLongMap!14377)

(assert (=> b!1068784 (= (-!647 lt!472099 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472099)))

(declare-fun lt!472097 () Unit!34996)

(declare-fun removeNotPresentStillSame!64 (ListLongMap!14377 (_ BitVec 64)) Unit!34996)

(assert (=> b!1068784 (= lt!472097 (removeNotPresentStillSame!64 lt!472099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068785 () Bool)

(assert (=> b!1068785 (= e!609861 tp_is_empty!25645)))

(assert (= (and start!94524 res!713191) b!1068781))

(assert (= (and b!1068781 res!713193) b!1068782))

(assert (= (and b!1068782 res!713194) b!1068780))

(assert (= (and b!1068780 res!713192) b!1068779))

(assert (= (and b!1068779 (not res!713190)) b!1068783))

(assert (= (and b!1068783 (not res!713189)) b!1068784))

(assert (= (and b!1068778 condMapEmpty!40165) mapIsEmpty!40165))

(assert (= (and b!1068778 (not condMapEmpty!40165)) mapNonEmpty!40165))

(get-info :version)

(assert (= (and mapNonEmpty!40165 ((_ is ValueCellFull!12119) mapValue!40165)) b!1068785))

(assert (= (and b!1068778 ((_ is ValueCellFull!12119) mapDefault!40165)) b!1068777))

(assert (= start!94524 b!1068778))

(declare-fun m!986857 () Bool)

(assert (=> b!1068779 m!986857))

(declare-fun m!986859 () Bool)

(assert (=> b!1068779 m!986859))

(declare-fun m!986861 () Bool)

(assert (=> b!1068779 m!986861))

(declare-fun m!986863 () Bool)

(assert (=> b!1068782 m!986863))

(declare-fun m!986865 () Bool)

(assert (=> mapNonEmpty!40165 m!986865))

(declare-fun m!986867 () Bool)

(assert (=> b!1068783 m!986867))

(declare-fun m!986869 () Bool)

(assert (=> b!1068783 m!986869))

(declare-fun m!986871 () Bool)

(assert (=> b!1068784 m!986871))

(declare-fun m!986873 () Bool)

(assert (=> b!1068784 m!986873))

(declare-fun m!986875 () Bool)

(assert (=> b!1068780 m!986875))

(declare-fun m!986877 () Bool)

(assert (=> start!94524 m!986877))

(declare-fun m!986879 () Bool)

(assert (=> start!94524 m!986879))

(declare-fun m!986881 () Bool)

(assert (=> start!94524 m!986881))

(check-sat (not mapNonEmpty!40165) (not b!1068784) (not b!1068780) (not b!1068782) b_and!34611 (not start!94524) (not b_next!21835) (not b!1068779) (not b!1068783) tp_is_empty!25645)
(check-sat b_and!34611 (not b_next!21835))
