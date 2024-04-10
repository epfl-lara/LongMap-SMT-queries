; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94086 () Bool)

(assert start!94086)

(declare-fun b_free!21501 () Bool)

(declare-fun b_next!21501 () Bool)

(assert (=> start!94086 (= b_free!21501 (not b_next!21501))))

(declare-fun tp!75935 () Bool)

(declare-fun b_and!34243 () Bool)

(assert (=> start!94086 (= tp!75935 b_and!34243)))

(declare-fun mapNonEmpty!39646 () Bool)

(declare-fun mapRes!39646 () Bool)

(declare-fun tp!75934 () Bool)

(declare-fun e!606381 () Bool)

(assert (=> mapNonEmpty!39646 (= mapRes!39646 (and tp!75934 e!606381))))

(declare-fun mapKey!39646 () (_ BitVec 32))

(declare-datatypes ((V!38883 0))(
  ( (V!38884 (val!12706 Int)) )
))
(declare-datatypes ((ValueCell!11952 0))(
  ( (ValueCellFull!11952 (v!15318 V!38883)) (EmptyCell!11952) )
))
(declare-fun mapValue!39646 () ValueCell!11952)

(declare-datatypes ((array!67619 0))(
  ( (array!67620 (arr!32514 (Array (_ BitVec 32) ValueCell!11952)) (size!33050 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67619)

(declare-fun mapRest!39646 () (Array (_ BitVec 32) ValueCell!11952))

(assert (=> mapNonEmpty!39646 (= (arr!32514 _values!955) (store mapRest!39646 mapKey!39646 mapValue!39646))))

(declare-fun res!710386 () Bool)

(declare-fun e!606379 () Bool)

(assert (=> start!94086 (=> (not res!710386) (not e!606379))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94086 (= res!710386 (validMask!0 mask!1515))))

(assert (=> start!94086 e!606379))

(assert (=> start!94086 true))

(declare-fun tp_is_empty!25311 () Bool)

(assert (=> start!94086 tp_is_empty!25311))

(declare-fun e!606380 () Bool)

(declare-fun array_inv!25182 (array!67619) Bool)

(assert (=> start!94086 (and (array_inv!25182 _values!955) e!606380)))

(assert (=> start!94086 tp!75935))

(declare-datatypes ((array!67621 0))(
  ( (array!67622 (arr!32515 (Array (_ BitVec 32) (_ BitVec 64))) (size!33051 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67621)

(declare-fun array_inv!25183 (array!67621) Bool)

(assert (=> start!94086 (array_inv!25183 _keys!1163)))

(declare-fun b!1064054 () Bool)

(declare-fun e!606378 () Bool)

(assert (=> b!1064054 (= e!606380 (and e!606378 mapRes!39646))))

(declare-fun condMapEmpty!39646 () Bool)

(declare-fun mapDefault!39646 () ValueCell!11952)

(assert (=> b!1064054 (= condMapEmpty!39646 (= (arr!32514 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11952)) mapDefault!39646)))))

(declare-fun mapIsEmpty!39646 () Bool)

(assert (=> mapIsEmpty!39646 mapRes!39646))

(declare-fun b!1064055 () Bool)

(declare-fun res!710383 () Bool)

(assert (=> b!1064055 (=> (not res!710383) (not e!606379))))

(declare-datatypes ((List!22665 0))(
  ( (Nil!22662) (Cons!22661 (h!23870 (_ BitVec 64)) (t!31980 List!22665)) )
))
(declare-fun arrayNoDuplicates!0 (array!67621 (_ BitVec 32) List!22665) Bool)

(assert (=> b!1064055 (= res!710383 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22662))))

(declare-fun b!1064056 () Bool)

(declare-fun res!710384 () Bool)

(assert (=> b!1064056 (=> (not res!710384) (not e!606379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67621 (_ BitVec 32)) Bool)

(assert (=> b!1064056 (= res!710384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064057 () Bool)

(assert (=> b!1064057 (= e!606381 tp_is_empty!25311)))

(declare-fun b!1064058 () Bool)

(assert (=> b!1064058 (= e!606379 (not true))))

(declare-datatypes ((tuple2!16090 0))(
  ( (tuple2!16091 (_1!8056 (_ BitVec 64)) (_2!8056 V!38883)) )
))
(declare-datatypes ((List!22666 0))(
  ( (Nil!22663) (Cons!22662 (h!23871 tuple2!16090) (t!31981 List!22666)) )
))
(declare-datatypes ((ListLongMap!14059 0))(
  ( (ListLongMap!14060 (toList!7045 List!22666)) )
))
(declare-fun lt!469027 () ListLongMap!14059)

(declare-fun lt!469026 () ListLongMap!14059)

(assert (=> b!1064058 (= lt!469027 lt!469026)))

(declare-fun zeroValueBefore!47 () V!38883)

(declare-datatypes ((Unit!34890 0))(
  ( (Unit!34891) )
))
(declare-fun lt!469025 () Unit!34890)

(declare-fun minValue!907 () V!38883)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38883)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!674 (array!67621 array!67619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38883 V!38883 V!38883 V!38883 (_ BitVec 32) Int) Unit!34890)

(assert (=> b!1064058 (= lt!469025 (lemmaNoChangeToArrayThenSameMapNoExtras!674 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3637 (array!67621 array!67619 (_ BitVec 32) (_ BitVec 32) V!38883 V!38883 (_ BitVec 32) Int) ListLongMap!14059)

(assert (=> b!1064058 (= lt!469026 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064058 (= lt!469027 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064059 () Bool)

(assert (=> b!1064059 (= e!606378 tp_is_empty!25311)))

(declare-fun b!1064060 () Bool)

(declare-fun res!710385 () Bool)

(assert (=> b!1064060 (=> (not res!710385) (not e!606379))))

(assert (=> b!1064060 (= res!710385 (and (= (size!33050 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33051 _keys!1163) (size!33050 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94086 res!710386) b!1064060))

(assert (= (and b!1064060 res!710385) b!1064056))

(assert (= (and b!1064056 res!710384) b!1064055))

(assert (= (and b!1064055 res!710383) b!1064058))

(assert (= (and b!1064054 condMapEmpty!39646) mapIsEmpty!39646))

(assert (= (and b!1064054 (not condMapEmpty!39646)) mapNonEmpty!39646))

(get-info :version)

(assert (= (and mapNonEmpty!39646 ((_ is ValueCellFull!11952) mapValue!39646)) b!1064057))

(assert (= (and b!1064054 ((_ is ValueCellFull!11952) mapDefault!39646)) b!1064059))

(assert (= start!94086 b!1064054))

(declare-fun m!982665 () Bool)

(assert (=> b!1064058 m!982665))

(declare-fun m!982667 () Bool)

(assert (=> b!1064058 m!982667))

(declare-fun m!982669 () Bool)

(assert (=> b!1064058 m!982669))

(declare-fun m!982671 () Bool)

(assert (=> mapNonEmpty!39646 m!982671))

(declare-fun m!982673 () Bool)

(assert (=> b!1064055 m!982673))

(declare-fun m!982675 () Bool)

(assert (=> start!94086 m!982675))

(declare-fun m!982677 () Bool)

(assert (=> start!94086 m!982677))

(declare-fun m!982679 () Bool)

(assert (=> start!94086 m!982679))

(declare-fun m!982681 () Bool)

(assert (=> b!1064056 m!982681))

(check-sat (not b!1064058) (not b!1064056) (not start!94086) (not b_next!21501) b_and!34243 (not mapNonEmpty!39646) tp_is_empty!25311 (not b!1064055))
(check-sat b_and!34243 (not b_next!21501))
