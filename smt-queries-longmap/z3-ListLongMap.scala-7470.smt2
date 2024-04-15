; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94738 () Bool)

(assert start!94738)

(declare-fun b_free!21997 () Bool)

(declare-fun b_next!21997 () Bool)

(assert (=> start!94738 (= b_free!21997 (not b_next!21997))))

(declare-fun tp!77450 () Bool)

(declare-fun b_and!34801 () Bool)

(assert (=> start!94738 (= tp!77450 b_and!34801)))

(declare-fun b!1071111 () Bool)

(declare-fun res!714559 () Bool)

(declare-fun e!611567 () Bool)

(assert (=> b!1071111 (=> (not res!714559) (not e!611567))))

(declare-datatypes ((array!68526 0))(
  ( (array!68527 (arr!32959 (Array (_ BitVec 32) (_ BitVec 64))) (size!33497 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68526)

(declare-datatypes ((List!23061 0))(
  ( (Nil!23058) (Cons!23057 (h!24266 (_ BitVec 64)) (t!32385 List!23061)) )
))
(declare-fun arrayNoDuplicates!0 (array!68526 (_ BitVec 32) List!23061) Bool)

(assert (=> b!1071111 (= res!714559 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23058))))

(declare-fun b!1071112 () Bool)

(declare-fun e!611569 () Bool)

(declare-fun tp_is_empty!25807 () Bool)

(assert (=> b!1071112 (= e!611569 tp_is_empty!25807)))

(declare-fun b!1071113 () Bool)

(declare-fun e!611565 () Bool)

(declare-fun mapRes!40417 () Bool)

(assert (=> b!1071113 (= e!611565 (and e!611569 mapRes!40417))))

(declare-fun condMapEmpty!40417 () Bool)

(declare-datatypes ((V!39545 0))(
  ( (V!39546 (val!12954 Int)) )
))
(declare-datatypes ((ValueCell!12200 0))(
  ( (ValueCellFull!12200 (v!15569 V!39545)) (EmptyCell!12200) )
))
(declare-datatypes ((array!68528 0))(
  ( (array!68529 (arr!32960 (Array (_ BitVec 32) ValueCell!12200)) (size!33498 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68528)

(declare-fun mapDefault!40417 () ValueCell!12200)

(assert (=> b!1071113 (= condMapEmpty!40417 (= (arr!32960 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12200)) mapDefault!40417)))))

(declare-datatypes ((tuple2!16534 0))(
  ( (tuple2!16535 (_1!8278 (_ BitVec 64)) (_2!8278 V!39545)) )
))
(declare-datatypes ((List!23062 0))(
  ( (Nil!23059) (Cons!23058 (h!24267 tuple2!16534) (t!32386 List!23062)) )
))
(declare-datatypes ((ListLongMap!14503 0))(
  ( (ListLongMap!14504 (toList!7267 List!23062)) )
))
(declare-fun lt!473636 () ListLongMap!14503)

(declare-fun e!611568 () Bool)

(declare-fun lt!473634 () tuple2!16534)

(declare-fun lt!473635 () ListLongMap!14503)

(declare-fun b!1071114 () Bool)

(declare-fun +!3203 (ListLongMap!14503 tuple2!16534) ListLongMap!14503)

(assert (=> b!1071114 (= e!611568 (= lt!473635 (+!3203 lt!473636 lt!473634)))))

(declare-fun b!1071115 () Bool)

(declare-fun res!714555 () Bool)

(assert (=> b!1071115 (=> (not res!714555) (not e!611567))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68526 (_ BitVec 32)) Bool)

(assert (=> b!1071115 (= res!714555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071116 () Bool)

(declare-fun e!611564 () Bool)

(assert (=> b!1071116 (= e!611567 (not e!611564))))

(declare-fun res!714556 () Bool)

(assert (=> b!1071116 (=> res!714556 e!611564)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071116 (= res!714556 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473637 () ListLongMap!14503)

(assert (=> b!1071116 (= lt!473637 lt!473636)))

(declare-fun zeroValueBefore!47 () V!39545)

(declare-fun minValue!907 () V!39545)

(declare-datatypes ((Unit!35113 0))(
  ( (Unit!35114) )
))
(declare-fun lt!473625 () Unit!35113)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39545)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!845 (array!68526 array!68528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 V!39545 V!39545 (_ BitVec 32) Int) Unit!35113)

(assert (=> b!1071116 (= lt!473625 (lemmaNoChangeToArrayThenSameMapNoExtras!845 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3851 (array!68526 array!68528 (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 (_ BitVec 32) Int) ListLongMap!14503)

(assert (=> b!1071116 (= lt!473636 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071116 (= lt!473637 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40417 () Bool)

(declare-fun tp!77449 () Bool)

(declare-fun e!611570 () Bool)

(assert (=> mapNonEmpty!40417 (= mapRes!40417 (and tp!77449 e!611570))))

(declare-fun mapRest!40417 () (Array (_ BitVec 32) ValueCell!12200))

(declare-fun mapKey!40417 () (_ BitVec 32))

(declare-fun mapValue!40417 () ValueCell!12200)

(assert (=> mapNonEmpty!40417 (= (arr!32960 _values!955) (store mapRest!40417 mapKey!40417 mapValue!40417))))

(declare-fun mapIsEmpty!40417 () Bool)

(assert (=> mapIsEmpty!40417 mapRes!40417))

(declare-fun b!1071118 () Bool)

(assert (=> b!1071118 (= e!611564 true)))

(declare-fun lt!473631 () ListLongMap!14503)

(declare-fun lt!473628 () ListLongMap!14503)

(declare-fun -!663 (ListLongMap!14503 (_ BitVec 64)) ListLongMap!14503)

(assert (=> b!1071118 (= lt!473631 (-!663 lt!473628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473629 () ListLongMap!14503)

(declare-fun lt!473633 () ListLongMap!14503)

(assert (=> b!1071118 (= lt!473629 lt!473633)))

(declare-fun lt!473630 () Unit!35113)

(declare-fun addCommutativeForDiffKeys!721 (ListLongMap!14503 (_ BitVec 64) V!39545 (_ BitVec 64) V!39545) Unit!35113)

(assert (=> b!1071118 (= lt!473630 (addCommutativeForDiffKeys!721 lt!473637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473627 () ListLongMap!14503)

(assert (=> b!1071118 (= (-!663 lt!473633 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473627)))

(declare-fun lt!473632 () tuple2!16534)

(assert (=> b!1071118 (= lt!473633 (+!3203 lt!473627 lt!473632))))

(declare-fun lt!473626 () Unit!35113)

(declare-fun addThenRemoveForNewKeyIsSame!44 (ListLongMap!14503 (_ BitVec 64) V!39545) Unit!35113)

(assert (=> b!1071118 (= lt!473626 (addThenRemoveForNewKeyIsSame!44 lt!473627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071118 (= lt!473627 (+!3203 lt!473637 lt!473634))))

(assert (=> b!1071118 e!611568))

(declare-fun res!714558 () Bool)

(assert (=> b!1071118 (=> (not res!714558) (not e!611568))))

(assert (=> b!1071118 (= res!714558 (= lt!473628 lt!473629))))

(assert (=> b!1071118 (= lt!473629 (+!3203 (+!3203 lt!473637 lt!473632) lt!473634))))

(assert (=> b!1071118 (= lt!473634 (tuple2!16535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071118 (= lt!473632 (tuple2!16535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4076 (array!68526 array!68528 (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 (_ BitVec 32) Int) ListLongMap!14503)

(assert (=> b!1071118 (= lt!473635 (getCurrentListMap!4076 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071118 (= lt!473628 (getCurrentListMap!4076 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071119 () Bool)

(declare-fun res!714557 () Bool)

(assert (=> b!1071119 (=> (not res!714557) (not e!611567))))

(assert (=> b!1071119 (= res!714557 (and (= (size!33498 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33497 _keys!1163) (size!33498 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714554 () Bool)

(assert (=> start!94738 (=> (not res!714554) (not e!611567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94738 (= res!714554 (validMask!0 mask!1515))))

(assert (=> start!94738 e!611567))

(assert (=> start!94738 true))

(assert (=> start!94738 tp_is_empty!25807))

(declare-fun array_inv!25496 (array!68528) Bool)

(assert (=> start!94738 (and (array_inv!25496 _values!955) e!611565)))

(assert (=> start!94738 tp!77450))

(declare-fun array_inv!25497 (array!68526) Bool)

(assert (=> start!94738 (array_inv!25497 _keys!1163)))

(declare-fun b!1071117 () Bool)

(assert (=> b!1071117 (= e!611570 tp_is_empty!25807)))

(assert (= (and start!94738 res!714554) b!1071119))

(assert (= (and b!1071119 res!714557) b!1071115))

(assert (= (and b!1071115 res!714555) b!1071111))

(assert (= (and b!1071111 res!714559) b!1071116))

(assert (= (and b!1071116 (not res!714556)) b!1071118))

(assert (= (and b!1071118 res!714558) b!1071114))

(assert (= (and b!1071113 condMapEmpty!40417) mapIsEmpty!40417))

(assert (= (and b!1071113 (not condMapEmpty!40417)) mapNonEmpty!40417))

(get-info :version)

(assert (= (and mapNonEmpty!40417 ((_ is ValueCellFull!12200) mapValue!40417)) b!1071117))

(assert (= (and b!1071113 ((_ is ValueCellFull!12200) mapDefault!40417)) b!1071112))

(assert (= start!94738 b!1071113))

(declare-fun m!989063 () Bool)

(assert (=> b!1071114 m!989063))

(declare-fun m!989065 () Bool)

(assert (=> mapNonEmpty!40417 m!989065))

(declare-fun m!989067 () Bool)

(assert (=> b!1071115 m!989067))

(declare-fun m!989069 () Bool)

(assert (=> b!1071111 m!989069))

(declare-fun m!989071 () Bool)

(assert (=> b!1071116 m!989071))

(declare-fun m!989073 () Bool)

(assert (=> b!1071116 m!989073))

(declare-fun m!989075 () Bool)

(assert (=> b!1071116 m!989075))

(declare-fun m!989077 () Bool)

(assert (=> b!1071118 m!989077))

(declare-fun m!989079 () Bool)

(assert (=> b!1071118 m!989079))

(declare-fun m!989081 () Bool)

(assert (=> b!1071118 m!989081))

(declare-fun m!989083 () Bool)

(assert (=> b!1071118 m!989083))

(declare-fun m!989085 () Bool)

(assert (=> b!1071118 m!989085))

(declare-fun m!989087 () Bool)

(assert (=> b!1071118 m!989087))

(declare-fun m!989089 () Bool)

(assert (=> b!1071118 m!989089))

(declare-fun m!989091 () Bool)

(assert (=> b!1071118 m!989091))

(declare-fun m!989093 () Bool)

(assert (=> b!1071118 m!989093))

(declare-fun m!989095 () Bool)

(assert (=> b!1071118 m!989095))

(assert (=> b!1071118 m!989077))

(declare-fun m!989097 () Bool)

(assert (=> start!94738 m!989097))

(declare-fun m!989099 () Bool)

(assert (=> start!94738 m!989099))

(declare-fun m!989101 () Bool)

(assert (=> start!94738 m!989101))

(check-sat (not b!1071116) (not b!1071111) (not b!1071118) (not start!94738) tp_is_empty!25807 (not b!1071114) (not b_next!21997) b_and!34801 (not mapNonEmpty!40417) (not b!1071115))
(check-sat b_and!34801 (not b_next!21997))
