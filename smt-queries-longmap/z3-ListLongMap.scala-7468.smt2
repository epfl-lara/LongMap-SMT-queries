; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94726 () Bool)

(assert start!94726)

(declare-fun b_free!21985 () Bool)

(declare-fun b_next!21985 () Bool)

(assert (=> start!94726 (= b_free!21985 (not b_next!21985))))

(declare-fun tp!77414 () Bool)

(declare-fun b_and!34789 () Bool)

(assert (=> start!94726 (= tp!77414 b_and!34789)))

(declare-fun mapNonEmpty!40399 () Bool)

(declare-fun mapRes!40399 () Bool)

(declare-fun tp!77413 () Bool)

(declare-fun e!611440 () Bool)

(assert (=> mapNonEmpty!40399 (= mapRes!40399 (and tp!77413 e!611440))))

(declare-fun mapKey!40399 () (_ BitVec 32))

(declare-datatypes ((V!39529 0))(
  ( (V!39530 (val!12948 Int)) )
))
(declare-datatypes ((ValueCell!12194 0))(
  ( (ValueCellFull!12194 (v!15563 V!39529)) (EmptyCell!12194) )
))
(declare-datatypes ((array!68502 0))(
  ( (array!68503 (arr!32947 (Array (_ BitVec 32) ValueCell!12194)) (size!33485 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68502)

(declare-fun mapValue!40399 () ValueCell!12194)

(declare-fun mapRest!40399 () (Array (_ BitVec 32) ValueCell!12194))

(assert (=> mapNonEmpty!40399 (= (arr!32947 _values!955) (store mapRest!40399 mapKey!40399 mapValue!40399))))

(declare-fun mapIsEmpty!40399 () Bool)

(assert (=> mapIsEmpty!40399 mapRes!40399))

(declare-fun b!1070950 () Bool)

(declare-fun e!611444 () Bool)

(assert (=> b!1070950 (= e!611444 true)))

(declare-datatypes ((tuple2!16522 0))(
  ( (tuple2!16523 (_1!8272 (_ BitVec 64)) (_2!8272 V!39529)) )
))
(declare-datatypes ((List!23051 0))(
  ( (Nil!23048) (Cons!23047 (h!24256 tuple2!16522) (t!32375 List!23051)) )
))
(declare-datatypes ((ListLongMap!14491 0))(
  ( (ListLongMap!14492 (toList!7261 List!23051)) )
))
(declare-fun lt!473398 () ListLongMap!14491)

(declare-fun lt!473395 () ListLongMap!14491)

(declare-fun -!658 (ListLongMap!14491 (_ BitVec 64)) ListLongMap!14491)

(assert (=> b!1070950 (= lt!473398 (-!658 lt!473395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473401 () ListLongMap!14491)

(declare-fun lt!473397 () ListLongMap!14491)

(assert (=> b!1070950 (= lt!473401 lt!473397)))

(declare-fun zeroValueBefore!47 () V!39529)

(declare-datatypes ((Unit!35103 0))(
  ( (Unit!35104) )
))
(declare-fun lt!473399 () Unit!35103)

(declare-fun minValue!907 () V!39529)

(declare-fun lt!473392 () ListLongMap!14491)

(declare-fun addCommutativeForDiffKeys!716 (ListLongMap!14491 (_ BitVec 64) V!39529 (_ BitVec 64) V!39529) Unit!35103)

(assert (=> b!1070950 (= lt!473399 (addCommutativeForDiffKeys!716 lt!473392 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473393 () ListLongMap!14491)

(assert (=> b!1070950 (= (-!658 lt!473397 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473393)))

(declare-fun lt!473396 () tuple2!16522)

(declare-fun +!3197 (ListLongMap!14491 tuple2!16522) ListLongMap!14491)

(assert (=> b!1070950 (= lt!473397 (+!3197 lt!473393 lt!473396))))

(declare-fun lt!473403 () Unit!35103)

(declare-fun addThenRemoveForNewKeyIsSame!39 (ListLongMap!14491 (_ BitVec 64) V!39529) Unit!35103)

(assert (=> b!1070950 (= lt!473403 (addThenRemoveForNewKeyIsSame!39 lt!473393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473391 () tuple2!16522)

(assert (=> b!1070950 (= lt!473393 (+!3197 lt!473392 lt!473391))))

(declare-fun e!611441 () Bool)

(assert (=> b!1070950 e!611441))

(declare-fun res!714450 () Bool)

(assert (=> b!1070950 (=> (not res!714450) (not e!611441))))

(assert (=> b!1070950 (= res!714450 (= lt!473395 lt!473401))))

(assert (=> b!1070950 (= lt!473401 (+!3197 (+!3197 lt!473392 lt!473396) lt!473391))))

(assert (=> b!1070950 (= lt!473391 (tuple2!16523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070950 (= lt!473396 (tuple2!16523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!473400 () ListLongMap!14491)

(declare-datatypes ((array!68504 0))(
  ( (array!68505 (arr!32948 (Array (_ BitVec 32) (_ BitVec 64))) (size!33486 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68504)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39529)

(declare-fun getCurrentListMap!4071 (array!68504 array!68502 (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 (_ BitVec 32) Int) ListLongMap!14491)

(assert (=> b!1070950 (= lt!473400 (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070950 (= lt!473395 (getCurrentListMap!4071 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070951 () Bool)

(declare-fun e!611438 () Bool)

(assert (=> b!1070951 (= e!611438 (not e!611444))))

(declare-fun res!714448 () Bool)

(assert (=> b!1070951 (=> res!714448 e!611444)))

(assert (=> b!1070951 (= res!714448 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473394 () ListLongMap!14491)

(assert (=> b!1070951 (= lt!473392 lt!473394)))

(declare-fun lt!473402 () Unit!35103)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!840 (array!68504 array!68502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 V!39529 V!39529 (_ BitVec 32) Int) Unit!35103)

(assert (=> b!1070951 (= lt!473402 (lemmaNoChangeToArrayThenSameMapNoExtras!840 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3846 (array!68504 array!68502 (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 (_ BitVec 32) Int) ListLongMap!14491)

(assert (=> b!1070951 (= lt!473394 (getCurrentListMapNoExtraKeys!3846 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070951 (= lt!473392 (getCurrentListMapNoExtraKeys!3846 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070952 () Bool)

(declare-fun e!611443 () Bool)

(declare-fun tp_is_empty!25795 () Bool)

(assert (=> b!1070952 (= e!611443 tp_is_empty!25795)))

(declare-fun b!1070953 () Bool)

(assert (=> b!1070953 (= e!611440 tp_is_empty!25795)))

(declare-fun b!1070954 () Bool)

(declare-fun res!714449 () Bool)

(assert (=> b!1070954 (=> (not res!714449) (not e!611438))))

(declare-datatypes ((List!23052 0))(
  ( (Nil!23049) (Cons!23048 (h!24257 (_ BitVec 64)) (t!32376 List!23052)) )
))
(declare-fun arrayNoDuplicates!0 (array!68504 (_ BitVec 32) List!23052) Bool)

(assert (=> b!1070954 (= res!714449 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23049))))

(declare-fun b!1070955 () Bool)

(declare-fun e!611442 () Bool)

(assert (=> b!1070955 (= e!611442 (and e!611443 mapRes!40399))))

(declare-fun condMapEmpty!40399 () Bool)

(declare-fun mapDefault!40399 () ValueCell!12194)

(assert (=> b!1070955 (= condMapEmpty!40399 (= (arr!32947 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12194)) mapDefault!40399)))))

(declare-fun b!1070949 () Bool)

(declare-fun res!714451 () Bool)

(assert (=> b!1070949 (=> (not res!714451) (not e!611438))))

(assert (=> b!1070949 (= res!714451 (and (= (size!33485 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33486 _keys!1163) (size!33485 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714446 () Bool)

(assert (=> start!94726 (=> (not res!714446) (not e!611438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94726 (= res!714446 (validMask!0 mask!1515))))

(assert (=> start!94726 e!611438))

(assert (=> start!94726 true))

(assert (=> start!94726 tp_is_empty!25795))

(declare-fun array_inv!25490 (array!68502) Bool)

(assert (=> start!94726 (and (array_inv!25490 _values!955) e!611442)))

(assert (=> start!94726 tp!77414))

(declare-fun array_inv!25491 (array!68504) Bool)

(assert (=> start!94726 (array_inv!25491 _keys!1163)))

(declare-fun b!1070956 () Bool)

(declare-fun res!714447 () Bool)

(assert (=> b!1070956 (=> (not res!714447) (not e!611438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68504 (_ BitVec 32)) Bool)

(assert (=> b!1070956 (= res!714447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070957 () Bool)

(assert (=> b!1070957 (= e!611441 (= lt!473400 (+!3197 lt!473394 lt!473391)))))

(assert (= (and start!94726 res!714446) b!1070949))

(assert (= (and b!1070949 res!714451) b!1070956))

(assert (= (and b!1070956 res!714447) b!1070954))

(assert (= (and b!1070954 res!714449) b!1070951))

(assert (= (and b!1070951 (not res!714448)) b!1070950))

(assert (= (and b!1070950 res!714450) b!1070957))

(assert (= (and b!1070955 condMapEmpty!40399) mapIsEmpty!40399))

(assert (= (and b!1070955 (not condMapEmpty!40399)) mapNonEmpty!40399))

(get-info :version)

(assert (= (and mapNonEmpty!40399 ((_ is ValueCellFull!12194) mapValue!40399)) b!1070953))

(assert (= (and b!1070955 ((_ is ValueCellFull!12194) mapDefault!40399)) b!1070952))

(assert (= start!94726 b!1070955))

(declare-fun m!988823 () Bool)

(assert (=> b!1070956 m!988823))

(declare-fun m!988825 () Bool)

(assert (=> b!1070954 m!988825))

(declare-fun m!988827 () Bool)

(assert (=> start!94726 m!988827))

(declare-fun m!988829 () Bool)

(assert (=> start!94726 m!988829))

(declare-fun m!988831 () Bool)

(assert (=> start!94726 m!988831))

(declare-fun m!988833 () Bool)

(assert (=> b!1070950 m!988833))

(declare-fun m!988835 () Bool)

(assert (=> b!1070950 m!988835))

(declare-fun m!988837 () Bool)

(assert (=> b!1070950 m!988837))

(declare-fun m!988839 () Bool)

(assert (=> b!1070950 m!988839))

(declare-fun m!988841 () Bool)

(assert (=> b!1070950 m!988841))

(declare-fun m!988843 () Bool)

(assert (=> b!1070950 m!988843))

(declare-fun m!988845 () Bool)

(assert (=> b!1070950 m!988845))

(declare-fun m!988847 () Bool)

(assert (=> b!1070950 m!988847))

(declare-fun m!988849 () Bool)

(assert (=> b!1070950 m!988849))

(assert (=> b!1070950 m!988839))

(declare-fun m!988851 () Bool)

(assert (=> b!1070950 m!988851))

(declare-fun m!988853 () Bool)

(assert (=> b!1070957 m!988853))

(declare-fun m!988855 () Bool)

(assert (=> mapNonEmpty!40399 m!988855))

(declare-fun m!988857 () Bool)

(assert (=> b!1070951 m!988857))

(declare-fun m!988859 () Bool)

(assert (=> b!1070951 m!988859))

(declare-fun m!988861 () Bool)

(assert (=> b!1070951 m!988861))

(check-sat (not start!94726) b_and!34789 (not mapNonEmpty!40399) tp_is_empty!25795 (not b_next!21985) (not b!1070957) (not b!1070956) (not b!1070950) (not b!1070954) (not b!1070951))
(check-sat b_and!34789 (not b_next!21985))
