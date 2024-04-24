; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94742 () Bool)

(assert start!94742)

(declare-fun b_free!21811 () Bool)

(declare-fun b_next!21811 () Bool)

(assert (=> start!94742 (= b_free!21811 (not b_next!21811))))

(declare-fun tp!76883 () Bool)

(declare-fun b_and!34623 () Bool)

(assert (=> start!94742 (= tp!76883 b_and!34623)))

(declare-fun b!1069933 () Bool)

(declare-fun e!610554 () Bool)

(declare-fun tp_is_empty!25621 () Bool)

(assert (=> b!1069933 (= e!610554 tp_is_empty!25621)))

(declare-fun b!1069934 () Bool)

(declare-fun e!610557 () Bool)

(assert (=> b!1069934 (= e!610557 true)))

(declare-datatypes ((V!39297 0))(
  ( (V!39298 (val!12861 Int)) )
))
(declare-datatypes ((tuple2!16316 0))(
  ( (tuple2!16317 (_1!8169 (_ BitVec 64)) (_2!8169 V!39297)) )
))
(declare-datatypes ((List!22884 0))(
  ( (Nil!22881) (Cons!22880 (h!24098 tuple2!16316) (t!32203 List!22884)) )
))
(declare-datatypes ((ListLongMap!14293 0))(
  ( (ListLongMap!14294 (toList!7162 List!22884)) )
))
(declare-fun lt!472632 () ListLongMap!14293)

(declare-fun -!646 (ListLongMap!14293 (_ BitVec 64)) ListLongMap!14293)

(assert (=> b!1069934 (= (-!646 lt!472632 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472632)))

(declare-datatypes ((Unit!35118 0))(
  ( (Unit!35119) )
))
(declare-fun lt!472635 () Unit!35118)

(declare-fun removeNotPresentStillSame!63 (ListLongMap!14293 (_ BitVec 64)) Unit!35118)

(assert (=> b!1069934 (= lt!472635 (removeNotPresentStillSame!63 lt!472632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40129 () Bool)

(declare-fun mapRes!40129 () Bool)

(assert (=> mapIsEmpty!40129 mapRes!40129))

(declare-fun b!1069935 () Bool)

(declare-fun res!713565 () Bool)

(declare-fun e!610553 () Bool)

(assert (=> b!1069935 (=> (not res!713565) (not e!610553))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12107 0))(
  ( (ValueCellFull!12107 (v!15472 V!39297)) (EmptyCell!12107) )
))
(declare-datatypes ((array!68269 0))(
  ( (array!68270 (arr!32827 (Array (_ BitVec 32) ValueCell!12107)) (size!33364 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68269)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68271 0))(
  ( (array!68272 (arr!32828 (Array (_ BitVec 32) (_ BitVec 64))) (size!33365 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68271)

(assert (=> b!1069935 (= res!713565 (and (= (size!33364 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33365 _keys!1163) (size!33364 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069936 () Bool)

(declare-fun res!713569 () Bool)

(assert (=> b!1069936 (=> (not res!713569) (not e!610553))))

(declare-datatypes ((List!22885 0))(
  ( (Nil!22882) (Cons!22881 (h!24099 (_ BitVec 64)) (t!32204 List!22885)) )
))
(declare-fun arrayNoDuplicates!0 (array!68271 (_ BitVec 32) List!22885) Bool)

(assert (=> b!1069936 (= res!713569 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22882))))

(declare-fun res!713566 () Bool)

(assert (=> start!94742 (=> (not res!713566) (not e!610553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94742 (= res!713566 (validMask!0 mask!1515))))

(assert (=> start!94742 e!610553))

(assert (=> start!94742 true))

(assert (=> start!94742 tp_is_empty!25621))

(declare-fun e!610556 () Bool)

(declare-fun array_inv!25430 (array!68269) Bool)

(assert (=> start!94742 (and (array_inv!25430 _values!955) e!610556)))

(assert (=> start!94742 tp!76883))

(declare-fun array_inv!25431 (array!68271) Bool)

(assert (=> start!94742 (array_inv!25431 _keys!1163)))

(declare-fun b!1069937 () Bool)

(assert (=> b!1069937 (= e!610556 (and e!610554 mapRes!40129))))

(declare-fun condMapEmpty!40129 () Bool)

(declare-fun mapDefault!40129 () ValueCell!12107)

(assert (=> b!1069937 (= condMapEmpty!40129 (= (arr!32827 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12107)) mapDefault!40129)))))

(declare-fun b!1069938 () Bool)

(declare-fun e!610555 () Bool)

(assert (=> b!1069938 (= e!610555 e!610557)))

(declare-fun res!713564 () Bool)

(assert (=> b!1069938 (=> res!713564 e!610557)))

(declare-fun contains!6323 (ListLongMap!14293 (_ BitVec 64)) Bool)

(assert (=> b!1069938 (= res!713564 (contains!6323 lt!472632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39297)

(declare-fun zeroValueBefore!47 () V!39297)

(declare-fun getCurrentListMap!4085 (array!68271 array!68269 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14293)

(assert (=> b!1069938 (= lt!472632 (getCurrentListMap!4085 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40129 () Bool)

(declare-fun tp!76882 () Bool)

(declare-fun e!610559 () Bool)

(assert (=> mapNonEmpty!40129 (= mapRes!40129 (and tp!76882 e!610559))))

(declare-fun mapValue!40129 () ValueCell!12107)

(declare-fun mapKey!40129 () (_ BitVec 32))

(declare-fun mapRest!40129 () (Array (_ BitVec 32) ValueCell!12107))

(assert (=> mapNonEmpty!40129 (= (arr!32827 _values!955) (store mapRest!40129 mapKey!40129 mapValue!40129))))

(declare-fun b!1069939 () Bool)

(assert (=> b!1069939 (= e!610553 (not e!610555))))

(declare-fun res!713567 () Bool)

(assert (=> b!1069939 (=> res!713567 e!610555)))

(assert (=> b!1069939 (= res!713567 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472633 () ListLongMap!14293)

(declare-fun lt!472634 () ListLongMap!14293)

(assert (=> b!1069939 (= lt!472633 lt!472634)))

(declare-fun lt!472636 () Unit!35118)

(declare-fun zeroValueAfter!47 () V!39297)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!779 (array!68271 array!68269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 V!39297 V!39297 (_ BitVec 32) Int) Unit!35118)

(assert (=> b!1069939 (= lt!472636 (lemmaNoChangeToArrayThenSameMapNoExtras!779 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3776 (array!68271 array!68269 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14293)

(assert (=> b!1069939 (= lt!472634 (getCurrentListMapNoExtraKeys!3776 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069939 (= lt!472633 (getCurrentListMapNoExtraKeys!3776 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069940 () Bool)

(assert (=> b!1069940 (= e!610559 tp_is_empty!25621)))

(declare-fun b!1069941 () Bool)

(declare-fun res!713568 () Bool)

(assert (=> b!1069941 (=> (not res!713568) (not e!610553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68271 (_ BitVec 32)) Bool)

(assert (=> b!1069941 (= res!713568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94742 res!713566) b!1069935))

(assert (= (and b!1069935 res!713565) b!1069941))

(assert (= (and b!1069941 res!713568) b!1069936))

(assert (= (and b!1069936 res!713569) b!1069939))

(assert (= (and b!1069939 (not res!713567)) b!1069938))

(assert (= (and b!1069938 (not res!713564)) b!1069934))

(assert (= (and b!1069937 condMapEmpty!40129) mapIsEmpty!40129))

(assert (= (and b!1069937 (not condMapEmpty!40129)) mapNonEmpty!40129))

(get-info :version)

(assert (= (and mapNonEmpty!40129 ((_ is ValueCellFull!12107) mapValue!40129)) b!1069940))

(assert (= (and b!1069937 ((_ is ValueCellFull!12107) mapDefault!40129)) b!1069933))

(assert (= start!94742 b!1069937))

(declare-fun m!988843 () Bool)

(assert (=> b!1069941 m!988843))

(declare-fun m!988845 () Bool)

(assert (=> mapNonEmpty!40129 m!988845))

(declare-fun m!988847 () Bool)

(assert (=> b!1069934 m!988847))

(declare-fun m!988849 () Bool)

(assert (=> b!1069934 m!988849))

(declare-fun m!988851 () Bool)

(assert (=> b!1069938 m!988851))

(declare-fun m!988853 () Bool)

(assert (=> b!1069938 m!988853))

(declare-fun m!988855 () Bool)

(assert (=> start!94742 m!988855))

(declare-fun m!988857 () Bool)

(assert (=> start!94742 m!988857))

(declare-fun m!988859 () Bool)

(assert (=> start!94742 m!988859))

(declare-fun m!988861 () Bool)

(assert (=> b!1069936 m!988861))

(declare-fun m!988863 () Bool)

(assert (=> b!1069939 m!988863))

(declare-fun m!988865 () Bool)

(assert (=> b!1069939 m!988865))

(declare-fun m!988867 () Bool)

(assert (=> b!1069939 m!988867))

(check-sat (not b!1069941) (not b!1069939) (not b!1069938) b_and!34623 (not b!1069934) tp_is_empty!25621 (not b_next!21811) (not start!94742) (not b!1069936) (not mapNonEmpty!40129))
(check-sat b_and!34623 (not b_next!21811))
