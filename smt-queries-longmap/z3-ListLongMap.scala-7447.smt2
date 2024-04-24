; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94812 () Bool)

(assert start!94812)

(declare-fun b_free!21859 () Bool)

(declare-fun b_next!21859 () Bool)

(assert (=> start!94812 (= b_free!21859 (not b_next!21859))))

(declare-fun tp!77030 () Bool)

(declare-fun b_and!34681 () Bool)

(assert (=> start!94812 (= tp!77030 b_and!34681)))

(declare-fun b!1070734 () Bool)

(declare-fun res!714056 () Bool)

(declare-fun e!611157 () Bool)

(assert (=> b!1070734 (=> (not res!714056) (not e!611157))))

(declare-datatypes ((array!68355 0))(
  ( (array!68356 (arr!32869 (Array (_ BitVec 32) (_ BitVec 64))) (size!33406 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68355)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68355 (_ BitVec 32)) Bool)

(assert (=> b!1070734 (= res!714056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!714053 () Bool)

(assert (=> start!94812 (=> (not res!714053) (not e!611157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94812 (= res!714053 (validMask!0 mask!1515))))

(assert (=> start!94812 e!611157))

(assert (=> start!94812 true))

(declare-fun tp_is_empty!25669 () Bool)

(assert (=> start!94812 tp_is_empty!25669))

(declare-datatypes ((V!39361 0))(
  ( (V!39362 (val!12885 Int)) )
))
(declare-datatypes ((ValueCell!12131 0))(
  ( (ValueCellFull!12131 (v!15497 V!39361)) (EmptyCell!12131) )
))
(declare-datatypes ((array!68357 0))(
  ( (array!68358 (arr!32870 (Array (_ BitVec 32) ValueCell!12131)) (size!33407 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68357)

(declare-fun e!611154 () Bool)

(declare-fun array_inv!25460 (array!68357) Bool)

(assert (=> start!94812 (and (array_inv!25460 _values!955) e!611154)))

(assert (=> start!94812 tp!77030))

(declare-fun array_inv!25461 (array!68355) Bool)

(assert (=> start!94812 (array_inv!25461 _keys!1163)))

(declare-fun b!1070735 () Bool)

(declare-fun res!714055 () Bool)

(assert (=> b!1070735 (=> (not res!714055) (not e!611157))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070735 (= res!714055 (and (= (size!33407 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33406 _keys!1163) (size!33407 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070736 () Bool)

(declare-fun e!611155 () Bool)

(declare-fun mapRes!40204 () Bool)

(assert (=> b!1070736 (= e!611154 (and e!611155 mapRes!40204))))

(declare-fun condMapEmpty!40204 () Bool)

(declare-fun mapDefault!40204 () ValueCell!12131)

(assert (=> b!1070736 (= condMapEmpty!40204 (= (arr!32870 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12131)) mapDefault!40204)))))

(declare-fun b!1070737 () Bool)

(assert (=> b!1070737 (= e!611157 (not true))))

(declare-datatypes ((tuple2!16350 0))(
  ( (tuple2!16351 (_1!8186 (_ BitVec 64)) (_2!8186 V!39361)) )
))
(declare-datatypes ((List!22916 0))(
  ( (Nil!22913) (Cons!22912 (h!24130 tuple2!16350) (t!32237 List!22916)) )
))
(declare-datatypes ((ListLongMap!14327 0))(
  ( (ListLongMap!14328 (toList!7179 List!22916)) )
))
(declare-fun lt!473112 () ListLongMap!14327)

(declare-fun lt!473113 () ListLongMap!14327)

(assert (=> b!1070737 (= lt!473112 lt!473113)))

(declare-fun zeroValueBefore!47 () V!39361)

(declare-fun minValue!907 () V!39361)

(declare-datatypes ((Unit!35152 0))(
  ( (Unit!35153) )
))
(declare-fun lt!473114 () Unit!35152)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!794 (array!68355 array!68357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 V!39361 V!39361 (_ BitVec 32) Int) Unit!35152)

(assert (=> b!1070737 (= lt!473114 (lemmaNoChangeToArrayThenSameMapNoExtras!794 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3791 (array!68355 array!68357 (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 (_ BitVec 32) Int) ListLongMap!14327)

(assert (=> b!1070737 (= lt!473113 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070737 (= lt!473112 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40204 () Bool)

(declare-fun tp!77029 () Bool)

(declare-fun e!611156 () Bool)

(assert (=> mapNonEmpty!40204 (= mapRes!40204 (and tp!77029 e!611156))))

(declare-fun mapRest!40204 () (Array (_ BitVec 32) ValueCell!12131))

(declare-fun mapValue!40204 () ValueCell!12131)

(declare-fun mapKey!40204 () (_ BitVec 32))

(assert (=> mapNonEmpty!40204 (= (arr!32870 _values!955) (store mapRest!40204 mapKey!40204 mapValue!40204))))

(declare-fun mapIsEmpty!40204 () Bool)

(assert (=> mapIsEmpty!40204 mapRes!40204))

(declare-fun b!1070738 () Bool)

(assert (=> b!1070738 (= e!611155 tp_is_empty!25669)))

(declare-fun b!1070739 () Bool)

(declare-fun res!714054 () Bool)

(assert (=> b!1070739 (=> (not res!714054) (not e!611157))))

(declare-datatypes ((List!22917 0))(
  ( (Nil!22914) (Cons!22913 (h!24131 (_ BitVec 64)) (t!32238 List!22917)) )
))
(declare-fun arrayNoDuplicates!0 (array!68355 (_ BitVec 32) List!22917) Bool)

(assert (=> b!1070739 (= res!714054 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22914))))

(declare-fun b!1070740 () Bool)

(assert (=> b!1070740 (= e!611156 tp_is_empty!25669)))

(assert (= (and start!94812 res!714053) b!1070735))

(assert (= (and b!1070735 res!714055) b!1070734))

(assert (= (and b!1070734 res!714056) b!1070739))

(assert (= (and b!1070739 res!714054) b!1070737))

(assert (= (and b!1070736 condMapEmpty!40204) mapIsEmpty!40204))

(assert (= (and b!1070736 (not condMapEmpty!40204)) mapNonEmpty!40204))

(get-info :version)

(assert (= (and mapNonEmpty!40204 ((_ is ValueCellFull!12131) mapValue!40204)) b!1070740))

(assert (= (and b!1070736 ((_ is ValueCellFull!12131) mapDefault!40204)) b!1070738))

(assert (= start!94812 b!1070736))

(declare-fun m!989593 () Bool)

(assert (=> b!1070739 m!989593))

(declare-fun m!989595 () Bool)

(assert (=> b!1070737 m!989595))

(declare-fun m!989597 () Bool)

(assert (=> b!1070737 m!989597))

(declare-fun m!989599 () Bool)

(assert (=> b!1070737 m!989599))

(declare-fun m!989601 () Bool)

(assert (=> mapNonEmpty!40204 m!989601))

(declare-fun m!989603 () Bool)

(assert (=> start!94812 m!989603))

(declare-fun m!989605 () Bool)

(assert (=> start!94812 m!989605))

(declare-fun m!989607 () Bool)

(assert (=> start!94812 m!989607))

(declare-fun m!989609 () Bool)

(assert (=> b!1070734 m!989609))

(check-sat (not b!1070737) b_and!34681 (not start!94812) (not b_next!21859) (not b!1070734) tp_is_empty!25669 (not b!1070739) (not mapNonEmpty!40204))
(check-sat b_and!34681 (not b_next!21859))
